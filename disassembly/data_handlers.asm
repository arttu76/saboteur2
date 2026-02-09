; ======================================================================
; data_handlers.asm
; ======================================================================
;
; Room Definition Data & Handler Address Tables
;
; Address range: $D20C-$D60B (1024 bytes)
; Source binary: block7_main.bin (loaded at $620C)
;
; No executable code - all bytes are structured data that the
; disassembler decodes as Z80 instructions. Contains:
;
;   $D20E-$D41A: Room/screen definition records (continued from
;                data_roomdefs.asm). Structured entries with $F0 markers,
;                tile coordinates, and configuration parameters.
;                Record separators include $00 padding and $2D end bytes.
;
;   $D41B-$D607: Handler address tables and lookup data
;                Contains 16-bit address entries pointing to room
;                handler routines in the $BAxx-$C5xx range, entity
;                parameter tables, and music/sound configuration data.
;
;   $D608-$D60B: Graphic data base
;                Referenced by code_printcore.asm ($9ED5, $9F19) as
;                the base address for overlay and foreground graphics.
;
; Key labels:
;   sub_d2d2h ($D2D2) - Room data subroutine reference
;   ld2ffh ($D2FF) - Room definition record (code_roomrender.asm $7D71)
;   ld33ah ($D33A) - Alternate room draw data (code_mechanics.asm $9BD6)
;   ld3d3h ($D3D3) - Room transition data (code_roomrender.asm $7D74)
;   ld608h ($D608) - Graphic data base (code_printcore.asm)
;
; Cross-references:
;   ld2ffh read by: code_roomrender.asm ($7D71)
;   ld3d3h read by: code_roomrender.asm ($7D74), code at $8A6A
;   ld33ah read by: code_mechanics.asm ($9BD6)
;   ld608h read by: code_printcore.asm ($9ED5, $9F19) for sprite rendering
;   ld601h read by: data_spritebitmap.asm ($8680)
;
; ======================================================================

; ==========================================================================
; ROOM DEFINITION RECORDS ($D20E-$D41A)
; ==========================================================================
; Continuation of room/screen definition data from data_roomdefs.asm.
; Same structured format with $F0 section markers and $00/$2D separators.
;
	ld hl,(02822h)		;d20e
	ld bc,0293bh		;d211
	ld bc,02101h		;d214
	ld (02022h),hl		;d217
	dec l			;d21a
	nop			;d21b
	nop			;d21c
	nop			;d21d
	ret p			;d21e
	ld bc,0011ch		;d21f
	ld bc,lda01h		;d222
	exx			;d225
	ret c			;d226
	ld bc,ld9ddh		;d227
	sbc a,03ah		;d22a
	ret z			;d22c
	rlc c		;d22d
	ld bc,00101h		;d22f
	dec sp			;d232
	daa			;d233
	inc hl			;d234
	jr z,ld253h		;d235
	ld bc,01c01h		;d237
	dec l			;d23a
	nop			;d23b
	nop			;d23c
	nop			;d23d
	ret p			;d23e
	ld bc,01d24h		;d23f
	jr nz,$+3		;d242
	jp c,ldbd9h		;d244
	ld bc,ld9ddh		;d247
	sbc a,03bh		;d24a
	rst 0			;d24c
	call z,01d2ah		;d24d
	jr nz,ld253h		;d250
	dec sp			;d252
ld253h:
	ld bc,01d1fh		;d253
	ld e,001h		;d256
	daa			;d258
	dec h			;d259
	dec l			;d25a
	nop			;d25b
	nop			;d25c
	nop			;d25d
	ret p			;d25e
	ld bc,0011ch		;d25f
	inc h			;d262
	ld hl,(laba8h)		;d263
	xor (hl)			;d266
	xor a			;d267
	jp (hl)			;d268
	cp l			;d269
	call c,sub_c63bh		;d26a
	call 00101h		;d26d
	inc e			;d270
	ld bc,0213bh		;d271
	dec e			;d274
	ld hl,(02a1dh)		;d275
	dec e			;d278
	ld e,02dh		;d279
	nop			;d27b
	nop			;d27c
	nop			;d27d
	ret p			;d27e
	ld bc,02824h		;d27f
	inc e			;d282
	ld bc,laca9h		;d283
	or b			;d286
	or e			;d287
	or l			;d288
	cp h			;d289
	cp d			;d28a
	dec sp			;d28b
	push bc			;d28c
	adc a,001h		;d28d
	ld bc,0011ch		;d28f
	dec sp			;d292
	inc e			;d293
	ld bc,00101h		;d294
	ld hl,01d2ah		;d297
	ld l,000h		;d29a
	nop			;d29c
	nop			;d29d
	ret p			;d29e
	ld bc,0011ch		;d29f
	inc h			;d2a2
	ld hl,(ladaah)		;d2a3
	or c			;d2a6
	or d			;d2a7
	or (hl)			;d2a8
	cp e			;d2a9
	cp c			;d2aa
	dec sp			;d2ab
	call nz,001cfh		;d2ac
	ld bc,0011ch		;d2af
	dec sp			;d2b2
	inc e			;d2b3
	daa			;d2b4
	dec e			;d2b5
	ld hl,(01d26h)		;d2b6
	ld hl,(0002eh)		;d2b9
	nop			;d2bc
	nop			;d2bd
	ret p			;d2be
	ld bc,0011ch		;d2bf
	inc e			;d2c2
	ld hl,02a1dh		;d2c3
	inc hl			;d2c6
	ld hl,(023b7h)		;d2c7
	cp b			;d2ca
	dec sp			;d2cb
	jp 01dd0h		;d2cc
	ld hl,(00125h)		;d2cf
sub_d2d2h:
	dec sp			;d2d2
	inc h			;d2d3
	dec e			;d2d4
	ld hl,(0221dh)		;d2d5
	dec e			;d2d8
	ld hl,(0002eh)		;d2d9
	nop			;d2dc
	nop			;d2dd
	ret p			;d2de
	ld bc,0011ch		;d2df
	inc e			;d2e2
	inc e			;d2e3
	ld bc,01c01h		;d2e4
	ld bc,01c01h		;d2e7
	ld bc,0013bh		;d2ea
	inc e			;d2ed
	ld bc,02521h		;d2ee
	ld bc,0263ch		;d2f1
	ld hl,(02a23h)		;d2f4
	jr nz,$+3		;d2f7
	ld bc,0002dh		;d2f9
	nop			;d2fc
	nop			;d2fd
	ret p			;d2fe
ld2ffh:
	ld bc,02a24h		;d2ff
	ld e,01ch		;d302
	ld bc,02621h		;d304
	ld hl,(01e1dh)		;d307
	ld bc,0013bh		;d30a
	inc e			;d30d
	ld bc,01c1ch		;d30e
	ld bc,01c01h		;d311
	ld hl,0011eh		;d314
	rra			;d317
	dec e			;d318
	jr nz,ld348h		;d319
	nop			;d31b
	nop			;d31c
	nop			;d31d
	ret p			;d31e
	ld bc,01d1fh		;d31f
	jr nz,ld343h		;d322
	ld hl,(01c1eh)		;d324
	ld bc,02a27h		;d327
	jr nz,ld367h		;d32a
	ld bc,02a1fh		;d32c
	ld e,01fh		;d32f
	dec e			;d331
	ld hl,(02226h)		;d332
	dec e			;d335
	ld hl,(0281dh)		;d336
	inc e			;d339
ld33ah:
	dec l			;d33a
	nop			;d33b
	nop			;d33c
	nop			;d33d
	ret p			;d33e
	ld bc,00101h		;d33f
	rra			;d342
ld343h:
	dec e			;d343
	ld hl,(01f20h)		;d344
	dec e			;d347
ld348h:
	ld hl,(0251dh)		;d348
	inc a			;d34b
	ld c,d			;d34c
	ld bc,00101h		;d34d
	ld bc,02a21h		;d350
	ld h,02fh		;d353
	jr nc,ld388h		;d355
	ld hl,(0251dh)		;d357
	dec l			;d35a
	nop			;d35b
	nop			;d35c
	nop			;d35d
	ret p			;d35e
	ld bc,00101h		;d35f
	ld bc,00101h		;d362
	rra			;d365
	dec e			;d366
ld367h:
	ld hl,(02a1dh)		;d367
	ld e,001h		;d36a
	ld c,e			;d36c
	ld bc,01d21h		;d36d
	ld hl,(00125h)		;d370
	inc e			;d373
	ld (03433h),a		;d374
	inc hl			;d377
	inc hl			;d378
	ld e,02dh		;d379
	nop			;d37b
	defb 0edh;next byte illegal after ed		;d37c
	xor 0ech		;d37d
	dec hl			;d37f
	di			;d380
	call p,SCORE_TO_DISPLAY		;d381
	dec hl			;d384
	call p,SCORE_TO_DISPLAY		;d385
ld388h:
	call p,02bf3h		;d388
	call p,01d49h		;d38b
	ld (0231dh),hl		;d38e
	ld (0251dh),hl		;d391
	dec (hl)			;d394
	ld (hl),037h		;d395
	dec h			;d397
	rra			;d398
	dec e			;d399
	ld l,000h		;d39a
	ld bc,02101h		;d39c
	ld hl,(0201dh)		;d39f
	ld bc,00101h		;d3a2
	ld bc,00101h		;d3a5
	ld bc,00101h		;d3a8
	ld bc,00101h		;d3ab
	ld bc,01c01h		;d3ae
	ld bc,01c1dh		;d3b1
	daa			;d3b4
	dec e			;d3b5
	ld hl,(0011eh)		;d3b6
	ld bc,01339h		;d3b9
	ld bc,01c01h		;d3bc
	ld bc,01f01h		;d3bf
	dec e			;d3c2
	ld hl,(0231dh)		;d3c3
	ld hl,(02a1dh)		;d3c6
	dec e			;d3c9
	ld hl,(02a1dh)		;d3ca
	dec e			;d3cd
	inc hl			;d3ce
	dec e			;d3cf
	ld e,027h		;d3d0
	dec e			;d3d2
ld3d3h:
	ld (01d2ah),hl		;d3d3
	jr z,$+3		;d3d6
	ld hl,01d2ah		;d3d8
	jp p,021eeh		;d3db
	dec h			;d3de
	ld bc,00101h		;d3df
	ld bc,02101h		;d3e2
	ld (01d2ah),hl		;d3e5
	ld hl,(02a1dh)		;d3e8
	jr nz,$+3		;d3eb
	ld bc,02a1fh		;d3ed
	dec e			;d3f0
	ld hl,(02a1dh)		;d3f1
	dec e			;d3f4
	inc hl			;d3f5
	dec e			;d3f6
	ld hl,(00125h)		;d3f7
	ld bc,0011ch		;d3fa
	add hl,hl			;d3fd
	rra			;d3fe
	dec e			;d3ff
	ld hl,(02a1dh)		;d400
	dec e			;d403
	ld e,001h		;d404
	ld bc,00101h		;d406
	ld bc,01f01h		;d409
	dec e			;d40c
	ld hl,(02a1dh)		;d40d
	dec e			;d410
	ld hl,(02a1dh)		;d411
	dec e			;d414
	ld e,001h		;d415
	ld bc,02a1fh		;d417
	dec e			;d41a
; ==========================================================================
; HANDLER ADDRESS TABLES & LOOKUP DATA ($D41B-$D607)
; ==========================================================================
; Multiple data tables containing 16-bit addresses pointing to room
; handler routines, entity behavior handlers, and music parameters.
; Address ranges span $BAxx-$C5xx (room/behavior code area).
; Also includes frequency/timing lookup tables for sound effects.
;
	ld e,096h		;d41b
	cp d			;d41d
	sbc a,d			;d41e
	cp d			;d41f
	or c			;d420
	cp d			;d421
	rst 8			;d422
	cp d			;d423
	add hl,de			;d424
	cp e			;d425
	ld h,b			;d426
	cp e			;d427
	ld a,h			;d428
	cp e			;d429
	and a			;d42a
	cp e			;d42b
	or b			;d42c
	cp e			;d42d
	cp e			;d42e
	cp e			;d42f
	and 0bbh		;d430
	jp m,010bbh		;d432
	cp h			;d435
	add hl,sp			;d436
ld437h:
	cp h			;d437
	ld b,e			;d438
	cp h			;d439
	ld d,c			;d43a
	cp h			;d43b
	adc a,(hl)			;d43c
	cp h			;d43d
	or d			;d43e
	cp h			;d43f
	cp h			;d440
	cp h			;d441
	jp c,le4bch		;d442
	cp h			;d445
	djnz $-65		;d446
	ld a,(054bdh)		;d448
	cp l			;d44b
	ld l,c			;d44c
	cp l			;d44d
	sbc a,c			;d44e
	cp l			;d44f
	pop bc			;d450
	cp l			;d451
	call c,sub_edbdh		;d452
	cp l			;d455
	rst 38h			;d456
	cp l			;d457
	dec c			;d458
	cp (hl)			;d459
	rra			;d45a
	cp (hl)			;d45b
	ld sp,048beh		;d45c
	cp (hl)			;d45f
	ld e,a			;d460
	cp (hl)			;d461
	ld (hl),c			;d462
	cp (hl)			;d463
	adc a,b			;d464
	cp (hl)			;d465
	sbc a,a			;d466
	cp (hl)			;d467
	or (hl)			;d468
	cp (hl)			;d469
	call sub_dbbeh		;d46a
	cp (hl)			;d46d
	jp (hl)			;d46e
	cp (hl)			;d46f
	ei			;d470
	cp (hl)			;d471
	add hl,bc			;d472
	cp a			;d473
	add hl,de			;d474
	cp a			;d475
	jr z,ld437h		;d476
	scf			;d478
	cp a			;d479
	ld b,(hl)			;d47a
	cp a			;d47b
	ld d,h			;d47c
	cp a			;d47d
	ld h,d			;d47e
	cp a			;d47f
	ld (hl),b			;d480
	cp a			;d481
	ld a,(hl)			;d482
	cp a			;d483
	adc a,h			;d484
	cp a			;d485
	sbc a,d			;d486
	cp a			;d487
	xor b			;d488
	cp a			;d489
	ret nz			;d48a
	cp a			;d48b
	adc a,0bfh		;d48c
	push af			;d48e
	cp a			;d48f
	inc b			;d490
	ret nz			;d491
	ld l,0c0h		;d492
	ld b,d			;d494
	ret nz			;d495
	ld h,a			;d496
	ret nz			;d497
	sbc a,l			;d498
	ret nz			;d499
	in a,(0c0h)		;d49a
	push hl			;d49c
	ret nz			;d49d
	rst 28h			;d49e
	ret nz			;d49f
	ld a,(bc)			;d4a0
	pop bc			;d4a1
	daa			;d4a2
	pop bc			;d4a3
	dec a			;d4a4
	pop bc			;d4a5
	ld e,h			;d4a6
	pop bc			;d4a7
	ld (hl),d			;d4a8
	pop bc			;d4a9
	adc a,b			;d4aa
	pop bc			;d4ab
	sbc a,a			;d4ac
	pop bc			;d4ad
	or e			;d4ae
	pop bc			;d4af
	push bc			;d4b0
	pop bc			;d4b1
ld4b2h:
	jp po,lf4c1h		;d4b2
	pop bc			;d4b5
	ex af,af'			;d4b6
	jp nz,lc22ch		;d4b7
	ld b,d			;d4ba
	jp nz,lc24fh		;d4bb
	ld d,l			;d4be
	jp nz,lc261h		;d4bf
	ld l,(hl)			;d4c2
	jp nz,lc281h		;d4c3
	sbc a,d			;d4c6
	jp nz,lc2a5h		;d4c7
	or d			;d4ca
	jp nz,lc2c3h		;d4cb
	pop de			;d4ce
	jp nz,lc2d7h		;d4cf
	ex (sp),hl			;d4d2
	jp nz,lc2edh		;d4d3
	cp 0c2h		;d4d6
	inc d			;d4d8
	jp lc324h		;d4d9
	ld c,h			;d4dc
	jp lc377h		;d4dd
	sbc a,c			;d4e0
	jp lc3bch		;d4e1
	adc a,0c3h		;d4e4
	ret c			;d4e6
	jp lc3ech		;d4e7
	cp 0c3h		;d4ea
	jr ld4b2h		;d4ec
	cpl			;d4ee
	call nz,sub_c43fh		;d4ef
	ld e,a			;d4f2
	call nz,sub_c471h		;d4f3
	sub a			;d4f6
	call nz,sub_c4aeh		;d4f7
	or a			;d4fa
	call nz,sub_c4c8h		;d4fb
	sub 0c4h		;d4fe
	ex (sp),hl			;d500
	call nz,sub_c4eeh		;d501
	ld sp,hl			;d504
	call nz,sub_c509h		;d505
	inc a			;d508
	push bc			;d509
	ld c,d			;d50a
	push bc			;d50b
	ld h,b			;d50c
	push bc			;d50d
	ld a,b			;d50e
	push bc			;d50f
	adc a,d			;d510
	push bc			;d511
	or a			;d512
	push bc			;d513
	exx			;d514
	push bc			;d515
	rst 30h			;d516
	push bc			;d517
	ld bc,031c6h		;d518
	add a,043h		;d51b
	add a,063h		;d51d
	add a,073h		;d51f
ld521h:
	add a,07fh		;d521
	add a,09eh		;d523
	add a,0b1h		;d525
	add a,0b9h		;d527
	add a,0d4h		;d529
	add a,0efh		;d52b
	add a,0f8h		;d52d
	add a,008h		;d52f
	rst 0			;d531
	ld hl,(03cc7h)		;d532
	rst 0			;d535
	ld d,(hl)			;d536
	rst 0			;d537
	ld a,h			;d538
	rst 0			;d539
	sbc a,d			;d53a
	rst 0			;d53b
	ret z			;d53c
	rst 0			;d53d
	jp po,019c7h		;d53e
	ret z			;d541
	inc (hl)			;d542
	ret z			;d543
	ld e,l			;d544
	ret z			;d545
	ld l,e			;d546
	ret z			;d547
	adc a,(hl)			;d548
	ret z			;d549
	xor (hl)			;d54a
	ret z			;d54b
	cp a			;d54c
	ret z			;d54d
	ret po			;d54e
	ret z			;d54f
	ld sp,hl			;d550
	ret z			;d551
	rrca			;d552
	ret			;d553
	inc e			;d554
	ret			;d555
	jr z,ld521h		;d556
	dec a			;d558
	ret			;d559
	ld d,e			;d55a
	ret			;d55b
	ld h,d			;d55c
	ret			;d55d
	ld (hl),c			;d55e
	ret			;d55f
	adc a,l			;d560
	ret			;d561
	and c			;d562
	ret			;d563
	cp e			;d564
	ret			;d565
	ret			;d566
	ret			;d567
	jp c,001c9h		;d568
	jp z,lca22h		;d56b
	ld c,d			;d56e
	jp z,lca57h		;d56f
	ld l,d			;d572
	jp z,lca77h		;d573
	adc a,b			;d576
	jp z,lcaabh		;d577
	jp nz,ld7cah		;d57a
	jp z,lcae3h		;d57d
	jp pe,lfdcah		;d580
	jp z,lcb12h		;d583
	ld a,(de)			;d586
	sra d		;d587
	bit 1,a		;d589
	bit 4,c		;d58b
	bit 6,h		;d58d
	res 3,b		;d58f
	res 5,b		;d591
	res 5,a		;d593
	res 6,l		;d595
	res 7,h		;d597
	set 1,b		;d599
	set 4,l		;d59b
	set 5,(hl)		;d59d
	rlc l		;d59f
	call z,sub_cc15h		;d5a1
	ld (049cch),a		;d5a4
	call z,sub_cc60h		;d5a7
	ld a,e			;d5aa
	call z,sub_cc8eh		;d5ab
	or a			;d5ae
	call z,sub_ccc6h		;d5af
	ret pe			;d5b2
	call z,sub_cd04h		;d5b3
	inc hl			;d5b6
	call sub_cd41h		;d5b7
	ld e,c			;d5ba
	call sub_cd6ch		;d5bb
	sub h			;d5be
	call sub_cdafh		;d5bf
	pop bc			;d5c2
	call sub_cdd4h		;d5c3
	rst 20h			;d5c6
	call sub_cdfah		;d5c7
	inc c			;d5ca
	adc a,01fh		;d5cb
	adc a,032h		;d5cd
	adc a,038h		;d5cf
	adc a,044h		;d5d1
	adc a,057h		;d5d3
	adc a,068h		;d5d5
	adc a,074h		;d5d7
	adc a,084h		;d5d9
	adc a,090h		;d5db
	adc a,098h		;d5dd
	adc a,0aah		;d5df
	adc a,0b8h		;d5e1
	adc a,0c1h		;d5e3
	adc a,0d2h		;d5e5
	adc a,0e4h		;d5e7
	adc a,0f5h		;d5e9
	adc a,0ffh		;d5eb
	adc a,011h		;d5ed
	rst 8			;d5ef
	daa			;d5f0
	rst 8			;d5f1
	ld b,c			;d5f2
	rst 8			;d5f3
	ld c,a			;d5f4
	rst 8			;d5f5
	ld h,l			;d5f6
	rst 8			;d5f7
	ld (hl),h			;d5f8
	rst 8			;d5f9
	adc a,b			;d5fa
	rst 8			;d5fb
	sub a			;d5fc
	rst 8			;d5fd
	and (hl)			;d5fe
	rst 8			;d5ff
	pop de			;d600
ld601h:
	rst 8			;d601
	defb 0fdh,0cfh,00ch	;illegal sequence		;d602
	ret nc			;d605
	ld a,(de)			;d606
	ret nc			;d607
; --- GRAPHIC DATA BASE ($D608) ---
; Base address for overlay and foreground sprite graphics.
; Referenced by code_printcore.asm: RENDER_SPRITE_RAW ($9ED5, $9F19)
;
ld608h:
	nop			;d608  ; Graphic data starts here
	nop			;d609
	defb 001h,001h		;d60a
