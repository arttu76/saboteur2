; ======================================================================
; code_mechanics.asm
; ======================================================================
;
; Player Movement, Room Transitions & Input Handling
;
; Address range: $980C-$9E00 (1525 bytes)
; Source binary: block7_main.bin (loaded at $620C)
;
; Contains the core player mechanics: movement computation, room
; boundary transitions, lift/elevator logic, mission completion
; checks, sound effects, and keyboard/joystick input reading.
;
; Cross-references:
;   Key routines called from code_mainloop.asm (MAIN_LOOP):
;     MOVE_ENTITY ($997A) - Update player position from direction
;     READ_INPUT ($9DCA) - Read keyboard/joystick input (14 refs)
;     PLAY_BEEP ($9D7B) - Generate speaker beep sounds
;     ENTITY_STEP ($9991) - Check room boundary transitions
;   Called from code_interaction.asm:
;     CHECK_COMPLETION ($9AF5) - Mission timeout check
;     MISSION_CHECK ($9AFC) - Guard/item mission state
;   Calls: RENDER_SPRITE_RAW, STATUS_DISPATCH, HANDLE_LIFT,
;          PICKUP_ITEM, INTERACT_OBJECT, END_MISSION, MAIN_LOOP
;
; Memory map:
;   $980C-$98EF  Entity configuration data (228 bytes, not code)
;   $98F0-$991A  Direction save/restore utilities
;   $991B-$9977  Entity/object drawing routines
;   $9978-$99A5  MOVE_ENTITY + ENTITY_STEP
;   $99A8-$9B69  Room transition state handlers
;   $9B6A-$9BAE  Normal gameplay input handler
;   $9BAF-$9C1F  Special room setup + vertical transitions
;   $9C18-$9C85  Lift state handler
;   $9C88-$9CB6  Tile map data for message rendering
;   $9CB7-$9D5B  Text/message rendering + cutscene handlers
;   $9D5E-$9D78  ROOM_TRANS_LEFT
;   $9D7B-$9DC9  PLAY_BEEP + sound data
;   $9DCA-$9DFF  READ_INPUT + key configuration table
;
; ======================================================================

; ==========================================================================
; ENTITY CONFIGURATION DATA ($980C)
; ==========================================================================
; 228 bytes of entity placement/configuration data. Not executable code.
; The disassembler incorrectly interprets these as Z80 instructions.
; Likely defines entity spawn parameters for different missions/rooms.
;
	nop			;980c
	nop			;980d
	dec bc			;980e
	ld a,(bc)			;980f
	djnz l981ch		;9810
	ld bc,0050ch		;9812
	ld de,0080bh		;9815
	nop			;9818
	nop			;9819
	dec bc			;981a
	ld a,(bc)			;981b
l981ch:
	ld c,08ah		;981c
	ld bc,0040ch		;981e
	djnz l983ch		;9821
	adc a,h			;9823
	nop			;9824
	ld bc,00a0ch		;9825
	ld c,02ah		;9828
	ld bc,0040ch		;982a
	rrca			;982d
	ex af,af'			;982e
	add hl,bc			;982f
	nop			;9830
	nop			;9831
	inc c			;9832
	ld a,(bc)			;9833
	djnz l9860h		;9834
	ld bc,0140fh		;9836
	ld de,l8917h		;9839
l983ch:
	nop			;983c
	nop			;983d
	ld de,00c0ah		;983e
	xor d			;9841
	nop			;9842
	inc c			;9843
	dec b			;9844
	ld c,017h		;9845
	dec b			;9847
	ld bc,00c00h		;9848
	ld a,(bc)			;984b
	add hl,bc			;984c
	xor d			;984d
	nop			;984e
	ex af,af'			;984f
	ld b,00ah		;9850
	jr l9859h		;9852
	ld bc,00d00h		;9854
	ld a,(bc)			;9857
	add hl,bc			;9858
l9859h:
	ld a,(bc)			;9859
	ld bc,01007h		;985a
	ld a,(bc)			;985d
	jr l9868h		;985e
l9860h:
	ld bc,00e00h		;9860
	ld a,(bc)			;9863
	add hl,bc			;9864
	xor d			;9865
	nop			;9866
	ex af,af'			;9867
l9868h:
	ld b,00ah		;9868
	jr l9871h		;986a
	ld bc,00f00h		;986c
	ld a,(bc)			;986f
	add hl,bc			;9870
l9871h:
	ld a,(bc)			;9871
	ld bc,00108h		;9872
	ld a,(bc)			;9875
	jr l9880h		;9876
	ld bc,01000h		;9878
	ld a,(bc)			;987b
	add hl,bc			;987c
	xor d			;987d
	nop			;987e
	ex af,af'			;987f
l9880h:
	ld b,00ah		;9880
	jr l9889h		;9882
	ld bc,01100h		;9884
	ld a,(bc)			;9887
	add hl,bc			;9888
l9889h:
	xor d			;9889
	nop			;988a
	ex af,af'			;988b
	ld b,00ah		;988c
	jr $+7		;988e
	ld bc,00d00h		;9890
	ld a,(bc)			;9893
	ld c,0eah		;9894
	nop			;9896
	inc c			;9897
	inc b			;9898
	djnz $+25		;9899
	rlca			;989b
	ld bc,00d00h		;989c
	ld a,(bc)			;989f
	ld de,000eah		;98a0
	djnz $+3		;98a3
	ld de,l8717h		;98a5
	ld bc,00e00h		;98a8
	ld a,(bc)			;98ab
	ld c,0eah		;98ac
	nop			;98ae
	inc c			;98af
	inc b			;98b0
	ld de,00717h		;98b1
	ld bc,00e00h		;98b4
	ld a,(bc)			;98b7
	ld de,000eah		;98b8
	djnz $+3		;98bb
	ld de,l8717h		;98bd
	ld bc,00f00h		;98c0
	ld a,(bc)			;98c3
	dec c			;98c4
	ld a,(bc)			;98c5
	ld bc,0140bh		;98c6
	ld c,018h		;98c9
	ex af,af'			;98cb
	ld bc,00f00h		;98cc
	ld a,(bc)			;98cf
	dec c			;98d0
	adc a,d			;98d1
	ld bc,0140bh		;98d2
	ld c,018h		;98d5
	adc a,h			;98d7
	ld bc,01001h		;98d8
	ld a,(bc)			;98db
	dec c			;98dc
	xor d			;98dd
	nop			;98de
	inc c			;98df
	inc b			;98e0
	ld c,017h		;98e1
	dec b			;98e3
	ld bc,01000h		;98e4
	ld a,(bc)			;98e7
	inc c			;98e8
	xor d			;98e9
	nop			;98ea
	inc c			;98eb
	dec b			;98ec
	ld c,017h		;98ed
	dec b			;98ef
	ld bc,00000h		;98f0  ; (end of data section)

; ==========================================================================
; DIRECTION SAVE/RESTORE UTILITIES ($98F2)
; ==========================================================================
; Three routines that swap PLAYER_DIR with different storage locations.
; Used when temporarily changing the player's facing direction for
; entity drawing or animation, then restoring the original direction.
;
; Each routine: saves target's old value, copies PLAYER_DIR into target,
; then restores PLAYER_DIR from saved value on return.
;

; --- Data bytes used as direction storage ---
l98f3h:
	nop			;98f3  ; DATA: alternate direction storage byte

; --- Save direction to $98F2 ---
SAVE_SPRITE_DIR:
	ld a,(098f2h)		;98f4  ; A = old value at $98F2
	push af			;98f7  ; Save it
	ld a,(PLAYER_DIR)		;98f8  ; A = current player direction
	ld (098f2h),a		;98fb  ; Copy direction to $98F2
	jr l9916h		;98fe  ; -> restore PLAYER_DIR from saved value

; --- Save direction to $98F3 ---
SAVE_ALT_DIR:
	ld a,(l98f3h)		;9900  ; A = old value at $98F3
	push af			;9903  ; Save it
	ld a,(PLAYER_DIR)		;9904  ; A = current player direction
	ld (l98f3h),a		;9907  ; Copy direction to $98F3
	jr l9916h		;990a  ; -> restore PLAYER_DIR from saved value

; --- Save direction to entity IX+$0A ---
UPDATE_FACING:
	ld a,(ix+00ah)		;990c  ; A = entity's facing byte (IX+$0A)
	push af			;990f  ; Save it
	ld a,(PLAYER_DIR)		;9910  ; A = current player direction
	ld (ix+00ah),a		;9913  ; Copy direction to entity's facing

; --- Common exit: restore PLAYER_DIR ---
l9916h:
	pop af			;9916  ; A = previously saved direction
	ld (PLAYER_DIR),a		;9917  ; Restore PLAYER_DIR
	ret			;991a

; ==========================================================================
; DRAW_ENTITY ($991B)
; ==========================================================================
; Render an entity sprite from IX-indexed entity data.
; Reads sprite data pointer from IX+3/4, screen position from IX+1/9.
; Sprite size: 8 wide x 6 tall (B=8, C=6).
;
DRAW_ENTITY:
	ld h,(ix+004h)		;991b  ; H = sprite data high byte
	ld l,(ix+003h)		;991e  ; L = sprite data low byte
	ld de,GAME_ENTRY		;9921  ; DE = $620C (base offset for sprite address)
	add hl,de			;9924  ; HL = absolute sprite data address
	ld de,INPUT_DISPATCH		;9925  ; DE = screen buffer offset
	ld b,008h		;9928  ; B = 8 (sprite width in pixels)
	ld c,006h		;992a  ; C = 6 (sprite height in chars)
	ld a,(ix+009h)		;992c  ; A = entity attribute byte
	and 07fh		;992f  ; Mask off high bit (direction flag)
	exx			;9931  ; Switch to alt regs
	ld d,a			;9932  ; D' = attribute value
	exx			;9933  ; Switch back
	ld a,(ix+001h)		;9934  ; A = entity Y position
	jp RENDER_SPRITE_RAW		;9937  ; -> render sprite

; ==========================================================================
; PLAYER STATE VARIABLES ($993A)
; ==========================================================================
; Runtime variables for the player entity. These are read/written by
; movement, drawing, and room transition code throughout the game.
;
l993ah:
	add hl,sp			;993a  ; DATA: variable byte
	add hl,sp			;993b  ; DATA: variable byte
	add hl,sp			;993c  ; DATA: variable byte
l993dh:
	ld a,(bc)			;993d  ; DATA: player active flag
PLAYER_Y:
	ld a,(bc)			;993e  ; DATA: player Y coordinate
PLAYER_POS:
	ld a,(bc)			;993f  ; DATA: player X position / sprite index
PLAYER_POS_PTR:
	ld c,d			;9940  ; DATA: player screen position pointer (2 bytes)
	ld bc,00000h		;9941  ; DATA: (pointer high byte + room state)
l9944h:
	nop			;9944  ; DATA: tile refresh flag

; ==========================================================================
; DRAW_OBJECT ($9945)
; ==========================================================================
; Render the player sprite using PLAYER_POS_PTR for screen position.
; Similar to DRAW_ENTITY but reads position from player variables
; instead of IX-indexed entity data.
;
DRAW_OBJECT:
	ld hl,(PLAYER_POS_PTR)		;9945  ; HL = player screen position
	ld de,GAME_ENTRY		;9948  ; DE = $620C (sprite data base)
	add hl,de			;994b  ; HL = absolute address
	ld de,INPUT_DISPATCH		;994c  ; DE = screen buffer offset
	ld b,008h		;994f  ; B = 8 (sprite width)
	ld c,006h		;9951  ; C = 6 (sprite height)
	exx			;9953  ; Switch to alt regs
	ld a,(PLAYER_POS)		;9954  ; A = player sprite index
	ld d,a			;9957  ; D' = sprite index (attribute)
	exx			;9958  ; Switch back
	ld a,(PLAYER_Y)		;9959  ; A = player Y coordinate
	jp RENDER_SPRITE_RAW		;995c  ; -> render sprite
PLAYER_DIR:
	nop			;995f  ; DATA: player direction (0=right, etc.)

; ==========================================================================
; DRAW_ENTITY_ALT ($9960)
; ==========================================================================
; Alternative entity renderer using a different base address ($68CC).
; Used for rendering entities in a secondary screen buffer or overlay.
; Sprite size: 7 wide x 6 tall (B=7, C=6).
;
DRAW_ENTITY_ALT:
	ld hl,(PLAYER_POS_PTR)		;9960  ; HL = player screen position
	ld de,l68cch		;9963  ; DE = $68CC (alternate buffer base)
	add hl,de			;9966  ; HL = address in alternate buffer
	ld de,00000h		;9967  ; DE = 0 (no additional offset)
	ld b,007h		;996a  ; B = 7 (sprite width)
	ld c,006h		;996c  ; C = 6 (sprite height)
	exx			;996e  ; Switch to alt regs
	ld a,(PLAYER_POS)		;996f  ; A = player sprite index
	ld d,a			;9972  ; D' = sprite index
	exx			;9973  ; Switch back
	ld a,(PLAYER_Y)		;9974  ; A = player Y position
	jp RENDER_SPRITE_RAW		;9977  ; -> render sprite
; ==========================================================================
; MOVE_ENTITY ($997A)
; ==========================================================================
; Updates player position based on PLAYER_DIR. Called 8 times from
; various transition and gameplay handlers.
;
; Direction encoding: PLAYER_DIR * 2 - 1 gives the movement offset.
;   DIR=0: offset = -1 (up/left)
;   DIR=1: offset = +1 (down/right)
;   DIR=2: offset = +3
;   etc.
;
; Updates both PLAYER_Y (vertical) and PLAYER_POS_PTR (screen pointer).
;
MOVE_ENTITY:
	ld a,(PLAYER_DIR)		;997a  ; A = current direction
	add a,a			;997d  ; A = direction * 2
	ld d,000h		;997e  ; DE = direction * 2
	ld e,a			;9980
	dec de			;9981  ; DE = direction * 2 - 1 (movement offset)
	ld a,(PLAYER_Y)		;9982  ; A = current Y position
	add a,e			;9985  ; A = Y + offset
	ld (PLAYER_Y),a		;9986  ; Update Y position
	ld hl,(PLAYER_POS_PTR)		;9989  ; HL = current screen pointer
	add hl,de			;998c  ; HL = screen pointer + offset
	ld (PLAYER_POS_PTR),hl		;998d  ; Update screen pointer
	ret			;9990

; ==========================================================================
; ENTITY_STEP ($9991)
; ==========================================================================
; Check if the player has reached a room boundary (top or bottom).
; If at boundary, pops the return address and jumps to the appropriate
; room transition handler. Otherwise returns normally.
;
; DIR != 0 (moving vertically): boundary at Y = $1D (top) -> l9be4h
; DIR == 0 (moving horizontally): boundary at Y = $FD (bottom) -> l9c02h
;
ENTITY_STEP:
	ld a,(PLAYER_DIR)		;9991  ; A = direction
	or a			;9994  ; Test if zero (horizontal movement)
	ld a,(PLAYER_Y)		;9995  ; A = current Y position
	jr z,l99a1h		;9998  ; If DIR=0, check bottom boundary

; --- Check top boundary (DIR != 0) ---
	cp 01dh		;999a  ; Y == $1D (top boundary)?
	ret nz			;999c  ; No -> return normally
	pop hl			;999d  ; Pop caller's return address
	jp l9be4h		;999e  ; -> handle top room transition

; --- Check bottom boundary (DIR == 0) ---
l99a1h:
	cp 0fdh		;99a1  ; Y == $FD (bottom boundary)?
	ret nz			;99a3  ; No -> return normally
	pop hl			;99a4  ; Pop caller's return address
	jp l9c02h		;99a5  ; -> handle bottom room transition
; ==========================================================================
; LEFT ROOM TRANSITION HANDLER ($99A8)
; ==========================================================================
; Called when the player is moving left through a room. Processes one
; frame of the left-scroll transition: checks room boundary, updates
; position, and counts down the transition timer.
;
; Also checks 4 entity timeout counters at $ADF0 - if any entity has
; reached timeout ($C7 = max), aborts the transition early.
;
l99a8h:
	call ROOM_TRANS_LEFT		;99a8  ; Handle left room boundary if at edge
	call ENTITY_STEP		;99ab  ; Check vertical boundaries
	call CHECK_COMPLETION		;99ae  ; Check mission timeout
	call MOVE_ENTITY		;99b1  ; Update player position

; --- Check entity timeout counters ---
	ld b,004h		;99b4  ; B = 4 counters to check
	ld hl,ladf0h		;99b6  ; HL -> entity timeout array
l99b9h:
	ld a,(hl)			;99b9  ; A = timeout counter value
	inc a			;99ba  ; Test if $C7 (inc -> $C8)
	cp 0c8h		;99bb  ; Reached maximum?
	jr nc,l99dah		;99bd  ; Yes -> abort transition early
	inc hl			;99bf  ; Next counter
	djnz l99b9h		;99c0  ; Check all 4

; --- Continue scrolling: move player left on map ---
	ld a,(PLAYER_POS)		;99c2  ; A = player X position
	dec a			;99c5  ; Move left
	ld (PLAYER_POS),a		;99c6  ; Update position
	ld hl,(PLAYER_POS_PTR)		;99c9  ; HL = screen pointer
	ld de,IM2_HANDLER_AREA		;99cc  ; DE = $FFE0 (-32, one row up in map)
	add hl,de			;99cf  ; Adjust screen pointer
	ld (PLAYER_POS_PTR),hl		;99d0  ; Update screen pointer
	ld hl,TRANSITION_CTR		;99d3  ; HL -> transition frame counter
	dec (hl)			;99d6  ; Decrement counter
	jp nz,MAIN_LOOP		;99d7  ; If not done, continue next frame

; --- Transition complete: set up animation cycling ---
l99dah:
	ld a,004h		;99da  ; A = 4 (animation cycle frames)
l99dch:
	ld (TRANSITION_CTR),a		;99dc  ; Set transition counter
	ld hl,l99f5h		;99df  ; HL -> animation cycle handler
	ld de,laab8h		;99e2  ; DE = behavior handler base
	xor a			;99e5  ; A = 0
	ld (l99ech),a		;99e6  ; Reset animation phase counter
	jp STATUS_DISPATCH		;99e9  ; -> enter animation cycling state

; --- Animation phase counter (self-modified) ---
l99ech:
	nop			;99ec  ; DATA: current animation phase (0-3)

; --- Animation handler address table ---
; 4 entries, cycled through during room transitions.
; Each points to a different behavior handler address.
;
l99edh:
	cp b			;99ed  ; DATA: $B8 $AA -> $AAB8
	xor d			;99ee
	exx			;99ef  ; DATA: $D9 $AA -> $AAD9
	xor d			;99f0
	ei			;99f1  ; DATA: $FB $AA -> $AAFB
	xor d			;99f2
	dec e			;99f3  ; DATA: $1D $AB -> $AB1D
	xor e			;99f4

; --- Animation cycle handler ---
; Increments the phase counter (0->1->2->3->0) and selects the
; corresponding behavior handler from the table at $99ED.
;
l99f5h:
	ld a,(l99ech)		;99f5  ; A = current phase (0-3)
	inc a			;99f8  ; Next phase
	and 003h		;99f9  ; Wrap at 4 (mod 4)
	ld (l99ech),a		;99fb  ; Store updated phase
	add a,a			;99fe  ; A * 2 (table entries are 2 bytes)
	ld l,a			;99ff  ; L = table offset
	ld h,000h		;9a00  ; HL = table offset (16-bit)
	ld de,l99edh		;9a02  ; DE -> handler address table base
	add hl,de			;9a05  ; HL -> selected entry
	ld e,(hl)			;9a06  ; E = handler low byte
	inc hl			;9a07
	ld d,(hl)			;9a08  ; D = handler high byte
	ld (09968h),de		;9a09  ; Set entity behavior handler pointer
	jr l9a2dh		;9a0d  ; -> continue with common transition logic
; ==========================================================================
; RIGHT ROOM TRANSITION HANDLER ($9A0F)
; ==========================================================================
; Handles player moving right through rooms. Checks object interaction
; based on player direction, then continues with common transition logic.
;
l9a0fh:
	ld hl,l9a18h		;9a0f  ; HL -> right transition handler
	ld de,lad00h		;9a12  ; DE = behavior data base
	jp STATUS_DISPATCH		;9a15  ; -> enter right transition state

l9a18h:
	ld a,(ladf5h)		;9a18  ; A = entity interaction flag
	inc a			;9a1b  ; Test if $FF (no interaction)
	jr z,l9a2dh		;9a1c  ; If $FF, skip object check
	ld de,l6b2ch		;9a1e  ; DE -> right-facing interaction data
	ld a,(PLAYER_DIR)		;9a21  ; A = player direction
	dec a			;9a24  ; Test if direction == 1 (right)
	jr nz,l9a2ah		;9a25  ; Not right -> use default data
	ld de,l6b31h		;9a27  ; DE -> left-facing interaction data
l9a2ah:
	call INTERACT_OBJECT		;9a2a  ; Check for object interaction

; --- Common transition: step + move + countdown ---
l9a2dh:
	call ENTITY_STEP		;9a2d  ; Check vertical boundaries
	call CHECK_COMPLETION		;9a30  ; Check mission timeout
	call MOVE_ENTITY		;9a33  ; Update position
	ld hl,TRANSITION_CTR		;9a36  ; HL -> transition counter
	dec (hl)			;9a39  ; Decrement
	jp nz,MAIN_LOOP		;9a3a  ; Not done -> next frame
	ld (hl),006h		;9a3d  ; Set 6-frame lift sequence
	ld hl,l9a45h		;9a3f  ; HL -> lift handler
	jp STATUS_DISPATCH_2		;9a42  ; -> enter lift transition

; ==========================================================================
; LIFT/CLIMB TRANSITION HANDLER ($9A45)
; ==========================================================================
; Handles vertical movement via lifts or climbing. Processes one frame:
; checks boundaries, items, and moves the player down through the room.
; Each frame increments PLAYER_POS by 1 and advances screen pointer
; by 32 bytes (one character row).
;
l9a45h:
	call HANDLE_LIFT		;9a45  ; Process lift mechanics
	call ENTITY_STEP		;9a48  ; Check vertical boundaries
	call CHECK_COMPLETION		;9a4b  ; Check mission timeout
	ld a,(ITEM_INTERACT_TBL)		;9a4e  ; A = interaction table entry
	inc a			;9a51  ; Test if $C7 (maximum)
	cp 0c8h		;9a52  ; At maximum?
	jp nc,END_MISSION		;9a54  ; Yes -> end mission
	call PICKUP_ITEM		;9a57  ; Check for item pickup
	jp nz,laf2ah		;9a5a  ; Item found -> handle it
	call MOVE_ENTITY		;9a5d  ; Update position

; --- Move player down one tile row ---
	ld a,(PLAYER_POS)		;9a60  ; A = player X position
	inc a			;9a63  ; Move right (advance through room)
	ld (PLAYER_POS),a		;9a64  ; Update
	ld hl,(PLAYER_POS_PTR)		;9a67  ; HL = screen pointer
	ld de,00020h		;9a6a  ; DE = 32 (one character row)
	add hl,de			;9a6d  ; Move pointer down one row
	ld (PLAYER_POS_PTR),hl		;9a6e  ; Update
	ld hl,ANIM_SEQ_TBL		;9a71  ; HL = animation sequence table
	ld (09968h),hl		;9a74  ; Set entity behavior handler
	ld hl,TRANSITION_CTR		;9a77  ; HL -> transition counter
	dec (hl)			;9a7a  ; Decrement
	jp nz,MAIN_LOOP		;9a7b  ; Not done -> next frame

; --- Transition complete: enter exit sequence ---
	ld a,019h		;9a7e  ; A = 25 frames for exit sequence
l9a80h:
	ld (TRANSITION_CTR),a		;9a80  ; Set transition counter
	ld a,001h		;9a83  ; A = 1
	ld (lb860h+1),a		;9a85  ; Set entity process flag (self-modifying)
	ld (ENTITY_ARRAY_LEN),a		;9a88  ; Set entity count = 1
	ld de,lad54h		;9a8b  ; DE = behavior data base
	ld hl,l9a95h		;9a8e  ; HL -> exit handler
	jp STATUS_DISPATCH		;9a91  ; -> enter exit transition state

; --- Exit animation toggle variable ---
l9a94h:
	nop			;9a94  ; DATA: animation toggle (0/1)

; ==========================================================================
; EXIT TRANSITION HANDLER ($9A95)
; ==========================================================================
; Handles the exit/escape sequence. Alternates between two animation
; states each frame, checks for item pickup, and counts down.
;
l9a95h:
	call HANDLE_LIFT		;9a95  ; Process lift mechanics
	call ENTITY_STEP		;9a98  ; Check boundaries
	call PICKUP_ITEM		;9a9b  ; Check for item pickup
	jp nz,lb860h		;9a9e  ; Item found -> handle it
	ld hl,lb860h+1		;9aa1  ; HL -> entity process counter
	inc (hl)			;9aa4  ; Increment frame counter

; --- Toggle animation state ---
	ld a,(l9a94h)		;9aa5  ; A = current toggle state
	xor 001h		;9aa8  ; Flip 0<->1
	ld (l9a94h),a		;9aaa  ; Store updated toggle
	jp z,l9abfh		;9aad  ; If now 0, skip movement this frame

; --- Odd frames: check timeout and move ---
	call CHECK_COMPLETION		;9ab0  ; Check mission timeout
	ld a,(ITEM_INTERACT_TBL)		;9ab3  ; A = interaction state
	inc a			;9ab6  ; Test if $C7
	cp 0c8h		;9ab7  ; At maximum?
	jp nc,END_MISSION		;9ab9  ; Yes -> end mission
	call MOVE_ENTITY		;9abc  ; Update position

; --- Advance position down one row ---
l9abfh:
	ld a,(PLAYER_POS)		;9abf  ; A = player position
	inc a			;9ac2  ; Advance
	ld (PLAYER_POS),a		;9ac3  ; Update
	ld hl,(PLAYER_POS_PTR)		;9ac6  ; HL = screen pointer
	ld de,00020h		;9ac9  ; DE = 32 (one row)
	add hl,de			;9acc  ; Move down
	ld (PLAYER_POS_PTR),hl		;9acd  ; Update
	ld hl,TRANSITION_CTR		;9ad0  ; HL -> transition counter
	dec (hl)			;9ad3  ; Decrement
	jp nz,MAIN_LOOP		;9ad4  ; Not done -> next frame

; --- Exit sequence complete ---
l9ad7h:
	ld de,lad54h		;9ad7  ; DE = behavior data
	jp lb48dh		;9ada  ; -> mission end processing
; ==========================================================================
; CHECK_TIMEOUT ($9ADD)
; ==========================================================================
; Scans up to B entity timeout counters spaced 6 bytes apart starting
; at $ADF5. If any counter has reached $C7 (incremented tests as $C8),
; returns with Z flag clear (timeout occurred). Otherwise Z flag set.
;
; On entry: B = number of counters to check (6 or 5)
; On exit: Z = no timeout, NZ = timeout occurred
;
CHECK_TIMEOUT:
	ld b,006h		;9add  ; B = 6 counters (default)
sub_9adfh:
	ld hl,ladf5h		;9adf  ; HL -> first timeout counter
	ld de,00006h		;9ae2  ; DE = 6 (stride between counters)
	ld c,001h		;9ae5  ; C = 1 (assume timeout)
l9ae7h:
	ld a,(hl)			;9ae7  ; A = counter value
	inc a			;9ae8  ; Test if $C7 (inc -> $C8)
	cp 0c8h		;9ae9  ; At maximum?
	jr nc,l9af2h		;9aeb  ; Yes -> timeout found
	add hl,de			;9aed  ; Next counter (+6 bytes)
	djnz l9ae7h		;9aee  ; Check all counters
	ld c,000h		;9af0  ; C = 0 (no timeout)
l9af2h:
	dec c			;9af2  ; C=0: DEC->$FF (NZ), C=1: DEC->0 (Z)... wait
	inc c			;9af3  ; Restore: sets flags. C=0->Z, C=1->NZ
	ret			;9af4

; ==========================================================================
; CHECK_COMPLETION ($9AF5)
; ==========================================================================
; Calls CHECK_TIMEOUT; if timeout occurred, aborts the current routine
; by popping the return address and jumping to the mission end handler.
;
CHECK_COMPLETION:
	call CHECK_TIMEOUT		;9af5  ; Check for entity timeout
	ret z			;9af8  ; No timeout -> return normally
	pop hl			;9af9  ; Pop caller's return address
	jr l9ad7h		;9afa  ; -> mission end processing

; ==========================================================================
; MISSION_CHECK ($9AFC)
; ==========================================================================
; Complex mission state machine. Checks guard capture states, item
; collection, and entity timeouts to determine if the mission should
; end or if the player can continue.
;
; Uses a return-via-push trick: pops BC (return address from caller),
; does its checks, then pushes BC and RETs to resume the caller.
;
MISSION_CHECK:
	pop bc			;9afc  ; BC = caller's return address

; --- Check guard capture states ---
	ld a,(lae1ah)		;9afd  ; A = guard 1 state
	cp 007h		;9b00  ; State 7 = captured?
	jr z,MISSION_STATE		;9b02  ; Yes -> return to caller
	ld a,(lae1dh)		;9b04  ; A = guard 2 state
	cp 007h		;9b07  ; State 7 = captured?
	jr z,MISSION_STATE		;9b09  ; Yes -> return to caller

; --- Check entity timeouts (5 counters) ---
	push bc			;9b0b  ; Save return address
	ld b,005h		;9b0c  ; B = 5 counters to check
	call sub_9adfh		;9b0e  ; Check timeouts
	pop bc			;9b11  ; Restore return address
	jp nz,END_MISSION		;9b12  ; Timeout -> end mission

; --- Check mission item collection ---
	ld a,(lae13h)		;9b15  ; A = mission item state
	inc a			;9b18  ; Test if $C7
	cp 0c8h		;9b19  ; Item collected (at max)?
	jp c,l9b31h		;9b1b  ; Not yet -> check more conditions

; --- Item collected: scroll left ---
	ld hl,PLAYER_POS		;9b1e  ; HL -> player position
	dec (hl)			;9b21  ; Move left
	ld hl,(PLAYER_POS_PTR)		;9b22  ; HL = screen pointer
	ld de,IM2_HANDLER_AREA		;9b25  ; DE = $FFE0 (-32, one row up)
	add hl,de			;9b28  ; Adjust pointer
	ld (PLAYER_POS_PTR),hl		;9b29  ; Update
	call ROOM_TRANS_LEFT		;9b2c  ; Handle room boundary
	jr MISSION_STATE		;9b2f  ; -> return to caller

; --- Check additional mission conditions ---
l9b31h:
	ld a,(lae1ch)		;9b31  ; A = guard 2 item state
	cp 0c7h		;9b34  ; At limit?
	jp nc,MISSION_STATE		;9b36  ; Yes -> return
	ld a,(ITEM_INTERACT_TBL)		;9b39  ; A = item interaction state
	cp 0c7h		;9b3c  ; At limit?
	jp nc,MISSION_STATE		;9b3e  ; Yes -> return

; --- Active mission: advance position and animate ---
	ld a,(PLAYER_POS)		;9b41  ; A = player position
	inc a			;9b44  ; Advance
	ld (PLAYER_POS),a		;9b45  ; Update
	ld hl,(PLAYER_POS_PTR)		;9b48  ; HL = screen pointer
	ld de,00020h		;9b4b  ; DE = 32 (one row)
	add hl,de			;9b4e  ; Move down
	ld (PLAYER_POS_PTR),hl		;9b4f  ; Update
	call HANDLE_LIFT		;9b52  ; Process lift
	push bc			;9b55  ; Save return address
	call ANIM_FRAME_TBL		;9b56  ; Update animation frame
	call DRAW_OBJECT		;9b59  ; Render player sprite
	call ANIM_SEQ_DATA		;9b5c  ; Advance animation sequence
	call PICKUP_ITEM		;9b5f  ; Check for item pickup
	pop bc			;9b62  ; Restore return address
	ld a,005h		;9b63  ; A = 5 (frames for next phase)
	jp z,l9a80h		;9b65  ; If pickup complete, enter exit sequence

; --- Return to caller via PUSH BC; RET ---
MISSION_STATE:
	push bc			;9b68  ; Push caller's return address
	ret			;9b69  ; Return to it
; ==========================================================================
; NORMAL GAMEPLAY INPUT HANDLER ($9B6A)
; ==========================================================================
; Called each frame during normal gameplay. Processes movement, mission
; checks, sound, then reads player input to determine next action.
;
; Input bits from READ_INPUT:
;   Bit 3: FIRE/JUMP -> enter left transition (4-frame scroll)
;   Bit 4: DOWN     -> enter right transition (5-frame scroll)
;   Bit 0: MOVE     -> continue in MAIN_LOOP
;   None:            -> END_MISSION
;
l9b6ah:
	call ENTITY_STEP		;9b6a  ; Check room boundaries
	call MISSION_CHECK		;9b6d  ; Check mission state
	call MOVE_ENTITY		;9b70  ; Update player position
	call PLAY_BEEP		;9b73  ; Play sound effects
	call READ_INPUT		;9b76  ; Read keyboard/joystick
	bit 3,a		;9b79  ; FIRE/JUMP pressed?
	jr z,l9ba1h		;9b7b  ; No -> check other buttons

; --- FIRE pressed: enter left room transition ---
l9b7dh:
	ld a,001h		;9b7d  ; A = 1
	ld (ENTITY_ARRAY_LEN),a		;9b7f  ; Reset entity count
	ld (lb860h+1),a		;9b82  ; Set entity process flag
	ld a,004h		;9b85  ; A = 4 (transition frames)
	ld (TRANSITION_CTR),a		;9b87  ; Set transition counter
	ld hl,l99a8h		;9b8a  ; HL -> left transition handler
	ld de,ANIM_SEQ_TBL		;9b8d  ; DE = animation sequence
	jp STATUS_DISPATCH		;9b90  ; -> enter transition state

; --- DOWN pressed: enter right room transition ---
l9b93h:
	ld a,005h		;9b93  ; A = 5 (transition frames)
	ld (TRANSITION_CTR),a		;9b95  ; Set transition counter
	ld hl,l9a0fh		;9b98  ; HL -> right transition handler
	ld de,ANIM_SEQ_TBL		;9b9b  ; DE = animation sequence
	jp STATUS_DISPATCH		;9b9e  ; -> enter transition state

; --- Check remaining buttons ---
l9ba1h:
	bit 4,a		;9ba1  ; DOWN pressed?
	jp nz,l9b93h		;9ba3  ; Yes -> right transition
	bit 0,a		;9ba6  ; MOVE pressed?
	jp z,END_MISSION		;9ba8  ; No buttons -> end mission
	jp MAIN_LOOP		;9bab  ; Movement -> continue game loop

; --- Transition frame counter variable ---
TRANSITION_CTR:
	nop			;9bae  ; DATA: frames remaining in current transition
; ==========================================================================
; SPECIAL ROOM SETUP ($9BAF)
; ==========================================================================
; Initializes a special room (room $1E/$18). Fills the entire attribute
; area with $FF (white, bright, flash) and sets player to a specific
; starting position. Used for cutscene/endgame rooms.
;
l9bafh:
	ld hl,05800h		;9baf  ; HL = attribute area start
	ld de,05801h		;9bb2  ; DE = attribute area + 1
	ld bc,0023fh		;9bb5  ; BC = 575 bytes (full attribute area - 1)
	ld (hl),0ffh		;9bb8  ; Set first byte to $FF (white flash)
	ldir		;9bba  ; Fill entire attribute area with $FF
	ld a,01eh		;9bbc  ; A = $1E (room number 30)
	ld (09943h),a		;9bbe  ; Set current room number
	ld a,018h		;9bc1  ; A = $18 (sub-room number 24)
	ld (09942h),a		;9bc3  ; Set room state byte
	ld a,005h		;9bc6  ; A = 5 (player X position)
	ld (PLAYER_POS),a		;9bc8  ; Set player position
	ld a,004h		;9bcb  ; A = 4 (player Y position)
	ld (PLAYER_Y),a		;9bcd  ; Set player Y
	ld hl,000a4h		;9bd0  ; HL = $00A4 (screen offset)
	ld (PLAYER_POS_PTR),hl		;9bd3  ; Set screen pointer
	ld hl,ld33ah		;9bd6  ; HL = $D33A (alternate room draw routine)
	ld (07747h),hl		;9bd9  ; Set room draw handler (self-modifying)
	ld a,002h		;9bdc  ; A = 2 (rendering sub-state)
	ld (09f9fh),a		;9bde  ; Set screen rendering sub-state
	jp l76d2h		;9be1  ; -> room/level setup (code_init.asm)

; ==========================================================================
; TOP BOUNDARY TRANSITION ($9BE4)
; ==========================================================================
; Called when player reaches Y = $1D (top of room). Either enters
; the special room (if room data starts with $41) or scrolls to
; the room above.
;
l9be4h:
	ld hl,(07747h)		;9be4  ; HL = room draw handler address
	ld a,(hl)			;9be7  ; A = first byte of handler code
	cp 041h		;9be8  ; Is it $41 (special room marker)?
	jr z,l9bafh		;9bea  ; Yes -> enter special room setup

; --- Normal upward transition ---
	ld hl,09943h		;9bec  ; HL -> room number
	inc (hl)			;9bef  ; Advance to room above
	ld a,0fdh		;9bf0  ; A = $FD (wrap Y to bottom of new room)
	ld (PLAYER_Y),a		;9bf2  ; Set player at bottom of new room
	ld hl,(PLAYER_POS_PTR)		;9bf5  ; HL = screen pointer
	ld de,IM2_HANDLER_AREA		;9bf8  ; DE = $FFE0 (-32, adjust pointer)
	add hl,de			;9bfb  ; Calculate new screen position
	ld de,00001h		;9bfc  ; DE = 1 (upward direction for room entry)
	jp lb7e1h		;9bff  ; -> room entry handler

; ==========================================================================
; BOTTOM BOUNDARY TRANSITION ($9C02)
; ==========================================================================
; Called when player reaches Y = $FD (bottom of room). Scrolls to
; the room below.
;
l9c02h:
	ld hl,09943h		;9c02  ; HL -> room number
	dec (hl)			;9c05  ; Move to room below
	ld a,01dh		;9c06  ; A = $1D (wrap Y to top of new room)
	ld (PLAYER_Y),a		;9c08  ; Set player at top of new room
	ld hl,(PLAYER_POS_PTR)		;9c0b  ; HL = screen pointer
	ld de,00020h		;9c0e  ; DE = 32 (one row down)
	add hl,de			;9c11  ; Calculate new screen position
	ld de,IM2_JUMP_TARGET		;9c12  ; DE = $FFFF (downward direction)
	jp lb7e1h		;9c15  ; -> room entry handler
; ==========================================================================
; LIFT STATE HANDLER ($9C18)
; ==========================================================================
; Processes the lift/elevator each frame. The lift countdown counter
; (LIFT_STATE_CTR) decreases each frame. When it reaches 0, the
; completion messages "@EXCELLENT@VALUE@" and "@YOU@HAVE@ESCAPED@"
; are copied to display, and the lift is marked as arrived ($C8).
;
; If LIFT_STATE_CTR is $FF or $FE (special states), skips the countdown
; and goes directly to the input handler (player waiting in lift).
;
l9c18h:
	call ENTITY_STEP		;9c18  ; Check room boundaries
	call MISSION_CHECK		;9c1b  ; Check mission state
	call MOVE_ENTITY		;9c1e  ; Update position
	call PLAY_BEEP		;9c21  ; Play sound

; --- Check lift counter state ---
	ld hl,LIFT_STATE_CTR		;9c24  ; HL -> lift state counter
	ld a,(hl)			;9c27  ; A = counter value
	inc a			;9c28  ; Test if $FF (inc -> 0)
	jr z,l9c73h		;9c29  ; If $FF -> jump to input handler
	inc a			;9c2b  ; Test if $FE (inc twice -> 0)
	jr z,l9c73h		;9c2c  ; If $FE -> jump to input handler

; --- Countdown active ---
	dec (hl)			;9c2e  ; Decrement lift counter
	jp nz,MAIN_LOOP		;9c2f  ; Not zero -> continue next frame

; --- Lift arrived: display completion messages ---
	ld b,011h		;9c32  ; B = 17 bytes to copy
	ld de,l9c50h		;9c34  ; DE -> "@EXCELLENT@VALUE@" text
	ld hl,l6793h		;9c37  ; HL = destination for first message
	call COPY_DATA_BLK		;9c3a  ; Copy message to display buffer
	ld b,012h		;9c3d  ; B = 18 bytes to copy
	ld de,l9c61h		;9c3f  ; DE -> "@YOU@HAVE@ESCAPED@" text
	ld hl,l67f3h		;9c42  ; HL = destination for second message
	call COPY_DATA_BLK		;9c45  ; Copy message to display buffer
	ld a,0c8h		;9c48  ; A = $C8 (lift arrived marker)
	ld (LIFT_STATE_CTR),a		;9c4a  ; Mark lift as arrived
	jp END_MISSION		;9c4d  ; -> end mission processing

; ==========================================================================
; COMPLETION MESSAGE TEXT DATA ($9C50)
; ==========================================================================
; Two text strings displayed when the player completes a mission.
; '$40' (@) is used as a space character in this context.
;
; $9C50 (17 bytes): "@EXCELLENT@VALUE@"
;
l9c50h:
	ld b,b			;9c50  ; DATA: $40 = '@' (space)
	ld b,l			;9c51  ; DATA: $45 = 'E'
	ld e,b			;9c52  ; DATA: $58 = 'X'
	ld b,e			;9c53  ; DATA: $43 = 'C'
	ld b,l			;9c54  ; DATA: $45 = 'E'
	ld c,h			;9c55  ; DATA: $4C = 'L'
	ld c,h			;9c56  ; DATA: $4C = 'L'
	ld b,l			;9c57  ; DATA: $45 = 'E'
	ld c,(hl)			;9c58  ; DATA: $4E = 'N'
	ld d,h			;9c59  ; DATA: $54 = 'T'
	ld b,b			;9c5a  ; DATA: $40 = '@' (space)
	ld d,(hl)			;9c5b  ; DATA: $56 = 'V'
	ld b,c			;9c5c  ; DATA: $41 = 'A'
	ld c,h			;9c5d  ; DATA: $4C = 'L'
	ld d,l			;9c5e  ; DATA: $55 = 'U'
	ld b,l			;9c5f  ; DATA: $45 = 'E'
	ld b,b			;9c60  ; DATA: $40 = '@' (space)

; $9C61 (18 bytes): "@YOU@HAVE@ESCAPED@"
;
l9c61h:
	ld b,b			;9c61  ; DATA: $40 = '@' (space)
	ld e,c			;9c62  ; DATA: $59 = 'Y'
	ld c,a			;9c63  ; DATA: $4F = 'O'
	ld d,l			;9c64  ; DATA: $55 = 'U'
	ld b,b			;9c65  ; DATA: $40 = '@' (space)
	ld c,b			;9c66  ; DATA: $48 = 'H'
	ld b,c			;9c67  ; DATA: $41 = 'A'
	ld d,(hl)			;9c68  ; DATA: $56 = 'V'
	ld b,l			;9c69  ; DATA: $45 = 'E'
	ld b,b			;9c6a  ; DATA: $40 = '@' (space)
	ld b,l			;9c6b  ; DATA: $45 = 'E'
	ld d,e			;9c6c  ; DATA: $53 = 'S'
	ld b,e			;9c6d  ; DATA: $43 = 'C'
	ld b,c			;9c6e  ; DATA: $41 = 'A'
	ld d,b			;9c6f  ; DATA: $50 = 'P'
	ld b,l			;9c70  ; DATA: $45 = 'E'
	ld b,h			;9c71  ; DATA: $44 = 'D'
	ld b,b			;9c72  ; DATA: $40 = '@' (space)

; --- Lift input handler: waiting in lift ---
; Checks for FIRE (bit 3), DOWN (bit 4), or UP (bit 1) input.
;
l9c73h:
	call READ_INPUT		;9c73  ; Read player input
	bit 3,a		;9c76  ; FIRE pressed?
	jp nz,l9b7dh		;9c78  ; Yes -> enter left transition
	bit 4,a		;9c7b  ; DOWN pressed?
	jp nz,l9b93h		;9c7d  ; Yes -> enter right transition
	bit 1,a		;9c80  ; UP pressed?
	jp z,END_MISSION		;9c82  ; No input -> end mission
	jp MAIN_LOOP		;9c85  ; UP -> continue game loop
; ==========================================================================
; TILE MAP LOOKUP TABLE ($9C88)
; ==========================================================================
; First 3 bytes are variables used by RENDER_TEXT_BLK:
;   $9C88-$9C89: 16-bit base pointer (read as word by RENDER_TEXT_BLK)
;   $9C8A: single-byte parameter (loaded into D' for rendering)
;
; Remaining 44 bytes ($9C8B-$9CB6) form a tile index lookup table.
; Each byte maps a slot to a tile/character code ($45-$61 = 'E'-'a').
; $FF entries mark unused/empty slots (no tile for that index).
;
l9c88h:
	nop			;9c88  ; DATA: base pointer low byte ($00)
	nop			;9c89  ; DATA: base pointer high byte ($00)
l9c8ah:
	nop			;9c8a  ; DATA: render parameter ($00)
l9c8bh:
	rst 38h			;9c8b  ; DATA: $FF (empty)
	rst 38h			;9c8c  ; DATA: $FF (empty)
	rst 38h			;9c8d  ; DATA: $FF (empty)
	rst 38h			;9c8e  ; DATA: $FF (empty)
	ld b,l			;9c8f  ; DATA: $45 = 'E'
	ld b,(hl)			;9c90  ; DATA: $46 = 'F'
	ld b,a			;9c91  ; DATA: $47 = 'G'
	ld c,b			;9c92  ; DATA: $48 = 'H'
	ld c,c			;9c93  ; DATA: $49 = 'I'
	ld c,d			;9c94  ; DATA: $4A = 'J'
	rst 38h			;9c95  ; DATA: $FF (empty)
	ld c,e			;9c96  ; DATA: $4B = 'K'
	ld c,h			;9c97  ; DATA: $4C = 'L'
	ld c,l			;9c98  ; DATA: $4D = 'M'
	ld c,(hl)			;9c99  ; DATA: $4E = 'N'
	ld c,a			;9c9a  ; DATA: $4F = 'O'
	ld d,b			;9c9b  ; DATA: $50 = 'P'
	ld d,c			;9c9c  ; DATA: $51 = 'Q'
	ld d,d			;9c9d  ; DATA: $52 = 'R'
	ld d,e			;9c9e  ; DATA: $53 = 'S'
	rst 38h			;9c9f  ; DATA: $FF (empty)
	rst 38h			;9ca0  ; DATA: $FF (empty)
	ld d,h			;9ca1  ; DATA: $54 = 'T'
	ld d,l			;9ca2  ; DATA: $55 = 'U'
	ld d,(hl)			;9ca3  ; DATA: $56 = 'V'
	ld d,a			;9ca4  ; DATA: $57 = 'W'
	ld e,b			;9ca5  ; DATA: $58 = 'X'
	ld e,c			;9ca6  ; DATA: $59 = 'Y'
	ld e,d			;9ca7  ; DATA: $5A = 'Z'
	ld e,e			;9ca8  ; DATA: $5B = '['
	ld e,h			;9ca9  ; DATA: $5C = '\'
	ld e,l			;9caa  ; DATA: $5D = ']'
	rst 38h			;9cab  ; DATA: $FF (empty)
	rst 38h			;9cac  ; DATA: $FF (empty)
	rst 38h			;9cad  ; DATA: $FF (empty)
	rst 38h			;9cae  ; DATA: $FF (empty)
	ld e,(hl)			;9caf  ; DATA: $5E = '^'
	ld e,a			;9cb0  ; DATA: $5F = '_'
	rst 38h			;9cb1  ; DATA: $FF (empty)
	ld h,b			;9cb2  ; DATA: $60 = '`'
	ld h,c			;9cb3  ; DATA: $61 = 'a'
	rst 38h			;9cb4  ; DATA: $FF (empty)
	rst 38h			;9cb5  ; DATA: $FF (empty)
	rst 38h			;9cb6  ; DATA: $FF (empty)
; ==========================================================================
; RENDER_TEXT_BLK ($9CB7)
; ==========================================================================
; Renders a 4x11 tile block using the tile map lookup table at $9C88.
; Temporarily sets the position pointer ($AD90) to the tile map base,
; then restores it to PLAYER_POS_PTR on exit.
;
; On entry:
;   BC = offset into tile map
;
RENDER_TEXT_BLK:
	ld hl,l9c88h		;9cb7  ; HL -> tile map lookup table
	ld (0ad90h),hl		;9cba  ; Set position pointer to tile map base
	ld hl,(l9c88h)		;9cbd  ; HL = base pointer from tile map header
	add hl,bc			;9cc0  ; HL += BC (apply offset)
	ld b,004h		;9cc1  ; B = 4 (height: 4 tile rows)
	ld c,00bh		;9cc3  ; C = 11 (width: 11 tile columns)
	exx			;9cc5  ; Switch to alternate registers
	ld a,(l9c8ah)		;9cc6  ; A = render parameter from tile map
	ld d,a			;9cc9  ; D' = render parameter
	exx			;9cca  ; Switch back to main registers
	ld a,(PLAYER_Y)		;9ccb  ; A = player Y position
	sub 002h		;9cce  ; A -= 2 (adjust for rendering offset)
	call RENDER_SPRITE_RAW		;9cd0  ; Render the 4x11 tile block

; --- Restore position pointer ---
l9cd3h:
	ld hl,PLAYER_POS_PTR		;9cd3  ; HL -> player position pointer variable
	ld (0ad90h),hl		;9cd6  ; Restore position pointer to player pos
	ret			;9cd9
; ==========================================================================
; RENDER_MSG_AREA ($9CDA)
; ==========================================================================
; Renders a 5x11 tile block in the message area near the player.
; Calculates the render position as PLAYER_POS_PTR + $3E (62 bytes
; offset = ~2 rows below player position in the screen map).
;
; On entry:
;   DE = tile data source
;   BC = offset adjustment
;
RENDER_MSG_AREA:
	ld hl,l7da8h		;9cda  ; HL -> message area position variable
	ld (0ad90h),hl		;9cdd  ; Set position pointer to message area
	ld hl,(PLAYER_POS_PTR)		;9ce0  ; HL = player screen position
	push de			;9ce3  ; Save tile data source
	ld de,0003eh		;9ce4  ; DE = $3E (62 bytes: offset to message area)
	add hl,de			;9ce7  ; HL = player pos + 62 (message area position)
	pop de			;9ce8  ; Restore tile data source
	ld (l7da8h),hl		;9ce9  ; Store calculated message area position
	add hl,bc			;9cec  ; HL += BC (apply offset)
	ld b,005h		;9ced  ; B = 5 (height: 5 tile rows)
	ld c,00bh		;9cef  ; C = 11 (width: 11 tile columns)
	exx			;9cf1  ; Switch to alternate registers
	ld d,00ah		;9cf2  ; D' = $0A (render mode: message text)
	exx			;9cf4  ; Switch back to main registers
	ld a,(PLAYER_Y)		;9cf5  ; A = player Y position
	sub 002h		;9cf8  ; A -= 2 (adjust for rendering offset)
	call RENDER_SPRITE_RAW		;9cfa  ; Render the 5x11 tile block
	jr l9cd3h		;9cfd  ; -> restore position pointer and return
; ==========================================================================
; CUTSCENE PHASE 1 ($9CFF)
; ==========================================================================
; Walking cutscene: player moves downward automatically. Checks for
; bottom boundary ($FD) to trigger room transition. Player can press
; DOWN (bit 4) to skip ahead, or waits for TRANSITION_CTR to expire.
; When done, switches to animation phase 1 (left room transition).
;
l9cffh:
	ld a,(PLAYER_Y)		;9cff  ; A = player Y position
	cp 0fdh		;9d02  ; At bottom boundary?
	jp z,l9c02h		;9d04  ; Yes -> bottom room transition
	call MOVE_ENTITY		;9d07  ; Update player position
	call READ_INPUT		;9d0a  ; Read player input
	bit 4,a		;9d0d  ; DOWN pressed?
	jp nz,l9d19h		;9d0f  ; Yes -> skip to next phase immediately
	ld hl,TRANSITION_CTR		;9d12  ; HL -> transition frame counter
	dec (hl)			;9d15  ; Decrement counter
	jp nz,MAIN_LOOP		;9d16  ; Not done -> continue next frame

; --- Transition to animation phase 1 ---
l9d19h:
	ld a,001h		;9d19  ; A = 1 (phase 1)
	jp l99dch		;9d1b  ; -> set animation phase in transition handler

; --- Frame toggle variable for cutscene phase 2 ---
l9d1eh:
	nop			;9d1e  ; DATA: alternating 0/1 flag (frame skip toggle)
; ==========================================================================
; CUTSCENE PHASE 2 ($9D1F)
; ==========================================================================
; Animated cutscene: player walks downward while text messages are
; rendered in the message area. Uses a frame-skip toggle (l9d1eh) to
; process rendering every other frame, creating a slower animation.
; When TRANSITION_CTR expires, renders the final message and sets
; LIFT_STATE_CTR to $10, then ends the mission sequence.
;
l9d1fh:
	ld a,(PLAYER_Y)		;9d1f  ; A = player Y position
	cp 0fdh		;9d22  ; At bottom boundary?
	jp z,l9c02h		;9d24  ; Yes -> bottom room transition
	call MOVE_ENTITY		;9d27  ; Update player position

; --- Frame-skip toggle: process rendering every other frame ---
	ld a,(l9d1eh)		;9d2a  ; A = frame toggle (0 or 1)
	xor 001h		;9d2d  ; Toggle: 0->1, 1->0
	ld (l9d1eh),a		;9d2f  ; Store toggled value
	jr nz,l9d1fh		;9d32  ; If now 1, skip rendering this frame

; --- Render text messages in message area ---
	ld de,l7de1h		;9d34  ; DE = first message tile data
	ld bc,GFX_PATTERN_TBL		;9d37  ; BC = offset for message area
	call RENDER_MSG_AREA		;9d3a  ; Render first message block (5x11)
	ld de,INPUT_DISPATCH		;9d3d  ; DE = second message tile data
	ld bc,GAME_ENTRY		;9d40  ; BC = offset for message area
	call RENDER_MSG_AREA		;9d43  ; Render second message block (5x11)

; --- Check transition countdown ---
	ld hl,TRANSITION_CTR		;9d46  ; HL -> transition frame counter
	dec (hl)			;9d49  ; Decrement counter
	jp nz,MAIN_LOOP		;9d4a  ; Not done -> continue next frame

; --- Transition complete: render final message ---
	ld de,l7daah		;9d4d  ; DE = final message tile data
	ld bc,GFX_PATTERN_TBL		;9d50  ; BC = offset for message area
	call RENDER_MSG_AREA		;9d53  ; Render final message block
	ld a,010h		;9d56  ; A = $10 (16: lift countdown start value)
	ld (LIFT_STATE_CTR),a		;9d58  ; Set lift state counter
	jp END_MISSION		;9d5b  ; -> end mission processing
; ==========================================================================
; ROOM_TRANS_LEFT ($9D5E)
; ==========================================================================
; Called during movement to check if the player has reached the left
; room boundary (X = $F9). If so, transitions to the room on the left
; by decrementing the room number at $9942, wrapping the player's X
; position, and jumping to the room entry handler.
;
; Note: Uses POP HL to discard the caller's return address, so this
; routine never returns to its caller when triggered.
;
; On exit (when triggered):
;   Room $9942 decremented
;   Player X wrapped: $F9 + $12 = $0B (8-bit wrap)
;   Screen pointer adjusted by +$240 (room width offset)
;   DE = $FFE0 (-32: leftward entry direction)
;
ROOM_TRANS_LEFT:
	ld a,(PLAYER_POS)		;9d5e  ; A = player X position
	cp 0f9h		;9d61  ; At left boundary ($F9)?
	ret nz			;9d63  ; No -> return to caller (no transition)

; --- Left boundary reached: transition to left room ---
	ld hl,09942h		;9d64  ; HL -> room state byte
	dec (hl)			;9d67  ; Decrement room (move to left room)
	pop hl			;9d68  ; Discard caller's return address
	add a,012h		;9d69  ; A = $F9+$12 = $0B (wrap X to right side)
	ld (PLAYER_POS),a		;9d6b  ; Set new player X position
	ld hl,(PLAYER_POS_PTR)		;9d6e  ; HL = current screen pointer
	ld de,00240h		;9d71  ; DE = $0240 (576: room width offset)
	add hl,de			;9d74  ; Adjust screen pointer for new room
	ld de,IM2_HANDLER_AREA		;9d75  ; DE = $FFE0 (-32: leftward entry direction)
	jp lb7e1h		;9d78  ; -> room entry handler
; ==========================================================================
; PLAY_BEEP ($9D7B)
; ==========================================================================
; Sound effect generator using the ZX Spectrum's internal speaker.
; Manages a cycling sound data system:
;   - XOR toggles a pattern value at $ABCB each call
;   - Advances a self-modifying data pointer by 18 bytes per call
;   - Every 4th call (frame counter reaches 4):
;     * Resets the data pointer back to $ABE6
;     * Outputs speaker pulses via port $FE (bit 4 = speaker)
;     * Duration: 1 pulse if $AE1B == $FE, else 10 pulses
;   - Copies 18 bytes from current pointer to $ABD4 (sound buffer)
;
; Self-modifying code: the LD HL,nnnn at $9DBA has its operand
; modified by writes to $9DBB to advance the data pointer.
;
PLAY_BEEP:
	ld a,(labcbh)		;9d7b  ; A = current sound pattern byte
	xor 09bh		;9d7e  ; Toggle pattern bits
	ld (labcbh),a		;9d80  ; Store toggled pattern

; --- Advance sound data pointer by 18 bytes ---
	ld hl,(09dbbh)		;9d83  ; HL = current data pointer (self-mod operand)
	ld de,00012h		;9d86  ; DE = 18 (sound data packet size)
	add hl,de			;9d89  ; HL += 18 (next packet)
	ld (09dbbh),hl		;9d8a  ; Store advanced pointer (modifies $9DBA+1)

; --- Check frame counter ---
	ld a,(l9dc6h)		;9d8d  ; A = frame counter
	inc a			;9d90  ; Increment
	cp 004h		;9d91  ; Reached 4?
	jr nz,l9db7h		;9d93  ; No -> skip beep, just copy data

; --- Every 4th frame: reset pointer and play speaker beep ---
	ld hl,labe6h		;9d95  ; HL = $ABE6 (sound data start)
	ld (09dbbh),hl		;9d98  ; Reset data pointer to start
	ld c,001h		;9d9b  ; C = 1 (default: short beep, 1 pulse)
	ld a,(lae1bh)		;9d9d  ; A = sound state byte
	cp 0feh		;9da0  ; Is it $FE (muted)?
	jr z,l9dadh		;9da2  ; Yes -> use short beep (1 pulse)
	ld a,(lae1bh)		;9da4  ; A = sound state byte (re-read)
	cp 0feh		;9da7  ; Double-check mute state
	jr z,l9dadh		;9da9  ; Still muted -> short beep
	ld c,00ah		;9dab  ; C = 10 (longer beep, 10 pulses)

; --- Speaker output loop ---
l9dadh:
	ld a,010h		;9dad  ; A = $10 (bit 4 set: speaker ON)
	out (0feh),a		;9daf  ; ULA port: speaker on, border black
	xor a			;9db1  ; A = $00 (speaker OFF)
	out (0feh),a		;9db2  ; ULA port: speaker off
	dec c			;9db4  ; Decrement pulse counter
	jr nz,l9dadh		;9db5  ; Loop for C pulses

; --- Store frame counter and copy sound data packet ---
l9db7h:
	ld (l9dc6h),a		;9db7  ; Store frame counter (0 after reset, or 1-3)
	ld hl,00000h		;9dba  ; HL = sound data source (SELF-MODIFYING: $9DBB)
	ld de,labd4h		;9dbd  ; DE = $ABD4 (sound processing buffer)
	ld bc,00012h		;9dc0  ; BC = 18 bytes (one sound data packet)
	ldir		;9dc3  ; Copy sound packet to buffer
	ret			;9dc5
; --- Game state variables ---
l9dc6h:
	nop			;9dc6  ; DATA: PLAY_BEEP frame counter (0-3)
SCREEN_FLIP_FLAG:
	ld (bc),a			;9dc7  ; DATA: $02 (screen flip/refresh toggle flag)
l9dc8h:
	nop			;9dc8  ; DATA: $00 (spare/padding)
l9dc9h:
	nop			;9dc9  ; DATA: $00 (spare/padding)
; ==========================================================================
; READ_INPUT ($9DCA)
; ==========================================================================
; Reads the current input device (keyboard or joystick) and returns
; a combined button state byte in A and stored at $9E00.
;
; Input mode is determined by the byte at $9DF0:
;   Mode 1 (Kempston): Reads joystick port $1F directly
;   Mode 0/2 (Keyboard/Protek): Scans 5 keys from the config table
;     at $9DF1, building a combined state byte from the result bits.
;
; Key config table format (5 entries of 3 bytes each):
;   Byte 0: Port high byte (A register for IN instruction)
;   Byte 1: Bit mask (AND with port result; 0 = key pressed)
;   Byte 2: Result bit (ORed into output when key detected)
;
; Output bits (combined into A):
;   Bit 0: RIGHT/MOVE
;   Bit 1: UP
;   Bit 2: LEFT
;   Bit 3: FIRE
;   Bit 4: DOWN
;
READ_INPUT:
	push hl			;9dca  ; Save HL
	ld hl,l9df0h		;9dcb  ; HL -> input mode byte
	ld a,(hl)			;9dce  ; A = input mode
	dec a			;9dcf  ; Test if mode 1 (Kempston)
	jr nz,l9dd9h		;9dd0  ; Not Kempston -> use keyboard scanning

; --- Kempston joystick: read port $1F directly ---
	in a,(01fh)		;9dd2  ; A = Kempston joystick port (active high)

; --- Store result and return ---
l9dd4h:
	ld (09e00h),a		;9dd4  ; Store combined input state
	pop hl			;9dd7  ; Restore HL
	ret			;9dd8

; --- Keyboard/Protek: scan 5 configured keys ---
l9dd9h:
	push bc			;9dd9  ; Save BC
	ld b,005h		;9dda  ; B = 5 keys to scan
	ld c,000h		;9ddc  ; C = 0 (combined input state accumulator)
l9ddeh:
	inc hl			;9dde  ; HL -> port high byte
	ld a,(hl)			;9ddf  ; A = port high byte (selects keyboard row)
	in a,(0feh)		;9de0  ; Read keyboard port (0 = pressed)
	inc hl			;9de2  ; HL -> bit mask
	and (hl)			;9de3  ; AND with mask: 0 if target key pressed
	inc hl			;9de4  ; HL -> result bit
	jr nz,l9deah		;9de5  ; Non-zero = key NOT pressed -> skip
	ld a,(hl)			;9de7  ; A = result bit for this key
	or c			;9de8  ; Set bit in combined state
	ld c,a			;9de9  ; C = updated combined state
l9deah:
	djnz l9ddeh		;9dea  ; Loop for all 5 keys
	ld a,c			;9dec  ; A = combined input state
	pop bc			;9ded  ; Restore BC
	jr l9dd4h		;9dee  ; -> store result and return
; ==========================================================================
; KEY CONFIGURATION TABLE ($9DF0)
; ==========================================================================
; Default keyboard mapping. First byte is the input mode, followed by
; 5 entries of 3 bytes each (port high byte, bit mask, result bit).
;
; Mode byte:
;   $00 = Keyboard (scan 5 keys below)
;   $01 = Kempston joystick (port $1F)
;   $02 = Protek joystick (scan keys)
;
; Default keyboard layout (ZX Spectrum port addresses):
;   Entry 0 (FIRE):  port $FDFE bit 0 = 'A'     -> result $08 (bit 3)
;   Entry 1 (LEFT):  port $FEFE bit 1 = 'Z'     -> result $04 (bit 2)
;   Entry 2 (DOWN):  port $7FFE bit 3 = 'N'     -> result $02 (bit 1)
;   Entry 3 (RIGHT): port $7FFE bit 2 = 'M'     -> result $01 (bit 0)
;   Entry 4 (UP):    port $7FFE bit 0 = 'Space' -> result $10 (bit 4)
;
; This table is overwritten when the player redefines keys via the
; menu (code_input.asm key redefinition handler).
;
l9df0h:
	nop			;9df0  ; DATA: $00 = Keyboard mode
l9df1h:
	defb 0fdh,001h,008h	;illegal sequence		;9df1  ; DATA: FIRE: port $FD, mask $01, result $08
	cp 002h		;9df4  ; DATA: LEFT: port $FE, mask $02, result $04
	inc b			;9df6  ; DATA: (part of LEFT entry: result $04)
	ld a,a			;9df7  ; DATA: DOWN: port $7F, mask $08, result $02
	ex af,af'			;9df8  ; DATA: (part of DOWN entry: mask $08)
	ld (bc),a			;9df9  ; DATA: (part of DOWN entry: result $02)
	ld a,a			;9dfa  ; DATA: RIGHT: port $7F, mask $04, result $01
	inc b			;9dfb  ; DATA: (part of RIGHT entry: mask $04)
	ld bc,0017fh		;9dfc  ; DATA: (part of RIGHT entry + UP: port $7F)
	djnz PRINT_TILE		;9dff  ; DATA: UP: mask $01, result $10
