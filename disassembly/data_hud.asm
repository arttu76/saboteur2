; ======================================================================
; data_hud.asm
; ======================================================================
;
; HUD Strings & Game State Logic
;
; Address range: 730Ch - 760Bh (768 bytes)
; Source binary: block7_main.bin (loaded at 620Ch)
;
; HUD display strings and game state/timer/objective checking code.
; Contains strings like HELD, TIMER, NEAR, PAY, ENERGY, score display.
; Mixed with code for timer countdown and mission checking.
;
; ======================================================================

b5_end:

; BLOCK 'b6' (start 0x730c end 0x740c)
b6_start:
; "TAPE IN MISSILE CONSOLEDISABLE ELECTRIFIED FENCESMASH THROUGH FE"
; "NCE ON MOTORBIKE"
	defb 054h		;730c  'T'
	defb 041h		;730d  'A'
	defb 050h		;730e  'P'
	defb 045h		;730f  'E'
	defb 020h		;7310  ' '
	defb 049h		;7311  'I'
	defb 04eh		;7312  'N'
	defb 020h		;7313  ' '
	defb 04dh		;7314  'M'
	defb 049h		;7315  'I'
	defb 053h		;7316  'S'
	defb 053h		;7317  'S'
	defb 049h		;7318  'I'
	defb 04ch		;7319  'L'
	defb 045h		;731a  'E'
	defb 020h		;731b  ' '
	defb 043h		;731c  'C'
	defb 04fh		;731d  'O'
	defb 04eh		;731e  'N'
	defb 053h		;731f  'S'
	defb 04fh		;7320  'O'
	defb 04ch		;7321  'L'
	defb 045h		;7322  'E'
l7323h:
	defb 044h		;7323  'D'
	defb 049h		;7324  'I'
	defb 053h		;7325  'S'
	defb 041h		;7326  'A'
	defb 042h		;7327  'B'
	defb 04ch		;7328  'L'
	defb 045h		;7329  'E'
	defb 020h		;732a  ' '
	defb 045h		;732b  'E'
	defb 04ch		;732c  'L'
	defb 045h		;732d  'E'
	defb 043h		;732e  'C'
	defb 054h		;732f  'T'
	defb 052h		;7330  'R'
	defb 049h		;7331  'I'
	defb 046h		;7332  'F'
	defb 049h		;7333  'I'
	defb 045h		;7334  'E'
	defb 044h		;7335  'D'
	defb 020h		;7336  ' '
	defb 046h		;7337  'F'
	defb 045h		;7338  'E'
	defb 04eh		;7339  'N'
	defb 043h		;733a  'C'
	defb 045h		;733b  'E'
	defb 053h		;733c  'S'
	defb 04dh		;733d  'M'
	defb 041h		;733e  'A'
	defb 053h		;733f  'S'
	defb 048h		;7340  'H'
	defb 020h		;7341  ' '
	defb 054h		;7342  'T'
	defb 048h		;7343  'H'
	defb 052h		;7344  'R'
	defb 04fh		;7345  'O'
	defb 055h		;7346  'U'
	defb 047h		;7347  'G'
	defb 048h		;7348  'H'
	defb 020h		;7349  ' '
	defb 046h		;734a  'F'
	defb 045h		;734b  'E'
	defb 04eh		;734c  'N'
	defb 043h		;734d  'C'
	defb 045h		;734e  'E'
	defb 020h		;734f  ' '
	defb 04fh		;7350  'O'
	defb 04eh		;7351  'N'
	defb 020h		;7352  ' '
	defb 04dh		;7353  'M'
	defb 04fh		;7354  'O'
	defb 054h		;7355  'T'
	defb 04fh		;7356  'O'
	defb 052h		;7357  'R'
	defb 042h		;7358  'B'
	defb 049h		;7359  'I'
	defb 04bh		;735a  'K'
	defb 045h		;735b  'E'
l735ch:
	defb 000h		;735c
	defb 000h		;735d
l735eh:
	defb 021h		;735e  '!'
	defb 000h		;735f
	defb 040h		;7360  '@'
	defb 011h		;7361
	defb 001h		;7362
	defb 040h		;7363  '@'
	defb 001h		;7364
	defb 000h		;7365
	defb 018h		;7366
	defb 036h		;7367  '6'
	defb 000h		;7368
	defb 0edh		;7369
	defb 0b0h		;736a
	defb 036h		;736b  '6'
	defb 002h		;736c
	defb 001h		;736d
	defb 0ffh		;736e
	defb 002h		;736f
	defb 0edh		;7370
	defb 0b0h		;7371
	defb 021h		;7372  '!'
	defb 062h		;7373  'b'
	defb 072h		;7374  'r'
	defb 011h		;7375
	defb 007h		;7376
	defb 040h		;7377  '@'
	defb 00eh		;7378
	defb 012h		;7379
	defb 0cdh		;737a
	defb 001h		;737b
	defb 09eh		;737c
	defb 03ah		;737d  ':'
	defb 0aeh		;737e
	defb 0edh		;737f
	defb 0c6h		;7380
; "02zr"
	defb 030h		;7381  '0'
	defb 032h		;7382  '2'
	defb 07ah		;7383  'z'
	defb 072h		;7384  'r'
	defb 011h		;7385
	defb 04ch		;7386  'L'
	defb 040h		;7387  '@'
	defb 00eh		;7388
	defb 007h		;7389
	defb 0cdh		;738a
	defb 001h		;738b
	defb 09eh		;738c
	defb 011h		;738d
	defb 087h		;738e
	defb 040h		;738f  '@'
	defb 021h		;7390  '!'
	defb 0d7h		;7391
	defb 072h		;7392  'r'
	defb 00eh		;7393
	defb 00fh		;7394
	defb 0cdh		;7395
	defb 001h		;7396
	defb 09eh		;7397
	defb 03ah		;7398  ':'
	defb 0aeh		;7399
	defb 0edh		;739a
	defb 087h		;739b
	defb 06fh		;739c  'o'
	defb 026h		;739d  '&'
	defb 000h		;739e
	defb 001h		;739f
	defb 04eh		;73a0  'N'
	defb 072h		;73a1  'r'
	defb 009h		;73a2
; "~#fo"
	defb 07eh		;73a3  '~'
	defb 023h		;73a4  '#'
	defb 066h		;73a5  'f'
	defb 06fh		;73a6  'o'
	defb 00eh		;73a7
	defb 005h		;73a8
	defb 0cdh		;73a9
	defb 001h		;73aa
	defb 09eh		;73ab
	defb 011h		;73ac
	defb 03ah		;73ad  ':'
	defb 099h		;73ae
	defb 001h		;73af
	defb 003h		;73b0
	defb 000h		;73b1
	defb 0edh		;73b2
	defb 0b0h		;73b3
	defb 011h		;73b4
	defb 0a1h		;73b5
	defb 040h		;73b6  '@'
	defb 00eh		;73b7
	defb 01eh		;73b8
	defb 0cdh		;73b9
	defb 001h		;73ba
	defb 09eh		;73bb
	defb 07eh		;73bc  '~'
	defb 032h		;73bd  '2'
	defb 0eeh		;73be
; "r#~2"
	defb 072h		;73bf  'r'
	defb 023h		;73c0  '#'
	defb 07eh		;73c1  '~'
	defb 032h		;73c2  '2'
	defb 0efh		;73c3
; "r"\s"
	defb 072h		;73c4  'r'
	defb 022h		;73c5  '"'
	defb 05ch		;73c6  '\'
	defb 073h		;73c7  's'
	defb 0e5h		;73c8
	defb 0ddh		;73c9
	defb 0e1h		;73ca
	defb 0ddh		;73cb
	defb 07eh		;73cc  '~'
	defb 001h		;73cd
	defb 032h		;73ce  '2'
	defb 05fh		;73cf  '_'
	defb 0b5h		;73d0
	defb 0b7h		;73d1
	defb 028h		;73d2  '('
	defb 00bh		;73d3
	defb 021h		;73d4  '!'
	defb 0e6h		;73d5
	defb 072h		;73d6  'r'
	defb 011h		;73d7
	defb 000h		;73d8
	defb 048h		;73d9  'H'
	defb 00eh		;73da
	defb 01fh		;73db
	defb 0cdh		;73dc
	defb 001h		;73dd
	defb 09eh		;73de
	defb 0ddh		;73df
	defb 07eh		;73e0  '~'
	defb 004h		;73e1
	defb 032h		;73e2  '2'
	defb 0a6h		;73e3
	defb 07dh		;73e4  '}'
	defb 03ch		;73e5  '<'
	defb 03eh		;73e6  '>'
	defb 0ffh		;73e7
	defb 020h		;73e8  ' '
	defb 00dh		;73e9
	defb 021h		;73ea  '!'
	defb 03ch		;73eb  '<'
	defb 073h		;73ec  's'
	defb 011h		;73ed
	defb 080h		;73ee
	defb 048h		;73ef  'H'
	defb 00eh		;73f0
	defb 020h		;73f1  ' '
	defb 0cdh		;73f2
	defb 001h		;73f3
	defb 09eh		;73f4
	defb 03eh		;73f5  '>'
	defb 001h		;73f6
	defb 032h		;73f7  '2'
	defb 017h		;73f8
	defb 077h		;73f9  'w'
	defb 0ddh		;73fa
	defb 07eh		;73fb  '~'
	defb 002h		;73fc
	defb 032h		;73fd  '2'
	defb 0dbh		;73fe
	defb 074h		;73ff  't'
	defb 0b7h		;7400
	defb 028h		;7401  '('
	defb 00bh		;7402
	defb 021h		;7403  '!'
	defb 005h		;7404
	defb 073h		;7405  's'
	defb 011h		;7406
	defb 021h		;7407  '!'
	defb 048h		;7408  'H'
	defb 00eh		;7409
	defb 01eh		;740a
	defb 0cdh		;740b
b6_end:

; BLOCK 'b7' (start 0x740c end 0x750c)
b7_start:
	ld bc,ldd9eh		;740c
	ld a,(hl)			;740f
	inc bc			;7410
	ld (0908fh),a		;7411
	inc a			;7414
	jr z,l7422h		;7415
	ld hl,l7323h		;7417
	ld de,04843h		;741a
	ld c,019h		;741d
	call PRINT_TILE		;741f
l7422h:
	ld hl,l727bh		;7422
	ld de,040e7h		;7425
	ld c,011h		;7428
	call PRINT_TILE		;742a
	ld de,04860h		;742d
	ld c,020h		;7430
	call PRINT_TILE		;7432
	ld de,040a0h		;7435
	ld c,001h		;7438
	call PRINT_TILE		;743a
	inc c			;743d
	ld de,040bfh		;743e
	call PRINT_TILE		;7441
	ld de,05003h		;7444
	ld c,019h		;7447
	call PRINT_TILE		;7449
	ld de,05048h		;744c
	ld c,010h		;744f
	call PRINT_TILE		;7451
	ld hl,l70abh		;7454
	ld de,050e3h		;7457
	ld c,019h		;745a
	call PRINT_TILE		;745c
	call CLEAR_KEY_BUFFER		;745f
	call READ_KEY_INPUT		;7462
	ld a,(l9df0h)		;7465
	ld de,lf42dh		;7468
	dec a			;746b
	jr z,l747fh		;746c
	dec a			;746e
	jr z,l7474h		;746f
	ld de,lf43ch		;7471
l7474h:
	ld hl,l9df1h		;7474
	ld b,00fh		;7477
l7479h:
	ld a,(de)			;7479
	ld (hl),a			;747a
	inc hl			;747b
	inc de			;747c
	djnz l7479h		;747d
l747fh:
	ld b,021h		;747f
	ld de,l8701h		;7481
	ld hl,08706h		;7484
l7487h:
	push bc			;7487
	ld bc,00005h		;7488
	ldir		;748b
	ld bc,00009h		;748d
	add hl,bc			;7490
	ex de,hl			;7491
	add hl,bc			;7492
	ex de,hl			;7493
	pop bc			;7494
	djnz l7487h		;7495
	exx			;7497
	ld hl,05040h		;7498
	ld de,05a40h		;749b
	exx			;749e
	ld de,l74ddh		;749f
l74a2h:
	ld a,(de)			;74a2
	inc de			;74a3
	ld l,a			;74a4
	inc a			;74a5
	jp z,l760eh		;74a6
	ld h,000h		;74a9
	push de			;74ab
	push hl			;74ac
	pop de			;74ad
	add hl,hl			;74ae
	add hl,hl			;74af
	add hl,hl			;74b0
	add hl,de			;74b1
	ld de,l7534h		;74b2
	add hl,de			;74b5
	pop de			;74b6
	ld c,001h		;74b7
	cp 011h		;74b9
	jr c,l74c0h		;74bb
	ld a,(de)			;74bd
	ld c,a			;74be
	inc de			;74bf
l74c0h:
	push hl			;74c0
	exx			;74c1
	push hl			;74c2
	ld b,008h		;74c3
l74c5h:
	exx			;74c5
	ld a,(hl)			;74c6
	inc hl			;74c7
	exx			;74c8
	ld (hl),a			;74c9
	inc h			;74ca
	djnz l74c5h		;74cb
	pop hl			;74cd
	inc hl			;74ce
	exx			;74cf
	ld a,(hl)			;74d0
	exx			;74d1
	ld (de),a			;74d2
	inc de			;74d3
	exx			;74d4
	pop hl			;74d5
	dec c			;74d6
	jr nz,l74c0h		;74d7
	jr l74a2h		;74d9
l74dbh:
	nop			;74db
	nop			;74dc
l74ddh:
	ex af,af'			;74dd
	ld de,00e04h		;74de
	ld de,00e0eh		;74e1
	ld de,00e05h		;74e4
	ld de,00904h		;74e7
	inc c			;74ea
	ld (de),a			;74eb
	inc b			;74ec
	inc c			;74ed
	ld (de),a			;74ee
	ld c,00ch		;74ef
	nop			;74f1
	ld bc,00101h		;74f2
	ld (bc),a			;74f5
	inc c			;74f6
	ld (de),a			;74f7
	inc b			;74f8
	inc c			;74f9
	inc c			;74fa
	ld (de),a			;74fb
	inc b			;74fc
	inc c			;74fd
	ld (de),a			;74fe
	ld c,00ch		;74ff
	inc bc			;7501
	ld (de),a			;7502
	inc bc			;7503
	inc b			;7504
	inc c			;7505
	ld (de),a			;7506
	inc b			;7507
	inc c			;7508
	inc c			;7509
	ld (de),a			;750a
	inc b			;750b
b7_end:

; BLOCK 'b8' (start 0x750c end 0x760c)
b8_start:
	defb 00ch		;750c
	defb 013h		;750d
	defb 00eh		;750e
	defb 00ch		;750f
	defb 005h		;7510
	defb 006h		;7511
	defb 006h		;7512
	defb 006h		;7513
	defb 007h		;7514
	defb 00ch		;7515
	defb 012h		;7516
	defb 004h		;7517
	defb 00ch		;7518
	defb 00ch		;7519
	defb 012h		;751a
	defb 004h		;751b
	defb 00ch		;751c
	defb 013h		;751d
	defb 00eh		;751e
	defb 00ch		;751f
	defb 012h		;7520
	defb 005h		;7521
	defb 00ch		;7522
	defb 012h		;7523
	defb 004h		;7524
	defb 00ch		;7525
	defb 00ah		;7526
	defb 011h		;7527
	defb 004h		;7528
	defb 00fh		;7529
	defb 011h		;752a
	defb 00eh		;752b
	defb 00fh		;752c
	defb 011h		;752d
	defb 005h		;752e
	defb 00fh		;752f
l7530h:
	defb 011h		;7530
	defb 004h		;7531
	defb 00bh		;7532
	defb 0ffh		;7533
l7534h:
	defb 000h		;7534
	defb 00fh		;7535
	defb 010h		;7536
; "'HPPP"
	defb 027h		;7537  "'"
	defb 048h		;7538  'H'
	defb 050h		;7539  'P'
	defb 050h		;753a  'P'
	defb 050h		;753b  'P'
	defb 00fh		;753c
	defb 000h		;753d
	defb 0ffh		;753e
	defb 000h		;753f
	defb 0ffh		;7540
	defb 000h		;7541
	defb 000h		;7542
	defb 000h		;7543
	defb 000h		;7544
	defb 00fh		;7545
	defb 000h		;7546
	defb 0f0h		;7547
	defb 008h		;7548
	defb 0e4h		;7549
	defb 012h		;754a
	defb 00ah		;754b
	defb 00ah		;754c
	defb 00ah		;754d
	defb 00fh		;754e
; "PPPPPPPP"
	defb 050h		;754f  'P'
	defb 050h		;7550  'P'
	defb 050h		;7551  'P'
	defb 050h		;7552  'P'
	defb 050h		;7553  'P'
	defb 050h		;7554  'P'
	defb 050h		;7555  'P'
	defb 050h		;7556  'P'
	defb 00fh		;7557
	defb 00ah		;7558
	defb 00ah		;7559
	defb 00ah		;755a
	defb 00ah		;755b
	defb 00ah		;755c
	defb 00ah		;755d
	defb 00ah		;755e
	defb 00ah		;755f
	defb 00fh		;7560
; "PPPH'"
	defb 050h		;7561  'P'
	defb 050h		;7562  'P'
	defb 050h		;7563  'P'
	defb 048h		;7564  'H'
	defb 027h		;7565  "'"
	defb 010h		;7566
	defb 00fh		;7567
	defb 000h		;7568
	defb 00fh		;7569
	defb 000h		;756a
	defb 000h		;756b
	defb 000h		;756c
	defb 000h		;756d
	defb 0ffh		;756e
	defb 000h		;756f
	defb 0ffh		;7570
	defb 000h		;7571
	defb 00fh		;7572
	defb 00ah		;7573
	defb 00ah		;7574
	defb 00ah		;7575
	defb 012h		;7576
	defb 0e4h		;7577
	defb 008h		;7578
	defb 0f0h		;7579
	defb 000h		;757a
	defb 00fh		;757b
	defb 000h		;757c
	defb 012h		;757d
	defb 00dh		;757e
	defb 0dbh		;757f
; "2)$ "
	defb 032h		;7580  '2'
	defb 029h		;7581  ')'
	defb 024h		;7582  '$'
	defb 020h		;7583  ' '
	defb 002h		;7584
	defb 000h		;7585
	defb 030h		;7586  '0'
	defb 040h		;7587  '@'
	defb 046h		;7588  'F'
	defb 0c8h		;7589
	defb 0b0h		;758a
	defb 09eh		;758b
	defb 028h		;758c  '('
	defb 002h		;758d
	defb 010h		;758e
	defb 019h		;758f
	defb 0f1h		;7590
; "3/BB"
	defb 033h		;7591  '3'
	defb 02fh		;7592  '/'
	defb 042h		;7593  'B'
	defb 042h		;7594  'B'
	defb 004h		;7595
	defb 002h		;7596
	defb 01eh		;7597
	defb 028h		;7598  '('
	defb 098h		;7599
	defb 0d8h		;759a
; "dD" "
	defb 064h		;759b  'd'
	defb 044h		;759c  'D'
	defb 022h		;759d  '"'
	defb 020h		;759e  ' '
	defb 002h		;759f
	defb 010h		;75a0
	defb 03eh		;75a1  '>'
	defb 048h		;75a2  'H'
	defb 008h		;75a3
	defb 010h		;75a4
	defb 07ch		;75a5  '|'
	defb 012h		;75a6
	defb 030h		;75a7  '0'
	defb 002h		;75a8
	defb 008h		;75a9
	defb 02ah		;75aa  '*'
	defb 01ch		;75ab
	defb 0b0h		;75ac
	defb 0e0h		;75ad
	defb 092h		;75ae
	defb 04ch		;75af  'L'
	defb 018h		;75b0
	defb 002h		;75b1
	defb 000h		;75b2
	defb 022h		;75b3  '"'
	defb 024h		;75b4  '$'
	defb 047h		;75b5  'G'
	defb 0cch		;75b6
	defb 06ah		;75b7  'j'
	defb 092h		;75b8
	defb 010h		;75b9
	defb 002h		;75ba
	defb 010h		;75bb
	defb 055h		;75bc  'U'
	defb 05dh		;75bd  ']'
	defb 02bh		;75be  '+'
	defb 0e2h		;75bf
	defb 022h		;75c0  '"'
	defb 044h		;75c1  'D'
	defb 000h		;75c2
	defb 002h		;75c3
	defb 010h		;75c4
	defb 01eh		;75c5
	defb 038h		;75c6  '8'
	defb 08fh		;75c7
	defb 012h		;75c8
	defb 004h		;75c9
	defb 078h		;75ca  'x'
	defb 00ch		;75cb
	defb 002h		;75cc
	defb 000h		;75cd
	defb 021h		;75ce  '!'
	defb 022h		;75cf  '"'
	defb 0fah		;75d0
	defb 017h		;75d1
	defb 012h		;75d2
	defb 022h		;75d3  '"'
	defb 000h		;75d4
	defb 002h		;75d5
; --- 8 zero bytes ---
	defb 000h		;75d6
	defb 000h		;75d7
	defb 000h		;75d8
	defb 000h		;75d9
	defb 000h		;75da
	defb 000h		;75db
	defb 000h		;75dc
	defb 000h		;75dd
	defb 00fh		;75de
	defb 0ffh		;75df
	defb 0ffh		;75e0
	defb 0ffh		;75e1
	defb 0ffh		;75e2
	defb 0ffh		;75e3
	defb 0ffh		;75e4
	defb 0ffh		;75e5
	defb 0ffh		;75e6
	defb 00ah		;75e7
l75e8h:
; "HELDTIMERNEAR PAY $0000000 XXXXXXXXX"
	defb 048h		;75e8  'H'
	defb 045h		;75e9  'E'
	defb 04ch		;75ea  'L'
	defb 044h		;75eb  'D'
	defb 054h		;75ec  'T'
	defb 049h		;75ed  'I'
	defb 04dh		;75ee  'M'
	defb 045h		;75ef  'E'
	defb 052h		;75f0  'R'
	defb 04eh		;75f1  'N'
	defb 045h		;75f2  'E'
	defb 041h		;75f3  'A'
	defb 052h		;75f4  'R'
	defb 020h		;75f5  ' '
	defb 050h		;75f6  'P'
	defb 041h		;75f7  'A'
	defb 059h		;75f8  'Y'
	defb 020h		;75f9  ' '
	defb 024h		;75fa  '$'
l75fbh:
	defb 030h		;75fb  '0'
	defb 030h		;75fc  '0'
	defb 030h		;75fd  '0'
	defb 030h		;75fe  '0'
	defb 030h		;75ff  '0'
	defb 030h		;7600  '0'
	defb 030h		;7601  '0'
	defb 020h		;7602  ' '
l7603h:
	defb 058h		;7603  'X'
	defb 058h		;7604  'X'
	defb 058h		;7605  'X'
	defb 058h		;7606  'X'
	defb 058h		;7607  'X'
	defb 058h		;7608  'X'
	defb 058h		;7609  'X'
	defb 058h		;760a  'X'
	defb 058h		;760b  'X'
