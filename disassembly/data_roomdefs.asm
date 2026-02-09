; ======================================================================
; data_roomdefs.asm
; ======================================================================
;
; Room Definition Data, Tile Patterns & Map Configuration
;
; Address range: $CF0C-$D20B (768 bytes)
; Source binary: block7_main.bin (loaded at $620C)
;
; No executable code - all bytes are structured data records that the
; disassembler decodes as Z80 instructions. Contains:
;
;   $CF0C-$D023: Room/screen definition records
;                Structured entries with $FF terminators separating
;                groups. Contains tile coordinates, references to
;                addresses in the $65xx-$66xx range (room data tables),
;                and configuration parameters.
;
;   $D024-$D062: Fence/climbing tile pattern data
;                Referenced by code_interaction.asm fence climbing code
;                and code_roomrender.asm via IX register.
;                Tile codes: $D4=climbable fence, $D2/$D3=fence parts,
;                $D5=fence post, $08=transparent.
;
;   $D063-$D20B: Room layout template records
;                32-byte aligned records starting with $66 header byte.
;                Contains tile type codes, entity positions, and
;                room-specific configuration data.
;
; Key labels:
;   lcf82h ($CF82) - Room config parameter (written by code_roomrender.asm)
;   ld024h ($D024) - Fence tile pattern data (read by fence climbing code)
;
; Cross-references:
;   lcf82h written by: code_roomrender.asm ($7718)
;   ld024h read by: code_roomrender.asm ($7C37), code_interaction.asm
;                   ($B8BE, $B923) for fence climbing animations
;
; ======================================================================

b20_end:

; BLOCK 'b21' (start 0xcf0c end 0xd60c)
b21_start:

; ==========================================================================
; ROOM/SCREEN DEFINITION RECORDS ($CF0C-$D023)
; ==========================================================================
; Structured data entries defining room layouts, transitions, and tile
; configurations. $FF bytes act as group/section terminators.
; Many byte values reference room data tables in the $65xx-$66xx range.
;
	ld d,h			;cf0c
	ld h,h			;cf0d
	inc (hl)			;cf0e
	ld e,h			;cf0f
	rst 38h			;cf10
	ld (bc),a			;cf11
	inc b			;cf12
	ld b,0fah		;cf13
	ld c,h			;cf15
	ld h,h			;cf16
	ld (bc),a			;cf17
	inc b			;cf18
	inc bc			;cf19
	jp m,l662ch		;cf1a
	nop			;cf1d
	dec e			;cf1e
	call m,l662fh		;cf1f
	ld hl,03103h		;cf22
	ld h,(hl)			;cf25
	rst 38h			;cf26
	ld (bc),a			;cf27
	dec b			;cf28
	ld b,0fah		;cf29
	ld c,h			;cf2b
	ld h,h			;cf2c
	ld (bc),a			;cf2d
	dec b			;cf2e
	add hl,bc			;cf2f
	ex af,af'			;cf30
	inc c			;cf31
	ld h,l			;cf32
	ld (bc),a			;cf33
	dec b			;cf34
	inc bc			;cf35
	jp m,l662ch		;cf36
	nop			;cf39
	inc e			;cf3a
	call m,sub_6630h		;cf3b
	inc sp			;cf3e
	inc (hl)			;cf3f
	rst 38h			;cf40
	ld hl,l6510h		;cf41
	ld h,h			;cf44
	nop			;cf45
	ld b,b			;cf46
	call m,sub_664ch		;cf47
	ld h,055h		;cf4a
	ld d,(hl)			;cf4c
	ld h,d			;cf4d
	rst 38h			;cf4e
	add hl,bc			;cf4f
	djnz lcf62h		;cf50
	djnz lcf6ah		;cf52
	djnz lcf66h		;cf54
	djnz lcf68h		;cf56
	dec d			;cf58
	dec d			;cf59
	dec d			;cf5a
	dec d			;cf5b
	inc de			;cf5c
	ld bc,00809h		;cf5d
	dec hl			;cf60
	ld h,l			;cf61
lcf62h:
	ld sp,lff67h		;cf62
	add hl,bc			;cf65
lcf66h:
	djnz $+18		;cf66
lcf68h:
	djnz $+18		;cf68
lcf6ah:
	djnz $+18		;cf6a
	djnz lcf7eh		;cf6c
	dec d			;cf6e
	dec d			;cf6f
	dec d			;cf70
	dec d			;cf71
	inc de			;cf72
	rst 38h			;cf73
	add hl,bc			;cf74
	djnz lcf87h		;cf75
	djnz lcf89h		;cf77
	djnz lcf8bh		;cf79
	djnz lcf8dh		;cf7b
	dec d			;cf7d
lcf7eh:
	dec d			;cf7e
	dec d			;cf7f
	dec d			;cf80
	inc de			;cf81
lcf82h:
	ld bc,lc80ch		;cf82
	or h			;cf85
	ld h,h			;cf86
lcf87h:
	rst 38h			;cf87
	add hl,bc			;cf88
lcf89h:
	djnz $+18		;cf89
lcf8bh:
	djnz $+18		;cf8b
lcf8dh:
	djnz $+18		;cf8d
	djnz $+18		;cf8f
	djnz $+18		;cf91
	djnz lcfadh		;cf93
	inc de			;cf95
	rst 38h			;cf96
	add hl,bc			;cf97
	djnz lcfaah		;cf98
	djnz lcfb3h		;cf9a
	djnz lcfaeh		;cf9c
	djnz lcfb7h		;cf9e
	djnz lcfb2h		;cfa0
	djnz $+25		;cfa2
	inc de			;cfa4
	rst 38h			;cfa5
	inc bc			;cfa6
	ld bc,00113h		;cfa7
lcfaah:
	inc c			;cfaa
	ld (bc),a			;cfab
	ld e,c			;cfac
lcfadh:
	ld h,h			;cfad
lcfaeh:
	ld bc,0020ch		;cfae
	ld e,e			;cfb1
lcfb2h:
	ld h,h			;cfb2
lcfb3h:
	ld bc,00204h		;cfb3
	ld e,d			;cfb6
lcfb7h:
	ld h,l			;cfb7
	nop			;cfb8
	ld de,ld6f2h		;cfb9
	ld h,l			;cfbc
	nop			;cfbd
	dec b			;cfbe
	rlca			;cfbf
	rst 20h			;cfc0
	ld h,l			;cfc1
	ld bc,00205h		;cfc2
	ret m			;cfc5
	ld h,l			;cfc6
	ld bc,00205h		;cfc7
	inc bc			;cfca
	ld h,(hl)			;cfcb
	ex af,af'			;cfcc
	ld b,0ddh		;cfcd
	ld h,l			;cfcf
	rst 38h			;cfd0
	add hl,bc			;cfd1
	ld (de),a			;cfd2
	djnz lcfe5h		;cfd3
	djnz lcfeah		;cfd5
	djnz lcfe9h		;cfd7
	djnz lcfefh		;cfd9
	djnz lcfedh		;cfdb
	djnz lcff2h		;cfdd
	nop			;cfdf
	dec e			;cfe0
	cp 02fh		;cfe1
	ld h,(hl)			;cfe3
	nop			;cfe4
lcfe5h:
	ld h,b			;cfe5
	jp m,l662ch		;cfe6
lcfe9h:
	nop			;cfe9
lcfeah:
	ld c,0f2h		;cfea
	dec (hl)			;cfec
lcfedh:
	ld h,(hl)			;cfed
	nop			;cfee
lcfefh:
	ld a,(bc)			;cfef
	ex af,af'			;cff0
	ld (hl),a			;cff1
lcff2h:
	ld h,(hl)			;cff2
	nop			;cff3
	ld a,(bc)			;cff4
	ex af,af'			;cff5
	ld d,a			;cff6
	ld h,(hl)			;cff7
	ld c,003h		;cff8
	dec sp			;cffa
	ld h,(hl)			;cffb
	rst 38h			;cffc
	add hl,bc			;cffd
	rrca			;cffe
	rrca			;cfff
	rrca			;d000
	rrca			;d001
	nop			;d002
	nop			;d003
	nop			;d004
	nop			;d005
	ld bc,00101h		;d006
	ld bc,lff2dh		;d009
	add hl,bc			;d00c
	rrca			;d00d
	rrca			;d00e
	rrca			;d00f
	rrca			;d010
	nop			;d011
	nop			;d012
	nop			;d013
	nop			;d014
	ld bc,00101h		;d015
	ld bc,000ffh		;d018
	jr nz,$-2		;d01b
	call pe,03a65h		;d01d
	dec a			;d020
	ld h,h			;d021
	ld h,l			;d022
	rst 38h			;d023
; ==========================================================================
; FENCE TILE PATTERN DATA ($D024-$D062)
; ==========================================================================
; Tile codes used by the fence climbing animation in code_interaction.asm.
; Referenced via IX (code_roomrender.asm $7C37) and DE (code_interaction.asm
; $B8BE, $B923). Contains fence part tiles, transparent gaps, and
; fill patterns for drawing/clearing fence structures.
;
; Tile codes used:
;   $D4 = climbable fence    $D2/$D3 = fence parts (left/right)
;   $D5 = fence post         $08 = transparent/background
;   $00 = empty              $F4/$F6/$F8 = fence detail patterns
;
ld024h:
	call nc,sub_d2d2h		;d024
	out (0d3h),a		;d027
	push de			;d029
	ex af,af'			;d02a
	ex af,af'			;d02b
	call nc,008d5h		;d02c
	ex af,af'			;d02f
	nop			;d030
	call p,sub_f600h		;d031
	ret m			;d034
	push af			;d035
	ei			;d036
	ei			;d037
	ei			;d038
	ei			;d039
	ei			;d03a
	ei			;d03b
	nop			;d03c
	nop			;d03d
	nop			;d03e
	nop			;d03f
	nop			;d040
	nop			;d041
	nop			;d042
	ld h,h			;d043
	ld h,l			;d044
	inc de			;d045
	nop			;d046
	nop			;d047
	nop			;d048
	nop			;d049
	adc a,b			;d04a
	nop			;d04b
	nop			;d04c
	ld h,h			;d04d
	inc de			;d04e
	nop			;d04f
	nop			;d050
	nop			;d051
	nop			;d052
	nop			;d053
	nop			;d054
	nop			;d055
	nop			;d056
	nop			;d057
	nop			;d058
	nop			;d059
	nop			;d05a
	nop			;d05b
	nop			;d05c
	nop			;d05d
	nop			;d05e
	nop			;d05f
	nop			;d060
	nop			;d061
	nop			;d062
; ==========================================================================
; ROOM LAYOUT TEMPLATE RECORDS ($D063-$D20B)
; ==========================================================================
; 32-byte aligned data records, each starting with $66 header byte.
; Each record defines a room's tile composition: non-zero bytes are
; tile type codes, $00 padding fills unused slots. Multiple records
; define different room templates used during map generation.
;
	ld h,(hl)			;d063  ; $66 = record header
	ld a,c			;d064
	ld (de),a			;d065
	nop			;d066
	ld a,a			;d067
	ld h,l			;d068
	ex af,af'			;d069
	add a,a			;d06a
	nop			;d06b
	adc a,e			;d06c
	adc a,h			;d06d
	ld (de),a			;d06e
	nop			;d06f
	nop			;d070
	nop			;d071
	nop			;d072
	nop			;d073
	nop			;d074
	nop			;d075
	nop			;d076
	nop			;d077
	nop			;d078
	nop			;d079
	nop			;d07a
	nop			;d07b
	nop			;d07c
	nop			;d07d
	nop			;d07e
	nop			;d07f
	nop			;d080
	nop			;d081
	nop			;d082
	ld h,(hl)			;d083
	ld a,b			;d084
	ld a,d			;d085
	ld a,l			;d086
	ld a,(hl)			;d087
	add a,c			;d088
	add a,d			;d089
	add a,(hl)			;d08a
	adc a,c			;d08b
	adc a,d			;d08c
	adc a,l			;d08d
	ld de,00000h		;d08e
	nop			;d091
	nop			;d092
	nop			;d093
	nop			;d094
	nop			;d095
	nop			;d096
	nop			;d097
	nop			;d098
	nop			;d099
	nop			;d09a
	nop			;d09b
	nop			;d09c
	nop			;d09d
	nop			;d09e
	nop			;d09f
	nop			;d0a0
	nop			;d0a1
	nop			;d0a2
	ld h,(hl)			;d0a3
	ld (hl),a			;d0a4
	ld a,e			;d0a5
	ld a,h			;d0a6
	add a,b			;d0a7
	add a,e			;d0a8
	add a,h			;d0a9
	add a,l			;d0aa
	sub e			;d0ab
	sub b			;d0ac
	adc a,(hl)			;d0ad
	djnz ld0b7h		;d0ae
	rlca			;d0b0
	rlca			;d0b1
	rlca			;d0b2
	rlca			;d0b3
	ld b,000h		;d0b4
	nop			;d0b6
ld0b7h:
	nop			;d0b7
	nop			;d0b8
	nop			;d0b9
	nop			;d0ba
	nop			;d0bb
	nop			;d0bc
	nop			;d0bd
	nop			;d0be
	nop			;d0bf
	nop			;d0c0
	nop			;d0c1
	nop			;d0c2
	ld h,(hl)			;d0c3
	halt			;d0c4
	ld (hl),c			;d0c5
	sbc a,h			;d0c6
	and d			;d0c7
	and e			;d0c8
	and h			;d0c9
	and l			;d0ca
	sub h			;d0cb
	sub c			;d0cc
	adc a,a			;d0cd
	ld de,00000h		;d0ce
	nop			;d0d1
	nop			;d0d2
	nop			;d0d3
	dec b			;d0d4
	nop			;d0d5
	nop			;d0d6
	nop			;d0d7
	nop			;d0d8
	nop			;d0d9
	nop			;d0da
	nop			;d0db
	nop			;d0dc
	nop			;d0dd
	nop			;d0de
	nop			;d0df
	nop			;d0e0
	pop af			;d0e1
	rlca			;d0e2
	ld h,a			;d0e3
	ld (hl),l			;d0e4
	sbc a,l			;d0e5
	and c			;d0e6
	ld a,(lbea7h)		;d0e7
	and (hl)			;d0ea
	sub l			;d0eb
	sub d			;d0ec
	ld bc,00012h		;d0ed
	nop			;d0f0
	nop			;d0f1
	nop			;d0f2
	ld a,(bc)			;d0f3
	inc b			;d0f4
	ex af,af'			;d0f5
	dec bc			;d0f6
	inc de			;d0f7
	nop			;d0f8
	nop			;d0f9
	nop			;d0fa
	nop			;d0fb
	nop			;d0fc
	nop			;d0fd
	nop			;d0fe
	nop			;d0ff
	nop			;d100
	dec b			;d101
	nop			;d102
	ld l,b			;d103
	ld (hl),h			;d104
	sbc a,(hl)			;d105
	and b			;d106
	dec sp			;d107
	out (082h),a		;d108
	sbc a,b			;d10a
	sub (hl)			;d10b
	sub a			;d10c
	sbc a,e			;d10d
	ld d,000h		;d10e
	nop			;d110
	dec c			;d111
	inc c			;d112
	add hl,bc			;d113
	ld bc,00302h		;d114
	add hl,sp			;d117
	inc de			;d118
	nop			;d119
	nop			;d11a
	nop			;d11b
	nop			;d11c
	nop			;d11d
	nop			;d11e
	nop			;d11f
	nop			;d120
	dec b			;d121
	nop			;d122
	ld h,(hl)			;d123
	ld (hl),e			;d124
	sbc a,a			;d125
	ld (hl),b			;d126
	dec sp			;d127
	jp nc,09971h		;d128
	sbc a,d			;d12b
	ex de,hl			;d12c
	call nc,00012h		;d12d
	nop			;d130
	rla			;d131
	ld d,d			;d132
	ld d,l			;d133
	ld (hl),c			;d134
	ld h,c			;d135
	dec a			;d136
	ld c,h			;d137
	ld de,00000h		;d138
	nop			;d13b
	nop			;d13c
	nop			;d13d
	nop			;d13e
	ccf			;d13f
	ex af,af'			;d140
	inc b			;d141
	inc de			;d142
	ld h,(hl)			;d143
	ld (hl),d			;d144
	ld (hl),c			;d145
	ld (hl),b			;d146
	dec sp			;d147
	ret pe			;d148
	cp (hl)			;d149
	or h			;d14a
	ret nz			;d14b
	cp (hl)			;d14c
	push de			;d14d
	ld de,00000h		;d14e
	jr ld1a6h		;d151
	dec de			;d153
	push af			;d154
	ld h,d			;d155
	ld a,04dh		;d156
	ld de,00000h		;d158
	nop			;d15b
	nop			;d15c
	nop			;d15d
	nop			;d15e
	ld b,b			;d15f
	ld b,(hl)			;d160
	ld b,a			;d161
	ld de,l6d69h		;d162
	ld l,(hl)			;d165
	ld l,a			;d166
	dec sp			;d167
	jp nc,09f55h		;d168
	ld (hl),c			;d16b
	sbc a,a			;d16c
	sub 012h		;d16d
	nop			;d16f
	nop			;d170
	add hl,de			;d171
	ld a,(de)			;d172
	ld d,(hl)			;d173
	ld e,b			;d174
	ld h,e			;d175
	ld d,c			;d176
	ld c,(hl)			;d177
	ld de,00000h		;d178
	nop			;d17b
	nop			;d17c
	nop			;d17d
	nop			;d17e
	ld b,b			;d17f
	ld b,l			;d180
	ld b,h			;d181
	dec d			;d182
	rrca			;d183
	ld l,d			;d184
	ld l,e			;d185
	ld l,h			;d186
	dec sp			;d187
	ret pe			;d188
	or h			;d189
	cp (hl)			;d18a
	ret nz			;d18b
	or h			;d18c
	pop de			;d18d
	dec d			;d18e
	rrca			;d18f
	ld c,014h		;d190
	ld d,h			;d192
	ld e,c			;d193
	ld e,d			;d194
	ld d,b			;d195
	ld d,b			;d196
	ld c,a			;d197
	dec d			;d198
	inc l			;d199
	nop			;d19a
	nop			;d19b
	nop			;d19c
	nop			;d19d
	nop			;d19e
	ld b,b			;d19f
	ld b,d			;d1a0
	ld b,e			;d1a1
	ld bc,lda01h		;d1a2
	exx			;d1a5
ld1a6h:
	ret c			;d1a6
	dec sp			;d1a7
	pop hl			;d1a8
	ld (hl),c			;d1a9
	sbc a,h			;d1aa
	sbc a,a			;d1ab
	ld d,l			;d1ac
	call po,00101h		;d1ad
	ld bc,05701h		;d1b0
	ld e,e			;d1b3
	ld e,h			;d1b4
	ld c,h			;d1b5
	ld bc,00101h		;d1b6
	jr c,ld1e7h		;d1b9
	nop			;d1bb
	nop			;d1bc
	nop			;d1bd
	rst 28h			;d1be
	ld b,c			;d1bf
	ld c,b			;d1c0
	ld bc,02101h		;d1c1
	jp pe,ld7b4h		;d1c4
	dec sp			;d1c7
	jp po,ldfe0h		;d1c8
	ret po			;d1cb
	ex (sp),hl			;d1cc
	push hl			;d1cd
	ld bc,02a21h		;d1ce
	jr z,$+60		;d1d1
	ld e,l			;d1d3
	ld e,(hl)			;d1d4
	ld e,a			;d1d5
	ld e,(hl)			;d1d6
	ld h,b			;d1d7
	inc hl			;d1d8
	ld e,02dh		;d1d9
	nop			;d1db
	nop			;d1dc
	nop			;d1dd
	ret p			;d1de
	ld bc,00101h		;d1df
	ld bc,lda1ch		;d1e2
	exx			;d1e5
	ret c			;d1e6
ld1e7h:
	dec sp			;d1e7
	jp po,ldfe7h		;d1e8
	ret po			;d1eb
	rst 20h			;d1ec
	and 001h		;d1ed
	inc e			;d1ef
	ld bc,03b01h		;d1f0
	ld hl,0221dh		;d1f3
	dec e			;d1f6
	inc hl			;d1f7
	dec h			;d1f8
	ld bc,0002dh		;d1f9
	nop			;d1fc
	nop			;d1fd
	ret p			;d1fe
	ld bc,02a21h		;d1ff
	dec e			;d202
	ld (lc0eah),hl		;d203
	rst 10h			;d206
	inc a			;d207
	cp a			;d208
	ret nz			;d209
	pop bc			;d20a
	jp nz,lcac9h		;d20b
