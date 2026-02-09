; ======================================================================
; code_printcore.asm
; ======================================================================
;
; Core Tile Renderer & Screen Management
;
; Address range: $9E01-$A10B (779 bytes)
; Source binary: block7_main.bin (loaded at $620C)
;
; Contains the most-called function in the entire game: PRINT_TILE
; ($9E01, 64+ references). This routine handles ALL rendering of 8x8
; pixel tiles to the screen, including text characters, background tiles,
; HUD elements, and UI graphics.
;
; Also contains:
;   SCAN_KEY ($9E30) — blocking keypress input (menu, high scores)
;   SWAP_SCREEN_BUFS ($9E3E) — full-screen tile compositor
;   COPY_DATA_BLK ($A07B) — block memory copy with offset
;   APPLY_ATTR_MASK ($A08F) — directional attribute transformation
;
; The screen compositor (SWAP_SCREEN_BUFS) is the main rendering
; pipeline: it processes an 18x32 grid of tiles, applying multi-layer
; compositing (background, overlay, foreground) with attribute masking.
; Uses self-modifying code extensively for performance.
;
; Cross-references:
;   PRINT_TILE called from: virtually every code and data file
;   SCAN_KEY called from: code_input.asm, code_uimission.asm, entry.asm
;   SWAP_SCREEN_BUFS called from: code_mainloop.asm
;   APPLY_ATTR_MASK called from: within this file (screen compositor)
;
; Memory map:
;   $9E01-$9E2F  PRINT_TILE — 8x8 tile renderer
;   $9E30-$9E3D  SCAN_KEY — wait for keypress
;   $9E3E-$A06D  SWAP_SCREEN_BUFS — full-screen tile compositor
;   $A07B-$A08E  COPY_DATA_BLK — block memory copy with offset
;   $A08F-$A0A6  APPLY_ATTR_MASK — attribute bit transformation
;   $A0A7-$A10B  Data: screen line tables and tile lookup pointers
;
; ======================================================================

; ==========================================================================
; PRINT_TILE ($9E01) — Core 8x8 Tile Renderer
; ==========================================================================
; The most-called function in the game (64+ references). Draws C tiles
; from a tile index list at HL to screen address DE.
;
; For each tile:
;   1. Read tile index byte from (HL)
;   2. Calculate font data address: index * 8 + font_base
;   3. Copy 8 bytes (8 pixel rows) to screen at DE
;   4. Advance DE to next character column
;   5. Increment HL to next tile index, decrement C
;
; On entry:
;   HL = pointer to tile index data (each byte is a character code)
;   DE = screen bitmap address ($4000-$57FF)
;   C  = number of tiles to draw (0 = 256)
;
; On exit:
;   HL = past last tile index
;   DE = past last screen position
;   C  = 0
;
; Note: The font base address at $9E0B is self-modifying (written by
; entry.asm during initialization). Default is $3C00 (ROM charset).
;
PRINT_TILE:
	ld a,(hl)			;9e01  ; A = tile index (character code) from source data
	push hl			;9e02  ; Save source pointer
	ld h,000h		;9e03  ; H = 0 (prepare 16-bit index)
	add a,a			;9e05  ; A = index * 2
	ld l,a			;9e06  ; L = index * 2
	add hl,hl			;9e07  ; HL = index * 4
	add hl,hl			;9e08  ; HL = index * 8 (8 bytes per glyph)
	push de			;9e09  ; Save screen destination address
	ld de,03c00h		;9e0a  ; DE = font base address (self-modifying: set by entry.asm)
	add hl,de			;9e0d  ; HL = font_base + index * 8 (-> glyph bitmap data)
	pop de			;9e0e  ; Restore screen destination

; --- Copy 8 pixel rows of the glyph to screen ---
; Each INC D advances one pixel row in the Spectrum's interleaved
; screen layout (D holds the row within a character cell).
;
	push de			;9e0f  ; Save screen address for column advancement
	ld b,008h		;9e10  ; B = 8 pixel rows per character cell
l9e12h:
	ld a,(hl)			;9e12  ; A = glyph bitmap byte (one pixel row)
	ld (de),a			;9e13  ; Write pixel row to screen
	inc hl			;9e14  ; Next glyph data byte
	inc d			;9e15  ; Next pixel row (D increments through screen rows)
	djnz l9e12h		;9e16  ; Loop for all 8 rows

; --- Advance DE to the next character column ---
; The Spectrum screen address has pixel rows in bits 8-10 of D.
; After drawing 8 rows, D has been incremented by 8. To move to the
; next column, we need to add 1 to the column bits (bits 0-4 of E).
; The RR/RL trick rotates the row bits out of the way, adds 1,
; then rotates them back. This avoids corrupting the row bits.
;
	pop de			;9e18  ; Restore original screen address
	rr d		;9e19  ; Rotate row bits out (step 1 of 3)
	rr d		;9e1b  ; Rotate row bits out (step 2 of 3)
	rr d		;9e1d  ; Rotate row bits out (step 3 of 3)
	ld hl,00001h		;9e1f  ; HL = 1 (column increment)
	add hl,de			;9e22  ; HL = screen addr + 1 (next column)
	ex de,hl			;9e23  ; DE = updated screen address
	rl d		;9e24  ; Restore row bits (step 1 of 3)
	rl d		;9e26  ; Restore row bits (step 2 of 3)
	rl d		;9e28  ; Restore row bits (step 3 of 3)
	pop hl			;9e2a  ; Restore source tile index pointer
	inc hl			;9e2b  ; Advance to next tile index
	dec c			;9e2c  ; Decrement tile counter
	jr nz,PRINT_TILE		;9e2d  ; If more tiles remain, draw next one
	ret			;9e2f  ; All tiles drawn, return

; ==========================================================================
; SCAN_KEY ($9E30) — Wait for Keypress
; ==========================================================================
; Blocks until a key is pressed, returns the key code in A.
; Used by menu screens, high score name entry, and mission code input.
;
; Clears the LAST_K system variable, calls RST 38h to trigger the ROM
; keyboard scan routine, then reads back the detected key.
;
; On exit:
;   A = key code (0-92 range, ASCII minus $20)
;   Carry set if key code was < $5D (special/control key)
;
SCAN_KEY:
	xor a			;9e30  ; A = 0
	ld (05c08h),a		;9e31  ; Clear LAST_K system variable (no key pressed)
	rst 38h			;9e34  ; Call ROM interrupt handler (scans keyboard)
	ld a,(05c08h)		;9e35  ; A = LAST_K (key code from ROM scan)
	cp 05dh		;9e38  ; Compare with $5D (']' — boundary of printable range)
	ret c			;9e3a  ; If below $5D, return with carry set (control key)
	sub 020h		;9e3b  ; Convert to uppercase: subtract $20 (space offset)
	ret			;9e3d  ; Return with key code in A

; ==========================================================================
; SWAP_SCREEN_BUFS ($9E3E) — Full-Screen Tile Compositor
; ==========================================================================
; The main rendering pipeline for the game's playfield display.
; Processes an 18-row by 32-column grid of tiles with multi-layer
; compositing. Each tile position is rendered from up to 4 data layers:
;   1. Background tile graphic (from room map data)
;   2. Overlay layer (sprite/entity masks)
;   3. Foreground layer (entity graphics)
;   4. Attribute colors (applied via APPLY_ATTR_MASK)
;
; The four layer pointers are stored at self-modifying locations:
;   $A0A7 = layer 1 pointer (background tile indices)
;   $A0A9 = layer 2 pointer (pattern/graphic data)
;   $A0AB = layer 3 pointer (overlay data)
;   $A0AD = layer 4 pointer (foreground data)
;
; SCREEN_FLIP_FLAG ($9DC7) controls rendering mode/direction.
; IX tracks per-tile entity overlay state.
;
; On entry:
;   Called from the main game loop in code_mainloop.asm
;   All layer data pointers must be set up before calling
;
; On exit:
;   Screen bitmap ($4000-$57FF) and attributes ($5800+) updated
;
SWAP_SCREEN_BUFS:
	ld hl,SCREEN_FLIP_FLAG		;9e3e  ; HL -> screen flip/rendering mode flag
	ld a,(hl)			;9e41  ; A = current flip state
	xor 004h		;9e42  ; Toggle bit 2 (alternate rendering pass)
	ld (hl),a			;9e44  ; Store updated flip state
	inc hl			;9e45  ; HL -> next byte ($9DC8)
	ld (hl),000h		;9e46  ; Clear rendering sub-state

; --- Initialize the four layer data pointers ---
	ld hl,l68cch		;9e48  ; HL = $68CC (layer 1: background tile data)
	ld (la0a7h),hl		;9e4b  ; Store as layer 1 pointer
	ld hl,l6b0ch		;9e4e  ; HL = $6B0C (layer 3: overlay data)
	ld (la0abh),hl		;9e51  ; Store as layer 3 pointer
	ld hl,l6d4ch		;9e54  ; HL = $6D4C (layer 4: foreground data)
	ld (la0adh),hl		;9e57  ; Store as layer 4 pointer
	ld hl,GFX_PATTERN_TBL		;9e5a  ; HL = GFX_PATTERN_TBL (layer 2: pattern lookup)
	ld (la0a9h),hl		;9e5d  ; Store as layer 2 pointer

; --- Set up screen and attribute base addresses ---
	ld hl,HISCORE_TBL		;9e60  ; HL = $644C (source data base)
	ld de,GAME_ENTRY		;9e63  ; DE = $620C (offset/base)
	exx			;9e66  ; Switch to alternate registers
	ld de,05800h		;9e67  ; DE' = $5800 (attribute area start)
	ld hl,04000h		;9e6a  ; HL' = $4000 (screen bitmap start)
	exx			;9e6d  ; Switch back to main registers
	ld ix,GAME_ENTRY		;9e6e  ; IX = $620C (entity overlay data base)
	ld b,012h		;9e72  ; B = 18 (number of tile rows to render)

; ==========================================================================
; OUTER LOOP: Process each of 18 tile rows
; ==========================================================================
l9e74h:
	ld c,020h		;9e74  ; C = 32 (tiles per row)

; ==========================================================================
; INNER LOOP: Process each tile in the current row
; ==========================================================================
l9e76h:
	push bc			;9e76  ; Save row counter (B) and column counter (C)
	push hl			;9e77  ; Save source data pointer
	push de			;9e78  ; Save destination offset

; --- Save alternate register screen pointers ---
	exx			;9e79  ; Switch to alternate registers
	push hl			;9e7a  ; Save HL' (screen bitmap pointer)
	push de			;9e7b  ; Save DE' (attribute pointer)
	exx			;9e7c  ; Switch back

; --- Check entity overlay flag for this tile position ---
	ld a,(ix+000h)		;9e7d  ; A = entity overlay flag for this tile
	or a			;9e80  ; Test if any entity overlaps this tile
	jp z,la01ch		;9e81  ; If no entity here, skip overlay processing

; --- Load tile index and compute graphic data address ---
	ld a,(hl)			;9e84  ; A = tile index from background layer
	ld (la0b8h),a		;9e85  ; Store tile index (used later for special checks)
	ld h,000h		;9e88  ; H = 0
	ld l,a			;9e8a  ; L = tile index
	push hl			;9e8b  ; Save tile index as 16-bit value
	pop de			;9e8c  ; DE = tile index (16-bit)
	add hl,hl			;9e8d  ; HL = index * 2
	add hl,hl			;9e8e  ; HL = index * 4
	add hl,hl			;9e8f  ; HL = index * 8
	add hl,de			;9e90  ; HL = index * 9 (9 bytes per tile graphic)
	ld de,lddf9h		;9e91  ; DE = $DDF9 (tile graphic data base offset)
	add hl,de			;9e94  ; HL = tile_base + index * 9 (-> tile graphic)

; --- Copy 9 bytes of tile graphic to screen line buffer ---
; The screen line buffer at SCREEN_LINE_TBL ($A0AF) holds 8 pixel
; rows plus one attribute byte for the current tile being composited.
;
	ld de,SCREEN_LINE_TBL		;9e95  ; DE = screen line buffer ($A0AF)
	ldi		;9e98  ; Copy byte 1 of tile graphic
	ldi		;9e9a  ; Copy byte 2
	ldi		;9e9c  ; Copy byte 3
	ldi		;9e9e  ; Copy byte 4
	ldi		;9ea0  ; Copy byte 5
	ldi		;9ea2  ; Copy byte 6
	ldi		;9ea4  ; Copy byte 7
	ldi		;9ea6  ; Copy byte 8
	ldi		;9ea8  ; Copy attribute byte (byte 9)

; --- Process layer 3 (overlay) ---
; Read overlay tile index and compute its graphic data address.
; If overlay index is $FF, skip this layer (no overlay).
;
	ld hl,(la0abh)		;9eaa  ; HL -> current overlay data pointer
	xor a			;9ead  ; A = 0
	ld (l9dc8h),a		;9eae  ; Clear rendering sub-state
	ld a,(hl)			;9eb1  ; A = overlay tile index
	ld l,a			;9eb2  ; L = overlay index
	inc a			;9eb3  ; Test if $FF (inc $FF -> 0, sets Z)
	jr z,l9f04h		;9eb4  ; If $FF, skip overlay layer

; --- Check for special overlay indices that need flip ---
	ld b,000h		;9eb6  ; B = 0 (default: no flip)
	cp 0a4h		;9eb8  ; Compare overlay index with $A4
	jr c,l9ec7h		;9eba  ; If < $A4, no special handling
	cp 0a7h		;9ebc  ; Compare with $A7
	jr nc,l9ec7h		;9ebe  ; If >= $A7, no special handling
; --- Overlay index is $A4-$A6: apply screen flip ---
	ld a,(SCREEN_FLIP_FLAG)		;9ec0  ; A = current screen flip state
	ld (l9dc8h),a		;9ec3  ; Store flip state for this tile
	ld b,a			;9ec6  ; B = flip value

l9ec7h:
; --- Compute overlay graphic address ---
	ld a,(SCREEN_LINE_HI)		;9ec7  ; A = screen line high byte
	and 0f8h		;9eca  ; Clear lower 3 bits (align to 8-byte boundary)
	or b			;9ecc  ; Apply flip offset
	ld (SCREEN_LINE_HI),a		;9ecd  ; Store updated high byte
	ld h,000h		;9ed0  ; H = 0
	add hl,hl			;9ed2  ; HL = overlay_index * 2
	add hl,hl			;9ed3  ; HL = overlay_index * 4
	add hl,hl			;9ed4  ; HL = overlay_index * 8
	ld de,ld608h		;9ed5  ; DE = $D608 (overlay graphic data base)
	add hl,de			;9ed8  ; HL = overlay_base + index * 8

; --- Composite overlay onto screen line buffer ---
; Uses AND/OR masking: screen = (screen AND mask) OR overlay_data.
; This allows transparent pixels in the overlay.
;
	ld de,SCREEN_LINE_TBL		;9ed9  ; DE = screen line buffer
	ld b,008h		;9edc  ; B = 8 pixel rows
	call SAVE_SPRITE_DIR		;9ede  ; Save sprite direction state

l9ee1h:
	ld a,(de)			;9ee1  ; A = current screen buffer byte
	ld c,a			;9ee2  ; C = screen byte (saved for masking)
	ld a,(hl)			;9ee3  ; A = overlay mask byte
	ld (09eefh),a		;9ee4  ; Self-modify: store mask for APPLY_ATTR_MASK
	push ix		;9ee7  ; Save IX
	ld ix,b3_end		;9ee9  ; IX -> attribute lookup table
	ld a,(ix+000h)		;9eed  ; A = attribute mask value (self-modified address)
	pop ix		;9ef0  ; Restore IX
	call APPLY_ATTR_MASK		;9ef2  ; Transform mask based on player direction
	and c			;9ef5  ; Apply AND mask to screen byte
	ld c,a			;9ef6  ; C = masked screen byte
	ld a,(hl)			;9ef7  ; A = overlay data byte
	call APPLY_ATTR_MASK		;9ef8  ; Transform overlay data
	or c			;9efb  ; Merge overlay onto masked screen
	ld (de),a			;9efc  ; Store composited result back to buffer
	inc hl			;9efd  ; Next overlay data byte
	inc de			;9efe  ; Next screen buffer byte
	djnz l9ee1h		;9eff  ; Loop for all 8 pixel rows
	call SAVE_SPRITE_DIR		;9f01  ; Restore sprite direction state

; --- Process layer 4 (foreground) ---
; Same compositing approach as overlay layer.
; If foreground index is $FF, skip this layer.
;
l9f04h:
	ld hl,(la0adh)		;9f04  ; HL -> current foreground data pointer
	ld a,(hl)			;9f07  ; A = foreground tile index
	ld l,a			;9f08  ; L = foreground index
	inc a			;9f09  ; Test if $FF (no foreground)
	jr z,l9f48h		;9f0a  ; If $FF, skip foreground layer

; --- Compute foreground graphic address ---
	ld a,(SCREEN_LINE_HI)		;9f0c  ; A = screen line high byte
	and 0f8h		;9f0f  ; Clear lower 3 bits
	ld (SCREEN_LINE_HI),a		;9f11  ; Store aligned value
	ld h,000h		;9f14  ; H = 0
	add hl,hl			;9f16  ; HL = fg_index * 2
	add hl,hl			;9f17  ; HL = fg_index * 4
	add hl,hl			;9f18  ; HL = fg_index * 8
	ld de,ld608h		;9f19  ; DE = $D608 (foreground graphic data base)
	add hl,de			;9f1c  ; HL = fg_base + index * 8

; --- Composite foreground onto screen line buffer ---
	ld de,SCREEN_LINE_TBL		;9f1d  ; DE = screen line buffer
	ld b,008h		;9f20  ; B = 8 pixel rows
	call SAVE_ALT_DIR		;9f22  ; Save alternate sprite direction

l9f25h:
	ld a,(de)			;9f25  ; A = current screen buffer byte
	ld c,a			;9f26  ; C = screen byte for masking
	ld a,(hl)			;9f27  ; A = foreground mask byte
	ld (09f33h),a		;9f28  ; Self-modify: store mask value
	push ix		;9f2b  ; Save IX
	ld ix,b3_end		;9f2d  ; IX -> attribute lookup table
	ld a,(ix+000h)		;9f31  ; A = attribute mask value (self-modified)
	pop ix		;9f34  ; Restore IX
	call APPLY_ATTR_MASK		;9f36  ; Transform mask based on direction
	and c			;9f39  ; Apply AND mask to screen byte
	ld c,a			;9f3a  ; C = masked screen byte
	ld a,(hl)			;9f3b  ; A = foreground data byte
	call APPLY_ATTR_MASK		;9f3c  ; Transform foreground data
	or c			;9f3f  ; Merge foreground onto masked screen
	ld (de),a			;9f40  ; Store composited result
	inc hl			;9f41  ; Next foreground data byte
	inc de			;9f42  ; Next screen buffer byte
	djnz l9f25h		;9f43  ; Loop for all 8 pixel rows
	call SAVE_ALT_DIR		;9f45  ; Restore alternate sprite direction

; --- Process layer 1 (background tile) with special-case checks ---
l9f48h:
	ld a,(09f9fh)		;9f48  ; A = saved screen line value (self-modified)
	ld (l9dc9h),a		;9f4b  ; Preserve rendering state
	ld hl,(la0a7h)		;9f4e  ; HL -> current background tile pointer
	ld a,(hl)			;9f51  ; A = background tile index
	ld l,a			;9f52  ; L = bg tile index
	inc a			;9f53  ; Test if $FF (empty tile)
	jp z,l9fd7h		;9f54  ; If $FF, skip background rendering

; --- Check for special tile index ranges ---
; Certain tile indices trigger special rendering behavior:
;   $D3-$D6: door/passageway tiles (check screen flip)
;   $D7-$DA: wall tiles (normal rendering)
;   $DB+: special animated tiles
;   $E1+: handled separately
;
	cp 0e1h		;9f57  ; Compare with $E1
	jr nc,l9f74h		;9f59  ; If >= $E1, use standard path
	cp 0d3h		;9f5b  ; Compare with $D3
	jr c,l9f74h		;9f5d  ; If < $D3, use standard path
	cp 0d7h		;9f5f  ; Compare with $D7
	jr c,l9f67h		;9f61  ; If $D3-$D6, handle door tiles
	cp 0dbh		;9f63  ; Compare with $DB
	jr c,l9f74h		;9f65  ; If $D7-$DA, use standard path

; --- Door/passageway tile: check if player can see through ---
l9f67h:
	ld a,(la0b8h)		;9f67  ; A = entity tile index from earlier
	dec a			;9f6a  ; Test if entity index was 1
	jr nz,l9f74h		;9f6b  ; If not 1, use standard rendering
	ld a,007h		;9f6d  ; A = 7 (alternate rendering mode)
	ld (09f9fh),a		;9f6f  ; Self-modify: set alternate screen line value
	jr l9f99h		;9f72  ; Jump to background rendering

; --- Check for score display area tiles ---
; Tile indices $4F-$55 in the HUD area need special handling
; when the score display is active.
;
l9f74h:
	ld a,(la0b8h)		;9f74  ; A = entity tile index
	cp 04fh		;9f77  ; Compare with $4F (start of HUD tile range)
	jr c,l9f8ah		;9f79  ; If below HUD range, skip
	cp 056h		;9f7b  ; Compare with $56 (end of HUD tile range)
	jr nc,l9f8ah		;9f7d  ; If above HUD range, skip
	ld a,(UPDATE_SCORE+1)		;9f7f  ; A = score display active flag (self-modified)
	or a			;9f82  ; Test if score display is active
	jr z,l9f8ah		;9f83  ; If not active, skip
	ld a,001h		;9f85  ; A = 1 (mark tile as needing refresh)
	ld (l9944h),a		;9f87  ; Set refresh flag for this tile position

; --- Check screen flip state for rendering direction ---
l9f8ah:
	ld a,(l9dc8h)		;9f8a  ; A = screen flip sub-state for this tile
	or a			;9f8d  ; Test if flip is active
	jr z,l9f99h		;9f8e  ; If no flip, use normal rendering

; --- Flip active: call UPDATE_SCORE to handle flipped rendering ---
	push hl			;9f90  ; Save background pointer
	ld b,003h		;9f91  ; B = 3 (render mode parameter)
	call UPDATE_SCORE		;9f93  ; Process flipped tile rendering
	pop hl			;9f96  ; Restore background pointer
	jr l9fa3h		;9f97  ; Skip normal path

; --- Normal background rendering ---
l9f99h:
	ld a,(SCREEN_LINE_HI)		;9f99  ; A = screen line high byte
	and 0f8h		;9f9c  ; Clear lower 3 bits
	or 000h		;9f9e  ; OR with 0 (no offset — self-modified address)
	ld (SCREEN_LINE_HI),a		;9fa0  ; Store aligned value

; --- Compute background tile graphic address ---
l9fa3h:
	ld a,(l9dc9h)		;9fa3  ; A = saved rendering state
	ld (09f9fh),a		;9fa6  ; Restore self-modified value
	ld h,000h		;9fa9  ; H = 0
	add hl,hl			;9fab  ; HL = bg_index * 2
	add hl,hl			;9fac  ; HL = bg_index * 4
	add hl,hl			;9fad  ; HL = bg_index * 8
	ld de,lf623h		;9fae  ; DE = $F623 (background graphic data base)
	add hl,de			;9fb1  ; HL = bg_base + index * 8

; --- Composite background onto screen line buffer ---
	ld de,SCREEN_LINE_TBL		;9fb2  ; DE = screen line buffer
	ld b,008h		;9fb5  ; B = 8 pixel rows

l9fb7h:
	ld a,(de)			;9fb7  ; A = current screen buffer byte
	ld c,a			;9fb8  ; C = screen byte for masking
	ld a,(hl)			;9fb9  ; A = background mask byte
	ld (09fc5h),a		;9fba  ; Self-modify: store mask value
	push ix		;9fbd  ; Save IX
	ld ix,b3_end		;9fbf  ; IX -> attribute lookup table
	ld a,(ix+000h)		;9fc3  ; A = attribute mask value (self-modified)
	pop ix		;9fc6  ; Restore IX
	call APPLY_ATTR_MASK		;9fc8  ; Transform mask based on direction
	and c			;9fcb  ; Apply AND mask to screen byte
	ld c,a			;9fcc  ; C = masked screen byte
	ld a,(hl)			;9fcd  ; A = background data byte
	call APPLY_ATTR_MASK		;9fce  ; Transform background data
	or c			;9fd1  ; Merge background onto masked screen
	inc hl			;9fd2  ; Next background data byte
	ld (de),a			;9fd3  ; Store composited result
	inc de			;9fd4  ; Next screen buffer byte
	djnz l9fb7h		;9fd5  ; Loop for all 8 pixel rows

; ==========================================================================
; WRITE COMPOSITED TILE TO SCREEN ($9FD7)
; ==========================================================================
; After all layers are composited in the screen line buffer, copy the
; result to the actual screen bitmap and write the attribute byte.
;
l9fd7h:
	ld hl,SCREEN_LINE_HI		;9fd7  ; HL -> attribute high byte
	ld a,010h		;9fda  ; A = $10 (attribute offset/flag)
l9fdch:
	nop			;9fdc  ; (Placeholder — may be patched at runtime)

; --- Process layer 2 (pattern/graphic data) ---
	ld hl,(la0a9h)		;9fdd  ; HL -> current pattern data pointer
	ld a,(hl)			;9fe0  ; A = pattern tile index
	ld l,a			;9fe1  ; L = pattern index
	inc a			;9fe2  ; Test if $FF (no pattern)
	jr z,la00bh		;9fe3  ; If $FF, skip to screen write

; --- Compute pattern graphic address ---
	ld h,000h		;9fe5  ; H = 0
	push hl			;9fe7  ; Save pattern index
	add hl,hl			;9fe8  ; HL = index * 2
	add hl,hl			;9fe9  ; HL = index * 4
	add hl,hl			;9fea  ; HL = index * 8
	cp 0e5h		;9feb  ; Compare with $E5 (special pattern threshold)
	jp nc,la05eh		;9fed  ; If >= $E5, use alternate pattern rendering

; --- Standard pattern: AND/OR composite ---
	add hl,hl			;9ff0  ; HL = index * 16 (16 bytes per mask+data pair)
	pop de			;9ff1  ; DE = pattern index (saved earlier)
	add hl,de			;9ff2  ; HL = index * 17 (adjust for structure)
	ld de,la0b9h		;9ff3  ; DE = $A0B9 (pattern data base offset)
	add hl,de			;9ff6  ; HL = pattern graphic data address
	ld de,SCREEN_LINE_TBL		;9ff7  ; DE = screen line buffer
	ld b,008h		;9ffa  ; B = 8 pixel rows

l9ffch:
	ld a,(de)			;9ffc  ; A = screen buffer byte
	and (hl)			;9ffd  ; AND with pattern mask
	inc hl			;9ffe  ; Advance to pattern data byte
	or (hl)			;9fff  ; OR pattern data onto masked screen
	inc hl			;a000  ; Next mask+data pair
	ld (de),a			;a001  ; Store composited result
	inc de			;a002  ; Next screen buffer byte
	djnz l9ffch		;a003  ; Loop for all 8 rows

; --- Check for attribute byte after pattern data ---
	ld a,(hl)			;a005  ; A = byte after pattern data
	cp 0ffh		;a006  ; Is it $FF (no attribute override)?
	jr z,la00bh		;a008  ; If $FF, skip attribute write
	ld (de),a			;a00a  ; Store attribute override byte

; ==========================================================================
; COPY SCREEN LINE BUFFER TO ACTUAL SCREEN ($A00B)
; ==========================================================================
; Transfer the 8 composited pixel bytes from the screen line buffer
; to the actual screen bitmap via the alternate register set.
; HL' points to the screen bitmap position, DE' to the attribute area.
;
la00bh:
	ld b,008h		;a00b  ; B = 8 pixel rows to copy
	ld hl,SCREEN_LINE_TBL		;a00d  ; HL = screen line buffer start

la010h:
	ld a,(hl)			;a010  ; A = composited pixel byte from buffer
	exx			;a011  ; Switch to alternate registers
	ld (hl),a			;a012  ; Write pixel byte to screen bitmap at HL'
	inc h			;a013  ; Next pixel row (H' increment = Spectrum row step)
	exx			;a014  ; Switch back to main registers
	inc hl			;a015  ; Next buffer byte
	djnz la010h		;a016  ; Loop for all 8 pixel rows

; --- Write attribute byte ---
	ld a,(hl)			;a018  ; A = attribute byte from buffer (9th byte)
	exx			;a019  ; Switch to alternate registers
	ld (de),a			;a01a  ; Write attribute to attribute area at DE'
	exx			;a01b  ; Switch back to main registers

; ==========================================================================
; ADVANCE TO NEXT TILE POSITION ($A01C)
; ==========================================================================
; Update all pointers for the next tile in the row.
;
la01ch:
; --- Advance alternate register screen pointers ---
	exx			;a01c  ; Switch to alternate registers
	pop de			;a01d  ; Restore DE' (attribute pointer)
	pop hl			;a01e  ; Restore HL' (screen bitmap pointer)
	inc hl			;a01f  ; HL' -> next screen column
	inc de			;a020  ; DE' -> next attribute column
	exx			;a021  ; Switch back to main registers

; --- Advance all four layer data pointers ---
	ld hl,(la0a7h)		;a022  ; HL = layer 1 pointer
	inc hl			;a025  ; Advance to next tile
	ld (la0a7h),hl		;a026  ; Store updated pointer
	ld hl,(la0abh)		;a029  ; HL = layer 3 pointer
	inc hl			;a02c  ; Advance to next tile
	ld (la0abh),hl		;a02d  ; Store updated pointer
	ld hl,(la0adh)		;a030  ; HL = layer 4 pointer
	inc hl			;a033  ; Advance to next tile
	ld (la0adh),hl		;a034  ; Store updated pointer
	ld hl,(la0a9h)		;a037  ; HL = layer 2 pointer
	inc hl			;a03a  ; Advance to next tile
	ld (la0a9h),hl		;a03b  ; Store updated pointer

; --- Advance source and entity pointers, check column loop ---
	pop de			;a03e  ; Restore DE (destination offset)
	pop hl			;a03f  ; Restore HL (source data pointer)
	pop bc			;a040  ; Restore BC (row/column counters)
	inc de			;a041  ; DE -> next destination position
	inc hl			;a042  ; HL -> next source tile
	inc ix		;a043  ; IX -> next entity overlay entry
	dec c			;a045  ; Decrement column counter
	jp nz,l9e76h		;a046  ; If more columns remain, process next tile

; ==========================================================================
; END OF ROW: Advance to next screen row ($A049)
; ==========================================================================
; After all 32 columns in a row are processed, advance HL' (screen
; bitmap pointer) to the next character row. The Spectrum's interleaved
; layout means we need the RR/RL trick again (same as in PRINT_TILE).
;
	exx			;a049  ; Switch to alternate registers
	dec hl			;a04a  ; Adjust HL' back one column (compensate for last INC)
	rr h		;a04b  ; Rotate row bits out (step 1)
	rr h		;a04d  ; Rotate row bits out (step 2)
	rr h		;a04f  ; Rotate row bits out (step 3)
	inc hl			;a051  ; Advance to next character row
	rl h		;a052  ; Restore row bits (step 1)
	rl h		;a054  ; Restore row bits (step 2)
	rl h		;a056  ; Restore row bits (step 3)
	exx			;a058  ; Switch back to main registers
	dec b			;a059  ; Decrement row counter
	jp nz,l9e74h		;a05a  ; If more rows remain, process next row
	ret			;a05d  ; All 18 rows rendered, return

; --- Alternate pattern rendering for special indices >= $E5 ---
la05eh:
	pop de			;a05e  ; Restore pattern index
	ld de,lee2bh		;a05f  ; DE = $EE2B (alternate pattern data base)
	add hl,de			;a062  ; HL = alternate pattern address
	cp 0e5h		;a063  ; Check if exactly $E5
	jr nz,la06ah		;a065  ; If not $E5, use computed address
	ld hl,lf44bh		;a067  ; HL = $F44B (special pattern for $E5)

la06ah:
; --- Simple copy (no AND/OR masking) for special patterns ---
	ld de,SCREEN_LINE_TBL		;a06a  ; DE = screen line buffer
	ld b,008h		;a06d  ; B = 8 pixel rows
la06fh:
	ld a,(hl)			;a06f  ; A = pattern pixel byte
	ld (de),a			;a070  ; Copy directly to screen buffer (no masking)
	inc de			;a071  ; Next buffer byte
	inc hl			;a072  ; Next pattern byte
	djnz la06fh		;a073  ; Loop for all 8 rows
	ld a,030h		;a075  ; A = $30 (attribute: green on black)
	ld (de),a			;a077  ; Set attribute byte for special pattern
	jp la00bh		;a078  ; Jump to screen write routine

; ==========================================================================
; COPY_DATA_BLK ($A07B) — Block Memory Copy with Offset
; ==========================================================================
; Copies B bytes from (DE) to (HL), adding $A4 to each byte.
; Then fills the same number of bytes backward with $01.
; Used for entity data initialization and screen state setup.
;
; On entry:
;   DE = source data pointer
;   HL = destination pointer
;   B  = number of bytes to copy
;
COPY_DATA_BLK:
	ld c,b			;a07b  ; C = save byte count for second pass
la07ch:
	ld a,(de)			;a07c  ; A = source byte
	add a,0a4h		;a07d  ; A += $A4 (offset transformation)
	ld (hl),a			;a07f  ; Store transformed byte at destination
	inc de			;a080  ; Next source byte
	inc hl			;a081  ; Next destination byte
	djnz la07ch		;a082  ; Loop for all B bytes

; --- Fill backward with $01 (clear/init pass) ---
	ld de,lfb80h		;a084  ; DE = $FB80 (negative offset for backward fill)
	add hl,de			;a087  ; HL = destination - $0480 (wraps to fill start)
la088h:
	dec hl			;a088  ; Move backward
	ld (hl),001h		;a089  ; Store $01 (initialization value)
	dec c			;a08b  ; Decrement counter
	jr nz,la088h		;a08c  ; Loop for all bytes
	ret			;a08e  ; Return

; ==========================================================================
; APPLY_ATTR_MASK ($A08F) — Directional Attribute Transformation
; ==========================================================================
; Transforms a graphic byte based on the player's facing direction.
; If PLAYER_DIR is 0 (right-facing), returns A unchanged.
; If PLAYER_DIR is non-zero (left-facing), looks up a mirrored version
; from a transformation table, producing horizontally flipped graphics.
;
; This is how the game renders left-facing sprites without storing
; separate left/right versions of every graphic.
;
; On entry:
;   A = graphic/mask byte to transform
; On exit:
;   A = transformed byte (flipped if player faces left)
;
APPLY_ATTR_MASK:
	push bc			;a08f  ; Save BC
	ld b,a			;a090  ; B = save input byte
	ld a,(PLAYER_DIR)		;a091  ; A = player facing direction
	or a			;a094  ; Test direction (0=right, nonzero=left)
	ld a,b			;a095  ; A = restore input byte
	pop bc			;a096  ; Restore BC
	ret z			;a097  ; If facing right, return byte unchanged
; --- Player faces left: look up mirrored byte ---
	ld (0a0a3h),a		;a098  ; Self-modify: store byte as IX offset
	push ix		;a09b  ; Save IX
	ld ix,lfdb3h		;a09d  ; IX = $FDB3 (mirror lookup table base)
	ld a,(ix+000h)		;a0a1  ; A = mirrored byte (offset is self-modified)
	pop ix		;a0a4  ; Restore IX
	ret			;a0a6  ; Return with mirrored byte in A

; ==========================================================================
; DATA: Layer Data Pointers (self-modifying storage)
; ==========================================================================
; These 2-byte variables hold the current position in each rendering
; layer's data stream. They are updated as tiles are processed.
;
la0a7h:
	nop			;a0a7  ; Layer 1 pointer (low byte)
	nop			;a0a8  ; Layer 1 pointer (high byte)
la0a9h:
	nop			;a0a9  ; Layer 2 pointer (low byte)
	nop			;a0aa  ; Layer 2 pointer (high byte)
la0abh:
	nop			;a0ab  ; Layer 3 pointer (low byte)
	nop			;a0ac  ; Layer 3 pointer (high byte)
la0adh:
	nop			;a0ad  ; Layer 4 pointer (low byte)
	nop			;a0ae  ; Layer 4 pointer (high byte)

; ==========================================================================
; DATA: Screen Line Buffer ($A0AF)
; ==========================================================================
; Temporary buffer holding the 8 composited pixel bytes + 1 attribute
; byte for the tile currently being rendered. All compositing layers
; write their results here before the final copy to screen memory.
;
SCREEN_LINE_TBL:
	nop			;a0af  ; Pixel row 0
	nop			;a0b0  ; Pixel row 1
	nop			;a0b1  ; Pixel row 2
	nop			;a0b2  ; Pixel row 3
	nop			;a0b3  ; Pixel row 4
	nop			;a0b4  ; Pixel row 5
	nop			;a0b5  ; Pixel row 6
	nop			;a0b6  ; Pixel row 7

; ==========================================================================
; DATA: Screen State Variables ($A0B7)
; ==========================================================================
;
SCREEN_LINE_HI:
	ld (bc),a			;a0b7  ; Screen line high byte (self-modifying storage)
la0b8h:
	nop			;a0b8  ; Tile index cache (written during compositing)

; ==========================================================================
; DATA: Tile Graphic Lookup Tables ($A0B9-$A10B)
; ==========================================================================
; Mask and graphic data for pattern tiles. Each entry contains
; alternating AND-mask and OR-data bytes for 8 pixel rows,
; optionally followed by an attribute byte.
; These tables are indexed by tile type during layer 2 rendering.
;
la0b9h:
	dec d			;a0b9
	jp pe,lbf00h		;a0ba
	nop			;a0bd
	ei			;a0be
	jr nz,$-31		;a0bf
	ld b,d			;a0c1
	or l			;a0c2
	nop			;a0c3
	rst 38h			;a0c4
	ex af,af'			;a0c5
	or a			;a0c6
	ex af,af'			;a0c7
	rst 30h			;a0c8
	ld hl,lff00h		;a0c9
	nop			;a0cc
	add a,c			;a0cd
	nop			;a0ce
	add a,c			;a0cf
	nop			;a0d0
	add a,c			;a0d1
	nop			;a0d2
	add a,c			;a0d3
	nop			;a0d4
	add a,c			;a0d5
	nop			;a0d6
	add a,c			;a0d7
	nop			;a0d8
	add a,c			;a0d9
	jr nc,la0dch		;a0da
la0dch:
	rst 38h			;a0dc
	nop			;a0dd
	ret c			;a0de
	nop			;a0df
	xor b			;a0e0
	nop			;a0e1
	ret c			;a0e2
	nop			;a0e3
	rst 38h			;a0e4
	nop			;a0e5
	adc a,d			;a0e6
	nop			;a0e7
	adc a,d			;a0e8
	nop			;a0e9
	adc a,d			;a0ea
	jr nc,la0edh		;a0eb
la0edh:
	rst 38h			;a0ed
	nop			;a0ee
	nop			;a0ef
	nop			;a0f0
	nop			;a0f1
	nop			;a0f2
	nop			;a0f3
	nop			;a0f4
	rst 38h			;a0f5
	nop			;a0f6
	xor d			;a0f7
	nop			;a0f8
	xor d			;a0f9
	nop			;a0fa
	xor d			;a0fb
	jr nc,la0feh		;a0fc
la0feh:
	rst 38h			;a0fe
	nop			;a0ff
	dec d			;a100
	nop			;a101
	dec de			;a102
	nop			;a103
	dec d			;a104
	nop			;a105
	rst 38h			;a106
	nop			;a107
	or c			;a108
	nop			;a109
	or c			;a10a
	nop			;a10b
