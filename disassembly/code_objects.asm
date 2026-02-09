; ======================================================================
; code_objects.asm
; ======================================================================
;
; Object Interaction, Item Pickup & Inventory System
;
; Address range: $AE0C-$B10B (768 bytes)
; Source binary: block7_main.bin (loaded at $620C)
;
; Core item/object interaction system:
;   - PICKUP_ITEM ($AE51): Check adjacent tiles for collectible items
;   - Object interaction dispatcher ($AE1F): Handle stash searching
;   - CHECK_INVENTORY ($AEDA): Verify path clearance
;   - INTERACT_OBJECT ($B060): Tile-based object interaction
;   - INIT_OBJECT ($B102): Initialize object/item state data
;   - Sprite animation/state management
;   - Score timer and display updates
;
; Text data:
;   $AF37: "STASH SEARCHED" (14 chars, displayed at HUD $5066)
;
; Key variables:
;   STASH_SEARCH_IDX ($AF8D) - Current stash search progress
;   STASH_ITEM_TYPE ($AF8E) - Type of item held by player
;   laf8ah ($AF8A) - HUD item display address pointer
;
; Cross-references:
;   Called from: code_interaction.asm, code_mainloop.asm
;   Calls: STASH_SEARCH, UPDATE_SCORE, PRINT_TILE, READ_INPUT
;   Calls: INIT_OBJECT, ANIM_SEQ_SETUP, ANIM_SEQ_ENTRY, FORMAT_SCORE
;
; ======================================================================

; ==========================================================================
; GAME STATE VARIABLES ($AE0C-$AE1E)
; ==========================================================================
; Continuation of working RAM variables from code_behavior.asm.
; Used for tile lookups and interaction state during object handling.
;
	nop			;ae0c  ; Working variable
	nop			;ae0d
	nop			;ae0e
	nop			;ae0f
	nop			;ae10
	nop			;ae11
	nop			;ae12
lae13h:
	nop			;ae13  ; Adjacent tile state (checked for $FF)
lae14h:
	nop			;ae14  ; Tile at player position (boundary check)
lae15h:
	nop			;ae15  ; Tile ahead (right direction)
lae16h:
	nop			;ae16  ; Tile ahead (left direction)
	nop			;ae17
	nop			;ae18
ITEM_INTERACT_TBL:
	nop			;ae19  ; Interaction tile type (right)
lae1ah:
	nop			;ae1a  ; Tile at offset position
lae1bh:
	nop			;ae1b  ; Tile to the right (upper)
lae1ch:
	nop			;ae1c  ; Tile to the right (lower)
lae1dh:
	nop			;ae1d  ; Working variable
lae1eh:
	nop			;ae1e  ; Interaction tile type (left)
; ==========================================================================
; OBJECT INTERACTION DISPATCHER ($AE1F)
; ==========================================================================
; Main handler for object/stash interaction. Tries to pick up an item,
; then searches for stash contents, updating the player position and
; score as appropriate.
;
lae1fh:
	call PICKUP_ITEM		;ae1f  ; Try to pick up adjacent item
	jr nz,lae65h		;ae22  ; Item found -> handle directional pickup
; --- No item found: search stash at current position ---
	ld hl,(PLAYER_POS_PTR)		;ae24  ; Get player map pointer
	ld de,l66aeh		;ae27  ; DE = stash data offset table
	call STASH_SEARCH		;ae2a  ; Look up stash at this position
	add hl,de			;ae2d  ; HL = stash data address
	xor a			;ae2e
	cp (hl)			;ae2f  ; Is stash empty (zero)?
	ld b,002h		;ae30  ; Score value = 2
	call z,UPDATE_SCORE		;ae32  ; Empty stash -> award points
; --- Advance player to next map row ---
	ld hl,PLAYER_POS		;ae35  ; Point to player position byte
	inc (hl)			;ae38  ; Move to next room/row
	ld hl,(PLAYER_POS_PTR)		;ae39  ; Reload position pointer
	ld de,00020h		;ae3c  ; One map row = 32 bytes
	add hl,de			;ae3f  ; Advance pointer one row down
	ld (PLAYER_POS_PTR),hl		;ae40  ; Store updated pointer
; --- Check stash on next row too ---
	ld de,l66aeh		;ae43  ; Stash data offset
	call STASH_SEARCH		;ae46  ; Search next row's stash
	add hl,de			;ae49  ; HL = next row's stash data
	xor a			;ae4a
	cp (hl)			;ae4b  ; Is next stash empty?
	jp nz,END_MISSION		;ae4c  ; Not empty -> end interaction
	jr lae99h		;ae4f  ; Empty -> fall through to input
; ==========================================================================
; PICKUP_ITEM ($AE51)
; ==========================================================================
; Scans 4 adjacent tile slots (lae1ah..lae1dh) for collectible items.
; Items have tile codes >= $C7 (i.e. code+1 >= $C8).
; Returns: NZ if item found (C=2), Z if no item (C=0).
;
PICKUP_ITEM:
	ld hl,lae1ah		;ae51  ; Start of 4-tile adjacency buffer
	ld c,001h		;ae54  ; C = 1 (neutral default)
	ld b,004h		;ae56  ; Check 4 adjacent tiles
lae58h:
	ld a,(hl)			;ae58  ; Read tile code
	inc a			;ae59  ; +1 (maps $FF->0, $C7->$C8)
	cp 0c8h		;ae5a  ; Is it an interactive item? (>= $C7)
	jr nc,lae63h		;ae5c  ; Yes -> item found
	inc hl			;ae5e  ; Next tile slot
	djnz lae58h		;ae5f  ; Loop all 4 tiles
	dec c			;ae61  ; C = 0 (no item found)
	ret			;ae62  ; Return with Z flag (C=0)
lae63h:
	inc c			;ae63  ; C = 2 (item found)
	ret			;ae64  ; Return with NZ flag (C=2)
; --- Directional item pickup: item found in adjacency scan ---
lae65h:
	ld a,(PLAYER_POS)		;ae65  ; Get player room position
	cp 0ffh		;ae68  ; Negative = facing left?
	ld de,l66aeh		;ae6a  ; Default: right-side stash offset
	jp p,lae73h		;ae6d  ; Positive -> use right offset
	ld de,l674eh		;ae70  ; Negative -> use left-side offset
lae73h:
	call STASH_SEARCH		;ae73  ; Look up stash data
	ld hl,(PLAYER_POS_PTR)		;ae76  ; Get position pointer
	add hl,de			;ae79  ; HL = stash address
	ld a,(hl)			;ae7a  ; Read stash contents
	or a			;ae7b  ; Is stash empty?
	jr z,lae99h		;ae7c  ; Empty -> fall through to input
; --- Stash has contents: prompt player action ---
	call READ_INPUT		;ae7e  ; Read player input
	bit 4,a		;ae81  ; DOWN pressed?
	jp z,lae94h		;ae83  ; No -> check LEFT instead
	ld a,001h		;ae86  ; Start 1-frame transition
	ld (TRANSITION_CTR),a		;ae88  ; Set transition counter
	ld hl,laeeeh		;ae8b  ; Handler: item transition logic
	ld de,lac2eh		;ae8e  ; Animation: pickup sequence
	jp STATUS_DISPATCH		;ae91  ; Install handler + animation
lae94h:
	bit 2,a		;ae94  ; LEFT pressed?
	jp z,END_MISSION		;ae96  ; No input -> end interaction
; ==========================================================================
; INPUT-BASED OBJECT INTERACTION ($AE99)
; ==========================================================================
; Reads directional input and performs left/right interaction with
; objects. UP = interact facing left, RIGHT = interact facing right.
; Flips player direction if already facing the interaction direction.
;
lae99h:
	call READ_INPUT		;ae99  ; Read player input
	bit 1,a		;ae9c  ; UP pressed?
	jr z,laec4h		;ae9e  ; No -> check RIGHT
; --- UP: interact facing left ---
	ld a,(PLAYER_DIR)		;aea0  ; Get player direction
	dec a			;aea3  ; 1 (right) -> 0
	jr z,laeb7h		;aea4  ; Was facing right -> just flip dir
	call CHECK_INVENTORY		;aea6  ; Verify path is passable
	ld b,002h		;aea9  ; Score value = 2
	call UPDATE_SCORE		;aeab  ; Award score
	ld de,lac82h		;aeae  ; Animation: left interaction
	ld hl,lba5bh		;aeb1  ; Handler for left-side action
	jp STATUS_DISPATCH		;aeb4  ; Install handler
laeb7h:
	ld (PLAYER_DIR),a		;aeb7  ; A=0: flip to face left
	jp MAIN_LOOP		;aeba  ; Return to game loop
laebdh:
	inc a			;aebd  ; A = 1
	ld (PLAYER_DIR),a		;aebe  ; Flip to face right
	jp MAIN_LOOP		;aec1  ; Return to game loop
; --- RIGHT: interact facing right ---
laec4h:
	bit 0,a		;aec4  ; RIGHT pressed?
	jr z,laeebh		;aec6  ; No -> exit interaction
	ld a,(PLAYER_DIR)		;aec8  ; Get player direction
	or a			;aecb  ; Facing left (0)?
	jr z,laebdh		;aecc  ; Yes -> just flip to right
	call CHECK_INVENTORY		;aece  ; Verify path is passable
	ld de,lac82h		;aed1  ; Animation: right interaction
	ld hl,lba03h		;aed4  ; Handler for right-side action
	jp STATUS_DISPATCH		;aed7  ; Install handler
; --- CHECK_INVENTORY: verify path is passable before interaction ---
; Returns normally if target tile is empty (passable).
; If blocked, discards caller's return address and jumps to MAIN_LOOP.
;
CHECK_INVENTORY:
	ld hl,(PLAYER_POS_PTR)		;aeda  ; Get player position pointer
	ld de,l670eh		;aedd  ; Passability check offset
	call STASH_SEARCH		;aee0  ; Look up passability data
	add hl,de			;aee3  ; HL = target tile address
	xor a			;aee4
	cp (hl)			;aee5  ; Is target tile empty (passable)?
	ret z			;aee6  ; Yes -> return to caller
	pop hl			;aee7  ; No -> discard return address
	jp MAIN_LOOP		;aee8  ; Abort interaction, back to loop
laeebh:
	jp MAIN_LOOP		;aeeb  ; No input -> return to game loop
; ==========================================================================
; ITEM TRANSITION HANDLER ($AEEE)
; ==========================================================================
; Called via STATUS_DISPATCH when player picks up an item.
; Interacts with adjacent tiles above and below the player to update
; the map (e.g. removing the item graphic from surrounding tiles).
;
laeeeh:
	ld a,(TRANSITION_CTR)		;aeee  ; Get transition countdown
	or a			;aef1  ; Active?
	jr z,laf1eh		;aef2  ; No -> skip to cleanup
; --- Upper tile interaction ---
	ld a,(lae13h)		;aef4  ; Load adjacent tile (above)
	inc a			;aef7  ; Check for $FF (empty)
	jr z,laf09h		;aef8  ; Empty -> skip upper interaction
	ld de,l6bcch		;aefa  ; Right-side upper tile offset
	ld a,(PLAYER_DIR)		;aefd  ; Check direction
	dec a			;af00  ; Facing right?
	jr nz,laf06h		;af01  ; No -> use right offset
	ld de,l6bd1h		;af03  ; Yes (=facing left) -> left offset
laf06h:
	call INTERACT_OBJECT		;af06  ; Interact with upper tile
; --- Lower tile interaction ---
laf09h:
	ld a,(lae07h)		;af09  ; Load tile below player
	inc a			;af0c  ; Check for $FF (empty)
	jr z,laf1eh		;af0d  ; Empty -> skip lower interaction
	ld de,l6b8ch		;af0f  ; Right-side lower tile offset
	ld a,(PLAYER_DIR)		;af12  ; Check direction
	dec a			;af15  ; Facing right?
	jr nz,laf1bh		;af16  ; No -> use right offset
	ld de,l6b91h		;af18  ; Yes (=facing left) -> left offset
laf1bh:
	call INTERACT_OBJECT		;af1b  ; Interact with lower tile
; --- Cleanup: clear transition, check for DOWN to continue ---
laf1eh:
	xor a			;af1e
	ld (TRANSITION_CTR),a		;af1f  ; Clear transition counter
	call READ_INPUT		;af22  ; Read player input
	bit 4,a		;af25  ; DOWN pressed?
	jp nz,MAIN_LOOP		;af27  ; Yes -> return to game loop
; --- Default handler reset: reinstall main object dispatcher ---
laf2ah:
	xor a			;af2a
	ld (ENTITY_ARRAY_LEN),a		;af2b  ; Clear entity count
	ld hl,lae1fh		;af2e  ; Point to main object dispatcher
	ld de,lac58h		;af31  ; Standard animation sequence
	jp STATUS_DISPATCH		;af34  ; Re-install as active handler
; --- "STASH SEARCHED" text data (14 chars at HUD $5066) ---
laf37h:
	ld d,e			;af37  ; $53 = 'S'
	ld d,h			;af38  ; $54 = 'T'
	ld b,c			;af39  ; $41 = 'A'
	ld d,e			;af3a  ; $53 = 'S'
	ld c,b			;af3b  ; $48 = 'H'
	jr nz,laf91h		;af3c  ; $20,$53 = ' ','S'
	ld b,l			;af3e  ; $45 = 'E'
	ld b,c			;af3f  ; $41 = 'A'
	ld d,d			;af40  ; $52 = 'R'
	ld b,e			;af41  ; $43 = 'C'
	ld c,b			;af42  ; $48 = 'H'
	ld b,l			;af43  ; $45 = 'E'
	ld b,h			;af44  ; $44 = 'D'
; ==========================================================================
; STASH ANIMATION HANDLER ($AF45)
; ==========================================================================
; Countdown-driven handler for stash search animation. On each frame,
; shifts sprite data left through the SPRITE_BASE buffer. When a
; "search" frame (type 4) completes, draws a random item tile on the
; HUD and awards 100 points.
;
laf45h:
	ld hl,TRANSITION_CTR		;af45  ; Point to transition countdown
	dec (hl)			;af48  ; Decrement counter
	jp nz,MAIN_LOOP		;af49  ; Not zero -> wait another frame
; --- Shift sprite data buffer left by one entry ---
	ld hl,(SPRITE_BASE)		;af4c  ; Get sprite data table
	ld a,(hl)			;af4f  ; Save first sprite byte (current frame)
	ld (l88cdh),a		;af50  ; Store in temp variable
	ld b,005h		;af53  ; 5 sprite entries to shift
laf55h:
	inc hl			;af55  ; Point to next entry
	ld a,(hl)			;af56  ; Read it
	dec hl			;af57  ; Back to current slot
	ld (hl),a			;af58  ; Copy next -> current (shift left)
	inc hl			;af59  ; Advance to next
	cp 003h		;af5a  ; End-of-sequence marker?
	jr z,laf60h		;af5c  ; Yes -> stop shifting
	djnz laf55h		;af5e  ; Loop remaining entries
laf60h:
	dec hl			;af60  ; HL = last valid entry
	ld a,(l88cdh)		;af61  ; Recover saved frame type
	cp 004h		;af64  ; Is it type 4 (stash search frame)?
	jr nz,laf8fh		;af66  ; No -> handle as normal completion
; --- Type 4: stash search - draw random item on HUD ---
	ld hl,(laf8ah)		;af68  ; HUD item display pointer
	inc hl			;af6b  ; Advance to next display position
	ld (laf8ah),hl		;af6c  ; Store updated pointer
	ld d,h			;af6f  ; DE = HUD screen address
	ld e,l			;af70
	ld hl,STASH_SEARCH_IDX		;af71  ; Point to search counter
	inc (hl)			;af74  ; Increment items searched
	dec hl			;af75  ; Point to item type variable
	ld a,r		;af76  ; Read R register (pseudo-random)
	and 001h		;af78  ; Random bit: 0 or 1
	add a,025h		;af7a  ; $25 or $26 -> random item tile
	ld (hl),a			;af7c  ; Store chosen item type
	ld c,001h		;af7d  ; Print 1 tile
	call PRINT_TILE		;af7f  ; Draw item tile on HUD
	ld b,064h		;af82  ; Score = 100 points
	call ANIM_SEQ_ENTRY		;af84  ; Run animation + award score
	jp END_MISSION		;af87  ; End interaction
; --- Sprite state variables ---
laf8ah:
	nop			;af8a  ; HUD item display pointer (low byte)
	nop			;af8b  ; HUD item display pointer (high byte)
	nop			;af8c  ; (padding)
STASH_SEARCH_IDX:
	nop			;af8d  ; Count of stash items searched
STASH_ITEM_TYPE:
	nop			;af8e  ; Type of item currently held
; ==========================================================================
; NON-SEARCH SPRITE COMPLETION ($AF8F)
; ==========================================================================
; Handles completion of a non-search sprite frame (types other than 4).
; Updates entity visibility, displays "STASH SEARCHED" message if the
; frame's high bit is set, and reinitializes object state.
;
laf8fh:
	ld b,000h		;af8f  ; Default: no status flag
laf91h:
	ld a,(l8a6eh)		;af91  ; Load entity visibility counter
	or a			;af94  ; Is entity visible?
	jr nz,laf99h		;af95  ; Yes -> keep B=0
	ld b,080h		;af97  ; No -> set bit 7 (invisible flag)
laf99h:
	ld a,(09408h)		;af99  ; Load current interaction state
	or a			;af9c  ; Has state?
	jr nz,lafa3h		;af9d  ; Yes -> use existing state
	ld a,003h		;af9f  ; Default state = 3 (complete)
	ld b,000h		;afa1  ; Clear visibility flag
lafa3h:
	or b			;afa3  ; Combine state + visibility flag
	ld (hl),a			;afa4  ; Write to sprite data slot
	dec b			;afa5  ; Test if B was zero:
	inc b			;afa6  ;   dec+inc preserves value, sets Z if 0
	jr z,lafaeh		;afa7  ; B=0 -> skip visibility update
	ld a,001h		;afa9
	ld (l8a6eh),a		;afab  ; Mark entity as visible
; --- Check if frame has message flag (bit 7) ---
lafaeh:
	ld a,(l88cdh)		;afae  ; Recover saved sprite frame type
	bit 7,a		;afb1  ; High bit = "show message" flag?
	jr z,lafceh		;afb3  ; No message -> skip display
	and 07fh		;afb5  ; Strip message flag, keep type
	push af			;afb7  ; Save type
; --- Display "STASH SEARCHED" on HUD ---
	ld hl,05adbh		;afb8  ; HUD attribute area (status line)
	ld b,004h		;afbb  ; 4 attribute bytes
lafbdh:
	ld (hl),08fh		;afbd  ; Set bright white + flash attribute
	inc hl			;afbf
	djnz lafbdh		;afc0  ; Fill 4 bytes
	ld hl,laf37h		;afc2  ; Point to "STASH SEARCHED" text
	ld c,00eh		;afc5  ; 14 characters
	ld de,05066h		;afc7  ; HUD message area ($5066)
	call PRINT_TILE		;afca  ; Print message to screen
	pop af			;afcd  ; Restore frame type
; --- Update interaction state ---
lafceh:
	cp 003h		;afce  ; State = 3 (complete)?
	jr nz,lafd3h		;afd0  ; No -> store as-is
	xor a			;afd2  ; State 3 -> reset to 0
lafd3h:
	ld (09408h),a		;afd3  ; Store updated interaction state
	call INIT_OBJECT		;afd6  ; Reinitialize object state
	jp END_MISSION		;afd9  ; End interaction
; ==========================================================================
; THROW/TOSS HANDLER ($AFDC)
; ==========================================================================
; Handles the player throwing or tossing held objects at enemies/NPCs.
; Sets up the thrown object's spawn position based on player direction,
; calculates sprite ID from interaction state, and reads input to
; determine throw direction (FIRE = upward, LEFT = horizontal).
;
lafdch:
	ld a,(ladfbh)		;afdc  ; Check for adjacent entity
	inc a			;afdf  ; $FF (none) -> 0
	jr z,lb051h		;afe0  ; No entity nearby -> exit
	ld a,(09408h)		;afe2  ; Load interaction state (held item)
	cp 000h		;afe5  ; Holding nothing?
	jr z,lb03ch		;afe7  ; -> handle transition animation only
; --- Calculate spawn position for thrown object ---
	ld a,(PLAYER_DIR)		;afe9  ; Get player direction
	dec a			;afec  ; Facing right (1->0)?
	ld bc,00508h		;afed  ; Right: Y-offset=5, X-offset=8
	ld de,00045h		;aff0  ; Right: map offset=69
	jr z,laffbh		;aff3  ; Yes -> use right-side values
	ld bc,00004h		;aff5  ; Left: Y-offset=0, X-offset=4
	ld de,00040h		;aff8  ; Left: map offset=64
laffbh:
	ld a,(PLAYER_Y)		;affb  ; Get player Y position
	add a,b			;affe  ; Add directional Y offset
	ld hl,(PLAYER_POS_PTR)		;afff  ; Get player map pointer
	add hl,de			;b002  ; Add directional map offset
	ld (b13_end),a		;b003  ; Store spawn Y coordinate
	ld a,(PLAYER_POS)		;b006  ; Get player room position
	add a,002h		;b009  ; Offset +2 for spawn X
	ld (l940bh),a		;b00b  ; Store spawn X coordinate
; --- Calculate sprite ID for thrown object ---
	ld a,(09408h)		;b00e  ; Load held item type
	add a,a			;b011  ; Double (sprite index = type * 2)
	add a,0d0h		;b012  ; Add sprite base $D0
	ld (l940ah),a		;b014  ; Store sprite ID for thrown object
; --- Spawn the thrown object ---
	xor a			;b017
	ld (09408h),a		;b018  ; Clear held item (now thrown)
	call INIT_OBJECT		;b01b  ; Initialize thrown object entity
	ld (l940dh),hl		;b01e  ; Store map position pointer
	ld a,c			;b021  ; C = X movement parameter
	ld (l940fh),a		;b022  ; Store X movement
	ld (l9410h),a		;b025  ; Store throw direction default
; --- Read input for throw direction ---
	call READ_INPUT		;b028  ; Read player input
	ld hl,l9410h		;b02b  ; Point to throw direction byte
	bit 3,a		;b02e  ; FIRE pressed?
	jr z,lb034h		;b030  ; No -> check LEFT
	jr lb039h		;b032  ; Yes -> throw upward (inc twice)
lb034h:
	bit 2,a		;b034  ; LEFT pressed?
	jr z,lb051h		;b036  ; No -> don't adjust direction
	inc (hl)			;b038  ; LEFT: increment direction once
lb039h:
	inc (hl)			;b039  ; FIRE/LEFT: increment direction
	jr lb051h		;b03a  ; -> exit to cleanup
; --- Transition-only path (no item held) ---
lb03ch:
	ld a,(TRANSITION_CTR)		;b03c  ; Get transition counter
	or a			;b03f  ; Active?
	jr z,lb051h		;b040  ; No -> exit
	ld de,l6b2ch		;b042  ; Right-side throw tile offset
	ld a,(PLAYER_DIR)		;b045  ; Check direction
	dec a			;b048  ; Facing right?
	jr nz,lb04eh		;b049  ; No -> use right offset
	ld de,l6b31h		;b04b  ; Left-side throw tile offset
lb04eh:
	call INTERACT_OBJECT		;b04e  ; Handle throw animation
; --- Shared exit: clear transition, check for DOWN ---
lb051h:
	xor a			;b051
	ld (TRANSITION_CTR),a		;b052  ; Clear transition counter
	call READ_INPUT		;b055  ; Read player input
	bit 4,a		;b058  ; DOWN pressed?
	jp z,END_MISSION		;b05a  ; No -> end interaction
	jp MAIN_LOOP		;b05d  ; Yes -> return to game loop
; ==========================================================================
; INTERACT_OBJECT ($B060)
; ==========================================================================
; Checks a tile at player position + DE offset for interactable content.
; If the tile is not empty ($FF), sets interaction type and starts a
; transition. If the immediate tile is empty, checks 2 rows below.
;
; Input:  DE = tile offset from player position
; Output: TRANSITION_CTR set to 1 if interaction found
;         l8d42h = interaction type (1=direct, 2=below)
;
INTERACT_OBJECT:
	ld hl,(PLAYER_POS_PTR)		;b060  ; Get player map pointer
	add hl,de			;b063  ; Add tile offset
	ld a,(hl)			;b064  ; Read tile at target
	inc a			;b065  ; Check for $FF (empty)
	jr z,lb073h		;b066  ; Empty -> check 2 rows below
	ld a,001h		;b068  ; Interaction type 1 (direct tile)
lb06ah:
	ld (l8d42h),a		;b06a  ; Store interaction type
	ld a,001h		;b06d  ; Set transition active
	ld (TRANSITION_CTR),a		;b06f  ; Start 1-frame transition
	ret			;b072
; --- Direct tile empty: check 2 rows below ---
lb073h:
	ld de,00240h		;b073  ; Offset = 2 rows (2*$120 = $240)
	add hl,de			;b076  ; Point 2 rows below target
	ld a,(hl)			;b077  ; Read that tile
	inc a			;b078  ; Check for $FF (empty)
	ret z			;b079  ; Empty -> nothing to interact with
	ld a,002h		;b07a  ; Interaction type 2 (tile below)
	jr lb06ah		;b07c  ; -> store type and set transition
; ==========================================================================
; ANIMATION TRANSITION SETUP ($B07E)
; ==========================================================================
; Sets up a 2-frame transition with animation. After countdown expires,
; installs completion handler. During countdown, interacts with nearby
; tiles in the player's facing direction.
;
lb07eh:
	ld a,002h		;b07e  ; 2-frame transition
	ld (TRANSITION_CTR),a		;b080
	ld hl,lb08ch		;b083  ; Frame handler address
	ld de,lacd6h		;b086  ; Animation sequence
	jp STATUS_DISPATCH		;b089  ; Install handler
; --- Per-frame handler ---
lb08ch:
	ld hl,TRANSITION_CTR		;b08c  ; Point to countdown
	dec (hl)			;b08f  ; Decrement
	jr nz,lb09bh		;b090  ; Not done -> animate
; --- Transition complete: install end handler ---
	ld hl,lb0b3h		;b092  ; Completion handler (jp END_MISSION)
	ld de,ANIM_SEQ_TBL		;b095  ; Standard animation table
	jp STATUS_DISPATCH		;b098  ; Install completion handler
; --- Still transitioning: interact with nearby entity ---
lb09bh:
	ld a,(ladf6h)		;b09b  ; Load nearby entity tile
	inc a			;b09e  ; Check for $FF (none)
	jr z,lb0b0h		;b09f  ; No entity -> return to loop
	ld de,l6b2dh		;b0a1  ; Right-side interaction offset
	ld a,(PLAYER_DIR)		;b0a4  ; Check player direction
	dec a			;b0a7  ; Facing right?
	jr nz,lb0adh		;b0a8  ; No -> use right offset
	ld de,l6b30h		;b0aa  ; Left-side interaction offset
lb0adh:
	call INTERACT_OBJECT		;b0ad  ; Interact with nearby tile
lb0b0h:
	jp MAIN_LOOP		;b0b0  ; Return to game loop
; --- Transition complete handler ---
lb0b3h:
	jp END_MISSION		;b0b3  ; End interaction cleanly
; ==========================================================================
; SCORE TIMER HANDLER ($B0B6)
; ==========================================================================
; Periodic handler that decrements a timer and updates the score display.
; Called as part of the game tick. When the timer reaches zero, it resets
; to 2 and calls the bank-switched score update routine at $F253.
; Checks score limits at $F264 (max 14) and $F271 (stop at 1).
;
	ld bc,lb621h		;b0b6  ; BC = timer/score address
	or b			;b0b9  ; Combine A with B (entry state)
	dec (hl)			;b0ba  ; Decrement timer
	ret nz			;b0bb  ; Not zero -> return (still counting)
	ld (hl),002h		;b0bc  ; Reset timer to 2
	ld a,(0f264h)		;b0be  ; Load score counter (bank 1)
	cp 00eh		;b0c1  ; At maximum (14)?
	jr nz,lb0cbh		;b0c3  ; No -> update score
	ld a,(0f271h)		;b0c5  ; Load secondary score byte (bank 1)
	cp 001h		;b0c8  ; Reached limit?
	ret z			;b0ca  ; Yes -> don't update further
lb0cbh:
	call 0f253h		;b0cb  ; Call score update in bank 1
	ld b,001h		;b0ce  ; Score increment = 1
	call FORMAT_SCORE		;b0d0  ; Format score for display
	call 0f253h		;b0d3  ; Call score update in bank 1 again
	ret			;b0d6
; ==========================================================================
; SPRITE STATE MANAGEMENT ($B0D7)
; ==========================================================================
; Resets sprite visibility state. If A=0 and entity visibility counter
; is active, clears the high bits (status flags) from all 5 sprite
; entries, resets HUD attributes to normal white, and reinitializes
; the animation sequence. Falls through to shared INIT_OBJECT tail.
;
; Input: A = state (0 = perform reset, non-zero = skip)
;
sub_b0d7h:
	push hl			;b0d7
	or a			;b0d8  ; Test A (caller's state)
	jr nz,lb0fdh		;b0d9  ; Non-zero -> skip reset
	ld hl,l8a6eh		;b0db  ; Entity visibility counter
	ld a,(hl)			;b0de  ; Load counter
	or a			;b0df  ; Is entity visible?
	jr z,lb0fdh		;b0e0  ; No -> skip
; --- Clear status flags from sprite data ---
	dec (hl)			;b0e2  ; Decrement visibility counter
	ld hl,(SPRITE_BASE)		;b0e3  ; Get sprite data table
	ld b,005h		;b0e6  ; 5 sprite entries
lb0e8h:
	ld a,(hl)			;b0e8  ; Read sprite byte
	and 07fh		;b0e9  ; Clear bit 7 (status/message flag)
	ld (hl),a			;b0eb  ; Write back
	inc hl			;b0ec  ; Next entry
	djnz lb0e8h		;b0ed  ; Loop 5 entries
; --- Reset HUD attributes to normal (no flash) ---
	ld hl,05adbh		;b0ef  ; HUD attribute area
	ld b,004h		;b0f2  ; 4 attribute bytes
lb0f4h:
	ld (hl),00fh		;b0f4  ; White ink, black paper (normal)
	inc hl			;b0f6
	djnz lb0f4h		;b0f7  ; Fill 4 bytes
	call ANIM_SEQ_SETUP		;b0f9  ; Reinitialize animation sequence
	xor a			;b0fc  ; A = 0
; --- Shared tail with INIT_OBJECT ---
lb0fdh:
	ld hl,0001ah		;b0fd  ; HL = $001A (data offset)
	jr lb109h		;b100  ; -> continue to shared init
; ==========================================================================
; INIT_OBJECT ($B102)
; ==========================================================================
; Initializes/resets object interaction state. Loads the current
; interaction state from $9408 and sets up the data offset for
; the object system. HL=0 for fresh init, HL=$001A when called
; from sub_b0d7h (sprite reset path).
;
; Self-modifying: stores HL into the operand at lb12bh+1.
;
INIT_OBJECT:
	ld a,(09408h)		;b102  ; Load current interaction state
	push hl			;b105
	ld hl,00000h		;b106  ; HL = 0 (fresh init, no offset)
lb109h:
	ld (lb12bh),hl		;b109  ; Self-modify: store offset for later
