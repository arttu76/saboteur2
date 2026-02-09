; ======================================================================
; code_input.asm
; ======================================================================
;
; Menu & Input Handling
;
; Address range: $EE0C-$F10B (768 bytes)
; Source binary: block7_main.bin (loaded at $620C)
;
; Contains the input/menu subsystem used during mission selection:
;   - Mission code entry (ninja rank names as level passwords)
;   - Control scheme selection (Keyboard/Kempston/Protek joystick)
;   - Key redefinition interface
;   - Sound toggle
;   - Keyboard scanning utilities
;
; Cross-references:
;   Called from: code_roomrender.asm (TITLE_SCREEN menu)
;   Calls: PRINT_TILE ($9E01), SCAN_KEY ($9E30), ANIM_LOOKUP
;   Calls: CLEAR_KEY_BUFFER (local), MENU_HANDLER (local)
;   Returns to: code_roomrender.asm ($ECDD, $ED4E)
;
; Memory map:
;   $EE0C-$EEAE  Text data: mission code names + UI prompts (163 bytes)
;   $EEAF-$EF3A  Key redefinition interface
;   $EF3D-$EFA3  MENU_INPUT: mission code text entry
;   $EFA4-$EFB1  CLEAR_KEY_BUFFER / READ_KEY_INPUT utilities
;   $EFB2-$EFD0  Text data: key labels, direction names
;   $EFD1-$F038  Menu dispatch: control selection, sound toggle
;   $F039-$F08F  Text data: menu option strings
;   $F090-$F0D9  Keyboard port/bit mapping table (36 keys)
;   $F0DA-$F0F7  Backspace handler for text input
;   $F0F8-$F10B  Text data: "CONGRATULATIONS YOU A"
;
; ======================================================================

; ==========================================================================
; MISSION CODE NAMES ($EE0C)
; ==========================================================================
; 163 bytes of text data containing ninja rank names (used as mission
; passwords) and UI prompt text. These are tile indices displayed on
; the mission selection screen. The disassembler incorrectly interprets
; them as Z80 instructions.
;
; Text content (20-character display lines):
;   $EE0C: "COGNISEDSATORI     D"  (ranks: Cognised, Satori)
;   $EE20: "IM MAK    MI LU KATA"  (ranks: Dim Mak, Mi Lu, Kata)
;   $EE34: " GENIN      SAIMENJI"  (ranks: Genin, Saimenji)
;   $EE48: "TSUKUJI KIRI  KIME  "  (ranks: Tsukuji, Kiri, Kime)
;   $EE5C: "     JONIN          "  (rank: Jonin)
;   $EE70: "       TYPE REQUIRED"  (prompt text)
;   $EE84: "MISSION CODEOR PRESS"  (prompt continues)
;   $EE98: " ENTERFOR FIRST MISS"  (prompt continues)
;   $EEAC: "ION"                   (prompt end)
;
	ld b,e			;ee0c  ; DATA: $43 = 'C'
lee0dh:
	ld c,a			;ee0d  ; DATA: $4F = 'O'
	ld b,a			;ee0e  ; DATA: $47 = 'G'
	ld c,(hl)			;ee0f  ; DATA: $4E = 'N'
lee10h:
	ld c,c			;ee10  ; DATA: $49 = 'I'
	ld d,e			;ee11  ; DATA: $53 = 'S'
	ld b,l			;ee12  ; DATA: $45 = 'E'
	ld b,h			;ee13  ; DATA: $44 = 'D'
lee14h:
	ld d,e			;ee14  ; DATA: $53 = 'S'
	ld b,c			;ee15  ; DATA: $41 = 'A'
	ld d,h			;ee16  ; DATA: $54 = 'T'
	ld c,a			;ee17  ; DATA: $4F = 'O'
	ld d,d			;ee18  ; DATA: $52 = 'R'
	ld c,c			;ee19  ; DATA: $49 = 'I'
	jr nz,lee3ch		;ee1a  ; DATA: $20 $20 = '  '
	jr nz,lee3eh		;ee1c  ; DATA: $20 $20 = '  '
	jr nz,lee64h		;ee1e  ; DATA: $20 $44 = ' D'
	ld c,c			;ee20  ; DATA: $49 = 'I'
	ld c,l			;ee21  ; DATA: $4D = 'M'
	jr nz,$+79		;ee22  ; DATA: $20 $4D = ' M'
	ld b,c			;ee24  ; DATA: $41 = 'A'
	ld c,e			;ee25  ; DATA: $4B = 'K'
	jr nz,lee48h		;ee26  ; DATA: $20 $20 = '  '
	jr nz,lee4ah		;ee28  ; DATA: $20 $20 = '  '
	ld c,l			;ee2a  ; DATA: $4D = 'M'
lee2bh:
	ld c,c			;ee2b  ; DATA: $49 = 'I'
	jr nz,lee7ah		;ee2c  ; DATA: $20 $4C = ' L'
	ld d,l			;ee2e  ; DATA: $55 = 'U'
	jr nz,$+77		;ee2f  ; DATA: $20 $4B = ' K'
	ld b,c			;ee31  ; DATA: $41 = 'A'
	ld d,h			;ee32  ; DATA: $54 = 'T'
	ld b,c			;ee33  ; DATA: $41 = 'A'
	jr nz,lee7dh		;ee34  ; DATA: $20 $47 = ' G'
	ld b,l			;ee36  ; DATA: $45 = 'E'
	ld c,(hl)			;ee37  ; DATA: $4E = 'N'
	ld c,c			;ee38  ; DATA: $49 = 'I'
	ld c,(hl)			;ee39  ; DATA: $4E = 'N'
	jr nz,lee5ch		;ee3a  ; DATA: $20 $20 = '  '
lee3ch:
	jr nz,lee5eh		;ee3c  ; DATA: $20 $20 = '  '
lee3eh:
	jr nz,lee60h		;ee3e  ; DATA: $20 $20 = '  '
	ld d,e			;ee40  ; DATA: $53 = 'S'
	ld b,c			;ee41  ; DATA: $41 = 'A'
	ld c,c			;ee42  ; DATA: $49 = 'I'
	ld c,l			;ee43  ; DATA: $4D = 'M'
	ld b,l			;ee44  ; DATA: $45 = 'E'
	ld c,(hl)			;ee45  ; DATA: $4E = 'N'
lee46h:
	ld c,d			;ee46  ; DATA: $4A = 'J'
	ld c,c			;ee47  ; DATA: $49 = 'I'
lee48h:
	ld d,h			;ee48  ; DATA: $54 = 'T'
	ld d,e			;ee49  ; DATA: $53 = 'S'
lee4ah:
	ld d,l			;ee4a  ; DATA: $55 = 'U'
	ld c,e			;ee4b  ; DATA: $4B = 'K'
	ld d,l			;ee4c  ; DATA: $55 = 'U'
	ld c,d			;ee4d  ; DATA: $4A = 'J'
	ld c,c			;ee4e  ; DATA: $49 = 'I'
	jr nz,lee9ch		;ee4f  ; DATA: $20 $4B = ' K'
	ld c,c			;ee51  ; DATA: $49 = 'I'
	ld d,d			;ee52  ; DATA: $52 = 'R'
	ld c,c			;ee53  ; DATA: $49 = 'I'
	jr nz,lee76h		;ee54  ; DATA: $20 $20 = '  '
	ld c,e			;ee56  ; DATA: $4B = 'K'
	ld c,c			;ee57  ; DATA: $49 = 'I'
	ld c,l			;ee58  ; DATA: $4D = 'M'
	ld b,l			;ee59  ; DATA: $45 = 'E'
	jr nz,$+34		;ee5a  ; DATA: $20 $20 = '  '
lee5ch:
	jr nz,lee7eh		;ee5c  ; DATA: $20 $20 = '  '
lee5eh:
	jr nz,lee80h		;ee5e  ; DATA: $20 $20 = '  '
lee60h:
	jr nz,leeach		;ee60  ; DATA: $20 $4A = ' J'
	ld c,a			;ee62  ; DATA: $4F = 'O'
	ld c,(hl)			;ee63  ; DATA: $4E = 'N'
lee64h:
	ld c,c			;ee64  ; DATA: $49 = 'I'
	ld c,(hl)			;ee65  ; DATA: $4E = 'N'
	jr nz,lee88h		;ee66  ; DATA: $20 $20 = '  '
	jr nz,lee8ah		;ee68  ; DATA: $20 $20 = '  '
	jr nz,$+34		;ee6a  ; DATA: $20 $20 = '  '
	jr nz,lee8eh		;ee6c  ; DATA: $20 $20 = '  '
	jr nz,lee90h		;ee6e  ; DATA: $20 $20 = '  '
	jr nz,lee92h		;ee70  ; DATA: $20 $20 = '  '
	jr nz,lee94h		;ee72  ; DATA: $20 $20 = '  '
	jr nz,lee96h		;ee74  ; DATA: $20 $20 = '  '
lee76h:
	jr nz,leecch		;ee76  ; DATA: $20 $54 = ' T'  "TYPE REQUIRED"
	ld e,c			;ee78  ; DATA: $59 = 'Y'
	ld d,b			;ee79  ; DATA: $50 = 'P'
lee7ah:
	ld b,l			;ee7a  ; DATA: $45 = 'E'
	jr nz,leecfh		;ee7b  ; DATA: $20 $52 = ' R'
lee7dh:
	ld b,l			;ee7d  ; DATA: $45 = 'E'
lee7eh:
	ld d,c			;ee7e  ; DATA: $51 = 'Q'
	ld d,l			;ee7f  ; DATA: $55 = 'U'
lee80h:
	ld c,c			;ee80  ; DATA: $49 = 'I'
	ld d,d			;ee81  ; DATA: $52 = 'R'
	ld b,l			;ee82  ; DATA: $45 = 'E'
	ld b,h			;ee83  ; DATA: $44 = 'D'
	ld c,l			;ee84  ; DATA: $4D = 'M'  "MISSION CODE"
	ld c,c			;ee85  ; DATA: $49 = 'I'
	ld d,e			;ee86  ; DATA: $53 = 'S'
	ld d,e			;ee87  ; DATA: $53 = 'S'
lee88h:
	ld c,c			;ee88  ; DATA: $49 = 'I'
	ld c,a			;ee89  ; DATA: $4F = 'O'
lee8ah:
	ld c,(hl)			;ee8a  ; DATA: $4E = 'N'
	jr nz,$+69		;ee8b  ; DATA: $20 $43 = ' C'
	ld c,a			;ee8d  ; DATA: $4F = 'O'
lee8eh:
	ld b,h			;ee8e  ; DATA: $44 = 'D'
	ld b,l			;ee8f  ; DATA: $45 = 'E'
lee90h:
	ld c,a			;ee90  ; DATA: $4F = 'O'  "OR PRESS ENTER"
	ld d,d			;ee91  ; DATA: $52 = 'R'
lee92h:
	jr nz,$+82		;ee92  ; DATA: $20 $50 = ' P'
lee94h:
	ld d,d			;ee94  ; DATA: $52 = 'R'
	ld b,l			;ee95  ; DATA: $45 = 'E'
lee96h:
	ld d,e			;ee96  ; DATA: $53 = 'S'
	ld d,e			;ee97  ; DATA: $53 = 'S'
	jr nz,leedfh		;ee98  ; DATA: $20 $45 = ' E'
	ld c,(hl)			;ee9a  ; DATA: $4E = 'N'
	ld d,h			;ee9b  ; DATA: $54 = 'T'
lee9ch:
	ld b,l			;ee9c  ; DATA: $45 = 'E'
	ld d,d			;ee9d  ; DATA: $52 = 'R'
	ld b,(hl)			;ee9e  ; DATA: $46 = 'F'  "FOR FIRST MISSION"
	ld c,a			;ee9f  ; DATA: $4F = 'O'
	ld d,d			;eea0  ; DATA: $52 = 'R'
	jr nz,leee9h		;eea1  ; DATA: $20 $46 = ' F'
	ld c,c			;eea3  ; DATA: $49 = 'I'
	ld d,d			;eea4  ; DATA: $52 = 'R'
	ld d,e			;eea5  ; DATA: $53 = 'S'
	ld d,h			;eea6  ; DATA: $54 = 'T'
	jr nz,leef6h		;eea7  ; DATA: $20 $4D = ' M'
	ld c,c			;eea9  ; DATA: $49 = 'I'
	ld d,e			;eeaa  ; DATA: $53 = 'S'
	ld d,e			;eeab  ; DATA: $53 = 'S'
leeach:
	ld c,c			;eeac  ; DATA: $49 = 'I'
	ld c,a			;eead  ; DATA: $4F = 'O'
	ld c,(hl)			;eeae  ; DATA: $4E = 'N'
; ==========================================================================
; KEY REDEFINITION INTERFACE ($EEAF)
; ==========================================================================
; Displays the "REDEFINE KEYS" screen and lets the player assign a key
; for each of the 5 controls: UP, DOWN, LEFT, RIGHT, FIRE.
;
; For each control, the direction label is printed and the routine waits
; for a valid keypress (Space, 0-9, or A-Z). The pressed key's character
; is displayed and its hardware port/bit pair is looked up from the
; keyboard mapping table at $F090 and stored into the key config array
; at $F43C (3 bytes per entry: port, bit, unused).
;
; On exit: JP $ECDD returns to the menu handler in code_roomrender.asm.
;
leeafh:
	call ANIM_LOOKUP		;eeaf  ; Update animation frame state
	ld de,04046h		;eeb2  ; DE = screen addr: row 2, col 6
	ld hl,lf05bh		;eeb5  ; HL -> "REDEFINE KEYS" text (13 chars at $F05B)
	ld c,00dh		;eeb8  ; C = 13 tiles to print
	call PRINT_TILE		;eeba  ; Display "REDEFINE KEYS" header
	call CLEAR_KEY_BUFFER		;eebd  ; Wait for all keys released
	ld de,04084h		;eec0  ; DE = screen addr: row 4, col 4
	ld hl,lefb5h		;eec3  ; HL -> direction label text "UP   DOWN ..."
	ld b,005h		;eec6  ; B = 5 controls to redefine
	ld ix,lf43ch		;eec8  ; IX -> key config storage (port/bit pairs)

; --- Per-key redefinition loop ---
leecch:
	push bc			;eecc  ; Save remaining key count
	ld c,005h		;eecd  ; C = 5 chars per label ("UP   ", "DOWN ", etc.)
leecfh:
	call PRINT_TILE		;eecf  ; Display direction label at DE
	push hl			;eed2  ; Save text pointer (next label)
	push de			;eed3  ; Save screen position

; --- Wait for valid keypress ---
; Accepts: Space ($20), digits '0'-'9' ($30-$39), letters 'A'-'Z' ($41-$5A)
;
leed4h:
	call SCAN_KEY		;eed4  ; A = key code (0 if none)
	cp 05bh		;eed7  ; >= '[' ?
	jr nc,leed4h		;eed9  ; Reject: key code too high
	cp 020h		;eedb  ; Space?
	jr z,leeebh		;eedd  ; Accept space
leedfh:
	cp 030h		;eedf  ; < '0'?
	jr c,leed4h		;eee1  ; Reject: below digit range (and not space)
	cp 03ah		;eee3  ; < ':'? (i.e. '0'-'9')
	jr c,leeebh		;eee5  ; Accept digit
	cp 041h		;eee7  ; < 'A'?
leee9h:
	jr c,leed4h		;eee9  ; Reject: $3A-$40 gap between digits and letters

; --- Key accepted: display and store port/bit mapping ---
leeebh:
	ld (lefb2h+1),a		;eeeb  ; Store key char into display template (self-mod)
	ld hl,00006h		;eeee  ; Offset = 6 columns right
	add hl,de			;eef1  ; DE' = screen pos + 6 (after the label)
	ex de,hl			;eef2  ; DE = position for key display
	ld hl,lefb2h		;eef3  ; HL -> key display template (3 tiles)
leef6h:
	ld c,003h		;eef6  ; C = 3 tiles (bracket + key + bracket)
	call PRINT_TILE		;eef8  ; Display key assignment (e.g. "\"K\"")

; --- Convert ASCII key code to keyboard table index ---
; Maps key char to table index: Space=0, '0'-'9'=1-10, 'A'-'Z'=11-36
;
	ld a,(lefb2h+1)		;eefb  ; Reload key character
	sub 020h		;eefe  ; Subtract $20: Space -> 0
	jr z,lef0ah		;ef00  ; If space, index = 0
	sub 00fh		;ef02  ; Subtract $0F more: '0'($30) -> 1, '9'($39) -> 10
	cp 00eh		;ef04  ; < 14? (covers digits 0-9 plus a few extra)
	jr c,lef0ah		;ef06  ; If digit, index ready
	sub 007h		;ef08  ; Subtract 7 more: 'A'($41) -> 11, 'Z'($5A) -> 36

; --- Look up port/bit pair from keyboard mapping table ---
lef0ah:
	ld l,a			;ef0a  ; L = table index
	ld h,000h		;ef0b  ; HL = index (16-bit)
	ld de,lf090h		;ef0d  ; DE -> keyboard mapping table base
	add hl,hl			;ef10  ; HL = index * 2 (each entry is 2 bytes)
	add hl,de			;ef11  ; HL -> table entry for this key
	ld a,(hl)			;ef12  ; A = keyboard port high byte
	ld (ix+000h),a		;ef13  ; Store port into key config slot
	inc hl			;ef16  ; Next byte
	ld a,(hl)			;ef17  ; A = key bit mask
	ld (ix+001h),a		;ef18  ; Store bit mask into key config slot
	ld de,00003h		;ef1b  ; DE = 3 (stride between key config entries)
	add ix,de		;ef1e  ; IX -> next key config slot
	call CLEAR_KEY_BUFFER		;ef20  ; Wait for key release

; --- Advance screen position to next row ---
; Uses RR D / RL D trick to manipulate screen address.
; Shifts D right 3 bits, adds offset $003B, shifts D back.
; This effectively moves the screen pointer down one character row.
;
	pop de			;ef23  ; Restore screen position (before key display)
	ld hl,0003bh		;ef24  ; HL = row advance offset
	rr d		;ef27  ; Shift D right (extract screen row encoding)
	rr d		;ef29
	rr d		;ef2b
	add hl,de			;ef2d  ; Add offset in linear address space
	ex de,hl			;ef2e  ; DE = new address
	rl d		;ef2f  ; Shift D back (restore screen encoding)
	rl d		;ef31
	rl d		;ef33
	pop hl			;ef35  ; Restore text pointer (next direction label)
	pop bc			;ef36  ; Restore key counter
	djnz leecch		;ef37  ; Loop for next control (5 total)
	pop bc			;ef39  ; Balance stack
	jp lecddh		;ef3a  ; Return to menu handler
; ==========================================================================
; MENU_INPUT - Mission Code Text Entry ($EF3D)
; ==========================================================================
; Text entry field for mission code passwords. The player types up to
; 11 characters (letters and spaces). Backspace deletes the last char.
; Enter confirms the input. The typed text is stored at $7603.
;
; Uses alternate register set (EXX) to maintain the attribute pointer
; in DE' alongside the bitmap pointer in DE. The cursor is shown as
; a bright magenta attribute ($E3) at the current position.
;
; On entry: called from code_roomrender.asm mission selection screen.
; On exit: RET with typed mission code in buffer at $7603.
;
MENU_INPUT:
	ld b,00bh		;ef3d  ; B = 11 (max input length)
	ld hl,l7603h		;ef3f  ; HL -> mission code input buffer
lef42h:
	ld (hl),020h		;ef42  ; Fill buffer with spaces ($20)
	inc hl			;ef44
	djnz lef42h		;ef45  ; Clear all 11 bytes
	ld b,001h		;ef47  ; B = 1 (current cursor position, 1-based)
	exx			;ef49  ; Switch to alternate registers
	ld de,059a6h		;ef4a  ; DE' = $59A6 (attribute addr for input field)
	exx			;ef4d  ; Switch back
	ld de,048a6h		;ef4e  ; DE = $48A6 (screen addr for input field)
	ld hl,l7603h		;ef51  ; HL -> input buffer

; --- Main input loop ---
lef54h:
	push bc			;ef54  ; Save cursor position
	exx			;ef55  ; Switch to alternate regs
	ld a,0e3h		;ef56  ; A = $E3 (bright magenta attribute = cursor)
	ld (de),a			;ef58  ; Show cursor at current attribute position
	exx			;ef59  ; Switch back

; --- Wait for keypress ---
lef5ah:
	call SCAN_KEY		;ef5a  ; A = key code
	cp 00ch		;ef5d  ; Delete key?
	jp z,lf0dah		;ef5f  ; -> handle backspace
	cp 030h		;ef62  ; '0' key? (alternate delete)
	jp z,lf0dah		;ef64  ; -> handle backspace
	cp 00dh		;ef67  ; Enter key?
	jr z,lef9dh		;ef69  ; -> accept input, return

; --- Check cursor position limit ---
	pop bc			;ef6b  ; Peek at B (cursor pos)
	push bc			;ef6c  ; Put it back
	push de			;ef6d  ; Save screen pos
	ld d,a			;ef6e  ; Save key in D
	ld a,b			;ef6f  ; A = cursor position
	cp 00ch		;ef70  ; At max (12 chars)?
	ld a,d			;ef72  ; Restore key to A
	pop de			;ef73  ; Restore screen pos
	jr z,lef5ah		;ef74  ; If at max, reject input (wait for more keys)

; --- Validate key character ---
; Accepts: Space ($20), uppercase letters A-Z ($41-$5B)
;
	cp 020h		;ef76  ; Space?
	jr z,lef84h		;ef78  ; Accept space
	cp 041h		;ef7a  ; < 'A'?
	jp m,lef5ah		;ef7c  ; Reject: not a letter
	cp 05ch		;ef7f  ; >= '\' ($5C)?
	jp p,lef5ah		;ef81  ; Reject: past 'Z'+1

; --- Store and display accepted character ---
lef84h:
	ld (hl),a			;ef84  ; Store char in input buffer
	ld c,001h		;ef85  ; C = 1 tile to print
	call PRINT_TILE		;ef87  ; Display character at screen position
	exx			;ef8a  ; Switch to alternate regs
	ld a,00eh		;ef8b  ; A = $0E (normal attribute: remove cursor)
	ld (de),a			;ef8d  ; Clear cursor from previous position
	inc de			;ef8e  ; Advance attribute pointer
	exx			;ef8f  ; Switch back
	pop bc			;ef90  ; Restore cursor position
	inc b			;ef91  ; Advance cursor position
	push bc			;ef92  ; Save updated position

; --- Debounce and loop ---
lef93h:
	push de			;ef93  ; Save screen position
	push hl			;ef94  ; Save buffer pointer
	call CLEAR_KEY_BUFFER		;ef95  ; Wait for key release
	pop hl			;ef98  ; Restore buffer pointer
	pop de			;ef99  ; Restore screen position
	pop bc			;ef9a  ; Restore cursor position
	jr lef54h		;ef9b  ; Loop for next character
; --- Enter pressed: accept input and return ---
lef9dh:
	pop bc			;ef9d  ; Clean up stack (cursor position)
	exx			;ef9e  ; Switch to alternate regs
	ld a,00eh		;ef9f  ; A = $0E (normal attribute)
	ld (de),a			;efa1  ; Clear cursor from attribute area
	exx			;efa2  ; Switch back
	ret			;efa3  ; Return with typed text in buffer at $7603

; ==========================================================================
; CLEAR_KEY_BUFFER ($EFA4)
; ==========================================================================
; Waits until no keys are pressed (debounce). Polls SCAN_KEY in a loop
; until it returns 0 (no key detected).
;
CLEAR_KEY_BUFFER:
	call SCAN_KEY		;efa4  ; A = current key (0 = none)
	or a			;efa7  ; Any key still held?
	jr nz,CLEAR_KEY_BUFFER		;efa8  ; Yes -> keep waiting
	ret			;efaa  ; All keys released

; ==========================================================================
; READ_KEY_INPUT ($EFAB)
; ==========================================================================
; Waits until a key is pressed. Polls SCAN_KEY in a loop until it
; returns a non-zero key code.
;
READ_KEY_INPUT:
	call SCAN_KEY		;efab  ; A = current key (0 = none)
	or a			;efae  ; Any key pressed?
	jr z,READ_KEY_INPUT		;efaf  ; No -> keep waiting
	ret			;efb1  ; Return with key code in A

; ==========================================================================
; KEY DISPLAY TEMPLATE ($EFB2)
; ==========================================================================
; 3-byte template used to display a key assignment in the redefine screen.
; Byte 0: tile $22 (left bracket glyph)
; Byte 1: self-modified with the key character (e.g. 'K', 'A', etc.)
; Byte 2: tile $23 (right bracket glyph)
;
lefb2h:
	ld (02300h),hl		;efb2  ; DATA: $22 $00 $23 = bracket-key-bracket template

; ==========================================================================
; DIRECTION LABEL TEXT ($EFB5)
; ==========================================================================
; 25 bytes of text data for the key redefinition screen.
; Five 5-character labels: "UP   ", "DOWN ", "LEFT ", "RIGHT", "FIRE "
;
lefb5h:
	ld d,l			;efb5  ; DATA: $55 = 'U'
	ld d,b			;efb6  ; DATA: $50 = 'P'
	jr nz,$+34		;efb7  ; DATA: $20 $20 = '  '
	jr nz,lefffh		;efb9  ; DATA: $20 $44 = ' D'
	ld c,a			;efbb  ; DATA: $4F = 'O'
	ld d,a			;efbc  ; DATA: $57 = 'W'
	ld c,(hl)			;efbd  ; DATA: $4E = 'N'
	jr nz,$+78		;efbe  ; DATA: $20 $4C = ' L'
	ld b,l			;efc0  ; DATA: $45 = 'E'
	ld b,(hl)			;efc1  ; DATA: $46 = 'F'
	ld d,h			;efc2  ; DATA: $54 = 'T'
	jr nz,$+84		;efc3  ; DATA: $20 $52 = ' R'
	ld c,c			;efc5  ; DATA: $49 = 'I'
	ld b,a			;efc6  ; DATA: $47 = 'G'
	ld c,b			;efc7  ; DATA: $48 = 'H'
	ld d,h			;efc8  ; DATA: $54 = 'T'
	ld b,(hl)			;efc9  ; DATA: $46 = 'F'
	ld c,c			;efca  ; DATA: $49 = 'I'
	ld d,d			;efcb  ; DATA: $52 = 'R'
	ld b,l			;efcc  ; DATA: $45 = 'E'
	jr nz,$-49		;efcd  ; DATA: $20 $CD = ' ' + (dead byte)
	inc hl			;efcf  ; DATA: $23 (dead byte, unreachable)
	ret p			;efd0  ; DATA: $F0 (dead byte, unreachable)
; ==========================================================================
; CONTROL SCHEME SELECTION ($EFD1)
; ==========================================================================
; Three entry points for selecting the input method from the title menu.
; Each one highlights the selected option's attribute row and stores the
; control mode value to $9DF0. Then returns to the title screen loop.
;
; Entry points (called from code_roomrender.asm menu dispatcher):
;   $EFD1: Select keyboard (mode 0), highlight attr row $5882
;   $EFD7: Select Protek joystick (mode 2), highlight attr row $58C2
;   $F019: Select Kempston joystick (mode 1), highlight attr row $5902
;

; --- Select Keyboard (mode 0) ---
	ld hl,05882h		;efd1  ; HL = $5882 (attribute row for "K  KEYBOARD")
	xor a			;efd4  ; A = 0 (keyboard mode)
	jr lefdfh		;efd5  ; -> highlight and store

; --- Select Protek joystick (mode 2) ---
lefd7h:
	call MENU_HANDLER		;efd7  ; Clear previous selection's highlight
	ld hl,058c2h		;efda  ; HL = $58C2 (attribute row for "P  PROTEK")
	ld a,002h		;efdd  ; A = 2 (Protek joystick mode)

; --- Common: highlight selection and store mode ---
lefdfh:
	call sub_f02fh		;efdf  ; Store mode to $9DF0, highlight attr row
	jp led4eh		;efe2  ; Return to title screen loop

; ==========================================================================
; SOUND TOGGLE ($EFE5)
; ==========================================================================
; Toggles sound on/off by patching the IM2 interrupt handler at $8282.
; XORing the handler's first two bytes switches between the sound-playing
; and sound-skipping instruction sequences. Also updates the on-screen
; menu text from "TUNE OFF" to "TUNE ON " (or vice versa) by XORing
; the last two characters at $F081-$F082:
;   "FF" ($46,$46) XOR ($08,$66) -> "N " ($4E,$20) = "TUNE ON "
;   "N " ($4E,$20) XOR ($08,$66) -> "FF" ($46,$46) = "TUNE OFF"
;
lefe5h:
	di			;efe5  ; Disable interrupts during handler patching
	ld a,(l8282h)		;efe6  ; A = IM2 handler byte 0
	xor 00eh		;efe9  ; Toggle instruction (e.g. JP <-> CALL)
	ld (l8282h),a		;efeb  ; Store patched byte
	ld a,(l8283h)		;efee  ; A = IM2 handler byte 1
	xor 02ch		;eff1  ; Toggle address/operand
	ld (l8283h),a		;eff3  ; Store patched byte
	ld hl,lf081h		;eff6  ; HL -> "FF"/"N " in menu text
	ld a,(hl)			;eff9  ; A = first char ('F' or 'N')
	xor 008h		;effa  ; Toggle: $46 'F' <-> $4E 'N'
	ld (hl),a			;effc  ; Store toggled char
	inc hl			;effd  ; Next char
	ld a,(hl)			;effe  ; A = second char ('F' or ' ')
lefffh:
	xor 066h		;efff  ; Toggle: $46 'F' <-> $20 ' '
	ld (hl),a			;f001  ; Store toggled char
	cp 020h		;f002  ; Is result space? (sound now ON)
	call TITLE_LOOP		;f004  ; Update title screen display
	ei			;f007  ; Re-enable interrupts
	call CLEAR_KEY_BUFFER		;f008  ; Wait for key release

; --- Redraw sound status text on screen ---
	ld hl,lf081h		;f00b  ; HL -> sound status text ("FF" or "N ")
	ld c,002h		;f00e  ; C = 2 tiles to redraw
	ld de,048ech		;f010  ; DE = screen addr for sound status chars
	call PRINT_TILE		;f013  ; Redraw "FF" or "N " on screen
	jp led4eh		;f016  ; Return to title screen loop

; --- Select Kempston joystick (mode 1) ---
lf019h:
	call MENU_HANDLER		;f019  ; Clear previous selection's highlight
	ld hl,05902h		;f01c  ; HL = $5902 (attribute row for "J  KEMPSTON")
	ld a,001h		;f01f  ; A = 1 (Kempston joystick mode)
	jr lefdfh		;f021  ; -> highlight and store

; ==========================================================================
; MENU_HANDLER ($F023)
; ==========================================================================
; Fills 13 attribute bytes with a given value to highlight or unhighlight
; a menu option. The attribute address at $F026 is self-modified by
; sub_F02F to point at the currently selected option's row.
;
; On entry: A = attribute value ($0E=normal, $31=bright blue highlight)
; Self-modified: DE at $F026 = attribute row start address
;
MENU_HANDLER:
	ld a,00eh		;f023  ; A = $0E (normal attribute: unhighlight)
lf025h:
	ld de,05882h		;f025  ; DE = attribute row addr (self-modified)
	ld b,00dh		;f028  ; B = 13 bytes (menu option width)
lf02ah:
	ld (de),a			;f02a  ; Set attribute byte
	inc de			;f02b  ; Next attribute cell
	djnz lf02ah		;f02c  ; Fill all 13 bytes
	ret			;f02e

; --- Store selection and highlight new option ---
; On entry: A = control mode (0/1/2), HL = attribute row address
;
sub_f02fh:
	ld (l9df0h),a		;f02f  ; Store control mode selection
	ld (lf025h+1),hl		;f032  ; Self-modify: update MENU_HANDLER's DE address
sub_f035h:
	ld a,031h		;f035  ; A = $31 (bright blue: highlight)
	jr lf025h		;f037  ; -> fill 13 attributes with highlight color
; ==========================================================================
; MENU OPTION TEXT ($F039)
; ==========================================================================
; 87 bytes of text data for the title screen menu options.
; Each option starts with a key letter, two spaces, then the description.
; Referenced by code_roomrender.asm for menu display.
;
;   $F039 (11 chars): "K  KEYBOARD"
;   $F044  (9 chars): "P  PROTEK"
;   $F04D (11 chars): "J  KEMPSTON"
;   $F058 (16 chars): "R  REDEFINE KEYS"
;   $F068 (16 chars): "M  ALTER MISSION"
;   $F078 (11 chars): "T  TUNE OFF"    (bytes $F081-$F082 toggled to "N " for "TUNE ON ")
;   $F083 (13 chars): "S  START GAME"
;
lf039h:
	ld c,e			;f039  ; DATA: $4B = 'K'
	jr nz,lf05ch		;f03a  ; DATA: $20 $20 = '  '
	ld c,e			;f03c  ; DATA: $4B = 'K'
	ld b,l			;f03d  ; DATA: $45 = 'E'
	ld e,c			;f03e  ; DATA: $59 = 'Y'
	ld b,d			;f03f  ; DATA: $42 = 'B'
	ld c,a			;f040  ; DATA: $4F = 'O'
	ld b,c			;f041  ; DATA: $41 = 'A'
	ld d,d			;f042  ; DATA: $52 = 'R'
	ld b,h			;f043  ; DATA: $44 = 'D'
	ld d,b			;f044  ; DATA: $50 = 'P'  "P  PROTEK"
	jr nz,lf067h		;f045  ; DATA: $20 $20 = '  '
	ld d,b			;f047  ; DATA: $50 = 'P'
	ld d,d			;f048  ; DATA: $52 = 'R'
	ld c,a			;f049  ; DATA: $4F = 'O'
	ld d,h			;f04a  ; DATA: $54 = 'T'
	ld b,l			;f04b  ; DATA: $45 = 'E'
	ld c,e			;f04c  ; DATA: $4B = 'K'
	ld c,d			;f04d  ; DATA: $4A = 'J'  "J  KEMPSTON"
	jr nz,lf070h		;f04e  ; DATA: $20 $20 = '  '
	ld c,e			;f050  ; DATA: $4B = 'K'
	ld b,l			;f051  ; DATA: $45 = 'E'
	ld c,l			;f052  ; DATA: $4D = 'M'
	ld d,b			;f053  ; DATA: $50 = 'P'
	ld d,e			;f054  ; DATA: $53 = 'S'
	ld d,h			;f055  ; DATA: $54 = 'T'
	ld c,a			;f056  ; DATA: $4F = 'O'
	ld c,(hl)			;f057  ; DATA: $4E = 'N'
	ld d,d			;f058  ; DATA: $52 = 'R'  "R  REDEFINE KEYS"
	jr nz,lf07bh		;f059  ; DATA: $20 $20 = '  '
lf05bh:
	ld d,d			;f05b  ; DATA: $52 = 'R'
lf05ch:
	ld b,l			;f05c  ; DATA: $45 = 'E'
	ld b,h			;f05d  ; DATA: $44 = 'D'
	ld b,l			;f05e  ; DATA: $45 = 'E'
	ld b,(hl)			;f05f  ; DATA: $46 = 'F'
	ld c,c			;f060  ; DATA: $49 = 'I'
	ld c,(hl)			;f061  ; DATA: $4E = 'N'
	ld b,l			;f062  ; DATA: $45 = 'E'
	jr nz,lf0b0h		;f063  ; DATA: $20 $4B = ' K'
	ld b,l			;f065  ; DATA: $45 = 'E'
	ld e,c			;f066  ; DATA: $59 = 'Y'
lf067h:
	ld d,e			;f067  ; DATA: $53 = 'S'
	ld c,l			;f068  ; DATA: $4D = 'M'  "M  ALTER MISSION"
	jr nz,lf08bh		;f069  ; DATA: $20 $20 = '  '
	ld b,c			;f06b  ; DATA: $41 = 'A'
	ld c,h			;f06c  ; DATA: $4C = 'L'
	ld d,h			;f06d  ; DATA: $54 = 'T'
	ld b,l			;f06e  ; DATA: $45 = 'E'
	ld d,d			;f06f  ; DATA: $52 = 'R'
lf070h:
	jr nz,lf0bfh		;f070  ; DATA: $20 $4D = ' M'
	ld c,c			;f072  ; DATA: $49 = 'I'
	ld d,e			;f073  ; DATA: $53 = 'S'
lf074h:
	ld d,e			;f074  ; DATA: $53 = 'S'
	ld c,c			;f075  ; DATA: $49 = 'I'
	ld c,a			;f076  ; DATA: $4F = 'O'
	ld c,(hl)			;f077  ; DATA: $4E = 'N'
	ld d,h			;f078  ; DATA: $54 = 'T'  "T  TUNE OFF"
	jr nz,lf09bh		;f079  ; DATA: $20 $20 = '  '
lf07bh:
	ld d,h			;f07b  ; DATA: $54 = 'T'
	ld d,l			;f07c  ; DATA: $55 = 'U'
	ld c,(hl)			;f07d  ; DATA: $4E = 'N'
	ld b,l			;f07e  ; DATA: $45 = 'E'
	jr nz,lf0d0h		;f07f  ; DATA: $20 $4F = ' O'
lf081h:
	ld b,(hl)			;f081  ; DATA: $46 = 'F' (toggled: $4E='N' when ON)
	ld b,(hl)			;f082  ; DATA: $46 = 'F' (toggled: $20=' ' when ON)
	ld d,e			;f083  ; DATA: $53 = 'S'  "S  START GAME"
	jr nz,lf0a6h		;f084  ; DATA: $20 $20 = '  '
	ld d,e			;f086  ; DATA: $53 = 'S'
	ld d,h			;f087  ; DATA: $54 = 'T'
	ld b,c			;f088  ; DATA: $41 = 'A'
	ld d,d			;f089  ; DATA: $52 = 'R'
	ld d,h			;f08a  ; DATA: $54 = 'T'
lf08bh:
	jr nz,lf0d4h		;f08b  ; DATA: $20 $47 = ' G'
	ld b,c			;f08d  ; DATA: $41 = 'A'
lf08eh:
	ld c,l			;f08e  ; DATA: $4D = 'M'
	ld b,l			;f08f  ; DATA: $45 = 'E'
; ==========================================================================
; KEYBOARD PORT/BIT MAPPING TABLE ($F090)
; ==========================================================================
; 37 entries x 2 bytes = 74 bytes. Maps each accepted key character to
; its ZX Spectrum keyboard matrix port (high byte) and bit mask.
;
; Index mapping (computed by the key redefine code):
;   0: Space, 1-10: '0'-'9', 11-36: 'A'-'Z'
;
; ZX Spectrum keyboard matrix half-rows:
;   Port $FEFE: Caps/Z/X/C/V    Port $FDFE: A/S/D/F/G
;   Port $FBFE: Q/W/E/R/T       Port $F7FE: 1/2/3/4/5
;   Port $EFFE: 0/9/8/7/6       Port $DFFE: P/O/I/U/Y
;   Port $BFFE: Enter/L/K/J/H   Port $7FFE: Space/Sym/M/N/B
;
; Each entry: byte 0 = port high byte, byte 1 = bit mask
;
lf090h:
	ld a,a			;f090  ; DATA: Space: port=$7F bit=$01
	ld bc,001efh		;f091  ; DATA: '0': port=$EF bit=$01
	rst 30h			;f094  ; DATA: '1': port=$F7 bit=$01
	ld bc,002f7h		;f095  ; (continued)
	rst 30h			;f098  ; DATA: '3': port=$F7 bit=$04
	inc b			;f099
	rst 30h			;f09a  ; DATA: '4': port=$F7 bit=$08
lf09bh:
	ex af,af'			;f09b
	rst 30h			;f09c  ; DATA: '5': port=$F7 bit=$10
	djnz lf08eh		;f09d  ; DATA: '6': port=$EF bit=$10
	djnz lf090h		;f09f  ; DATA: '7': port=$EF bit=$08
	ex af,af'			;f0a1  ; DATA: '8': port=$EF bit=$04 (partial)
	rst 28h			;f0a2  ; (continued)
	inc b			;f0a3
	rst 28h			;f0a4  ; DATA: '9': port=$EF bit=$02
	ld (bc),a			;f0a5
lf0a6h:
	defb 0fdh,001h,07fh	;illegal sequence		;f0a6  ; DATA: 'A': port=$FD bit=$01, 'B': port=$7F (partial)
lf0a9h:
	djnz lf0a9h		;f0a9  ; DATA: 'B' bit=$10 (partial), 'C': port=$FE bit=$08 (partial)
	ex af,af'			;f0ab
	defb 0fdh,004h,0fbh	;illegal sequence		;f0ac  ; DATA: 'D': port=$FD bit=$04, 'E': port=$FB (partial)
	inc b			;f0af
lf0b0h:
	defb 0fdh,008h,0fdh	;illegal sequence		;f0b0  ; DATA: 'F': port=$FD bit=$08, 'G': port=$FD (partial)
	djnz lf074h		;f0b3  ; DATA: 'G' bit=$10, 'H': port=$BF bit=$10 (partial)
	djnz $-31		;f0b5  ; DATA: (continued)
	inc b			;f0b7  ; DATA: 'I': port=$DF bit=$04 (partial)
	cp a			;f0b8
	ex af,af'			;f0b9  ; DATA: 'J': port=$BF bit=$08 (partial)
	cp a			;f0ba
	inc b			;f0bb  ; DATA: 'K': port=$BF bit=$04 (partial)
	cp a			;f0bc
	ld (bc),a			;f0bd  ; DATA: 'L': port=$BF bit=$02 (partial)
	ld a,a			;f0be  ; DATA: 'M': port=$7F bit=$04 (partial)
lf0bfh:
	inc b			;f0bf
	ld a,a			;f0c0  ; DATA: 'N': port=$7F bit=$08 (partial)
	ex af,af'			;f0c1
	rst 18h			;f0c2  ; DATA: 'O': port=$DF bit=$02 (partial)
	ld (bc),a			;f0c3
	rst 18h			;f0c4  ; DATA: 'P': port=$DF bit=$01 (partial)
	ld bc,001fbh		;f0c5  ; DATA: 'Q': port=$FB bit=$01, 'R': port=$FB (partial)
	ei			;f0c8
	ex af,af'			;f0c9  ; DATA: 'R' bit=$08 (partial), 'S': port=$FD bit=$02 (partial)
	defb 0fdh,002h,0fbh	;illegal sequence		;f0ca  ; DATA: (continued)
	djnz $-31		;f0cd  ; DATA: 'T': port=$FB bit=$10 (partial)
	ex af,af'			;f0cf
lf0d0h:
	cp 010h		;f0d0  ; DATA: 'U': port=$DF bit=$08 (partial)... 'V': port=$FE bit=$10
	ei			;f0d2
	ld (bc),a			;f0d3  ; DATA: 'W': port=$FB bit=$02 (partial)
lf0d4h:
	cp 004h		;f0d4  ; DATA: 'X': port=$FE bit=$04 (partial)
	rst 18h			;f0d6  ; DATA: 'Y': port=$DF bit=$10 (partial)
lf0d7h:
	djnz lf0d7h		;f0d7  ; DATA: (continued)
	ld (bc),a			;f0d9  ; DATA: 'Z': port=$FE bit=$02
; ==========================================================================
; BACKSPACE HANDLER ($F0DA)
; ==========================================================================
; Called from MENU_INPUT when Delete ($0C) or '0' ($30) is pressed.
; Erases the last typed character by overwriting it with a space,
; moves the screen and attribute pointers back, and resumes input.
;
; If cursor is at position 1 (nothing typed), does nothing (loops back
; to the input loop without erasing).
;
lf0dah:
	pop bc			;f0da  ; Pop cursor position from stack
	ld a,b			;f0db  ; A = current position (1-based)
	cp 001h		;f0dc  ; At position 1? (nothing to delete)
	jp z,lef54h		;f0de  ; Yes -> return to input loop (no change)
	dec b			;f0e1  ; Move cursor position back one
	push bc			;f0e2  ; Save updated position
	dec hl			;f0e3  ; Move buffer pointer back
	dec de			;f0e4  ; Move screen pointer back
	ld a,020h		;f0e5  ; A = $20 (space: erase character)
	ld (hl),a			;f0e7  ; Clear character in buffer
	ld c,001h		;f0e8  ; C = 1 tile
	call PRINT_TILE		;f0ea  ; Print space (erase on screen)
	dec hl			;f0ed  ; Adjust buffer pointer (PRINT_TILE advanced it)
	dec de			;f0ee  ; Adjust screen pointer
	exx			;f0ef  ; Switch to alternate regs
	ld a,00eh		;f0f0  ; A = $0E (normal attribute)
	ld (de),a			;f0f2  ; Clear cursor attribute at old position
	dec de			;f0f3  ; Move attribute pointer back
	exx			;f0f4  ; Switch back
	jp lef93h		;f0f5  ; -> debounce and resume input loop

; ==========================================================================
; CONGRATULATIONS TEXT ($F0F8)
; ==========================================================================
; 20 bytes of text displayed when the player completes a mission.
; "CONGRATULATIONS" (15 chars) + "YOU A" (5 chars)
; The full message likely continues in adjacent data.
;
lf0f8h:
	ld b,e			;f0f8  ; DATA: $43 = 'C'
	ld c,a			;f0f9  ; DATA: $4F = 'O'
	ld c,(hl)			;f0fa  ; DATA: $4E = 'N'
	ld b,a			;f0fb  ; DATA: $47 = 'G'
	ld d,d			;f0fc  ; DATA: $52 = 'R'
	ld b,c			;f0fd  ; DATA: $41 = 'A'
	ld d,h			;f0fe  ; DATA: $54 = 'T'
	ld d,l			;f0ff  ; DATA: $55 = 'U'
	ld c,h			;f100  ; DATA: $4C = 'L'
	ld b,c			;f101  ; DATA: $41 = 'A'
	ld d,h			;f102  ; DATA: $54 = 'T'
	ld c,c			;f103  ; DATA: $49 = 'I'
	ld c,a			;f104  ; DATA: $4F = 'O'
	ld c,(hl)			;f105  ; DATA: $4E = 'N'
	ld d,e			;f106  ; DATA: $53 = 'S'
	ld e,c			;f107  ; DATA: $59 = 'Y'  "YOU A"
	ld c,a			;f108  ; DATA: $4F = 'O'
	ld d,l			;f109  ; DATA: $55 = 'U'
	jr nz,lf14dh		;f10a  ; DATA: $20 $41 = ' A'
