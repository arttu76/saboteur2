; ======================================================================
; code_newgame.asm
; ======================================================================
;
; New Game Logic & ZX0 Decompressor (NEW)
;
; Address range: $90EC-$964B (1376 bytes)
; Source binary: mod_decompressed.bin (loaded at $620C)
;
; Contains:
;   - New game display setup (title, mission text, difficulty UI)
;   - Sprite/tile decompression and rendering engine
;   - ZX0 decompressor (sub_94d0h)
;   - Data tables (entity config, lookup data)
;
; Memory map:
;   $90EC-$916B  Game display initialization (text, attributes, UI)
;   $916C-$91F3  Sprite tile renderer (reads entity table, draws tiles)
;   $91F4-$92F3  DATA: initialization values + embedded text
;   $92F4-$92F9  NEW GAME ENTRY: calls init, jumps to game loop
;   $92FA-$94CF  DATA: entity/room/config tables
;   $94D0-$954D  ZX0 DECOMPRESSOR (sub_94d0h + sub_9525h)
;   $954E-$964B  DATA: address lookup tables
;
; ======================================================================

info_code_end:

; --- GAME DISPLAY INITIALIZATION ($90EC) ---
; Sets up the new game screen: displays title text, mission info,
; difficulty settings, and character selection UI.
;
new_code_start:
	ld hl,l6499h		;90ec  ; HL -> title text data
	ld e,080h		;90ef  ; E = screen column $80
	call sub_d06bh		;90f1  ; Print title text to screen
	ld a,001h		;90f4  ; A = 1 (default config)
l90f6h:
	ld (0c101h),a		;90f6  ; Store game mode config
	ld a,ixl		;90f9  ; A = player selection from info screen
	rra			;90fb  ; Bit 0 → carry
	and 001h		;90fc  ; A = bit 1 of IXL
	ld (lf8fch),a		;90fe  ; Store player type flag
	or a			;9101  ; Test if non-zero
	jr z,l910ch		;9102  ; Skip if player type = 0
	ld hl,l6460h		;9104  ; HL -> player 2 description text
	ld e,021h		;9107  ; E = screen column
	call sub_d06bh		;9109  ; Print player 2 text
l910ch:
	ld a,ixl		;910c  ; A = player selection
	rlca			;910e  ; Bit 7 → carry
	sbc a,a			;910f  ; A = $FF if carry, $00 if not
	jr nz,l9114h		;9110  ; Jump if bit 7 was set
	ld a,0eeh		;9112  ; A = $EE (room ID for starting area)
l9114h:
	ld (0c7f1h),a		;9114  ; Store starting room ID
	inc a			;9117  ; Test if was $FF
	jr z,l9122h		;9118  ; Skip if $FF (no extra text)
	ld hl,l647fh		;911a  ; HL -> mission objective text
	ld e,043h		;911d  ; E = screen column
	call sub_d06bh		;911f  ; Print mission objective
; --- Display game UI elements ---
l9122h:
	ld hl,l63d0h		;9122  ; HL -> UI border/frame text
	ld de,040e7h		;9125  ; DE = screen pos (row 7, col 7)
	call sub_d06bh		;9128  ; Print UI frame top
	ld de,04860h		;912b  ; DE = screen pos (row 3, col 0)
	call sub_d06bh		;912e  ; Print UI frame middle
	ld de,040a0h		;9131  ; DE = screen pos (row 5, col 0)
	inc c			;9134  ; C++ (character count)
	call sub_d06dh		;9135  ; Print tile row
	inc c			;9138  ; C++ (character count)
	ld e,0bfh		;9139  ; E = screen column $BF
	call sub_d06dh		;913b  ; Print another tile row
	ld de,05003h		;913e  ; DE = screen pos (col 3)
	call sub_d06bh		;9141  ; Print credits/author text
	ld e,048h		;9144  ; E = screen column $48
	call sub_d06bh		;9146  ; Print additional text
	ld hl,l6210h		;9149  ; HL -> character set / graphics data
	ld e,0e3h		;914c  ; E = screen column
	ld c,019h		;914e  ; C = 25 tiles
	call sub_d06eh		;9150  ; Print block of tiles (25 wide)
; --- Set screen attributes ---
	ld hl,058e0h		;9153  ; HL = attribute area
	ld a,002h		;9156  ; A = 2 (red ink, black paper)
	ld b,010h		;9158  ; B = 16 (16×16=256 bytes)
	call sub_d30eh		;915a  ; Fill attributes (red)
	ld h,05ah		;915d  ; HL = $5Ae0 (next attribute row)
	ld a,004h		;915f  ; A = 4 (green ink, black paper)
	ld b,002h		;9161  ; B = 2 (2×16=32 bytes)
	call sub_d30eh		;9163  ; Fill attributes (green)
	ld hl,00505h		;9166  ; HL = $0505 (attribute pair)
	ld (05908h),hl		;9169  ; Store attribute config
; --- Initialize game engine ---
	call sub_dff9h		;916c  ; Wait for all keys released (debounce)
	ld b,014h		;916f  ; B = 20 (input wait frames)
; --- Wait for input or timeout ---
l9171h:
	call sub_d03ah		;9171  ; Check keyboard input
	and a			;9174  ; A = 0 if no key pressed
	jr z,l917ah		;9175  ; No key → skip debounce loop
	halt			;9177  ; Wait one frame (ISR)
	djnz l9171h		;9178  ; Loop up to 20 frames
; --- SPRITE TILE RENDERER ---
; Reads 2-byte pointers from table at $5BA6, extracts high 3 bits of
; each 16-bit value to produce 5 bytes of tile data, then copies the
; result into entity memory at $A51F (5 bytes per entity, 33 entities).
;
l917ah:
	ld hl,05ba6h		;917a  ; HL -> 16-bit pointer table
	ld bc,engine_end		;917d  ; BC = output buffer pointer
	push bc			;9180  ; Save buffer pointer (for later)
	push bc			;9181  ; Save again (for decompressor)
l9182h:
	ld e,(hl)			;9182  ; DE = read 16-bit value from table
	inc hl			;9183
	ld d,(hl)			;9184
	inc hl			;9185
	push hl			;9186  ; Save table position
	ex de,hl			;9187  ; HL = 16-bit value
	ld e,005h		;9188  ; E = 5 bytes to extract
l918ah:
	xor a			;918a  ; A = 0
	add hl,hl			;918b  ; Shift HL left 3 times,
	rla			;918c  ; rotating top 3 bits into A
	add hl,hl			;918d
	rla			;918e
	add hl,hl			;918f
	rla			;9190
	ld (bc),a			;9191  ; Store extracted byte
	inc bc			;9192  ; Next output position
	dec e			;9193  ; Count down
	jr nz,l918ah		;9194  ; Loop 5 bytes
	pop hl			;9196  ; Restore table position
	ld a,0e8h		;9197  ; End marker: L == $E8?
	cp l			;9199
	jr nz,l9182h		;919a  ; Loop until end of table
; --- Copy tile data to entity table ---
	ld a,021h		;919c  ; A = 33 entities
	pop hl			;919e  ; HL = buffer start (from push at $9181)
	ld de,la51fh		;919f  ; DE -> entity sprite table
	ld b,000h		;91a2  ; B = 0 (for LDIR: BC = 5)
l91a4h:
	ld c,005h		;91a4  ; C = 5 bytes per entity record
	ldir		;91a6  ; Copy 5 bytes from buffer to entity table
	inc de			;91a8  ; Skip 4 bytes (entity record is 9 bytes,
	inc de			;91a9  ;   5 copied + 4 skipped)
	inc de			;91aa
	inc de			;91ab
	dec a			;91ac  ; Count down entities
	jr nz,l91a4h		;91ad  ; Loop 33 entities
; --- Decompress sprite data ---
	ld hl,l661ah		;91af  ; HL -> ZX0 compressed sprite data
	pop de			;91b2  ; DE = decompression output buffer
	push de			;91b3  ; Save for tile renderer below
	call sub_94d0h		;91b4  ; ZX0 decompress sprites
; --- Render decompressed tiles to screen ---
	ld hl,05040h		;91b7  ; HL = pixel screen source area
	ld de,05a40h		;91ba  ; DE = attribute destination area
	exx			;91bd  ; Switch to alternate registers
	pop de			;91be  ; DE' = decompressed tile data
; --- TILE RENDERER LOOP ---
; Reads tile indices from decompressed data (DE'), looks up tile
; addresses via $5E00/$5F00 tables, copies 8 pixel rows + 1 attribute
; byte per tile to screen memory.
;
l91bfh:
	ld a,(de)			;91bf  ; A = tile index from data stream
	inc de			;91c0
	ld l,a			;91c1  ; L = tile index
	inc a			;91c2  ; Test for $FF end marker
	jp z,lbfe5h		;91c3  ; $FF → end of tile list, exit
	ld h,05eh		;91c6  ; HL = $5E00 + tile_index (lookup table)
	ld c,(hl)			;91c8  ; C = low byte of tile address
	inc h			;91c9  ; HL = $5F00 + tile_index
	ld h,(hl)			;91ca  ; H = high byte of tile address
	ld l,c			;91cb  ; HL' = tile data address
	ld bc,036bfh		;91cc  ; BC = tile data offset adjustment
	add hl,bc			;91cf  ; HL' = adjusted tile address
	ld c,001h		;91d0  ; C = 1 tile (default: single tile)
	cp 011h		;91d2  ; Index >= $10? (multi-tile block)
	jr c,l91d9h		;91d4  ; Single tile: skip count read
	ld a,(de)			;91d6  ; A = tile count for this block
	ld c,a			;91d7  ; C = tile count
	inc de			;91d8
; --- Draw C tiles, each 8 pixel rows + 1 attribute ---
l91d9h:
	push hl			;91d9  ; Save tile data pointer (alt regs)
	exx			;91da  ; Switch to main registers
	push hl			;91db  ; Save screen position
	ld b,008h		;91dc  ; B = 8 pixel rows per tile
l91deh:
	exx			;91de  ; Alt regs: HL' = tile data
	ld a,(hl)			;91df  ; A = pixel row from tile data
	inc hl			;91e0
	exx			;91e1  ; Main regs: HL = screen address
	ld (hl),a			;91e2  ; Write pixel row to screen
	inc h			;91e3  ; Next screen row (H++ = next line)
	djnz l91deh		;91e4  ; Loop 8 pixel rows
	pop hl			;91e6  ; Restore screen column position
	inc hl			;91e7  ; Next column
	exx			;91e8  ; Alt regs
	ld a,(hl)			;91e9  ; A = attribute byte from tile data
	exx			;91ea  ; Main regs
	ld (de),a			;91eb  ; Write attribute to attribute area
	inc de			;91ec  ; Next attribute position
	exx			;91ed  ; Alt regs
	pop hl			;91ee  ; Restore tile data pointer
	dec c			;91ef  ; Count down tiles
	jr nz,l91d9h		;91f0  ; Loop for all tiles in block
	jr l91bfh		;91f2  ; Next tile index from stream
; --- DATA: initialization values + embedded text ($91F4-$92F3) ---
; These bytes are data, not executable code. Contains configuration
; values and ASCII text including "LONEL BRIGGSY  EXPLORER" at $92DD.
;
l91f4h:
	ld a,d			;91f4
	nop			;91f5
	ld a,(bc)			;91f6
	add hl,de			;91f7
	ei			;91f8
	inc de			;91f9
	jr z,l9203h		;91fa
	and d			;91fc
	ld b,08ah		;91fd
	inc b			;91ff
	rlca			;9200
	jr z,$+16		;9201
l9203h:
	and a			;9203
l9204h:
	jr l9204h		;9204
	jp z,la2f4h		;9206
	ld a,(de)			;9209
	inc d			;920a
	rla			;920b
	adc a,b			;920c
	inc d			;920d
	rrca			;920e
	and b			;920f
	ld de,0098ah		;9210
	inc c			;9213
	ex (sp),hl			;9214
	dec b			;9215
	ei			;9216
	inc d			;9217
	inc e			;9218
	adc a,e			;9219
	or d			;921a
	ld a,(bc)			;921b
	and d			;921c
	cp a			;921d
	inc c			;921e
	xor e			;921f
	inc bc			;9220
	ld b,0a2h		;9221
	ei			;9223
l9224h:
	add hl,de			;9224
	ret m			;9225
	dec de			;9226
	xor 0e9h		;9227
l9229h:
	ex af,af'			;9229
	ld a,(de)			;922a
	jp (hl)			;922b
	jr l9229h		;922c
	xor l			;922e
	call p,sub_fa82h		;922f
	adc a,d			;9232
	rla			;9233
	ld d,028h		;9234
	inc d			;9236
	ld a,a			;9237
	cp a			;9238
	ex (sp),hl			;9239
	and b			;923a
	sub l			;923b
	dec e			;923c
	cp a			;923d
	inc c			;923e
	ei			;923f
	rla			;9240
	and b			;9241
	pop de			;9242
	inc de			;9243
	adc a,(hl)			;9244
	ld bc,05f11h		;9245
	and d			;9248
l9249h:
	rra			;9249
	dec c			;924a
	ld (bc),a			;924b
	jr c,l9249h		;924c
	adc a,d			;924e
	rrca			;924f
	dec b			;9250
	inc b			;9251
	ld e,e			;9252
	djnz l9224h		;9253
	call p,sub_ba22h		;9255
	dec bc			;9258
	inc e			;9259
	jp m,lfa09h		;925a
	dec bc			;925d
	jp c,008ffh		;925e
	ld a,l			;9261
	call p,00dbah		;9262
l9265h:
	rst 28h			;9265
	ld de,00f28h		;9266
	ld l,l			;9269
	djnz l91f4h		;926a
	ret z			;926c
	adc a,(hl)			;926d
	djnz l92b0h		;926e
l9270h:
	ei			;9270
	sub h			;9271
	add hl,bc			;9272
	cp l			;9273
	dec c			;9274
	sub 0afh		;9275
	ld c,0a1h		;9277
	ret c			;9279
	call p,00d6ah		;927a
	ld b,c			;927d
	inc de			;927e
	ld (de),a			;927f
	ld b,c			;9280
	jr l9265h		;9281
	ld (hl),a			;9283
	ld bc,lb601h		;9284
	ld bc,l8e69h		;9287
	ld bc,028f4h		;928a
	inc e			;928d
	and d			;928e
	dec de			;928f
	ret pe			;9290
	jr l9270h		;9291
	dec d			;9293
	ld (l8dcdh),a		;9294
	ld bc,05655h		;9297
	inc d			;929a
	cp 0f6h		;929b
	rst 38h			;929d
	sub 0abh		;929e
	xor d			;92a0
	cp 014h		;92a1
	ld h,068h		;92a3
	ld c,c			;92a5
	or (hl)			;92a6
l92a7h:
	jr nc,l92a7h		;92a7
	xor b			;92a9
	or (hl)			;92aa
	pop de			;92ab
	and (hl)			;92ac
	cp a			;92ad
	add a,0b6h		;92ae
l92b0h:
	or (hl)			;92b0
	jr z,l92c7h		;92b1
	xor c			;92b3
	inc h			;92b4
	ld c,c			;92b5
	ld (hl),h			;92b6
	ld c,c			;92b7
	ld (hl),h			;92b8
	jp (hl)			;92b9
	ld (hl),0dbh		;92ba
	ld (hl),049h		;92bc
	ld l,h			;92be
	daa			;92bf
	ld d,(hl)			;92c0
	dec h			;92c1
	ld a,(hl)			;92c2
	xor c			;92c3
	sbc a,h			;92c4
	ret p			;92c5
	xor b			;92c6
l92c7h:
	add a,a			;92c7
	halt			;92c8
	sub 0ech		;92c9
	ld d,(hl)			;92cb
	call nz,0b6dfh		;92cc
	ld d,c			;92cf
	ld h,0dfh		;92d0
	jp po,lb6f7h		;92d2
	pop de			;92d5
	jp pe,042d7h		;92d6
	jp (hl)			;92d9
	ld l,b			;92da
	in a,(04fh)		;92db
	ld c,h			;92dd  ; DATA: $4C = 'L'
	ld c,a			;92de  ; DATA: $4F = 'O'
	ld c,(hl)			;92df  ; DATA: $4E = 'N'
	ld b,l			;92e0  ; DATA: $45 = 'E'
	ld c,h			;92e1  ; DATA: $4C = 'L'
	jr nz,l9326h		;92e2  ; DATA: $20 = ' ', $42 (offset)
	ld d,d			;92e4  ; DATA: $52 = 'R'
	ld c,c			;92e5  ; DATA: $49 = 'I'
	ld b,a			;92e6  ; DATA: $47 = 'G'
	ld b,a			;92e7  ; DATA: $47 = 'G'
	ld d,e			;92e8  ; DATA: $53 = 'S'
	ld e,c			;92e9  ; DATA: $59 = 'Y'
	jr nz,l930ch		;92ea  ; DATA: $20 = ' ', $20 = ' '
	ld b,l			;92ec  ; DATA: $45 = 'E'
	ld e,b			;92ed  ; DATA: $58 = 'X'
	ld d,b			;92ee  ; DATA: $50 = 'P'
	ld c,h			;92ef  ; DATA: $4C = 'L'
	ld c,a			;92f0  ; DATA: $4F = 'O'
	ld d,d			;92f1  ; DATA: $52 = 'R'
	ld b,l			;92f2  ; DATA: $45 = 'E'
	ld d,d			;92f3  ; DATA: $52 = 'R'
; --- NEW GAME ENTRY POINT ($92F4) ---
; Called from code_entry.asm ($8645: JP l92f4h) after system init.
;
l92f4h:
	call sub_98f1h		;92f4  ; Initialize game state (new game setup)
	jp ldcd0h		;92f7  ; Jump to main game loop
; --- DATA: entity/room/config tables ($92FA-$94CF) ---
	add a,b			;92fa
	nop			;92fb
	ld d,003h		;92fc
	ld c,e			;92fe
	ld ix,(l6a5eh)		;92ff
	ld c,c			;9303
	dec hl			;9304
	ld d,d			;9305
	and d			;9306
	ret m			;9307
	ld d,b			;9308
	ld a,d			;9309
	sbc a,d			;930a
	ex de,hl			;930b
l930ch:
	sub 05ah		;930c
	jr nz,$+44		;930e
	jp nc,04b8fh		;9310
	ret			;9313
	pop de			;9314
	in a,(0b8h)		;9315
	rrca			;9317
	or l			;9318
	cp 055h		;9319
	ld e,b			;931b
	sbc a,(hl)			;931c
	nop			;931d
	ld sp,hl			;931e
	add a,h			;931f
	add a,b			;9320
	and l			;9321
	ld bc,0038eh		;9322
	ret nz			;9325
l9326h:
	jp (hl)			;9326
	ld (lf07fh),hl		;9327
	inc h			;932a
	rrca			;932b
	cp 0fch		;932c
	exx			;932e
	ret m			;932f
	and b			;9330
	nop			;9331
	inc a			;9332
	cp 024h		;9333
	and l			;9335
	ld (hl),l			;9336
	ld d,(hl)			;9337
	ld d,l			;9338
	jp nc,05545h		;9339
	and a			;933c
	ld a,(de)			;933d
	ld (hl),a			;933e
	ld d,(hl)			;933f
	ld e,c			;9340
	sbc a,(hl)			;9341
	dec d			;9342
	ld d,l			;9343
	ld d,075h		;9344
	dec h			;9346
	jp po,0c6e1h		;9347
	ld (00745h),hl		;934a
	ld a,047h		;934d
	dec b			;934f
	ld (hl),e			;9350
	cp 0d5h		;9351
	ld d,l			;9353
	ld h,b			;9354
	cp h			;9355
	nop			;9356
	call m,sub_e00ah		;9357
	adc a,d			;935a
	ret nz			;935b
	inc bc			;935c
	ld l,(hl)			;935d
	ld bc,00f00h		;935e
	ld sp,hl			;9361
	sbc a,d			;9362
	inc a			;9363
	ret p			;9364
	ccf			;9365
	ex (sp),hl			;9366
	ld sp,hl			;9367
	jp (hl)			;9368
	ex (sp),hl			;9369
	ld sp,hl			;936a
l936bh:
	inc a			;936b
	jp (hl)			;936c
	ex (sp),hl			;936d
	nop			;936e
	jp m,lf8c5h		;936f
	ld (0603fh),hl		;9372
	ld l,c			;9375
	ld a,h			;9376
	jr $-126		;9377
	ret po			;9379
	ld (hl),b			;937a
	rlca			;937b
	nop			;937c
	cp 02ah		;937d
	ld b,0beh		;937f
	ld b,a			;9381
	ei			;9382
	rst 38h			;9383
	sbc a,l			;9384
	ld b,055h		;9385
	ld d,(hl)			;9387
	ld a,(bc)			;9388
	nop			;9389
	inc bc			;938a
	ret nz			;938b
	nop			;938c
	call po,sub_f802h		;938d
	adc a,(hl)			;9390
	rrca			;9391
	ret p			;9392
	jp (hl)			;9393
	inc h			;9394
	dec b			;9395
	ret po			;9396
	adc a,d			;9397
	ld bc,lf280h		;9398
	rst 38h			;939b
	cp 09bh		;939c
	nop			;939e
	jr z,$-118		;939f
	ld sp,hl			;93a1
	inc d			;93a2
	ld c,b			;93a3
	add a,c			;93a4
	add a,e			;93a5
	ld (de),a			;93a6
	rrca			;93a7
	rst 38h			;93a8
	rst 38h			;93a9
	ret p			;93aa
	ld a,(bc)			;93ab
	xor d			;93ac
	xor d			;93ad
	or b			;93ae
	ret po			;93af
	ret nc			;93b0
	ld a,(ldd4bh)		;93b1
	ld hl,(l6a5eh)		;93b4
	ld c,c			;93b7
	dec hl			;93b8
	ld d,d			;93b9
	ret m			;93ba
	add hl,hl			;93bb
	ld d,b			;93bc
	ld a,d			;93bd
	and d			;93be
	ex de,hl			;93bf
	sub 05ah		;93c0
	ld hl,(008d2h)		;93c2
	xor 04bh		;93c5
	ret			;93c7
	pop de			;93c8
	inc b			;93c9
	cp 0a6h		;93ca
	jr nc,l936bh		;93cc
	rrca			;93ce
	ld d,l			;93cf
	ld d,(hl)			;93d0
	add a,d			;93d1
	nop			;93d2
	jr c,$+9		;93d3
	ret po			;93d5
	ld sp,hl			;93d6
	adc a,b			;93d7
	dec e			;93d8
	ld a,b			;93d9
	adc a,b			;93da
	ld hl,(l88ach)		;93db
	ld b,b			;93de
	ld d,088h		;93df
	ld b,e			;93e1
	adc a,d			;93e2
	adc a,b			;93e3
	inc h			;93e4
	ld b,(hl)			;93e5
	adc a,b			;93e6
	jr l9413h		;93e7
	sbc a,d			;93e9
	nop			;93ea
	ld h,04ch		;93eb
	ld l,b			;93ed
	sub h			;93ee
	adc a,b			;93ef
	ld bc,l8828h		;93f0
	ld (bc),a			;93f3
	ld d,b			;93f4
l93f5h:
	adc a,b			;93f5
	inc b			;93f6
	and b			;93f7
	adc a,b			;93f8
	dec b			;93f9
	ld b,b			;93fa
	adc a,b			;93fb
	inc b			;93fc
	ret nz			;93fd
	and a			;93fe
	rlca			;93ff
	ex (sp),hl			;9400
	cp 003h		;9401
	add a,b			;9403
	xor a			;9404
	jp (hl)			;9405
	ld b,0d0h		;9406
	ld a,b			;9408
	ret po			;9409
	jp m,043feh		;940a
	rla			;940d
	ld d,l			;940e
	ld d,l			;940f
	add a,b			;9410
	add a,l			;9411
	nop			;9412
l9413h:
	ld h,d			;9413
	ld a,a			;9414
	rst 38h			;9415
	sbc a,(hl)			;9416
	cp 05fh		;9417
	ld a,a			;9419
	ret m			;941a
	add a,e			;941b
	rlca			;941c
	rrca			;941d
	ld c,040h		;941e
	and b			;9420
	pop hl			;9421
	ld (bc),a			;9422
	push hl			;9423
	xor b			;9424
	ld l,(hl)			;9425
	ld a,(hl)			;9426
	cp 083h		;9427
	ld h,e			;9429
	jr $+101		;942a
	ld h,b			;942c
	cp d			;942d
	ret m			;942e
	ex de,hl			;942f
	jr $-99		;9430
	ld h,b			;9432
	ld h,b			;9433
	jr l93f5h		;9434
	rst 38h			;9436
	ld a,(hl)			;9437
	defb 0fdh,0cdh,0aah	;illegal sequence		;9438
	rst 38h			;943b
	ld b,a			;943c
	rlca			;943d
	xor d			;943e
	ld b,l			;943f
	dec b			;9440
	and a			;9441
	rrca			;9442
l9443h:
	ld d,l			;9443
	ld d,l			;9444
	add a,b			;9445
	sub h			;9446
	nop			;9447
	cp d			;9448
	jr c,l9443h		;9449
	sbc a,d			;944b
	ld a,h			;944c
	ret po			;944d
	add hl,hl			;944e
	inc bc			;944f
	adc a,(hl)			;9450
	ld c,0e4h		;9451
	pop de			;9453
	ld (lfc3bh),hl		;9454
	cp d			;9457
	rst 28h			;9458
	ex (sp),hl			;9459
	cp h			;945a
	ld l,c			;945b
	ret p			;945c
	xor c			;945d
	ret nz			;945e
	xor c			;945f
	rrca			;9460
	ld l,a			;9461
	nop			;9462
	rra			;9463
	and (hl)			;9464
	inc de			;9465
	cp d			;9466
	inc bc			;9467
	ret m			;9468
	jp (hl)			;9469
	add a,b			;946a
	adc a,a			;946b
	rra			;946c
	and a			;946d
	ld c,081h		;946e
	jp m,04599h		;9470
	dec b			;9473
	ld b,l			;9474
	defb 0fdh,0fdh,0edh	;illegal sequence		;9475
	ld d,l			;9478
	ld d,(hl)			;9479
	sub e			;947a
	nop			;947b
	and (hl)			;947c
	rst 30h			;947d
	ret m			;947e
	ld (le0ffh),hl		;947f
	cp d			;9482
	rst 8			;9483
	ld sp,hl			;9484
	call 0e099h		;9485
	ld bc,l9affh		;9488
	rst 18h			;948b
	cp 060h		;948c
	ld (lbeffh),hl		;948e
	ld e,d			;9491
	sbc a,a			;9492
	rst 38h			;9493
	ret po			;9494
	inc bc			;9495
	sbc a,e			;9496
	rst 30h			;9497
	ret nz			;9498
	ld h,0ffh		;9499
	ccf			;949b
	adc a,b			;949c
	inc a			;949d
	and l			;949e
	ld a,a			;949f
	call m,00788h		;94a0
	rst 30h			;94a3
	rst 38h			;94a4
	add a,b			;94a5
	ld b,07eh		;94a6
	rst 28h			;94a8
	and d			;94a9
	ld a,a			;94aa
	rst 38h			;94ab
	rlca			;94ac
	call pe,0fc63h		;94ad
	ld sp,hl			;94b0
	adc a,b			;94b1
	adc a,c			;94b2
	ld a,a			;94b3
	exx			;94b4
	jp m,l66bfh		;94b5
	cp l			;94b8
	rrca			;94b9
	cp 0a1h		;94ba
	rlca			;94bc
	ld (hl),l			;94bd
	ld d,l			;94be
	ld e,b			;94bf
l94c0h:
	jp m,01c92h		;94c0
	sub e			;94c3
	ld d,l			;94c4
	sub e			;94c5
	adc a,b			;94c6
	sub e			;94c7
	ld a,d			;94c8
	sub h			;94c9
	ld de,0d194h		;94ca
	sub e			;94cd
	ld b,(hl)			;94ce
	sub h			;94cf
; ==========================================================================
; ZX0 DECOMPRESSOR ($94D0)
; ==========================================================================
; Standard ZX0 decompression algorithm (by Einar Saukas).
; Decompresses data from (HL) to (DE). Uses a bit-stream accumulator
; in A register, refilling from compressed data when exhausted.
;
; Entry: HL = compressed data source, DE = decompression output buffer
; Exit: DE = end of decompressed data
;
; The algorithm alternates between:
;   1. Literal runs: copy N bytes verbatim from source to output
;   2. Match copies: copy N bytes from a previous offset in the output
; Lengths and offsets are Elias-gamma encoded in the bit stream.
;
sub_94d0h:
	ld bc,0ffffh		;94d0  ; BC = $FFFF (initial offset = -1)
	ld (094feh),bc		;94d3  ; Store as self-modifying offset at $94FE
	inc bc			;94d7  ; BC = 0
	ld a,080h		;94d8  ; A = $80 (bit accumulator, MSB set)
	jr l9507h		;94da  ; Jump to literal handler
; --- Match copy: read new offset from stream ---
l94dch:
	ld c,0feh		;94dc  ; C = $FE (offset base)
	add a,a			;94de  ; Shift next bit from accumulator
	jp nz,l94e5h		;94df  ; If bits remain, skip refill
	ld a,(hl)			;94e2  ; Refill: load next byte from stream
	inc hl			;94e3
	rla			;94e4  ; Shift in carry from previous
l94e5h:
	call nc,sub_9525h		;94e5  ; Read Elias-gamma coded offset high bits
	inc c			;94e8  ; C++ (adjust offset)
	ret z			;94e9  ; C==0 → end of compressed data, return
	ld b,c			;94ea  ; B = offset high bits
	ld c,(hl)			;94eb  ; C = offset low byte (literal from stream)
	inc hl			;94ec
	rr b		;94ed  ; Shift BC right (combine offset)
	rr c		;94ef
	ld (094feh),bc		;94f1  ; Store new offset (self-modifying)
	ld bc,00001h		;94f5  ; BC = 1 (minimum match length)
	call nc,sub_9525h		;94f8  ; Read match length
	inc bc			;94fb  ; length++ (minimum is 2)
; --- Execute match copy: copy BC bytes from DE+offset ---
l94fch:
	push hl			;94fc  ; Save source pointer
	ld hl,00000h		;94fd  ; HL = offset (self-modified at $94FE)
	add hl,de			;9500  ; HL = output position + offset (negative)
	ldir		;9501  ; Copy BC bytes from previous output
	pop hl			;9503  ; Restore source pointer
	add a,a			;9504  ; Next bit: 1 = new offset, 0 = literal
	jr c,l94dch		;9505  ; Carry set → read new match offset
; --- Literal handler: copy N bytes verbatim ---
l9507h:
	inc c			;9507  ; C = 1 (minimum literal length)
	add a,a			;9508  ; Shift next bit from accumulator
	jp nz,l950fh		;9509  ; If bits remain, skip refill
	ld a,(hl)			;950c  ; Refill accumulator
	inc hl			;950d
	rla			;950e
l950fh:
	call nc,sub_9525h		;950f  ; Read Elias-gamma coded literal length
	ldir		;9512  ; Copy BC literal bytes to output
	add a,a			;9514  ; Next bit: 1 = new offset, 0 = reuse offset
	jr c,l94dch		;9515  ; Carry set → read new match offset
; --- Reuse previous offset ---
	inc c			;9517  ; C = 1 (minimum match length)
	add a,a			;9518  ; Shift next bit
	jp nz,l951fh		;9519  ; Skip refill if bits remain
	ld a,(hl)			;951c  ; Refill accumulator
	inc hl			;951d
	rla			;951e
l951fh:
	call nc,sub_9525h		;951f  ; Read match length
	jp l94fch		;9522  ; Execute match copy with previous offset
; ==========================================================================
; ELIAS-GAMMA BIT READER ($9525)
; ==========================================================================
; Reads an Elias-gamma encoded value from the bit stream.
; Used by ZX0 decompressor for both lengths and offsets.
;
; The encoding: 1 terminates, 0 means "read another bit into value".
; Short values (1-15) use fast unrolled path.
; Larger values use the looping path at $953F.
;
; Entry: A = bit accumulator, C = partial value
; Exit: BC = decoded value, A = updated accumulator
;
sub_9525h:
	add a,a			;9525  ; Read bit → carry
	rl c		;9526  ; Shift into C
	add a,a			;9528  ; Read terminator bit
	jr nc,sub_9525h		;9529  ; 0 = more bits, loop (via refill if needed)
	ret nz			;952b  ; If A != 0, bits remain → return
	ld a,(hl)			;952c  ; Refill accumulator from stream
	inc hl			;952d
	rla			;952e  ; Shift in carry from previous
	ret c			;952f  ; 1 = terminated → return with value
	add a,a			;9530  ; Continue reading: bit 2 (unrolled)
	rl c		;9531
	add a,a			;9533
	ret c			;9534
	add a,a			;9535  ; Bit 3 (unrolled)
	rl c		;9536
	add a,a			;9538
	ret c			;9539
	add a,a			;953a  ; Bit 4 (unrolled)
	rl c		;953b
	add a,a			;953d
	ret c			;953e
; --- Large values: loop with B overflow ---
l953fh:
	add a,a			;953f  ; Read bit → C, overflow → B
	rl c		;9540
	rl b		;9542
	add a,a			;9544  ; Terminator bit
	jr nc,l953fh		;9545  ; 0 = more bits
	ret nz			;9547  ; Bits remain → return
	ld a,(hl)			;9548  ; Refill
	inc hl			;9549
	rla			;954a
	jr nc,l953fh		;954b  ; Continue if not terminated
	ret			;954d  ; Done → return BC = decoded value
; --- DATA: address lookup tables ($954E-$964B) ---
; Pairs of (address_low, address_high) used as jump/data tables.
; Each 2-byte entry is a pointer to a subroutine or data block.
;
l954eh:
	ld d,e			;954e
	and c			;954f
	ld l,e			;9550
	and c			;9551
	ret p			;9552
	and c			;9553
	sbc a,e			;9554
	and c			;9555
	ld b,h			;9556
	and c			;9557
	ld l,l			;9558
	and d			;9559
	ld e,0a2h		;955a
	or l			;955c
	and d			;955d
	ld c,(hl)			;955e
	and d			;955f
	dec sp			;9560
	and e			;9561
	ret z			;9562
	and d			;9563
	inc hl			;9564
	and e			;9565
	push bc			;9566
	and c			;9567
	pop bc			;9568
	and e			;9569
	ret m			;956a
	and d			;956b
	add a,l			;956c
	and d			;956d
	ld c,d			;956e
	and h			;956f
	cp a			;9570
	and h			;9571
	rst 28h			;9572
	and e			;9573
	sub d			;9574
	and h			;9575
	ld h,a			;9576
	and e			;9577
	sub (hl)			;9578
	and e			;9579
	ex de,hl			;957a
	and h			;957b
	ld a,(de)			;957c
	and h			;957d
	ld h,h			;957e
	and h			;957f
	ld bc,(0d1bch)		;9580
	ld h,0f9h		;9584
	ld a,(de)			;9586
	ld l,a			;9587
	ld l,(hl)			;9588
	inc h			;9589
	ld a,(bc)			;958a
	and (hl)			;958b
	or l			;958c
	ld (bc),a			;958d
	inc e			;958e
	inc bc			;958f
	ld a,(de)			;9590
	ld l,a			;9591
	ld a,(bc)			;9592
	and (hl)			;9593
	or l			;9594
	ld (bc),a			;9595
	inc e			;9596
	inc bc			;9597
	dec h			;9598
	ld a,(de)			;9599
	ld l,a			;959a
	ld l,(hl)			;959b
	inc h			;959c
	ld a,(bc)			;959d
	and (hl)			;959e
	or l			;959f
	ld (bc),a			;95a0
	inc e			;95a1
	inc bc			;95a2
	ld a,(de)			;95a3
	ld l,a			;95a4
	ld a,(bc)			;95a5
	and (hl)			;95a6
	or l			;95a7
	ld (bc),a			;95a8
	inc e			;95a9
	inc bc			;95aa
	dec h			;95ab
	ld a,(de)			;95ac
	ld l,a			;95ad
	ld l,(hl)			;95ae
	inc h			;95af
	ld a,(bc)			;95b0
	and (hl)			;95b1
	or l			;95b2
	ld (bc),a			;95b3
	inc e			;95b4
	inc bc			;95b5
	ld a,(de)			;95b6
	ld l,a			;95b7
	ld a,(bc)			;95b8
	and (hl)			;95b9
	or l			;95ba
	ld (bc),a			;95bb
	inc e			;95bc
	inc bc			;95bd
	dec h			;95be
	ld a,(de)			;95bf
	ld l,a			;95c0
	ld l,(hl)			;95c1
	inc h			;95c2
	ld a,(bc)			;95c3
	and (hl)			;95c4
	or l			;95c5
	ld (bc),a			;95c6
	inc e			;95c7
	inc bc			;95c8
	ld a,(de)			;95c9
	ld l,a			;95ca
	ld a,(bc)			;95cb
	and (hl)			;95cc
	or l			;95cd
	ld (bc),a			;95ce
	ret			;95cf
sub_95d0h:
	ld bc,(0d1bch)		;95d0
	ld h,0fah		;95d4
	ld a,(de)			;95d6
	ld l,a			;95d7
	ld a,(bc)			;95d8
	and (hl)			;95d9
	or l			;95da
	ld (bc),a			;95db
	inc e			;95dc
	inc bc			;95dd
	dec h			;95de
	ld a,(de)			;95df
	ld l,a			;95e0
	ld l,(hl)			;95e1
	inc h			;95e2
	ld a,(bc)			;95e3
	and (hl)			;95e4
	or l			;95e5
	ld (bc),a			;95e6
	inc e			;95e7
	inc bc			;95e8
	ld a,(de)			;95e9
	ld l,a			;95ea
	ld a,(bc)			;95eb
	and (hl)			;95ec
	or l			;95ed
	ld (bc),a			;95ee
	inc e			;95ef
	inc bc			;95f0
	dec h			;95f1
	ld a,(de)			;95f2
	ld l,a			;95f3
	ld l,(hl)			;95f4
	inc h			;95f5
	ld a,(bc)			;95f6
	and (hl)			;95f7
	or l			;95f8
	ld (bc),a			;95f9
	inc e			;95fa
	inc bc			;95fb
	ld a,(de)			;95fc
	ld l,a			;95fd
	ld a,(bc)			;95fe
	and (hl)			;95ff
	or l			;9600
	ld (bc),a			;9601
	inc e			;9602
	inc bc			;9603
	dec h			;9604
	ld a,(de)			;9605
	ld l,a			;9606
	ld l,(hl)			;9607
	inc h			;9608
	ld a,(bc)			;9609
	and (hl)			;960a
	or l			;960b
	ld (bc),a			;960c
	inc e			;960d
	inc bc			;960e
	ld a,(de)			;960f
	ld l,a			;9610
	ld a,(bc)			;9611
	and (hl)			;9612
	or l			;9613
	ld (bc),a			;9614
	inc e			;9615
	inc bc			;9616
	dec h			;9617
	ld a,(de)			;9618
	ld l,a			;9619
	ld l,(hl)			;961a
	inc h			;961b
	ld a,(bc)			;961c
	and (hl)			;961d
	or l			;961e
	ld (bc),a			;961f
	ret			;9620
	add a,b			;9621
	nop			;9622
	ld b,002h		;9623
	jr nc,l96a3h		;9625
	ld a,d			;9627
	ld a,00fh		;9628
	rlca			;962a
	ld bc,01100h		;962b
	ld h,d			;962e
	adc a,a			;962f
	rra			;9630
	sub (hl)			;9631
	rla			;9632
	rra			;9633
	dec b			;9634
	inc bc			;9635
	ld b,c			;9636
	ld c,c			;9637
	nop			;9638
	ld d,d			;9639
	ld h,d			;963a
	ld bc,00323h		;963b
	ld h,0c3h		;963e
	inc bc			;9640
	and d			;9641
	ld bc,00021h		;9642
	ld b,h			;9645
	ld c,c			;9646
	add hl,de			;9647
	sbc a,b			;9648
	call po,sub_f3d2h		;9649
