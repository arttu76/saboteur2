; ======================================================================
; code_mainloop.asm
; ======================================================================
;
; Main Game Engine, Entity Processing & AI
;
; Address range: $890C-$940B (2816 bytes)
; Source binary: block7_main.bin (loaded at $620C)
;
; This is the heart of the game. Contains the main game loop (MAIN_LOOP
; at $8B13, 19 JP references) which runs once per frame and processes:
;   - Player input and movement
;   - All 101 entities (guards, pumas, projectiles, objects)
;   - Enemy AI with proximity detection and pathfinding
;   - Collision detection between entities and player
;   - Sprite rendering and animation sequencing
;   - Projectile spawning and movement
;   - Timer countdown and game-over logic
;
; Entity structure (12 bytes per entity, IX-indexed):
;   IX+$00: Type/flags (bit 7 = flipped/mirrored)
;   IX+$01: Y coordinate (0-$1D)
;   IX+$02: X screen cell (room number)
;   IX+$03: Map position low byte
;   IX+$04: Map position high byte
;   IX+$05: Start room / spawn param
;   IX+$06: Spawn Y position
;   IX+$07: Patrol start X low
;   IX+$08: Patrol start X high
;   IX+$09: Behavior bits (bit 7 = alternate, bits 0-6 = sprite type)
;   IX+$0A: Reserved
;   IX+$0B: Behavior state (0-15, indexes jump table at $8D1F)
;
; Behavior states:
;   0: Idle/patrol    4: Jumping       8: Climbing    12: Spawning
;   1: Guard alert    5: Shooting      9: Frozen      13: Despawn
;   2: Hit/damage     6: Guard chase  10: Invisible   14: Boss mode
;   3: Flee player    7: Ground slide 11: Falling     15: Reserved
;
; Cross-references:
;   Called from: 19 JP references throughout the codebase
;   Calls: DRAW_ENTITY_ALT, DRAW_OBJECT, PROCESS_INPUT, STASH_SEARCH,
;          UPDATE_SCORE, ANIM_FRAME_TBL, DRAW_ENTITY, ANIM_SEQ_DATA,
;          SWAP_SCREEN_BUFS, RENDER_SPRITE_RAW, GET_RANDOM, PRINT_TILE,
;          LOAD_GUARD_ANIM, UPDATE_FACING, ENTITY_FLIP_ANIM, FONT_LOOKUP
;   Self-modifying code at: $8A80, $8A82, $8A8B, $8FB4, $8FB7, $8FB9
;
; Memory map:
;   $890C-$8925  Screen rectangle fill routine
;   $8928-$8969  Room-specific event lookup table (26 entries x 3 bytes)
;   $896A-$8A09  Room setup: object init, sprite data loading
;   $8A09-$8B10  Frame init: screen compositing, display messages
;   $8B13-$8CFD  MAIN_LOOP + entity processing core
;   $8CFE-$8D1E  ENTITY_FLIP_ANIM (swap normal/mirrored animation)
;   $8D1F-$8D46  Behavior jump table + state variables
;   $8D47-$8D56  Entity type configuration table
;   $8D57-$8E9A  Behavior handler routines (door, ladder, combat, etc.)
;   $8E9B-$8EB0  GET_RANDOM + projectile velocity data
;   $8EB1-$8F8A  Guard rendering and projectile movement
;   $8F8B-$8FCA  SETUP_ANIM_PTR (configure sprite pipeline)
;   $8FCD-$901B  Entity state cleanup (off-screen/out-of-range)
;   $901C-$905A  End-of-entity-loop: player sprite setup
;   $905F-$93A8  Post-frame: projectile spawning, timer, game-over
;   $93AB-$93F8  MOVE_LEFT/RIGHT/UP/DOWN movement routines
;   $93FA-$940B  Data: "TIME  SPORT" text + state variables
;
; ======================================================================

b12_end:

; BLOCK 'b13' (start 0x890c end 0x940c)
b13_start:

; ==========================================================================
; SCREEN RECTANGLE FILL ($890C)
; ==========================================================================
; Fills a rectangular area of the screen with a single tile byte.
; Used for drawing solid blocks (walls, floors, doors).
;
; On entry (from data pointed to by HL, advanced before call):
;   B = number of rows
;   C = fill byte (tile/color value)
;   D = number of columns per row
;   HL = destination screen address
;
; Each row is 32 bytes ($20) apart in screen memory.
;
	inc hl			;890c  ; Skip to rows field
	ld b,(hl)			;890d  ; B = number of rows to fill
	inc hl			;890e  ; Next field
	ld c,(hl)			;890f  ; C = fill byte value
	inc hl			;8910  ; Next field
	ld a,(hl)			;8911  ; A = destination address low byte
	inc hl			;8912  ; Next field
	push hl			;8913  ; Save data pointer for return
	ld h,(hl)			;8914  ; H = destination address high byte
	ld l,a			;8915  ; HL = destination screen address
l8916h:
	push de			;8916  ; Save column count (D = width)
l8917h:
	push hl			;8917  ; Save row start address
l8918h:
	ld (hl),c			;8918  ; Write fill byte to screen
	inc hl			;8919  ; Next column
	dec d			;891a  ; Decrement column counter
	jr nz,l8918h		;891b  ; Loop until row complete
	pop hl			;891d  ; Restore row start address
	ld de,00020h		;891e  ; DE = 32 (one screen row stride)
	add hl,de			;8921  ; HL = next row start
	pop de			;8922  ; Restore column count
	djnz l8916h		;8923  ; Loop until all rows filled
	jp STATE_JUMP_TBL		;8925  ; Return to state machine dispatcher
; ==========================================================================
; ROOM-SPECIFIC EVENT TABLE ($8928)
; ==========================================================================
; Data table with 26 entries, each 3 bytes:
;   Byte 0: Room X coordinate to match against $9942
;   Byte 1: Room Y coordinate to match against $9943
;   Byte 2: Handler index (into STATE_JUMP_TABLE_2 at $7777)
;
; z80dasm has disassembled these data bytes as instructions.
; The bytes are actually lookup data for room-specific events
; (doors, switches, special animations, etc.)
;
l8928h:
	dec de			;8928  ; Data: room_x=$1B, room_y=$07
	rlca			;8929
	ld b,(hl)			;892a  ; Data: handler=$46, room_x=$00
	nop			;892b
	inc c			;892c  ; Data: room_y=$0C, handler=$47
	ld b,a			;892d
	dec de			;892e  ; Data: room_x=$1B, room_y=$00
	nop			;892f
	ld c,b			;8930  ; Data: handler=$48, room_x=$16/$18
	ld d,018h		;8931
	ld c,e			;8933  ; Data: handler=$4B
	ld d,018h		;8934
	ld c,h			;8936  ; Data: handler=$4C
	dec de			;8937
	ld c,04bh		;8938
	dec de			;893a
	ld c,04ch		;893b
	dec c			;893d
	ld c,05eh		;893e
	dec de			;8940
	dec c			;8941
	jr c,l895fh		;8942
	add hl,bc			;8944
	add hl,sp			;8945
	dec de			;8946
	dec b			;8947
	dec hl			;8948
	rlca			;8949
	dec de			;894a
	jr c,l895fh		;894b
	add hl,de			;894d
	ld b,b			;894e
	add hl,de			;894f
	inc c			;8950
	ld b,b			;8951
	rrca			;8952
	inc e			;8953
	jr c,$+17		;8954
	dec b			;8956
	jr c,$+17		;8957
	inc e			;8959
	ld b,b			;895a
	dec c			;895b
	inc bc			;895c
	ld b,e			;895d
	inc de			;895e
l895fh:
	ld e,041h		;895f
	dec e			;8961
	rra			;8962
	ld b,d			;8963
	ld d,016h		;8964
	ld b,h			;8966
	ld d,016h		;8967
	ld b,l			;8969  ; End of 26-entry event table

; ==========================================================================
; ROOM SETUP & EVENT DISPATCH ($896A)
; ==========================================================================
; On room entry, scans the event table to find handlers for the
; current room coordinates. For each matching entry, looks up the
; handler address from STATE_JUMP_TABLE_2 and calls it via JP (HL).
;
l896ah:
	ld hl,l8999h		;896a  ; HL = return address (after handler executes)
	ld (STATE_JUMP_TBL+1),hl		;896d  ; Patch state machine return point
	ld ix,l8928h		;8970  ; IX -> event table start
	ld b,01ah		;8974  ; B = 26 entries to scan

; --- Scan event table for current room ---
l8976h:
	ld a,(09942h)		;8976  ; A = current room X coordinate
	cp (ix+000h)		;8979  ; Does event X match current room?
	jr nz,l899dh		;897c  ; No match -> skip to next entry
	ld a,(09943h)		;897e  ; A = current room Y coordinate
	cp (ix+001h)		;8981  ; Does event Y match?
	jr nz,l899dh		;8984  ; No match -> skip to next entry

; --- Found matching event: dispatch handler ---
	ld l,(ix+002h)		;8986  ; L = handler index from event table
	ld h,000h		;8989  ; HL = handler index (0-255)
	add hl,hl			;898b  ; HL = index * 2 (word-sized entries)
	ld de,l7777h		;898c  ; DE = STATE_JUMP_TABLE_2 base address
	add hl,de			;898f  ; HL -> handler address in jump table
	ld a,(hl)			;8990  ; A = handler address low byte
	inc hl			;8991  ; Next byte
	ld h,(hl)			;8992  ; H = handler address high byte
	ld l,a			;8993  ; HL = handler routine address
	push ix		;8994  ; Save table position (for continued scanning)
	push bc			;8996  ; Save remaining entry count
	push hl			;8997  ; Push handler address as "return" target
	jp (hl)			;8998  ; Jump to handler (will RET back to l8999h)

; --- Handler returns here ---
; After the room event handler runs, it RETs back here.
; We restore the scan position (IX, B) and continue checking
; remaining event table entries for this room.
;
l8999h:
	pop hl			;8999  ; (discard — was handler addr pushed at $8997)
	pop bc			;899a  ; Restore remaining entry count
	pop ix		;899b  ; Restore event table scan position
l899dh:
	inc ix		;899d  ; Advance IX past this 3-byte entry
	inc ix		;899f
	inc ix		;89a1
	djnz l8976h		;89a3  ; Loop until all 26 entries scanned

; --- Restore default state machine handler ---
	ld hl,l7770h		;89a5  ; HL = default state handler address
	ld (STATE_JUMP_TBL+1),hl		;89a8  ; Restore state jump table return vector

; ==========================================================================
; SPECIAL ROOM $1F: CLEAR TILE OVERLAYS ($89AB)
; ==========================================================================
; Room $1F (the final escape area) has special tile masking: any tile
; in the overlay buffer below $C7 is cleared to zero. This removes
; decorative overlays so the escape route is visible.
;
	ld a,(09942h)		;89ab  ; A = current room X coordinate
	cp 01fh		;89ae  ; Is this room $1F (rightmost column)?
	jr nz,l89c9h		;89b0  ; No -> skip overlay clearing

	ld bc,00100h		;89b2  ; BC = 256 bytes to scan
	ld hl,l666bh		;89b5  ; HL -> tile overlay source buffer
	ld de,l68abh		;89b8  ; DE -> tile overlay destination buffer
l89bbh:
	ld a,(hl)			;89bb  ; A = overlay tile value
	cp 0c7h		;89bc  ; Is tile >= $C7 (solid/structural)?
	jr nc,l89c2h		;89be  ; Yes -> keep it, skip clearing
	xor a			;89c0  ; A = 0 (clear tile)
	ld (de),a			;89c1  ; Clear overlay tile in destination
l89c2h:
	dec hl			;89c2  ; Move backwards through buffers
	dec de			;89c3
	dec bc			;89c4  ; Decrement byte counter
	ld a,b			;89c5  ; Test if BC == 0
	or c			;89c6
	jr nz,l89bbh		;89c7  ; Loop until all 256 bytes scanned
; ==========================================================================
; OBJECT CONFIGURATION TABLE SCAN ($89C9)
; ==========================================================================
; Scans the object config table at $86FD (33 entries x 14 bytes) to find
; entries matching the current room. For each match, sets up the object's
; tile pointers and marks the tiles as "dirty" for rendering.
; If the object tile is $FF (uninitialized), fills it with default tiles
; $29/$2A (door/gate graphics).
;
l89c9h:
	ld ix,l86fdh		;89c9  ; IX -> object config table (33 entries x 14 bytes)
	ld b,021h		;89cd  ; B = 33 entries to scan
l89cfh:
	ld a,(09942h)		;89cf  ; A = current room X coordinate
	cp (ix+000h)		;89d2  ; Does entry X match current room?
	jr nz,l8a02h		;89d5  ; No -> skip to next entry
	ld a,(09943h)		;89d7  ; A = current room Y coordinate
	cp (ix+001h)		;89da  ; Does entry Y match?
	jr nz,l8a02h		;89dd  ; No -> skip to next entry

; --- Found matching object entry ---
	ld l,(ix+002h)		;89df  ; HL = object's tile map pointer (from entry bytes 2-3)
	ld h,(ix+003h)		;89e2
	ld a,(hl)			;89e5  ; A = current tile at object position
	inc a			;89e6  ; Test if $FF (empty/uninitialized)
	jr nz,l89efh		;89e7  ; Not $FF -> tile already placed, skip init

; --- Initialize empty object with default gate tiles ---
	ld (hl),029h		;89e9  ; Place tile $29 (left door/gate piece)
	inc hl			;89eb
	ld (hl),02ah		;89ec  ; Place tile $2A (right door/gate piece)
	dec hl			;89ee  ; Restore HL to first tile position

l89efh:
; --- Mark object tiles as dirty for rendering ---
	ld de,lfdc0h		;89ef  ; DE = offset to dirty flag buffer ($FDC0)
	add hl,de			;89f2  ; HL -> dirty flag for this tile position
	ld (hl),064h		;89f3  ; Mark first tile dirty (value $64 = 100)
	inc hl			;89f5
	ld (hl),064h		;89f6  ; Mark second tile dirty

; --- Set sprite base pointer from this entry ---
	push ix		;89f8  ; Copy IX to HL
	pop hl			;89fa
	inc hl			;89fb  ; Skip past first 4 bytes (room coords + ptr)
	inc hl			;89fc
	inc hl			;89fd
	inc hl			;89fe  ; HL -> entry byte 4 (sprite data)
	ld (SPRITE_BASE),hl		;89ff  ; Set active sprite base pointer

l8a02h:
	ld de,0000eh		;8a02  ; DE = 14 (entry stride)
	add ix,de		;8a05  ; IX -> next table entry
	djnz l89cfh		;8a07  ; Loop for all 33 entries
; ==========================================================================
; SCREEN BUFFER FLIP & OVERLAY RENDERING ($8A09)
; ==========================================================================
; Swap the double-buffered screen, then check for special overlays
; that need to be drawn (sign text, large graphics). The overlay type
; is stored at l7ec3h: 1=single tile, 2=large 18-tile block, 3=6-tile block.
;
	call SWAP_SCREEN_BUFS		;8a09  ; Flip front/back screen buffers
	ld a,(l7ec3h)		;8a0c  ; A = overlay type for this room
	dec a			;8a0f  ; Test for type 1
	jr nz,l8a1ch		;8a10  ; Not type 1 -> check type 2

; --- Overlay type 1: single tile at specific position ---
	ld hl,0000fh		;8a12  ; HL = tile data offset ($000F)
	ld de,05033h		;8a15  ; DE = screen address (row 24, col 19)
	ld c,001h		;8a18  ; C = 1 tile to draw
	jr l8a2dh		;8a1a  ; Jump to common PRINT_TILE call

l8a1ch:
	dec a			;8a1c  ; Test for type 2
	jr nz,l8a38h		;8a1d  ; Not type 2 -> check type 3

; --- Overlay type 2: large 18-tile sign/banner ---
	ld hl,00020h		;8a1f  ; HL = $0020 (tile stride = 32 columns)
	ld (09e20h),hl		;8a22  ; Set PRINT_TILE column stride to 32
	ld hl,l7ed4h		;8a25  ; HL -> sign tile data (18 tiles)
	ld de,04013h		;8a28  ; DE = screen address (row 0, col 19)
	ld c,012h		;8a2b  ; C = 18 tiles to draw (6x3 block)

l8a2dh:
	call PRINT_TILE		;8a2d  ; Draw the overlay tiles
	ld hl,00001h		;8a30  ; HL = 1 (restore default stride)
	ld (09e20h),hl		;8a33  ; Reset PRINT_TILE stride to 1
	jr l8a6fh		;8a36  ; Continue to frame init

l8a38h:
	dec a			;8a38  ; Test for type 3
	jr nz,l8a6fh		;8a39  ; Not type 3 -> no overlay, skip

; --- Overlay type 3: 6-tile sign ---
	ld hl,00020h		;8a3b  ; HL = $0020 (tile stride = 32)
	ld (09e20h),hl		;8a3e  ; Set PRINT_TILE column stride to 32
	ld hl,l7ee6h		;8a41  ; HL -> sign tile data (6 tiles)
	ld de,04013h		;8a44  ; DE = screen address (row 0, col 19)
	ld c,006h		;8a47  ; C = 6 tiles (2x3 block)
	jr l8a2dh		;8a49  ; Draw and restore stride
; ==========================================================================
; COPY_SPRITE_DATA ($8A4B)
; ==========================================================================
; Copies 4 bytes from DE to the sprite destination buffer, then marks
; the corresponding 4 tiles as dirty in the refresh flag buffer.
;
; On entry:
;   DE = source data pointer
; On exit:
;   HL = past end of dirty flags
;
COPY_SPRITE_DATA:
	ld hl,(SPRITE_DEST_PTR)		;8a4b  ; HL -> sprite tile destination
	ld b,004h		;8a4e  ; B = 4 bytes to copy
l8a50h:
	ld a,(de)			;8a50  ; A = source tile byte
	ld (hl),a			;8a51  ; Store to destination
	inc hl			;8a52  ; Next destination byte
	inc de			;8a53  ; Next source byte
	djnz l8a50h		;8a54  ; Copy all 4 bytes
	ld de,lfdc0h		;8a56  ; DE = offset to dirty flag buffer ($FDC0)
	add hl,de			;8a59  ; HL -> dirty flags after last copied tile
	ld b,004h		;8a5a  ; B = 4 flags to set
l8a5ch:
	dec hl			;8a5c  ; Move backwards through dirty flags
	ld (hl),001h		;8a5d  ; Mark tile as dirty (needs redraw)
	djnz l8a5ch		;8a5f  ; Set all 4 dirty flags
	ret			;8a61

; ==========================================================================
; SPRITE ANIMATION DATA AREA ($8A62-$8A6E)
; ==========================================================================
; Self-modifying data used by the scrolling/animation system.
; SPRITE_DEST_PTR: 2-byte pointer to current tile write destination.
; l8a64h: animation direction flag (0=forward, 1=reverse).
; l8a65h: animation frame counter (0-18).
; l8a66h-l8a69h: 4 tile bytes for horizontal sprite strip.
; l8a6ah-l8a6dh: 4 tile bytes for vertical sprite strip.
; l8a6eh: flag byte.
;
SPRITE_DEST_PTR:
	ld e,c			;8a62  ; DATA: $59 $66 -> pointer = $6659
	ld h,(hl)			;8a63
l8a64h:
	nop			;8a64  ; DATA: $00 = animation direction (0=forward)
l8a65h:
	ld a,(bc)			;8a65  ; DATA: $0A = animation frame counter
l8a66h:
	ld l,a			;8a66  ; DATA: 4 horizontal tile bytes ($6F $6F $6F $6F)
	ld l,a			;8a67
	ld l,a			;8a68
	ld l,a			;8a69
l8a6ah:
	jp nc,ld3d3h		;8a6a  ; DATA: 4 vertical tile bytes ($D2 $D3 $D3 $D5)
	push de			;8a6d
l8a6eh:
	nop			;8a6e  ; DATA: $00 = flag byte
; ==========================================================================
; FRAME INITIALIZATION ($8A6F)
; ==========================================================================
; Called at the start of each frame to:
;   1. Initialize room tile rendering
;   2. Clear the player sprite area
;   3. Set up dirty flags for the player's position
;   4. Check for special room tile overlays (lift labels, score text)
;
l8a6fh:
	call 0aa27h		;8a6f  ; Initialize room tile rendering subsystem

; --- Clear the player sprite area in tile buffer ---
; Fills 576 bytes ($023F + 1) starting at GAME_ENTRY ($620C) with zeros.
; This clears the tile workspace used for compositing the player sprite.
;
	ld hl,GAME_ENTRY		;8a72  ; HL = $620C (player sprite tile workspace)
	ld de,l620dh		;8a75  ; DE = $620D (HL + 1, for LDIR fill)
	ld bc,0023fh		;8a78  ; BC = 575 bytes (576 total with initial store)
	ld (hl),000h		;8a7b  ; Clear first byte
	ldir		;8a7d  ; Fill remaining 575 bytes with zero

; --- Mark player position tiles as dirty ---
; Sets dirty flags in the refresh buffer so the player area gets redrawn.
; B = number of tiles to mark (self-modifying: $8A80 is patched).
;
	ld b,001h		;8a7f  ; B = 1 tile (SELF-MODIFYING: patched by $8A8E)
	ld hl,l6b0ch		;8a81  ; HL -> player base map position (SELF-MODIFYING: $8A82)
	ld de,lf700h		;8a84  ; DE = offset to dirty flag buffer ($F700)
	add hl,de			;8a87  ; HL -> dirty flag for player's tile
	ld a,001h		;8a88  ; A = 1 (dirty flag value)
l8a8ah:
	ld (hl),a			;8a8a  ; Set dirty flag
l8a8bh:
	inc hl			;8a8b  ; Next tile (SELF-MODIFYING: patched to INC/DEC HL)
	djnz l8a8ah		;8a8c  ; Mark all player tiles dirty
	ld (08a80h),a		;8a8e  ; Patch tile count at $8A80 for next frame

; --- Check room type for special tile overlays ---
; Read the room handler pointer to determine what kind of room this is.
; Room type $3A -> copy " LIFT " text overlay.
; Room type $3C -> copy score digits overlay.
;
	ld hl,(07747h)		;8a91  ; HL = room draw handler pointer (self-modifying)
	ld a,(hl)			;8a94  ; A = room type byte
	cp 03ah		;8a95  ; Is it type $3A (lift room)?
	jr nz,l8aa4h		;8a97  ; No -> check next type

; --- Copy " LIFT " label tiles to room buffer ---
	ld b,006h		;8a99  ; B = 6 tiles to copy (" LIFT ")
	ld de,l8d39h		;8a9b  ; DE -> " LIFT " tile data at $8D39
	ld hl,l66edh		;8a9e  ; HL -> destination in room tile buffer
	call COPY_DATA_BLK		;8aa1  ; Copy 6 tiles

l8aa4h:
	ld a,(hl)			;8aa4  ; A = room type byte (re-read)
	cp 03ch		;8aa5  ; Is it type $3C (score display room)?
	jr nz,l8ab4h		;8aa7  ; No -> check next type

; --- Copy score digits to room buffer ---
	ld b,006h		;8aa9  ; B = 6 tiles to copy (score digits "000110")
	ld de,l8d39h		;8aab  ; DE -> " LIFT " data (reused as temp - overwritten)
	ld hl,l66f8h		;8aae  ; HL -> destination in room tile buffer
	call COPY_DATA_BLK		;8ab1  ; Copy 6 tiles
; --- Room type $9E: scrolling animation (conveyor/water) ---
l8ab4h:
	ld a,(hl)			;8ab4  ; A = room type byte
	cp 09eh		;8ab5  ; Is it type $9E (scrolling animation room)?
	jr nz,l8af1h		;8ab7  ; No -> skip scrolling logic

; --- Update scrolling tile strip (horizontal) ---
	ld de,l8a66h		;8ab9  ; DE -> 4-byte horizontal tile strip data
	call COPY_SPRITE_DATA		;8abc  ; Copy strip to destination + mark dirty

; --- Advance or reverse scroll animation ---
; l8a64h: direction flag (0=reverse/left, 1=forward/right)
; l8a65h: frame counter (cycles 0-18)
;
	ld a,(l8a64h)		;8abf  ; A = scroll direction (0=reverse, nonzero=forward)
	or a			;8ac2  ; Test direction
	ld hl,l8a65h		;8ac3  ; HL -> frame counter
	jr z,l8adbh		;8ac6  ; Direction 0 -> go to reverse branch

; --- Forward scroll: increment counter, advance destination ---
	inc (hl)			;8ac8  ; Increment frame counter
	ld a,013h		;8ac9  ; A = 19 (max frame index)
	cp (hl)			;8acb  ; Has counter reached 19?
	ld hl,(SPRITE_DEST_PTR)		;8acc  ; HL = current sprite destination
	inc hl			;8acf  ; Advance destination by 1 tile
	ld (SPRITE_DEST_PTR),hl		;8ad0  ; Store updated destination
	jr nz,l8aebh		;8ad3  ; Counter not at max -> continue

; --- Forward reached end: reverse direction ---
	ld hl,l8a64h		;8ad5  ; HL -> direction flag
	dec (hl)			;8ad8  ; Set direction to 0 (reverse)
	jr l8aebh		;8ad9  ; Continue to vertical strip copy

; --- Reverse scroll: decrement counter, retreat destination ---
l8adbh:
	dec (hl)			;8adb  ; Decrement frame counter
	xor a			;8adc  ; A = 0
	cp (hl)			;8add  ; Has counter reached 0?
	ld hl,(SPRITE_DEST_PTR)		;8ade  ; HL = current sprite destination
	dec hl			;8ae1  ; Retreat destination by 1 tile
	ld (SPRITE_DEST_PTR),hl		;8ae2  ; Store updated destination
	jr nz,l8aebh		;8ae5  ; Counter not at 0 -> continue

; --- Reverse reached start: switch to forward direction ---
	ld hl,l8a64h		;8ae7  ; HL -> direction flag
	inc (hl)			;8aea  ; Set direction to 1 (forward)

; --- Copy vertical tile strip ---
l8aebh:
	ld de,l8a6ah		;8aeb  ; DE -> 4-byte vertical tile strip data
	call COPY_SPRITE_DATA		;8aee  ; Copy strip to destination + mark dirty
; ==========================================================================
; PLAYER SPRITE RENDERING & ENTITY STATE CHECK ($8AF1)
; ==========================================================================
; Draw the player sprite, then check if the entity processing state
; has changed (triggers room transition or special handling).
;
l8af1h:
	call ANIM_FRAME_TBL		;8af1  ; Set up animation frame pointers
	call DRAW_OBJECT		;8af4  ; Draw the player/object sprite
	call ANIM_SEQ_DATA		;8af7  ; Advance animation sequence

; --- Check for entity state change (room transition trigger) ---
	ld b,000h		;8afa  ; B = 0 (default: no state change)
	ld a,(lae15h)		;8afc  ; A = room transition flag
	cp 064h		;8aff  ; Is it $64 (transition active)?
	jr nz,l8b07h		;8b01  ; No -> skip, keep B=0
	ld hl,(SPRITE_BASE)		;8b03  ; HL -> sprite configuration table
	ld b,(hl)			;8b06  ; B = new entity state from sprite config

l8b07h:
	ld a,b			;8b07  ; A = proposed new entity state
	ld hl,l9409h		;8b08  ; HL -> current entity sub-state
	cp (hl)			;8b0b  ; Has state changed?
	ld (hl),a			;8b0c  ; Update to new state
	call nz,sub_b0d7h		;8b0d  ; If changed -> handle room transition

; --- Soft reset: restart from address $0000 ---
; This restarts the game loop from the beginning (after initialization).
	jp 00000h		;8b10  ; Jump to Z80 reset vector (restarts game)
; ==========================================================================
; MAIN GAME LOOP ($8B13)
; ==========================================================================
; Executes once per frame. This is the core game loop with 19 JP references
; from around the codebase. Each iteration:
;   1. Renders player sprite from previous frame's state
;   2. Processes player input (keyboard/joystick)
;   3. Checks stash interaction (picking up items)
;   4. Cycles rendering buffers (4-phase and 3-phase rotation)
;   5. Processes all 101 entities (guards, pumas, projectiles)
;   6. Handles projectile spawning, timer countdown, game-over
;   7. Returns to l8a6fh for screen flip and next frame
;
MAIN_LOOP:
	call DRAW_ENTITY_ALT		;8b13  ; Draw player sprite (from last frame's position)
	call DRAW_OBJECT		;8b16  ; Draw current room objects
	call PROCESS_INPUT		;8b19  ; Read keyboard/joystick and update player state

; --- Check if player is at a stash location ---
; PLAYER_POS range check: only search if position is valid (0 < pos+7 < 8
; is impossible, so this checks pos is within 1-7 range... effectively
; testing if player is in a valid stash interaction zone).
;
	ld a,(PLAYER_POS)		;8b1c  ; A = player X position
	add a,007h		;8b1f  ; A = pos + 7
	cp 008h		;8b21  ; Is result < 8? (i.e., was pos = 0 or 1?)
	jr c,l8b36h		;8b23  ; Yes -> not at stash, skip search

; --- Search for stash at player position ---
	ld hl,(PLAYER_POS_PTR)		;8b25  ; HL = player's map position pointer
	ld de,l66aeh		;8b28  ; DE = stash data buffer offset
	call STASH_SEARCH		;8b2b  ; Search for stash item at this position
	add hl,de			;8b2e  ; HL -> stash item at player position
	xor a			;8b2f  ; A = 0
	cp (hl)			;8b30  ; Is stash item zero (empty)?
	ld b,002h		;8b31  ; B = 2 (score value for picking up item)
	call z,UPDATE_SCORE		;8b33  ; If empty -> award 2 points

; ==========================================================================
; RENDERING BUFFER ROTATION ($8B36)
; ==========================================================================
; The game uses multiple rendering buffers cycled in rotation to create
; smooth animation. Two independent counters manage different aspects:
; - 4-phase counter (lddf1h): cycles 0-3 through sprite buffers
; - 3-phase counter (lddf8h): cycles 0-2 through tile buffers
; Each counter indexes a lookup table of buffer addresses.
;
l8b36h:
; --- 4-phase sprite buffer rotation ---
	ld a,(lddf1h)		;8b36  ; A = current 4-phase counter
	inc a			;8b39  ; Advance counter
	and 003h		;8b3a  ; Wrap to 0-3 range
	ld (lddf1h),a		;8b3c  ; Store updated counter
	add a,a			;8b3f  ; A = counter * 2 (word index)
	ld l,a			;8b40  ; HL = index into buffer address table
	ld h,000h		;8b41
	ld de,ldde7h		;8b43  ; DE -> 4-entry sprite buffer table
	add hl,de			;8b46  ; HL -> current entry
	ld a,(hl)			;8b47  ; Load buffer address low byte
	inc hl			;8b48
	ld h,(hl)			;8b49  ; Load buffer address high byte
	ld l,a			;8b4a  ; HL = current sprite buffer address
	ld (lddefh),hl		;8b4b  ; Store as active sprite buffer

; --- 3-phase tile buffer rotation ---
	ld a,(lddf8h)		;8b4e  ; A = current 3-phase counter
	inc a			;8b51  ; Advance counter
	cp 003h		;8b52  ; Has it reached 3?
	jr nz,l8b57h		;8b54  ; No -> keep value
	xor a			;8b56  ; Yes -> wrap to 0
l8b57h:
	ld (lddf8h),a		;8b57  ; Store updated counter
	add a,a			;8b5a  ; A = counter * 2 (word index)
	ld l,a			;8b5b  ; HL = index into buffer table
	ld h,000h		;8b5c
	ld de,lddf2h		;8b5e  ; DE -> 3-entry tile buffer table
	add hl,de			;8b61  ; HL -> current entry
	ld a,(hl)			;8b62  ; Load buffer address low byte
	inc hl			;8b63
	ld h,(hl)			;8b64  ; Load buffer address high byte
	ld l,a			;8b65  ; HL = current tile buffer address
	ld (l8e4ah+1),hl		;8b66  ; Patch into behavior handler (self-modifying)
; ==========================================================================
; ENTITY PROCESSING LOOP ($8B69)
; ==========================================================================
; Iterates through all 101 entities (guards, pumas, projectiles, etc.).
; For each entity, checks behavior state, handles animation, tests for
; proximity to player, runs AI logic, and dispatches to behavior handlers.
;
; Entity structure (12 bytes per entity, IX-indexed):
;   IX+$00: Room X coordinate (bit 7 = horizontally flipped)
;   IX+$01: Y position within room (0-$1D)
;   IX+$02: Room Y coordinate
;   IX+$03: Map pointer low byte
;   IX+$04: Map pointer high byte
;   IX+$05: Start room X / spawn parameter
;   IX+$06: Start Y position (for respawning)
;   IX+$07: Patrol boundary X low
;   IX+$08: Patrol boundary X high
;   IX+$09: Behavior bits (bit 7 = alternate type, bits 0-6 = sprite ID)
;   IX+$0A: Reserved
;   IX+$0B: Behavior state (0-12, indexes jump table at $8D1F)
;
	ld ix,l9436h		;8b69  ; IX -> first entity in entity array
	ld b,065h		;8b6d  ; B = 101 entities to process
l8b6fh:
	push bc			;8b6f  ; Save entity loop counter

; --- Load default sprite dimensions (7 wide x 6 high) ---
; If this entity is a guard (states 1,4,6,9,10), LOAD_GUARD_ANIM
; overrides these to smaller guard sprite dimensions (3x4).
;
	ld bc,00706h		;8b70  ; B=7 (width), C=6 (height) — player sprite size

; --- Check if entity needs guard-specific animation loading ---
; States 1, 6, 4, 9, 10 are guard/enemy states that use smaller sprites.
;
	ld a,(ix+00bh)		;8b73  ; A = entity behavior state
	cp 001h		;8b76  ; State 1: patrol/idle guard?
	call z,LOAD_GUARD_ANIM		;8b78  ; Yes -> load guard animation (sets A=0)
	cp 006h		;8b7b  ; State 6: attacking guard?
	call z,LOAD_GUARD_ANIM		;8b7d
	cp 004h		;8b80  ; State 4: jumping entity?
	call z,LOAD_GUARD_ANIM		;8b82
	cp 009h		;8b85  ; State 9: stunned entity?
	call z,LOAD_GUARD_ANIM		;8b87
	cp 00ah		;8b8a  ; State 10: recovering entity?
	call z,LOAD_GUARD_ANIM		;8b8c

; --- Update entity facing direction and animation flip ---
	call UPDATE_FACING		;8b8f  ; Set entity facing based on movement
	call ENTITY_FLIP_ANIM		;8b92  ; Swap animation pointers if entity is flipped
; --- Set up entity map pointer for rendering subsystem ---
; Copy IX+3 (map pointer) to the rendering and collision systems.
;
	push ix		;8b95  ; Copy IX to HL
	pop hl			;8b97
	inc hl			;8b98  ; Skip past IX+0, IX+1, IX+2
	inc hl			;8b99
	inc hl			;8b9a  ; HL -> IX+3 (map pointer)
	ld (0ad90h),hl		;8b9b  ; Set rendering map pointer
	ld (0b9a4h),hl		;8b9e  ; Set collision map pointer

; --- Check if entity is in the current room ---
; Compare entity's room coordinates with the player's current room.
; Only visible entities (same room) get drawn.
;
	ld a,(09942h)		;8ba1  ; A = current room X
	ld b,a			;8ba4  ; B = room X for comparison
	ld a,(ix+000h)		;8ba5  ; A = entity room X (bit 7 = flip flag)
	and 07fh		;8ba8  ; Mask off flip flag, keep room X
	cp b			;8baa  ; Does entity room X match current room?
	jr nz,l8bbeh		;8bab  ; No -> skip rendering

	ld a,(09943h)		;8bad  ; A = current room Y
	cp (ix+002h)		;8bb0  ; Does entity room Y match?
	jr nz,l8bbeh		;8bb3  ; No -> skip rendering

; --- Entity is in current room: render it ---
	call ANIM_FRAME_TBL		;8bb5  ; Set up animation frame pointers
	call DRAW_ENTITY		;8bb8  ; Draw entity sprite to screen
	call ANIM_SEQ_DATA		;8bbb  ; Advance animation sequence
; ==========================================================================
; PROXIMITY CHECK ($8BBE)
; ==========================================================================
; Check if this entity is within ±3 rooms horizontally and ±6 rooms
; vertically of the player. Entities outside this radius skip all AI
; and behavior processing (jump directly to state cleanup at $8FCD).
;
l8bbeh:
	ld a,(09942h)		;8bbe  ; A = current room X
	ld b,a			;8bc1  ; B = room X
	ld a,(ix+000h)		;8bc2  ; A = entity room X (with flip flag)
	and 07fh		;8bc5  ; Mask off flip flag
	sub b			;8bc7  ; A = entity_X - room_X (signed distance)
	add a,003h		;8bc8  ; Shift to unsigned: A = distance + 3
	cp 006h		;8bca  ; Is distance < 6? (i.e., within ±3 rooms)
	jp nc,l8fcdh		;8bcc  ; Too far horizontally -> skip to cleanup

	ld a,(09943h)		;8bcf  ; A = current room Y
	sub (ix+002h)		;8bd2  ; A = room_Y - entity_Y (signed distance)
	add a,006h		;8bd5  ; Shift to unsigned: A = distance + 6
	cp 00ch		;8bd7  ; Is distance < 12? (i.e., within ±6 rooms)
	jp nc,l8fcdh		;8bd9  ; Too far vertically -> skip to cleanup
; ==========================================================================
; ENTITY MOVEMENT / PATROL LOGIC ($8BDC)
; ==========================================================================
; If entity is in states 0 or 1 (patrol/idle), process its movement.
; Higher states (2+) skip directly to the room visibility check.
; Movement involves comparing entity position against patrol boundaries
; and potentially reversing direction at edges.
;
	ld a,(ix+00bh)		;8bdc  ; A = entity behavior state
	cp 002h		;8bdf  ; Is state >= 2 (non-patrol)?
	jp nc,l8c7ah		;8be1  ; Yes -> skip movement, go to visibility check

; --- Set up movement variables ---
	ld a,(ix+001h)		;8be4  ; A = entity Y position
	ld b,a			;8be7  ; B = Y position (for boundary checks)
	ld h,(ix+004h)		;8be8  ; HL = entity map pointer
	ld l,(ix+003h)		;8beb
	ld d,0ffh		;8bee  ; D = $FF (movement decision flag: $FF=no decision)

; --- Check if entity is flipped (alternate patrol direction) ---
	ld a,(ix+000h)		;8bf0  ; A = entity room X (bit 7 = flip flag)
	bit 7,a		;8bf3  ; Is entity flipped?
	jr z,l8c0dh		;8bf5  ; No -> go to patrol direction check

; --- Flipped entity: random hesitation (75% chance to skip) ---
	ld a,r		;8bf7  ; A = R register (pseudo-random)
	and 003h		;8bf9  ; Mask to 0-3
	jr z,l8c0dh		;8bfb  ; If 0 (25% chance) -> proceed to direction check

; --- Flipped entity: check vertical position vs player ---
	inc d			;8bfd  ; D = 0 (preparing for vertical comparison)
	ld a,(ix+001h)		;8bfe  ; A = entity Y position
	add a,00ah		;8c01  ; A = entity Y + 10 (center offset)
	ld e,a			;8c03  ; E = entity center Y
	ld a,(PLAYER_Y)		;8c04  ; A = player Y position
	add a,00ah		;8c07  ; A = player Y + 10 (center offset)
	cp e			;8c09  ; Is player below entity?
	jr nc,l8c0dh		;8c0a  ; Player below -> skip, use default direction
	inc d			;8c0c  ; D = 1 (player is above -> move toward player)
; --- Patrol direction based on PLAYER_DIR ---
; PLAYER_DIR = 0: entity patrols forward (incrementing Y)
; PLAYER_DIR = 1: entity patrols backward (decrementing Y)
;
l8c0dh:
	ld a,(PLAYER_DIR)		;8c0d  ; A = player facing direction (0=right, 1=left)
	or a			;8c10  ; Is player facing right?
	jr z,l8c4eh		;8c11  ; Yes -> jump to forward patrol branch

; --- Backward patrol (PLAYER_DIR = 1): entity moves toward IX+05/06 ---
	ld a,(ix+002h)		;8c13  ; A = entity room Y
	cp (ix+005h)		;8c16  ; Has entity reached start room X?
	jr nz,l8c3ch		;8c19  ; No -> continue moving backward

	ld a,(ix+006h)		;8c1b  ; A = entity start Y position
	cp b			;8c1e  ; Has entity reached start Y?
	jr nz,l8c3ch		;8c1f  ; No -> continue moving backward

; --- Entity reached patrol boundary ---
l8c21h:
	dec d			;8c21  ; Decrement movement decision counter
	jr z,l8c2fh		;8c22  ; If D reaches 0 -> switch to rendering state

; --- Set entity to reverse behavior state ---
	ld a,(ix+00bh)		;8c24  ; A = current behavior state
	add a,a			;8c27  ; A = state * 2
	add a,007h		;8c28  ; A = state*2 + 7 (transition to reversed state)
l8c2ah:
	ld (ix+00bh),a		;8c2a  ; Set new behavior state
	jr l8c7ah		;8c2d  ; Jump to room visibility check

; --- At boundary with D=0: switch to entity rendering state (12) ---
l8c2fh:
	ld a,r		;8c2f  ; A = R register (pseudo-random)
	and 007h		;8c31  ; Mask to 0-7
	add a,003h		;8c33  ; A = random(3-10) (rendering frame count)
	ld (ENTITY_RNG_SEED),a		;8c35  ; Store as rendering countdown
	ld a,00ch		;8c38  ; A = 12 (STATE_RENDER)
	jr l8c2ah		;8c3a  ; Set state to 12

; --- Continue backward movement: decrement Y position ---
l8c3ch:
	dec b			;8c3c  ; B = Y - 1 (move up one cell)
	dec hl			;8c3d  ; HL = map pointer - 1
	ld a,0fch		;8c3e  ; A = $FC (underflow boundary)
	cp b			;8c40  ; Has Y underflowed past boundary?
	jr nz,l8c70h		;8c41  ; No -> store new position

; --- Y underflowed: wrap to next room (move to room above) ---
	ld b,01ch		;8c43  ; B = $1C (bottom of new room)
	ld de,00020h		;8c45  ; DE = 32 (one row in map layout)
	add hl,de			;8c48  ; Adjust map pointer for room wrap
	dec (ix+002h)		;8c49  ; Decrement entity room Y
	jr l8c70h		;8c4c  ; Store new position

; --- Forward patrol (PLAYER_DIR = 0): entity moves toward IX+07/08 ---
l8c4eh:
	ld a,(ix+002h)		;8c4e  ; A = entity room Y
	cp (ix+007h)		;8c51  ; Has entity reached patrol end X?
	jr nz,l8c60h		;8c54  ; No -> continue moving forward

	ld a,(ix+008h)		;8c56  ; A = patrol boundary Y
	cp b			;8c59  ; Has entity reached patrol end Y?
	jr nz,l8c60h		;8c5a  ; No -> continue moving forward

; --- At forward boundary: switch behavior (same as backward boundary) ---
	inc d			;8c5c  ; Increment decision counter
	jp l8c21h		;8c5d  ; Jump to boundary handler

; --- Continue forward movement: increment Y position ---
l8c60h:
	inc b			;8c60  ; B = Y + 1 (move down one cell)
	inc hl			;8c61  ; HL = map pointer + 1
	ld a,01eh		;8c62  ; A = $1E (overflow boundary = 30)
	cp b			;8c64  ; Has Y overflowed past boundary?
	jr nz,l8c70h		;8c65  ; No -> store new position

; --- Y overflowed: wrap to next room (move to room below) ---
	ld b,0feh		;8c67  ; B = $FE (top of new room — wraps visually)
	ld de,IM2_HANDLER_AREA		;8c69  ; DE = $FFE0 (-32) map offset for room-down wrap
	add hl,de			;8c6c  ; Adjust map pointer for room wrap
	inc (ix+002h)		;8c6d  ; Increment entity room Y

; --- Store updated entity position ---
l8c70h:
	ld (ix+003h),l		;8c70  ; Store updated map pointer low byte
	ld (ix+004h),h		;8c73  ; Store updated map pointer high byte
	ld a,b			;8c76  ; A = updated Y position
	ld (ix+001h),a		;8c77  ; Store entity Y position
; ==========================================================================
; ROOM VISIBILITY CHECK & COMBAT ($8C7A)
; ==========================================================================
; Second room check: verify entity is still in the current room, render it,
; then check for combat interaction with the player.
;
l8c7ah:
	ld a,(09942h)		;8c7a  ; A = current room X
	ld b,a			;8c7d  ; B = room X
	ld a,(ix+000h)		;8c7e  ; A = entity room X (with flip flag)
	and 07fh		;8c81  ; Mask off flip flag
	cp b			;8c83  ; Same room X as player?
	jp nz,l8fcdh		;8c84  ; No -> skip to cleanup

	ld a,(09943h)		;8c87  ; A = current room Y
	cp (ix+002h)		;8c8a  ; Same room Y?
	jp nz,l8fcdh		;8c8d  ; No -> skip to cleanup

; --- Entity is in current room: render it ---
	call ANIM_FRAME_TBL		;8c90  ; Set animation frame pointers
	call DRAW_ENTITY		;8c93  ; Draw entity sprite
	call ANIM_SEQ_DATA		;8c96  ; Advance animation

; --- Determine entity combat type ---
; IX+09 bit 7 distinguishes entity types:
;   bit 7 clear -> type 1 (standard guard)
;   bit 7 set   -> type 2 (alternate/puma)
; l8d42h stores the "active combatant type" that the player is fighting.
;
	ld a,(ix+009h)		;8c99  ; A = entity behavior bits
	bit 7,a		;8c9c  ; Is entity alternate type?
	ld a,001h		;8c9e  ; A = 1 (standard guard type)
	jr z,l8ca3h		;8ca0  ; Not alternate -> type 1
	inc a			;8ca2  ; A = 2 (alternate entity type)

; --- Check if this entity type matches active combatant ---
l8ca3h:
	ld hl,l8d42h		;8ca3  ; HL -> active combatant type
	cp (hl)			;8ca6  ; Does this entity match?
	jr nz,l8ce9h		;8ca7  ; No -> skip combat, go to behavior dispatch

; --- Combat check: skip if entity is already in attack/death states ---
	ld a,(ix+00bh)		;8ca9  ; A = entity behavior state
	cp 005h		;8cac  ; State 5 (animation A)?
	jr z,l8ce9h		;8cae  ; Yes -> already in combat anim, skip
	cp 006h		;8cb0  ; State 6 (animation B)?
	jr z,l8ce9h		;8cb2  ; Yes -> already in combat anim, skip

; --- Hit detection: player is attacking this entity ---
	ld b,002h		;8cb4  ; B = 2 (animation step for hit effect)
	call ANIM_SEQ_ENTRY		;8cb6  ; Set hit animation
	call FONT_LOOKUP		;8cb9  ; Look up font/tile for hit effect

; --- Hit timer: decrement and check for kill ---
	ld hl,l8d3fh		;8cbc  ; HL -> entity hit timer
	dec (hl)			;8cbf  ; Decrement hit counter
	jr z,l8cc8h		;8cc0  ; If zero -> entity dies, proceed to kill

; --- Not dead yet: 12.5% chance to apply damage anyway ---
	ld a,r		;8cc2  ; A = R register (pseudo-random)
	and 007h		;8cc4  ; Mask to 0-7
	jr nz,l8ce9h		;8cc6  ; 87.5% chance: skip damage, go to dispatch

; --- Entity killed (or lucky hit) ---
l8cc8h:
	ld a,005h		;8cc8  ; A = 5 (reset hit timer to 5)
	ld (hl),a			;8cca  ; Reset hit timer

; --- Determine death behavior based on current state ---
; Guard states (1, 4, 9, 10) -> state 6 (guard death)
; Other states -> state 5 (standard death)
;
	ld a,(ix+00bh)		;8ccb  ; A = current behavior state
	cp 004h		;8cce  ; State 4 (jumping)?
	ld b,006h		;8cd0  ; B = 6 (guard death state)
	jr z,l8ce1h		;8cd2  ; Yes -> guard death
	cp 001h		;8cd4  ; State 1 (patrol)?
	jr z,l8ce1h		;8cd6  ; Yes -> guard death
	cp 009h		;8cd8  ; State 9 (stunned)?
	jr z,l8ce1h		;8cda  ; Yes -> guard death
	cp 00ah		;8cdc  ; State 10 (recovering)?
	jr z,l8ce1h		;8cde  ; Yes -> guard death
	dec b			;8ce0  ; B = 5 (standard death state)

l8ce1h:
	ld (ix+00bh),b		;8ce1  ; Set entity to death state (5 or 6)
	ld b,00ah		;8ce4  ; B = 10 (death animation frame)
	call ANIM_SEQ_ENTRY		;8ce6  ; Set death animation
; ==========================================================================
; BEHAVIOR STATE DISPATCH ($8CE9)
; ==========================================================================
; Look up the entity's current behavior state in the jump table at $8D1F
; and jump to the corresponding handler routine.
;
; Jump table entries (13 valid states):
;   State 0  -> $8D57: Patrol/idle (horizontal movement, then vertical)
;   State 1  -> $8E28: Vertical patrol (tries vertical first)
;   State 2  -> $8E74: Hit countdown (awards score, then resets to 0)
;   State 3  -> $8F4E: Expire countdown (awards 7 pts, resets to 0)
;   State 4  -> $8F7C: Instant score (awards 6 pts, resets to 1)
;   State 5  -> $8F44: Death animation A
;   State 6  -> $8F49: Death animation B
;   State 7  -> $8F18: Transition (sets state to 8)
;   State 8  -> $8F21: Reset + direction flip (sets state to 0)
;   State 9  -> $8F32: Transition (sets state to 10)
;   State 10 -> $8F3B: Reset + direction flip (sets state to 1)
;   State 11 -> $8F73: Transition (sets state to 3)
;   State 12 -> $8EB1: Entity rendering/sprite draw
;
l8ce9h:
	ld a,(ix+00bh)		;8ce9  ; A = entity behavior state (0-12)
	ld l,a			;8cec  ; L = state number
	ld h,000h		;8ced  ; HL = state (zero-extended)
	add hl,hl			;8cef  ; HL = state * 2 (word-sized entries)
	ld de,l8d1fh		;8cf0  ; DE -> behavior jump table base
	add hl,de			;8cf3  ; HL -> jump table entry for this state
	ld a,(hl)			;8cf4  ; A = handler address low byte
	inc hl			;8cf5
	ld h,(hl)			;8cf6  ; H = handler address high byte
	ld l,a			;8cf7  ; HL = handler routine address
	ld a,(PLAYER_DIR)		;8cf8  ; A = player direction (passed to handler)
	ld b,a			;8cfb  ; B = player direction (0=right, 1=left)
	or a			;8cfc  ; Set Z flag based on direction
	jp (hl)			;8cfd  ; Jump to behavior handler
; ==========================================================================
; ENTITY_FLIP_ANIM ($8CFE)
; ==========================================================================
; If entity has alternate type (IX+09 bit 7 set), swap the two bytes
; at ENTITY_RNG_SEED. This effectively swaps animation parameters
; between the primary and alternate entity animation sets.
;
; On entry:
;   IX -> current entity
; On exit:
;   ENTITY_RNG_SEED bytes swapped (if entity is alternate type)
;
ENTITY_FLIP_ANIM:
	ld a,(ix+009h)		;8cfe  ; A = entity behavior bits
	bit 7,a		;8d01  ; Is entity alternate type?
	ret z			;8d03  ; No -> nothing to do

; --- Swap ENTITY_RNG_SEED[0] and ENTITY_RNG_SEED[1] ---
	ld hl,ENTITY_RNG_SEED		;8d04  ; HL -> RNG seed byte 0
	ld a,(hl)			;8d07  ; A = byte 0
	push af			;8d08  ; Save byte 0
	inc hl			;8d09  ; HL -> byte 1
	ld a,(hl)			;8d0a  ; A = byte 1
	dec hl			;8d0b  ; HL -> byte 0
	ld (hl),a			;8d0c  ; Store byte 1 into position 0
	inc hl			;8d0d  ; HL -> byte 1
	pop af			;8d0e  ; Restore original byte 0
	ld (hl),a			;8d0f  ; Store byte 0 into position 1
; --- Also swap the behavior address pointers ---
; Swaps ENTITY_BEHAV_ADDR with l8d45h (alternate behavior pointer).
;
	ld hl,(ENTITY_BEHAV_ADDR)		;8d10  ; HL = primary behavior address
	push hl			;8d13  ; Save primary
	ld hl,(l8d45h)		;8d14  ; HL = alternate behavior address
	ld (ENTITY_BEHAV_ADDR),hl		;8d17  ; Set primary = old alternate
	pop hl			;8d1a  ; HL = old primary
	ld (l8d45h),hl		;8d1b  ; Set alternate = old primary
	ret			;8d1e

; ==========================================================================
; BEHAVIOR JUMP TABLE ($8D1F)
; ==========================================================================
; 13 two-byte handler addresses indexed by entity state (IX+$0B).
; States 0-12 are valid; bytes 26-31 overlap with " LIFT " tile data.
;
; State  0 ($8D57): Patrol/idle — horizontal then vertical movement
; State  1 ($8E28): Vertical patrol variant
; State  2 ($8E74): Hit countdown timer (awards score on completion)
; State  3 ($8F4E): Expire countdown (awards 7 points)
; State  4 ($8F7C): Immediate score (6 points) + reset to state 1
; State  5 ($8F44): Death animation A (playing death sequence)
; State  6 ($8F49): Death animation B (playing death sequence)
; State  7 ($8F18): Transition: sets state to 8
; State  8 ($8F21): Reset to state 0 + flip direction
; State  9 ($8F32): Transition: sets state to 10
; State 10 ($8F3B): Reset to state 1 + flip direction
; State 11 ($8F73): Transition: sets state to 3
; State 12 ($8EB1): Entity sprite rendering/draw
;
l8d1fh:
	ld d,a			;8d1f  ; DATA: $57 $8D -> handler $8D57 (state 0)
	adc a,l			;8d20
	jr z,$-112		;8d21  ; DATA: $28 $8E -> handler $8E28 (state 1)
	ld (hl),h			;8d23  ; DATA: $74 $8E -> handler $8E74 (state 2)
	adc a,(hl)			;8d24
	ld c,(hl)			;8d25  ; DATA: $4E $8F -> handler $8F4E (state 3)
	adc a,a			;8d26
	ld a,h			;8d27  ; DATA: $7C $8F -> handler $8F7C (state 4)
	adc a,a			;8d28
	ld b,h			;8d29  ; DATA: $44 $8F -> handler $8F44 (state 5)
	adc a,a			;8d2a
	ld c,c			;8d2b  ; DATA: $49 $8F -> handler $8F49 (state 6)
	adc a,a			;8d2c
	jr $-111		;8d2d  ; DATA: $18 $8F -> handler $8F18 (state 7)
	ld hl,0328fh		;8d2f  ; DATA: $21 $8F -> handler $8F21 (state 8)
	adc a,a			;8d32  ;       $32 $8F -> handler $8F32 (state 9)
	dec sp			;8d33  ;       $3B $8F -> handler $8F3B (state 10)
	adc a,a			;8d34
	ld (hl),e			;8d35  ; DATA: $73 $8F -> handler $8F73 (state 11)
	adc a,a			;8d36
	or c			;8d37  ; DATA: $B1 $8E -> handler $8EB1 (state 12)
	adc a,(hl)			;8d38
; ==========================================================================
; " LIFT " TILE DATA ($8D39)
; ==========================================================================
; 6 tile indices spelling " LIFT " (with space padding), overlaid on
; room tiles when the room contains a lift/elevator.
; Note: these bytes overlap with jump table entries 13-15 (unused states).
;
l8d39h:
	ld b,b			;8d39  ; DATA: $40 = tile ' ' (space)
	ld c,h			;8d3a  ; DATA: $4C = tile 'L'
	ld c,c			;8d3b  ; DATA: $49 = tile 'I'
	ld b,(hl)			;8d3c  ; DATA: $46 = tile 'F'
	ld d,h			;8d3d  ; DATA: $54 = tile 'T'
	ld b,b			;8d3e  ; DATA: $40 = tile ' ' (space)

; ==========================================================================
; ENGINE VARIABLES ($8D3F-$8D56)
; ==========================================================================
; Working variables used during entity processing. Many are written and
; read within a single frame iteration.
;
l8d3fh:
	dec b			;8d3f  ; DATA: $05 = entity hit timer (counts down to 0)
ENTITY_RNG_SEED:
	nop			;8d40  ; DATA: $00 = RNG seed byte 0 (entity AI random state)
	nop			;8d41  ; DATA: $00 = RNG seed byte 1 (alternate animation)
l8d42h:
	nop			;8d42  ; DATA: $00 = active combatant type (0=none, 1=guard, 2=alt)
ENTITY_BEHAV_ADDR:
	nop			;8d43  ; DATA: 2-byte pointer to entity behavior tile data
	nop			;8d44
l8d45h:
	nop			;8d45  ; DATA: 2-byte alternate behavior pointer (swapped by flip)
	nop			;8d46

; ==========================================================================
; PROJECTILE VELOCITY TABLE ($8D47)
; ==========================================================================
; 8 entries of (X_velocity, Y_velocity) pairs used when spawning
; projectiles. Entries are randomly selected. X velocities are 8-10,
; Y velocities are 0 or 8 (horizontal or diagonal trajectories).
;
; Entry 0: X=10, Y=0  (fast horizontal)
; Entry 1: X=10, Y=8  (fast diagonal)
; Entry 2: X=10, Y=0  (fast horizontal)
; Entry 3: X=8,  Y=0  (medium horizontal)
; Entry 4: X=8,  Y=8  (medium diagonal)
; Entry 5: X=9,  Y=0  (medium-fast horizontal)
; Entry 6: X=9,  Y=8  (medium-fast diagonal)
; Entry 7: X=9,  Y=0  (medium-fast horizontal)
;
l8d47h:
	ld a,(bc)			;8d47  ; DATA: $0A $00 (entry 0: X=10, Y=0)
	nop			;8d48
	ld a,(bc)			;8d49  ; DATA: $0A $08 (entry 1: X=10, Y=8)
	ex af,af'			;8d4a
	ld a,(bc)			;8d4b  ; DATA: $0A $00 (entry 2: X=10, Y=0)
	nop			;8d4c
	ex af,af'			;8d4d  ; DATA: $08 $00 (entry 3: X=8, Y=0)
	nop			;8d4e
	ex af,af'			;8d4f  ; DATA: $08 $08 (entry 4: X=8, Y=8)
	ex af,af'			;8d50
	add hl,bc			;8d51  ; DATA: $09 $00 (entry 5: X=9, Y=0)
	nop			;8d52
	add hl,bc			;8d53  ; DATA: $09 $08 (entry 6: X=9, Y=8)
	ex af,af'			;8d54
	add hl,bc			;8d55  ; DATA: $09 $00 (entry 7: X=9, Y=0)
	nop			;8d56
; ==========================================================================
; STATE 0 HANDLER: PATROL/IDLE ($8D57)
; ==========================================================================
; Main patrol behavior. The entity tries to move horizontally first by
; checking the map tile in its movement direction. If blocked (tile = $FF),
; it tries vertical movement instead. If both directions are blocked,
; falls through to random AI behavior.
;
; On entry:
;   B = PLAYER_DIR (0=right, 1=left)
;   Z flag = set if PLAYER_DIR == 0
;   IX -> current entity
;   DE (from entity) = map pointer
;
; --- Select horizontal movement direction ---
	ld hl,l6931h		;8d57  ; HL = forward horizontal map offset (+5 tiles)
	jr z,l8d5fh		;8d5a  ; Player facing right -> use forward offset
	ld hl,l692ch		;8d5c  ; HL = backward horizontal map offset (-4 tiles)

l8d5fh:
; --- Check if horizontal path is passable ---
	ld e,(ix+003h)		;8d5f  ; DE = entity map pointer
	ld d,(ix+004h)		;8d62
	add hl,de			;8d65  ; HL -> map tile in movement direction
	ld a,(lae06h)		;8d66  ; A = horizontal traversal flag
	inc a			;8d69  ; Test if $FF (movement disabled)
	jr z,l8d82h		;8d6a  ; Disabled -> skip horizontal, try vertical

	ld a,(hl)			;8d6c  ; A = map tile at destination
	inc a			;8d6d  ; Test if $FF (wall/solid)
	jr z,l8d82h		;8d6e  ; Wall -> skip horizontal, try vertical

; --- Horizontal path is clear: start moving ---
	ld (ENTITY_BEHAV_ADDR),hl		;8d70  ; Store destination tile address
	ld (ix+00bh),002h		;8d73  ; Set state to 2 (hit/countdown)
	ld a,003h		;8d77  ; A = 3 (countdown steps)
	ld (ENTITY_RNG_SEED),a		;8d79  ; Set movement countdown
	ld a,r		;8d7c  ; A = R register (pseudo-random)
	rra			;8d7e  ; 50% chance: carry = bit 0
	jp nc,l8e22h		;8d7f  ; 50% -> go to animation setup

; --- Try vertical movement instead ---
l8d82h:
	ld a,(lae00h)		;8d82  ; A = vertical traversal flag
	inc a			;8d85  ; Test if $FF (movement disabled)
	jr z,l8da5h		;8d86  ; Disabled -> fall through to AI random

; --- Select vertical movement direction ---
	ld a,b			;8d88  ; A = PLAYER_DIR
	or a			;8d89  ; Is player facing right?
	ld hl,l6911h		;8d8a  ; HL = upward map offset (-$1F tiles)
	jr z,l8d92h		;8d8d  ; Player right -> try moving up
	ld hl,l690ch		;8d8f  ; HL = downward map offset (+$1C tiles)

l8d92h:
; --- Check if vertical path is passable ---
	add hl,de			;8d92  ; HL -> map tile in vertical direction
	ld a,(hl)			;8d93  ; A = map tile at destination
	inc a			;8d94  ; Test if $FF (wall/solid)
	jr z,l8da5h		;8d95  ; Wall -> fall through to AI random

; --- Vertical path is clear: start climbing/descending ---
	ld (ENTITY_BEHAV_ADDR),hl		;8d97  ; Store destination tile address
	ld a,002h		;8d9a  ; A = 2 (countdown steps)
	ld (ix+00bh),00bh		;8d9c  ; Set state to 11 (transition to state 3)
	ld (ENTITY_RNG_SEED),a		;8da0  ; Set movement countdown
	jr l8e22h		;8da3  ; Go to animation setup
; ==========================================================================
; GUARD TARGETING LOGIC ($8DA5)
; ==========================================================================
; If the guard can't move (both horizontal and vertical blocked), check
; if conditions are right to throw a projectile at the player.
; Requirements:
;   1. Random check passes (12.5% base chance)
;   2. No projectile already active in first slot
;   3. Projectile spawning not disabled ($AE05 != $FF)
;   4. Player is within ±4 horizontal tiles of guard
;   5. Player direction matches the needed throw direction
;
l8da5h:
	ld a,r		;8da5  ; A = R register (pseudo-random)
	and 007h		;8da7  ; Mask to 0-7
	jr nz,ENEMY_AI_RANDOM		;8da9  ; 87.5% chance: skip targeting, do random AI

; --- Check if projectile slot 0 is free ---
	ld a,(l9411h)		;8dab  ; A = projectile slot 0 active flag
	or a			;8dae  ; Is it occupied?
	jr nz,ENEMY_AI_RANDOM		;8daf  ; Occupied -> can't throw, do random AI

; --- Check if projectile spawning is enabled ---
	ld a,(lae05h)		;8db1  ; A = projectile spawn enable flag
	inc a			;8db4  ; Test if $FF (disabled)
	jr z,ENEMY_AI_RANDOM		;8db5  ; Disabled -> do random AI

; --- Check horizontal proximity to player ---
	ld hl,PLAYER_POS		;8db7  ; HL -> player X position
	ld a,(ix+009h)		;8dba  ; A = entity behavior bits
	and 03fh		;8dbd  ; Mask off type bits -> entity sprite X
	sub (hl)			;8dbf  ; A = entity_X - player_X
	add a,004h		;8dc0  ; Shift to unsigned: A = distance + 4
	cp 009h		;8dc2  ; Is distance < 9? (within ±4 tiles)
	jr nc,ENEMY_AI_RANDOM		;8dc4  ; Too far -> do random AI

; --- Calculate projectile spawn position ---
	ld l,(ix+003h)		;8dc6  ; HL = entity map pointer
	ld h,(ix+004h)		;8dc9
	ld de,00064h		;8dcc  ; DE = 100 (offset to projectile spawn point)
	add hl,de			;8dcf  ; HL -> projectile start position in map

; --- Default: throw downward (player is below guard) ---
	ld b,004h		;8dd0  ; B = 4 (Y offset for projectile)
	ld c,008h		;8dd2  ; C = 8 (projectile speed/param)
	ld d,000h		;8dd4  ; D = 0 (required PLAYER_DIR for this direction)

; --- Check if player is above or below guard ---
	ld a,(ix+001h)		;8dd6  ; A = entity Y position
	add a,00ah		;8dd9  ; A = entity center Y
	ld e,a			;8ddb  ; E = entity center Y
	ld a,(PLAYER_Y)		;8ddc  ; A = player Y position
	add a,00ah		;8ddf  ; A = player center Y
	cp e			;8de1  ; Is player below entity?
	jr nc,l8dedh		;8de2  ; Player below or same -> use defaults

; --- Player is above: throw upward ---
	ld b,001h		;8de4  ; B = 1 (Y offset for upward throw)
	ld c,004h		;8de6  ; C = 4 (projectile speed/param)
	ld d,001h		;8de8  ; D = 1 (required PLAYER_DIR = left)
	dec hl			;8dea  ; Adjust spawn position upward
	dec hl			;8deb
	dec hl			;8dec

; --- Verify player is facing the right direction for throw ---
l8dedh:
	ld a,(PLAYER_DIR)		;8ded  ; A = player facing direction
	cp d			;8df0  ; Does it match required direction?
	jr nz,ENEMY_AI_RANDOM		;8df1  ; Mismatch -> do random AI instead

; --- Set up projectile in slot 0 ---
	ld a,(ix+001h)		;8df3  ; A = entity Y position
	add a,b			;8df6  ; A = Y + offset (spawn Y)
	ld (l9413h),a		;8df7  ; Set projectile Y position
	ld (l9414h),hl		;8dfa  ; Set projectile map position pointer
	ld a,c			;8dfd  ; A = projectile speed parameter
	ld (l9416h),a		;8dfe  ; Set projectile horizontal velocity
	ld (l9417h),a		;8e01  ; Set projectile vertical velocity

; --- Activate projectile slot 0 ---
	ld a,0d4h		;8e04  ; A = $D4 (projectile active marker + timer)
	ld (l9411h),a		;8e06  ; Activate projectile slot 0

; --- Set guard sprite to "throwing" position ---
	ld a,(ix+009h)		;8e09  ; A = entity behavior bits
	and 03fh		;8e0c  ; Mask to sprite type
	add a,003h		;8e0e  ; A = sprite type + 3 (throwing frame offset)
	ld (l9412h),a		;8e10  ; Set projectile sprite index

; --- Set guard to countdown state (state 2) ---
	ld (ix+00bh),002h		;8e13  ; Set behavior state to 2 (countdown)
	ld a,001h		;8e17  ; A = 1 (short countdown)
	ld (ENTITY_RNG_SEED),a		;8e19  ; Set countdown timer
	jp l8e22h		;8e1c  ; Go to animation setup
; ==========================================================================
; ENEMY_AI_RANDOM ($8E1F)
; ==========================================================================
; Fallback AI behavior: perform random animation check and set up
; animation pointer from the current sprite buffer.
;
ENEMY_AI_RANDOM:
	call ANIM_CHECK		;8e1f  ; Random chance to change entity facing direction

; --- Common animation setup exit point ---
l8e22h:
	ld hl,(lddefh)		;8e22  ; HL = current active sprite buffer address
	jp SETUP_ANIM_PTR		;8e25  ; Set up rendering and continue

; ==========================================================================
; STATE 1 HANDLER: VERTICAL PATROL ($8E28)
; ==========================================================================
; Similar to state 0 but tries vertical movement first. Used by guards
; that primarily patrol vertically (ladders, shafts).
;
; On entry:
;   B = PLAYER_DIR, Z flag set if PLAYER_DIR == 0
;
; --- Select vertical direction ---
	ld hl,l68f2h		;8e28  ; HL = upward map offset
	jr z,l8e30h		;8e2b  ; Player right -> try moving up
	ld hl,l68edh		;8e2d  ; HL = downward map offset

l8e30h:
; --- Check if vertical movement is allowed ---
	ld a,(ladfeh)		;8e30  ; A = vertical traversal flag
	inc a			;8e33  ; Test if $FF (disabled)
	jr z,l8e47h		;8e34  ; Disabled -> fall back to random AI

; --- Check map tile in vertical direction ---
	ld e,(ix+003h)		;8e36  ; DE = entity map pointer
	ld d,(ix+004h)		;8e39
	add hl,de			;8e3c  ; HL -> destination tile in map
	ld a,(hl)			;8e3d  ; A = tile at destination
	inc a			;8e3e  ; Test if $FF (wall/solid)
	jr z,l8e47h		;8e3f  ; Wall -> fall back to random AI

; --- Vertical path clear: set state to 4 (instant score + reset) ---
	ld (ix+00bh),004h		;8e41  ; Set state to 4
	jr l8e4ah		;8e45  ; Go to animation setup

; --- Vertical blocked: try random AI ---
l8e47h:
	call ANIM_CHECK		;8e47  ; Random animation check

; --- Animation setup with patched buffer address ---
l8e4ah:
	ld hl,00000h		;8e4a  ; HL = $0000 (SELF-MODIFYING: patched at $8B66)
	jp SETUP_ANIM_PTR		;8e4d  ; Set up rendering
; ==========================================================================
; ANIM_CHECK ($8E50)
; ==========================================================================
; 25% random chance to re-evaluate entity facing direction based on
; vertical position relative to the player. If the entity should face
; the opposite direction, doubles its behavior state + 7 to transition
; to a "reversed" variant.
;
; On entry:
;   IX -> current entity
; On exit:
;   Entity behavior state may be modified
;
ANIM_CHECK:
	ld a,r		;8e50  ; A = R register (pseudo-random)
	and 003h		;8e52  ; Mask to 0-3
	ret nz			;8e54  ; 75% chance: return without change

; --- 25% chance: check if entity should change direction ---
	ld a,(PLAYER_Y)		;8e55  ; A = player Y position
	add a,004h		;8e58  ; A = player Y + 4 (center offset)
	sub (ix+001h)		;8e5a  ; A = player_center_Y - entity_Y
	sub 004h		;8e5d  ; A = vertical offset (negative = player above)
	ld b,001h		;8e5f  ; B = 1 (assume player is above)
	jp m,l8e65h		;8e61  ; If negative -> player IS above, keep B=1
	dec b			;8e64  ; Player is below -> B = 0
; --- Compare entity's suggested direction with player direction ---
l8e65h:
	ld a,(PLAYER_DIR)		;8e65  ; A = player facing direction (0 or 1)
	cp b			;8e68  ; Does it match the entity's facing?
	ret z			;8e69  ; Already facing correctly -> no change

; --- Entity should face the other way: transition to reversed state ---
	ld a,(ix+00bh)		;8e6a  ; A = current behavior state
	add a,a			;8e6d  ; A = state * 2
	add a,007h		;8e6e  ; A = state*2 + 7 (reversed variant index)
	ld (ix+00bh),a		;8e70  ; Set new state
	ret			;8e73

; ==========================================================================
; STATE 2 HANDLER: HIT COUNTDOWN ($8E74)
; ==========================================================================
; Entity was hit or is counting down from a triggered event.
; When countdown reaches 2, awards 12 points (if destination tile
; is not $FF). Decrements each frame until reaching 0, then resets
; entity to state 0 (idle).
;
	ld hl,ENTITY_RNG_SEED		;8e74  ; HL -> countdown timer
	ld a,002h		;8e77  ; A = 2 (trigger score at count 2)
	cp (hl)			;8e79  ; Is countdown at 2?
	jr nz,l8e8dh		;8e7a  ; No -> skip scoring, just decrement

; --- Award score on countdown trigger ---
	push hl			;8e7c  ; Save timer pointer
	ld hl,(ENTITY_BEHAV_ADDR)		;8e7d  ; HL -> destination tile address
	ld a,(hl)			;8e80  ; A = tile at destination
	inc a			;8e81  ; Test if $FF (invalid)
	jr z,l8e8ch		;8e82  ; Invalid -> skip score

	call FONT_LOOKUP		;8e84  ; Set up tile rendering
	ld b,00ch		;8e87  ; B = 12 (score points)
	call UPDATE_SCORE		;8e89  ; Award 12 points

l8e8ch:
	pop hl			;8e8c  ; Restore timer pointer

; --- Decrement countdown ---
l8e8dh:
	dec (hl)			;8e8d  ; Countdown timer--
	jr nz,l8e94h		;8e8e  ; Not zero yet -> continue counting

; --- Countdown reached 0: reset entity to idle ---
	xor a			;8e90  ; A = 0
	ld (ix+00bh),a		;8e91  ; Set state to 0 (patrol/idle)

l8e94h:
	ld hl,ldc28h		;8e94  ; HL -> countdown animation sequence
	jp SETUP_ANIM_PTR		;8e97  ; Set up animation and continue
; ==========================================================================
; HORIZONTAL BAR GRAPHIC DATA ($8E9A)
; ==========================================================================
; 10 tile indices for drawing a horizontal bar/pipe:
;   $A3 = left end cap, $A4 x 8 = middle segments, $A5 = right end cap.
; Used for rendering bars, pipes, or HUD elements.
;
l8e9ah:
	and e			;8e9a  ; DATA: $A3 (left end cap tile)
	and h			;8e9b  ; DATA: $A4 (middle bar tile)
	and h			;8e9c  ; DATA: $A4
	and h			;8e9d  ; DATA: $A4
	and h			;8e9e  ; DATA: $A4
	and h			;8e9f  ; DATA: $A4
	and h			;8ea0  ; DATA: $A4
	and h			;8ea1  ; DATA: $A4
	and h			;8ea2  ; DATA: $A4
	and l			;8ea3  ; DATA: $A5 (right end cap tile)

; ==========================================================================
; GET_RANDOM ($8EA4)
; ==========================================================================
; Pseudo-random number generator using self-modifying code.
; Maintains an internal 16-bit pointer that increments each call
; (with bit 6 of H cleared to keep it within a bounded memory range).
; Returns the byte at the pointer location as the "random" value.
; The randomness comes from reading whatever data happens to be at
; successive memory addresses — a common ZX Spectrum RNG technique.
;
; On entry:  (no parameters)
; On exit:   A = pseudo-random byte
;            HL preserved
;
GET_RANDOM:
	push hl			;8ea4  ; Save HL
	ld hl,00000h		;8ea5  ; HL = current RNG pointer (SELF-MODIFYING: $8EA6)
	inc hl			;8ea8  ; Advance pointer
	res 6,h		;8ea9  ; Clear bit 6 of H (keep within $0000-$3FFF range)
	ld (08ea6h),hl		;8eab  ; Store back (patches the LD HL immediate above)
	ld a,(hl)			;8eae  ; A = byte at current pointer (random value)
	pop hl			;8eaf  ; Restore HL
	ret			;8eb0
; ==========================================================================
; STATE 12 HANDLER: ENTITY SPRITE RENDERING ($8EB1)
; ==========================================================================
; Draws the entity as a horizontal bar graphic on the room's tile map.
; The bar is 10 tiles wide using the bar graphic data at $8E9A.
; Direction-dependent: different offsets and tile strides for left vs right.
; Also patches self-modifying code for the frame init routine ($8A80, $8A8B).
;
; On entry:
;   B = PLAYER_DIR, IX -> entity
;
; --- Select direction-dependent offsets ---
	ld de,l6b72h		;8eb1  ; DE = right-facing map offset
	ld c,00ch		;8eb4  ; C = $0C (tile stride for rightward)
	ld a,(PLAYER_DIR)		;8eb6  ; A = player direction
	dec a			;8eb9  ; Test if 1 (facing left)
	ld a,023h		;8eba  ; A = $23 (INC HL opcode)
	jr nz,l8ec4h		;8ebc  ; Not left -> use rightward settings

; --- Left-facing entity ---
	ld de,l6b6bh		;8ebe  ; DE = left-facing map offset
	inc c			;8ec1  ; C = $0D (tile stride for leftward)
	ld a,02bh		;8ec2  ; A = $2B (DEC HL opcode)

l8ec4h:
; --- Patch self-modifying code with direction-dependent opcodes ---
	ld (l8f04h),a		;8ec4  ; Patch: INC/DEC HL at $8F04
	ld (l8a8bh),a		;8ec7  ; Patch: INC/DEC HL at $8A8B (frame init)

; --- Set up rendering parameters ---
	ld a,c			;8eca  ; A = tile stride value
	ld (l8f06h),a		;8ecb  ; Patch: stride at $8F06 (NOP or value)
	ld a,(ix+001h)		;8ece  ; A = entity Y position
	dec a			;8ed1  ; A = Y - 1 (start one row above)
	ld c,a			;8ed2  ; C = starting Y for tile row
	ld l,(ix+003h)		;8ed3  ; HL = entity map pointer
	ld h,(ix+004h)		;8ed6
	add hl,de			;8ed9  ; HL -> starting tile position in map
	ld (08a82h),hl		;8eda  ; Patch: player base map position (self-modifying)

; --- Draw 10-tile horizontal bar ---
	ld de,l8e9ah		;8edd  ; DE -> bar graphic data (10 tiles)
	ld a,00ah		;8ee0  ; A = 10 (number of tiles to draw)
	ld b,a			;8ee2  ; B = 10 (loop counter)
	ld (08a80h),a		;8ee3  ; Patch: dirty flag count in frame init

l8ee6h:
; --- Bounds check: don't draw past row 25 ---
	ld a,c			;8ee6  ; A = current Y row
	cp 019h		;8ee7  ; Past bottom of visible area (row 25)?
	jr nc,l8f04h		;8ee9  ; Yes -> skip tile, advance pointers

; --- Check if tile position is writable ---
	push hl			;8eeb  ; Save map position
	push de			;8eec  ; Save graphic data pointer
	ld de,lf940h		;8eed  ; DE = offset to collision/type buffer
	add hl,de			;8ef0  ; HL -> collision flag at this position
	ld a,(hl)			;8ef1  ; A = collision flag value
	pop de			;8ef2  ; Restore graphic data pointer
	pop hl			;8ef3  ; Restore map position
	cp 0c7h		;8ef4  ; Is position solid/protected? (>= $C7)
	jr nc,l8f09h		;8ef6  ; Yes -> abort drawing (hit solid tile)

; --- Write tile and mark as dirty ---
	ld a,(de)			;8ef8  ; A = bar tile byte from graphic data
	ld (hl),a			;8ef9  ; Write tile to map position
	push hl			;8efa  ; Save map position
	push de			;8efb  ; Save graphic data pointer
	ld de,lf700h		;8efc  ; DE = offset to dirty flag buffer
	add hl,de			;8eff  ; HL -> dirty flag for this tile
	ld (hl),001h		;8f00  ; Mark tile as dirty (needs redraw)
	pop de			;8f02  ; Restore graphic data pointer
	pop hl			;8f03  ; Restore map position

l8f04h:
	inc hl			;8f04  ; Advance map position (SELF-MODIFYING: INC or DEC HL)
	inc de			;8f05  ; Advance graphic data pointer
l8f06h:
	nop			;8f06  ; SELF-MODIFYING: tile stride adjust (NOP/$0C/$0D)
	djnz l8ee6h		;8f07  ; Loop for all 10 bar tiles

; --- Rendering complete or aborted (hit solid tile) ---
l8f09h:
	ld hl,ENTITY_RNG_SEED		;8f09  ; HL -> rendering countdown timer
	dec (hl)			;8f0c  ; Decrement timer
	jr nz,l8f13h		;8f0d  ; Not zero -> stay in state 12

; --- Countdown expired: transition to state 7 ---
	ld (ix+00bh),007h		;8f0f  ; Set state to 7 (transition state)

l8f13h:
	ld hl,ldc28h		;8f13  ; HL -> countdown animation sequence
	jr SETUP_ANIM_PTR		;8f16  ; Set up animation and continue
; --- State 7: Transition -> set state to 8 ---
	ld (ix+00bh),008h		;8f18  ; Set state to 8
	ld hl,ldd53h		;8f1c  ; HL -> transition animation
	jr SETUP_ANIM_PTR		;8f1f  ; Set up animation

; --- State 8: Reset to idle + flip player direction ---
	ld (ix+00bh),000h		;8f21  ; Set state to 0 (idle)
	ld hl,ldd53h		;8f25  ; HL -> transition animation

; --- Common: flip player direction ---
l8f28h:
	ld a,(PLAYER_DIR)		;8f28  ; A = current player direction
	xor 001h		;8f2b  ; Toggle direction (0<->1)
	ld (PLAYER_DIR),a		;8f2d  ; Store flipped direction
	jr SETUP_ANIM_PTR		;8f30  ; Set up animation

; --- State 9: Transition -> set state to 10 ---
	ld (ix+00bh),00ah		;8f32  ; Set state to 10 ($0A)
	ld hl,ldcc1h		;8f36  ; HL -> transition animation
	jr SETUP_ANIM_PTR		;8f39  ; Set up animation

; --- State 10: Reset to patrol + flip player direction ---
	ld (ix+00bh),001h		;8f3b  ; Set state to 1 (patrol)
	ld hl,ldcc1h		;8f3f  ; HL -> transition animation
	jr l8f28h		;8f42  ; Flip direction and set up animation

; --- State 5: Death animation A ---
	ld hl,ldda5h		;8f44  ; HL -> death animation A sequence
	jr SETUP_ANIM_PTR		;8f47  ; Set up animation

; --- State 6: Death animation B ---
	ld hl,lddcfh		;8f49  ; HL -> death animation B sequence
	jr SETUP_ANIM_PTR		;8f4c  ; Set up animation
; ==========================================================================
; STATE 3 HANDLER: EXPIRE COUNTDOWN ($8F4E)
; ==========================================================================
; Similar to state 2 but awards 7 points when countdown reaches 1.
; Used for entities with delayed scoring (e.g., objects left behind).
;
	ld hl,ENTITY_RNG_SEED		;8f4e  ; HL -> countdown timer
	ld a,001h		;8f51  ; A = 1 (trigger at count 1)
	cp (hl)			;8f53  ; Is countdown at 1?
	jr nz,l8f67h		;8f54  ; No -> skip scoring

; --- Award 7 points at countdown trigger ---
	push hl			;8f56  ; Save timer pointer
	ld hl,(ENTITY_BEHAV_ADDR)		;8f57  ; HL -> behavior tile address
	ld a,(hl)			;8f5a  ; A = tile value
	inc a			;8f5b  ; Test if $FF (invalid)
	jr z,l8f66h		;8f5c  ; Invalid -> skip score

	call FONT_LOOKUP		;8f5e  ; Set up tile rendering
	ld b,007h		;8f61  ; B = 7 (score points)
	call UPDATE_SCORE		;8f63  ; Award 7 points

l8f66h:
	pop hl			;8f66  ; Restore timer pointer

; --- Decrement countdown ---
l8f67h:
	dec (hl)			;8f67  ; Countdown timer--
	jr nz,l8f6eh		;8f68  ; Not zero -> continue counting

; --- Countdown reached 0: reset to idle ---
	xor a			;8f6a  ; A = 0
	ld (ix+00bh),a		;8f6b  ; Set state to 0 (idle)

l8f6eh:
	ld hl,ldd7dh		;8f6e  ; HL -> expire animation sequence
	jr SETUP_ANIM_PTR		;8f71  ; Set up animation

; --- State 11: Transition -> set state to 3 ---
	ld (ix+00bh),003h		;8f73  ; Set state to 3 (expire countdown)
	ld hl,ldc51h		;8f77  ; HL -> transition animation
	jr SETUP_ANIM_PTR		;8f7a  ; Set up animation

; ==========================================================================
; STATE 4 HANDLER: INSTANT SCORE ($8F7C)
; ==========================================================================
; Immediately awards 6 points and resets entity to state 1 (patrol).
; Used for entities that give points on contact/interaction.
;
	call FONT_LOOKUP		;8f7c  ; Set up tile rendering
	ld b,006h		;8f7f  ; B = 6 (score points)
	call UPDATE_SCORE		;8f81  ; Award 6 points
	ld (ix+00bh),001h		;8f84  ; Reset entity to state 1 (patrol)
	ld hl,ldc91h		;8f88  ; HL -> patrol animation sequence
; ==========================================================================
; SETUP_ANIM_PTR ($8F8B)
; ==========================================================================
; Final rendering setup for the current entity. Stores the animation
; pointer, sets direction, calculates sprite screen position, and calls
; RENDER_SPRITE_RAW to draw the entity sprite.
;
; On entry:
;   HL = animation sequence address (set by behavior handlers)
;   IX -> current entity
;
SETUP_ANIM_PTR:
	ld (08fb4h),hl		;8f8b  ; Store animation pointer (SELF-MODIFYING at $8FB4)

; --- Set direction for rendering subsystem ---
	ld hl,098f2h		;8f8e  ; HL -> primary direction register
	ld a,(ix+009h)		;8f91  ; A = entity behavior bits
	bit 7,a		;8f94  ; Is entity alternate type?
	jr z,l8f9bh		;8f96  ; No -> use primary register
	ld hl,l98f3h		;8f98  ; Yes -> use alternate direction register

l8f9bh:
	ld a,(PLAYER_DIR)		;8f9b  ; A = current player direction
	ld (hl),a			;8f9e  ; Store direction for rendering

; --- Calculate sprite base address ---
	ld l,(ix+003h)		;8f9f  ; HL = entity map pointer
	ld h,(ix+004h)		;8fa2
	ld de,l6b0ch		;8fa5  ; DE = normal sprite base offset
	ld a,(ix+009h)		;8fa8  ; A = entity behavior bits
	bit 7,a		;8fab  ; Is entity alternate type?
	jr z,l8fb2h		;8fad  ; No -> use normal sprite base
	ld de,l6d4ch		;8faf  ; Yes -> use flipped sprite base offset

l8fb2h:
	add hl,de			;8fb2  ; HL = sprite data address in map buffer

; --- Set up sprite rendering parameters ---
	ld de,00000h		;8fb3  ; DE = animation frame offset (SELF-MODIFYING: $8FB4)
	ld b,007h		;8fb6  ; B = 7 (sprite width in tiles)
	ld c,006h		;8fb8  ; C = 6 (sprite height in tiles)

; --- Set sprite type in alternate register set ---
	exx			;8fba  ; Switch to alternate registers
	ld a,(ix+009h)		;8fbb  ; A = entity behavior bits
	and 07fh		;8fbe  ; Mask off flip flag -> sprite type ID
	ld d,a			;8fc0  ; D' = sprite type ID
	exx			;8fc1  ; Switch back to main registers

; --- Render sprite and draw entity ---
	ld a,(ix+001h)		;8fc2  ; A = entity Y position
	call RENDER_SPRITE_RAW		;8fc5  ; Render entity sprite to screen buffer
	call DRAW_ENTITY		;8fc8  ; Commit sprite to visible screen
	jr l901ch		;8fcb  ; Jump to entity loop cleanup
; ==========================================================================
; ENTITY STATE CLEANUP ($8FCD)
; ==========================================================================
; Called when entity is outside the ±3/±6 proximity radius.
; Resets certain transient states to more stable ones so entities
; don't get stuck in action states while off-screen.
;
; State transitions for off-screen entities:
;   12 (rendering) -> 7 (transition)
;   11 (transition) -> 0 (idle) — falls through
;   9 (stunned) -> 1 (patrol) + flip direction
;   7 (transition) -> 0 (idle) + flip direction — falls through
;   4 (jumping) -> 1 (patrol)
;   10 (recovering) -> 1 (patrol)
;   2+ (other) -> 0 (idle)
;   6 (attack) -> unchanged
;   5 (death A) -> unchanged
;   0-1 -> unchanged
;
l8fcdh:
	ld a,(ix+00bh)		;8fcd  ; A = entity behavior state
	cp 00ch		;8fd0  ; State 12 (rendering)?
	jr nz,l8fdah		;8fd2  ; No -> check next state
	ld (ix+00bh),007h		;8fd4  ; Reset: 12 -> 7 (transition)
	jr l901ch		;8fd8  ; Done

l8fdah:
	cp 00bh		;8fda  ; State 11 (transition)?
	jr z,l9018h		;8fdc  ; Yes -> reset to 0 (idle)

	cp 009h		;8fde  ; State 9 (stunned)?
	jr nz,l8ff0h		;8fe0  ; No -> check next
; --- State 9 off-screen: flip direction and set to patrol ---
	ld a,(PLAYER_DIR)		;8fe2  ; A = player direction
	xor 001h		;8fe5  ; Flip direction
	ld (PLAYER_DIR),a		;8fe7  ; Store flipped direction
	ld (ix+00bh),001h		;8fea  ; Set state to 1 (patrol)
	jr l901ch		;8fee  ; Done

l8ff0h:
	cp 007h		;8ff0  ; State 7 (transition)?
	jr nz,l8ffeh		;8ff2  ; No -> check next
; --- State 7 off-screen: flip direction and reset to idle ---
	ld a,(PLAYER_DIR)		;8ff4  ; A = player direction
	xor 001h		;8ff7  ; Flip direction
	ld (PLAYER_DIR),a		;8ff9  ; Store flipped direction
	jr l9018h		;8ffc  ; Reset to state 0 (idle)

l8ffeh:
	cp 006h		;8ffe  ; State 6 (attack/death B)?
	jr z,l901ch		;9000  ; Yes -> leave unchanged (death in progress)

	cp 004h		;9002  ; State 4 (jumping)?
	jr nz,l900ch		;9004  ; No -> check next
l9006h:
	ld (ix+00bh),001h		;9006  ; Reset jumping/recovering -> state 1 (patrol)
	jr l901ch		;900a  ; Done

l900ch:
	cp 005h		;900c  ; State 5 (death A)?
	jr z,l901ch		;900e  ; Yes -> leave unchanged (death in progress)

	cp 00ah		;9010  ; State 10 (recovering)?
	jr z,l9006h		;9012  ; Yes -> reset to state 1 (patrol)

	cp 002h		;9014  ; State < 2 (idle or patrol)?
	jr c,l901ch		;9016  ; Yes -> leave unchanged (already stable)

; --- All other states (2, 3, 8, 11+): reset to idle ---
l9018h:
	ld (ix+00bh),000h		;9018  ; Set state to 0 (idle)
; ==========================================================================
; ENTITY LOOP TAIL: ADVANCE TO NEXT ENTITY ($901C)
; ==========================================================================
; Restore player rendering pointers, advance IX to next entity,
; reset sprite dimensions to player size, and loop back.
;
l901ch:
; --- Restore player map pointer for rendering/collision ---
	ld hl,PLAYER_POS_PTR		;901c  ; HL -> player map position pointer
	ld (0ad90h),hl		;901f  ; Restore rendering map pointer
	ld (0b9a4h),hl		;9022  ; Restore collision map pointer

; --- Update player direction and animation ---
	call UPDATE_FACING		;9025  ; Update player facing direction
	call ENTITY_FLIP_ANIM		;9028  ; Swap animation if needed

; --- Advance to next entity (12 bytes per entity) ---
	ld de,0000ch		;902b  ; DE = 12 (entity structure size)
	add ix,de		;902e  ; IX -> next entity in array

; --- Reset rendering parameters to player sprite dimensions ---
; After processing each entity (which may have loaded guard animation
; with smaller dimensions), restore the player's default sprite size.
;
	ld hl,ladf4h		;9030  ; HL -> player animation table
	ld (0b9a1h),hl		;9033  ; Set current animation pointer

	ld a,005h		;9036  ; A = 5
	ld (0b9b3h),a		;9038  ; Set animation counter parameter
	inc a			;903b  ; A = 6
	ld (08fb9h),a		;903c  ; Set sprite height parameter
	ld (0992bh),a		;903f  ; Set collision height parameter
	inc a			;9042  ; A = 7
	ld (08fb7h),a		;9043  ; Set sprite width parameter
	inc a			;9046  ; A = 8
	ld (09929h),a		;9047  ; Set collision width parameter

	ld a,00ch		;904a  ; A = 12 ($0C)
	ld (0b9f8h),a		;904c  ; Set rendering X offset parameter
	ld (0b9e8h),a		;904f  ; Set collision X offset parameter
	ld a,01ah		;9052  ; A = 26 ($1A)
	ld (0b9f1h),a		;9054  ; Set rendering Y offset parameter
	ld (0b9e2h),a		;9057  ; Set collision Y offset parameter

; --- Loop back for next entity ---
	pop bc			;905a  ; Restore entity loop counter
	dec b			;905b  ; B-- (one less entity to process)
	jp nz,l8b6fh		;905c  ; If more entities -> loop back to $8B6F
; ==========================================================================
; POST-ENTITY-LOOP PROCESSING ($905F)
; ==========================================================================
; After processing all 101 entities, perform per-frame housekeeping:
;   1. Clear active combatant type
;   2. Handle screen transition animation (scrolling rooms)
;   3. Check for special room types (randomized tile rooms)
;   4. Manage score countdown timer
;   5. Spawn projectiles
;   6. Process projectile movement
;   7. Handle game-over conditions
;

; --- Clear active combatant type ---
	xor a			;905f  ; A = 0
	ld (l8d42h),a		;9060  ; Reset combat type (no active combatant)

; --- Handle screen transition (room scrolling) ---
	ld a,(l9fdch)		;9063  ; A = screen transition state
	or a			;9066  ; Is a transition in progress?
	jr z,l908ah		;9067  ; No -> skip transition handling

; --- Advance transition counter, skip reserved values ---
	ld a,(la23fh)		;9069  ; A = transition animation counter
l906ch:
	inc a			;906c  ; Advance counter
	cp 016h		;906d  ; Is it $16 (reserved value)?
	jr z,l906ch		;906f  ; Yes -> skip past it
	cp 018h		;9071  ; Has it reached $18 (transition complete)?
	jr nz,l9077h		;9073  ; No -> continue with current value
	ld a,013h		;9075  ; Yes -> wrap back to $13

l9077h:
; --- Apply transition counter to all screen compositing channels ---
	ld (la23fh),a		;9077  ; Update channel 0 counter
	ld (la250h),a		;907a  ; Update channel 1 counter
	ld (la261h),a		;907d  ; Update channel 2 counter

; --- Set screen refresh flags for 3 tile columns ---
	ld a,001h		;9080  ; A = 1 (refresh needed)
	ld hl,l63a0h		;9082  ; HL -> screen refresh flag array
	ld (hl),a			;9085  ; Set column 0 refresh flag
	inc hl			;9086
	ld (hl),a			;9087  ; Set column 1 refresh flag
	inc hl			;9088
	ld (hl),a			;9089  ; Set column 2 refresh flag
; ==========================================================================
; SPECIAL ROOM TYPE $EE: RANDOMIZED TILE ROOM ($908A)
; ==========================================================================
; Room type $EE has animated random tiles — creates visual noise effects
; (e.g., water, lava, or static). Each frame, 10 pairs of tiles are
; randomized using the R register to select from tile ranges $4F-$52
; (4 possible tiles per position). Dirty flags are set for each changed tile.
;
l908ah:
	ld hl,(07747h)		;908a  ; HL = room draw handler pointer
	ld a,(hl)			;908d  ; A = room type byte
	cp 0eeh		;908e  ; Is it type $EE (randomized tiles)?
	jr nz,l90bfh		;9090  ; No -> skip random tile generation

; --- Generate 10 pairs of random tiles ---
	ld hl,l64d3h		;9092  ; HL -> tile map destination
	ld de,l6293h		;9095  ; DE -> dirty flag array
	ld b,00ah		;9098  ; B = 10 pairs to generate

l909ah:
; --- First tile of pair: random from $4F-$52 ---
	ld a,r		;909a  ; A = R register (pseudo-random)
	and 003h		;909c  ; Mask to 0-3
	add a,04fh		;909e  ; A = $4F-$52 (random tile index)
	ld (hl),a			;90a0  ; Store tile at current position
	inc hl			;90a1  ; Skip one tile position
	inc hl			;90a2

; --- Mark dirty flags for this pair ---
	ld a,001h		;90a3  ; A = 1 (dirty)
	ld (de),a			;90a5  ; Set dirty flag for position 1
	inc de			;90a6  ; Skip to next pair's flag
	inc de			;90a7
	ld (de),a			;90a8  ; Set dirty flag for position 2

; --- Second tile of pair: random from $52-$55 ---
	ld a,r		;90a9  ; A = R register (pseudo-random)
	and 003h		;90ab  ; Mask to 0-3
	add a,052h		;90ad  ; A = $52-$55 (random tile index)
	ld (hl),a			;90af  ; Store tile at current position

; --- Advance to next row (stride = 30) ---
	push de			;90b0  ; Save dirty flag pointer
	ld de,0001eh		;90b1  ; DE = 30 (row stride)
	add hl,de			;90b4  ; HL -> next row in tile map
	pop de			;90b5  ; Restore dirty flag pointer

	push hl			;90b6  ; Save tile map pointer
	ld hl,0001eh		;90b7  ; HL = 30 (row stride)
	add hl,de			;90ba  ; HL -> next row in dirty flag array
	ex de,hl			;90bb  ; DE = next dirty flag position
	pop hl			;90bc  ; Restore tile map pointer
	djnz l909ah		;90bd  ; Loop for all 10 pairs
; ==========================================================================
; SCORE COUNTDOWN & PROJECTILE SPAWN GATE ($90BF)
; ==========================================================================
; Manages the score countdown delay and determines if projectile
; spawning should occur this frame. Projectiles only spawn in rooms
; with certain room types ($1D, $23, $22, $26, $2A — guard rooms).
;
l90bfh:
; --- Score countdown delay ---
	ld a,(lf414h)		;90bf  ; A = score countdown delay counter
	or a			;90c2  ; Is it zero?
	jr z,l90cch		;90c3  ; Yes -> proceed to room check
	dec a			;90c5  ; Decrement delay counter
	ld (lf414h),a		;90c6  ; Store decremented value
	jp l916eh		;90c9  ; Skip projectile spawning (still in delay)

; --- Room $1F exclusion check ---
l90cch:
	ld a,(09942h)		;90cc  ; A = current room X
	cp 01fh		;90cf  ; Is this room $1F (final escape area)?
	jp z,l916eh		;90d1  ; Yes -> no projectiles in escape room

; --- Check if room type supports projectile spawning ---
; Only specific room types (guard rooms) allow enemies to throw projectiles.
;
	ld hl,(07747h)		;90d4  ; HL = room draw handler pointer
	ld a,(hl)			;90d7  ; A = room type byte
	cp 01dh		;90d8  ; Room type $1D?
	jr z,l90edh		;90da  ; Yes -> allow projectile spawning
	cp 023h		;90dc  ; Room type $23?
	jr z,l90edh		;90de  ; Yes -> allow
	cp 022h		;90e0  ; Room type $22?
	jr z,l90edh		;90e2  ; Yes -> allow
	cp 026h		;90e4  ; Room type $26?
	jr z,l90edh		;90e6  ; Yes -> allow
	cp 02ah		;90e8  ; Room type $2A?
	jp nz,l916eh		;90ea  ; No match -> skip projectile spawning
; ==========================================================================
; PROJECTILE SPAWNING ($90ED)
; ==========================================================================
; Attempts to spawn a new projectile. Has a ~6.25% chance of spawning
; per frame (4 out of 64). Finds a free slot in the 4-projectile array,
; then configures its position, speed, and direction.
;
l90edh:
; --- Random chance check: ~6.25% spawn rate ---
	call GET_RANDOM		;90ed  ; A = random 0-255
	and 03fh		;90f0  ; Mask to 0-63
	inc a			;90f2  ; Range now 1-64
	cp 005h		;90f3  ; Is A >= 5?
	jr nc,l914eh		;90f5  ; Yes (60/64 = 93.75%) -> don't spawn

; --- Find a free projectile slot (4 slots, 7 bytes each) ---
	ld hl,l9411h		;90f7  ; HL -> projectile array start
	ld de,00007h		;90fa  ; DE = 7 (projectile struct size)
l90fdh:
	add hl,de			;90fd  ; HL -> next slot
	dec a			;90fe  ; Decrement slot index
	jr nz,l90fdh		;90ff  ; Loop to selected slot

; --- Check if selected slot is free ---
	ld a,(hl)			;9101  ; A = slot active flag
	or a			;9102  ; Is it occupied?
	jr nz,l914eh		;9103  ; Occupied -> abort spawning

; --- Initialize projectile in this slot ---
	ld (hl),0e0h		;9105  ; Byte 0: active flag + timer ($E0 = 224 frames)
	inc hl			;9107
	ld (hl),009h		;9108  ; Byte 1: projectile type ($09)
	inc hl			;910a
	ld (hl),000h		;910b  ; Byte 2: state flags (0 = initial)
	inc hl			;910d

; --- Set projectile starting map position ---
	ld de,00120h		;910e  ; DE = $0120 (default spawn position offset)
	ld (hl),e			;9111  ; Byte 3: map position low byte ($20)
	inc hl			;9112
	ld (hl),d			;9113  ; Byte 4: map position high byte ($01)
	inc hl			;9114

; --- Select random velocity from velocity table ---
	call GET_RANDOM		;9115  ; A = random 0-255
	and 007h		;9118  ; Mask to 0-7 (8 velocity entries)
	add a,a			;911a  ; A = entry * 2 (word-sized entries)
	ld e,a			;911b  ; DE = table index
	ld d,000h		;911c
	ld ix,l8d47h		;911e  ; IX -> velocity table at $8D47
	add ix,de		;9122  ; IX -> selected velocity entry
	ld a,(ix+000h)		;9124  ; A = X velocity (8-10)
	ld (hl),a			;9127  ; Byte 5: X velocity
	inc hl			;9128
	ld a,(ix+001h)		;9129  ; A = Y velocity (0 or 8)
	ld (hl),a			;912c  ; Byte 6: Y velocity

; --- 50% chance to flip projectile direction ---
	call GET_RANDOM		;912d  ; A = random 0-255
	and 001h		;9130  ; Mask to 0 or 1
	jr z,l914eh		;9132  ; If 0 (50%) -> don't flip, keep original direction

; --- Flip projectile: XOR velocities with $0C to reverse direction ---
	ld a,(hl)			;9134  ; A = Y velocity
	xor 00ch		;9135  ; Flip direction bits
	ld (hl),a			;9137  ; Store flipped Y velocity
	dec hl			;9138
	ld a,(hl)			;9139  ; A = X velocity
	xor 00ch		;913a  ; Flip direction bits
	ld (hl),a			;913c  ; Store flipped X velocity

; --- Flip spawn position for reversed projectile ---
	dec hl			;913d
	ld d,(hl)			;913e  ; D = map position high
	dec hl			;913f
	ld e,(hl)			;9140  ; E = map position low (DE = original position)
	push hl			;9141  ; Save position pointer
	dec hl			;9142
	ld (hl),01fh		;9143  ; Set width parameter = 31
	ld hl,0001fh		;9145  ; HL = 31 (room width)
	add hl,de			;9148  ; HL = position + 31 (mirror to other side)
	ex de,hl			;9149  ; DE = mirrored position
; --- Store mirrored position back ---
	pop hl			;914a  ; Restore position pointer
	ld (hl),e			;914b  ; Store mirrored position low byte
	inc hl			;914c
	ld (hl),d			;914d  ; Store mirrored position high byte

; ==========================================================================
; PROJECTILE POST-PROCESSING ($914E)
; ==========================================================================
; After potential spawning, process all 4 projectile slots.
; For projectiles of type $08 or $0A, toggle bits in their velocity
; byte (XOR $03) to create oscillating/spiraling movement.
;
l914eh:
	ld b,004h		;914e  ; B = 4 projectile slots
	ld ix,l9418h		;9150  ; IX -> projectile slot 1 (skip slot 0)
	ld de,00007h		;9154  ; DE = 7 (projectile struct size)

l9157h:
	ld a,(ix+001h)		;9157  ; A = projectile type
	cp 008h		;915a  ; Is it type $08 (spiraling)?
	jr z,l9162h		;915c  ; Yes -> toggle velocity
	cp 00ah		;915e  ; Is it type $0A (spiraling variant)?
	jr nz,l916ah		;9160  ; No -> skip, leave velocity unchanged

; --- Toggle spiral direction ---
l9162h:
	ld a,(ix+005h)		;9162  ; A = velocity byte
	xor 003h		;9165  ; Toggle bits 0-1 (changes direction)
	ld (ix+005h),a		;9167  ; Store updated velocity

l916ah:
	add ix,de		;916a  ; IX -> next projectile slot
	djnz l9157h		;916c  ; Loop for all 4 slots
; ==========================================================================
; OBJECT/PROJECTILE MOVEMENT LOOP ($916E)
; ==========================================================================
; Processes 6 active objects (projectiles and special items) per frame.
; Each object has a 7-byte structure starting at $940A:
;   Byte 0: Active flag (0=inactive)
;   Byte 1: Reserved
;   Byte 2: Reserved
;   Bytes 3-4: Map position pointer
;   Byte 5: Movement direction bits (bit 0=left, 1=right, 2=up, 3=down)
;   Byte 6: Secondary parameter
;
; Objects move by calling MOVE_LEFT/RIGHT/UP/DOWN based on direction bits.
; After moving, collision checks are performed against the map.
;
l916eh:
	ld a,006h		;916e  ; A = 6 (starting object count, counts down)
	ld ix,l940ah		;9170  ; IX -> first object slot

l9174h:
	ld (OBJECT_RENDER_CTR),a		;9174  ; Store current object index

; --- Check if object slot is active ---
	ld a,(ix+000h)		;9177  ; A = object active flag
	or a			;917a  ; Is it inactive?
	jp z,l9256h		;917b  ; Inactive -> skip to next slot

; --- Mark object's map position as occupied ---
	ld l,(ix+003h)		;917e  ; HL = object map pointer
	ld h,(ix+004h)		;9181
	ld de,GAME_ENTRY		;9184  ; DE = $620C (sprite workspace offset)
	add hl,de			;9187  ; HL -> sprite workspace position
	ld (hl),001h		;9188  ; Mark position as occupied

; --- Move object according to direction bits ---
	ld c,(ix+005h)		;918a  ; C = direction bits
	push bc			;918d  ; Save BC (object counter + direction)
	ld b,002h		;918e  ; B = 2 (move 2 steps per frame for speed)

l9190h:
	bit 0,c		;9190  ; Bit 0 = move left?
	call nz,MOVE_LEFT		;9192  ; Yes -> move left
	bit 1,c		;9195  ; Bit 1 = move right?
	call nz,MOVE_RIGHT		;9197  ; Yes -> move right
	bit 2,c		;919a  ; Bit 2 = move up?
	call nz,MOVE_UP		;919c  ; Yes -> move up
	bit 3,c		;919f  ; Bit 3 = move down?
	call nz,MOVE_DOWN		;91a1  ; Yes -> move down

; --- Check for wall collision after movement ---
	ld l,(ix+003h)		;91a4  ; HL = updated map pointer
	ld h,(ix+004h)		;91a7
	ld de,HISCORE_TBL		;91aa  ; DE = collision check offset
	add hl,de			;91ad  ; HL -> collision data at new position
	ld a,(hl)			;91ae  ; A = collision tile value
	cp 0c7h		;91af  ; Is it solid? (>= $C7)
	jr c,l91bbh		;91b1  ; Not solid -> continue movement

; --- Hit a wall: deactivate object ---
l91b3h:
	ld (ix+000h),000h		;91b3  ; Mark object as inactive
	pop bc			;91b7  ; Restore BC
	jp l9256h		;91b8  ; Skip to next object slot
; --- No wall collision: check for entity interaction ---
l91bbh:
	ld de,006c0h		;91bb  ; DE = offset to entity type 1 collision zone
	add hl,de			;91be  ; HL -> entity check position

; --- Check for guard (type 1) collision ---
	ld a,(OBJECT_RENDER_CTR)		;91bf  ; A = current object index
	cp 006h		;91c2  ; Is this the player's projectile (index 6)?
	jr nz,l91d1h		;91c4  ; No -> skip guard collision check

	ld a,(hl)			;91c6  ; A = entity data at position
	inc a			;91c7  ; Test if $FF (no entity)
	jr z,l91d1h		;91c8  ; No entity -> check alternate collision

; --- Hit a guard: set active combatant type = 1 ---
	ld a,001h		;91ca  ; A = 1 (guard hit)
l91cch:
	ld (l8d42h),a		;91cc  ; Set active combatant type
	jr l91b3h		;91cf  ; Deactivate projectile (hit something)

; --- Check for alternate entity (type 2) collision ---
l91d1h:
	ld de,00240h		;91d1  ; DE = offset to entity type 2 collision zone
	add hl,de			;91d4  ; HL -> alternate entity check position
	ld a,(OBJECT_RENDER_CTR)		;91d5  ; A = current object index
	cp 006h		;91d8  ; Is this the player's projectile?
	jr nz,l9214h		;91da  ; No -> skip alternate check

	ld a,(hl)			;91dc  ; A = alternate entity data at position
	inc a			;91dd  ; Test if $FF (no entity)
	jr z,l9214h		;91de  ; No entity -> continue

; --- Hit an alternate entity: set active combatant type = 2 ---
	ld a,002h		;91e0  ; A = 2 (alternate entity hit)
	jr l91cch		;91e2  ; Set combatant type and deactivate projectile
; ==========================================================================
; LOAD_GUARD_ANIM ($91E4)
; ==========================================================================
; Loads guard-specific animation parameters. Guards use a smaller sprite
; size (3 wide x 4 high) compared to the player (7 wide x 6 high).
; Called when the entity's behavior state is one of the guard states
; (1, 4, 6, 9, 10). Returns A=0 so subsequent CP checks fail, preventing
; the same entity from loading guard anim multiple times.
;
; On exit:
;   A = 0 (forces all subsequent CP tests to fail)
;   Animation table and sprite dimensions set for guard sprites
;
LOAD_GUARD_ANIM:
	ld a,007h		;91e4  ; A = 7 (guard animation counter)
	push hl			;91e6  ; Save HL
	ld hl,ladf5h		;91e7  ; HL -> guard animation table
	ld (0b9a1h),hl		;91ea  ; Set current animation pointer
	pop hl			;91ed  ; Restore HL

	ld (0b9b3h),a		;91ee  ; Set animation counter = 7
	inc a			;91f1  ; A = 8
	ld (08fb9h),a		;91f2  ; Set sprite height = 8
	ld (0992bh),a		;91f5  ; Set collision height = 8
	ld a,003h		;91f8  ; A = 3
	ld (08fb7h),a		;91fa  ; Set sprite width = 3
	inc a			;91fd  ; A = 4
	ld (09929h),a		;91fe  ; Set collision width = 4
	ld a,010h		;9201  ; A = 16 ($10)
	ld (0b9f8h),a		;9203  ; Set rendering X offset = 16
	ld (0b9e8h),a		;9206  ; Set collision X offset = 16
	ld a,018h		;9209  ; A = 24 ($18)
	ld (0b9f1h),a		;920b  ; Set rendering Y offset = 24
	ld (0b9e2h),a		;920e  ; Set collision Y offset = 24
	xor a			;9211  ; A = 0 (prevents double-loading)
	ret			;9212

; --- Object render counter variable ---
OBJECT_RENDER_CTR:
	nop			;9213  ; DATA: $00 (current object index being processed)
; --- Check for player collision (projectile hitting player) ---
l9214h:
	ld de,lfb80h		;9214  ; DE = offset to player collision zone
	add hl,de			;9217  ; HL -> player collision data at position
	ld a,(OBJECT_RENDER_CTR)		;9218  ; A = current object index
	cp 006h		;921b  ; Is this the player's own projectile?
	jr z,l9235h		;921d  ; Yes -> don't damage self, continue movement

; --- Enemy projectile hit player? ---
	ld a,(hl)			;921f  ; A = player collision data at projectile position
	cp 0e0h		;9220  ; Is value >= $E0 (player present)?
	jr nc,l9235h		;9222  ; No collision -> continue movement

; --- Enemy projectile hit the player! ---
	ld b,005h		;9224  ; B = 5 (damage score deduction)
	call UPDATE_SCORE		;9226  ; Deduct 5 points from score
	call FONT_LOOKUP		;9229  ; Set up hit effect rendering

; --- Check if player is still alive ---
	ld a,(ix+000h)		;922c  ; A = object active flag
	cp 0e0h		;922f  ; Is it still strongly active?
	jr c,l91b3h		;9231  ; No -> deactivate projectile
	jr l923ch		;9233  ; Yes -> continue to rendering

; --- Continue movement loop (object has more steps to process) ---
l9235h:
	ld c,(ix+006h)		;9235  ; C = secondary direction parameter
	dec b			;9238  ; Decrement movement step counter
	jp nz,l9190h		;9239  ; More steps -> loop back to movement

; ==========================================================================
; OBJECT RENDERING UPDATE ($923C)
; ==========================================================================
; After movement is complete, update the object's visual representation
; on the tile map. Toggles the active flag's bit 0 to create animation.
;
l923ch:
	pop bc			;923c  ; Restore BC (object counter + saved data)
	ld l,(ix+003h)		;923d  ; HL = object map pointer
	ld h,(ix+004h)		;9240
	ld de,l68cch		;9243  ; DE = offset to tile rendering buffer
	add hl,de			;9246  ; HL -> rendering position in buffer
	ld a,(ix+000h)		;9247  ; A = object active flag
	ld (hl),a			;924a  ; Write active flag as tile data
	xor 001h		;924b  ; Toggle bit 0 (animation flip)
	ld (ix+000h),a		;924d  ; Store toggled flag (animates next frame)
	ld de,lf940h		;9250  ; DE = offset to dirty flag buffer
	add hl,de			;9253  ; HL -> dirty flag for this tile
	ld (hl),001h		;9254  ; Mark tile as dirty
; ==========================================================================
; OBJECT LOOP ADVANCE ($9256)
; ==========================================================================
; Move to the next object slot and loop until all 6 objects are processed.
;
l9256h:
	ld de,00007h		;9256  ; DE = 7 (object struct size)
	add ix,de		;9259  ; IX -> next object slot
	ld a,(OBJECT_RENDER_CTR)		;925b  ; A = current object index
	dec a			;925e  ; Decrement (counting down from 6)
	jp nz,l9174h		;925f  ; More objects -> loop back

; ==========================================================================
; ROOM 0 SPECIAL: OUTDOOR RENDERING ($9262)
; ==========================================================================
; Room 0 (leftmost room, outdoor area) has special rendering for
; the background/sky area. Sets up rendering parameters based on
; the player's Y position to create a parallax effect.
;
	ld a,(09942h)		;9262  ; A = current room X
	or a			;9265  ; Is it room 0?
	jr nz,l928dh		;9266  ; No -> skip outdoor rendering

; --- Calculate parallax offset based on player Y ---
	ld d,a			;9268  ; D = 0
	ld a,(PLAYER_Y)		;9269  ; A = player Y position
	add a,030h		;926c  ; A = Y + $30 (offset into background)
	ld e,a			;926e  ; DE = $00xx (Y-based offset)
	ld hl,0006eh		;926f  ; HL = $006E (base background address)
	add hl,de			;9272  ; HL = $006E + player_Y + $30
	ld (l9c88h),hl		;9273  ; Store background render address

; --- Render background with two text block calls ---
	ld a,005h		;9276  ; A = 5 (background tile count)
	ld (l9c8ah),a		;9278  ; Set tile count parameter
	ld de,l9c8bh		;927b  ; DE -> first rendering parameter block
	ld bc,GFX_PATTERN_TBL		;927e  ; BC -> graphics pattern table
	call RENDER_TEXT_BLK		;9281  ; Render upper background section

	ld de,INPUT_DISPATCH		;9284  ; DE -> second rendering parameter block
	ld bc,GAME_ENTRY		;9287  ; BC -> game entry (tile workspace)
	call RENDER_TEXT_BLK		;928a  ; Render lower background section
; ==========================================================================
; WEATHER/ENVIRONMENTAL ANIMATION ($928D)
; ==========================================================================
; Manages animated environmental effects (rain, snow, wind, etc.).
; The animation system has a timer (IX+0) and a current pattern index
; (IX+1). Each frame, the timer counts down. When it expires, a new
; random pattern is selected. The pattern is drawn as a 4x3 block
; of tiles (12 tiles total, each row = 4 tiles with stride 28).
;
l928dh:
	ld a,(l7a01h)		;928d  ; A = weather animation enable flag
	or a			;9290  ; Is weather active?
	jr z,l92f5h		;9291  ; No -> skip weather

; --- Decrement animation timer ---
	ld ix,l7a02h		;9293  ; IX -> weather state data
	dec (ix+000h)		;9297  ; Decrement timer
	jr nz,l92afh		;929a  ; Not expired -> check current pattern

; --- Timer expired: select new random pattern ---
	call GET_RANDOM		;929c  ; A = random byte
	ld (ix+000h),a		;929f  ; Set new random timer duration
	and 003h		;92a2  ; Mask to 0-3
	jr nz,l92b6h		;92a4  ; Non-zero (75%) -> use small pattern set

; --- 25% chance: select from extended pattern set (4-7) ---
	call GET_RANDOM		;92a6  ; A = random byte
	and 003h		;92a9  ; Mask to 0-3
	add a,004h		;92ab  ; A = 4-7 (extended pattern range)
	jr l92c3h		;92ad  ; Use this pattern

; --- Check if current pattern needs updating ---
l92afh:
	ld a,(ix+001h)		;92af  ; A = current pattern index
	bit 2,a		;92b2  ; Is bit 2 set (extended pattern)?
	jr nz,l92c3h		;92b4  ; Yes -> keep current pattern

; --- Select random pattern from basic set (0-3) ---
l92b6h:
	call GET_RANDOM		;92b6  ; A = random byte
	and 003h		;92b9  ; Mask to 0-3
	cp (ix+001h)		;92bb  ; Same as current pattern?
	jr nz,l92c3h		;92be  ; Different -> use it
	inc a			;92c0  ; Same -> increment to avoid repetition
	and 003h		;92c1  ; Wrap to 0-3

; --- Apply selected pattern ---
l92c3h:
	ld (ix+001h),a		;92c3  ; Store new pattern index

; --- Calculate pattern data address ---
; Pattern index * 12 (4 tiles wide x 3 rows) to get offset.
; Multiplication: A*12 = A*4 + A*8 = A<<2 + A<<3.
;
	add a,a			;92c6  ; A = index * 2
	add a,a			;92c7  ; A = index * 4
	ld b,a			;92c8  ; B = index * 4
	add a,a			;92c9  ; A = index * 8
	add a,b			;92ca  ; A = index * 12
	ld l,a			;92cb  ; HL = pattern data offset
	ld h,000h		;92cc
	ld de,l79a1h		;92ce  ; DE -> weather pattern table base
	add hl,de			;92d1  ; HL -> selected pattern data
	ex de,hl			;92d2  ; DE = pattern data source

; --- Copy 4x3 pattern block to tile map ---
	ld hl,l64d1h		;92d3  ; HL -> tile map destination
	ld ix,l6291h		;92d6  ; IX -> dirty flag array
	ld c,003h		;92da  ; C = 3 rows

l92dch:
	ld b,004h		;92dc  ; B = 4 tiles per row
l92deh:
	ld a,(de)			;92de  ; A = pattern tile
	ld (hl),a			;92df  ; Write tile to map
	ld (ix+000h),001h		;92e0  ; Mark tile as dirty
	inc ix		;92e4  ; Next dirty flag
	inc de			;92e6  ; Next source tile
	inc hl			;92e7  ; Next destination tile
	djnz l92deh		;92e8  ; Loop for 4 tiles in row

; --- Advance to next row (stride = 28 to skip to next row) ---
	push de			;92ea  ; Save source pointer
	ld de,0001ch		;92eb  ; DE = 28 (stride between rows)
	add ix,de		;92ee  ; Advance dirty flag pointer
	add hl,de			;92f0  ; Advance tile map pointer
	pop de			;92f1  ; Restore source pointer
	dec c			;92f2  ; Row counter--
	jr nz,l92dch		;92f3  ; More rows -> loop
; ==========================================================================
; FLOOR TYPE CHECK & SCREEN FLIP ($92F5)
; ==========================================================================
; Check the tile under the player to determine floor type (normal vs
; slippery/ice), then flip screen buffers and check for cheat code.
;
l92f5h:
; --- Check floor tile under player ---
	ld hl,(PLAYER_POS_PTR)		;92f5  ; HL = player map position pointer
	ld de,l66eeh		;92f8  ; DE = offset to floor tile layer
	add hl,de			;92fb  ; HL -> floor tile at player position
	ld a,(hl)			;92fc  ; A = floor tile value
	cp 08ah		;92fd  ; Is it tile $8A (ice/slippery floor)?
	ld a,028h		;92ff  ; A = $28 (normal movement speed)
	jr nz,l9305h		;9301  ; Not ice -> use normal speed
	ld a,018h		;9303  ; A = $18 (reduced speed for ice floor)

; --- Apply movement speed to all 3 movement channels ---
l9305h:
	ld (la9e2h),a		;9305  ; Set movement channel 0 speed
	ld (la9f3h),a		;9308  ; Set movement channel 1 speed
	ld (laa04h),a		;930b  ; Set movement channel 2 speed

; --- Flip screen buffers (end of frame rendering) ---
	call SWAP_SCREEN_BUFS		;930e  ; Swap front/back display buffers

; --- Check for cheat code (key combination) ---
; Calls ROM routine at $028E (keyboard scan), checks for specific
; key combination (D=$27, E=$20) to activate cheat/debug mode.
;
	call 0028eh		;9311  ; Call keyboard scan ROM routine
	jr nz,l9325h		;9314  ; No key match -> skip cheat

	ld a,027h		;9316  ; A = $27 (expected D value)
	cp d			;9318  ; Check first key
	jr nz,l9325h		;9319  ; No match -> skip

	ld a,020h		;931b  ; A = $20 (expected E value)
	cp e			;931d  ; Check second key
	jr nz,l9325h		;931e  ; No match -> skip

; --- Cheat code activated! ---
	ld a,003h		;9320  ; A = 3 (cheat mode value)
	ld (ENTITY_ARRAY),a		;9322  ; Set entity array header to cheat mode
; ==========================================================================
; TILE REFRESH SCORING ($9325)
; ==========================================================================
; If the tile refresh flag is set (l9944h != 0), generate a random
; rendering sub-state (avoiding values 1 and 4) and award 20 points.
; This handles bonus scoring for special tile interactions.
;
l9325h:
	ld a,(l9944h)		;9325  ; A = tile refresh flag
	or a			;9328  ; Is it set?
	jr z,l933fh		;9329  ; No -> skip

; --- Generate random sub-state (avoiding 1 and 4) ---
l932bh:
	ld a,r		;932b  ; A = R register (pseudo-random)
	and 007h		;932d  ; Mask to 0-7
	cp 001h		;932f  ; Is it 1?
	jr z,l932bh		;9331  ; Yes -> retry (1 is reserved)
	cp 004h		;9333  ; Is it 4?
	jr z,l932bh		;9335  ; Yes -> retry (4 is reserved)

; --- Apply sub-state and award bonus ---
	ld (09f9fh),a		;9337  ; Set screen rendering sub-state
	ld b,014h		;933a  ; B = 20 (bonus points)
	call UPDATE_SCORE		;933c  ; Award 20 points
; ==========================================================================
; GAME-OVER DETECTION ($933F)
; ==========================================================================
; Check for game-over or mission-complete conditions.
; ENTITY_ARRAY byte determines game state:
;   0 = normal play
;   1+ with ENTITY_ARRAY_LEN=0 = trigger transition to end sequence
;   2 = time expired (checked below)
;
l933fh:
	ld a,(ENTITY_ARRAY)		;933f  ; A = game state flag
	or a			;9342  ; Is it zero (normal play)?
	jr z,l935dh		;9343  ; Yes -> skip to timer countdown

; --- Game state is non-zero: check if transition already in progress ---
	ld a,(ENTITY_ARRAY_LEN)		;9345  ; A = entity count / transition flag
	or a			;9348  ; Is transition already started?
	jr nz,l935dh		;9349  ; Yes -> skip (already transitioning)

; --- Start end-game transition ---
	ld de,lad54h		;934b  ; DE -> end-game behavior handler
	ld a,001h		;934e  ; A = 1 (transition started)
	ld (ENTITY_ARRAY_LEN),a		;9350  ; Mark transition as started
	ld hl,lb7f2h		;9353  ; HL -> end-game rendering handler
	ld (09968h),de		;9356  ; Set entity behavior pointer to end handler
	ld (08b11h),hl		;935a  ; Patch main loop rendering handler
; ==========================================================================
; TIMER COUNTDOWN ($935D)
; ==========================================================================
; Counts down the game timer each frame. The timer is stored as 3
; ASCII digit bytes at l993ah-l993ch (hundreds, tens, ones).
; A prescaler at l993dh divides the frame rate by 20 ($14).
;
; Timer reaches "000": display "TIME IS SHORT " message.
; Timer rolls below "000" (to "/99"): set game state to 2 (time expired).
;
; If game is already in state 2 (time expired), skip countdown entirely.
;
l935dh:
	ld a,(ENTITY_ARRAY)		;935d  ; A = game state flag
	cp 002h		;9360  ; Is it 2 (time expired)?
	jr z,l93a8h		;9362  ; Yes -> skip timer, jump to frame end

; --- Decrement prescaler (divides by 20) ---
	ld hl,l993dh		;9364  ; HL -> timer prescaler byte
	dec (hl)			;9367  ; Prescaler--
	jr nz,l93a8h		;9368  ; Not zero -> skip (not time to decrement yet)
	ld (hl),014h		;936a  ; Reset prescaler to 20 ($14)

; --- Decrement ones digit ---
	dec hl			;936c  ; HL -> ones digit (l993ch)
	dec (hl)			;936d  ; Decrement digit
	ld a,02fh		;936e  ; A = $2F (ASCII '0' - 1 = underflow)
	cp (hl)			;9370  ; Did ones digit underflow?
	jr nz,l939dh		;9371  ; No -> just display updated timer

; --- Ones underflowed: reset to '9', carry to tens ---
	ld (hl),039h		;9373  ; Reset ones digit to '9' ($39)
	dec hl			;9375  ; HL -> tens digit (l993bh)
	dec (hl)			;9376  ; Decrement tens digit
	cp (hl)			;9377  ; Did tens digit underflow?
	jr nz,l939dh		;9378  ; No -> display updated timer

; --- Tens underflowed: reset to '9', carry to hundreds ---
	ld (hl),039h		;937a  ; Reset tens digit to '9' ($39)
	dec hl			;937c  ; HL -> hundreds digit (l993ah)
	dec (hl)			;937d  ; Decrement hundreds digit
	ld a,(hl)			;937e  ; A = hundreds digit
	cp 030h		;937f  ; Is it '0' ($30)?
	jr nz,l9392h		;9381  ; Not zero -> check for complete expiry

; --- Timer reached "000": display warning message ---
	push af			;9383  ; Save A and flags
	push hl			;9384  ; Save HL
	ld de,05066h		;9385  ; DE = screen address (status message area)
	ld hl,l93fah		;9388  ; HL -> "TIME IS SHORT " message (14 tiles)
	ld c,00eh		;938b  ; C = 14 tiles
	call PRINT_TILE		;938d  ; Display "TIME IS SHORT "
	pop hl			;9390  ; Restore HL
	pop af			;9391  ; Restore A

; --- Check if timer has expired completely (rolled below "000") ---
l9392h:
	cp 02fh		;9392  ; Did hundreds digit underflow to '/' ($2F)?
	jr nz,l939dh		;9394  ; No -> timer still has time, display it

; --- Timer expired! Set game state to 2 ---
	ld a,002h		;9396  ; A = 2 (time expired state)
	ld (ENTITY_ARRAY),a		;9398  ; Set game state to time expired
	jr l93a8h		;939b  ; Skip to frame end

; --- Display current timer digits on HUD ---
l939dh:
	ld de,05096h		;939d  ; DE = screen addr (HUD timer display area)
	ld hl,l993ah		;93a0  ; HL -> 3 timer digits (ASCII)
	ld c,003h		;93a3  ; C = 3 tiles (3 digits)
	call PRINT_TILE		;93a5  ; Draw timer digits on HUD

; --- End of frame: return to frame initialization ---
l93a8h:
	jp l8a6fh		;93a8  ; Jump back to $8A6F for screen flip + next frame
; ==========================================================================
; MOVEMENT ROUTINES ($93AB-$93F8)
; ==========================================================================
; Four direction-specific movement routines for projectiles/objects.
; Each checks boundary conditions, updates the position field, and
; adjusts the map pointer by a direction-specific offset.
;
; Map pointer offsets:
;   Left:  $FFE0 (-32) — move one column left in 32-byte row
;   Right: $0020 (+32) — move one column right
;   Up:    $FFFF (-1)  — move one row up
;   Down:  $0001 (+1)  — move one row down
;
; If the object hits a boundary, it's deactivated (IX+0 = 0) and
; two return addresses are popped (unwinding the movement loop).
;

; --- MOVE_LEFT: decrement column, offset -32 ---
MOVE_LEFT:
	xor a			;93ab  ; A = 0 (left boundary)
	cp (ix+001h)		;93ac  ; Is object at column 0?
	jr z,l93c5h		;93af  ; Yes -> hit boundary, deactivate
	dec (ix+001h)		;93b1  ; Decrement column position
	ld de,IM2_HANDLER_AREA		;93b4  ; DE = $FFE0 (-32 map offset)

; --- Common: apply map pointer offset ---
l93b7h:
	ld l,(ix+003h)		;93b7  ; HL = current map pointer
	ld h,(ix+004h)		;93ba
	add hl,de			;93bd  ; HL = new map position
	ld (ix+003h),l		;93be  ; Store updated map pointer
	ld (ix+004h),h		;93c1
	ret			;93c4

; --- Boundary hit: deactivate object and exit movement loop ---
l93c5h:
	ld (ix+000h),000h		;93c5  ; Mark object as inactive
	pop de			;93c9  ; Discard return address 1 (from CALL MOVE_xxx)
	pop de			;93ca  ; Discard return address 2 (from movement loop)
	jp l9256h		;93cb  ; Jump to next object in processing loop

; --- MOVE_RIGHT: increment column, offset +32 ---
MOVE_RIGHT:
	ld a,011h		;93ce  ; A = $11 (17 = right boundary)
	cp (ix+001h)		;93d0  ; Is object at column 17?
	jr z,l93c5h		;93d3  ; Yes -> hit boundary, deactivate
	inc (ix+001h)		;93d5  ; Increment column position
	ld de,00020h		;93d8  ; DE = $0020 (+32 map offset)
	jr l93b7h		;93db  ; Apply offset

; --- MOVE_UP: decrement row, offset -1 ---
MOVE_UP:
	xor a			;93dd  ; A = 0 (top boundary)
	cp (ix+002h)		;93de  ; Is object at row 0?
	jr z,l93c5h		;93e1  ; Yes -> hit boundary, deactivate
	dec (ix+002h)		;93e3  ; Decrement row position
	ld de,IM2_JUMP_TARGET		;93e6  ; DE = $FFFF (-1 map offset)
	jr l93b7h		;93e9  ; Apply offset

; --- MOVE_DOWN: increment row, offset +1 ---
MOVE_DOWN:
	ld a,01fh		;93eb  ; A = $1F (31 = bottom boundary)
	cp (ix+002h)		;93ed  ; Is object at row 31?
	jr z,l93c5h		;93f0  ; Yes -> hit boundary, deactivate
	inc (ix+002h)		;93f2  ; Increment row position
	ld de,00001h		;93f5  ; DE = $0001 (+1 map offset)
	jr l93b7h		;93f8  ; Apply offset
; ==========================================================================
; "TIME IS SHORT " MESSAGE DATA ($93FA)
; ==========================================================================
; 14 tile indices spelling "TIME IS SHORT " displayed when timer reaches
; "000". Each byte is an ASCII code / tile index.
;
l93fah:
	ld d,h			;93fa  ; DATA: $54 = 'T'
	ld c,c			;93fb  ; DATA: $49 = 'I'
	ld c,l			;93fc  ; DATA: $4D = 'M'
	ld b,l			;93fd  ; DATA: $45 = 'E'
	jr nz,l9449h		;93fe  ; DATA: $20 $49 = ' I'
	ld d,e			;9400  ; DATA: $53 = 'S'
	jr nz,l9456h		;9401  ; DATA: $20 $53 = ' S'
	ld c,b			;9403  ; DATA: $48 = 'H'
	ld c,a			;9404  ; DATA: $4F = 'O'
	ld d,d			;9405  ; DATA: $52 = 'R'
	ld d,h			;9406  ; DATA: $54 = 'T'
	jr nz,l940ah		;9407  ; DATA: $20 $00 = ' ' + padding

; ==========================================================================
; ENGINE VARIABLES ($9409-$940B)
; ==========================================================================
; Tail variables at the end of the engine code block.
;
l9409h:
	nop			;9409  ; DATA: $00 = entity sub-state flag
l940ah:
	nop			;940a  ; DATA: $00 = entity slot 0 active flag
l940bh:
	nop			;940b  ; DATA: $00 = reserved
