; ======================================================================
; code_interaction.asm
; ======================================================================
;
; Interaction System: Lifts, Fences, Stashes & Status Messages
;
; Address range: $B40C-$BA0B (1536 bytes)
; Source binary: block7_main.bin (loaded at $620C)
;
; Central interaction handler for the game's interactive objects.
; Called from the main game loop when the player interacts with
; room elements. Processes lifts, fences, stash containers, and
; displays status messages in the HUD area.
;
; Key entry points:
;   lb47ah ($B47A) - Main interaction dispatcher (18 JP refs)
;   STATUS_DISPATCH ($B988) - Status message display hub
;   END_MISSION ($B992) - Mission end handler
;   HANDLE_LIFT ($B7C7) - Core lift/elevator mechanics
;
; Status messages (14 chars each, displayed at $5066):
;   " CODE  NEEDED " ($B560)
;   "CODE  ACCEPTED" ($B56E)
;   " LIFT IS DOWN " ($B58A)
;   "  LIFT IS UP  " ($B598)
;   "  FENCE IS ON " ($B5A6)
;   " FENCE IS OFF " ($B5B4)
;
; Cross-references:
;   Called from: code_mainloop.asm, code_mechanics.asm
;   Calls: PICKUP_ITEM, PRINT_TILE, READ_INPUT, ROOM_TRANS_LEFT
;   Calls: COPY_DATA_BLK, RENDER_MSG_AREA, FONT_DATA
;   Data: ENTITY_ARRAY, PLAYER_POS_PTR, LIFT_STATE_CTR
;
; Memory map:
;   $B40C-$B479  Tile/graphic pattern data (room decoration bitmaps)
;   $B47A-$B506  Main interaction dispatcher & fence logic
;   $B507-$B559  Stash search & item display handlers
;   $B55F-$B5C5  Status message text strings
;   $B5C6-$B5E0  Transition counter setup
;   $B5E1-$B6F5  Directional input & item interaction handlers
;   $B6F6-$B7C6  Lift initialization & direction handlers
;   $B7C7-$B7F1  HANDLE_LIFT - core lift mechanics
;   $B7F2-$B887  Post-lift item pickup & mission text
;   $B888-$B97A  Fence climbing animation (right & left)
;   $B97B-$B99E  STATUS_DISPATCH & END_MISSION
;   $B99F-$BA0B  Entity timeout/collision scanning loop
;
; ======================================================================

; ==========================================================================
; TILE PATTERN DATA ($B40C-$B479)
; ==========================================================================
; Bitmap data for room interaction element graphics (lift doors,
; fence posts, etc.). NOP ($00) bytes are transparent pixels,
; other values are tile indices.
;
b18_end:

; BLOCK 'b19' (start 0xb40c end 0xba0c)
b19_start:
	nop			;b40c  ; DATA: interaction element tile patterns
	nop			;b40d
	nop			;b40e
	nop			;b40f
	nop			;b410
	nop			;b411
	nop			;b412
	nop			;b413
	nop			;b414
	nop			;b415
	nop			;b416
	nop			;b417
	nop			;b418
	nop			;b419
	nop			;b41a
	nop			;b41b
	nop			;b41c
	nop			;b41d
	nop			;b41e
	nop			;b41f
	nop			;b420
	nop			;b421
	nop			;b422
	nop			;b423
	nop			;b424
	nop			;b425
	ld a,a			;b426
	rst 38h			;b427
	rst 38h			;b428
	cp 05fh		;b429
	ld a,a			;b42b
	rst 38h			;b42c
	cp 05fh		;b42d
	rlca			;b42f
	rrca			;b430
	ld c,040h		;b431
	nop			;b433
	nop			;b434
	ld (bc),a			;b435
	ld a,a			;b436
	rst 38h			;b437
	rst 38h			;b438
	cp 000h		;b439
	nop			;b43b
	nop			;b43c
	nop			;b43d
	nop			;b43e
	nop			;b43f
	nop			;b440
	nop			;b441
	nop			;b442
	nop			;b443
	nop			;b444
	nop			;b445
	nop			;b446
	nop			;b447
	nop			;b448
	nop			;b449
	nop			;b44a
	nop			;b44b
	nop			;b44c
	nop			;b44d
	nop			;b44e
	nop			;b44f
	nop			;b450
	nop			;b451
	ld a,(hl)			;b452
	ld a,(hl)			;b453
	ld a,(hl)			;b454
	ld a,(hl)			;b455
	ld h,e			;b456
	jr lb4bch		;b457
	ld h,b			;b459
	ld h,e			;b45a
	jr lb4c0h		;b45b
	ld a,(hl)			;b45d
	ld a,(hl)			;b45e
	jr lb4dfh		;b45f
	ld h,b			;b461
	ld h,b			;b462
	jr $+98		;b463
	ld h,b			;b465
	ld h,b			;b466
	ld a,(hl)			;b467
	ld h,b			;b468
	ld a,(hl)			;b469
	nop			;b46a
	nop			;b46b
	nop			;b46c
	nop			;b46d
	ld b,a			;b46e
	ld b,a			;b46f
	rlca			;b470
	rlca			;b471
	ld b,l			;b472
	ld b,l			;b473
	dec b			;b474
	dec b			;b475
	rrca			;b476
	rrca			;b477
	rrca			;b478
	rrca			;b479
; ==========================================================================
; MAIN INTERACTION DISPATCHER ($B47A)
; ==========================================================================
; Entry point for all player interactions with room elements.
; First tries to pick up an item; if that fails, checks lift state
; and reads directional input to dispatch to the appropriate handler.
;
; Input bits from READ_INPUT: 0=RIGHT, 1=UP, 2=LEFT, 3=FIRE, 4=DOWN
;
lb47ah:
	call 0b0b7h		;b47a  ; Update room/entity collision state
	call PICKUP_ITEM		;b47d  ; Try to pick up item at current position
	jr nz,lb493h		;b480  ; No item picked up -> check lift & input
	; --- Item picked up successfully ---
	ld de,lad54h		;b482  ; DE = post-pickup behavior handler
	ld a,001h		;b485  ; A = 1
	ld (lb860h+1),a		;b487  ; Set score multiplier = 1 (self-modifying)
	ld (ENTITY_ARRAY_LEN),a		;b48a  ; Set active entity count = 1
lb48dh:
	ld hl,lb7f2h		;b48d  ; HL = post-lift item pickup handler
	jp STATUS_DISPATCH		;b490  ; Install handler and return to main loop

; --- No item picked up: check lift state ---
lb493h:
	ld a,(LIFT_STATE_CTR)		;b493  ; A = lift state counter
	cp 010h		;b496  ; Is lift in countdown mode ($10)?
	jp z,lb5f3h		;b498  ; Yes -> handle lift movement (UP direction)
	cp 0c8h		;b49b  ; Is lift sequence completed ($C8)?
	jp z,lf29ah		;b49d  ; Yes -> score/completion handler
	call READ_INPUT		;b4a0  ; Read keyboard/joystick input
	bit 4,a		;b4a3  ; DOWN pressed?
	jp z,lb5e1h		;b4a5  ; No DOWN -> check UP/LEFT/RIGHT/FIRE

; --- DOWN pressed: check for interactive tile below player ---
	ld a,(lae03h)		;b4a8  ; A = tile type below player
	inc a			;b4ab  ; Test for $FF (no interactive tile)
	jp z,0b5c2h		;b4ac  ; No tile below -> transition handler
	ld hl,(PLAYER_POS_PTR)		;b4af  ; HL = player grid position pointer
	ld de,l66eeh		;b4b2  ; DE = offset to tile row below player
	add hl,de			;b4b5  ; HL -> tile below player
	ld a,(hl)			;b4b6  ; A = tile ID at that position
	cp 08ah		;b4b7  ; Is it interactive object tile ($8A)?
	jp nz,0b5c2h		;b4b9  ; No -> transition handler
; --- Interactive tile found: determine object type ---
lb4bch:
	ld hl,(07747h)		;b4bc  ; HL = room draw handler pointer
	ld a,(hl)			;b4bf  ; A = room command byte at this position
lb4c0h:
	cp 03dh		;b4c0  ; Is it $3D (stash/container)?
	jr z,lb507h		;b4c2  ; Yes -> stash search handler
	cp 04dh		;b4c4  ; Is it $4D (fence switch)?
	jp z,lb4edh		;b4c6  ; Yes -> fence toggle handler

; --- Default: toggle lift up/down ---
lb4c9h:
	ld a,(ROOM_ENEMY_CFG)		;b4c9  ; A = room enemy config
	xor 0eeh		;b4cc  ; Toggle enemy behavior bits
	ld (ROOM_ENEMY_CFG),a		;b4ce  ; Store updated config
	ld a,(ROOM_OBJ_PLACE)		;b4d1  ; A = room object placement flag
	xor 0ffh		;b4d4  ; Invert: ON ($FF) <-> OFF ($00)
	ld (ROOM_OBJ_PLACE),a		;b4d6  ; Store updated flag
	ld hl,lb58ah		;b4d9  ; HL -> " LIFT IS DOWN " text
	inc a			;b4dc  ; Was placement OFF (now $00+1=1)?
	jr z,lb4e2h		;b4dd  ; If was ON (now $00) -> show "LIFT IS DOWN"
lb4dfh:
	ld hl,0b598h		;b4df  ; HL -> "  LIFT IS UP  " text
lb4e2h:
	ld c,00eh		;b4e2  ; C = 14 characters
	ld de,05066h		;b4e4  ; DE = HUD status message area
	call PRINT_TILE		;b4e7  ; Display status message
	jp MAIN_LOOP		;b4ea  ; Return to game loop

; --- Fence toggle handler ---
lb4edh:
	ld a,(07717h)		;b4ed  ; A = fence enable flag from room data
	inc a			;b4f0  ; Test for $FF (fence disabled in this room)
	jr z,lb4c9h		;b4f1  ; If disabled -> treat as lift toggle instead
	ld hl,0908fh		;b4f3  ; HL -> fence state byte
	ld a,(hl)			;b4f6  ; A = current fence state
	xor 011h		;b4f7  ; Toggle fence: $00 <-> $11
	ld (hl),a			;b4f9  ; Store new fence state
	ld hl,0b5b4h		;b4fa  ; HL -> " FENCE IS OFF " text
	ld c,00eh		;b4fd  ; C = 14 characters
	inc a			;b4ff  ; Test if fence now OFF ($00+1=1)
	jr z,lb4e2h		;b500  ; If OFF -> display "FENCE IS OFF"
	ld hl,lb5a6h		;b502  ; HL -> "  FENCE IS ON " text
	jr lb4e2h		;b505  ; Display "FENCE IS ON"
; ==========================================================================
; STASH SEARCH ($B507)
; ==========================================================================
; Player searches a stash/container. Checks held code item against the
; stash's required code level. Three outcomes:
;   - No code item held:   " CODE  NEEDED "
;   - Wrong code level:    "CODE  REJECTED"
;   - Correct/better code: "CODE  ACCEPTED" + reveal stash contents
;
lb507h:
	ld de,05066h		;b507  ; DE = HUD status message area
	ld c,00eh		;b50a  ; C = 14 characters
	ld hl,STASH_SEARCH_IDX		;b50c  ; HL -> stash search code index
	ld a,(STASH_ITEM_TYPE)		;b50f  ; A = player's held code item type
	or a			;b512  ; Does player have a code item?
	jr z,lb516h		;b513  ; No -> use existing search index
	ld (hl),a			;b515  ; Copy held code type to search index
lb516h:
	ld a,(hl)			;b516  ; A = current search code index
	or a			;b517  ; Is it zero (no code at all)?
	jr z,lb54ch		;b518  ; Yes -> display "CODE  NEEDED"
	ld a,(lb55fh)		;b51a  ; A = required code level for this stash
	cp (hl)			;b51d  ; Compare: required vs player's code
	jr nc,lb555h		;b51e  ; If required >= player's -> check exact/reject

; --- Code accepted: player's code exceeds requirement ---
lb520h:
	ld a,(STASH_ITEM_TYPE)		;b520  ; A = held code item type
	or a			;b523  ; Is it a valid item?
	jr nz,lb52dh		;b524  ; Yes -> skip font rendering
	push de			;b526  ; Save screen address
	push bc			;b527  ; Save char count
	call FONT_DATA		;b528  ; Render item display in HUD
	pop bc			;b52b
	pop de			;b52c
lb52dh:
	ld a,(STASH_SEARCH_IDX)		;b52d  ; A = accepted code value
	ld (STASH_ITEM_TYPE),a		;b530  ; Transfer stash contents to held item
	ld hl,0b56eh		;b533  ; HL -> "CODE  ACCEPTED" text
	call PRINT_TILE		;b536  ; Display acceptance message

; --- Update HUD item display ---
lb539h:
	ld de,05085h		;b539  ; DE = HUD item display position
	ld (laf8ah),de		;b53c  ; Update item display address pointer
	inc de			;b540  ; DE = next tile position
	ld hl,le762h		;b541  ; HL -> item graphic tile data
	ld c,00eh		;b544  ; C = 14 tiles
	call PRINT_TILE		;b546  ; Draw item graphic in HUD
	jp MAIN_LOOP		;b549  ; Return to game loop

; --- No code item held ---
lb54ch:
	ld hl,lb560h		;b54c  ; HL -> " CODE  NEEDED " text
	call PRINT_TILE		;b54f  ; Display "CODE  NEEDED"
	jp MAIN_LOOP		;b552  ; Return to game loop

; --- Check for exact match or rejection ---
lb555h:
	jr z,lb520h		;b555  ; If codes equal -> accepted
	ld hl,lb57ch		;b557  ; HL -> "CODE  REJECTED" text
	call PRINT_TILE		;b55a  ; Display "CODE  REJECTED"
	jr lb539h		;b55d  ; Update HUD item display anyway
; ==========================================================================
; STATUS MESSAGE TEXT DATA ($B55F-$B5C2)
; ==========================================================================
; 14-character status messages displayed in the HUD area at $5066.
; Each message is exactly 14 bytes. Read as tile data by PRINT_TILE.
; The disassembler decodes these data bytes as Z80 instructions.
;
lb55fh:
	nop			;b55f  ; Stash code requirement level (variable, $00 = none)

; --- " CODE  NEEDED " ($B560-$B56D) ---
lb560h:
	jr nz,$+69		;b560  ; DATA: $20,$43 = " C"
	ld c,a			;b562  ; DATA: $4F = "O"
	ld b,h			;b563  ; DATA: $44 = "D"
	ld b,l			;b564  ; DATA: $45 = "E"
	jr nz,lb587h		;b565  ; DATA: $20,$20 = "  "
	ld c,(hl)			;b567  ; DATA: $4E = "N"
	ld b,l			;b568  ; DATA: $45 = "E"
	ld b,l			;b569  ; DATA: $45 = "E"
	ld b,h			;b56a  ; DATA: $44 = "D"
	ld b,l			;b56b  ; DATA: $45 = "E"
	ld b,h			;b56c  ; DATA: $44 = "D"
	jr nz,lb5b2h		;b56d  ; DATA: $20 = " " + next msg byte

; --- "CODE  ACCEPTED" ($B56E-$B57B) ---
	ld c,a			;b56f  ; DATA: $4F = "O"
	ld b,h			;b570  ; DATA: $44 = "D"
	ld b,l			;b571  ; DATA: $45 = "E"
	jr nz,lb594h		;b572  ; DATA: $20,$20 = "  "
	ld b,c			;b574  ; DATA: $41 = "A"
	ld b,e			;b575  ; DATA: $43 = "C"
	ld b,e			;b576  ; DATA: $43 = "C"
	ld b,l			;b577  ; DATA: $45 = "E"
	ld d,b			;b578  ; DATA: $50 = "P"
	ld d,h			;b579  ; DATA: $54 = "T"
	ld b,l			;b57a  ; DATA: $45 = "E"
	ld b,h			;b57b  ; DATA: $44 = "D"

; --- "CODE  REJECTED" ($B57C-$B589) ---
lb57ch:
	ld b,e			;b57c  ; DATA: $43 = "C"
	ld c,a			;b57d  ; DATA: $4F = "O"
	ld b,h			;b57e  ; DATA: $44 = "D"
	ld b,l			;b57f  ; DATA: $45 = "E"
	jr nz,$+34		;b580  ; DATA: $20,$20 = "  "
	ld d,d			;b582  ; DATA: $52 = "R"
	ld b,l			;b583  ; DATA: $45 = "E"
	ld c,d			;b584  ; DATA: $4A = "J"
	ld b,l			;b585  ; DATA: $45 = "E"
	ld b,e			;b586  ; DATA: $43 = "C"
lb587h:
	ld d,h			;b587  ; DATA: $54 = "T"
	ld b,l			;b588  ; DATA: $45 = "E"
	ld b,h			;b589  ; DATA: $44 = "D"

; --- " LIFT IS DOWN " ($B58A-$B597) ---
lb58ah:
	jr nz,lb5d8h		;b58a  ; DATA: $20,$4C = " L"
	ld c,c			;b58c  ; DATA: $49 = "I"
	ld b,(hl)			;b58d  ; DATA: $46 = "F"
	ld d,h			;b58e  ; DATA: $54 = "T"
	jr nz,$+75		;b58f  ; DATA: $20,$49 = " I"
	ld d,e			;b591  ; DATA: $53 = "S"
	jr nz,lb5d8h		;b592  ; DATA: $20,$44 = " D"
lb594h:
	ld c,a			;b594  ; DATA: $4F = "O"
	ld d,a			;b595  ; DATA: $57 = "W"
	ld c,(hl)			;b596  ; DATA: $4E = "N"
	jr nz,lb5b9h		;b597  ; DATA: $20 = " " + next msg byte

; --- "  LIFT IS UP  " ($B598-$B5A5) ---
	jr nz,$+78		;b599  ; DATA: $20,$4C = " L"
	ld c,c			;b59b  ; DATA: $49 = "I"
	ld b,(hl)			;b59c  ; DATA: $46 = "F"
	ld d,h			;b59d  ; DATA: $54 = "T"
	jr nz,$+75		;b59e  ; DATA: $20,$49 = " I"
	ld d,e			;b5a0  ; DATA: $53 = "S"
	jr nz,$+87		;b5a1  ; DATA: $20,$55 = " U"
	ld d,b			;b5a3  ; DATA: $50 = "P"
	jr nz,lb5c6h		;b5a4  ; DATA: $20,$20 = "  "

; --- "  FENCE IS ON " ($B5A6-$B5B3) ---
lb5a6h:
	jr nz,lb5c8h		;b5a6  ; DATA: $20,$20 = "  "
	ld b,(hl)			;b5a8  ; DATA: $46 = "F"
	ld b,l			;b5a9  ; DATA: $45 = "E"
	ld c,(hl)			;b5aa  ; DATA: $4E = "N"
	ld b,e			;b5ab  ; DATA: $43 = "C"
	ld b,l			;b5ac  ; DATA: $45 = "E"
	jr nz,$+75		;b5ad  ; DATA: $20,$49 = " I"
	ld d,e			;b5af  ; DATA: $53 = "S"
	jr nz,lb601h		;b5b0  ; DATA: $20,$4F = " O"
lb5b2h:
	ld c,(hl)			;b5b2  ; DATA: $4E = "N"
	jr nz,lb5d5h		;b5b3  ; DATA: $20 = " " + next msg byte

; --- " FENCE IS OFF " ($B5B4-$B5C1) ---
	ld b,(hl)			;b5b5  ; DATA: $46 = "F"
	ld b,l			;b5b6  ; DATA: $45 = "E"
	ld c,(hl)			;b5b7  ; DATA: $4E = "N"
	ld b,e			;b5b8  ; DATA: $43 = "C"
lb5b9h:
	ld b,l			;b5b9  ; DATA: $45 = "E"
	jr nz,$+75		;b5ba  ; DATA: $20,$49 = " I"
	ld d,e			;b5bc  ; DATA: $53 = "S"
	jr nz,$+81		;b5bd  ; DATA: $20,$4F = " O"
	ld b,(hl)			;b5bf  ; DATA: $46 = "F"
	ld b,(hl)			;b5c0  ; DATA: $46 = "F"
	jr nz,$+60		;b5c1  ; DATA: $20 = " " (last byte + next)
; ==========================================================================
; TRANSITION COUNTER SETUP ($B5C3)
; ==========================================================================
; Sets up screen transition timing when no interactive tile was found.
; The 3 bytes at $B5C3-$B5C5 may be consumed as part of the text data
; above when z80dasm disassembles this area.
;
	add hl,bc			;b5c3  ; (post-text code)
	sub h			;b5c4
	or a			;b5c5  ; Test transition counter state
lb5c6h:
	jr z,lb5d3h		;b5c6  ; If zero -> short transition
lb5c8h:
	ld a,002h		;b5c8  ; A = 2 (long transition delay)
	ld de,lac58h		;b5ca  ; DE = transition behavior handler
	ld hl,laf45h		;b5cd  ; HL = transition render handler
	jp lb985h		;b5d0  ; Set transition counter and dispatch
lb5d3h:
	ld a,001h		;b5d3  ; A = 1 (short transition delay)
lb5d5h:
	ld (TRANSITION_CTR),a		;b5d5  ; Set screen transition counter
lb5d8h:
	ld hl,lafdch		;b5d8  ; HL = default render handler
	ld de,lab92h		;b5db  ; DE = default behavior handler
	jp STATUS_DISPATCH		;b5de  ; Install handlers and return

; ==========================================================================
; DIRECTIONAL INPUT HANDLERS ($B5E1)
; ==========================================================================
; Process UP/LEFT/RIGHT/FIRE input when DOWN was not pressed.
; Dispatches to movement, lift, or fence climbing based on direction
; and adjacent tile types.
;

; --- Check UP (bit 1) ---
lb5e1h:
	bit 1,a		;b5e1  ; UP pressed?
	jr z,lb5ffh		;b5e3  ; No -> check LEFT
	ld a,(PLAYER_DIR)		;b5e5  ; A = player facing direction
	cp 000h		;b5e8  ; Facing right (0)?
	jr z,lb5f3h		;b5ea  ; Yes -> handle UP while facing right
	dec a			;b5ec  ; Turn player toward right (dir--)
	ld (PLAYER_DIR),a		;b5ed  ; Store new direction
	jp MAIN_LOOP		;b5f0  ; Return (just turned, no movement)

; --- UP + facing right: activate lift going up ---
lb5f3h:
	call LIFT_HANDLER		;b5f3  ; Initialize lift sound/state
	ld hl,l9c18h		;b5f6  ; HL = cutscene/scroll up handler
	ld de,labbch		;b5f9  ; DE = scroll behavior handler
	jp STATUS_DISPATCH		;b5fc  ; Install handlers and return

; --- Check LEFT (bit 2) ---
lb5ffh:
	bit 2,a		;b5ff  ; LEFT pressed?
lb601h:
	jr z,lb65bh		;b601  ; No LEFT -> check RIGHT
	ld a,(PLAYER_DIR)		;b603  ; A = player facing direction
	cp 000h		;b606  ; Facing right?
	ld a,(ITEM_INTERACT_TBL)		;b608  ; A = tile interaction type (right)
	jr z,lb610h		;b60b  ; If facing right, use right-side tile
	ld a,(lae1eh)		;b60d  ; A = tile interaction type (left)
lb610h:
	cp 0d4h		;b610  ; Is tile a climbable fence ($D4)?
	jr nz,lb624h		;b612  ; No -> check for ladder/door tiles
	ld a,(l6671h)		;b614  ; A = fence height/state
	cp 008h		;b617  ; Is fence climbable (height = 8)?
	jr nz,lb624h		;b619  ; No -> check for ladder/door tiles
	; --- Start fence climbing animation (rightward) ---
	call ANIM_SEQ_SETUP		;b61b  ; Set up climbing animation sequence
	ld hl,lb888h		;b61e  ; HL = fence climb right handler
lb621h:
	jp STATUS_DISPATCH_2		;b621  ; Install render handler

; --- Check adjacent tile for ladder/door interaction ---
lb624h:
	ld a,(PLAYER_DIR)		;b624  ; A = player facing direction
	cp 000h		;b627  ; Facing right?
	ld a,(lae1bh)		;b629  ; A = adjacent tile type (right)
	jr z,lb631h		;b62c  ; If facing right, use right-side tile
	ld a,(lae1ch)		;b62e  ; A = adjacent tile type (left)
lb631h:
	cp 02ch		;b631  ; Tile $2C (door type 1)?
	jr z,lb642h		;b633  ; Yes -> enter door
	cp 025h		;b635  ; Tile $25 (door type 2)?
	jr z,lb642h		;b637  ; Yes -> enter door
	cp 009h		;b639  ; Tile $09 (ladder)?
	jr z,lb642h		;b63b  ; Yes -> use ladder
	cp 005h		;b63d  ; Tile $05 (passage)?
	jp nz,laf2ah		;b63f  ; None of these -> default handler

; --- Enter door/ladder: install movement handlers ---
lb642h:
	ld hl,lb709h		;b642  ; HL = movement checking handler
	ld de,0ab68h		;b645  ; DE = movement behavior handler
	ld (09968h),de		;b648  ; Install behavior handler (entity)
	ld (08b11h),hl		;b64c  ; Install render handler (self-modifying)
	jp lb7b1h		;b64f  ; Execute rightward movement

; --- Display status for door/ladder interaction ---
DISPLAY_STATUS:
	ld hl,lb709h		;b652  ; HL = movement checking handler
	ld de,0ab68h		;b655  ; DE = movement behavior handler
	jp STATUS_DISPATCH		;b658  ; Install handlers via dispatcher
; --- Check RIGHT (bit 0) ---
lb65bh:
	bit 0,a		;b65b  ; RIGHT pressed?
	jr z,lb679h		;b65d  ; No -> check FIRE
	ld a,(PLAYER_DIR)		;b65f  ; A = player facing direction
	cp 001h		;b662  ; Already facing left (1)?
	jr z,lb66dh		;b664  ; Yes -> handle RIGHT while facing left
	inc a			;b666  ; Turn player toward left (dir++)
	ld (PLAYER_DIR),a		;b667  ; Store new direction
	jp MAIN_LOOP		;b66a  ; Return (just turned, no movement)

; --- RIGHT + facing left: activate lift going down ---
lb66dh:
	call LIFT_HANDLER		;b66d  ; Initialize lift sound/state
	ld hl,l9b6ah		;b670  ; HL = cutscene/scroll down handler
	ld de,labbch		;b673  ; DE = scroll behavior handler
	jp STATUS_DISPATCH		;b676  ; Install handlers and return

; --- Check FIRE (bit 3) ---
lb679h:
	bit 3,a		;b679  ; FIRE pressed?
	jr z,lb6f3h		;b67b  ; No input -> return to main loop
	ld a,(PLAYER_DIR)		;b67d  ; A = player facing direction
	or a			;b680  ; Facing right (0)?
	jr nz,lb6a4h		;b681  ; No -> skip special tile check

; --- FIRE while facing right: check for special exit tile ---
	ld hl,(PLAYER_POS_PTR)		;b683  ; HL = player grid position
	ld de,l66cch		;b686  ; DE = offset to adjacent tile
	add hl,de			;b689  ; HL -> adjacent tile
	ld a,(hl)			;b68a  ; A = tile ID
	cp 062h		;b68b  ; Is it tile $62 (special exit/motorbike)?
	jr nz,lb6a4h		;b68d  ; No -> normal FIRE handling

; --- Trigger cutscene: motorbike escape sequence ---
	ld a,0feh		;b68f  ; A = $FE (transition state)
	ld (LIFT_STATE_CTR),a		;b691  ; Set lift state to transition
	ld hl,l9d1fh		;b694  ; HL = cutscene phase 2 handler
	ld de,0aa72h		;b697  ; DE = cutscene behavior handler
	ld a,0fdh		;b69a  ; A = $FD (cutscene active)
	ld (LIFT_STATE_CTR),a		;b69c  ; Set lift state to cutscene mode
	ld a,06dh		;b69f  ; A = $6D (cutscene duration, 109 frames)
	jp lb985h		;b6a1  ; Set transition counter and dispatch

; --- FIRE: check fence climbing (leftward) ---
lb6a4h:
	ld a,(PLAYER_DIR)		;b6a4  ; A = player facing direction
	or a			;b6a7  ; Facing right?
	ld a,(ITEM_INTERACT_TBL)		;b6a8  ; A = interaction tile (right side)
	jr z,lb6b0h		;b6ab  ; If right, use right-side tile
	ld a,(lae1eh)		;b6ad  ; A = interaction tile (left side)
lb6b0h:
	cp 0d4h		;b6b0  ; Is it a climbable fence ($D4)?
	jr nz,lb6c4h		;b6b2  ; No -> check for door tiles
	ld a,(l6671h)		;b6b4  ; A = fence height/state
	cp 008h		;b6b7  ; Is fence climbable?
	jr z,lb6c4h		;b6b9  ; Height=8 (already climbed) -> skip
	; --- Start fence climbing animation (leftward) ---
	call ANIM_SEQ_SETUP		;b6bb  ; Set up climbing animation sequence
	ld hl,lb8f7h		;b6be  ; HL = fence climb left handler
	jp STATUS_DISPATCH_2		;b6c1  ; Install render handler

; --- FIRE: check for door/passage tiles ---
lb6c4h:
	ld a,(PLAYER_DIR)		;b6c4  ; A = player facing direction
	cp 000h		;b6c7  ; Facing right?
	ld a,(lae15h)		;b6c9  ; A = tile ahead (right)
	jr z,lb6d1h		;b6cc  ; If right, use right-side tile
	ld a,(lae16h)		;b6ce  ; A = tile ahead (left)
lb6d1h:
	cp 009h		;b6d1  ; Tile $09 (ladder)?
	jp z,DISPLAY_STATUS		;b6d3  ; Yes -> display status
	cp 005h		;b6d6  ; Tile $05 (passage)?
	jp z,DISPLAY_STATUS		;b6d8  ; Yes -> display status
	cp 025h		;b6db  ; Tile $25 (door type 2)?
	jp z,DISPLAY_STATUS		;b6dd  ; Yes -> display status
	cp 02ch		;b6e0  ; Tile $2C (door type 1)?
	jp z,DISPLAY_STATUS		;b6e2  ; Yes -> display status
	cp 010h		;b6e5  ; Tile $10 (special door)?
	jp z,DISPLAY_STATUS		;b6e7  ; Yes -> display status
	; --- No interactive tile: start default animation ---
	ld hl,lb07eh		;b6ea  ; HL = default animation handler
	ld de,ANIM_SEQ_TBL		;b6ed  ; DE = animation sequence table
	jp STATUS_DISPATCH		;b6f0  ; Install handlers

; --- No directional input: return to main loop ---
lb6f3h:
	jp MAIN_LOOP		;b6f3
; ==========================================================================
; LIFT_HANDLER - Lift Sound & State Init ($B6F6)
; ==========================================================================
; Initializes the lift movement sound effect and copies lift state data.
; Called before starting any lift/elevator movement.
;
LIFT_HANDLER:
	ld hl,labe6h		;b6f6  ; HL = lift sound effect data source
	ld (09dbbh),hl		;b6f9  ; Set PLAY_BEEP data pointer (self-modifying)
	ld de,labd4h		;b6fc  ; DE = lift state buffer destination
	ld bc,00012h		;b6ff  ; BC = 18 bytes to copy
	ldir		;b702  ; Copy lift parameters to state buffer
	xor a			;b704  ; A = 0
	ld (l9dc6h),a		;b705  ; Clear screen flip state
	ret			;b708

; ==========================================================================
; MOVEMENT CHECK HANDLER ($B709)
; ==========================================================================
; Called each frame during door/ladder movement. Checks if the player
; has reached a passable tile. If the tile ahead is not passable,
; ends the movement. Handles LEFT/RIGHT/FIRE/UP input during movement.
;
lb709h:
	ld a,(PLAYER_DIR)		;b709  ; A = player facing direction
	cp 000h		;b70c  ; Facing right?
	ld a,(lae15h)		;b70e  ; A = tile ahead (right)
	jr z,lb716h		;b711  ; If right, use right-side tile
	ld a,(lae16h)		;b713  ; A = tile ahead (left)
lb716h:
	; --- Check if tile is passable ---
	cp 005h		;b716  ; Tile $05 (passage)?
	jr z,CHECK_INTERACT		;b718  ; Yes -> continue movement
	cp 009h		;b71a  ; Tile $09 (ladder)?
	jr z,CHECK_INTERACT		;b71c  ; Yes -> continue
	cp 010h		;b71e  ; Tile $10 (special door)?
	jr z,CHECK_INTERACT		;b720  ; Yes -> continue
	cp 025h		;b722  ; Tile $25 (door type 2)?
	jr z,CHECK_INTERACT		;b724  ; Yes -> continue
	cp 02ch		;b726  ; Tile $2C (door type 1)?
	jr z,CHECK_INTERACT		;b728  ; Yes -> continue
	cp 0cch		;b72a  ; Tile $CC (boundary marker)?
	jr z,CHECK_INTERACT		;b72c  ; Yes -> continue
	cp 0ffh		;b72e  ; Tile $FF (empty/open)?
	jr z,CHECK_INTERACT		;b730  ; Yes -> continue
	jp END_MISSION		;b732  ; Non-passable tile -> end movement
; --- Input during movement: check RIGHT/UP/FIRE/LEFT ---
CHECK_INTERACT:
	call READ_INPUT		;b735  ; Read keyboard/joystick input

	; --- RIGHT: face left and check boundary ---
	bit 0,a		;b738  ; RIGHT pressed?
	jr z,lb743h		;b73a  ; No -> check UP
	ld a,001h		;b73c  ; A = 1 (face left)
	ld (PLAYER_DIR),a		;b73e  ; Set player direction
	jr lb74bh		;b741  ; Check boundary collision

	; --- UP: face right and check boundary ---
lb743h:
	bit 1,a		;b743  ; UP pressed?
	jr z,lb75fh		;b745  ; No -> check FIRE
	xor a			;b747  ; A = 0 (face right)
	ld (PLAYER_DIR),a		;b748  ; Set player direction

; --- Boundary collision check ---
lb74bh:
	ld a,(lae14h)		;b74b  ; A = tile at player position
	cp 0c7h		;b74e  ; Is it a wall/solid ($C7+)?
	jp nc,MAIN_LOOP		;b750  ; Yes -> block movement, return
	ld a,(lae1ah)		;b753  ; A = tile at offset position
	inc a			;b756  ; Test for $FF or > $C6
	cp 0c7h		;b757  ; Solid tile?
	jp nc,END_MISSION		;b759  ; Yes -> end movement sequence
	jp MAIN_LOOP		;b75c  ; Continue movement

; --- FIRE during movement: move left (backward) ---
lb75fh:
	bit 3,a		;b75f  ; FIRE pressed?
	jr z,lb79ah		;b761  ; No -> check LEFT
	ld a,(PLAYER_POS)		;b763  ; A = player grid X position
	dec a			;b766  ; Would-be position (one left)
	jp m,lb77bh		;b767  ; If negative (off screen) -> do the move
	ld hl,(PLAYER_POS_PTR)		;b76a  ; HL = player grid pointer
	ld de,l642eh		;b76d  ; DE = offset to tile to the left
	add hl,de			;b770  ; HL -> tile to the left
	ld a,(hl)			;b771  ; A = tile ID
	cp 0cch		;b772  ; Boundary marker?
	jr z,lb77bh		;b774  ; Yes -> allow movement (room transition)
	cp 0c7h		;b776  ; Solid tile ($C7+)?
	jp nc,MAIN_LOOP		;b778  ; Yes -> block movement

; --- Execute leftward movement ---
lb77bh:
	call ROOM_TRANS_LEFT		;b77b  ; Handle room boundary transition
	ld a,(PLAYER_POS)		;b77e  ; A = player X position
	dec a			;b781  ; Move one tile left
	ld (PLAYER_POS),a		;b782  ; Update position
	ld hl,(PLAYER_POS_PTR)		;b785  ; HL = player grid pointer
	ld de,IM2_HANDLER_AREA		;b788  ; DE = $8100 (-32 as 16-bit, wraps to row above)
	add hl,de			;b78b  ; HL -> one row up in grid
	ld (PLAYER_POS_PTR),hl		;b78c  ; Update pointer

; --- Flip player direction and return ---
lb78fh:
	ld a,(PLAYER_DIR)		;b78f  ; A = player direction
	xor 001h		;b792  ; Toggle direction: 0<->1
	ld (PLAYER_DIR),a		;b794  ; Store flipped direction
	jp MAIN_LOOP		;b797  ; Return to game loop

; --- LEFT during movement: move right (forward) ---
lb79ah:
	bit 2,a		;b79a  ; LEFT pressed?
	jp z,MAIN_LOOP		;b79c  ; No input -> return
	ld a,(lae1bh)		;b79f  ; A = tile to the right (upper)
	inc a			;b7a2  ; Test for solid
	cp 0c7h		;b7a3  ; Solid tile?
	jp nc,END_MISSION		;b7a5  ; Yes -> end movement
	ld a,(lae1ch)		;b7a8  ; A = tile to the right (lower)
	inc a			;b7ab  ; Test for solid
	cp 0c7h		;b7ac  ; Solid tile?
	jp nc,END_MISSION		;b7ae  ; Yes -> end movement

; --- Execute rightward movement ---
lb7b1h:
	call HANDLE_LIFT		;b7b1  ; Check for room boundary (lift handler)
	ld a,(PLAYER_POS)		;b7b4  ; A = player X position
	inc a			;b7b7  ; Move one tile right
	ld (PLAYER_POS),a		;b7b8  ; Update position
	ld hl,(PLAYER_POS_PTR)		;b7bb  ; HL = player grid pointer
	ld de,00020h		;b7be  ; DE = 32 (one row down in grid = one column right)
	add hl,de			;b7c1  ; HL -> next grid position
	ld (PLAYER_POS_PTR),hl		;b7c2  ; Update pointer
	jr lb78fh		;b7c5  ; Flip direction and return
; ==========================================================================
; HANDLE_LIFT - Room Boundary Check ($B7C7)
; ==========================================================================
; Checks if the player has reached the right boundary of the room
; (position 11). If so, advances to the next room by incrementing
; the room counter, resetting the player position, and triggering
; room reload. Uses POP HL to discard the return address (skipping
; the caller's remaining code).
;
HANDLE_LIFT:
	ld a,(PLAYER_POS)		;b7c7  ; A = player X position
	cp 00bh		;b7ca  ; At right boundary (position 11)?
	ret nz			;b7cc  ; No -> return normally
	; --- Room boundary reached: advance to next room ---
	ld hl,09942h		;b7cd  ; HL -> room counter
	inc (hl)			;b7d0  ; Increment room number
	pop hl			;b7d1  ; Discard return address (skip caller)
	sub 011h		;b7d2  ; A = 11 - 17 = -6 (wrap to position)
	ld (PLAYER_POS),a		;b7d4  ; Reset player X position
	ld hl,(PLAYER_POS_PTR)		;b7d7  ; HL = player grid pointer
	ld de,lfde0h		;b7da  ; DE = $FDE0 (-544, jump back in grid)
	add hl,de			;b7dd  ; HL = new grid position (start of room)
	ld de,00020h		;b7de  ; DE = 32 (one column offset)
lb7e1h:
	ld (PLAYER_POS_PTR),hl		;b7e1  ; Update player grid pointer
	ld hl,(07747h)		;b7e4  ; HL = room draw handler pointer
	add hl,de			;b7e7  ; Advance draw handler by 32
	ld (07747h),hl		;b7e8  ; Store updated handler pointer
	xor a			;b7eb  ; A = 0
	ld (09f9fh),a		;b7ec  ; Clear screen rendering sub-state
	jp l76d2h		;b7ef  ; Jump to room/level setup
; ==========================================================================
; POST-LIFT ITEM PICKUP ($B7F2)
; ==========================================================================
; After lift movement completes, check for item pickup and display
; mission terminated/failure text if the entity array indicates an
; end condition. Otherwise, update score and continue.
;
lb7f2h:
	call HANDLE_LIFT		;b7f2  ; Check room boundary
	call PICKUP_ITEM		;b7f5  ; Try to pick up item
	jr z,lb86bh		;b7f8  ; No item -> increment score counter
	ld a,(ENTITY_ARRAY)		;b7fa  ; A = entity array header byte
	or a			;b7fd  ; Is it zero (no mission end)?
	jr z,lb860h		;b7fe  ; Yes -> update score normally
	; --- Mission end: display termination message ---
	ld b,014h		;b800  ; B = 20 characters to copy
	ld de,lb838h		;b802  ; DE -> "@MISSION@TERMINATED@" text
	ld a,(ENTITY_ARRAY)		;b805  ; A = entity header (end condition)
	dec a			;b808  ; Was it 1 (mission failure)?
	jr nz,lb80eh		;b809  ; No -> use "TERMINATED" text
	ld de,lb84ch		;b80b  ; DE -> "@@MISSION@@FAILURE@@" text
lb80eh:
	ld hl,l6792h		;b80e  ; HL = screen destination address
	call COPY_DATA_BLK		;b811  ; Copy mission text to screen buffer
	ld a,(LIFT_STATE_CTR)		;b814  ; A = lift state counter
	cp 0fdh		;b817  ; Is it cutscene mode ($FD)?
	jr nz,lb824h		;b819  ; No -> skip cutscene graphics
	ld de,l7daah		;b81b  ; DE = cutscene tile data
	ld bc,GFX_PATTERN_TBL		;b81e  ; BC = graphics pattern table
	call RENDER_MSG_AREA		;b821  ; Render cutscene message area
lb824h:
	ld de,INPUT_DISPATCH		;b824  ; DE = input dispatch handler
	ld bc,GAME_ENTRY		;b827  ; BC = game entry handler
	call RENDER_MSG_AREA		;b82a  ; Render message with these handlers
	ld de,lad2ah		;b82d  ; DE = post-mission behavior handler
	ld hl,lb97bh		;b830  ; HL = transition countdown handler
	ld a,01eh		;b833  ; A = 30 (transition duration, ~0.6 sec)
	jp lb985h		;b835  ; Set transition counter and dispatch
; --- "@MISSION@TERMINATED@" ($B838-$B84B) ---
; Text uses $40 (@) as space character.
lb838h:
	ld b,b			;b838  ; DATA: $40 = "@" (space)
	ld c,l			;b839  ; DATA: $4D = "M"
	ld c,c			;b83a  ; DATA: $49 = "I"
	ld d,e			;b83b  ; DATA: $53 = "S"
	ld d,e			;b83c  ; DATA: $53 = "S"
	ld c,c			;b83d  ; DATA: $49 = "I"
	ld c,a			;b83e  ; DATA: $4F = "O"
	ld c,(hl)			;b83f  ; DATA: $4E = "N"
	ld b,b			;b840  ; DATA: $40 = "@" (space)
	ld d,h			;b841  ; DATA: $54 = "T"
	ld b,l			;b842  ; DATA: $45 = "E"
	ld d,d			;b843  ; DATA: $52 = "R"
	ld c,l			;b844  ; DATA: $4D = "M"
	ld c,c			;b845  ; DATA: $49 = "I"
	ld c,(hl)			;b846  ; DATA: $4E = "N"
	ld b,c			;b847  ; DATA: $41 = "A"
	ld d,h			;b848  ; DATA: $54 = "T"
	ld b,l			;b849  ; DATA: $45 = "E"
	ld b,h			;b84a  ; DATA: $44 = "D"
	ld b,b			;b84b  ; DATA: $40 = "@" (space)

; --- "@@MISSION@@FAILURE@@" ($B84C-$B85F) ---
lb84ch:
	ld b,b			;b84c  ; DATA: $40 = "@" (space)
	ld b,b			;b84d  ; DATA: $40 = "@" (space)
	ld c,l			;b84e  ; DATA: $4D = "M"
	ld c,c			;b84f  ; DATA: $49 = "I"
	ld d,e			;b850  ; DATA: $53 = "S"
	ld d,e			;b851  ; DATA: $53 = "S"
	ld c,c			;b852  ; DATA: $49 = "I"
	ld c,a			;b853  ; DATA: $4F = "O"
	ld c,(hl)			;b854  ; DATA: $4E = "N"
	ld b,b			;b855  ; DATA: $40 = "@" (space)
	ld b,b			;b856  ; DATA: $40 = "@" (space)
	ld b,(hl)			;b857  ; DATA: $46 = "F"
	ld b,c			;b858  ; DATA: $41 = "A"
	ld c,c			;b859  ; DATA: $49 = "I"
	ld c,h			;b85a  ; DATA: $4C = "L"
	ld d,l			;b85b  ; DATA: $55 = "U"
	ld d,d			;b85c  ; DATA: $52 = "R"
	ld b,l			;b85d  ; DATA: $45 = "E"
	ld b,b			;b85e  ; DATA: $40 = "@" (space)
	ld b,b			;b85f  ; DATA: $40 = "@" (space)

; --- Score update after item pickup ---
lb860h:
	ld b,001h		;b860  ; B = score multiplier (self-modifying, set at $B487)
	call UPDATE_SCORE		;b862  ; Add B points to score
	call FONT_LOOKUP		;b865  ; Update score digit display
	jp laf2ah		;b868  ; Return to default handler

; --- No item: increment score counter and advance position ---
lb86bh:
	ld hl,lb860h+1		;b86b  ; HL -> score multiplier byte
	ld a,0fah		;b86e  ; A = $FA (max multiplier = 250)
	cp (hl)			;b870  ; At maximum?
	jr z,lb874h		;b871  ; Yes -> don't increment further
	inc (hl)			;b873  ; Increment score multiplier
lb874h:
	ld a,(PLAYER_POS)		;b874  ; A = player X position
	inc a			;b877  ; Move one tile right
	ld (PLAYER_POS),a		;b878  ; Update position
	ld hl,(PLAYER_POS_PTR)		;b87b  ; HL = player grid pointer
	ld de,00020h		;b87e  ; DE = 32 (one column right)
	add hl,de			;b881  ; Advance grid pointer
	ld (PLAYER_POS_PTR),hl		;b882  ; Update pointer
	jp MAIN_LOOP		;b885  ; Return to game loop
; ==========================================================================
; FENCE CLIMBING - RIGHTWARD ($B888)
; ==========================================================================
; Animates the player climbing a fence moving right. Each frame:
;   1. Disables enemy config, moves player one tile right
;   2. Clears 6 tiles at previous position (sets to $08 = blank)
;   3. Draws fence pattern from $D024 at new position
;   4. Fills tiles above with $01 (fence post)
;   5. Checks FIRE input to reverse direction
;   6. Checks for special tile $FA to end climb
;
lb888h:
	ld a,011h		;b888  ; A = $11 (fence climbing enemy config)
	ld (ROOM_ENEMY_CFG),a		;b88a  ; Set restricted enemy behavior
	xor a			;b88d  ; A = 0
	ld (ROOM_OBJ_PLACE),a		;b88e  ; Disable object placement during climb
	call 0b0b7h		;b891  ; Update room/entity collision state
	call HANDLE_LIFT		;b894  ; Check room boundary
	ld a,(PLAYER_POS)		;b897  ; A = player X position
	inc a			;b89a  ; Move one tile right
	ld (PLAYER_POS),a		;b89b  ; Update position
	ld hl,(PLAYER_POS_PTR)		;b89e  ; HL = player grid pointer
	ld de,00020h		;b8a1  ; DE = 32 (one column right)
	add hl,de			;b8a4  ; Advance pointer
	ld (PLAYER_POS_PTR),hl		;b8a5  ; Store updated pointer
	; --- Clear 6 tiles at current position (erase player trail) ---
	ld de,l650ch		;b8a8  ; DE = offset to tile row
	add hl,de			;b8ab  ; HL -> tile position in map
	ld b,006h		;b8ac  ; B = 6 tiles to clear
lb8aeh:
	ld (hl),008h		;b8ae  ; Set tile to $08 (blank/clear)
	inc hl			;b8b0  ; Next tile
	djnz lb8aeh		;b8b1  ; Clear all 6 tiles
	ld a,(PLAYER_POS)		;b8b3  ; A = current position
	cp 00bh		;b8b6  ; At right boundary?
	jr z,lb8d4h		;b8b8  ; Yes -> skip fence drawing, check input
	; --- Draw fence pattern at new position ---
	ld de,0001ah		;b8ba  ; DE = 26 (offset to next tile row)
	add hl,de			;b8bd  ; HL -> fence drawing position
	ld de,ld024h		;b8be  ; DE -> fence tile pattern data
	ld b,006h		;b8c1  ; B = 6 tiles of fence pattern
lb8c3h:
	ld a,(de)			;b8c3  ; A = fence pattern byte
	ld (hl),a			;b8c4  ; Write to tile map
	inc hl			;b8c5  ; Next dest tile
	inc de			;b8c6  ; Next source byte
	djnz lb8c3h		;b8c7  ; Copy all 6 fence tiles
	; --- Fill tiles above with fence posts ---
	ld de,lfdc0h		;b8c9  ; DE = $FDC0 (-576, row above in map)
	add hl,de			;b8cc  ; HL -> row above fence
	ld b,006h		;b8cd  ; B = 6 tiles
lb8cfh:
	dec hl			;b8cf  ; Previous tile position
	ld (hl),001h		;b8d0  ; Set tile to $01 (fence post)
	djnz lb8cfh		;b8d2  ; Fill all 6 positions

; --- Check input during climb ---
lb8d4h:
	call READ_INPUT		;b8d4  ; Read keyboard/joystick
	ld hl,lb8f7h		;b8d7  ; HL = fence climb left handler
	bit 3,a		;b8da  ; FIRE pressed?
	jp nz,STATUS_DISPATCH_2		;b8dc  ; Yes -> reverse direction (climb left)
	; --- Fence climb complete: restore room state ---
	ld a,0ffh		;b8df  ; A = $FF (full enemy config)
	ld (ROOM_ENEMY_CFG),a		;b8e1  ; Re-enable enemies
	ld (ROOM_OBJ_PLACE),a		;b8e4  ; Re-enable object placement
	; --- Check for end-of-fence tile ---
	ld hl,(PLAYER_POS_PTR)		;b8e7  ; HL = player grid pointer
	ld de,l654ch		;b8ea  ; DE = offset to tile below
	add hl,de			;b8ed  ; HL -> tile below player
	ld a,(hl)			;b8ee  ; A = tile ID
	cp 0fah		;b8ef  ; End-of-fence marker ($FA)?
	jp nz,MAIN_LOOP		;b8f1  ; No -> continue climbing next frame
	jp laf2ah		;b8f4  ; Yes -> climb complete, exit handler
; ==========================================================================
; FENCE CLIMBING - LEFTWARD ($B8F7)
; ==========================================================================
; Mirror of rightward climbing. Moves player left across the fence.
; Draws fence pattern behind the player as they retreat.
; LEFT input reverses direction back to rightward climbing.
;
lb8f7h:
	ld a,0ffh		;b8f7  ; A = $FF
	ld (ROOM_ENEMY_CFG),a		;b8f9  ; Full enemy config (different from rightward)
	ld (ROOM_OBJ_PLACE),a		;b8fc  ; Enable object placement
	call 0b0b7h		;b8ff  ; Update room/entity collision state
	call ROOM_TRANS_LEFT		;b902  ; Handle left room boundary transition
	ld a,(PLAYER_POS)		;b905  ; A = player X position
	dec a			;b908  ; Move one tile left
	ld (PLAYER_POS),a		;b909  ; Update position
	ld hl,(PLAYER_POS_PTR)		;b90c  ; HL = player grid pointer
	ld de,IM2_HANDLER_AREA		;b90f  ; DE = $8100 (row up offset)
	add hl,de			;b912  ; Move grid pointer one row up
	ld (PLAYER_POS_PTR),hl		;b913  ; Store updated pointer
	; --- Draw fence pattern at vacated position ---
	ld a,(PLAYER_POS)		;b916  ; A = current position
	cp 00bh		;b919  ; At right boundary?
	jr z,lb949h		;b91b  ; Yes -> skip drawing, check input
	ld de,l652ch		;b91d  ; DE = offset to tile row
	add hl,de			;b920  ; HL -> fence drawing position
	ld b,006h		;b921  ; B = 6 tiles
	ld de,ld024h		;b923  ; DE -> fence tile pattern data
lb926h:
	ld a,(de)			;b926  ; A = fence pattern byte
	ld (hl),a			;b927  ; Write to tile map
	inc hl			;b928  ; Next tile
	inc de			;b929  ; Next pattern byte
	djnz lb926h		;b92a  ; Copy all 6 fence tiles
	; --- Check if at position 10 (near left edge) ---
	ld a,(PLAYER_POS)		;b92c  ; A = current position
	cp 00ah		;b92f  ; At position 10?
	jr z,lb949h		;b931  ; Yes -> skip clearing, check input
	; --- Clear 6 tiles ahead (erase trail going left) ---
	ld de,0001ah		;b933  ; DE = 26 (offset to next tile row)
	add hl,de			;b936  ; HL -> tile position ahead
	ld b,006h		;b937  ; B = 6 tiles to clear
lb939h:
	ld (hl),008h		;b939  ; Set tile to $08 (blank)
	inc hl			;b93b  ; Next tile
	djnz lb939h		;b93c  ; Clear all 6 tiles
	; --- Fill row above with fence posts ---
	ld de,lfdc0h		;b93e  ; DE = $FDC0 (row above offset)
	add hl,de			;b941  ; HL -> row above
	ld b,006h		;b942  ; B = 6 tiles
lb944h:
	dec hl			;b944  ; Previous position
	ld (hl),001h		;b945  ; Set tile to $01 (fence post)
	djnz lb944h		;b947  ; Fill all 6 positions

; --- Check input during leftward climb ---
lb949h:
	call READ_INPUT		;b949  ; Read keyboard/joystick
	ld hl,lb888h		;b94c  ; HL = fence climb right handler
	bit 2,a		;b94f  ; LEFT pressed?
	jp nz,STATUS_DISPATCH_2		;b951  ; Yes -> reverse to rightward climbing
	; --- No reversal: restore restricted enemy config ---
	ld a,011h		;b954  ; A = $11 (fence climbing config)
	ld (ROOM_ENEMY_CFG),a		;b956  ; Set restricted enemy behavior
	xor a			;b959  ; A = 0
	ld (ROOM_OBJ_PLACE),a		;b95a  ; Disable object placement
	; --- Check for end-of-fence tile ---
	ld hl,(PLAYER_POS_PTR)		;b95d  ; HL = player grid pointer
	ld de,l650bh		;b960  ; DE = offset to tile at position
	add hl,de			;b963  ; HL -> tile to check
	ld a,(hl)			;b964  ; A = tile ID
	cp 008h		;b965  ; Is it blank ($08)?
	jp nz,MAIN_LOOP		;b967  ; No -> continue climbing next frame
	; --- Reached end of fence: drop down ---
	ld hl,PLAYER_POS		;b96a  ; HL -> player X position
	dec (hl)			;b96d  ; Move one more tile left
	ld hl,(PLAYER_POS_PTR)		;b96e  ; HL = player grid pointer
	ld de,IM2_HANDLER_AREA		;b971  ; DE = row up offset
	add hl,de			;b974  ; Move grid pointer up
	ld (PLAYER_POS_PTR),hl		;b975  ; Store updated pointer
	jp END_MISSION		;b978  ; End interaction sequence
; ==========================================================================
; TRANSITION COUNTDOWN ($B97B)
; ==========================================================================
; Decrements the transition counter each frame. When it reaches zero,
; jumps to the end-of-level handler at $EC1E.
;
lb97bh:
	ld hl,TRANSITION_CTR		;b97b  ; HL -> transition counter
	dec (hl)			;b97e  ; Decrement counter
	jp nz,MAIN_LOOP		;b97f  ; Not zero yet -> keep waiting
	jp lec1eh		;b982  ; Counter reached zero -> end-of-level

; ==========================================================================
; STATUS_DISPATCH - Handler Installation ($B985)
; ==========================================================================
; Central dispatcher for installing frame handlers. Sets the transition
; counter, entity behavior handler, and render handler, then returns
; to the main loop.
;
; Entry at lb985h: A = transition counter, DE = behavior, HL = render
; Entry at STATUS_DISPATCH: DE = behavior, HL = render (no counter)
; Entry at STATUS_DISPATCH_2: HL = render only (behavior unchanged)
;
lb985h:
	ld (TRANSITION_CTR),a		;b985  ; Set transition counter
STATUS_DISPATCH:
	ld (09968h),de		;b988  ; Install entity behavior handler
STATUS_DISPATCH_2:
	ld (08b11h),hl		;b98c  ; Install render handler (self-modifying)
	jp MAIN_LOOP		;b98f  ; Return to game loop

; ==========================================================================
; END_MISSION ($B992)
; ==========================================================================
; Ends the current interaction sequence. Clears the entity array length
; and reinstalls the main interaction dispatcher as the active handler.
;
END_MISSION:
	xor a			;b992  ; A = 0
	ld (ENTITY_ARRAY_LEN),a		;b993  ; Clear active entity count
	ld hl,lb47ah		;b996  ; HL = main interaction dispatcher
	ld de,lab3fh		;b999  ; DE = default behavior handler
	jp STATUS_DISPATCH		;b99c  ; Install handlers and return
; ==========================================================================
; ENTITY/TILE OVERLAY RENDERER ($B99F)
; ==========================================================================
; Renders entity or object tiles onto the screen map using the alternate
; register set for parallel pointer tracking. Uses EXX extensively to
; switch between:
;   Main set:  HL = screen dest, DE = source data, C = width counter, B = rows
;   Alt set:   HL = collision map ptr, DE = position tracking, BC = bounds
;
; The loop copies source tile data to screen positions, skipping tiles
; that are out of bounds (E >= $20 columns, D >= $12 rows) or that
; would overwrite solid tiles ($C7+).
;
lb99fh:
	exx			;b99f  ; Switch to alt registers
	ld bc,ladf4h		;b9a0  ; BC' = collision map base address
	ld hl,(PLAYER_POS_PTR)		;b9a3  ; HL' = player grid pointer
	push de			;b9a6
	ld de,HISCORE_TBL		;b9a7  ; DE' = offset (high score table addr as offset)
	add hl,de			;b9aa  ; HL' = adjusted grid position
	pop de			;b9ab
	exx			;b9ac  ; Back to main registers

	; --- Initialize row/column tracking ---
	ld a,c			;b9ad  ; A = width parameter
	ld (lb9b8h+1),a		;b9ae  ; Self-modify: set width counter initial value
	push hl			;b9b1
	ld hl,00005h		;b9b2  ; HL = 5 (source data offset)
	add hl,de			;b9b5  ; HL = source + 5
	ex de,hl			;b9b6  ; DE = adjusted source pointer
	pop hl			;b9b7

; --- Outer loop: process one row ---
lb9b8h:
	ld c,006h		;b9b8  ; C = column count (self-modifying, set above)
	exx			;b9ba  ; Alt registers
	ld e,000h		;b9bb  ; E' = 0 (column counter reset)
	exx			;b9bd  ; Main registers

; --- Inner loop: process one tile ---
lb9beh:
	exx			;b9be  ; Alt registers
	ld a,e			;b9bf  ; A = current column index
	exx			;b9c0  ; Main registers
	cp 020h		;b9c1  ; Column >= 32 (off-screen right)?
	jr nc,lb9d6h		;b9c3  ; Yes -> skip this tile
	exx			;b9c5  ; Alt registers
	ld a,d			;b9c6  ; A = current row index
	exx			;b9c7  ; Main registers
	cp 012h		;b9c8  ; Row >= 18 (off-screen bottom)?
	jr nc,lb9d6h		;b9ca  ; Yes -> skip this tile
	exx			;b9cc  ; Alt registers
	ld a,(hl)			;b9cd  ; A = collision map value at position
	nop			;b9ce  ; (padding/alignment)
	exx			;b9cf  ; Main registers
	cp 0c7h		;b9d0  ; Is tile solid ($C7+)?
	jr nc,lb9d6h		;b9d2  ; Yes -> don't overwrite solid tiles
	ld a,(de)			;b9d4  ; A = source tile data
	ld (hl),a			;b9d5  ; Write tile to screen map

; --- Advance to next column ---
lb9d6h:
	exx			;b9d6  ; Alt registers
	inc e			;b9d7  ; E' = next column
	inc hl			;b9d8  ; HL' = next collision map pos
	dec bc			;b9d9  ; BC' = decrement bounds counter
	exx			;b9da  ; Main registers
	inc hl			;b9db  ; HL = next screen dest
	dec de			;b9dc  ; DE = next source byte (decrements!)
	dec c			;b9dd  ; C = columns remaining
	jr nz,lb9beh		;b9de  ; More columns -> inner loop

	; --- Advance to next row ---
	push de			;b9e0
	ld de,0001ah		;b9e1  ; DE = 26 (row stride: 32 - 6 = 26)
	add hl,de			;b9e4  ; HL = next screen row
	pop de			;b9e5
	push hl			;b9e6
	ld hl,0000ch		;b9e7  ; HL = 12 (source data row stride)
	add hl,de			;b9ea  ; Advance source pointer to next row
	ex de,hl			;b9eb  ; DE = updated source pointer
	pop hl			;b9ec

	; --- Update alt register row tracking ---
	exx			;b9ed  ; Alt registers
	inc d			;b9ee  ; D' = next row index
	push de			;b9ef
	ld de,0001ah		;b9f0  ; DE' = 26 (collision map row stride)
	add hl,de			;b9f3  ; HL' = next collision map row
	push hl			;b9f4
	push bc			;b9f5  ; Save BC'
	pop hl			;b9f6  ; HL = BC' (bounds counter)
	ld de,0000ch		;b9f7  ; DE' = 12 (bounds row stride)
	add hl,de			;b9fa  ; Advance bounds pointer
	push hl			;b9fb
	pop bc			;b9fc  ; BC' = updated bounds
	pop hl			;b9fd  ; HL' = updated collision map
	pop de			;b9fe  ; DE' = updated position
	exx			;b9ff  ; Main registers
	djnz lb9b8h		;ba00  ; More rows -> outer loop
	ret			;ba02  ; All rows done

; ==========================================================================
; PLAYER Y POSITION CHECK ($BA03)
; ==========================================================================
; Checks if the player's Y coordinate equals $1D (29), and if so,
; jumps to a special handler at $9BE4 (possibly fall detection or
; floor boundary check).
;
lba03h:
	ld a,(PLAYER_Y)		;ba03  ; A = player Y coordinate
	cp 01dh		;ba06  ; At Y position 29?
	jp z,l9be4h		;ba08  ; Yes -> special boundary handler
	defb 0feh		;ba0b  ; Orphan byte (block boundary padding)
