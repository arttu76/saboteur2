; ======================================================================
; data_tables1.asm
; ======================================================================
;
; Entity/Sprite Data Tables
;
; Address range: $820C-$8573 (872 bytes)
; Source binary: mod_decompressed.bin (loaded at $620C)
;
; Sprite lookup tables, entity type data, and rendering parameters.
; Origin: data_entityspawn, data_spritebitmap, code_roomrender (partial)
;
; ======================================================================

rooms_end:

tab1_start:
; --- 14 zero bytes ---
	defb 000h		;820c
	defb 000h		;820d
	defb 000h		;820e
	defb 000h		;820f
	defb 000h		;8210
	defb 000h		;8211
	defb 000h		;8212
	defb 000h		;8213
	defb 000h		;8214
	defb 000h		;8215
	defb 000h		;8216
	defb 000h		;8217
	defb 000h		;8218
	defb 000h		;8219
	defb 066h		;821a  'f'
	defb 076h		;821b  'v'
	defb 071h		;821c  'q'
	defb 09ch		;821d
	defb 0a2h		;821e
	defb 0a3h		;821f
	defb 0a4h		;8220
	defb 0a5h		;8221
	defb 094h		;8222
	defb 091h		;8223
	defb 08fh		;8224
	defb 011h		;8225
	defb 000h		;8226
	defb 000h		;8227
	defb 000h		;8228
	defb 000h		;8229
	defb 000h		;822a
	defb 005h		;822b
; --- 12 zero bytes ---
	defb 000h		;822c
	defb 000h		;822d
	defb 000h		;822e
	defb 000h		;822f
	defb 000h		;8230
	defb 000h		;8231
	defb 000h		;8232
	defb 000h		;8233
	defb 000h		;8234
	defb 000h		;8235
	defb 000h		;8236
	defb 000h		;8237
	defb 0f1h		;8238
	defb 007h		;8239
	defb 067h		;823a  'g'
	defb 075h		;823b  'u'
	defb 09dh		;823c
	defb 0a1h		;823d
	defb 03ah		;823e  ':'
	defb 0a7h		;823f
	defb 0beh		;8240
	defb 0a6h		;8241
	defb 095h		;8242
	defb 092h		;8243
	defb 001h		;8244
	defb 012h		;8245
	defb 000h		;8246
	defb 000h		;8247
	defb 000h		;8248
	defb 000h		;8249
	defb 00ah		;824a
	defb 004h		;824b
	defb 008h		;824c
	defb 00bh		;824d
	defb 013h		;824e
; --- 9 zero bytes ---
	defb 000h		;824f
	defb 000h		;8250
	defb 000h		;8251
	defb 000h		;8252
	defb 000h		;8253
	defb 000h		;8254
	defb 000h		;8255
	defb 000h		;8256
	defb 000h		;8257
	defb 005h		;8258
	defb 000h		;8259
	defb 068h		;825a  'h'
	defb 074h		;825b  't'
	defb 09eh		;825c
	defb 0a0h		;825d
	defb 03bh		;825e  ';'
	defb 0d3h		;825f
	defb 082h		;8260
	defb 098h		;8261
	defb 096h		;8262
	defb 097h		;8263
	defb 09bh		;8264
	defb 016h		;8265
	defb 000h		;8266
	defb 000h		;8267
	defb 00dh		;8268
	defb 00ch		;8269
	defb 009h		;826a
	defb 001h		;826b
	defb 002h		;826c
	defb 003h		;826d
	defb 039h		;826e  '9'
	defb 013h		;826f
; --- 8 zero bytes ---
	defb 000h		;8270
	defb 000h		;8271
	defb 000h		;8272
	defb 000h		;8273
	defb 000h		;8274
	defb 000h		;8275
	defb 000h		;8276
	defb 000h		;8277
	defb 005h		;8278
	defb 000h		;8279
	defb 066h		;827a  'f'
	defb 073h		;827b  's'
	defb 09fh		;827c
	defb 070h		;827d  'p'
	defb 03bh		;827e  ';'
	defb 0d2h		;827f
	defb 071h		;8280  'q'
	defb 099h		;8281
	defb 09ah		;8282
	defb 0ebh		;8283
	defb 0d4h		;8284
	defb 012h		;8285
	defb 000h		;8286
	defb 000h		;8287
	defb 017h		;8288
; "RUqa=L"
	defb 052h		;8289  'R'
	defb 055h		;828a  'U'
	defb 071h		;828b  'q'
	defb 061h		;828c  'a'
	defb 03dh		;828d  '='
	defb 04ch		;828e  'L'
	defb 011h		;828f
	defb 000h		;8290
	defb 000h		;8291
	defb 000h		;8292
	defb 000h		;8293
	defb 000h		;8294
	defb 000h		;8295
	defb 03fh		;8296  '?'
	defb 008h		;8297
	defb 004h		;8298
	defb 013h		;8299
; "frqp;"
	defb 066h		;829a  'f'
	defb 072h		;829b  'r'
	defb 071h		;829c  'q'
	defb 070h		;829d  'p'
	defb 03bh		;829e  ';'
	defb 0e8h		;829f
	defb 0beh		;82a0
	defb 0b4h		;82a1
	defb 0c0h		;82a2
	defb 0beh		;82a3
	defb 0d5h		;82a4
	defb 011h		;82a5
	defb 000h		;82a6
	defb 000h		;82a7
	defb 018h		;82a8
	defb 053h		;82a9  'S'
	defb 01bh		;82aa
	defb 0f5h		;82ab
	defb 062h		;82ac  'b'
	defb 03eh		;82ad  '>'
	defb 04dh		;82ae  'M'
	defb 011h		;82af
	defb 000h		;82b0
	defb 000h		;82b1
	defb 000h		;82b2
	defb 000h		;82b3
	defb 000h		;82b4
	defb 000h		;82b5
	defb 040h		;82b6  '@'
	defb 046h		;82b7  'F'
	defb 047h		;82b8  'G'
	defb 011h		;82b9
; "imno;"
	defb 069h		;82ba  'i'
	defb 06dh		;82bb  'm'
	defb 06eh		;82bc  'n'
	defb 06fh		;82bd  'o'
	defb 03bh		;82be  ';'
	defb 0d2h		;82bf
	defb 055h		;82c0  'U'
	defb 09fh		;82c1
	defb 071h		;82c2  'q'
	defb 09fh		;82c3
	defb 0d6h		;82c4
	defb 012h		;82c5
	defb 000h		;82c6
	defb 000h		;82c7
	defb 019h		;82c8
	defb 01ah		;82c9
; "VXcQN"
	defb 056h		;82ca  'V'
	defb 058h		;82cb  'X'
	defb 063h		;82cc  'c'
	defb 051h		;82cd  'Q'
	defb 04eh		;82ce  'N'
	defb 011h		;82cf
	defb 000h		;82d0
	defb 000h		;82d1
	defb 000h		;82d2
	defb 000h		;82d3
	defb 000h		;82d4
	defb 000h		;82d5
	defb 040h		;82d6  '@'
	defb 045h		;82d7  'E'
	defb 044h		;82d8  'D'
	defb 015h		;82d9
	defb 00fh		;82da
; "jkl;"
	defb 06ah		;82db  'j'
	defb 06bh		;82dc  'k'
	defb 06ch		;82dd  'l'
	defb 03bh		;82de  ';'
	defb 0e8h		;82df
	defb 0b4h		;82e0
	defb 0beh		;82e1
	defb 0c0h		;82e2
	defb 0b4h		;82e3
	defb 0d1h		;82e4
	defb 015h		;82e5
	defb 00fh		;82e6
	defb 00eh		;82e7
	defb 014h		;82e8
; "TYZPPO"
	defb 054h		;82e9  'T'
	defb 059h		;82ea  'Y'
	defb 05ah		;82eb  'Z'
	defb 050h		;82ec  'P'
	defb 050h		;82ed  'P'
	defb 04fh		;82ee  'O'
	defb 015h		;82ef
	defb 02ch		;82f0  ','
	defb 000h		;82f1
	defb 000h		;82f2
	defb 000h		;82f3
	defb 000h		;82f4
	defb 000h		;82f5
	defb 040h		;82f6  '@'
	defb 042h		;82f7  'B'
	defb 043h		;82f8  'C'
	defb 001h		;82f9
	defb 001h		;82fa
	defb 0dah		;82fb
	defb 0d9h		;82fc
	defb 0d8h		;82fd
	defb 03bh		;82fe  ';'
	defb 0e1h		;82ff
	defb 071h		;8300  'q'
	defb 09ch		;8301
	defb 09fh		;8302
	defb 055h		;8303  'U'
	defb 0e4h		;8304
	defb 001h		;8305
	defb 001h		;8306
	defb 001h		;8307
	defb 001h		;8308
; "W[\L"
	defb 057h		;8309  'W'
	defb 05bh		;830a  '['
	defb 05ch		;830b  '\'
	defb 04ch		;830c  'L'
	defb 001h		;830d
	defb 001h		;830e
	defb 001h		;830f
	defb 038h		;8310  '8'
	defb 02ch		;8311  ','
	defb 000h		;8312
	defb 000h		;8313
	defb 000h		;8314
	defb 0efh		;8315
	defb 041h		;8316  'A'
	defb 048h		;8317  'H'
	defb 001h		;8318
	defb 001h		;8319
	defb 021h		;831a  '!'
	defb 0eah		;831b
	defb 0b4h		;831c
	defb 0d7h		;831d
	defb 03bh		;831e  ';'
	defb 0e2h		;831f
	defb 0e0h		;8320
	defb 0dfh		;8321
	defb 0e0h		;8322
	defb 0e3h		;8323
	defb 0e5h		;8324
	defb 001h		;8325
; "!*(:]^_^`#"
	defb 021h		;8326  '!'
	defb 02ah		;8327  '*'
	defb 028h		;8328  '('
	defb 03ah		;8329  ':'
	defb 05dh		;832a  ']'
	defb 05eh		;832b  '^'
	defb 05fh		;832c  '_'
	defb 05eh		;832d  '^'
	defb 060h		;832e  '`' (Spectrum: GBP)
	defb 023h		;832f  '#'
	defb 01eh		;8330
	defb 02dh		;8331  '-'
	defb 000h		;8332
	defb 000h		;8333
	defb 000h		;8334
	defb 0f0h		;8335
	defb 001h		;8336
	defb 001h		;8337
	defb 001h		;8338
	defb 001h		;8339
	defb 01ch		;833a
	defb 0dah		;833b
	defb 0d9h		;833c
	defb 0d8h		;833d
	defb 03bh		;833e  ';'
	defb 0e2h		;833f
	defb 0e7h		;8340
	defb 0dfh		;8341
	defb 0e0h		;8342
	defb 0e7h		;8343
	defb 0e6h		;8344
	defb 001h		;8345
	defb 01ch		;8346
	defb 001h		;8347
	defb 001h		;8348
	defb 03bh		;8349  ';'
	defb 021h		;834a  '!'
	defb 01dh		;834b
	defb 022h		;834c  '"'
	defb 01dh		;834d
	defb 023h		;834e  '#'
	defb 025h		;834f  '%'
	defb 001h		;8350
	defb 02dh		;8351  '-'
	defb 000h		;8352
	defb 000h		;8353
	defb 000h		;8354
	defb 0f0h		;8355
	defb 001h		;8356
	defb 021h		;8357  '!'
	defb 02ah		;8358  '*'
	defb 01dh		;8359
	defb 022h		;835a  '"'
	defb 0eah		;835b
	defb 0c0h		;835c
	defb 0d7h		;835d
	defb 03ch		;835e  '<'
	defb 0bfh		;835f
	defb 0c0h		;8360
	defb 0c1h		;8361
	defb 0c2h		;8362
	defb 0c9h		;8363
	defb 0cah		;8364
	defb 02ah		;8365  '*'
	defb 022h		;8366  '"'
	defb 028h		;8367  '('
	defb 001h		;8368
	defb 03bh		;8369  ';'
	defb 029h		;836a  ')'
	defb 001h		;836b
	defb 001h		;836c
; "!"" -"
	defb 021h		;836d  '!'
	defb 022h		;836e  '"'
	defb 022h		;836f  '"'
	defb 020h		;8370  ' '
	defb 02dh		;8371  '-'
	defb 000h		;8372
	defb 000h		;8373
	defb 000h		;8374
	defb 0f0h		;8375
	defb 001h		;8376
	defb 01ch		;8377
	defb 001h		;8378
	defb 001h		;8379
	defb 001h		;837a
	defb 0dah		;837b
	defb 0d9h		;837c
	defb 0d8h		;837d
	defb 001h		;837e
	defb 0ddh		;837f
	defb 0d9h		;8380
	defb 0deh		;8381
	defb 03ah		;8382  ':'
	defb 0c8h		;8383
	defb 0cbh		;8384
	defb 001h		;8385
	defb 001h		;8386
	defb 001h		;8387
	defb 001h		;8388
; ";'#("
	defb 03bh		;8389  ';'
	defb 027h		;838a  '''
	defb 023h		;838b  '#'
	defb 028h		;838c  '('
	defb 01ch		;838d
	defb 001h		;838e
	defb 001h		;838f
	defb 01ch		;8390
	defb 02dh		;8391  '-'
	defb 000h		;8392
	defb 000h		;8393
	defb 000h		;8394
	defb 0f0h		;8395
	defb 001h		;8396
	defb 024h		;8397  '$'
	defb 01dh		;8398
	defb 020h		;8399  ' '
	defb 001h		;839a
	defb 0dah		;839b
	defb 0d9h		;839c
	defb 0dbh		;839d
	defb 001h		;839e
	defb 0ddh		;839f
	defb 0d9h		;83a0
	defb 0deh		;83a1
	defb 03bh		;83a2  ';'
	defb 0c7h		;83a3
	defb 0cch		;83a4
	defb 02ah		;83a5  '*'
	defb 01dh		;83a6
	defb 020h		;83a7  ' '
	defb 001h		;83a8
	defb 03bh		;83a9  ';'
	defb 001h		;83aa
	defb 01fh		;83ab
	defb 01dh		;83ac
	defb 01eh		;83ad
	defb 001h		;83ae
	defb 027h		;83af  '''
	defb 025h		;83b0  '%'
	defb 02dh		;83b1  '-'
	defb 000h		;83b2
	defb 000h		;83b3
	defb 000h		;83b4
	defb 0f0h		;83b5
	defb 001h		;83b6
	defb 01ch		;83b7
	defb 001h		;83b8
	defb 024h		;83b9  '$'
	defb 02ah		;83ba  '*'
	defb 0a8h		;83bb
	defb 0abh		;83bc
	defb 0aeh		;83bd
	defb 0afh		;83be
	defb 0e9h		;83bf
	defb 0bdh		;83c0
	defb 0dch		;83c1
	defb 03bh		;83c2  ';'
	defb 0c6h		;83c3
	defb 0cdh		;83c4
	defb 001h		;83c5
	defb 001h		;83c6
	defb 01ch		;83c7
	defb 001h		;83c8
	defb 03bh		;83c9  ';'
	defb 021h		;83ca  '!'
	defb 01dh		;83cb
	defb 02ah		;83cc  '*'
	defb 01dh		;83cd
	defb 02ah		;83ce  '*'
	defb 01dh		;83cf
	defb 01eh		;83d0
	defb 02dh		;83d1  '-'
	defb 000h		;83d2
	defb 000h		;83d3
	defb 000h		;83d4
	defb 0f0h		;83d5
	defb 001h		;83d6
	defb 024h		;83d7  '$'
	defb 028h		;83d8  '('
	defb 01ch		;83d9
	defb 001h		;83da
	defb 0a9h		;83db
	defb 0ach		;83dc
	defb 0b0h		;83dd
	defb 0b3h		;83de
	defb 0b5h		;83df
	defb 0bch		;83e0
	defb 0bah		;83e1
	defb 03bh		;83e2  ';'
	defb 0c5h		;83e3
	defb 0ceh		;83e4
	defb 001h		;83e5
	defb 001h		;83e6
	defb 01ch		;83e7
	defb 001h		;83e8
	defb 03bh		;83e9  ';'
	defb 01ch		;83ea
	defb 001h		;83eb
	defb 001h		;83ec
	defb 001h		;83ed
	defb 021h		;83ee  '!'
	defb 02ah		;83ef  '*'
	defb 01dh		;83f0
	defb 02eh		;83f1  '.'
	defb 000h		;83f2
	defb 000h		;83f3
	defb 000h		;83f4
	defb 0f0h		;83f5
	defb 001h		;83f6
	defb 01ch		;83f7
	defb 001h		;83f8
	defb 024h		;83f9  '$'
	defb 02ah		;83fa  '*'
	defb 0aah		;83fb
	defb 0adh		;83fc
	defb 0b1h		;83fd
	defb 0b2h		;83fe
	defb 0b6h		;83ff
	defb 0bbh		;8400
	defb 0b9h		;8401
	defb 03bh		;8402  ';'
	defb 0c4h		;8403
	defb 0cfh		;8404
	defb 001h		;8405
	defb 001h		;8406
	defb 01ch		;8407
	defb 001h		;8408
	defb 03bh		;8409  ';'
	defb 01ch		;840a
	defb 027h		;840b  '''
	defb 01dh		;840c
	defb 02ah		;840d  '*'
	defb 026h		;840e  '&'
	defb 01dh		;840f
	defb 02ah		;8410  '*'
	defb 02eh		;8411  '.'
	defb 000h		;8412
	defb 000h		;8413
	defb 000h		;8414
	defb 0f0h		;8415
	defb 001h		;8416
	defb 01ch		;8417
	defb 001h		;8418
	defb 01ch		;8419
	defb 021h		;841a  '!'
	defb 01dh		;841b
	defb 02ah		;841c  '*'
	defb 023h		;841d  '#'
	defb 02ah		;841e  '*'
	defb 0b7h		;841f
	defb 023h		;8420  '#'
	defb 0b8h		;8421
	defb 03bh		;8422  ';'
	defb 0c3h		;8423
	defb 0d0h		;8424
	defb 01dh		;8425
	defb 02ah		;8426  '*'
	defb 025h		;8427  '%'
	defb 001h		;8428
	defb 03bh		;8429  ';'
	defb 024h		;842a  '$'
	defb 01dh		;842b
	defb 02ah		;842c  '*'
	defb 01dh		;842d
	defb 022h		;842e  '"'
	defb 01dh		;842f
	defb 02ah		;8430  '*'
	defb 02eh		;8431  '.'
	defb 000h		;8432
	defb 000h		;8433
	defb 000h		;8434
	defb 0f0h		;8435
	defb 001h		;8436
	defb 01ch		;8437
	defb 001h		;8438
	defb 01ch		;8439
	defb 01ch		;843a
	defb 001h		;843b
	defb 001h		;843c
	defb 01ch		;843d
	defb 001h		;843e
	defb 001h		;843f
	defb 01ch		;8440
	defb 001h		;8441
	defb 03bh		;8442  ';'
	defb 001h		;8443
	defb 01ch		;8444
	defb 001h		;8445
	defb 021h		;8446  '!'
	defb 025h		;8447  '%'
	defb 001h		;8448
; "<&*#* "
	defb 03ch		;8449  '<'
	defb 026h		;844a  '&'
	defb 02ah		;844b  '*'
	defb 023h		;844c  '#'
	defb 02ah		;844d  '*'
	defb 020h		;844e  ' '
	defb 001h		;844f
	defb 001h		;8450
	defb 02dh		;8451  '-'
	defb 000h		;8452
	defb 000h		;8453
	defb 000h		;8454
	defb 0f0h		;8455
	defb 001h		;8456
	defb 024h		;8457  '$'
	defb 02ah		;8458  '*'
	defb 01eh		;8459
	defb 01ch		;845a
	defb 001h		;845b
	defb 021h		;845c  '!'
	defb 026h		;845d  '&'
	defb 02ah		;845e  '*'
	defb 01dh		;845f
	defb 01eh		;8460
	defb 001h		;8461
	defb 03bh		;8462  ';'
	defb 001h		;8463
	defb 01ch		;8464
	defb 001h		;8465
	defb 01ch		;8466
	defb 01ch		;8467
	defb 001h		;8468
	defb 001h		;8469
	defb 01ch		;846a
	defb 021h		;846b  '!'
	defb 01eh		;846c
	defb 001h		;846d
	defb 01fh		;846e
	defb 01dh		;846f
	defb 020h		;8470  ' '
	defb 02dh		;8471  '-'
	defb 000h		;8472
	defb 000h		;8473
	defb 000h		;8474
	defb 0f0h		;8475
	defb 001h		;8476
	defb 01fh		;8477
	defb 01dh		;8478
	defb 020h		;8479  ' '
	defb 01fh		;847a
	defb 02ah		;847b  '*'
	defb 01eh		;847c
	defb 01ch		;847d
	defb 001h		;847e
; "'* ;"
	defb 027h		;847f  '''
	defb 02ah		;8480  '*'
	defb 020h		;8481  ' '
	defb 03bh		;8482  ';'
	defb 001h		;8483
	defb 01fh		;8484
	defb 02ah		;8485  '*'
	defb 01eh		;8486
	defb 01fh		;8487
	defb 01dh		;8488
	defb 02ah		;8489  '*'
	defb 026h		;848a  '&'
	defb 022h		;848b  '"'
	defb 01dh		;848c
	defb 02ah		;848d  '*'
	defb 01dh		;848e
	defb 028h		;848f  '('
	defb 01ch		;8490
l8491h:
	defb 02dh		;8491  '-'
	defb 000h		;8492
	defb 000h		;8493
	defb 000h		;8494
	defb 0f0h		;8495
	defb 001h		;8496
	defb 001h		;8497
	defb 001h		;8498
	defb 01fh		;8499
	defb 01dh		;849a
	defb 02ah		;849b  '*'
	defb 020h		;849c  ' '
	defb 01fh		;849d
	defb 01dh		;849e
	defb 02ah		;849f  '*'
	defb 01dh		;84a0
	defb 025h		;84a1  '%'
	defb 03ch		;84a2  '<'
	defb 04ah		;84a3  'J'
	defb 001h		;84a4
	defb 001h		;84a5
	defb 001h		;84a6
	defb 001h		;84a7
; "!*&/01*"
	defb 021h		;84a8  '!'
	defb 02ah		;84a9  '*'
	defb 026h		;84aa  '&'
	defb 02fh		;84ab  '/'
	defb 030h		;84ac  '0'
	defb 031h		;84ad  '1'
	defb 02ah		;84ae  '*'
	defb 01dh		;84af
	defb 025h		;84b0  '%'
	defb 02dh		;84b1  '-'
	defb 000h		;84b2
	defb 000h		;84b3
	defb 000h		;84b4
	defb 0f0h		;84b5
	defb 001h		;84b6
	defb 001h		;84b7
	defb 001h		;84b8
	defb 001h		;84b9
	defb 001h		;84ba
	defb 001h		;84bb
	defb 01fh		;84bc
	defb 01dh		;84bd
	defb 02ah		;84be  '*'
	defb 01dh		;84bf
	defb 02ah		;84c0  '*'
	defb 01eh		;84c1
	defb 001h		;84c2
	defb 04bh		;84c3  'K'
	defb 001h		;84c4
	defb 021h		;84c5  '!'
	defb 01dh		;84c6
	defb 02ah		;84c7  '*'
	defb 025h		;84c8  '%'
	defb 001h		;84c9
	defb 01ch		;84ca
; "234##"
	defb 032h		;84cb  '2'
	defb 033h		;84cc  '3'
	defb 034h		;84cd  '4'
	defb 023h		;84ce  '#'
	defb 023h		;84cf  '#'
	defb 01eh		;84d0
	defb 02dh		;84d1  '-'
	defb 000h		;84d2
	defb 0edh		;84d3
	defb 0eeh		;84d4
	defb 0ech		;84d5
	defb 02bh		;84d6  '+'
	defb 0f3h		;84d7
	defb 0f4h		;84d8
	defb 02bh		;84d9  '+'
	defb 0f3h		;84da
	defb 02bh		;84db  '+'
	defb 0f4h		;84dc
	defb 02bh		;84dd  '+'
	defb 0f3h		;84de
	defb 0f4h		;84df
	defb 0f3h		;84e0
	defb 02bh		;84e1  '+'
	defb 0f4h		;84e2
	defb 049h		;84e3  'I'
	defb 01dh		;84e4
	defb 022h		;84e5  '"'
	defb 01dh		;84e6
	defb 023h		;84e7  '#'
	defb 022h		;84e8  '"'
	defb 01dh		;84e9
; "%567%"
	defb 025h		;84ea  '%'
	defb 035h		;84eb  '5'
	defb 036h		;84ec  '6'
	defb 037h		;84ed  '7'
	defb 025h		;84ee  '%'
	defb 01fh		;84ef
	defb 01dh		;84f0
	defb 02eh		;84f1  '.'
	defb 000h		;84f2
	defb 001h		;84f3
	defb 001h		;84f4
	defb 021h		;84f5  '!'
	defb 02ah		;84f6  '*'
	defb 01dh		;84f7
	defb 020h		;84f8  ' '
	defb 001h		;84f9
	defb 001h		;84fa
	defb 001h		;84fb
	defb 001h		;84fc
	defb 001h		;84fd
	defb 001h		;84fe
	defb 001h		;84ff
	defb 001h		;8500
	defb 001h		;8501
	defb 001h		;8502
	defb 001h		;8503
	defb 001h		;8504
	defb 001h		;8505
	defb 001h		;8506
	defb 01ch		;8507
	defb 001h		;8508
	defb 01dh		;8509
	defb 01ch		;850a
	defb 027h		;850b  '''
	defb 01dh		;850c
	defb 02ah		;850d  '*'
	defb 01eh		;850e
	defb 001h		;850f
	defb 001h		;8510
	defb 039h		;8511  '9'
	defb 013h		;8512
	defb 001h		;8513
	defb 001h		;8514
	defb 01ch		;8515
	defb 001h		;8516
	defb 001h		;8517
	defb 01fh		;8518
	defb 01dh		;8519
	defb 02ah		;851a  '*'
	defb 01dh		;851b
	defb 023h		;851c  '#'
	defb 02ah		;851d  '*'
	defb 01dh		;851e
	defb 02ah		;851f  '*'
	defb 01dh		;8520
	defb 02ah		;8521  '*'
	defb 01dh		;8522
	defb 02ah		;8523  '*'
	defb 01dh		;8524
	defb 023h		;8525  '#'
	defb 01dh		;8526
	defb 01eh		;8527
	defb 027h		;8528  '''
	defb 01dh		;8529
	defb 022h		;852a  '"'
	defb 02ah		;852b  '*'
	defb 01dh		;852c
	defb 028h		;852d  '('
	defb 001h		;852e
	defb 021h		;852f  '!'
	defb 02ah		;8530  '*'
	defb 01dh		;8531
	defb 0f2h		;8532
	defb 0eeh		;8533
	defb 021h		;8534  '!'
	defb 025h		;8535  '%'
	defb 001h		;8536
	defb 001h		;8537
	defb 001h		;8538
	defb 001h		;8539
	defb 001h		;853a
	defb 021h		;853b  '!'
	defb 022h		;853c  '"'
	defb 02ah		;853d  '*'
	defb 01dh		;853e
	defb 02ah		;853f  '*'
	defb 01dh		;8540
	defb 02ah		;8541  '*'
	defb 020h		;8542  ' '
	defb 001h		;8543
	defb 001h		;8544
	defb 01fh		;8545
	defb 02ah		;8546  '*'
	defb 01dh		;8547
	defb 02ah		;8548  '*'
	defb 01dh		;8549
	defb 02ah		;854a  '*'
	defb 01dh		;854b
	defb 023h		;854c  '#'
	defb 01dh		;854d
	defb 02ah		;854e  '*'
	defb 025h		;854f  '%'
	defb 001h		;8550
	defb 001h		;8551
	defb 01ch		;8552
	defb 001h		;8553
	defb 029h		;8554  ')'
	defb 01fh		;8555
	defb 01dh		;8556
	defb 02ah		;8557  '*'
	defb 01dh		;8558
	defb 02ah		;8559  '*'
	defb 01dh		;855a
	defb 01eh		;855b
	defb 001h		;855c
	defb 001h		;855d
	defb 001h		;855e
l855fh:
	defb 001h		;855f
	defb 001h		;8560
	defb 001h		;8561
	defb 01fh		;8562
	defb 01dh		;8563
	defb 02ah		;8564  '*'
	defb 01dh		;8565
	defb 02ah		;8566  '*'
	defb 01dh		;8567
	defb 02ah		;8568  '*'
	defb 01dh		;8569
	defb 02ah		;856a  '*'
	defb 01dh		;856b
	defb 01eh		;856c
	defb 001h		;856d
	defb 001h		;856e
	defb 01fh		;856f
	defb 02ah		;8570  '*'
	defb 01dh		;8571
	defb 01eh		;8572
	defb 000h		;8573
