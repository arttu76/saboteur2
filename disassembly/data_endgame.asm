; ======================================================================
; data_endgame.asm
; ======================================================================
;
; Endgame & Completion Text
;
; Address range: F30Ch - F40Bh (256 bytes)
; Source binary: block7_main.bin (loaded at 620Ch)
;
; Congratulations text, stage code reveal, completion messages.
; Displayed when the player completes a mission.
;
; ======================================================================

b25_end:

; BLOCK 'b26' (start 0xf30c end 0xf40c)
b26_start:
	defb 001h		;f30c
	defb 09eh		;f30d
	defb 011h		;f30e
	defb 001h		;f30f
	defb 050h		;f310  'P'
	defb 00eh		;f311
	defb 013h		;f312
	defb 0cdh		;f313
	defb 001h		;f314
	defb 09eh		;f315
	defb 0c3h		;f316
	defb 0a0h		;f317
	defb 0f3h		;f318
lf319h:
; "YOU HAVE REACHEDTHE ULTIMATE LEVELYOU HAVE MASTEREDTHE ART OF NI"
; "NJITSUTOTAL"
	defb 059h		;f319  'Y'
	defb 04fh		;f31a  'O'
	defb 055h		;f31b  'U'
	defb 020h		;f31c  ' '
	defb 048h		;f31d  'H'
	defb 041h		;f31e  'A'
	defb 056h		;f31f  'V'
	defb 045h		;f320  'E'
	defb 020h		;f321  ' '
	defb 052h		;f322  'R'
	defb 045h		;f323  'E'
	defb 041h		;f324  'A'
	defb 043h		;f325  'C'
	defb 048h		;f326  'H'
	defb 045h		;f327  'E'
	defb 044h		;f328  'D'
	defb 054h		;f329  'T'
	defb 048h		;f32a  'H'
SCORE_TO_DISPLAY:
	defb 045h		;f32b  'E'
	defb 020h		;f32c  ' '
	defb 055h		;f32d  'U'
	defb 04ch		;f32e  'L'
	defb 054h		;f32f  'T'
	defb 049h		;f330  'I'
	defb 04dh		;f331  'M'
	defb 041h		;f332  'A'
	defb 054h		;f333  'T'
	defb 045h		;f334  'E'
	defb 020h		;f335  ' '
	defb 04ch		;f336  'L'
	defb 045h		;f337  'E'
	defb 056h		;f338  'V'
	defb 045h		;f339  'E'
	defb 04ch		;f33a  'L'
	defb 059h		;f33b  'Y'
	defb 04fh		;f33c  'O'
	defb 055h		;f33d  'U'
	defb 020h		;f33e  ' '
	defb 048h		;f33f  'H'
	defb 041h		;f340  'A'
	defb 056h		;f341  'V'
	defb 045h		;f342  'E'
	defb 020h		;f343  ' '
	defb 04dh		;f344  'M'
	defb 041h		;f345  'A'
	defb 053h		;f346  'S'
	defb 054h		;f347  'T'
	defb 045h		;f348  'E'
	defb 052h		;f349  'R'
	defb 045h		;f34a  'E'
lf34bh:
	defb 044h		;f34b  'D'
	defb 054h		;f34c  'T'
	defb 048h		;f34d  'H'
	defb 045h		;f34e  'E'
	defb 020h		;f34f  ' '
	defb 041h		;f350  'A'
	defb 052h		;f351  'R'
	defb 054h		;f352  'T'
	defb 020h		;f353  ' '
	defb 04fh		;f354  'O'
	defb 046h		;f355  'F'
	defb 020h		;f356  ' '
	defb 04eh		;f357  'N'
	defb 049h		;f358  'I'
	defb 04eh		;f359  'N'
	defb 04ah		;f35a  'J'
	defb 049h		;f35b  'I'
	defb 054h		;f35c  'T'
	defb 053h		;f35d  'S'
	defb 055h		;f35e  'U'
lf35fh:
	defb 054h		;f35f  'T'
	defb 04fh		;f360  'O'
	defb 054h		;f361  'T'
	defb 041h		;f362  'A'
	defb 04ch		;f363  'L'
lf364h:
	defb 0c6h		;f364
	defb 031h		;f365  '1'
	defb 032h		;f366  '2'
	defb 00fh		;f367
	defb 0f4h		;f368
	defb 021h		;f369  '!'
	defb 0fdh		;f36a
	defb 0f3h		;f36b
	defb 011h		;f36c
	defb 064h		;f36d  'd'
	defb 048h		;f36e  'H'
	defb 00eh		;f36f
	defb 00ch		;f370
	defb 0cdh		;f371
	defb 001h		;f372
	defb 09eh		;f373
	defb 011h		;f374
	defb 0a5h		;f375
	defb 048h		;f376  'H'
	defb 00eh		;f377
	defb 00ah		;f378
	defb 0cdh		;f379
	defb 001h		;f37a
	defb 09eh		;f37b
	defb 011h		;f37c
	defb 0e5h		;f37d
	defb 048h		;f37e  'H'
	defb 00eh		;f37f
	defb 001h		;f380
	defb 0cdh		;f381
	defb 001h		;f382
	defb 09eh		;f383
	defb 0d5h		;f384
	defb 03ah		;f385  ':'
	defb 0aeh		;f386
	defb 0edh		;f387
	defb 011h		;f388
	defb 0f5h		;f389
	defb 0ffh		;f38a
	defb 021h		;f38b  '!'
	defb 06ch		;f38c  'l'
	defb 0eeh		;f38d
	defb 019h		;f38e
	defb 03dh		;f38f  '='
	defb 020h		;f390  ' '
	defb 0fch		;f391
	defb 0d1h		;f392
	defb 00eh		;f393
	defb 00bh		;f394
	defb 0cdh		;f395
	defb 001h		;f396
	defb 09eh		;f397
	defb 021h		;f398  '!'
	defb 0b4h		;f399
	defb 0efh		;f39a
	defb 00eh		;f39b
	defb 001h		;f39c
	defb 0cdh		;f39d
	defb 001h		;f39e
	defb 09eh		;f39f
	defb 021h		;f3a0  '!'
	defb 0abh		;f3a1
	defb 070h		;f3a2  'p'
	defb 011h		;f3a3
	defb 0a4h		;f3a4
	defb 050h		;f3a5  'P'
	defb 00eh		;f3a6
	defb 00dh		;f3a7
	defb 0cdh		;f3a8
	defb 001h		;f3a9
	defb 09eh		;f3aa
	defb 011h		;f3ab
	defb 0c4h		;f3ac
	defb 050h		;f3ad  'P'
	defb 00eh		;f3ae
	defb 00ch		;f3af
	defb 0cdh		;f3b0
	defb 001h		;f3b1
	defb 09eh		;f3b2
	defb 0cdh		;f3b3
	defb 0a4h		;f3b4
	defb 0efh		;f3b5
	defb 0cdh		;f3b6
	defb 0abh		;f3b7
	defb 0efh		;f3b8
	defb 0c3h		;f3b9
	defb 01eh		;f3ba
	defb 0ech		;f3bb
FONT_DATA:
	defb 006h		;f3bc
	defb 0fah		;f3bd
	defb 0cdh		;f3be
	defb 00eh		;f3bf
	defb 0e7h		;f3c0
	defb 006h		;f3c1
	defb 0fah		;f3c2
	defb 0cdh		;f3c3
	defb 00eh		;f3c4
	defb 0e7h		;f3c5
	defb 0c9h		;f3c6
lf3c7h:
; "CONGRATULATIONSYOU HAVE COMPLETEDYOUR ASSIGNED MISSIONTHE CODE F"
; "ORSTA"
	defb 043h		;f3c7  'C'
	defb 04fh		;f3c8  'O'
	defb 04eh		;f3c9  'N'
	defb 047h		;f3ca  'G'
	defb 052h		;f3cb  'R'
	defb 041h		;f3cc  'A'
	defb 054h		;f3cd  'T'
	defb 055h		;f3ce  'U'
	defb 04ch		;f3cf  'L'
	defb 041h		;f3d0  'A'
	defb 054h		;f3d1  'T'
	defb 049h		;f3d2  'I'
	defb 04fh		;f3d3  'O'
	defb 04eh		;f3d4  'N'
	defb 053h		;f3d5  'S'
	defb 059h		;f3d6  'Y'
	defb 04fh		;f3d7  'O'
	defb 055h		;f3d8  'U'
	defb 020h		;f3d9  ' '
	defb 048h		;f3da  'H'
	defb 041h		;f3db  'A'
	defb 056h		;f3dc  'V'
	defb 045h		;f3dd  'E'
	defb 020h		;f3de  ' '
	defb 043h		;f3df  'C'
	defb 04fh		;f3e0  'O'
	defb 04dh		;f3e1  'M'
	defb 050h		;f3e2  'P'
	defb 04ch		;f3e3  'L'
	defb 045h		;f3e4  'E'
	defb 054h		;f3e5  'T'
	defb 045h		;f3e6  'E'
	defb 044h		;f3e7  'D'
	defb 059h		;f3e8  'Y'
	defb 04fh		;f3e9  'O'
	defb 055h		;f3ea  'U'
	defb 052h		;f3eb  'R'
	defb 020h		;f3ec  ' '
	defb 041h		;f3ed  'A'
	defb 053h		;f3ee  'S'
	defb 053h		;f3ef  'S'
	defb 049h		;f3f0  'I'
	defb 047h		;f3f1  'G'
	defb 04eh		;f3f2  'N'
	defb 045h		;f3f3  'E'
	defb 044h		;f3f4  'D'
	defb 020h		;f3f5  ' '
	defb 04dh		;f3f6  'M'
	defb 049h		;f3f7  'I'
	defb 053h		;f3f8  'S'
	defb 053h		;f3f9  'S'
	defb 049h		;f3fa  'I'
	defb 04fh		;f3fb  'O'
	defb 04eh		;f3fc  'N'
	defb 054h		;f3fd  'T'
	defb 048h		;f3fe  'H'
	defb 045h		;f3ff  'E'
	defb 020h		;f400  ' '
	defb 043h		;f401  'C'
	defb 04fh		;f402  'O'
	defb 044h		;f403  'D'
	defb 045h		;f404  'E'
	defb 020h		;f405  ' '
	defb 046h		;f406  'F'
	defb 04fh		;f407  'O'
	defb 052h		;f408  'R'
	defb 053h		;f409  'S'
	defb 054h		;f40a  'T'
	defb 041h		;f40b  'A'
