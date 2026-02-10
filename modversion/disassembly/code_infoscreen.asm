; ======================================================================
; code_infoscreen.asm
; ======================================================================
;
; Info Screen Display & Input (NEW)
;
; Address range: $900C-$90EB (224 bytes)
; Source binary: mod_decompressed.bin (loaded at $620C)
;
; Code to display the info/credits screen, set up initial game state,
; and configure difficulty/mission options before the main menu.
;
; Structure:
;   $900C-$9069  Display data: tile indices for info screen layout
;                (misinterpreted as Z80 instructions by disassembler)
;   $906A-$90EB  Executable code: clear screen, display info text,
;                read mission config, set initial game parameters
;
; ======================================================================

info_text_end:

; --- Display data: tile indices for info screen ---
; These bytes are tile/character indices, not executable code.
; Tile values: $8C-$8F are custom graphic tiles, $20 is space,
; $41-$5A are letters, $4F='O', $4E='N', etc.
;
info_code_start:
	adc a,h			;900c  ; DATA: tile $8C
	adc a,h			;900d  ; DATA: tile $8C
	adc a,(hl)			;900e  ; DATA: tile $8E
	adc a,a			;900f  ; DATA: tile $8F
	adc a,a			;9010  ; DATA: tile $8F
	adc a,h			;9011  ; DATA: tile $8C
	adc a,(hl)			;9012  ; DATA: tile $8E
	adc a,a			;9013  ; DATA: tile $8F
	adc a,l			;9014  ; DATA: tile $8D
	adc a,l			;9015  ; DATA: tile $8D
	adc a,(hl)			;9016  ; DATA: tile $8E
	adc a,d			;9017  ; DATA: tile $8A
	jr nz,l903ah		;9018  ; DATA: $20 $20 = '  '
	jr nz,l903ch		;901a  ; DATA: $20 $20 = '  '
	jr nz,l903eh		;901c  ; DATA: $20 $20 = '  '
	jr nz,l9040h		;901e  ; DATA: $20 $20 = '  '
	jr nz,l9042h		;9020  ; DATA: $20 $20 = '  '
	jr nz,l9044h		;9022  ; DATA: $20 $20 = '  '
	jr nz,l9046h		;9024  ; DATA: $20 $20 = '  '
	jr nz,l9048h		;9026  ; DATA: $20 $20 = '  '
	jr nz,l904ah		;9028  ; DATA: $20 $20 = '  '
	jr nz,l904ch		;902a
	jr nz,l904eh		;902c
	jr nz,l9050h		;902e
	jr nz,l9052h		;9030
	jr nz,l9054h		;9032
	jr nz,l9056h		;9034
	jr nz,l9058h		;9036
	jr nz,l905ah		;9038
l903ah:
	jr nz,l905ch		;903a
l903ch:
	jr nz,$+34		;903c
l903eh:
	jr nz,l9060h		;903e
l9040h:
	jr nz,l9062h		;9040
l9042h:
	jr nz,l9064h		;9042
l9044h:
	jr nz,l9066h		;9044
l9046h:
	jr nz,l9068h		;9046
l9048h:
	jr nz,l906ah		;9048
l904ah:
	jr nz,l906ch		;904a
l904ch:
	jr nz,l909eh		;904c  ; DATA: $20 $50 = ' P'
l904eh:
	ld d,d			;904e  ; DATA: $52 = 'R'
	ld b,l			;904f  ; DATA: $45 = 'E'
l9050h:
	ld d,e			;9050  ; DATA: $53 = 'S'
	ld d,e			;9051  ; DATA: $53 = 'S'
l9052h:
	jr nz,$+67		;9052  ; DATA: $20 $45 = ' E'
l9054h:
	ld c,(hl)			;9054  ; DATA: $4E = 'N'
	ld e,c			;9055
l9056h:
	jr nz,l90a3h		;9056
l9058h:
	ld b,l			;9058
	ld e,c			;9059
l905ah:
	jr nz,l90b0h		;905a
l905ch:
	ld c,a			;905c
	jr nz,$+69		;905d
	ld c,a			;905f
l9060h:
	ld c,(hl)			;9060
	ld d,h			;9061
l9062h:
	ld c,c			;9062
	ld c,(hl)			;9063
l9064h:
	ld d,l			;9064
	ld b,l			;9065
l9066h:
	jr nz,$+34		;9066
l9068h:
	jr nz,l908ah		;9068
; --- INFO SCREEN DISPLAY CODE ($906A) ---
; Clears screen, displays info text, reads config, sets up game state.
;
l906ah:
	pop bc			;906a  ; Discard return address
	xor a			;906b  ; A = 0
l906ch:
	out (0feh),a		;906c  ; Border = black
	ld hl,lef78h		;906e  ; HL = ISR handler address
	ld (lfff5h),hl		;9071  ; Set IM2 interrupt vector target
	ld hl,04000h		;9074  ; HL = screen memory start
	ld de,00100h		;9077  ; DE = 256 (block size)
	ld b,a			;907a  ; B = 0 (256 iterations)
	call sub_d311h		;907b  ; Clear pixel area (fill with 0)
	ld b,080h		;907e  ; B = 128
	call sub_d30eh		;9080  ; Clear remaining pixel area
	ld b,030h		;9083  ; B = 48 (48×16=768, fills attribute area)
	ld a,006h		;9085  ; A = 6 (yellow ink, black paper)
	call sub_d30eh		;9087  ; Set attributes to yellow
; --- Display info text strings ---
l908ah:
	ld hl,l63b5h		;908a  ; HL -> info text string 1
	ld de,04007h		;908d  ; DE = screen position (row 0, col 7)
	call sub_d06bh		;9090  ; Print string to screen
	ld a,(lf8fbh)		;9093  ; A = mission/difficulty level
	push af			;9096  ; Save level for later
	add a,030h		;9097  ; Convert to ASCII digit ('0'+level)
	ld (l63cfh),a		;9099  ; Patch digit into display string
	ld e,04ch		;909c  ; E = column $4C for next string
l909eh:
	call sub_d06bh		;909e  ; Print text string 2
	ld e,087h		;90a1  ; E = column $87
l90a3h:
	ld hl,l6430h		;90a3  ; HL -> info text string 3
	call sub_d06bh		;90a6  ; Print text string 3
	pop af			;90a9  ; Restore mission level
	add a,a			;90aa  ; A = level * 2
	add a,0a1h		;90ab  ; A = $A1 + level*2 (attribute offset)
	ld (05cb7h),a		;90ad  ; Set attribute column for highlight
; --- Read mission config and set up game state ---
l90b0h:
	ld hl,(l63a1h)		;90b0  ; HL = config data pointer
	ld c,005h		;90b3  ; C = 5 bytes
	call sub_d06dh		;90b5  ; Print 5 config chars to screen
	ld de,lfb0ah		;90b8  ; DE = game state storage
	ld c,003h		;90bb  ; C = 3 bytes
	ldir		;90bd  ; Copy 3 bytes to game state
	ld de,040a1h		;90bf  ; DE = screen position (row 5, col 1)
	ld c,01eh		;90c2  ; C = 30 characters
	call sub_d06dh		;90c4  ; Print 30-char mission description
	ld de,l6449h		;90c7  ; DE = config destination
	ldi		;90ca  ; Copy byte 1 of config data
	ldi		;90cc  ; Copy byte 2 of config data
	ld a,(hl)			;90ce  ; A = mission parameter 1
	inc hl			;90cf
	ld d,(hl)			;90d0  ; D = mission parameter 2
	ld ixl,d		;90d1  ; IXL = save param 2
	ld (lf8f8h),a		;90d3  ; Store mission param 1
	or a			;90d6  ; Test if zero
	ld de,04800h		;90d7  ; DE = screen position for extra text
	jr z,l90e2h		;90da  ; Skip if param = 0 (no extra text)
	ld hl,l6440h		;90dc  ; HL -> additional mission text
	call sub_d06bh		;90df  ; Print extra text
l90e2h:
	ld a,ixl		;90e2  ; A = mission param 2
	or 0feh		;90e4  ; Set bits 1-7 (keep bit 0 from param)
	ld (lf8f3h),a		;90e6  ; Store mission config flags
	inc a			;90e9  ; Test if was $FF
	jr nz,l90f6h		;90ea  ; Jump if not $FF (continue setup)
