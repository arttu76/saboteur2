; ======================================================================
; data_missions.asm
; ======================================================================
;
; Mission Definitions & Briefing Text
;
; Address range: 6F0Ch - 730Bh (1024 bytes)
; Source binary: block7_main.bin (loaded at 620Ch)
;
; 9 mission definitions (RIN through ZEN) with briefing text.
; Each mission has: 3-letter code, belt rank number, name,
; description text, and configuration bytes.
; Includes mixed code fragments for mission display logic.
;
; ======================================================================

b2_end:

; BLOCK 'b3' (start 0x6f0c end 0x700c)
b3_start:
; --- 128 zero bytes ---
	defb 000h		;6f0c
	defb 000h		;6f0d
	defb 000h		;6f0e
	defb 000h		;6f0f
	defb 000h		;6f10
	defb 000h		;6f11
	defb 000h		;6f12
	defb 000h		;6f13
	defb 000h		;6f14
	defb 000h		;6f15
	defb 000h		;6f16
	defb 000h		;6f17
	defb 000h		;6f18
	defb 000h		;6f19
	defb 000h		;6f1a
	defb 000h		;6f1b
	defb 000h		;6f1c
	defb 000h		;6f1d
	defb 000h		;6f1e
	defb 000h		;6f1f
	defb 000h		;6f20
	defb 000h		;6f21
	defb 000h		;6f22
	defb 000h		;6f23
	defb 000h		;6f24
	defb 000h		;6f25
	defb 000h		;6f26
	defb 000h		;6f27
	defb 000h		;6f28
	defb 000h		;6f29
	defb 000h		;6f2a
	defb 000h		;6f2b
	defb 000h		;6f2c
	defb 000h		;6f2d
	defb 000h		;6f2e
	defb 000h		;6f2f
	defb 000h		;6f30
	defb 000h		;6f31
	defb 000h		;6f32
	defb 000h		;6f33
	defb 000h		;6f34
	defb 000h		;6f35
	defb 000h		;6f36
	defb 000h		;6f37
	defb 000h		;6f38
	defb 000h		;6f39
	defb 000h		;6f3a
	defb 000h		;6f3b
	defb 000h		;6f3c
	defb 000h		;6f3d
	defb 000h		;6f3e
	defb 000h		;6f3f
	defb 000h		;6f40
	defb 000h		;6f41
	defb 000h		;6f42
	defb 000h		;6f43
	defb 000h		;6f44
	defb 000h		;6f45
	defb 000h		;6f46
	defb 000h		;6f47
	defb 000h		;6f48
	defb 000h		;6f49
	defb 000h		;6f4a
	defb 000h		;6f4b
	defb 000h		;6f4c
	defb 000h		;6f4d
	defb 000h		;6f4e
	defb 000h		;6f4f
	defb 000h		;6f50
	defb 000h		;6f51
	defb 000h		;6f52
	defb 000h		;6f53
	defb 000h		;6f54
	defb 000h		;6f55
	defb 000h		;6f56
	defb 000h		;6f57
	defb 000h		;6f58
	defb 000h		;6f59
	defb 000h		;6f5a
	defb 000h		;6f5b
	defb 000h		;6f5c
	defb 000h		;6f5d
	defb 000h		;6f5e
	defb 000h		;6f5f
	defb 000h		;6f60
	defb 000h		;6f61
	defb 000h		;6f62
	defb 000h		;6f63
	defb 000h		;6f64
	defb 000h		;6f65
	defb 000h		;6f66
	defb 000h		;6f67
	defb 000h		;6f68
	defb 000h		;6f69
	defb 000h		;6f6a
	defb 000h		;6f6b
	defb 000h		;6f6c
	defb 000h		;6f6d
	defb 000h		;6f6e
	defb 000h		;6f6f
	defb 000h		;6f70
	defb 000h		;6f71
	defb 000h		;6f72
	defb 000h		;6f73
	defb 000h		;6f74
	defb 000h		;6f75
	defb 000h		;6f76
	defb 000h		;6f77
	defb 000h		;6f78
	defb 000h		;6f79
	defb 000h		;6f7a
	defb 000h		;6f7b
	defb 000h		;6f7c
	defb 000h		;6f7d
	defb 000h		;6f7e
	defb 000h		;6f7f
	defb 000h		;6f80
	defb 000h		;6f81
	defb 000h		;6f82
	defb 000h		;6f83
	defb 000h		;6f84
	defb 000h		;6f85
	defb 000h		;6f86
	defb 000h		;6f87
	defb 000h		;6f88
	defb 000h		;6f89
	defb 000h		;6f8a
	defb 000h		;6f8b
; "?<881000#   !   "
	defb 03fh		;6f8c  '?'
	defb 03ch		;6f8d  '<'
	defb 038h		;6f8e  '8'
	defb 038h		;6f8f  '8'
	defb 031h		;6f90  '1'
	defb 030h		;6f91  '0'
	defb 030h		;6f92  '0'
	defb 030h		;6f93  '0'
	defb 023h		;6f94  '#'
	defb 020h		;6f95  ' '
	defb 020h		;6f96  ' '
	defb 020h		;6f97  ' '
	defb 021h		;6f98  '!'
	defb 020h		;6f99  ' '
	defb 020h		;6f9a  ' '
	defb 020h		;6f9b  ' '
	defb 007h		;6f9c
	defb 004h		;6f9d
	defb 000h		;6f9e
	defb 000h		;6f9f
	defb 001h		;6fa0
	defb 000h		;6fa1
	defb 000h		;6fa2
	defb 000h		;6fa3
	defb 003h		;6fa4
	defb 000h		;6fa5
	defb 000h		;6fa6
	defb 000h		;6fa7
	defb 001h		;6fa8
	defb 000h		;6fa9
	defb 000h		;6faa
	defb 000h		;6fab
	defb 00fh		;6fac
	defb 00ch		;6fad
	defb 008h		;6fae
	defb 008h		;6faf
	defb 001h		;6fb0
	defb 000h		;6fb1
	defb 000h		;6fb2
	defb 000h		;6fb3
	defb 003h		;6fb4
	defb 000h		;6fb5
	defb 000h		;6fb6
	defb 000h		;6fb7
	defb 001h		;6fb8
	defb 000h		;6fb9
	defb 000h		;6fba
	defb 000h		;6fbb
	defb 007h		;6fbc
	defb 004h		;6fbd
	defb 000h		;6fbe
	defb 000h		;6fbf
	defb 001h		;6fc0
	defb 000h		;6fc1
	defb 000h		;6fc2
	defb 000h		;6fc3
	defb 003h		;6fc4
	defb 000h		;6fc5
	defb 000h		;6fc6
	defb 000h		;6fc7
	defb 001h		;6fc8
	defb 000h		;6fc9
	defb 000h		;6fca
	defb 000h		;6fcb
	defb 01fh		;6fcc
	defb 01ch		;6fcd
	defb 018h		;6fce
	defb 018h		;6fcf
	defb 011h		;6fd0
	defb 010h		;6fd1
	defb 010h		;6fd2
	defb 010h		;6fd3
	defb 003h		;6fd4
	defb 000h		;6fd5
	defb 000h		;6fd6
	defb 000h		;6fd7
	defb 001h		;6fd8
	defb 000h		;6fd9
	defb 000h		;6fda
	defb 000h		;6fdb
	defb 007h		;6fdc
	defb 004h		;6fdd
	defb 000h		;6fde
	defb 000h		;6fdf
	defb 001h		;6fe0
	defb 000h		;6fe1
	defb 000h		;6fe2
	defb 000h		;6fe3
	defb 003h		;6fe4
	defb 000h		;6fe5
	defb 000h		;6fe6
	defb 000h		;6fe7
	defb 001h		;6fe8
	defb 000h		;6fe9
	defb 000h		;6fea
	defb 000h		;6feb
	defb 00fh		;6fec
	defb 00ch		;6fed
	defb 008h		;6fee
	defb 008h		;6fef
	defb 001h		;6ff0
	defb 000h		;6ff1
	defb 000h		;6ff2
	defb 000h		;6ff3
	defb 003h		;6ff4
	defb 000h		;6ff5
	defb 000h		;6ff6
	defb 000h		;6ff7
	defb 001h		;6ff8
	defb 000h		;6ff9
	defb 000h		;6ffa
	defb 000h		;6ffb
	defb 007h		;6ffc
	defb 004h		;6ffd
	defb 000h		;6ffe
	defb 000h		;6fff
	defb 001h		;7000
	defb 000h		;7001
	defb 000h		;7002
	defb 000h		;7003
	defb 003h		;7004
	defb 000h		;7005
	defb 000h		;7006
	defb 000h		;7007
	defb 001h		;7008
	defb 000h		;7009
	defb 000h		;700a
	defb 000h		;700b
b3_end:

; BLOCK 'b4' (start 0x700c end 0x710c)
b4_start:
	rst 38h			;700c
	call m,sub_f8f8h		;700d
	pop af			;7010
	ret p			;7011
	ret p			;7012
	ret p			;7013
	ex (sp),hl			;7014
	ret po			;7015
	ret po			;7016
	ret po			;7017
	pop hl			;7018
	ret po			;7019
	ret po			;701a
	ret po			;701b
	rst 0			;701c
	call nz,sub_c0c0h		;701d
	pop bc			;7020
	ret nz			;7021
	ret nz			;7022
	ret nz			;7023
	jp sub_c0c0h		;7024
	ret nz			;7027
	pop bc			;7028
	ret nz			;7029
	ret nz			;702a
	ret nz			;702b
	adc a,a			;702c
	adc a,h			;702d
	adc a,b			;702e
	adc a,b			;702f
	add a,c			;7030
	add a,b			;7031
	add a,b			;7032
	add a,b			;7033
	add a,e			;7034
	add a,b			;7035
	add a,b			;7036
	add a,b			;7037
	add a,c			;7038
	add a,b			;7039
	add a,b			;703a
	add a,b			;703b
	add a,a			;703c
	add a,h			;703d
	add a,b			;703e
	add a,b			;703f
	add a,c			;7040
	add a,b			;7041
	add a,b			;7042
	add a,b			;7043
	add a,e			;7044
	add a,b			;7045
	add a,b			;7046
	add a,b			;7047
	add a,c			;7048
	add a,b			;7049
	add a,b			;704a
	add a,b			;704b
	rra			;704c
	inc e			;704d
	jr l7068h		;704e
	ld de,01010h		;7050
	djnz l7058h		;7053
	nop			;7055
	nop			;7056
	nop			;7057
l7058h:
	ld bc,00000h		;7058
	nop			;705b
	rlca			;705c
	inc b			;705d
	nop			;705e
	nop			;705f
	ld bc,00000h		;7060
	nop			;7063
	inc bc			;7064
	nop			;7065
	nop			;7066
	nop			;7067
l7068h:
	ld bc,00000h		;7068
	nop			;706b
	rrca			;706c
	inc c			;706d
	ex af,af'			;706e
	ex af,af'			;706f
	ld bc,00000h		;7070
	nop			;7073
	inc bc			;7074
	nop			;7075
	nop			;7076
	nop			;7077
	ld bc,00000h		;7078
	nop			;707b
	rlca			;707c
	inc b			;707d
	nop			;707e
	nop			;707f
	ld bc,00000h		;7080
	nop			;7083
	inc bc			;7084
	nop			;7085
	nop			;7086
	nop			;7087
	ld bc,00000h		;7088
	nop			;708b
TITLE_SCREEN:
	call MISSION_BRIEFING		;708c
	jp lecddh		;708f
TITLE_LOOP:
	ld bc,l7ffdh		;7092
	ld a,011h		;7095
	out (c),a		;7097
	jr z,l70a0h		;7099
	call SOUND_INIT		;709b
	jr l70a3h		;709e
l70a0h:
	call sub_f61eh		;70a0
l70a3h:
	ld bc,l7ffdh		;70a3
	ld a,010h		;70a6
	out (c),a		;70a8
	ret			;70aa
l70abh:
	ld d,b			;70ab
	ld d,d			;70ac
	ld b,l			;70ad
	ld d,e			;70ae
	ld d,e			;70af
	jr nz,l70f3h		;70b0
	ld c,(hl)			;70b2
	ld e,c			;70b3
	jr nz,l7101h		;70b4
	ld b,l			;70b6
	ld e,c			;70b7
	jr nz,l710eh		;70b8
	ld c,a			;70ba
	jr nz,l7100h		;70bb
	ld c,a			;70bd
	ld c,(hl)			;70be
	ld d,h			;70bf
	ld c,c			;70c0
	ld c,(hl)			;70c1
	ld d,l			;70c2
	ld b,l			;70c3
	ld d,d			;70c4
	ld c,c			;70c5
	ld c,(hl)			;70c6
	jr nz,l70e9h		;70c7
	add hl,sp			;70c9
	add hl,sp			;70ca
	add hl,sp			;70cb
	jr nz,l70eeh		;70cc
	ld d,e			;70ce
	ld d,h			;70cf
	ld d,d			;70d0
	ld b,l			;70d1
	ld c,(hl)			;70d2
	ld b,a			;70d3
	ld d,h			;70d4
	ld c,b			;70d5
	jr nz,l7127h		;70d6
	ld b,(hl)			;70d8
	jr nz,l7128h		;70d9
	ld c,c			;70db
	ld c,(hl)			;70dc
	ld b,h			;70dd
	jr nz,l7121h		;70de
	ld c,(hl)			;70e0
	ld b,h			;70e1
	jr nz,l7126h		;70e2
	ld c,a			;70e4
	ld b,h			;70e5
	ld e,c			;70e6
	jr nz,l7109h		;70e7
l70e9h:
	jr nz,l711bh		;70e9
	jr nc,l70edh		;70eb
l70edh:
	nop			;70ed
l70eeh:
	rst 38h			;70ee
	rst 38h			;70ef
	ld c,e			;70f0
	ld e,c			;70f1
	ld c,a			;70f2
l70f3h:
	jr nz,l7115h		;70f3
	add hl,sp			;70f5
	jr nc,l7129h		;70f6
	jr nz,l711ah		;70f8
	jr nz,l711ch		;70fa
	jr nz,l7142h		;70fc
	ld c,c			;70fe
	ld d,d			;70ff
l7100h:
	ld b,l			;7100
l7101h:
	ld b,e			;7101
	ld d,h			;7102
	ld c,c			;7103
	ld c,a			;7104
	ld c,(hl)			;7105
	jr nz,l7157h		;7106
	ld b,(hl)			;7108
l7109h:
	jr nz,l7150h		;7109
	ld c,(hl)			;710b
b4_end:

; BLOCK 'b5' (start 0x710c end 0x730c)
b5_start:
; "ERGY      00"
	defb 045h		;710c  'E'
	defb 052h		;710d  'R'
l710eh:
	defb 047h		;710e  'G'
	defb 059h		;710f  'Y'
	defb 020h		;7110  ' '
	defb 020h		;7111  ' '
	defb 020h		;7112  ' '
	defb 020h		;7113  ' '
	defb 020h		;7114  ' '
l7115h:
	defb 020h		;7115  ' '
	defb 030h		;7116  '0'
	defb 030h		;7117  '0'
	defb 000h		;7118
	defb 000h		;7119
l711ah:
	defb 0ffh		;711a
l711bh:
	defb 0feh		;711b
l711ch:
; "TOH  801   HARMONY WITH THE UNIVERSE  02"
	defb 054h		;711c  'T'
	defb 04fh		;711d  'O'
	defb 048h		;711e  'H'
	defb 020h		;711f  ' '
	defb 020h		;7120  ' '
l7121h:
	defb 038h		;7121  '8'
	defb 030h		;7122  '0'
	defb 031h		;7123  '1'
	defb 020h		;7124  ' '
	defb 020h		;7125  ' '
l7126h:
	defb 020h		;7126  ' '
l7127h:
	defb 048h		;7127  'H'
l7128h:
	defb 041h		;7128  'A'
l7129h:
	defb 052h		;7129  'R'
	defb 04dh		;712a  'M'
	defb 04fh		;712b  'O'
	defb 04eh		;712c  'N'
	defb 059h		;712d  'Y'
	defb 020h		;712e  ' '
	defb 057h		;712f  'W'
	defb 049h		;7130  'I'
	defb 054h		;7131  'T'
	defb 048h		;7132  'H'
	defb 020h		;7133  ' '
	defb 054h		;7134  'T'
	defb 048h		;7135  'H'
	defb 045h		;7136  'E'
	defb 020h		;7137  ' '
	defb 055h		;7138  'U'
	defb 04eh		;7139  'N'
	defb 049h		;713a  'I'
	defb 056h		;713b  'V'
	defb 045h		;713c  'E'
	defb 052h		;713d  'R'
	defb 053h		;713e  'S'
	defb 045h		;713f  'E'
	defb 020h		;7140  ' '
	defb 020h		;7141  ' '
l7142h:
	defb 030h		;7142  '0'
	defb 032h		;7143  '2'
	defb 002h		;7144
	defb 000h		;7145
	defb 0ffh		;7146
	defb 0ffh		;7147
; "SHA  751  HEALING OF SELF AND OTHERS  05"
	defb 053h		;7148  'S'
	defb 048h		;7149  'H'
	defb 041h		;714a  'A'
	defb 020h		;714b  ' '
	defb 020h		;714c  ' '
	defb 037h		;714d  '7'
	defb 035h		;714e  '5'
	defb 031h		;714f  '1'
l7150h:
	defb 020h		;7150  ' '
	defb 020h		;7151  ' '
	defb 048h		;7152  'H'
	defb 045h		;7153  'E'
	defb 041h		;7154  'A'
	defb 04ch		;7155  'L'
	defb 049h		;7156  'I'
l7157h:
	defb 04eh		;7157  'N'
	defb 047h		;7158  'G'
	defb 020h		;7159  ' '
	defb 04fh		;715a  'O'
	defb 046h		;715b  'F'
	defb 020h		;715c  ' '
	defb 053h		;715d  'S'
	defb 045h		;715e  'E'
	defb 04ch		;715f  'L'
	defb 046h		;7160  'F'
	defb 020h		;7161  ' '
	defb 041h		;7162  'A'
	defb 04eh		;7163  'N'
	defb 044h		;7164  'D'
	defb 020h		;7165  ' '
	defb 04fh		;7166  'O'
	defb 054h		;7167  'T'
	defb 048h		;7168  'H'
	defb 045h		;7169  'E'
	defb 052h		;716a  'R'
	defb 053h		;716b  'S'
	defb 020h		;716c  ' '
	defb 020h		;716d  ' '
	defb 030h		;716e  '0'
	defb 035h		;716f  '5'
	defb 005h		;7170
	defb 000h		;7171
	defb 0eeh		;7172
	defb 0ffh		;7173
; "KAI  701    PREMONITION OF DANGER     07"
	defb 04bh		;7174  'K'
	defb 041h		;7175  'A'
	defb 049h		;7176  'I'
	defb 020h		;7177  ' '
	defb 020h		;7178  ' '
	defb 037h		;7179  '7'
	defb 030h		;717a  '0'
	defb 031h		;717b  '1'
	defb 020h		;717c  ' '
	defb 020h		;717d  ' '
	defb 020h		;717e  ' '
	defb 020h		;717f  ' '
	defb 050h		;7180  'P'
	defb 052h		;7181  'R'
	defb 045h		;7182  'E'
	defb 04dh		;7183  'M'
	defb 04fh		;7184  'O'
	defb 04eh		;7185  'N'
	defb 049h		;7186  'I'
	defb 054h		;7187  'T'
	defb 049h		;7188  'I'
	defb 04fh		;7189  'O'
	defb 04eh		;718a  'N'
	defb 020h		;718b  ' '
	defb 04fh		;718c  'O'
	defb 046h		;718d  'F'
	defb 020h		;718e  ' '
	defb 044h		;718f  'D'
	defb 041h		;7190  'A'
	defb 04eh		;7191  'N'
	defb 047h		;7192  'G'
	defb 045h		;7193  'E'
	defb 052h		;7194  'R'
	defb 020h		;7195  ' '
	defb 020h		;7196  ' '
	defb 020h		;7197  ' '
	defb 020h		;7198  ' '
	defb 020h		;7199  ' '
	defb 030h		;719a  '0'
	defb 037h		;719b  '7'
	defb 007h		;719c
	defb 000h		;719d
	defb 0eeh		;719e
	defb 0ffh		;719f
; "JIN  651KNOWING THE THOUGHTS OF OTHERS09"
	defb 04ah		;71a0  'J'
	defb 049h		;71a1  'I'
	defb 04eh		;71a2  'N'
	defb 020h		;71a3  ' '
	defb 020h		;71a4  ' '
	defb 036h		;71a5  '6'
	defb 035h		;71a6  '5'
	defb 031h		;71a7  '1'
	defb 04bh		;71a8  'K'
	defb 04eh		;71a9  'N'
	defb 04fh		;71aa  'O'
	defb 057h		;71ab  'W'
	defb 049h		;71ac  'I'
	defb 04eh		;71ad  'N'
	defb 047h		;71ae  'G'
	defb 020h		;71af  ' '
	defb 054h		;71b0  'T'
	defb 048h		;71b1  'H'
	defb 045h		;71b2  'E'
	defb 020h		;71b3  ' '
	defb 054h		;71b4  'T'
	defb 048h		;71b5  'H'
	defb 04fh		;71b6  'O'
	defb 055h		;71b7  'U'
	defb 047h		;71b8  'G'
	defb 048h		;71b9  'H'
	defb 054h		;71ba  'T'
	defb 053h		;71bb  'S'
	defb 020h		;71bc  ' '
	defb 04fh		;71bd  'O'
	defb 046h		;71be  'F'
	defb 020h		;71bf  ' '
	defb 04fh		;71c0  'O'
	defb 054h		;71c1  'T'
	defb 048h		;71c2  'H'
	defb 045h		;71c3  'E'
	defb 052h		;71c4  'R'
	defb 053h		;71c5  'S'
	defb 030h		;71c6  '0'
	defb 039h		;71c7  '9'
	defb 009h		;71c8
	defb 001h		;71c9
	defb 0eeh		;71ca
	defb 0ffh		;71cb
; "RETSU601  MASTERY OF TIME AND SPACE   11"
	defb 052h		;71cc  'R'
	defb 045h		;71cd  'E'
	defb 054h		;71ce  'T'
	defb 053h		;71cf  'S'
	defb 055h		;71d0  'U'
	defb 036h		;71d1  '6'
	defb 030h		;71d2  '0'
	defb 031h		;71d3  '1'
	defb 020h		;71d4  ' '
	defb 020h		;71d5  ' '
	defb 04dh		;71d6  'M'
	defb 041h		;71d7  'A'
	defb 053h		;71d8  'S'
	defb 054h		;71d9  'T'
	defb 045h		;71da  'E'
	defb 052h		;71db  'R'
	defb 059h		;71dc  'Y'
	defb 020h		;71dd  ' '
	defb 04fh		;71de  'O'
	defb 046h		;71df  'F'
	defb 020h		;71e0  ' '
	defb 054h		;71e1  'T'
	defb 049h		;71e2  'I'
	defb 04dh		;71e3  'M'
	defb 045h		;71e4  'E'
	defb 020h		;71e5  ' '
	defb 041h		;71e6  'A'
	defb 04eh		;71e7  'N'
	defb 044h		;71e8  'D'
	defb 020h		;71e9  ' '
	defb 053h		;71ea  'S'
	defb 050h		;71eb  'P'
	defb 041h		;71ec  'A'
	defb 043h		;71ed  'C'
	defb 045h		;71ee  'E'
	defb 020h		;71ef  ' '
	defb 020h		;71f0  ' '
	defb 020h		;71f1  ' '
	defb 031h		;71f2  '1'
	defb 031h		;71f3  '1'
	defb 00bh		;71f4
	defb 001h		;71f5
	defb 0ffh		;71f6
	defb 0feh		;71f7
; "ZAI  551 CONTROL OF NATURES ELEMENTS  14"
	defb 05ah		;71f8  'Z'
	defb 041h		;71f9  'A'
	defb 049h		;71fa  'I'
	defb 020h		;71fb  ' '
	defb 020h		;71fc  ' '
	defb 035h		;71fd  '5'
	defb 035h		;71fe  '5'
	defb 031h		;71ff  '1'
	defb 020h		;7200  ' '
	defb 043h		;7201  'C'
	defb 04fh		;7202  'O'
	defb 04eh		;7203  'N'
	defb 054h		;7204  'T'
	defb 052h		;7205  'R'
	defb 04fh		;7206  'O'
	defb 04ch		;7207  'L'
	defb 020h		;7208  ' '
	defb 04fh		;7209  'O'
	defb 046h		;720a  'F'
	defb 020h		;720b  ' '
	defb 04eh		;720c  'N'
	defb 041h		;720d  'A'
	defb 054h		;720e  'T'
	defb 055h		;720f  'U'
	defb 052h		;7210  'R'
	defb 045h		;7211  'E'
	defb 053h		;7212  'S'
	defb 020h		;7213  ' '
	defb 045h		;7214  'E'
	defb 04ch		;7215  'L'
	defb 045h		;7216  'E'
	defb 04dh		;7217  'M'
	defb 045h		;7218  'E'
	defb 04eh		;7219  'N'
	defb 054h		;721a  'T'
	defb 053h		;721b  'S'
	defb 020h		;721c  ' '
	defb 020h		;721d  ' '
	defb 031h		;721e  '1'
	defb 034h		;721f  '4'
	defb 00eh		;7220
	defb 001h		;7221
	defb 0ffh		;7222
	defb 0ffh		;7223
; "ZEN  999        ENLIGHTENMENT         14"
	defb 05ah		;7224  'Z'
	defb 045h		;7225  'E'
	defb 04eh		;7226  'N'
	defb 020h		;7227  ' '
	defb 020h		;7228  ' '
	defb 039h		;7229  '9'
	defb 039h		;722a  '9'
	defb 039h		;722b  '9'
	defb 020h		;722c  ' '
	defb 020h		;722d  ' '
	defb 020h		;722e  ' '
	defb 020h		;722f  ' '
	defb 020h		;7230  ' '
	defb 020h		;7231  ' '
	defb 020h		;7232  ' '
	defb 020h		;7233  ' '
	defb 045h		;7234  'E'
	defb 04eh		;7235  'N'
	defb 04ch		;7236  'L'
	defb 049h		;7237  'I'
	defb 047h		;7238  'G'
	defb 048h		;7239  'H'
	defb 054h		;723a  'T'
	defb 045h		;723b  'E'
	defb 04eh		;723c  'N'
	defb 04dh		;723d  'M'
	defb 045h		;723e  'E'
	defb 04eh		;723f  'N'
	defb 054h		;7240  'T'
	defb 020h		;7241  ' '
	defb 020h		;7242  ' '
	defb 020h		;7243  ' '
	defb 020h		;7244  ' '
	defb 020h		;7245  ' '
	defb 020h		;7246  ' '
	defb 020h		;7247  ' '
	defb 020h		;7248  ' '
	defb 020h		;7249  ' '
	defb 031h		;724a  '1'
	defb 034h		;724b  '4'
	defb 00eh		;724c
	defb 001h		;724d
	defb 0eeh		;724e
	defb 0ffh		;724f
	defb 0c4h		;7250
	defb 070h		;7251  'p'
	defb 0f0h		;7252
	defb 070h		;7253  'p'
	defb 01ch		;7254
; "qHqtq"
	defb 071h		;7255  'q'
	defb 048h		;7256  'H'
	defb 071h		;7257  'q'
	defb 074h		;7258  't'
	defb 071h		;7259  'q'
	defb 0a0h		;725a
	defb 071h		;725b  'q'
	defb 0cch		;725c
	defb 071h		;725d  'q'
	defb 0f8h		;725e
; "q$rMISSION   BRIEFINGLEVEL 0KILL ENEMY GUARDSESCAPE FROM BUILDIN"
; "G VIA TUNNELS"#GOOD LUCK ON YOUR MISSIONPREPARE TO BEGINMISSION "
; ... (173 chars total)
	defb 071h		;725f  'q'
	defb 024h		;7260  '$'
	defb 072h		;7261  'r'
	defb 04dh		;7262  'M'
	defb 049h		;7263  'I'
	defb 053h		;7264  'S'
	defb 053h		;7265  'S'
	defb 049h		;7266  'I'
	defb 04fh		;7267  'O'
	defb 04eh		;7268  'N'
	defb 020h		;7269  ' '
	defb 020h		;726a  ' '
	defb 020h		;726b  ' '
	defb 042h		;726c  'B'
	defb 052h		;726d  'R'
	defb 049h		;726e  'I'
	defb 045h		;726f  'E'
	defb 046h		;7270  'F'
	defb 049h		;7271  'I'
	defb 04eh		;7272  'N'
	defb 047h		;7273  'G'
	defb 04ch		;7274  'L'
	defb 045h		;7275  'E'
	defb 056h		;7276  'V'
	defb 045h		;7277  'E'
	defb 04ch		;7278  'L'
	defb 020h		;7279  ' '
	defb 030h		;727a  '0'
l727bh:
	defb 04bh		;727b  'K'
	defb 049h		;727c  'I'
	defb 04ch		;727d  'L'
	defb 04ch		;727e  'L'
	defb 020h		;727f  ' '
	defb 045h		;7280  'E'
	defb 04eh		;7281  'N'
	defb 045h		;7282  'E'
	defb 04dh		;7283  'M'
	defb 059h		;7284  'Y'
	defb 020h		;7285  ' '
	defb 047h		;7286  'G'
	defb 055h		;7287  'U'
	defb 041h		;7288  'A'
	defb 052h		;7289  'R'
	defb 044h		;728a  'D'
	defb 053h		;728b  'S'
	defb 045h		;728c  'E'
	defb 053h		;728d  'S'
	defb 043h		;728e  'C'
	defb 041h		;728f  'A'
	defb 050h		;7290  'P'
	defb 045h		;7291  'E'
	defb 020h		;7292  ' '
	defb 046h		;7293  'F'
	defb 052h		;7294  'R'
	defb 04fh		;7295  'O'
	defb 04dh		;7296  'M'
	defb 020h		;7297  ' '
	defb 042h		;7298  'B'
	defb 055h		;7299  'U'
	defb 049h		;729a  'I'
	defb 04ch		;729b  'L'
	defb 044h		;729c  'D'
	defb 049h		;729d  'I'
	defb 04eh		;729e  'N'
	defb 047h		;729f  'G'
	defb 020h		;72a0  ' '
	defb 056h		;72a1  'V'
	defb 049h		;72a2  'I'
	defb 041h		;72a3  'A'
	defb 020h		;72a4  ' '
	defb 054h		;72a5  'T'
	defb 055h		;72a6  'U'
	defb 04eh		;72a7  'N'
	defb 04eh		;72a8  'N'
	defb 045h		;72a9  'E'
	defb 04ch		;72aa  'L'
	defb 053h		;72ab  'S'
	defb 022h		;72ac  '"'
	defb 023h		;72ad  '#'
	defb 047h		;72ae  'G'
	defb 04fh		;72af  'O'
	defb 04fh		;72b0  'O'
	defb 044h		;72b1  'D'
	defb 020h		;72b2  ' '
	defb 04ch		;72b3  'L'
	defb 055h		;72b4  'U'
	defb 043h		;72b5  'C'
	defb 04bh		;72b6  'K'
	defb 020h		;72b7  ' '
	defb 04fh		;72b8  'O'
	defb 04eh		;72b9  'N'
	defb 020h		;72ba  ' '
	defb 059h		;72bb  'Y'
	defb 04fh		;72bc  'O'
	defb 055h		;72bd  'U'
	defb 052h		;72be  'R'
	defb 020h		;72bf  ' '
	defb 04dh		;72c0  'M'
	defb 049h		;72c1  'I'
	defb 053h		;72c2  'S'
	defb 053h		;72c3  'S'
	defb 049h		;72c4  'I'
	defb 04fh		;72c5  'O'
	defb 04eh		;72c6  'N'
	defb 050h		;72c7  'P'
	defb 052h		;72c8  'R'
	defb 045h		;72c9  'E'
	defb 050h		;72ca  'P'
	defb 041h		;72cb  'A'
	defb 052h		;72cc  'R'
	defb 045h		;72cd  'E'
	defb 020h		;72ce  ' '
	defb 054h		;72cf  'T'
	defb 04fh		;72d0  'O'
	defb 020h		;72d1  ' '
	defb 042h		;72d2  'B'
	defb 045h		;72d3  'E'
	defb 047h		;72d4  'G'
	defb 049h		;72d5  'I'
	defb 04eh		;72d6  'N'
	defb 04dh		;72d7  'M'
	defb 049h		;72d8  'I'
	defb 053h		;72d9  'S'
	defb 053h		;72da  'S'
	defb 049h		;72db  'I'
	defb 04fh		;72dc  'O'
	defb 04eh		;72dd  'N'
	defb 020h		;72de  ' '
	defb 04eh		;72df  'N'
	defb 041h		;72e0  'A'
	defb 04dh		;72e1  'M'
	defb 045h		;72e2  'E'
	defb 020h		;72e3  ' '
	defb 027h		;72e4  "'"
	defb 020h		;72e5  ' '
	defb 043h		;72e6  'C'
	defb 04fh		;72e7  'O'
	defb 04ch		;72e8  'L'
	defb 04ch		;72e9  'L'
	defb 045h		;72ea  'E'
	defb 043h		;72eb  'C'
	defb 054h		;72ec  'T'
	defb 020h		;72ed  ' '
	defb 058h		;72ee  'X'
	defb 058h		;72ef  'X'
	defb 020h		;72f0  ' '
	defb 050h		;72f1  'P'
	defb 049h		;72f2  'I'
	defb 045h		;72f3  'E'
	defb 043h		;72f4  'C'
	defb 045h		;72f5  'E'
	defb 053h		;72f6  'S'
	defb 020h		;72f7  ' '
	defb 04fh		;72f8  'O'
	defb 046h		;72f9  'F'
	defb 020h		;72fa  ' '
	defb 050h		;72fb  'P'
	defb 041h		;72fc  'A'
	defb 050h		;72fd  'P'
	defb 045h		;72fe  'E'
	defb 052h		;72ff  'R'
	defb 020h		;7300  ' '
	defb 054h		;7301  'T'
	defb 041h		;7302  'A'
	defb 050h		;7303  'P'
	defb 045h		;7304  'E'
	defb 049h		;7305  'I'
	defb 04eh		;7306  'N'
	defb 053h		;7307  'S'
	defb 045h		;7308  'E'
	defb 052h		;7309  'R'
	defb 054h		;730a  'T'
	defb 020h		;730b  ' '
