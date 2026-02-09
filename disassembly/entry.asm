; ======================================================================
; entry.asm
; ======================================================================
;
; Game Entry Point & Initialization (USR 25100)
;
; Address range: $620C-$62B7 (172 bytes)
; Source binary: block7_main.bin (loaded at $620C)
;
; Called by RANDOMIZE USR 25100 from the BASIC loader after the main
; game binary has been loaded. This is the first game code that runs.
;
; Initialization sequence:
;   1. Set up IM2 interrupt table at $8100 (all entries -> $8282)
;   2. Save BASIC return address (HL' register)
;   3. Page in bank 1, call SOUND_INIT at $F618, page bank 0 back
;   4. Set fast key repeat (REPDEL=1, REPPER=1)
;   5. Set border to black
;   6. Clear screen bitmap using PRINT_TILE (3 x 256 blank tiles)
;   7. Fill attribute area with alternating yellow/white color bands
;   8. Wait for any keypress (loading screen pause)
;   9. Generate bit-reversed font table at $FD33 for mirrored glyphs
;  10. Optionally randomize high score table using R register
;  11. Jump to TITLE_SCREEN ($708C) to show the main menu
;
; Cross-references:
;   Calls: SOUND_INIT ($F618), PRINT_TILE ($9E01), SCAN_KEY ($9E30)
;   Calls: FILL_ATTRS ($62B1, local subroutine)
;   Jumps to: TITLE_SCREEN ($708C) in code_roomrender.asm
;   Sets up: IM2 vector table at $8100-$8200
;
; Memory map:
;   $620C-$62B0  Initialization code
;   $62B1-$62B7  FILL_ATTRS subroutine
;   $8100-$8200  IM2 interrupt vector table (257 bytes of $82)
;   $7FFD         128K bank switch port
;   $5C09         REPDEL system variable (key repeat delay)
;   $5C0A         REPPER system variable (key repeat period)
;
; ======================================================================


	org	0620ch

GAME_ENTRY:

; BLOCK 'b0' (start 0x620c end 0x62b8)
b0_start:

; ==========================================================================
; IM2 INTERRUPT TABLE SETUP ($620C)
; ==========================================================================
; The ZX Spectrum's data bus floats during IM2 acknowledgement, so the
; low byte read is unpredictable. To handle this, we fill 257 consecutive
; bytes ($8100-$8200) with the same value ($82). Any data bus byte will
; read a pair of $82 bytes, forming the handler address $8282.
; The interrupt service routine at $8282 handles music and timing.
;
	di			;620c  ; Disable interrupts during setup
l620dh:
	ld hl,IM2_VECTOR_TBL		;620d  ; HL = $8100 (start of IM2 vector table)
	ld a,h			;6210  ; A = $81 (high byte of table address)
	ld i,a		;6211  ; I = $81 (IM2 reads vectors from page $81xx)
	inc a			;6213  ; A = $82 (fill value -> handler at $8282)
	ld b,000h		;6214  ; B = 0 -> loop 256 times
l6216h:
	ld (hl),a			;6216  ; Store $82 into vector table entry
	inc l			;6217  ; Next table entry (L wraps $00-$FF)
	djnz l6216h		;6218  ; Fill all 256 bytes at $8100-$81FF
	inc h			;621a  ; HL = $8200 (one past end of table)
	ld (hl),a			;621b  ; Store $82 at $8200 for boundary case (bus=$FF)
	im 2		;621c  ; Enable IM2 mode: interrupts now jump to $8282

; --- Save BASIC return address ---
; EXX swaps to the alternate register set where HL' holds the BASIC
; return address. We push it so BASIC can resume after the game exits.
;
	exx			;621e  ; Switch to alternate register set
	push hl			;621f  ; Save HL' (BASIC return address) on stack
	exx			;6220  ; Switch back to main registers

; ==========================================================================
; SOUND ENGINE INITIALIZATION ($6221)
; ==========================================================================
; The sound engine was copied to $F618 in bank 1 by the preloader.
; We page bank 1 into $C000-$FFFF, call SOUND_INIT to set up the
; AY-3-8912 chip registers and music state, then page bank 0 back.
;
	ld bc,l7ffdh		;6221  ; BC = $7FFD (128K memory paging port)
	ld a,011h		;6224  ; A = $11 -> select bank 1 at $C000-$FFFF
	out (c),a		;6226  ; Page in bank 1 (sound engine now accessible)
	call SOUND_INIT		;6228  ; Initialize AY sound engine at $F618 in bank 1
	ld bc,l7ffdh		;622b  ; BC = $7FFD (128K memory paging port)
	ld a,010h		;622e  ; A = $10 -> select bank 0 at $C000-$FFFF
	out (c),a		;6230  ; Restore bank 0
	ei			;6232  ; Re-enable interrupts (IM2 now active at $8282)

; ==========================================================================
; KEYBOARD & DISPLAY SETUP ($6233)
; ==========================================================================
; Configure fast key repeat, black border, and clear the screen.
;
	ld a,001h		;6233  ; A = 1 (minimal delay)
	ld (05c09h),a		;6235  ; REPDEL = 1 (key repeat starts after 1 frame)
	ld (05c0ah),a		;6238  ; REPPER = 1 (key repeats every frame)
	xor a			;623b  ; A = 0
	out (0feh),a		;623c  ; ULA port: set border to black, speaker off

; --- Clear screen bitmap with blank tiles ---
; PRINT_TILE draws C tiles from data at HL to screen address DE.
; Three calls of 256 tiles each clear the entire 6144-byte bitmap.
; The font pointer at $9E0B is set to $3C00 (blank tile source).
;
	ld hl,03c00h		;623e  ; HL = $3C00 (blank tile/font source data)
	ld (09e0bh),hl		;6241  ; Set PRINT_TILE's font data pointer
	ld hl,l69b1h		;6244  ; HL = $69B1 (tile data for screen clearing)
	ld de,04000h		;6247  ; DE = $4000 (screen bitmap start)
	ld c,000h		;624a  ; C = 0 -> 256 tiles (first 2048 bytes)
	call PRINT_TILE		;624c  ; Clear top third of screen ($4000-$47FF)
	ld c,000h		;624f  ; C = 0 -> 256 tiles (next 2048 bytes)
	call PRINT_TILE		;6251  ; Clear middle third of screen ($4800-$4FFF)
	ld c,000h		;6254  ; C = 0 -> 256 tiles (last 2048 bytes)
	call PRINT_TILE		;6256  ; Clear bottom third of screen ($5000-$57FF)

; --- Fill attribute area with alternating color bands ---
; FILL_ATTRS stores A into B bytes at HL, then XORs A with $09.
; Starting with A=$06 (INK=yellow, PAPER=black):
;   $06 -> fill 32 bytes  (row 0)           yellow on black
;   $0F -> fill 192 bytes (rows 1-6)        white on blue
;   $06 -> fill 224 bytes (rows 7-13)       yellow on black
;   $0F -> fill 256 bytes (rows 14-21)      white on blue
;   $06 -> fill 64 bytes  (rows 22-23)      yellow on black
; This creates the loading screen color layout.
;
	ld a,006h		;6259  ; A = $06 (INK=yellow, PAPER=black)
	ld hl,05800h		;625b  ; HL = $5800 (attribute area start)
	ld b,020h		;625e  ; B = 32 bytes (1 character row)
	call FILL_ATTRS		;6260  ; Fill row 0: yellow on black -> A becomes $0F
	ld b,0c0h		;6263  ; B = 192 bytes (6 rows)
	call FILL_ATTRS		;6265  ; Fill rows 1-6: white on blue -> A becomes $06
	ld b,0e0h		;6268  ; B = 224 bytes (7 rows)
	call FILL_ATTRS		;626a  ; Fill rows 7-13: yellow on black -> A becomes $0F
	ld b,000h		;626d  ; B = 0 -> 256 bytes (8 rows)
	call FILL_ATTRS		;626f  ; Fill rows 14-21: white on blue -> A becomes $06
	ld b,040h		;6272  ; B = 64 bytes (2 rows)
	call FILL_ATTRS		;6274  ; Fill rows 22-23: yellow on black

; ==========================================================================
; WAIT FOR KEYPRESS ($6277)
; ==========================================================================
; Pauses on the loading screen until the player presses any key.
;
l6277h:
	call SCAN_KEY		;6277  ; Poll keyboard, A = key code (0 if no key)
	or a			;627a  ; Test if a key was pressed
	jr z,l6277h		;627b  ; No key -> keep waiting

; ==========================================================================
; GENERATE REVERSED FONT TABLE ($627D)
; ==========================================================================
; Creates a bit-reversed copy of 256 character glyphs at $FD33.
; For each byte value C ($80-$FF wrapping to $00-$7F), the 8 bits
; are reversed (MSB<->LSB) to produce horizontally mirrored glyphs.
; Used for right-facing sprites and mirrored text rendering.
;
	ld hl,lf34bh		;627d  ; HL = $F34B (new font base address)
	ld (09e0bh),hl		;6280  ; Update PRINT_TILE's font data pointer
	ld c,080h		;6283  ; C = $80 (starting character code)
	ld b,000h		;6285  ; B = 0 -> loop 256 times (all characters)
	ld hl,lfd33h		;6287  ; HL = $FD33 (reversed font table destination)

; --- Bit-reversal inner loop ---
; For each character code in C, reverses all 8 bits into A:
;   RR E shifts LSB of E into carry
;   RLA rotates carry into LSB of A
; After 8 iterations, A contains the bit-reversed byte.
;
l628ah:
	ld d,008h		;628a  ; D = 8 (bit counter)
	ld e,c			;628c  ; E = character code to reverse
l628dh:
	rr e		;628d  ; Shift E right: bit 0 -> carry
	rla			;628f  ; Rotate carry into A: carry -> bit 0
	dec d			;6290  ; Decrement bit counter
l6291h:
	jr nz,l628dh		;6291  ; Loop until all 8 bits reversed
l6293h:
	ld (hl),a			;6293  ; Store reversed byte into font table
	inc hl			;6294  ; Advance destination pointer
	inc c			;6295  ; Next character code ($80,$81,...$FF,$00,...$7F)
	djnz l628ah		;6296  ; Loop for all 256 characters

; ==========================================================================
; RANDOMIZE HIGH SCORE TABLE ($6298)
; ==========================================================================
; Uses the R register (which increments with each instruction fetch)
; as a source of pseudo-randomness. Selects one of up to 7 alternative
; high score name tables to display. If R AND 7 == 0, keeps defaults.
; This is an Easter egg: different runs show different default names
; (hip-hop artists, Durell staff, etc.) in the high score tables.
;
	ld a,r		;6298  ; A = R register (pseudo-random 0-127)
	and 007h		;629a  ; Mask to 0-7
	jr z,l62aeh		;629c  ; If 0, skip -> use default high score names
	ld hl,061b9h		;629e  ; HL = $61B9 (base for table selection)
l62a1h:
	inc h			;62a1  ; Move HL up one 256-byte page per index
	dec hl			;62a2  ; Fine-adjust pointer
	dec a			;62a3  ; Decrement selection counter
	jr nz,l62a1h		;62a4  ; Loop until target table reached
	ld de,SCORE_TABLE		;62a6  ; DE = SCORE_TABLE (active high score area)
	ld bc,000ffh		;62a9  ; BC = 255 bytes to copy
	ldir		;62ac  ; Copy selected name table -> active score area

; --- Jump to title screen ---
l62aeh:
	jp TITLE_SCREEN		;62ae  ; Start the game at the title/menu screen ($708C)

; ======================================================================
; FILL_ATTRS ($62B1)
; ======================================================================
; Fill B consecutive attribute bytes with value A, then XOR A with $09
; to alternate between two color schemes.
;
; On entry:
;   HL = attribute address in $5800-$5AFF range
;   A  = attribute byte (INK + PAPER + BRIGHT + FLASH)
;   B  = number of bytes to fill (0 = 256)
;
; On exit:
;   HL = advanced past filled area
;   A  = XORed with $09 (swaps INK bits 0-2 with $09 pattern)
;   B  = 0
;
; The XOR $09 trick alternates between two complementary color schemes:
;   $06 (yellow on black) XOR $09 = $0F (white on blue)
;   $0F (white on blue)   XOR $09 = $06 (yellow on black)
;
FILL_ATTRS:
	ld (hl),a			;62b1  ; Store attribute byte at current position
	inc hl			;62b2  ; Advance to next attribute cell
	djnz FILL_ATTRS		;62b3  ; Loop until B bytes filled
	xor 009h		;62b5  ; Toggle color scheme for next call
	ret			;62b7  ; Return with A = next color value
