; ======================================================================
; data_entityspawn.asm
; ======================================================================
;
; Entity Spawn Configuration Tables
;
; Address range: $960C-$980B (512 bytes)
; Source binary: block7_main.bin (loaded at $620C)
;
; This block contains entity spawn/configuration data for different
; rooms and enemy types. No actual executable code - all bytes are
; structured data records that the disassembler decodes as Z80
; instructions.
;
; Each record defines an entity to spawn when entering a room:
;   - Entity type and behavior mode
;   - Starting position (X, Y coordinates)
;   - Movement pattern parameters
;   - Sprite/animation index
;
; The $00,$00 byte pairs (NOP NOP) appear to be record separators
; or padding between entries. Values like $08 (ex af,af') at record
; ends may serve as terminators.
;
; Cross-references:
;   Read by: code_mainloop.asm (entity spawning system)
;   Related: ENTITY_ARRAY ($9436), entity behavior tables in code_behavior.asm
;
; ======================================================================

b14_end:

; BLOCK 'b15' (start 0x960c end 0xa10c)
b15_start:

; ==========================================================================
; ENTITY SPAWN DATA ($960C-$980B)
; ==========================================================================
; Structured entity configuration records. All bytes are data, not code.
; The disassembler decodes these as Z80 instructions because this region
; was not marked as a data block during disassembly.
;
	dec de			;960c
	add a,(hl)			;960d
	ld bc,0011ah		;960e
	dec e			;9611
	inc c			;9612
	inc c			;9613
	nop			;9614
	ld bc,00695h		;9615
	jr l9620h		;9618
	ld bc,01017h		;961a
	ld a,(de)			;961d
	ld a,(de)			;961e
	ex af,af'			;961f
l9620h:
	nop			;9620
	nop			;9621
	ld d,006h		;9622
	jr l962ch		;9624
	ld bc,01416h		;9626
	dec de			;9629
	dec bc			;962a
	ex af,af'			;962b
l962ch:
	nop			;962c
	nop			;962d
	ld d,006h		;962e
	jr l95b8h		;9630
	ld bc,01416h		;9632
	dec de			;9635
	dec bc			;9636
	adc a,h			;9637
	nop			;9638
	ld bc,00618h		;9639
	dec d			;963c
	add a,(hl)			;963d
	ld bc,01114h		;963e
	rla			;9641
	ld a,(de)			;9642
	inc c			;9643
	nop			;9644
	ld bc,00618h		;9645
	rla			;9648
	ld b,001h		;9649
	ld d,001h		;964b
	jr l9669h		;964d
	adc a,b			;964f
	nop			;9650
	nop			;9651
	jr l965ah		;9652
	add hl,de			;9654
	add a,(hl)			;9655
	ld bc,00118h		;9656
	dec de			;9659
l965ah:
	ld a,(de)			;965a
	inc c			;965b
	nop			;965c
	ld bc,00699h		;965d
	ld d,006h		;9660
	ld bc,01115h		;9662
	jr l966dh		;9665
	ex af,af'			;9667
	nop			;9668
l9669h:
	nop			;9669
	sbc a,d			;966a
	ld b,014h		;966b
l966dh:
	ld b,001h		;966d
	ld (de),a			;966f
	djnz l9687h		;9670
	dec bc			;9672
	ex af,af'			;9673
	nop			;9674
	nop			;9675
	sbc a,e			;9676
	ld b,014h		;9677
	ld b,001h		;9679
	inc de			;967b
	ld bc,00b17h		;967c
	ex af,af'			;967f
	nop			;9680
	nop			;9681
	sbc a,e			;9682
	ld b,01ah		;9683
	ld b,001h		;9685
l9687h:
	ld a,(de)			;9687
	nop			;9688
	dec de			;9689
	dec bc			;968a
	ex af,af'			;968b
l968ch:
	nop			;968c
	nop			;968d
	dec e			;968e
	ld b,017h		;968f
	ld b,001h		;9691
	dec d			;9693
	djnz l96b0h		;9694
	ex af,af'			;9696
	ex af,af'			;9697
	nop			;9698
	nop			;9699
	dec e			;969a
	ld a,(bc)			;969b
	dec e			;969c
	ld a,(bc)			;969d
	ld bc,0101ch		;969e
	ld e,01ah		;96a1
	adc a,b			;96a3
	nop			;96a4
	nop			;96a5
	sbc a,(hl)			;96a6
	ld b,017h		;96a7
	ld b,001h		;96a9
	ld (de),a			;96ab
	djnz l96cah		;96ac
	dec bc			;96ae
	ex af,af'			;96af
l96b0h:
	nop			;96b0
	nop			;96b1
	ld e,00ch		;96b2
	rla			;96b4
	inc c			;96b5
	ld bc,01012h		;96b6
	inc e			;96b9
	dec bc			;96ba
	adc a,b			;96bb
	nop			;96bc
	nop			;96bd
	ld a,(bc)			;96be
	ld a,(bc)			;96bf
	inc b			;96c0
	ld a,(bc)			;96c1
	ld bc,00304h		;96c2
	dec b			;96c5
	dec d			;96c6
	ex af,af'			;96c7
	nop			;96c8
	nop			;96c9
l96cah:
	sub l			;96ca
	ld b,013h		;96cb
	ld b,001h		;96cd
	ld (de),a			;96cf
	nop			;96d0
	inc d			;96d1
	dec bc			;96d2
	ex af,af'			;96d3
	nop			;96d4
	nop			;96d5
	ld d,006h		;96d6
	inc d			;96d8
	ld b,001h		;96d9
	inc de			;96db
	djnz l96f2h		;96dc
	dec bc			;96de
	ex af,af'			;96df
	nop			;96e0
	nop			;96e1
	sub d			;96e2
	ld bc,le111h		;96e3
	nop			;96e6
	djnz l96ech		;96e7
	ld de,00717h		;96e9
l96ech:
	nop			;96ec
	nop			;96ed
	dec e			;96ee
	ld a,(bc)			;96ef
	rra			;96f0
	ld a,(bc)			;96f1
l96f2h:
	ld bc,00e1ch		;96f2
	jr nz,l96fah		;96f5
	ex af,af'			;96f7
	nop			;96f8
	nop			;96f9
l96fah:
	dec de			;96fa
	dec c			;96fb
	ld (bc),a			;96fc
	dec c			;96fd
	ld bc,00f01h		;96fe
	ld (bc),a			;9701
	jr l968ch		;9702
	nop			;9704
	nop			;9705
	sbc a,e			;9706
	ld a,(bc)			;9707
	ld (bc),a			;9708
	ld a,(bc)			;9709
	ld bc,00f01h		;970a
	ld (bc),a			;970d
	jr l9718h		;970e
	nop			;9710
	nop			;9711
	ld b,00fh		;9712
	dec b			;9714
	xor a			;9715
	nop			;9716
	dec b			;9717
l9718h:
	ld a,(bc)			;9718
	dec b			;9719
	inc d			;971a
	dec b			;971b
	nop			;971c
	nop			;971d
	adc a,c			;971e
	rrca			;971f
	inc b			;9720
	rrca			;9721
	ld bc,00604h		;9722
	inc b			;9725
	inc d			;9726
	ex af,af'			;9727
	nop			;9728
	nop			;9729
	ld a,(bc)			;972a
	rrca			;972b
	inc b			;972c
	rrca			;972d
	ld bc,00104h		;972e
	dec b			;9731
	inc d			;9732
	adc a,b			;9733
	nop			;9734
	nop			;9735
	dec bc			;9736
	rrca			;9737
	inc b			;9738
	cpl			;9739
	nop			;973a
	inc b			;973b
	ld bc,00705h		;973c
	ld bc,00000h		;973f
	dec bc			;9742
	djnz $+6		;9743
	jr nc,l9748h		;9745
	inc b			;9747
l9748h:
	ld bc,01a04h		;9748
	adc a,c			;974b
	nop			;974c
	nop			;974d
	inc c			;974e
	rrca			;974f
	inc b			;9750
	cpl			;9751
	nop			;9752
	inc b			;9753
	ld bc,01404h		;9754
	ld bc,00000h		;9757
	inc c			;975a
	djnz $+6		;975b
	jr nc,l9760h		;975d
	inc b			;975f
l9760h:
	ld bc,01a04h		;9760
	adc a,c			;9763
	nop			;9764
	nop			;9765
	dec bc			;9766
	ld a,(bc)			;9767
	rlca			;9768
	adc a,d			;9769
	ld bc,00f06h		;976a
	ex af,af'			;976d
	dec de			;976e
	adc a,h			;976f
	nop			;9770
	ld bc,00a0bh		;9771
	ld a,(bc)			;9774
	ld hl,(00a00h)		;9775
	ld bc,0190ah		;9778
	ld bc,00000h		;977b
	dec bc			;977e
	dec bc			;977f
	ld a,(bc)			;9780
	dec hl			;9781
	nop			;9782
	ld a,(bc)			;9783
	ld bc,0190ah		;9784
	add a,c			;9787
	nop			;9788
	nop			;9789
	ld a,(bc)			;978a
	ld a,(bc)			;978b
	add hl,bc			;978c
	ld l,d			;978d
	nop			;978e
	ex af,af'			;978f
	ld bc,0140ah		;9790
	inc bc			;9793
	nop			;9794
	nop			;9795
	add hl,bc			;9796
	ld a,(bc)			;9797
	add hl,bc			;9798
	ld hl,(00801h)		;9799
	ld bc,0140ah		;979c
	add hl,bc			;979f
	nop			;97a0
	nop			;97a1
	add hl,bc			;97a2
	dec bc			;97a3
	add hl,bc			;97a4
	dec hl			;97a5
	ld bc,00108h		;97a6
	ld a,(bc)			;97a9
	inc d			;97aa
	adc a,c			;97ab
	nop			;97ac
	nop			;97ad
	ex af,af'			;97ae
	ld a,(bc)			;97af
	ex af,af'			;97b0
	ld hl,(00801h)		;97b1
	ld bc,00409h		;97b4
	add hl,bc			;97b7
	nop			;97b8
	nop			;97b9
	ex af,af'			;97ba
	ld a,(bc)			;97bb
	ld a,(bc)			;97bc
	ld hl,(00901h)		;97bd
	inc de			;97c0
	ld a,(bc)			;97c1
	inc d			;97c2
	adc a,c			;97c3
	nop			;97c4
	nop			;97c5
	rlca			;97c6
	ld a,(bc)			;97c7
	ex af,af'			;97c8
	ld hl,(00801h)		;97c9
	ld bc,01808h		;97cc
	add hl,bc			;97cf
	nop			;97d0
	nop			;97d1
	rlca			;97d2
	ld a,(bc)			;97d3
	ld a,(bc)			;97d4
	ld hl,(00a01h)		;97d5
	ld bc,0180ah		;97d8
	adc a,c			;97db
	nop			;97dc
	nop			;97dd
	add hl,bc			;97de
	ld a,(bc)			;97df
	dec c			;97e0
	ld a,(bc)			;97e1
	ld bc,0040ch		;97e2
	ld de,00818h		;97e5
	nop			;97e8
	nop			;97e9
	ld a,(bc)			;97ea
	ld a,(bc)			;97eb
	ld de,0012ah		;97ec
	djnz l9805h		;97ef
	ld de,00918h		;97f1
	nop			;97f4
	nop			;97f5
	ld a,(bc)			;97f6
	ld a,(bc)			;97f7
	rrca			;97f8
	ld hl,(00e01h)		;97f9
	inc d			;97fc
	djnz l9808h		;97fd
	adc a,c			;97ff
	nop			;9800
	nop			;9801
	ld a,(bc)			;9802
	ld a,(bc)			;9803
	dec c			;9804
l9805h:
	ld hl,(00c01h)		;9805
l9808h:
	inc b			;9808
	ld c,009h		;9809
	add hl,bc			;980b
