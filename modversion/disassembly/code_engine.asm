; ======================================================================
; code_engine.asm
; ======================================================================
;
; Main Game Engine (Mostly NEW)
;
; Address range: $B80C-$E0DF (10452 bytes)
; Source binary: mod_decompressed.bin (loaded at $620C)
;
; The bulk of the game engine: object management, entity behavior,
; interaction code, score/render routines, room rendering, main
; game loop, and beeper sound effects.
; Extensively rewritten with bug fixes, improved game balance,
; speed control (CS+S), pause (CS+P), and beeper sound calls.
;
; ======================================================================

input_end:

; ==========================================================================
; TILE DEFINITION TABLE ($B80C-$B86B)
; ==========================================================================
; 96 bytes of tile/entity configuration data. These are NOT executable
; instructions — z80dasm misinterpreted them because no block definitions
; were provided for this data region. Each group of bytes defines tile
; rendering properties (colors, attributes, offsets).
;
engine_start:
	inc e			;b80c  ; DATA: tile config bytes
	pop bc			;b80d
	inc e			;b80e
	pop bc			;b80f
	inc e			;b810
	jr nz,lb794h		;b811
	rst 38h			;b813
	add a,c			;b814
lb815h:
	add a,c			;b815
	add a,c			;b816
	add a,c			;b817
	add a,c			;b818
	add a,c			;b819
	jr nc,$+1		;b81a
	ret c			;b81c
	xor b			;b81d
	ret c			;b81e
	rst 38h			;b81f
	adc a,d			;b820
lb821h:
	adc a,d			;b821
	adc a,d			;b822
	jr nc,$+1		;b823
	nop			;b825
	nop			;b826
	nop			;b827
	rst 38h			;b828
	xor d			;b829
	xor d			;b82a
	xor d			;b82b
	jr nc,$+1		;b82c
	dec d			;b82e
	dec de			;b82f
	dec d			;b830
	rst 38h			;b831
	or c			;b832
	or c			;b833
	or c			;b834
	jr nc,lb7c1h		;b835
	adc a,d			;b837
	adc a,a			;b838
	xor b			;b839
	xor b			;b83a
	adc a,b			;b83b
	adc a,a			;b83c
	adc a,d			;b83d
	jr nc,lb7eah		;b83e
	xor d			;b840
	rst 38h			;b841
	nop			;b842
	nop			;b843
	nop			;b844
	rst 38h			;b845
	xor d			;b846
	jr nc,$-77		;b847
	or c			;b849
	pop af			;b84a
	dec d			;b84b
	dec d			;b84c
	ld de,lb1f1h		;b84d
	jr nc,lb7dch		;b850
	adc a,d			;b852
	adc a,d			;b853
	adc a,a			;b854
	xor b			;b855
	xor b			;b856
	adc a,b			;b857
	rst 38h			;b858
	jr nc,lb805h		;b859
	xor d			;b85b
	xor d			;b85c
	rst 38h			;b85d
	nop			;b85e
	nop			;b85f
	nop			;b860
	rst 38h			;b861
	jr nc,lb815h		;b862
	or c			;b864
	or c			;b865
	pop af			;b866
	dec d			;b867
	dec d			;b868
	ld de,030ffh		;b869
; ==========================================================================
; DATA: Layer Data Pointers (self-modifying storage)
; ==========================================================================
; These 2-byte variables hold the current position in each rendering
; layer's data stream. They are updated as tiles are processed.
;
	nop			;b86c  ; Layer 1 pointer (low byte)
	nop			;b86d  ; Layer 1 pointer (high byte)
	nop			;b86e  ; Layer 2 pointer (low byte)
	nop			;b86f  ; Layer 2 pointer (high byte)
	nop			;b870  ; Layer 3 pointer (low byte)
	nop			;b871  ; Layer 3 pointer (high byte)
	nop			;b872  ; Layer 4 pointer (low byte)
	nop			;b873  ; Layer 4 pointer (high byte)
lb874h:
	jr nz,lb874h		;b874
	cp 0ffh		;b876
	rst 38h			;b878
	cp 0f8h		;b879
	cp 0fch		;b87b
	inc c			;b87d
	exx			;b87e
	xor d			;b87f
	ld d,l			;b880
	xor d			;b881
	exx			;b882
	xor d			;b883
	exx			;b884
	jp m,00020h		;b885
	nop			;b888
	nop			;b889
	add a,b			;b88a
	ld d,b			;b88b
	ret pe			;b88c
	push af			;b88d
	jp pe,00020h		;b88e
	nop			;b891
	nop			;b892
	nop			;b893
	nop			;b894
	nop			;b895
	ld bc,0203eh		;b896
	cp 0feh		;b899
	call m,sub_fefeh		;b89b
	ret m			;b89e
	call m,00cc0h		;b89f
	rst 20h			;b8a2
	pop af			;b8a3
	ld a,a			;b8a4
	ccf			;b8a5
	nop			;b8a6
	nop			;b8a7
	nop			;b8a8
	nop			;b8a9
	ld a,(bc)			;b8aa
	rst 20h			;b8ab
	rst 38h			;b8ac
	rst 38h			;b8ad
	rst 38h			;b8ae
	nop			;b8af
	nop			;b8b0
	nop			;b8b1
	nop			;b8b2
	ld a,(bc)			;b8b3
	pop af			;b8b4
	rst 38h			;b8b5
	rst 38h			;b8b6
	call m,00000h		;b8b7
	nop			;b8ba
	nop			;b8bb
	ld a,(bc)			;b8bc
	nop			;b8bd  ; DATA: $00 = RNG seed byte 0 (entity AI random state)
	nop			;b8be  ; DATA: $00 = RNG seed byte 1 (alternate animation)
	nop			;b8bf  ; DATA: $00 = active combatant type (0=none, 1=guard, 2=alt)
	nop			;b8c0  ; DATA: 2-byte pointer to entity behavior tile data
	nop			;b8c1
	nop			;b8c2  ; DATA: 2-byte alternate behavior pointer (swapped by flip)
	inc bc			;b8c3
	ld a,a			;b8c4
	ld c,000h		;b8c5
	nop			;b8c7
	nop			;b8c8
	nop			;b8c9
	nop			;b8ca
	rra			;b8cb
	rst 38h			;b8cc
	rst 38h			;b8cd
	ld c,000h		;b8ce
	nop			;b8d0
	nop			;b8d1
	rlca			;b8d2
	rst 38h			;b8d3
	rst 38h			;b8d4
	rst 38h			;b8d5
	rst 38h			;b8d6
	ld c,000h		;b8d7
	nop			;b8d9
	rra			;b8da
	rst 38h			;b8db
	rst 38h			;b8dc
	rst 38h			;b8dd
	rst 38h			;b8de
	rst 38h			;b8df
	ld c,001h		;b8e0
	ld a,a			;b8e2
	rst 38h			;b8e3
	rst 38h			;b8e4
	rst 38h			;b8e5
	rst 38h			;b8e6
	rst 38h			;b8e7
	rst 38h			;b8e8
	ld c,0f8h		;b8e9
	call m,sub_fefeh		;b8eb
	rst 38h			;b8ee
	rst 38h			;b8ef
	rst 38h			;b8f0
	ret nz			;b8f1
	ld c,000h		;b8f2
	nop			;b8f4
	nop			;b8f5
	nop			;b8f6
	nop			;b8f7
	rra			;b8f8
	ld a,a			;b8f9
	rst 38h			;b8fa
	ld c,000h		;b8fb
	nop			;b8fd
	nop			;b8fe
	rlca			;b8ff
	rst 38h			;b900
	rst 38h			;b901
	rst 38h			;b902
	add a,b			;b903
	ld c,000h		;b904
	ld bc,lff3fh		;b906
	rst 38h			;b909
	rst 38h			;b90a
	add a,b			;b90b
	ld a,a			;b90c
	ld c,00fh		;b90d
	rst 38h			;b90f
	rst 38h			;b910
	rst 38h			;b911
	rst 38h			;b912
	add a,b			;b913
	ld d,l			;b914
	rst 38h			;b915
	ld b,0ffh		;b916
	rst 38h			;b918
	rst 38h			;b919
	rst 38h			;b91a
	ret nz			;b91b
	xor d			;b91c
	ld d,l			;b91d
	rst 38h			;b91e
	ld b,0ffh		;b91f
	rst 38h			;b921
	rst 38h			;b922
	ret po			;b923
	dec d			;b924
	xor d			;b925
	ld d,a			;b926
	rst 38h			;b927
	ld b,0ffh		;b928
	rst 38h			;b92a
	ret p			;b92b
	ld a,(bc)			;b92c
	ld d,l			;b92d
	xor d			;b92e
	rst 38h			;b92f
	rst 38h			;b930
	ld b,0ffh		;b931
	ret po			;b933
	dec d			;b934
	xor d			;b935
	ld d,l			;b936
	xor d			;b937
	rst 38h			;b938
	rst 38h			;b939
	ld b,0e4h		;b93a
	inc c			;b93c
	ld d,h			;b93d
	xor h			;b93e
	ld d,(hl)			;b93f
	cp (hl)			;b940
	rst 38h			;b941
	rst 38h			;b942
	ld b,070h		;b943
	rrca			;b945
	ld bc,00000h		;b946
	nop			;b949
	nop			;b94a
	nop			;b94b
	ld c,000h		;b94c
	rst 38h			;b94e
	ret p			;b94f
	rrca			;b950
	nop			;b951
	nop			;b952
	nop			;b953
	nop			;b954
	ld c,000h		;b955
	rst 38h			;b957
	dec b			;b958
	rst 38h			;b959
	ccf			;b95a
	nop			;b95b
	nop			;b95c
	nop			;b95d
	ld c,000h		;b95e
	rst 38h			;b960
	ld d,l			;b961
	rst 38h			;b962
	rst 38h			;b963
	rst 38h			;b964
	inc bc			;b965
	nop			;b966
	ld c,000h		;b967
	cp a			;b969
	dec b			;b96a
	ld hl,(l6f6fh)		;b96b
	ld d,a			;b96e
	nop			;b96f
	ld c,000h		;b970
	rst 38h			;b972
	ld d,l			;b973
	xor d			;b974
	push de			;b975
	rst 38h			;b976
	rst 38h			;b977
	rst 38h			;b978
	ld b,000h		;b979
	rst 38h			;b97b
	ld d,l			;b97c
	xor d			;b97d
	ld d,l			;b97e
	jp m,0ffffh		;b97f
	ld b,000h		;b982
	rst 38h			;b984
	ld d,l			;b985
	xor d			;b986
	ld d,(hl)			;b987
	xor h			;b988
	call p,006feh		;b989
	nop			;b98c
	rst 38h			;b98d
	nop			;b98e
	nop			;b98f
	nop			;b990
	nop			;b991
	nop			;b992
	nop			;b993
	ld c,040h		;b994
	ret po			;b996
; ==========================================================================
; DATA: Screen Line Buffer ($A0AF)
; ==========================================================================
; Temporary buffer holding the 8 composited pixel bytes + 1 attribute
; byte for the tile currently being rendered. All compositing layers
; write their results here before the final copy to screen memory.
;
	nop			;b997  ; Pixel row 0
	nop			;b998  ; Pixel row 1
	nop			;b999  ; Pixel row 2
	nop			;b99a  ; Pixel row 3
	nop			;b99b  ; Pixel row 4
	nop			;b99c  ; Pixel row 5
	ld c,004h		;b99d
	ex af,af'			;b99f
	ex af,af'			;b9a0
	ld de,02131h		;b9a1
	ld (008b5h),hl		;b9a4
	xor b			;b9a7
	xor b			;b9a8
	and h			;b9a9
	inc d			;b9aa
	inc d			;b9ab
	ld (de),a			;b9ac
	dec b			;b9ad
	defb 0ddh,008h,0ffh	;illegal sequence		;b9ae
	ld bc,00000h		;b9b1
	nop			;b9b4
	nop			;b9b5
	nop			;b9b6
	nop			;b9b7
	ld c,0ffh		;b9b8
	rst 38h			;b9ba
	nop			;b9bb
	nop			;b9bc
	nop			;b9bd
	nop			;b9be
	nop			;b9bf
	nop			;b9c0
	ld c,0ffh		;b9c1
	nop			;b9c3
	ld c,d			;b9c4
	ld d,l			;b9c5
	ld c,d			;b9c6
	ld d,l			;b9c7
	ld c,d			;b9c8
	rst 38h			;b9c9
	dec b			;b9ca
	rst 38h			;b9cb
	ld b,0beh		;b9cc
	ld e,(hl)			;b9ce
	cp (hl)			;b9cf
	ld e,(hl)			;b9d0
	cp (hl)			;b9d1
	rst 38h			;b9d2
	rrca			;b9d3
	nop			;b9d4
	ld d,l			;b9d5
	ld c,d			;b9d6
	ld d,l			;b9d7
	ld c,d			;b9d8
	ld d,l			;b9d9
	rst 38h			;b9da
	nop			;b9db
	dec b			;b9dc
	ld b,05eh		;b9dd
	cp (hl)			;b9df
	ld e,(hl)			;b9e0
	cp (hl)			;b9e1
	ld e,(hl)			;b9e2
	rst 38h			;b9e3
	ld b,00fh		;b9e4
	ld c,d			;b9e6
	ld d,l			;b9e7
	ld c,d			;b9e8
	ld d,l			;b9e9
	ld c,d			;b9ea
	rst 38h			;b9eb
	nop			;b9ec
	ld d,l			;b9ed
	dec b			;b9ee
	cp (hl)			;b9ef
	ld e,(hl)			;b9f0
	cp (hl)			;b9f1
	ld e,(hl)			;b9f2
	cp (hl)			;b9f3
	rst 38h			;b9f4
	ld b,05eh		;b9f5
	rrca			;b9f7
	dec bc			;b9f8
	rrca			;b9f9
	rlca			;b9fa
	inc bc			;b9fb
	call m,sub_fdfdh		;b9fc
	ld a,e			;b9ff
	ld a,(bc)			;ba00
	ret m			;ba01
	cp 0ffh		;ba02
	rst 38h			;ba04
	rst 38h			;ba05
	ld a,a			;ba06
; ==========================================================================
; OBJECT RENDERING DATA ($BA07-$BD08)
; ==========================================================================
; Additional tile/object configuration data and rendering parameter
; tables. These bytes are NOT executable code — z80dasm misinterpreted
; them. Contains tile indices, attribute masks, sprite coordinates,
; and rendering command data for the room drawing engine.
;
lba07h:
	cp (hl)			;ba07  ; DATA: object config
	sbc a,a			;ba08
	ld a,(bc)			;ba09
	nop			;ba0a
	nop			;ba0b
	add a,b			;ba0c
	or 0f6h		;ba0d
	push af			;ba0f
	ld (hl),l			;ba10
	dec sp			;ba11
	ld (bc),a			;ba12
	rst 8			;ba13
	cp a			;ba14
	ld a,a			;ba15
	ld a,a			;ba16
	ld a,b			;ba17
	cp l			;ba18
	cp l			;ba19
	cp (hl)			;ba1a
	ex af,af'			;ba1b
	rst 38h			;ba1c
	rst 38h			;ba1d
	rst 38h			;ba1e
	add a,b			;ba1f
	nop			;ba20
	xor d			;ba21
sub_ba22h:
	push de			;ba22
	xor d			;ba23
	djnz lba65h		;ba24
	ld a,a			;ba26
	rst 38h			;ba27
	defb 0fdh,0aah,055h	;illegal sequence		;ba28
	xor h			;ba2b
	nop			;ba2c
	ld (bc),a			;ba2d
	rst 38h			;ba2e
	rst 38h			;ba2f
	rst 38h			;ba30
	ld a,a			;ba31
	cp a			;ba32
	jp 00000h		;ba33
	ld (bc),a			;ba36
	ret nz			;ba37
	ret po			;ba38
	ret pe			;ba39
lba3ah:
	ret pe			;ba3a
	ret po			;ba3b
	ret po			;ba3c
	sub b			;ba3d
	ld d,b			;ba3e
	ld a,(bc)			;ba3f
	rst 38h			;ba40
	ccf			;ba41
	rst 38h			;ba42
	rra			;ba43
	ld h,a			;ba44
	or c			;ba45
	xor l			;ba46
	xor b			;ba47
lba48h:
	jr z,lba3ah		;ba48
	ret nz			;ba4a
	add a,b			;ba4b
	nop			;ba4c
	nop			;ba4d
	xor d			;ba4e
	push de			;ba4f
	xor d			;ba50
	djnz lbab0h		;ba51
	ld c,b			;ba53
	xor h			;ba54
	sub h			;ba55
	ld d,h			;ba56
lba57h:
	ld l,d			;ba57
	xor d			;ba58
	sbc a,028h		;ba59
	sbc a,l			;ba5b
	sbc a,l			;ba5c
	xor (hl)			;ba5d
	xor (hl)			;ba5e
	or a			;ba5f
	rst 10h			;ba60
	rst 8			;ba61
	rst 28h			;ba62
	ld (bc),a			;ba63
	ld e,a			;ba64
lba65h:
	ld e,(hl)			;ba65
	xor (hl)			;ba66
	sub a			;ba67
	ld d,a			;ba68
	ld l,e			;ba69
	and a			;ba6a
	rst 8			;ba6b
	jr z,lba6eh		;ba6c
lba6eh:
	call m,sub_ed47h		;ba6e
	and l			;ba71
	xor c			;ba72
	ld d,a			;ba73
	ld a,d			;ba74
	jr z,lba48h		;ba75
	cp b			;ba77
	cp h			;ba78
	cp 0c1h		;ba79
	cp 0c0h		;ba7b
	xor d			;ba7d
	jr z,lba07h		;ba7e
	add a,a			;ba80
	ld b,e			;ba81
	inc a			;ba82
	ret po			;ba83
	nop			;ba84
	dec d			;ba85
	xor d			;ba86
	jr z,lba89h		;ba87
lba89h:
	ld c,035h		;ba89
	ld l,e			;ba8b
	ld l,a			;ba8c
	sbc a,035h		;ba8d
	cp d			;ba8f
lba90h:
	inc d			;ba90
	nop			;ba91
	sub 06fh		;ba92
	sbc a,06bh		;ba94
	cp d			;ba96
	ld l,a			;ba97
	ld l,e			;ba98
lba99h:
	inc d			;ba99
	nop			;ba9a
	call nc,sub_debah		;ba9b
	cp d			;ba9e
	ld l,a			;ba9f
	dec (hl)			;baa0
	sub 014h		;baa1
	rst 38h			;baa3
	add a,b			;baa4
	add a,b			;baa5
	sbc a,a			;baa6
	sbc a,b			;baa7
	sbc a,b			;baa8
	sbc a,b			;baa9
	sbc a,b			;baaa
	jr nc,$+1		;baab
	nop			;baad
	nop			;baae
	rst 38h			;baaf
lbab0h:
	nop			;bab0
	nop			;bab1
	nop			;bab2
	nop			;bab3
	jr nc,$+1		;bab4
	ld bc,lf901h		;bab6
	add hl,bc			;bab9
	add hl,bc			;baba
	add hl,bc			;babb
	add hl,bc			;babc
	jr nc,lba57h		;babd
	sbc a,b			;babf
	sbc a,a			;bac0
	sbc a,a			;bac1
	add a,b			;bac2
	add a,b			;bac3
	add a,b			;bac4
	rst 38h			;bac5
	jr nc,lbac8h		;bac6
lbac8h:
	nop			;bac8
	rst 38h			;bac9
	rst 38h			;baca
	nop			;bacb
	nop			;bacc
	nop			;bacd
	rst 38h			;bace
	jr nc,lbadah		;bacf
	add hl,bc			;bad1
	ld sp,hl			;bad2
	ld sp,hl			;bad3
	ld bc,00101h		;bad4
	rst 38h			;bad7
	jr nc,$+1		;bad8
lbadah:
	add a,b			;bada
	add a,b			;badb
	rst 38h			;badc
	add a,b			;badd
	add a,b			;bade
	add a,b			;badf
	add a,b			;bae0
	jr z,$+1		;bae1
	nop			;bae3
	nop			;bae4
	rst 38h			;bae5
	ld bc,00101h		;bae6
	ld bc,lff28h		;bae9
	nop			;baec
	nop			;baed
	rst 38h			;baee
	nop			;baef
	nop			;baf0
	nop			;baf1
	rst 38h			;baf2
	jr z,$+1		;baf3
	nop			;baf5
	nop			;baf6
	rst 38h			;baf7
	add a,b			;baf8
	add a,b			;baf9
	add a,b			;bafa
	add a,b			;bafb
	jr z,$+1		;bafc
	ld bc,lff01h		;bafe
	ld bc,00101h		;bb01
	ld bc,l8028h		;bb04
	add a,b			;bb07
	add a,b			;bb08
	add a,b			;bb09
	add a,b			;bb0a
	add a,b			;bb0b
	add a,b			;bb0c
	rst 38h			;bb0d
	jr z,$+3		;bb0e
	ld bc,00101h		;bb10
	ld bc,00101h		;bb13
	rst 38h			;bb16
	jr z,$+1		;bb17
	adc a,b			;bb19
	xor a			;bb1a
	adc a,b			;bb1b
	adc a,a			;bb1c
	xor b			;bb1d
	adc a,a			;bb1e
	rst 38h			;bb1f
	jr nc,$+1		;bb20
	ld de,011f5h		;bb22
	pop af			;bb25
	dec d			;bb26
	pop af			;bb27
	rst 38h			;bb28
	jr nc,$+1		;bb29
	rst 38h			;bb2b
	nop			;bb2c
	ld a,(hl)			;bb2d
	ld (bc),a			;bb2e
	ld (bc),a			;bb2f
	nop			;bb30
	rst 38h			;bb31
lbb32h:
	jr z,$+1		;bb32
	rst 38h			;bb34
	ld bc,005fdh		;bb35
	dec b			;bb38
	ld bc,028ffh		;bb39
	rst 38h			;bb3c
	rst 38h			;bb3d
	defb 0fdh,0ffh,0ffh	;illegal sequence		;bb3e
	rst 38h			;bb41
	rst 38h			;bb42
	cp a			;bb43
	ex af,af'			;bb44
	rla			;bb45
	dec hl			;bb46
	rla			;bb47
	dec hl			;bb48
	rla			;bb49
	dec hl			;bb4a
	rla			;bb4b
	dec hl			;bb4c
; ==========================================================================
; OBJECT DRAWING DISPATCH ($BB4D)
; ==========================================================================
; Jump table dispatch for room object rendering. Each entry sets up HL
; (screen position), DE (tile data source), BC (width x height) and
; jumps to the tile copy engine at lbdd0h. Objects include doors,
; ladders, windows, platforms, treasure stashes, lifts, etc.
;
	ld b,l			;bb4d
	ld hl,l88cah		;bb4e  ; Object screen position
	jr lbb5bh		;bb51
	ld hl,l88fbh		;bb53
	jr lbb5bh		;bb56
	ld hl,l88aah		;bb58
lbb5bh:
	ld de,l9ff4h		;bb5b
	ld a,0a4h		;bb5e
	ld (de),a			;bb60
	inc a			;bb61
	ld (l9ff5h),a		;bb62
	inc a			;bb65
	ld (l9ffah),a		;bb66
	inc a			;bb69
	ld (l9ffbh),a		;bb6a
	inc a			;bb6d
	ld (l9ffeh),a		;bb6e
	inc a			;bb71
	ld (l9ff8h),a		;bb72
	jr lbb82h		;bb75
	ld a,001h		;bb77
	ld (lf8edh),a		;bb79
	ld hl,l8818h		;bb7c
	ld de,l9e81h		;bb7f
lbb82h:
	ld bc,00606h		;bb82
	jp lbdd0h		;bb85
	ld hl,l87e5h		;bb88  ; Screen position variant A
	jr lbb9ah		;bb8b
	ld hl,l87d7h		;bb8d  ; Screen position variant B
	jr lbb9ah		;bb90
	ld hl,l87dch		;bb92  ; Screen position variant C
	jr lbb9ah		;bb95
	ld hl,l87e7h		;bb97  ; Screen position variant D
lbb9ah:
	ld a,(lefffh)		;bb9a  ; A = room state byte
	cp 00ch		;bb9d  ; Room >= 12?
	jp nc,lbde1h		;bb9f  ; Yes -> skip drawing (room out of range)
	ld de,l9e4bh		;bba2
	ld bc,00906h		;bba5
	jp lbdd0h		;bba8  ; -> tile copy engine
	ld hl,l88dch		;bbab  ; Room element screen addr
	jr lbbd6h		;bbae
	ld hl,l88e3h		;bbb0
	jr lbbd6h		;bbb3
	ld hl,l8901h		;bbb5
	jr lbbd6h		;bbb8
	ld hl,l88f6h		;bbba
	jr lbbd6h		;bbbd
	ld hl,l8943h		;bbbf
	jr lbbd6h		;bbc2
	ld hl,l893bh		;bbc4
	jr lbbd6h		;bbc7
	ld hl,l8925h		;bbc9
	jr lbbd6h		;bbcc
	ld hl,l8914h		;bbce
	jr lbbd6h		;bbd1
	ld hl,l88fdh		;bbd3
lbbd6h:
	ex de,hl			;bbd6
	ld hl,00000h		;bbd7
	ld (l9ffah),hl		;bbda
	ld (l9ffeh),hl		;bbdd
	ex de,hl			;bbe0
	ld de,l9ffah		;bbe1
	jp lbdcdh		;bbe4
	ld hl,l884ah		;bbe7
	ld de,l9fd0h		;bbea
	ld bc,00302h		;bbed
	jr lbc65h		;bbf0
	ld hl,l8b7eh		;bbf2
	jr lbbfah		;bbf5
	ld hl,l8b78h		;bbf7
lbbfah:
	ld de,la02ch		;bbfa
	jr lbc56h		;bbfd  ; -> 2x3 tile setup
	ld hl,l885ch		;bbff
	jr lbc16h		;bc02
	ld hl,l88ceh		;bc04
	jr lbc22h		;bc07
	ld hl,l88c2h		;bc09
	jr lbc16h		;bc0c
	ld hl,l88b6h		;bc0e
	jr lbc22h		;bc11
	ld hl,l88a8h		;bc13
lbc16h:
	ld a,017h		;bc16
	jr lbc24h		;bc18
	ld hl,l8869h		;bc1a
	jr lbc22h		;bc1d
	ld hl,l88b7h		;bc1f
lbc22h:
	ld a,05ch		;bc22
lbc24h:
	ld (l9f37h),a		;bc24
	ld de,l9f2ch		;bc27
	jp lbdedh		;bc2a
	ld hl,l893eh		;bc2d
	jr lbc53h		;bc30
	ld hl,l8942h		;bc32
	jr lbc53h		;bc35
	ld hl,l8945h		;bc37
	jr lbc53h		;bc3a
	ld hl,l8948h		;bc3c
	ld de,l9fbbh		;bc3f
	ld b,005h		;bc42
	jr lbc58h		;bc44
	ld hl,l885ch		;bc46
	ld de,l9fd6h		;bc49
	ld b,005h		;bc4c
	jr lbc58h		;bc4e
	ld hl,l891dh		;bc50
lbc53h:
	ld de,l9fcah		;bc53
lbc56h:
	ld b,002h		;bc56
lbc58h:
	ld c,003h		;bc58
	jr lbc65h		;bc5a
	ld hl,l88a1h		;bc5c
lbc5fh:
	ld de,l9f7ch		;bc5f
	ld bc,00709h		;bc62
lbc65h:
	jp lbdd0h		;bc65  ; -> tile copy engine at $7C96
	ld hl,l8aaeh		;bc68
	jr lbc75h		;bc6b
	ld hl,l8aa5h		;bc6d
	jr lbc75h		;bc70
	ld hl,l8a99h		;bc72
lbc75h:
	ld de,la06ah		;bc75
	ld bc,0050ah		;bc78
	jr lbc65h		;bc7b  ; -> tile copy engine
	ld hl,l8896h		;bc7d
	jr lbc5fh		;bc80
	ld hl,l88abh		;bc82
	jr lbc5fh		;bc85
	ld hl,lefffh		;bc87  ; HL -> room state byte
	ld a,05ch		;bc8a  ; A = $5C (92 decimal)
	sub (hl)			;bc8c  ; A = $5C - room_state (level number tile)
	ld (l6711h),a		;bc8d  ; Store computed level digit into text data
	ld de,l670ah		;bc90
	ld hl,l8ae5h		;bc93
lbc96h:
	ld b,009h		;bc96
lbc98h:
	call sub_d2efh		;bc98
	jp lbde1h		;bc9b
	ld de,l69ffh		;bc9e
	ld hl,l8a5fh		;bca1
	jr lbc96h		;bca4
	ld a,(leffeh)		;bca6
	cp 006h		;bca9
	jp nz,lbde1h		;bcab
	ld b,00ah		;bcae
	ld de,l69ech		;bcb0
	ld hl,l8a54h		;bcb3
	call sub_d2efh		;bcb6
	ld b,00ah		;bcb9
	ld de,l69f6h		;bcbb
	ld hl,l8a74h		;bcbe
	jr lbc98h		;bcc1
	ld de,l9ee1h		;bcc3
	ld hl,l88e0h		;bcc6
	jr lbc56h		;bcc9
	ld de,l9ee7h		;bccb
	ld hl,l88e9h		;bcce
	jr lbc56h		;bcd1
	ld de,l9eedh		;bcd3
	ld hl,l8941h		;bcd6
lbcd9h:
	ld b,003h		;bcd9
	jp lbc58h		;bcdb
	ld de,l9ef6h		;bcde
	ld hl,l8947h		;bce1
	jr lbcd9h		;bce4
	ld de,l9f26h		;bce6
	ld bc,00302h		;bce9
	jr lbd09h		;bcec
	ld de,l9f17h		;bcee
	ld bc,00503h		;bcf1
	jr lbd09h		;bcf4
	ld de,l9effh		;bcf6
lbcf9h:
	ld bc,00206h		;bcf9
	jr lbd09h		;bcfc
	ld de,l9f0bh		;bcfe
	jr lbcf9h		;bd01
	ld de,l9e39h		;bd03
	ld bc,00601h		;bd06
lbd09h:
; ==========================================================================
; SECONDARY TILE COPY ENGINE ($7C3F)
; ==========================================================================
; Similar to STATE_JUMP_TBL_2 but reads the screen address from the
; command data stream (2 bytes: low, high) and uses D for width
; instead of C. After copying, returns to the command interpreter.
;
; On entry:
;   Stack: command list position (popped to get screen addr)
;   IX = tile pattern data pointer
;   D  = width in tiles
;   B  = height in tiles
;
	pop hl			;bd09  ; Restore command list position
	ld a,(hl)			;bd0a  ; A = screen address low byte (from data)
	inc hl			;bd0b
	push hl			;bd0c  ; Save updated command list position
	ld h,(hl)			;bd0d  ; H = screen address high byte
	ld l,a			;bd0e  ; HL = screen destination address
	ld a,020h		;bd0f
	sub b			;bd11
lbd12h:
	push bc			;bd12
	ld c,b			;bd13
	ld b,000h		;bd14
	ex de,hl			;bd16
	ldir		;bd17
	ex de,hl			;bd19
	ld c,a			;bd1a
	add hl,bc			;bd1b
	pop bc			;bd1c
	dec c			;bd1d
	jr nz,lbd12h		;bd1e
	jp lc146h		;bd20
	ld hl,l8c05h		;bd23
	ld bc,l8c8ch		;bd26
	ld d,c			;bd29
	ld e,c			;bd2a
	jr lbd70h		;bd2b
	call sub_df18h		;bd2d
	ld de,la032h		;bd30
	ld hl,l8b88h		;bd33
	jr lbcd9h		;bd36
	ld a,012h		;bd38
	ld hl,l87b4h		;bd3a
	ld de,00f0eh		;bd3d
lbd40h:
	ld b,010h		;bd40
lbd42h:
	ld (hl),e			;bd42
	inc l			;bd43
	ld (hl),d			;bd44
	inc hl			;bd45
	djnz lbd42h		;bd46
	ld c,e			;bd48
	ld e,d			;bd49
	ld d,c			;bd4a
	dec a			;bd4b
	jr nz,lbd40h		;bd4c
	jp lbde1h		;bd4e
	pop hl			;bd51
	ld a,(hl)			;bd52
	push hl			;bd53
	ld hl,l87b4h		;bd54
	ld b,024h		;bd57
	call sub_d30eh		;bd59
	dec a			;bd5c
	jp nz,lc146h		;bd5d
	pop hl			;bd60
	inc hl			;bd61
	push hl			;bd62
	ld hl,l880dh		;bd63
	ld a,(hl)			;bd66
	dec a			;bd67
	jr nz,lbde1h		;bd68
	ld bc,01a1bh		;bd6a
	ld de,01c1dh		;bd6d
lbd70h:
	ld a,01fh		;bd70
	ld (hl),b			;bd72
	inc hl			;bd73
	ld (hl),c			;bd74
	add a,l			;bd75
	ld l,a			;bd76
	jr nc,lbd7ah		;bd77
	inc h			;bd79
lbd7ah:
	ld (hl),d			;bd7a
	inc hl			;bd7b
	ld (hl),e			;bd7c
	jr lbde1h		;bd7d
	ld hl,l894bh		;bd7f
	jr lbdbeh		;bd82
	ld hl,l892dh		;bd84
	jr lbdbeh		;bd87
	ld de,la018h		;bd89
	ld hl,l8aa7h		;bd8c
	ld bc,00504h		;bd8f
	jr lbdd0h		;bd92
	ld de,l9e3fh		;bd94
	ld hl,l8844h		;bd97
	ld bc,00304h		;bd9a
	jr lbdd0h		;bd9d
	ld hl,l881ah		;bd9f
	ld de,l9fe5h		;bda2
	ld bc,00305h		;bda5
	jr lbdd0h		;bda8
	ld a,0abh		;bdaa
	ld (l8957h),a		;bdac
	ld (l8966h),a		;bdaf
	dec a			;bdb2
	ld (l8977h),a		;bdb3
	ld (l8986h),a		;bdb6
	jr lbde1h		;bdb9
	ld hl,l88b5h		;bdbb
lbdbeh:
	ld de,l9ffah		;bdbe
	ld bc,042c6h		;bdc1
	ld (l9ffah),bc		;bdc4
	ld a,043h		;bdc8
	ld (l9ffeh),a		;bdca
lbdcdh:
	ld bc,00605h		;bdcd
lbdd0h:
	ld a,020h		;bdd0
	sub b			;bdd2
lbdd3h:
	push bc			;bdd3
	ex de,hl			;bdd4
	ld c,b			;bdd5
	ld b,000h		;bdd6
	ldir		;bdd8
	ex de,hl			;bdda
	ld c,a			;bddb
	add hl,bc			;bddc
	pop bc			;bddd
	dec c			;bdde
	jr nz,lbdd3h		;bddf
lbde1h:
	pop hl			;bde1
	dec hl			;bde2
	push hl			;bde3
	jp lc146h		;bde4
	ld de,l9f54h		;bde7
	ld hl,l88c8h		;bdea
lbdedh:
	ld bc,00508h		;bded
	jr lbdd0h		;bdf0
	ld hl,l8b3bh		;bdf2
	jr lbe37h		;bdf5
	ld hl,l8b7eh		;bdf7
	jr lbe2ch		;bdfa
	ld hl,l8a1bh		;bdfc
	jr lbe18h		;bdff
	ld hl,l8b15h		;be01
	jr lbe37h		;be04
	ld hl,l8a15h		;be06
	jr lbe18h		;be09
	ld hl,l8b03h		;be0b
	jr lbe37h		;be0e
	ld hl,l8af5h		;be10
	jr lbe37h		;be13
	ld hl,l8b07h		;be15
lbe18h:
	ld b,00ah		;be18
	ld de,la099h		;be1a
	jr lbe3ch		;be1d  ; -> 10x7 wide object
	ld hl,l8b06h		;be1f  ; Object screen position
	jr lbe37h		;be22  ; -> 11x7 standard object
	ld hl,l8af7h		;be24  ; Object screen position
	jr lbe37h		;be27  ; -> 11x7 standard object
	ld hl,l8b5dh		;be29  ; Object screen position
lbe2ch:
	ld bc,00804h		;be2c
	ld de,la03bh		;be2f
	jr lbdd0h		;be32
	ld hl,l8b1eh		;be34
lbe37h:
	ld b,00bh		;be37
	ld de,la0f7h		;be39
lbe3ch:
	ld c,007h		;be3c
	jr lbdd0h		;be3e
	ld de,la0dfh		;be40
	ld hl,l8b8ch		;be43
	ld bc,00604h		;be46
lbe49h:
	jr lbdd0h		;be49
	ld a,(lf8f3h)		;be4b
	inc a			;be4e
	jp nz,lbde1h		;be4f
	ld de,l9d46h		;be52
	ld hl,l8b40h		;be55
	ld bc,00b05h		;be58
	jr lbe49h		;be5b  ; -> draw via tile copy engine
	ld a,(lf8f3h)		;be5d  ; A = lift state counter
	cp 0feh		;be60  ; Is it $FE (transition state)?
	jr nz,lbe69h		;be62  ; No -> skip
	ld a,010h		;be64  ; A = $10 (16: restart countdown)
	ld (lf8f3h),a		;be66  ; Reset lift counter
lbe69h:
	jp lbde1h		;be69  ; -> return to command interpreter
	ld a,05ah		;be6c
	ld (lf8e0h),a		;be6e
	jr lbe69h		;be71
	ld hl,l8b58h		;be73
lbe76h:
	ld de,0fb80h		;be76
	ex de,hl			;be79
	add hl,de			;be7a
	ld (0c2e1h),hl		;be7b
	ex de,hl			;be7e
	ld de,la05bh		;be7f
	ld bc,00404h		;be82
	jr lbe49h		;be85
	ld hl,l8997h		;be87
lbe8ah:
	ld de,l9e3ah		;be8a
	ld bc,00501h		;be8d
	jr lbe49h		;be90  ; -> tile copy engine
	ld hl,l8984h		;be92  ; Object screen position
	jr lbe8ah		;be95  ; -> 11x7 standard object
	ld hl,l8b45h		;be97  ; Object screen position
	jr lbe76h		;be9a  ; -> 8x4 compact object
	ld hl,l88d5h		;be9c  ; Object screen position
	jr lbea9h		;be9f  ; -> 10x7 wide object
	ld hl,l8908h		;bea1  ; Object screen position
	jr lbea9h		;bea4  ; -> 11x7 standard object
	ld hl,l88c2h		;bea6  ; Object screen position
lbea9h:
	ld de,l9ffah		;bea9
	ld bc,04342h		;beac
	ld (l9ffah),bc		;beaf
	ld a,0c6h		;beb3
	ld (l9ffeh),a		;beb5
	jp lbdcdh		;beb8
	ld a,001h		;bebb  ; A = 1
	jr lbec5h		;bebd  ; -> store state
	ld a,002h		;bebf  ; A = 2
	jr lbec5h		;bec1  ; -> store state
	ld a,003h		;bec3  ; A = 3
lbec5h:
	ld (lf8f6h),a		;bec5  ; Store mission completion state
	jr lbe69h		;bec8  ; -> return to command interpreter
	ld a,008h		;beca
lbecch:
	call sub_df05h		;becc
	jr lbe69h		;becf
	ld a,010h		;bed1
	jr lbecch		;bed3
	pop hl			;bed5  ; Restore command list position
	ld a,(hl)			;bed6  ; A = value to write
	inc hl			;bed7  ; Skip to address low byte
	ld e,(hl)			;bed8  ; E = address low byte
	inc hl			;bed9
	ld d,(hl)			;beda  ; D = address high byte
	push hl			;bedb  ; Save command list position
	ld (de),a			;bedc  ; Write value to target address
	jp lc146h		;bedd  ; -> return to command interpreter
	ld a,0cah		;bee0  ; A = $CA (first byte)
	pop hl			;bee2  ; Restore command list position
	ld e,(hl)			;bee3  ; E = address low byte
	inc hl			;bee4
	ld d,(hl)			;bee5  ; D = address high byte
	push hl			;bee6  ; Save position
	ld (de),a			;bee7  ; Write $CA to target
	inc de			;bee8  ; Next target byte
	inc a			;bee9  ; A = $CB
	ld (de),a			;beea  ; Write $CB to target+1
	jp lc146h		;beeb  ; -> return to command interpreter
	pop hl			;beee
	ld c,(hl)			;beef
	inc hl			;bef0
	ld b,(hl)			;bef1
	inc hl			;bef2  ; Next field
	ld a,(hl)			;bef3  ; A = destination address low byte
	inc hl			;bef4  ; Next field
	push hl			;bef5  ; Save data pointer for return
	ld h,(hl)			;bef6  ; H = destination address high byte
	ld l,a			;bef7  ; HL = destination screen address
	ld d,h			;bef8
	ld e,l			;bef9
	inc de			;befa
	ld (hl),b			;befb
	ld b,000h		;befc
	dec c			;befe
lbeffh:
	ldir		;beff
	jp lc146h		;bf01
	ld hl,lbfddh		;bf04
	ex (sp),hl			;bf07
	ld e,021h		;bf08
	jr lbf12h		;bf0a
	ld e,01fh		;bf0c
	jr lbf12h		;bf0e
	ld e,020h		;bf10
lbf12h:
	ld d,000h		;bf12
	pop hl			;bf14  ; Restore command list position
	ld b,(hl)			;bf15  ; B = fill count
	inc hl			;bf16
	ld c,(hl)			;bf17  ; C = fill value (tile byte)
	inc hl			;bf18
	ld a,(hl)			;bf19  ; A = screen address low byte
	inc hl			;bf1a
	push hl			;bf1b  ; Save command list position
	ld h,(hl)			;bf1c  ; H = screen address high byte
	ld l,a			;bf1d  ; HL = screen destination address
lbf1eh:
	ld (hl),c			;bf1e  ; Write fill byte to screen
	add hl,de			;bf1f  ; Advance by stride
	djnz lbf1eh		;bf20  ; Loop for B bytes
	jp lc146h		;bf22  ; -> return to command interpreter
	ld c,02ch		;bf25  ; C = $2C (tile pair $2C/$2D)
	jr lbf33h		;bf27
	ld c,009h		;bf29  ; C = $09 (tile pair $09/$0A)
	jr lbf33h		;bf2b
	ld c,025h		;bf2d  ; C = $25 (tile pair $25/$26)
	jr lbf33h		;bf2f
	ld c,005h		;bf31  ; C = $05 (tile pair $05/$06)
lbf33h:
	ld de,0001fh		;bf33  ; DE = $1F (stride: down one row, back one col)
	pop hl			;bf36  ; Restore command list position
	ld b,(hl)			;bf37  ; B = fill count
	inc hl			;bf38
	ld a,(hl)			;bf39  ; A = screen address low byte
	inc hl			;bf3a
	push hl			;bf3b  ; Save command list position
	ld h,(hl)			;bf3c  ; H = screen address high byte
	ld l,a			;bf3d  ; HL = screen destination
	ld a,c			;bf3e
	inc a			;bf3f
lbf40h:
	ld (hl),c			;bf40
	inc hl			;bf41
	ld (hl),a			;bf42
	add hl,de			;bf43
	djnz lbf40h		;bf44
	jp lc146h		;bf46
	exx			;bf49
	ld de,l87b4h		;bf4a
	exx			;bf4d
	ld c,003h		;bf4e
lbf50h:
	ld b,004h		;bf50
lbf52h:
	pop hl			;bf52
	ld a,(hl)			;bf53
	inc hl			;bf54
	push hl			;bf55
	exx			;bf56
	add a,a			;bf57
	add a,04eh		;bf58
	ld (0bf5eh),a		;bf5a
	ld hl,(l954eh)		;bf5d
	ld bc,00630h		;bf60
lbf63h:
	ldi		;bf63  ; Copy byte 1 of tile graphic
	ldi		;bf65  ; Copy byte 2
	ldi		;bf67  ; Copy byte 3
	ldi		;bf69  ; Copy byte 4
	ldi		;bf6b  ; Copy byte 5
	ldi		;bf6d  ; Copy byte 6
	ldi		;bf6f  ; Copy byte 7
	ldi		;bf71  ; Copy byte 8
	ld a,e			;bf73
	add a,018h		;bf74
	ld e,a			;bf76
	jr nc,lbf7ah		;bf77
	inc d			;bf79
lbf7ah:
	djnz lbf63h		;bf7a
	ld hl,lff48h		;bf7c
	add hl,de			;bf7f
	ex de,hl			;bf80
	exx			;bf81
	djnz lbf52h		;bf82
	exx			;bf84
	ld hl,000a0h		;bf85
	add hl,de			;bf88
	ex de,hl			;bf89
	exx			;bf8a
	dec c			;bf8b
	jr nz,lbf50h		;bf8c
	jp lbde1h		;bf8e
	ld de,lffe0h		;bf91
	jr lbfa7h		;bf94
	ld de,lffe1h		;bf96
	jr lbfa7h		;bf99
	ld hl,lbfe1h		;bf9b
	ex (sp),hl			;bf9e
	ld de,00021h		;bf9f
	jr lbfa7h		;bfa2
	ld de,00020h		;bfa4
lbfa7h:
	pop hl			;bfa7
	ld c,(hl)			;bfa8
	inc hl			;bfa9
	ld b,(hl)			;bfaa
	inc hl			;bfab
	ld a,(hl)			;bfac
	inc hl			;bfad
	push hl			;bfae
	ld h,(hl)			;bfaf
	ld l,a			;bfb0
	ld a,b			;bfb1
lbfb2h:
	ld b,c			;bfb2
	push hl			;bfb3
lbfb4h:
	ld (hl),a			;bfb4
	inc hl			;bfb5
	djnz lbfb4h		;bfb6
	pop hl			;bfb8
	add hl,de			;bfb9
	dec c			;bfba
	jr nz,lbfb2h		;bfbb
	jp lc146h		;bfbd
	pop hl			;bfc0
	ld b,(hl)			;bfc1
	inc hl			;bfc2
	ld d,(hl)			;bfc3
	inc hl			;bfc4
	ld e,(hl)			;bfc5
	inc hl			;bfc6
	ld a,(hl)			;bfc7
	inc hl			;bfc8
	push hl			;bfc9
	ld h,(hl)			;bfca
	ld l,a			;bfcb
	ld a,020h		;bfcc
	sub b			;bfce
	ld c,a			;bfcf
	ld a,b			;bfd0
lbfd1h:
	ld b,a			;bfd1
lbfd2h:
	ld (hl),e			;bfd2
	inc hl			;bfd3
	djnz lbfd2h		;bfd4
	add hl,bc			;bfd6
	dec d			;bfd7
	jr nz,lbfd1h		;bfd8
	jp lc146h		;bfda
lbfddh:
	ld b,0d6h		;bfdd
	xor 087h		;bfdf
lbfe1h:
	ld b,0e7h		;bfe1
	adc a,087h		;bfe3
; ==========================================================================
; NEW GAME / HUD SETUP ($BFE5)
; ==========================================================================
; Initializes the game HUD: clears score to "000000", draws the
; "HELD", "SCORE", and status labels, sets initial player position
; and room coordinates.
;
lbfe5h:
	ld a,(lf8f8h)		;bfe5  ; A = mission parameter
	or a			;bfe8
	ld hl,05085h		;bfe9  ; HL = HUD screen area base
	ld (lef83h),hl		;bfec  ; Store HUD position
	jr z,lbff7h		;bfef  ; No mission marker → skip
	add a,l			;bff1
	ld l,a			;bff2  ; L = attribute area offset
	ld h,05ah		;bff3  ; H = $5A (attribute area high byte -> $5A00-$5AFF)
	ld (hl),00ch		;bff5  ; Set attribute: blue paper + green ink
lbff7h:
	ld hl,l66f7h		;bff7  ; HL -> score digit buffer (6 bytes)
	ld b,006h		;bffa  ; B = 6 digits to clear
lbffch:
	ld (hl),030h		;bffc  ; Store ASCII '0' ($30)
	inc hl			;bffe  ; Next digit position
	djnz lbffch		;bfff  ; Clear all 6 score digits
	ld hl,l66e1h		;c001  ; HL -> HUD tile data: "HELD" label area
	ld de,050c1h		;c004  ; DE = screen addr: row 24, col 1
	call sub_d06bh		;c007
	ld e,0d5h		;c00a
	call sub_d06bh		;c00c
	ld e,0dbh		;c00f
	call sub_d06bh		;c011
	call sub_d064h		;c014
	ld a,00eh		;c017  ; A = 14 (player Y position)
	ld (0df20h),a		;c019  ; Set player Y
	ld hl,00726h		;c01c  ; HL = $0726 (screen offset)
	ld (leffch),hl		;c01f  ; Set screen pointer
	ld hl,00106h		;c022  ; HL = $0106 (room draw parameter)
	ld (leffah),hl		;c025  ; Set room draw handler (self-modifying)
	ld hl,00011h		;c028
	ld (leffeh),hl		;c02b
	ld a,008h		;c02e
	call sub_df05h		;c030
	call sub_db1dh		;c033
	ld (0d53ah),a		;c036  ; Clear special room flag
	ld (lf8f7h),a		;c039  ; Clear tile refresh flag
	ld (lf8feh),a		;c03c  ; Clear screen rendering sub-state
	ld (ld237h+1),a		;c03f  ; Clear entity array header byte
	ld (lf8f9h),a		;c042  ; Clear room state byte
	ld hl,l9ae4h		;c045  ; HL = $8701 (sprite data table base)
	ld (0cc6dh),hl		;c048  ; Set sprite base pointer
	ld hl,lcf86h		;c04b  ; HL = $AA96 (behavior handler table)
	ld (0c2aeh),hl		;c04e  ; Set entity behavior pointer
	ld (lf8e0h),a		;c051
	ld (lf8ech),a		;c054
	ld (ldf1dh),a		;c057
	ld hl,l8184h		;c05a
	ld (0c123h),hl		;c05d
	ld h,a			;c060
	ld l,a			;c061
	ld (lef85h),hl		;c062
	inc a			;c065
	ld h,a			;c066
	ld l,a			;c067
	ld (lef76h),hl		;c068
	ld (0df2eh),a		;c06b  ; Set entity processing active flag
	ld (lf8fah),a		;c06e  ; Set entity sub-state flag
	ld (lfb0dh),a		;c071  ; Set entity count to 1
	ld (ld9f7h+1),a		;c074  ; Set player active flag
	ld hl,05b00h		;c077  ; HL -> first entity type byte (entity 0, offset +13)
	ld de,engine_end		;c07a  ; DE = 12 (stride between entity entries)
	push de			;c07d
	call sub_94d0h		;c07e
	pop de			;c081
	ld hl,la644h		;c082
	ld a,065h		;c085
lc087h:
	ld (hl),005h		;c087
	inc hl			;c089
	ex de,hl			;c08a
	ldi		;c08b
	inc de			;c08d
	ldi		;c08e
	ldi		;c090
	ex de,hl			;c092
	ld bc,00005h		;c093
	add hl,bc			;c096
	dec a			;c097
	jr nz,lc087h		;c098
	ld a,00ah		;c09a
	ld (la95ah),a		;c09c
	call sub_d6a2h		;c09f
lc0a2h:
	ld b,019h		;c0a2
	ld de,0000ah		;c0a4
	ld hl,la645h		;c0a7
lc0aah:
	res 7,(hl)		;c0aa
	add hl,de			;c0ac
	res 7,(hl)		;c0ad
	add hl,de			;c0af
	res 7,(hl)		;c0b0
	add hl,de			;c0b2
	res 7,(hl)		;c0b3
	add hl,de			;c0b5
	djnz lc0aah		;c0b6
	res 7,(hl)		;c0b8
	ld a,003h		;c0ba
	ld (lc85bh+1),a		;c0bc
	xor a			;c0bf
	ld (0c2e2h),a		;c0c0
	ld (lf8edh),a		;c0c3
	ld a,028h		;c0c6
	ld (l81f5h),a		;c0c8
	ld a,(lefffh)		;c0cb
	ld hl,0d1e0h		;c0ce
	cp 010h		;c0d1
	jr nz,lc0d6h		;c0d3
	inc b			;c0d5
lc0d6h:
	ld (hl),b			;c0d6
	cp 013h		;c0d7
	jr c,lc0eeh		;c0d9
	ld a,(lf8f3h)		;c0db
	inc a			;c0de
	jr nz,lc0eeh		;c0df
	ld hl,lf8f7h		;c0e1
	or (hl)			;c0e4
	jr nz,lc0eeh		;c0e5
	inc (hl)			;c0e7
	ld hl,l67d7h		;c0e8
	call sub_d064h		;c0eb
lc0eeh:
	ld b,006h		;c0ee
	ld hl,lef4ch		;c0f0
	ld de,00007h		;c0f3
lc0f6h:
	ld (hl),d			;c0f6
	add hl,de			;c0f7
	djnz lc0f6h		;c0f8
	ld a,(leffeh)		;c0fa
	dec a			;c0fd
	jr nz,lc105h		;c0fe
	ld a,001h		;c100
	ld (l80dfh),a		;c102
lc105h:
	xor a			;c105
	ld (lf8f6h),a		;c106
	ld b,048h		;c109
	ld hl,tab1_end		;c10b
	call sub_d30eh		;c10e
	ld b,090h		;c111
	call sub_d30ch		;c113
	ld (lc2eah+1),a		;c116
	ld (0c2f3h),a		;c119
	ld a,(lefffh)		;c11c
	or a			;c11f
	jr z,lc125h		;c120
	ld a,(00000h)		;c122
lc125h:
	ld (lc259h+1),a		;c125
	ld h,b			;c128
	ld l,a			;c129
	add hl,hl			;c12a  ; HL *= 2 (each table entry is 2 bytes)
	ld de,l6a08h		;c12b  ; DE = $D41C (room data table base)
	add hl,de			;c12e  ; HL -> room's command list pointer
	ld a,(hl)			;c12f  ; A = command list address low byte
	inc hl			;c130
	ld h,(hl)			;c131  ; H = command list address high byte
	ld l,a			;c132  ; HL = command list address
lc133h:
	ld a,(hl)			;c133  ; A = next command byte
	inc a			;c134  ; Test if $FF (inc $FF -> 0)
	jr z,lc149h		;c135
	inc hl			;c137
	push hl			;c138
	dec a			;c139
	add a,a			;c13a
	ld (0c13fh),a		;c13b
	ld hl,(sub_f800h)		;c13e
	jp (hl)			;c141
lc142h:
	pop hl			;c142
	inc hl			;c143
	jr lc133h		;c144
; ==========================================================================
; ROOM COMMAND INTERPRETER ($C146)
; ==========================================================================
; Central dispatch loop for the room rendering engine. All tile drawing
; commands (LDIR copies, fill loops, attribute writes) return here via
; JP lc146h. The interpreter reads command bytes from a data stream
; and dispatches to handler routines via a self-modifying jump table.
;
lc146h:
	jp lc142h		;c146  ; Self-mod: dispatch next command
; --- Room entity scanner ($C149) ---
; Scans the entity spawn table at $AA36 for entities in the current room.
; For each matching entity, dispatches to the appropriate handler.
;
lc149h:
	ld hl,lc177h		;c149  ; HL = entity handler return address
	ld (lc146h+1),hl		;c14c  ; Patch dispatch to entity mode
	ld bc,01680h		;c14f  ; B=22 (max entities), C=$80 (mask)
	ld hl,laa36h		;c152  ; HL -> entity spawn table
lc155h:
	ld a,(lefffh)		;c155
	cp (hl)			;c158
	jr z,lc162h		;c159
	jr c,lc17ch		;c15b
	inc hl			;c15d
lc15eh:
	inc hl			;c15e
	jp lc179h		;c15f
lc162h:
	ld a,(leffeh)		;c162
	inc hl			;c165
	cp (hl)			;c166
	jr c,lc17ch		;c167
	jr nz,lc15eh		;c169
	inc hl			;c16b
	push hl			;c16c
	ld a,(hl)			;c16d
	add a,a			;c16e
	ld (0c173h),a		;c16f
	ld hl,(sub_f800h)		;c172
	push bc			;c175
	jp (hl)			;c176
lc177h:
	pop bc			;c177
	pop hl			;c178
lc179h:
	inc hl			;c179
	djnz lc155h		;c17a  ; Loop until all 22 entries scanned
lc17ch:
	ld hl,lc142h		;c17c  ; HL = default state handler address
	ld (lc146h+1),hl		;c17f  ; Restore state jump table return vector
	ld a,(lefffh)		;c182  ; A = current room X coordinate
	cp 01fh		;c185  ; Is this room $1F (rightmost column)?
	jr nz,lc19ch		;c187  ; No -> skip overlay clearing
	ld bc,000c7h		;c189  ; BC = 256 bytes to scan
	ld de,l89d3h		;c18c
	ld hl,l8c13h		;c18f
lc192h:
	ld a,(de)			;c192
	cp c			;c193
	jr nc,lc198h		;c194
	ld (hl),000h		;c196
lc198h:
	dec hl			;c198
	dec de			;c199
	djnz lc192h		;c19a
lc19ch:
	ld hl,la51bh		;c19c
	ld de,00008h		;c19f
	ld b,021h		;c1a2
	ld a,(lefffh)		;c1a4
	ld c,a			;c1a7
lc1a8h:
	ld a,c			;c1a8
	cp (hl)			;c1a9
	inc hl			;c1aa
	jr c,lc1d6h		;c1ab
	jr z,lc1b4h		;c1ad
lc1afh:
	add hl,de			;c1af
	djnz lc1a8h		;c1b0
	jr lc1d6h		;c1b2
lc1b4h:
	ld a,(leffeh)		;c1b4
	cp (hl)			;c1b7
	jr nz,lc1afh		;c1b8
	inc hl			;c1ba
	ld e,(hl)			;c1bb
	inc hl			;c1bc
	ld d,(hl)			;c1bd
	inc hl			;c1be
	ld (lf8f0h),hl		;c1bf
	ex de,hl			;c1c2
	ld a,(hl)			;c1c3  ; A = current tile at object position
	inc a			;c1c4  ; Test if $FF (empty/uninitialized)
	jr nz,lc1cdh		;c1c5  ; Not $FF -> tile already placed, skip init
	ld (hl),088h		;c1c7  ; Place tile $88 (left door/gate piece)
	inc hl			;c1c9
	ld (hl),089h		;c1ca  ; Place tile $89 (right door/gate piece)
	dec hl			;c1cc  ; Restore HL to first tile position
lc1cdh:
	ld de,lfdbfh+1		;c1cd  ; DE = offset to dirty flag buffer ($FDC0)
	add hl,de			;c1d0  ; HL -> dirty flag for this tile position
	ld (hl),064h		;c1d1  ; Mark first tile dirty (value $64 = 100)
	inc hl			;c1d3
	ld (hl),064h		;c1d4  ; Mark second tile dirty
lc1d6h:
	ld a,(lc259h+1)		;c1d6
	ld hl,l8a55h		;c1d9
	cp 03ah		;c1dc
	jr z,lc1e6h		;c1de
	cp 03ch		;c1e0
	jr nz,lc1eeh		;c1e2
	ld l,060h		;c1e4
lc1e6h:
	ld de,l6712h		;c1e6
	ld b,006h		;c1e9
	call sub_d2efh		;c1eb
lc1eeh:
	call sub_d0abh		;c1ee
	ld a,0f0h		;c1f1
	ld (0ca08h),a		;c1f3
	ld a,(lf8f6h)		;c1f6
	dec a			;c1f9
	jr nz,lc206h		;c1fa
	ld de,05033h		;c1fc
	ld a,043h		;c1ff
	call sub_d060h		;c201
	jr lc23dh		;c204
lc206h:
	dec a			;c206
	jr nz,lc220h		;c207
	ld hl,05be8h		;c209
	ld c,012h		;c20c
lc20eh:
	ld de,04013h		;c20e
	ld a,020h		;c211
	ld (0d084h),a		;c213
	call sub_d06dh		;c216
	ld a,001h		;c219
	ld (0d084h),a		;c21b
	jr lc23dh		;c21e
lc220h:
	dec a			;c220
	jr nz,lc23dh		;c221
	ld hl,05bfah		;c223
	ld c,006h		;c226
	jr lc20eh		;c228
sub_c22ah:
	ex de,hl			;c22a
	ld bc,00004h		;c22b
	ldir		;c22e
	ld hl,lfdbfh		;c230
	add hl,de			;c233
	inc b			;c234
	ld (hl),b			;c235
	dec hl			;c236
	ld (hl),b			;c237
	dec hl			;c238
	ld (hl),b			;c239
	dec hl			;c23a
	ld (hl),b			;c23b
	ret			;c23c
lc23dh:
	ld a,(lfb04h)		;c23d
	ld (lfb05h),a		;c240
lc243h:
	ld a,000h		;c243
	or a			;c245
	jr z,lc259h		;c246
	ld b,a			;c248
	ld hl,l8e74h		;c249
	ld a,h			;c24c
	sub 009h		;c24d
	ld h,a			;c24f
lc250h:
	ld (hl),001h		;c250
lc252h:
	inc hl			;c252
	djnz lc250h		;c253
	xor a			;c255
	ld (lc243h+1),a		;c256
lc259h:
	ld a,000h		;c259
	cp 09eh		;c25b
	jr nz,lc289h		;c25d
	ld hl,l89c1h		;c25f
	ld de,lef48h		;c262
	push hl			;c265
	call sub_c22ah		;c266
	pop hl			;c269
	ld bc,lfb0fh		;c26a
	ld a,(bc)			;c26d
	or a			;c26e
	jr z,lc276h		;c26f
	inc hl			;c271
	ld a,0cah		;c272
	jr lc279h		;c274
lc276h:
	dec hl			;c276
	ld a,0b7h		;c277
lc279h:
	cp l			;c279
	jr nz,lc280h		;c27a
	ld a,(bc)			;c27c
	xor 001h		;c27d
	ld (bc),a			;c27f
lc280h:
	ld (0c260h),hl		;c280
	ld de,l9e3bh		;c283
	call sub_c22ah		;c286
lc289h:
	call sub_dbc0h		;c289
	call sub_cc26h		;c28c
	call sub_dbdah		;c28f
	ld (lf8fdh),a		;c292
	ld b,a			;c295
	ld a,(le666h)		;c296  ; A = room transition flag
	cp 064h		;c299  ; Is it $64 (transition active)?
	jr nz,lc2a1h		;c29b  ; No -> skip, keep B=0
	ld hl,(lf8f0h)		;c29d  ; HL -> sprite configuration table
	ld b,(hl)			;c2a0  ; B = new entity state from sprite config
lc2a1h:
	ld a,b			;c2a1  ; A = proposed new entity state
	ld hl,lef77h		;c2a2  ; HL -> current entity sub-state
	cp (hl)			;c2a5  ; Has state changed?
	ld (hl),a			;c2a6  ; Update to new state
	call nz,sub_d67bh		;c2a7  ; If changed -> handle room transition
	call sub_d03ah		;c2aa
	jp 00000h		;c2ad
lc2b0h:
	inc a			;c2b0
lc2b1h:
	ld (lf8ech),a		;c2b1
lc2b4h:
	call sub_e08fh		;c2b4
	ld hl,006c0h		;c2b7
	call sub_e0b6h		;c2ba
	call sub_cc65h		;c2bd
	call sub_e0ach		;c2c0
	ld a,(0c2e2h)		;c2c3
	or a			;c2c6
	jr z,lc2eah		;c2c7
; ==========================================================================
; FLOOR TYPE CHECK & SCREEN FLIP ($92F5)
; ==========================================================================
; Check the tile under the player to determine floor type (normal vs
; slippery/ice), then flip screen buffers and check for cheat code.
;
; --- Check floor tile under player ---
	ld hl,(leffah)		;c2c9  ; HL = player map position pointer
	ld de,l8a56h		;c2cc  ; DE = offset to floor tile layer
	add hl,de			;c2cf  ; HL -> floor tile at player position
	ld a,(hl)			;c2d0  ; A = floor tile value
	cp 08ah		;c2d1  ; Is it tile $8A (ice/slippery floor)?
	ld a,018h		;c2d3  ; A = $18 (ice movement speed)
	jr z,lc2d9h		;c2d5
	ld a,028h		;c2d7
lc2d9h:
	ld hl,l81f5h		;c2d9
	cp (hl)			;c2dc
	jr z,lc2eah		;c2dd
	ld (hl),a			;c2df
	ld hl,00000h		;c2e0
	ld b,004h		;c2e3
lc2e5h:
	ld (hl),001h		;c2e5
	inc hl			;c2e7
	djnz lc2e5h		;c2e8
lc2eah:
	ld a,000h		;c2ea
	ld hl,l8e74h		;c2ec
	call sub_81e8h		;c2ef
	ld a,000h		;c2f2
	ld hl,090b4h		;c2f4
	call sub_81e8h		;c2f7
	ld a,0ffh		;c2fa
	ld (lc2eah+1),a		;c2fc
	ld (0c2f3h),a		;c2ff
	ld a,(lf8fdh)		;c302
	or a			;c305
	ld b,002h		;c306
	call nz,ldf1dh		;c308
	ld hl,0c319h		;c30b
	ld a,(hl)			;c30e
	add a,002h		;c30f
	cp 0e8h		;c311
	jr nz,lc317h		;c313
	sub 008h		;c315
lc317h:
	ld (hl),a			;c317
	ld hl,(lf0e0h)		;c318
	ld (lc582h+1),hl		;c31b
	ld hl,0c32ch		;c31e
	ld a,(hl)			;c321
	add a,002h		;c322
	cp 0feh		;c324
	jr nz,lc32ah		;c326
	sub 006h		;c328
lc32ah:
	ld (hl),a			;c32a
	ld hl,(lf7f8h)		;c32b
	ld (lc5b0h+1),hl		;c32e
	ld a,(lf8ech)		;c331
	ld (0c7b9h),a		;c334
	ld hl,0cc11h		;c337
	ld (sub_d335h+1),hl		;c33a
; --- ENTITY PROCESSING LOOP ---
; Iterates through all entities in the spawn table. For each active
; entity, processes its behavior, movement, collision, and rendering.
;
	ld hl,la645h		;c33d  ; HL -> entity table start
	ld bc,05702h		;c340  ; B=87 (max entities), C=2 (stride multiplier)
	ld iyh,000h		;c343  ; IYH = entity counter
lc346h:
	ld de,0000ah		;c346  ; DE = 10 (entity struct size)
lc349h:
	ld a,(hl)			;c349  ; A = entity status byte
	rlca			;c34a  ; Test bit 7 (active flag)
	jr nc,lc353h		;c34b  ; Bit 7 clear → entity active, process it
	add hl,de			;c34d  ; Skip inactive entity
	djnz lc349h		;c34e  ; Next entity
	jp lc778h		;c350  ; All entities processed
lc353h:
	push bc			;c353
	rlca			;c354
	and 001h		;c355
	ld (lf8ech),a		;c357
	ld a,(hl)			;c35a
	and 00fh		;c35b
	ld iyl,a		;c35d
	inc hl			;c35f
	ld b,(hl)			;c360
	ld d,h			;c361
	ld e,l			;c362
	ld ixh,d		;c363
	ld ixl,e		;c365
	inc l			;c367
	inc hl			;c368
	ld a,(hl)			;c369
	ex de,hl			;c36a
	ld hl,leffeh		;c36b
	sub (hl)			;c36e
	ld c,a			;c36f
	add a,005h		;c370
	cp 00ch		;c372
	jp nc,lc75bh		;c374
	inc l			;c377
	ld a,b			;c378
	and 07fh		;c379
	sub (hl)			;c37b
	ld b,a			;c37c
	add a,003h		;c37d
	cp 006h		;c37f
	jp nc,lc75bh		;c381
	ld a,b			;c384
	or c			;c385
	ld (0c3b8h),a		;c386
	jp nz,lc392h		;c389
	call sub_e0c5h		;c38c
	call sub_cc00h		;c38f
lc392h:
	ld a,iyl		;c392
	cp 002h		;c394
	jp nc,lc412h		;c396
	ld b,(ix+001h)		;c399
	ld a,(lf8ech)		;c39c
	or a			;c39f
	ld c,a			;c3a0
	jr z,lc3f4h		;c3a1  ; Yes -> jump to forward patrol branch
	ld a,(ix+002h)		;c3a3  ; A = entity room Y
	cp (ix+003h)		;c3a6  ; Has entity reached start room X?
	jr nz,lc3e7h		;c3a9  ; No -> continue moving backward
	ld a,(ix+004h)		;c3ab  ; A = entity start Y position
	cp b			;c3ae  ; Has entity reached start Y?
	jr nz,lc3e7h		;c3af  ; No -> continue moving backward
lc3b1h:
	bit 7,(ix+000h)		;c3b1
	jr z,lc3d4h		;c3b5
	ld a,000h		;c3b7
	or a			;c3b9
	jr nz,lc3e3h		;c3ba
	ld a,b			;c3bc
	add a,00ah		;c3bd
	ld e,a			;c3bf
	ld a,(leffch)		;c3c0
	add a,00ah		;c3c3
	cp e			;c3c5
	ld a,000h		;c3c6
	jr nc,lc3cbh		;c3c8
	inc a			;c3ca
lc3cbh:
	cp c			;c3cb
	jr nz,lc3d4h		;c3cc
	ld a,r		;c3ce
	and 003h		;c3d0
	jr nz,lc3ddh		;c3d2
lc3d4h:
	ld a,iyl		;c3d4
	add a,a			;c3d6
	add a,007h		;c3d7
lc3d9h:
	ld iyl,a		;c3d9
	jr lc412h		;c3db
lc3ddh:
	rlca			;c3dd
	rlca			;c3de
	dec a			;c3df
	ld (0e062h),a		;c3e0
lc3e3h:
	ld a,00ch		;c3e3
	jr lc3d9h		;c3e5
lc3e7h:
	dec b			;c3e7
	ld a,b			;c3e8
	cp 0fch		;c3e9
	jr nz,lc40fh		;c3eb
	ld a,01ch		;c3ed
	dec (ix+002h)		;c3ef  ; Decrement entity room Y
	jr lc40fh		;c3f2  ; Store new position
lc3f4h:
	ld a,(ix+002h)		;c3f4  ; A = entity room Y
	cp (ix+005h)		;c3f7  ; Has entity reached patrol end X?
	jr nz,lc404h		;c3fa  ; No -> continue moving forward
	ld a,(ix+006h)		;c3fc  ; A = patrol boundary Y
	cp b			;c3ff  ; Has entity reached patrol end Y?
	jr nz,lc404h		;c400  ; No -> continue moving forward
	jr lc3b1h		;c402
lc404h:
	inc b			;c404
	ld a,b			;c405
	cp 01eh		;c406
	jr nz,lc40fh		;c408
	ld a,0feh		;c40a
	inc (ix+002h)		;c40c
lc40fh:
	ld (ix+001h),a		;c40f
lc412h:
	ld a,(leffeh)		;c412
	cp (ix+002h)		;c415
	jp nz,lc75dh		;c418
	ld a,(lefffh)		;c41b
	sub (ix+000h)		;c41e
	and 07fh		;c421
	jp nz,lc75dh		;c423
	inc a			;c426
	bit 7,(ix+007h)		;c427
	call nz,sub_e05eh		;c42b
	call sub_e0c5h		;c42e
	ld a,(0c717h)		;c431
	ld c,a			;c434
	or a			;c435
	ld hl,00900h		;c436
	jr z,lc43eh		;c439
	ld hl,00b40h		;c43b
lc43eh:
	call sub_e0b6h		;c43e
	ld a,c			;c441
	inc a			;c442
	ld hl,lfb0eh		;c443
	sub (hl)			;c446
	jr nz,lc48dh		;c447
	ld a,iyl		;c449
	cp 005h		;c44b
	jr c,lc453h		;c44d
	cp 007h		;c44f
	jr c,lc48fh		;c451
lc453h:
	ld a,001h		;c453
	ld (lfb03h),a		;c455
	ld a,000h		;c458
	or a			;c45a
	ld b,a			;c45b
	jp p,lc469h		;c45c
	ld a,(0c482h)		;c45f
	add a,a			;c462
	add a,007h		;c463
	ld iyl,a		;c465
	res 7,b		;c467
lc469h:
	push bc			;c469
	ld de,00206h		;c46a
	call sub_dbdfh		;c46d
	dec (ix-002h)		;c470
	jr z,lc480h		;c473
	ld a,r		;c475
	and 007h		;c477
	jr z,lc480h		;c479
	pop bc			;c47b
	djnz lc469h		;c47c
	jr lc48dh		;c47e
lc480h:
	pop af			;c480
	ld a,000h		;c481
	add a,005h		;c483
	ld iyl,a		;c485
	ld de,00105h		;c487
	call sub_dbdfh		;c48a
lc48dh:
	ld a,iyl		;c48d
lc48fh:
	ld b,a			;c48f
	add a,a			;c490
	add a,0a7h		;c491
	ld (0c497h),a		;c493
	ld hl,(lc4a7h)		;c496
	ld a,(0c717h)		;c499
	or a			;c49c
	ld a,b			;c49d
	ld de,lc2eah+1		;c49e
	jr z,lc4a5h		;c4a1
	ld e,0f3h		;c4a3
lc4a5h:
	ld (de),a			;c4a5
	jp (hl)			;c4a6
lc4a7h:
	pop bc			;c4a7
	call nz,sub_c588h		;c4a8
	call nc,sub_a0c5h		;c4ab
	add a,0ceh		;c4ae
	add a,092h		;c4b0
	add a,099h		;c4b2
	add a,06bh		;c4b4
	add a,073h		;c4b6
	add a,082h		;c4b8
	add a,08ah		;c4ba
	add a,0c6h		;c4bc
	add a,008h		;c4be
	add a,03ah		;c4c0
	call pe,047f8h		;c4c2
	or a			;c4c5
	ld a,(ix+001h)		;c4c6
	ld hl,l8c99h		;c4c9
	jr z,lc4d4h		;c4cc
	ld l,094h		;c4ce
	xor 0ffh		;c4d0
	jr lc4d6h		;c4d2
lc4d4h:
	cp 01bh		;c4d4
lc4d6h:
	jp p,lc57fh		;c4d6
	ld de,(0cc11h)		;c4d9
	add hl,de			;c4dd
	ld a,(hl)			;c4de
	inc a			;c4df
	jr z,lc4f1h		;c4e0
	ld a,r		;c4e2
	rra			;c4e4
	jr nc,lc4f1h		;c4e5
	ld (lf8dch),hl		;c4e7
	ld iyl,002h		;c4ea
	ld a,003h		;c4ed
	jr lc507h		;c4ef
lc4f1h:
	ld a,b			;c4f1
	or a			;c4f2
	ld hl,l8c79h		;c4f3
	jr z,lc4fah		;c4f6
	ld l,074h		;c4f8
lc4fah:
	add hl,de			;c4fa  ; HL -> map tile in vertical direction
	ld a,(hl)			;c4fb  ; A = map tile at destination
	inc a			;c4fc  ; Test if $FF (wall/solid)
	jr z,lc50ch		;c4fd  ; Wall -> fall through to AI random
	ld (lf8dch),hl		;c4ff  ; Store destination tile address
	ld a,002h		;c502  ; A = 2 (countdown steps)
	ld iyl,00bh		;c504
lc507h:
	ld (0e062h),a		;c507  ; Set movement countdown
	jr lc582h		;c50a  ; Go to animation setup
lc50ch:
	ld a,r		;c50c  ; A = R register (pseudo-random)
	and 007h		;c50e  ; Mask to 0-7
	jr nz,lc57fh		;c510  ; 87.5% chance: skip targeting, do random AI
	ld a,(lef53h)		;c512  ; A = projectile slot 0 active flag
	or a			;c515  ; Is it occupied?
	jr nz,lc57fh		;c516  ; Occupied -> can't throw, do random AI
	ld hl,leffdh		;c518  ; HL -> player X position
	ld a,(ix+007h)		;c51b  ; A = entity behavior bits
	and 03fh		;c51e  ; Mask off type bits -> entity sprite X
	sub (hl)			;c520  ; A = entity_X - player_X
	add a,004h		;c521  ; Shift to unsigned: A = distance + 4
	cp 009h		;c523  ; Is distance < 9? (within ±4 tiles)
	jr nc,lc57fh		;c525  ; Too far -> do random AI
	ex de,hl			;c527
	ld de,00064h		;c528
	add hl,de			;c52b
	ld bc,00408h		;c52c
	ld a,(ix+001h)		;c52f
	add a,00ah		;c532
	ld e,a			;c534
	ld a,(leffch)		;c535
	add a,00ah		;c538
	sub e			;c53a
	jr nc,lc544h		;c53b
	ld bc,00104h		;c53d
	inc d			;c540
	dec hl			;c541
	dec hl			;c542
	dec hl			;c543
lc544h:
	inc a			;c544
	cp 003h		;c545
	jr c,lc57fh		;c547
	ld a,(lf8ech)		;c549
	cp d			;c54c
	jr nz,lc57fh		;c54d
	ld a,(ix+001h)		;c54f
	add a,b			;c552
	ld (lef55h),a		;c553
	ld (lef56h),hl		;c556
	ld hl,l9938h		;c559
	ld (lf8dch),hl		;c55c  ; Set projectile map position pointer
	ld a,c			;c55f  ; A = projectile speed parameter
	ld (lef58h),a		;c560  ; Set projectile horizontal velocity
	ld (lef59h),a		;c563  ; Set projectile vertical velocity
	ld a,0d4h		;c566  ; A = $D4 (projectile active marker + timer)
	ld (lef53h),a		;c568  ; Activate projectile slot 0
	ld a,(ix+007h)		;c56b  ; A = entity behavior bits
	and 03fh		;c56e  ; Mask to sprite type
	add a,003h		;c570  ; A = sprite type + 3 (throwing frame offset)
	ld (lef54h),a		;c572  ; Set projectile sprite index
	ld iyl,002h		;c575
	ld a,003h		;c578
	ld (0e062h),a		;c57a
	jr lc582h		;c57d
lc57fh:
	call sub_c5b6h		;c57f
lc582h:
	ld de,00000h		;c582
	jp lc6ddh		;c585
sub_c588h:
	ld a,(lf8ech)		;c588
	or a			;c58b
	ld hl,l8c5ah		;c58c
	ld a,(ix+001h)		;c58f
	jr z,lc59ah		;c592
	ld l,055h		;c594
	xor 0ffh		;c596
	jr lc59ch		;c598
lc59ah:
	cp 019h		;c59a
lc59ch:
	jp p,lc5adh		;c59c
	ld de,(0cc11h)		;c59f
	add hl,de			;c5a3
	ld a,(hl)			;c5a4
	inc a			;c5a5
	jr z,lc5adh		;c5a6
	ld iyl,004h		;c5a8
	jr lc5b0h		;c5ab
lc5adh:
	call sub_c5b6h		;c5ad
lc5b0h:
	ld de,00000h		;c5b0
	jp lc6ddh		;c5b3
sub_c5b6h:
	ld b,000h		;c5b6
	ld a,(leffch)		;c5b8
	sub (ix+001h)		;c5bb
	jp p,lc5c2h		;c5be
	inc b			;c5c1
lc5c2h:
	ld a,(lf8ech)		;c5c2
	cp b			;c5c5
	ret z			;c5c6
	ld a,r		;c5c7
	and 003h		;c5c9
	ret nz			;c5cb
	ld a,iyl		;c5cc
	add a,a			;c5ce
	add a,007h		;c5cf
	ld iyl,a		;c5d1
	ret			;c5d3
	ld hl,0e062h		;c5d4  ; HL -> countdown timer
	ld a,002h		;c5d7  ; A = 2 (trigger score at count 2)
	cp (hl)			;c5d9  ; Is countdown at 2?
	jr nz,lc5efh		;c5da  ; No -> skip scoring, just decrement
	push hl			;c5dc  ; Save timer pointer
	ld hl,(lf8dch)		;c5dd  ; HL -> destination tile address
	ld a,(hl)			;c5e0  ; A = tile at destination
	inc a			;c5e1  ; Test if $FF (invalid)
	jr z,lc5eeh		;c5e2  ; Invalid -> skip score
	ld a,001h		;c5e4
	ld (lfb03h),a		;c5e6
	ld b,00ch		;c5e9
	call ldf1dh		;c5eb
lc5eeh:
	pop hl			;c5ee
lc5efh:
	dec (hl)			;c5ef
	jr nz,lc5f5h		;c5f0
	ld iyl,000h		;c5f2
lc5f5h:
	ld de,l9938h		;c5f5
	jp lc6ddh		;c5f8
sub_c5fbh:
; ==========================================================================
; GET_RANDOM ($8EA4)
; ==========================================================================
; Pseudo-random number generator using self-modifying code.
; Maintains an internal 16-bit pointer that increments each call
; (with bit 6 of H cleared to keep it within a bounded memory range).
; Returns the byte at the pointer location as the "random" value.
; The randomness comes from reading whatever data happens to be at
; successive memory addresses — a common ZX Spectrum RNG technique.
;
; On entry:  (no parameters)
; On exit:   A = pseudo-random byte
;            HL preserved
;
	push hl			;c5fb  ; Save HL
	ld hl,00000h		;c5fc  ; HL = current RNG pointer (SELF-MODIFYING: $8EA6)
	inc hl			;c5ff  ; Advance pointer
	res 6,h		;c600  ; Clear bit 6 of H (keep within $0000-$3FFF range)
	ld (0c5fdh),hl		;c602  ; Store back (patches the LD HL immediate above)
	ld a,(hl)			;c605  ; A = byte at current pointer (random value)
	pop hl			;c606  ; Restore HL
	ret			;c607
	ld de,l8edah		;c608  ; DE = right-facing map offset
	ld b,00ch		;c60b
	ld c,(ix+001h)		;c60d
	ld a,(lf8ech)		;c610
	dec a			;c613
	ld a,023h		;c614
	jr nz,lc61eh		;c616
	dec c			;c618
	ld e,0d3h		;c619
	inc b			;c61b
	ld a,02bh		;c61c
lc61eh:
	ld (lc652h),a		;c61e
	ld (lc252h),a		;c621
	ld a,b			;c624
	ld (lc654h),a		;c625
	ld hl,(0cc11h)		;c628
	add hl,de			;c62b
	ld (0c24ah),hl		;c62c
	ld de,l992eh		;c62f
	ld b,00ah		;c632
	exx			;c634
	ld de,lf940h		;c635
	ld bc,lfdbfh+1		;c638
	exx			;c63b
lc63ch:
	ld a,019h		;c63c
	cp c			;c63e
	jr c,lc657h		;c63f
	push hl			;c641
	exx			;c642
	pop hl			;c643
	add hl,de			;c644
	ld a,(hl)			;c645
	exx			;c646  ; Main registers
	cp 0c7h		;c647  ; Solid tile ($C7+)?
	jr nc,lc657h		;c649  ; Yes -> don't overwrite
	ld a,(de)			;c64b  ; A = source tile data
	ld (hl),a			;c64c  ; Write tile to screen map
	exx			;c64d  ; Alt registers
	add hl,bc			;c64e
	ld (hl),001h		;c64f
	exx			;c651
lc652h:
	inc hl			;c652
	inc de			;c653
lc654h:
	nop			;c654
	djnz lc63ch		;c655
lc657h:
	ld a,00ah		;c657
	sub b			;c659
	ld (lc243h+1),a		;c65a
	ld hl,0e062h		;c65d
	dec (hl)			;c660
	jr nz,lc666h		;c661
	ld iyl,007h		;c663
lc666h:
	ld de,l9938h		;c666
	jr lc6ddh		;c669
	ld iyl,008h		;c66b
	ld de,l9a5fh		;c66e
	jr lc6ddh		;c671
	ld iyl,000h		;c673
	ld de,l9a5fh		;c676
lc679h:
	ld hl,lf8ech		;c679
	ld a,001h		;c67c
	xor (hl)			;c67e
	ld (hl),a			;c67f
	jr lc6ddh		;c680
	ld iyl,00ah		;c682
	ld de,l99ceh		;c685
	jr lc6ddh		;c688
	ld iyl,001h		;c68a
	ld de,l99ceh		;c68d
	jr lc679h		;c690
	ld de,l9af8h		;c692
	inc iyh		;c695
	jr lc6ddh		;c697
	ld de,l9acdh		;c699
	inc iyh		;c69c
	jr lc6ddh		;c69e  ; Set up animation
	ld hl,0e062h		;c6a0  ; HL -> countdown timer
	ld a,001h		;c6a3  ; A = 1 (trigger at count 1)
	cp (hl)			;c6a5  ; Is countdown at 1?
	jr nz,lc6bbh		;c6a6  ; No -> skip scoring
	push hl			;c6a8  ; Save timer pointer
	ld hl,(lf8dch)		;c6a9  ; HL -> behavior tile address
	ld a,(hl)			;c6ac  ; A = tile value
	inc a			;c6ad  ; Test if $FF (invalid)
	jr z,lc6bah		;c6ae  ; Invalid -> skip score
	ld a,001h		;c6b0
	ld (lfb03h),a		;c6b2
	ld b,007h		;c6b5
	call ldf1dh		;c6b7
lc6bah:
	pop hl			;c6ba
lc6bbh:
	dec (hl)			;c6bb
	jr nz,lc6c1h		;c6bc
	ld iyl,000h		;c6be
lc6c1h:
	ld de,l9a89h		;c6c1
	jr lc6ddh		;c6c4
	ld iyl,003h		;c6c6
	ld de,l9961h		;c6c9
	jr lc6ddh		;c6cc
	ld a,001h		;c6ce
	ld (lfb03h),a		;c6d0
	ld iyl,a		;c6d3
	ld b,006h		;c6d5
	call ldf1dh		;c6d7
	ld de,l99a0h		;c6da
lc6ddh:
	ld hl,lf8eah		;c6dd
	ld bc,l8e74h		;c6e0
	ld a,(0c717h)		;c6e3
	or a			;c6e6
	ld a,001h		;c6e7
	jr z,lc6f1h		;c6e9
	inc l			;c6eb
	ld bc,090b4h		;c6ec
	ld a,004h		;c6ef
lc6f1h:
	ld (0c6f6h),a		;c6f1
	ld (sub_cc00h+1),de		;c6f4
	ld a,(lf8ech)		;c6f8
	ld (hl),a			;c6fb
	call sub_e08fh		;c6fc
	ld hl,(0cc11h)		;c6ff
	add hl,bc			;c702
	ld bc,(0cc18h)		;c703
	exx			;c707
	ld d,(ix+007h)		;c708
	res 7,d		;c70b
	ld e,(ix+001h)		;c70d
	call sub_d335h		;c710
	call sub_e0ach		;c713
	ld a,000h		;c716
	dec a			;c718
	call z,sub_e05eh		;c719
	jr lc728h		;c71c
	ld hl,lf8ech		;c71e
	ld a,001h		;c721
	xor (hl)			;c723
	ld (hl),a			;c724
	ld iyl,000h		;c725
lc728h:
	ld a,(lf8ech)		;c728
	rrca			;c72b
	rrca			;c72c
	or iyl		;c72d
	ld (ix-001h),a		;c72f
	dec iyh		;c732
	jr nz,lc769h		;c734
	set 7,(ix-001h)		;c736
	ld d,ixh		;c73a
	ld e,ixl		;c73c
	ld hl,00009h		;c73e
	add hl,de			;c741
	pop bc			;c742
	dec b			;c743
	jp nz,lc346h		;c744
	jp lc778h		;c747
	ld hl,lf8ech		;c74a
	ld a,001h		;c74d
	xor (hl)			;c74f
	ld (hl),a			;c750
	ld iyl,001h		;c751
	jr lc728h		;c754
	ld iyl,007h		;c756
	jr lc728h		;c759
lc75bh:
	inc iyh		;c75b
lc75dh:
	ld a,iyl		;c75d
	add a,a			;c75f
	add a,0e0h		;c760
	ld (0c766h),a		;c762
	ld hl,(lefe0h)		;c765
	jp (hl)			;c768
lc769h:
	inc iyh		;c769
	ld d,ixh		;c76b
	ld e,ixl		;c76d
	ld hl,00009h		;c76f
	add hl,de			;c772
	pop bc			;c773
	dec b			;c774
	jp nz,lc346h		;c775
lc778h:
	dec c			;c778
	jr z,lc79bh		;c779
	ld a,c			;c77b
	ld (0c482h),a		;c77c  ; Set collision width parameter
	ld a,010h		;c77f  ; A = 16 ($10)
	ld (0d3dch),a		;c781  ; Set rendering X offset parameter
	ld (0d3eah),a		;c784  ; Set collision X offset parameter
	ld a,018h		;c787  ; A = 24 ($18)
	ld (0d3d8h),a		;c789  ; Set rendering Y offset parameter
	ld (0d3e2h),a		;c78c  ; Set collision Y offset parameter
	ld de,00803h		;c78f
	ld (0cc18h),de		;c792
	ld b,00eh		;c796
	jp lc346h		;c798
lc79bh:
	ld a,01ah		;c79b  ; A = 26 ($1A)
	ld (0d3e2h),a		;c79d  ; Set rendering X offset = 26
	ld (0d3d8h),a		;c7a0  ; Set collision X offset = 26
	ld a,00ch		;c7a3  ; A = 12 ($0C)
	ld (0d3eah),a		;c7a5  ; Set rendering Y offset = 12
	ld (0d3dch),a		;c7a8  ; Set collision Y offset = 12
	ld hl,00607h		;c7ab
	ld (0cc18h),hl		;c7ae
	xor a			;c7b1
	ld (0c482h),a		;c7b2
	ld (lfb0eh),a		;c7b5
	ld a,000h		;c7b8
	ld (lf8ech),a		;c7ba
	ld hl,leffah		;c7bd
	ld (sub_d335h+1),hl		;c7c0
	ld hl,(leffeh)		;c7c3
	ld de,00d04h		;c7c6
	sbc hl,de		;c7c9
	jr nz,lc7edh		;c7cb
	ld hl,lba90h		;c7cd
	ld a,(hl)			;c7d0
lc7d1h:
	inc a			;c7d1  ; Advance counter
	cp 016h		;c7d2  ; Is it $16 (reserved value)?
	jr z,lc7d1h		;c7d4  ; Yes -> skip past it
	cp 018h		;c7d6  ; Has it reached $18 (transition complete)?
	jr nz,lc7dch		;c7d8  ; No -> continue with current value
	ld a,013h		;c7da  ; Yes -> wrap back to $13
lc7dch:
	ld (hl),a			;c7dc
	ld (lba99h),a		;c7dd
	ld (0baa2h),a		;c7e0
	ld hl,00101h		;c7e3
	ld (l8708h),hl		;c7e6
	ld a,l			;c7e9
	ld (l870ah),a		;c7ea
lc7edh:
	ld a,(lc259h+1)		;c7ed
	cp 0eeh		;c7f0
	jr nz,lc85bh		;c7f2
	ld hl,085fbh		;c7f4
	ld de,l883bh		;c7f7
	ld bc,00a01h		;c7fa
lc7fdh:
	ld a,r		;c7fd
	and 003h		;c7ff
	add a,04fh		;c801
	ld (de),a			;c803
	inc de			;c804
	inc de			;c805
	ld (hl),c			;c806
	inc hl			;c807
	inc hl			;c808
	ld (hl),c			;c809
	add a,003h		;c80a
	ld (de),a			;c80c
	push bc			;c80d
	ld bc,0001eh		;c80e
	add hl,bc			;c811
	ex de,hl			;c812
	add hl,bc			;c813
	ex de,hl			;c814
	pop bc			;c815
	djnz lc7fdh		;c816
	ld a,(ldf1dh)		;c818
	ld b,a			;c81b
	ld a,(lf8feh)		;c81c
	or b			;c81f
	jr nz,lc85bh		;c820
	ld hl,l883dh		;c822
	ld a,(leffeh)		;c825
	cp 001h		;c828
	jr z,lc82eh		;c82a
	dec hl			;c82c
	dec hl			;c82d
lc82eh:
	ld de,00480h		;c82e
	ld bc,00a20h		;c831
lc834h:
	ld a,(hl)			;c834
	dec a			;c835
	jr z,lc853h		;c836
	add hl,de			;c838
	ld a,(hl)			;c839
	inc a			;c83a
	jr z,lc850h		;c83b
	cp 0d3h		;c83d
	jr c,lc849h		;c83f
	cp 0d7h		;c841
	jr c,lc850h		;c843
	cp 0dbh		;c845
	jr nc,lc850h		;c847
lc849h:
	ld a,001h		;c849
	ld (lf8feh),a		;c84b
	jr lc85bh		;c84e
lc850h:
	or a			;c850
	sbc hl,de		;c851
lc853h:
	ld a,c			;c853
	add a,l			;c854
	ld l,a			;c855
	jr nc,lc859h		;c856
	inc h			;c858
lc859h:
	djnz lc834h		;c859
lc85bh:
	ld a,005h		;c85b
	or a			;c85d  ; Is it zero?
	jr z,lc867h		;c85e  ; Yes -> proceed to room check
	dec a			;c860  ; Decrement delay counter
	ld (lc85bh+1),a		;c861  ; Store decremented value
lc864h:
	jp lc8f2h		;c864  ; Skip projectile spawning (still in delay)
lc867h:
	ld a,(lefffh)		;c867  ; A = current room X
	cp 01fh		;c86a  ; Is this room $1F (final escape area)?
	jr z,lc864h		;c86c  ; If right, use right-side tile
	ld a,(lc259h+1)		;c86e  ; A = tile ahead (left)
	cp 01dh		;c871  ; Tile $1D?
	jr z,lc885h		;c873  ; Yes -> continue movement
	cp 023h		;c875  ; Tile $23?
	jr z,lc885h		;c877  ; Yes -> continue
	cp 022h		;c879  ; Tile $22?
	jr z,lc885h		;c87b  ; Yes -> continue
	cp 026h		;c87d  ; Tile $26?
	jr z,lc885h		;c87f  ; Yes -> continue
	cp 02ah		;c881  ; Tile $2A?
	jr nz,lc8f2h		;c883
lc885h:
; ==========================================================================
; PROJECTILE SPAWNING ($90ED)
; ==========================================================================
; Attempts to spawn a new projectile. Has a ~6.25% chance of spawning
; per frame (4 out of 64). Finds a free slot in the 4-projectile array,
; then configures its position, speed, and direction.
;
; --- Random chance check: ~6.25% spawn rate ---
	call sub_c5fbh		;c885  ; A = random 0-255
	and 03fh		;c888  ; Mask to 0-63
	inc a			;c88a  ; Range now 1-64
	cp 005h		;c88b  ; Is A >= 5?
	jr nc,lc8d9h		;c88d  ; Yes (60/64 = 93.75%) -> don't spawn
	ld hl,lef53h		;c88f  ; HL -> projectile array start
	ld de,00007h		;c892  ; DE = 7 (projectile struct size)
lc895h:
	add hl,de			;c895  ; HL -> next slot
	dec a			;c896  ; Decrement slot index
	jr nz,lc895h		;c897  ; Loop to selected slot
	ld a,(hl)			;c899  ; A = slot active flag
	or a			;c89a  ; Is it occupied?
	jr nz,lc8d9h		;c89b  ; Occupied -> abort spawning
	ld (hl),0e0h		;c89d  ; Byte 0: active flag + timer ($E0 = 224 frames)
	inc hl			;c89f
	ld (hl),009h		;c8a0  ; Byte 1: projectile type ($09)
	inc hl			;c8a2
	ld (hl),a			;c8a3
	inc hl			;c8a4
	ld bc,00120h		;c8a5
	ld (hl),c			;c8a8
	inc hl			;c8a9
	ld (hl),b			;c8aa
	inc hl			;c8ab
	call sub_c5fbh		;c8ac
	and e			;c8af
	add a,a			;c8b0
	ex de,hl			;c8b1
	ld hl,lb15eh		;c8b2
	add a,l			;c8b5
	ld l,a			;c8b6
	ldi		;c8b7
	ld a,(hl)			;c8b9
	ld (de),a			;c8ba
	ex de,hl			;c8bb
	call sub_c5fbh		;c8bc
	and b			;c8bf
	jr z,lc8d9h		;c8c0  ; If 0 (50%) -> don't flip, keep original direction
	ld a,(hl)			;c8c2  ; A = Y velocity
	xor 00ch		;c8c3  ; Flip direction bits
	ld (hl),a			;c8c5  ; Store flipped Y velocity
	dec hl			;c8c6
	ld a,(hl)			;c8c7  ; A = X velocity
	xor 00ch		;c8c8  ; Flip direction bits
	ld (hl),a			;c8ca  ; Store flipped X velocity
	dec hl			;c8cb
	ld d,(hl)			;c8cc  ; D = map position high
	dec hl			;c8cd
	ld a,(hl)			;c8ce
	dec hl			;c8cf
	ld (hl),c			;c8d0
	inc hl			;c8d1
	add a,c			;c8d2
	ld (hl),a			;c8d3
	jr nc,lc8d7h		;c8d4
	inc d			;c8d6
lc8d7h:
	inc hl			;c8d7
	ld (hl),d			;c8d8
lc8d9h:
	ld b,004h		;c8d9
	ld hl,lef5bh		;c8db
	ld de,00003h		;c8de
lc8e1h:
	ld a,(hl)			;c8e1
	add hl,de			;c8e2
	inc hl			;c8e3
	cp 008h		;c8e4
	jr z,lc8ech		;c8e6
	cp 00ah		;c8e8
	jr nz,lc8efh		;c8ea
lc8ech:
	ld a,(hl)			;c8ec
	xor e			;c8ed
	ld (hl),a			;c8ee
lc8efh:
	add hl,de			;c8ef
	djnz lc8e1h		;c8f0
lc8f2h:
	ld iyl,006h		;c8f2
	ld ix,lef4ch		;c8f5
	ld b,001h		;c8f9
lc8fbh:
	ld a,(ix+000h)		;c8fb
	or a			;c8fe
	jr z,lc971h		;c8ff
	ld l,(ix+003h)		;c901
	ld h,(ix+004h)		;c904
	ld de,tab1_end		;c907
	add hl,de			;c90a
	ld (hl),b			;c90b
	ld c,(ix+005h)		;c90c
	push bc			;c90f
	inc b			;c910
lc911h:
	ld l,(ix+003h)		;c911
	ld h,(ix+004h)		;c914
	bit 0,c		;c917  ; Bit 0 = move left?
	call nz,sub_cbb7h		;c919  ; Yes -> move left
	bit 1,c		;c91c  ; Bit 1 = move right?
	call nz,sub_cbd4h		;c91e  ; Yes -> move right
	bit 2,c		;c921  ; Bit 2 = move up?
	call nz,sub_cbe3h		;c923  ; Yes -> move up
	bit 3,c		;c926  ; Bit 3 = move down?
	call nz,sub_cbf1h		;c928  ; Yes -> move down
	ld de,l87b4h		;c92b
	add hl,de			;c92e
	ld a,(hl)			;c92f
	cp 0c7h		;c930
	jr nc,lc94dh		;c932
	ld c,002h		;c934
	ld de,00900h		;c936
lc939h:
	add hl,de			;c939
	ld a,iyl		;c93a
	cp 006h		;c93c
	jr nz,lc97ch		;c93e
	ld a,(hl)			;c940
	inc a			;c941
	jr z,lc97ch		;c942
	ld a,c			;c944
	ld (lfb0eh),a		;c945
	ld a,002h		;c948
	ld (0c459h),a		;c94a
lc94dh:
	ld (ix+000h),000h		;c94d
	pop bc			;c951
	jr lc971h		;c952
lc954h:
	ld c,(ix+006h)		;c954
	djnz lc911h		;c957
lc959h:
; ==========================================================================
; OBJECT RENDERING UPDATE ($923C)
; ==========================================================================
; After movement is complete, update the object's visual representation
; on the tile map. Toggles the active flag's bit 0 to create animation.
;
	pop bc			;c959  ; Restore BC (object counter + saved data)
	ld l,(ix+003h)		;c95a  ; HL = object map pointer
	ld h,(ix+004h)		;c95d
	ld de,l8c34h		;c960  ; DE = offset to tile rendering buffer
	add hl,de			;c963  ; HL -> rendering position in buffer
	ld a,(ix+000h)		;c964  ; A = object active flag
	ld (hl),a			;c967  ; Write active flag as tile data
	xor b			;c968
	ld (ix+000h),a		;c969
	ld de,lf940h		;c96c
	add hl,de			;c96f
	ld (hl),b			;c970
lc971h:
	ld de,00007h		;c971
	add ix,de		;c974
	dec iyl		;c976
	jr nz,lc8fbh		;c978
	jr lc9a7h		;c97a
lc97ch:
	dec c			;c97c
	jr z,lc984h		;c97d
	ld de,lfdbfh+1		;c97f
	jr lc939h		;c982
lc984h:
	ld a,iyl		;c984
	cp 006h		;c986
	jr z,lc954h		;c988
	add hl,de			;c98a
	ld a,(hl)			;c98b
	cp 0e0h		;c98c
	jr nc,lc954h		;c98e
	ld a,004h		;c990
	cp iyl		;c992
	adc a,000h		;c994
	ld b,a			;c996
	call ldf1dh		;c997
	ld a,001h		;c99a
	ld (lfb03h),a		;c99c
	ld a,iyl		;c99f
	cp 005h		;c9a1
	jr c,lc959h		;c9a3
	jr lc94dh		;c9a5
lc9a7h:
; ==========================================================================
; ROOM 0 SPECIAL: OUTDOOR RENDERING ($9262)
; ==========================================================================
; Room 0 (leftmost room, outdoor area) has special rendering for
; the background/sky area. Sets up rendering parameters based on
; the player's Y position to create a parallax effect.
;
	ld a,(lefffh)		;c9a7  ; A = current room X
	or a			;c9aa  ; Is it room 0?
	jr nz,lc9cdh		;c9ab  ; No -> skip outdoor rendering
	ld d,a			;c9ad  ; D = 0
	ld a,(leffch)		;c9ae  ; A = player Y position
	add a,030h		;c9b1  ; A = Y + $30 (offset into background)
	ld e,a			;c9b3  ; DE = $00xx (Y-based offset)
	ld hl,0006eh		;c9b4  ; HL = $006E (base background address)
	add hl,de			;c9b7  ; HL = $006E + player_Y + $30
	ld (lfb07h),hl		;c9b8  ; Store background render address
	ld de,l9db0h		;c9bb  ; DE -> first rendering parameter block
	ld bc,l89f4h		;c9be  ; BC -> graphics pattern table
	call sub_cf44h		;c9c1  ; Render upper background section
	ld de,la44ah		;c9c4  ; DE -> second rendering parameter block
	ld bc,tab1_end		;c9c7  ; BC -> game entry (tile workspace)
	call sub_cf44h		;c9ca  ; Render lower background section
lc9cdh:
	ld hl,lf8edh		;c9cd
	ld a,(hl)			;c9d0
	or a			;c9d1
	jr z,lca49h		;c9d2
	inc hl			;c9d4
	dec (hl)			;c9d5
	jr nz,lca03h		;c9d6
	ld a,r		;c9d8
	or a			;c9da
	or 020h		;c9db
	ld (hl),a			;c9dd
	inc hl			;c9de
	and 001h		;c9df
	jr z,lca09h		;c9e1
	call sub_c5fbh		;c9e3
	and 003h		;c9e6
	ld (hl),004h		;c9e8
	add a,a			;c9ea
	add a,000h		;c9eb
	ld (0c9f1h),a		;c9ed
	ld hl,(lf000h)		;c9f0
	ld de,lafb5h		;c9f3
	call sub_94d0h		;c9f6
lc9f9h:
	ld a,040h		;c9f9
	ld (0ca08h),a		;c9fb
	ld hl,l9ed5h		;c9fe
	jr lca21h		;ca01
lca03h:
	inc hl			;ca03
	ld a,(hl)			;ca04
	cp 004h		;ca05
	jr z,lc9f9h		;ca07
lca09h:
	call sub_c5fbh		;ca09
	and 003h		;ca0c
	cp (hl)			;ca0e
	jr nz,lca14h		;ca0f
	inc a			;ca11
	and 003h		;ca12
lca14h:
	ld (hl),a			;ca14
	add a,a			;ca15
	add a,a			;ca16
	ld b,a			;ca17
	add a,a			;ca18
	add a,b			;ca19
	ld e,a			;ca1a
	ld d,000h		;ca1b
	ld hl,l9ea5h		;ca1d
	add hl,de			;ca20
lca21h:
	ld de,l8839h		;ca21
	ld a,003h		;ca24
lca26h:
	ldi		;ca26
	ldi		;ca28
	ldi		;ca2a
	ldi		;ca2c
	ld bc,0001ch		;ca2e
	ex de,hl			;ca31
	add hl,bc			;ca32
	ex de,hl			;ca33
	dec a			;ca34
	jr nz,lca26h		;ca35
	ld de,00301h		;ca37
	ld hl,l85f9h		;ca3a
	inc c			;ca3d
lca3eh:
	ld (hl),e			;ca3e
	inc hl			;ca3f
	ld (hl),e			;ca40
	inc hl			;ca41
	ld (hl),e			;ca42
	inc hl			;ca43
	ld (hl),e			;ca44
	add hl,bc			;ca45
	dec d			;ca46
	jr nz,lca3eh		;ca47
lca49h:
	ld a,(l81f5h)		;ca49
	ld (lb7efh),a		;ca4c
	ld (lbb32h),a		;ca4f
	ld (0bb3bh),a		;ca52
	ld bc,ld080h		;ca55
	ld hl,lf8eah		;ca58
	ld a,(hl)			;ca5b
	or a			;ca5c
	ld a,b			;ca5d
	jr nz,lca61h		;ca5e
	ld a,c			;ca60
lca61h:
	ld (0d1fch),a		;ca61
	inc hl			;ca64
	ld a,(hl)			;ca65
	or a			;ca66
	ld a,b			;ca67
	jr nz,lca6bh		;ca68
	ld a,c			;ca6a
lca6bh:
	ld (0d20ah),a		;ca6b
	inc hl			;ca6e
	ld a,(hl)			;ca6f
	or a			;ca70
	ld a,b			;ca71
	jr nz,lca75h		;ca72
	ld a,c			;ca74
lca75h:
	ld (0d249h),a		;ca75
	ld a,06ah		;ca78
	ld (0ca81h),a		;ca7a
	call sub_d17fh		;ca7d
	ld a,000h		;ca80
	add a,096h		;ca82
	jr z,lcae7h		;ca84
	ld b,a			;ca86
	ld c,0b0h		;ca87
	ld a,(lfb06h)		;ca89
	cp 002h		;ca8c
	jr c,lca91h		;ca8e
	halt			;ca90
lca91h:
	ld (0cab8h),sp		;ca91
	ld sp,engine_end		;ca95
lca98h:
	pop hl			;ca98
	pop de			;ca99
	ld (hl),e			;ca9a
	inc h			;ca9b
	ld (hl),d			;ca9c
	inc h			;ca9d
	pop de			;ca9e
	ld (hl),e			;ca9f
	inc h			;caa0
	ld (hl),d			;caa1
	inc h			;caa2
	pop de			;caa3
	ld (hl),e			;caa4
	inc h			;caa5
	ld (hl),d			;caa6
	inc h			;caa7
	pop de			;caa8
	ld (hl),e			;caa9
	inc h			;caaa
	ld (hl),d			;caab
	ld a,h			;caac
	rrca			;caad
	rrca			;caae
	rrca			;caaf
	xor c			;cab0
	ld h,a			;cab1
	dec sp			;cab2
	pop de			;cab3
	ld (hl),d			;cab4
	djnz lca98h		;cab5
	ld sp,00000h		;cab7
	ld a,000h		;caba
	inc a			;cabc
	and 003h		;cabd
	ld (0cabbh),a		;cabf
	jr nz,lcae0h		;cac2
	ld hl,la644h		;cac4
	ld de,0000ah		;cac7
	or (hl)			;caca
	jr z,lcad1h		;cacb
	cp 005h		;cacd
	adc a,d			;cacf
	ld (hl),a			;cad0
lcad1h:
	ld bc,laa2ch		;cad1
	sbc hl,bc		;cad4
	add hl,bc			;cad6
	jr nz,lcadch		;cad7
	ld hl,la63ah		;cad9
lcadch:
	add hl,de			;cadc
	ld (0cac5h),hl		;cadd
lcae0h:
	ld a,(lfb03h)		;cae0
	or a			;cae3
	call nz,sub_e00fh		;cae4
lcae7h:
	ld bc,sub_fefeh		;cae7
	in a,(c)		;caea
	and 001h		;caec
	jr nz,lcb2ah		;caee
	dec b			;caf0
	in a,(c)		;caf1
	and 002h		;caf3
	jr nz,lcb07h		;caf5
	call sub_dd45h		;caf7
	ld hl,l6918h		;cafa
	ld de,05066h		;cafd
	ld c,00eh		;cb00
	call sub_d06dh		;cb02
	jr lcb1ah		;cb05
lcb07h:
	ld a,0dfh		;cb07
	in a,(0feh)		;cb09
	and 001h		;cb0b
	jr nz,lcb1dh		;cb0d
	call sub_e044h		;cb0f
lcb12h:
	ld a,0dfh		;cb12
	in a,(0feh)		;cb14
	and 001h		;cb16
	jr nz,lcb12h		;cb18
lcb1ah:
	call sub_e02dh		;cb1a
lcb1dh:
	ld a,07fh		;cb1d
	in a,(0feh)		;cb1f
	and 001h		;cb21
	jr nz,lcb2ah		;cb23  ; No match -> skip
	ld a,003h		;cb25  ; A = 3 (cheat mode value)
	ld (lf8f9h),a		;cb27  ; Set entity array header to cheat mode
lcb2ah:
	ld a,(lf8feh)		;cb2a  ; A = tile refresh flag
	or a			;cb2d  ; Is it set?
	jr z,lcb44h		;cb2e  ; No -> skip
lcb30h:
	ld a,r		;cb30  ; A = R register (pseudo-random)
	and 007h		;cb32  ; Mask to 0-7
	cp 001h		;cb34  ; Is it 1?
	jr z,lcb30h		;cb36  ; Yes -> retry (1 is reserved)
	cp 004h		;cb38  ; Is it 4?
	jr z,lcb30h		;cb3a  ; Yes -> retry (4 is reserved)
	ld (ld237h+1),a		;cb3c  ; Set screen rendering sub-state
	ld b,014h		;cb3f  ; B = 20 (bonus points)
	call ldf1dh		;cb41  ; Award 20 points
lcb44h:
	ld bc,lf8f9h		;cb44
	ld a,(bc)			;cb47
	or a			;cb48
	jr z,lcb64h		;cb49
	ld hl,lf8fah		;cb4b
	ld a,(hl)			;cb4e
	or a			;cb4f
	jr nz,lcb5fh		;cb50
	inc (hl)			;cb52
	ld hl,l9c43h		;cb53
	ld (0cc6dh),hl		;cb56
	ld hl,ld9b4h		;cb59
	ld (0c2aeh),hl		;cb5c
lcb5fh:
	ld a,(bc)			;cb5f
	cp 002h		;cb60
	jr z,lcb9ah		;cb62
lcb64h:
	ld de,02f39h		;cb64
	ld hl,lfb0dh		;cb67  ; HL -> timer prescaler byte
	dec (hl)			;cb6a  ; Prescaler--
	jr nz,lcb9ah		;cb6b  ; Not zero -> skip (not time to decrement yet)
	ld (hl),014h		;cb6d  ; Reset prescaler to 20 ($14)
	dec hl			;cb6f  ; HL -> ones digit (l993ch)
	dec (hl)			;cb70  ; Decrement digit
	ld a,d			;cb71
	cp (hl)			;cb72
	jr nz,lcb91h		;cb73
	ld (hl),e			;cb75
	dec hl			;cb76
	dec (hl)			;cb77
	cp (hl)			;cb78
	jr nz,lcb91h		;cb79
	ld (hl),e			;cb7b
	dec hl			;cb7c
	dec (hl)			;cb7d
	ld a,(hl)			;cb7e
	cp d			;cb7f
	jr nz,lcb87h		;cb80
	ld a,002h		;cb82
	ld (bc),a			;cb84
	jr lcb9ah		;cb85
lcb87h:
	cp 030h		;cb87
	jr nz,lcb91h		;cb89
	ld hl,l678ah		;cb8b
	call sub_d064h		;cb8e
lcb91h:
	ld de,05096h		;cb91
	ld hl,lfb09h		;cb94
	call sub_d06bh		;cb97
lcb9ah:
	ld hl,lfb04h		;cb9a
	ld a,(lfb06h)		;cb9d
	cp 002h		;cba0
	jr c,lcbb1h		;cba2
	ld a,(hl)			;cba4
	inc l			;cba5
	sub (hl)			;cba6
	inc l			;cba7
	sub (hl)			;cba8
	jr nc,lcbafh		;cba9
lcbabh:
	halt			;cbab
	inc a			;cbac
	jr nz,lcbabh		;cbad
lcbafh:
	ld l,004h		;cbaf
lcbb1h:
	ld a,(hl)			;cbb1
	inc l			;cbb2
	ld (hl),a			;cbb3
	jp lc243h		;cbb4  ; Jump back to $8A6F for screen flip + next frame
sub_cbb7h:
	xor a			;cbb7  ; A = 0 (left boundary)
	cp (ix+001h)		;cbb8  ; Is object at column 0?
	jr z,lcbcbh		;cbbb  ; Yes -> hit boundary, deactivate
	dec (ix+001h)		;cbbd  ; Decrement column position
	ld de,lffe0h		;cbc0  ; DE = $FFE0 (-32 map offset)
lcbc3h:
	add hl,de			;cbc3
	ld (ix+003h),l		;cbc4
	ld (ix+004h),h		;cbc7
	ret			;cbca
lcbcbh:
	ld (ix+000h),000h		;cbcb
	pop bc			;cbcf
	pop bc			;cbd0
	jp lc971h		;cbd1  ; Jump to next object in processing loop
sub_cbd4h:
	ld a,011h		;cbd4  ; A = $11 (17 = right boundary)
	cp (ix+001h)		;cbd6  ; Is object at column 17?
	jr z,lcbcbh		;cbd9  ; Yes -> hit boundary, deactivate
	inc (ix+001h)		;cbdb  ; Increment column position
	ld de,00020h		;cbde  ; DE = $0020 (+32 map offset)
	jr lcbc3h		;cbe1  ; Apply offset
sub_cbe3h:
	xor a			;cbe3  ; A = 0 (top boundary)
	cp (ix+002h)		;cbe4  ; Is object at row 0?
	jr z,lcbcbh		;cbe7  ; Yes -> hit boundary, deactivate
	dec (ix+002h)		;cbe9  ; Decrement row position
	ld de,0ffffh		;cbec  ; DE = $FFFF (-1 map offset)
	jr lcbc3h		;cbef  ; Apply offset
sub_cbf1h:
	ld a,01fh		;cbf1  ; A = $1F (31 = bottom boundary)
	cp (ix+002h)		;cbf3  ; Is object at row 31?
	jr z,lcbcbh		;cbf6  ; Yes -> hit boundary, deactivate
	inc (ix+002h)		;cbf8  ; Increment row position
	ld de,00001h		;cbfb  ; DE = $0001 (+1 map offset)
	jr lcbc3h		;cbfe  ; Apply offset
sub_cc00h:
	ld de,sub_cc00h+1		;cc00
	ld hl,0cc04h		;cc03
	bit 7,(ix+007h)		;cc06
	jr z,lcc0dh		;cc0a
	ex de,hl			;cc0c
lcc0dh:
	call sub_e09ah		;cc0d
	ld hl,00000h		;cc10
	ld bc,tab1_end		;cc13
	add hl,bc			;cc16
	ld bc,00607h		;cc17
	exx			;cc1a
	ld d,(ix+007h)		;cc1b
	res 7,d		;cc1e
	ld e,(ix+001h)		;cc20
	jp sub_d335h		;cc23
sub_cc26h:
	call sub_e09ah		;cc26
	ld hl,(leffah)		;cc29
	ld de,tab1_end		;cc2c
	add hl,de			;cc2f
	ld de,l9ae4h		;cc30
	ld bc,00607h		;cc33
	exx			;cc36
	ld de,(leffch)		;cc37
lcc3bh:
	call sub_d335h		;cc3b
	ld a,(leffdh)		;cc3e
	cp 00bh		;cc41
	ret z			;cc43
	ld hl,lcc5dh		;cc44
	ld a,(lf8ech)		;cc47
	add a,00ch		;cc4a
	ld (hl),a			;cc4c
	exx			;cc4d
	ld d,006h		;cc4e
	ld a,(leffch)		;cc50
	ld e,a			;cc53
lcc54h:
	ld a,e			;cc54
	cp 020h		;cc55
	jr nc,lcc5bh		;cc57
	ld a,(hl)			;cc59
	ld (bc),a			;cc5a
lcc5bh:
	inc e			;cc5b
	inc hl			;cc5c
lcc5dh:
	inc c			;cc5d
	dec d			;cc5e
	jr nz,lcc54h		;cc5f
	ret			;cc61
	call sub_e079h		;cc62
sub_cc65h:
	ld hl,(leffah)		;cc65
	ld de,l8c34h		;cc68
	add hl,de			;cc6b
	ld de,00000h		;cc6c
	ld (0cc31h),de		;cc6f
	ld bc,00607h		;cc73
	exx			;cc76
	ld de,(leffch)		;cc77
	jp sub_d335h		;cc7b  ; -> render sprite
sub_cc7eh:
	ld a,(lf8ech)		;cc7e  ; A = current direction
	add a,a			;cc81  ; A = direction * 2
	ld d,000h		;cc82  ; DE = direction * 2
	ld e,a			;cc84
	dec de			;cc85  ; DE = direction * 2 - 1 (movement offset)
	ld hl,leffch		;cc86
	ld a,(hl)			;cc89
	add a,e			;cc8a
	ld (hl),a			;cc8b
	ld hl,(leffah)		;cc8c  ; HL = current screen pointer
	add hl,de			;cc8f  ; HL = screen pointer + offset
	ld (leffah),hl		;cc90  ; Update screen pointer
	ret			;cc93
sub_cc94h:
	ld a,(lf8ech)		;cc94  ; A = direction
	or a			;cc97  ; Test if zero (horizontal movement)
	ld a,(leffch)		;cc98  ; A = current Y position
	jr nz,lcca4h		;cc9b
	cp 0fdh		;cc9d  ; Y == $FD (top boundary)?
	ret nz			;cc9f  ; No -> return normally
	pop hl			;cca0  ; Pop caller's return address
	jp lcedbh		;cca1  ; -> handle top room transition
lcca4h:
	cp 01dh		;cca4  ; Y == $1D (bottom boundary)?
	ret nz			;cca6  ; No -> return normally
	pop hl			;cca7  ; Pop caller's return address
	jp lcebeh		;cca8  ; -> handle bottom room transition
lccabh:
	call sub_cfe2h		;ccab  ; Handle left room boundary if at edge
	call sub_cc94h		;ccae  ; Check vertical boundaries
	call sub_cd91h		;ccb1  ; Check mission timeout
	call sub_cc7eh		;ccb4  ; Update player position
	ld b,004h		;ccb7  ; B = 4 counters to check
	ld hl,le641h		;ccb9  ; HL -> entity timeout array
lccbch:
	ld a,(hl)			;ccbc  ; A = timeout counter value
	inc a			;ccbd  ; Test if $C7 (inc -> $C8)
	cp 0c8h		;ccbe  ; Reached maximum?
	jr nc,lccdah		;ccc0  ; Yes -> abort transition early
	inc hl			;ccc2  ; Next counter
	djnz lccbch		;ccc3  ; Check all 4
	ld hl,leffdh		;ccc5
	dec (hl)			;ccc8
	ld hl,(leffah)		;ccc9  ; HL = screen pointer
	ld de,lffe0h		;cccc  ; DE = $FFE0 (-32, one row up in map)
	add hl,de			;cccf  ; Adjust screen pointer
	ld (leffah),hl		;ccd0  ; Update screen pointer
	ld hl,lf8e0h		;ccd3  ; HL -> transition frame counter
	dec (hl)			;ccd6  ; Decrement counter
	jp nz,lc2b4h		;ccd7  ; If not done, continue next frame
lccdah:
	ld a,004h		;ccda  ; A = 4 (animation cycle frames)
lccdch:
	ld hl,lf8e1h		;ccdc
	ld (hl),000h		;ccdf
	ld hl,lcceah		;cce1
	ld de,l9b22h		;cce4
	jp ldb27h		;cce7
lcceah:
	ld hl,lf8e1h		;ccea
	ld a,(hl)			;cced
	add a,002h		;ccee
	and 006h		;ccf0
	ld (hl),a			;ccf2
	add a,l			;ccf3
	inc a			;ccf4
	ld l,a			;ccf5
	ld e,(hl)			;ccf6
	inc l			;ccf7
	ld d,(hl)			;ccf8  ; D = handler high byte
	ld (0cc6dh),de		;ccf9  ; Set entity behavior handler pointer
	jr lcd24h		;ccfd  ; -> continue with common transition logic
lccffh:
	ld hl,lcd08h		;ccff  ; HL -> right transition handler
	ld de,l9cd4h		;cd02  ; DE = behavior data base
	jp ldb2ah		;cd05  ; -> enter right transition state
lcd08h:
	ld a,(le646h)		;cd08  ; A = entity interaction flag
	inc a			;cd0b  ; Test if $FF (no interaction)
	jr z,lcd24h		;cd0c  ; If $FF, skip object check
	ld de,l8e94h		;cd0e  ; DE -> right-facing interaction data
	ld a,r		;cd11
	and 003h		;cd13
	rrca			;cd15
	add a,002h		;cd16
	ld c,a			;cd18
	ld a,(lf8ech)		;cd19
	dec a			;cd1c
	jr nz,lcd21h		;cd1d
	ld e,099h		;cd1f
lcd21h:
	call sub_d5f4h		;cd21  ; Check for object interaction
lcd24h:
	call sub_cc94h		;cd24  ; Check vertical boundaries
	call sub_cd91h		;cd27  ; Check mission timeout
	call sub_cc7eh		;cd2a  ; Update position
	ld hl,lf8e0h		;cd2d  ; HL -> transition counter
	dec (hl)			;cd30  ; Decrement
	jp nz,lc2b4h		;cd31  ; Not done -> next frame
	ld (hl),006h		;cd34  ; Set 6-frame lift sequence
	ld hl,lcdfah		;cd36  ; HL -> lift handler
	jp ldb2eh		;cd39  ; -> enter lift transition
lcd3ch:
	call sub_d988h		;cd3c  ; Process lift mechanics
	call sub_cc94h		;cd3f  ; Check vertical boundaries
	call sub_d42bh		;cd42  ; Check mission timeout
	jp nc,ld9f7h		;cd45
	ld hl,ld9f7h+1		;cd48
	inc (hl)			;cd4b
	ld a,000h		;cd4c
	xor 001h		;cd4e
	ld (0cd4dh),a		;cd50
	jr z,lcd64h		;cd53
	call sub_cd91h		;cd55  ; Check mission timeout
	ld a,(le66ah)		;cd58  ; A = interaction state
	inc a			;cd5b  ; Test if $C7
	cp 0c8h		;cd5c  ; At maximum?
	jp nc,ldb08h		;cd5e  ; Yes -> end mission
	call sub_cc7eh		;cd61  ; Update position
lcd64h:
	ld hl,leffdh		;cd64
	inc (hl)			;cd67
	ld de,00020h		;cd68
	ld hl,(leffah)		;cd6b
	add hl,de			;cd6e  ; Move down
	ld (leffah),hl		;cd6f  ; Update
	ld hl,lf8e0h		;cd72  ; HL -> transition counter
	dec (hl)			;cd75  ; Decrement
	jp nz,lc2b4h		;cd76  ; Not done -> next frame
lcd79h:
	ld de,l9c43h		;cd79  ; DE = behavior data
	jp ld700h		;cd7c  ; -> mission end processing
sub_cd7fh:
	ld b,006h		;cd7f  ; B = 6 counters (default)
sub_cd81h:
	ld hl,le646h		;cd81  ; HL -> first timeout counter
	ld de,00006h		;cd84  ; DE = 6 (stride between counters)
lcd87h:
	ld a,(hl)			;cd87
	inc a			;cd88
	cp 0c8h		;cd89
	ret nc			;cd8b
	add hl,de			;cd8c
	djnz lcd87h		;cd8d
	scf			;cd8f
	ret			;cd90
sub_cd91h:
	call sub_cd7fh		;cd91
	ret c			;cd94
	pop hl			;cd95
	jr lcd79h		;cd96
sub_cd98h:
	ld a,(le66bh)		;cd98
	cp 007h		;cd9b
	ret z			;cd9d
	ld a,(le66eh)		;cd9e
	cp 007h		;cda1
	ret z			;cda3
	ld b,005h		;cda4
	call sub_cd81h		;cda6
	pop bc			;cda9
	jp nc,ldb08h		;cdaa
	ld a,(le664h)		;cdad
	inc a			;cdb0
	cp 0c8h		;cdb1
	jr c,lcdc8h		;cdb3
	ld hl,leffdh		;cdb5
	dec (hl)			;cdb8
	ld de,lffe0h		;cdb9
	ld hl,(leffah)		;cdbc
	add hl,de			;cdbf
	ld (leffah),hl		;cdc0
	call sub_cfe2h		;cdc3
	push bc			;cdc6
	ret			;cdc7
lcdc8h:
	push bc			;cdc8
	ld a,(le66dh)		;cdc9
	cp 0c7h		;cdcc
	ret nc			;cdce
	ld a,(le66ah)		;cdcf
	cp 0c7h		;cdd2
	ret nc			;cdd4
	ld hl,leffdh		;cdd5
	inc (hl)			;cdd8
	ld de,00020h		;cdd9
	ld hl,(leffah)		;cddc
	add hl,de			;cddf
	ld (leffah),hl		;cde0
	pop bc			;cde3
	call sub_d988h		;cde4  ; Process lift
	push bc			;cde7  ; Save return address
	call sub_dbc0h		;cde8  ; Update animation frame
	call sub_cc26h		;cdeb  ; Render player sprite
	call sub_dbdah		;cdee  ; Advance animation sequence
	call sub_d42bh		;cdf1  ; Check for item pickup
	ld a,005h		;cdf4
	ret nc			;cdf6
	pop bc			;cdf7
	jr lce32h		;cdf8
lcdfah:
	call sub_d988h		;cdfa
	call sub_cc94h		;cdfd
	call sub_cd91h		;ce00
	ld a,(le66ah)		;ce03
	inc a			;ce06
	cp 0c8h		;ce07
	jp nc,ldb08h		;ce09
	call sub_d42bh		;ce0c
	jp nc,ld4e3h		;ce0f
	call sub_cc7eh		;ce12
	ld hl,leffdh		;ce15
	inc (hl)			;ce18
	ld de,00020h		;ce19
	ld hl,(leffah)		;ce1c
	add hl,de			;ce1f  ; Move pointer down one row
	ld (leffah),hl		;ce20  ; Update
	ld hl,l9cf6h		;ce23  ; HL = animation sequence table
	ld (0cc6dh),hl		;ce26  ; Set entity behavior handler
	ld hl,lf8e0h		;ce29  ; HL -> transition counter
	dec (hl)			;ce2c  ; Decrement
	jp nz,lc2b4h		;ce2d  ; Not done -> next frame
	ld a,019h		;ce30  ; A = 25 frames for exit sequence
lce32h:
	ld (lf8e0h),a		;ce32  ; Set transition counter
	ld (lf8fah),a		;ce35
	ld de,l9c43h		;ce38
	ld hl,lcd3ch		;ce3b
	jp ldb2ah		;ce3e
sub_ce41h:
	ld a,(leffdh)		;ce41  ; Get player room position
	cp 0ffh		;ce44  ; Negative = facing left?
	ld de,l8a16h		;ce46  ; Default: right-side stash offset
	jp p,lce4fh		;ce49  ; Positive -> use right offset
	ld de,l8ab6h		;ce4c  ; Negative -> use left-side offset
lce4fh:
	call sub_db82h		;ce4f  ; Look up stash data
	ld hl,(leffah)		;ce52  ; Get position pointer
	add hl,de			;ce55  ; HL = stash address
	ld a,(hl)			;ce56  ; Read stash contents
	or a			;ce57  ; Is stash empty?
	ret			;ce58
lce59h:
	call sub_ce41h		;ce59
	jp z,ld454h		;ce5c
	call sub_cc94h		;ce5f
	call sub_cd98h		;ce62
	call sub_cc7eh		;ce65
	call sub_cfffh		;ce68
	ld a,(lf7feh)		;ce6b
	bit 3,a		;ce6e
	jr z,lce89h		;ce70
lce72h:
	ld a,001h		;ce72
	ld (lf8fah),a		;ce74
	ld a,004h		;ce77
	ld hl,lccabh		;ce79
lce7ch:
	ld de,l9cf6h		;ce7c
	jp ldb27h		;ce7f
lce82h:
	ld a,005h		;ce82
	ld hl,lccffh		;ce84
	jr lce7ch		;ce87
lce89h:
	bit 4,a		;ce89
	jp nz,lce82h		;ce8b
	bit 0,a		;ce8e
	jp z,ldb08h		;ce90
	jp lc2b4h		;ce93
lce96h:
	ld hl,05800h		;ce96
	ld b,024h		;ce99
	call sub_d30ch		;ce9b
	ld hl,0181eh		;ce9e  ; HL = $68CC (layer 1: background tile data)
	ld (leffeh),hl		;cea1  ; Store as layer 1 pointer
	ld hl,00504h		;cea4  ; HL = $6B0C (layer 3: overlay data)
	ld (leffch),hl		;cea7  ; Store as layer 3 pointer
	ld hl,000a4h		;ceaa  ; HL = $6D4C (layer 4: foreground data)
	ld (leffah),hl		;cead  ; Store as layer 4 pointer
	ld hl,l8491h		;ceb0  ; HL = GFX_PATTERN_TBL (layer 2: pattern lookup)
	ld (0c123h),hl		;ceb3  ; Store as layer 2 pointer
	ld a,002h		;ceb6
	ld (ld237h+1),a		;ceb8
	jp lc0a2h		;cebb
lcebeh:
	ld a,(lc259h+1)		;cebe
	cp 041h		;cec1
	jr z,lce96h		;cec3
	ld hl,leffeh		;cec5
	inc (hl)			;cec8
	ld a,0fdh		;cec9  ; A = $FD (wrap Y to top of new room)
	ld (leffch),a		;cecb  ; Set player at top of new room
	ld hl,(leffah)		;cece  ; HL = screen pointer
	ld de,lffe0h		;ced1  ; DE = $FFE0 (-32, one row up)
	add hl,de			;ced4  ; Calculate new screen position
	ld de,00001h		;ced5  ; DE = $0001 (downward direction)
	jp ld9a3h		;ced8  ; -> room entry handler
lcedbh:
	ld hl,leffeh		;cedb
	dec (hl)			;cede
	ld a,01dh		;cedf  ; A = $1D (wrap Y to bottom of new room)
	ld (leffch),a		;cee1  ; Set player at bottom of new room
	ld hl,(leffah)		;cee4  ; HL = screen pointer
	ld de,00020h		;cee7  ; DE = $0020 (+32, one row down)
	add hl,de			;ceea  ; Calculate new screen position
	ld de,0ffffh		;ceeb  ; DE = $FFFF (-1, upward direction)
	jp ld9a3h		;ceee  ; -> room entry handler
lcef1h:
	call sub_ce41h		;cef1
	jp z,ld454h		;cef4
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
	call sub_cc94h		;cef7  ; Check room boundaries
	call sub_cd98h		;cefa  ; Check mission state
	call sub_cc7eh		;cefd  ; Update position
	call sub_cfffh		;cf00  ; Play sound
	ld hl,lf8f3h		;cf03  ; HL -> lift state counter
	ld a,(hl)			;cf06  ; A = counter value
	inc a			;cf07  ; Test if $FF (inc -> 0)
	jr z,lcf2fh		;cf08  ; If $FF -> jump to input handler
	inc a			;cf0a  ; Test if $FE (inc twice -> 0)
	jr z,lcf2fh		;cf0b  ; If $FE -> jump to input handler
	dec (hl)			;cf0d  ; Decrement lift counter
	jp nz,lc2b4h		;cf0e  ; Not zero -> continue next frame
	ld b,012h		;cf11  ; B = 18 bytes to copy
	ld de,l6717h		;cf13  ; DE -> "@EXCELLENT@VALUE@" text
	ld hl,l8afbh		;cf16  ; HL = destination for first message
	call sub_d2efh		;cf19  ; Copy message to display buffer
	ld b,012h		;cf1c  ; B = 18 bytes to copy
	ld de,l6728h		;cf1e  ; DE -> "@YOU@HAVE@ESCAPED@" text
	ld hl,l8b5bh		;cf21  ; HL = destination for second message
	call sub_d2efh		;cf24  ; Copy message to display buffer
	ld a,0c8h		;cf27  ; A = $C8 (lift arrived marker)
	ld (lf8f3h),a		;cf29  ; Mark lift as arrived
	jp ldb08h		;cf2c  ; -> end mission processing
lcf2fh:
	ld a,(lf7feh)		;cf2f
	bit 3,a		;cf32  ; FIRE pressed?
	jp nz,lce72h		;cf34  ; Yes -> enter left transition
	bit 4,a		;cf37  ; DOWN pressed?
	jp nz,lce82h		;cf39  ; Yes -> enter right transition
	bit 1,a		;cf3c  ; UP pressed?
	jp z,ldb08h		;cf3e  ; No input -> end mission
	jp lc2b4h		;cf41  ; UP -> continue game loop
sub_cf44h:
	call sub_e079h		;cf44
	ld hl,lfb07h		;cf47
	ld (sub_d335h+1),hl		;cf4a
	ld hl,(lfb07h)		;cf4d
	add hl,bc			;cf50
	ld bc,00b04h		;cf51
	exx			;cf54
	ld d,005h		;cf55
lcf57h:
	ld a,(leffch)		;cf57
	sub 002h		;cf5a
	ld e,a			;cf5c
	call sub_d335h		;cf5d
	ld hl,leffah		;cf60
	ld (sub_d335h+1),hl		;cf63
	ret			;cf66
sub_cf67h:
	call sub_e079h		;cf67
	ld hl,lf8f4h		;cf6a
	ld (sub_d335h+1),hl		;cf6d
	ld hl,(leffah)		;cf70
	ld a,03eh		;cf73
	add a,l			;cf75
	ld l,a			;cf76
	jr nc,lcf7ah		;cf77
	inc h			;cf79
lcf7ah:
	ld (lf8f4h),hl		;cf7a
	add hl,bc			;cf7d
	ld bc,00b05h		;cf7e
	exx			;cf81
	ld d,00ah		;cf82
	jr lcf57h		;cf84
lcf86h:
	ld a,(leffch)		;cf86
	cp 0fdh		;cf89
	jp z,lcedbh		;cf8b
	call sub_cc7eh		;cf8e
	ld a,(lf7feh)		;cf91
	and 010h		;cf94
	jr nz,lcf9fh		;cf96
	ld hl,lf8e0h		;cf98
	dec (hl)			;cf9b
	jp nz,lc2b4h		;cf9c
lcf9fh:
	ld a,001h		;cf9f
	jp lccdch		;cfa1
lcfa4h:
	ld a,(leffch)		;cfa4
	cp 0fdh		;cfa7
	jp z,lcedbh		;cfa9
	call sub_cc7eh		;cfac
	ld a,000h		;cfaf
	xor 001h		;cfb1  ; Toggle: 0->1, 1->0
	ld (0cfb0h),a		;cfb3  ; Store toggled value
	jr nz,lcfa4h		;cfb6  ; If now 1, skip rendering this frame
	ld de,l9d7bh		;cfb8  ; DE = first message tile data
	ld bc,l89f4h		;cfbb  ; BC = offset for message area
	call sub_cf67h		;cfbe  ; Render first message block (5x11)
	ld de,la44ah		;cfc1  ; DE = second message tile data
	ld bc,tab1_end		;cfc4  ; BC = offset for message area
	call sub_cf67h		;cfc7  ; Render second message block (5x11)
	ld hl,lf8e0h		;cfca  ; HL -> transition frame counter
	dec (hl)			;cfcd  ; Decrement counter
	jp nz,lc2b4h		;cfce  ; Not done -> continue next frame
	ld de,l9d46h		;cfd1  ; DE = final message tile data
	ld bc,l89f4h		;cfd4  ; BC = offset for message area
	call sub_cf67h		;cfd7  ; Render final message block
	ld a,010h		;cfda  ; A = $10 (16: lift countdown start value)
	ld (lf8f3h),a		;cfdc  ; Set lift state counter
	jp ldb08h		;cfdf  ; -> end mission processing
sub_cfe2h:
	ld a,(leffdh)		;cfe2  ; A = player X position
	cp 0f9h		;cfe5  ; At left boundary ($F9)?
	ret nz			;cfe7  ; No -> return to caller (no transition)
	ld hl,lefffh		;cfe8  ; HL -> room state byte
	dec (hl)			;cfeb  ; Decrement room (move to left room)
	pop hl			;cfec  ; Discard caller's return address
	add a,012h		;cfed  ; A = $F9+$12 = $0B (wrap X to right side)
	ld (leffdh),a		;cfef  ; Set new player X position
	ld hl,(leffah)		;cff2  ; HL = current screen pointer
	ld de,00240h		;cff5  ; DE = $0240 (576: room width offset)
	add hl,de			;cff8  ; Adjust screen pointer for new room
	ld de,lffe0h		;cff9  ; DE = $FFE0 (-32: leftward entry direction)
	jp ld9a3h		;cffc  ; -> room entry handler
sub_cfffh:
	ld a,000h		;cfff
	xor 001h		;d001
	ld (sub_cfffh+1),a		;d003
	jr nz,ld00fh		;d006
	ld hl,l9c7ah		;d008
	ld a,09bh		;d00b
	xor (hl)			;d00d
	ld (hl),a			;d00e
ld00fh:
	ld hl,ld031h+1		;d00f
	ld a,(hl)			;d012
	ld bc,00010h		;d013
	add a,c			;d016
	ld (hl),a			;d017
	cp 0d4h		;d018
	jr nz,ld031h		;d01a
	ld (hl),094h		;d01c
	ld b,002h		;d01e
	ld a,(le66ch)		;d020
	cp 0feh		;d023
	jr z,ld029h		;d025
	ld b,00ah		;d027
ld029h:
	ld a,c			;d029
	out (0feh),a		;d02a
	xor a			;d02c
	out (0feh),a		;d02d
	djnz ld029h		;d02f
ld031h:
	ld hl,00000h		;d031
ld034h:
	ld de,l9c84h		;d034
	ldir		;d037
	ret			;d039
sub_d03ah:
	ld a,000h		;d03a
	dec a			;d03c
	jr nz,ld045h		;d03d
	in a,(01fh)		;d03f
ld041h:
	ld (lf7feh),a		;d041
	ret			;d044
ld045h:
	push hl			;d045
	push bc			;d046
	ld hl,l81c7h		;d047
	ld bc,00500h		;d04a
ld04dh:
	ld a,(hl)			;d04d  ; A = port high byte (selects keyboard row)
	in a,(0feh)		;d04e  ; Read keyboard port (0 = pressed)
	inc hl			;d050  ; HL -> bit mask
	and (hl)			;d051  ; AND with mask: 0 if target key pressed
	inc hl			;d052  ; HL -> result bit
	jr nz,ld058h		;d053  ; Non-zero = key NOT pressed -> skip
	ld a,(hl)			;d055  ; A = result bit for this key
	or c			;d056  ; Set bit in combined state
	ld c,a			;d057  ; C = updated combined state
ld058h:
	inc hl			;d058
	djnz ld04dh		;d059
	ld a,c			;d05b
	pop bc			;d05c
	pop hl			;d05d
	jr ld041h		;d05e
sub_d060h:
	ld c,001h		;d060
	jr sub_d06eh		;d062
sub_d064h:
	ld de,05066h		;d064
sub_d067h:
	ld c,00eh		;d067
	jr sub_d06dh		;d069
sub_d06bh:
	ld c,(hl)			;d06b
	inc hl			;d06c
sub_d06dh:
; ======================================================================
; code_printcore.asm
; ======================================================================
;
; Core Tile Renderer & Screen Management
;
; Address range: $9E01-$A10B (779 bytes)
; Source binary: block7_main.bin (loaded at $620C)
;
; Contains the most-called function in the entire game: PRINT_TILE
; ($9E01, 64+ references). This routine handles ALL rendering of 8x8
; pixel tiles to the screen, including text characters, background tiles,
; HUD elements, and UI graphics.
;
; Also contains:
;   SCAN_KEY ($9E30) — blocking keypress input (menu, high scores)
;   SWAP_SCREEN_BUFS ($9E3E) — full-screen tile compositor
;   COPY_DATA_BLK ($A07B) — block memory copy with offset
;   APPLY_ATTR_MASK ($A08F) — directional attribute transformation
;
; The screen compositor (SWAP_SCREEN_BUFS) is the main rendering
; pipeline: it processes an 18x32 grid of tiles, applying multi-layer
; compositing (background, overlay, foreground) with attribute masking.
; Uses self-modifying code extensively for performance.
;
; Cross-references:
;   PRINT_TILE called from: virtually every code and data file
;   SCAN_KEY called from: code_input.asm, code_uimission.asm, entry.asm
;   SWAP_SCREEN_BUFS called from: code_mainloop.asm
;   APPLY_ATTR_MASK called from: within this file (screen compositor)
;
; Memory map:
;   $9E01-$9E2F  PRINT_TILE — 8x8 tile renderer
;   $9E30-$9E3D  SCAN_KEY — wait for keypress
;   $9E3E-$A06D  SWAP_SCREEN_BUFS — full-screen tile compositor
;   $A07B-$A08E  COPY_DATA_BLK — block memory copy with offset
;   $A08F-$A0A6  APPLY_ATTR_MASK — attribute bit transformation
;   $A0A7-$A10B  Data: screen line tables and tile lookup pointers
;
; ======================================================================

; ==========================================================================
; PRINT_TILE ($9E01) — Core 8x8 Tile Renderer
; ==========================================================================
; The most-called function in the game (64+ references). Draws C tiles
; from a tile index list at HL to screen address DE.
;
; For each tile:
;   1. Read tile index byte from (HL)
;   2. Calculate font data address: index * 8 + font_base
;   3. Copy 8 bytes (8 pixel rows) to screen at DE
;   4. Advance DE to next character column
;   5. Increment HL to next tile index, decrement C
;
; On entry:
;   HL = pointer to tile index data (each byte is a character code)
;   DE = screen bitmap address ($4000-$57FF)
;   C  = number of tiles to draw (0 = 256)
;
; On exit:
;   HL = past last tile index
;   DE = past last screen position
;   C  = 0
;
; Note: The font base address at $9E0B is self-modifying (written by
; entry.asm during initialization). Default is $3C00 (ROM charset).
;
	ld a,(hl)			;d06d  ; A = tile index (character code) from source data
sub_d06eh:
	push hl			;d06e  ; Save source pointer
	ld h,000h		;d06f  ; H = 0 (prepare 16-bit index)
	add a,a			;d071  ; A = index * 2
	ld l,a			;d072  ; L = index * 2
	add hl,hl			;d073  ; HL = index * 4
	add hl,hl			;d074  ; HL = index * 8 (8 bytes per glyph)
	push de			;d075  ; Save screen destination address
	ld de,03c00h		;d076  ; DE = font base address (self-modifying: set by entry.asm)
	add hl,de			;d079  ; HL = font_base + index * 8 (-> glyph bitmap data)
	pop de			;d07a  ; Restore screen destination
	ld b,008h		;d07b  ; B = 8 pixel rows per character cell
ld07dh:
	ld a,(hl)			;d07d  ; A = glyph bitmap byte (one pixel row)
	ld (de),a			;d07e  ; Write pixel row to screen
	inc hl			;d07f  ; Next glyph data byte
ld080h:
	inc d			;d080  ; Next pixel row (D increments through screen rows)
	djnz ld07dh		;d081  ; Loop for all 8 rows
	ld a,001h		;d083
	add a,e			;d085
	ld e,a			;d086
	jr c,ld08dh		;d087
	ld a,d			;d089
	sub 008h		;d08a
	ld d,a			;d08c
ld08dh:
	pop hl			;d08d  ; Restore source tile index pointer
	inc hl			;d08e  ; Advance to next tile index
	dec c			;d08f  ; Decrement tile counter
	jr nz,sub_d06dh		;d090  ; If more tiles remain, draw next one
	ret			;d092  ; All tiles drawn, return
sub_d093h:
	xor a			;d093  ; A = 0
	ld (05c08h),a		;d094  ; Clear LAST_K system variable (no key pressed)
	push af			;d097
	push bc			;d098  ; Save updated position
	push de			;d099  ; Save screen position
	push hl			;d09a  ; Save buffer pointer
	call 002bfh		;d09b  ; Wait for key release
	pop hl			;d09e  ; Restore buffer pointer
	pop de			;d09f  ; Restore screen position
	pop bc			;d0a0  ; Restore cursor position
	pop af			;d0a1
	ld a,(05c08h)		;d0a2  ; A = LAST_K (key code from ROM scan)
	cp 05dh		;d0a5  ; Compare with $5D (']' — boundary of printable range)
	ret c			;d0a7  ; If below $5D, return with carry set (control key)
	sub 020h		;d0a8  ; Convert to uppercase: subtract $20 (space offset)
	ret			;d0aa  ; Return with key code in A
sub_d0abh:
	ld hl,le0f0h		;d0ab  ; HL -> screen flip/rendering mode flag
	ld (0d1bch),hl		;d0ae
	ld de,05800h		;d0b1
	ld hl,04000h		;d0b4
	exx			;d0b7
	ld hl,l89f4h		;d0b8
	ld ix,l64feh		;d0bb
	ld d,0e0h		;d0bf
	ld bc,00002h		;d0c1
ld0c4h:
	push bc			;d0c4
	push hl			;d0c5
	ld a,(hl)			;d0c6
	ex af,af'			;d0c7
	ld bc,lfdbfh+1		;d0c8
	add hl,bc			;d0cb
	ld a,(hl)			;d0cc
	cp ixh		;d0cd
	jr nz,ld0d8h		;d0cf
	ex af,af'			;d0d1
	cp ixl		;d0d2
	jp z,ld112h		;d0d4
	ex af,af'			;d0d7
ld0d8h:
	ld l,a			;d0d8
	ld ixh,a		;d0d9
	ld h,05eh		;d0db
	ld a,(hl)			;d0dd
	inc h			;d0de
	ld e,0f0h		;d0df
	ld h,(hl)			;d0e1
	ld l,a			;d0e2
	ldi		;d0e3
	ldi		;d0e5
	ldi		;d0e7
	ldi		;d0e9
	ldi		;d0eb
	ldi		;d0ed
	ldi		;d0ef
	ldi		;d0f1
	ld a,(hl)			;d0f3
	ld (de),a			;d0f4
	ex af,af'			;d0f5
	ld ixl,a		;d0f6
	inc a			;d0f8
	jp z,ld112h		;d0f9
	cp 033h		;d0fc
	jr c,ld159h		;d0fe
	cp 0e5h		;d100
	ld l,a			;d102
	jr nc,ld153h		;d103
	ld h,05eh		;d105
	ld e,(hl)			;d107
	inc h			;d108
	ld d,(hl)			;d109
	ld hl,00bcfh		;d10a
	call sub_d2d7h		;d10d
ld110h:
	ld a,(hl)			;d110
ld111h:
	ld (de),a			;d111
ld112h:
	exx			;d112
	ld bc,le0f0h		;d113
	ld a,(bc)			;d116
	ld (hl),a			;d117
	inc h			;d118
	inc c			;d119
	ld a,(bc)			;d11a
	ld (hl),a			;d11b
	inc h			;d11c
	inc c			;d11d
	ld a,(bc)			;d11e
	ld (hl),a			;d11f
	inc h			;d120
	inc c			;d121
	ld a,(bc)			;d122
	ld (hl),a			;d123
	inc h			;d124
	inc c			;d125
	ld a,(bc)			;d126
	ld (hl),a			;d127
	inc h			;d128
	inc c			;d129
	ld a,(bc)			;d12a
	ld (hl),a			;d12b
	inc h			;d12c
	inc c			;d12d
	ld a,(bc)			;d12e
	ld (hl),a			;d12f
	inc h			;d130
	inc c			;d131
	ld a,(bc)			;d132
	ld (hl),a			;d133
	inc c			;d134
	ld a,(bc)			;d135
	ld (de),a			;d136
	ld bc,lf901h		;d137
	add hl,bc			;d13a
	inc de			;d13b
	exx			;d13c
	pop hl			;d13d
	pop bc			;d13e
	inc hl			;d13f
	dec b			;d140
	jp nz,ld0c4h		;d141
	dec c			;d144
	ret m			;d145
	jr nz,ld14ah		;d146
	ld b,040h		;d148
ld14ah:
	exx			;d14a
	ld a,007h		;d14b
	add a,h			;d14d
	ld h,a			;d14e
	exx			;d14f
	jp ld0c4h		;d150
ld153h:
	call sub_d2cfh		;d153
	jp ld111h		;d156
ld159h:
	ld h,000h		;d159
	ld d,h			;d15b
	ld e,a			;d15c
	add a,a			;d15d
	add a,a			;d15e
	ld l,a			;d15f
	add hl,hl			;d160
	add hl,hl			;d161
	add hl,de			;d162  ; HL = index * 17 (adjust for structure)
	ld de,lb4afh		;d163  ; DE = $A0B9 (pattern data base offset)
	add hl,de			;d166  ; HL = pattern graphic data address
	ld de,le0f0h		;d167  ; DE = screen line buffer
	ld b,004h		;d16a  ; B = 4 (iterations, 2 rows each = 8 pixel rows)
ld16ch:
	ld a,(de)			;d16c  ; A = screen buffer byte
	and (hl)			;d16d  ; AND with pattern mask
	inc hl			;d16e  ; Advance to pattern data byte
	or (hl)			;d16f  ; OR pattern data onto masked screen
	inc hl			;d170  ; Next mask+data pair
	ld (de),a			;d171  ; Store composited result
	inc e			;d172
	ld a,(de)			;d173
	and (hl)			;d174
	inc hl			;d175
	or (hl)			;d176
	inc hl			;d177
	ld (de),a			;d178
	inc e			;d179
	djnz ld16ch		;d17a
	jp ld110h		;d17c
sub_d17fh:
	ld de,le0e2h		;d17f
	ld (0d1bch),de		;d182
	dec de			;d186
	dec de			;d187
	exx			;d188
	ld hl,0d1eah		;d189
	ld a,(hl)			;d18c
	xor 004h		;d18d
	ld (hl),a			;d18f
	ld hl,tab1_end		;d190
	ld bc,00241h		;d193
ld196h:
	ld a,001h		;d196
	cpir		;d198
	ret po			;d19a
	push hl			;d19b
	dec hl			;d19c
	push bc			;d19d
	ld (hl),h			;d19e
	push hl			;d19f
	ld de,00240h		;d1a0
	add hl,de			;d1a3
	ld a,(hl)			;d1a4
	add hl,de			;d1a5
	ld b,(hl)			;d1a6
	ld iyl,b		;d1a7
	add hl,de			;d1a9
	ld b,(hl)			;d1aa
	ld iyh,b		;d1ab
	ld (hl),0ffh		;d1ad
	add hl,de			;d1af
	ld c,(hl)			;d1b0
	add hl,de			;d1b1
	ld b,(hl)			;d1b2
	ld ixh,b		;d1b3
	ld h,05eh		;d1b5
	ld l,a			;d1b7
	ex af,af'			;d1b8
	ld b,(hl)			;d1b9
	inc h			;d1ba
	ld de,00000h		;d1bb
	ld h,(hl)			;d1be
	ld l,b			;d1bf
	ldi		;d1c0
	ldi		;d1c2
	ldi		;d1c4
	ldi		;d1c6
	ldi		;d1c8
	ldi		;d1ca
	ldi		;d1cc
	ldi		;d1ce
	ld a,(hl)			;d1d0
	ld ixl,a		;d1d1
	ld a,019h		;d1d3
	ld (ld21ch+1),a		;d1d5
	ld a,008h		;d1d8
	add a,c			;d1da
	ld l,a			;d1db
	inc a			;d1dc
	jr z,ld1feh		;d1dd
	ld c,000h		;d1df
	cp 0a4h		;d1e1
	jr c,ld1efh		;d1e3
	cp 0a7h		;d1e5
	jr nc,ld1efh		;d1e7
	ld c,002h		;d1e9
	xor a			;d1eb
	ld (ld21ch+1),a		;d1ec
ld1efh:
	ld a,ixl		;d1ef
	and 0f8h		;d1f1
	or c			;d1f3
	ld ixl,a		;d1f4
	ld h,060h		;d1f6
	ld e,(hl)			;d1f8
	inc h			;d1f9
	ld d,(hl)			;d1fa
	call sub_95d0h		;d1fb
ld1feh:
	ld a,ixh		;d1fe
	ld l,a			;d200
	inc a			;d201
	jr z,ld212h		;d202
	ld h,060h		;d204
	ld e,(hl)			;d206
	inc h			;d207
	ld d,(hl)			;d208
	call sub_95d0h		;d209
	ld a,ixl		;d20c
	and 0f8h		;d20e
	ld ixl,a		;d210
ld212h:
	ld a,iyh		;d212
	ld l,a			;d214
	inc a			;d215
	jr z,ld24bh		;d216
	cp 0d3h		;d218
	jr nc,ld227h		;d21a
ld21ch:
	jr ld237h		;d21c
	push hl			;d21e
	ld b,003h		;d21f
	call ldf1dh		;d221
	pop hl			;d224
	jr ld240h		;d225
ld227h:
	cp 0d7h		;d227
	jr c,ld22fh		;d229
	cp 0dbh		;d22b
	jr c,ld21ch		;d22d
ld22fh:
	ex af,af'			;d22f
	dec a			;d230
	jr nz,ld240h		;d231
	ld c,007h		;d233
	jr ld239h		;d235
ld237h:
	ld c,000h		;d237
ld239h:
	ld a,ixl		;d239
	and 0f8h		;d23b
	or c			;d23d
	ld ixl,a		;d23e
ld240h:
	ld h,060h		;d240
	ld e,(hl)			;d242
	inc h			;d243
	ld a,(hl)			;d244
	add a,008h		;d245
	ld d,a			;d247
	call sub_95d0h		;d248
ld24bh:
	inc iyl		;d24b
	jp z,ld27bh		;d24d
	ld a,iyl		;d250
	cp 033h		;d252
	jr c,ld2a8h		;d254
	cp 0e5h		;d256
	ld l,a			;d258
	jr nc,ld2a3h		;d259
	ld h,05eh		;d25b
	ld e,(hl)			;d25d
	inc h			;d25e
	ld d,(hl)			;d25f
	ld hl,00bcfh		;d260
	add hl,de			;d263
	ld de,(0d1bch)		;d264
	ldi		;d268
	ldi		;d26a
	ldi		;d26c
	ldi		;d26e
	ldi		;d270
	ldi		;d272
	ldi		;d274
	ldi		;d276
ld278h:
	ld a,(hl)			;d278
ld279h:
	ld ixl,a		;d279
ld27bh:
	exx			;d27b
	pop hl			;d27c
	ld bc,l7a8ch		;d27d
	add hl,bc			;d280
	ld a,l			;d281
	ld (de),a			;d282
	inc de			;d283
	ld b,0fbh		;d284
	ld c,h			;d286
	ld a,(bc)			;d287
	ld (de),a			;d288
	ld hl,00009h		;d289
	add hl,de			;d28c
	ld a,ixl		;d28d
	ld (hl),a			;d28f
	inc hl			;d290
	ld d,h			;d291
	ld e,l			;d292
	inc hl			;d293
	inc hl			;d294
	ld (0d1bch),hl		;d295
	ld hl,0ca81h		;d298
	inc (hl)			;d29b
	exx			;d29c
	pop bc			;d29d
	pop hl			;d29e
	jp nz,ld196h		;d29f
	ret			;d2a2
ld2a3h:
	call sub_d2cfh		;d2a3
	jr ld279h		;d2a6
ld2a8h:
	ld h,000h		;d2a8
	ld d,h			;d2aa
	ld e,a			;d2ab
	add a,a			;d2ac
	add a,a			;d2ad
	ld l,a			;d2ae
	add hl,hl			;d2af
	add hl,hl			;d2b0
	add hl,de			;d2b1
	ld de,lb4afh		;d2b2
	add hl,de			;d2b5
	ld de,(0d1bch)		;d2b6
	ld b,004h		;d2ba
ld2bch:
	ld a,(de)			;d2bc
	and (hl)			;d2bd
	inc hl			;d2be
	or (hl)			;d2bf
	ld (de),a			;d2c0
	inc hl			;d2c1
	inc de			;d2c2
	ld a,(de)			;d2c3
	and (hl)			;d2c4
	inc hl			;d2c5
	or (hl)			;d2c6
	ld (de),a			;d2c7
	inc hl			;d2c8
	inc de			;d2c9
	djnz ld2bch		;d2ca
	jp ld278h		;d2cc
sub_d2cfh:
	ld h,060h		;d2cf
	ld e,(hl)			;d2d1
	inc h			;d2d2
	ld d,(hl)			;d2d3
	ld hl,lfff8h		;d2d4
sub_d2d7h:
	add hl,de			;d2d7
	ld de,(0d1bch)		;d2d8
	ldi		;d2dc
	ldi		;d2de
	ldi		;d2e0
	ldi		;d2e2
	ldi		;d2e4
	ldi		;d2e6
	ldi		;d2e8
	ldi		;d2ea
	ld a,030h		;d2ec
	ret			;d2ee
sub_d2efh:
; ==========================================================================
; COPY_DATA_BLK ($A07B) — Block Memory Copy with Offset
; ==========================================================================
; Copies B bytes from (DE) to (HL), adding $A4 to each byte.
; Then fills the same number of bytes backward with $01.
; Used for entity data initialization and screen state setup.
;
; On entry:
;   DE = source data pointer
;   HL = destination pointer
;   B  = number of bytes to copy
;
	ld c,b			;d2ef  ; C = save byte count for second pass
ld2f0h:
	ld a,(de)			;d2f0  ; A = source byte
	add a,0a4h		;d2f1  ; A += $A4 (offset transformation)
	ld (hl),a			;d2f3  ; Store transformed byte at destination
	inc de			;d2f4  ; Next source byte
	inc hl			;d2f5  ; Next destination byte
	djnz ld2f0h		;d2f6  ; Loop for all B bytes
	ld a,c			;d2f8
	cp 00bh		;d2f9
	ret c			;d2fb
	ld b,c			;d2fc
	ld de,0fb80h		;d2fd
	add hl,de			;d300
ld301h:
	dec hl			;d301
	ld (hl),001h		;d302
	djnz ld301h		;d304
	ret			;d306
	ld hl,l8c34h		;d307
	ld b,024h		;d30a
sub_d30ch:
	ld a,0ffh		;d30c
sub_d30eh:
	ld d,000h		;d30e
	ld e,b			;d310
sub_d311h:
	ex de,hl			;d311
	add hl,hl			;d312
	add hl,hl			;d313
	add hl,hl			;d314
	add hl,hl			;d315
	add hl,de			;d316
	ld d,a			;d317
	ld e,a			;d318
sub_d319h:
	ld (0d32ah),sp		;d319
	di			;d31d
	ld sp,hl			;d31e
ld31fh:
	push de			;d31f
	push de			;d320
	push de			;d321
	push de			;d322
	push de			;d323
	push de			;d324
	push de			;d325
	push de			;d326
	djnz ld31fh		;d327
	ld sp,00000h		;d329
	ei			;d32c
	ret			;d32d
	ld b,048h		;d32e
	ld hl,l8e74h		;d330
	jr sub_d30ch		;d333
sub_d335h:
	ld hl,(leffah)		;d335
	ld bc,l87b4h		;d338
	add hl,bc			;d33b
	ld bc,le640h		;d33c
	ld a,(lf8ech)		;d33f
	dec a			;d342
	jr z,ld3a3h		;d343
	exx			;d345
	ld a,b			;d346
	ld (ld35ah+1),a		;d347
	ld a,020h		;d34a
	sub b			;d34c
	ld (0d37bh),a		;d34d
	ld (0d380h),a		;d350
	exx			;d353
	bit 7,d		;d354
	jr nz,ld38dh		;d356
ld358h:
	ld d,e			;d358
	exx			;d359
ld35ah:
	ld b,006h		;d35a
ld35ch:
	exx			;d35c
	ld a,e			;d35d
	cp 020h		;d35e
	jr nc,ld371h		;d360
	ld a,(hl)			;d362
ld363h:
	nop			;d363
	cp 0c7h		;d364
	jr nc,ld371h		;d366
	exx			;d368
	ld a,(de)			;d369
ld36ah:
	inc a			;d36a
	jr z,ld370h		;d36b
ld36dh:
	ld a,001h		;d36d
ld36fh:
	ld (hl),a			;d36f
ld370h:
	exx			;d370
ld371h:
	inc e			;d371
	inc hl			;d372
	inc c			;d373
	exx			;d374
	inc hl			;d375
	inc de			;d376
	djnz ld35ch		;d377
	ld a,c			;d379
	ld c,020h		;d37a
	add hl,bc			;d37c
	ld c,a			;d37d
	exx			;d37e
	ld a,000h		;d37f
	add a,l			;d381
	ld l,a			;d382
	jr nc,ld386h		;d383
	inc h			;d385
ld386h:
	ld e,d			;d386
	exx			;d387
	dec c			;d388
	jp nz,ld35ah		;d389
	ret			;d38c
ld38dh:
	call sub_d409h		;d38d
	ret z			;d390
	jr ld358h		;d391
	push hl			;d393
	ld a,l			;d394
	sub 040h		;d395
	ld l,a			;d397
	ld a,h			;d398
	sbc a,002h		;d399
	ld h,a			;d39b
	ld (hl),001h		;d39c
	pop hl			;d39e
	ld a,(de)			;d39f
	jp ld36fh		;d3a0
ld3a3h:
	ld c,045h		;d3a3
	exx			;d3a5
	ld a,b			;d3a6
	ld (ld3b7h+1),a		;d3a7
	dec a			;d3aa
	add a,e			;d3ab
	ld e,a			;d3ac
	jr nc,ld3b0h		;d3ad
	inc d			;d3af
ld3b0h:
	exx			;d3b0
	bit 7,d		;d3b1
	jr nz,ld3f3h		;d3b3
ld3b5h:
	ld d,e			;d3b5
	exx			;d3b6
ld3b7h:
	ld b,006h		;d3b7
ld3b9h:
	exx			;d3b9
	ld a,e			;d3ba
	cp 020h		;d3bb
	jr nc,ld3ceh		;d3bd
	ld a,(hl)			;d3bf
ld3c0h:
	nop			;d3c0
	cp 0c7h		;d3c1
	jr nc,ld3ceh		;d3c3
	exx			;d3c5
	ld a,(de)			;d3c6
ld3c7h:
	inc a			;d3c7
	jr z,ld3cdh		;d3c8
ld3cah:
	ld a,001h		;d3ca
ld3cch:
	ld (hl),a			;d3cc
ld3cdh:
	exx			;d3cd
ld3ceh:
	inc e			;d3ce
	inc hl			;d3cf
	dec c			;d3d0
	exx			;d3d1
	inc hl			;d3d2
	dec de			;d3d3
	djnz ld3b9h		;d3d4
	ld a,c			;d3d6
	ld c,01ah		;d3d7
	add hl,bc			;d3d9
	ex de,hl			;d3da
	ld c,00ch		;d3db
	add hl,bc			;d3dd
	ex de,hl			;d3de
	ld c,a			;d3df
	exx			;d3e0
	ld a,01ah		;d3e1
	add a,l			;d3e3
	ld l,a			;d3e4
	jr nc,ld3e8h		;d3e5
	inc h			;d3e7
ld3e8h:
	ld e,d			;d3e8
	ld a,00ch		;d3e9
	add a,c			;d3eb
	ld c,a			;d3ec
	exx			;d3ed
	dec c			;d3ee
	jp nz,ld3b7h		;d3ef
	ret			;d3f2
ld3f3h:
	call sub_d409h		;d3f3
	ret z			;d3f6
	jr ld3b5h		;d3f7
	push hl			;d3f9
	ld a,l			;d3fa
	sub 040h		;d3fb
	ld l,a			;d3fd
	ld a,h			;d3fe
	sbc a,002h		;d3ff
	ld h,a			;d401
	ld (hl),001h		;d402
	pop hl			;d404
	ld a,(de)			;d405
	jp ld3cch		;d406
sub_d409h:
	ld a,020h		;d409
	add a,l			;d40b
	ld l,a			;d40c
	jr nc,ld410h		;d40d
	inc h			;d40f
ld410h:
	exx			;d410
	ld a,b			;d411
	exx			;d412
	add a,c			;d413
	ld c,a			;d414
	exx			;d415
	ld a,020h		;d416
	add a,l			;d418
	ld l,a			;d419
	jr nc,ld41dh		;d41a
	inc h			;d41c
ld41dh:
	ld a,b			;d41d
	add a,e			;d41e
	ld e,a			;d41f
	jr nc,ld423h		;d420
	inc d			;d422
ld423h:
	dec c			;d423
	ret z			;d424
	exx			;d425
	inc d			;d426
	jr nz,sub_d409h		;d427
	inc d			;d429
	ret			;d42a
sub_d42bh:
	ld hl,le66bh		;d42b
	ld bc,004c8h		;d42e
ld431h:
	ld a,(hl)			;d431
	inc a			;d432
	cp c			;d433
	ret nc			;d434
	inc hl			;d435
	djnz ld431h		;d436
	ret			;d438
ld439h:
	call sub_ce41h		;d439
	jr z,ld454h		;d43c
	ld a,(lf7feh)		;d43e
	bit 4,a		;d441  ; DOWN pressed?
	jp z,ld45ah		;d443  ; No -> check LEFT instead
	ld a,001h		;d446  ; Start 1-frame transition
	ld (lf8e0h),a		;d448  ; Set transition counter
	ld hl,ld4a7h		;d44b  ; Handler: item transition logic
	ld de,l9b3fh		;d44e  ; Animation: pickup sequence
	jp ldb2ah		;d451  ; Install handler + animation
ld454h:
	inc a			;d454
	ld (lf8fdh),a		;d455
	jr ld45fh		;d458
ld45ah:
	bit 2,a		;d45a
	jp z,ldb08h		;d45c
ld45fh:
	ld a,(lf7feh)		;d45f
	bit 1,a		;d462
	jr z,ld487h		;d464
	ld a,(lf8ech)		;d466
	dec a			;d469
	jp z,lc2b1h		;d46a
	call sub_d49eh		;d46d
	ld de,l9df1h		;d470
	ld hl,ldb8ah		;d473
	jp ldb2ah		;d476
ld479h:
	bit 3,a		;d479
	jp z,lc2b4h		;d47b
	ld hl,ld439h		;d47e
	ld de,l9b7fh		;d481
	jp ld897h		;d484
ld487h:
	bit 0,a		;d487
	jr z,ld479h		;d489
	ld a,(lf8ech)		;d48b
	or a			;d48e
	jp z,lc2b0h		;d48f
	call sub_d49eh		;d492
	ld de,l9df1h		;d495
	ld hl,ldb34h		;d498
	jp ldb2ah		;d49b
sub_d49eh:
	ld a,(lf8fdh)		;d49e
	or a			;d4a1
	ret nz			;d4a2
	pop hl			;d4a3
	jp lc2b4h		;d4a4  ; No input -> return to game loop
ld4a7h:
	ld a,(lf8e0h)		;d4a7  ; Get transition countdown
	or a			;d4aa  ; Active?
	jr z,ld4dbh		;d4ab  ; No -> skip to cleanup
	ld a,(le664h)		;d4ad  ; Load adjacent tile (above)
	inc a			;d4b0  ; Check for $FF (empty)
	jr z,ld4c3h		;d4b1  ; Empty -> skip upper interaction
	ld de,l8f34h		;d4b3  ; Right-side upper tile offset
	ld c,001h		;d4b6
	ld a,(lf8ech)		;d4b8
	dec a			;d4bb
	jr nz,ld4c0h		;d4bc
	ld e,039h		;d4be
ld4c0h:
	call sub_d5f4h		;d4c0  ; Interact with upper tile
ld4c3h:
	ld a,(le658h)		;d4c3  ; Load tile below player
	inc a			;d4c6  ; Check for $FF (empty)
	jr z,ld4d7h		;d4c7  ; Empty -> skip lower interaction
	ld de,l8ef4h		;d4c9  ; Right-side lower tile offset
	ld a,(lf8ech)		;d4cc  ; Check direction
	dec a			;d4cf  ; Facing right?
	jr nz,ld4d4h		;d4d0  ; No -> use right offset
	ld e,0f9h		;d4d2
ld4d4h:
	call sub_d5f4h		;d4d4
ld4d7h:
	xor a			;d4d7
	ld (lf8e0h),a		;d4d8
ld4dbh:
	ld a,(lf7feh)		;d4db
	bit 4,a		;d4de  ; DOWN pressed?
	jp nz,lc2b4h		;d4e0  ; Yes -> return to game loop
ld4e3h:
	xor a			;d4e3
	ld (lf8fah),a		;d4e4  ; Clear entity count
	ld hl,ld439h		;d4e7  ; Point to main object dispatcher
	ld de,l9b7fh		;d4ea  ; Standard animation sequence
	jp ldb2ah		;d4ed  ; Re-install as active handler
ld4f0h:
; ==========================================================================
; STASH ANIMATION HANDLER ($AF45)
; ==========================================================================
; Countdown-driven handler for stash search animation. On each frame,
; shifts sprite data left through the SPRITE_BASE buffer. When a
; "search" frame (type 4) completes, draws a random item tile on the
; HUD and awards 100 points.
;
	ld hl,lf8e0h		;d4f0  ; Point to transition countdown
	dec (hl)			;d4f3  ; Decrement counter
	jp nz,lc2b4h		;d4f4  ; Not zero -> wait another frame
	ld hl,(lf8f0h)		;d4f7  ; Get sprite data table
	ld a,(hl)			;d4fa  ; Save first sprite byte (current frame)
	ld (lf8f2h),a		;d4fb  ; Store in temp variable
	ld b,005h		;d4fe  ; 5 sprite entries to shift
ld500h:
	inc hl			;d500  ; Point to next entry
	ld a,(hl)			;d501  ; Read it
	dec hl			;d502  ; Back to current slot
	ld (hl),a			;d503  ; Copy next -> current (shift left)
	inc hl			;d504  ; Advance to next
	cp 003h		;d505  ; End-of-sequence marker?
	jr z,ld50bh		;d507  ; Yes -> stop shifting
	djnz ld500h		;d509  ; Loop remaining entries
ld50bh:
	dec hl			;d50b  ; HL = last valid entry
	ld a,(lf8f2h)		;d50c  ; Recover saved frame type
	cp 004h		;d50f  ; Is it type 4 (stash search frame)?
	jr nz,ld537h		;d511  ; No -> handle as normal completion
	ld (hl),003h		;d513
	ld hl,(lef83h)		;d515
	inc hl			;d518
	ld (lef83h),hl		;d519
	ex de,hl			;d51c
	ld hl,lef85h		;d51d  ; Point to search counter
	inc (hl)			;d520  ; Increment items searched
	dec hl			;d521  ; Point to item type variable
	ld a,r		;d522  ; Read R register (pseudo-random)
	and 001h		;d524  ; Random bit: 0 or 1
	add a,025h		;d526  ; $25 or $26 -> random item tile
	call sub_d060h		;d528
	ld de,00104h		;d52b
	call sub_dbdfh		;d52e
	call sub_e04ah		;d531
	jp ldb08h		;d534
ld537h:
	ld b,000h		;d537
	ld a,000h		;d539
	or a			;d53b  ; Is entity visible?
	jr nz,ld540h		;d53c  ; Yes -> keep B=0
	ld b,080h		;d53e  ; No -> set bit 7 (invisible flag)
ld540h:
	ld a,(lef76h)		;d540  ; Load current interaction state
	or a			;d543  ; Has state?
	jr nz,ld549h		;d544  ; Yes -> use existing state
	ld b,a			;d546
	ld a,003h		;d547
ld549h:
	or b			;d549
	ld (hl),a			;d54a
	jp p,ld553h		;d54b
	ld a,001h		;d54e
	ld (0d53ah),a		;d550  ; Mark entity as visible
ld553h:
	ld a,(lf8f2h)		;d553  ; Recover saved sprite frame type
	bit 7,a		;d556  ; High bit = "show message" flag?
	jr z,ld56dh		;d558  ; No message -> skip display
	and 07fh		;d55a  ; Strip message flag, keep type
	ex af,af'			;d55c
	ld hl,l8f8fh		;d55d
	ld (05adbh),hl		;d560
	ld (05addh),hl		;d563
	ld hl,l6760h		;d566
	call sub_d064h		;d569
	ex af,af'			;d56c
ld56dh:
	cp 003h		;d56d  ; State = 3 (complete)?
	jr nz,ld572h		;d56f  ; No -> store as-is
	xor a			;d571  ; State 3 -> reset to 0
ld572h:
	ld (lef76h),a		;d572  ; Store updated interaction state
	call sub_d6a5h		;d575  ; Reinitialize object state
	jp ldb08h		;d578  ; End interaction
ld57bh:
	ld a,(le64ch)		;d57b  ; Check for adjacent entity
	inc a			;d57e  ; $FF (none) -> 0
	jr z,ld5e5h		;d57f  ; No entity nearby -> exit
	ld a,(lef76h)		;d581  ; Load interaction state (held item)
	or a			;d584
	jr z,ld5cfh		;d585  ; -> handle transition animation only
	ld a,(lf8ech)		;d587  ; Get player direction
	dec a			;d58a  ; Facing right (1->0)?
	ld bc,00804h		;d58b  ; Right: Y-offset=5, X-offset=8
	ld de,00044h		;d58e  ; Right: map offset=69
	jr z,ld598h		;d591  ; Yes -> use right-side values
	ld bc,00401h		;d593  ; Left: Y-offset=0, X-offset=4
	ld e,041h		;d596
ld598h:
	ld hl,(leffah)		;d598
	add hl,de			;d59b
	ld (lef4fh),hl		;d59c
	ld hl,(leffch)		;d59f
	ld a,c			;d5a2
	add a,l			;d5a3
	inc h			;d5a4
	inc h			;d5a5
	ld l,h			;d5a6
	ld h,a			;d5a7
	ld (lef4dh),hl		;d5a8
	ld hl,lef76h		;d5ab
	ld a,(hl)			;d5ae
	ld (hl),000h		;d5af
	add a,a			;d5b1
	add a,0d0h		;d5b2
	ld (lef4ch),a		;d5b4
	ld hl,lef51h		;d5b7
	ld (hl),b			;d5ba
	inc hl			;d5bb
	ld a,(lf7feh)		;d5bc
	bit 3,a		;d5bf
	jr nz,ld5c8h		;d5c1
	and 004h		;d5c3
	jr z,ld5c9h		;d5c5
	inc b			;d5c7
ld5c8h:
	inc b			;d5c8
ld5c9h:
	ld (hl),b			;d5c9
	call sub_d6a2h		;d5ca
	jr ld5e5h		;d5cd
ld5cfh:
	ld a,(lf8e0h)		;d5cf
	or a			;d5d2
	jr z,ld5e9h		;d5d3
	ld de,l8e94h		;d5d5
	ld c,001h		;d5d8
	ld a,(lf8ech)		;d5da
	dec a			;d5dd
	jr nz,ld5e2h		;d5de
	ld e,099h		;d5e0
ld5e2h:
	call sub_d5f4h		;d5e2
ld5e5h:
	xor a			;d5e5
	ld (lf8e0h),a		;d5e6
ld5e9h:
	ld a,(lf7feh)		;d5e9
	bit 4,a		;d5ec  ; DOWN pressed?
	jp z,ldb08h		;d5ee  ; No -> end interaction
	jp lc2b4h		;d5f1  ; Yes -> return to game loop
sub_d5f4h:
	ld hl,(leffah)		;d5f4  ; Get player map pointer
	add hl,de			;d5f7  ; Add tile offset
	ld a,(hl)			;d5f8  ; Read tile at target
	inc a			;d5f9  ; Check for $FF (empty)
	jr z,ld613h		;d5fa  ; Empty -> check 2 rows below
	cp 0a4h		;d5fc
	jr c,ld604h		;d5fe
	cp 0a7h		;d600
	jr c,ld613h		;d602
ld604h:
	ld a,001h		;d604
ld606h:
	ld (lfb0eh),a		;d606
	ld a,001h		;d609
	ld (lf8e0h),a		;d60b
	ld a,c			;d60e
	ld (0c459h),a		;d60f  ; Start 1-frame transition
	ret			;d612
ld613h:
	ld de,00240h		;d613  ; Offset = 2 rows (2*$120 = $240)
	add hl,de			;d616  ; Point 2 rows below target
	ld a,(hl)			;d617  ; Read that tile
	inc a			;d618  ; Check for $FF (empty)
	ret z			;d619  ; Empty -> nothing to interact with
	ld a,002h		;d61a  ; Interaction type 2 (tile below)
	jr ld606h		;d61c  ; -> store type and set transition
ld61eh:
	ld a,002h		;d61e  ; 2-frame transition
	ld (lf8e0h),a		;d620
	ld hl,ld62ch		;d623  ; Frame handler address
	ld de,l9d1eh		;d626  ; Animation sequence
	jp ldb2ah		;d629  ; Install handler
ld62ch:
	ld hl,lf8e0h		;d62c  ; Point to countdown
	dec (hl)			;d62f  ; Decrement
	jr nz,ld63bh		;d630  ; Not done -> animate
	ld hl,ldb08h		;d632  ; Completion handler (jp END_MISSION)
	ld de,l9cf6h		;d635  ; Standard animation table
	jp ldb2ah		;d638  ; Install completion handler
ld63bh:
	ld a,(le647h)		;d63b  ; Load nearby entity tile
	inc a			;d63e  ; Check for $FF (none)
	jr z,ld651h		;d63f  ; No entity -> return to loop
	ld de,l8e95h		;d641  ; Right-side interaction offset
	ld c,002h		;d644
	ld a,(lf8ech)		;d646
	dec a			;d649
	jr nz,ld64eh		;d64a
	ld e,098h		;d64c
ld64eh:
	call sub_d5f4h		;d64e
ld651h:
	jp lc2b4h		;d651
sub_d654h:
	ld hl,lf7ffh		;d654
	dec (hl)			;d657  ; Decrement timer
	ret nz			;d658  ; Not zero -> return (still counting)
	ld (hl),002h		;d659  ; Reset timer to 2
	ld a,(0df20h)		;d65b  ; Load score counter (bank 1)
	cp 00eh		;d65e  ; At maximum (14)?
	jr nz,ld668h		;d660  ; No -> update score
	ld a,(0df2eh)		;d662  ; Load secondary score byte (bank 1)
	cp 001h		;d665  ; Reached limit?
	ret z			;d667  ; Yes -> don't update further
ld668h:
	call sub_d670h		;d668  ; Call score update in bank 1
	ld b,001h		;d66b  ; Score increment = 1
	call sub_df1eh		;d66d  ; Format score for display
sub_d670h:
	ld hl,0df2eh		;d670
	rrc (hl)		;d673
	ret nc			;d675
	ld hl,0df20h		;d676
	inc (hl)			;d679
	ret			;d67a
sub_d67bh:
	or a			;d67b  ; Test A (caller's state)
	jr nz,ld69dh		;d67c  ; Non-zero -> skip reset
	ld hl,0d53ah		;d67e  ; Entity visibility counter
	ld a,(hl)			;d681  ; Load counter
	or a			;d682  ; Is entity visible?
	jr z,ld69dh		;d683  ; No -> skip
	dec (hl)			;d685  ; Decrement visibility counter
	ld hl,(lf8f0h)		;d686  ; Get sprite data table
	ld b,005h		;d689  ; 5 sprite entries
ld68bh:
	res 7,(hl)		;d68b
	inc hl			;d68d
	djnz ld68bh		;d68e
	ld hl,00f0fh		;d690
	ld (05adbh),hl		;d693
	ld (05addh),hl		;d696
	call sub_dbedh		;d699
	xor a			;d69c
ld69dh:
	ld de,0507bh		;d69d
	jr ld6a8h		;d6a0
sub_d6a2h:
	ld a,(lef76h)		;d6a2
sub_d6a5h:
	ld de,05061h		;d6a5
ld6a8h:
	push de			;d6a8
	add a,a			;d6a9
	add a,0c0h		;d6aa
	ld (0d6b0h),a		;d6ac
	ld hl,(l94c0h)		;d6af
	ld de,engine_end		;d6b2
	call sub_94d0h		;d6b5
	pop de			;d6b8
	ld hl,engine_end		;d6b9
	ld c,06ch		;d6bc
ld6beh:
	ld b,008h		;d6be
ld6c0h:
	push de			;d6c0
	ldi		;d6c1
	ldi		;d6c3
	ldi		;d6c5
	ldi		;d6c7
	pop de			;d6c9
	inc d			;d6ca
	djnz ld6c0h		;d6cb
	ld a,d			;d6cd
	sub 008h		;d6ce
	ld d,a			;d6d0
	ld a,e			;d6d1
	add a,020h		;d6d2
	ld e,a			;d6d4
	cp 0c0h		;d6d5
	jr c,ld6beh		;d6d7
	ld d,05ah		;d6d9
	ld a,e			;d6db
	sub 060h		;d6dc
	ld e,a			;d6de
	ld b,003h		;d6df
ld6e1h:
	ldi		;d6e1
	ldi		;d6e3
	ldi		;d6e5
	ldi		;d6e7
	ld a,01ch		;d6e9
	add a,e			;d6eb
	ld e,a			;d6ec
	djnz ld6e1h		;d6ed
	ret			;d6ef
ld6f0h:
	call sub_d654h		;d6f0
	call sub_d42bh		;d6f3
	jr nc,ld706h		;d6f6
	ld de,l9c43h		;d6f8
	ld a,001h		;d6fb
	ld (lf8fah),a		;d6fd  ; Set active entity count = 1
ld700h:
	ld hl,ld9b4h		;d700  ; HL = post-lift item pickup handler
	jp ldb2ah		;d703  ; Install handler and return to main loop
ld706h:
	ld a,(lf8f3h)		;d706  ; A = lift state counter
	cp 010h		;d709  ; Is lift in countdown mode ($10)?
	jp z,ld7efh		;d70b  ; Yes -> handle lift movement (UP direction)
	cp 0c8h		;d70e  ; Is lift sequence completed ($C8)?
	jp z,ldf4dh		;d710  ; Yes -> score/completion handler
	call sub_ce41h		;d713  ; Read keyboard/joystick input
	jp z,ld454h		;d716
	ld a,(lf7feh)		;d719
	bit 4,a		;d71c  ; DOWN pressed?
	jp z,ld7e5h		;d71e  ; No DOWN -> check UP/LEFT/RIGHT/FIRE
	ld a,(le654h)		;d721  ; A = tile type below player
	inc a			;d724  ; Test for $FF (no interactive tile)
	jp z,ld7cah		;d725  ; No tile below -> transition handler
	ld hl,(leffah)		;d728  ; HL = player grid position pointer
	ld de,l8a56h		;d72b  ; DE = offset to tile row below player
	add hl,de			;d72e  ; HL -> tile below player
	ld a,(hl)			;d72f  ; A = tile ID at that position
	cp 08ah		;d730  ; Is it interactive object tile ($8A)?
	jp nz,ld7cah		;d732  ; No -> transition handler
	ld a,(lc259h+1)		;d735
	cp 03dh		;d738
	jr z,ld778h		;d73a
	cp 04dh		;d73c
	jr z,ld760h		;d73e
	ld a,(l71a4h)		;d740
	or a			;d743
	call z,sub_db14h		;d744
	call nz,sub_db1dh		;d747
	ld hl,l67a4h		;d74a
	inc a			;d74d
	jr z,ld75bh		;d74e
	ld hl,l67b1h		;d750
ld753h:
	call sub_e02dh		;d753
ld756h:
	call sub_d064h		;d756
	jr ld7b7h		;d759
ld75bh:
	call sub_e044h		;d75b
	jr ld756h		;d75e
ld760h:
	ld a,(0c101h)		;d760  ; A = fence enable flag from room data
	inc a			;d763  ; Test for $FF (fence disabled in this room)
	jr z,ld7cah		;d764  ; If disabled -> treat as lift toggle instead
	ld hl,0c7f1h		;d766  ; HL -> fence state byte
	ld a,(hl)			;d769  ; A = current fence state
	xor 011h		;d76a  ; Toggle fence: $00 <-> $11
	ld (hl),a			;d76c  ; Store new fence state
	ld hl,l67cah		;d76d  ; HL -> " FENCE IS OFF " text
	inc a			;d770
	jr z,ld75bh		;d771
	ld hl,l67bdh		;d773
	jr ld753h		;d776
ld778h:
	ld hl,lef86h		;d778
	ld a,(hl)			;d77b
	dec hl			;d77c
	or a			;d77d
	jr z,ld781h		;d77e
	ld (hl),a			;d780
ld781h:
	ld de,05066h		;d781
	ld a,(hl)			;d784
	or a			;d785
	jr z,ld7bah		;d786
	ld a,(lf8f8h)		;d788
	cp (hl)			;d78b
	jr c,ld790h		;d78c
	jr nz,ld7bfh		;d78e
ld790h:
	inc hl			;d790
	ld a,(hl)			;d791
	or a			;d792
	jr nz,ld79eh		;d793
	ld de,00504h		;d795
	call sub_dbdfh		;d798
	call sub_e02dh		;d79b
ld79eh:
	ld a,(lef85h)		;d79e
	ld (lef86h),a		;d7a1
	ld hl,l676eh		;d7a4
	call sub_d064h		;d7a7
ld7aah:
	ld e,085h		;d7aa
	ld (lef83h),de		;d7ac
	inc de			;d7b0
	ld hl,l686bh		;d7b1
ld7b4h:
	call sub_d067h		;d7b4
ld7b7h:
	jp lc2b4h		;d7b7
ld7bah:
	ld hl,l6797h		;d7ba
	jr ld7b4h		;d7bd
ld7bfh:
	call sub_e044h		;d7bf
	ld hl,l677ch		;d7c2
	call sub_d067h		;d7c5
	jr ld7aah		;d7c8
ld7cah:
	ld a,(lef77h)		;d7ca
	or a			;d7cd  ; Test transition counter state
	jr z,ld7dbh		;d7ce  ; If zero -> short transition
	ld a,002h		;d7d0  ; A = 2 (long transition delay)
	ld de,l9b7fh		;d7d2  ; DE = transition behavior handler
	ld hl,ld4f0h		;d7d5  ; HL = transition render handler
	jp ldb27h		;d7d8  ; Set transition counter and dispatch
ld7dbh:
	inc a			;d7db
	ld hl,ld57bh		;d7dc  ; HL = default render handler
	ld de,l9c1ah		;d7df  ; DE = default behavior handler
	jp ldb27h		;d7e2  ; Install handlers and return
ld7e5h:
	bit 1,a		;d7e5  ; UP pressed?
	jr z,ld7fbh		;d7e7  ; No -> check LEFT
	ld a,(lf8ech)		;d7e9  ; A = player facing direction
	dec a			;d7ec
	jr z,ld85ch		;d7ed
ld7efh:
	call sub_d8d7h		;d7ef  ; Initialize lift sound/state
	ld hl,lcef1h		;d7f2  ; HL = cutscene/scroll up handler
ld7f5h:
	ld de,l9c6bh		;d7f5  ; DE = scroll behavior handler
	jp ldb2ah		;d7f8  ; Install handlers and return
ld7fbh:
	bit 2,a		;d7fb  ; LEFT pressed?
	jr z,ld851h		;d7fd  ; No LEFT -> check RIGHT
	ld a,(lf8ech)		;d7ff  ; A = player facing direction
	or a			;d802
	ld a,(le66fh)		;d803  ; A = tile interaction type (right)
	jr z,ld80bh		;d806  ; If facing right, use right-side tile
	ld a,(le66ah)		;d808  ; A = tile interaction type (left)
ld80bh:
	cp 0d5h		;d80b  ; Is tile a climbable fence ($D5)?
	jr nz,ld81fh		;d80d  ; No -> check for ladder/door tiles
	ld a,(l89b9h)		;d80f  ; A = fence height/state
	cp 008h		;d812  ; Is fence climbable (height = 8)?
	jr nz,ld81fh		;d814  ; No -> check for ladder/door tiles
	call sub_dbedh		;d816  ; Set up climbing animation sequence
	ld hl,lda23h		;d819  ; HL = fence climb right handler
	jp ldb2eh		;d81c  ; Install render handler
ld81fh:
	ld a,(lf8ech)		;d81f  ; A = player facing direction
	ld hl,le66ch		;d822
	add a,l			;d825
	ld l,a			;d826
	ld a,(hl)			;d827
	cp 02ch		;d828  ; Tile $2C (door type 1)?
	jr z,ld839h		;d82a  ; Yes -> enter door
	cp 025h		;d82c  ; Tile $25 (door type 2)?
	jr z,ld839h		;d82e  ; Yes -> enter door
	cp 009h		;d830  ; Tile $09 (ladder)?
	jr z,ld839h		;d832  ; Yes -> use ladder
	cp 005h		;d834  ; Tile $05 (passage)?
	jp nz,ld4e3h		;d836  ; None of these -> default handler
ld839h:
	ld hl,ld8e3h		;d839  ; HL = movement checking handler
	ld (0c2aeh),hl		;d83c
	ld hl,l9bf3h		;d83f
	ld (0cc6dh),hl		;d842  ; Install render handler (self-modifying)
	jp ld97bh		;d845  ; Execute rightward movement
ld848h:
	ld hl,ld8e3h		;d848  ; HL = movement checking handler
	ld de,l9bf3h		;d84b  ; DE = movement behavior handler
	jp ldb2ah		;d84e  ; Install handlers via dispatcher
ld851h:
	bit 0,a		;d851  ; RIGHT pressed?
	jr z,ld86ah		;d853  ; No -> check FIRE
	ld a,(lf8ech)		;d855  ; A = player facing direction
	or a			;d858
	jr nz,ld862h		;d859
	inc a			;d85b
ld85ch:
	ld (lf8ech),a		;d85c
	jp lc2b4h		;d85f
ld862h:
	call sub_d8d7h		;d862
	ld hl,lce59h		;d865
	jr ld7f5h		;d868
ld86ah:
	bit 3,a		;d86a
	jp z,lc2b4h		;d86c
	ld a,(lf8ech)		;d86f  ; A = player facing direction
	or a			;d872  ; Facing right (0)?
	jr nz,ld8b7h		;d873  ; No -> skip special tile check
	ld hl,(leffah)		;d875  ; HL = player grid position
	ld de,l8a34h		;d878  ; DE = offset to adjacent tile
	add hl,de			;d87b  ; HL -> adjacent tile
	ld a,(hl)			;d87c  ; A = tile ID
	cp 01bh		;d87d  ; Is it tile $1B (special exit/motorbike)?
	jr nz,ld8b7h		;d87f  ; No -> normal FIRE handling
	ld hl,lcfa4h		;d881
	ld de,l9ab0h		;d884
	ld a,0fdh		;d887
	ld (lf8f3h),a		;d889
	ld a,06dh		;d88c
	jp ldb27h		;d88e
ld891h:
	ld hl,ld61eh		;d891
	ld de,l9cf6h		;d894
ld897h:
	ld a,(lf8ech)		;d897
	ld bc,le666h		;d89a
	add a,c			;d89d
	ld c,a			;d89e
	ld a,(bc)			;d89f
	cp 009h		;d8a0
	jr z,ld848h		;d8a2  ; Yes -> guard death
	cp 005h		;d8a4  ; State 1 (patrol)?
	jr z,ld848h		;d8a6  ; Yes -> guard death
	cp 025h		;d8a8  ; State 9 (stunned)?
	jr z,ld848h		;d8aa  ; Yes -> guard death
	cp 02ch		;d8ac  ; State 10 (recovering)?
	jr z,ld848h		;d8ae  ; Yes -> guard death
	cp 010h		;d8b0
	jr z,ld848h		;d8b2
	jp ldb2ah		;d8b4  ; Set transition counter and dispatch
ld8b7h:
	ld a,(lf8ech)		;d8b7  ; A = player facing direction
	or a			;d8ba  ; Facing right?
	ld a,(le66ah)		;d8bb  ; A = interaction tile (right side)
	jr z,ld8c3h		;d8be  ; If right, use right-side tile
	ld a,(le66fh)		;d8c0  ; A = interaction tile (left side)
ld8c3h:
	cp 0d4h		;d8c3  ; Is it a climbable fence ($D4)?
	jr nz,ld891h		;d8c5  ; No -> check for door tiles
	ld a,(l89b9h)		;d8c7  ; A = fence height/state
	cp 008h		;d8ca  ; Is fence climbable?
	jr z,ld891h		;d8cc  ; Height=8 (already climbed) -> skip
	call sub_dbedh		;d8ce  ; Set up climbing animation sequence
	ld hl,lda93h		;d8d1  ; HL = fence climb left handler
	jp ldb2eh		;d8d4  ; Install render handler
sub_d8d7h:
	ld hl,l9c94h		;d8d7
	ld (ld031h+1),hl		;d8da
	ld bc,00010h		;d8dd
	jp ld034h		;d8e0
ld8e3h:
	ld a,(lf8ech)		;d8e3
	ld hl,le666h		;d8e6
	add a,l			;d8e9
	ld l,a			;d8ea
	ld a,(hl)			;d8eb  ; A = room type byte
	cp 009h		;d8ec  ; Tile $09?
	jr z,ld907h		;d8ee  ; Yes -> allow projectile spawning
	cp 02ch		;d8f0  ; Tile $2C?
	jr z,ld907h		;d8f2  ; Yes -> allow
	cp 005h		;d8f4  ; Tile $05?
	jr z,ld907h		;d8f6  ; Yes -> allow
	cp 010h		;d8f8  ; Tile $10?
	jr z,ld907h		;d8fa  ; Yes -> allow
	cp 025h		;d8fc  ; Tile $25?
	jr z,ld907h		;d8fe
	cp 0c8h		;d900
	jr nc,ld907h		;d902
	jp ldb08h		;d904
ld907h:
	ld a,(lf7feh)		;d907
	bit 0,a		;d90a
	jr z,ld912h		;d90c
	ld a,001h		;d90e
	jr ld917h		;d910  ; Check boundary collision
ld912h:
	bit 1,a		;d912  ; UP pressed?
	jr z,ld92eh		;d914  ; No -> check FIRE
	xor a			;d916  ; A = 0 (face right)
ld917h:
	ld (lf8ech),a		;d917  ; Set player direction
	ld a,(le665h)		;d91a  ; A = tile at player position
	cp 0c7h		;d91d  ; Is it a wall/solid ($C7+)?
	jp nc,lc2b4h		;d91f  ; Yes -> block movement, return
	ld a,(le66bh)		;d922  ; A = tile at offset position
	inc a			;d925  ; Test for $FF or > $C6
	cp 0c7h		;d926  ; Solid tile?
	jp nc,ldb08h		;d928  ; Yes -> end movement sequence
	jp lc2b4h		;d92b  ; Continue movement
ld92eh:
	bit 3,a		;d92e  ; FIRE pressed?
	jr z,ld964h		;d930  ; No -> check LEFT
	ld de,leffdh		;d932
	ld a,(de)			;d935
	dec a			;d936
	jp m,ld947h		;d937
	ld hl,(leffah)		;d93a
	ld bc,l8796h		;d93d
	add hl,bc			;d940
	ld a,(hl)			;d941
	cp 0cdh		;d942
	jp nc,lc2b4h		;d944
ld947h:
	ex de,hl			;d947
	dec (hl)			;d948
	ld de,lffe0h		;d949
	call sub_d955h		;d94c
	call sub_cfe2h		;d94f
	jp lc2b4h		;d952
sub_d955h:
	ld hl,(leffah)		;d955
	add hl,de			;d958
	ld (leffah),hl		;d959
	ld hl,lf8ech		;d95c
	ld a,001h		;d95f
	xor (hl)			;d961
	ld (hl),a			;d962
	ret			;d963
ld964h:
	bit 2,a		;d964  ; LEFT pressed?
	jp z,lc2b4h		;d966  ; No input -> return
	ld a,(le66ch)		;d969  ; A = tile to the right (upper)
	inc a			;d96c  ; Test for solid
	cp 0c7h		;d96d  ; Solid tile?
	jp nc,ldb08h		;d96f  ; Yes -> end movement
	ld a,(le66dh)		;d972  ; A = tile to the right (lower)
	inc a			;d975  ; Test for solid
	cp 0c7h		;d976  ; Solid tile?
	jp nc,ldb08h		;d978  ; Yes -> end movement
ld97bh:
	call sub_d988h		;d97b  ; Check for room boundary (lift handler)
	inc (hl)			;d97e
	ld de,00020h		;d97f
	call sub_d955h		;d982
	jp lc2b4h		;d985
sub_d988h:
	ld hl,leffdh		;d988
	ld a,(hl)			;d98b
	cp 00bh		;d98c  ; At right boundary (position 11)?
	ret nz			;d98e  ; No -> return normally
	ld hl,lefffh		;d98f  ; HL -> room counter
	inc (hl)			;d992  ; Increment room number
	pop hl			;d993  ; Discard return address (skip caller)
	sub 011h		;d994  ; A = 11 - 17 = -6 (wrap to position)
	ld (leffdh),a		;d996  ; Reset player X position
	ld hl,(leffah)		;d999  ; HL = player grid pointer
	ld de,lfde0h		;d99c  ; DE = $FDE0 (-544, jump back in grid)
	add hl,de			;d99f  ; HL = new grid position (start of room)
	ld de,00020h		;d9a0  ; DE = 32 (one column offset)
ld9a3h:
	ld (leffah),hl		;d9a3  ; Update player grid pointer
	ld hl,(0c123h)		;d9a6  ; HL = room draw handler pointer
	add hl,de			;d9a9  ; Advance draw handler by 32
	ld (0c123h),hl		;d9aa  ; Store updated handler pointer
	xor a			;d9ad  ; A = 0
	ld (ld237h+1),a		;d9ae  ; Clear screen rendering sub-state
	jp lc0a2h		;d9b1  ; Jump to room/level setup
ld9b4h:
	call sub_d988h		;d9b4  ; Check room boundary
	call sub_d42bh		;d9b7  ; Try to pick up item
	jr c,lda12h		;d9ba
	ld a,(lf8f9h)		;d9bc
	or a			;d9bf
	jr z,ld9f7h		;d9c0
	ld b,014h		;d9c2
	ld de,l6739h		;d9c4
	dec a			;d9c7  ; Was it 1 (mission failure)?
	jr nz,ld9cdh		;d9c8  ; No -> use "TERMINATED" text
	ld de,l674ch		;d9ca  ; DE -> "@@MISSION@@FAILURE@@" text
ld9cdh:
	ld hl,l8afah		;d9cd  ; HL = screen destination address
	call sub_d2efh		;d9d0  ; Copy mission text to screen buffer
	ld a,(lf8f3h)		;d9d3  ; A = lift state counter
	cp 0fdh		;d9d6  ; Is it cutscene mode ($FD)?
	jr nz,ld9ech		;d9d8  ; No -> skip cutscene graphics
	ld de,l9d46h		;d9da  ; DE = cutscene tile data
	ld bc,l89f4h		;d9dd  ; BC = graphics pattern table
	call sub_cf67h		;d9e0  ; Render cutscene message area
	ld de,la44ah		;d9e3  ; DE = input dispatch handler
	ld bc,tab1_end		;d9e6  ; BC = game entry handler
	call sub_cf67h		;d9e9  ; Render message with these handlers
ld9ech:
	ld de,l9e0fh		;d9ec  ; DE = post-mission behavior handler
	ld hl,ldc2ch		;d9ef  ; HL = transition countdown handler
	ld a,01eh		;d9f2  ; A = 30 (transition duration, ~0.6 sec)
	jp ldb27h		;d9f4  ; Set transition counter and dispatch
ld9f7h:
	ld a,001h		;d9f7
	cp 00fh		;d9f9
	jr c,lda07h		;d9fb
	cp 025h		;d9fd
	jr nc,lda03h		;d9ff
	srl a		;da01
lda03h:
	ld b,a			;da03
	call ldf1dh		;da04
lda07h:
	ld a,001h		;da07
	ld (ld9f7h+1),a		;da09
	ld (lfb03h),a		;da0c
	jp ld4e3h		;da0f
lda12h:
	ld hl,ld9f7h+1		;da12
	inc (hl)			;da15
	jr nz,lda19h		;da16
	dec (hl)			;da18
lda19h:
	ld hl,leffdh		;da19
	inc (hl)			;da1c
	ld de,00020h		;da1d
	jp ldb78h		;da20
lda23h:
	call sub_db1dh		;da23
	call sub_d654h		;da26
	call sub_d988h		;da29
	ld hl,leffdh		;da2c
	inc (hl)			;da2f
	ld hl,(leffah)		;da30  ; HL = player grid pointer
	ld de,00020h		;da33  ; DE = 32 (one column right)
	add hl,de			;da36  ; Advance pointer
	ld (leffah),hl		;da37  ; Store updated pointer
	ld de,l8874h		;da3a  ; DE = offset to tile row
	add hl,de			;da3d  ; HL -> tile position in map
	ld b,006h		;da3e  ; B = 6 tiles to clear
lda40h:
	ld (hl),008h		;da40  ; Set tile to $08 (blank/clear)
	inc hl			;da42  ; Next tile
	djnz lda40h		;da43  ; Clear all 6 tiles
	ld a,(leffdh)		;da45  ; A = current position
	cp 00bh		;da48  ; At right boundary?
	jr z,lda8eh		;da4a  ; Yes -> skip fence drawing, check input
	ld de,0001ah		;da4c  ; DE = 26 (offset to next tile row)
	add hl,de			;da4f  ; HL -> fence drawing position
	ld de,l9e39h		;da50  ; DE -> fence tile pattern data
	ld bc,00006h		;da53
	ex de,hl			;da56
	ldir		;da57
	ld hl,lfdbfh+1		;da59
	add hl,de			;da5c
	ld a,001h		;da5d
	ld b,006h		;da5f
lda61h:
	dec hl			;da61
	ld (hl),a			;da62
	djnz lda61h		;da63
	ld de,lffe0h		;da65
	add hl,de			;da68
lda69h:
	ld b,006h		;da69
lda6bh:
	ld (hl),001h		;da6b
	inc hl			;da6d
	djnz lda6bh		;da6e
	ld a,(lf7feh)		;da70
	ld hl,lda93h		;da73
	bit 3,a		;da76
	jp nz,ldb2eh		;da78
	ld hl,(leffah)		;da7b  ; HL = player grid pointer
	ld de,l88b4h		;da7e  ; DE = offset to tile below
	add hl,de			;da81  ; HL -> tile below player
	ld a,(hl)			;da82  ; A = tile ID
	cp 0fah		;da83  ; End-of-fence marker ($FA)?
	jp nz,lc2b4h		;da85  ; No -> continue climbing next frame
	call sub_db14h		;da88
	jp ld4e3h		;da8b
lda8eh:
	ld hl,l8799h		;da8e
	jr lda69h		;da91
lda93h:
	call sub_db14h		;da93
	call sub_d654h		;da96
	ld hl,leffdh		;da99  ; HL -> player position
	dec (hl)			;da9c  ; Move left
	ld hl,(leffah)		;da9d  ; HL = screen pointer
	ld de,lffe0h		;daa0  ; DE = $FFE0 (-32, one row up)
	add hl,de			;daa3  ; Adjust pointer
	ld (leffah),hl		;daa4  ; Update
	call sub_cfe2h		;daa7  ; Handle room boundary
	ld de,l8894h		;daaa
	add hl,de			;daad
	ld bc,00006h		;daae
	ld de,l9e39h		;dab1
	ex de,hl			;dab4
	ldir		;dab5
	cp 00ah		;dab7
	ld hl,l8799h		;dab9
	jr z,ldad8h		;dabc
	ld hl,0001ah		;dabe
	add hl,de			;dac1  ; HL -> tile position ahead
	ld b,006h		;dac2  ; B = 6 tiles to clear
ldac4h:
	ld (hl),008h		;dac4  ; Set tile to $08 (blank)
	inc hl			;dac6  ; Next tile
	djnz ldac4h		;dac7  ; Clear all 6 tiles
	ld de,lfdbfh+1		;dac9  ; DE = $FDC0 (row above offset)
	add hl,de			;dacc  ; HL -> row above
	ld b,006h		;dacd  ; B = 6 tiles
ldacfh:
	dec hl			;dacf  ; Previous position
	ld (hl),001h		;dad0  ; Set tile to $01 (fence post)
	djnz ldacfh		;dad2  ; Fill all 6 positions
	ld de,lffe0h		;dad4
	add hl,de			;dad7
ldad8h:
	ld (hl),001h		;dad8
	ld de,00005h		;dada
	add hl,de			;dadd
	ld (hl),001h		;dade
	ld a,(lf7feh)		;dae0
	ld hl,lda23h		;dae3
	bit 2,a		;dae6
	jr nz,ldb2eh		;dae8
	ld hl,(leffah)		;daea  ; HL = player grid pointer
	ld de,l8873h		;daed  ; DE = offset to tile at position
	add hl,de			;daf0  ; HL -> tile to check
	ld a,(hl)			;daf1  ; A = tile ID
	cp 008h		;daf2  ; Is it blank ($08)?
	jp nz,lc2b4h		;daf4  ; No -> continue climbing next frame
	ld hl,leffdh		;daf7  ; HL -> player X position
	dec (hl)			;dafa  ; Move one more tile left
	ld de,lffe0h		;dafb
	ld hl,(leffah)		;dafe
	add hl,de			;db01
	ld (leffah),hl		;db02
	call sub_db1dh		;db05
ldb08h:
	xor a			;db08
	ld (lf8fah),a		;db09
	ld hl,ld6f0h		;db0c
	ld de,l9bcah		;db0f
	jr ldb2ah		;db12
sub_db14h:
	ld a,0ffh		;db14
	ld (l716dh),a		;db16
	ld (l71a4h),a		;db19
	ret			;db1c
sub_db1dh:
	ld a,011h		;db1d
	ld (l716dh),a		;db1f
	xor a			;db22
	ld (l71a4h),a		;db23
	ret			;db26
ldb27h:
	ld (lf8e0h),a		;db27
ldb2ah:
	ld (0cc6dh),de		;db2a
ldb2eh:
	ld (0c2aeh),hl		;db2e
	jp lc2b4h		;db31
ldb34h:
	ld bc,leffch		;db34
	ld a,(bc)			;db37
	cp 01dh		;db38
	jp z,lcebeh		;db3a
	cp 01ah		;db3d
	jr nc,ldb4eh		;db3f
	ld hl,(leffah)		;db41
	ld de,l887ah		;db44
	add hl,de			;db47
	ld a,(hl)			;db48
	cp 0c7h		;db49
	jr nc,ldb57h		;db4b
	ld a,(bc)			;db4d
ldb4eh:
	inc a			;db4e
	ld (bc),a			;db4f
	ld hl,(leffah)		;db50
	inc hl			;db53
	ld (leffah),hl		;db54
ldb57h:
	call sub_dbb8h		;db57
	ld a,(lf7feh)		;db5a
	bit 0,a		;db5d
ldb5fh:
	jp z,ldb08h		;db5f
	ld de,l8a56h		;db62
	call sub_db82h		;db65
	ld hl,(leffah)		;db68
	add hl,de			;db6b
	ld a,(hl)			;db6c
	or a			;db6d
	jp nz,lc2b4h		;db6e
	ld hl,leffdh		;db71
	dec (hl)			;db74
	ld de,lffe0h		;db75
ldb78h:
	ld hl,(leffah)		;db78
	add hl,de			;db7b
	ld (leffah),hl		;db7c
	jp lc2b4h		;db7f
sub_db82h:
	ld a,(leffch)		;db82
	cp 0fdh		;db85
	ret nz			;db87
	inc de			;db88
	ret			;db89
ldb8ah:
	ld bc,leffch		;db8a
	ld a,(bc)			;db8d
	cp 0fdh		;db8e
	jp z,lcedbh		;db90
	cp 001h		;db93
	jp m,ldba5h		;db95  ; If negative (off screen) -> do the move
	ld hl,(leffah)		;db98  ; HL = player grid pointer
	ld de,l8873h		;db9b  ; DE = offset to tile to the left
	add hl,de			;db9e  ; HL -> tile to the left
	ld a,(hl)			;db9f  ; A = tile ID
	cp 0c7h		;dba0  ; Boundary marker?
	jr nc,ldbaeh		;dba2
	ld a,(bc)			;dba4
ldba5h:
	dec a			;dba5
	ld (bc),a			;dba6
	ld hl,(leffah)		;dba7
	dec hl			;dbaa
	ld (leffah),hl		;dbab
ldbaeh:
	call sub_dbb8h		;dbae
	ld a,(lf7feh)		;dbb1
	bit 1,a		;dbb4
	jr ldb5fh		;dbb6
sub_dbb8h:
	ld hl,l9e08h		;dbb8
	ld a,007h		;dbbb
	xor (hl)			;dbbd
	ld (hl),a			;dbbe
	ret			;dbbf
sub_dbc0h:
	ld hl,le670h		;dbc0
	ld de,0ffffh		;dbc3
	ld b,003h		;dbc6
	call sub_d319h		;dbc8
	ld a,002h		;dbcb
	ld b,0cdh		;dbcd
ldbcfh:
	ld hl,lcc3bh		;dbcf
	ld (hl),b			;dbd2
	ld (ld363h),a		;dbd3
	ld (ld3c0h),a		;dbd6
	ret			;dbd9
sub_dbdah:
	ld b,0c3h		;dbda
	xor a			;dbdc
	jr ldbcfh		;dbdd
sub_dbdfh:
	ld hl,l66f6h		;dbdf
	ld a,e			;dbe2
	add a,l			;dbe3
	ld l,a			;dbe4
	ld c,03ah		;dbe5
	ld a,(hl)			;dbe7
	add a,d			;dbe8
	cp c			;dbe9
	jr nc,ldbf3h		;dbea
	ld (hl),a			;dbec
sub_dbedh:
	ld hl,l66f1h		;dbed
	jp sub_d064h		;dbf0
ldbf3h:
	sub 00ah		;dbf3
	ld (hl),a			;dbf5
ldbf6h:
	dec hl			;dbf6
	inc (hl)			;dbf7
	ld a,(hl)			;dbf8
	cp c			;dbf9
	jr nz,sub_dbedh		;dbfa
	ld (hl),030h		;dbfc
	jr ldbf6h		;dbfe
sub_dc00h:
	ld hl,04000h		;dc00
	ld e,l			;dc03
ldc04h:
	ld d,h			;dc04
ldc05h:
	ld c,015h		;dc05
ldc07h:
	ld b,004h		;dc07
ldc09h:
	ld (hl),e			;dc09
	inc h			;dc0a
	ld (hl),e			;dc0b
	inc h			;dc0c
	djnz ldc09h		;dc0d
	ld h,d			;dc0f
	inc l			;dc10
	dec c			;dc11
	jr nz,ldc07h		;dc12
	ld a,00bh		;dc14
	add a,l			;dc16
	ld l,a			;dc17
	jr nc,ldc05h		;dc18
	ld a,h			;dc1a
	add a,008h		;dc1b
	ld h,a			;dc1d
	cp 058h		;dc1e
	jr nz,ldc04h		;dc20
	ld de,l8db4h		;dc22
	ex de,hl			;dc25
	ld bc,00300h		;dc26
	ldir		;dc29
	ret			;dc2b
ldc2ch:
	ld hl,lf8e0h		;dc2c
	dec (hl)			;dc2f
	jp nz,lc2b4h		;dc30
ldc33h:
; ==========================================================================
; END-OF-LEVEL / HIGH SCORE CHECK ($EC1E)
; ==========================================================================
; Called when a level/mission ends. Renders the briefing screen, then
; checks if the player's score qualifies for the high score table.
; Each high score entry is 17 bytes: 6 digits + 11 name characters.
;
	call sub_98f1h		;dc33  ; Render mission briefing screen
	ld b,00fh		;dc36  ; B = 15 entries in high score table
	ld hl,l6508h		;dc38  ; HL -> first high score entry
ldc3bh:
	ld de,l66f7h		;dc3b  ; DE -> player's score (6 ASCII digits)
	push hl			;dc3e  ; Save table position
	ld c,006h		;dc3f  ; C = 6 digits to compare
ldc41h:
	ld a,(de)			;dc41  ; A = player's score digit
	cp (hl)			;dc42  ; Compare with table entry digit
	jr c,ldc4ch		;dc43
	jr nz,ldc55h		;dc45  ; Not equal -> check if higher/lower
	inc hl			;dc47  ; Next digit
	inc de			;dc48
	dec c			;dc49  ; More digits?
	jr nz,ldc41h		;dc4a  ; Yes -> keep comparing
ldc4ch:
	pop hl			;dc4c  ; Restore table position
	ld de,00011h		;dc4d  ; DE = 17 (bytes per entry)
	add hl,de			;dc50  ; HL -> next entry
	djnz ldc3bh		;dc51  ; Check all 15 entries
	jr ldc98h		;dc53
ldc55h:
	pop hl			;dc55
	push bc			;dc56
	ld de,04043h		;dc57
	ld hl,l64bah		;dc5a
	call sub_d06bh		;dc5d
	ld e,0a2h		;dc60
	call sub_d06bh		;dc62
	ld e,0e4h		;dc65
	call sub_d06bh		;dc67
	ld de,04863h		;dc6a
	call sub_d06bh		;dc6d
	call sub_dee0h		;dc70
	call sub_de8eh		;dc73
	pop bc			;dc76
	ld de,l6617h		;dc77
	ld hl,l6606h		;dc7a
	ld a,b			;dc7d
ldc7eh:
	ld bc,00011h		;dc7e
	lddr		;dc81
	dec a			;dc83
	jr nz,ldc7eh		;dc84
	inc hl			;dc86
	ex de,hl			;dc87
	ld hl,l66f7h		;dc88
	ld c,006h		;dc8b
	ldir		;dc8d  ; Copy score to table
	inc hl			;dc8f  ; Skip 2 bytes (separator)
	inc hl			;dc90
	ld c,00bh		;dc91  ; C = 11 bytes (player name)
	ldir		;dc93  ; Copy name to table
ldc95h:
	call sub_dc00h		;dc95  ; Update animation state
ldc98h:
	ld hl,l64fch		;dc98
	ld de,04064h		;dc9b
	call sub_d06bh		;dc9e
	ld b,00fh		;dca1
	ld hl,l6508h		;dca3
	ld e,0c1h		;dca6
ldca8h:
	push bc			;dca8  ; Save entry counter
	ld c,006h		;dca9  ; C = 6 digits (score)
	call sub_d06dh		;dcab  ; Display score
	push hl			;dcae
	ld hl,l6618h		;dcaf  ; HL -> separator chars
	ld c,002h		;dcb2  ; C = 2 chars (separator)
	call sub_d06dh		;dcb4  ; Display separator
	pop hl			;dcb7
	ld c,00bh		;dcb8  ; C = 11 chars (name)
	call sub_d06dh		;dcba  ; Display name
	ld a,e			;dcbd
	add a,00dh		;dcbe
	ld e,a			;dcc0
	jr nc,ldcc7h		;dcc1
	ld a,d			;dcc3
	add a,008h		;dcc4
	ld d,a			;dcc6
ldcc7h:
	pop bc			;dcc7
	djnz ldca8h		;dcc8
	call sub_dee0h		;dcca
	call newtab_end		;dccd
ldcd0h:
	call sub_dc00h		;dcd0
ldcd3h:
	ld hl,l68d1h		;dcd3
	ld de,04063h		;dcd6
	call sub_d06bh		;dcd9
	ld e,0a3h		;dcdc
	call sub_d06bh		;dcde
	ld e,0e3h		;dce1
	call sub_d06bh		;dce3
	ld de,04843h		;dce6
	call sub_d06bh		;dce9
	ld e,083h		;dcec
	call sub_d06bh		;dcee
	ld e,0c3h		;dcf1
	call sub_d06bh		;dcf3
	ld de,05023h		;dcf6
	call sub_d06bh		;dcf9
	ld e,0c1h		;dcfc
	call sub_d06bh		;dcfe
	ld e,0e1h		;dd01
	call sub_d06bh		;dd03  ; Display menu line 7
	call sub_dee0h		;dd06  ; Clear pending keypresses
	call sub_dda1h		;dd09  ; Initialize menu input state
	ld bc,l7530h		;dd0c  ; BC = $7530 = 30000 (menu timeout)
ldd0fh:
	push bc			;dd0f  ; Save timeout counter
	call sub_d093h		;dd10  ; Read keyboard
	cp 04bh		;dd13  ; 'K' = Kempston joystick?
	jr z,ldd69h		;dd15
	cp 050h		;dd17
	jr z,ldd70h		;dd19
	cp 04ah		;dd1b
	jr z,ldd87h		;dd1d
	cp 052h		;dd1f  ; 'R' = Redefine keys?
	jp z,lde0ah		;dd21  ; -> key redefinition interface
	cp 04dh		;dd24  ; 'M' = Mission code entry?
	jp z,ldda5h		;dd26  ; -> mission code input
	cp 047h		;dd29  ; 'G' = Go / Start game?
	jr z,ldd41h		;dd2b  ; -> start game
	cp 053h		;dd2d
	jr z,ldd3eh		;dd2f
	ld a,(sub_d03ah+1)		;dd31
	or a			;dd34
	jr z,ldd7eh		;dd35
	call sub_d03ah		;dd37
	and 010h		;dd3a
	jr z,ldd7eh		;dd3c
ldd3eh:
	jp 05c70h		;dd3e
ldd41h:
	ld hl,ldcd3h		;dd41
	ex (sp),hl			;dd44
sub_dd45h:
	ld hl,l6925h		;dd45
	ld a,(hl)			;dd48
	and 00fh		;dd49
ldd4bh:
	inc a			;dd4b
	daa			;dd4c
	or 030h		;dd4d
	ld (hl),a			;dd4f
	ld a,03ah		;dd50
	sub (hl)			;dd52
	ld (lfb06h),a		;dd53
	ld b,003h		;dd56
	cp 004h		;dd58
	jr c,ldd64h		;dd5a
	ld b,008h		;dd5c
	cp 006h		;dd5e
	jr c,ldd64h		;dd60
	ld b,00eh		;dd62
ldd64h:
	ld a,b			;dd64
	ld (sub_e00fh+1),a		;dd65
	ret			;dd68
ldd69h:
	ld hl,05862h		;dd69
	ld c,000h		;dd6c
	jr ldd75h		;dd6e
ldd70h:
	ld hl,058a2h		;dd70
	ld c,002h		;dd73
ldd75h:
	call sub_dd8eh		;dd75
	call sub_dd9ah		;dd78
	call 0b526h		;dd7b
ldd7eh:
	pop bc			;dd7e  ; Restore timeout
	dec bc			;dd7f  ; Decrement timeout counter
	ld a,b			;dd80
	or c			;dd81  ; Timeout expired?
	jr nz,ldd0fh		;dd82  ; No -> keep checking keys
	jp ldc95h		;dd84  ; Timeout -> return to high scores
ldd87h:
	ld hl,058e2h		;dd87
	ld c,001h		;dd8a
	jr ldd75h		;dd8c  ; -> highlight and store
sub_dd8eh:
	ld a,00eh		;dd8e  ; A = $0E (normal attribute: unhighlight)
ldd90h:
	ld de,05862h		;dd90  ; DE = attribute row addr (self-modified)
	ld b,00dh		;dd93  ; B = 13 bytes (menu option width)
ldd95h:
	ld (de),a			;dd95  ; Set attribute byte
	inc de			;dd96  ; Next attribute cell
	djnz ldd95h		;dd97  ; Fill all 13 bytes
	ret			;dd99
sub_dd9ah:
	ld a,c			;dd9a
	ld (sub_d03ah+1),a		;dd9b
	ld (ldd90h+1),hl		;dd9e
sub_dda1h:
	ld a,031h		;dda1
	jr ldd90h		;dda3
ldda5h:
	call sub_dc00h		;dda5
	ld de,04044h		;dda8
	ld hl,l6879h		;ddab
	call sub_d06bh		;ddae
	ld e,084h		;ddb1
	call sub_d06bh		;ddb3
	ld e,0e3h		;ddb6
	call sub_d06bh		;ddb8
	ld de,04822h		;ddbb
	call sub_d06bh		;ddbe  ; Display input area
	call sub_dee0h		;ddc1  ; Clear pending keypresses
	call sub_de8eh		;ddc4  ; Read player's code word input
	ld b,009h		;ddc7  ; B = 9 mission codes to check
	ld hl,l6813h		;ddc9  ; HL -> first mission code string
lddcch:
	ld de,l66ffh		;ddcc  ; DE -> player's typed input buffer
	ld c,00bh		;ddcf  ; C = 11 chars per code
lddd1h:
	ld a,(de)			;ddd1  ; A = typed character
	cp (hl)			;ddd2  ; Compare with code character
	jr nz,lddf0h		;ddd3  ; Mismatch -> try next code
	inc hl			;ddd5  ; Next character
	inc de			;ddd6
	dec c			;ddd7  ; More characters?
	jr nz,lddd1h		;ddd8  ; Yes -> keep comparing
	ld a,b			;ddda  ; A = mission number (9..1)
	ld (lf8fbh),a		;dddb  ; Store mission number in message
	add a,030h		;ddde  ; Convert to ASCII digit
	ld (l67edh),a		;dde0  ; Patch digit into "MISSION X SELECTED"
	ld hl,l67e5h		;dde3  ; HL -> "MISSION X SELECTED" text
	ld c,012h		;dde6  ; C = 18 chars
	ld de,048a2h		;dde8  ; DE = screen position
	call sub_d06dh		;ddeb  ; Display "MISSION X SELECTED"
	jr lde03h		;ddee  ; Jump to confirmation prompt
lddf0h:
	ld a,l			;ddf0
	add a,c			;ddf1
	ld l,a			;ddf2
	djnz lddcch		;ddf3
	ld hl,l67f7h		;ddf5
	ld de,048a5h		;ddf8
	call sub_d06bh		;ddfb
	ld e,0c4h		;ddfe
	call sub_d06bh		;de00
lde03h:
	call sub_dfe9h		;de03
	pop bc			;de06
	jp ldcd0h		;de07
lde0ah:
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
	call sub_dc00h		;de0a  ; Update animation frame state
	ld de,04046h		;de0d  ; DE = screen addr: row 2, col 6
	ld hl,l68f7h		;de10  ; HL -> "REDEFINE KEYS" text (13 chars at $F05B)
	ld c,00dh		;de13  ; C = 13 tiles to print
	call sub_d06dh		;de15  ; Display "REDEFINE KEYS" header
	call sub_dee0h		;de18  ; Wait for all keys released
	ld hl,l81c7h		;de1b
	ld (0de6eh),hl		;de1e
	ld e,084h		;de21
	ld hl,l68b8h		;de23
	ld bc,0053bh		;de26
lde29h:
	push bc			;de29  ; Save remaining key count
	ld c,005h		;de2a  ; C = 5 chars per label ("UP   ", "DOWN ", etc.)
	call sub_d06dh		;de2c  ; Display direction label at DE
	push hl			;de2f  ; Save text pointer (next label)
	push de			;de30  ; Save screen position
lde31h:
	call sub_d093h		;de31  ; A = key code (0 if none)
	cp 05bh		;de34  ; >= '[' ?
	jr nc,lde31h		;de36  ; Reject: key code too high
	cp 020h		;de38  ; Space?
	jr z,lde48h		;de3a  ; Accept space
	cp 030h		;de3c  ; < '0'?
	jr c,lde31h		;de3e  ; Reject: below digit range (and not space)
	cp 03ah		;de40  ; < ':'? (i.e. '0'-'9')
	jr c,lde48h		;de42  ; Accept digit
	cp 041h		;de44  ; < 'A'?
	jr c,lde31h		;de46  ; Reject: $3A-$40 gap between digits and letters
lde48h:
	ld (l68b6h),a		;de48  ; Store key char into display template (self-mod)
	ld hl,00006h		;de4b  ; Offset = 6 columns right
	add hl,de			;de4e  ; DE' = screen pos + 6 (after the label)
	ex de,hl			;de4f  ; DE = position for key display
	ld hl,l68b5h		;de50  ; HL -> key display template (3 tiles)
	ld c,003h		;de53  ; C = 3 tiles (bracket + key + bracket)
	call sub_d06dh		;de55  ; Display key assignment (e.g. "\"K\"")
	ld a,(l68b6h)		;de58  ; Reload key character
	sub 020h		;de5b  ; Subtract $20: Space -> 0
	jr z,lde67h		;de5d  ; If space, index = 0
	sub 00fh		;de5f  ; Subtract $0F more: '0'($30) -> 1, '9'($39) -> 10
	cp 00eh		;de61  ; < 14? (covers digits 0-9 plus a few extra)
	jr c,lde67h		;de63  ; If digit, index ready
	sub 007h		;de65  ; Subtract 7 more: 'A'($41) -> 11, 'Z'($5A) -> 36
lde67h:
	ld hl,lb114h		;de67
	add a,a			;de6a
	add a,l			;de6b
	ld l,a			;de6c
	ld de,lde0ah		;de6d
	ldi		;de70
	ldi		;de72
	inc de			;de74
	ex de,hl			;de75
	ld (0de6eh),hl		;de76
	call sub_dee0h		;de79
	pop de			;de7c
	pop hl			;de7d
	pop bc			;de7e
	ld a,e			;de7f
	add a,c			;de80
	ld e,a			;de81
	jr nc,lde88h		;de82
	ld a,d			;de84
	add a,008h		;de85
	ld d,a			;de87
lde88h:
	djnz lde29h		;de88
	pop bc			;de8a
	jp ldcd0h		;de8b
sub_de8eh:
	ld b,00bh		;de8e
	ld hl,l66ffh		;de90
	push hl			;de93
lde94h:
	ld (hl),020h		;de94
	inc hl			;de96
	djnz lde94h		;de97
	ld ixl,b		;de99
	exx			;de9b
	ld hl,059a6h		;de9c
	ld de,le30eh		;de9f
	exx			;dea2
	ld de,048a6h		;dea3
	pop hl			;dea6
ldea7h:
	exx			;dea7
	ld (hl),d			;dea8
	exx			;dea9
ldeaah:
	call sub_d093h		;deaa
	cp 00ch		;dead
	jr z,ldeeeh		;deaf
	cp 030h		;deb1
	jr z,ldeeeh		;deb3
	cp 00dh		;deb5
	jr z,ldedch		;deb7
	ld c,a			;deb9
sub_debah:
	ld a,00bh		;deba
	cp ixl		;debc
	ld a,c			;debe
	jr z,ldeaah		;debf
	cp 020h		;dec1
	jr z,ldecdh		;dec3
	cp 041h		;dec5
	jr c,ldeaah		;dec7
	cp 05ch		;dec9
	jr nc,ldeaah		;decb
ldecdh:
	ld (hl),a			;decd
	call sub_d060h		;dece
	exx			;ded1
	ld (hl),e			;ded2
	inc hl			;ded3
	exx			;ded4
	inc ixl		;ded5
lded7h:
	call sub_dee0h		;ded7
	jr ldea7h		;deda
ldedch:
	exx			;dedc
	ld (hl),e			;dedd
	exx			;dede  ; Switch back
	ret			;dedf  ; Return with typed text in buffer at $7603
sub_dee0h:
	call sub_d093h		;dee0  ; A = current key (0 = none)
	or a			;dee3  ; Any key still held?
	jr nz,sub_dee0h		;dee4  ; Yes -> keep waiting
	ret			;dee6  ; All keys released
ldee7h:
	call sub_d093h		;dee7  ; A = current key (0 = none)
	or a			;deea  ; Any key pressed?
	jr z,ldee7h		;deeb  ; No -> keep waiting
	ret			;deed  ; Return with key code in A
ldeeeh:
	ld a,ixl		;deee
	or a			;def0
	jr z,ldea7h		;def1
	dec ixl		;def3
	dec hl			;def5
	dec de			;def6
	ld a,020h		;def7
	ld (hl),a			;def9
	call sub_d060h		;defa
	dec hl			;defd
	dec de			;defe
	exx			;deff
	ld (hl),e			;df00
	dec hl			;df01
	exx			;df02
	jr lded7h		;df03
sub_df05h:
	ld (laac8h),a		;df05
	ld hl,lb206h		;df08
	ld de,00009h		;df0b
	ld b,e			;df0e
ldf0fh:
	ld (hl),a			;df0f
	add hl,de			;df10
	ld (hl),a			;df11
	add hl,de			;df12
	ld (hl),a			;df13
	add hl,de			;df14
	djnz ldf0fh		;df15
	ret			;df17
sub_df18h:
	ld a,0c9h		;df18
	ld (ldf1dh),a		;df1a
ldf1dh:
	nop			;df1d
sub_df1eh:
	push bc			;df1e
	ld a,000h		;df1f
	ld de,050a5h		;df21
	add a,e			;df24
	ld e,a			;df25
	add a,020h		;df26
	ld l,a			;df28
	ld h,d			;df29
	ld b,008h		;df2a
	ld a,(hl)			;df2c
	xor 001h		;df2d
ldf2fh:
	ld (hl),a			;df2f
	ld (de),a			;df30
	inc h			;df31
	inc d			;df32
	djnz ldf2fh		;df33
	pop bc			;df35
	ld hl,0df2eh		;df36
	rlc (hl)		;df39
	jr c,ldf40h		;df3b
ldf3dh:
	djnz sub_df1eh		;df3d
	ret			;df3f
ldf40h:
	ld hl,0df20h		;df40
	dec (hl)			;df43
	jr nz,ldf3dh		;df44
	ld a,001h		;df46
	ld (lf8f9h),a		;df48
	jr sub_df18h		;df4b
ldf4dh:
	ld de,00504h		;df4d
	call sub_dbdfh		;df50
	ld b,065h		;df53
ldf55h:
	halt			;df55
	djnz ldf55h		;df56
	call sub_98f1h		;df58
	ld a,(lf8fch)		;df5b
	ld hl,lef85h		;df5e
	add a,l			;df61
	ld l,a			;df62
	ld a,(hl)			;df63
	ld hl,lf8f8h		;df64
	cp (hl)			;df67
	jp c,ldc33h		;df68
	ld de,00103h		;df6b
	call sub_dbdfh		;df6e
	ld de,05061h		;df71
	ld hl,l69a5h		;df74
	call sub_d06bh		;df77
	ld hl,l64bah		;df7a
	ld de,04043h		;df7d
	call sub_d06bh		;df80
	ld hl,l69abh		;df83
	ld e,0a1h		;df86
	call sub_d06bh		;df88
	ld e,0e0h		;df8b
	call sub_d06bh		;df8d  ; Draw third line
	ld a,(lf8fbh)		;df90  ; A = current difficulty/level value
	cp 009h		;df93  ; Is it level 9 (final/ultimate)?
	jr nz,ldfb2h		;df95  ; If not level 9, skip to normal flow
	ld hl,l695bh		;df97  ; HL -> "YOU HAVE REACHED" tile data
	ld de,04822h		;df9a  ; DE = screen addr: middle area, row 1, col 2
	call sub_d06bh		;df9d
	ld e,061h		;dfa0
	call sub_d06bh		;dfa2
	ld e,0c2h		;dfa5
	call sub_d06bh		;dfa7
	ld de,05001h		;dfaa
	call sub_d06bh		;dfad
	jr ldfe3h		;dfb0
ldfb2h:
	add a,031h		;dfb2
	ld (l69e8h),a		;dfb4
	ld hl,l69d4h		;dfb7
	ld de,04864h		;dfba
	call sub_d06bh		;dfbd
	ld e,0a5h		;dfc0
	call sub_d06bh		;dfc2
	ld e,0e5h		;dfc5
	ld a,022h		;dfc7
	call sub_d060h		;dfc9
	ld a,(lf8fbh)		;dfcc
	ld bc,lfff5h		;dfcf
	ld hl,l686bh		;dfd2
ldfd5h:
	add hl,bc			;dfd5
	dec a			;dfd6
	jr nz,ldfd5h		;dfd7
	ld c,00bh		;dfd9
	call sub_d06dh		;dfdb
	ld a,023h		;dfde
	call sub_d060h		;dfe0
ldfe3h:
	call sub_dfe9h		;dfe3
	jp ldc33h		;dfe6
sub_dfe9h:
	ld hl,entry_end		;dfe9
	ld de,050a4h		;dfec
	call sub_d06bh		;dfef
	ld e,0c4h		;dff2
	ld c,00ch		;dff4
	call sub_d06dh		;dff6
sub_dff9h:
	call sub_dee0h		;dff9
	call sub_d03ah		;dffc
	or a			;dfff
sub_e000h:
	jr nz,sub_dff9h		;e000
le002h:
	call sub_d093h		;e002
	or a			;e005
	ret nz			;e006
	call sub_d03ah		;e007
sub_e00ah:
	and 010h		;e00a
	jr z,le002h		;e00c
	ret			;e00e
sub_e00fh:
	ld d,003h		;e00f
le011h:
	ld b,008h		;e011
	ld a,r		;e013
le015h:
	ld c,a			;e015
	and 010h		;e016
	out (0feh),a		;e018
	ld a,055h		;e01a
le01ch:
	dec a			;e01c
	jr nz,le01ch		;e01d
	ld a,c			;e01f
	rlca			;e020
	djnz le015h		;e021
	dec d			;e023
	jr nz,le011h		;e024
	xor a			;e026
	out (0feh),a		;e027
	ld (lfb03h),a		;e029
	ret			;e02c
sub_e02dh:
	push de			;e02d
	ld de,l8060h		;e02e
le031h:
	ld a,010h		;e031
le033h:
	ld b,e			;e033
le034h:
	out (0feh),a		;e034
	jr le038h		;e036
le038h:
	djnz le034h		;e038
	xor 010h		;e03a
	dec d			;e03c
	jr nz,le033h		;e03d
	xor a			;e03f
	out (0feh),a		;e040
	pop de			;e042
	ret			;e043
sub_e044h:
	push de			;e044
	ld de,040c0h		;e045
	jr le031h		;e048
; ==========================================================================
; BEEPER SOUND EFFECTS ($E04A-$E0C4)
; ==========================================================================
; Short sound effects generated directly via OUT ($FE).
; Used for UI feedback (keypress clicks, menu beeps, etc).
;
sub_e04ah:
	ld c,028h		;e04a  ; C = 40 (sound duration)
	ld a,010h		;e04c  ; A = $10 (speaker bit 4)
le04eh:
	ld b,c			;e04e
le04fh:
	out (0feh),a		;e04f
	jr le053h		;e051
le053h:
	djnz le04fh		;e053
	xor 010h		;e055
	dec c			;e057
	jr nz,le04eh		;e058
	xor a			;e05a
	out (0feh),a		;e05b
	ret			;e05d
; --- Entity state flip ($E05E) ---
; Swaps entity behavior pointers (lf8dch <-> lf8deh) and flips
; direction. Used when an entity changes facing direction.
;
sub_e05eh:
	ld (0c717h),a		;e05e  ; Store entity type
	ld hl,00000h		;e061  ; HL = 0 (self-mod: swapped value)
	ld a,h			;e064
	ld h,l			;e065
	ld l,a			;e066
	ld (0e062h),hl		;e067
	ld hl,(lf8dch)		;e06a
	ex de,hl			;e06d
	ld hl,(lf8deh)		;e06e
	ld (lf8dch),hl		;e071
	ex de,hl			;e074
	ld (lf8deh),hl		;e075
	ret			;e078
sub_e079h:
	ld hl,l6fc3h		;e079
	ld (ld36ah),hl		;e07c
	ld h,0cch		;e07f
	ld (ld3c7h),hl		;e081
	ld a,0d3h		;e084
	ld (0d36ch),a		;e086
	ld a,0d3h		;e089
	ld (0d3c9h),a		;e08b
	ret			;e08e
sub_e08fh:
	ld hl,02418h		;e08f
	ld (ld36dh),hl		;e092
	ld h,02dh		;e095
	ld (ld3cah),hl		;e097
sub_e09ah:
	ld hl,0283ch		;e09a
	ld (ld36ah),hl		;e09d
	ld (ld3c7h),hl		;e0a0
	ld a,003h		;e0a3
	ld (0d36ch),a		;e0a5
	ld (0d3c9h),a		;e0a8
	ret			;e0ab
sub_e0ach:
	ld hl,0013eh		;e0ac
	ld (ld36dh),hl		;e0af
	ld (ld3cah),hl		;e0b2
	ret			;e0b5
; --- Set screen rendering parameters ($E0B6) ---
; Patches HL values into screen compositor self-mod addresses.
;
sub_e0b6h:
	ld a,l			;e0b6  ; Low byte
	ld (0d396h),a		;e0b7  ; Patch into compositor path 1
	ld (0d3fch),a		;e0ba  ; Patch into compositor path 2
	ld a,h			;e0bd  ; High byte
	ld (0d39ah),a		;e0be  ; Patch into compositor path 1
	ld (0d400h),a		;e0c1  ; Patch into compositor path 2
	ret			;e0c4
; --- Compute entity screen position ($E0C5) ---
; Calculates screen address from entity Y (IX+7) and X (IX+1).
; Result stored at $CC11 for rendering.
;
sub_e0c5h:
	ld a,(ix+007h)		;e0c5  ; A = entity Y position
	ld h,000h		;e0c8
	add a,a			;e0ca
	add a,a			;e0cb
	add a,a			;e0cc
	add a,a			;e0cd
	ld l,a			;e0ce
	add hl,hl			;e0cf
	ld e,(ix+001h)		;e0d0
	ld a,e			;e0d3
	add a,a			;e0d4
	sbc a,a			;e0d5
	ld d,a			;e0d6
	add hl,de			;e0d7
	ld (0cc11h),hl		;e0d8
	ret			;e0db
	ld (hl),d			;e0dc
	ld sp,03031h		;e0dd
