; ======================================================================
; code_init.asm
; ======================================================================
;
; New Game / Level Initialization
;
; Address range: $760C-$770B (256 bytes)
; Source binary: block7_main.bin (loaded at $620C)
;
; Despite the filename, this is primarily the new game initialization
; routine. Called when starting a new game or mission. Sets up:
;   - HUD (score, timer, item display) rendering
;   - Player starting position and facing direction
;   - Entity array cleanup (reset entity types)
;   - Game state variables to initial values
;   - Room/level loading parameters
;
; Cross-references:
;   Called from: code_roomrender.asm (after mission selection)
;   Calls: PRINT_TILE ($9E01), INIT_OBJECT ($B102)
;   Writes: PLAYER_POS, PLAYER_DIR, ENTITY_ARRAY, TRANSITION_CTR
;   Data: l75E8h-l7601h (HUD tile data in code_roomrender.asm)
;
; Memory map:
;   $760C-$760D  Data bytes (block boundary)
;   $760E-$7649  HUD rendering (score, timer, status area)
;   $764A-$76B4  Game variable initialization
;   $76B7-$76CE  Entity array cleanup loop
;   $76CF-$770B  Room/level setup and special checks
;
; ======================================================================

b8_end:

; BLOCK 'b9' (start 0x760c end 0x800c)
b9_start:
	ld e,b			;760c  ; Data byte $58 (block boundary padding)
	ld e,b			;760d  ; Data byte $58

; ==========================================================================
; HUD SETUP ($760E)
; ==========================================================================
; Set up the heads-up display: score digits, timer bar, status area.
; Draws the HUD layout using PRINT_TILE for each section.
;
l760eh:
	ld hl,(l735ch)		;760e  ; HL = current HUD data pointer
	inc hl			;7611  ; Skip first byte (header/type)
	ld a,(hl)			;7612  ; A = HUD attribute index
	or a			;7613  ; Test if zero (no attribute to set)
	jr z,l761dh		;7614  ; If zero, skip attribute setup
	add a,085h		;7616  ; A += $85 (offset into attribute area)
	ld l,a			;7618  ; L = attribute area offset
	ld h,05ah		;7619  ; H = $5A (attribute area high byte -> $5A00-$5AFF)
	ld (hl),00ch		;761b  ; Set attribute: BRIGHT + red ink on black paper

; --- Initialize score display digits to '0' ---
l761dh:
	ld hl,l75fbh		;761d  ; HL -> score digit buffer (6 bytes)
	ld b,006h		;7620  ; B = 6 digits to clear
l7622h:
	ld (hl),030h		;7622  ; Store ASCII '0' ($30)
	inc hl			;7624  ; Next digit position
	djnz l7622h		;7625  ; Clear all 6 score digits

; --- Draw HUD layout tiles ---
; The HUD is drawn in several sections across the bottom of the screen.
; $50xx addresses are in the bottom screen third ($5000-$57FF).
;
	ld hl,l75e8h		;7627  ; HL -> HUD tile data: "HELD" label area
	ld de,050c1h		;762a  ; DE = screen addr: row 24, col 1
	ld c,004h		;762d  ; C = 4 tiles ("HELD")
	call PRINT_TILE		;762f  ; Draw "HELD" label
	ld de,050d5h		;7632  ; DE = screen addr: row 24, col 21
	ld c,005h		;7635  ; C = 5 tiles ("TIMER")
	call PRINT_TILE		;7637  ; Draw "TIMER" label
	ld de,050dbh		;763a  ; DE = screen addr: row 24, col 27
	ld c,004h		;763d  ; C = 4 tiles (timer value)
	call PRINT_TILE		;763f  ; Draw timer digits
	ld de,05066h		;7642  ; DE = screen addr: row 24, col 6 (status area)
	ld c,00eh		;7645  ; C = 14 tiles (status message area)
	call PRINT_TILE		;7647  ; Draw status/message area

; ==========================================================================
; GAME VARIABLE INITIALIZATION ($764A)
; ==========================================================================
; Reset all game state variables to starting values for a new game.
;
	ld a,00eh		;764a  ; A = 14 (initial timer countdown value)
	ld (0f264h),a		;764c  ; Set score countdown timer
	ld a,007h		;764f  ; A = 7 (player starting X position)
	ld (PLAYER_POS),a		;7651  ; Set player X coordinate
	ld a,026h		;7654  ; A = $26 = 38 (player starting Y position)
	ld (PLAYER_Y),a		;7656  ; Set player Y coordinate
	ld hl,00106h		;7659  ; HL = $0106 (initial player screen offset: row 1, col 6)
	ld (PLAYER_POS_PTR),hl		;765c  ; Set player screen position pointer
	ld a,011h		;765f  ; A = $11 = 17 (initial room/screen number)
	ld (09943h),a		;7661  ; Set current room number

; --- Set HUD screen position and clear state flags ---
	ld hl,05085h		;7664  ; HL = $5085 (HUD item display position)
	ld (laf8ah),hl		;7667  ; Store HUD item display address
	xor a			;766a  ; A = 0
	ld (l8a6eh),a		;766b  ; Clear entity processing flag
	ld (STASH_SEARCH_IDX),a		;766e  ; Clear stash search index
	ld (STASH_ITEM_TYPE),a		;7671  ; Clear stash item type
	ld (l7eech),a		;7674  ; Clear special room flag
	ld (l9944h),a		;7677  ; Clear tile refresh flag
	ld (09f9fh),a		;767a  ; Clear screen rendering sub-state
	ld (ENTITY_ARRAY),a		;767d  ; Clear entity array header byte
	ld (09942h),a		;7680  ; Clear room state byte

; --- Set sprite and animation base pointers ---
	ld hl,l8701h		;7683  ; HL = $8701 (sprite data table base)
	ld (SPRITE_BASE),hl		;7686  ; Set sprite base pointer
	ld hl,laa96h		;7689  ; HL = $AA96 (behavior handler table)
	ld (09968h),hl		;768c  ; Set entity behavior pointer
	ld hl,l9cffh		;768f  ; HL = $9CFF (rendering handler)
	ld (08b11h),hl		;7692  ; Set main loop rendering handler (self-modifying)

; --- Clear more state variables ---
	ld (TRANSITION_CTR),a		;7695  ; Clear screen transition counter
	ld (PLAYER_DIR),a		;7698  ; Set player direction to 0 (facing right)
	ld (l9fdch),a		;769b  ; Clear screen compositor state

; --- Set room drawing and object handler ---
	ld hl,0d02dh		;769e  ; HL = $D02D (room drawing routine address)
	ld (07747h),hl		;76a1  ; Store room draw handler (self-modifying)

; --- Set initial state to 1 (game active) ---
	inc a			;76a4  ; A = 1
	ld (0f271h),a		;76a5  ; Set score display active flag
	ld (UPDATE_SCORE+1),a		;76a8  ; Set UPDATE_SCORE parameter (self-modifying)
	ld (09408h),a		;76ab  ; Set entity processing active flag
	ld (l9409h),a		;76ae  ; Set entity sub-state flag
	ld (ENTITY_ARRAY_LEN),a		;76b1  ; Set entity count to 1
	ld (l993dh),a		;76b4  ; Set player active flag

; ==========================================================================
; ENTITY ARRAY CLEANUP ($76B7)
; ==========================================================================
; Scan through all 101 entities in the entity array and reset
; transient entity types:
;   Type 5 -> 0 (deactivate temporary entities)
;   Type 6 -> 1 (reset triggered entities to base state)
; Each entity entry is 12 bytes, and we check the first byte (type).
;
	ld hl,l9441h		;76b7  ; HL -> first entity type byte (entity 0, offset +13)
	ld de,0000ch		;76ba  ; DE = 12 (stride between entity entries)
	ld b,065h		;76bd  ; B = 101 entities to process
l76bfh:
	ld a,(hl)			;76bf  ; A = entity type byte
	cp 005h		;76c0  ; Is it type 5 (temporary entity)?
	jr nz,l76c6h		;76c2  ; If not type 5, skip
	ld (hl),000h		;76c4  ; Reset type 5 -> 0 (deactivate)
l76c6h:
	cp 006h		;76c6  ; Is it type 6 (triggered entity)?
	jr nz,l76cch		;76c8  ; If not type 6, skip
	ld (hl),001h		;76ca  ; Reset type 6 -> 1 (base state)
l76cch:
	add hl,de			;76cc  ; HL -> next entity's type byte
	djnz l76bfh		;76cd  ; Loop for all 101 entities
	call INIT_OBJECT		;76cf  ; Initialize object/item state data

; ==========================================================================
; ROOM/LEVEL SETUP ($76D2)
; ==========================================================================
; Configure room rendering parameters and check for special conditions.
;
l76d2h:
	ld a,005h		;76d2  ; A = 5 (default entity behavior mode)
	ld (l8d3fh),a		;76d4  ; Set entity behavior mode
	ld a,003h		;76d7  ; A = 3 (score display column count)
	ld (lf414h),a		;76d9  ; Set score digit count for display
	xor a			;76dc  ; A = 0
	ld (l7a01h),a		;76dd  ; Clear room drawing state flag

; --- Check for special room condition (lift arrival) ---
; If LIFT_STATE_CTR is $FF and current room is $13,
; and l7EEC flag is 0, trigger special message display.
;
	ld a,(LIFT_STATE_CTR)		;76e0  ; A = lift/elevator state counter
	inc a			;76e3  ; Test if $FF (inc $FF -> 0)
	jr nz,l7701h		;76e4  ; If not $FF, skip special check
	ld a,(09942h)		;76e6  ; A = current room state
	cp 013h		;76e9  ; Is it room $13 (special location)?
	jr nz,l7701h		;76eb  ; If not room $13, skip
	ld hl,l7eech		;76ed  ; HL -> special room flag
	xor a			;76f0  ; A = 0
	cp (hl)			;76f1  ; Is flag already set?
	jr nz,l7701h		;76f2  ; If already set, skip (don't repeat)
	ld (hl),001h		;76f4  ; Set special room flag = 1

; --- Display special message for this room ---
	ld de,05066h		;76f6  ; DE = screen addr: status message area
	ld hl,l7eeeh		;76f9  ; HL -> special message tile data
	ld c,00eh		;76fc  ; C = 14 tiles (message length)
	call PRINT_TILE		;76fe  ; Display special room message

; ==========================================================================
; INITIALIZE ENTITY POSITIONS ($7701)
; ==========================================================================
; Clear the "active" flag for the first 6 entity slots.
; These slots are reserved for special entities (player, NPCs, etc.)
; and are re-initialized by the room loading code.
;
l7701h:
	ld b,006h		;7701  ; B = 6 entity slots to clear
	ld hl,l940ah		;7703  ; HL -> entity slot 0 active flag
	ld de,00007h		;7706  ; DE = 7 (stride between entity active flags)
l7709h:
	ld (hl),000h		;7709  ; Clear entity active flag (deactivate)
	add hl,de			;770b  ; HL -> next entity's active flag
