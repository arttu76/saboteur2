; ======================================================================
; code_uimission.asm
; ======================================================================
;
; Mission Select UI, High Score & Briefing System
;
; Address range: $EB0C-$EE0B (768 bytes)
; Source binary: block7_main.bin (loaded at $620C)
;
; Handles the between-game UI screens:
;   1. Mission briefing display (packed text renderer)
;   2. End-of-level processing and high score table entry
;   3. Mission select menu with key-driven navigation
;   4. Mission code entry system (SATORI, DIM MAK, etc.)
;
; Menu key mappings (at $ED24):
;   K = Kempston joystick mode
;   P = Player options
;   J = Joystick configuration
;   R = Redefine keys
;   T = Training mode
;   M = Mission code entry
;   S = Start game
;
; Text data:
;   $EDAF: "MISSION X SELECTED" (X = runtime digit)
;   $EDFA: "MISSION CODE" (12 chars)
;   $EE06: "NOT RECOGNISED" (14 chars, continues into next file)
;
; Cross-references:
;   Called from: code_mainloop.asm (main game loop), code_interaction.asm
;   Calls: PRINT_TILE, SCAN_KEY, CLEAR_KEY_BUFFER, MENU_INPUT
;   Calls: ANIM_LOOKUP, MISSION_BRIEFING, READ_KEY_INPUT
;   Data: SCORE_TABLE, l75fbh (score digits), l7603h (code input buffer)
;
; ======================================================================

b24_end:

; BLOCK 'b25' (start 0xeb0c end 0xf30c)
b25_start:

; ==========================================================================
; MENU SCREEN GRAPHICS DATA ($EB0C-$EBC2)
; ==========================================================================
; Tile pattern data for the mission select screen UI elements.
; Includes borders, decorative elements, and button graphics.
; Not executable code - all bytes are tile data.
;
	cp a			;eb0c
	ld e,a			;eb0d
	cp a			;eb0e
	ld a,a			;eb0f
	jp pe,lff0fh		;eb10
	jp pe,00e1bh		;eb13
	jp pe,00805h		;eb16
	jp pe,00e1bh		;eb19
	jp pe,00805h		;eb1c
	jp pe,00e1bh		;eb1f
	jp pe,00805h		;eb22
	jp pe,00e1bh		;eb25
	ex af,af'			;eb28
	djnz $-20		;eb29
	ld e,00eh		;eb2b
	ex af,af'			;eb2d
	djnz $-20		;eb2e
	ld e,00eh		;eb30
	ex af,af'			;eb32
	ex af,af'			;eb33
	jp pe,00e1eh		;eb34
	ex af,af'			;eb37
	ex af,af'			;eb38
	jp pe,00e1dh		;eb39
	ex af,af'			;eb3c
	ex af,af'			;eb3d
	jr z,leb48h		;eb3e
	jp pe,00e17h		;eb40
	jp pe,00805h		;eb43
	djnz leb50h		;eb46
leb48h:
	ex af,af'			;eb48
	ex af,af'			;eb49
	jp pe,00e17h		;eb4a
	ex af,af'			;eb4d
	djnz $+10		;eb4e
leb50h:
	ex af,af'			;eb50
	ex af,af'			;eb51
	djnz leb64h		;eb52
	ex af,af'			;eb54
	ex af,af'			;eb55
	jp pe,00e18h		;eb56
	jp pe,00806h		;eb59
	jr z,$+10		;eb5c
	jp pe,00e18h		;eb5e
leb61h:
	jp pe,00808h		;eb61
leb64h:
	jp pe,00e18h		;eb64
	jp pe,00808h		;eb67
	jp pe,00e18h		;eb6a
leb6dh:
	jp pe,00808h		;eb6d
	jp pe,00e17h		;eb70
	ex af,af'			;eb73
	ex af,af'			;eb74
	djnz leb61h		;eb75
leb77h:
	inc b			;eb77
	ex af,af'			;eb78
	jr z,leb83h		;eb79
	jp pe,00e17h		;eb7b
	ex af,af'			;eb7e
	djnz $+18		;eb7f
	djnz leb6dh		;eb81
leb83h:
	dec b			;eb83
	ex af,af'			;eb84
	jp pe,00e18h		;eb85
	ex af,af'			;eb88
	djnz leb9bh		;eb89
	djnz leb77h		;eb8b
	inc b			;eb8d
	ex af,af'			;eb8e
	jp pe,00e17h		;eb8f
	ex af,af'			;eb92
	jp pe,01007h		;eb93
	ex af,af'			;eb96
	ex af,af'			;eb97
	jp pe,00e16h		;eb98
leb9bh:
	ex af,af'			;eb9b
	jp pe,01008h		;eb9c
	ex af,af'			;eb9f
	ex af,af'			;eba0
	jp pe,00e15h		;eba1
	ex af,af'			;eba4
	jp pe,0100ah		;eba5
	jp pe,00e16h		;eba8
	ex af,af'			;ebab
	jp pe,01009h		;ebac
	jp pe,00e17h		;ebaf
	jp pe,01009h		;ebb2
	jp pe,00e16h		;ebb5
	ex af,af'			;ebb8
	jp pe,01009h		;ebb9
	jp pe,00e17h		;ebbc
	jp pe,01009h		;ebbf
	ld a,e			;ebc2
; ==========================================================================
; MISSION_BRIEFING ($EBC3)
; ==========================================================================
; Decodes and renders mission briefing text to the screen. Text is stored
; in a simple compressed format at $E777:
;   - Byte $7B = end-of-text marker
;   - Byte $EA = RLE prefix: next byte = count, then byte = fill value
;   - Other bytes = literal tile values copied 1:1
;
; After decoding text to a buffer, renders it to the display using
; the ZX Spectrum's interleaved screen layout (inc H advances pixel row).
;
MISSION_BRIEFING:
	ld hl,le777h		;ebc3  ; HL -> packed briefing text data
	ld de,GAME_ENTRY		;ebc6  ; DE -> decompression buffer

; --- Decompression loop ---
lebc9h:
	ld a,(hl)			;ebc9  ; A = next source byte
	cp 07bh		;ebca  ; Is it $7B (end marker)?
	jr z,lebe1h		;ebcc  ; Yes -> text decoded, go render
	cp 0eah		;ebce  ; Is it $EA (RLE prefix)?
	jr z,lebdbh		;ebd0  ; Yes -> decode RLE run
	ld b,001h		;ebd2  ; B = 1 (literal: copy 1 byte)
lebd4h:
	ld (de),a			;ebd4  ; Write byte to buffer
	inc de			;ebd5  ; Advance buffer pointer
	djnz lebd4h		;ebd6  ; Loop for RLE count
	inc hl			;ebd8  ; Advance source pointer
	jr lebc9h		;ebd9  ; Continue decompression

; --- RLE run: next byte = count, then byte = value ---
lebdbh:
	inc hl			;ebdb  ; Skip RLE prefix
	ld b,(hl)			;ebdc  ; B = run length
	inc hl			;ebdd  ; Advance to value byte
	ld a,(hl)			;ebde  ; A = fill value
	jr lebd4h		;ebdf  ; Fill B copies of A

; --- Render decoded text to screen ---
lebe1h:
	ld hl,04015h		;ebe1  ; HL = screen address (row 0, col 21)
	ld de,GAME_ENTRY		;ebe4  ; DE -> decoded text buffer
	ld b,00bh		;ebe7  ; B = 11 text rows to render

; --- Outer loop: one text row ---
lebe9h:
	ld c,018h		;ebe9  ; C = 24 characters per row
	push hl			;ebeb  ; Save row screen address

; --- Inner loop: one character cell (8 pixel rows) ---
lebech:
	push bc			;ebec  ; Save row/col counters
	push hl			;ebed  ; Save screen address
	ld b,008h		;ebee  ; B = 8 pixel rows per character

; --- Copy 8 bytes (one character) to screen ---
lebf0h:
	ld a,(de)			;ebf0  ; A = pixel data byte
	ld (hl),a			;ebf1  ; Write to screen
	inc h			;ebf2  ; Next pixel row (ZX Spectrum: inc H)
	inc de			;ebf3  ; Next source byte
	djnz lebf0h		;ebf4  ; Loop for all 8 pixel rows

	pop hl			;ebf6  ; Restore character cell address
	; --- Advance to next character column ---
	; Uses RR/RL H trick to navigate ZX Spectrum's interleaved layout
	rr h		;ebf7  ; Rotate H right 3 times
	rr h		;ebf9  ;   (extracts character row bits)
	rr h		;ebfb
	ld bc,00020h		;ebfd  ; BC = 32 (one row = 32 bytes)
	add hl,bc			;ec00  ; Advance by one character row
	rl h		;ec01  ; Rotate H left 3 times
	rl h		;ec03  ;   (restores interleaved format)
	rl h		;ec05
	pop bc			;ec07  ; Restore row/col counters
	dec c			;ec08  ; C = remaining columns
	jr nz,lebech		;ec09  ; More columns -> inner loop

	pop hl			;ec0b  ; Restore row start address
	inc hl			;ec0c  ; HL = next pixel column
	djnz lebe9h		;ec0d  ; More rows -> outer loop

	; --- Copy color attributes to screen ---
	ld de,05800h		;ec0f  ; DE = attribute memory start
	ld hl,l6a4ch		;ec12  ; HL = source attribute data
	ld bc,00300h		;ec15  ; BC = 768 bytes (full attribute area)
	ldir		;ec18  ; Copy attributes
	call ANIM_LOOKUP		;ec1a  ; Update animation state
	ret			;ec1d
; ==========================================================================
; END-OF-LEVEL / HIGH SCORE CHECK ($EC1E)
; ==========================================================================
; Called when a level/mission ends. Renders the briefing screen, then
; checks if the player's score qualifies for the high score table.
; Each high score entry is 17 bytes: 6 digits + 11 name characters.
;
lec1eh:
	call MISSION_BRIEFING		;ec1e  ; Render mission briefing screen
	ld b,00fh		;ec21  ; B = 15 entries in high score table
	ld hl,SCORE_TABLE		;ec23  ; HL -> first high score entry

; --- Compare player score against each table entry ---
lec26h:
	ld de,l75fbh		;ec26  ; DE -> player's score (6 ASCII digits)
	push hl			;ec29  ; Save table position
	ld c,006h		;ec2a  ; C = 6 digits to compare
lec2ch:
	ld a,(de)			;ec2c  ; A = player's score digit
	cp (hl)			;ec2d  ; Compare with table entry digit
	jr nz,lec3fh		;ec2e  ; Not equal -> check if higher/lower
	inc hl			;ec30  ; Next digit
	inc de			;ec31
	dec c			;ec32  ; More digits?
	jr nz,lec2ch		;ec33  ; Yes -> keep comparing
lec35h:
	pop hl			;ec35  ; Restore table position
	ld de,00011h		;ec36  ; DE = 17 (bytes per entry)
	add hl,de			;ec39  ; HL -> next entry
	djnz lec26h		;ec3a  ; Check all 15 entries
	jp lec8ch		;ec3c  ; Score didn't qualify -> show table

; --- Score comparison: check if player scored higher ---
lec3fh:
	jr c,lec35h		;ec3f  ; Player's digit < table digit -> try next

	; --- New high score! Display name entry prompts ---
	pop hl			;ec41  ; Discard saved table position
	push bc			;ec42  ; Save entry index
	ld de,04043h		;ec43  ; DE = screen position (line 1)
	ld hl,lf0f8h		;ec46  ; HL -> "WELL DONE" text or similar
	ld c,00fh		;ec49  ; C = 15 chars
	call PRINT_TILE		;ec4b  ; Display congratulations line
	ld de,040a2h		;ec4e  ; DE = screen position (line 2)
	ld c,012h		;ec51  ; C = 18 chars
	call PRINT_TILE		;ec53  ; Display "ENTER YOUR NAME" or similar
	ld de,040e4h		;ec56  ; DE = screen position (line 3)
	ld c,00eh		;ec59  ; C = 14 chars
	call PRINT_TILE		;ec5b  ; Display instructions
	ld de,04863h		;ec5e  ; DE = screen position (line 4)
	ld c,00fh		;ec61  ; C = 15 chars
	call PRINT_TILE		;ec63  ; Display name entry prompt
	call MENU_INPUT		;ec66  ; Wait for player to type name
	pop bc			;ec69  ; Restore entry index (B = position)

	; --- Shift existing entries down to make room ---
	ld hl,0f251h		;ec6a  ; HL = end of last entry to shift
	ld de,lf240h		;ec6d  ; DE = end of table
lec70h:
	ld c,011h		;ec70  ; C = 17 bytes per entry
lec72h:
	dec hl			;ec72  ; Copy backwards (shift down)
	dec de			;ec73
	ld a,(de)			;ec74  ; A = byte to shift
	ld (hl),a			;ec75  ; Move to next position
	dec c			;ec76  ; More bytes in entry?
	jr nz,lec72h		;ec77  ; Yes -> continue
	djnz lec70h		;ec79  ; More entries to shift?

	; --- Insert new score and name ---
	ld hl,l75fbh		;ec7b  ; HL -> player's score (6 digits)
	ld bc,00006h		;ec7e  ; BC = 6 bytes (score)
	ldir		;ec81  ; Copy score to table
	inc hl			;ec83  ; Skip 2 bytes (separator)
	inc hl			;ec84
	ld c,00bh		;ec85  ; C = 11 bytes (player name)
	ldir		;ec87  ; Copy name to table
; ==========================================================================
; HIGH SCORE DISPLAY ($EC89)
; ==========================================================================
; Renders the full high score table to screen, then waits for a
; keypress or timeout before proceeding to the mission select menu.
;
lec89h:
	call ANIM_LOOKUP		;ec89  ; Update animation state
lec8ch:
	; --- Display table header ---
	ld c,00bh		;ec8c  ; C = 11 chars
	ld hl,lf136h		;ec8e  ; HL -> "HIGH SCORES" (or similar header)
	ld de,04063h		;ec91  ; DE = screen position (header row)
	call PRINT_TILE		;ec94  ; Display header

	; --- Display all 15 high score entries ---
	ld b,00fh		;ec97  ; B = 15 entries
	ld hl,SCORE_TABLE		;ec99  ; HL -> high score table data
	ld de,040c1h		;ec9c  ; DE = screen position (first entry)
lec9fh:
	push bc			;ec9f  ; Save entry counter
	ld c,006h		;eca0  ; C = 6 digits (score)
	call PRINT_TILE		;eca2  ; Display score
	push hl			;eca5
	ld hl,0f251h		;eca6  ; HL -> separator chars
	ld c,002h		;eca9  ; C = 2 chars (separator)
	call PRINT_TILE		;ecab  ; Display separator
	pop hl			;ecae
	ld c,00bh		;ecaf  ; C = 11 chars (name)
	call PRINT_TILE		;ecb1  ; Display name

	; --- Advance screen position to next row ---
	push hl			;ecb4  ; Save table pointer
	ld hl,0000dh		;ecb5  ; HL = 13 (row advance offset)
	rr d		;ecb8  ; Adjust DE for ZX Spectrum
	rr d		;ecba  ;   screen layout
	rr d		;ecbc  ;   (interleaved rows)
	add hl,de			;ecbe  ; HL = next row position
	ex de,hl			;ecbf  ; DE = next screen position
	rl d		;ecc0  ; Restore DE format
	rl d		;ecc2
	rl d		;ecc4
	pop hl			;ecc6  ; Restore table pointer
	pop bc			;ecc7  ; Restore entry counter
	djnz lec9fh		;ecc8  ; More entries -> loop

	; --- Wait for keypress with timeout ---
	call CLEAR_KEY_BUFFER		;ecca  ; Clear pending keypresses
	ld bc,lc350h		;eccd  ; BC = $C350 = 50000 (timeout counter)
lecd0h:
	push bc			;ecd0  ; Save counter
	call SCAN_KEY		;ecd1  ; Check for keypress
	or a			;ecd4  ; Key pressed?
	pop bc			;ecd5
	jr nz,lecddh		;ecd6  ; Yes -> proceed to menu
	dec bc			;ecd8  ; Decrement timeout
	ld a,b			;ecd9
	or c			;ecda  ; Timeout reached?
	jr nz,lecd0h		;ecdb  ; No -> keep waiting
; ==========================================================================
; MISSION SELECT MENU ($ECDD)
; ==========================================================================
; Displays the mission selection menu with 7 text lines and waits
; for a key selection from the player.
;
lecddh:
	call ANIM_LOOKUP		;ecdd  ; Update animation state

	; --- Display 7 menu option lines ---
	ld hl,lf039h		;ece0  ; HL -> menu text data
	ld c,00bh		;ece3  ; C = 11 chars (line 1)
	ld de,04083h		;ece5  ; DE = screen position
	call PRINT_TILE		;ece8  ; Display menu line 1
	ld c,009h		;eceb  ; C = 9 chars (line 2)
	ld de,040c3h		;eced
	call PRINT_TILE		;ecf0  ; Display menu line 2
	ld c,00bh		;ecf3  ; C = 11 chars (line 3)
	ld de,04803h		;ecf5
	call PRINT_TILE		;ecf8  ; Display menu line 3
	ld c,010h		;ecfb  ; C = 16 chars (line 4)
	ld de,04863h		;ecfd
	call PRINT_TILE		;ed00  ; Display menu line 4
	ld c,010h		;ed03  ; C = 16 chars (line 5)
	ld de,048a3h		;ed05
	call PRINT_TILE		;ed08  ; Display menu line 5
	ld c,00bh		;ed0b  ; C = 11 chars (line 6)
	ld de,048e3h		;ed0d
	call PRINT_TILE		;ed10  ; Display menu line 6
	ld c,00dh		;ed13  ; C = 13 chars (line 7)
	ld de,05043h		;ed15
	call PRINT_TILE		;ed18  ; Display menu line 7

	call CLEAR_KEY_BUFFER		;ed1b  ; Clear pending keypresses
	call sub_f035h		;ed1e  ; Initialize menu input state
	ld bc,l7530h		;ed21  ; BC = $7530 = 30000 (menu timeout)
; --- Menu key handler loop ---
led24h:
	push bc			;ed24  ; Save timeout counter
	call SCAN_KEY		;ed25  ; Read keyboard
	cp 04bh		;ed28  ; 'K' = Kempston joystick?
	jp z,0efceh		;ed2a  ; Yes -> Kempston handler
	cp 050h		;ed2d  ; 'P' = Player options?
	jp z,lefd7h		;ed2f  ; Yes -> player options
	cp 04ah		;ed32  ; 'J' = Joystick?
	jp z,lf019h		;ed34  ; Yes -> joystick config
	cp 052h		;ed37  ; 'R' = Redefine keys?
	jp z,leeafh		;ed39  ; Yes -> key redefinition
	cp 054h		;ed3c  ; 'T' = Training mode?
	jp z,lefe5h		;ed3e  ; Yes -> training handler
	cp 04dh		;ed41  ; 'M' = Mission code?
	jp z,led57h		;ed43  ; Yes -> mission code entry
	cp 053h		;ed46  ; 'S' = Start game?
	jr nz,led4eh		;ed48  ; No -> check timeout
	pop bc			;ed4a  ; Start game!
	jp l735eh		;ed4b  ; Jump to game start
led4eh:
	pop bc			;ed4e  ; Restore timeout
	dec bc			;ed4f  ; Decrement timeout counter
	ld a,b			;ed50
	or c			;ed51  ; Timeout expired?
	jr nz,led24h		;ed52  ; No -> keep checking keys
	jp lec89h		;ed54  ; Timeout -> return to high scores
; ==========================================================================
; MISSION CODE ENTRY ($ED57)
; ==========================================================================
; Displays prompts for the player to enter a mission code word.
; After entry, compares the typed code against 9 known mission codes
; stored at $EE14 (11 chars each). If matched, selects that mission.
;
led57h:
	call ANIM_LOOKUP		;ed57  ; Update animation state

	; --- Display code entry prompts (4 lines) ---
	ld de,04044h		;ed5a  ; DE = screen position (line 1)
	ld hl,lee76h+1		;ed5d  ; HL -> prompt text data
	ld c,00dh		;ed60  ; C = 13 chars
	call PRINT_TILE		;ed62  ; Display "ENTER CODE" or similar
	ld de,04084h		;ed65  ; DE = screen position (line 2)
	ld c,00ch		;ed68  ; C = 12 chars
	call PRINT_TILE		;ed6a  ; Display instruction text
	ld de,040e3h		;ed6d  ; DE = screen position (line 3)
	ld c,00eh		;ed70  ; C = 14 chars
	call PRINT_TILE		;ed72  ; Display more instructions
	ld de,04822h		;ed75  ; DE = screen position (line 4)
	ld c,011h		;ed78  ; C = 17 chars
	call PRINT_TILE		;ed7a  ; Display input area

	call CLEAR_KEY_BUFFER		;ed7d  ; Clear pending keypresses
	call MENU_INPUT		;ed80  ; Read player's code word input

	; --- Compare typed code against known mission codes ---
	ld b,009h		;ed83  ; B = 9 mission codes to check
	ld hl,lee14h		;ed85  ; HL -> first mission code string
led88h:
	ld de,l7603h		;ed88  ; DE -> player's typed input buffer
	ld c,00bh		;ed8b  ; C = 11 chars per code
	push hl			;ed8d  ; Save code table position
led8eh:
	ld a,(de)			;ed8e  ; A = typed character
	cp (hl)			;ed8f  ; Compare with code character
	jr nz,ledc1h		;ed90  ; Mismatch -> try next code
	inc hl			;ed92  ; Next character
	inc de			;ed93
	dec c			;ed94  ; More characters?
	jr nz,led8eh		;ed95  ; Yes -> keep comparing

	; --- Code matched! Select this mission ---
	pop hl			;ed97  ; Discard saved position
	ld a,b			;ed98  ; A = mission number (9..1)
	ld (ledaeh),a		;ed99  ; Store mission number in message
	add a,030h		;ed9c  ; Convert to ASCII digit
	ld (0edb7h),a		;ed9e  ; Patch digit into "MISSION X SELECTED"
	ld hl,ledaeh+1		;eda1  ; HL -> "MISSION X SELECTED" text
	ld c,012h		;eda4  ; C = 18 chars
	ld de,048a2h		;eda6  ; DE = screen position
	call PRINT_TILE		;eda9  ; Display "MISSION X SELECTED"
	jr ledddh		;edac  ; Jump to confirmation prompt
; --- "MISSION X SELECTED" text ($EDAE-$EDC0) ---
; Byte $EDAE = mission number (set at runtime)
; Byte $EDB7 = ASCII digit (patched at runtime)
;
ledaeh:
	ld bc,0494dh		;edae  ; DATA: $01(mission#),$4D="M",$49="I"
	ld d,e			;edb1  ; DATA: $53 = "S"
	ld d,e			;edb2  ; DATA: $53 = "S"
	ld c,c			;edb3  ; DATA: $49 = "I"
	ld c,a			;edb4  ; DATA: $4F = "O"
	ld c,(hl)			;edb5  ; DATA: $4E = "N"
	jr nz,lee10h		;edb6  ; DATA: $20,$58 = " X" (X=digit, patched)
	jr nz,lee0dh		;edb8  ; DATA: $20,$53 = " S"
	ld b,l			;edba  ; DATA: $45 = "E"
	ld c,h			;edbb  ; DATA: $4C = "L"
	ld b,l			;edbc  ; DATA: $45 = "E"
sub_edbdh:
	ld b,e			;edbd  ; DATA: $43 = "C"
	ld d,h			;edbe  ; DATA: $54 = "T"
	ld b,l			;edbf  ; DATA: $45 = "E"
	ld b,h			;edc0  ; DATA: $44 = "D"
; --- Code mismatch: try next mission code ---
ledc1h:
	pop hl			;edc1  ; Restore code table position
	push de			;edc2
	ld de,0000bh		;edc3  ; DE = 11 (chars per code entry)
	add hl,de			;edc6  ; HL -> next code string
	pop de			;edc7
	djnz led88h		;edc8  ; More codes to try?

	; --- No code matched: display "MISSION CODE NOT RECOGNISED" ---
	ld hl,ledfah		;edca  ; HL -> "MISSION CODE" text
	ld de,048a5h		;edcd  ; DE = screen position (line 1)
	ld c,00ch		;edd0  ; C = 12 chars
	call PRINT_TILE		;edd2  ; Display "MISSION CODE"
	ld de,048c4h		;edd5  ; DE = screen position (line 2)
	ld c,00eh		;edd8  ; C = 14 chars
	call PRINT_TILE		;edda  ; Display "NOT RECOGNISED"

; --- Confirmation prompt (shown after match or mismatch) ---
ledddh:
	ld hl,l70abh		;eddd  ; HL -> confirmation text
	ld de,050a4h		;ede0  ; DE = screen position (line 1)
	ld c,00dh		;ede3  ; C = 13 chars
	call PRINT_TILE		;ede5  ; Display confirmation prompt
	ld de,050c4h		;ede8  ; DE = screen position (line 2)
	ld c,00ch		;edeb  ; C = 12 chars
	call PRINT_TILE		;eded  ; Display second line
	call CLEAR_KEY_BUFFER		;edf0  ; Clear pending keypresses
	call READ_KEY_INPUT		;edf3  ; Wait for confirmation keypress
	pop bc			;edf6  ; Restore menu timeout
	jp lecddh		;edf7  ; Return to mission select menu
; --- "MISSION CODE" + "NOT RECOGNISED" text ($EDFA-$EE13) ---
; 12 chars "MISSION CODE" + 14 chars "NOT RECOGNISED"
; (continues into next file at $EE0C)
;
ledfah:
	ld c,l			;edfa  ; DATA: $4D = "M"
	ld c,c			;edfb  ; DATA: $49 = "I"
	ld d,e			;edfc  ; DATA: $53 = "S"
	ld d,e			;edfd  ; DATA: $53 = "S"
	ld c,c			;edfe  ; DATA: $49 = "I"
	ld c,a			;edff  ; DATA: $4F = "O"
	ld c,(hl)			;ee00  ; DATA: $4E = "N"
	jr nz,lee46h		;ee01  ; DATA: $20,$43 = " C"
	ld c,a			;ee03  ; DATA: $4F = "O"
	ld b,h			;ee04  ; DATA: $44 = "D"
	ld b,l			;ee05  ; DATA: $45 = "E"
	ld c,(hl)			;ee06  ; DATA: $4E = "N" (start of "NOT RECOGNISED")
	ld c,a			;ee07  ; DATA: $4F = "O"
	ld d,h			;ee08  ; DATA: $54 = "T"
	jr nz,$+84		;ee09  ; DATA: $20,$52 = " R"
	ld b,l			;ee0b  ; DATA: $45 = "E" (continues in next file)
