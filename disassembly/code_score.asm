; ======================================================================
; code_score.asm
; ======================================================================
;
; Score System, High Score Table & Mission Complete Sequence
;
; Address range: $F10C-$F30B (512 bytes)
; Source binary: block7_main.bin (loaded at $620C)
;
; This file contains three distinct sections:
;
; 1. ASCII TEXT DATA ($F10C-$F253)
;    Tile character data for on-screen messages and the high score table.
;    z80dasm has disassembled these bytes as Z80 instructions, but they
;    are actually ASCII text used by PRINT_TILE for display. The
;    "instructions" shown are meaningless -- only the byte values matter.
;
;    Messages:
;      $F10C: "RE NOW A TRUE"      (cont. from previous file)
;      $F119: "NINJA SABOTEUR"
;      $F127: "ENTER YOUR NAME"
;      $F136: "HIGH SCORES"
;
;    Score Table ($F141-$F23F): 15 entries, 17 bytes each:
;      Bytes 0-5:  6-digit ASCII score (e.g. "001000")
;      Bytes 6-16: 11-char padded name  (e.g. " CLIVE     ")
;      Total: 15 x 17 = 255 bytes (matches LDIR copy in entry.asm)
;
;    Default high score names (Durell Software staff):
;       1. CLIVE  (001000)    9. NICKY  (000070)
;       2. NINA JANE (000140) 10. JUSTIN (000060)
;       3. W RUSSEL B (000130) 11. CLAIRE (000050)
;       4. MICKY!LISA (000120) 12. JOE TARAO (000040)
;       5. LEE (000110)       13. ALAN (000030)
;       6. DARREN (000100)    14. RICH (000020)
;       7. NOEL (000090)      15. DIV (000010)
;       8. BRAD (000080)
;
;    After table ($F240-$F253): spare entry template + padding
;
; 2. SCORE UPDATE CODE ($F259-$F299)
;    Score countdown timer increment and score display formatting.
;    - $F259: Score timer increment (called from $EF80)
;    - $F25E: UPDATE_SCORE - main score update entry (11 references)
;    - $F262: FORMAT_SCORE - XOR-based flashing score display effect
;
; 3. MISSION COMPLETE SEQUENCE ($F29A-$F30B)
;    End-of-mission display: congratulations text, high score check,
;    and optional "ultimate ninja" message for final level.
;
; Cross-references:
;   Called from: code_interaction.asm ($B49D jp z to $F29A)
;               code_uimission.asm ($EC23, $EC99 reference SCORE_TABLE)
;               code_uimission.asm ($EC8E references lf136h "HIGH SCORES")
;               entry.asm ($62A6 copies alternative names to SCORE_TABLE)
;               Multiple files call UPDATE_SCORE (11 references)
;   Calls: FONT_DATA, PRINT_TILE, MISSION_BRIEFING
;   Data: Score table entries, message tile data
;
; Memory map:
;   $F10C-$F140  ASCII message tile data (53 bytes)
;   $F141-$F23F  High score table (15 entries x 17 bytes)
;   $F240-$F253  Spare entry template / padding (20 bytes)
;   $F254-$F258  Data bytes (non-ASCII, between text and code)
;   $F259-$F25D  Score timer increment routine
;   $F25E-$F261  UPDATE_SCORE entry point
;   $F262-$F299  FORMAT_SCORE + outer loop
;   $F29A-$F30B  Mission complete display sequence
;
; ======================================================================

; ==========================================================================
; ASCII TEXT DATA ($F10C-$F253)
; ==========================================================================
; IMPORTANT: The "instructions" below are NOT real code. They are ASCII
; character bytes that z80dasm has misinterpreted as Z80 instructions.
; Each byte is a tile index for PRINT_TILE display.
;
; Read the hex values as ASCII:
;   $41='A', $42='B', ..., $5A='Z', $20=' ', $30='0', etc.
;
; The block definition did not mark this region as data, so z80dasm
; produced nonsensical instruction mnemonics from the text bytes.
; ==========================================================================

; --- Message: "RE NOW A TRUE" ($F10C-$F118) ---
; Continuation of "YOU ARE NOW A TRUE" from previous file.
; The complete message "YOU ARE NOW A TRUE NINJA SABOTEUR" spans
; across the file boundary.
;
	ld d,d			;f10c  ; $52 = 'R'
	ld b,l			;f10d  ; $45 = 'E'
	jr nz,lf15eh		;f10e  ; $20,$4E = ' ','N'
	ld c,a			;f110  ; $4F = 'O'
	ld d,a			;f111  ; $57 = 'W'
	jr nz,lf16ah		;f112  ; $20,$54 = ' ','T' (actually $20,$56 but jr nz uses offset)
	jr nz,lf16ah		;f114  ; $20,$52 = ' ','R' ... z80dasm decodes 2-byte jr nz
	ld d,d			;f116  ; $52 = 'R'
	ld d,l			;f117  ; $55 = 'U'
	ld b,l			;f118  ; $45 = 'E'

; --- Message: "NINJA SABOTEUR" ($F119-$F126) ---
;
	ld c,(hl)			;f119  ; $4E = 'N'
	ld c,c			;f11a  ; $49 = 'I'
	ld c,(hl)			;f11b  ; $4E = 'N'
	ld c,d			;f11c  ; $4A = 'J'
	ld b,c			;f11d  ; $41 = 'A'
	jr nz,lf173h		;f11e  ; $20,$53 = ' ','S'
	ld b,c			;f120  ; $41 = 'A'
	ld b,d			;f121  ; $42 = 'B'
	ld c,a			;f122  ; $4F = 'O'
	ld d,h			;f123  ; $54 = 'T'
	ld b,l			;f124  ; $45 = 'E'
	ld d,l			;f125  ; $55 = 'U'
	ld d,d			;f126  ; $52 = 'R'

; --- Message: "ENTER YOUR NAME" ($F127-$F135) ---
; Prompt displayed when player achieves a high score.
;
	ld b,l			;f127  ; $45 = 'E'
	ld c,(hl)			;f128  ; $4E = 'N'
	ld d,h			;f129  ; $54 = 'T'
	ld b,l			;f12a  ; $45 = 'E'
	ld d,d			;f12b  ; $52 = 'R'
	jr nz,$+91		;f12c  ; $20,$59 = ' ','Y'
	ld c,a			;f12e  ; $4F = 'O'
	ld d,l			;f12f  ; $55 = 'U'
	ld d,d			;f130  ; $52 = 'R'
	jr nz,$+80		;f131  ; $20,$4E = ' ','N'
	ld b,c			;f133  ; $41 = 'A'
	ld c,l			;f134  ; $4D = 'M'
	ld b,l			;f135  ; $45 = 'E'

; --- Message: "HIGH SCORES" ($F136-$F140) ---
; Header text displayed above the score table.
; Referenced by code_uimission.asm at $EC8E.
;
lf136h:
	ld c,b			;f136  ; $48 = 'H'
	ld c,c			;f137  ; $49 = 'I'
	ld b,a			;f138  ; $47 = 'G'
	ld c,b			;f139  ; $48 = 'H'
	jr nz,$+85		;f13a  ; $20,$53 = ' ','S'
	ld b,e			;f13c  ; $43 = 'C'
	ld c,a			;f13d  ; $4F = 'O'
	ld d,d			;f13e  ; $52 = 'R'
	ld b,l			;f13f  ; $45 = 'E'
	ld d,e			;f140  ; $53 = 'S'

; ==========================================================================
; HIGH SCORE TABLE ($F141-$F23F)
; ==========================================================================
; 15 entries, each 17 bytes:
;   Bytes 0-5:   6-digit ASCII score (highest first, e.g. "001000")
;   Bytes 6-16:  11-character name, space-padded (e.g. " CLIVE     ")
;
; At game start, entry.asm may copy one of 7 alternative name tables
; over this default table (Easter egg: hip-hop artists, Durell staff, etc.)
; The copy size is 255 bytes (15 x 17 = 255).
;
; Entry  1: "001000 CLIVE     " ($F141)
; Entry  2: "000140NINA JANE  " ($F152)
; Entry  3: "000130W RUSSEL B " ($F163)
; Entry  4: "000120MICKY!LISA " ($F174)
; Entry  5: "000110LEE        " ($F185)
; Entry  6: "000100DARREN     " ($F196)
; Entry  7: "000090NOEL       " ($F1A7)
; Entry  8: "000080BRAD       " ($F1B8)
; Entry  9: "000070NICKY      " ($F1C9)
; Entry 10: "000060JUSTIN     " ($F1DA)
; Entry 11: "000050CLAIRE     " ($F1EB)
; Entry 12: "000040JOE TARAO  " ($F1FC)
; Entry 13: "000030ALAN       " ($F20D)
; Entry 14: "000020RICH       " ($F21E)
; Entry 15: "000010DIV        " ($F22F)
;
SCORE_TABLE:
	jr nc,lf173h		;f141  ; "00" ($30,$30)
	ld sp,03030h		;f143  ; "1000" ($31,$30,$30,$30) -> score "001000"
	jr nc,lf168h		;f146  ; " C" ($20,$43)
	ld b,e			;f148  ; $43 = 'C'
	ld c,h			;f149  ; $4C = 'L'
	ld c,c			;f14a  ; $49 = 'I'
	ld d,(hl)			;f14b  ; $56 = 'V'
	ld b,l			;f14c  ; $45 = 'E'
lf14dh:
	jr nz,lf16fh		;f14d  ; $20,$20 = ' ',' '
	jr nz,lf171h		;f14f  ; $20,$20 = ' ',' '
	jr nz,lf183h		;f151  ; $20,$30 = ' ','0' -> name " CLIVE     "
	jr nc,$+50		;f153  ; $30,$30 = '0','0'
lf155h:
	ld sp,03034h		;f155  ; $31,$34,$30 -> score "000140"
	ld c,(hl)			;f158  ; $4E = 'N'
	ld c,c			;f159  ; $49 = 'I'
	ld c,(hl)			;f15a  ; $4E = 'N'
	ld b,c			;f15b  ; $41 = 'A'
	jr nz,lf1a8h		;f15c  ; $20,$4A = ' ','J'
lf15eh:
	ld b,c			;f15e  ; $41 = 'A'
	ld c,(hl)			;f15f  ; $4E = 'N'
	ld b,l			;f160  ; $45 = 'E'
	jr nz,lf183h		;f161  ; $20,$20 = ' ',' ' -> name "NINA JANE  "
	jr nc,$+50		;f163  ; $30,$30 = '0','0'
	jr nc,lf198h		;f165  ; $30,$31 = '0','1'
	inc sp			;f167  ; $33 = '3'
lf168h:
	jr nc,lf1c1h		;f168  ; $30,$57 = '0','W' -> score "000130"
lf16ah:
	jr nz,$+84		;f16a  ; $20,$52 = ' ','R'
	ld d,l			;f16c  ; $55 = 'U'
	ld d,e			;f16d  ; $53 = 'S'
	ld d,e			;f16e  ; $53 = 'S'
lf16fh:
	ld b,l			;f16f  ; $45 = 'E'
	ld c,h			;f170  ; $4C = 'L'
lf171h:
	jr nz,lf1b5h		;f171  ; $20,$42 = ' ','B'
lf173h:
	jr nz,$+50		;f173  ; $20,$30 = ' ','0' -> name "W RUSSEL B "
	jr nc,$+50		;f175  ; $30,$30 = '0','0'
	ld sp,03032h		;f177  ; $31,$32,$30 -> score "000120"
	ld c,l			;f17a  ; $4D = 'M'
	ld c,c			;f17b  ; $49 = 'I'
	ld b,e			;f17c  ; $43 = 'C'
	ld c,e			;f17d  ; $4B = 'K'
	ld e,c			;f17e  ; $59 = 'Y'
	ld hl,0494ch		;f17f  ; $21,$4C,$49 = '!','L','I'
	ld d,e			;f182  ; $53 = 'S'
lf183h:
	ld b,c			;f183  ; $41 = 'A'
	jr nz,$+50		;f184  ; $20,$30 = ' ','0' -> name "MICKY!LISA "
	jr nc,$+50		;f186  ; $30,$30 = '0','0'
	ld sp,03031h		;f188  ; $31,$31,$30 -> score "000110"
	ld c,h			;f18b  ; $4C = 'L'
	ld b,l			;f18c  ; $45 = 'E'
	ld b,l			;f18d  ; $45 = 'E'
	jr nz,lf1b0h		;f18e  ; $20,$20 = ' ',' '
	jr nz,$+34		;f190  ; $20,$20 = ' ',' '
	jr nz,$+34		;f192  ; $20,$20 = ' ',' '
	jr nz,$+34		;f194  ; $20,$20 = ' ',' '
	jr nc,lf1c8h		;f196  ; $30,$30 = '0','0' -> name "LEE        "
lf198h:
	jr nc,$+51		;f198  ; $30,$31 = '0','1'
	jr nc,lf1cch		;f19a  ; $30,$30 = '0','0' -> score "000100"
	ld b,h			;f19c  ; $44 = 'D'
	ld b,c			;f19d  ; $41 = 'A'
	ld d,d			;f19e  ; $52 = 'R'
	ld d,d			;f19f  ; $52 = 'R'
	ld b,l			;f1a0  ; $45 = 'E'
	ld c,(hl)			;f1a1  ; $4E = 'N'
	jr nz,lf1c4h		;f1a2  ; $20,$20 = ' ',' '
	jr nz,lf1c6h		;f1a4  ; $20,$20 = ' ',' '
	jr nz,lf1d8h		;f1a6  ; $20,$30 = ' ','0' -> name "DARREN     "
lf1a8h:
	jr nc,lf1dah		;f1a8  ; $30,$30 = '0','0'
	jr nc,lf1e5h		;f1aa  ; $30,$39 = '0','9'
	jr nc,$+80		;f1ac  ; $30,$4E = '0','N' -> score "000090"
	ld c,a			;f1ae  ; $4F = 'O'
	ld b,l			;f1af  ; $45 = 'E'
lf1b0h:
	ld c,h			;f1b0  ; $4C = 'L'
	jr nz,lf1d3h		;f1b1  ; $20,$20 = ' ',' '
	jr nz,$+34		;f1b3  ; $20,$20 = ' ',' '
lf1b5h:
	jr nz,$+34		;f1b5  ; $20,$20 = ' ',' '
	jr nz,$+50		;f1b7  ; $20,$30 = ' ','0' -> name "NOEL       "
	jr nc,$+50		;f1b9  ; $30,$30 = '0','0'
	jr nc,lf1f5h		;f1bb  ; $30,$38 = '0','8'
	jr nc,lf201h		;f1bd  ; $30,$42 = '0','B' -> score "000080"
	ld d,d			;f1bf  ; $52 = 'R'
	ld b,c			;f1c0  ; $41 = 'A'
lf1c1h:
	ld b,h			;f1c1  ; $44 = 'D'
	jr nz,lf1e4h		;f1c2  ; $20,$20 = ' ',' '
lf1c4h:
	jr nz,lf1e6h		;f1c4  ; $20,$20 = ' ',' '
lf1c6h:
	jr nz,lf1e8h		;f1c6  ; $20,$20 = ' ',' '
lf1c8h:
	jr nz,$+50		;f1c8  ; $20,$30 = ' ','0' -> name "BRAD       "
	jr nc,$+50		;f1ca  ; $30,$30 = '0','0'
lf1cch:
	jr nc,lf205h		;f1cc  ; $30,$37 = '0','7'
	jr nc,$+80		;f1ce  ; $30,$4E = '0','N' -> score "000070"
	ld c,c			;f1d0  ; $49 = 'I'
	ld b,e			;f1d1  ; $43 = 'C'
	ld c,e			;f1d2  ; $4B = 'K'
lf1d3h:
	ld e,c			;f1d3  ; $59 = 'Y'
	jr nz,lf1f6h		;f1d4  ; $20,$20 = ' ',' '
	jr nz,$+34		;f1d6  ; $20,$20 = ' ',' '
lf1d8h:
	jr nz,$+34		;f1d8  ; $20,$20 = ' ',' '
lf1dah:
	jr nc,$+50		;f1da  ; $30,$30 = '0','0' -> name "NICKY      "
	jr nc,$+50		;f1dc  ; $30,$30 = '0','0'
	ld (hl),030h		;f1de  ; $36,$30 = '6','0'
	ld c,d			;f1e0  ; $4A = 'J' -> score "000060"
	ld d,l			;f1e1  ; $55 = 'U'
	ld d,e			;f1e2  ; $53 = 'S'
	ld d,h			;f1e3  ; $54 = 'T'
lf1e4h:
	ld c,c			;f1e4  ; $49 = 'I'
lf1e5h:
	ld c,(hl)			;f1e5  ; $4E = 'N'
lf1e6h:
	jr nz,lf208h		;f1e6  ; $20,$20 = ' ',' '
lf1e8h:
	jr nz,lf20ah		;f1e8  ; $20,$20 = ' ',' '
	jr nz,$+50		;f1ea  ; $20,$30 = ' ','0' -> name "JUSTIN     "
	jr nc,$+50		;f1ec  ; $30,$30 = '0','0'
	jr nc,lf225h		;f1ee  ; $30,$35 = '0','5'
	jr nc,$+69		;f1f0  ; $30,$43 = '0','C' -> score "000050"
	ld c,h			;f1f2  ; $4C = 'L'
	ld b,c			;f1f3  ; $41 = 'A'
	ld c,c			;f1f4  ; $49 = 'I'
lf1f5h:
	ld d,d			;f1f5  ; $52 = 'R'
lf1f6h:
	ld b,l			;f1f6  ; $45 = 'E'
	jr nz,lf219h		;f1f7  ; $20,$20 = ' ',' '
	jr nz,lf21bh		;f1f9  ; $20,$20 = ' ',' '
	jr nz,$+50		;f1fb  ; $20,$30 = ' ','0' -> name "CLAIRE     "
	jr nc,$+50		;f1fd  ; $30,$30 = '0','0'
	jr nc,$+54		;f1ff  ; $30,$34 = '0','4'
lf201h:
	jr nc,lf24dh		;f201  ; $30,$4A = '0','J' -> score "000040"
	ld c,a			;f203  ; $4F = 'O'
	ld b,l			;f204  ; $45 = 'E'
lf205h:
	jr nz,$+86		;f205  ; $20,$54 = ' ','T'
	ld b,c			;f207  ; $41 = 'A'
lf208h:
	ld d,d			;f208  ; $52 = 'R'
	ld b,c			;f209  ; $41 = 'A'
lf20ah:
	ld c,a			;f20a  ; $4F = 'O'
	jr nz,$+34		;f20b  ; $20,$20 = ' ',' '
	jr nc,$+50		;f20d  ; $30,$30 = '0','0' -> name "JOE TARAO  "
	jr nc,lf241h		;f20f  ; $30,$30 = '0','0'
	inc sp			;f211  ; $33 = '3'
	jr nc,lf255h		;f212  ; $30,$41 = '0','A' -> score "000030"
	ld c,h			;f214  ; $4C = 'L'
	ld b,c			;f215  ; $41 = 'A'
	ld c,(hl)			;f216  ; $4E = 'N'
	jr nz,$+34		;f217  ; $20,$20 = ' ',' '
lf219h:
	jr nz,$+34		;f219  ; $20,$20 = ' ',' '
lf21bh:
	jr nz,$+34		;f21b  ; $20,$20 = ' ',' '
	jr nz,lf24fh		;f21d  ; $20,$30 = ' ','0' -> name "ALAN       "
	jr nc,$+50		;f21f  ; $30,$30 = '0','0'
	jr nc,lf255h		;f221  ; $30,$32 = '0','2'
	jr nc,lf277h		;f223  ; $30,$52 = '0','R' -> score "000020"
lf225h:
	ld c,c			;f225  ; $49 = 'I'
	ld b,e			;f226  ; $43 = 'C'
	ld c,b			;f227  ; $48 = 'H'
	jr nz,lf24ah		;f228  ; $20,$20 = ' ',' '
	jr nz,lf24ch		;f22a  ; $20,$20 = ' ',' '
	jr nz,lf24eh		;f22c  ; $20,$20 = ' ',' '
	jr nz,lf260h		;f22e  ; $20,$30 = ' ','0' -> name "RICH       "
	jr nc,FORMAT_SCORE		;f230  ; $30,$30 = '0','0'
	jr nc,$+51		;f232  ; $30,$31 = '0','1'
	jr nc,lf27ah		;f234  ; $30,$44 = '0','D' -> score "000010"
	ld c,c			;f236  ; $49 = 'I'
	ld d,(hl)			;f237  ; $56 = 'V'
	jr nz,$+34		;f238  ; $20,$20 = ' ',' '
	jr nz,lf25ch		;f23a  ; $20,$20 = ' ',' '
	jr nz,UPDATE_SCORE		;f23c  ; $20,$20 = ' ',' '
	jr nz,lf260h		;f23e  ; $20,$20 = ' ','0' (Wait -- see below)

; --- End of score table ---
; name "DIV        " (the last 4 bytes of this name are the "0" prefix below)

; ==========================================================================
; SPARE ENTRY / POST-TABLE DATA ($F240-$F253)
; ==========================================================================
; Text: "SPARE SCORE+NAME 0 !"
; This appears to be a template or label for the score+name format.
; The last bytes ($F254-$F258) are non-ASCII data.
;
lf240h:
	ld d,e			;f240  ; $53 = 'S'
lf241h:
	ld d,b			;f241  ; $50 = 'P'
	ld b,c			;f242  ; $41 = 'A'
	ld d,d			;f243  ; $52 = 'R'
	ld b,l			;f244  ; $45 = 'E'
	jr nz,lf29ah		;f245  ; $20,$53 = ' ','S'
	ld b,e			;f247  ; $43 = 'C'
	ld c,a			;f248  ; $4F = 'O'
	ld d,d			;f249  ; $52 = 'R'
lf24ah:
	ld b,l			;f24a  ; $45 = 'E'
	dec hl			;f24b  ; $2B = '+'
lf24ch:
	ld c,(hl)			;f24c  ; $4E = 'N'
lf24dh:
	ld b,c			;f24d  ; $41 = 'A'
lf24eh:
	ld c,l			;f24e  ; $4D = 'M'
lf24fh:
	ld b,l			;f24f  ; $45 = 'E'
	jr nz,$+50		;f250  ; $20,$30 = ' ','0'
	jr nz,lf275h		;f252  ; $20,$21 = ' ','!'

; --- Non-ASCII data bytes ($F254-$F258) ---
; These bytes separate the text data from the score code.
; z80dasm interprets them as instructions but they are likely
; padding or metadata.
;
	ld (hl),c			;f254  ; Data: $71
lf255h:
	jp p,00ecbh		;f255  ; Data: $F2,$CB,$0E
	ret nc			;f258  ; Data: $D0

; ==========================================================================
; SCORE TIMER INCREMENT ($F259)
; ==========================================================================
; Small routine called from $EF80 to increment the score countdown
; timer at $F264. HL is expected to point elsewhere on entry;
; this routine redirects HL to the timer address.
;
	ld hl,0f264h		;f259  ; HL = address of score countdown timer
lf25ch:
	inc (hl)			;f25c  ; Increment the countdown timer byte
	ret			;f25d  ; Return to caller

; ==========================================================================
; UPDATE_SCORE ($F25E)
; ==========================================================================
; Main score update entry point. Called from 11 locations throughout
; the game code to trigger a score display update.
;
; The byte at $F25F is self-modified: when active, it holds $01;
; when score display is disabled, it's set to $00 by the code at
; $F292 (ld (UPDATE_SCORE+1),a with A=0).
;
; On entry:
;   B = number of FORMAT_SCORE iterations to perform
;
; Self-modifying: The immediate byte after LD A is patched:
;   $F25F = $01: score updates active
;   $F25F = $00: score updates disabled (OR A; RET Z exits)
;
UPDATE_SCORE:
	ld a,001h		;f25e  ; A = 1 (self-modified: 0=disabled, 1=active)
lf260h:
	or a			;f260  ; Test if score updates are enabled
	ret z			;f261  ; If disabled (A=0), return immediately

; ==========================================================================
; FORMAT_SCORE ($F262)
; ==========================================================================
; Creates a flashing/XOR visual effect on the score display area.
; Operates on two screen rows separated by $20 bytes, XORing each
; pixel row with a mask byte C.
;
; The routine reads from address pair (HL, HL+$20) where HL starts
; at $50A5 (bottom screen area, score display column). For each of
; 8 pixel rows, it XORs both the upper and lower row bytes with C.
;
; The control byte at $F271 is rotated left (RLC). When the high bit
; rotates into carry, it triggers a decrement of the countdown timer
; at $F264. When the timer reaches zero, the score effect ends:
; ENTITY_ARRAY is set to 1 and UPDATE_SCORE is disabled.
;
; B iterations of this routine produce the animated score flash.
;
FORMAT_SCORE:
	push bc			;f262  ; Save outer loop counter
	ld hl,00000h		;f263  ; HL = $0000 (base offset, self-modified at $F264)
	ld de,050a5h		;f266  ; DE = $50A5 (screen address: score area)
	add hl,de			;f269  ; HL = $50A5 + offset (effective screen address)
	push hl			;f26a  ; Save upper row address
	ld de,00020h		;f26b  ; DE = $20 (32 bytes = one character row)
	add hl,de			;f26e  ; HL = lower row address (upper + 32)
	pop de			;f26f  ; DE = upper row address (restored)
	ld c,000h		;f270  ; C = $00 (XOR mask byte, self-modified at $F271)
	ld b,008h		;f272  ; B = 8 pixel rows per character cell
lf274h:
	ld a,(hl)			;f274  ; A = pixel byte from lower row
lf275h:
	xor c			;f275  ; XOR with mask
	ld (hl),a			;f276  ; Write back to lower row
lf277h:
	ld a,(de)			;f277  ; A = pixel byte from upper row
	xor c			;f278  ; XOR with mask
	ld (de),a			;f279  ; Write back to upper row
lf27ah:
	inc h			;f27a  ; Next pixel row in lower char (H+1 = next screen line)
	inc d			;f27b  ; Next pixel row in upper char
	djnz lf274h		;f27c  ; Loop for all 8 pixel rows

; --- Check score effect timing ---
	ld hl,0f271h		;f27e  ; HL -> XOR mask control byte
	rlc (hl)		;f281  ; Rotate left: bit 7 -> carry, bits shift up
	jr nc,lf296h		;f283  ; If no carry (bit 7 was 0), continue outer loop

; --- Carry set: decrement countdown timer ---
	ld hl,0f264h		;f285  ; HL -> score countdown timer
	dec (hl)			;f288  ; Decrement timer
	jr nz,lf296h		;f289  ; If timer not zero, continue outer loop

; --- Timer expired: disable score display ---
	pop bc			;f28b  ; Clean up stack (discard saved BC from outer loop)
	ld a,001h		;f28c  ; A = 1
	ld (ENTITY_ARRAY),a		;f28e  ; Set ENTITY_ARRAY = 1 (signal completion)
	dec a			;f291  ; A = 0
	ld (UPDATE_SCORE+1),a		;f292  ; Patch UPDATE_SCORE: LD A,$00 (disable)
	ret			;f295  ; Return (score effect complete)

; --- Continue outer FORMAT_SCORE loop ---
lf296h:
	pop bc			;f296  ; Restore outer loop counter
	djnz FORMAT_SCORE		;f297  ; Decrement B, loop if not zero
	ret			;f299  ; All iterations complete

; ==========================================================================
; MISSION COMPLETE SEQUENCE ($F29A)
; ==========================================================================
; Called when the player completes a mission (jumped to from
; code_interaction.asm at $B49D). Displays the congratulations
; screen, checks for high score, and optionally shows the
; "ultimate ninja" message on the final level.
;
; Sequence:
;   1. Set up font data for text rendering
;   2. Delay loop (~60000 iterations) for dramatic pause
;   3. Show mission briefing screen
;   4. Check if player's score qualifies for high score table
;   5. If score too low, jump to main menu (lec1eh)
;   6. Display "CONGRATULATIONS" / mission complete messages
;   7. If level 9 (final), show "ultimate ninja" text
;
lf29ah:
	call FONT_DATA		;f29a  ; Set up font/tile data pointer
	ld bc,lea60h		;f29d  ; BC = $EA60 = 60000 (delay counter)

; --- Delay loop ---
; Simple busy-wait with inner NOP-equivalent loop.
; Total delay: ~60000 * 7 cycles = dramatic pause before results.
;
lf2a0h:
	dec bc			;f2a0  ; Decrement outer counter
	ld a,006h		;f2a1  ; A = 6 (inner delay loop count)
lf2a3h:
	dec a			;f2a3  ; Inner delay: decrement A
	jr nz,lf2a3h		;f2a4  ; Loop 6 times (waste ~30 T-states)
	ld a,b			;f2a6  ; Check if BC == 0
	or c			;f2a7  ; (B OR C == 0 means done)
	jr nz,lf2a0h		;f2a8  ; If not zero, continue delay loop

; --- Show mission briefing and check score ---
	call MISSION_BRIEFING		;f2aa  ; Display mission results screen
	ld a,(l74dbh)		;f2ad  ; A = current mission/difficulty selector
	dec a			;f2b0  ; Test if mission 1 (dec to check zero)
	ld a,(STASH_ITEM_TYPE)		;f2b1  ; A = collected stash item type
	jr z,lf2b9h		;f2b4  ; If mission 1, use stash item type as score index
	ld a,(STASH_SEARCH_IDX)		;f2b6  ; Otherwise use stash search index

; --- Compare score with high score table threshold ---
lf2b9h:
	ld hl,lb55fh		;f2b9  ; HL -> high score threshold value
	cp (hl)			;f2bc  ; Compare player's score index with threshold
	jp c,lec1eh		;f2bd  ; If below threshold, skip to main menu

; --- Display congratulations screen ---
	call FONT_DATA		;f2c0  ; Set up font data (1st call)
	call FONT_DATA		;f2c3  ; Set up font data (2nd call, ensure ready)
	ld de,05061h		;f2c6  ; DE = screen addr: bottom area, col 1
	ld hl,lf35fh		;f2c9  ; HL -> "TOTAL" text tile data (5 bytes)
	ld c,005h		;f2cc  ; C = 5 tiles
	call PRINT_TILE		;f2ce  ; Draw "TOTAL" label

; --- Draw main congratulations message ---
; "CONGRATULATIONS" / "YOU HAVE COMPLETED" / "YOUR ASSIGNED MISSION"
; Each line is drawn at successive screen rows.
;
	ld hl,lf3c7h		;f2d1  ; HL -> "CONGRATULATIONS" tile data
	ld de,04043h		;f2d4  ; DE = screen addr: top area, row 2, col 3
	ld c,00fh		;f2d7  ; C = 15 tiles ("CONGRATULATIONS")
	call PRINT_TILE		;f2d9  ; Draw congratulations header
	ld de,040a1h		;f2dc  ; DE = screen addr: top area, row 5, col 1
	ld c,012h		;f2df  ; C = 18 tiles ("YOU HAVE COMPLETED")
	call PRINT_TILE		;f2e1  ; Draw second line
	ld de,040e0h		;f2e4  ; DE = screen addr: top area, row 7, col 0
	ld c,015h		;f2e7  ; C = 21 tiles ("YOUR ASSIGNED MISSION")
	call PRINT_TILE		;f2e9  ; Draw third line

; --- Check for final level (level 9) ---
; If the player is on the ultimate difficulty, show the special
; "ninja master" congratulations text.
;
	ld a,(ledaeh)		;f2ec  ; A = current difficulty/level value
	cp 009h		;f2ef  ; Is it level 9 (final/ultimate)?
	jr nz,lf364h		;f2f1  ; If not level 9, skip to normal flow

; --- Display "ultimate ninja" special message ---
; "YOU HAVE REACHED THE ULTIMATE LEVEL"
; "YOU HAVE MASTERED THE ART OF NINJITSU"
;
	ld hl,lf319h		;f2f3  ; HL -> "YOU HAVE REACHED" tile data
	ld de,04822h		;f2f6  ; DE = screen addr: middle area, row 1, col 2
	ld c,010h		;f2f9  ; C = 16 tiles
	call PRINT_TILE		;f2fb  ; Draw "YOU HAVE REACHED" line
	ld de,04861h		;f2fe  ; DE = screen addr: middle area, row 3, col 1
	ld c,012h		;f301  ; C = 18 tiles ("THE ULTIMATE LEVEL")
	call PRINT_TILE		;f303  ; Draw continuation
	ld de,048c2h		;f306  ; DE = screen addr: middle area, row 6, col 2
	ld c,011h		;f309  ; C = 17 tiles ("YOU HAVE MASTERED")
	defb 0cdh		;f30b  ; $CD = CALL opcode (instruction crosses file boundary)
