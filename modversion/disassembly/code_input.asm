; ======================================================================
; code_input.asm
; ======================================================================
;
; Entity Data Tables & Configuration (Mostly DATA)
;
; Address range: $B4CC-$B80B (832 bytes)
; Source binary: mod_decompressed.bin (loaded at $620C)
;
; Despite being classified as "code" in block definitions, this section
; is predominantly DATA tables that the disassembler incorrectly
; interprets as Z80 instructions. Contains entity behavior scripts,
; keyboard/joystick configuration, sprite lookup tables, and state
; variables relocated from various original sections.
;
; Structure:
;   $B4CC-$B4E9  Configuration data (input/control settings)
;   $B4EA-$B501  Zero-initialized pointer storage area
;   $B502-$B536  Keyboard port/bit mapping + entity config
;   $B537-$B68A  Entity behavior scripts (preserved from original)
;   $B68B-$B7F6  Sprite data, animation tables, state variables
;   $B7F7-$B80B  Entity behavior pointer table (preserved)
;
; ======================================================================

sprites_end:

input_start:
	ex af,af'			;b4cc
	or a			;b4cd
	ex af,af'			;b4ce
	rst 30h			;b4cf
	ld hl,000ffh		;b4d0
	rst 38h			;b4d3
	nop			;b4d4
	rst 38h			;b4d5
	nop			;b4d6
	call m,sub_fe03h		;b4d7
	ld bc,001feh		;b4da
	ret p			;b4dd
	rrca			;b4de
	ret nz			;b4df
	ld a,(lfc20h)		;b4e0
lb4e3h:
	inc bc			;b4e3
	ret m			;b4e4
	inc b			;b4e5
	ret nz			;b4e6
	jr c,lb4e9h		;b4e7
lb4e9h:
	ret nz			;b4e9
	nop			;b4ea
	nop			;b4eb
	nop			;b4ec
	nop			;b4ed
	nop			;b4ee
	nop			;b4ef
	nop			;b4f0
	nop			;b4f1
	jr nz,lb502h		;b4f2
	pop af			;b4f4
	nop			;b4f5
	ld c,000h		;b4f6
; ==========================================================================
; DATA: Layer Data Pointers (self-modifying storage)
; ==========================================================================
; These 2-byte variables hold the current position in each rendering
; layer's data stream. They are updated as tiles are processed.
;
	nop			;b4f8  ; Layer 1 pointer (low byte)
	nop			;b4f9  ; Layer 1 pointer (high byte)
	nop			;b4fa  ; Layer 2 pointer (low byte)
	nop			;b4fb  ; Layer 2 pointer (high byte)
	nop			;b4fc  ; Layer 3 pointer (low byte)
	nop			;b4fd  ; Layer 3 pointer (high byte)
lb4feh:
	nop			;b4fe  ; Layer 4 pointer (low byte)
	nop			;b4ff  ; Layer 4 pointer (high byte)
lb500h:
	nop			;b500  ; Pixel row 0
	nop			;b501  ; Pixel row 1
lb502h:
	nop			;b502  ; Pixel row 2
	jr nz,lb584h		;b503
	add a,b			;b505
	rra			;b506
	ld h,b			;b507
	rrca			;b508
	djnz $+17		;b509
	djnz lb514h		;b50b
	ex af,af'			;b50d
	inc bc			;b50e
	inc c			;b50f
	ld bc,00102h		;b510
	ld (bc),a			;b513
lb514h:
	jr nz,lb496h		;b514
	ld d,l			;b516
	ret nz			;b517
	ld a,(014e0h)		;b518
	ret nz			;b51b
	ld a,(0d400h)		;b51c
lb51fh:
	ret nz			;b51f
	ld hl,(037c0h)		;b520
	add a,b			;b523
	ld l,d			;b524
	jr nz,$+60		;b525
	dec sp			;b527
	ret nc			;b528
	ld hl,l81a7h		;b529
	dec a			;b52c
	ret z			;b52d
	dec a			;b52e
	jr z,lb533h		;b52f
	ld l,0c7h		;b531
lb533h:
	ld (0d048h),hl		;b533
	ret			;b536
	ret m			;b537
	nop			;b538
	jr nc,lb541h		;b539
	jr lb4feh		;b53b
	inc c			;b53d
	ld hl,011c4h		;b53e
lb541h:
	add a,b			;b541
	ld (de),a			;b542
	nop			;b543
	ld l,l			;b544
	nop			;b545
	adc a,(hl)			;b546
	ex af,af'			;b547
	rra			;b548
	ld b,b			;b549
	ccf			;b54a
	add a,b			;b54b
	ld a,a			;b54c
	nop			;b54d
	ccf			;b54e
	nop			;b54f
	rra			;b550
	ld b,b			;b551
	ccf			;b552
	add a,b			;b553
	ld a,a			;b554
	nop			;b555
	rst 38h			;b556
	nop			;b557
	ex af,af'			;b558
	ld b,c			;b559
	jr lb51fh		;b55a
	jr $-123		;b55c
	jr z,lb4e3h		;b55e
	jr c,lb4e3h		;b560
	inc (hl)			;b562
	ld b,e			;b563
	jr lb568h		;b564
	sbc a,b			;b566
	nop			;b567
lb568h:
	ld d,l			;b568
	ex af,af'			;b569
	rst 38h			;b56a
	nop			;b56b
	rst 28h			;b56c
	nop			;b56d
	rst 0			;b56e
	djnz lb500h		;b56f
	jr nz,lb57ah		;b571
	ld (hl),b			;b573
	rrca			;b574
	ld b,b			;b575
	ccf			;b576
	add a,b			;b577
	ccf			;b578
	add a,b			;b579
lb57ah:
	ex af,af'			;b57a
	rst 38h			;b57b
	nop			;b57c
	rst 38h			;b57d
	nop			;b57e
	rst 38h			;b57f
	nop			;b580
	ei			;b581
	nop			;b582
	ld (hl),c			;b583
lb584h:
	inc b			;b584
	ld bc,00384h		;b585
	ld a,b			;b588
	add a,c			;b589
	ex af,af'			;b58a
	ex af,af'			;b58b
	nop			;b58c
	ld d,l			;b58d
	add a,b			;b58e
	ld a,(03e80h)		;b58f
	add a,c			;b592
	inc a			;b593
	add a,e			;b594
	jr z,$-119		;b595
	jr nc,lb5a0h		;b597
	ld (hl),b			;b599
	rlca			;b59a
	ld (hl),b			;b59b
	ex af,af'			;b59c
	add a,b			;b59d
	ld a,000h		;b59e
lb5a0h:
	ld e,d			;b5a0
	and b			;b5a1
	rrca			;b5a2
	ret p			;b5a3
	dec b			;b5a4
	ret po			;b5a5
	ld b,080h		;b5a6
	rra			;b5a8
	nop			;b5a9
	ld h,c			;b5aa
	ld e,080h		;b5ab
	ex af,af'			;b5ad
	add a,e			;b5ae
	jr lb5b8h		;b5af
	ld h,b			;b5b1
	inc bc			;b5b2
	ret nc			;b5b3
	ld hl,0338ch		;b5b4
	add a,b			;b5b7
lb5b8h:
	rra			;b5b8
	ld b,b			;b5b9
	rrca			;b5ba
	and b			;b5bb
	rrca			;b5bc
	and b			;b5bd
	ex af,af'			;b5be
	cp 000h		;b5bf
	call m,sub_dc00h		;b5c1
	ld bc,02388h		;b5c4
	ret nz			;b5c7
	rla			;b5c8
	ret nz			;b5c9
	ld e,081h		;b5ca
	inc (hl)			;b5cc
	inc bc			;b5cd
	ld l,b			;b5ce
	ex af,af'			;b5cf
	rrca			;b5d0
	ret po			;b5d1
	rra			;b5d2
	ret nz			;b5d3
	ccf			;b5d4
	add a,b			;b5d5
	ld a,a			;b5d6
	nop			;b5d7
	ld a,a			;b5d8
	nop			;b5d9
	rst 38h			;b5da
	nop			;b5db
	rst 38h			;b5dc
	nop			;b5dd
	rst 38h			;b5de
	nop			;b5df
	ex af,af'			;b5e0
	ld (bc),a			;b5e1
	ret nc			;b5e2
	nop			;b5e3
	ld l,l			;b5e4
	nop			;b5e5
	ld d,e			;b5e6
	add a,b			;b5e7
	dec sp			;b5e8
	ret nz			;b5e9
	ld e,0e0h		;b5ea
	ld c,0f0h		;b5ec
	rlca			;b5ee
	ret p			;b5ef
	rlca			;b5f0
	ex af,af'			;b5f1
	rlca			;b5f2
	ret p			;b5f3
	rlca			;b5f4
	ret p			;b5f5
	rrca			;b5f6
	and b			;b5f7
	rra			;b5f8
	ret nz			;b5f9
	ccf			;b5fa
	add a,b			;b5fb
	ccf			;b5fc
	add a,b			;b5fd
	ld a,a			;b5fe
	nop			;b5ff
	ld a,a			;b600
lb601h:
	nop			;b601
	ex af,af'			;b602
	ret p			;b603
	dec b			;b604
	ret po			;b605
	dec c			;b606
	ret po			;b607
	dec c			;b608
	ret po			;b609
	ld a,(bc)			;b60a
	ret nz			;b60b
	ld a,(de)			;b60c
	pop bc			;b60d
	inc e			;b60e
	pop bc			;b60f
	inc e			;b610
	add a,c			;b611
	inc (hl)			;b612
	ex af,af'			;b613
	add a,c			;b614
	inc (hl)			;b615
	add a,e			;b616
	jr c,lb61ch		;b617
	ld e,b			;b619
	inc bc			;b61a
	ld l,b			;b61b
lb61ch:
	inc bc			;b61c
	ld l,b			;b61d
lb61eh:
	inc bc			;b61e
	ret pe			;b61f
	inc bc			;b620
	xor b			;b621
	rlca			;b622
	ret nc			;b623
	ex af,af'			;b624
	call m,0fc01h		;b625
	ld bc,001fch		;b628
	ret m			;b62b
	inc bc			;b62c
	ret m			;b62d
	inc bc			;b62e
	ret m			;b62f
	inc bc			;b630
	ret p			;b631
	dec b			;b632
	ret p			;b633
	dec b			;b634
	ex af,af'			;b635
	rlca			;b636
	ret nc			;b637
	rlca			;b638
	ret nc			;b639
	rlca			;b63a
	ret nc			;b63b
	rrca			;b63c
	and b			;b63d
	rrca			;b63e
	and b			;b63f
	rrca			;b640
	and b			;b641
	rrca			;b642
	and b			;b643
	rrca			;b644
	and b			;b645
	ex af,af'			;b646
	ret p			;b647
	rlca			;b648
	ret po			;b649
	rrca			;b64a
	ret po			;b64b
	ld c,0e0h		;b64c
	ld a,(bc)			;b64e
	ret nz			;b64f
	ld a,(de)			;b650
	ret nz			;b651
	rra			;b652
	ret nz			;b653
	dec e			;b654
	add a,b			;b655
	inc a			;b656
	ex af,af'			;b657
	rra			;b658
	ld b,b			;b659
	rra			;b65a
	ld b,b			;b65b
	rra			;b65c
	ret nz			;b65d
	rra			;b65e
	ret nz			;b65f
	rra			;b660
	ld b,b			;b661
	rra			;b662
	ld b,b			;b663
	rra			;b664
	ld b,b			;b665
	rrca			;b666
	ld h,b			;b667
	ex af,af'			;b668
	add a,b			;b669
	ld a,080h		;b66a
	dec (hl)			;b66c
	nop			;b66d
	ld a,a			;b66e
	nop			;b66f
	ld a,a			;b670
	nop			;b671
	halt			;b672
	nop			;b673
	ld l,a			;b674
	nop			;b675
	ld l,(hl)			;b676
	nop			;b677
	defb 0edh;next byte illegal after ed		;b678
	ex af,af'			;b679
	rrca			;b67a
	and b			;b67b
	rra			;b67c
	ld b,b			;b67d
	rra			;b67e
	ld b,b			;b67f
	rra			;b680
	ld b,b			;b681
	rrca			;b682
	and b			;b683
	rlca			;b684
	ld d,b			;b685
	nop			;b686
	xor b			;b687
	nop			;b688
	rst 10h			;b689
	ex af,af'			;b68a
	ret m			;b68b
	ld bc,006f1h		;b68c
	jp po,lc507h+1		;b68f
	djnz lb61eh		;b692
	jr nz,lb6aah		;b694
	ld b,b			;b696
	ld hl,(05441h)		;b697
	ld b,l			;b69a
	ex af,af'			;b69b
	rra			;b69c
	ret nz			;b69d
	rra			;b69e
	ld b,b			;b69f
	rra			;b6a0
	ld b,b			;b6a1
	ccf			;b6a2
	add a,b			;b6a3
	ccf			;b6a4
	add a,b			;b6a5
	ccf			;b6a6
	add a,b			;b6a7
	ld a,a			;b6a8
	nop			;b6a9
lb6aah:
	ld a,a			;b6aa
	nop			;b6ab
	ex af,af'			;b6ac
	cp 000h		;b6ad
	call m,0fc01h		;b6af
	ld bc,003f8h		;b6b2
	ret p			;b6b5
	ld b,0e0h		;b6b6
	ld c,0e0h		;b6b8
	rrca			;b6ba
	ret po			;b6bb
	add hl,bc			;b6bc
	ex af,af'			;b6bd
	and b			;b6be
	add a,c			;b6bf
	ld b,b			;b6c0
	rrca			;b6c1
	add a,b			;b6c2
	rla			;b6c3
	ld b,b			;b6c4
	ld a,000h		;b6c5
	cp (hl)			;b6c7
	nop			;b6c8
	ld e,a			;b6c9
	nop			;b6ca
	rst 18h			;b6cb
	nop			;b6cc
	rst 20h			;b6cd
	ex af,af'			;b6ce
	rst 38h			;b6cf
	nop			;b6d0
	rst 38h			;b6d1
	nop			;b6d2
	rst 38h			;b6d3
	nop			;b6d4
	rst 38h			;b6d5
	nop			;b6d6
	rst 38h			;b6d7
	nop			;b6d8
	ld bc,00000h		;b6d9
	cp 000h		;b6dc
	ld bc,lff08h		;b6de
	nop			;b6e1
	rst 38h			;b6e2
	nop			;b6e3
	rst 38h			;b6e4
	nop			;b6e5
	rst 38h			;b6e6
	nop			;b6e7
	call m,sub_f800h		;b6e8
	inc bc			;b6eb
	ret m			;b6ec
	ld bc,002f8h		;b6ed
	ex af,af'			;b6f0
	ret p			;b6f1
	rlca			;b6f2
	ret p			;b6f3
	rlca			;b6f4
	ret po			;b6f5
	rrca			;b6f6
lb6f7h:
	ret po			;b6f7
	rrca			;b6f8
	ret nz			;b6f9
	rra			;b6fa
	ret nz			;b6fb
	ld e,0c0h		;b6fc
	ld e,0c0h		;b6fe
	ld e,008h		;b700
	nop			;b702
	sbc a,e			;b703
	nop			;b704
	rst 0			;b705
	djnz $-120		;b706
	ld b,b			;b708
	inc c			;b709
	nop			;b70a
	inc l			;b70b
	nop			;b70c
	ld e,h			;b70d
	add a,b			;b70e
	ld e,d			;b70f
	nop			;b710
	ld e,d			;b711
	ex af,af'			;b712
	nop			;b713
	ld l,a			;b714
	nop			;b715
	ld (hl),a			;b716
	nop			;b717
	ei			;b718
	nop			;b719
	defb 0fdh,000h,03dh	;illegal sequence		;b71a
	add a,b			;b71d
	add hl,de			;b71e
	nop			;b71f
	dec d			;b720
	add a,b			;b721
	dec l			;b722
	ld a,(bc)			;b723
	inc bc			;b724
	cp b			;b725
	inc bc			;b726
	ret c			;b727
	ld bc,000ech		;b728
	and 000h		;b72b
	or 001h		;b72d
	ret p			;b72f
	rlca			;b730
	ret p			;b731
	rlca			;b732
	ret p			;b733
	ex af,af'			;b734
	ret nz			;b735
	ld e,0e0h		;b736
	rrca			;b738
	ret po			;b739
	rrca			;b73a
	ret p			;b73b
	rlca			;b73c
	ret p			;b73d
	rlca			;b73e
	ret m			;b73f
	inc bc			;b740
	call m,0fe01h		;b741
	nop			;b744
	ex af,af'			;b745
	ld bc,00264h		;b746
	jr c,lb790h		;b749
	nop			;b74b
	nop			;b74c
	add a,b			;b74d
	nop			;b74e
	rst 38h			;b74f
	nop			;b750
	rst 38h			;b751
	nop			;b752
	rst 38h			;b753
	nop			;b754
	ld a,a			;b755
	ex af,af'			;b756
	nop			;b757
	inc a			;b758
	add a,d			;b759
	jr c,lb75fh		;b75a
	ld a,b			;b75c
	rlca			;b75d
	ret p			;b75e
lb75fh:
	rlca			;b75f
	ret p			;b760
	rrca			;b761
	ret po			;b762
	rra			;b763
	ret nz			;b764
	ccf			;b765
	nop			;b766
	ex af,af'			;b767
	nop			;b768
	ld d,l			;b769
	nop			;b76a
	rst 38h			;b76b
	nop			;b76c
	ld a,(hl)			;b76d
	nop			;b76e
	ld a,a			;b76f
	add a,b			;b770
	ccf			;b771
	ret nz			;b772
	rra			;b773
lb774h:
	ret po			;b774
	rrca			;b775
lb776h:
	ret p			;b776
	inc bc			;b777
lb778h:
	ex af,af'			;b778
	nop			;b779
lb77ah:
	ld d,a			;b77a
	nop			;b77b
lb77ch:
	ld sp,hl			;b77c
	and b			;b77d
lb77eh:
	inc bc			;b77e
	nop			;b77f
lb780h:
	rrca			;b780
	nop			;b781
lb782h:
	rst 38h			;b782
	nop			;b783
	rst 38h			;b784
	nop			;b785
	rst 38h			;b786
	nop			;b787
	call m,00708h		;b788
	ret p			;b78b
	rrca			;b78c
	ret po			;b78d
	rrca			;b78e
	ret po			;b78f
lb790h:
	rra			;b790
	ret nz			;b791
	rra			;b792
	ret nz			;b793
lb794h:
	ccf			;b794
	add a,b			;b795
	ld a,a			;b796
	nop			;b797
	rst 38h			;b798
	nop			;b799
	ex af,af'			;b79a
	ld a,a			;b79b
	nop			;b79c
	ccf			;b79d
	add a,b			;b79e
	rlca			;b79f
	ret po			;b7a0
	nop			;b7a1
	ret m			;b7a2
	nop			;b7a3
	rst 38h			;b7a4
	nop			;b7a5
	rst 38h			;b7a6
	nop			;b7a7
	rst 38h			;b7a8
	nop			;b7a9
	rst 38h			;b7aa
	ex af,af'			;b7ab
	rst 38h			;b7ac
	nop			;b7ad
	rst 38h			;b7ae
	nop			;b7af
	rst 38h			;b7b0
	nop			;b7b1
	rst 38h			;b7b2
	nop			;b7b3
	rlca			;b7b4
	nop			;b7b5
	nop			;b7b6
	ret m			;b7b7
	nop			;b7b8
	rst 38h			;b7b9
	nop			;b7ba
	rst 38h			;b7bb
	ex af,af'			;b7bc
	rst 38h			;b7bd
	nop			;b7be
	rst 38h			;b7bf
	nop			;b7c0
lb7c1h:
	rst 38h			;b7c1
	nop			;b7c2
	rst 38h			;b7c3
	nop			;b7c4
	rst 38h			;b7c5
	nop			;b7c6
	rst 38h			;b7c7
	nop			;b7c8
	inc bc			;b7c9
	nop			;b7ca
	nop			;b7cb
	call m,lff08h		;b7cc
	nop			;b7cf
	rst 38h			;b7d0
	nop			;b7d1
	rst 38h			;b7d2
	nop			;b7d3
	rst 38h			;b7d4
	nop			;b7d5
	rst 38h			;b7d6
	nop			;b7d7
	call m,sub_e000h		;b7d8
	inc bc			;b7db
lb7dch:
	nop			;b7dc
	inc e			;b7dd
	ex af,af'			;b7de
	rst 38h			;b7df
	nop			;b7e0
	nop			;b7e1
	rst 38h			;b7e2
	nop			;b7e3
	rst 38h			;b7e4
	nop			;b7e5
	add a,b			;b7e6
	nop			;b7e7
	cp a			;b7e8
	nop			;b7e9
lb7eah:
	add a,c			;b7ea
	nop			;b7eb
	add a,b			;b7ec
	nop			;b7ed
	rst 38h			;b7ee
lb7efh:
	jr z,lb774h		;b7ef
	jr c,lb776h		;b7f1
	jr c,lb778h		;b7f3
	jr c,lb77ah		;b7f5
; ==========================================================================
; ENTITY BEHAVIOR POINTER TABLE ($B7F7-$B80B)
; ==========================================================================
; Initial offset/pointer data for entity behavior dispatch.
; Each 2-byte entry is a relative jump target. Disassembled as
; jr/pop/inc instructions but is actually lookup table data.
;
	jr c,lb77ch		;b7f7  ; DATA: behavior pointer entry 0
	jr c,lb77eh		;b7f9  ; DATA: behavior pointer entry 1
	jr c,lb780h		;b7fb  ; DATA: behavior pointer entry 2
	jr c,lb782h		;b7fd  ; DATA: behavior pointer entry 3
	jr c,lb821h		;b7ff  ; DATA: behavior pointer entry 4
	pop bc			;b801
	inc e			;b802
	pop bc			;b803
	inc e			;b804
lb805h:
	pop bc			;b805
	inc e			;b806
	pop bc			;b807
	inc e			;b808
	pop bc			;b809
	inc e			;b80a
	pop bc			;b80b
