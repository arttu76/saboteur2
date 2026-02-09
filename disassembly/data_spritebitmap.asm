; ======================================================================
; data_spritebitmap.asm
; ======================================================================
;
; Sprite & Tile Graphics Data
;
; Address range: $850C-$870B (512 bytes)
; Source binary: block7_main.bin (loaded at $620C)
;
; Bitmap data for entity sprites and interactive tile patterns.
; No executable code - all bytes are pixel/mask data interpreted
; by the rendering system. The disassembler decodes these as Z80
; instructions because this region was not marked as a data block.
;
; Common byte patterns:
;   $08 (ex af,af') - Background/transparent pixels
;   $01 (ld bc...)  - Light-colored pixels
;   $E7 (rst 20h)   - Dark pattern pixels
;   $DF (rst 18h)   - Mask/boundary pixels
;
; Key labels:
;   l8685h ($8685) - Referenced sprite pattern
;   l86fdh ($86FD) - End-of-sprites marker data
;   l8701h ($8701) - SPRITE_BASE: start of sprite data table
;                    (set from code_init.asm initialization)
;
; Cross-references:
;   Read by: RENDER_SPRITE_RAW, entity rendering system
;   Set in: code_init.asm ($7686: ld (SPRITE_BASE),hl = $8701)
;
; ======================================================================

b10_end:

; BLOCK 'b11' (start 0x850c end 0x870c)
b11_start:

; ==========================================================================
; SPRITE GRAPHICS DATA ($850C-$8700)
; ==========================================================================
; Bitmap sprite patterns for game entities. Each sprite is a rectangular
; block of pixel data. Multiple sprite frames stored sequentially.
;
	ex af,af'			;850c
	ex af,af'			;850d
	ex af,af'			;850e
	ex af,af'			;850f
	ex af,af'			;8510
	ex af,af'			;8511
	ex af,af'			;8512
	ex af,af'			;8513
	ex af,af'			;8514
	ex af,af'			;8515
	ex af,af'			;8516
	ex af,af'			;8517
	ex af,af'			;8518
	ex af,af'			;8519
	ex af,af'			;851a
	ex af,af'			;851b
	ex af,af'			;851c
	rst 20h			;851d
	rst 20h			;851e
	rst 20h			;851f
	rst 20h			;8520
	rst 20h			;8521
	rst 20h			;8522
	rst 20h			;8523
	rst 20h			;8524
	rst 20h			;8525
	rst 20h			;8526
	rst 20h			;8527
	rst 20h			;8528
	rst 20h			;8529
	rst 20h			;852a
	rst 20h			;852b
	rst 20h			;852c
	rst 20h			;852d
	rst 20h			;852e
	rst 20h			;852f
	rst 20h			;8530
	rst 20h			;8531
	rst 20h			;8532
	rst 20h			;8533
	rst 20h			;8534
	rst 18h			;8535
	dec bc			;8536
	inc c			;8537
	inc c			;8538
	inc c			;8539
	inc c			;853a
	dec c			;853b
	rst 18h			;853c
	ex af,af'			;853d
	ex af,af'			;853e
	ex af,af'			;853f
	ex af,af'			;8540
	ex af,af'			;8541
	ex af,af'			;8542
	ex af,af'			;8543
	ex af,af'			;8544
	ex af,af'			;8545
	ex af,af'			;8546
	ex af,af'			;8547
	ex af,af'			;8548
	ex af,af'			;8549
	ex af,af'			;854a
	ex af,af'			;854b
	ex af,af'			;854c
	ld bc,00101h		;854d
	ld bc,00101h		;8550
	ld bc,00101h		;8553
	ld bc,00101h		;8556
	ld bc,00101h		;8559
	ld bc,00101h		;855c
	ld bc,00101h		;855f
	ld bc,00101h		;8562
	ld bc,00101h		;8565
	ld bc,00101h		;8568
	ld bc,00101h		;856b
	ld bc,00101h		;856e
	ld bc,00101h		;8571
	ld bc,00101h		;8574
	ld bc,00101h		;8577
	ld bc,00101h		;857a
	ld bc,00101h		;857d
	ld bc,00101h		;8580
	ld bc,00101h		;8583
	ld bc,00101h		;8586
	ld bc,00101h		;8589
	ld bc,00101h		;858c
	ld bc,00101h		;858f
	ld bc,00101h		;8592
	cp 0feh		;8595
	rst 10h			;8597
	ld bc,00101h		;8598
	ld bc,le701h		;859b
	rst 20h			;859e
	rst 20h			;859f
	rst 10h			;85a0
	ld bc,00101h		;85a1
	ld bc,le7e7h		;85a4
	call pe,001dfh		;85a7
	ld bc,00101h		;85aa
	rst 20h			;85ad
	rst 20h			;85ae
	jp c,00101h		;85af
	ld bc,00101h		;85b2
	rst 20h			;85b5
	rst 20h			;85b6
	exx			;85b7
	ld bc,00101h		;85b8
	ld bc,le701h		;85bb
	pop hl			;85be
	jp c,00101h		;85bf
	ld bc,00101h		;85c2
	rst 20h			;85c5
	rst 20h			;85c6
	ret c			;85c7
	ld bc,00101h		;85c8
	ld bc,le701h		;85cb
	exx			;85ce
	jp c,00101h		;85cf
	ld bc,00101h		;85d2
	rst 20h			;85d5
	rst 20h			;85d6
	ret c			;85d7
	ld bc,00101h		;85d8
	ld bc,le701h		;85db
	rst 20h			;85de
	jp c,00101h		;85df
	ld bc,00101h		;85e2
	call c,sub_d8deh		;85e5
	ld bc,00101h		;85e8
	ld bc,00801h		;85eb
	ex af,af'			;85ee
	ld (de),a			;85ef
	ld bc,00101h		;85f0
	ld bc,00801h		;85f3
	ex af,af'			;85f6
	ex af,af'			;85f7
	ld de,00101h		;85f8
	ld bc,00801h		;85fb
	ex af,af'			;85fe
	ex af,af'			;85ff
	ld (de),a			;8600
	ld bc,00101h		;8601
	ld bc,00808h		;8604
	ex af,af'			;8607
	ex af,af'			;8608
	ld de,00101h		;8609
	ld bc,00808h		;860c
	ex af,af'			;860f
	ex af,af'			;8610
	ld (de),a			;8611
	ld bc,00101h		;8612
	ex af,af'			;8615
	ex af,af'			;8616
	ex af,af'			;8617
	ex af,af'			;8618
	ex af,af'			;8619
	ld de,00101h		;861a
	ex af,af'			;861d
	ex af,af'			;861e
	ex af,af'			;861f
	ex af,af'			;8620
	ex af,af'			;8621
	ld (de),a			;8622
	ld bc,le901h		;8623
	ret pe			;8626
	jp (hl)			;8627
	ret pe			;8628
	jp (hl)			;8629
	jp (hl)			;862a
	ret pe			;862b
	rst 10h			;862c
	rst 20h			;862d
	rst 20h			;862e
	rst 20h			;862f
	rst 20h			;8630
	rst 20h			;8631
	rst 20h			;8632
	rst 20h			;8633
	rst 18h			;8634
	rst 20h			;8635
	rst 20h			;8636
	rst 20h			;8637
	rst 20h			;8638
	rst 20h			;8639
	in a,(0dfh)		;863a
	ld bc,00101h		;863c
	ld bc,00101h		;863f
	ld bc,00101h		;8642
	ld bc,00101h		;8645
	ld bc,00101h		;8648
	ld bc,00101h		;864b
	ld bc,00101h		;864e
	ld bc,00101h		;8651
	ld bc,0eff0h		;8654
	xor 0e9h		;8657
	ret pe			;8659
	jp pe,leee9h		;865a
	defb 0edh;next byte illegal after ed		;865d
	rst 20h			;865e
	call pe,sub_e7eah		;865f
	xor 0e7h		;8662
	rst 20h			;8664
	rst 20h			;8665
	rst 20h			;8666
	ex de,hl			;8667
	rst 20h			;8668
	rst 20h			;8669
	rst 20h			;866a
	rst 20h			;866b
	rst 20h			;866c
	ld bc,00101h		;866d
	ld bc,le201h		;8670
	pop hl			;8673
	rst 20h			;8674
	ld bc,00101h		;8675
	ld bc,le401h		;8678
	rst 20h			;867b
	rst 20h			;867c
	ld bc,00101h		;867d
	ld bc,ld601h		;8680
	rst 20h			;8683
	rst 20h			;8684
l8685h:
	ld bc,00101h		;8685
	ld bc,00101h		;8688
	sbc a,008h		;868b
	ld bc,00101h		;868d
	ld bc,00101h		;8690
	defb 0ddh,008h,001h	;illegal sequence		;8693
	ld bc,00101h		;8696
	ld bc,00101h		;8699
	ex af,af'			;869c
	ld bc,00101h		;869d
	ld bc,le601h		;86a0
	rst 20h			;86a3
	rst 20h			;86a4
	ld bc,00101h		;86a5
	ld bc,le501h		;86a8
	rst 20h			;86ab
	rst 20h			;86ac
	ld bc,00101h		;86ad
	ld bc,le401h		;86b0
	ex (sp),hl			;86b3
	rst 20h			;86b4
	ld bc,00101h		;86b5
	ld bc,le601h		;86b8
	rst 20h			;86bb
	rst 20h			;86bc
	ld bc,00101h		;86bd
	ld bc,le201h		;86c0
	pop hl			;86c3
	rst 20h			;86c4
	ld bc,00101h		;86c5
	ld bc,le401h		;86c8
	rst 20h			;86cb
	rst 20h			;86cc
	ld bc,00101h		;86cd
	ld bc,00101h		;86d0
	ld bc,00101h		;86d3
	ld bc,00101h		;86d6
	ld bc,00101h		;86d9
	ld bc,00101h		;86dc
	ld bc,00101h		;86df
	ld bc,00101h		;86e2
	ld bc,00101h		;86e5
	ld bc,le001h		;86e8
	cp 0feh		;86eb
	ld bc,00101h		;86ed
	ld bc,le201h		;86f0
	pop hl			;86f3
	rst 20h			;86f4
	ld bc,00101h		;86f5
	ld bc,le401h		;86f8
	rst 20h			;86fb
	rst 20h			;86fc
l86fdh:
	dec de			;86fd
	ex af,af'			;86fe
	ld h,b			;86ff
	ld l,b			;8700
; --- SPRITE_BASE: Sprite data table start ($8701) ---
; Referenced by code_init.asm: ld (SPRITE_BASE),hl = l8701h
l8701h:
	ld bc,00102h		;8701
	ld bc,00702h		;8704
	dec b			;8707
	rlca			;8708
	ld b,001h		;8709
	inc bc			;870b
