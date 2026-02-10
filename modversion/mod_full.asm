; z80dasm 1.1.6
; command line: z80dasm -a -t -g 0x620C -u -o mod_full.asm mod_decompressed.bin

	org	0620ch

	jp 08574h		;620c	c3 74 85 	. t . 
	dec c			;620f	0d 	. 
	ld d,b			;6210	50 	P 
	ld d,d			;6211	52 	R 
	ld b,l			;6212	45 	E 
	ld d,e			;6213	53 	S 
	ld d,e			;6214	53 	S 
	jr nz,$+67		;6215	20 41 	  A 
	ld c,(hl)			;6217	4e 	N 
	ld e,c			;6218	59 	Y 
	jr nz,$+77		;6219	20 4b 	  K 
	ld b,l			;621b	45 	E 
	ld e,c			;621c	59 	Y 
	jr nz,$+86		;621d	20 54 	  T 
	ld c,a			;621f	4f 	O 
	jr nz,$+69		;6220	20 43 	  C 
	ld c,a			;6222	4f 	O 
	ld c,(hl)			;6223	4e 	N 
	ld d,h			;6224	54 	T 
	ld c,c			;6225	49 	I 
	ld c,(hl)			;6226	4e 	N 
	ld d,l			;6227	55 	U 
	ld b,l			;6228	45 	E 
	ld d,d			;6229	52 	R 
	ld c,c			;622a	49 	I 
	ld c,(hl)			;622b	4e 	N 
	jr nz,$+34		;622c	20 20 	    
	add hl,sp			;622e	39 	9 
	add hl,sp			;622f	39 	9 
	add hl,sp			;6230	39 	9 
	jr nz,$+34		;6231	20 20 	    
	ld d,e			;6233	53 	S 
	ld d,h			;6234	54 	T 
	ld d,d			;6235	52 	R 
	ld b,l			;6236	45 	E 
	ld c,(hl)			;6237	4e 	N 
	ld b,a			;6238	47 	G 
	ld d,h			;6239	54 	T 
	ld c,b			;623a	48 	H 
	jr nz,$+81		;623b	20 4f 	  O 
	ld b,(hl)			;623d	46 	F 
	jr nz,$+79		;623e	20 4d 	  M 
	ld c,c			;6240	49 	I 
	ld c,(hl)			;6241	4e 	N 
	ld b,h			;6242	44 	D 
	jr nz,$+67		;6243	20 41 	  A 
	ld c,(hl)			;6245	4e 	N 
	ld b,h			;6246	44 	D 
	jr nz,$+68		;6247	20 42 	  B 
	ld c,a			;6249	4f 	O 
	ld b,h			;624a	44 	D 
	ld e,c			;624b	59 	Y 
	jr nz,$+34		;624c	20 20 	    
	jr nz,$+50		;624e	20 30 	  0 
	jr nc,$+2		;6250	30 00 	0 . 
	add a,c			;6252	81 	. 
	ld c,e			;6253	4b 	K 
	ld e,c			;6254	59 	Y 
	ld c,a			;6255	4f 	O 
	jr nz,$+34		;6256	20 20 	    
	add hl,sp			;6258	39 	9 
	jr nc,$+51		;6259	30 31 	0 1 
	jr nz,$+34		;625b	20 20 	    
	jr nz,$+34		;625d	20 20 	    
	jr nz,$+70		;625f	20 44 	  D 
	ld c,c			;6261	49 	I 
	ld d,d			;6262	52 	R 
	ld b,l			;6263	45 	E 
	ld b,e			;6264	43 	C 
	ld d,h			;6265	54 	T 
	ld c,c			;6266	49 	I 
	ld c,a			;6267	4f 	O 
	ld c,(hl)			;6268	4e 	N 
	jr nz,$+81		;6269	20 4f 	  O 
	ld b,(hl)			;626b	46 	F 
	jr nz,$+71		;626c	20 45 	  E 
	ld c,(hl)			;626e	4e 	N 
	ld b,l			;626f	45 	E 
	ld d,d			;6270	52 	R 
	ld b,a			;6271	47 	G 
	ld e,c			;6272	59 	Y 
	jr nz,$+34		;6273	20 20 	    
	jr nz,$+34		;6275	20 20 	    
	jr nz,$+34		;6277	20 20 	    
	jr nc,$+50		;6279	30 30 	0 0 
	nop			;627b	00 	. 
	add a,b			;627c	80 	. 
	ld d,h			;627d	54 	T 
	ld c,a			;627e	4f 	O 
	ld c,b			;627f	48 	H 
	jr nz,$+34		;6280	20 20 	    
	jr c,$+50		;6282	38 30 	8 0 
	ld sp,02020h		;6284	31 20 20 	1     
	jr nz,$+74		;6287	20 48 	  H 
	ld b,c			;6289	41 	A 
	ld d,d			;628a	52 	R 
	ld c,l			;628b	4d 	M 
	ld c,a			;628c	4f 	O 
	ld c,(hl)			;628d	4e 	N 
	ld e,c			;628e	59 	Y 
	jr nz,$+89		;628f	20 57 	  W 
	ld c,c			;6291	49 	I 
	ld d,h			;6292	54 	T 
	ld c,b			;6293	48 	H 
	jr nz,$+86		;6294	20 54 	  T 
	ld c,b			;6296	48 	H 
	ld b,l			;6297	45 	E 
	jr nz,$+87		;6298	20 55 	  U 
	ld c,(hl)			;629a	4e 	N 
	ld c,c			;629b	49 	I 
	ld d,(hl)			;629c	56 	V 
	ld b,l			;629d	45 	E 
	ld d,d			;629e	52 	R 
	ld d,e			;629f	53 	S 
	ld b,l			;62a0	45 	E 
	jr nz,$+34		;62a1	20 20 	    
	jr nc,$+52		;62a3	30 32 	0 2 
	ld (bc),a			;62a5	02 	. 
	add a,c			;62a6	81 	. 
	ld d,e			;62a7	53 	S 
	ld c,b			;62a8	48 	H 
	ld b,c			;62a9	41 	A 
	jr nz,$+34		;62aa	20 20 	    
	scf			;62ac	37 	7 
	dec (hl)			;62ad	35 	5 
	ld sp,02020h		;62ae	31 20 20 	1     
	ld c,b			;62b1	48 	H 
	ld b,l			;62b2	45 	E 
	ld b,c			;62b3	41 	A 
	ld c,h			;62b4	4c 	L 
	ld c,c			;62b5	49 	I 
	ld c,(hl)			;62b6	4e 	N 
	ld b,a			;62b7	47 	G 
	jr nz,$+81		;62b8	20 4f 	  O 
	ld b,(hl)			;62ba	46 	F 
	jr nz,$+85		;62bb	20 53 	  S 
	ld b,l			;62bd	45 	E 
	ld c,h			;62be	4c 	L 
	ld b,(hl)			;62bf	46 	F 
	jr nz,$+67		;62c0	20 41 	  A 
	ld c,(hl)			;62c2	4e 	N 
	ld b,h			;62c3	44 	D 
	jr nz,$+81		;62c4	20 4f 	  O 
	ld d,h			;62c6	54 	T 
	ld c,b			;62c7	48 	H 
	ld b,l			;62c8	45 	E 
	ld d,d			;62c9	52 	R 
	ld d,e			;62ca	53 	S 
	jr nz,$+34		;62cb	20 20 	    
	jr nc,$+55		;62cd	30 35 	0 5 
	dec b			;62cf	05 	. 
	ld bc,0414bh		;62d0	01 4b 41 	. K A 
	ld c,c			;62d3	49 	I 
	jr nz,$+34		;62d4	20 20 	    
	scf			;62d6	37 	7 
	jr nc,$+51		;62d7	30 31 	0 1 
	jr nz,$+34		;62d9	20 20 	    
	jr nz,$+34		;62db	20 20 	    
	ld d,b			;62dd	50 	P 
	ld d,d			;62de	52 	R 
	ld b,l			;62df	45 	E 
	ld c,l			;62e0	4d 	M 
	ld c,a			;62e1	4f 	O 
	ld c,(hl)			;62e2	4e 	N 
	ld c,c			;62e3	49 	I 
	ld d,h			;62e4	54 	T 
	ld c,c			;62e5	49 	I 
	ld c,a			;62e6	4f 	O 
	ld c,(hl)			;62e7	4e 	N 
	jr nz,$+81		;62e8	20 4f 	  O 
	ld b,(hl)			;62ea	46 	F 
	jr nz,$+70		;62eb	20 44 	  D 
	ld b,c			;62ed	41 	A 
	ld c,(hl)			;62ee	4e 	N 
	ld b,a			;62ef	47 	G 
	ld b,l			;62f0	45 	E 
	ld d,d			;62f1	52 	R 
	jr nz,$+34		;62f2	20 20 	    
	jr nz,$+34		;62f4	20 20 	    
	jr nz,$+50		;62f6	20 30 	  0 
	scf			;62f8	37 	7 
	rlca			;62f9	07 	. 
	ld bc,0494ah		;62fa	01 4a 49 	. J I 
	ld c,(hl)			;62fd	4e 	N 
	jr nz,$+34		;62fe	20 20 	    
	ld (hl),035h		;6300	36 35 	6 5 
	ld sp,04e4bh		;6302	31 4b 4e 	1 K N 
	ld c,a			;6305	4f 	O 
	ld d,a			;6306	57 	W 
	ld c,c			;6307	49 	I 
	ld c,(hl)			;6308	4e 	N 
	ld b,a			;6309	47 	G 
	jr nz,$+86		;630a	20 54 	  T 
	ld c,b			;630c	48 	H 
	ld b,l			;630d	45 	E 
	jr nz,$+86		;630e	20 54 	  T 
	ld c,b			;6310	48 	H 
	ld c,a			;6311	4f 	O 
	ld d,l			;6312	55 	U 
	ld b,a			;6313	47 	G 
	ld c,b			;6314	48 	H 
	ld d,h			;6315	54 	T 
	ld d,e			;6316	53 	S 
	jr nz,$+81		;6317	20 4f 	  O 
	ld b,(hl)			;6319	46 	F 
	jr nz,$+81		;631a	20 4f 	  O 
	ld d,h			;631c	54 	T 
	ld c,b			;631d	48 	H 
	ld b,l			;631e	45 	E 
	ld d,d			;631f	52 	R 
	ld d,e			;6320	53 	S 
	jr nc,$+59		;6321	30 39 	0 9 
	add hl,bc			;6323	09 	. 
	inc bc			;6324	03 	. 
	ld d,d			;6325	52 	R 
	ld b,l			;6326	45 	E 
	ld d,h			;6327	54 	T 
	ld d,e			;6328	53 	S 
	ld d,l			;6329	55 	U 
	ld (hl),030h		;632a	36 30 	6 0 
	ld sp,02020h		;632c	31 20 20 	1     
	ld c,l			;632f	4d 	M 
	ld b,c			;6330	41 	A 
	ld d,e			;6331	53 	S 
	ld d,h			;6332	54 	T 
	ld b,l			;6333	45 	E 
	ld d,d			;6334	52 	R 
	ld e,c			;6335	59 	Y 
	jr nz,$+81		;6336	20 4f 	  O 
	ld b,(hl)			;6338	46 	F 
	jr nz,$+86		;6339	20 54 	  T 
	ld c,c			;633b	49 	I 
	ld c,l			;633c	4d 	M 
	ld b,l			;633d	45 	E 
	jr nz,$+67		;633e	20 41 	  A 
	ld c,(hl)			;6340	4e 	N 
	ld b,h			;6341	44 	D 
	jr nz,$+85		;6342	20 53 	  S 
	ld d,b			;6344	50 	P 
	ld b,c			;6345	41 	A 
	ld b,e			;6346	43 	C 
	ld b,l			;6347	45 	E 
	jr nz,$+34		;6348	20 20 	    
	jr nz,$+51		;634a	20 31 	  1 
	ld sp,0820bh		;634c	31 0b 82 	1 . . 
	ld e,d			;634f	5a 	Z 
	ld b,c			;6350	41 	A 
	ld c,c			;6351	49 	I 
	jr nz,$+34		;6352	20 20 	    
	dec (hl)			;6354	35 	5 
	dec (hl)			;6355	35 	5 
	ld sp,04320h		;6356	31 20 43 	1   C 
	ld c,a			;6359	4f 	O 
	ld c,(hl)			;635a	4e 	N 
	ld d,h			;635b	54 	T 
	ld d,d			;635c	52 	R 
	ld c,a			;635d	4f 	O 
	ld c,h			;635e	4c 	L 
	jr nz,$+81		;635f	20 4f 	  O 
	ld b,(hl)			;6361	46 	F 
	jr nz,$+80		;6362	20 4e 	  N 
	ld b,c			;6364	41 	A 
	ld d,h			;6365	54 	T 
	ld d,l			;6366	55 	U 
	ld d,d			;6367	52 	R 
	ld b,l			;6368	45 	E 
	ld d,e			;6369	53 	S 
	jr nz,$+71		;636a	20 45 	  E 
	ld c,h			;636c	4c 	L 
	ld b,l			;636d	45 	E 
	ld c,l			;636e	4d 	M 
	ld b,l			;636f	45 	E 
	ld c,(hl)			;6370	4e 	N 
	ld d,h			;6371	54 	T 
	ld d,e			;6372	53 	S 
	jr nz,$+34		;6373	20 20 	    
	ld sp,00e34h		;6375	31 34 0e 	1 4 . 
	add a,e			;6378	83 	. 
	ld e,d			;6379	5a 	Z 
	ld b,l			;637a	45 	E 
	ld c,(hl)			;637b	4e 	N 
	jr nz,$+34		;637c	20 20 	    
	add hl,sp			;637e	39 	9 
	add hl,sp			;637f	39 	9 
	add hl,sp			;6380	39 	9 
	jr nz,$+34		;6381	20 20 	    
	jr nz,$+34		;6383	20 20 	    
	jr nz,$+34		;6385	20 20 	    
	jr nz,$+34		;6387	20 20 	    
	ld b,l			;6389	45 	E 
	ld c,(hl)			;638a	4e 	N 
	ld c,h			;638b	4c 	L 
	ld c,c			;638c	49 	I 
	ld b,a			;638d	47 	G 
	ld c,b			;638e	48 	H 
	ld d,h			;638f	54 	T 
	ld b,l			;6390	45 	E 
	ld c,(hl)			;6391	4e 	N 
	ld c,l			;6392	4d 	M 
	ld b,l			;6393	45 	E 
	ld c,(hl)			;6394	4e 	N 
	ld d,h			;6395	54 	T 
	jr nz,$+34		;6396	20 20 	    
	jr nz,$+34		;6398	20 20 	    
	jr nz,$+34		;639a	20 20 	    
	jr nz,$+34		;639c	20 20 	    
	jr nz,$+51		;639e	20 31 	  1 
	inc (hl)			;63a0	34 	4 
	ld c,003h		;63a1	0e 03 	. . 
	add hl,hl			;63a3	29 	) 
	ld h,d			;63a4	62 	b 
	ld d,e			;63a5	53 	S 
	ld h,d			;63a6	62 	b 
	ld a,l			;63a7	7d 	} 
	ld h,d			;63a8	62 	b 
	and a			;63a9	a7 	. 
	ld h,d			;63aa	62 	b 
	pop de			;63ab	d1 	. 
	ld h,d			;63ac	62 	b 
	ei			;63ad	fb 	. 
	ld h,d			;63ae	62 	b 
	dec h			;63af	25 	% 
	ld h,e			;63b0	63 	c 
	ld c,a			;63b1	4f 	O 
	ld h,e			;63b2	63 	c 
	ld a,c			;63b3	79 	y 
	ld h,e			;63b4	63 	c 
	ld (de),a			;63b5	12 	. 
	ld c,l			;63b6	4d 	M 
	ld c,c			;63b7	49 	I 
	ld d,e			;63b8	53 	S 
	ld d,e			;63b9	53 	S 
	ld c,c			;63ba	49 	I 
	ld c,a			;63bb	4f 	O 
	ld c,(hl)			;63bc	4e 	N 
	jr nz,$+34		;63bd	20 20 	    
	jr nz,$+68		;63bf	20 42 	  B 
	ld d,d			;63c1	52 	R 
	ld c,c			;63c2	49 	I 
	ld b,l			;63c3	45 	E 
	ld b,(hl)			;63c4	46 	F 
	ld c,c			;63c5	49 	I 
	ld c,(hl)			;63c6	4e 	N 
	ld b,a			;63c7	47 	G 
	rlca			;63c8	07 	. 
	ld c,h			;63c9	4c 	L 
	ld b,l			;63ca	45 	E 
	ld d,(hl)			;63cb	56 	V 
	ld b,l			;63cc	45 	E 
	ld c,h			;63cd	4c 	L 
	jr nz,$+50		;63ce	20 30 	  0 
	ld de,0494bh		;63d0	11 4b 49 	. K I 
	ld c,h			;63d3	4c 	L 
	ld c,h			;63d4	4c 	L 
	jr nz,$+71		;63d5	20 45 	  E 
	ld c,(hl)			;63d7	4e 	N 
	ld b,l			;63d8	45 	E 
	ld c,l			;63d9	4d 	M 
	ld e,c			;63da	59 	Y 
	jr nz,$+73		;63db	20 47 	  G 
	ld d,l			;63dd	55 	U 
	ld b,c			;63de	41 	A 
	ld d,d			;63df	52 	R 
	ld b,h			;63e0	44 	D 
	ld d,e			;63e1	53 	S 
	jr nz,$+71		;63e2	20 45 	  E 
	ld d,e			;63e4	53 	S 
	ld b,e			;63e5	43 	C 
	ld b,c			;63e6	41 	A 
	ld d,b			;63e7	50 	P 
	ld b,l			;63e8	45 	E 
	jr nz,$+72		;63e9	20 46 	  F 
	ld d,d			;63eb	52 	R 
	ld c,a			;63ec	4f 	O 
	ld c,l			;63ed	4d 	M 
	jr nz,$+68		;63ee	20 42 	  B 
	ld d,l			;63f0	55 	U 
	ld c,c			;63f1	49 	I 
	ld c,h			;63f2	4c 	L 
	ld b,h			;63f3	44 	D 
	ld c,c			;63f4	49 	I 
	ld c,(hl)			;63f5	4e 	N 
	ld b,a			;63f6	47 	G 
	jr nz,$+88		;63f7	20 56 	  V 
	ld c,c			;63f9	49 	I 
	ld b,c			;63fa	41 	A 
	jr nz,$+86		;63fb	20 54 	  T 
	ld d,l			;63fd	55 	U 
	ld c,(hl)			;63fe	4e 	N 
	ld c,(hl)			;63ff	4e 	N 
	ld b,l			;6400	45 	E 
	ld c,h			;6401	4c 	L 
	ld d,e			;6402	53 	S 
	ld (01923h),hl		;6403	22 23 19 	" # . 
	ld b,a			;6406	47 	G 
	ld c,a			;6407	4f 	O 
	ld c,a			;6408	4f 	O 
	ld b,h			;6409	44 	D 
	jr nz,$+78		;640a	20 4c 	  L 
	ld d,l			;640c	55 	U 
	ld b,e			;640d	43 	C 
	ld c,e			;640e	4b 	K 
	jr nz,$+81		;640f	20 4f 	  O 
	ld c,(hl)			;6411	4e 	N 
	jr nz,$+91		;6412	20 59 	  Y 
	ld c,a			;6414	4f 	O 
	ld d,l			;6415	55 	U 
	ld d,d			;6416	52 	R 
	jr nz,$+79		;6417	20 4d 	  M 
	ld c,c			;6419	49 	I 
	ld d,e			;641a	53 	S 
	ld d,e			;641b	53 	S 
	ld c,c			;641c	49 	I 
	ld c,a			;641d	4f 	O 
	ld c,(hl)			;641e	4e 	N 
	djnz $+82		;641f	10 50 	. P 
	ld d,d			;6421	52 	R 
	ld b,l			;6422	45 	E 
	ld d,b			;6423	50 	P 
	ld b,c			;6424	41 	A 
	ld d,d			;6425	52 	R 
	ld b,l			;6426	45 	E 
	jr nz,$+86		;6427	20 54 	  T 
	ld c,a			;6429	4f 	O 
	jr nz,$+68		;642a	20 42 	  B 
	ld b,l			;642c	45 	E 
	ld b,a			;642d	47 	G 
	ld c,c			;642e	49 	I 
	ld c,(hl)			;642f	4e 	N 
	rrca			;6430	0f 	. 
	ld c,l			;6431	4d 	M 
	ld c,c			;6432	49 	I 
	ld d,e			;6433	53 	S 
	ld d,e			;6434	53 	S 
	ld c,c			;6435	49 	I 
	ld c,a			;6436	4f 	O 
	ld c,(hl)			;6437	4e 	N 
	jr nz,$+80		;6438	20 4e 	  N 
	ld b,c			;643a	41 	A 
	ld c,l			;643b	4d 	M 
	ld b,l			;643c	45 	E 
	jr nz,$+41		;643d	20 27 	  ' 
	jr nz,$+33		;643f	20 1f 	  . 
	ld b,e			;6441	43 	C 
	ld c,a			;6442	4f 	O 
	ld c,h			;6443	4c 	L 
	ld c,h			;6444	4c 	L 
	ld b,l			;6445	45 	E 
	ld b,e			;6446	43 	C 
	ld d,h			;6447	54 	T 
	jr nz,$+90		;6448	20 58 	  X 
	ld e,b			;644a	58 	X 
	jr nz,$+82		;644b	20 50 	  P 
	ld c,c			;644d	49 	I 
	ld b,l			;644e	45 	E 
	ld b,e			;644f	43 	C 
	ld b,l			;6450	45 	E 
	ld d,e			;6451	53 	S 
	jr nz,$+81		;6452	20 4f 	  O 
	ld b,(hl)			;6454	46 	F 
	jr nz,$+82		;6455	20 50 	  P 
	ld b,c			;6457	41 	A 
	ld d,b			;6458	50 	P 
	ld b,l			;6459	45 	E 
	ld d,d			;645a	52 	R 
	jr nz,$+86		;645b	20 54 	  T 
	ld b,c			;645d	41 	A 
	ld d,b			;645e	50 	P 
	ld b,l			;645f	45 	E 
	ld e,049h		;6460	1e 49 	. I 
	ld c,(hl)			;6462	4e 	N 
	ld d,e			;6463	53 	S 
	ld b,l			;6464	45 	E 
	ld d,d			;6465	52 	R 
	ld d,h			;6466	54 	T 
	jr nz,$+86		;6467	20 54 	  T 
	ld b,c			;6469	41 	A 
	ld d,b			;646a	50 	P 
	ld b,l			;646b	45 	E 
	jr nz,$+75		;646c	20 49 	  I 
	ld c,(hl)			;646e	4e 	N 
	jr nz,$+79		;646f	20 4d 	  M 
	ld c,c			;6471	49 	I 
	ld d,e			;6472	53 	S 
	ld d,e			;6473	53 	S 
	ld c,c			;6474	49 	I 
	ld c,h			;6475	4c 	L 
	ld b,l			;6476	45 	E 
	jr nz,$+69		;6477	20 43 	  C 
	ld c,a			;6479	4f 	O 
	ld c,(hl)			;647a	4e 	N 
	ld d,e			;647b	53 	S 
	ld c,a			;647c	4f 	O 
	ld c,h			;647d	4c 	L 
	ld b,l			;647e	45 	E 
	add hl,de			;647f	19 	. 
	ld b,h			;6480	44 	D 
	ld c,c			;6481	49 	I 
	ld d,e			;6482	53 	S 
	ld b,c			;6483	41 	A 
	ld b,d			;6484	42 	B 
	ld c,h			;6485	4c 	L 
	ld b,l			;6486	45 	E 
	jr nz,$+71		;6487	20 45 	  E 
	ld c,h			;6489	4c 	L 
	ld b,l			;648a	45 	E 
	ld b,e			;648b	43 	C 
	ld d,h			;648c	54 	T 
	ld d,d			;648d	52 	R 
	ld c,c			;648e	49 	I 
	ld b,(hl)			;648f	46 	F 
	ld c,c			;6490	49 	I 
	ld b,l			;6491	45 	E 
	ld b,h			;6492	44 	D 
	jr nz,$+72		;6493	20 46 	  F 
	ld b,l			;6495	45 	E 
	ld c,(hl)			;6496	4e 	N 
	ld b,e			;6497	43 	C 
	ld b,l			;6498	45 	E 
	jr nz,$+85		;6499	20 53 	  S 
	ld c,l			;649b	4d 	M 
	ld b,c			;649c	41 	A 
	ld d,e			;649d	53 	S 
	ld c,b			;649e	48 	H 
	jr nz,$+86		;649f	20 54 	  T 
	ld c,b			;64a1	48 	H 
	ld d,d			;64a2	52 	R 
	ld c,a			;64a3	4f 	O 
	ld d,l			;64a4	55 	U 
	ld b,a			;64a5	47 	G 
	ld c,b			;64a6	48 	H 
	jr nz,$+72		;64a7	20 46 	  F 
	ld b,l			;64a9	45 	E 
	ld c,(hl)			;64aa	4e 	N 
	ld b,e			;64ab	43 	C 
	ld b,l			;64ac	45 	E 
	jr nz,$+81		;64ad	20 4f 	  O 
	ld c,(hl)			;64af	4e 	N 
	jr nz,$+79		;64b0	20 4d 	  M 
	ld c,a			;64b2	4f 	O 
	ld d,h			;64b3	54 	T 
	ld c,a			;64b4	4f 	O 
	ld d,d			;64b5	52 	R 
	ld b,d			;64b6	42 	B 
	ld c,c			;64b7	49 	I 
	ld c,e			;64b8	4b 	K 
	ld b,l			;64b9	45 	E 
	rrca			;64ba	0f 	. 
	ld b,e			;64bb	43 	C 
	ld c,a			;64bc	4f 	O 
	ld c,(hl)			;64bd	4e 	N 
	ld b,a			;64be	47 	G 
	ld d,d			;64bf	52 	R 
	ld b,c			;64c0	41 	A 
	ld d,h			;64c1	54 	T 
	ld d,l			;64c2	55 	U 
	ld c,h			;64c3	4c 	L 
	ld b,c			;64c4	41 	A 
	ld d,h			;64c5	54 	T 
	ld c,c			;64c6	49 	I 
	ld c,a			;64c7	4f 	O 
	ld c,(hl)			;64c8	4e 	N 
	ld d,e			;64c9	53 	S 
	ld (de),a			;64ca	12 	. 
	ld e,c			;64cb	59 	Y 
	ld c,a			;64cc	4f 	O 
	ld d,l			;64cd	55 	U 
	jr nz,$+67		;64ce	20 41 	  A 
	ld d,d			;64d0	52 	R 
	ld b,l			;64d1	45 	E 
	jr nz,$+80		;64d2	20 4e 	  N 
	ld c,a			;64d4	4f 	O 
	ld d,a			;64d5	57 	W 
	jr nz,$+67		;64d6	20 41 	  A 
	jr nz,$+86		;64d8	20 54 	  T 
	ld d,d			;64da	52 	R 
	ld d,l			;64db	55 	U 
	ld b,l			;64dc	45 	E 
	ld c,04eh		;64dd	0e 4e 	. N 
	ld c,c			;64df	49 	I 
	ld c,(hl)			;64e0	4e 	N 
	ld c,d			;64e1	4a 	J 
	ld b,c			;64e2	41 	A 
	jr nz,$+85		;64e3	20 53 	  S 
	ld b,c			;64e5	41 	A 
	ld b,d			;64e6	42 	B 
	ld c,a			;64e7	4f 	O 
	ld d,h			;64e8	54 	T 
	ld b,l			;64e9	45 	E 
	ld d,l			;64ea	55 	U 
	ld d,d			;64eb	52 	R 
	rrca			;64ec	0f 	. 
	ld b,l			;64ed	45 	E 
	ld c,(hl)			;64ee	4e 	N 
	ld d,h			;64ef	54 	T 
	ld b,l			;64f0	45 	E 
	ld d,d			;64f1	52 	R 
	jr nz,$+91		;64f2	20 59 	  Y 
	ld c,a			;64f4	4f 	O 
	ld d,l			;64f5	55 	U 
	ld d,d			;64f6	52 	R 
	jr nz,$+80		;64f7	20 4e 	  N 
	ld b,c			;64f9	41 	A 
	ld c,l			;64fa	4d 	M 
	ld b,l			;64fb	45 	E 
	dec bc			;64fc	0b 	. 
	ld c,b			;64fd	48 	H 
	ld c,c			;64fe	49 	I 
	ld b,a			;64ff	47 	G 
	ld c,b			;6500	48 	H 
	jr nz,$+85		;6501	20 53 	  S 
	ld b,e			;6503	43 	C 
	ld c,a			;6504	4f 	O 
	ld d,d			;6505	52 	R 
	ld b,l			;6506	45 	E 
	ld d,e			;6507	53 	S 
	jr nc,$+50		;6508	30 30 	0 0 
	ld sp,03030h		;650a	31 30 30 	1 0 0 
	jr nc,$+34		;650d	30 20 	0   
	ld b,e			;650f	43 	C 
	ld c,h			;6510	4c 	L 
	ld c,c			;6511	49 	I 
	ld d,(hl)			;6512	56 	V 
	ld b,l			;6513	45 	E 
	jr nz,$+34		;6514	20 20 	    
	jr nz,$+34		;6516	20 20 	    
	jr nz,$+50		;6518	20 30 	  0 
	jr nc,$+50		;651a	30 30 	0 0 
	ld sp,03034h		;651c	31 34 30 	1 4 0 
	ld c,(hl)			;651f	4e 	N 
	ld c,c			;6520	49 	I 
	ld c,(hl)			;6521	4e 	N 
	ld b,c			;6522	41 	A 
	jr nz,$+76		;6523	20 4a 	  J 
	ld b,c			;6525	41 	A 
	ld c,(hl)			;6526	4e 	N 
	ld b,l			;6527	45 	E 
	jr nz,$+34		;6528	20 20 	    
	jr nc,$+50		;652a	30 30 	0 0 
	jr nc,$+51		;652c	30 31 	0 1 
	inc sp			;652e	33 	3 
	jr nc,$+89		;652f	30 57 	0 W 
	jr nz,$+84		;6531	20 52 	  R 
	ld d,l			;6533	55 	U 
	ld d,e			;6534	53 	S 
	ld d,e			;6535	53 	S 
	ld b,l			;6536	45 	E 
	ld c,h			;6537	4c 	L 
	jr nz,$+68		;6538	20 42 	  B 
	jr nz,$+50		;653a	20 30 	  0 
	jr nc,$+50		;653c	30 30 	0 0 
	ld sp,03032h		;653e	31 32 30 	1 2 0 
	ld c,l			;6541	4d 	M 
	ld c,c			;6542	49 	I 
	ld b,e			;6543	43 	C 
	ld c,e			;6544	4b 	K 
	ld e,c			;6545	59 	Y 
	ld hl,0494ch		;6546	21 4c 49 	! L I 
	ld d,e			;6549	53 	S 
	ld b,c			;654a	41 	A 
	jr nz,$+50		;654b	20 30 	  0 
	jr nc,$+50		;654d	30 30 	0 0 
	ld sp,03031h		;654f	31 31 30 	1 1 0 
	ld c,h			;6552	4c 	L 
	ld b,l			;6553	45 	E 
	ld b,l			;6554	45 	E 
	jr nz,$+34		;6555	20 20 	    
	jr nz,$+34		;6557	20 20 	    
	jr nz,$+34		;6559	20 20 	    
	jr nz,$+34		;655b	20 20 	    
	jr nc,$+50		;655d	30 30 	0 0 
	jr nc,$+51		;655f	30 31 	0 1 
	jr nc,$+50		;6561	30 30 	0 0 
	ld b,h			;6563	44 	D 
	ld b,c			;6564	41 	A 
	ld d,d			;6565	52 	R 
	ld d,d			;6566	52 	R 
	ld b,l			;6567	45 	E 
	ld c,(hl)			;6568	4e 	N 
	jr nz,$+34		;6569	20 20 	    
	jr nz,$+34		;656b	20 20 	    
	jr nz,$+50		;656d	20 30 	  0 
	jr nc,$+50		;656f	30 30 	0 0 
	jr nc,$+59		;6571	30 39 	0 9 
	jr nc,$+80		;6573	30 4e 	0 N 
	ld c,a			;6575	4f 	O 
	ld b,l			;6576	45 	E 
	ld c,h			;6577	4c 	L 
	jr nz,$+34		;6578	20 20 	    
	jr nz,$+34		;657a	20 20 	    
	jr nz,$+34		;657c	20 20 	    
	jr nz,$+50		;657e	20 30 	  0 
	jr nc,$+50		;6580	30 30 	0 0 
	jr nc,$+58		;6582	30 38 	0 8 
	jr nc,$+68		;6584	30 42 	0 B 
	ld d,d			;6586	52 	R 
	ld b,c			;6587	41 	A 
	ld b,h			;6588	44 	D 
	jr nz,$+34		;6589	20 20 	    
	jr nz,$+34		;658b	20 20 	    
	jr nz,$+34		;658d	20 20 	    
	jr nz,$+50		;658f	20 30 	  0 
	jr nc,$+50		;6591	30 30 	0 0 
	jr nc,$+57		;6593	30 37 	0 7 
	jr nc,$+80		;6595	30 4e 	0 N 
	ld c,c			;6597	49 	I 
	ld b,e			;6598	43 	C 
	ld c,e			;6599	4b 	K 
	ld e,c			;659a	59 	Y 
	jr nz,$+34		;659b	20 20 	    
	jr nz,$+34		;659d	20 20 	    
	jr nz,$+34		;659f	20 20 	    
	jr nc,$+50		;65a1	30 30 	0 0 
	jr nc,$+50		;65a3	30 30 	0 0 
	ld (hl),030h		;65a5	36 30 	6 0 
	ld c,d			;65a7	4a 	J 
	ld d,l			;65a8	55 	U 
	ld d,e			;65a9	53 	S 
	ld d,h			;65aa	54 	T 
	ld c,c			;65ab	49 	I 
	ld c,(hl)			;65ac	4e 	N 
	jr nz,$+34		;65ad	20 20 	    
	jr nz,$+34		;65af	20 20 	    
	jr nz,$+50		;65b1	20 30 	  0 
	jr nc,$+50		;65b3	30 30 	0 0 
	jr nc,$+55		;65b5	30 35 	0 5 
	jr nc,$+69		;65b7	30 43 	0 C 
	ld c,h			;65b9	4c 	L 
	ld b,c			;65ba	41 	A 
	ld c,c			;65bb	49 	I 
	ld d,d			;65bc	52 	R 
	ld b,l			;65bd	45 	E 
	jr nz,$+34		;65be	20 20 	    
	jr nz,$+34		;65c0	20 20 	    
	jr nz,$+50		;65c2	20 30 	  0 
	jr nc,$+50		;65c4	30 30 	0 0 
	jr nc,$+54		;65c6	30 34 	0 4 
	jr nc,$+76		;65c8	30 4a 	0 J 
	ld c,a			;65ca	4f 	O 
	ld b,l			;65cb	45 	E 
	jr nz,$+86		;65cc	20 54 	  T 
	ld b,c			;65ce	41 	A 
	ld d,d			;65cf	52 	R 
	ld b,c			;65d0	41 	A 
	ld c,a			;65d1	4f 	O 
	jr nz,$+34		;65d2	20 20 	    
	jr nc,$+50		;65d4	30 30 	0 0 
	jr nc,$+50		;65d6	30 30 	0 0 
	inc sp			;65d8	33 	3 
	jr nc,$+67		;65d9	30 41 	0 A 
	ld c,h			;65db	4c 	L 
	ld b,c			;65dc	41 	A 
	ld c,(hl)			;65dd	4e 	N 
	jr nz,$+34		;65de	20 20 	    
	jr nz,$+34		;65e0	20 20 	    
	jr nz,$+34		;65e2	20 20 	    
	jr nz,$+50		;65e4	20 30 	  0 
	jr nc,$+50		;65e6	30 30 	0 0 
	jr nc,$+52		;65e8	30 32 	0 2 
	jr nc,$+84		;65ea	30 52 	0 R 
	ld c,c			;65ec	49 	I 
	ld b,e			;65ed	43 	C 
	ld c,b			;65ee	48 	H 
	jr nz,$+34		;65ef	20 20 	    
	jr nz,$+34		;65f1	20 20 	    
	jr nz,$+34		;65f3	20 20 	    
	jr nz,$+50		;65f5	20 30 	  0 
	jr nc,$+50		;65f7	30 30 	0 0 
	jr nc,$+51		;65f9	30 31 	0 1 
	jr nc,$+70		;65fb	30 44 	0 D 
	ld c,c			;65fd	49 	I 
	ld d,(hl)			;65fe	56 	V 
	jr nz,$+34		;65ff	20 20 	    
	jr nz,$+34		;6601	20 20 	    
	jr nz,$+34		;6603	20 20 	    
	jr nz,$+34		;6605	20 20 	    
	ld d,e			;6607	53 	S 
	ld d,b			;6608	50 	P 
	ld b,c			;6609	41 	A 
	ld d,d			;660a	52 	R 
	ld b,l			;660b	45 	E 
	jr nz,$+85		;660c	20 53 	  S 
	ld b,e			;660e	43 	C 
	ld c,a			;660f	4f 	O 
	ld d,d			;6610	52 	R 
	ld b,l			;6611	45 	E 
	dec hl			;6612	2b 	+ 
	ld c,(hl)			;6613	4e 	N 
	ld b,c			;6614	41 	A 
	ld c,l			;6615	4d 	M 
	ld b,l			;6616	45 	E 
	jr nz,$+50		;6617	20 30 	  0 
	jr nz,$+80		;6619	20 4e 	  N 
	ex af,af'			;661b	08 	. 
	ld de,00e04h		;661c	11 04 0e 	. . . 
	ld de,0fb0eh		;661f	11 0e fb 	. . . 
	adc a,b			;6622	88 	. 
	dec b			;6623	05 	. 
	ld h,d			;6624	62 	b 
	inc b			;6625	04 	. 
	add hl,bc			;6626	09 	. 
	inc c			;6627	0c 	. 
	ld (de),a			;6628	12 	. 
	inc b			;6629	04 	. 
	and e			;662a	a3 	. 
	ld c,000h		;662b	0e 00 	. . 
	ld bc,0ffbfh		;662d	01 bf ff 	. . . 
	ld (bc),a			;6630	02 	. 
	ret pe			;6631	e8 	. 
	ret z			;6632	c8 	. 
	ret po			;6633	e0 	. 
	dec a			;6634	3d 	= 
	inc bc			;6635	03 	. 
	ld (de),a			;6636	12 	. 
	inc bc			;6637	03 	. 
	inc b			;6638	04 	. 
	jp po,013a2h		;6639	e2 a2 13 	. . . 
	dec sp			;663c	3b 	; 
	dec b			;663d	05 	. 
	ld b,0ffh		;663e	06 ff 	. . 
	rlca			;6640	07 	. 
	add a,a			;6641	87 	. 
	ret po			;6642	e0 	. 
	cp (hl)			;6643	be 	. 
	push af			;6644	f5 	. 
	dec b			;6645	05 	. 
	xor 0e8h		;6646	ee e8 	. . 
	ld a,(bc)			;6648	0a 	. 
	ld l,a			;6649	6f 	o 
	rrca			;664a	0f 	. 
	ex de,hl			;664b	eb 	. 
	ei			;664c	fb 	. 
	dec b			;664d	05 	. 
	sbc a,d			;664e	9a 	. 
	rst 28h			;664f	ef 	. 
	dec bc			;6650	0b 	. 
	rst 38h			;6651	ff 	. 
	nop			;6652	00 	. 
	ld e,e			;6653	5b 	[ 
	djnz $+41		;6654	10 27 	. ' 
	ld c,b			;6656	48 	H 
	ld d,b			;6657	50 	P 
	ld d,b			;6658	50 	P 
	ld d,b			;6659	50 	P 
	rrca			;665a	0f 	. 
	jp m,0fdebh		;665b	fa eb fd 	. . . 
	cp 058h		;665e	fe 58 	. X 
	rrca			;6660	0f 	. 
	nop			;6661	00 	. 
	ret p			;6662	f0 	. 
	ex af,af'			;6663	08 	. 
	call po,00a12h		;6664	e4 12 0a 	. . . 
	adc a,c			;6667	89 	. 
	rrca			;6668	0f 	. 
	ld d,b			;6669	50 	P 
	ld h,d			;666a	62 	b 
	rrca			;666b	0f 	. 
	ld a,(bc)			;666c	0a 	. 
	ld e,a			;666d	5f 	_ 
	call c,0489fh		;666e	dc 9f 48 	. . H 
	daa			;6671	27 	' 
	djnz $-65		;6672	10 bd 	. . 
	ret m			;6674	f8 	. 
	defb 0fdh,0ffh,0a0h	;illegal sequence		;6675	fd ff a0 	. . . 
	ret m			;6678	f8 	. 
	jp z,0123ah		;6679	ca 3a 12 	. : . 
	call po,0f008h		;667c	e4 08 f0 	. . . 
	call c,0a041h		;667f	dc 41 a0 	. A . 
	ld (de),a			;6682	12 	. 
	dec c			;6683	0d 	. 
	in a,(032h)		;6684	db 32 	. 2 
	add hl,hl			;6686	29 	) 
	inc h			;6687	24 	$ 
	jr nz,$+4		;6688	20 02 	  . 
	nop			;668a	00 	. 
	jr nc,$+66		;668b	30 40 	0 @ 
	ld b,(hl)			;668d	46 	F 
	ret z			;668e	c8 	. 
	or b			;668f	b0 	. 
	sbc a,(hl)			;6690	9e 	. 
	jr z,$+4		;6691	28 02 	( . 
	djnz $+27		;6693	10 19 	. . 
	pop af			;6695	f1 	. 
	inc sp			;6696	33 	3 
	cpl			;6697	2f 	/ 
	ld b,d			;6698	42 	B 
	ld b,d			;6699	42 	B 
	inc b			;669a	04 	. 
	ld (0281eh),hl		;669b	22 1e 28 	" . ( 
	sbc a,b			;669e	98 	. 
	ret c			;669f	d8 	. 
	ld h,h			;66a0	64 	d 
	ld b,h			;66a1	44 	D 
	ld (05a20h),hl		;66a2	22 20 5a 	"   Z 
	ld a,048h		;66a5	3e 48 	> H 
	ex af,af'			;66a7	08 	. 
	djnz $+126		;66a8	10 7c 	. | 
	ld (de),a			;66aa	12 	. 
	jr nc,$+5		;66ab	30 03 	0 . 
	ex af,af'			;66ad	08 	. 
	ld hl,(0b01ch)		;66ae	2a 1c b0 	* . . 
	ret po			;66b1	e0 	. 
	sub d			;66b2	92 	. 
	ld c,h			;66b3	4c 	L 
	jr $-104		;66b4	18 96 	. . 
	and a			;66b6	a7 	. 
	ld (04724h),hl		;66b7	22 24 47 	" $ G 
	call z,0926ah		;66ba	cc 6a 92 	. j . 
	djnz $+39		;66bd	10 25 	. % 
	rst 20h			;66bf	e7 	. 
	ld d,l			;66c0	55 	U 
	ld e,l			;66c1	5d 	] 
	dec hl			;66c2	2b 	+ 
	jp po,04422h		;66c3	e2 22 44 	. " D 
	nop			;66c6	00 	. 
	rst 28h			;66c7	ef 	. 
	ld e,038h		;66c8	1e 38 	. 8 
	adc a,a			;66ca	8f 	. 
	ld l,e			;66cb	6b 	k 
	sbc a,l			;66cc	9d 	. 
	ld a,b			;66cd	78 	x 
	sub a			;66ce	97 	. 
	sla c		;66cf	cb 21 	. ! 
	ld (017fah),hl		;66d1	22 fa 17 	" . . 
	ld (de),a			;66d4	12 	. 
	ld (0f200h),hl		;66d5	22 00 f2 	" . . 
	rst 28h			;66d8	ef 	. 
	cp 025h		;66d9	fe 25 	. % 
	rrca			;66db	0f 	. 
	rst 38h			;66dc	ff 	. 
	or l			;66dd	b5 	. 
	ld a,(bc)			;66de	0a 	. 
	ld d,l			;66df	55 	U 
	ld e,b			;66e0	58 	X 
	inc b			;66e1	04 	. 
	ld c,b			;66e2	48 	H 
	ld b,l			;66e3	45 	E 
	ld c,h			;66e4	4c 	L 
	ld b,h			;66e5	44 	D 
	dec b			;66e6	05 	. 
	ld d,h			;66e7	54 	T 
	ld c,c			;66e8	49 	I 
	ld c,l			;66e9	4d 	M 
	ld b,l			;66ea	45 	E 
	ld d,d			;66eb	52 	R 
	inc b			;66ec	04 	. 
	ld c,(hl)			;66ed	4e 	N 
	ld b,l			;66ee	45 	E 
	ld b,c			;66ef	41 	A 
	ld d,d			;66f0	52 	R 
	jr nz,$+82		;66f1	20 50 	  P 
	ld b,c			;66f3	41 	A 
	ld e,c			;66f4	59 	Y 
	jr nz,$+38		;66f5	20 24 	  $ 
	jr nc,$+50		;66f7	30 30 	0 0 
	jr nc,$+50		;66f9	30 30 	0 0 
	jr nc,$+50		;66fb	30 30 	0 0 
	jr nc,$+34		;66fd	30 20 	0   
	ld e,b			;66ff	58 	X 
	ld e,b			;6700	58 	X 
	ld e,b			;6701	58 	X 
	ld e,b			;6702	58 	X 
	ld e,b			;6703	58 	X 
	ld e,b			;6704	58 	X 
	ld e,b			;6705	58 	X 
	ld e,b			;6706	58 	X 
	ld e,b			;6707	58 	X 
	ld e,b			;6708	58 	X 
	ld e,b			;6709	58 	X 
	ld b,b			;670a	40 	@ 
	ld c,h			;670b	4c 	L 
	ld b,l			;670c	45 	E 
	ld d,(hl)			;670d	56 	V 
	ld b,l			;670e	45 	E 
	ld c,h			;670f	4c 	L 
	ld b,b			;6710	40 	@ 
	ld e,b			;6711	58 	X 
	ld b,b			;6712	40 	@ 
	ld c,h			;6713	4c 	L 
	ld c,c			;6714	49 	I 
	ld b,(hl)			;6715	46 	F 
	ld d,h			;6716	54 	T 
	ld b,b			;6717	40 	@ 
	ld b,l			;6718	45 	E 
	ld e,b			;6719	58 	X 
	ld b,e			;671a	43 	C 
	ld b,l			;671b	45 	E 
	ld c,h			;671c	4c 	L 
	ld c,h			;671d	4c 	L 
	ld b,l			;671e	45 	E 
	ld c,(hl)			;671f	4e 	N 
	ld d,h			;6720	54 	T 
	ld b,b			;6721	40 	@ 
	ld b,b			;6722	40 	@ 
	ld d,(hl)			;6723	56 	V 
	ld b,c			;6724	41 	A 
	ld c,h			;6725	4c 	L 
	ld d,l			;6726	55 	U 
	ld b,l			;6727	45 	E 
	ld b,b			;6728	40 	@ 
	ld e,c			;6729	59 	Y 
	ld c,a			;672a	4f 	O 
	ld d,l			;672b	55 	U 
	ld b,b			;672c	40 	@ 
	ld c,b			;672d	48 	H 
	ld b,c			;672e	41 	A 
	ld d,(hl)			;672f	56 	V 
	ld b,l			;6730	45 	E 
	ld b,b			;6731	40 	@ 
	ld b,l			;6732	45 	E 
	ld d,e			;6733	53 	S 
	ld b,e			;6734	43 	C 
	ld b,c			;6735	41 	A 
	ld d,b			;6736	50 	P 
	ld b,l			;6737	45 	E 
	ld b,h			;6738	44 	D 
	ld b,b			;6739	40 	@ 
	ld c,l			;673a	4d 	M 
	ld c,c			;673b	49 	I 
	ld d,e			;673c	53 	S 
	ld d,e			;673d	53 	S 
	ld c,c			;673e	49 	I 
	ld c,a			;673f	4f 	O 
	ld c,(hl)			;6740	4e 	N 
	ld b,b			;6741	40 	@ 
	ld d,h			;6742	54 	T 
	ld b,l			;6743	45 	E 
	ld d,d			;6744	52 	R 
	ld c,l			;6745	4d 	M 
	ld c,c			;6746	49 	I 
	ld c,(hl)			;6747	4e 	N 
	ld b,c			;6748	41 	A 
	ld d,h			;6749	54 	T 
	ld b,l			;674a	45 	E 
	ld b,h			;674b	44 	D 
	ld b,b			;674c	40 	@ 
	ld b,b			;674d	40 	@ 
	ld c,l			;674e	4d 	M 
	ld c,c			;674f	49 	I 
	ld d,e			;6750	53 	S 
	ld d,e			;6751	53 	S 
	ld c,c			;6752	49 	I 
	ld c,a			;6753	4f 	O 
	ld c,(hl)			;6754	4e 	N 
	ld b,b			;6755	40 	@ 
	ld b,b			;6756	40 	@ 
	ld b,(hl)			;6757	46 	F 
	ld b,c			;6758	41 	A 
	ld c,c			;6759	49 	I 
	ld c,h			;675a	4c 	L 
	ld d,l			;675b	55 	U 
	ld d,d			;675c	52 	R 
	ld b,l			;675d	45 	E 
	ld b,b			;675e	40 	@ 
	ld b,b			;675f	40 	@ 
	ld d,e			;6760	53 	S 
	ld d,h			;6761	54 	T 
	ld b,c			;6762	41 	A 
	ld d,e			;6763	53 	S 
	ld c,b			;6764	48 	H 
	jr nz,$+85		;6765	20 53 	  S 
	ld b,l			;6767	45 	E 
	ld b,c			;6768	41 	A 
	ld d,d			;6769	52 	R 
	ld b,e			;676a	43 	C 
	ld c,b			;676b	48 	H 
	ld b,l			;676c	45 	E 
	ld b,h			;676d	44 	D 
	ld b,e			;676e	43 	C 
	ld c,a			;676f	4f 	O 
	ld b,h			;6770	44 	D 
	ld b,l			;6771	45 	E 
	jr nz,$+34		;6772	20 20 	    
	ld b,c			;6774	41 	A 
	ld b,e			;6775	43 	C 
	ld b,e			;6776	43 	C 
	ld b,l			;6777	45 	E 
	ld d,b			;6778	50 	P 
	ld d,h			;6779	54 	T 
	ld b,l			;677a	45 	E 
	ld b,h			;677b	44 	D 
	ld b,e			;677c	43 	C 
	ld c,a			;677d	4f 	O 
	ld b,h			;677e	44 	D 
	ld b,l			;677f	45 	E 
	jr nz,$+34		;6780	20 20 	    
	ld d,d			;6782	52 	R 
	ld b,l			;6783	45 	E 
	ld c,d			;6784	4a 	J 
	ld b,l			;6785	45 	E 
	ld b,e			;6786	43 	C 
	ld d,h			;6787	54 	T 
	ld b,l			;6788	45 	E 
	ld b,h			;6789	44 	D 
	ld d,h			;678a	54 	T 
	ld c,c			;678b	49 	I 
	ld c,l			;678c	4d 	M 
	ld b,l			;678d	45 	E 
	jr nz,$+75		;678e	20 49 	  I 
	ld d,e			;6790	53 	S 
	jr nz,$+85		;6791	20 53 	  S 
	ld c,b			;6793	48 	H 
	ld c,a			;6794	4f 	O 
	ld d,d			;6795	52 	R 
	ld d,h			;6796	54 	T 
	jr nz,$+69		;6797	20 43 	  C 
	ld c,a			;6799	4f 	O 
	ld b,h			;679a	44 	D 
	ld b,l			;679b	45 	E 
	jr nz,$+34		;679c	20 20 	    
	ld c,(hl)			;679e	4e 	N 
	ld b,l			;679f	45 	E 
	ld b,l			;67a0	45 	E 
	ld b,h			;67a1	44 	D 
	ld b,l			;67a2	45 	E 
	ld b,h			;67a3	44 	D 
	jr nz,$+78		;67a4	20 4c 	  L 
	ld c,c			;67a6	49 	I 
	ld b,(hl)			;67a7	46 	F 
	ld d,h			;67a8	54 	T 
	jr nz,$+75		;67a9	20 49 	  I 
	ld d,e			;67ab	53 	S 
	jr nz,$+70		;67ac	20 44 	  D 
	ld c,a			;67ae	4f 	O 
	ld d,a			;67af	57 	W 
	ld c,(hl)			;67b0	4e 	N 
	jr nz,$+34		;67b1	20 20 	    
	ld c,h			;67b3	4c 	L 
	ld c,c			;67b4	49 	I 
	ld b,(hl)			;67b5	46 	F 
	ld d,h			;67b6	54 	T 
	jr nz,$+75		;67b7	20 49 	  I 
	ld d,e			;67b9	53 	S 
	jr nz,$+87		;67ba	20 55 	  U 
	ld d,b			;67bc	50 	P 
	jr nz,$+34		;67bd	20 20 	    
	ld b,(hl)			;67bf	46 	F 
	ld b,l			;67c0	45 	E 
	ld c,(hl)			;67c1	4e 	N 
	ld b,e			;67c2	43 	C 
	ld b,l			;67c3	45 	E 
	jr nz,$+75		;67c4	20 49 	  I 
	ld d,e			;67c6	53 	S 
	jr nz,$+81		;67c7	20 4f 	  O 
	ld c,(hl)			;67c9	4e 	N 
	jr nz,$+72		;67ca	20 46 	  F 
	ld b,l			;67cc	45 	E 
	ld c,(hl)			;67cd	4e 	N 
	ld b,e			;67ce	43 	C 
	ld b,l			;67cf	45 	E 
	jr nz,$+75		;67d0	20 49 	  I 
	ld d,e			;67d2	53 	S 
	jr nz,$+81		;67d3	20 4f 	  O 
	ld b,(hl)			;67d5	46 	F 
	ld b,(hl)			;67d6	46 	F 
	jr nz,$+68		;67d7	20 42 	  B 
	ld c,c			;67d9	49 	I 
	ld c,e			;67da	4b 	K 
	ld b,l			;67db	45 	E 
	jr nz,$+67		;67dc	20 41 	  A 
	ld d,d			;67de	52 	R 
	ld d,d			;67df	52 	R 
	ld c,c			;67e0	49 	I 
	ld d,(hl)			;67e1	56 	V 
	ld b,l			;67e2	45 	E 
	ld b,h			;67e3	44 	D 
	jr nz,$+79		;67e4	20 4d 	  M 
	ld c,c			;67e6	49 	I 
	ld d,e			;67e7	53 	S 
	ld d,e			;67e8	53 	S 
	ld c,c			;67e9	49 	I 
	ld c,a			;67ea	4f 	O 
	ld c,(hl)			;67eb	4e 	N 
	jr nz,$+90		;67ec	20 58 	  X 
	jr nz,$+85		;67ee	20 53 	  S 
	ld b,l			;67f0	45 	E 
	ld c,h			;67f1	4c 	L 
	ld b,l			;67f2	45 	E 
	ld b,e			;67f3	43 	C 
	ld d,h			;67f4	54 	T 
	ld b,l			;67f5	45 	E 
	ld b,h			;67f6	44 	D 
	inc c			;67f7	0c 	. 
	ld c,l			;67f8	4d 	M 
	ld c,c			;67f9	49 	I 
	ld d,e			;67fa	53 	S 
	ld d,e			;67fb	53 	S 
	ld c,c			;67fc	49 	I 
	ld c,a			;67fd	4f 	O 
	ld c,(hl)			;67fe	4e 	N 
	jr nz,$+69		;67ff	20 43 	  C 
	ld c,a			;6801	4f 	O 
	ld b,h			;6802	44 	D 
	ld b,l			;6803	45 	E 
	ld c,04eh		;6804	0e 4e 	. N 
	ld c,a			;6806	4f 	O 
	ld d,h			;6807	54 	T 
	jr nz,$+84		;6808	20 52 	  R 
	ld b,l			;680a	45 	E 
	ld b,e			;680b	43 	C 
	ld c,a			;680c	4f 	O 
	ld b,a			;680d	47 	G 
	ld c,(hl)			;680e	4e 	N 
	ld c,c			;680f	49 	I 
	ld d,e			;6810	53 	S 
	ld b,l			;6811	45 	E 
	ld b,h			;6812	44 	D 
	ld d,e			;6813	53 	S 
	ld b,c			;6814	41 	A 
	ld d,h			;6815	54 	T 
	ld c,a			;6816	4f 	O 
	ld d,d			;6817	52 	R 
	ld c,c			;6818	49 	I 
	jr nz,$+34		;6819	20 20 	    
	jr nz,$+34		;681b	20 20 	    
	jr nz,$+70		;681d	20 44 	  D 
	ld c,c			;681f	49 	I 
	ld c,l			;6820	4d 	M 
	jr nz,$+79		;6821	20 4d 	  M 
	ld b,c			;6823	41 	A 
	ld c,e			;6824	4b 	K 
	jr nz,$+34		;6825	20 20 	    
	jr nz,$+34		;6827	20 20 	    
	ld c,l			;6829	4d 	M 
	ld c,c			;682a	49 	I 
	jr nz,$+78		;682b	20 4c 	  L 
	ld d,l			;682d	55 	U 
	jr nz,$+77		;682e	20 4b 	  K 
	ld b,c			;6830	41 	A 
	ld d,h			;6831	54 	T 
	ld b,c			;6832	41 	A 
	jr nz,$+73		;6833	20 47 	  G 
	ld b,l			;6835	45 	E 
	ld c,(hl)			;6836	4e 	N 
	ld c,c			;6837	49 	I 
	ld c,(hl)			;6838	4e 	N 
	jr nz,$+34		;6839	20 20 	    
	jr nz,$+34		;683b	20 20 	    
	jr nz,$+34		;683d	20 20 	    
	ld d,e			;683f	53 	S 
	ld b,c			;6840	41 	A 
	ld c,c			;6841	49 	I 
	ld c,l			;6842	4d 	M 
	ld b,l			;6843	45 	E 
	ld c,(hl)			;6844	4e 	N 
	ld c,d			;6845	4a 	J 
	ld c,c			;6846	49 	I 
	ld d,h			;6847	54 	T 
	ld d,e			;6848	53 	S 
	ld d,l			;6849	55 	U 
	ld c,e			;684a	4b 	K 
	ld d,l			;684b	55 	U 
	ld c,d			;684c	4a 	J 
	ld c,c			;684d	49 	I 
	jr nz,$+77		;684e	20 4b 	  K 
	ld c,c			;6850	49 	I 
	ld d,d			;6851	52 	R 
	ld c,c			;6852	49 	I 
	jr nz,$+34		;6853	20 20 	    
	ld c,e			;6855	4b 	K 
	ld c,c			;6856	49 	I 
	ld c,l			;6857	4d 	M 
	ld b,l			;6858	45 	E 
	jr nz,$+34		;6859	20 20 	    
	jr nz,$+34		;685b	20 20 	    
	jr nz,$+34		;685d	20 20 	    
	jr nz,$+76		;685f	20 4a 	  J 
	ld c,a			;6861	4f 	O 
	ld c,(hl)			;6862	4e 	N 
	ld c,c			;6863	49 	I 
	ld c,(hl)			;6864	4e 	N 
	jr nz,$+34		;6865	20 20 	    
	jr nz,$+34		;6867	20 20 	    
	jr nz,$+34		;6869	20 20 	    
	jr nz,$+34		;686b	20 20 	    
	jr nz,$+34		;686d	20 20 	    
	jr nz,$+34		;686f	20 20 	    
	jr nz,$+34		;6871	20 20 	    
	jr nz,$+34		;6873	20 20 	    
	jr nz,$+34		;6875	20 20 	    
	jr nz,$+34		;6877	20 20 	    
	dec c			;6879	0d 	. 
	ld d,h			;687a	54 	T 
	ld e,c			;687b	59 	Y 
	ld d,b			;687c	50 	P 
	ld b,l			;687d	45 	E 
	jr nz,$+84		;687e	20 52 	  R 
	ld b,l			;6880	45 	E 
	ld d,c			;6881	51 	Q 
	ld d,l			;6882	55 	U 
	ld c,c			;6883	49 	I 
	ld d,d			;6884	52 	R 
	ld b,l			;6885	45 	E 
	ld b,h			;6886	44 	D 
	inc c			;6887	0c 	. 
	ld c,l			;6888	4d 	M 
	ld c,c			;6889	49 	I 
	ld d,e			;688a	53 	S 
	ld d,e			;688b	53 	S 
	ld c,c			;688c	49 	I 
	ld c,a			;688d	4f 	O 
	ld c,(hl)			;688e	4e 	N 
	jr nz,$+69		;688f	20 43 	  C 
	ld c,a			;6891	4f 	O 
	ld b,h			;6892	44 	D 
	ld b,l			;6893	45 	E 
	ld c,04fh		;6894	0e 4f 	. O 
	ld d,d			;6896	52 	R 
	jr nz,$+82		;6897	20 50 	  P 
	ld d,d			;6899	52 	R 
	ld b,l			;689a	45 	E 
	ld d,e			;689b	53 	S 
	ld d,e			;689c	53 	S 
	jr nz,$+71		;689d	20 45 	  E 
	ld c,(hl)			;689f	4e 	N 
	ld d,h			;68a0	54 	T 
	ld b,l			;68a1	45 	E 
	ld d,d			;68a2	52 	R 
	ld de,04f46h		;68a3	11 46 4f 	. F O 
	ld d,d			;68a6	52 	R 
	jr nz,$+72		;68a7	20 46 	  F 
	ld c,c			;68a9	49 	I 
	ld d,d			;68aa	52 	R 
	ld d,e			;68ab	53 	S 
	ld d,h			;68ac	54 	T 
	jr nz,$+79		;68ad	20 4d 	  M 
	ld c,c			;68af	49 	I 
	ld d,e			;68b0	53 	S 
	ld d,e			;68b1	53 	S 
	ld c,c			;68b2	49 	I 
	ld c,a			;68b3	4f 	O 
	ld c,(hl)			;68b4	4e 	N 
	ld (02300h),hl		;68b5	22 00 23 	" . # 
	ld d,l			;68b8	55 	U 
	ld d,b			;68b9	50 	P 
	jr nz,$+34		;68ba	20 20 	    
	jr nz,$+70		;68bc	20 44 	  D 
	ld c,a			;68be	4f 	O 
	ld d,a			;68bf	57 	W 
	ld c,(hl)			;68c0	4e 	N 
	jr nz,$+78		;68c1	20 4c 	  L 
	ld b,l			;68c3	45 	E 
	ld b,(hl)			;68c4	46 	F 
	ld d,h			;68c5	54 	T 
	jr nz,$+84		;68c6	20 52 	  R 
	ld c,c			;68c8	49 	I 
	ld b,a			;68c9	47 	G 
	ld c,b			;68ca	48 	H 
	ld d,h			;68cb	54 	T 
	ld b,(hl)			;68cc	46 	F 
	ld c,c			;68cd	49 	I 
	ld d,d			;68ce	52 	R 
	ld b,l			;68cf	45 	E 
	jr nz,$+13		;68d0	20 0b 	  . 
	ld c,e			;68d2	4b 	K 
	jr nz,$+34		;68d3	20 20 	    
	ld c,e			;68d5	4b 	K 
	ld b,l			;68d6	45 	E 
	ld e,c			;68d7	59 	Y 
	ld b,d			;68d8	42 	B 
	ld c,a			;68d9	4f 	O 
	ld b,c			;68da	41 	A 
	ld d,d			;68db	52 	R 
	ld b,h			;68dc	44 	D 
	add hl,bc			;68dd	09 	. 
	ld d,b			;68de	50 	P 
	jr nz,$+34		;68df	20 20 	    
	ld d,b			;68e1	50 	P 
	ld d,d			;68e2	52 	R 
	ld c,a			;68e3	4f 	O 
	ld d,h			;68e4	54 	T 
	ld b,l			;68e5	45 	E 
	ld c,e			;68e6	4b 	K 
	dec bc			;68e7	0b 	. 
	ld c,d			;68e8	4a 	J 
	jr nz,$+34		;68e9	20 20 	    
	ld c,e			;68eb	4b 	K 
	ld b,l			;68ec	45 	E 
	ld c,l			;68ed	4d 	M 
	ld d,b			;68ee	50 	P 
	ld d,e			;68ef	53 	S 
	ld d,h			;68f0	54 	T 
	ld c,a			;68f1	4f 	O 
	ld c,(hl)			;68f2	4e 	N 
	djnz $+84		;68f3	10 52 	. R 
	jr nz,$+34		;68f5	20 20 	    
	ld d,d			;68f7	52 	R 
	ld b,l			;68f8	45 	E 
	ld b,h			;68f9	44 	D 
	ld b,l			;68fa	45 	E 
	ld b,(hl)			;68fb	46 	F 
	ld c,c			;68fc	49 	I 
	ld c,(hl)			;68fd	4e 	N 
	ld b,l			;68fe	45 	E 
	jr nz,$+77		;68ff	20 4b 	  K 
	ld b,l			;6901	45 	E 
	ld e,c			;6902	59 	Y 
	ld d,e			;6903	53 	S 
	djnz $+79		;6904	10 4d 	. M 
	jr nz,$+34		;6906	20 20 	    
	ld b,c			;6908	41 	A 
	ld c,h			;6909	4c 	L 
	ld d,h			;690a	54 	T 
	ld b,l			;690b	45 	E 
	ld d,d			;690c	52 	R 
	jr nz,$+79		;690d	20 4d 	  M 
	ld c,c			;690f	49 	I 
	ld d,e			;6910	53 	S 
	ld d,e			;6911	53 	S 
	ld c,c			;6912	49 	I 
	ld c,a			;6913	4f 	O 
	ld c,(hl)			;6914	4e 	N 
	djnz $+73		;6915	10 47 	. G 
	jr nz,$+34		;6917	20 20 	    
	ld b,a			;6919	47 	G 
	ld b,c			;691a	41 	A 
	ld c,l			;691b	4d 	M 
	ld b,l			;691c	45 	E 
	jr nz,$+85		;691d	20 53 	  S 
	ld d,b			;691f	50 	P 
	ld b,l			;6920	45 	E 
	ld b,l			;6921	45 	E 
	ld b,h			;6922	44 	D 
	ld a,(03520h)		;6923	3a 20 35 	:   5 
	dec c			;6926	0d 	. 
	ld d,e			;6927	53 	S 
	jr nz,$+34		;6928	20 20 	    
	ld d,e			;692a	53 	S 
	ld d,h			;692b	54 	T 
	ld b,c			;692c	41 	A 
	ld d,d			;692d	52 	R 
	ld d,h			;692e	54 	T 
	jr nz,$+73		;692f	20 47 	  G 
	ld b,c			;6931	41 	A 
	ld c,l			;6932	4d 	M 
	ld b,l			;6933	45 	E 
	inc d			;6934	14 	. 
	ld sp,03839h		;6935	31 39 38 	1 9 8 
	scf			;6938	37 	7 
	jr nz,$+34		;6939	20 20 	    
	ld b,e			;693b	43 	C 
	ld c,h			;693c	4c 	L 
	ld c,c			;693d	49 	I 
	ld d,(hl)			;693e	56 	V 
	ld b,l			;693f	45 	E 
	jr nz,$+86		;6940	20 54 	  T 
	ld c,a			;6942	4f 	O 
	ld d,a			;6943	57 	W 
	ld c,(hl)			;6944	4e 	N 
	ld d,e			;6945	53 	S 
	ld b,l			;6946	45 	E 
	ld c,(hl)			;6947	4e 	N 
	ld b,h			;6948	44 	D 
	ld de,03032h		;6949	11 32 30 	. 2 0 
	ld (02034h),a		;694c	32 34 20 	2 4   
	jr nz,$+34		;694f	20 20 	    
	jr nz,$+86		;6951	20 54 	  T 
	ld c,b			;6953	48 	H 
	ld b,l			;6954	45 	E 
	ld b,c			;6955	41 	A 
	ld c,h			;6956	4c 	L 
	ld b,(hl)			;6957	46 	F 
	ld b,l			;6958	45 	E 
	ld d,e			;6959	53 	S 
	ld d,h			;695a	54 	T 
	djnz $+91		;695b	10 59 	. Y 
	ld c,a			;695d	4f 	O 
	ld d,l			;695e	55 	U 
	jr nz,$+74		;695f	20 48 	  H 
	ld b,c			;6961	41 	A 
	ld d,(hl)			;6962	56 	V 
	ld b,l			;6963	45 	E 
	jr nz,$+84		;6964	20 52 	  R 
	ld b,l			;6966	45 	E 
	ld b,c			;6967	41 	A 
	ld b,e			;6968	43 	C 
	ld c,b			;6969	48 	H 
	ld b,l			;696a	45 	E 
	ld b,h			;696b	44 	D 
	ld (de),a			;696c	12 	. 
	ld d,h			;696d	54 	T 
	ld c,b			;696e	48 	H 
	ld b,l			;696f	45 	E 
	jr nz,$+87		;6970	20 55 	  U 
	ld c,h			;6972	4c 	L 
	ld d,h			;6973	54 	T 
	ld c,c			;6974	49 	I 
	ld c,l			;6975	4d 	M 
	ld b,c			;6976	41 	A 
	ld d,h			;6977	54 	T 
	ld b,l			;6978	45 	E 
	jr nz,$+78		;6979	20 4c 	  L 
	ld b,l			;697b	45 	E 
	ld d,(hl)			;697c	56 	V 
	ld b,l			;697d	45 	E 
	ld c,h			;697e	4c 	L 
	ld de,04f59h		;697f	11 59 4f 	. Y O 
	ld d,l			;6982	55 	U 
	jr nz,$+74		;6983	20 48 	  H 
	ld b,c			;6985	41 	A 
	ld d,(hl)			;6986	56 	V 
	ld b,l			;6987	45 	E 
	jr nz,$+79		;6988	20 4d 	  M 
	ld b,c			;698a	41 	A 
	ld d,e			;698b	53 	S 
	ld d,h			;698c	54 	T 
	ld b,l			;698d	45 	E 
	ld d,d			;698e	52 	R 
	ld b,l			;698f	45 	E 
	ld b,h			;6990	44 	D 
	inc de			;6991	13 	. 
	ld d,h			;6992	54 	T 
	ld c,b			;6993	48 	H 
	ld b,l			;6994	45 	E 
	jr nz,$+67		;6995	20 41 	  A 
	ld d,d			;6997	52 	R 
	ld d,h			;6998	54 	T 
	jr nz,$+81		;6999	20 4f 	  O 
	ld b,(hl)			;699b	46 	F 
	jr nz,$+80		;699c	20 4e 	  N 
	ld c,c			;699e	49 	I 
	ld c,(hl)			;699f	4e 	N 
	ld c,d			;69a0	4a 	J 
	ld c,c			;69a1	49 	I 
	ld d,h			;69a2	54 	T 
	ld d,e			;69a3	53 	S 
	ld d,l			;69a4	55 	U 
	dec b			;69a5	05 	. 
	ld d,h			;69a6	54 	T 
	ld c,a			;69a7	4f 	O 
	ld d,h			;69a8	54 	T 
	ld b,c			;69a9	41 	A 
	ld c,h			;69aa	4c 	L 
	ld (de),a			;69ab	12 	. 
	ld e,c			;69ac	59 	Y 
	ld c,a			;69ad	4f 	O 
	ld d,l			;69ae	55 	U 
	jr nz,$+74		;69af	20 48 	  H 
	ld b,c			;69b1	41 	A 
	ld d,(hl)			;69b2	56 	V 
	ld b,l			;69b3	45 	E 
	jr nz,$+69		;69b4	20 43 	  C 
	ld c,a			;69b6	4f 	O 
	ld c,l			;69b7	4d 	M 
	ld d,b			;69b8	50 	P 
	ld c,h			;69b9	4c 	L 
	ld b,l			;69ba	45 	E 
	ld d,h			;69bb	54 	T 
	ld b,l			;69bc	45 	E 
	ld b,h			;69bd	44 	D 
	dec d			;69be	15 	. 
	ld e,c			;69bf	59 	Y 
	ld c,a			;69c0	4f 	O 
	ld d,l			;69c1	55 	U 
	ld d,d			;69c2	52 	R 
	jr nz,$+67		;69c3	20 41 	  A 
	ld d,e			;69c5	53 	S 
	ld d,e			;69c6	53 	S 
	ld c,c			;69c7	49 	I 
	ld b,a			;69c8	47 	G 
	ld c,(hl)			;69c9	4e 	N 
	ld b,l			;69ca	45 	E 
	ld b,h			;69cb	44 	D 
	jr nz,$+79		;69cc	20 4d 	  M 
	ld c,c			;69ce	49 	I 
	ld d,e			;69cf	53 	S 
	ld d,e			;69d0	53 	S 
	ld c,c			;69d1	49 	I 
	ld c,a			;69d2	4f 	O 
	ld c,(hl)			;69d3	4e 	N 
	inc c			;69d4	0c 	. 
	ld d,h			;69d5	54 	T 
	ld c,b			;69d6	48 	H 
	ld b,l			;69d7	45 	E 
	jr nz,$+69		;69d8	20 43 	  C 
	ld c,a			;69da	4f 	O 
	ld b,h			;69db	44 	D 
	ld b,l			;69dc	45 	E 
	jr nz,$+72		;69dd	20 46 	  F 
	ld c,a			;69df	4f 	O 
	ld d,d			;69e0	52 	R 
	ld a,(bc)			;69e1	0a 	. 
	ld d,e			;69e2	53 	S 
	ld d,h			;69e3	54 	T 
	ld b,c			;69e4	41 	A 
	ld b,a			;69e5	47 	G 
	ld b,l			;69e6	45 	E 
	jr nz,$+90		;69e7	20 58 	  X 
	jr nz,$+75		;69e9	20 49 	  I 
	ld d,e			;69eb	53 	S 
	ld b,e			;69ec	43 	C 
	ld c,h			;69ed	4c 	L 
	ld b,l			;69ee	45 	E 
	ld b,c			;69ef	41 	A 
	ld c,(hl)			;69f0	4e 	N 
	ld b,b			;69f1	40 	@ 
	ld d,d			;69f2	52 	R 
	ld c,a			;69f3	4f 	O 
	ld c,a			;69f4	4f 	O 
	ld c,l			;69f5	4d 	M 
	ld b,b			;69f6	40 	@ 
	ld c,(hl)			;69f7	4e 	N 
	ld c,a			;69f8	4f 	O 
	ld b,b			;69f9	40 	@ 
	ld b,l			;69fa	45 	E 
	ld c,(hl)			;69fb	4e 	N 
	ld d,h			;69fc	54 	T 
	ld d,d			;69fd	52 	R 
	ld e,c			;69fe	59 	Y 
	ld b,b			;69ff	40 	@ 
	ld d,(hl)			;6a00	56 	V 
	ld c,c			;6a01	49 	I 
	ld d,d			;6a02	52 	R 
	ld c,c			;6a03	49 	I 
	ld b,h			;6a04	44 	D 
	ld c,c			;6a05	49 	I 
	ld d,e			;6a06	53 	S 
	ld b,b			;6a07	40 	@ 
	or 06bh		;6a08	f6 6b 	. k 
	ld sp,hl			;6a0a	f9 	. 
	ld l,e			;6a0b	6b 	k 
	djnz $+110		;6a0c	10 6c 	. l 
	ld l,06ch		;6a0e	2e 6c 	. l 
	ld a,b			;6a10	78 	x 
	ld l,h			;6a11	6c 	l 
	cp (hl)			;6a12	be 	. 
	ld l,h			;6a13	6c 	l 
	exx			;6a14	d9 	. 
	ld l,h			;6a15	6c 	l 
	inc bc			;6a16	03 	. 
	ld l,l			;6a17	6d 	m 
	dec bc			;6a18	0b 	. 
	ld l,l			;6a19	6d 	m 
	dec d			;6a1a	15 	. 
	ld l,l			;6a1b	6d 	m 
	ld b,b			;6a1c	40 	@ 
	ld l,l			;6a1d	6d 	m 
	ld d,e			;6a1e	53 	S 
	ld l,l			;6a1f	6d 	m 
	ld l,b			;6a20	68 	h 
	ld l,l			;6a21	6d 	m 
	sub b			;6a22	90 	. 
	ld l,l			;6a23	6d 	m 
	sbc a,c			;6a24	99 	. 
	ld l,l			;6a25	6d 	m 
	and (hl)			;6a26	a6 	. 
	ld l,l			;6a27	6d 	m 
	jp po,0056dh		;6a28	e2 6d 05 	. m . 
	ld l,(hl)			;6a2b	6e 	n 
	ld c,06eh		;6a2c	0e 6e 	. n 
	dec hl			;6a2e	2b 	+ 
	ld l,(hl)			;6a2f	6e 	n 
	inc (hl)			;6a30	34 	4 
	ld l,(hl)			;6a31	6e 	n 
	ld h,c			;6a32	61 	a 
	ld l,(hl)			;6a33	6e 	n 
	adc a,e			;6a34	8b 	. 
	ld l,(hl)			;6a35	6e 	n 
	and h			;6a36	a4 	. 
	ld l,(hl)			;6a37	6e 	n 
	cp c			;6a38	b9 	. 
	ld l,(hl)			;6a39	6e 	n 
	jp (hl)			;6a3a	e9 	. 
	ld l,(hl)			;6a3b	6e 	n 
	ld de,02c6fh		;6a3c	11 6f 2c 	. o , 
	ld l,a			;6a3f	6f 	o 
	dec a			;6a40	3d 	= 
	ld l,a			;6a41	6f 	o 
	ld c,a			;6a42	4f 	O 
	ld l,a			;6a43	6f 	o 
	ld e,l			;6a44	5d 	] 
	ld l,a			;6a45	6f 	o 
	ld l,a			;6a46	6f 	o 
	ld l,a			;6a47	6f 	o 
	add a,c			;6a48	81 	. 
	ld l,a			;6a49	6f 	o 
	sbc a,b			;6a4a	98 	. 
	ld l,a			;6a4b	6f 	o 
	xor a			;6a4c	af 	. 
	ld l,a			;6a4d	6f 	o 
	pop bc			;6a4e	c1 	. 
	ld l,a			;6a4f	6f 	o 
	ret c			;6a50	d8 	. 
	ld l,a			;6a51	6f 	o 
	rst 28h			;6a52	ef 	. 
	ld l,a			;6a53	6f 	o 
	ld b,070h		;6a54	06 70 	. p 
	dec e			;6a56	1d 	. 
	ld (hl),b			;6a57	70 	p 
	dec hl			;6a58	2b 	+ 
	ld (hl),b			;6a59	70 	p 
	add hl,sp			;6a5a	39 	9 
	ld (hl),b			;6a5b	70 	p 
	ld c,e			;6a5c	4b 	K 
	ld (hl),b			;6a5d	70 	p 
	ld e,c			;6a5e	59 	Y 
	ld (hl),b			;6a5f	70 	p 
	ld l,c			;6a60	69 	i 
	ld (hl),b			;6a61	70 	p 
	ld a,b			;6a62	78 	x 
	ld (hl),b			;6a63	70 	p 
	add a,a			;6a64	87 	. 
	ld (hl),b			;6a65	70 	p 
	sub (hl)			;6a66	96 	. 
	ld (hl),b			;6a67	70 	p 
	and h			;6a68	a4 	. 
	ld (hl),b			;6a69	70 	p 
	or d			;6a6a	b2 	. 
	ld (hl),b			;6a6b	70 	p 
	ret nz			;6a6c	c0 	. 
	ld (hl),b			;6a6d	70 	p 
	adc a,070h		;6a6e	ce 70 	. p 
	pop de			;6a70	d1 	. 
	ld (hl),b			;6a71	70 	p 
	rst 18h			;6a72	df 	. 
	ld (hl),b			;6a73	70 	p 
	in f,(c)		;6a74	ed 70 	. p 
	dec b			;6a76	05 	. 
	ld (hl),c			;6a77	71 	q 
	inc de			;6a78	13 	. 
	ld (hl),c			;6a79	71 	q 
	add hl,sp			;6a7a	39 	9 
	ld (hl),c			;6a7b	71 	q 
	ld b,a			;6a7c	47 	G 
	ld (hl),c			;6a7d	71 	q 
	ld (hl),c			;6a7e	71 	q 
	ld (hl),c			;6a7f	71 	q 
	add a,l			;6a80	85 	. 
	ld (hl),c			;6a81	71 	q 
	xor d			;6a82	aa 	. 
	ld (hl),c			;6a83	71 	q 
	ret po			;6a84	e0 	. 
	ld (hl),c			;6a85	71 	q 
	ld e,072h		;6a86	1e 72 	. r 
	daa			;6a88	27 	' 
	ld (hl),d			;6a89	72 	r 
	jr nc,$+116		;6a8a	30 72 	0 r 
	ld c,e			;6a8c	4b 	K 
	ld (hl),d			;6a8d	72 	r 
	ld l,c			;6a8e	69 	i 
	ld (hl),d			;6a8f	72 	r 
	add a,b			;6a90	80 	. 
	ld (hl),d			;6a91	72 	r 
	and b			;6a92	a0 	. 
	ld (hl),d			;6a93	72 	r 
	or a			;6a94	b7 	. 
	ld (hl),d			;6a95	72 	r 
	adc a,072h		;6a96	ce 72 	. r 
	and 072h		;6a98	e6 72 	. r 
	jp m,00d72h		;6a9a	fa 72 0d 	. r . 
	ld (hl),e			;6a9d	73 	s 
	ld hl,(03c73h)		;6a9e	2a 73 3c 	* s < 
	ld (hl),e			;6aa1	73 	s 
	ld d,b			;6aa2	50 	P 
	ld (hl),e			;6aa3	73 	s 
	ld (hl),h			;6aa4	74 	t 
	ld (hl),e			;6aa5	73 	s 
	adc a,d			;6aa6	8a 	. 
	ld (hl),e			;6aa7	73 	s 
	sbc a,b			;6aa8	98 	. 
	ld (hl),e			;6aa9	73 	s 
	sbc a,(hl)			;6aaa	9e 	. 
	ld (hl),e			;6aab	73 	s 
	xor d			;6aac	aa 	. 
	ld (hl),e			;6aad	73 	s 
	or a			;6aae	b7 	. 
	ld (hl),e			;6aaf	73 	s 
	jp z,0e373h		;6ab0	ca 73 e3 	. s . 
	ld (hl),e			;6ab3	73 	s 
	xor 073h		;6ab4	ee 73 	. s 
	ei			;6ab6	fb 	. 
	ld (hl),e			;6ab7	73 	s 
	inc c			;6ab8	0c 	. 
	ld (hl),h			;6ab9	74 	t 
	ld a,(de)			;6aba	1a 	. 
	ld (hl),h			;6abb	74 	t 
	ld h,074h		;6abc	26 74 	& t 
	ld (04274h),a		;6abe	32 74 42 	2 t B 
	ld (hl),h			;6ac1	74 	t 
	ld d,e			;6ac2	53 	S 
	ld (hl),h			;6ac3	74 	t 
	ld l,c			;6ac4	69 	i 
	ld (hl),h			;6ac5	74 	t 
	ld a,c			;6ac6	79 	y 
	ld (hl),h			;6ac7	74 	t 
	and c			;6ac8	a1 	. 
	ld (hl),h			;6ac9	74 	t 
	call z,0ee74h		;6aca	cc 74 ee 	. t . 
	ld (hl),h			;6acd	74 	t 
	ld de,02375h		;6ace	11 75 23 	. u # 
	ld (hl),l			;6ad1	75 	u 
	inc l			;6ad2	2c 	, 
	ld (hl),l			;6ad3	75 	u 
	ld a,075h		;6ad4	3e 75 	> u 
	ld d,b			;6ad6	50 	P 
	ld (hl),l			;6ad7	75 	u 
	ld l,c			;6ad8	69 	i 
	ld (hl),l			;6ad9	75 	u 
	add a,b			;6ada	80 	. 
	ld (hl),l			;6adb	75 	u 
	adc a,a			;6adc	8f 	. 
	ld (hl),l			;6add	75 	u 
	xor a			;6ade	af 	. 
	ld (hl),l			;6adf	75 	u 
	pop bc			;6ae0	c1 	. 
	ld (hl),l			;6ae1	75 	u 
	rst 20h			;6ae2	e7 	. 
	ld (hl),l			;6ae3	75 	u 
	cp 075h		;6ae4	fe 75 	. u 
	rlca			;6ae6	07 	. 
	halt			;6ae7	76 	v 
	jr $+120		;6ae8	18 76 	. v 
	ld h,076h		;6aea	26 76 	& v 
	inc sp			;6aec	33 	3 
	halt			;6aed	76 	v 
	ld a,076h		;6aee	3e 76 	> v 
	ld c,c			;6af0	49 	I 
	halt			;6af1	76 	v 
	ld e,c			;6af2	59 	Y 
	halt			;6af3	76 	v 
	adc a,h			;6af4	8c 	. 
	halt			;6af5	76 	v 
	sbc a,d			;6af6	9a 	. 
	halt			;6af7	76 	v 
	or c			;6af8	b1 	. 
	halt			;6af9	76 	v 
	jp z,0dd76h		;6afa	ca 76 dd 	. v . 
	halt			;6afd	76 	v 
	dec bc			;6afe	0b 	. 
	ld (hl),a			;6aff	77 	w 
	ld l,077h		;6b00	2e 77 	. w 
	ld c,h			;6b02	4c 	L 
	ld (hl),a			;6b03	77 	w 
	ld d,l			;6b04	55 	U 
	ld (hl),a			;6b05	77 	w 
	add a,l			;6b06	85 	. 
	ld (hl),a			;6b07	77 	w 
	sub (hl)			;6b08	96 	. 
	ld (hl),a			;6b09	77 	w 
	or (hl)			;6b0a	b6 	. 
	ld (hl),a			;6b0b	77 	w 
	add a,077h		;6b0c	c6 77 	. w 
	pop de			;6b0e	d1 	. 
	ld (hl),a			;6b0f	77 	w 
	ret p			;6b10	f0 	. 
	ld (hl),a			;6b11	77 	w 
	inc bc			;6b12	03 	. 
	ld a,b			;6b13	78 	x 
	dec bc			;6b14	0b 	. 
	ld a,b			;6b15	78 	x 
	dec h			;6b16	25 	% 
	ld a,b			;6b17	78 	x 
	ccf			;6b18	3f 	? 
	ld a,b			;6b19	78 	x 
	ld b,a			;6b1a	47 	G 
	ld a,b			;6b1b	78 	x 
	ld d,(hl)			;6b1c	56 	V 
	ld a,b			;6b1d	78 	x 
	ld (hl),a			;6b1e	77 	w 
	ld a,b			;6b1f	78 	x 
	adc a,b			;6b20	88 	. 
	ld a,b			;6b21	78 	x 
	and c			;6b22	a1 	. 
	ld a,b			;6b23	78 	x 
	add a,078h		;6b24	c6 78 	. x 
	call po,01178h		;6b26	e4 78 11 	. x . 
	ld a,c			;6b29	79 	y 
	ld hl,(06079h)		;6b2a	2a 79 60 	* y ` 
	ld a,c			;6b2d	79 	y 
	ld a,e			;6b2e	7b 	{ 
	ld a,c			;6b2f	79 	y 
	and h			;6b30	a4 	. 
	ld a,c			;6b31	79 	y 
	or d			;6b32	b2 	. 
	ld a,c			;6b33	79 	y 
	push de			;6b34	d5 	. 
	ld a,c			;6b35	79 	y 
	push af			;6b36	f5 	. 
	ld a,c			;6b37	79 	y 
	ld b,07ah		;6b38	06 7a 	. z 
	daa			;6b3a	27 	' 
	ld a,d			;6b3b	7a 	z 
	ld b,b			;6b3c	40 	@ 
	ld a,d			;6b3d	7a 	z 
	ld d,(hl)			;6b3e	56 	V 
	ld a,d			;6b3f	7a 	z 
	ld h,e			;6b40	63 	c 
	ld a,d			;6b41	7a 	z 
	ld l,a			;6b42	6f 	o 
	ld a,d			;6b43	7a 	z 
	add a,h			;6b44	84 	. 
	ld a,d			;6b45	7a 	z 
	sbc a,d			;6b46	9a 	. 
	ld a,d			;6b47	7a 	z 
	xor c			;6b48	a9 	. 
	ld a,d			;6b49	7a 	z 
	cp b			;6b4a	b8 	. 
	ld a,d			;6b4b	7a 	z 
	call nc,0e87ah		;6b4c	d4 7a e8 	. z . 
	ld a,d			;6b4f	7a 	z 
	ld (bc),a			;6b50	02 	. 
	ld a,e			;6b51	7b 	{ 
	djnz $+125		;6b52	10 7b 	. { 
	ld hl,0487bh		;6b54	21 7b 48 	! { H 
	ld a,e			;6b57	7b 	{ 
	ld l,c			;6b58	69 	i 
	ld a,e			;6b59	7b 	{ 
	sub c			;6b5a	91 	. 
	ld a,e			;6b5b	7b 	{ 
	sbc a,(hl)			;6b5c	9e 	. 
	ld a,e			;6b5d	7b 	{ 
	or c			;6b5e	b1 	. 
	ld a,e			;6b5f	7b 	{ 
	cp a			;6b60	bf 	. 
	ld a,e			;6b61	7b 	{ 
	pop de			;6b62	d1 	. 
	ld a,e			;6b63	7b 	{ 
	push af			;6b64	f5 	. 
	ld a,e			;6b65	7b 	{ 
	dec c			;6b66	0d 	. 
	ld a,h			;6b67	7c 	| 
	inc h			;6b68	24 	$ 
	ld a,h			;6b69	7c 	| 
	ld sp,0397ch		;6b6a	31 7c 39 	1 | 9 
	ld a,h			;6b6d	7c 	| 
	ld c,l			;6b6e	4d 	M 
	ld a,h			;6b6f	7c 	| 
	ld h,e			;6b70	63 	c 
	ld a,h			;6b71	7c 	| 
	ld l,e			;6b72	6b 	k 
	ld a,h			;6b73	7c 	| 
	ld a,h			;6b74	7c 	| 
	ld a,h			;6b75	7c 	| 
	and d			;6b76	a2 	. 
	ld a,h			;6b77	7c 	| 
	or h			;6b78	b4 	. 
	ld a,h			;6b79	7c 	| 
	rst 0			;6b7a	c7 	. 
	ld a,h			;6b7b	7c 	| 
	call pe,0fd7ch		;6b7c	ec 7c fd 	. | . 
	ld a,h			;6b7f	7c 	| 
	dec b			;6b80	05 	. 
	ld a,l			;6b81	7d 	} 
	inc c			;6b82	0c 	. 
	ld a,l			;6b83	7d 	} 
	inc d			;6b84	14 	. 
	ld a,l			;6b85	7d 	} 
	jr nz,$+127		;6b86	20 7d 	  } 
	dec a			;6b88	3d 	= 
	ld a,l			;6b89	7d 	} 
	ld b,a			;6b8a	47 	G 
	ld a,l			;6b8b	7d 	} 
	ld e,(hl)			;6b8c	5e 	^ 
	ld a,l			;6b8d	7d 	} 
	ld l,(hl)			;6b8e	6e 	n 
	ld a,l			;6b8f	7d 	} 
	adc a,e			;6b90	8b 	. 
	ld a,l			;6b91	7d 	} 
	and d			;6b92	a2 	. 
	ld a,l			;6b93	7d 	} 
	cp c			;6b94	b9 	. 
	ld a,l			;6b95	7d 	} 
	call nc,0e77dh		;6b96	d4 7d e7 	. } . 
	ld a,l			;6b99	7d 	} 
	djnz $+128		;6b9a	10 7e 	. ~ 
	rra			;6b9c	1f 	. 
	ld a,(hl)			;6b9d	7e 	~ 
	ld b,c			;6b9e	41 	A 
	ld a,(hl)			;6b9f	7e 	~ 
	ld e,l			;6ba0	5d 	] 
	ld a,(hl)			;6ba1	7e 	~ 
	ld a,h			;6ba2	7c 	| 
	ld a,(hl)			;6ba3	7e 	~ 
	sbc a,d			;6ba4	9a 	. 
	ld a,(hl)			;6ba5	7e 	~ 
	or d			;6ba6	b2 	. 
	ld a,(hl)			;6ba7	7e 	~ 
	push bc			;6ba8	c5 	. 
	ld a,(hl)			;6ba9	7e 	~ 
	defb 0edh;next byte illegal after ed		;6baa	ed 	. 
	ld a,(hl)			;6bab	7e 	~ 
	ex af,af'			;6bac	08 	. 
	ld a,a			;6bad	7f 	 
	ld a,(de)			;6bae	1a 	. 
	ld a,a			;6baf	7f 	 
	dec l			;6bb0	2d 	- 
	ld a,a			;6bb1	7f 	 
	ld b,b			;6bb2	40 	@ 
	ld a,a			;6bb3	7f 	 
	ld d,e			;6bb4	53 	S 
	ld a,a			;6bb5	7f 	 
	ld h,l			;6bb6	65 	e 
	ld a,a			;6bb7	7f 	 
	ld a,b			;6bb8	78 	x 
	ld a,a			;6bb9	7f 	 
	adc a,e			;6bba	8b 	. 
	ld a,a			;6bbb	7f 	 
	sub c			;6bbc	91 	. 
	ld a,a			;6bbd	7f 	 
	sbc a,l			;6bbe	9d 	. 
	ld a,a			;6bbf	7f 	 
	or b			;6bc0	b0 	. 
	ld a,a			;6bc1	7f 	 
	jp nz,0ce7fh		;6bc2	c2 7f ce 	.  . 
	ld a,a			;6bc5	7f 	 
	sbc a,07fh		;6bc6	de 7f 	.  
	jp pe,0f37fh		;6bc8	ea 7f f3 	.  . 
	ld a,a			;6bcb	7f 	 
	dec b			;6bcc	05 	. 
	add a,b			;6bcd	80 	. 
	inc de			;6bce	13 	. 
	add a,b			;6bcf	80 	. 
	inc e			;6bd0	1c 	. 
	add a,b			;6bd1	80 	. 
	dec l			;6bd2	2d 	- 
	add a,b			;6bd3	80 	. 
	ccf			;6bd4	3f 	? 
	add a,b			;6bd5	80 	. 
	ld d,b			;6bd6	50 	P 
	add a,b			;6bd7	80 	. 
	ld e,d			;6bd8	5a 	Z 
	add a,b			;6bd9	80 	. 
	ld l,h			;6bda	6c 	l 
	add a,b			;6bdb	80 	. 
	add a,e			;6bdc	83 	. 
	add a,b			;6bdd	80 	. 
	sbc a,(hl)			;6bde	9e 	. 
	add a,b			;6bdf	80 	. 
	xor h			;6be0	ac 	. 
	add a,b			;6be1	80 	. 
	jp nz,0d180h		;6be2	c2 80 d1 	. . . 
	add a,b			;6be5	80 	. 
	push hl			;6be6	e5 	. 
	add a,b			;6be7	80 	. 
	call p,06980h		;6be8	f4 80 69 	. . i 
	add a,c			;6beb	81 	. 
	inc bc			;6bec	03 	. 
	add a,c			;6bed	81 	. 
	cpl			;6bee	2f 	/ 
	add a,c			;6bef	81 	. 
	ld a,081h		;6bf0	3e 81 	> . 
	ld c,h			;6bf2	4c 	L 
	add a,c			;6bf3	81 	. 
	ld d,(hl)			;6bf4	56 	V 
	add a,c			;6bf5	81 	. 
	inc bc			;6bf6	03 	. 
	ld bc,000ffh		;6bf7	01 ff 00 	. . . 
	ld b,b			;6bfa	40 	@ 
	call m,089b4h		;6bfb	fc b4 89 	. . . 
	nop			;6bfe	00 	. 
	ld de,0b4fch		;6bff	11 fc b4 	. . . 
	adc a,b			;6c02	88 	. 
	nop			;6c03	00 	. 
	jr nz,$-4		;6c04	20 fa 	  . 
	or h			;6c06	b4 	. 
	add a,a			;6c07	87 	. 
	ld hl,0e50fh		;6c08	21 0f e5 	! . . 
	add a,a			;6c0b	87 	. 
	ld h,h			;6c0c	64 	d 
	ld h,e			;6c0d	63 	c 
	inc de			;6c0e	13 	. 
	rst 38h			;6c0f	ff 	. 
	nop			;6c10	00 	. 
	ld b,h			;6c11	44 	D 
	jp m,089b0h		;6c12	fa b0 89 	. . . 
	nop			;6c15	00 	. 
	ld (bc),a			;6c16	02 	. 
	jp m,08992h		;6c17	fa 92 89 	. . . 
	ld (bc),a			;6c1a	02 	. 
	inc b			;6c1b	04 	. 
	ld (bc),a			;6c1c	02 	. 
	call m,089b4h		;6c1d	fc b4 89 	. . . 
	ld (bc),a			;6c20	02 	. 
	ld (bc),a			;6c21	02 	. 
	dec b			;6c22	05 	. 
	jp m,087d2h		;6c23	fa d2 87 	. . . 
	ld hl,0bf02h		;6c26	21 02 bf 	! . . 
	adc a,c			;6c29	89 	. 
	jr z,$+43		;6c2a	28 29 	( ) 
	ld (002ffh),a		;6c2c	32 ff 02 	2 . . 
	ld a,(bc)			;6c2f	0a 	. 
	ld (de),a			;6c30	12 	. 
	jp m,087b4h		;6c31	fa b4 87 	. . . 
	ld (bc),a			;6c34	02 	. 
	ex af,af'			;6c35	08 	. 
	ex af,af'			;6c36	08 	. 
	nop			;6c37	00 	. 
	ld (hl),h			;6c38	74 	t 
	adc a,b			;6c39	88 	. 
	ld (bc),a			;6c3a	02 	. 
	rlca			;6c3b	07 	. 
	ld (de),a			;6c3c	12 	. 
	jp m,087cdh		;6c3d	fa cd 87 	. . . 
	ld bc,0f702h		;6c40	01 02 f7 	. . . 
	sbc a,l			;6c43	9d 	. 
	adc a,b			;6c44	88 	. 
	ld bc,00002h		;6c45	01 02 00 	. . . 
	sbc a,h			;6c48	9c 	. 
	adc a,b			;6c49	88 	. 
	ld (bc),a			;6c4a	02 	. 
	dec b			;6c4b	05 	. 
	ld b,0fbh		;6c4c	06 fb 	. . 
	ex (sp),hl			;6c4e	e3 	. 
	adc a,b			;6c4f	88 	. 
	ld (bc),a			;6c50	02 	. 
	rlca			;6c51	07 	. 
	ld (bc),a			;6c52	02 	. 
	ei			;6c53	fb 	. 
	jp nz,00089h		;6c54	c2 89 00 	. . . 
	ld de,0ddf9h		;6c57	11 f9 dd 	. . . 
	add a,a			;6c5a	87 	. 
	nop			;6c5b	00 	. 
	inc bc			;6c5c	03 	. 
	ret m			;6c5d	f8 	. 
	call nz,00088h		;6c5e	c4 88 00 	. . . 
	dec b			;6c61	05 	. 
	ret m			;6c62	f8 	. 
	and e			;6c63	a3 	. 
	adc a,c			;6c64	89 	. 
	inc b			;6c65	04 	. 
	or 0c3h		;6c66	f6 c3 	. . 
	adc a,b			;6c68	88 	. 
	inc b			;6c69	04 	. 
	push af			;6c6a	f5 	. 
	rst 0			;6c6b	c7 	. 
	adc a,b			;6c6c	88 	. 
	inc b			;6c6d	04 	. 
	or 0a2h		;6c6e	f6 a2 	. . 
	adc a,c			;6c70	89 	. 
	inc b			;6c71	04 	. 
	push af			;6c72	f5 	. 
	xor b			;6c73	a8 	. 
	adc a,c			;6c74	89 	. 
	dec b			;6c75	05 	. 
	ld (003ffh),hl		;6c76	22 ff 03 	" . . 
	ld bc,06000h		;6c79	01 00 60 	. . ` 
	jp m,08994h		;6c7c	fa 94 89 	. . . 
	ld bc,0020ah		;6c7f	01 0a 02 	. . . 
	ret nz			;6c82	c0 	. 
	add a,a			;6c83	87 	. 
	ld bc,0020ah		;6c84	01 0a 02 	. . . 
	res 0,a		;6c87	cb 87 	. . 
	nop			;6c89	00 	. 
	ld a,(bc)			;6c8a	0a 	. 
	jp p,088e1h		;6c8b	f2 e1 88 	. . . 
	rlca			;6c8e	07 	. 
	dec b			;6c8f	05 	. 
	di			;6c90	f3 	. 
	nop			;6c91	00 	. 
	adc a,c			;6c92	89 	. 
	rlca			;6c93	07 	. 
	dec b			;6c94	05 	. 
	inc bc			;6c95	03 	. 
	rst 38h			;6c96	ff 	. 
	adc a,b			;6c97	88 	. 
	rlca			;6c98	07 	. 
	inc bc			;6c99	03 	. 
	inc bc			;6c9a	03 	. 
	add hl,bc			;6c9b	09 	. 
	adc a,c			;6c9c	89 	. 
	rlca			;6c9d	07 	. 
	inc b			;6c9e	04 	. 
	di			;6c9f	f3 	. 
	ld a,(bc)			;6ca0	0a 	. 
	adc a,c			;6ca1	89 	. 
	ld b,005h		;6ca2	06 05 	. . 
	pop af			;6ca4	f1 	. 
	dec bc			;6ca5	0b 	. 
	adc a,c			;6ca6	89 	. 
	ld b,005h		;6ca7	06 05 	. . 
	inc b			;6ca9	04 	. 
	inc c			;6caa	0c 	. 
	adc a,c			;6cab	89 	. 
	ld b,004h		;6cac	06 04 	. . 
	pop af			;6cae	f1 	. 
	ld bc,00689h		;6caf	01 89 06 	. . . 
	inc bc			;6cb2	03 	. 
	inc b			;6cb3	04 	. 
	ld (bc),a			;6cb4	02 	. 
	adc a,c			;6cb5	89 	. 
	ex af,af'			;6cb6	08 	. 
	rrca			;6cb7	0f 	. 
	push bc			;6cb8	c5 	. 
	add a,a			;6cb9	87 	. 
	rrca			;6cba	0f 	. 
	push hl			;6cbb	e5 	. 
	adc a,b			;6cbc	88 	. 
	rst 38h			;6cbd	ff 	. 
	inc bc			;6cbe	03 	. 
	ld bc,01201h		;6cbf	01 01 12 	. . . 
	ld (bc),a			;6cc2	02 	. 
	ret nz			;6cc3	c0 	. 
	add a,a			;6cc4	87 	. 
	ld bc,00212h		;6cc5	01 12 02 	. . . 
	res 0,a		;6cc8	cb 87 	. . 
	nop			;6cca	00 	. 
	ld a,(bc)			;6ccb	0a 	. 
	jp p,08841h		;6ccc	f2 41 88 	. A . 
	nop			;6ccf	00 	. 
	ld a,(bc)			;6cd0	0a 	. 
	jp p,089a1h		;6cd1	f2 a1 89 	. . . 
	ex af,af'			;6cd4	08 	. 
	ld (de),a			;6cd5	12 	. 
	push bc			;6cd6	c5 	. 
	add a,a			;6cd7	87 	. 
	rst 38h			;6cd8	ff 	. 
	inc bc			;6cd9	03 	. 
	ld bc,00501h		;6cda	01 01 05 	. . . 
	ld (bc),a			;6cdd	02 	. 
	ld h,b			;6cde	60 	` 
	adc a,c			;6cdf	89 	. 
	ld bc,00205h		;6ce0	01 05 02 	. . . 
	ld l,e			;6ce3	6b 	k 
	adc a,c			;6ce4	89 	. 
	ld bc,0020ch		;6ce5	01 0c 02 	. . . 
	jp z,00187h		;6ce8	ca 87 01 	. . . 
	inc c			;6ceb	0c 	. 
	ld (bc),a			;6cec	02 	. 
	ret z			;6ced	c8 	. 
	add a,a			;6cee	87 	. 
	ld bc,00203h		;6cef	01 03 02 	. . . 
	jp (hl)			;6cf2	e9 	. 
	adc a,b			;6cf3	88 	. 
	nop			;6cf4	00 	. 
	inc d			;6cf5	14 	. 
	jp p,0893bh		;6cf6	f2 3b 89 	. ; . 
	ex af,af'			;6cf9	08 	. 
	ld b,045h		;6cfa	06 45 	. E 
	adc a,c			;6cfc	89 	. 
	nop			;6cfd	00 	. 
	rlca			;6cfe	07 	. 
	rlca			;6cff	07 	. 
	inc (hl)			;6d00	34 	4 
	adc a,c			;6d01	89 	. 
	rst 38h			;6d02	ff 	. 
	inc bc			;6d03	03 	. 
	ld bc,02000h		;6d04	01 00 20 	. .   
	rlca			;6d07	07 	. 
	inc (hl)			;6d08	34 	4 
	adc a,c			;6d09	89 	. 
	rst 38h			;6d0a	ff 	. 
	inc bc			;6d0b	03 	. 
	ld bc,06000h		;6d0c	01 00 60 	. . ` 
	jp m,08994h		;6d0f	fa 94 89 	. . . 
	dec hl			;6d12	2b 	+ 
	dec l			;6d13	2d 	- 
	rst 38h			;6d14	ff 	. 
	nop			;6d15	00 	. 
	ld b,b			;6d16	40 	@ 
	call m,089b4h		;6d17	fc b4 89 	. . . 
	nop			;6d1a	00 	. 
	ld b,0fah		;6d1b	06 fa 	. . 
	or h			;6d1d	b4 	. 
	adc a,b			;6d1e	88 	. 
	nop			;6d1f	00 	. 
	ld a,(de)			;6d20	1a 	. 
	call m,088bah		;6d21	fc ba 88 	. . . 
	nop			;6d24	00 	. 
	inc d			;6d25	14 	. 
	jp m,087c0h		;6d26	fa c0 87 	. . . 
	rlca			;6d29	07 	. 
	rlca			;6d2a	07 	. 
	jp m,087dfh		;6d2b	fa df 87 	. . . 
	rlca			;6d2e	07 	. 
	rlca			;6d2f	07 	. 
	jp m,087e0h		;6d30	fa e0 87 	. . . 
	ld a,(bc)			;6d33	0a 	. 
	rlca			;6d34	07 	. 
	ld bc,087b9h		;6d35	01 b9 87 	. . . 
	ld (bc),a			;6d38	02 	. 
	dec b			;6d39	05 	. 
	ex af,af'			;6d3a	08 	. 
	ld bc,087b4h		;6d3b	01 b4 87 	. . . 
	ld h,l			;6d3e	65 	e 
	rst 38h			;6d3f	ff 	. 
	inc bc			;6d40	03 	. 
	ld bc,01200h		;6d41	01 00 12 	. . . 
	jp m,089a2h		;6d44	fa a2 89 	. . . 
	nop			;6d47	00 	. 
	inc de			;6d48	13 	. 
	jp m,089c1h		;6d49	fa c1 89 	. . . 
	nop			;6d4c	00 	. 
	inc d			;6d4d	14 	. 
	jp m,089e0h		;6d4e	fa e0 89 	. . . 
	inc l			;6d51	2c 	, 
	rst 38h			;6d52	ff 	. 
	inc bc			;6d53	03 	. 
	ld bc,00a02h		;6d54	01 02 0a 	. . . 
	inc bc			;6d57	03 	. 
	jp m,08994h		;6d58	fa 94 89 	. . . 
	ld (bc),a			;6d5b	02 	. 
	rlca			;6d5c	07 	. 
	inc bc			;6d5d	03 	. 
	jp m,089adh		;6d5e	fa ad 89 	. . . 
	nop			;6d61	00 	. 
	ld de,0bdf9h		;6d62	11 f9 bd 	. . . 
	adc a,c			;6d65	89 	. 
	jr nc,$+1		;6d66	30 ff 	0 . 
	inc bc			;6d68	03 	. 
	ld bc,02c00h		;6d69	01 00 2c 	. . , 
	call m,089c8h		;6d6c	fc c8 89 	. . . 
	ld (bc),a			;6d6f	02 	. 
	inc d			;6d70	14 	. 
	ld (bc),a			;6d71	02 	. 
	jp m,089b4h		;6d72	fa b4 89 	. . . 
	nop			;6d75	00 	. 
	rlca			;6d76	07 	. 
	jp m,088cdh		;6d77	fa cd 88 	. . . 
	rlca			;6d7a	07 	. 
	rlca			;6d7b	07 	. 
	jp m,088ech		;6d7c	fa ec 88 	. . . 
	rlca			;6d7f	07 	. 
	rlca			;6d80	07 	. 
	jp m,088edh		;6d81	fa ed 88 	. . . 
	inc c			;6d84	0c 	. 
	ld b,000h		;6d85	06 00 	. . 
	xor b			;6d87	a8 	. 
	adc a,c			;6d88	89 	. 
	ld (bc),a			;6d89	02 	. 
	ld b,007h		;6d8a	06 07 	. . 
	nop			;6d8c	00 	. 
	xor 088h		;6d8d	ee 88 	. . 
	rst 38h			;6d8f	ff 	. 
	inc bc			;6d90	03 	. 
	ld bc,01d02h		;6d91	01 02 1d 	. . . 
	ld (bc),a			;6d94	02 	. 
	jp m,089b7h		;6d95	fa b7 89 	. . . 
	rst 38h			;6d98	ff 	. 
	inc bc			;6d99	03 	. 
	ld bc,02000h		;6d9a	01 00 20 	. .   
	cp 094h		;6d9d	fe 94 	. . 
	adc a,c			;6d9f	89 	. 
	nop			;6da0	00 	. 
	ld b,b			;6da1	40 	@ 
	jp m,089b4h		;6da2	fa b4 89 	. . . 
	rst 38h			;6da5	ff 	. 
	inc bc			;6da6	03 	. 
	ld bc,02000h		;6da7	01 00 20 	. .   
	cp 094h		;6daa	fe 94 	. . 
	adc a,c			;6dac	89 	. 
	nop			;6dad	00 	. 
	ld b,b			;6dae	40 	@ 
	jp m,089b4h		;6daf	fa b4 89 	. . . 
	ld (bc),a			;6db2	02 	. 
	ld (bc),a			;6db3	02 	. 
	ld b,010h		;6db4	06 10 	. . 
	rst 20h			;6db6	e7 	. 
	adc a,b			;6db7	88 	. 
	nop			;6db8	00 	. 
	dec b			;6db9	05 	. 
	call z,088c6h		;6dba	cc c6 88 	. . . 
	ld (bc),a			;6dbd	02 	. 
	dec bc			;6dbe	0b 	. 
	ld b,01eh		;6dbf	06 1e 	. . 
	ld bc,01288h		;6dc1	01 88 12 	. . . 
	inc e			;6dc4	1c 	. 
	jp po,01c87h		;6dc5	e2 87 1c 	. . . 
	ld h,c			;6dc8	61 	a 
	adc a,b			;6dc9	88 	. 
	inc e			;6dca	1c 	. 
	nop			;6dcb	00 	. 
	adc a,b			;6dcc	88 	. 
	inc e			;6dcd	1c 	. 
	ccf			;6dce	3f 	? 
	adc a,b			;6dcf	88 	. 
	jr nz,$-23		;6dd0	20 e7 	  . 
	add a,a			;6dd2	87 	. 
	jr nz,$+76		;6dd3	20 4a 	  J 
	adc a,b			;6dd5	88 	. 
	jr nz,$+11		;6dd6	20 09 	  . 
	adc a,b			;6dd8	88 	. 
	inc b			;6dd9	04 	. 
	ld a,a			;6dda	7f 	 
	ld h,(hl)			;6ddb	66 	f 
	adc a,c			;6ddc	89 	. 
	inc b			;6ddd	04 	. 
	add a,b			;6dde	80 	. 
	add a,(hl)			;6ddf	86 	. 
	adc a,c			;6de0	89 	. 
	rst 38h			;6de1	ff 	. 
	inc bc			;6de2	03 	. 
	ld bc,00402h		;6de3	01 02 04 	. . . 
	inc b			;6de6	04 	. 
	jp m,087b4h		;6de7	fa b4 87 	. . . 
	ld (bc),a			;6dea	02 	. 
	inc b			;6deb	04 	. 
	ld b,0fah		;6dec	06 fa 	. . 
	inc (hl)			;6dee	34 	4 
	adc a,c			;6def	89 	. 
	nop			;6df0	00 	. 
	dec bc			;6df1	0b 	. 
	jp p,08938h		;6df2	f2 38 89 	. 8 . 
	nop			;6df5	00 	. 
	ld de,04307h		;6df6	11 07 43 	. . C 
	adc a,c			;6df9	89 	. 
	rlca			;6dfa	07 	. 
	inc b			;6dfb	04 	. 
	inc bc			;6dfc	03 	. 
	ld e,e			;6dfd	5b 	[ 
	adc a,c			;6dfe	89 	. 
	rlca			;6dff	07 	. 
	dec b			;6e00	05 	. 
	di			;6e01	f3 	. 
	ld e,h			;6e02	5c 	\ 
	adc a,c			;6e03	89 	. 
	rst 38h			;6e04	ff 	. 
	inc bc			;6e05	03 	. 
	ld bc,00402h		;6e06	01 02 04 	. . . 
	ld (de),a			;6e09	12 	. 
	jp m,087b4h		;6e0a	fa b4 87 	. . . 
	rst 38h			;6e0d	ff 	. 
	inc bc			;6e0e	03 	. 
	ld bc,00402h		;6e0f	01 02 04 	. . . 
	ld (de),a			;6e12	12 	. 
	jp m,087b4h		;6e13	fa b4 87 	. . . 
	inc b			;6e16	04 	. 
	jp m,089b8h		;6e17	fa b8 89 	. . . 
	ld bc,0010eh		;6e1a	01 0e 01 	. . . 
	rst 30h			;6e1d	f7 	. 
	add a,a			;6e1e	87 	. 
	ld bc,00106h		;6e1f	01 06 01 	. . . 
	or 087h		;6e22	f6 87 	. . 
	ld (bc),a			;6e24	02 	. 
	ld (bc),a			;6e25	02 	. 
	inc bc			;6e26	03 	. 
	ld bc,088f5h		;6e27	01 f5 88 	. . . 
	rst 38h			;6e2a	ff 	. 
	inc bc			;6e2b	03 	. 
	ld bc,00402h		;6e2c	01 02 04 	. . . 
	inc bc			;6e2f	03 	. 
	jp m,08994h		;6e30	fa 94 89 	. . . 
	rst 38h			;6e33	ff 	. 
	ld (bc),a			;6e34	02 	. 
	inc b			;6e35	04 	. 
	rrca			;6e36	0f 	. 
	ld bc,087b4h		;6e37	01 b4 87 	. . . 
	ld (bc),a			;6e3a	02 	. 
	inc bc			;6e3b	03 	. 
	ld b,0fah		;6e3c	06 fa 	. . 
	or a			;6e3e	b7 	. 
	add a,a			;6e3f	87 	. 
	nop			;6e40	00 	. 
	ld a,(de)			;6e41	1a 	. 
	call m,087bah		;6e42	fc ba 87 	. . . 
	nop			;6e45	00 	. 
	ex af,af'			;6e46	08 	. 
	jp m,08997h		;6e47	fa 97 89 	. . . 
	nop			;6e4a	00 	. 
	inc bc			;6e4b	03 	. 
	cp 094h		;6e4c	fe 94 	. . 
	adc a,c			;6e4e	89 	. 
	nop			;6e4f	00 	. 
	ld b,b			;6e50	40 	@ 
	jp m,089b4h		;6e51	fa b4 89 	. . . 
	ld bc,0020ah		;6e54	01 0a 02 	. . . 
	ld e,b			;6e57	58 	X 
	adc a,b			;6e58	88 	. 
	nop			;6e59	00 	. 
	inc b			;6e5a	04 	. 
	call m,088b0h		;6e5b	fc b0 88 	. . . 
	daa			;6e5e	27 	' 
	ld l,l			;6e5f	6d 	m 
	rst 38h			;6e60	ff 	. 
	inc bc			;6e61	03 	. 
	ld bc,00402h		;6e62	01 02 04 	. . . 
	ld (bc),a			;6e65	02 	. 
	jp m,087b4h		;6e66	fa b4 87 	. . . 
	ld (bc),a			;6e69	02 	. 
	ld a,(bc)			;6e6a	0a 	. 
	inc b			;6e6b	04 	. 
	jp m,087f4h		;6e6c	fa f4 87 	. . . 
	ld (bc),a			;6e6f	02 	. 
	ex af,af'			;6e70	08 	. 
	ex af,af'			;6e71	08 	. 
	inc de			;6e72	13 	. 
	ld (hl),h			;6e73	74 	t 
	adc a,b			;6e74	88 	. 
	nop			;6e75	00 	. 
	ld c,0fah		;6e76	0e fa 	. . 
	ld (hl),h			;6e78	74 	t 
	adc a,c			;6e79	89 	. 
	nop			;6e7a	00 	. 
	ld h,b			;6e7b	60 	` 
	jp m,08994h		;6e7c	fa 94 89 	. . . 
	nop			;6e7f	00 	. 
	ld (de),a			;6e80	12 	. 
	cp 0a2h		;6e81	fe a2 	. . 
	adc a,c			;6e83	89 	. 
	ld bc,03208h		;6e84	01 08 32 	. . 2 
	cp h			;6e87	bc 	. 
	adc a,d			;6e88	8a 	. 
	ld l,h			;6e89	6c 	l 
	rst 38h			;6e8a	ff 	. 
	inc bc			;6e8b	03 	. 
	ld bc,00402h		;6e8c	01 02 04 	. . . 
	inc bc			;6e8f	03 	. 
	jp m,087b4h		;6e90	fa b4 87 	. . . 
	ld (bc),a			;6e93	02 	. 
	inc b			;6e94	04 	. 
	inc bc			;6e95	03 	. 
	jp m,08994h		;6e96	fa 94 89 	. . . 
	nop			;6e99	00 	. 
	rlca			;6e9a	07 	. 
	jp p,089b8h		;6e9b	f2 b8 89 	. . . 
	ld bc,0020dh		;6e9e	01 0d 02 	. . . 
	or 087h		;6ea1	f6 87 	. . 
	rst 38h			;6ea3	ff 	. 
	nop			;6ea4	00 	. 
	ld a,(0bafch)		;6ea5	3a fc ba 	: . . 
	adc a,c			;6ea8	89 	. 
	ld (bc),a			;6ea9	02 	. 
	inc bc			;6eaa	03 	. 
	ld (de),a			;6eab	12 	. 
	ld bc,087b4h		;6eac	01 b4 87 	. . . 
	ld (bc),a			;6eaf	02 	. 
	inc bc			;6eb0	03 	. 
	ld (de),a			;6eb1	12 	. 
	jp m,087b7h		;6eb2	fa b7 87 	. . . 
	jr z,$+65		;6eb5	28 3f 	( ? 
	ld h,d			;6eb7	62 	b 
	rst 38h			;6eb8	ff 	. 
	nop			;6eb9	00 	. 
	ld a,(de)			;6eba	1a 	. 
	call m,087bah		;6ebb	fc ba 87 	. . . 
	ld (bc),a			;6ebe	02 	. 
	inc b			;6ebf	04 	. 
	inc bc			;6ec0	03 	. 
	call m,08970h		;6ec1	fc 70 89 	. p . 
	nop			;6ec4	00 	. 
	daa			;6ec5	27 	' 
	call m,089cdh		;6ec6	fc cd 89 	. . . 
	ld bc,00209h		;6ec9	01 09 02 	. . . 
	ld e,b			;6ecc	58 	X 
	adc a,b			;6ecd	88 	. 
	ld (bc),a			;6ece	02 	. 
	inc b			;6ecf	04 	. 
	ld (de),a			;6ed0	12 	. 
	ld bc,087b4h		;6ed1	01 b4 87 	. . . 
	ld (bc),a			;6ed4	02 	. 
	inc bc			;6ed5	03 	. 
	dec b			;6ed6	05 	. 
	jp m,087b7h		;6ed7	fa b7 87 	. . . 
	ld (bc),a			;6eda	02 	. 
	inc bc			;6edb	03 	. 
	inc b			;6edc	04 	. 
	jp m,08977h		;6edd	fa 77 89 	. w . 
	ld hl,0ea01h		;6ee0	21 01 ea 	! . . 
	adc a,c			;6ee3	89 	. 
	ld h,c			;6ee4	61 	a 
	ld h,d			;6ee5	62 	b 
	ld h,e			;6ee6	63 	c 
	inc de			;6ee7	13 	. 
	rst 38h			;6ee8	ff 	. 
	nop			;6ee9	00 	. 
	ld h,0fch		;6eea	26 fc 	& . 
	or a			;6eec	b7 	. 
	add a,a			;6eed	87 	. 
	nop			;6eee	00 	. 
	ld a,(0bafch)		;6eef	3a fc ba 	: . . 
	adc a,c			;6ef2	89 	. 
	ld (bc),a			;6ef3	02 	. 
	ld b,008h		;6ef4	06 08 	. . 
	jp m,088f4h		;6ef6	fa f4 88 	. . . 
	ld (bc),a			;6ef9	02 	. 
	inc bc			;6efa	03 	. 
	dec b			;6efb	05 	. 
	ld bc,08954h		;6efc	01 54 89 	. T . 
	ld (bc),a			;6eff	02 	. 
	inc bc			;6f00	03 	. 
	dec bc			;6f01	0b 	. 
	ld bc,087b4h		;6f02	01 b4 87 	. . . 
	ld (bc),a			;6f05	02 	. 
	inc bc			;6f06	03 	. 
	inc b			;6f07	04 	. 
	jp m,087b7h		;6f08	fa b7 87 	. . . 
	ld hl,0ca10h		;6f0b	21 10 ca 	! . . 
	add a,a			;6f0e	87 	. 
	jr z,$+1		;6f0f	28 ff 	( . 
	nop			;6f11	00 	. 
	ld b,0fch		;6f12	06 fc 	. . 
	or h			;6f14	b4 	. 
	add a,a			;6f15	87 	. 
	nop			;6f16	00 	. 
	ld a,(bc)			;6f17	0a 	. 
	call m,089b4h		;6f18	fc b4 89 	. . . 
	nop			;6f1b	00 	. 
	jr nz,$-2		;6f1c	20 fc 	  . 
	call nc,00089h		;6f1e	d4 89 00 	. . . 
	inc b			;6f21	04 	. 
	ld l,a			;6f22	6f 	o 
	call po,02189h		;6f23	e4 89 21 	. . ! 
	ld de,087d7h		;6f26	11 d7 87 	. . . 
	ld h,e			;6f29	63 	c 
	inc de			;6f2a	13 	. 
	rst 38h			;6f2b	ff 	. 
	nop			;6f2c	00 	. 
	jr nz,$-2		;6f2d	20 fc 	  . 
	ld d,h			;6f2f	54 	T 
	adc a,c			;6f30	89 	. 
	nop			;6f31	00 	. 
	ld b,06fh		;6f32	06 6f 	. o 
	ld l,b			;6f34	68 	h 
	adc a,c			;6f35	89 	. 
	ld h,d			;6f36	62 	b 
	ld h,e			;6f37	63 	c 
	inc de			;6f38	13 	. 
	ld a,(03b3ch)		;6f39	3a 3c 3b 	: < ; 
	rst 38h			;6f3c	ff 	. 
	add hl,bc			;6f3d	09 	. 
	dec b			;6f3e	05 	. 
	ld b,002h		;6f3f	06 02 	. . 
	dec b			;6f41	05 	. 
	dec b			;6f42	05 	. 
	ld b,002h		;6f43	06 02 	. . 
	dec b			;6f45	05 	. 
	dec b			;6f46	05 	. 
	ld b,002h		;6f47	06 02 	. . 
	dec b			;6f49	05 	. 
	ld c,012h		;6f4a	0e 12 	. . 
	jp 0ff87h		;6f4c	c3 87 ff 	. . . 
	add hl,bc			;6f4f	09 	. 
	dec b			;6f50	05 	. 
	dec b			;6f51	05 	. 
	dec b			;6f52	05 	. 
	dec b			;6f53	05 	. 
	ld c,004h		;6f54	0e 04 	. . 
	inc b			;6f56	04 	. 
	ld c,001h		;6f57	0e 01 	. . 
	ld bc,00101h		;6f59	01 01 01 	. . . 
	rst 38h			;6f5c	ff 	. 
	add hl,bc			;6f5d	09 	. 
	dec b			;6f5e	05 	. 
	ld b,002h		;6f5f	06 02 	. . 
	dec b			;6f61	05 	. 
	inc b			;6f62	04 	. 
	rlca			;6f63	07 	. 
	ld (bc),a			;6f64	02 	. 
	dec b			;6f65	05 	. 
	ld bc,00301h		;6f66	01 01 03 	. . . 
	dec b			;6f69	05 	. 
	ld c,00fh		;6f6a	0e 0f 	. . 
	jp 0ff87h		;6f6c	c3 87 ff 	. . . 
	add hl,bc			;6f6f	09 	. 
	dec b			;6f70	05 	. 
	ld b,002h		;6f71	06 02 	. . 
	dec b			;6f73	05 	. 
	dec b			;6f74	05 	. 
	ld b,00bh		;6f75	06 0b 	. . 
	ld c,005h		;6f77	0e 05 	. . 
	ex af,af'			;6f79	08 	. 
	ld bc,00e01h		;6f7a	01 01 0e 	. . . 
	rrca			;6f7d	0f 	. 
	jp 0ff87h		;6f7e	c3 87 ff 	. . . 
	add hl,bc			;6f81	09 	. 
	dec b			;6f82	05 	. 
	dec b			;6f83	05 	. 
	dec b			;6f84	05 	. 
	dec b			;6f85	05 	. 
	inc b			;6f86	04 	. 
	ld c,00dh		;6f87	0e 0d 	. . 
	dec b			;6f89	05 	. 
	ld bc,00209h		;6f8a	01 09 02 	. . . 
	dec b			;6f8d	05 	. 
	ld c,00ch		;6f8e	0e 0c 	. . 
	add a,e			;6f90	83 	. 
	adc a,b			;6f91	88 	. 
	nop			;6f92	00 	. 
	ld b,0f2h		;6f93	06 f2 	. . 
	sbc a,l			;6f95	9d 	. 
	adc a,c			;6f96	89 	. 
	rst 38h			;6f97	ff 	. 
	add hl,bc			;6f98	09 	. 
	dec b			;6f99	05 	. 
	dec b			;6f9a	05 	. 
	dec b			;6f9b	05 	. 
	dec b			;6f9c	05 	. 
	dec b			;6f9d	05 	. 
	inc c			;6f9e	0c 	. 
	ld c,004h		;6f9f	0e 04 	. . 
	dec b			;6fa1	05 	. 
	ld b,00ah		;6fa2	06 0a 	. . 
	ld bc,00c0eh		;6fa4	01 0e 0c 	. . . 
	add a,e			;6fa7	83 	. 
	adc a,b			;6fa8	88 	. 
	nop			;6fa9	00 	. 
	dec b			;6faa	05 	. 
	jp p,089a5h		;6fab	f2 a5 89 	. . . 
	rst 38h			;6fae	ff 	. 
	add hl,bc			;6faf	09 	. 
	dec b			;6fb0	05 	. 
	ld b,002h		;6fb1	06 02 	. . 
	dec b			;6fb3	05 	. 
	inc b			;6fb4	04 	. 
	rlca			;6fb5	07 	. 
	dec bc			;6fb6	0b 	. 
	ld c,001h		;6fb7	0e 01 	. . 
	ld bc,00101h		;6fb9	01 01 01 	. . . 
	ld c,00fh		;6fbc	0e 0f 	. . 
	jp 0ff87h		;6fbe	c3 87 ff 	. . . 
	add hl,bc			;6fc1	09 	. 
	dec b			;6fc2	05 	. 
	dec b			;6fc3	05 	. 
	dec b			;6fc4	05 	. 
	dec b			;6fc5	05 	. 
	inc b			;6fc6	04 	. 
	ld c,004h		;6fc7	0e 04 	. . 
	ld c,001h		;6fc9	0e 01 	. . 
	add hl,bc			;6fcb	09 	. 
	ld a,(bc)			;6fcc	0a 	. 
	ld bc,00d00h		;6fcd	01 00 0d 	. . . 
	jp p,0899dh		;6fd0	f2 9d 89 	. . . 
	ld c,00ch		;6fd3	0e 0c 	. . 
	add a,e			;6fd5	83 	. 
	adc a,b			;6fd6	88 	. 
	rst 38h			;6fd7	ff 	. 
	add hl,bc			;6fd8	09 	. 
	dec b			;6fd9	05 	. 
	ld b,002h		;6fda	06 02 	. . 
	dec b			;6fdc	05 	. 
	dec b			;6fdd	05 	. 
	ld b,00bh		;6fde	06 0b 	. . 
	inc b			;6fe0	04 	. 
	dec b			;6fe1	05 	. 
	ld b,00ah		;6fe2	06 0a 	. . 
	ld bc,0120eh		;6fe4	01 0e 12 	. . . 
	jp 00087h		;6fe7	c3 87 00 	. . . 
	dec b			;6fea	05 	. 
	jp p,089a5h		;6feb	f2 a5 89 	. . . 
	rst 38h			;6fee	ff 	. 
	add hl,bc			;6fef	09 	. 
	dec b			;6ff0	05 	. 
	ld b,002h		;6ff1	06 02 	. . 
	dec b			;6ff3	05 	. 
	ld c,007h		;6ff4	0e 07 	. . 
	ld (bc),a			;6ff6	02 	. 
	dec b			;6ff7	05 	. 
	ld bc,00209h		;6ff8	01 09 02 	. . . 
	dec b			;6ffb	05 	. 
	ld c,012h		;6ffc	0e 12 	. . 
	jp 00087h		;6ffe	c3 87 00 	. . . 
	ld b,0f2h		;7001	06 f2 	. . 
	sbc a,l			;7003	9d 	. 
	adc a,c			;7004	89 	. 
	rst 38h			;7005	ff 	. 
	add hl,bc			;7006	09 	. 
	dec b			;7007	05 	. 
	ld b,002h		;7008	06 02 	. . 
	dec b			;700a	05 	. 
	inc b			;700b	04 	. 
	rlca			;700c	07 	. 
	dec bc			;700d	0b 	. 
	inc b			;700e	04 	. 
	ld bc,00a09h		;700f	01 09 0a 	. . . 
	ld bc,00d00h		;7012	01 00 0d 	. . . 
	jp p,0899dh		;7015	f2 9d 89 	. . . 
	ld c,012h		;7018	0e 12 	. . 
	jp 0ff87h		;701a	c3 87 ff 	. . . 
	add hl,bc			;701d	09 	. 
	dec b			;701e	05 	. 
	dec b			;701f	05 	. 
	dec b			;7020	05 	. 
	dec b			;7021	05 	. 
	dec b			;7022	05 	. 
	inc c			;7023	0c 	. 
	inc b			;7024	04 	. 
	ld c,005h		;7025	0e 05 	. . 
	ex af,af'			;7027	08 	. 
	ld bc,0ff01h		;7028	01 01 ff 	. . . 
	add hl,bc			;702b	09 	. 
	dec b			;702c	05 	. 
	dec b			;702d	05 	. 
	dec b			;702e	05 	. 
	dec b			;702f	05 	. 
	ld c,004h		;7030	0e 04 	. . 
	dec c			;7032	0d 	. 
	dec b			;7033	05 	. 
	ld bc,00301h		;7034	01 01 03 	. . . 
	dec b			;7037	05 	. 
	rst 38h			;7038	ff 	. 
	add hl,bc			;7039	09 	. 
	inc c			;703a	0c 	. 
	rlca			;703b	07 	. 
	dec bc			;703c	0b 	. 
	dec c			;703d	0d 	. 
	ld b,000h		;703e	06 00 	. . 
	nop			;7040	00 	. 
	ld (bc),a			;7041	02 	. 
	ex af,af'			;7042	08 	. 
	ld bc,00301h		;7043	01 01 03 	. . . 
	ld c,00fh		;7046	0e 0f 	. . 
	jp 0ff87h		;7048	c3 87 ff 	. . . 
	add hl,bc			;704b	09 	. 
	dec b			;704c	05 	. 
	dec b			;704d	05 	. 
	dec b			;704e	05 	. 
	dec b			;704f	05 	. 
	inc b			;7050	04 	. 
	ld c,00eh		;7051	0e 0e 	. . 
	inc b			;7053	04 	. 
	ld bc,00101h		;7054	01 01 01 	. . . 
	ld bc,009ffh		;7057	01 ff 09 	. . . 
	rrca			;705a	0f 	. 
	rrca			;705b	0f 	. 
	rrca			;705c	0f 	. 
	rrca			;705d	0f 	. 
	nop			;705e	00 	. 
	nop			;705f	00 	. 
	nop			;7060	00 	. 
	nop			;7061	00 	. 
	ld bc,00101h		;7062	01 01 01 	. . . 
	ld bc,02c30h		;7065	01 30 2c 	. 0 , 
	rst 38h			;7068	ff 	. 
	add hl,bc			;7069	09 	. 
	djnz $+18		;706a	10 10 	. . 
	djnz $+18		;706c	10 10 	. . 
	djnz $+18		;706e	10 10 	. . 
	djnz $+18		;7070	10 10 	. . 
	ld de,01010h		;7072	11 10 10 	. . . 
	djnz $+21		;7075	10 13 	. . 
	rst 38h			;7077	ff 	. 
	add hl,bc			;7078	09 	. 
	ld (de),a			;7079	12 	. 
	djnz $+18		;707a	10 10 	. . 
	djnz $+20		;707c	10 12 	. . 
	djnz $+18		;707e	10 10 	. . 
	djnz $+20		;7080	10 12 	. . 
	djnz $+18		;7082	10 10 	. . 
	djnz $+21		;7084	10 13 	. . 
	rst 38h			;7086	ff 	. 
	add hl,bc			;7087	09 	. 
	ld (de),a			;7088	12 	. 
	djnz $+18		;7089	10 10 	. . 
	djnz $+21		;708b	10 13 	. . 
	djnz $+18		;708d	10 10 	. . 
	djnz $+22		;708f	10 14 	. . 
	djnz $+18		;7091	10 10 	. . 
	djnz $+21		;7093	10 13 	. . 
	rst 38h			;7095	ff 	. 
	add hl,bc			;7096	09 	. 
	inc c			;7097	0c 	. 
	inc b			;7098	04 	. 
	inc b			;7099	04 	. 
	ld c,007h		;709a	0e 07 	. . 
	nop			;709c	00 	. 
	nop			;709d	00 	. 
	nop			;709e	00 	. 
	ld bc,00901h		;709f	01 01 09 	. . . 
	nop			;70a2	00 	. 
	rst 38h			;70a3	ff 	. 
	add hl,bc			;70a4	09 	. 
	inc b			;70a5	04 	. 
	ld c,004h		;70a6	0e 04 	. . 
	ld c,000h		;70a8	0e 00 	. . 
	nop			;70aa	00 	. 
	nop			;70ab	00 	. 
	nop			;70ac	00 	. 
	nop			;70ad	00 	. 
	nop			;70ae	00 	. 
	nop			;70af	00 	. 
	nop			;70b0	00 	. 
	rst 38h			;70b1	ff 	. 
	add hl,bc			;70b2	09 	. 
	inc b			;70b3	04 	. 
	ld c,00dh		;70b4	0e 0d 	. . 
	dec b			;70b6	05 	. 
	nop			;70b7	00 	. 
	nop			;70b8	00 	. 
	dec bc			;70b9	0b 	. 
	inc b			;70ba	04 	. 
	nop			;70bb	00 	. 
	nop			;70bc	00 	. 
	ld a,(bc)			;70bd	0a 	. 
	ld bc,009ffh		;70be	01 ff 09 	. . . 
	dec b			;70c1	05 	. 
	dec b			;70c2	05 	. 
	ld b,000h		;70c3	06 00 	. . 
	dec b			;70c5	05 	. 
	inc c			;70c6	0c 	. 
	rlca			;70c7	07 	. 
	nop			;70c8	00 	. 
	dec b			;70c9	05 	. 
	ld b,000h		;70ca	06 00 	. . 
	nop			;70cc	00 	. 
	rst 38h			;70cd	ff 	. 
	inc bc			;70ce	03 	. 
	ex af,af'			;70cf	08 	. 
	rst 38h			;70d0	ff 	. 
	add hl,bc			;70d1	09 	. 
	nop			;70d2	00 	. 
	nop			;70d3	00 	. 
	dec bc			;70d4	0b 	. 
	dec c			;70d5	0d 	. 
	nop			;70d6	00 	. 
	nop			;70d7	00 	. 
	nop			;70d8	00 	. 
	dec bc			;70d9	0b 	. 
	nop			;70da	00 	. 
	nop			;70db	00 	. 
	nop			;70dc	00 	. 
	ld a,(bc)			;70dd	0a 	. 
	rst 38h			;70de	ff 	. 
	add hl,bc			;70df	09 	. 
	dec b			;70e0	05 	. 
	ex af,af'			;70e1	08 	. 
	add hl,bc			;70e2	09 	. 
	nop			;70e3	00 	. 
	dec b			;70e4	05 	. 
	dec b			;70e5	05 	. 
	ex af,af'			;70e6	08 	. 
	ld bc,00505h		;70e7	01 05 05 	. . . 
	dec b			;70ea	05 	. 
	dec b			;70eb	05 	. 
	rst 38h			;70ec	ff 	. 
	add hl,bc			;70ed	09 	. 
	nop			;70ee	00 	. 
	ld a,(bc)			;70ef	0a 	. 
	ld bc,00109h		;70f0	01 09 01 	. . . 
	inc bc			;70f3	03 	. 
	dec b			;70f4	05 	. 
	ld b,005h		;70f5	06 05 	. . 
	dec b			;70f7	05 	. 
	dec b			;70f8	05 	. 
	ex af,af'			;70f9	08 	. 
	rlca			;70fa	07 	. 
	dec b			;70fb	05 	. 
	inc bc			;70fc	03 	. 
	ccf			;70fd	3f 	? 
	adc a,b			;70fe	88 	. 
	rlca			;70ff	07 	. 
	dec b			;7100	05 	. 
	di			;7101	f3 	. 
	ld b,b			;7102	40 	@ 
	adc a,b			;7103	88 	. 
	rst 38h			;7104	ff 	. 
	add hl,bc			;7105	09 	. 
	nop			;7106	00 	. 
	nop			;7107	00 	. 
	nop			;7108	00 	. 
	ld (bc),a			;7109	02 	. 
	nop			;710a	00 	. 
	nop			;710b	00 	. 
	nop			;710c	00 	. 
	dec bc			;710d	0b 	. 
	ld bc,00101h		;710e	01 01 01 	. . . 
	ld bc,003ffh		;7111	01 ff 03 	. . . 
	ld bc,01d00h		;7114	01 00 1d 	. . . 
	cp 097h		;7117	fe 97 	. . 
	adc a,c			;7119	89 	. 
	ld (bc),a			;711a	02 	. 
	inc bc			;711b	03 	. 
	djnz $-4		;711c	10 fa 	. . 
	or h			;711e	b4 	. 
	add a,a			;711f	87 	. 
	nop			;7120	00 	. 
	ld b,b			;7121	40 	@ 
	jp m,089b4h		;7122	fa b4 89 	. . . 
	nop			;7125	00 	. 
	ld c,0f2h		;7126	0e f2 	. . 
	cp l			;7128	bd 	. 
	adc a,c			;7129	89 	. 
	nop			;712a	00 	. 
	ld a,(bc)			;712b	0a 	. 
	ex af,af'			;712c	08 	. 
	rst 18h			;712d	df 	. 
	adc a,c			;712e	89 	. 
	nop			;712f	00 	. 
	inc c			;7130	0c 	. 
	ld bc,0899eh		;7131	01 9e 89 	. . . 
	ld c,002h		;7134	0e 02 	. . 
	jp 0ff89h		;7136	c3 89 ff 	. . . 
	inc bc			;7139	03 	. 
	ld bc,00302h		;713a	01 02 03 	. . . 
	rrca			;713d	0f 	. 
	jp m,087b4h		;713e	fa b4 87 	. . . 
	nop			;7141	00 	. 
	ld h,b			;7142	60 	` 
	jp m,08994h		;7143	fa 94 89 	. . . 
	rst 38h			;7146	ff 	. 
	inc bc			;7147	03 	. 
	jp m,01f02h		;7148	fa 02 1f 	. . . 
	inc c			;714b	0c 	. 
	ex af,af'			;714c	08 	. 
	or l			;714d	b5 	. 
	add a,a			;714e	87 	. 
	ld (bc),a			;714f	02 	. 
	ld b,006h		;7150	06 06 	. . 
	ex af,af'			;7152	08 	. 
	add hl,sp			;7153	39 	9 
	adc a,c			;7154	89 	. 
	ld (bc),a			;7155	02 	. 
	rrca			;7156	0f 	. 
	inc bc			;7157	03 	. 
	ex af,af'			;7158	08 	. 
	ld b,l			;7159	45 	E 
	adc a,c			;715a	89 	. 
	dec c			;715b	0d 	. 
	ld (bc),a			;715c	02 	. 
	ex af,af'			;715d	08 	. 
	ld b,e			;715e	43 	C 
	adc a,c			;715f	89 	. 
	ld bc,0d506h		;7160	01 06 d5 	. . . 
	jr c,$-117		;7163	38 89 	8 . 
	ld h,e			;7165	63 	c 
	ld h,h			;7166	64 	d 
	inc de			;7167	13 	. 
	ld bc,0d406h		;7168	01 06 d4 	. . . 
	ccf			;716b	3f 	? 
	adc a,c			;716c	89 	. 
	ld de,08939h		;716d	11 39 89 	. 9 . 
	rst 38h			;7170	ff 	. 
	inc bc			;7171	03 	. 
	jp m,00602h		;7172	fa 02 06 	. . . 
	ld (de),a			;7175	12 	. 
	ex af,af'			;7176	08 	. 
	cp c			;7177	b9 	. 
	add a,a			;7178	87 	. 
	ld bc,0d512h		;7179	01 12 d5 	. . . 
	cp b			;717c	b8 	. 
	add a,a			;717d	87 	. 
	ld bc,0d412h		;717e	01 12 d4 	. . . 
	cp a			;7181	bf 	. 
	add a,a			;7182	87 	. 
	ld l,0ffh		;7183	2e ff 	. . 
	inc bc			;7185	03 	. 
	jp m,01b02h		;7186	fa 02 1b 	. . . 
	ld c,008h		;7189	0e 08 	. . 
	cp c			;718b	b9 	. 
	add a,a			;718c	87 	. 
	nop			;718d	00 	. 
	dec d			;718e	15 	. 
	jp m,087bfh		;718f	fa bf 87 	. . . 
	nop			;7192	00 	. 
	ld c,008h		;7193	0e 08 	. . 
	add a,(hl)			;7195	86 	. 
	adc a,c			;7196	89 	. 
	ld de,08959h		;7197	11 59 89 	. Y . 
	ld bc,0d50eh		;719a	01 0e d5 	. . . 
	cp b			;719d	b8 	. 
	add a,a			;719e	87 	. 
	ld bc,0320dh		;719f	01 0d 32 	. . 2 
	rra			;71a2	1f 	. 
	adc a,d			;71a3	8a 	. 
	nop			;71a4	00 	. 
	ld b,008h		;71a5	06 08 	. . 
	ld e,c			;71a7	59 	Y 
	adc a,c			;71a8	89 	. 
	rst 38h			;71a9	ff 	. 
	ld (bc),a			;71aa	02 	. 
	ld a,(bc)			;71ab	0a 	. 
	ld (de),a			;71ac	12 	. 
	jp m,087b4h		;71ad	fa b4 87 	. . . 
	ld (bc),a			;71b0	02 	. 
	ex af,af'			;71b1	08 	. 
	rrca			;71b2	0f 	. 
	nop			;71b3	00 	. 
	call nc,00287h		;71b4	d4 87 02 	. . . 
	rlca			;71b7	07 	. 
	ld (de),a			;71b8	12 	. 
	jp m,087cdh		;71b9	fa cd 87 	. . . 
	ld bc,0f702h		;71bc	01 02 f7 	. . . 
	defb 0ddh,088h,001h	;illegal sequence		;71bf	dd 88 01 	. . . 
	ld (bc),a			;71c2	02 	. 
	nop			;71c3	00 	. 
	call c,00288h		;71c4	dc 88 02 	. . . 
	rlca			;71c7	07 	. 
	ld (de),a			;71c8	12 	. 
	ei			;71c9	fb 	. 
	jp nz,00087h		;71ca	c2 87 00 	. . . 
	rlca			;71cd	07 	. 
	ret m			;71ce	f8 	. 
	and d			;71cf	a2 	. 
	adc a,c			;71d0	89 	. 
	ld bc,0f806h		;71d1	01 06 f8 	. . . 
	ld h,l			;71d4	65 	e 
	adc a,b			;71d5	88 	. 
	inc d			;71d6	14 	. 
	ld h,b			;71d7	60 	` 
	adc a,b			;71d8	88 	. 
	dec d			;71d9	15 	. 
	ld l,c			;71da	69 	i 
	adc a,b			;71db	88 	. 
	inc hl			;71dc	23 	# 
	ld c,c			;71dd	49 	I 
	ld c,d			;71de	4a 	J 
	rst 38h			;71df	ff 	. 
	nop			;71e0	00 	. 
	ld h,b			;71e1	60 	` 
	jp m,08994h		;71e2	fa 94 89 	. . . 
	ld (bc),a			;71e5	02 	. 
	ld a,(bc)			;71e6	0a 	. 
	dec b			;71e7	05 	. 
	jp m,087b4h		;71e8	fa b4 87 	. . . 
	ld bc,0f70ch		;71eb	01 0c f7 	. . . 
	dec a			;71ee	3d 	= 
	adc a,b			;71ef	88 	. 
	ld (bc),a			;71f0	02 	. 
	rlca			;71f1	07 	. 
	dec b			;71f2	05 	. 
	jp m,087cdh		;71f3	fa cd 87 	. . . 
	ld bc,0f70ch		;71f6	01 0c f7 	. . . 
	ld c,l			;71f9	4d 	M 
	adc a,b			;71fa	88 	. 
	ld (bc),a			;71fb	02 	. 
	ld b,00ah		;71fc	06 0a 	. . 
	ex af,af'			;71fe	08 	. 
	ld l,(hl)			;71ff	6e 	n 
	adc a,b			;7200	88 	. 
	ld (bc),a			;7201	02 	. 
	rlca			;7202	07 	. 
	inc c			;7203	0c 	. 
	ei			;7204	fb 	. 
	jp nz,00287h		;7205	c2 87 02 	. . . 
	inc bc			;7208	03 	. 
	inc b			;7209	04 	. 
	rst 8			;720a	cf 	. 
	inc h			;720b	24 	$ 
	adc a,c			;720c	89 	. 
	ld bc,0f808h		;720d	01 08 f8 	. . . 
	ld b,l			;7210	45 	E 
	adc a,b			;7211	88 	. 
	inc d			;7212	14 	. 
	ld b,b			;7213	40 	@ 
	adc a,b			;7214	88 	. 
	dec d			;7215	15 	. 
	ld c,c			;7216	49 	I 
	adc a,b			;7217	88 	. 
	ld d,017h		;7218	16 17 	. . 
	jr $+27		;721a	18 19 	. . 
	inc h			;721c	24 	$ 
	rst 38h			;721d	ff 	. 
	inc bc			;721e	03 	. 
	ld bc,00402h		;721f	01 02 04 	. . . 
	inc bc			;7222	03 	. 
	jp m,089b0h		;7223	fa b0 89 	. . . 
	rst 38h			;7226	ff 	. 
	inc bc			;7227	03 	. 
	ld bc,00402h		;7228	01 02 04 	. . . 
	ld (de),a			;722b	12 	. 
	jp m,087d0h		;722c	fa d0 87 	. . . 
	rst 38h			;722f	ff 	. 
	inc bc			;7230	03 	. 
	jp m,01c02h		;7231	fa 02 1c 	. . . 
	rrca			;7234	0f 	. 
	ld bc,087b4h		;7235	01 b4 87 	. . . 
	inc de			;7238	13 	. 
	nop			;7239	00 	. 
	inc e			;723a	1c 	. 
	cp 094h		;723b	fe 94 	. . 
	adc a,c			;723d	89 	. 
	ld (bc),a			;723e	02 	. 
	inc b			;723f	04 	. 
	ex af,af'			;7240	08 	. 
	nop			;7241	00 	. 
	jr nc,$-118		;7242	30 88 	0 . 
	ld (bc),a			;7244	02 	. 
	inc b			;7245	04 	. 
	ex af,af'			;7246	08 	. 
	adc a,h			;7247	8c 	. 
	ld (hl),b			;7248	70 	p 
	adc a,d			;7249	8a 	. 
	rst 38h			;724a	ff 	. 
	ld l,b			;724b	68 	h 
	nop			;724c	00 	. 
	ld b,b			;724d	40 	@ 
	jp m,089b4h		;724e	fa b4 89 	. . . 
	ld bc,0fa10h		;7251	01 10 fa 	. . . 
	or h			;7254	b4 	. 
	add a,a			;7255	87 	. 
	nop			;7256	00 	. 
	rra			;7257	1f 	. 
	call m,088b5h		;7258	fc b5 88 	. . . 
	ld a,(de)			;725b	1a 	. 
	ld e,002h		;725c	1e 02 	. . 
	push bc			;725e	c5 	. 
	adc a,c			;725f	89 	. 
	rra			;7260	1f 	. 
	ld c,010h		;7261	0e 10 	. . 
	res 0,a		;7263	cb 87 	. . 
	ld d,b			;7265	50 	P 
	ld d,c			;7266	51 	Q 
	ld d,e			;7267	53 	S 
	rst 38h			;7268	ff 	. 
	ld l,b			;7269	68 	h 
	nop			;726a	00 	. 
	inc bc			;726b	03 	. 
	call m,088b4h		;726c	fc b4 88 	. . . 
	ld (bc),a			;726f	02 	. 
	ex af,af'			;7270	08 	. 
	rrca			;7271	0f 	. 
	jp m,087cch		;7272	fa cc 87 	. . . 
	nop			;7275	00 	. 
	ld d,a			;7276	57 	W 
	jp m,0899dh		;7277	fa 9d 89 	. . . 
	inc c			;727a	0c 	. 
	ld c,0fah		;727b	0e fa 	. . 
	ld a,(hl)			;727d	7e 	~ 
	adc a,c			;727e	89 	. 
	rst 38h			;727f	ff 	. 
	ld l,b			;7280	68 	h 
	ld bc,0fa06h		;7281	01 06 fa 	. . . 
	out (087h),a		;7284	d3 87 	. . 
	ld (bc),a			;7286	02 	. 
	dec b			;7287	05 	. 
	inc b			;7288	04 	. 
	jp m,0898fh		;7289	fa 8f 89 	. . . 
	inc c			;728c	0c 	. 
	inc bc			;728d	03 	. 
	jp m,089ech		;728e	fa ec 89 	. . . 
	nop			;7291	00 	. 
	add hl,bc			;7292	09 	. 
	call m,089b4h		;7293	fc b4 89 	. . . 
	nop			;7296	00 	. 
	dec c			;7297	0d 	. 
	call m,088b4h		;7298	fc b4 88 	. . . 
	ld c,00eh		;729b	0e 0e 	. . 
	rst 8			;729d	cf 	. 
	add a,a			;729e	87 	. 
	rst 38h			;729f	ff 	. 
	ld l,b			;72a0	68 	h 
	ld bc,0fa12h		;72a1	01 12 fa 	. . . 
	or h			;72a4	b4 	. 
	add a,a			;72a5	87 	. 
	nop			;72a6	00 	. 
	rra			;72a7	1f 	. 
	call m,088b5h		;72a8	fc b5 88 	. . . 
	nop			;72ab	00 	. 
	rra			;72ac	1f 	. 
	call m,089b5h		;72ad	fc b5 89 	. . . 
	ld c,012h		;72b0	0e 12 	. . 
	res 0,a		;72b2	cb 87 	. . 
	ld d,d			;72b4	52 	R 
	ld d,c			;72b5	51 	Q 
	rst 38h			;72b6	ff 	. 
	ld l,b			;72b7	68 	h 
	nop			;72b8	00 	. 
	ld hl,0b4fah		;72b9	21 fa b4 	! . . 
	add a,a			;72bc	87 	. 
	ld bc,0fa10h		;72bd	01 10 fa 	. . . 
	call p,00087h		;72c0	f4 87 00 	. . . 
	rra			;72c3	1f 	. 
	call m,08995h		;72c4	fc 95 89 	. . . 
	ld c,003h		;72c7	0e 03 	. . 
	xor e			;72c9	ab 	. 
	adc a,c			;72ca	89 	. 
	ld c,l			;72cb	4d 	M 
	ld b,b			;72cc	40 	@ 
	rst 38h			;72cd	ff 	. 
	ld l,b			;72ce	68 	h 
	nop			;72cf	00 	. 
	jr nz,$-4		;72d0	20 fa 	  . 
	or h			;72d2	b4 	. 
	add a,a			;72d3	87 	. 
	ld bc,0fa11h		;72d4	01 11 fa 	. . . 
	di			;72d7	f3 	. 
	add a,a			;72d8	87 	. 
	nop			;72d9	00 	. 
	rra			;72da	1f 	. 
	call m,08994h		;72db	fc 94 89 	. . . 
	ld c,011h		;72de	0e 11 	. . 
	rst 28h			;72e0	ef 	. 
	add a,a			;72e1	87 	. 
	jr c,$+81		;72e2	38 4f 	8 O 
	ld c,(hl)			;72e4	4e 	N 
	rst 38h			;72e5	ff 	. 
	add hl,bc			;72e6	09 	. 
	dec b			;72e7	05 	. 
	ld b,002h		;72e8	06 02 	. . 
	dec b			;72ea	05 	. 
	inc c			;72eb	0c 	. 
	rlca			;72ec	07 	. 
	dec bc			;72ed	0b 	. 
	dec c			;72ee	0d 	. 
	ex af,af'			;72ef	08 	. 
	ld bc,00301h		;72f0	01 01 03 	. . . 
	dec de			;72f3	1b 	. 
	dec e			;72f4	1d 	. 
	ld e,00fh		;72f5	1e 0f 	. . 
	push bc			;72f7	c5 	. 
	add a,a			;72f8	87 	. 
	rst 38h			;72f9	ff 	. 
	add hl,bc			;72fa	09 	. 
	rlca			;72fb	07 	. 
	nop			;72fc	00 	. 
	nop			;72fd	00 	. 
	ld (bc),a			;72fe	02 	. 
	nop			;72ff	00 	. 
	nop			;7300	00 	. 
	nop			;7301	00 	. 
	dec bc			;7302	0b 	. 
	ld bc,00101h		;7303	01 01 01 	. . . 
	ld bc,00f0eh		;7306	01 0e 0f 	. . . 
	jp z,06d87h		;7309	ca 87 6d 	. . m 
	rst 38h			;730c	ff 	. 
	inc bc			;730d	03 	. 
	ex af,af'			;730e	08 	. 
	nop			;730f	00 	. 
	jr nz,$-4		;7310	20 fa 	  . 
	or h			;7312	b4 	. 
	add a,a			;7313	87 	. 
	ld (bc),a			;7314	02 	. 
	inc bc			;7315	03 	. 
	ld de,0f1fah		;7316	11 fa f1 	. . . 
	add a,a			;7319	87 	. 
	ld (bc),a			;731a	02 	. 
	inc bc			;731b	03 	. 
	inc bc			;731c	03 	. 
	jp m,08994h		;731d	fa 94 89 	. . . 
	nop			;7320	00 	. 
	inc e			;7321	1c 	. 
	jp p,08996h		;7322	f2 96 89 	. . . 
	ld c,011h		;7325	0e 11 	. . 
	jp pe,0ff87h		;7327	ea 87 ff 	. . . 
	add hl,bc			;732a	09 	. 
	ld b,000h		;732b	06 00 	. . 
	nop			;732d	00 	. 
	ld (bc),a			;732e	02 	. 
	ld b,000h		;732f	06 00 	. . 
	nop			;7331	00 	. 
	ld (bc),a			;7332	02 	. 
	ld b,000h		;7333	06 00 	. . 
	nop			;7335	00 	. 
	ld (bc),a			;7336	02 	. 
	ld c,012h		;7337	0e 12 	. . 
	jp z,0ff87h		;7339	ca 87 ff 	. . . 
	inc bc			;733c	03 	. 
	jp m,01a02h		;733d	fa 02 1a 	. . . 
	rrca			;7340	0f 	. 
	ex af,af'			;7341	08 	. 
	jr $-118		;7342	18 88 	. . 
	nop			;7344	00 	. 
	inc e			;7345	1c 	. 
	call m,08997h		;7346	fc 97 89 	. . . 
	ld c,00fh		;7349	0e 0f 	. . 
	ld l,088h		;734b	2e 88 	. . 
	dec l			;734d	2d 	- 
	inc l			;734e	2c 	, 
	rst 38h			;734f	ff 	. 
	inc bc			;7350	03 	. 
	jp m,00402h		;7351	fa 02 04 	. . . 
	ld a,(bc)			;7354	0a 	. 
	ex af,af'			;7355	08 	. 
	ld d,h			;7356	54 	T 
	adc a,b			;7357	88 	. 
	ld (bc),a			;7358	02 	. 
	ld a,(de)			;7359	1a 	. 
	rrca			;735a	0f 	. 
	ex af,af'			;735b	08 	. 
	cp b			;735c	b8 	. 
	add a,a			;735d	87 	. 
	ld c,012h		;735e	0e 12 	. . 
	adc a,087h		;7360	ce 87 	. . 
	ld (bc),a			;7362	02 	. 
	ld (bc),a			;7363	02 	. 
	inc bc			;7364	03 	. 
	ex af,af'			;7365	08 	. 
	or 087h		;7366	f6 87 	. . 
	ld c,e			;7368	4b 	K 
	ld c,h			;7369	4c 	L 
	ld h,(hl)			;736a	66 	f 
	inc b			;736b	04 	. 
	ex af,af'			;736c	08 	. 
	cp b			;736d	b8 	. 
	adc a,b			;736e	88 	. 
	inc b			;736f	04 	. 
	ex af,af'			;7370	08 	. 
	cp l			;7371	bd 	. 
	adc a,b			;7372	88 	. 
	rst 38h			;7373	ff 	. 
	inc bc			;7374	03 	. 
	jp m,01e02h		;7375	fa 02 1e 	. . . 
	rlca			;7378	07 	. 
	nop			;7379	00 	. 
	call p,00088h		;737a	f4 88 00 	. . . 
	rra			;737d	1f 	. 
	call m,089d4h		;737e	fc d4 89 	. . . 
	ld c,00ah		;7381	0e 0a 	. . 
	adc a,087h		;7383	ce 87 	. . 
	ld hl,00e07h		;7385	21 07 0e 	! . . 
	adc a,c			;7388	89 	. 
	rst 38h			;7389	ff 	. 
	nop			;738a	00 	. 
	add a,b			;738b	80 	. 
	jp m,08974h		;738c	fa 74 89 	. t . 
	ld (bc),a			;738f	02 	. 
	ld (bc),a			;7390	02 	. 
	ld b,0fah		;7391	06 fa 	. . 
	jp nc,02a87h		;7393	d2 87 2a 	. . * 
	ld l,l			;7396	6d 	m 
	rst 38h			;7397	ff 	. 
	nop			;7398	00 	. 
	add a,b			;7399	80 	. 
	jp m,08974h		;739a	fa 74 89 	. t . 
	rst 38h			;739d	ff 	. 
	nop			;739e	00 	. 
	jr nz,$-2		;739f	20 fc 	  . 
	call nc,00289h		;73a1	d4 89 02 	. . . 
	jr nz,$+12		;73a4	20 0a 	  . 
	jp m,087b4h		;73a6	fa b4 87 	. . . 
	rst 38h			;73a9	ff 	. 
	nop			;73aa	00 	. 
	ld b,b			;73ab	40 	@ 
	call m,089b4h		;73ac	fc b4 89 	. . . 
	ld hl,0b702h		;73af	21 02 b7 	! . . 
	adc a,c			;73b2	89 	. 
	ld h,e			;73b3	63 	c 
	inc de			;73b4	13 	. 
	ld h,h			;73b5	64 	d 
	rst 38h			;73b6	ff 	. 
	nop			;73b7	00 	. 
	ld h,0fch		;73b8	26 fc 	& . 
	ld d,h			;73ba	54 	T 
	adc a,c			;73bb	89 	. 
	ld (bc),a			;73bc	02 	. 
	ld b,003h		;73bd	06 03 	. . 
	call m,08994h		;73bf	fc 94 89 	. . . 
	ld hl,0b70dh		;73c2	21 0d b7 	! . . 
	add a,a			;73c5	87 	. 
	ld h,l			;73c6	65 	e 
	dec sp			;73c7	3b 	; 
	ld a,0ffh		;73c8	3e ff 	> . 
	nop			;73ca	00 	. 
	ld a,(bc)			;73cb	0a 	. 
	call m,087b4h		;73cc	fc b4 87 	. . . 
	nop			;73cf	00 	. 
	jr nz,$-2		;73d0	20 fc 	  . 
	sub h			;73d2	94 	. 
	adc a,b			;73d3	88 	. 
	nop			;73d4	00 	. 
	rlca			;73d5	07 	. 
	jp m,089b4h		;73d6	fa b4 89 	. . . 
	nop			;73d9	00 	. 
	ex af,af'			;73da	08 	. 
	jp m,089d4h		;73db	fa d4 89 	. . . 
	ld hl,0b710h		;73de	21 10 b7 	! . . 
	add a,a			;73e1	87 	. 
	rst 38h			;73e2	ff 	. 
	nop			;73e3	00 	. 
	ld b,b			;73e4	40 	@ 
	call m,089b4h		;73e5	fc b4 89 	. . . 
	ld d,h			;73e8	54 	T 
	ld d,l			;73e9	55 	U 
	ld d,(hl)			;73ea	56 	V 
	ld h,d			;73eb	62 	b 
	ld h,l			;73ec	65 	e 
	rst 38h			;73ed	ff 	. 
	nop			;73ee	00 	. 
	jr nz,$-2		;73ef	20 fc 	  . 
	call nc,00089h		;73f1	d4 89 00 	. . . 
	ld b,06fh		;73f4	06 6f 	. o 
	ret pe			;73f6	e8 	. 
	adc a,c			;73f7	89 	. 
	ld h,(hl)			;73f8	66 	f 
	ld h,l			;73f9	65 	e 
	rst 38h			;73fa	ff 	. 
	ld (bc),a			;73fb	02 	. 
	ex af,af'			;73fc	08 	. 
	ld c,0fah		;73fd	0e fa 	. . 
	or h			;73ff	b4 	. 
	add a,a			;7400	87 	. 
	nop			;7401	00 	. 
	add a,b			;7402	80 	. 
	jp m,08974h		;7403	fa 74 89 	. t . 
	dec bc			;7406	0b 	. 
	dec c			;7407	0d 	. 
	jp m,0895ch		;7408	fa 5c 89 	. \ . 
	rst 38h			;740b	ff 	. 
	nop			;740c	00 	. 
	jr nz,$-2		;740d	20 fc 	  . 
	call nc,00089h		;740f	d4 89 00 	. . . 
	dec b			;7412	05 	. 
	ld l,a			;7413	6f 	o 
	in a,(089h)		;7414	db 89 	. . 
	ld h,e			;7416	63 	c 
	ld h,h			;7417	64 	d 
	inc de			;7418	13 	. 
	rst 38h			;7419	ff 	. 
	nop			;741a	00 	. 
	ld d,0fch		;741b	16 fc 	. . 
	sub h			;741d	94 	. 
	adc a,b			;741e	88 	. 
	ld (bc),a			;741f	02 	. 
	jr $+8		;7420	18 06 	. . 
	xor h			;7422	ac 	. 
	inc a			;7423	3c 	< 
	adc a,c			;7424	89 	. 
	rst 38h			;7425	ff 	. 
	inc c			;7426	0c 	. 
	inc bc			;7427	03 	. 
	jp m,089e6h		;7428	fa e6 89 	. . . 
	ld (bc),a			;742b	02 	. 
	dec bc			;742c	0b 	. 
	inc b			;742d	04 	. 
	jp m,08989h		;742e	fa 89 89 	. . . 
	rst 38h			;7431	ff 	. 
	nop			;7432	00 	. 
	add a,b			;7433	80 	. 
	jp m,08974h		;7434	fa 74 89 	. t . 
	ld c,004h		;7437	0e 04 	. . 
	ld a,d			;7439	7a 	z 
	adc a,c			;743a	89 	. 
	ld (bc),a			;743b	02 	. 
	jr $+9		;743c	18 07 	. . 
	xor h			;743e	ac 	. 
	cp h			;743f	bc 	. 
	add a,a			;7440	87 	. 
	rst 38h			;7441	ff 	. 
	nop			;7442	00 	. 
	sbc a,e			;7443	9b 	. 
	jp m,08959h		;7444	fa 59 89 	. Y . 
	ld (bc),a			;7447	02 	. 
	ld c,00dh		;7448	0e 0d 	. . 
	jp m,087c6h		;744a	fa c6 87 	. . . 
	inc c			;744d	0c 	. 
	inc c			;744e	0c 	. 
	jp m,0893ah		;744f	fa 3a 89 	. : . 
	rst 38h			;7452	ff 	. 
	inc bc			;7453	03 	. 
	ex af,af'			;7454	08 	. 
	ld (bc),a			;7455	02 	. 
	jr $+4		;7456	18 02 	. . 
	jp m,087bch		;7458	fa bc 87 	. . . 
	nop			;745b	00 	. 
	ld h,b			;745c	60 	` 
	jp m,08994h		;745d	fa 94 89 	. . . 
	ld c,00fh		;7460	0e 0f 	. . 
	cp d			;7462	ba 	. 
	add a,a			;7463	87 	. 
	inc l			;7464	2c 	, 
	ld sp,04c4bh		;7465	31 4b 4c 	1 K L 
	rst 38h			;7468	ff 	. 
	inc bc			;7469	03 	. 
	ex af,af'			;746a	08 	. 
	nop			;746b	00 	. 
	ld b,b			;746c	40 	@ 
	jp m,087b4h		;746d	fa b4 87 	. . . 
	nop			;7470	00 	. 
	ld h,b			;7471	60 	` 
	jp m,08994h		;7472	fa 94 89 	. . . 
	dec l			;7475	2d 	- 
	dec hl			;7476	2b 	+ 
	jr nc,$+1		;7477	30 ff 	0 . 
	inc bc			;7479	03 	. 
	ex af,af'			;747a	08 	. 
	ld (bc),a			;747b	02 	. 
	inc b			;747c	04 	. 
	ld (bc),a			;747d	02 	. 
	jp m,087b4h		;747e	fa b4 87 	. . . 
	ld (bc),a			;7481	02 	. 
	ld (bc),a			;7482	02 	. 
	ld (bc),a			;7483	02 	. 
	jp m,087d2h		;7484	fa d2 87 	. . . 
	nop			;7487	00 	. 
	ld h,b			;7488	60 	` 
	jp m,08994h		;7489	fa 94 89 	. . . 
	ld (bc),a			;748c	02 	. 
	inc c			;748d	0c 	. 
	ld (bc),a			;748e	02 	. 
	ex af,af'			;748f	08 	. 
	cp (hl)			;7490	be 	. 
	adc a,c			;7491	89 	. 
	nop			;7492	00 	. 
	ld c,0f2h		;7493	0e f2 	. . 
	sbc a,l			;7495	9d 	. 
	adc a,c			;7496	89 	. 
	ld c,003h		;7497	0e 03 	. . 
	and e			;7499	a3 	. 
	adc a,c			;749a	89 	. 
	ld c,00fh		;749b	0e 0f 	. . 
	adc a,087h		;749d	ce 87 	. . 
	ld sp,009ffh		;749f	31 ff 09 	1 . . 
	nop			;74a2	00 	. 
	nop			;74a3	00 	. 
	nop			;74a4	00 	. 
	nop			;74a5	00 	. 
	nop			;74a6	00 	. 
	nop			;74a7	00 	. 
	nop			;74a8	00 	. 
	nop			;74a9	00 	. 
	ld bc,00101h		;74aa	01 01 01 	. . . 
	ld bc,00e02h		;74ad	01 02 0e 	. . . 
	inc bc			;74b0	03 	. 
	jp m,08994h		;74b1	fa 94 89 	. . . 
	ld a,(bc)			;74b4	0a 	. 
	ld (bc),a			;74b5	02 	. 
	jp m,089a2h		;74b6	fa a2 89 	. . . 
	nop			;74b9	00 	. 
	ld b,b			;74ba	40 	@ 
	jp m,087b4h		;74bb	fa b4 87 	. . . 
	dec c			;74be	0d 	. 
	dec b			;74bf	05 	. 
	jp m,0880ch		;74c0	fa 0c 88 	. . . 
	ld (bc),a			;74c3	02 	. 
	inc bc			;74c4	03 	. 
	ld b,0fah		;74c5	06 fa 	. . 
	ld de,02b88h		;74c7	11 88 2b 	. . + 
	inc l			;74ca	2c 	, 
	rst 38h			;74cb	ff 	. 
	nop			;74cc	00 	. 
	ld b,b			;74cd	40 	@ 
	jp m,089b4h		;74ce	fa b4 89 	. . . 
	ld (bc),a			;74d1	02 	. 
	add hl,bc			;74d2	09 	. 
	ld (bc),a			;74d3	02 	. 
	call m,089b4h		;74d4	fc b4 89 	. . . 
	nop			;74d7	00 	. 
	inc e			;74d8	1c 	. 
	jp m,087b8h		;74d9	fa b8 87 	. . . 
	ld a,(bc)			;74dc	0a 	. 
	inc bc			;74dd	03 	. 
	jp m,087e4h		;74de	fa e4 87 	. . . 
	ld (bc),a			;74e1	02 	. 
	dec bc			;74e2	0b 	. 
	inc b			;74e3	04 	. 
	jp m,087d9h		;74e4	fa d9 87 	. . . 
	ld hl,0bf10h		;74e7	21 10 bf 	! . . 
	add a,a			;74ea	87 	. 
	daa			;74eb	27 	' 
	add hl,hl			;74ec	29 	) 
	rst 38h			;74ed	ff 	. 
	ld bc,0fa03h		;74ee	01 03 fa 	. . . 
	cp (hl)			;74f1	be 	. 
	add a,a			;74f2	87 	. 
	ld (bc),a			;74f3	02 	. 
	dec d			;74f4	15 	. 
	dec b			;74f5	05 	. 
	jp m,087bfh		;74f6	fa bf 87 	. . . 
	nop			;74f9	00 	. 
	rrca			;74fa	0f 	. 
	call m,08954h		;74fb	fc 54 89 	. T . 
	nop			;74fe	00 	. 
	ld a,(bc)			;74ff	0a 	. 
	jp m,08963h		;7500	fa 63 89 	. c . 
	nop			;7503	00 	. 
	ld c,0fah		;7504	0e fa 	. . 
	add a,d			;7506	82 	. 
	adc a,c			;7507	89 	. 
	ld (bc),a			;7508	02 	. 
	ld de,0fa03h		;7509	11 03 fa 	. . . 
	and e			;750c	a3 	. 
	adc a,c			;750d	89 	. 
	ld a,(0ff3bh)		;750e	3a 3b ff 	: ; . 
	dec c			;7511	0d 	. 
	add hl,bc			;7512	09 	. 
	jp m,087c7h		;7513	fa c7 87 	. . . 
	ld (bc),a			;7516	02 	. 
	inc b			;7517	04 	. 
	ld a,(bc)			;7518	0a 	. 
	jp m,087d0h		;7519	fa d0 87 	. . . 
	nop			;751c	00 	. 
	jr nz,$-2		;751d	20 fc 	  . 
	call nc,06289h		;751f	d4 89 62 	. . b 
	rst 38h			;7522	ff 	. 
	inc bc			;7523	03 	. 
	ld bc,00702h		;7524	01 02 07 	. . . 
	inc bc			;7527	03 	. 
	jp m,089adh		;7528	fa ad 89 	. . . 
	rst 38h			;752b	ff 	. 
	inc bc			;752c	03 	. 
	ld bc,06000h		;752d	01 00 60 	. . ` 
	jp m,08994h		;7530	fa 94 89 	. . . 
	nop			;7533	00 	. 
	ex af,af'			;7534	08 	. 
	jp m,08988h		;7535	fa 88 89 	. . . 
	ld c,004h		;7538	0e 04 	. . 
	adc a,e			;753a	8b 	. 
	adc a,c			;753b	89 	. 
	ld l,d			;753c	6a 	j 
	rst 38h			;753d	ff 	. 
	nop			;753e	00 	. 
	dec h			;753f	25 	% 
	call m,089cfh		;7540	fc cf 89 	. . . 
	ld (bc),a			;7543	02 	. 
	add hl,de			;7544	19 	. 
	ld (de),a			;7545	12 	. 
	ld bc,087b4h		;7546	01 b4 87 	. . . 
	ld (bc),a			;7549	02 	. 
	ld (bc),a			;754a	02 	. 
	ld (de),a			;754b	12 	. 
	jp m,087cdh		;754c	fa cd 87 	. . . 
	rst 38h			;754f	ff 	. 
	inc bc			;7550	03 	. 
	ld bc,00702h		;7551	01 02 07 	. . . 
	inc bc			;7554	03 	. 
	jp m,087cdh		;7555	fa cd 87 	. . . 
	ld (bc),a			;7558	02 	. 
	rlca			;7559	07 	. 
	dec b			;755a	05 	. 
	jp m,0896dh		;755b	fa 6d 89 	. m . 
	nop			;755e	00 	. 
	inc d			;755f	14 	. 
	rlca			;7560	07 	. 
	inc (hl)			;7561	34 	4 
	adc a,c			;7562	89 	. 
	nop			;7563	00 	. 
	inc c			;7564	0c 	. 
	jp p,08948h		;7565	f2 48 89 	. H . 
	rst 38h			;7568	ff 	. 
	nop			;7569	00 	. 
	daa			;756a	27 	' 
	jp m,087cdh		;756b	fa cd 87 	. . . 
	nop			;756e	00 	. 
	dec h			;756f	25 	% 
	call m,089cfh		;7570	fc cf 89 	. . . 
	ld (bc),a			;7573	02 	. 
	ld (bc),a			;7574	02 	. 
	djnz $-4		;7575	10 fa 	. . 
	dec c			;7577	0d 	. 
	adc a,b			;7578	88 	. 
	ld (bc),a			;7579	02 	. 
	add hl,de			;757a	19 	. 
	ld (de),a			;757b	12 	. 
	ld bc,087b4h		;757c	01 b4 87 	. . . 
	rst 38h			;757f	ff 	. 
	inc bc			;7580	03 	. 
	ld bc,00702h		;7581	01 02 07 	. . . 
	ld c,0fah		;7584	0e fa 	. . 
	call 00287h		;7586	cd 87 02 	. . . 
	dec b			;7589	05 	. 
	ld a,(bc)			;758a	0a 	. 
	nop			;758b	00 	. 
	rst 8			;758c	cf 	. 
	add a,a			;758d	87 	. 
	rst 38h			;758e	ff 	. 
	ld (bc),a			;758f	02 	. 
	inc b			;7590	04 	. 
	djnz $+3		;7591	10 01 	. . 
	or h			;7593	b4 	. 
	add a,a			;7594	87 	. 
	ld (bc),a			;7595	02 	. 
	inc bc			;7596	03 	. 
	inc bc			;7597	03 	. 
	jp m,087b7h		;7598	fa b7 87 	. . . 
	nop			;759b	00 	. 
	ld e,l			;759c	5d 	] 
	jp m,08997h		;759d	fa 97 89 	. . . 
	ld bc,0020ch		;75a0	01 0c 02 	. . . 
	jr $-118		;75a3	18 88 	. . 
	nop			;75a5	00 	. 
	inc bc			;75a6	03 	. 
	cp 094h		;75a7	fe 94 	. . 
	adc a,c			;75a9	89 	. 
	ld c,l			;75aa	4d 	M 
	ld c,a			;75ab	4f 	O 
	ld h,d			;75ac	62 	b 
	ld h,e			;75ad	63 	c 
	rst 38h			;75ae	ff 	. 
	nop			;75af	00 	. 
	ld (hl),e			;75b0	73 	s 
	jp m,08981h		;75b1	fa 81 89 	. . . 
	inc c			;75b4	0c 	. 
	dec b			;75b5	05 	. 
	jp m,08962h		;75b6	fa 62 89 	. b . 
	ld (bc),a			;75b9	02 	. 
	dec c			;75ba	0d 	. 
	ld b,0fah		;75bb	06 fa 	. . 
	rst 0			;75bd	c7 	. 
	adc a,b			;75be	88 	. 
	ld h,h			;75bf	64 	d 
	rst 38h			;75c0	ff 	. 
	ld (bc),a			;75c1	02 	. 
	jr nz,$+12		;75c2	20 0a 	  . 
	jp m,088b4h		;75c4	fa b4 88 	. . . 
	ld hl,0cb08h		;75c7	21 08 cb 	! . . 
	add a,a			;75ca	87 	. 
	ld c,009h		;75cb	0e 09 	. . 
	cp d			;75cd	ba 	. 
	adc a,b			;75ce	88 	. 
	ld c,009h		;75cf	0e 09 	. . 
	push bc			;75d1	c5 	. 
	adc a,b			;75d2	88 	. 
	ld bc,0fa08h		;75d3	01 08 fa 	. . . 
	out (087h),a		;75d6	d3 87 	. . 
	nop			;75d8	00 	. 
	ld e,000h		;75d9	1e 00 	. . 
	push de			;75db	d5 	. 
	adc a,c			;75dc	89 	. 
	ld hl,0da01h		;75dd	21 01 da 	! . . 
	adc a,c			;75e0	89 	. 
	ld hl,0e501h		;75e1	21 01 e5 	! . . 
	adc a,c			;75e4	89 	. 
	ld d,d			;75e5	52 	R 
	rst 38h			;75e6	ff 	. 
	nop			;75e7	00 	. 
	ld a,(0fafch)		;75e8	3a fc fa 	: . . 
	adc a,b			;75eb	88 	. 
	ld (bc),a			;75ec	02 	. 
	ld b,008h		;75ed	06 08 	. . 
	jp m,088f4h		;75ef	fa f4 88 	. . . 
	ld (bc),a			;75f2	02 	. 
	inc bc			;75f3	03 	. 
	inc b			;75f4	04 	. 
	ld bc,08974h		;75f5	01 74 89 	. t . 
	ld hl,0c80ah		;75f8	21 0a c8 	! . . 
	add a,a			;75fb	87 	. 
	ld h,h			;75fc	64 	d 
	rst 38h			;75fd	ff 	. 
	nop			;75fe	00 	. 
	ld b,b			;75ff	40 	@ 
	call m,088f4h		;7600	fc f4 88 	. . . 
	ld h,h			;7603	64 	d 
	ld h,e			;7604	63 	c 
	inc de			;7605	13 	. 
	rst 38h			;7606	ff 	. 
	nop			;7607	00 	. 
	ld b,b			;7608	40 	@ 
	call m,088f4h		;7609	fc f4 88 	. . . 
	ld hl,00b08h		;760c	21 08 0b 	! . . 
	adc a,c			;760f	89 	. 
	ld bc,0fa12h		;7610	01 12 fa 	. . . 
	out (087h),a		;7613	d3 87 	. . 
	ld h,d			;7615	62 	b 
	ld h,l			;7616	65 	e 
	rst 38h			;7617	ff 	. 
	nop			;7618	00 	. 
	ld b,b			;7619	40 	@ 
	call m,089b4h		;761a	fc b4 89 	. . . 
	ld bc,0fa12h		;761d	01 12 fa 	. . . 
	out (087h),a		;7620	d3 87 	. . 
	ld (hl),035h		;7622	36 35 	6 5 
	djnz $+1		;7624	10 ff 	. . 
	ld h,e			;7626	63 	c 
	ld h,h			;7627	64 	d 
	inc de			;7628	13 	. 
	nop			;7629	00 	. 
	ld b,b			;762a	40 	@ 
	call m,089b4h		;762b	fc b4 89 	. . . 
	dec h			;762e	25 	% 
	cpl			;762f	2f 	/ 
	ld d,a			;7630	57 	W 
	ld d,(hl)			;7631	56 	V 
	rst 38h			;7632	ff 	. 
	nop			;7633	00 	. 
	ld b,b			;7634	40 	@ 
	call m,089b4h		;7635	fc b4 89 	. . . 
	ld hl,0c812h		;7638	21 12 c8 	! . . 
	add a,a			;763b	87 	. 
	ld (hl),0ffh		;763c	36 ff 	6 . 
	nop			;763e	00 	. 
	ld b,b			;763f	40 	@ 
	call m,089b4h		;7640	fc b4 89 	. . . 
	ld hl,0c812h		;7643	21 12 c8 	! . . 
	add a,a			;7646	87 	. 
	djnz $+1		;7647	10 ff 	. . 
	nop			;7649	00 	. 
	ld b,b			;764a	40 	@ 
	call m,089b4h		;764b	fc b4 89 	. . . 
	ld hl,0c802h		;764e	21 02 c8 	! . . 
	adc a,c			;7651	89 	. 
	ld (bc),a			;7652	02 	. 
	rlca			;7653	07 	. 
	ld (bc),a			;7654	02 	. 
	jp m,087b4h		;7655	fa b4 87 	. . . 
	rst 38h			;7658	ff 	. 
	ld (bc),a			;7659	02 	. 
	rlca			;765a	07 	. 
	inc bc			;765b	03 	. 
	jp m,087b4h		;765c	fa b4 87 	. . . 
	ld (bc),a			;765f	02 	. 
	dec b			;7660	05 	. 
	add hl,bc			;7661	09 	. 
	ld bc,08814h		;7662	01 14 88 	. . . 
	ld (bc),a			;7665	02 	. 
	rlca			;7666	07 	. 
	ld b,0fah		;7667	06 fa 	. . 
	inc (hl)			;7669	34 	4 
	adc a,c			;766a	89 	. 
	nop			;766b	00 	. 
	inc bc			;766c	03 	. 
	jp m,08918h		;766d	fa 18 89 	. . . 
	nop			;7670	00 	. 
	ld b,0f2h		;7671	06 f2 	. . 
	inc (hl)			;7673	34 	4 
	adc a,c			;7674	89 	. 
	ld bc,00209h		;7675	01 09 02 	. . . 
	ld sp,hl			;7678	f9 	. 
	add a,a			;7679	87 	. 
	ld (bc),a			;767a	02 	. 
	rrca			;767b	0f 	. 
	ld (bc),a			;767c	02 	. 
	call m,089c5h		;767d	fc c5 89 	. . . 
	dec bc			;7680	0b 	. 
	dec b			;7681	05 	. 
	call m,089a5h		;7682	fc a5 89 	. . . 
	ld (bc),a			;7685	02 	. 
	ld a,(bc)			;7686	0a 	. 
	ld (bc),a			;7687	02 	. 
	call m,0891bh		;7688	fc 1b 89 	. . . 
	rst 38h			;768b	ff 	. 
	ld h,l			;768c	65 	e 
	nop			;768d	00 	. 
	ld b,b			;768e	40 	@ 
	call m,089b4h		;768f	fc b4 89 	. . . 
	ld hl,0bd10h		;7692	21 10 bd 	! . . 
	add a,a			;7695	87 	. 
	ld (hl),035h		;7696	36 35 	6 5 
	djnz $+1		;7698	10 ff 	. . 
	ld l,b			;769a	68 	h 
	ld h,h			;769b	64 	d 
	nop			;769c	00 	. 
	ld b,b			;769d	40 	@ 
	call m,089b4h		;769e	fc b4 89 	. . . 
	ld hl,0bd02h		;76a1	21 02 bd 	! . . 
	adc a,c			;76a4	89 	. 
	ld (bc),a			;76a5	02 	. 
	inc b			;76a6	04 	. 
	rlca			;76a7	07 	. 
	call m,087c9h		;76a8	fc c9 87 	. . . 
	ld bc,07e09h		;76ab	01 09 7e 	. . ~ 
	xor e			;76ae	ab 	. 
	adc a,b			;76af	88 	. 
	rst 38h			;76b0	ff 	. 
	ld l,b			;76b1	68 	h 
	ld h,h			;76b2	64 	d 
	ld (bc),a			;76b3	02 	. 
	ld a,(de)			;76b4	1a 	. 
	ld (bc),a			;76b5	02 	. 
	call m,089b4h		;76b6	fc b4 89 	. . . 
	nop			;76b9	00 	. 
	ld a,(bc)			;76ba	0a 	. 
	call m,089aah		;76bb	fc aa 89 	. . . 
	ld bc,0fa06h		;76be	01 06 fa 	. . . 
	out (087h),a		;76c1	d3 87 	. . 
	ld hl,0cb0fh		;76c3	21 0f cb 	! . . 
	add a,a			;76c6	87 	. 
	dec (hl)			;76c7	35 	5 
	cpl			;76c8	2f 	/ 
	rst 38h			;76c9	ff 	. 
	ld l,b			;76ca	68 	h 
	ld h,d			;76cb	62 	b 
	nop			;76cc	00 	. 
	ccf			;76cd	3f 	? 
	call m,089b4h		;76ce	fc b4 89 	. . . 
	ld bc,0fa12h		;76d1	01 12 fa 	. . . 
	out (087h),a		;76d4	d3 87 	. . 
	ld hl,0cb12h		;76d6	21 12 cb 	! . . 
	add a,a			;76d9	87 	. 
	ld (hl),025h		;76da	36 25 	6 % 
	rst 38h			;76dc	ff 	. 
	ld l,b			;76dd	68 	h 
	ld (bc),a			;76de	02 	. 
	ex af,af'			;76df	08 	. 
	ld b,0fah		;76e0	06 fa 	. . 
	or h			;76e2	b4 	. 
	add a,a			;76e3	87 	. 
	ld (bc),a			;76e4	02 	. 
	jr $+20		;76e5	18 12 	. . 
	ld bc,087bch		;76e7	01 bc 87 	. . . 
	ld (bc),a			;76ea	02 	. 
	inc b			;76eb	04 	. 
	inc bc			;76ec	03 	. 
	ld bc,087b8h		;76ed	01 b8 87 	. . . 
	nop			;76f0	00 	. 
	ld b,0fch		;76f1	06 fc 	. . 
	sub h			;76f3	94 	. 
	adc a,c			;76f4	89 	. 
	ld hl,09603h		;76f5	21 03 96 	! . . 
	adc a,c			;76f8	89 	. 
	ld (bc),a			;76f9	02 	. 
	inc b			;76fa	04 	. 
	inc bc			;76fb	03 	. 
	jp m,0899ah		;76fc	fa 9a 89 	. . . 
	nop			;76ff	00 	. 
	inc bc			;7700	03 	. 
	jp p,0883ch		;7701	f2 3c 88 	. < . 
	nop			;7704	00 	. 
	dec bc			;7705	0b 	. 
	jp p,0899eh		;7706	f2 9e 89 	. . . 
	inc de			;7709	13 	. 
	rst 38h			;770a	ff 	. 
	ld l,b			;770b	68 	h 
	ld (bc),a			;770c	02 	. 
	rla			;770d	17 	. 
	djnz $+3		;770e	10 01 	. . 
	cp l			;7710	bd 	. 
	add a,a			;7711	87 	. 
	ld (bc),a			;7712	02 	. 
	inc b			;7713	04 	. 
	dec b			;7714	05 	. 
	jp m,087bah		;7715	fa ba 87 	. . . 
	ld hl,0b610h		;7718	21 10 b6 	! . . 
	add a,a			;771b	87 	. 
	nop			;771c	00 	. 
	inc b			;771d	04 	. 
	jp m,0899ah		;771e	fa 9a 89 	. . . 
	nop			;7721	00 	. 
	ld a,(0bafah)		;7722	3a fa ba 	: . . 
	adc a,c			;7725	89 	. 
	ld (bc),a			;7726	02 	. 
	ld b,002h		;7727	06 02 	. . 
	call m,089b4h		;7729	fc b4 89 	. . . 
	inc de			;772c	13 	. 
	rst 38h			;772d	ff 	. 
	ld (bc),a			;772e	02 	. 
	ld d,010h		;772f	16 10 	. . 
	ld bc,087b4h		;7731	01 b4 87 	. . . 
	nop			;7734	00 	. 
	ld b,b			;7735	40 	@ 
	jp m,089b4h		;7736	fa b4 89 	. . . 
	inc c			;7739	0c 	. 
	ld b,000h		;773a	06 00 	. . 
	and h			;773c	a4 	. 
	adc a,c			;773d	89 	. 
	ld (bc),a			;773e	02 	. 
	ld a,(bc)			;773f	0a 	. 
	add hl,bc			;7740	09 	. 
	jp m,087cah		;7741	fa ca 87 	. . . 
	ld (bc),a			;7744	02 	. 
	ld b,006h		;7745	06 06 	. . 
	ld bc,087cah		;7747	01 ca 87 	. . . 
	inc de			;774a	13 	. 
	rst 38h			;774b	ff 	. 
	inc bc			;774c	03 	. 
	ld bc,00402h		;774d	01 02 04 	. . . 
	inc bc			;7750	03 	. 
	jp m,089b0h		;7751	fa b0 89 	. . . 
	rst 38h			;7754	ff 	. 
	ld (bc),a			;7755	02 	. 
	rlca			;7756	07 	. 
	rrca			;7757	0f 	. 
	ld bc,087b4h		;7758	01 b4 87 	. . . 
	ld (bc),a			;775b	02 	. 
	inc bc			;775c	03 	. 
	inc bc			;775d	03 	. 
	jp m,087bbh		;775e	fa bb 87 	. . . 
	ld (bc),a			;7761	02 	. 
	inc bc			;7762	03 	. 
	ld b,0fah		;7763	06 fa 	. . 
	exx			;7765	d9 	. 
	adc a,b			;7766	88 	. 
	ld (bc),a			;7767	02 	. 
	ex af,af'			;7768	08 	. 
	ld (bc),a			;7769	02 	. 
	jp m,08994h		;776a	fa 94 89 	. . . 
	nop			;776d	00 	. 
	jr nz,$-4		;776e	20 fa 	  . 
	call nc,00289h		;7770	d4 89 02 	. . . 
	inc bc			;7773	03 	. 
	rlca			;7774	07 	. 
	jp m,08907h		;7775	fa 07 89 	. . . 
	nop			;7778	00 	. 
	dec c			;7779	0d 	. 
	call m,088fbh		;777a	fc fb 88 	. . . 
	dec bc			;777d	0b 	. 
	ld b,0fah		;777e	06 fa 	. . 
	jp z,06389h		;7780	ca 89 63 	. . c 
	inc de			;7783	13 	. 
	rst 38h			;7784	ff 	. 
	inc bc			;7785	03 	. 
	ld bc,01902h		;7786	01 02 19 	. . . 
	inc bc			;7789	03 	. 
	jp m,0899bh		;778a	fa 9b 89 	. . . 
	nop			;778d	00 	. 
	add hl,bc			;778e	09 	. 
	jp m,0897bh		;778f	fa 7b 89 	. { . 
	ld hl,(02c2bh)		;7792	2a 2b 2c 	* + , 
	rst 38h			;7795	ff 	. 
	inc bc			;7796	03 	. 
	jp m,00802h		;7797	fa 02 08 	. . . 
	rlca			;779a	07 	. 
	nop			;779b	00 	. 
	call pe,00087h		;779c	ec 87 00 	. . . 
	ret po			;779f	e0 	. 
	nop			;77a0	00 	. 
	call nc,00088h		;77a1	d4 88 00 	. . . 
	ex af,af'			;77a4	08 	. 
	nop			;77a5	00 	. 
	cp a			;77a6	bf 	. 
	adc a,b			;77a7	88 	. 
	nop			;77a8	00 	. 
	ex af,af'			;77a9	08 	. 
	call m,088cch		;77aa	fc cc 88 	. . . 
	ld hl,0ed0fh		;77ad	21 0f ed 	! . . 
	add a,a			;77b0	87 	. 
	ld hl,0c20ah		;77b1	21 0a c2 	! . . 
	adc a,b			;77b4	88 	. 
	rst 38h			;77b5	ff 	. 
	nop			;77b6	00 	. 
	inc bc			;77b7	03 	. 
	jp m,089d4h		;77b8	fa d4 89 	. . . 
	nop			;77bb	00 	. 
	dec e			;77bc	1d 	. 
	call m,089d7h		;77bd	fc d7 89 	. . . 
	ld hl,0cb12h		;77c0	21 12 cb 	! . . 
	add a,a			;77c3	87 	. 
	ld h,d			;77c4	62 	b 
	rst 38h			;77c5	ff 	. 
	nop			;77c6	00 	. 
	jr nz,$-2		;77c7	20 fc 	  . 
	call nc,05889h		;77c9	d4 89 58 	. . X 
	ld e,c			;77cc	59 	Y 
	ld h,e			;77cd	63 	c 
	inc de			;77ce	13 	. 
	ld h,h			;77cf	64 	d 
	rst 38h			;77d0	ff 	. 
	nop			;77d1	00 	. 
	inc bc			;77d2	03 	. 
	jp m,087b4h		;77d3	fa b4 87 	. . . 
	nop			;77d6	00 	. 
	ld a,(bc)			;77d7	0a 	. 
	call m,087b7h		;77d8	fc b7 87 	. . . 
	ld hl,0cb10h		;77db	21 10 cb 	! . . 
	add a,a			;77de	87 	. 
	nop			;77df	00 	. 
	ex af,af'			;77e0	08 	. 
	call m,088b4h		;77e1	fc b4 88 	. . . 
	ld (bc),a			;77e4	02 	. 
	ld (bc),a			;77e5	02 	. 
	ld (bc),a			;77e6	02 	. 
	jp m,089b4h		;77e7	fa b4 89 	. . . 
	nop			;77ea	00 	. 
	ld e,0fch		;77eb	1e fc 	. . 
	or (hl)			;77ed	b6 	. 
	adc a,c			;77ee	89 	. 
	rst 38h			;77ef	ff 	. 
	nop			;77f0	00 	. 
	inc d			;77f1	14 	. 
	call m,089b4h		;77f2	fc b4 89 	. . . 
	ld (bc),a			;77f5	02 	. 
	ld c,002h		;77f6	0e 02 	. . 
	call m,08986h		;77f8	fc 86 89 	. . . 
	inc b			;77fb	04 	. 
	call m,089a5h		;77fc	fc a5 89 	. . . 
	ld h,d			;77ff	62 	b 
	ld h,e			;7800	63 	c 
	inc de			;7801	13 	. 
	rst 38h			;7802	ff 	. 
	nop			;7803	00 	. 
	ld b,b			;7804	40 	@ 
	call m,08974h		;7805	fc 74 89 	. t . 
	ld h,h			;7808	64 	d 
	ld h,l			;7809	65 	e 
	rst 38h			;780a	ff 	. 
	nop			;780b	00 	. 
	dec c			;780c	0d 	. 
	call m,089d4h		;780d	fc d4 89 	. . . 
	ld (bc),a			;7810	02 	. 
	inc bc			;7811	03 	. 
	ld c,0fah		;7812	0e fa 	. . 
	rst 0			;7814	c7 	. 
	add a,a			;7815	87 	. 
	ld (bc),a			;7816	02 	. 
	ld a,(bc)			;7817	0a 	. 
	ld c,001h		;7818	0e 01 	. . 
	jp z,01387h		;781a	ca 87 13 	. . . 
	ld (bc),a			;781d	02 	. 
	inc de			;781e	13 	. 
	inc b			;781f	04 	. 
	jp m,08981h		;7820	fa 81 89 	. . . 
	ld h,d			;7823	62 	b 
	rst 38h			;7824	ff 	. 
	inc bc			;7825	03 	. 
	ld bc,00a01h		;7826	01 01 0a 	. . . 
	ld (bc),a			;7829	02 	. 
	add a,087h		;782a	c6 87 	. . 
	ld (bc),a			;782c	02 	. 
	ld d,003h		;782d	16 03 	. . 
	jp m,08994h		;782f	fa 94 89 	. . . 
	ld (bc),a			;7832	02 	. 
	ld c,005h		;7833	0e 05 	. . 
	jp m,088fch		;7835	fa fc 88 	. . . 
	ld (bc),a			;7838	02 	. 
	inc bc			;7839	03 	. 
	inc b			;783a	04 	. 
	jp m,08919h		;783b	fa 19 89 	. . . 
	rst 38h			;783e	ff 	. 
	inc bc			;783f	03 	. 
	ld bc,00b01h		;7840	01 01 0b 	. . . 
	ld (bc),a			;7843	02 	. 
	and (hl)			;7844	a6 	. 
	adc a,b			;7845	88 	. 
	rst 38h			;7846	ff 	. 
	inc bc			;7847	03 	. 
	ld bc,00c02h		;7848	01 02 0c 	. . . 
	inc b			;784b	04 	. 
	jp m,08974h		;784c	fa 74 89 	. t . 
	nop			;784f	00 	. 
	inc d			;7850	14 	. 
	jp p,089c0h		;7851	f2 c0 89 	. . . 
	ld hl,(003ffh)		;7854	2a ff 03 	* . . 
	ld bc,01800h		;7857	01 00 18 	. . . 
	jp p,089b4h		;785a	f2 b4 89 	. . . 
	nop			;785d	00 	. 
	rrca			;785e	0f 	. 
	jp m,089e5h		;785f	fa e5 89 	. . . 
	inc c			;7862	0c 	. 
	ld (bc),a			;7863	02 	. 
	jp m,089cch		;7864	fa cc 89 	. . . 
	ex af,af'			;7867	08 	. 
	ld c,0cfh		;7868	0e cf 	. . 
	add a,a			;786a	87 	. 
	ld (bc),a			;786b	02 	. 
	ld b,003h		;786c	06 03 	. . 
	jp m,0898eh		;786e	fa 8e 89 	. . . 
	ld bc,0020eh		;7871	01 0e 02 	. . . 
	pop de			;7874	d1 	. 
	add a,a			;7875	87 	. 
	rst 38h			;7876	ff 	. 
	inc bc			;7877	03 	. 
	ld bc,00800h		;7878	01 00 08 	. . . 
	jp p,0898ch		;787b	f2 8c 89 	. . . 
	ld bc,00203h		;787e	01 03 02 	. . . 
	or c			;7881	b1 	. 
	adc a,c			;7882	89 	. 
	ex af,af'			;7883	08 	. 
	inc b			;7884	04 	. 
	adc a,a			;7885	8f 	. 
	adc a,c			;7886	89 	. 
	rst 38h			;7887	ff 	. 
	inc bc			;7888	03 	. 
	ld bc,00702h		;7889	01 02 07 	. . . 
	inc bc			;788c	03 	. 
	jp m,087cdh		;788d	fa cd 87 	. . . 
	ld (bc),a			;7890	02 	. 
	ld (bc),a			;7891	02 	. 
	rrca			;7892	0f 	. 
	jp m,08832h		;7893	fa 32 88 	. 2 . 
	nop			;7896	00 	. 
	ex af,af'			;7897	08 	. 
	jp p,08974h		;7898	f2 74 89 	. t . 
	ld bc,00203h		;789b	01 03 02 	. . . 
	sub a			;789e	97 	. 
	adc a,c			;789f	89 	. 
	rst 38h			;78a0	ff 	. 
	inc bc			;78a1	03 	. 
	ld bc,00502h		;78a2	01 02 05 	. . . 
	inc b			;78a5	04 	. 
	jp m,08974h		;78a6	fa 74 89 	. t . 
	ld bc,0020eh		;78a9	01 0e 02 	. . . 
	or a			;78ac	b7 	. 
	add a,a			;78ad	87 	. 
	ld (bc),a			;78ae	02 	. 
	ld (bc),a			;78af	02 	. 
	ld b,0fah		;78b0	06 fa 	. . 
	jp nc,00287h		;78b2	d2 87 02 	. . . 
	djnz $+14		;78b5	10 0c 	. . 
	jp m,08884h		;78b7	fa 84 88 	. . . 
	ld (bc),a			;78ba	02 	. 
	add hl,bc			;78bb	09 	. 
	inc b			;78bc	04 	. 
	ld bc,08884h		;78bd	01 84 88 	. . . 
	ld a,(bc)			;78c0	0a 	. 
	inc b			;78c1	04 	. 
	ld bc,08904h		;78c2	01 04 89 	. . . 
	rst 38h			;78c5	ff 	. 
	inc bc			;78c6	03 	. 
	jp m,00b02h		;78c7	fa 02 0b 	. . . 
	ld (de),a			;78ca	12 	. 
	ld bc,087b9h		;78cb	01 b9 87 	. . . 
	ld (bc),a			;78ce	02 	. 
	inc c			;78cf	0c 	. 
	ex af,af'			;78d0	08 	. 
	ld bc,08848h		;78d1	01 48 88 	. H . 
	ld (bc),a			;78d4	02 	. 
	ex af,af'			;78d5	08 	. 
	ld b,001h		;78d6	06 01 	. . 
	ld c,b			;78d8	48 	H 
	adc a,c			;78d9	89 	. 
	nop			;78da	00 	. 
	ex af,af'			;78db	08 	. 
	call m,08968h		;78dc	fc 68 89 	. h . 
	ex af,af'			;78df	08 	. 
	dec b			;78e0	05 	. 
	ld l,e			;78e1	6b 	k 
	adc a,c			;78e2	89 	. 
	rst 38h			;78e3	ff 	. 
	inc bc			;78e4	03 	. 
	ld bc,00502h		;78e5	01 02 05 	. . . 
	ld (bc),a			;78e8	02 	. 
	jp m,087b4h		;78e9	fa b4 87 	. . . 
	ld (bc),a			;78ec	02 	. 
	inc b			;78ed	04 	. 
	ld (bc),a			;78ee	02 	. 
	jp m,087c4h		;78ef	fa c4 87 	. . . 
	ld (bc),a			;78f2	02 	. 
	inc bc			;78f3	03 	. 
	ld (bc),a			;78f4	02 	. 
	jp m,087d0h		;78f5	fa d0 87 	. . . 
	ld bc,0fa12h		;78f8	01 12 fa 	. . . 
	out (087h),a		;78fb	d3 87 	. . 
	ex af,af'			;78fd	08 	. 
	djnz $-51		;78fe	10 cb 	. . 
	add a,a			;7900	87 	. 
	ld bc,08d0eh		;7901	01 0e 8d 	. . . 
	dec (hl)			;7904	35 	5 
	adc a,d			;7905	8a 	. 
	nop			;7906	00 	. 
	rra			;7907	1f 	. 
	call m,089b4h		;7908	fc b4 89 	. . . 
	nop			;790b	00 	. 
	rra			;790c	1f 	. 
	nop			;790d	00 	. 
	call nc,0ff89h		;790e	d4 89 ff 	. . . 
	inc bc			;7911	03 	. 
	ld bc,00e02h		;7912	01 02 0e 	. . . 
	ld b,0fah		;7915	06 fa 	. . 
	push bc			;7917	c5 	. 
	add a,a			;7918	87 	. 
	ld bc,0fa12h		;7919	01 12 fa 	. . . 
	out (087h),a		;791c	d3 87 	. . 
	ld (bc),a			;791e	02 	. 
	inc b			;791f	04 	. 
	inc c			;7920	0c 	. 
	jp m,08883h		;7921	fa 83 88 	. . . 
	ld a,(bc)			;7924	0a 	. 
	inc bc			;7925	03 	. 
	jp m,08887h		;7926	fa 87 88 	. . . 
	rst 38h			;7929	ff 	. 
	inc bc			;792a	03 	. 
	ld bc,00201h		;792b	01 01 02 	. . . 
	jp m,087d3h		;792e	fa d3 87 	. . . 
	ld (bc),a			;7931	02 	. 
	inc b			;7932	04 	. 
	rlca			;7933	07 	. 
	jp m,087c3h		;7934	fa c3 87 	. . . 
	ld (bc),a			;7937	02 	. 
	inc b			;7938	04 	. 
	ld (bc),a			;7939	02 	. 
	jp m,089c3h		;793a	fa c3 89 	. . . 
	ld bc,08d09h		;793d	01 09 8d 	. . . 
	push hl			;7940	e5 	. 
	adc a,d			;7941	8a 	. 
	nop			;7942	00 	. 
	dec c			;7943	0d 	. 
	call m,089c7h		;7944	fc c7 89 	. . . 
	nop			;7947	00 	. 
	dec c			;7948	0d 	. 
	nop			;7949	00 	. 
	rst 20h			;794a	e7 	. 
	adc a,c			;794b	89 	. 
	nop			;794c	00 	. 
	ld de,098f2h		;794d	11 f2 98 	. . . 
	adc a,c			;7950	89 	. 
	ld b,002h		;7951	06 02 	. . 
	pop af			;7953	f1 	. 
	cp e			;7954	bb 	. 
	adc a,c			;7955	89 	. 
	ld b,002h		;7956	06 02 	. . 
	inc b			;7958	04 	. 
	cp h			;7959	bc 	. 
	adc a,c			;795a	89 	. 
	ld hl,0cd02h		;795b	21 02 cd 	! . . 
	adc a,c			;795e	89 	. 
	rst 38h			;795f	ff 	. 
	ld (bc),a			;7960	02 	. 
	rrca			;7961	0f 	. 
	ld (de),a			;7962	12 	. 
	ld bc,087b4h		;7963	01 b4 87 	. . . 
	ld (bc),a			;7966	02 	. 
	inc b			;7967	04 	. 
	ld (de),a			;7968	12 	. 
	jp m,087c3h		;7969	fa c3 87 	. . . 
	ld hl,0cd12h		;796c	21 12 cd 	! . . 
	add a,a			;796f	87 	. 
	ld b,006h		;7970	06 06 	. . 
	pop af			;7972	f1 	. 
	cp l			;7973	bd 	. 
	add a,a			;7974	87 	. 
	ld b,005h		;7975	06 05 	. . 
	inc b			;7977	04 	. 
	cp (hl)			;7978	be 	. 
	add a,a			;7979	87 	. 
	rst 38h			;797a	ff 	. 
	ld (bc),a			;797b	02 	. 
	dec d			;797c	15 	. 
	ld (de),a			;797d	12 	. 
	ld bc,087bfh		;797e	01 bf 87 	. . . 
	ld (bc),a			;7981	02 	. 
	inc bc			;7982	03 	. 
	dec b			;7983	05 	. 
	jp m,087bdh		;7984	fa bd 87 	. . . 
	ld (bc),a			;7987	02 	. 
	inc bc			;7988	03 	. 
	inc b			;7989	04 	. 
	jp m,0897dh		;798a	fa 7d 89 	. } . 
	ld (bc),a			;798d	02 	. 
	add hl,bc			;798e	09 	. 
	ld (bc),a			;798f	02 	. 
	call m,08974h		;7990	fc 74 89 	. t . 
	nop			;7993	00 	. 
	ld d,0f2h		;7994	16 f2 	. . 
	ld e,e			;7996	5b 	[ 
	adc a,c			;7997	89 	. 
	rlca			;7998	07 	. 
	inc bc			;7999	03 	. 
	inc bc			;799a	03 	. 
	add a,d			;799b	82 	. 
	adc a,c			;799c	89 	. 
	rlca			;799d	07 	. 
	inc b			;799e	04 	. 
	di			;799f	f3 	. 
	add a,e			;79a0	83 	. 
	adc a,c			;79a1	89 	. 
	inc de			;79a2	13 	. 
	rst 38h			;79a3	ff 	. 
	ld (bc),a			;79a4	02 	. 
	inc bc			;79a5	03 	. 
	ld (de),a			;79a6	12 	. 
	jp m,087bdh		;79a7	fa bd 87 	. . . 
	ld (bc),a			;79aa	02 	. 
	inc d			;79ab	14 	. 
	ld (de),a			;79ac	12 	. 
	ld bc,087c0h		;79ad	01 c0 87 	. . . 
	inc de			;79b0	13 	. 
	rst 38h			;79b1	ff 	. 
	ld (bc),a			;79b2	02 	. 
	dec d			;79b3	15 	. 
	ld (de),a			;79b4	12 	. 
	ld bc,087bfh		;79b5	01 bf 87 	. . . 
	ld (bc),a			;79b8	02 	. 
	inc bc			;79b9	03 	. 
	inc b			;79ba	04 	. 
	jp m,087bdh		;79bb	fa bd 87 	. . . 
	nop			;79be	00 	. 
	inc c			;79bf	0c 	. 
	jp m,089d4h		;79c0	fa d4 89 	. . . 
	nop			;79c3	00 	. 
	inc c			;79c4	0c 	. 
	call m,08914h		;79c5	fc 14 89 	. . . 
	ld (bc),a			;79c8	02 	. 
	inc bc			;79c9	03 	. 
	dec b			;79ca	05 	. 
	jp m,0893dh		;79cb	fa 3d 89 	. = . 
	nop			;79ce	00 	. 
	add hl,bc			;79cf	09 	. 
	jp p,0893eh		;79d0	f2 3e 89 	. > . 
	inc de			;79d3	13 	. 
	rst 38h			;79d4	ff 	. 
	ld (bc),a			;79d5	02 	. 
	dec d			;79d6	15 	. 
	rrca			;79d7	0f 	. 
	ld bc,087bfh		;79d8	01 bf 87 	. . . 
	ld (bc),a			;79db	02 	. 
	inc c			;79dc	0c 	. 
	ld (bc),a			;79dd	02 	. 
	jp m,087b4h		;79de	fa b4 87 	. . . 
	nop			;79e1	00 	. 
	add hl,bc			;79e2	09 	. 
	call m,08974h		;79e3	fc 74 89 	. t . 
	ld (bc),a			;79e6	02 	. 
	dec b			;79e7	05 	. 
	dec b			;79e8	05 	. 
	jp m,0895dh		;79e9	fa 5d 89 	. ] . 
	ld (bc),a			;79ec	02 	. 
	ld (de),a			;79ed	12 	. 
	inc bc			;79ee	03 	. 
	jp m,089a2h		;79ef	fa a2 89 	. . . 
	inc de			;79f2	13 	. 
	dec hl			;79f3	2b 	+ 
	rst 38h			;79f4	ff 	. 
	ld (bc),a			;79f5	02 	. 
	inc de			;79f6	13 	. 
	ld (de),a			;79f7	12 	. 
	jp m,087b4h		;79f8	fa b4 87 	. . . 
	ld (bc),a			;79fb	02 	. 
	rrca			;79fc	0f 	. 
	rrca			;79fd	0f 	. 
	ld bc,087b4h		;79fe	01 b4 87 	. . . 
	ld hl,0cd12h		;7a01	21 12 cd 	! . . 
	add a,a			;7a04	87 	. 
	rst 38h			;7a05	ff 	. 
	ld h,d			;7a06	62 	b 
	ld hl,0b611h		;7a07	21 11 b6 	! . . 
	add a,a			;7a0a	87 	. 
	nop			;7a0b	00 	. 
	ld (de),a			;7a0c	12 	. 
	call m,089d4h		;7a0d	fc d4 89 	. . . 
	ld (bc),a			;7a10	02 	. 
	inc bc			;7a11	03 	. 
	ld (de),a			;7a12	12 	. 
	jp m,087c6h		;7a13	fa c6 87 	. . . 
	ld (bc),a			;7a16	02 	. 
	dec bc			;7a17	0b 	. 
	ld (bc),a			;7a18	02 	. 
	jp m,087c9h		;7a19	fa c9 87 	. . . 
	nop			;7a1c	00 	. 
	dec bc			;7a1d	0b 	. 
	call m,08989h		;7a1e	fc 89 89 	. . . 
	ld hl,08e04h		;7a21	21 04 8e 	! . . 
	adc a,c			;7a24	89 	. 
	ld e,b			;7a25	58 	X 
	rst 38h			;7a26	ff 	. 
	nop			;7a27	00 	. 
	ld b,b			;7a28	40 	@ 
	call m,089b4h		;7a29	fc b4 89 	. . . 
	ld (bc),a			;7a2c	02 	. 
	inc bc			;7a2d	03 	. 
	rlca			;7a2e	07 	. 
	jp m,087c6h		;7a2f	fa c6 87 	. . . 
	ld (bc),a			;7a32	02 	. 
	ld c,002h		;7a33	0e 02 	. . 
	jp m,088a6h		;7a35	fa a6 88 	. . . 
	ld hl,0ce10h		;7a38	21 10 ce 	! . . 
	add a,a			;7a3b	87 	. 
	ld d,h			;7a3c	54 	T 
	ld d,l			;7a3d	55 	U 
	ld d,(hl)			;7a3e	56 	V 
	rst 38h			;7a3f	ff 	. 
	nop			;7a40	00 	. 
	ld b,b			;7a41	40 	@ 
	call m,089b4h		;7a42	fc b4 89 	. . . 
	ld (bc),a			;7a45	02 	. 
	inc bc			;7a46	03 	. 
	rlca			;7a47	07 	. 
	jp m,087bdh		;7a48	fa bd 87 	. . . 
	ld (bc),a			;7a4b	02 	. 
	inc c			;7a4c	0c 	. 
	ld (bc),a			;7a4d	02 	. 
	jp m,08894h		;7a4e	fa 94 88 	. . . 
	ld d,h			;7a51	54 	T 
	ld d,l			;7a52	55 	U 
	ld d,(hl)			;7a53	56 	V 
	ld d,a			;7a54	57 	W 
	rst 38h			;7a55	ff 	. 
	ld (bc),a			;7a56	02 	. 
	inc e			;7a57	1c 	. 
	inc bc			;7a58	03 	. 
	jp m,087b8h		;7a59	fa b8 87 	. . . 
	ld (bc),a			;7a5c	02 	. 
	rlca			;7a5d	07 	. 
	inc bc			;7a5e	03 	. 
	jp m,089adh		;7a5f	fa ad 89 	. . . 
	rst 38h			;7a62	ff 	. 
	ld h,d			;7a63	62 	b 
	ld h,l			;7a64	65 	e 
	nop			;7a65	00 	. 
	ld b,b			;7a66	40 	@ 
	call m,089b4h		;7a67	fc b4 89 	. . . 
	ld hl,0cd02h		;7a6a	21 02 cd 	! . . 
	adc a,c			;7a6d	89 	. 
	rst 38h			;7a6e	ff 	. 
	nop			;7a6f	00 	. 
	ld b,b			;7a70	40 	@ 
	call m,089b4h		;7a71	fc b4 89 	. . . 
	ld (bc),a			;7a74	02 	. 
	ex af,af'			;7a75	08 	. 
	ld (bc),a			;7a76	02 	. 
	nop			;7a77	00 	. 
	cp c			;7a78	b9 	. 
	adc a,c			;7a79	89 	. 
	ld (bc),a			;7a7a	02 	. 
	add hl,bc			;7a7b	09 	. 
	ld (bc),a			;7a7c	02 	. 
	nop			;7a7d	00 	. 
	add a,089h		;7a7e	c6 89 	. . 
	ld h,e			;7a80	63 	c 
	inc de			;7a81	13 	. 
	ld h,h			;7a82	64 	d 
	rst 38h			;7a83	ff 	. 
	ld (bc),a			;7a84	02 	. 
	dec b			;7a85	05 	. 
	inc b			;7a86	04 	. 
	call m,087c1h		;7a87	fc c1 87 	. . . 
	nop			;7a8a	00 	. 
	ld b,b			;7a8b	40 	@ 
	call m,089b4h		;7a8c	fc b4 89 	. . . 
	nop			;7a8f	00 	. 
	inc de			;7a90	13 	. 
	nop			;7a91	00 	. 
	exx			;7a92	d9 	. 
	adc a,c			;7a93	89 	. 
	nop			;7a94	00 	. 
	rla			;7a95	17 	. 
	ld l,a			;7a96	6f 	o 
	or a			;7a97	b7 	. 
	adc a,c			;7a98	89 	. 
	rst 38h			;7a99	ff 	. 
	nop			;7a9a	00 	. 
	ld b,b			;7a9b	40 	@ 
	call m,089b4h		;7a9c	fc b4 89 	. . . 
	ld (bc),a			;7a9f	02 	. 
	dec b			;7aa0	05 	. 
	ld (bc),a			;7aa1	02 	. 
	nop			;7aa2	00 	. 
	jp 03689h		;7aa3	c3 89 36 	. . 6 
	ld d,l			;7aa6	55 	U 
	ld d,a			;7aa7	57 	W 
	rst 38h			;7aa8	ff 	. 
	nop			;7aa9	00 	. 
	ccf			;7aaa	3f 	? 
	call m,089b4h		;7aab	fc b4 89 	. . . 
	ld bc,0fa12h		;7aae	01 12 fa 	. . . 
	out (087h),a		;7ab1	d3 87 	. . 
	ld hl,0cd10h		;7ab3	21 10 cd 	! . . 
	add a,a			;7ab6	87 	. 
	rst 38h			;7ab7	ff 	. 
	ld bc,0fa12h		;7ab8	01 12 fa 	. . . 
	out (087h),a		;7abb	d3 87 	. . 
	ld (bc),a			;7abd	02 	. 
	dec bc			;7abe	0b 	. 
	ld (bc),a			;7abf	02 	. 
	call m,08968h		;7ac0	fc 68 89 	. h . 
	ld hl,0cd12h		;7ac3	21 12 cd 	! . . 
	add a,a			;7ac6	87 	. 
	ld (bc),a			;7ac7	02 	. 
	add hl,bc			;7ac8	09 	. 
	ld (bc),a			;7ac9	02 	. 
	call m,089b4h		;7aca	fc b4 89 	. . . 
	nop			;7acd	00 	. 
	rrca			;7ace	0f 	. 
	call m,0899bh		;7acf	fc 9b 89 	. . . 
	ld h,h			;7ad2	64 	d 
	rst 38h			;7ad3	ff 	. 
	ld h,h			;7ad4	64 	d 
	ld h,e			;7ad5	63 	c 
	inc de			;7ad6	13 	. 
	nop			;7ad7	00 	. 
	ld b,b			;7ad8	40 	@ 
	call m,089b4h		;7ad9	fc b4 89 	. . . 
	nop			;7adc	00 	. 
	jr nz,$-4		;7add	20 fa 	  . 
	or h			;7adf	b4 	. 
	add a,a			;7ae0	87 	. 
	ld hl,0c210h		;7ae1	21 10 c2 	! . . 
	add a,a			;7ae4	87 	. 
	ld d,c			;7ae5	51 	Q 
	ccf			;7ae6	3f 	? 
	rst 38h			;7ae7	ff 	. 
	ld h,d			;7ae8	62 	b 
	ld h,l			;7ae9	65 	e 
	nop			;7aea	00 	. 
	ld (bc),a			;7aeb	02 	. 
	jp m,087b4h		;7aec	fa b4 87 	. . . 
	ld (bc),a			;7aef	02 	. 
	ld b,002h		;7af0	06 02 	. . 
	jp m,089b4h		;7af2	fa b4 89 	. . . 
	inc b			;7af5	04 	. 
	call m,089b4h		;7af6	fc b4 89 	. . . 
	nop			;7af9	00 	. 
	dec de			;7afa	1b 	. 
	call m,089b9h		;7afb	fc b9 89 	. . . 
	dec (hl)			;7afe	35 	5 
	djnz $+43		;7aff	10 29 	. ) 
	rst 38h			;7b01	ff 	. 
	ld h,h			;7b02	64 	d 
	ld h,e			;7b03	63 	c 
	inc de			;7b04	13 	. 
	nop			;7b05	00 	. 
	jr nz,$-2		;7b06	20 fc 	  . 
	or h			;7b08	b4 	. 
	adc a,c			;7b09	89 	. 
	dec h			;7b0a	25 	% 
	ld d,h			;7b0b	54 	T 
	ld d,l			;7b0c	55 	U 
	ld d,(hl)			;7b0d	56 	V 
	ld d,a			;7b0e	57 	W 
	rst 38h			;7b0f	ff 	. 
	ld h,d			;7b10	62 	b 
	ld h,l			;7b11	65 	e 
	ld bc,07e0ah		;7b12	01 0a 7e 	. . ~ 
	adc a,088h		;7b15	ce 88 	. . 
	nop			;7b17	00 	. 
	dec e			;7b18	1d 	. 
	call m,089b4h		;7b19	fc b4 89 	. . . 
	ld hl,0b602h		;7b1c	21 02 b6 	! . . 
	adc a,c			;7b1f	89 	. 
	rst 38h			;7b20	ff 	. 
	ld h,e			;7b21	63 	c 
	inc de			;7b22	13 	. 
	ld bc,07e0ch		;7b23	01 0c 7e 	. . ~ 
	adc a,087h		;7b26	ce 87 	. . 
	nop			;7b28	00 	. 
	dec b			;7b29	05 	. 
	call m,0892fh		;7b2a	fc 2f 89 	. / . 
	nop			;7b2d	00 	. 
	ld d,0fch		;7b2e	16 fc 	. . 
	sub h			;7b30	94 	. 
	adc a,c			;7b31	89 	. 
	ld hl,0b612h		;7b32	21 12 b6 	! . . 
	add a,a			;7b35	87 	. 
	nop			;7b36	00 	. 
	ld c,0fah		;7b37	0e fa 	. . 
	and 089h		;7b39	e6 89 	. . 
	ld (bc),a			;7b3b	02 	. 
	inc bc			;7b3c	03 	. 
	dec b			;7b3d	05 	. 
	jp m,0894eh		;7b3e	fa 4e 89 	. N . 
	inc c			;7b41	0c 	. 
	dec b			;7b42	05 	. 
	jp m,089c9h		;7b43	fa c9 89 	. . . 
	jr c,$+1		;7b46	38 ff 	8 . 
	ld (bc),a			;7b48	02 	. 
	ld (bc),a			;7b49	02 	. 
	inc bc			;7b4a	03 	. 
	jp m,087b8h		;7b4b	fa b8 87 	. . . 
	ld bc,0020ch		;7b4e	01 0c 02 	. . . 
	jr $-118		;7b51	18 88 	. . 
	ld (bc),a			;7b53	02 	. 
	dec b			;7b54	05 	. 
	inc bc			;7b55	03 	. 
	jp m,08994h		;7b56	fa 94 89 	. . . 
	nop			;7b59	00 	. 
	dec de			;7b5a	1b 	. 
	call m,08999h		;7b5b	fc 99 89 	. . . 
	ld (bc),a			;7b5e	02 	. 
	inc b			;7b5f	04 	. 
	rrca			;7b60	0f 	. 
	ex af,af'			;7b61	08 	. 
	or h			;7b62	b4 	. 
	add a,a			;7b63	87 	. 
	ld c,e			;7b64	4b 	K 
	ld c,h			;7b65	4c 	L 
	ld h,d			;7b66	62 	b 
	ld h,l			;7b67	65 	e 
	rst 38h			;7b68	ff 	. 
	ld (bc),a			;7b69	02 	. 
	dec b			;7b6a	05 	. 
	ld b,0fah		;7b6b	06 fa 	. . 
	or h			;7b6d	b4 	. 
	add a,a			;7b6e	87 	. 
	ld (bc),a			;7b6f	02 	. 
	dec b			;7b70	05 	. 
	add hl,bc			;7b71	09 	. 
	ex af,af'			;7b72	08 	. 
	ld (hl),h			;7b73	74 	t 
	adc a,b			;7b74	88 	. 
	ld (bc),a			;7b75	02 	. 
	ld a,(bc)			;7b76	0a 	. 
	inc bc			;7b77	03 	. 
	jp m,08994h		;7b78	fa 94 89 	. . . 
	ld (bc),a			;7b7b	02 	. 
	inc bc			;7b7c	03 	. 
	inc bc			;7b7d	03 	. 
	jp m,089b1h		;7b7e	fa b1 89 	. . . 
	ld (bc),a			;7b81	02 	. 
	inc de			;7b82	13 	. 
	ld (bc),a			;7b83	02 	. 
	ex af,af'			;7b84	08 	. 
	cp (hl)			;7b85	be 	. 
	adc a,c			;7b86	89 	. 
	nop			;7b87	00 	. 
	dec d			;7b88	15 	. 
	jp p,0899dh		;7b89	f2 9d 89 	. . . 
	ld c,003h		;7b8c	0e 03 	. . 
	xor e			;7b8e	ab 	. 
	adc a,c			;7b8f	89 	. 
	rst 38h			;7b90	ff 	. 
	inc bc			;7b91	03 	. 
	jp m,01302h		;7b92	fa 02 13 	. . . 
	ld (de),a			;7b95	12 	. 
	ex af,af'			;7b96	08 	. 
	cp (hl)			;7b97	be 	. 
	add a,a			;7b98	87 	. 
	ld c,012h		;7b99	0e 12 	. . 
	res 0,a		;7b9b	cb 87 	. . 
	rst 38h			;7b9d	ff 	. 
	inc bc			;7b9e	03 	. 
	jp m,01302h		;7b9f	fa 02 13 	. . . 
	ex af,af'			;7ba2	08 	. 
	ex af,af'			;7ba3	08 	. 
	cp (hl)			;7ba4	be 	. 
	add a,a			;7ba5	87 	. 
	nop			;7ba6	00 	. 
	ret po			;7ba7	e0 	. 
	ex af,af'			;7ba8	08 	. 
	or h			;7ba9	b4 	. 
	adc a,b			;7baa	88 	. 
	ld c,00fh		;7bab	0e 0f 	. . 
	res 0,a		;7bad	cb 87 	. . 
	add hl,sp			;7baf	39 	9 
	rst 38h			;7bb0	ff 	. 
	ld (bc),a			;7bb1	02 	. 
	inc bc			;7bb2	03 	. 
	inc bc			;7bb3	03 	. 
	jp m,08994h		;7bb4	fa 94 89 	. . . 
	ld (bc),a			;7bb7	02 	. 
	ld e,003h		;7bb8	1e 03 	. . 
	call m,08996h		;7bba	fc 96 89 	. . . 
	ld c,l			;7bbd	4d 	M 
	rst 38h			;7bbe	ff 	. 
	ld l,b			;7bbf	68 	h 
	ld (bc),a			;7bc0	02 	. 
	inc bc			;7bc1	03 	. 
	ld (de),a			;7bc2	12 	. 
	jp m,087b4h		;7bc3	fa b4 87 	. . . 
	nop			;7bc6	00 	. 
	ld e,0fch		;7bc7	1e fc 	. . 
	ld d,089h		;7bc9	16 89 	. . 
	ld bc,07e06h		;7bcb	01 06 7e 	. . ~ 
	ld c,(hl)			;7bce	4e 	N 
	adc a,c			;7bcf	89 	. 
	rst 38h			;7bd0	ff 	. 
	ld l,b			;7bd1	68 	h 
	ld (bc),a			;7bd2	02 	. 
	inc bc			;7bd3	03 	. 
	ex af,af'			;7bd4	08 	. 
	jp m,087b4h		;7bd5	fa b4 87 	. . . 
	ld bc,00807h		;7bd8	01 07 08 	. . . 
	or h			;7bdb	b4 	. 
	adc a,b			;7bdc	88 	. 
	ld bc,07e07h		;7bdd	01 07 7e 	. . ~ 
	or l			;7be0	b5 	. 
	adc a,b			;7be1	88 	. 
	ld bc,07e0fh		;7be2	01 0f 7e 	. . ~ 
	adc a,087h		;7be5	ce 87 	. . 
	nop			;7be7	00 	. 
	ld e,h			;7be8	5c 	\ 
	call m,08998h		;7be9	fc 98 89 	. . . 
	ld (bc),a			;7bec	02 	. 
	inc b			;7bed	04 	. 
	inc bc			;7bee	03 	. 
	jp m,08994h		;7bef	fa 94 89 	. . . 
	jr c,$+80		;7bf2	38 4e 	8 N 
	rst 38h			;7bf4	ff 	. 
	ld hl,0ba0fh		;7bf5	21 0f ba 	! . . 
	add a,a			;7bf8	87 	. 
	ld bc,0fa06h		;7bf9	01 06 fa 	. . . 
	out (087h),a		;7bfc	d3 87 	. . 
	ld (bc),a			;7bfe	02 	. 
	inc bc			;7bff	03 	. 
	inc bc			;7c00	03 	. 
	jp m,089b1h		;7c01	fa b1 89 	. . . 
	ld (bc),a			;7c04	02 	. 
	ld e,003h		;7c05	1e 03 	. . 
	call m,08994h		;7c07	fc 94 89 	. . . 
	inc (hl)			;7c0a	34 	4 
	ld c,(hl)			;7c0b	4e 	N 
	rst 38h			;7c0c	ff 	. 
	inc bc			;7c0d	03 	. 
	jp m,00000h		;7c0e	fa 00 00 	. . . 
	inc de			;7c11	13 	. 
	ld (hl),h			;7c12	74 	t 
	adc a,b			;7c13	88 	. 
	nop			;7c14	00 	. 
	jr nz,$+21		;7c15	20 13 	  . 
	ld (hl),h			;7c17	74 	t 
	adc a,c			;7c18	89 	. 
	ld bc,07e09h		;7c19	01 09 7e 	. . ~ 
	ld a,b			;7c1c	78 	x 
	adc a,b			;7c1d	88 	. 
	ld bc,07e09h		;7c1e	01 09 7e 	. . ~ 
	sub b			;7c21	90 	. 
	adc a,b			;7c22	88 	. 
	rst 38h			;7c23	ff 	. 
	ld l,b			;7c24	68 	h 
	ld (bc),a			;7c25	02 	. 
	inc bc			;7c26	03 	. 
	ld (bc),a			;7c27	02 	. 
	jp m,087d1h		;7c28	fa d1 87 	. . . 
	nop			;7c2b	00 	. 
	jr nz,$-2		;7c2c	20 fc 	  . 
	inc d			;7c2e	14 	. 
	adc a,c			;7c2f	89 	. 
	rst 38h			;7c30	ff 	. 
	ld l,b			;7c31	68 	h 
	nop			;7c32	00 	. 
	ld h,b			;7c33	60 	` 
	call m,08994h		;7c34	fc 94 89 	. . . 
	ld c,a			;7c37	4f 	O 
	rst 38h			;7c38	ff 	. 
	ld l,b			;7c39	68 	h 
	nop			;7c3a	00 	. 
	ld h,b			;7c3b	60 	` 
	call m,08994h		;7c3c	fc 94 89 	. . . 
	ld bc,07e0fh		;7c3f	01 0f 7e 	. . ~ 
	cp b			;7c42	b8 	. 
	add a,a			;7c43	87 	. 
	ld bc,07e0fh		;7c44	01 0f 7e 	. . ~ 
	ret nc			;7c47	d0 	. 
	add a,a			;7c48	87 	. 
	ld b,b			;7c49	40 	@ 
	ld c,l			;7c4a	4d 	M 
	ld c,(hl)			;7c4b	4e 	N 
	rst 38h			;7c4c	ff 	. 
	ld l,b			;7c4d	68 	h 
	nop			;7c4e	00 	. 
	ld b,b			;7c4f	40 	@ 
	jp m,087b4h		;7c50	fa b4 87 	. . . 
	ld bc,07e10h		;7c53	01 10 7e 	. . ~ 
	ret m			;7c56	f8 	. 
	add a,a			;7c57	87 	. 
	ld bc,07e10h		;7c58	01 10 7e 	. . ~ 
	djnz $-118		;7c5b	10 88 	. . 
	nop			;7c5d	00 	. 
	jr nz,$-2		;7c5e	20 fc 	  . 
	inc d			;7c60	14 	. 
	adc a,c			;7c61	89 	. 
	rst 38h			;7c62	ff 	. 
	nop			;7c63	00 	. 
	jr nz,$-2		;7c64	20 fc 	  . 
	sub h			;7c66	94 	. 
	adc a,c			;7c67	89 	. 
	inc sp			;7c68	33 	3 
	inc (hl)			;7c69	34 	4 
	rst 38h			;7c6a	ff 	. 
	ld l,b			;7c6b	68 	h 
	ld (bc),a			;7c6c	02 	. 
	inc b			;7c6d	04 	. 
	ld (bc),a			;7c6e	02 	. 
	jp m,087b4h		;7c6f	fa b4 87 	. . . 
	ld hl,0b90bh		;7c72	21 0b b9 	! . . 
	add a,a			;7c75	87 	. 
	nop			;7c76	00 	. 
	jr nz,$-2		;7c77	20 fc 	  . 
	inc d			;7c79	14 	. 
	adc a,c			;7c7a	89 	. 
	rst 38h			;7c7b	ff 	. 
	ld l,b			;7c7c	68 	h 
	ld (bc),a			;7c7d	02 	. 
	ld (bc),a			;7c7e	02 	. 
	ld (bc),a			;7c7f	02 	. 
	call m,08994h		;7c80	fc 94 89 	. . . 
	inc c			;7c83	0c 	. 
	inc bc			;7c84	03 	. 
	jp m,089d4h		;7c85	fa d4 89 	. . . 
	nop			;7c88	00 	. 
	ld a,(de)			;7c89	1a 	. 
	jp p,089b7h		;7c8a	f2 b7 89 	. . . 
	nop			;7c8d	00 	. 
	ld a,(de)			;7c8e	1a 	. 
	ex af,af'			;7c8f	08 	. 
	rst 10h			;7c90	d7 	. 
	adc a,c			;7c91	89 	. 
	ld c,002h		;7c92	0e 02 	. . 
	rst 0			;7c94	c7 	. 
	adc a,c			;7c95	89 	. 
	ld (bc),a			;7c96	02 	. 
	ld (bc),a			;7c97	02 	. 
	ld (bc),a			;7c98	02 	. 
	call m,089b2h		;7c99	fc b2 89 	. . . 
	dec bc			;7c9c	0b 	. 
	inc bc			;7c9d	03 	. 
	jp m,089f1h		;7c9e	fa f1 89 	. . . 
	rst 38h			;7ca1	ff 	. 
	inc bc			;7ca2	03 	. 
	jp m,01a02h		;7ca3	fa 02 1a 	. . . 
	ex af,af'			;7ca6	08 	. 
	ex af,af'			;7ca7	08 	. 
	or a			;7ca8	b7 	. 
	add a,a			;7ca9	87 	. 
	nop			;7caa	00 	. 
	nop			;7cab	00 	. 
	ex af,af'			;7cac	08 	. 
	sub h			;7cad	94 	. 
	adc a,b			;7cae	88 	. 
	ld c,00fh		;7caf	0e 0f 	. . 
	rst 0			;7cb1	c7 	. 
	add a,a			;7cb2	87 	. 
	rst 38h			;7cb3	ff 	. 
	inc bc			;7cb4	03 	. 
	jp m,01702h		;7cb5	fa 02 17 	. . . 
	ex af,af'			;7cb8	08 	. 
	ex af,af'			;7cb9	08 	. 
	cp d			;7cba	ba 	. 
	add a,a			;7cbb	87 	. 
	ld (bc),a			;7cbc	02 	. 
	dec e			;7cbd	1d 	. 
	add hl,bc			;7cbe	09 	. 
	ex af,af'			;7cbf	08 	. 
	ld (hl),h			;7cc0	74 	t 
	adc a,b			;7cc1	88 	. 
	ld c,00fh		;7cc2	0e 0f 	. . 
	jp z,0ff87h		;7cc4	ca 87 ff 	. . . 
	ld l,b			;7cc7	68 	h 
	ld (bc),a			;7cc8	02 	. 
	inc bc			;7cc9	03 	. 
	ld (de),a			;7cca	12 	. 
	jp m,087d1h		;7ccb	fa d1 87 	. . . 
	ld (bc),a			;7cce	02 	. 
	dec b			;7ccf	05 	. 
	inc bc			;7cd0	03 	. 
	call m,08994h		;7cd1	fc 94 89 	. . . 
	inc c			;7cd4	0c 	. 
	inc bc			;7cd5	03 	. 
	jp m,089d7h		;7cd6	fa d7 89 	. . . 
	ld hl,0ca10h		;7cd9	21 10 ca 	! . . 
	add a,a			;7cdc	87 	. 
	nop			;7cdd	00 	. 
	rla			;7cde	17 	. 
	jp p,089bah		;7cdf	f2 ba 89 	. . . 
	nop			;7ce2	00 	. 
	rla			;7ce3	17 	. 
	ex af,af'			;7ce4	08 	. 
	jp c,00e89h		;7ce5	da 89 0e 	. . . 
	ld (bc),a			;7ce8	02 	. 
	jp z,0ff89h		;7ce9	ca 89 ff 	. . . 
	ld l,b			;7cec	68 	h 
	ld (bc),a			;7ced	02 	. 
	inc bc			;7cee	03 	. 
	ld (de),a			;7cef	12 	. 
	jp m,087d1h		;7cf0	fa d1 87 	. . . 
	nop			;7cf3	00 	. 
	ld e,0fch		;7cf4	1e fc 	. . 
	inc d			;7cf6	14 	. 
	adc a,c			;7cf7	89 	. 
	ld hl,02a07h		;7cf8	21 07 2a 	! . * 
	adc a,c			;7cfb	89 	. 
	rst 38h			;7cfc	ff 	. 
	ld l,b			;7cfd	68 	h 
	nop			;7cfe	00 	. 
	ld h,b			;7cff	60 	` 
	call m,08994h		;7d00	fc 94 89 	. . . 
	scf			;7d03	37 	7 
	rst 38h			;7d04	ff 	. 
	ld l,b			;7d05	68 	h 
	nop			;7d06	00 	. 
	jr nz,$-2		;7d07	20 fc 	  . 
	inc d			;7d09	14 	. 
	adc a,c			;7d0a	89 	. 
	rst 38h			;7d0b	ff 	. 
	ld (bc),a			;7d0c	02 	. 
	jr nz,$+5		;7d0d	20 03 	  . 
	call m,08994h		;7d0f	fc 94 89 	. . . 
	scf			;7d12	37 	7 
	rst 38h			;7d13	ff 	. 
	nop			;7d14	00 	. 
	jr nz,$-2		;7d15	20 fc 	  . 
	sub h			;7d17	94 	. 
	adc a,c			;7d18	89 	. 
	ld e,e			;7d19	5b 	[ 
	inc sp			;7d1a	33 	3 
	inc (hl)			;7d1b	34 	4 
	ld h,e			;7d1c	63 	c 
	inc de			;7d1d	13 	. 
	ld h,h			;7d1e	64 	d 
	rst 38h			;7d1f	ff 	. 
	nop			;7d20	00 	. 
	inc b			;7d21	04 	. 
	jp m,087b4h		;7d22	fa b4 87 	. . . 
	ld (bc),a			;7d25	02 	. 
	ld (bc),a			;7d26	02 	. 
	ld c,008h		;7d27	0e 08 	. . 
	call nc,00187h		;7d29	d4 87 01 	. . . 
	ld c,002h		;7d2c	0e 02 	. . 
	sub 087h		;7d2e	d6 87 	. . 
	ld (bc),a			;7d30	02 	. 
	inc b			;7d31	04 	. 
	inc bc			;7d32	03 	. 
	jp m,08994h		;7d33	fa 94 89 	. . . 
	nop			;7d36	00 	. 
	inc e			;7d37	1c 	. 
	call m,08998h		;7d38	fc 98 89 	. . . 
	inc (hl)			;7d3b	34 	4 
	rst 38h			;7d3c	ff 	. 
	nop			;7d3d	00 	. 
	jr nz,$-2		;7d3e	20 fc 	  . 
	sub h			;7d40	94 	. 
	adc a,c			;7d41	89 	. 
	ld e,e			;7d42	5b 	[ 
	ld e,h			;7d43	5c 	\ 
	scf			;7d44	37 	7 
	ld l,e			;7d45	6b 	k 
	rst 38h			;7d46	ff 	. 
	nop			;7d47	00 	. 
	jr nz,$-2		;7d48	20 fc 	  . 
	sub h			;7d4a	94 	. 
	adc a,c			;7d4b	89 	. 
	ld (bc),a			;7d4c	02 	. 
	inc bc			;7d4d	03 	. 
	ld (bc),a			;7d4e	02 	. 
	jp m,089d1h		;7d4f	fa d1 89 	. . . 
	ld hl,0cd0fh		;7d52	21 0f cd 	! . . 
	add a,a			;7d55	87 	. 
	ld hl,0ac03h		;7d56	21 03 ac 	! . . 
	adc a,c			;7d59	89 	. 
	ld c,e			;7d5a	4b 	K 
	ld c,h			;7d5b	4c 	L 
	ld h,(hl)			;7d5c	66 	f 
	rst 38h			;7d5d	ff 	. 
	nop			;7d5e	00 	. 
	ld (bc),a			;7d5f	02 	. 
	call m,08994h		;7d60	fc 94 89 	. . . 
	nop			;7d63	00 	. 
	rlca			;7d64	07 	. 
	jp m,089b4h		;7d65	fa b4 89 	. . . 
	nop			;7d68	00 	. 
	jr nz,$-4		;7d69	20 fa 	  . 
	call nc,0ff89h		;7d6b	d4 89 ff 	. . . 
	inc bc			;7d6e	03 	. 
	jp m,01d02h		;7d6f	fa 02 1d 	. . . 
	rrca			;7d72	0f 	. 
	ex af,af'			;7d73	08 	. 
	or a			;7d74	b7 	. 
	add a,a			;7d75	87 	. 
	ld (bc),a			;7d76	02 	. 
	inc b			;7d77	04 	. 
	ld a,(bc)			;7d78	0a 	. 
	jp m,08867h		;7d79	fa 67 88 	. g . 
	nop			;7d7c	00 	. 
	inc de			;7d7d	13 	. 
	call m,08876h		;7d7e	fc 76 88 	. v . 
	ld bc,00205h		;7d81	01 05 02 	. . . 
	ret			;7d84	c9 	. 
	add a,a			;7d85	87 	. 
	ld c,00fh		;7d86	0e 0f 	. . 
	call z,0ff87h		;7d88	cc 87 ff 	. . . 
	inc bc			;7d8b	03 	. 
	ex af,af'			;7d8c	08 	. 
	ld (bc),a			;7d8d	02 	. 
	inc bc			;7d8e	03 	. 
	ld (de),a			;7d8f	12 	. 
	jp m,087b4h		;7d90	fa b4 87 	. . . 
	ld bc,00212h		;7d93	01 12 02 	. . . 
	ret			;7d96	c9 	. 
	add a,a			;7d97	87 	. 
	nop			;7d98	00 	. 
	inc d			;7d99	14 	. 
	call m,088c0h		;7d9a	fc c0 88 	. . . 
	ld c,012h		;7d9d	0e 12 	. . 
	call z,0ff87h		;7d9f	cc 87 ff 	. . . 
	inc bc			;7da2	03 	. 
	ex af,af'			;7da3	08 	. 
	ld (bc),a			;7da4	02 	. 
	inc bc			;7da5	03 	. 
	ld (de),a			;7da6	12 	. 
	jp m,087b4h		;7da7	fa b4 87 	. . . 
	ld bc,00212h		;7daa	01 12 02 	. . . 
	ret			;7dad	c9 	. 
	add a,a			;7dae	87 	. 
	nop			;7daf	00 	. 
	dec c			;7db0	0d 	. 
	call m,08947h		;7db1	fc 47 89 	. G . 
	ld c,012h		;7db4	0e 12 	. . 
	call z,0ff87h		;7db6	cc 87 ff 	. . . 
	inc bc			;7db9	03 	. 
	ex af,af'			;7dba	08 	. 
	ld (bc),a			;7dbb	02 	. 
	inc bc			;7dbc	03 	. 
	ld (de),a			;7dbd	12 	. 
	jp m,087b4h		;7dbe	fa b4 87 	. . . 
	nop			;7dc1	00 	. 
	dec e			;7dc2	1d 	. 
	call m,08977h		;7dc3	fc 77 89 	. w . 
	ld c,004h		;7dc6	0e 04 	. . 
	adc a,h			;7dc8	8c 	. 
	adc a,c			;7dc9	89 	. 
	ld bc,00203h		;7dca	01 03 02 	. . . 
	xor c			;7dcd	a9 	. 
	adc a,c			;7dce	89 	. 
	ld c,00eh		;7dcf	0e 0e 	. . 
	cp d			;7dd1	ba 	. 
	add a,a			;7dd2	87 	. 
	rst 38h			;7dd3	ff 	. 
	inc bc			;7dd4	03 	. 
	ex af,af'			;7dd5	08 	. 
	ld (bc),a			;7dd6	02 	. 
	inc bc			;7dd7	03 	. 
	ld (de),a			;7dd8	12 	. 
	jp m,087b4h		;7dd9	fa b4 87 	. . . 
	nop			;7ddc	00 	. 
	dec e			;7ddd	1d 	. 
	call m,08997h		;7dde	fc 97 89 	. . . 
	ld c,012h		;7de1	0e 12 	. . 
	cp d			;7de3	ba 	. 
	add a,a			;7de4	87 	. 
	scf			;7de5	37 	7 
	rst 38h			;7de6	ff 	. 
	ld (bc),a			;7de7	02 	. 
	inc bc			;7de8	03 	. 
	inc bc			;7de9	03 	. 
	jp m,087b5h		;7dea	fa b5 87 	. . . 
	ld bc,0080fh		;7ded	01 0f 08 	. . . 
	or h			;7df0	b4 	. 
	add a,a			;7df1	87 	. 
	ld bc,0020ch		;7df2	01 0c 02 	. . . 
	dec d			;7df5	15 	. 
	adc a,b			;7df6	88 	. 
	ld (bc),a			;7df7	02 	. 
	inc bc			;7df8	03 	. 
	inc bc			;7df9	03 	. 
	jp m,08994h		;7dfa	fa 94 89 	. . . 
	nop			;7dfd	00 	. 
	dec e			;7dfe	1d 	. 
	call m,089b7h		;7dff	fc b7 89 	. . . 
	nop			;7e02	00 	. 
	dec e			;7e03	1d 	. 
	ex af,af'			;7e04	08 	. 
	rst 10h			;7e05	d7 	. 
	adc a,c			;7e06	89 	. 
	ld c,002h		;7e07	0e 02 	. . 
	cp d			;7e09	ba 	. 
	adc a,c			;7e0a	89 	. 
	ld hl,0c410h		;7e0b	21 10 c4 	! . . 
	add a,a			;7e0e	87 	. 
	rst 38h			;7e0f	ff 	. 
	nop			;7e10	00 	. 
	inc bc			;7e11	03 	. 
	jp m,089d4h		;7e12	fa d4 89 	. . . 
	nop			;7e15	00 	. 
	dec e			;7e16	1d 	. 
	call m,089d7h		;7e17	fc d7 89 	. . . 
	ld hl,0e401h		;7e1a	21 01 e4 	! . . 
	adc a,c			;7e1d	89 	. 
	rst 38h			;7e1e	ff 	. 
	ld (bc),a			;7e1f	02 	. 
	inc bc			;7e20	03 	. 
	ld b,0fah		;7e21	06 fa 	. . 
	pop de			;7e23	d1 	. 
	add a,a			;7e24	87 	. 
	ld (bc),a			;7e25	02 	. 
	inc bc			;7e26	03 	. 
	add hl,bc			;7e27	09 	. 
	ex af,af'			;7e28	08 	. 
	sub c			;7e29	91 	. 
	adc a,b			;7e2a	88 	. 
	ld (bc),a			;7e2b	02 	. 
	inc bc			;7e2c	03 	. 
	inc bc			;7e2d	03 	. 
	jp m,089b1h		;7e2e	fa b1 89 	. . . 
	nop			;7e31	00 	. 
	dec bc			;7e32	0b 	. 
	call m,089d4h		;7e33	fc d4 89 	. . . 
	nop			;7e36	00 	. 
	dec bc			;7e37	0b 	. 
	jp p,089a6h		;7e38	f2 a6 89 	. . . 
	nop			;7e3b	00 	. 
	inc b			;7e3c	04 	. 
	jp p,089ceh		;7e3d	f2 ce 89 	. . . 
	rst 38h			;7e40	ff 	. 
	ld (bc),a			;7e41	02 	. 
	inc bc			;7e42	03 	. 
	ld (de),a			;7e43	12 	. 
	jp m,087d1h		;7e44	fa d1 87 	. . . 
	ld bc,00210h		;7e47	01 10 02 	. . . 
	or a			;7e4a	b7 	. 
	add a,a			;7e4b	87 	. 
	nop			;7e4c	00 	. 
	dec e			;7e4d	1d 	. 
	call m,089b4h		;7e4e	fc b4 89 	. . . 
	nop			;7e51	00 	. 
	dec e			;7e52	1d 	. 
	ex af,af'			;7e53	08 	. 
	call nc,00489h		;7e54	d4 89 04 	. . . 
	ld (bc),a			;7e57	02 	. 
	rst 18h			;7e58	df 	. 
	adc a,c			;7e59	89 	. 
	ld c,c			;7e5a	49 	I 
	ld c,d			;7e5b	4a 	J 
	rst 38h			;7e5c	ff 	. 
	inc bc			;7e5d	03 	. 
	ex af,af'			;7e5e	08 	. 
	ld (bc),a			;7e5f	02 	. 
	inc bc			;7e60	03 	. 
	ld b,0fah		;7e61	06 fa 	. . 
	pop de			;7e63	d1 	. 
	add a,a			;7e64	87 	. 
	ld (bc),a			;7e65	02 	. 
	inc bc			;7e66	03 	. 
	rlca			;7e67	07 	. 
	ex af,af'			;7e68	08 	. 
	pop de			;7e69	d1 	. 
	adc a,b			;7e6a	88 	. 
	ld (bc),a			;7e6b	02 	. 
	rlca			;7e6c	07 	. 
	inc bc			;7e6d	03 	. 
	jp m,089adh		;7e6e	fa ad 89 	. . . 
	ld bc,00212h		;7e71	01 12 02 	. . . 
	cp a			;7e74	bf 	. 
	add a,a			;7e75	87 	. 
	nop			;7e76	00 	. 
	djnz $-2		;7e77	10 fc 	. . 
	sub h			;7e79	94 	. 
	adc a,c			;7e7a	89 	. 
	rst 38h			;7e7b	ff 	. 
	inc bc			;7e7c	03 	. 
	ex af,af'			;7e7d	08 	. 
	ld bc,0020eh		;7e7e	01 0e 02 	. . . 
	cp a			;7e81	bf 	. 
	add a,a			;7e82	87 	. 
	ld (bc),a			;7e83	02 	. 
	rlca			;7e84	07 	. 
	ld (bc),a			;7e85	02 	. 
	jp m,087cdh		;7e86	fa cd 87 	. . . 
	ld (bc),a			;7e89	02 	. 
	inc bc			;7e8a	03 	. 
	djnz $-4		;7e8b	10 fa 	. . 
	ld de,00088h		;7e8d	11 88 00 	. . . 
	dec e			;7e90	1d 	. 
	call m,08974h		;7e91	fc 74 89 	. t . 
	ld bc,00203h		;7e94	01 03 02 	. . . 
	sub l			;7e97	95 	. 
	adc a,c			;7e98	89 	. 
	rst 38h			;7e99	ff 	. 
	inc bc			;7e9a	03 	. 
	ex af,af'			;7e9b	08 	. 
	ld (bc),a			;7e9c	02 	. 
	inc bc			;7e9d	03 	. 
	ld (de),a			;7e9e	12 	. 
	jp m,087d1h		;7e9f	fa d1 87 	. . . 
	ld bc,00212h		;7ea2	01 12 02 	. . . 
	or l			;7ea5	b5 	. 
	add a,a			;7ea6	87 	. 
	nop			;7ea7	00 	. 
	ex af,af'			;7ea8	08 	. 
	call m,08934h		;7ea9	fc 34 89 	. 4 . 
	nop			;7eac	00 	. 
	ld c,0fch		;7ead	0e fc 	. . 
	push bc			;7eaf	c5 	. 
	adc a,c			;7eb0	89 	. 
	rst 38h			;7eb1	ff 	. 
	inc bc			;7eb2	03 	. 
	ex af,af'			;7eb3	08 	. 
	ld (bc),a			;7eb4	02 	. 
	inc bc			;7eb5	03 	. 
	ld (de),a			;7eb6	12 	. 
	jp m,087d1h		;7eb7	fa d1 87 	. . . 
	ld bc,00212h		;7eba	01 12 02 	. . . 
	or l			;7ebd	b5 	. 
	add a,a			;7ebe	87 	. 
	nop			;7ebf	00 	. 
	ld b,0fch		;7ec0	06 fc 	. . 
	or h			;7ec2	b4 	. 
	adc a,b			;7ec3	88 	. 
	rst 38h			;7ec4	ff 	. 
	inc bc			;7ec5	03 	. 
	ex af,af'			;7ec6	08 	. 
	ld (bc),a			;7ec7	02 	. 
	inc bc			;7ec8	03 	. 
	ld b,0fah		;7ec9	06 fa 	. . 
	pop de			;7ecb	d1 	. 
	add a,a			;7ecc	87 	. 
	ld (bc),a			;7ecd	02 	. 
	inc bc			;7ece	03 	. 
	inc bc			;7ecf	03 	. 
	jp m,08994h		;7ed0	fa 94 89 	. . . 
	ld bc,0020fh		;7ed3	01 0f 02 	. . . 
	or l			;7ed6	b5 	. 
	add a,a			;7ed7	87 	. 
	ld (bc),a			;7ed8	02 	. 
	inc bc			;7ed9	03 	. 
	inc bc			;7eda	03 	. 
	jp m,089b1h		;7edb	fa b1 89 	. . . 
	nop			;7ede	00 	. 
	inc e			;7edf	1c 	. 
	jp p,089b6h		;7ee0	f2 b6 89 	. . . 
	nop			;7ee3	00 	. 
	ld a,(de)			;7ee4	1a 	. 
	ex af,af'			;7ee5	08 	. 
	rst 10h			;7ee6	d7 	. 
	adc a,c			;7ee7	89 	. 
	ld c,002h		;7ee8	0e 02 	. . 
	jp 0ff89h		;7eea	c3 89 ff 	. . . 
	ld hl,0ca0eh		;7eed	21 0e ca 	! . . 
	add a,a			;7ef0	87 	. 
	ld (bc),a			;7ef1	02 	. 
	ld (bc),a			;7ef2	02 	. 
	ld b,0fah		;7ef3	06 fa 	. . 
	jp nc,00087h		;7ef5	d2 87 00 	. . . 
	ld de,094fch		;7ef8	11 fc 94 	. . . 
	adc a,c			;7efb	89 	. 
	ld hl,09c03h		;7efc	21 03 9c 	! . . 
	adc a,c			;7eff	89 	. 
	ld (bc),a			;7f00	02 	. 
	rrca			;7f01	0f 	. 
	inc b			;7f02	04 	. 
	jp m,08985h		;7f03	fa 85 89 	. . . 
	ld h,(hl)			;7f06	66 	f 
	rst 38h			;7f07	ff 	. 
	nop			;7f08	00 	. 
	inc a			;7f09	3c 	< 
	call m,089b8h		;7f0a	fc b8 89 	. . . 
	ld (bc),a			;7f0d	02 	. 
	inc b			;7f0e	04 	. 
	ld (de),a			;7f0f	12 	. 
	jp m,087b4h		;7f10	fa b4 87 	. . . 
	ld hl,0bc12h		;7f13	21 12 bc 	! . . 
	add a,a			;7f16	87 	. 
	djnz $+88		;7f17	10 56 	. V 
	rst 38h			;7f19	ff 	. 
	ld (bc),a			;7f1a	02 	. 
	inc b			;7f1b	04 	. 
	ld (de),a			;7f1c	12 	. 
	jp m,087b4h		;7f1d	fa b4 87 	. . . 
	nop			;7f20	00 	. 
	inc e			;7f21	1c 	. 
	call m,089d8h		;7f22	fc d8 89 	. . . 
	ld hl,0dc01h		;7f25	21 01 dc 	! . . 
	adc a,c			;7f28	89 	. 
	ld e,d			;7f29	5a 	Z 
	ld h,l			;7f2a	65 	e 
	ld h,d			;7f2b	62 	b 
	rst 38h			;7f2c	ff 	. 
	nop			;7f2d	00 	. 
	ld a,0fch		;7f2e	3e fc 	> . 
	or h			;7f30	b4 	. 
	adc a,c			;7f31	89 	. 
	ld hl,0ca02h		;7f32	21 02 ca 	! . . 
	adc a,c			;7f35	89 	. 
	ld (bc),a			;7f36	02 	. 
	ld (bc),a			;7f37	02 	. 
	ld (de),a			;7f38	12 	. 
	jp m,087d2h		;7f39	fa d2 87 	. . . 
	jr z,$+86		;7f3c	28 54 	( T 
	ld d,l			;7f3e	55 	U 
	rst 38h			;7f3f	ff 	. 
	nop			;7f40	00 	. 
	ld e,0fch		;7f41	1e fc 	. . 
	sub h			;7f43	94 	. 
	adc a,c			;7f44	89 	. 
	ld (bc),a			;7f45	02 	. 
	ld (bc),a			;7f46	02 	. 
	ld (de),a			;7f47	12 	. 
	jp m,087d2h		;7f48	fa d2 87 	. . . 
	ld hl,0ca12h		;7f4b	21 12 ca 	! . . 
	add a,a			;7f4e	87 	. 
	ld e,e			;7f4f	5b 	[ 
	ld e,h			;7f50	5c 	\ 
	ld h,(hl)			;7f51	66 	f 
	rst 38h			;7f52	ff 	. 
	nop			;7f53	00 	. 
	ld a,0fch		;7f54	3e fc 	> . 
	or h			;7f56	b4 	. 
	adc a,c			;7f57	89 	. 
	ld hl,0ca12h		;7f58	21 12 ca 	! . . 
	add a,a			;7f5b	87 	. 
	ld (bc),a			;7f5c	02 	. 
	ld (bc),a			;7f5d	02 	. 
	ld (de),a			;7f5e	12 	. 
	jp m,087d2h		;7f5f	fa d2 87 	. . . 
	ld d,h			;7f62	54 	T 
	ld d,l			;7f63	55 	U 
	rst 38h			;7f64	ff 	. 
	ld bc,0fa12h		;7f65	01 12 fa 	. . . 
	out (087h),a		;7f68	d3 87 	. . 
	nop			;7f6a	00 	. 
	rra			;7f6b	1f 	. 
	call m,08994h		;7f6c	fc 94 89 	. . . 
	ld hl,0ba12h		;7f6f	21 12 ba 	! . . 
	add a,a			;7f72	87 	. 
	ld hl,0c512h		;7f73	21 12 c5 	! . . 
	add a,a			;7f76	87 	. 
	rst 38h			;7f77	ff 	. 
	ld bc,0fa12h		;7f78	01 12 fa 	. . . 
	out (087h),a		;7f7b	d3 87 	. . 
	nop			;7f7d	00 	. 
	rra			;7f7e	1f 	. 
	call m,08934h		;7f7f	fc 34 89 	. 4 . 
	ld hl,0ba12h		;7f82	21 12 ba 	! . . 
	add a,a			;7f85	87 	. 
	ld hl,0c512h		;7f86	21 12 c5 	! . . 
	add a,a			;7f89	87 	. 
	rst 38h			;7f8a	ff 	. 
	nop			;7f8b	00 	. 
	jr nz,$-2		;7f8c	20 fc 	  . 
	inc (hl)			;7f8e	34 	4 
	adc a,c			;7f8f	89 	. 
	rst 38h			;7f90	ff 	. 
	ld (bc),a			;7f91	02 	. 
	dec b			;7f92	05 	. 
	ld (de),a			;7f93	12 	. 
	jp m,087b4h		;7f94	fa b4 87 	. . . 
	nop			;7f97	00 	. 
	dec de			;7f98	1b 	. 
	call m,08939h		;7f99	fc 39 89 	. 9 . 
	rst 38h			;7f9c	ff 	. 
	ld bc,0fa12h		;7f9d	01 12 fa 	. . . 
	out (087h),a		;7fa0	d3 87 	. . 
	nop			;7fa2	00 	. 
	rra			;7fa3	1f 	. 
	call m,08934h		;7fa4	fc 34 89 	. 4 . 
	ld hl,0ba12h		;7fa7	21 12 ba 	! . . 
	add a,a			;7faa	87 	. 
	ld hl,0c50ch		;7fab	21 0c c5 	! . . 
	add a,a			;7fae	87 	. 
	rst 38h			;7faf	ff 	. 
	ld (bc),a			;7fb0	02 	. 
	inc bc			;7fb1	03 	. 
	ld (de),a			;7fb2	12 	. 
	jp m,087d1h		;7fb3	fa d1 87 	. . . 
	ld (bc),a			;7fb6	02 	. 
	ld e,003h		;7fb7	1e 03 	. . 
	call m,08994h		;7fb9	fc 94 89 	. . . 
	ld hl,0cc0fh		;7fbc	21 0f cc 	! . . 
	add a,a			;7fbf	87 	. 
	inc sp			;7fc0	33 	3 
	rst 38h			;7fc1	ff 	. 
	ld (bc),a			;7fc2	02 	. 
	inc b			;7fc3	04 	. 
	ld (de),a			;7fc4	12 	. 
	jp m,087b4h		;7fc5	fa b4 87 	. . . 
	nop			;7fc8	00 	. 
	inc e			;7fc9	1c 	. 
	call m,08938h		;7fca	fc 38 89 	. 8 . 
	rst 38h			;7fcd	ff 	. 
	nop			;7fce	00 	. 
	dec e			;7fcf	1d 	. 
	call m,08934h		;7fd0	fc 34 89 	. 4 . 
	ld (bc),a			;7fd3	02 	. 
	inc bc			;7fd4	03 	. 
	ld (de),a			;7fd5	12 	. 
	jp m,087d1h		;7fd6	fa d1 87 	. . . 
	ld hl,0cc12h		;7fd9	21 12 cc 	! . . 
	add a,a			;7fdc	87 	. 
	rst 38h			;7fdd	ff 	. 
	nop			;7fde	00 	. 
	jr nz,$-2		;7fdf	20 fc 	  . 
	ld (hl),h			;7fe1	74 	t 
	adc a,c			;7fe2	89 	. 
	ld hl,0cd12h		;7fe3	21 12 cd 	! . . 
	add a,a			;7fe6	87 	. 
	ld e,l			;7fe7	5d 	] 
	ld h,b			;7fe8	60 	` 
	rst 38h			;7fe9	ff 	. 
	ld l,c			;7fea	69 	i 
	nop			;7feb	00 	. 
	jr nz,$-2		;7fec	20 fc 	  . 
	ld (hl),h			;7fee	74 	t 
	adc a,c			;7fef	89 	. 
	ld e,a			;7ff0	5f 	_ 
	ld h,b			;7ff1	60 	` 
	rst 38h			;7ff2	ff 	. 
	nop			;7ff3	00 	. 
	inc a			;7ff4	3c 	< 
	call m,089b8h		;7ff5	fc b8 89 	. . . 
	ld (bc),a			;7ff8	02 	. 
	inc b			;7ff9	04 	. 
	ld (de),a			;7ffa	12 	. 
	jp m,087b4h		;7ffb	fa b4 87 	. . . 
	ld hl,0bc10h		;7ffe	21 10 bc 	! . . 
	add a,a			;8001	87 	. 
	dec (hl)			;8002	35 	5 
	djnz $+1		;8003	10 ff 	. . 
	ld (bc),a			;8005	02 	. 
	inc b			;8006	04 	. 
	ld (de),a			;8007	12 	. 
	jp m,087b4h		;8008	fa b4 87 	. . . 
	nop			;800b	00 	. 
	inc e			;800c	1c 	. 
	call m,08978h		;800d	fc 78 89 	. x . 
	ld e,(hl)			;8010	5e 	^ 
	ld h,b			;8011	60 	` 
	rst 38h			;8012	ff 	. 
	nop			;8013	00 	. 
	jr nz,$-2		;8014	20 fc 	  . 
	ld (hl),h			;8016	74 	t 
	adc a,c			;8017	89 	. 
	ld e,l			;8018	5d 	] 
	ld e,(hl)			;8019	5e 	^ 
	ld e,a			;801a	5f 	_ 
	rst 38h			;801b	ff 	. 
	nop			;801c	00 	. 
	dec a			;801d	3d 	= 
	call m,089b4h		;801e	fc b4 89 	. . . 
	ld (bc),a			;8021	02 	. 
	inc bc			;8022	03 	. 
	ld (de),a			;8023	12 	. 
	jp m,087d1h		;8024	fa d1 87 	. . . 
	ld hl,0bc12h		;8027	21 12 bc 	! . . 
	add a,a			;802a	87 	. 
	ld d,(hl)			;802b	56 	V 
	rst 38h			;802c	ff 	. 
	nop			;802d	00 	. 
	dec e			;802e	1d 	. 
	call m,08974h		;802f	fc 74 89 	. t . 
	ld hl,0bc12h		;8032	21 12 bc 	! . . 
	add a,a			;8035	87 	. 
	ld (bc),a			;8036	02 	. 
	inc bc			;8037	03 	. 
	ld (de),a			;8038	12 	. 
	jp m,087d1h		;8039	fa d1 87 	. . . 
	ld e,l			;803c	5d 	] 
	ld e,a			;803d	5f 	_ 
	rst 38h			;803e	ff 	. 
	nop			;803f	00 	. 
	dec e			;8040	1d 	. 
	call m,08974h		;8041	fc 74 89 	. t . 
	ld hl,0bc0eh		;8044	21 0e bc 	! . . 
	add a,a			;8047	87 	. 
	ld (bc),a			;8048	02 	. 
	inc bc			;8049	03 	. 
	ld (de),a			;804a	12 	. 
	jp m,087d1h		;804b	fa d1 87 	. . . 
	ld e,(hl)			;804e	5e 	^ 
	rst 38h			;804f	ff 	. 
	nop			;8050	00 	. 
	jr nz,$-2		;8051	20 fc 	  . 
	ld (hl),h			;8053	74 	t 
	adc a,c			;8054	89 	. 
	ld e,l			;8055	5d 	] 
	ld e,(hl)			;8056	5e 	^ 
	ld e,a			;8057	5f 	_ 
	ld h,b			;8058	60 	` 
	rst 38h			;8059	ff 	. 
	ld (bc),a			;805a	02 	. 
	inc b			;805b	04 	. 
	ld (de),a			;805c	12 	. 
	jp m,087b4h		;805d	fa b4 87 	. . . 
	nop			;8060	00 	. 
	inc e			;8061	1c 	. 
	call m,08998h		;8062	fc 98 89 	. . . 
	ld hl,0bc12h		;8065	21 12 bc 	! . . 
	add a,a			;8068	87 	. 
	inc (hl)			;8069	34 	4 
	ld e,h			;806a	5c 	\ 
	rst 38h			;806b	ff 	. 
	ld (bc),a			;806c	02 	. 
	inc b			;806d	04 	. 
	ld b,0fah		;806e	06 fa 	. . 
	or h			;8070	b4 	. 
	add a,a			;8071	87 	. 
	ld (bc),a			;8072	02 	. 
	inc b			;8073	04 	. 
	inc bc			;8074	03 	. 
	jp m,08994h		;8075	fa 94 89 	. . . 
	ld (bc),a			;8078	02 	. 
	dec e			;8079	1d 	. 
	inc bc			;807a	03 	. 
	call m,08997h		;807b	fc 97 89 	. . . 
	ld hl,09903h		;807e	21 03 99 	! . . 
	adc a,c			;8081	89 	. 
	rst 38h			;8082	ff 	. 
	ld (bc),a			;8083	02 	. 
	dec b			;8084	05 	. 
	ld b,0fah		;8085	06 fa 	. . 
	or h			;8087	b4 	. 
	add a,a			;8088	87 	. 
	ld (bc),a			;8089	02 	. 
	dec b			;808a	05 	. 
	add hl,bc			;808b	09 	. 
	ex af,af'			;808c	08 	. 
	ld (hl),h			;808d	74 	t 
	adc a,b			;808e	88 	. 
	ld (bc),a			;808f	02 	. 
	dec b			;8090	05 	. 
	inc bc			;8091	03 	. 
	jp m,08994h		;8092	fa 94 89 	. . . 
	nop			;8095	00 	. 
	inc e			;8096	1c 	. 
	call m,08998h		;8097	fc 98 89 	. . . 
	inc sp			;809a	33 	3 
	inc (hl)			;809b	34 	4 
	ld l,e			;809c	6b 	k 
	rst 38h			;809d	ff 	. 
	ld hl,0cd10h		;809e	21 10 cd 	! . . 
	add a,a			;80a1	87 	. 
	nop			;80a2	00 	. 
	ld b,b			;80a3	40 	@ 
	call m,089b4h		;80a4	fc b4 89 	. . . 
	ld h,055h		;80a7	26 55 	& U 
	ld d,(hl)			;80a9	56 	V 
	ld h,d			;80aa	62 	b 
	rst 38h			;80ab	ff 	. 
	add hl,bc			;80ac	09 	. 
	djnz $+18		;80ad	10 10 	. . 
	djnz $+24		;80af	10 16 	. . 
	djnz $+18		;80b1	10 10 	. . 
	djnz $+18		;80b3	10 10 	. . 
	dec d			;80b5	15 	. 
	dec d			;80b6	15 	. 
	dec d			;80b7	15 	. 
	dec d			;80b8	15 	. 
	inc de			;80b9	13 	. 
	ld bc,00809h		;80ba	01 09 08 	. . . 
	sub e			;80bd	93 	. 
	adc a,b			;80be	88 	. 
	ld sp,0ff67h		;80bf	31 67 ff 	1 g . 
	add hl,bc			;80c2	09 	. 
	djnz $+18		;80c3	10 10 	. . 
	djnz $+18		;80c5	10 10 	. . 
	djnz $+18		;80c7	10 10 	. . 
	djnz $+18		;80c9	10 10 	. . 
	dec d			;80cb	15 	. 
	dec d			;80cc	15 	. 
	dec d			;80cd	15 	. 
	dec d			;80ce	15 	. 
	inc de			;80cf	13 	. 
	rst 38h			;80d0	ff 	. 
	add hl,bc			;80d1	09 	. 
	djnz $+18		;80d2	10 10 	. . 
	djnz $+18		;80d4	10 10 	. . 
	djnz $+18		;80d6	10 10 	. . 
	djnz $+18		;80d8	10 10 	. . 
	dec d			;80da	15 	. 
	dec d			;80db	15 	. 
	dec d			;80dc	15 	. 
	dec d			;80dd	15 	. 
	inc de			;80de	13 	. 
	ld bc,0c80ch		;80df	01 0c c8 	. . . 
	inc e			;80e2	1c 	. 
	adc a,b			;80e3	88 	. 
	rst 38h			;80e4	ff 	. 
	add hl,bc			;80e5	09 	. 
	djnz $+18		;80e6	10 10 	. . 
	djnz $+18		;80e8	10 10 	. . 
	djnz $+18		;80ea	10 10 	. . 
	djnz $+18		;80ec	10 10 	. . 
	djnz $+18		;80ee	10 10 	. . 
	djnz $+26		;80f0	10 18 	. . 
	inc de			;80f2	13 	. 
	rst 38h			;80f3	ff 	. 
	add hl,bc			;80f4	09 	. 
	djnz $+18		;80f5	10 10 	. . 
	djnz $+25		;80f7	10 17 	. . 
	djnz $+18		;80f9	10 10 	. . 
	djnz $+25		;80fb	10 17 	. . 
	djnz $+18		;80fd	10 10 	. . 
	djnz $+25		;80ff	10 17 	. . 
	inc de			;8101	13 	. 
	rst 38h			;8102	ff 	. 
	add hl,bc			;8103	09 	. 
	ld (de),a			;8104	12 	. 
	djnz $+18		;8105	10 10 	. . 
	djnz $+21		;8107	10 13 	. . 
	djnz $+18		;8109	10 10 	. . 
	djnz $+22		;810b	10 14 	. . 
	djnz $+18		;810d	10 10 	. . 
	djnz $+21		;810f	10 13 	. . 
	nop			;8111	00 	. 
	dec e			;8112	1d 	. 
	cp 097h		;8113	fe 97 	. . 
	adc a,c			;8115	89 	. 
	nop			;8116	00 	. 
	ld h,b			;8117	60 	` 
	jp m,08994h		;8118	fa 94 89 	. . . 
	nop			;811b	00 	. 
	ld c,0f2h		;811c	0e f2 	. . 
	sbc a,l			;811e	9d 	. 
	adc a,c			;811f	89 	. 
	nop			;8120	00 	. 
	ld a,(bc)			;8121	0a 	. 
	ex af,af'			;8122	08 	. 
	rst 18h			;8123	df 	. 
	adc a,c			;8124	89 	. 
	nop			;8125	00 	. 
	ld a,(bc)			;8126	0a 	. 
	ex af,af'			;8127	08 	. 
	cp a			;8128	bf 	. 
	adc a,c			;8129	89 	. 
	ld c,003h		;812a	0e 03 	. . 
	and e			;812c	a3 	. 
	adc a,c			;812d	89 	. 
	rst 38h			;812e	ff 	. 
	add hl,bc			;812f	09 	. 
	rrca			;8130	0f 	. 
	rrca			;8131	0f 	. 
	rrca			;8132	0f 	. 
	rrca			;8133	0f 	. 
	nop			;8134	00 	. 
	nop			;8135	00 	. 
	nop			;8136	00 	. 
	nop			;8137	00 	. 
	ld bc,00101h		;8138	01 01 01 	. . . 
	ld bc,0ff2dh		;813b	01 2d ff 	. - . 
	add hl,bc			;813e	09 	. 
	rrca			;813f	0f 	. 
	rrca			;8140	0f 	. 
	rrca			;8141	0f 	. 
	rrca			;8142	0f 	. 
	nop			;8143	00 	. 
	nop			;8144	00 	. 
	nop			;8145	00 	. 
	nop			;8146	00 	. 
	ld bc,00101h		;8147	01 01 01 	. . . 
	ld bc,000ffh		;814a	01 ff 00 	. . . 
	jr nz,$-2		;814d	20 fc 	  . 
	ld d,h			;814f	54 	T 
	adc a,c			;8150	89 	. 
	ld a,(0643dh)		;8151	3a 3d 64 	: = d 
	ld h,l			;8154	65 	e 
	rst 38h			;8155	ff 	. 
	ld l,b			;8156	68 	h 
	nop			;8157	00 	. 
	dec h			;8158	25 	% 
	call m,089cfh		;8159	fc cf 89 	. . . 
	ld (bc),a			;815c	02 	. 
	add hl,de			;815d	19 	. 
	ld (de),a			;815e	12 	. 
	ld bc,087b4h		;815f	01 b4 87 	. . . 
	ld (bc),a			;8162	02 	. 
	ld (bc),a			;8163	02 	. 
	ld (de),a			;8164	12 	. 
	jp m,087cdh		;8165	fa cd 87 	. . . 
	rst 38h			;8168	ff 	. 
	inc bc			;8169	03 	. 
	ld bc,00c01h		;816a	01 01 0c 	. . . 
	ld (bc),a			;816d	02 	. 
	pop bc			;816e	c1 	. 
	add a,a			;816f	87 	. 
	ld bc,0020ch		;8170	01 0c 02 	. . . 
	jp 00187h		;8173	c3 87 01 	. . . 
	inc b			;8176	04 	. 
	ld (bc),a			;8177	02 	. 
	jp nz,00088h		;8178	c2 88 00 	. . . 
	ld de,03ef2h		;817b	11 f2 3e 	. . > 
	adc a,c			;817e	89 	. 
	nop			;817f	00 	. 
	dec b			;8180	05 	. 
	rlca			;8181	07 	. 
	ld c,a			;8182	4f 	O 
	adc a,c			;8183	89 	. 
	ld bc,00205h		;8184	01 05 02 	. . . 
	ld h,b			;8187	60 	` 
	adc a,c			;8188	89 	. 
	ld bc,00205h		;8189	01 05 02 	. . . 
	ld l,e			;818c	6b 	k 
	adc a,c			;818d	89 	. 
	ex af,af'			;818e	08 	. 
	ld b,045h		;818f	06 45 	. E 
	adc a,c			;8191	89 	. 
	rst 38h			;8192	ff 	. 
	nop			;8193	00 	. 
	nop			;8194	00 	. 
	nop			;8195	00 	. 
	nop			;8196	00 	. 
	nop			;8197	00 	. 
	nop			;8198	00 	. 
	nop			;8199	00 	. 
	ld h,h			;819a	64 	d 
	ld h,l			;819b	65 	e 
	inc de			;819c	13 	. 
	nop			;819d	00 	. 
	nop			;819e	00 	. 
	nop			;819f	00 	. 
	nop			;81a0	00 	. 
	adc a,b			;81a1	88 	. 
	nop			;81a2	00 	. 
	nop			;81a3	00 	. 
	ld h,h			;81a4	64 	d 
	inc de			;81a5	13 	. 
	nop			;81a6	00 	. 
	rst 28h			;81a7	ef 	. 
	ex af,af'			;81a8	08 	. 
	ex af,af'			;81a9	08 	. 
	rst 28h			;81aa	ef 	. 
	djnz $+6		;81ab	10 04 	. . 
	rst 30h			;81ad	f7 	. 
	djnz $+4		;81ae	10 02 	. . 
	rst 28h			;81b0	ef 	. 
	inc b			;81b1	04 	. 
	ld bc,001efh		;81b2	01 ef 01 	. . . 
	djnz $+2		;81b5	10 00 	. . 
	nop			;81b7	00 	. 
	nop			;81b8	00 	. 
	nop			;81b9	00 	. 
	or 079h		;81ba	f6 79 	. y 
	ld (de),a			;81bc	12 	. 
	nop			;81bd	00 	. 
	ld a,a			;81be	7f 	 
	ld h,l			;81bf	65 	e 
	ex af,af'			;81c0	08 	. 
	add a,a			;81c1	87 	. 
	nop			;81c2	00 	. 
	adc a,e			;81c3	8b 	. 
	adc a,h			;81c4	8c 	. 
	ld (de),a			;81c5	12 	. 
	nop			;81c6	00 	. 
	defb 0fdh,001h,008h	;illegal sequence		;81c7	fd 01 08 	. . . 
	cp 002h		;81ca	fe 02 	. . 
	inc b			;81cc	04 	. 
	ld a,a			;81cd	7f 	 
	ex af,af'			;81ce	08 	. 
	ld (bc),a			;81cf	02 	. 
	ld a,a			;81d0	7f 	 
	inc b			;81d1	04 	. 
	ld bc,0017fh		;81d2	01 7f 01 	.  . 
	djnz $+2		;81d5	10 00 	. . 
	nop			;81d7	00 	. 
	nop			;81d8	00 	. 
	nop			;81d9	00 	. 
	or 078h		;81da	f6 78 	. x 
	ld a,d			;81dc	7a 	z 
	ld a,l			;81dd	7d 	} 
	ld a,(hl)			;81de	7e 	~ 
	add a,c			;81df	81 	. 
	add a,d			;81e0	82 	. 
	add a,(hl)			;81e1	86 	. 
	adc a,c			;81e2	89 	. 
	adc a,d			;81e3	8a 	. 
	adc a,l			;81e4	8d 	. 
	ld de,00000h		;81e5	11 00 00 	. . . 
	inc a			;81e8	3c 	< 
	ret z			;81e9	c8 	. 
	sub 006h		;81ea	d6 06 	. . 
	ret z			;81ec	c8 	. 
	dec a			;81ed	3d 	= 
	ret z			;81ee	c8 	. 
	ld b,024h		;81ef	06 24 	. $ 
	call 0d30ch		;81f1	cd 0c d3 	. . . 
	ret			;81f4	c9 	. 
	nop			;81f5	00 	. 
	nop			;81f6	00 	. 
	nop			;81f7	00 	. 
	nop			;81f8	00 	. 
	nop			;81f9	00 	. 
	or 077h		;81fa	f6 77 	. w 
	ld a,e			;81fc	7b 	{ 
	ld a,h			;81fd	7c 	| 
	add a,b			;81fe	80 	. 
	add a,e			;81ff	83 	. 
	add a,h			;8200	84 	. 
	add a,l			;8201	85 	. 
	sub e			;8202	93 	. 
	sub b			;8203	90 	. 
	adc a,(hl)			;8204	8e 	. 
	djnz $+9		;8205	10 07 	. . 
	rlca			;8207	07 	. 
	rlca			;8208	07 	. 
	rlca			;8209	07 	. 
	rlca			;820a	07 	. 
	ld b,000h		;820b	06 00 	. . 
	nop			;820d	00 	. 
	nop			;820e	00 	. 
	nop			;820f	00 	. 
	nop			;8210	00 	. 
	nop			;8211	00 	. 
	nop			;8212	00 	. 
	nop			;8213	00 	. 
	nop			;8214	00 	. 
	nop			;8215	00 	. 
	nop			;8216	00 	. 
	nop			;8217	00 	. 
	nop			;8218	00 	. 
	nop			;8219	00 	. 
	ld h,(hl)			;821a	66 	f 
	halt			;821b	76 	v 
	ld (hl),c			;821c	71 	q 
	sbc a,h			;821d	9c 	. 
	and d			;821e	a2 	. 
	and e			;821f	a3 	. 
	and h			;8220	a4 	. 
	and l			;8221	a5 	. 
	sub h			;8222	94 	. 
	sub c			;8223	91 	. 
	adc a,a			;8224	8f 	. 
	ld de,00000h		;8225	11 00 00 	. . . 
	nop			;8228	00 	. 
	nop			;8229	00 	. 
	nop			;822a	00 	. 
	dec b			;822b	05 	. 
	nop			;822c	00 	. 
	nop			;822d	00 	. 
	nop			;822e	00 	. 
	nop			;822f	00 	. 
	nop			;8230	00 	. 
	nop			;8231	00 	. 
	nop			;8232	00 	. 
	nop			;8233	00 	. 
	nop			;8234	00 	. 
	nop			;8235	00 	. 
	nop			;8236	00 	. 
	nop			;8237	00 	. 
	pop af			;8238	f1 	. 
	rlca			;8239	07 	. 
	ld h,a			;823a	67 	g 
	ld (hl),l			;823b	75 	u 
	sbc a,l			;823c	9d 	. 
	and c			;823d	a1 	. 
	ld a,(0bea7h)		;823e	3a a7 be 	: . . 
	and (hl)			;8241	a6 	. 
	sub l			;8242	95 	. 
	sub d			;8243	92 	. 
	ld bc,00012h		;8244	01 12 00 	. . . 
	nop			;8247	00 	. 
	nop			;8248	00 	. 
	nop			;8249	00 	. 
	ld a,(bc)			;824a	0a 	. 
	inc b			;824b	04 	. 
	ex af,af'			;824c	08 	. 
	dec bc			;824d	0b 	. 
	inc de			;824e	13 	. 
	nop			;824f	00 	. 
	nop			;8250	00 	. 
	nop			;8251	00 	. 
	nop			;8252	00 	. 
	nop			;8253	00 	. 
	nop			;8254	00 	. 
	nop			;8255	00 	. 
	nop			;8256	00 	. 
	nop			;8257	00 	. 
	dec b			;8258	05 	. 
	nop			;8259	00 	. 
	ld l,b			;825a	68 	h 
	ld (hl),h			;825b	74 	t 
	sbc a,(hl)			;825c	9e 	. 
	and b			;825d	a0 	. 
	dec sp			;825e	3b 	; 
	out (082h),a		;825f	d3 82 	. . 
	sbc a,b			;8261	98 	. 
	sub (hl)			;8262	96 	. 
	sub a			;8263	97 	. 
	sbc a,e			;8264	9b 	. 
	ld d,000h		;8265	16 00 	. . 
	nop			;8267	00 	. 
	dec c			;8268	0d 	. 
	inc c			;8269	0c 	. 
	add hl,bc			;826a	09 	. 
	ld bc,00302h		;826b	01 02 03 	. . . 
	add hl,sp			;826e	39 	9 
	inc de			;826f	13 	. 
	nop			;8270	00 	. 
	nop			;8271	00 	. 
	nop			;8272	00 	. 
	nop			;8273	00 	. 
	nop			;8274	00 	. 
	nop			;8275	00 	. 
	nop			;8276	00 	. 
	nop			;8277	00 	. 
	dec b			;8278	05 	. 
	nop			;8279	00 	. 
	ld h,(hl)			;827a	66 	f 
	ld (hl),e			;827b	73 	s 
	sbc a,a			;827c	9f 	. 
	ld (hl),b			;827d	70 	p 
	dec sp			;827e	3b 	; 
	jp nc,09971h		;827f	d2 71 99 	. q . 
	sbc a,d			;8282	9a 	. 
	ex de,hl			;8283	eb 	. 
	call nc,00012h		;8284	d4 12 00 	. . . 
	nop			;8287	00 	. 
	rla			;8288	17 	. 
	ld d,d			;8289	52 	R 
	ld d,l			;828a	55 	U 
	ld (hl),c			;828b	71 	q 
	ld h,c			;828c	61 	a 
	dec a			;828d	3d 	= 
	ld c,h			;828e	4c 	L 
	ld de,00000h		;828f	11 00 00 	. . . 
	nop			;8292	00 	. 
	nop			;8293	00 	. 
	nop			;8294	00 	. 
	nop			;8295	00 	. 
	ccf			;8296	3f 	? 
	ex af,af'			;8297	08 	. 
	inc b			;8298	04 	. 
	inc de			;8299	13 	. 
	ld h,(hl)			;829a	66 	f 
	ld (hl),d			;829b	72 	r 
	ld (hl),c			;829c	71 	q 
	ld (hl),b			;829d	70 	p 
	dec sp			;829e	3b 	; 
	ret pe			;829f	e8 	. 
	cp (hl)			;82a0	be 	. 
	or h			;82a1	b4 	. 
	ret nz			;82a2	c0 	. 
	cp (hl)			;82a3	be 	. 
	push de			;82a4	d5 	. 
	ld de,00000h		;82a5	11 00 00 	. . . 
	jr $+85		;82a8	18 53 	. S 
	dec de			;82aa	1b 	. 
	push af			;82ab	f5 	. 
	ld h,d			;82ac	62 	b 
	ld a,04dh		;82ad	3e 4d 	> M 
	ld de,00000h		;82af	11 00 00 	. . . 
	nop			;82b2	00 	. 
	nop			;82b3	00 	. 
	nop			;82b4	00 	. 
	nop			;82b5	00 	. 
	ld b,b			;82b6	40 	@ 
	ld b,(hl)			;82b7	46 	F 
	ld b,a			;82b8	47 	G 
	ld de,06d69h		;82b9	11 69 6d 	. i m 
	ld l,(hl)			;82bc	6e 	n 
	ld l,a			;82bd	6f 	o 
	dec sp			;82be	3b 	; 
	jp nc,09f55h		;82bf	d2 55 9f 	. U . 
	ld (hl),c			;82c2	71 	q 
	sbc a,a			;82c3	9f 	. 
	sub 012h		;82c4	d6 12 	. . 
	nop			;82c6	00 	. 
	nop			;82c7	00 	. 
	add hl,de			;82c8	19 	. 
	ld a,(de)			;82c9	1a 	. 
	ld d,(hl)			;82ca	56 	V 
	ld e,b			;82cb	58 	X 
	ld h,e			;82cc	63 	c 
	ld d,c			;82cd	51 	Q 
	ld c,(hl)			;82ce	4e 	N 
	ld de,00000h		;82cf	11 00 00 	. . . 
	nop			;82d2	00 	. 
	nop			;82d3	00 	. 
	nop			;82d4	00 	. 
	nop			;82d5	00 	. 
	ld b,b			;82d6	40 	@ 
	ld b,l			;82d7	45 	E 
	ld b,h			;82d8	44 	D 
	dec d			;82d9	15 	. 
	rrca			;82da	0f 	. 
	ld l,d			;82db	6a 	j 
	ld l,e			;82dc	6b 	k 
	ld l,h			;82dd	6c 	l 
	dec sp			;82de	3b 	; 
	ret pe			;82df	e8 	. 
	or h			;82e0	b4 	. 
	cp (hl)			;82e1	be 	. 
	ret nz			;82e2	c0 	. 
	or h			;82e3	b4 	. 
	pop de			;82e4	d1 	. 
	dec d			;82e5	15 	. 
	rrca			;82e6	0f 	. 
	ld c,014h		;82e7	0e 14 	. . 
	ld d,h			;82e9	54 	T 
	ld e,c			;82ea	59 	Y 
	ld e,d			;82eb	5a 	Z 
	ld d,b			;82ec	50 	P 
	ld d,b			;82ed	50 	P 
	ld c,a			;82ee	4f 	O 
	dec d			;82ef	15 	. 
	inc l			;82f0	2c 	, 
	nop			;82f1	00 	. 
	nop			;82f2	00 	. 
	nop			;82f3	00 	. 
	nop			;82f4	00 	. 
	nop			;82f5	00 	. 
	ld b,b			;82f6	40 	@ 
	ld b,d			;82f7	42 	B 
	ld b,e			;82f8	43 	C 
	ld bc,0da01h		;82f9	01 01 da 	. . . 
	exx			;82fc	d9 	. 
	ret c			;82fd	d8 	. 
	dec sp			;82fe	3b 	; 
	pop hl			;82ff	e1 	. 
	ld (hl),c			;8300	71 	q 
	sbc a,h			;8301	9c 	. 
	sbc a,a			;8302	9f 	. 
	ld d,l			;8303	55 	U 
	call po,00101h		;8304	e4 01 01 	. . . 
	ld bc,05701h		;8307	01 01 57 	. . W 
	ld e,e			;830a	5b 	[ 
	ld e,h			;830b	5c 	\ 
	ld c,h			;830c	4c 	L 
	ld bc,00101h		;830d	01 01 01 	. . . 
	jr c,$+46		;8310	38 2c 	8 , 
	nop			;8312	00 	. 
	nop			;8313	00 	. 
	nop			;8314	00 	. 
	rst 28h			;8315	ef 	. 
	ld b,c			;8316	41 	A 
	ld c,b			;8317	48 	H 
	ld bc,02101h		;8318	01 01 21 	. . ! 
	jp pe,0d7b4h		;831b	ea b4 d7 	. . . 
	dec sp			;831e	3b 	; 
	jp po,0dfe0h		;831f	e2 e0 df 	. . . 
	ret po			;8322	e0 	. 
	ex (sp),hl			;8323	e3 	. 
	push hl			;8324	e5 	. 
	ld bc,02a21h		;8325	01 21 2a 	. ! * 
	jr z,$+60		;8328	28 3a 	( : 
	ld e,l			;832a	5d 	] 
	ld e,(hl)			;832b	5e 	^ 
	ld e,a			;832c	5f 	_ 
	ld e,(hl)			;832d	5e 	^ 
	ld h,b			;832e	60 	` 
	inc hl			;832f	23 	# 
	ld e,02dh		;8330	1e 2d 	. - 
	nop			;8332	00 	. 
	nop			;8333	00 	. 
	nop			;8334	00 	. 
	ret p			;8335	f0 	. 
	ld bc,00101h		;8336	01 01 01 	. . . 
	ld bc,0da1ch		;8339	01 1c da 	. . . 
	exx			;833c	d9 	. 
	ret c			;833d	d8 	. 
	dec sp			;833e	3b 	; 
	jp po,0dfe7h		;833f	e2 e7 df 	. . . 
	ret po			;8342	e0 	. 
	rst 20h			;8343	e7 	. 
	and 001h		;8344	e6 01 	. . 
	inc e			;8346	1c 	. 
	ld bc,03b01h		;8347	01 01 3b 	. . ; 
	ld hl,0221dh		;834a	21 1d 22 	! . " 
	dec e			;834d	1d 	. 
	inc hl			;834e	23 	# 
	dec h			;834f	25 	% 
	ld bc,0002dh		;8350	01 2d 00 	. - . 
	nop			;8353	00 	. 
	nop			;8354	00 	. 
	ret p			;8355	f0 	. 
	ld bc,02a21h		;8356	01 21 2a 	. ! * 
	dec e			;8359	1d 	. 
	ld (0c0eah),hl		;835a	22 ea c0 	" . . 
	rst 10h			;835d	d7 	. 
	inc a			;835e	3c 	< 
	cp a			;835f	bf 	. 
	ret nz			;8360	c0 	. 
	pop bc			;8361	c1 	. 
	jp nz,0cac9h		;8362	c2 c9 ca 	. . . 
	ld hl,(02822h)		;8365	2a 22 28 	* " ( 
	ld bc,0293bh		;8368	01 3b 29 	. ; ) 
	ld bc,02101h		;836b	01 01 21 	. . ! 
	ld (02022h),hl		;836e	22 22 20 	" "   
	dec l			;8371	2d 	- 
	nop			;8372	00 	. 
	nop			;8373	00 	. 
	nop			;8374	00 	. 
	ret p			;8375	f0 	. 
	ld bc,0011ch		;8376	01 1c 01 	. . . 
	ld bc,0da01h		;8379	01 01 da 	. . . 
	exx			;837c	d9 	. 
	ret c			;837d	d8 	. 
	ld bc,0d9ddh		;837e	01 dd d9 	. . . 
	sbc a,03ah		;8381	de 3a 	. : 
	ret z			;8383	c8 	. 
	rlc c		;8384	cb 01 	. . 
	ld bc,00101h		;8386	01 01 01 	. . . 
	dec sp			;8389	3b 	; 
	daa			;838a	27 	' 
	inc hl			;838b	23 	# 
	jr z,$+30		;838c	28 1c 	( . 
	ld bc,01c01h		;838e	01 01 1c 	. . . 
	dec l			;8391	2d 	- 
	nop			;8392	00 	. 
	nop			;8393	00 	. 
	nop			;8394	00 	. 
	ret p			;8395	f0 	. 
	ld bc,01d24h		;8396	01 24 1d 	. $ . 
	jr nz,$+3		;8399	20 01 	  . 
	jp c,0dbd9h		;839b	da d9 db 	. . . 
	ld bc,0d9ddh		;839e	01 dd d9 	. . . 
	sbc a,03bh		;83a1	de 3b 	. ; 
	rst 0			;83a3	c7 	. 
	call z,01d2ah		;83a4	cc 2a 1d 	. * . 
	jr nz,$+3		;83a7	20 01 	  . 
	dec sp			;83a9	3b 	; 
	ld bc,01d1fh		;83aa	01 1f 1d 	. . . 
	ld e,001h		;83ad	1e 01 	. . 
	daa			;83af	27 	' 
	dec h			;83b0	25 	% 
	dec l			;83b1	2d 	- 
	nop			;83b2	00 	. 
	nop			;83b3	00 	. 
	nop			;83b4	00 	. 
	ret p			;83b5	f0 	. 
	ld bc,0011ch		;83b6	01 1c 01 	. . . 
	inc h			;83b9	24 	$ 
	ld hl,(0aba8h)		;83ba	2a a8 ab 	* . . 
	xor (hl)			;83bd	ae 	. 
	xor a			;83be	af 	. 
	jp (hl)			;83bf	e9 	. 
	cp l			;83c0	bd 	. 
	call c,0c63bh		;83c1	dc 3b c6 	. ; . 
	call 00101h		;83c4	cd 01 01 	. . . 
	inc e			;83c7	1c 	. 
	ld bc,0213bh		;83c8	01 3b 21 	. ; ! 
	dec e			;83cb	1d 	. 
	ld hl,(02a1dh)		;83cc	2a 1d 2a 	* . * 
	dec e			;83cf	1d 	. 
	ld e,02dh		;83d0	1e 2d 	. - 
	nop			;83d2	00 	. 
	nop			;83d3	00 	. 
	nop			;83d4	00 	. 
	ret p			;83d5	f0 	. 
	ld bc,02824h		;83d6	01 24 28 	. $ ( 
	inc e			;83d9	1c 	. 
	ld bc,0aca9h		;83da	01 a9 ac 	. . . 
	or b			;83dd	b0 	. 
	or e			;83de	b3 	. 
	or l			;83df	b5 	. 
	cp h			;83e0	bc 	. 
	cp d			;83e1	ba 	. 
	dec sp			;83e2	3b 	; 
	push bc			;83e3	c5 	. 
	adc a,001h		;83e4	ce 01 	. . 
	ld bc,0011ch		;83e6	01 1c 01 	. . . 
	dec sp			;83e9	3b 	; 
	inc e			;83ea	1c 	. 
	ld bc,00101h		;83eb	01 01 01 	. . . 
	ld hl,01d2ah		;83ee	21 2a 1d 	! * . 
	ld l,000h		;83f1	2e 00 	. . 
	nop			;83f3	00 	. 
	nop			;83f4	00 	. 
	ret p			;83f5	f0 	. 
	ld bc,0011ch		;83f6	01 1c 01 	. . . 
	inc h			;83f9	24 	$ 
	ld hl,(0adaah)		;83fa	2a aa ad 	* . . 
	or c			;83fd	b1 	. 
	or d			;83fe	b2 	. 
	or (hl)			;83ff	b6 	. 
	cp e			;8400	bb 	. 
	cp c			;8401	b9 	. 
	dec sp			;8402	3b 	; 
	call nz,001cfh		;8403	c4 cf 01 	. . . 
	ld bc,0011ch		;8406	01 1c 01 	. . . 
	dec sp			;8409	3b 	; 
	inc e			;840a	1c 	. 
	daa			;840b	27 	' 
	dec e			;840c	1d 	. 
	ld hl,(01d26h)		;840d	2a 26 1d 	* & . 
	ld hl,(0002eh)		;8410	2a 2e 00 	* . . 
	nop			;8413	00 	. 
	nop			;8414	00 	. 
	ret p			;8415	f0 	. 
	ld bc,0011ch		;8416	01 1c 01 	. . . 
	inc e			;8419	1c 	. 
	ld hl,02a1dh		;841a	21 1d 2a 	! . * 
	inc hl			;841d	23 	# 
	ld hl,(023b7h)		;841e	2a b7 23 	* . # 
	cp b			;8421	b8 	. 
	dec sp			;8422	3b 	; 
	jp 01dd0h		;8423	c3 d0 1d 	. . . 
	ld hl,(00125h)		;8426	2a 25 01 	* % . 
	dec sp			;8429	3b 	; 
	inc h			;842a	24 	$ 
	dec e			;842b	1d 	. 
	ld hl,(0221dh)		;842c	2a 1d 22 	* . " 
	dec e			;842f	1d 	. 
	ld hl,(0002eh)		;8430	2a 2e 00 	* . . 
	nop			;8433	00 	. 
	nop			;8434	00 	. 
	ret p			;8435	f0 	. 
	ld bc,0011ch		;8436	01 1c 01 	. . . 
	inc e			;8439	1c 	. 
	inc e			;843a	1c 	. 
	ld bc,01c01h		;843b	01 01 1c 	. . . 
	ld bc,01c01h		;843e	01 01 1c 	. . . 
	ld bc,0013bh		;8441	01 3b 01 	. ; . 
	inc e			;8444	1c 	. 
	ld bc,02521h		;8445	01 21 25 	. ! % 
	ld bc,0263ch		;8448	01 3c 26 	. < & 
	ld hl,(02a23h)		;844b	2a 23 2a 	* # * 
	jr nz,$+3		;844e	20 01 	  . 
	ld bc,0002dh		;8450	01 2d 00 	. - . 
	nop			;8453	00 	. 
	nop			;8454	00 	. 
	ret p			;8455	f0 	. 
	ld bc,02a24h		;8456	01 24 2a 	. $ * 
	ld e,01ch		;8459	1e 1c 	. . 
	ld bc,02621h		;845b	01 21 26 	. ! & 
	ld hl,(01e1dh)		;845e	2a 1d 1e 	* . . 
	ld bc,0013bh		;8461	01 3b 01 	. ; . 
	inc e			;8464	1c 	. 
	ld bc,01c1ch		;8465	01 1c 1c 	. . . 
	ld bc,01c01h		;8468	01 01 1c 	. . . 
	ld hl,0011eh		;846b	21 1e 01 	! . . 
	rra			;846e	1f 	. 
	dec e			;846f	1d 	. 
	jr nz,$+47		;8470	20 2d 	  - 
	nop			;8472	00 	. 
	nop			;8473	00 	. 
	nop			;8474	00 	. 
	ret p			;8475	f0 	. 
	ld bc,01d1fh		;8476	01 1f 1d 	. . . 
	jr nz,$+33		;8479	20 1f 	  . 
	ld hl,(01c1eh)		;847b	2a 1e 1c 	* . . 
	ld bc,02a27h		;847e	01 27 2a 	. ' * 
	jr nz,$+61		;8481	20 3b 	  ; 
	ld bc,02a1fh		;8483	01 1f 2a 	. . * 
	ld e,01fh		;8486	1e 1f 	. . 
	dec e			;8488	1d 	. 
	ld hl,(02226h)		;8489	2a 26 22 	* & " 
	dec e			;848c	1d 	. 
	ld hl,(0281dh)		;848d	2a 1d 28 	* . ( 
	inc e			;8490	1c 	. 
	dec l			;8491	2d 	- 
	nop			;8492	00 	. 
	nop			;8493	00 	. 
	nop			;8494	00 	. 
	ret p			;8495	f0 	. 
	ld bc,00101h		;8496	01 01 01 	. . . 
	rra			;8499	1f 	. 
	dec e			;849a	1d 	. 
	ld hl,(01f20h)		;849b	2a 20 1f 	*   . 
	dec e			;849e	1d 	. 
	ld hl,(0251dh)		;849f	2a 1d 25 	* . % 
	inc a			;84a2	3c 	< 
	ld c,d			;84a3	4a 	J 
	ld bc,00101h		;84a4	01 01 01 	. . . 
	ld bc,02a21h		;84a7	01 21 2a 	. ! * 
	ld h,02fh		;84aa	26 2f 	& / 
	jr nc,$+51		;84ac	30 31 	0 1 
	ld hl,(0251dh)		;84ae	2a 1d 25 	* . % 
	dec l			;84b1	2d 	- 
	nop			;84b2	00 	. 
	nop			;84b3	00 	. 
	nop			;84b4	00 	. 
	ret p			;84b5	f0 	. 
	ld bc,00101h		;84b6	01 01 01 	. . . 
	ld bc,00101h		;84b9	01 01 01 	. . . 
	rra			;84bc	1f 	. 
	dec e			;84bd	1d 	. 
	ld hl,(02a1dh)		;84be	2a 1d 2a 	* . * 
	ld e,001h		;84c1	1e 01 	. . 
	ld c,e			;84c3	4b 	K 
	ld bc,01d21h		;84c4	01 21 1d 	. ! . 
	ld hl,(00125h)		;84c7	2a 25 01 	* % . 
	inc e			;84ca	1c 	. 
	ld (03433h),a		;84cb	32 33 34 	2 3 4 
	inc hl			;84ce	23 	# 
	inc hl			;84cf	23 	# 
	ld e,02dh		;84d0	1e 2d 	. - 
	nop			;84d2	00 	. 
	defb 0edh;next byte illegal after ed		;84d3	ed 	. 
	xor 0ech		;84d4	ee ec 	. . 
	dec hl			;84d6	2b 	+ 
	di			;84d7	f3 	. 
	call p,0f32bh		;84d8	f4 2b f3 	. + . 
	dec hl			;84db	2b 	+ 
	call p,0f32bh		;84dc	f4 2b f3 	. + . 
	call p,02bf3h		;84df	f4 f3 2b 	. . + 
	call p,01d49h		;84e2	f4 49 1d 	. I . 
	ld (0231dh),hl		;84e5	22 1d 23 	" . # 
	ld (0251dh),hl		;84e8	22 1d 25 	" . % 
	dec (hl)			;84eb	35 	5 
	ld (hl),037h		;84ec	36 37 	6 7 
	dec h			;84ee	25 	% 
	rra			;84ef	1f 	. 
	dec e			;84f0	1d 	. 
	ld l,000h		;84f1	2e 00 	. . 
	ld bc,02101h		;84f3	01 01 21 	. . ! 
	ld hl,(0201dh)		;84f6	2a 1d 20 	* .   
	ld bc,00101h		;84f9	01 01 01 	. . . 
	ld bc,00101h		;84fc	01 01 01 	. . . 
	ld bc,00101h		;84ff	01 01 01 	. . . 
	ld bc,00101h		;8502	01 01 01 	. . . 
	ld bc,01c01h		;8505	01 01 1c 	. . . 
	ld bc,01c1dh		;8508	01 1d 1c 	. . . 
	daa			;850b	27 	' 
	dec e			;850c	1d 	. 
	ld hl,(0011eh)		;850d	2a 1e 01 	* . . 
	ld bc,01339h		;8510	01 39 13 	. 9 . 
	ld bc,01c01h		;8513	01 01 1c 	. . . 
	ld bc,01f01h		;8516	01 01 1f 	. . . 
	dec e			;8519	1d 	. 
	ld hl,(0231dh)		;851a	2a 1d 23 	* . # 
	ld hl,(02a1dh)		;851d	2a 1d 2a 	* . * 
	dec e			;8520	1d 	. 
	ld hl,(02a1dh)		;8521	2a 1d 2a 	* . * 
	dec e			;8524	1d 	. 
	inc hl			;8525	23 	# 
	dec e			;8526	1d 	. 
	ld e,027h		;8527	1e 27 	. ' 
	dec e			;8529	1d 	. 
	ld (01d2ah),hl		;852a	22 2a 1d 	" * . 
	jr z,$+3		;852d	28 01 	( . 
	ld hl,01d2ah		;852f	21 2a 1d 	! * . 
	jp p,021eeh		;8532	f2 ee 21 	. . ! 
	dec h			;8535	25 	% 
	ld bc,00101h		;8536	01 01 01 	. . . 
	ld bc,02101h		;8539	01 01 21 	. . ! 
	ld (01d2ah),hl		;853c	22 2a 1d 	" * . 
	ld hl,(02a1dh)		;853f	2a 1d 2a 	* . * 
	jr nz,$+3		;8542	20 01 	  . 
	ld bc,02a1fh		;8544	01 1f 2a 	. . * 
	dec e			;8547	1d 	. 
	ld hl,(02a1dh)		;8548	2a 1d 2a 	* . * 
	dec e			;854b	1d 	. 
	inc hl			;854c	23 	# 
	dec e			;854d	1d 	. 
	ld hl,(00125h)		;854e	2a 25 01 	* % . 
	ld bc,0011ch		;8551	01 1c 01 	. . . 
	add hl,hl			;8554	29 	) 
	rra			;8555	1f 	. 
	dec e			;8556	1d 	. 
	ld hl,(02a1dh)		;8557	2a 1d 2a 	* . * 
	dec e			;855a	1d 	. 
	ld e,001h		;855b	1e 01 	. . 
	ld bc,00101h		;855d	01 01 01 	. . . 
	ld bc,01f01h		;8560	01 01 1f 	. . . 
	dec e			;8563	1d 	. 
	ld hl,(02a1dh)		;8564	2a 1d 2a 	* . * 
	dec e			;8567	1d 	. 
	ld hl,(02a1dh)		;8568	2a 1d 2a 	* . * 
	dec e			;856b	1d 	. 
	ld e,001h		;856c	1e 01 	. . 
	ld bc,02a1fh		;856e	01 1f 2a 	. . * 
	dec e			;8571	1d 	. 
	ld e,000h		;8572	1e 00 	. . 
	di			;8574	f3 	. 
	ld sp,0e8e8h		;8575	31 e8 e8 	1 . . 
	xor a			;8578	af 	. 
	out (0feh),a		;8579	d3 fe 	. . 
	inc a			;857b	3c 	< 
	ld (05c09h),a		;857c	32 09 5c 	2 . \ 
	ld (05c0ah),a		;857f	32 0a 5c 	2 . \ 
	inc a			;8582	3c 	< 
	call 01601h		;8583	cd 01 16 	. . . 
	ld de,08d57h		;8586	11 57 8d 	. W . 
	ld bc,002d3h		;8589	01 d3 02 	. . . 
	call 0203ch		;858c	cd 3c 20 	. <   
	ex de,hl			;858f	eb 	. 
	ld de,050c0h		;8590	11 c0 50 	. . P 
	ld c,040h		;8593	0e 40 	. @ 
	call 0d06dh		;8595	cd 6d d0 	. m . 
	ld hl,05ac0h		;8598	21 c0 5a 	! . Z 
	ld b,020h		;859b	06 20 	.   
	ld a,007h		;859d	3e 07 	> . 
	call 08648h		;859f	cd 48 86 	. H . 
	ld b,020h		;85a2	06 20 	.   
	call 08648h		;85a4	cd 48 86 	. H . 
	ld a,071h		;85a7	3e 71 	> q 
	ld (05a9fh),a		;85a9	32 9f 5a 	2 . Z 
	call 0fb10h		;85ac	cd 10 fb 	. . . 
	jr nc,$-3		;85af	30 fb 	0 . 
	ld a,011h		;85b1	3e 11 	> . 
	ld (0fcc6h),a		;85b3	32 c6 fc 	2 . . 
	ld a,001h		;85b6	3e 01 	> . 
	ld (0fd75h),a		;85b8	32 75 fd 	2 u . 
	ld hl,0ee08h		;85bb	21 08 ee 	! . . 
	ld (0d077h),hl		;85be	22 77 d0 	" w . 
	ld hl,0f900h		;85c1	21 00 f9 	! . . 
	ld b,008h		;85c4	06 08 	. . 
	rrc l		;85c6	cb 0d 	. . 
	rla			;85c8	17 	. 
	djnz $-3		;85c9	10 fb 	. . 
	ld (hl),a			;85cb	77 	w 
	inc l			;85cc	2c 	, 
	jr nz,$-9		;85cd	20 f5 	  . 
	inc h			;85cf	24 	$ 
	ld a,l			;85d0	7d 	} 
	add a,a			;85d1	87 	. 
	or l			;85d2	b5 	. 
	ld b,a			;85d3	47 	G 
	rra			;85d4	1f 	. 
	or b			;85d5	b0 	. 
	cpl			;85d6	2f 	/ 
	ld (hl),a			;85d7	77 	w 
	inc l			;85d8	2c 	, 
	jr nz,$-9		;85d9	20 f5 	  . 
	ld h,05eh		;85db	26 5e 	& ^ 
	ld e,l			;85dd	5d 	] 
	ex de,hl			;85de	eb 	. 
	ld h,000h		;85df	26 00 	& . 
	ld b,h			;85e1	44 	D 
	ld c,l			;85e2	4d 	M 
	add hl,hl			;85e3	29 	) 
	add hl,hl			;85e4	29 	) 
	add hl,hl			;85e5	29 	) 
	add hl,bc			;85e6	09 	. 
	ld bc,0aa78h		;85e7	01 78 aa 	. x . 
	add hl,bc			;85ea	09 	. 
	ex de,hl			;85eb	eb 	. 
	ld (hl),e			;85ec	73 	s 
	inc h			;85ed	24 	$ 
	ld (hl),d			;85ee	72 	r 
	dec h			;85ef	25 	% 
	inc l			;85f0	2c 	, 
	jr nz,$-20		;85f1	20 ea 	  . 
	ld h,060h		;85f3	26 60 	& ` 
	ld bc,0e8e8h		;85f5	01 e8 e8 	. . . 
	ld e,l			;85f8	5d 	] 
	ex de,hl			;85f9	eb 	. 
	ld h,000h		;85fa	26 00 	& . 
	add hl,hl			;85fc	29 	) 
	add hl,hl			;85fd	29 	) 
	add hl,hl			;85fe	29 	) 
	add hl,bc			;85ff	09 	. 
	ex de,hl			;8600	eb 	. 
	ld (hl),e			;8601	73 	s 
	inc h			;8602	24 	$ 
	ld (hl),d			;8603	72 	r 
	dec h			;8604	25 	% 
	inc l			;8605	2c 	, 
	jr nz,$-14		;8606	20 f0 	  . 
	ld a,r		;8608	ed 5f 	. _ 
	and 007h		;860a	e6 07 	. . 
	jr z,$+18		;860c	28 10 	( . 
	ld hl,0855fh		;860e	21 5f 85 	! _ . 
	inc h			;8611	24 	$ 
	dec hl			;8612	2b 	+ 
	dec a			;8613	3d 	= 
	jr nz,$-3		;8614	20 fb 	  . 
	ld de,06508h		;8616	11 08 65 	. . e 
	ld bc,000ffh		;8619	01 ff 00 	. . . 
	ldir		;861c	ed b0 	. . 
	ld hl,0f0e8h		;861e	21 e8 f0 	! . . 
	ld c,0e2h		;8621	0e e2 	. . 
	call 0864fh		;8623	cd 4f 86 	. O . 
	ld hl,0e8e8h		;8626	21 e8 e8 	! . . 
	ld c,0c4h		;8629	0e c4 	. . 
	call 0864fh		;862b	cd 4f 86 	. O . 
	ld hl,0906ah		;862e	21 6a 90 	! j . 
	ld de,05c70h		;8631	11 70 5c 	. p \ 
	ld bc,00190h		;8634	01 90 01 	. . . 
	ldir		;8637	ed b0 	. . 
	ld hl,091f4h		;8639	21 f4 91 	! . . 
	ld de,05b00h		;863c	11 00 5b 	. . [ 
	inc b			;863f	04 	. 
	ldir		;8640	ed b0 	. . 
	call 0dd45h		;8642	cd 45 dd 	. E . 
	jp 092f4h		;8645	c3 f4 92 	. . . 
	ld (hl),a			;8648	77 	w 
	inc hl			;8649	23 	# 
	djnz $-2		;864a	10 fc 	. . 
	xor 009h		;864c	ee 09 	. . 
	ret			;864e	c9 	. 
	ld d,0f9h		;864f	16 f9 	. . 
	ld b,004h		;8651	06 04 	. . 
	ld e,(hl)			;8653	5e 	^ 
	ld a,(de)			;8654	1a 	. 
	ld (hl),a			;8655	77 	w 
	inc l			;8656	2c 	, 
	inc hl			;8657	23 	# 
	djnz $-5		;8658	10 f9 	. . 
	dec c			;865a	0d 	. 
	jr nz,$-10		;865b	20 f4 	  . 
	ret			;865d	c9 	. 
	jr nc,$+50		;865e	30 30 	0 0 
	jr nc,$+52		;8660	30 32 	0 2 
	jr nc,$+50		;8662	30 30 	0 0 
	jr nz,$+55		;8664	20 35 	  5 
	jr nz,$+67		;8666	20 41 	  A 
	ld c,h			;8668	4c 	L 
	ld c,c			;8669	49 	I 
	ld d,(hl)			;866a	56 	V 
	ld b,l			;866b	45 	E 
	jr nz,$+34		;866c	20 20 	    
	jr nz,$+50		;866e	20 30 	  0 
	jr nc,$+50		;8670	30 30 	0 0 
	ld sp,03034h		;8672	31 34 30 	1 4 0 
	ld c,e			;8675	4b 	K 
	ld b,c			;8676	41 	A 
	ld d,h			;8677	54 	T 
	ld c,a			;8678	4f 	O 
	jr nz,$+34		;8679	20 20 	    
	jr nz,$+34		;867b	20 20 	    
	jr nz,$+34		;867d	20 20 	    
	jr nz,$+50		;867f	20 30 	  0 
	jr nc,$+50		;8681	30 30 	0 0 
	ld sp,03033h		;8683	31 33 30 	1 3 0 
	ld b,h			;8686	44 	D 
	ld c,a			;8687	4f 	O 
	ld d,l			;8688	55 	U 
	ld b,a			;8689	47 	G 
	ld b,c			;868a	41 	A 
	ld c,h			;868b	4c 	L 
	jr nz,$+34		;868c	20 20 	    
	jr nz,$+34		;868e	20 20 	    
	jr nz,$+50		;8690	20 30 	  0 
	jr nc,$+50		;8692	30 30 	0 0 
	ld sp,03032h		;8694	31 32 30 	1 2 0 
	ld b,l			;8697	45 	E 
	ld c,l			;8698	4d 	M 
	ld d,b			;8699	50 	P 
	ld b,l			;869a	45 	E 
	ld d,d			;869b	52 	R 
	ld c,a			;869c	4f 	O 
	ld d,d			;869d	52 	R 
	jr nz,$+34		;869e	20 20 	    
	jr nz,$+34		;86a0	20 20 	    
	jr nc,$+50		;86a2	30 30 	0 0 
	jr nc,$+51		;86a4	30 31 	0 1 
	ld sp,04430h		;86a6	31 30 44 	1 0 D 
	ld e,c			;86a9	59 	Y 
	ld c,(hl)			;86aa	4e 	N 
	ld b,c			;86ab	41 	A 
	ld c,l			;86ac	4d 	M 
	ld c,a			;86ad	4f 	O 
	jr nz,$+34		;86ae	20 20 	    
	jr nz,$+34		;86b0	20 20 	    
	jr nz,$+50		;86b2	20 30 	  0 
	jr nc,$+50		;86b4	30 30 	0 0 
	ld sp,03030h		;86b6	31 30 30 	1 0 0 
	ld d,a			;86b9	57 	W 
	ld c,b			;86ba	48 	H 
	ld c,c			;86bb	49 	I 
	ld e,d			;86bc	5a 	Z 
	jr nz,$+34		;86bd	20 20 	    
	jr nz,$+34		;86bf	20 20 	    
	jr nz,$+34		;86c1	20 20 	    
	jr nz,$+50		;86c3	20 30 	  0 
	jr nc,$+50		;86c5	30 30 	0 0 
	jr nc,$+59		;86c7	30 39 	0 9 
	jr nc,$+73		;86c9	30 47 	0 G 
	ld b,c			;86cb	41 	A 
	ld b,(hl)			;86cc	46 	F 
	ld b,(hl)			;86cd	46 	F 
	jr nz,$+70		;86ce	20 44 	  D 
	ld c,a			;86d0	4f 	O 
	ld d,e			;86d1	53 	S 
	ld d,e			;86d2	53 	S 
	ld b,l			;86d3	45 	E 
	ld d,d			;86d4	52 	R 
	jr nc,$+50		;86d5	30 30 	0 0 
	jr nc,$+50		;86d7	30 30 	0 0 
	jr c,$+50		;86d9	38 30 	8 0 
	ld d,h			;86db	54 	T 
	ld c,a			;86dc	4f 	O 
	ld e,d			;86dd	5a 	Z 
	ld e,d			;86de	5a 	Z 
	ld e,c			;86df	59 	Y 
	jr nz,$+34		;86e0	20 20 	    
	jr nz,$+34		;86e2	20 20 	    
	jr nz,$+34		;86e4	20 20 	    
	jr nc,$+50		;86e6	30 30 	0 0 
	jr nc,$+50		;86e8	30 30 	0 0 
	scf			;86ea	37 	7 
	jr nc,$+85		;86eb	30 53 	0 S 
	ld d,b			;86ed	50 	P 
	ld c,c			;86ee	49 	I 
	ld b,h			;86ef	44 	D 
	ld b,l			;86f0	45 	E 
	ld d,d			;86f1	52 	R 
	jr nz,$+34		;86f2	20 20 	    
	jr nz,$+34		;86f4	20 20 	    
	jr nz,$+50		;86f6	20 30 	  0 
	jr nc,$+50		;86f8	30 30 	0 0 
	jr nc,$+56		;86fa	30 36 	0 6 
	jr nc,$+69		;86fc	30 43 	0 C 
	ld d,d			;86fe	52 	R 
	ld b,c			;86ff	41 	A 
	ld e,d			;8700	5a 	Z 
	ld e,c			;8701	59 	Y 
	jr nz,$+76		;8702	20 4a 	  J 
	jr nz,$+34		;8704	20 20 	    
	jr nz,$+34		;8706	20 20 	    
	jr nc,$+50		;8708	30 30 	0 0 
	jr nc,$+50		;870a	30 30 	0 0 
	dec (hl)			;870c	35 	5 
	jr nc,$+70		;870d	30 44 	0 D 
	ld c,c			;870f	49 	I 
	ld b,h			;8710	44 	D 
	ld b,h			;8711	44 	D 
	ld e,c			;8712	59 	Y 
	jr nz,$+91		;8713	20 59 	  Y 
	ld b,l			;8715	45 	E 
	ld c,h			;8716	4c 	L 
	ld c,h			;8717	4c 	L 
	ld b,c			;8718	41 	A 
	jr nc,$+50		;8719	30 30 	0 0 
	jr nc,$+50		;871b	30 30 	0 0 
	inc (hl)			;871d	34 	4 
	jr nc,$+69		;871e	30 43 	0 C 
	ld d,l			;8720	55 	U 
	ld d,e			;8721	53 	S 
	ld d,h			;8722	54 	T 
	ld b,c			;8723	41 	A 
	ld d,d			;8724	52 	R 
	ld b,h			;8725	44 	D 
	jr nz,$+34		;8726	20 20 	    
	jr nz,$+34		;8728	20 20 	    
	jr nc,$+50		;872a	30 30 	0 0 
	jr nc,$+50		;872c	30 30 	0 0 
	inc sp			;872e	33 	3 
	jr nc,$+68		;872f	30 42 	0 B 
	ld c,a			;8731	4f 	O 
	ld b,h			;8732	44 	D 
	ld c,e			;8733	4b 	K 
	ld c,c			;8734	49 	I 
	ld c,(hl)			;8735	4e 	N 
	ld d,e			;8736	53 	S 
	jr nz,$+34		;8737	20 20 	    
	jr nz,$+34		;8739	20 20 	    
	jr nc,$+50		;873b	30 30 	0 0 
	jr nc,$+50		;873d	30 30 	0 0 
	ld (04b30h),a		;873f	32 30 4b 	2 0 K 
	ld c,c			;8742	49 	I 
	ld b,l			;8743	45 	E 
	ld d,d			;8744	52 	R 
	jr nz,$+34		;8745	20 20 	    
	jr nz,$+34		;8747	20 20 	    
	jr nz,$+34		;8749	20 20 	    
	jr nz,$+50		;874b	20 30 	  0 
	jr nc,$+50		;874d	30 30 	0 0 
	jr nc,$+51		;874f	30 31 	0 1 
	jr nc,$+85		;8751	30 53 	0 S 
	ld c,b			;8753	48 	H 
	ld b,c			;8754	41 	A 
	ld b,h			;8755	44 	D 
	ld c,a			;8756	4f 	O 
	ld d,a			;8757	57 	W 
	jr nz,$+34		;8758	20 20 	    
	jr nz,$+34		;875a	20 20 	    
	jr nz,$+50		;875c	20 30 	  0 
	jr nc,$+51		;875e	30 31 	0 1 
	ld sp,03035h		;8760	31 35 30 	1 5 0 
	jr nz,$+86		;8763	20 54 	  T 
	ld c,b			;8765	48 	H 
	ld b,l			;8766	45 	E 
	jr nz,$+69		;8767	20 43 	  C 
	ld b,c			;8769	41 	A 
	ld d,h			;876a	54 	T 
	jr nz,$+34		;876b	20 20 	    
	jr nz,$+50		;876d	20 30 	  0 
	jr nc,$+50		;876f	30 30 	0 0 
	ld sp,03034h		;8771	31 34 30 	1 4 0 
	ld b,c			;8774	41 	A 
	jr nz,$+68		;8775	20 42 	  B 
	ld b,c			;8777	41 	A 
	ld c,e			;8778	4b 	K 
	ld b,l			;8779	45 	E 
	ld d,d			;877a	52 	R 
	jr nz,$+34		;877b	20 20 	    
	jr nz,$+34		;877d	20 20 	    
	jr nc,$+50		;877f	30 30 	0 0 
	jr nc,$+51		;8781	30 31 	0 1 
	inc sp			;8783	33 	3 
	jr nc,$+79		;8784	30 4d 	0 M 
	ld b,l			;8786	45 	E 
	ld c,h			;8787	4c 	L 
	ld c,h			;8788	4c 	L 
	ld b,l			;8789	45 	E 
	jr nz,$+79		;878a	20 4d 	  M 
	ld b,l			;878c	45 	E 
	ld c,h			;878d	4c 	L 
	ld c,h			;878e	4c 	L 
	jr nz,$+50		;878f	20 30 	  0 
	jr nc,$+50		;8791	30 30 	0 0 
	ld sp,03032h		;8793	31 32 30 	1 2 0 
	ld b,a			;8796	47 	G 
	ld c,l			;8797	4d 	M 
	jr nz,$+72		;8798	20 46 	  F 
	ld c,h			;879a	4c 	L 
	ld b,c			;879b	41 	A 
	ld d,e			;879c	53 	S 
	ld c,b			;879d	48 	H 
	jr nz,$+34		;879e	20 20 	    
	jr nz,$+50		;87a0	20 30 	  0 
	jr nc,$+50		;87a2	30 30 	0 0 
	ld sp,03031h		;87a4	31 31 30 	1 1 0 
	ld d,d			;87a7	52 	R 
	ld c,a			;87a8	4f 	O 
	ld e,b			;87a9	58 	X 
	ld b,c			;87aa	41 	A 
	ld c,(hl)			;87ab	4e 	N 
	ld c,(hl)			;87ac	4e 	N 
	ld b,l			;87ad	45 	E 
	jr nz,$+34		;87ae	20 20 	    
	jr nz,$+34		;87b0	20 20 	    
	jr nc,$+50		;87b2	30 30 	0 0 
	jr nc,$+51		;87b4	30 31 	0 1 
	jr nc,$+50		;87b6	30 30 	0 0 
	ld d,h			;87b8	54 	T 
	ld c,a			;87b9	4f 	O 
	ld c,l			;87ba	4d 	M 
	ld c,l			;87bb	4d 	M 
	ld e,c			;87bc	59 	Y 
	jr nz,$+68		;87bd	20 42 	  B 
	ld c,a			;87bf	4f 	O 
	ld e,c			;87c0	59 	Y 
	jr nz,$+34		;87c1	20 20 	    
	jr nc,$+50		;87c3	30 30 	0 0 
	jr nc,$+50		;87c5	30 30 	0 0 
	add hl,sp			;87c7	39 	9 
	jr nc,$+84		;87c8	30 52 	0 R 
	ld d,l			;87ca	55 	U 
	ld c,(hl)			;87cb	4e 	N 
	jr nz,$+70		;87cc	20 44 	  D 
	ld c,l			;87ce	4d 	M 
	ld b,e			;87cf	43 	C 
	jr nz,$+34		;87d0	20 20 	    
	jr nz,$+34		;87d2	20 20 	    
	jr nc,$+50		;87d4	30 30 	0 0 
	jr nc,$+50		;87d6	30 30 	0 0 
	jr c,$+50		;87d8	38 30 	8 0 
	ld b,e			;87da	43 	C 
	ld b,c			;87db	41 	A 
	ld d,b			;87dc	50 	P 
	ld d,h			;87dd	54 	T 
	jr nz,$+34		;87de	20 20 	    
	ld d,d			;87e0	52 	R 
	ld c,a			;87e1	4f 	O 
	ld b,e			;87e2	43 	C 
	ld c,e			;87e3	4b 	K 
	jr nz,$+50		;87e4	20 30 	  0 
	jr nc,$+50		;87e6	30 30 	0 0 
	jr nc,$+57		;87e8	30 37 	0 7 
	jr nc,$+74		;87ea	30 48 	0 H 
	jr nz,$+74		;87ec	20 48 	  H 
	ld b,c			;87ee	41 	A 
	ld c,(hl)			;87ef	4e 	N 
	ld b,e			;87f0	43 	C 
	ld c,a			;87f1	4f 	O 
	ld b,e			;87f2	43 	C 
	ld c,e			;87f3	4b 	K 
	jr nz,$+34		;87f4	20 20 	    
	jr nc,$+50		;87f6	30 30 	0 0 
	jr nc,$+50		;87f8	30 30 	0 0 
	ld (hl),030h		;87fa	36 30 	6 0 
	ld c,l			;87fc	4d 	M 
	ld b,c			;87fd	41 	A 
	ld c,(hl)			;87fe	4e 	N 
	ld d,h			;87ff	54 	T 
	ld d,d			;8800	52 	R 
	ld c,a			;8801	4f 	O 
	ld c,(hl)			;8802	4e 	N 
	ld c,c			;8803	49 	I 
	ld e,b			;8804	58 	X 
	jr nz,$+34		;8805	20 20 	    
	jr nc,$+50		;8807	30 30 	0 0 
	jr nc,$+50		;8809	30 30 	0 0 
	dec (hl)			;880b	35 	5 
	jr nc,$+73		;880c	30 47 	0 G 
	jr nz,$+77		;880e	20 4b 	  K 
	ld d,d			;8810	52 	R 
	ld b,c			;8811	41 	A 
	ld c,(hl)			;8812	4e 	N 
	ld e,d			;8813	5a 	Z 
	jr nz,$+34		;8814	20 20 	    
	jr nz,$+34		;8816	20 20 	    
	jr nc,$+50		;8818	30 30 	0 0 
	jr nc,$+50		;881a	30 30 	0 0 
	inc (hl)			;881c	34 	4 
	jr nc,$+74		;881d	30 48 	0 H 
	ld b,c			;881f	41 	A 
	ld d,e			;8820	53 	S 
	ld c,b			;8821	48 	H 
	ld c,c			;8822	49 	I 
	ld c,l			;8823	4d 	M 
	jr nz,$+34		;8824	20 20 	    
	jr nz,$+34		;8826	20 20 	    
	jr nz,$+50		;8828	20 30 	  0 
	jr nc,$+50		;882a	30 30 	0 0 
	jr nc,$+53		;882c	30 33 	0 3 
	jr nc,$+76		;882e	30 4a 	0 J 
	ld b,c			;8830	41 	A 
	ld e,d			;8831	5a 	Z 
	ld e,d			;8832	5a 	Z 
	ld e,c			;8833	59 	Y 
	jr nz,$+76		;8834	20 4a 	  J 
	ld b,c			;8836	41 	A 
	ld e,c			;8837	59 	Y 
	jr nz,$+34		;8838	20 20 	    
	jr nc,$+50		;883a	30 30 	0 0 
	jr nc,$+50		;883c	30 30 	0 0 
	ld (05730h),a		;883e	32 30 57 	2 0 W 
	ld d,d			;8841	52 	R 
	ld b,l			;8842	45 	E 
	ld b,e			;8843	43 	C 
	ld c,e			;8844	4b 	K 
	ld c,c			;8845	49 	I 
	ld c,(hl)			;8846	4e 	N 
	jr nz,$+69		;8847	20 43 	  C 
	ld d,d			;8849	52 	R 
	ld d,l			;884a	55 	U 
	jr nc,$+50		;884b	30 30 	0 0 
	jr nc,$+50		;884d	30 30 	0 0 
	ld sp,05330h		;884f	31 30 53 	1 0 S 
	ld c,b			;8852	48 	H 
	ld b,c			;8853	41 	A 
	ld c,(hl)			;8854	4e 	N 
	ld c,(hl)			;8855	4e 	N 
	ld c,a			;8856	4f 	O 
	ld c,(hl)			;8857	4e 	N 
	jr nz,$+34		;8858	20 20 	    
	jr nz,$+34		;885a	20 20 	    
	jr nc,$+50		;885c	30 30 	0 0 
	jr nc,$+51		;885e	30 31 	0 1 
	dec (hl)			;8860	35 	5 
	jr nc,$+68		;8861	30 42 	0 B 
	ld b,e			;8863	43 	C 
	jr nc,$+58		;8864	30 38 	0 8 
	ld (03733h),a		;8866	32 33 37 	2 3 7 
	scf			;8869	37 	7 
	inc sp			;886a	33 	3 
	dec (hl)			;886b	35 	5 
	ld sp,03030h		;886c	31 30 30 	1 0 0 
	jr nc,$+51		;886f	30 31 	0 1 
	inc (hl)			;8871	34 	4 
	jr nc,$+57		;8872	30 37 	0 7 
	jr nz,$+58		;8874	20 38 	  8 
	jr nc,$+51		;8876	30 31 	0 1 
	dec (hl)			;8878	35 	5 
	inc (hl)			;8879	34 	4 
	jr nz,$+52		;887a	20 32 	  2 
	jr nz,$+34		;887c	20 20 	    
	jr nc,$+50		;887e	30 30 	0 0 
	jr nc,$+51		;8880	30 31 	0 1 
	inc sp			;8882	33 	3 
	jr nc,$+58		;8883	30 38 	0 8 
	ld (02033h),a		;8885	32 33 20 	2 3   
	ld (hl),039h		;8888	36 39 	6 9 
	ld (hl),020h		;888a	36 20 	6   
	ld (02020h),a		;888c	32 20 20 	2     
	jr nc,$+50		;888f	30 30 	0 0 
	jr nc,$+51		;8891	30 31 	0 1 
	ld (04330h),a		;8893	32 30 43 	2 0 C 
	ld b,h			;8896	44 	D 
	ld c,l			;8897	4d 	M 
	ld c,e			;8898	4b 	K 
	jr nz,$+57		;8899	20 37 	  7 
	ld sp,03720h		;889b	31 20 37 	1   7 
	ld (03020h),a		;889e	32 20 30 	2   0 
	jr nc,$+50		;88a1	30 30 	0 0 
	ld sp,03031h		;88a3	31 31 30 	1 1 0 
	ld b,e			;88a6	43 	C 
	ld b,h			;88a7	44 	D 
	ld d,b			;88a8	50 	P 
	jr nz,$+57		;88a9	20 37 	  7 
	inc (hl)			;88ab	34 	4 
	ld (hl),030h		;88ac	36 30 	6 0 
	inc (hl)			;88ae	34 	4 
	ld (03032h),a		;88af	32 32 30 	2 2 0 
	jr nc,$+50		;88b2	30 30 	0 0 
	ld sp,03030h		;88b4	31 30 30 	1 0 0 
	ld b,e			;88b7	43 	C 
	ld b,h			;88b8	44 	D 
	jr nz,$+79		;88b9	20 4d 	  M 
	ld d,l			;88bb	55 	U 
	ld d,h			;88bc	54 	T 
	ld b,l			;88bd	45 	E 
	ld c,h			;88be	4c 	L 
	jr nz,$+51		;88bf	20 31 	  1 
	jr nz,$+50		;88c1	20 30 	  0 
	jr nc,$+50		;88c3	30 30 	0 0 
	jr nc,$+59		;88c5	30 39 	0 9 
	jr nc,$+69		;88c7	30 43 	0 C 
	ld b,h			;88c9	44 	D 
	ld b,l			;88ca	45 	E 
	ld d,b			;88cb	50 	P 
	ld b,e			;88cc	43 	C 
	jr nz,$+52		;88cd	20 32 	  2 
	ld (hl),034h		;88cf	36 34 	6 4 
	ld (03030h),a		;88d1	32 30 30 	2 0 0 
	jr nc,$+50		;88d4	30 30 	0 0 
	jr nc,$+58		;88d6	30 38 	0 8 
	jr nc,$+58		;88d8	30 38 	0 8 
	ld (02035h),a		;88da	32 35 20 	2 5   
	inc sp			;88dd	33 	3 
	dec (hl)			;88de	35 	5 
	inc (hl)			;88df	34 	4 
	jr nz,$+52		;88e0	20 32 	  2 
	jr nz,$+34		;88e2	20 20 	    
	jr nc,$+50		;88e4	30 30 	0 0 
	jr nc,$+50		;88e6	30 30 	0 0 
	scf			;88e8	37 	7 
	jr nc,$+69		;88e9	30 43 	0 C 
	ld b,h			;88eb	44 	D 
	ld d,b			;88ec	50 	P 
	scf			;88ed	37 	7 
	inc (hl)			;88ee	34 	4 
	ld (hl),030h		;88ef	36 30 	6 0 
	jr nc,$+52		;88f1	30 32 	0 2 
	jr nz,$+52		;88f3	20 32 	  2 
	jr nc,$+50		;88f5	30 30 	0 0 
	jr nc,$+50		;88f7	30 30 	0 0 
	ld (hl),030h		;88f9	36 30 	6 0 
	jr c,$+52		;88fb	38 32 	8 2 
	scf			;88fd	37 	7 
	ld (03133h),a		;88fe	32 33 31 	2 3 1 
	jr nz,$+52		;8901	20 32 	  2 
	ld sp,02030h		;8903	31 30 20 	1 0   
	jr nc,$+50		;8906	30 30 	0 0 
	jr nc,$+50		;8908	30 30 	0 0 
	dec (hl)			;890a	35 	5 
	jr nc,$+69		;890b	30 43 	0 C 
	ld b,h			;890d	44 	D 
	ld d,b			;890e	50 	P 
	jr nz,$+57		;890f	20 37 	  7 
	inc (hl)			;8911	34 	4 
	ld (hl),033h		;8912	36 33 	6 3 
	inc (hl)			;8914	34 	4 
	ld (03032h),a		;8915	32 32 30 	2 2 0 
	jr nc,$+50		;8918	30 30 	0 0 
	jr nc,$+54		;891a	30 34 	0 4 
	jr nc,$+69		;891c	30 43 	0 C 
	ld b,h			;891e	44 	D 
	ld b,e			;891f	43 	C 
	ld b,d			;8920	42 	B 
	ld d,e			;8921	53 	S 
	jr nz,$+57		;8922	20 37 	  7 
	jr nc,$+52		;8924	30 32 	0 2 
	inc (hl)			;8926	34 	4 
	ld (hl),030h		;8927	36 30 	6 0 
	jr nc,$+50		;8929	30 30 	0 0 
	jr nc,$+53		;892b	30 33 	0 3 
	jr nc,$+81		;892d	30 4f 	0 O 
	ld d,e			;892f	53 	S 
	ld d,(hl)			;8930	56 	V 
	ld b,e			;8931	43 	C 
	ld b,h			;8932	44 	D 
	jr nz,$+52		;8933	20 32 	  2 
	ld sp,03536h		;8935	31 36 35 	1 6 5 
	inc sp			;8938	33 	3 
	jr nc,$+50		;8939	30 30 	0 0 
	jr nc,$+50		;893b	30 30 	0 0 
	ld (03630h),a		;893d	32 30 36 	2 0 6 
	ld sp,02030h		;8940	31 30 20 	1 0   
	inc sp			;8943	33 	3 
	add hl,sp			;8944	39 	9 
	jr nc,$+34		;8945	30 20 	0   
	ld (03232h),a		;8947	32 32 32 	2 2 2 
	jr nc,$+50		;894a	30 30 	0 0 
	jr nc,$+50		;894c	30 30 	0 0 
	ld sp,04330h		;894e	31 30 43 	1 0 C 
	ld b,h			;8951	44 	D 
	ld b,l			;8952	45 	E 
	ld d,b			;8953	50 	P 
	ld b,e			;8954	43 	C 
	jr nz,$+58		;8955	20 38 	  8 
	dec (hl)			;8957	35 	5 
	add hl,sp			;8958	39 	9 
	inc sp			;8959	33 	3 
	jr nc,$+50		;895a	30 30 	0 0 
	jr nc,$+50		;895c	30 30 	0 0 
	ld sp,03035h		;895e	31 35 30 	1 5 0 
	jr nz,$+69		;8961	20 43 	  C 
	ld c,h			;8963	4c 	L 
	ld c,c			;8964	49 	I 
	ld d,(hl)			;8965	56 	V 
	ld b,l			;8966	45 	E 
	jr nz,$+34		;8967	20 20 	    
	jr nz,$+34		;8969	20 20 	    
	jr nz,$+50		;896b	20 30 	  0 
	jr nc,$+50		;896d	30 30 	0 0 
	ld sp,03034h		;896f	31 34 30 	1 4 0 
	ld c,l			;8972	4d 	M 
	ld b,c			;8973	41 	A 
	ld e,d			;8974	5a 	Z 
	jr nz,$+34		;8975	20 20 	    
	jr nz,$+34		;8977	20 20 	    
	jr nz,$+34		;8979	20 20 	    
	jr nz,$+34		;897b	20 20 	    
	jr nc,$+50		;897d	30 30 	0 0 
	jr nc,$+51		;897f	30 31 	0 1 
	inc sp			;8981	33 	3 
	jr nc,$+80		;8982	30 4e 	0 N 
	ld c,c			;8984	49 	I 
	ld b,e			;8985	43 	C 
	ld c,e			;8986	4b 	K 
	jr nz,$+52		;8987	20 32 	  2 
	jr nc,$+55		;8989	30 35 	0 5 
	ld b,a			;898b	47 	G 
	ld d,h			;898c	54 	T 
	ld c,c			;898d	49 	I 
	jr nc,$+50		;898e	30 30 	0 0 
	jr nc,$+51		;8990	30 31 	0 1 
	ld (05230h),a		;8992	32 30 52 	2 0 R 
	ld c,a			;8995	4f 	O 
	ld b,d			;8996	42 	B 
	jr nz,$+71		;8997	20 45 	  E 
	ld c,h			;8999	4c 	L 
	jr nz,$+68		;899a	20 42 	  B 
	ld c,a			;899c	4f 	O 
	ld d,e			;899d	53 	S 
	ld d,e			;899e	53 	S 
	jr nc,$+50		;899f	30 30 	0 0 
	jr nc,$+51		;89a1	30 31 	0 1 
	ld sp,05230h		;89a3	31 30 52 	1 0 R 
	ld c,a			;89a6	4f 	O 
	ld b,h			;89a7	44 	D 
	ld b,l			;89a8	45 	E 
	ld d,d			;89a9	52 	R 
	ld c,c			;89aa	49 	I 
	ld b,e			;89ab	43 	C 
	ld c,e			;89ac	4b 	K 
	jr nz,$+34		;89ad	20 20 	    
	jr nz,$+50		;89af	20 30 	  0 
	jr nc,$+50		;89b1	30 30 	0 0 
	ld sp,03030h		;89b3	31 30 30 	1 0 0 
	ld d,d			;89b6	52 	R 
	ld c,a			;89b7	4f 	O 
	ld b,e			;89b8	43 	C 
	ld c,e			;89b9	4b 	K 
	ld b,l			;89ba	45 	E 
	ld d,h			;89bb	54 	T 
	jr nz,$+84		;89bc	20 52 	  R 
	ld c,a			;89be	4f 	O 
	ld c,(hl)			;89bf	4e 	N 
	jr nz,$+50		;89c0	20 30 	  0 
	jr nc,$+50		;89c2	30 30 	0 0 
	jr nc,$+59		;89c4	30 39 	0 9 
	jr nc,$+86		;89c6	30 54 	0 T 
	ld c,c			;89c8	49 	I 
	ld c,l			;89c9	4d 	M 
	jr nz,$+78		;89ca	20 4c 	  L 
	ld b,l			;89cc	45 	E 
	jr nz,$+67		;89cd	20 41 	  A 
	ld d,d			;89cf	52 	R 
	ld d,h			;89d0	54 	T 
	jr nz,$+50		;89d1	20 30 	  0 
	jr nc,$+50		;89d3	30 30 	0 0 
	jr nc,$+58		;89d5	30 38 	0 8 
	jr nc,$+79		;89d7	30 4d 	0 M 
	ld c,c			;89d9	49 	I 
	ld c,e			;89da	4b 	K 
	ld b,l			;89db	45 	E 
	jr nz,$+35		;89dc	20 21 	  ! 
	jr nz,$+76		;89de	20 4a 	  J 
	ld b,c			;89e0	41 	A 
	ld c,(hl)			;89e1	4e 	N 
	ld b,l			;89e2	45 	E 
	jr nc,$+50		;89e3	30 30 	0 0 
	jr nc,$+50		;89e5	30 30 	0 0 
	scf			;89e7	37 	7 
	jr nc,$+79		;89e8	30 4d 	0 M 
	ld c,c			;89ea	49 	I 
	ld c,e			;89eb	4b 	K 
	ld b,l			;89ec	45 	E 
	jr nz,$+71		;89ed	20 45 	  E 
	ld c,b			;89ef	48 	H 
	jr nz,$+34		;89f0	20 20 	    
	jr nz,$+34		;89f2	20 20 	    
	jr nc,$+50		;89f4	30 30 	0 0 
	jr nc,$+50		;89f6	30 30 	0 0 
	ld (hl),030h		;89f8	36 30 	6 0 
	ld d,h			;89fa	54 	T 
	ld c,c			;89fb	49 	I 
	ld c,l			;89fc	4d 	M 
	jr nz,$+74		;89fd	20 48 	  H 
	ld b,l			;89ff	45 	E 
	ld c,c			;8a00	49 	I 
	ld c,(hl)			;8a01	4e 	N 
	ld e,d			;8a02	5a 	Z 
	jr nz,$+34		;8a03	20 20 	    
	jr nc,$+50		;8a05	30 30 	0 0 
	jr nc,$+50		;8a07	30 30 	0 0 
	dec (hl)			;8a09	35 	5 
	jr nc,$+67		;8a0a	30 41 	0 A 
	ld c,(hl)			;8a0c	4e 	N 
	ld b,a			;8a0d	47 	G 
	ld c,c			;8a0e	49 	I 
	ld b,l			;8a0f	45 	E 
	jr nz,$+34		;8a10	20 20 	    
	jr nz,$+34		;8a12	20 20 	    
	jr nz,$+34		;8a14	20 20 	    
	jr nc,$+50		;8a16	30 30 	0 0 
	jr nc,$+50		;8a18	30 30 	0 0 
	inc (hl)			;8a1a	34 	4 
	jr nc,$+76		;8a1b	30 4a 	0 J 
	ld c,a			;8a1d	4f 	O 
	jr nz,$+34		;8a1e	20 20 	    
	jr nz,$+34		;8a20	20 20 	    
	jr nz,$+34		;8a22	20 20 	    
	jr nz,$+34		;8a24	20 20 	    
	jr nz,$+50		;8a26	20 30 	  0 
	jr nc,$+50		;8a28	30 30 	0 0 
	jr nc,$+53		;8a2a	30 33 	0 3 
	jr nc,$+76		;8a2c	30 4a 	0 J 
	ld d,l			;8a2e	55 	U 
	ld c,h			;8a2f	4c 	L 
	ld c,c			;8a30	49 	I 
	ld b,c			;8a31	41 	A 
	ld c,(hl)			;8a32	4e 	N 
	jr nz,$+86		;8a33	20 54 	  T 
	ld c,a			;8a35	4f 	O 
	ld b,c			;8a36	41 	A 
	ld b,h			;8a37	44 	D 
	jr nc,$+50		;8a38	30 30 	0 0 
	jr nc,$+50		;8a3a	30 30 	0 0 
	ld (05430h),a		;8a3c	32 30 54 	2 0 T 
	ld c,b			;8a3f	48 	H 
	ld b,l			;8a40	45 	E 
	jr nz,$+69		;8a41	20 43 	  C 
	ld c,h			;8a43	4c 	L 
	ld b,l			;8a44	45 	E 
	ld b,c			;8a45	41 	A 
	ld c,(hl)			;8a46	4e 	N 
	ld b,l			;8a47	45 	E 
	ld d,d			;8a48	52 	R 
	jr nc,$+50		;8a49	30 30 	0 0 
	jr nc,$+50		;8a4b	30 30 	0 0 
	ld sp,05330h		;8a4d	31 30 53 	1 0 S 
	ld c,c			;8a50	49 	I 
	ld c,l			;8a51	4d 	M 
	ld c,a			;8a52	4f 	O 
	ld c,(hl)			;8a53	4e 	N 
	jr nz,$+34		;8a54	20 20 	    
	jr nz,$+34		;8a56	20 20 	    
	jr nz,$+34		;8a58	20 20 	    
	jr nc,$+50		;8a5a	30 30 	0 0 
	jr nc,$+51		;8a5c	30 31 	0 1 
	dec (hl)			;8a5e	35 	5 
	jr nc,$+34		;8a5f	30 20 	0   
	ld b,e			;8a61	43 	C 
	ld c,h			;8a62	4c 	L 
	ld c,c			;8a63	49 	I 
	ld d,(hl)			;8a64	56 	V 
	ld b,l			;8a65	45 	E 
	jr nz,$+34		;8a66	20 20 	    
	jr nz,$+34		;8a68	20 20 	    
	jr nz,$+50		;8a6a	20 30 	  0 
	jr nc,$+50		;8a6c	30 30 	0 0 
	ld sp,03034h		;8a6e	31 34 30 	1 4 0 
	ld c,(hl)			;8a71	4e 	N 
	ld c,c			;8a72	49 	I 
	ld c,(hl)			;8a73	4e 	N 
	ld c,d			;8a74	4a 	J 
	ld b,c			;8a75	41 	A 
	jr nz,$+34		;8a76	20 20 	    
	jr nz,$+34		;8a78	20 20 	    
	jr nz,$+34		;8a7a	20 20 	    
	jr nc,$+50		;8a7c	30 30 	0 0 
	jr nc,$+51		;8a7e	30 31 	0 1 
	inc sp			;8a80	33 	3 
	jr nc,$+84		;8a81	30 52 	0 R 
	ld c,c			;8a83	49 	I 
	ld b,e			;8a84	43 	C 
	ld c,b			;8a85	48 	H 
	jr nz,$+34		;8a86	20 20 	    
	jr nz,$+34		;8a88	20 20 	    
	jr nz,$+34		;8a8a	20 20 	    
	jr nz,$+50		;8a8c	20 30 	  0 
	jr nc,$+50		;8a8e	30 30 	0 0 
	ld sp,03032h		;8a90	31 32 30 	1 2 0 
	ld b,h			;8a93	44 	D 
	ld b,c			;8a94	41 	A 
	ld d,(hl)			;8a95	56 	V 
	ld b,l			;8a96	45 	E 
	jr nz,$+67		;8a97	20 41 	  A 
	ld d,d			;8a99	52 	R 
	ld c,l			;8a9a	4d 	M 
	ld d,e			;8a9b	53 	S 
	jr nz,$+34		;8a9c	20 20 	    
	jr nc,$+50		;8a9e	30 30 	0 0 
	jr nc,$+51		;8aa0	30 31 	0 1 
	ld sp,05430h		;8aa2	31 30 54 	1 0 T 
	ld d,d			;8aa5	52 	R 
	ld b,l			;8aa6	45 	E 
	ld d,(hl)			;8aa7	56 	V 
	ld c,a			;8aa8	4f 	O 
	ld d,d			;8aa9	52 	R 
	jr nz,$+34		;8aaa	20 20 	    
	jr nz,$+34		;8aac	20 20 	    
	jr nz,$+50		;8aae	20 30 	  0 
	jr nc,$+50		;8ab0	30 30 	0 0 
	ld sp,03030h		;8ab2	31 30 30 	1 0 0 
	ld c,b			;8ab5	48 	H 
	ld b,l			;8ab6	45 	E 
	ld c,h			;8ab7	4c 	L 
	ld c,a			;8ab8	4f 	O 
	ld c,c			;8ab9	49 	I 
	ld d,e			;8aba	53 	S 
	ld b,l			;8abb	45 	E 
	jr nz,$+34		;8abc	20 20 	    
	jr nz,$+34		;8abe	20 20 	    
	jr nc,$+50		;8ac0	30 30 	0 0 
	jr nc,$+50		;8ac2	30 30 	0 0 
	add hl,sp			;8ac4	39 	9 
	jr nc,$+86		;8ac5	30 54 	0 T 
	ld c,a			;8ac7	4f 	O 
	ld c,l			;8ac8	4d 	M 
	jr nz,$+34		;8ac9	20 20 	    
	jr nz,$+34		;8acb	20 20 	    
	jr nz,$+34		;8acd	20 20 	    
	jr nz,$+34		;8acf	20 20 	    
	jr nc,$+50		;8ad1	30 30 	0 0 
	jr nc,$+50		;8ad3	30 30 	0 0 
	jr c,$+50		;8ad5	38 30 	8 0 
	ld c,a			;8ad7	4f 	O 
	ld d,a			;8ad8	57 	W 
	ld b,l			;8ad9	45 	E 
	ld c,(hl)			;8ada	4e 	N 
	jr nz,$+34		;8adb	20 20 	    
	jr nz,$+34		;8add	20 20 	    
	jr nz,$+34		;8adf	20 20 	    
	jr nz,$+50		;8ae1	20 30 	  0 
	jr nc,$+50		;8ae3	30 30 	0 0 
	jr nc,$+57		;8ae5	30 37 	0 7 
	jr nc,$+82		;8ae7	30 50 	0 P 
	ld c,b			;8ae9	48 	H 
	ld c,c			;8aea	49 	I 
	ld c,h			;8aeb	4c 	L 
	ld c,h			;8aec	4c 	L 
	jr nz,$+34		;8aed	20 20 	    
	jr nz,$+34		;8aef	20 20 	    
	jr nz,$+34		;8af1	20 20 	    
	jr nc,$+50		;8af3	30 30 	0 0 
	jr nc,$+50		;8af5	30 30 	0 0 
	ld (hl),030h		;8af7	36 30 	6 0 
	ld b,e			;8af9	43 	C 
	ld b,c			;8afa	41 	A 
	ld d,d			;8afb	52 	R 
	ld c,a			;8afc	4f 	O 
	ld c,h			;8afd	4c 	L 
	ld c,c			;8afe	49 	I 
	ld c,(hl)			;8aff	4e 	N 
	ld b,l			;8b00	45 	E 
	jr nz,$+34		;8b01	20 20 	    
	jr nz,$+50		;8b03	20 30 	  0 
	jr nc,$+50		;8b05	30 30 	0 0 
	jr nc,$+55		;8b07	30 35 	0 5 
	jr nc,$+74		;8b09	30 48 	0 H 
	ld b,l			;8b0b	45 	E 
	ld c,h			;8b0c	4c 	L 
	ld b,l			;8b0d	45 	E 
	ld c,(hl)			;8b0e	4e 	N 
	jr nz,$+82		;8b0f	20 50 	  P 
	jr nz,$+34		;8b11	20 20 	    
	jr nz,$+34		;8b13	20 20 	    
	jr nc,$+50		;8b15	30 30 	0 0 
	jr nc,$+50		;8b17	30 30 	0 0 
	inc (hl)			;8b19	34 	4 
	jr nc,$+72		;8b1a	30 46 	0 F 
	ld d,d			;8b1c	52 	R 
	ld b,c			;8b1d	41 	A 
	ld c,(hl)			;8b1e	4e 	N 
	jr nz,$+34		;8b1f	20 20 	    
	jr nz,$+34		;8b21	20 20 	    
	jr nz,$+34		;8b23	20 20 	    
	jr nz,$+50		;8b25	20 30 	  0 
	jr nc,$+50		;8b27	30 30 	0 0 
	jr nc,$+53		;8b29	30 33 	0 3 
	jr nc,$+85		;8b2b	30 53 	0 S 
	ld d,h			;8b2d	54 	T 
	ld b,l			;8b2e	45 	E 
	ld d,(hl)			;8b2f	56 	V 
	ld b,l			;8b30	45 	E 
	jr nz,$+74		;8b31	20 48 	  H 
	jr nz,$+34		;8b33	20 20 	    
	jr nz,$+34		;8b35	20 20 	    
	jr nc,$+50		;8b37	30 30 	0 0 
	jr nc,$+50		;8b39	30 30 	0 0 
	ld (05a30h),a		;8b3b	32 30 5a 	2 0 Z 
	ld c,a			;8b3e	4f 	O 
	ld c,(hl)			;8b3f	4e 	N 
	ld c,e			;8b40	4b 	K 
	jr nz,$+34		;8b41	20 20 	    
	jr nz,$+34		;8b43	20 20 	    
	jr nz,$+34		;8b45	20 20 	    
	jr nz,$+50		;8b47	20 30 	  0 
	jr nc,$+50		;8b49	30 30 	0 0 
	jr nc,$+51		;8b4b	30 31 	0 1 
	jr nc,$+68		;8b4d	30 42 	0 B 
	ld c,c			;8b4f	49 	I 
	ld c,(hl)			;8b50	4e 	N 
	jr nz,$+68		;8b51	20 42 	  B 
	ld c,a			;8b53	4f 	O 
	ld e,c			;8b54	59 	Y 
	jr nz,$+68		;8b55	20 42 	  B 
	ld b,l			;8b57	45 	E 
	ld c,(hl)			;8b58	4e 	N 
	jr nc,$+50		;8b59	30 30 	0 0 
	jr nc,$+52		;8b5b	30 32 	0 2 
	dec (hl)			;8b5d	35 	5 
	jr nc,$+69		;8b5e	30 43 	0 C 
	ld c,h			;8b60	4c 	L 
	ld c,c			;8b61	49 	I 
	ld d,(hl)			;8b62	56 	V 
	ld b,l			;8b63	45 	E 
	jr nz,$+34		;8b64	20 20 	    
	jr nz,$+34		;8b66	20 20 	    
	jr nz,$+34		;8b68	20 20 	    
	jr nc,$+50		;8b6a	30 30 	0 0 
	jr nc,$+52		;8b6c	30 32 	0 2 
	inc (hl)			;8b6e	34 	4 
	jr nc,$+84		;8b6f	30 52 	0 R 
	ld c,c			;8b71	49 	I 
	ld b,e			;8b72	43 	C 
	ld c,b			;8b73	48 	H 
	jr nz,$+34		;8b74	20 20 	    
	jr nz,$+34		;8b76	20 20 	    
	jr nz,$+34		;8b78	20 20 	    
	jr nz,$+50		;8b7a	20 30 	  0 
	jr nc,$+50		;8b7c	30 30 	0 0 
	ld sp,03033h		;8b7e	31 33 30 	1 3 0 
	ld d,c			;8b81	51 	Q 
	ld d,l			;8b82	55 	U 
	ld b,c			;8b83	41 	A 
	ld c,(hl)			;8b84	4e 	N 
	ld b,a			;8b85	47 	G 
	ld c,a			;8b86	4f 	O 
	jr nz,$+34		;8b87	20 20 	    
	jr nz,$+34		;8b89	20 20 	    
	jr nz,$+50		;8b8b	20 30 	  0 
	jr nc,$+50		;8b8d	30 30 	0 0 
	ld sp,03032h		;8b8f	31 32 30 	1 2 0 
	ld b,e			;8b92	43 	C 
	ld b,c			;8b93	41 	A 
	ld d,b			;8b94	50 	P 
	ld d,h			;8b95	54 	T 
	ld c,c			;8b96	49 	I 
	ld c,(hl)			;8b97	4e 	N 
	jr nz,$+72		;8b98	20 46 	  F 
	ld c,h			;8b9a	4c 	L 
	ld b,c			;8b9b	41 	A 
	ld b,d			;8b9c	42 	B 
	jr nc,$+50		;8b9d	30 30 	0 0 
	jr nc,$+51		;8b9f	30 31 	0 1 
	ld sp,04b30h		;8ba1	31 30 4b 	1 0 K 
	ld b,l			;8ba4	45 	E 
	ld d,(hl)			;8ba5	56 	V 
	jr nz,$+34		;8ba6	20 20 	    
	jr nz,$+34		;8ba8	20 20 	    
	jr nz,$+34		;8baa	20 20 	    
	jr nz,$+34		;8bac	20 20 	    
	jr nc,$+50		;8bae	30 30 	0 0 
	jr nc,$+51		;8bb0	30 31 	0 1 
	jr nc,$+50		;8bb2	30 30 	0 0 
	ld d,d			;8bb4	52 	R 
	ld c,a			;8bb5	4f 	O 
	ld b,h			;8bb6	44 	D 
	ld c,(hl)			;8bb7	4e 	N 
	ld b,l			;8bb8	45 	E 
	ld e,c			;8bb9	59 	Y 
	jr nz,$+34		;8bba	20 20 	    
	jr nz,$+34		;8bbc	20 20 	    
	jr nz,$+50		;8bbe	20 30 	  0 
	jr nc,$+50		;8bc0	30 30 	0 0 
	jr nc,$+59		;8bc2	30 39 	0 9 
	jr nc,$+85		;8bc4	30 53 	0 S 
	ld d,h			;8bc6	54 	T 
	ld b,l			;8bc7	45 	E 
	ld d,(hl)			;8bc8	56 	V 
	ld b,l			;8bc9	45 	E 
	jr nz,$+86		;8bca	20 54 	  T 
	jr nz,$+34		;8bcc	20 20 	    
	jr nz,$+34		;8bce	20 20 	    
	jr nc,$+50		;8bd0	30 30 	0 0 
	jr nc,$+50		;8bd2	30 30 	0 0 
	jr c,$+50		;8bd4	38 30 	8 0 
	ld b,a			;8bd6	47 	G 
	ld b,l			;8bd7	45 	E 
	ld c,a			;8bd8	4f 	O 
	ld b,(hl)			;8bd9	46 	F 
	ld b,(hl)			;8bda	46 	F 
	jr nz,$+82		;8bdb	20 50 	  P 
	jr nz,$+34		;8bdd	20 20 	    
	jr nz,$+34		;8bdf	20 20 	    
	jr nc,$+50		;8be1	30 30 	0 0 
	jr nc,$+50		;8be3	30 30 	0 0 
	scf			;8be5	37 	7 
	jr nc,$+84		;8be6	30 52 	0 R 
	ld c,a			;8be8	4f 	O 
	ld b,d			;8be9	42 	B 
	ld c,c			;8bea	49 	I 
	ld c,(hl)			;8beb	4e 	N 
	jr nz,$+69		;8bec	20 43 	  C 
	jr nz,$+34		;8bee	20 20 	    
	jr nz,$+34		;8bf0	20 20 	    
	jr nc,$+50		;8bf2	30 30 	0 0 
	jr nc,$+50		;8bf4	30 30 	0 0 
	ld (hl),030h		;8bf6	36 30 	6 0 
	ld d,(hl)			;8bf8	56 	V 
	ld b,c			;8bf9	41 	A 
	ld c,h			;8bfa	4c 	L 
	jr nz,$+34		;8bfb	20 20 	    
	jr nz,$+34		;8bfd	20 20 	    
	jr nz,$+34		;8bff	20 20 	    
	jr nz,$+34		;8c01	20 20 	    
	jr nc,$+50		;8c03	30 30 	0 0 
	jr nc,$+50		;8c05	30 30 	0 0 
	dec (hl)			;8c07	35 	5 
	jr nc,$+78		;8c08	30 4c 	0 L 
	ld c,c			;8c0a	49 	I 
	ld c,(hl)			;8c0b	4e 	N 
	ld b,h			;8c0c	44 	D 
	ld b,c			;8c0d	41 	A 
	jr nz,$+34		;8c0e	20 20 	    
	jr nz,$+34		;8c10	20 20 	    
	jr nz,$+34		;8c12	20 20 	    
	jr nc,$+50		;8c14	30 30 	0 0 
	jr nc,$+50		;8c16	30 30 	0 0 
	inc (hl)			;8c18	34 	4 
	jr nc,$+82		;8c19	30 50 	0 P 
	ld b,l			;8c1b	45 	E 
	ld c,(hl)			;8c1c	4e 	N 
	ld c,(hl)			;8c1d	4e 	N 
	ld e,c			;8c1e	59 	Y 
	jr nz,$+34		;8c1f	20 20 	    
	jr nz,$+34		;8c21	20 20 	    
	jr nz,$+34		;8c23	20 20 	    
	jr nc,$+50		;8c25	30 30 	0 0 
	jr nc,$+50		;8c27	30 30 	0 0 
	inc sp			;8c29	33 	3 
	jr nc,$+79		;8c2a	30 4d 	0 M 
	ld c,c			;8c2c	49 	I 
	ld b,e			;8c2d	43 	C 
	ld c,e			;8c2e	4b 	K 
	jr nz,$+34		;8c2f	20 20 	    
	jr nz,$+34		;8c31	20 20 	    
	jr nz,$+34		;8c33	20 20 	    
	jr nz,$+50		;8c35	20 30 	  0 
	jr nc,$+50		;8c37	30 30 	0 0 
	jr nc,$+52		;8c39	30 32 	0 2 
	jr nc,$+69		;8c3b	30 43 	0 C 
	ld c,b			;8c3d	48 	H 
	ld d,d			;8c3e	52 	R 
	ld c,c			;8c3f	49 	I 
	ld d,e			;8c40	53 	S 
	jr nz,$+34		;8c41	20 20 	    
	jr nz,$+34		;8c43	20 20 	    
	jr nz,$+34		;8c45	20 20 	    
	jr nc,$+50		;8c47	30 30 	0 0 
	jr nc,$+50		;8c49	30 30 	0 0 
	ld sp,04830h		;8c4b	31 30 48 	1 0 H 
	ld c,a			;8c4e	4f 	O 
	ld c,h			;8c4f	4c 	L 
	ld c,h			;8c50	4c 	L 
	ld e,c			;8c51	59 	Y 
	jr nz,$+34		;8c52	20 20 	    
	jr nz,$+34		;8c54	20 20 	    
	jr nz,$+34		;8c56	20 20 	    
	jr nc,$+50		;8c58	30 30 	0 0 
	jr nc,$+51		;8c5a	30 31 	0 1 
	dec (hl)			;8c5c	35 	5 
	jr nc,$+70		;8c5d	30 44 	0 D 
	ld d,l			;8c5f	55 	U 
	ld d,d			;8c60	52 	R 
	ld b,l			;8c61	45 	E 
	ld c,h			;8c62	4c 	L 
	ld c,h			;8c63	4c 	L 
	jr nz,$+34		;8c64	20 20 	    
	jr nz,$+34		;8c66	20 20 	    
	jr nz,$+50		;8c68	20 30 	  0 
	jr nc,$+50		;8c6a	30 30 	0 0 
	ld sp,03034h		;8c6c	31 34 30 	1 4 0 
	ld b,h			;8c6f	44 	D 
	ld d,l			;8c70	55 	U 
	ld d,d			;8c71	52 	R 
	ld b,l			;8c72	45 	E 
	ld c,h			;8c73	4c 	L 
	ld c,h			;8c74	4c 	L 
	jr nz,$+34		;8c75	20 20 	    
	jr nz,$+34		;8c77	20 20 	    
	jr nz,$+50		;8c79	20 30 	  0 
	jr nc,$+50		;8c7b	30 30 	0 0 
	ld sp,03033h		;8c7d	31 33 30 	1 3 0 
	ld b,h			;8c80	44 	D 
	ld d,l			;8c81	55 	U 
	ld d,d			;8c82	52 	R 
	ld b,l			;8c83	45 	E 
	ld c,h			;8c84	4c 	L 
	ld c,h			;8c85	4c 	L 
	jr nz,$+34		;8c86	20 20 	    
	jr nz,$+34		;8c88	20 20 	    
	jr nz,$+50		;8c8a	20 30 	  0 
	jr nc,$+50		;8c8c	30 30 	0 0 
	ld sp,03032h		;8c8e	31 32 30 	1 2 0 
	ld b,h			;8c91	44 	D 
	ld d,l			;8c92	55 	U 
	ld d,d			;8c93	52 	R 
	ld b,l			;8c94	45 	E 
	ld c,h			;8c95	4c 	L 
	ld c,h			;8c96	4c 	L 
	jr nz,$+34		;8c97	20 20 	    
	jr nz,$+34		;8c99	20 20 	    
	jr nz,$+50		;8c9b	20 30 	  0 
	jr nc,$+50		;8c9d	30 30 	0 0 
	ld sp,03031h		;8c9f	31 31 30 	1 1 0 
	ld b,h			;8ca2	44 	D 
	ld d,l			;8ca3	55 	U 
	ld d,d			;8ca4	52 	R 
	ld b,l			;8ca5	45 	E 
	ld c,h			;8ca6	4c 	L 
	ld c,h			;8ca7	4c 	L 
	jr nz,$+34		;8ca8	20 20 	    
	jr nz,$+34		;8caa	20 20 	    
	jr nz,$+50		;8cac	20 30 	  0 
	jr nc,$+50		;8cae	30 30 	0 0 
	ld sp,03030h		;8cb0	31 30 30 	1 0 0 
	ld b,h			;8cb3	44 	D 
	ld d,l			;8cb4	55 	U 
	ld d,d			;8cb5	52 	R 
	ld b,l			;8cb6	45 	E 
	ld c,h			;8cb7	4c 	L 
	ld c,h			;8cb8	4c 	L 
	jr nz,$+34		;8cb9	20 20 	    
	jr nz,$+34		;8cbb	20 20 	    
	jr nz,$+50		;8cbd	20 30 	  0 
	jr nc,$+50		;8cbf	30 30 	0 0 
	jr nc,$+59		;8cc1	30 39 	0 9 
	jr nc,$+70		;8cc3	30 44 	0 D 
	ld d,l			;8cc5	55 	U 
	ld d,d			;8cc6	52 	R 
	ld b,l			;8cc7	45 	E 
	ld c,h			;8cc8	4c 	L 
	ld c,h			;8cc9	4c 	L 
	jr nz,$+34		;8cca	20 20 	    
	jr nz,$+34		;8ccc	20 20 	    
	jr nz,$+50		;8cce	20 30 	  0 
	jr nc,$+50		;8cd0	30 30 	0 0 
	jr nc,$+58		;8cd2	30 38 	0 8 
	jr nc,$+70		;8cd4	30 44 	0 D 
	ld d,l			;8cd6	55 	U 
	ld d,d			;8cd7	52 	R 
	ld b,l			;8cd8	45 	E 
	ld c,h			;8cd9	4c 	L 
	ld c,h			;8cda	4c 	L 
	jr nz,$+34		;8cdb	20 20 	    
	jr nz,$+34		;8cdd	20 20 	    
	jr nz,$+50		;8cdf	20 30 	  0 
	jr nc,$+50		;8ce1	30 30 	0 0 
	jr nc,$+57		;8ce3	30 37 	0 7 
	jr nc,$+70		;8ce5	30 44 	0 D 
	ld d,l			;8ce7	55 	U 
	ld d,d			;8ce8	52 	R 
	ld b,l			;8ce9	45 	E 
	ld c,h			;8cea	4c 	L 
	ld c,h			;8ceb	4c 	L 
	jr nz,$+34		;8cec	20 20 	    
	jr nz,$+34		;8cee	20 20 	    
	jr nz,$+50		;8cf0	20 30 	  0 
	jr nc,$+50		;8cf2	30 30 	0 0 
	jr nc,$+56		;8cf4	30 36 	0 6 
	jr nc,$+70		;8cf6	30 44 	0 D 
	ld d,l			;8cf8	55 	U 
	ld d,d			;8cf9	52 	R 
	ld b,l			;8cfa	45 	E 
	ld c,h			;8cfb	4c 	L 
	ld c,h			;8cfc	4c 	L 
	jr nz,$+34		;8cfd	20 20 	    
	jr nz,$+34		;8cff	20 20 	    
	jr nz,$+50		;8d01	20 30 	  0 
	jr nc,$+50		;8d03	30 30 	0 0 
	jr nc,$+55		;8d05	30 35 	0 5 
	jr nc,$+70		;8d07	30 44 	0 D 
	ld d,l			;8d09	55 	U 
	ld d,d			;8d0a	52 	R 
	ld b,l			;8d0b	45 	E 
	ld c,h			;8d0c	4c 	L 
	ld c,h			;8d0d	4c 	L 
	jr nz,$+34		;8d0e	20 20 	    
	jr nz,$+34		;8d10	20 20 	    
	jr nz,$+50		;8d12	20 30 	  0 
	jr nc,$+50		;8d14	30 30 	0 0 
	jr nc,$+54		;8d16	30 34 	0 4 
	jr nc,$+70		;8d18	30 44 	0 D 
	ld d,l			;8d1a	55 	U 
	ld d,d			;8d1b	52 	R 
	ld b,l			;8d1c	45 	E 
	ld c,h			;8d1d	4c 	L 
	ld c,h			;8d1e	4c 	L 
	jr nz,$+34		;8d1f	20 20 	    
	jr nz,$+34		;8d21	20 20 	    
	jr nz,$+50		;8d23	20 30 	  0 
	jr nc,$+50		;8d25	30 30 	0 0 
	jr nc,$+53		;8d27	30 33 	0 3 
	jr nc,$+70		;8d29	30 44 	0 D 
	ld d,l			;8d2b	55 	U 
	ld d,d			;8d2c	52 	R 
	ld b,l			;8d2d	45 	E 
	ld c,h			;8d2e	4c 	L 
	ld c,h			;8d2f	4c 	L 
	jr nz,$+34		;8d30	20 20 	    
	jr nz,$+34		;8d32	20 20 	    
	jr nz,$+50		;8d34	20 30 	  0 
	jr nc,$+50		;8d36	30 30 	0 0 
	jr nc,$+52		;8d38	30 32 	0 2 
	jr nc,$+70		;8d3a	30 44 	0 D 
	ld d,l			;8d3c	55 	U 
	ld d,d			;8d3d	52 	R 
	ld b,l			;8d3e	45 	E 
	ld c,h			;8d3f	4c 	L 
	ld c,h			;8d40	4c 	L 
	jr nz,$+34		;8d41	20 20 	    
	jr nz,$+34		;8d43	20 20 	    
	jr nz,$+50		;8d45	20 30 	  0 
	jr nc,$+50		;8d47	30 30 	0 0 
	jr nc,$+51		;8d49	30 31 	0 1 
	jr nc,$+70		;8d4b	30 44 	0 D 
	ld d,l			;8d4d	55 	U 
	ld d,d			;8d4e	52 	R 
	ld b,l			;8d4f	45 	E 
	ld c,h			;8d50	4c 	L 
	ld c,h			;8d51	4c 	L 
	jr nz,$+34		;8d52	20 20 	    
	jr nz,$+34		;8d54	20 20 	    
	jr nz,$+24		;8d56	20 16 	  . 
	nop			;8d58	00 	. 
	nop			;8d59	00 	. 
	djnz $+8		;8d5a	10 06 	. . 
	ld de,05300h		;8d5c	11 00 53 	. . S 
	ld h,c			;8d5f	61 	a 
	ld h,d			;8d60	62 	b 
	ld l,a			;8d61	6f 	o 
	ld (hl),h			;8d62	74 	t 
	ld h,l			;8d63	65 	e 
	ld (hl),l			;8d64	75 	u 
	ld (hl),d			;8d65	72 	r 
	jr nz,$+75		;8d66	20 49 	  I 
	ld c,c			;8d68	49 	I 
	jr nz,$+54		;8d69	20 34 	  4 
	jr c,$+109		;8d6b	38 6b 	8 k 
	jr nz,$+118		;8d6d	20 74 	  t 
	ld l,b			;8d6f	68 	h 
	ld h,l			;8d70	65 	e 
	ld h,c			;8d71	61 	a 
	ld l,h			;8d72	6c 	l 
	ld h,(hl)			;8d73	66 	f 
	ld h,l			;8d74	65 	e 
	ld (hl),e			;8d75	73 	s 
	ld (hl),h			;8d76	74 	t 
	jr nz,$+111		;8d77	20 6d 	  m 
	ld l,a			;8d79	6f 	o 
	ld h,h			;8d7a	64 	d 
	jr nz,$+120		;8d7b	20 76 	  v 
	ld sp,02020h		;8d7d	31 20 20 	1     
	jr nz,$+34		;8d80	20 20 	    
	jr nz,$+34		;8d82	20 20 	    
	jr nz,$+34		;8d84	20 20 	    
	jr nz,$+34		;8d86	20 20 	    
	jr nz,$+34		;8d88	20 20 	    
	jr nz,$+34		;8d8a	20 20 	    
	jr nz,$+34		;8d8c	20 20 	    
	jr nz,$+34		;8d8e	20 20 	    
	jr nz,$+34		;8d90	20 20 	    
	jr nz,$+34		;8d92	20 20 	    
	jr nz,$+34		;8d94	20 20 	    
	jr nz,$+34		;8d96	20 20 	    
	jr nz,$+34		;8d98	20 20 	    
	jr nz,$+34		;8d9a	20 20 	    
	jr nz,$+34		;8d9c	20 20 	    
	djnz $+9		;8d9e	10 07 	. . 
	ld de,05401h		;8da0	11 01 54 	. . T 
	ld l,b			;8da3	68 	h 
	ld l,c			;8da4	69 	i 
	ld (hl),e			;8da5	73 	s 
	jr nz,$+111		;8da6	20 6d 	  m 
	ld l,a			;8da8	6f 	o 
	ld h,h			;8da9	64 	d 
	jr nz,$+106		;8daa	20 68 	  h 
	ld h,c			;8dac	61 	a 
	ld (hl),e			;8dad	73 	s 
	jr nz,$+100		;8dae	20 62 	  b 
	ld (hl),l			;8db0	75 	u 
	ld h,a			;8db1	67 	g 
	ld h,(hl)			;8db2	66 	f 
	ld l,c			;8db3	69 	i 
	ld a,b			;8db4	78 	x 
	ld h,l			;8db5	65 	e 
	ld (hl),e			;8db6	73 	s 
	inc l			;8db7	2c 	, 
	ld h,c			;8db8	61 	a 
	ld h,h			;8db9	64 	d 
	ld l,d			;8dba	6a 	j 
	ld (hl),l			;8dbb	75 	u 
	ld (hl),e			;8dbc	73 	s 
	ld (hl),h			;8dbd	74 	t 
	ld h,c			;8dbe	61 	a 
	ld h,d			;8dbf	62 	b 
	ld l,h			;8dc0	6c 	l 
	ld h,l			;8dc1	65 	e 
	ld (hl),e			;8dc2	73 	s 
	ld (hl),b			;8dc3	70 	p 
	ld h,l			;8dc4	65 	e 
	ld h,l			;8dc5	65 	e 
	ld h,h			;8dc6	64 	d 
	inc l			;8dc7	2c 	, 
	jr nz,$+34		;8dc8	20 20 	    
	ld l,c			;8dca	69 	i 
	ld l,l			;8dcb	6d 	m 
	ld (hl),b			;8dcc	70 	p 
	ld (hl),d			;8dcd	72 	r 
	ld l,a			;8dce	6f 	o 
	halt			;8dcf	76 	v 
	ld h,l			;8dd0	65 	e 
	ld h,h			;8dd1	64 	d 
	jr nz,$+34		;8dd2	20 20 	    
	ld h,a			;8dd4	67 	g 
	ld h,c			;8dd5	61 	a 
	ld l,l			;8dd6	6d 	m 
	ld h,l			;8dd7	65 	e 
	jr nz,$+34		;8dd8	20 20 	    
	ld h,d			;8dda	62 	b 
	ld h,c			;8ddb	61 	a 
	ld l,h			;8ddc	6c 	l 
	ld h,c			;8ddd	61 	a 
	ld l,(hl)			;8dde	6e 	n 
	ld h,e			;8ddf	63 	c 
	ld h,l			;8de0	65 	e 
	inc l			;8de1	2c 	, 
	ld h,c			;8de2	61 	a 
	ld h,h			;8de3	64 	d 
	ld h,h			;8de4	64 	d 
	ld l,c			;8de5	69 	i 
	ld (hl),h			;8de6	74 	t 
	ld l,c			;8de7	69 	i 
	ld l,a			;8de8	6f 	o 
	ld l,(hl)			;8de9	6e 	n 
	ld h,c			;8dea	61 	a 
	ld l,h			;8deb	6c 	l 
	jr nz,$+105		;8dec	20 67 	  g 
	ld (hl),d			;8dee	72 	r 
	ld h,c			;8def	61 	a 
	ld (hl),b			;8df0	70 	p 
	ld l,b			;8df1	68 	h 
	ld l,c			;8df2	69 	i 
	ld h,e			;8df3	63 	c 
	ld (hl),e			;8df4	73 	s 
	inc l			;8df5	2c 	, 
	ld (hl),e			;8df6	73 	s 
	ld l,a			;8df7	6f 	o 
	ld (hl),l			;8df8	75 	u 
	ld l,(hl)			;8df9	6e 	n 
	ld h,h			;8dfa	64 	d 
	ld (hl),e			;8dfb	73 	s 
	jr nz,$+40		;8dfc	20 26 	  & 
	ld l,l			;8dfe	6d 	m 
	ld l,a			;8dff	6f 	o 
	ld (hl),d			;8e00	72 	r 
	ld h,l			;8e01	65 	e 
	ld c,a			;8e02	4f 	O 
	ld (hl),d			;8e03	72 	r 
	ld l,c			;8e04	69 	i 
	ld h,a			;8e05	67 	g 
	ld l,c			;8e06	69 	i 
	ld l,(hl)			;8e07	6e 	n 
	ld h,c			;8e08	61 	a 
	ld l,h			;8e09	6c 	l 
	jr nz,$+105		;8e0a	20 67 	  g 
	ld h,c			;8e0c	61 	a 
	ld l,l			;8e0d	6d 	m 
	ld h,l			;8e0e	65 	e 
	jr nz,$+100		;8e0f	20 62 	  b 
	ld a,c			;8e11	79 	y 
	jr nz,$+34		;8e12	20 20 	    
	ld b,e			;8e14	43 	C 
	ld l,h			;8e15	6c 	l 
	ld l,c			;8e16	69 	i 
	halt			;8e17	76 	v 
	ld h,l			;8e18	65 	e 
	jr nz,$+86		;8e19	20 54 	  T 
	ld l,a			;8e1b	6f 	o 
	ld (hl),a			;8e1c	77 	w 
	ld l,(hl)			;8e1d	6e 	n 
	ld (hl),e			;8e1e	73 	s 
	ld h,l			;8e1f	65 	e 
	ld l,(hl)			;8e20	6e 	n 
	ld h,h			;8e21	64 	d 
	ld e,d			;8e22	5a 	Z 
	ld e,b			;8e23	58 	X 
	jr nc,$+34		;8e24	30 20 	0   
	ld h,e			;8e26	63 	c 
	ld l,a			;8e27	6f 	o 
	ld l,l			;8e28	6d 	m 
	ld (hl),b			;8e29	70 	p 
	ld (hl),d			;8e2a	72 	r 
	ld h,l			;8e2b	65 	e 
	ld (hl),e			;8e2c	73 	s 
	ld (hl),e			;8e2d	73 	s 
	ld l,c			;8e2e	69 	i 
	ld l,a			;8e2f	6f 	o 
	ld l,(hl)			;8e30	6e 	n 
	jr nz,$+100		;8e31	20 62 	  b 
	ld a,c			;8e33	79 	y 
	jr nz,$+34		;8e34	20 20 	    
	ld b,l			;8e36	45 	E 
	ld l,c			;8e37	69 	i 
	ld l,(hl)			;8e38	6e 	n 
	ld h,c			;8e39	61 	a 
	ld (hl),d			;8e3a	72 	r 
	jr nz,$+85		;8e3b	20 53 	  S 
	ld h,c			;8e3d	61 	a 
	ld (hl),l			;8e3e	75 	u 
	ld l,e			;8e3f	6b 	k 
	ld h,c			;8e40	61 	a 
	ld (hl),e			;8e41	73 	s 
	ld d,h			;8e42	54 	T 
	ld l,b			;8e43	68 	h 
	ld h,c			;8e44	61 	a 
	ld l,(hl)			;8e45	6e 	n 
	ld l,e			;8e46	6b 	k 
	ld (hl),e			;8e47	73 	s 
	jr nz,$+34		;8e48	20 20 	    
	ld (hl),h			;8e4a	74 	t 
	ld l,a			;8e4b	6f 	o 
	jr nz,$+34		;8e4c	20 20 	    
	ld c,b			;8e4e	48 	H 
	ld l,a			;8e4f	6f 	o 
	ld l,a			;8e50	6f 	o 
	ld h,h			;8e51	64 	d 
	jr nz,$+34		;8e52	20 20 	    
	ld h,(hl)			;8e54	66 	f 
	ld l,a			;8e55	6f 	o 
	ld (hl),d			;8e56	72 	r 
	jr nz,$+34		;8e57	20 20 	    
	ld (hl),h			;8e59	74 	t 
	ld h,l			;8e5a	65 	e 
	ld (hl),e			;8e5b	73 	s 
	ld (hl),h			;8e5c	74 	t 
	ld l,c			;8e5d	69 	i 
	ld l,(hl)			;8e5e	6e 	n 
	ld h,a			;8e5f	67 	g 
	ld l,020h		;8e60	2e 20 	.   
	djnz $+8		;8e62	10 06 	. . 
	ld de,08c00h		;8e64	11 00 8c 	. . . 
	adc a,h			;8e67	8c 	. 
	adc a,h			;8e68	8c 	. 
	adc a,h			;8e69	8c 	. 
	adc a,h			;8e6a	8c 	. 
	adc a,h			;8e6b	8c 	. 
	adc a,h			;8e6c	8c 	. 
	adc a,h			;8e6d	8c 	. 
	adc a,h			;8e6e	8c 	. 
	adc a,h			;8e6f	8c 	. 
	adc a,h			;8e70	8c 	. 
	adc a,h			;8e71	8c 	. 
	adc a,h			;8e72	8c 	. 
	adc a,b			;8e73	88 	. 
	jr nz,$+34		;8e74	20 20 	    
	jr nz,$+34		;8e76	20 20 	    
	jr nz,$+34		;8e78	20 20 	    
	jr nz,$+34		;8e7a	20 20 	    
	jr nz,$+34		;8e7c	20 20 	    
	jr nz,$+34		;8e7e	20 20 	    
	jr nz,$+34		;8e80	20 20 	    
	jr nz,$+34		;8e82	20 20 	    
	jr nz,$+34		;8e84	20 20 	    
	adc a,d			;8e86	8a 	. 
	adc a,h			;8e87	8c 	. 
	adc a,h			;8e88	8c 	. 
	adc a,b			;8e89	88 	. 
	adc a,d			;8e8a	8a 	. 
	add a,c			;8e8b	81 	. 
	add a,a			;8e8c	87 	. 
	adc a,(hl)			;8e8d	8e 	. 
	adc a,(hl)			;8e8e	8e 	. 
	adc a,d			;8e8f	8a 	. 
	adc a,h			;8e90	8c 	. 
	adc a,h			;8e91	8c 	. 
	adc a,b			;8e92	88 	. 
	adc a,d			;8e93	8a 	. 
	jr nz,$+62		;8e94	20 3c 	  < 
	dec l			;8e96	2d 	- 
	jr nz,$+82		;8e97	20 50 	  P 
	ld l,h			;8e99	6c 	l 
	ld h,l			;8e9a	65 	e 
	ld h,c			;8e9b	61 	a 
	ld (hl),e			;8e9c	73 	s 
	ld h,l			;8e9d	65 	e 
	jr nz,$+120		;8e9e	20 76 	  v 
	ld l,c			;8ea0	69 	i 
	ld (hl),e			;8ea1	73 	s 
	ld l,c			;8ea2	69 	i 
	ld (hl),h			;8ea3	74 	t 
	jr nz,$+34		;8ea4	20 20 	    
	adc a,d			;8ea6	8a 	. 
	adc a,d			;8ea7	8a 	. 
	jr nz,$-116		;8ea8	20 8a 	  . 
	adc a,(hl)			;8eaa	8e 	. 
	adc a,h			;8eab	8c 	. 
	add a,h			;8eac	84 	. 
	add a,l			;8ead	85 	. 
	adc a,c			;8eae	89 	. 
	adc a,d			;8eaf	8a 	. 
	adc a,d			;8eb0	8a 	. 
	jr nz,$-116		;8eb1	20 8a 	  . 
	adc a,d			;8eb3	8a 	. 
	jr nz,$+34		;8eb4	20 20 	    
	ld b,e			;8eb6	43 	C 
	ld l,h			;8eb7	6c 	l 
	ld l,c			;8eb8	69 	i 
	halt			;8eb9	76 	v 
	ld h,l			;8eba	65 	e 
	daa			;8ebb	27 	' 
	ld (hl),e			;8ebc	73 	s 
	jr nz,$+121		;8ebd	20 77 	  w 
	ld h,l			;8ebf	65 	e 
	ld h,d			;8ec0	62 	b 
	ld (hl),e			;8ec1	73 	s 
	ld l,c			;8ec2	69 	i 
	ld (hl),h			;8ec3	74 	t 
	ld h,l			;8ec4	65 	e 
	jr nz,$-116		;8ec5	20 8a 	  . 
	adc a,(hl)			;8ec7	8e 	. 
	adc a,h			;8ec8	8c 	. 
	adc a,d			;8ec9	8a 	. 
	adc a,(hl)			;8eca	8e 	. 
	adc a,a			;8ecb	8f 	. 
	add a,c			;8ecc	81 	. 
	add a,(hl)			;8ecd	86 	. 
	adc a,d			;8ece	8a 	. 
	adc a,d			;8ecf	8a 	. 
	adc a,(hl)			;8ed0	8e 	. 
	adc a,h			;8ed1	8c 	. 
	adc a,d			;8ed2	8a 	. 
	adc a,d			;8ed3	8a 	. 
	jr nz,$+34		;8ed4	20 20 	    
	jr nz,$+34		;8ed6	20 20 	    
	jr nz,$+34		;8ed8	20 20 	    
	jr nz,$+34		;8eda	20 20 	    
	jr nz,$+34		;8edc	20 20 	    
	jr nz,$+34		;8ede	20 20 	    
	jr nz,$+34		;8ee0	20 20 	    
	jr nz,$+34		;8ee2	20 20 	    
	jr nz,$+34		;8ee4	20 20 	    
	adc a,(hl)			;8ee6	8e 	. 
	adc a,h			;8ee7	8c 	. 
	adc a,h			;8ee8	8c 	. 
	adc a,h			;8ee9	8c 	. 
	adc a,(hl)			;8eea	8e 	. 
	add a,(hl)			;8eeb	86 	. 
	adc a,(hl)			;8eec	8e 	. 
	add a,(hl)			;8eed	86 	. 
	add a,d			;8eee	82 	. 
	adc a,(hl)			;8eef	8e 	. 
	adc a,h			;8ef0	8c 	. 
	adc a,h			;8ef1	8c 	. 
	adc a,h			;8ef2	8c 	. 
	adc a,d			;8ef3	8a 	. 
	jr nz,$+34		;8ef4	20 20 	    
	jr nz,$+34		;8ef6	20 20 	    
	jr nz,$+34		;8ef8	20 20 	    
	jr nz,$+34		;8efa	20 20 	    
	jr nz,$+34		;8efc	20 20 	    
	jr nz,$+34		;8efe	20 20 	    
	jr nz,$+34		;8f00	20 20 	    
	jr nz,$+34		;8f02	20 20 	    
	jr nz,$+34		;8f04	20 20 	    
	adc a,d			;8f06	8a 	. 
	adc a,e			;8f07	8b 	. 
	jr nz,$-114		;8f08	20 8c 	  . 
	adc a,h			;8f0a	8c 	. 
	adc a,l			;8f0b	8d 	. 
	adc a,l			;8f0c	8d 	. 
	add a,d			;8f0d	82 	. 
	add a,(hl)			;8f0e	86 	. 
	add a,l			;8f0f	85 	. 
	add a,d			;8f10	82 	. 
	add a,d			;8f11	82 	. 
	add a,h			;8f12	84 	. 
	adc a,d			;8f13	8a 	. 
	jr nz,$+34		;8f14	20 20 	    
	jr nz,$+34		;8f16	20 20 	    
	ld de,02001h		;8f18	11 01 20 	. .   
	ld c,c			;8f1b	49 	I 
	ld l,(hl)			;8f1c	6e 	n 
	dec l			;8f1d	2d 	- 
	ld h,a			;8f1e	67 	g 
	ld h,c			;8f1f	61 	a 
	ld l,l			;8f20	6d 	m 
	ld h,l			;8f21	65 	e 
	ld a,(01120h)		;8f22	3a 20 11 	:   . 
	nop			;8f25	00 	. 
	jr nz,$+34		;8f26	20 20 	    
	jr nz,$+34		;8f28	20 20 	    
	adc a,e			;8f2a	8b 	. 
	add a,e			;8f2b	83 	. 
	add a,(hl)			;8f2c	86 	. 
	add a,(hl)			;8f2d	86 	. 
	adc a,h			;8f2e	8c 	. 
	adc a,a			;8f2f	8f 	. 
	adc a,b			;8f30	88 	. 
	adc a,c			;8f31	89 	. 
	adc a,h			;8f32	8c 	. 
	add a,d			;8f33	82 	. 
	add a,h			;8f34	84 	. 
	adc a,d			;8f35	8a 	. 
	adc a,(hl)			;8f36	8e 	. 
	adc a,d			;8f37	8a 	. 
	jr nz,$+34		;8f38	20 20 	    
	jr nz,$+69		;8f3a	20 43 	  C 
	ld d,e			;8f3c	53 	S 
	dec hl			;8f3d	2b 	+ 
	ld d,b			;8f3e	50 	P 
	jr nz,$+60		;8f3f	20 3a 	  : 
	jr nz,$+114		;8f41	20 70 	  p 
	ld h,c			;8f43	61 	a 
	ld (hl),l			;8f44	75 	u 
	ld (hl),e			;8f45	73 	s 
	ld h,l			;8f46	65 	e 
	jr nz,$+34		;8f47	20 20 	    
	jr nz,$-116		;8f49	20 8a 	  . 
	add a,e			;8f4b	83 	. 
	adc a,b			;8f4c	88 	. 
	adc a,h			;8f4d	8c 	. 
	adc a,a			;8f4e	8f 	. 
	add a,h			;8f4f	84 	. 
	adc a,(hl)			;8f50	8e 	. 
	adc a,e			;8f51	8b 	. 
	jr nz,$-112		;8f52	20 8e 	  . 
	adc a,c			;8f54	89 	. 
	add a,c			;8f55	81 	. 
	add a,(hl)			;8f56	86 	. 
	adc a,d			;8f57	8a 	. 
	jr nz,$+34		;8f58	20 20 	    
	jr nz,$+69		;8f5a	20 43 	  C 
	ld d,e			;8f5c	53 	S 
	dec hl			;8f5d	2b 	+ 
	ld d,e			;8f5e	53 	S 
	jr nz,$+60		;8f5f	20 3a 	  : 
	jr nz,$+117		;8f61	20 73 	  s 
	ld (hl),b			;8f63	70 	p 
	ld h,l			;8f64	65 	e 
	ld h,l			;8f65	65 	e 
	ld h,h			;8f66	64 	d 
	jr nz,$+34		;8f67	20 20 	    
	jr nz,$-116		;8f69	20 8a 	  . 
	adc a,l			;8f6b	8d 	. 
	add a,c			;8f6c	81 	. 
	add a,(hl)			;8f6d	86 	. 
	add a,a			;8f6e	87 	. 
	add a,h			;8f6f	84 	. 
	add a,h			;8f70	84 	. 
	adc a,h			;8f71	8c 	. 
	add a,c			;8f72	81 	. 
	add a,l			;8f73	85 	. 
	jr nz,$-125		;8f74	20 81 	  . 
	add a,h			;8f76	84 	. 
	adc a,d			;8f77	8a 	. 
	jr nz,$+34		;8f78	20 20 	    
	jr nz,$+34		;8f7a	20 20 	    
	jr nz,$+34		;8f7c	20 20 	    
	jr nz,$+34		;8f7e	20 20 	    
	jr nz,$+34		;8f80	20 20 	    
	jr nz,$+34		;8f82	20 20 	    
	jr nz,$+34		;8f84	20 20 	    
	jr nz,$+34		;8f86	20 20 	    
	jr nz,$+34		;8f88	20 20 	    
	adc a,(hl)			;8f8a	8e 	. 
	adc a,(hl)			;8f8b	8e 	. 
	adc a,l			;8f8c	8d 	. 
	adc a,(hl)			;8f8d	8e 	. 
	adc a,c			;8f8e	89 	. 
	adc a,(hl)			;8f8f	8e 	. 
	add a,e			;8f90	83 	. 
	add a,(hl)			;8f91	86 	. 
	jr nz,$-114		;8f92	20 8c 	  . 
	adc a,b			;8f94	88 	. 
	adc a,b			;8f95	88 	. 
	adc a,(hl)			;8f96	8e 	. 
	adc a,d			;8f97	8a 	. 
	jr nz,$+34		;8f98	20 20 	    
	jr nz,$+34		;8f9a	20 20 	    
	jr nz,$+34		;8f9c	20 20 	    
	jr nz,$+34		;8f9e	20 20 	    
	jr nz,$+34		;8fa0	20 20 	    
	jr nz,$+34		;8fa2	20 20 	    
	jr nz,$+34		;8fa4	20 20 	    
	jr nz,$+34		;8fa6	20 20 	    
	jr nz,$+34		;8fa8	20 20 	    
	adc a,d			;8faa	8a 	. 
	adc a,h			;8fab	8c 	. 
	adc a,h			;8fac	8c 	. 
	adc a,b			;8fad	88 	. 
	adc a,d			;8fae	8a 	. 
	adc a,e			;8faf	8b 	. 
	adc a,c			;8fb0	89 	. 
	adc a,e			;8fb1	8b 	. 
	add a,d			;8fb2	82 	. 
	adc a,(hl)			;8fb3	8e 	. 
	adc a,d			;8fb4	8a 	. 
	add a,a			;8fb5	87 	. 
	add a,d			;8fb6	82 	. 
	adc a,d			;8fb7	8a 	. 
	jr nz,$+34		;8fb8	20 20 	    
	jr nz,$+34		;8fba	20 20 	    
	jr nz,$+34		;8fbc	20 20 	    
	jr nz,$+34		;8fbe	20 20 	    
	jr nz,$+34		;8fc0	20 20 	    
	jr nz,$+34		;8fc2	20 20 	    
	jr nz,$+34		;8fc4	20 20 	    
	jr nz,$+34		;8fc6	20 20 	    
	jr nz,$+34		;8fc8	20 20 	    
	adc a,d			;8fca	8a 	. 
	adc a,d			;8fcb	8a 	. 
	jr nz,$-116		;8fcc	20 8a 	  . 
	adc a,d			;8fce	8a 	. 
	add a,(hl)			;8fcf	86 	. 
	adc a,(hl)			;8fd0	8e 	. 
	adc a,b			;8fd1	88 	. 
	adc a,h			;8fd2	8c 	. 
	jr nz,$-122		;8fd3	20 84 	  . 
	add a,l			;8fd5	85 	. 
	jr nz,$-116		;8fd6	20 8a 	  . 
	jr nz,$+52		;8fd8	20 32 	  2 
	jr nc,$+52		;8fda	30 32 	0 2 
	inc (hl)			;8fdc	34 	4 
	jr nz,$+66		;8fdd	20 40 	  @ 
	ld (hl),h			;8fdf	74 	t 
	ld l,b			;8fe0	68 	h 
	ld h,l			;8fe1	65 	e 
	ld h,c			;8fe2	61 	a 
	ld l,h			;8fe3	6c 	l 
	ld h,(hl)			;8fe4	66 	f 
	ld h,l			;8fe5	65 	e 
	ld (hl),e			;8fe6	73 	s 
	ld (hl),h			;8fe7	74 	t 
	jr nz,$+34		;8fe8	20 20 	    
	adc a,d			;8fea	8a 	. 
	adc a,(hl)			;8feb	8e 	. 
	adc a,h			;8fec	8c 	. 
	adc a,d			;8fed	8a 	. 
	adc a,a			;8fee	8f 	. 
	adc a,l			;8fef	8d 	. 
	adc a,(hl)			;8ff0	8e 	. 
	adc a,d			;8ff1	8a 	. 
	adc a,(hl)			;8ff2	8e 	. 
	adc a,e			;8ff3	8b 	. 
	add a,h			;8ff4	84 	. 
	add a,c			;8ff5	81 	. 
	jr nz,$-116		;8ff6	20 8a 	  . 
	jr nz,$+79		;8ff8	20 4d 	  M 
	ld h,c			;8ffa	61 	a 
	ld h,h			;8ffb	64 	d 
	ld h,l			;8ffc	65 	e 
	jr nz,$+107		;8ffd	20 69 	  i 
	ld l,(hl)			;8fff	6e 	n 
	jr nz,$+87		;9000	20 55 	  U 
	ld l,e			;9002	6b 	k 
	ld (hl),d			;9003	72 	r 
	ld h,c			;9004	61 	a 
	ld l,c			;9005	69 	i 
	ld l,(hl)			;9006	6e 	n 
	ld h,l			;9007	65 	e 
	jr nz,$-123		;9008	20 83 	  . 
	adc a,(hl)			;900a	8e 	. 
	adc a,h			;900b	8c 	. 
	adc a,h			;900c	8c 	. 
	adc a,h			;900d	8c 	. 
	adc a,(hl)			;900e	8e 	. 
	adc a,a			;900f	8f 	. 
	adc a,a			;9010	8f 	. 
	adc a,h			;9011	8c 	. 
	adc a,(hl)			;9012	8e 	. 
	adc a,a			;9013	8f 	. 
	adc a,l			;9014	8d 	. 
	adc a,l			;9015	8d 	. 
	adc a,(hl)			;9016	8e 	. 
	adc a,d			;9017	8a 	. 
	jr nz,$+34		;9018	20 20 	    
	jr nz,$+34		;901a	20 20 	    
	jr nz,$+34		;901c	20 20 	    
	jr nz,$+34		;901e	20 20 	    
	jr nz,$+34		;9020	20 20 	    
	jr nz,$+34		;9022	20 20 	    
	jr nz,$+34		;9024	20 20 	    
	jr nz,$+34		;9026	20 20 	    
	jr nz,$+34		;9028	20 20 	    
	jr nz,$+34		;902a	20 20 	    
	jr nz,$+34		;902c	20 20 	    
	jr nz,$+34		;902e	20 20 	    
	jr nz,$+34		;9030	20 20 	    
	jr nz,$+34		;9032	20 20 	    
	jr nz,$+34		;9034	20 20 	    
	jr nz,$+34		;9036	20 20 	    
	jr nz,$+34		;9038	20 20 	    
	jr nz,$+34		;903a	20 20 	    
	jr nz,$+34		;903c	20 20 	    
	jr nz,$+34		;903e	20 20 	    
	jr nz,$+34		;9040	20 20 	    
	jr nz,$+34		;9042	20 20 	    
	jr nz,$+34		;9044	20 20 	    
	jr nz,$+34		;9046	20 20 	    
	jr nz,$+34		;9048	20 20 	    
	jr nz,$+34		;904a	20 20 	    
	jr nz,$+82		;904c	20 50 	  P 
	ld d,d			;904e	52 	R 
	ld b,l			;904f	45 	E 
	ld d,e			;9050	53 	S 
	ld d,e			;9051	53 	S 
	jr nz,$+67		;9052	20 41 	  A 
	ld c,(hl)			;9054	4e 	N 
	ld e,c			;9055	59 	Y 
	jr nz,$+77		;9056	20 4b 	  K 
	ld b,l			;9058	45 	E 
	ld e,c			;9059	59 	Y 
	jr nz,$+86		;905a	20 54 	  T 
	ld c,a			;905c	4f 	O 
	jr nz,$+69		;905d	20 43 	  C 
	ld c,a			;905f	4f 	O 
	ld c,(hl)			;9060	4e 	N 
	ld d,h			;9061	54 	T 
	ld c,c			;9062	49 	I 
	ld c,(hl)			;9063	4e 	N 
	ld d,l			;9064	55 	U 
	ld b,l			;9065	45 	E 
	jr nz,$+34		;9066	20 20 	    
	jr nz,$+34		;9068	20 20 	    
	pop bc			;906a	c1 	. 
	xor a			;906b	af 	. 
	out (0feh),a		;906c	d3 fe 	. . 
	ld hl,0ef78h		;906e	21 78 ef 	! x . 
	ld (0fff5h),hl		;9071	22 f5 ff 	" . . 
	ld hl,04000h		;9074	21 00 40 	! . @ 
	ld de,00100h		;9077	11 00 01 	. . . 
	ld b,a			;907a	47 	G 
	call 0d311h		;907b	cd 11 d3 	. . . 
	ld b,080h		;907e	06 80 	. . 
	call 0d30eh		;9080	cd 0e d3 	. . . 
	ld b,030h		;9083	06 30 	. 0 
	ld a,006h		;9085	3e 06 	> . 
	call 0d30eh		;9087	cd 0e d3 	. . . 
	ld hl,063b5h		;908a	21 b5 63 	! . c 
	ld de,04007h		;908d	11 07 40 	. . @ 
	call 0d06bh		;9090	cd 6b d0 	. k . 
	ld a,(0f8fbh)		;9093	3a fb f8 	: . . 
	push af			;9096	f5 	. 
	add a,030h		;9097	c6 30 	. 0 
	ld (063cfh),a		;9099	32 cf 63 	2 . c 
	ld e,04ch		;909c	1e 4c 	. L 
	call 0d06bh		;909e	cd 6b d0 	. k . 
	ld e,087h		;90a1	1e 87 	. . 
	ld hl,06430h		;90a3	21 30 64 	! 0 d 
	call 0d06bh		;90a6	cd 6b d0 	. k . 
	pop af			;90a9	f1 	. 
	add a,a			;90aa	87 	. 
	add a,0a1h		;90ab	c6 a1 	. . 
	ld (05cb7h),a		;90ad	32 b7 5c 	2 . \ 
	ld hl,(063a1h)		;90b0	2a a1 63 	* . c 
	ld c,005h		;90b3	0e 05 	. . 
	call 0d06dh		;90b5	cd 6d d0 	. m . 
	ld de,0fb0ah		;90b8	11 0a fb 	. . . 
	ld c,003h		;90bb	0e 03 	. . 
	ldir		;90bd	ed b0 	. . 
	ld de,040a1h		;90bf	11 a1 40 	. . @ 
	ld c,01eh		;90c2	0e 1e 	. . 
	call 0d06dh		;90c4	cd 6d d0 	. m . 
	ld de,06449h		;90c7	11 49 64 	. I d 
	ldi		;90ca	ed a0 	. . 
	ldi		;90cc	ed a0 	. . 
	ld a,(hl)			;90ce	7e 	~ 
	inc hl			;90cf	23 	# 
	ld d,(hl)			;90d0	56 	V 
	ld ixl,d		;90d1	dd 6a 	. j 
	ld (0f8f8h),a		;90d3	32 f8 f8 	2 . . 
	or a			;90d6	b7 	. 
	ld de,04800h		;90d7	11 00 48 	. . H 
	jr z,$+8		;90da	28 06 	( . 
	ld hl,06440h		;90dc	21 40 64 	! @ d 
	call 0d06bh		;90df	cd 6b d0 	. k . 
	ld a,ixl		;90e2	dd 7d 	. } 
	or 0feh		;90e4	f6 fe 	. . 
	ld (0f8f3h),a		;90e6	32 f3 f8 	2 . . 
	inc a			;90e9	3c 	< 
	jr nz,$+12		;90ea	20 0a 	  . 
	ld hl,06499h		;90ec	21 99 64 	! . d 
	ld e,080h		;90ef	1e 80 	. . 
	call 0d06bh		;90f1	cd 6b d0 	. k . 
	ld a,001h		;90f4	3e 01 	> . 
	ld (0c101h),a		;90f6	32 01 c1 	2 . . 
	ld a,ixl		;90f9	dd 7d 	. } 
	rra			;90fb	1f 	. 
	and 001h		;90fc	e6 01 	. . 
	ld (0f8fch),a		;90fe	32 fc f8 	2 . . 
	or a			;9101	b7 	. 
	jr z,$+10		;9102	28 08 	( . 
	ld hl,06460h		;9104	21 60 64 	! ` d 
	ld e,021h		;9107	1e 21 	. ! 
	call 0d06bh		;9109	cd 6b d0 	. k . 
	ld a,ixl		;910c	dd 7d 	. } 
	rlca			;910e	07 	. 
	sbc a,a			;910f	9f 	. 
	jr nz,$+4		;9110	20 02 	  . 
	ld a,0eeh		;9112	3e ee 	> . 
	ld (0c7f1h),a		;9114	32 f1 c7 	2 . . 
	inc a			;9117	3c 	< 
	jr z,$+10		;9118	28 08 	( . 
	ld hl,0647fh		;911a	21 7f 64 	!  d 
	ld e,043h		;911d	1e 43 	. C 
	call 0d06bh		;911f	cd 6b d0 	. k . 
	ld hl,063d0h		;9122	21 d0 63 	! . c 
	ld de,040e7h		;9125	11 e7 40 	. . @ 
	call 0d06bh		;9128	cd 6b d0 	. k . 
	ld de,04860h		;912b	11 60 48 	. ` H 
	call 0d06bh		;912e	cd 6b d0 	. k . 
	ld de,040a0h		;9131	11 a0 40 	. . @ 
	inc c			;9134	0c 	. 
	call 0d06dh		;9135	cd 6d d0 	. m . 
	inc c			;9138	0c 	. 
	ld e,0bfh		;9139	1e bf 	. . 
	call 0d06dh		;913b	cd 6d d0 	. m . 
	ld de,05003h		;913e	11 03 50 	. . P 
	call 0d06bh		;9141	cd 6b d0 	. k . 
	ld e,048h		;9144	1e 48 	. H 
	call 0d06bh		;9146	cd 6b d0 	. k . 
	ld hl,06210h		;9149	21 10 62 	! . b 
	ld e,0e3h		;914c	1e e3 	. . 
	ld c,019h		;914e	0e 19 	. . 
	call 0d06eh		;9150	cd 6e d0 	. n . 
	ld hl,058e0h		;9153	21 e0 58 	! . X 
	ld a,002h		;9156	3e 02 	> . 
	ld b,010h		;9158	06 10 	. . 
	call 0d30eh		;915a	cd 0e d3 	. . . 
	ld h,05ah		;915d	26 5a 	& Z 
	ld a,004h		;915f	3e 04 	> . 
	ld b,002h		;9161	06 02 	. . 
	call 0d30eh		;9163	cd 0e d3 	. . . 
	ld hl,00505h		;9166	21 05 05 	! . . 
	ld (05908h),hl		;9169	22 08 59 	" . Y 
	call 0dff9h		;916c	cd f9 df 	. . . 
	ld b,014h		;916f	06 14 	. . 
	call 0d03ah		;9171	cd 3a d0 	. : . 
	and a			;9174	a7 	. 
	jr z,$+5		;9175	28 03 	( . 
	halt			;9177	76 	v 
	djnz $-7		;9178	10 f7 	. . 
	ld hl,05ba6h		;917a	21 a6 5b 	! . [ 
	ld bc,0e0e0h		;917d	01 e0 e0 	. . . 
	push bc			;9180	c5 	. 
	push bc			;9181	c5 	. 
	ld e,(hl)			;9182	5e 	^ 
	inc hl			;9183	23 	# 
	ld d,(hl)			;9184	56 	V 
	inc hl			;9185	23 	# 
	push hl			;9186	e5 	. 
	ex de,hl			;9187	eb 	. 
	ld e,005h		;9188	1e 05 	. . 
	xor a			;918a	af 	. 
	add hl,hl			;918b	29 	) 
	rla			;918c	17 	. 
	add hl,hl			;918d	29 	) 
	rla			;918e	17 	. 
	add hl,hl			;918f	29 	) 
	rla			;9190	17 	. 
	ld (bc),a			;9191	02 	. 
	inc bc			;9192	03 	. 
	dec e			;9193	1d 	. 
	jr nz,$-10		;9194	20 f4 	  . 
	pop hl			;9196	e1 	. 
	ld a,0e8h		;9197	3e e8 	> . 
	cp l			;9199	bd 	. 
	jr nz,$-24		;919a	20 e6 	  . 
	ld a,021h		;919c	3e 21 	> ! 
	pop hl			;919e	e1 	. 
	ld de,0a51fh		;919f	11 1f a5 	. . . 
	ld b,000h		;91a2	06 00 	. . 
	ld c,005h		;91a4	0e 05 	. . 
	ldir		;91a6	ed b0 	. . 
	inc de			;91a8	13 	. 
	inc de			;91a9	13 	. 
	inc de			;91aa	13 	. 
	inc de			;91ab	13 	. 
	dec a			;91ac	3d 	= 
	jr nz,$-9		;91ad	20 f5 	  . 
	ld hl,0661ah		;91af	21 1a 66 	! . f 
	pop de			;91b2	d1 	. 
	push de			;91b3	d5 	. 
	call 094d0h		;91b4	cd d0 94 	. . . 
	ld hl,05040h		;91b7	21 40 50 	! @ P 
	ld de,05a40h		;91ba	11 40 5a 	. @ Z 
	exx			;91bd	d9 	. 
	pop de			;91be	d1 	. 
	ld a,(de)			;91bf	1a 	. 
	inc de			;91c0	13 	. 
	ld l,a			;91c1	6f 	o 
	inc a			;91c2	3c 	< 
	jp z,0bfe5h		;91c3	ca e5 bf 	. . . 
	ld h,05eh		;91c6	26 5e 	& ^ 
	ld c,(hl)			;91c8	4e 	N 
	inc h			;91c9	24 	$ 
	ld h,(hl)			;91ca	66 	f 
	ld l,c			;91cb	69 	i 
	ld bc,036bfh		;91cc	01 bf 36 	. . 6 
	add hl,bc			;91cf	09 	. 
	ld c,001h		;91d0	0e 01 	. . 
	cp 011h		;91d2	fe 11 	. . 
	jr c,$+5		;91d4	38 03 	8 . 
	ld a,(de)			;91d6	1a 	. 
	ld c,a			;91d7	4f 	O 
	inc de			;91d8	13 	. 
	push hl			;91d9	e5 	. 
	exx			;91da	d9 	. 
	push hl			;91db	e5 	. 
	ld b,008h		;91dc	06 08 	. . 
	exx			;91de	d9 	. 
	ld a,(hl)			;91df	7e 	~ 
	inc hl			;91e0	23 	# 
	exx			;91e1	d9 	. 
	ld (hl),a			;91e2	77 	w 
	inc h			;91e3	24 	$ 
	djnz $-6		;91e4	10 f8 	. . 
	pop hl			;91e6	e1 	. 
	inc hl			;91e7	23 	# 
	exx			;91e8	d9 	. 
	ld a,(hl)			;91e9	7e 	~ 
	exx			;91ea	d9 	. 
	ld (de),a			;91eb	12 	. 
	inc de			;91ec	13 	. 
	exx			;91ed	d9 	. 
	pop hl			;91ee	e1 	. 
	dec c			;91ef	0d 	. 
	jr nz,$-23		;91f0	20 e7 	  . 
	jr $-51		;91f2	18 cb 	. . 
	ld a,d			;91f4	7a 	z 
	nop			;91f5	00 	. 
	ld a,(bc)			;91f6	0a 	. 
	add hl,de			;91f7	19 	. 
	ei			;91f8	fb 	. 
	inc de			;91f9	13 	. 
	jr z,$+9		;91fa	28 07 	( . 
	and d			;91fc	a2 	. 
	ld b,08ah		;91fd	06 8a 	. . 
	inc b			;91ff	04 	. 
	rlca			;9200	07 	. 
	jr z,$+16		;9201	28 0e 	( . 
	and a			;9203	a7 	. 
	jr $+0		;9204	18 fe 	. . 
	jp z,0a2f4h		;9206	ca f4 a2 	. . . 
	ld a,(de)			;9209	1a 	. 
	inc d			;920a	14 	. 
	rla			;920b	17 	. 
	adc a,b			;920c	88 	. 
	inc d			;920d	14 	. 
	rrca			;920e	0f 	. 
	and b			;920f	a0 	. 
	ld de,0098ah		;9210	11 8a 09 	. . . 
	inc c			;9213	0c 	. 
	ex (sp),hl			;9214	e3 	. 
	dec b			;9215	05 	. 
	ei			;9216	fb 	. 
	inc d			;9217	14 	. 
	inc e			;9218	1c 	. 
	adc a,e			;9219	8b 	. 
	or d			;921a	b2 	. 
	ld a,(bc)			;921b	0a 	. 
	and d			;921c	a2 	. 
	cp a			;921d	bf 	. 
	inc c			;921e	0c 	. 
	xor e			;921f	ab 	. 
	inc bc			;9220	03 	. 
	ld b,0a2h		;9221	06 a2 	. . 
	ei			;9223	fb 	. 
	add hl,de			;9224	19 	. 
	ret m			;9225	f8 	. 
	dec de			;9226	1b 	. 
	xor 0e9h		;9227	ee e9 	. . 
	ex af,af'			;9229	08 	. 
	ld a,(de)			;922a	1a 	. 
	jp (hl)			;922b	e9 	. 
	jr $-3		;922c	18 fb 	. . 
	xor l			;922e	ad 	. 
	call p,0fa82h		;922f	f4 82 fa 	. . . 
	adc a,d			;9232	8a 	. 
	rla			;9233	17 	. 
	ld d,028h		;9234	16 28 	. ( 
	inc d			;9236	14 	. 
	ld a,a			;9237	7f 	 
	cp a			;9238	bf 	. 
	ex (sp),hl			;9239	e3 	. 
	and b			;923a	a0 	. 
	sub l			;923b	95 	. 
	dec e			;923c	1d 	. 
	cp a			;923d	bf 	. 
	inc c			;923e	0c 	. 
	ei			;923f	fb 	. 
	rla			;9240	17 	. 
	and b			;9241	a0 	. 
	pop de			;9242	d1 	. 
	inc de			;9243	13 	. 
	adc a,(hl)			;9244	8e 	. 
	ld bc,05f11h		;9245	01 11 5f 	. . _ 
	and d			;9248	a2 	. 
	rra			;9249	1f 	. 
	dec c			;924a	0d 	. 
	ld (bc),a			;924b	02 	. 
	jr c,$-3		;924c	38 fb 	8 . 
	adc a,d			;924e	8a 	. 
	rrca			;924f	0f 	. 
	dec b			;9250	05 	. 
	inc b			;9251	04 	. 
	ld e,e			;9252	5b 	[ 
	djnz $-47		;9253	10 cf 	. . 
	call p,0ba22h		;9255	f4 22 ba 	. " . 
	dec bc			;9258	0b 	. 
	inc e			;9259	1c 	. 
	jp m,0fa09h		;925a	fa 09 fa 	. . . 
	dec bc			;925d	0b 	. 
	jp c,008ffh		;925e	da ff 08 	. . . 
	ld a,l			;9261	7d 	} 
	call p,00dbah		;9262	f4 ba 0d 	. . . 
	rst 28h			;9265	ef 	. 
	ld de,00f28h		;9266	11 28 0f 	. ( . 
	ld l,l			;9269	6d 	m 
	djnz $-118		;926a	10 88 	. . 
	ret z			;926c	c8 	. 
	adc a,(hl)			;926d	8e 	. 
	djnz $+66		;926e	10 40 	. @ 
	ei			;9270	fb 	. 
	sub h			;9271	94 	. 
	add hl,bc			;9272	09 	. 
	cp l			;9273	bd 	. 
	dec c			;9274	0d 	. 
	sub 0afh		;9275	d6 af 	. . 
	ld c,0a1h		;9277	0e a1 	. . 
	ret c			;9279	d8 	. 
	call p,00d6ah		;927a	f4 6a 0d 	. j . 
	ld b,c			;927d	41 	A 
	inc de			;927e	13 	. 
	ld (de),a			;927f	12 	. 
	ld b,c			;9280	41 	A 
	jr $-28		;9281	18 e2 	. . 
	ld (hl),a			;9283	77 	w 
	ld bc,0b601h		;9284	01 01 b6 	. . . 
	ld bc,08e69h		;9287	01 69 8e 	. i . 
	ld bc,028f4h		;928a	01 f4 28 	. . ( 
	inc e			;928d	1c 	. 
	and d			;928e	a2 	. 
	dec de			;928f	1b 	. 
	ret pe			;9290	e8 	. 
	jr $-33		;9291	18 dd 	. . 
	dec d			;9293	15 	. 
	ld (08dcdh),a		;9294	32 cd 8d 	2 . . 
	ld bc,05655h		;9297	01 55 56 	. U V 
	inc d			;929a	14 	. 
	cp 0f6h		;929b	fe f6 	. . 
	rst 38h			;929d	ff 	. 
	sub 0abh		;929e	d6 ab 	. . 
	xor d			;92a0	aa 	. 
	cp 014h		;92a1	fe 14 	. . 
	ld h,068h		;92a3	26 68 	& h 
	ld c,c			;92a5	49 	I 
	or (hl)			;92a6	b6 	. 
	jr nc,$+0		;92a7	30 fe 	0 . 
	xor b			;92a9	a8 	. 
	or (hl)			;92aa	b6 	. 
	pop de			;92ab	d1 	. 
	and (hl)			;92ac	a6 	. 
	cp a			;92ad	bf 	. 
	add a,0b6h		;92ae	c6 b6 	. . 
	or (hl)			;92b0	b6 	. 
	jr z,$+22		;92b1	28 14 	( . 
	xor c			;92b3	a9 	. 
	inc h			;92b4	24 	$ 
	ld c,c			;92b5	49 	I 
	ld (hl),h			;92b6	74 	t 
	ld c,c			;92b7	49 	I 
	ld (hl),h			;92b8	74 	t 
	jp (hl)			;92b9	e9 	. 
	ld (hl),0dbh		;92ba	36 db 	6 . 
	ld (hl),049h		;92bc	36 49 	6 I 
	ld l,h			;92be	6c 	l 
	daa			;92bf	27 	' 
	ld d,(hl)			;92c0	56 	V 
	dec h			;92c1	25 	% 
	ld a,(hl)			;92c2	7e 	~ 
	xor c			;92c3	a9 	. 
	sbc a,h			;92c4	9c 	. 
	ret p			;92c5	f0 	. 
	xor b			;92c6	a8 	. 
	add a,a			;92c7	87 	. 
	halt			;92c8	76 	v 
	sub 0ech		;92c9	d6 ec 	. . 
	ld d,(hl)			;92cb	56 	V 
	call nz,0b6dfh		;92cc	c4 df b6 	. . . 
	ld d,c			;92cf	51 	Q 
	ld h,0dfh		;92d0	26 df 	& . 
	jp po,0b6f7h		;92d2	e2 f7 b6 	. . . 
	pop de			;92d5	d1 	. 
	jp pe,042d7h		;92d6	ea d7 42 	. . B 
	jp (hl)			;92d9	e9 	. 
	ld l,b			;92da	68 	h 
	in a,(04fh)		;92db	db 4f 	. O 
	ld c,h			;92dd	4c 	L 
	ld c,a			;92de	4f 	O 
	ld c,(hl)			;92df	4e 	N 
	ld b,l			;92e0	45 	E 
	ld c,h			;92e1	4c 	L 
	jr nz,$+68		;92e2	20 42 	  B 
	ld d,d			;92e4	52 	R 
	ld c,c			;92e5	49 	I 
	ld b,a			;92e6	47 	G 
	ld b,a			;92e7	47 	G 
	ld d,e			;92e8	53 	S 
	ld e,c			;92e9	59 	Y 
	jr nz,$+34		;92ea	20 20 	    
	ld b,l			;92ec	45 	E 
	ld e,b			;92ed	58 	X 
	ld d,b			;92ee	50 	P 
	ld c,h			;92ef	4c 	L 
	ld c,a			;92f0	4f 	O 
	ld d,d			;92f1	52 	R 
	ld b,l			;92f2	45 	E 
	ld d,d			;92f3	52 	R 
	call 098f1h		;92f4	cd f1 98 	. . . 
	jp 0dcd0h		;92f7	c3 d0 dc 	. . . 
	add a,b			;92fa	80 	. 
	nop			;92fb	00 	. 
	ld d,003h		;92fc	16 03 	. . 
	ld c,e			;92fe	4b 	K 
	ld ix,(06a5eh)		;92ff	dd 2a 5e 6a 	. * ^ j 
	ld c,c			;9303	49 	I 
	dec hl			;9304	2b 	+ 
	ld d,d			;9305	52 	R 
	and d			;9306	a2 	. 
	ret m			;9307	f8 	. 
	ld d,b			;9308	50 	P 
	ld a,d			;9309	7a 	z 
	sbc a,d			;930a	9a 	. 
	ex de,hl			;930b	eb 	. 
	sub 05ah		;930c	d6 5a 	. Z 
	jr nz,$+44		;930e	20 2a 	  * 
	jp nc,04b8fh		;9310	d2 8f 4b 	. . K 
	ret			;9313	c9 	. 
	pop de			;9314	d1 	. 
	in a,(0b8h)		;9315	db b8 	. . 
	rrca			;9317	0f 	. 
	or l			;9318	b5 	. 
	cp 055h		;9319	fe 55 	. U 
	ld e,b			;931b	58 	X 
	sbc a,(hl)			;931c	9e 	. 
	nop			;931d	00 	. 
	ld sp,hl			;931e	f9 	. 
	add a,h			;931f	84 	. 
	add a,b			;9320	80 	. 
	and l			;9321	a5 	. 
	ld bc,0038eh		;9322	01 8e 03 	. . . 
	ret nz			;9325	c0 	. 
	jp (hl)			;9326	e9 	. 
	ld (0f07fh),hl		;9327	22 7f f0 	"  . 
	inc h			;932a	24 	$ 
	rrca			;932b	0f 	. 
	cp 0fch		;932c	fe fc 	. . 
	exx			;932e	d9 	. 
	ret m			;932f	f8 	. 
	and b			;9330	a0 	. 
	nop			;9331	00 	. 
	inc a			;9332	3c 	< 
	cp 024h		;9333	fe 24 	. $ 
	and l			;9335	a5 	. 
	ld (hl),l			;9336	75 	u 
	ld d,(hl)			;9337	56 	V 
	ld d,l			;9338	55 	U 
	jp nc,05545h		;9339	d2 45 55 	. E U 
	and a			;933c	a7 	. 
	ld a,(de)			;933d	1a 	. 
	ld (hl),a			;933e	77 	w 
	ld d,(hl)			;933f	56 	V 
	ld e,c			;9340	59 	Y 
	sbc a,(hl)			;9341	9e 	. 
	dec d			;9342	15 	. 
	ld d,l			;9343	55 	U 
	ld d,075h		;9344	16 75 	. u 
	dec h			;9346	25 	% 
	jp po,0c6e1h		;9347	e2 e1 c6 	. . . 
	ld (00745h),hl		;934a	22 45 07 	" E . 
	ld a,047h		;934d	3e 47 	> G 
	dec b			;934f	05 	. 
	ld (hl),e			;9350	73 	s 
	cp 0d5h		;9351	fe d5 	. . 
	ld d,l			;9353	55 	U 
	ld h,b			;9354	60 	` 
	cp h			;9355	bc 	. 
	nop			;9356	00 	. 
	call m,0e00ah		;9357	fc 0a e0 	. . . 
	adc a,d			;935a	8a 	. 
	ret nz			;935b	c0 	. 
	inc bc			;935c	03 	. 
	ld l,(hl)			;935d	6e 	n 
	ld bc,00f00h		;935e	01 00 0f 	. . . 
	ld sp,hl			;9361	f9 	. 
	sbc a,d			;9362	9a 	. 
	inc a			;9363	3c 	< 
	ret p			;9364	f0 	. 
	ccf			;9365	3f 	? 
	ex (sp),hl			;9366	e3 	. 
	ld sp,hl			;9367	f9 	. 
	jp (hl)			;9368	e9 	. 
	ex (sp),hl			;9369	e3 	. 
	ld sp,hl			;936a	f9 	. 
	inc a			;936b	3c 	< 
	jp (hl)			;936c	e9 	. 
	ex (sp),hl			;936d	e3 	. 
	nop			;936e	00 	. 
	jp m,0f8c5h		;936f	fa c5 f8 	. . . 
	ld (0603fh),hl		;9372	22 3f 60 	" ? ` 
	ld l,c			;9375	69 	i 
	ld a,h			;9376	7c 	| 
	jr $-126		;9377	18 80 	. . 
	ret po			;9379	e0 	. 
	ld (hl),b			;937a	70 	p 
	rlca			;937b	07 	. 
	nop			;937c	00 	. 
	cp 02ah		;937d	fe 2a 	. * 
	ld b,0beh		;937f	06 be 	. . 
	ld b,a			;9381	47 	G 
	ei			;9382	fb 	. 
	rst 38h			;9383	ff 	. 
	sbc a,l			;9384	9d 	. 
	ld b,055h		;9385	06 55 	. U 
	ld d,(hl)			;9387	56 	V 
	ld a,(bc)			;9388	0a 	. 
	nop			;9389	00 	. 
	inc bc			;938a	03 	. 
	ret nz			;938b	c0 	. 
	nop			;938c	00 	. 
	call po,0f802h		;938d	e4 02 f8 	. . . 
	adc a,(hl)			;9390	8e 	. 
	rrca			;9391	0f 	. 
	ret p			;9392	f0 	. 
	jp (hl)			;9393	e9 	. 
	inc h			;9394	24 	$ 
	dec b			;9395	05 	. 
	ret po			;9396	e0 	. 
	adc a,d			;9397	8a 	. 
	ld bc,0f280h		;9398	01 80 f2 	. . . 
	rst 38h			;939b	ff 	. 
	cp 09bh		;939c	fe 9b 	. . 
	nop			;939e	00 	. 
	jr z,$-118		;939f	28 88 	( . 
	ld sp,hl			;93a1	f9 	. 
	inc d			;93a2	14 	. 
	ld c,b			;93a3	48 	H 
	add a,c			;93a4	81 	. 
	add a,e			;93a5	83 	. 
	ld (de),a			;93a6	12 	. 
	rrca			;93a7	0f 	. 
	rst 38h			;93a8	ff 	. 
	rst 38h			;93a9	ff 	. 
	ret p			;93aa	f0 	. 
	ld a,(bc)			;93ab	0a 	. 
	xor d			;93ac	aa 	. 
	xor d			;93ad	aa 	. 
	or b			;93ae	b0 	. 
	ret po			;93af	e0 	. 
	ret nc			;93b0	d0 	. 
	ld a,(0dd4bh)		;93b1	3a 4b dd 	: K . 
	ld hl,(06a5eh)		;93b4	2a 5e 6a 	* ^ j 
	ld c,c			;93b7	49 	I 
	dec hl			;93b8	2b 	+ 
	ld d,d			;93b9	52 	R 
	ret m			;93ba	f8 	. 
	add hl,hl			;93bb	29 	) 
	ld d,b			;93bc	50 	P 
	ld a,d			;93bd	7a 	z 
	and d			;93be	a2 	. 
	ex de,hl			;93bf	eb 	. 
	sub 05ah		;93c0	d6 5a 	. Z 
	ld hl,(008d2h)		;93c2	2a d2 08 	* . . 
	xor 04bh		;93c5	ee 4b 	. K 
	ret			;93c7	c9 	. 
	pop de			;93c8	d1 	. 
	inc b			;93c9	04 	. 
	cp 0a6h		;93ca	fe a6 	. . 
	jr nc,$-97		;93cc	30 9d 	0 . 
	rrca			;93ce	0f 	. 
	ld d,l			;93cf	55 	U 
	ld d,(hl)			;93d0	56 	V 
	add a,d			;93d1	82 	. 
	nop			;93d2	00 	. 
	jr c,$+9		;93d3	38 07 	8 . 
	ret po			;93d5	e0 	. 
	ld sp,hl			;93d6	f9 	. 
	adc a,b			;93d7	88 	. 
	dec e			;93d8	1d 	. 
	ld a,b			;93d9	78 	x 
	adc a,b			;93da	88 	. 
	ld hl,(088ach)		;93db	2a ac 88 	* . . 
	ld b,b			;93de	40 	@ 
	ld d,088h		;93df	16 88 	. . 
	ld b,e			;93e1	43 	C 
	adc a,d			;93e2	8a 	. 
	adc a,b			;93e3	88 	. 
	inc h			;93e4	24 	$ 
	ld b,(hl)			;93e5	46 	F 
	adc a,b			;93e6	88 	. 
	jr $+44		;93e7	18 2a 	. * 
	sbc a,d			;93e9	9a 	. 
	nop			;93ea	00 	. 
	ld h,04ch		;93eb	26 4c 	& L 
	ld l,b			;93ed	68 	h 
	sub h			;93ee	94 	. 
	adc a,b			;93ef	88 	. 
	ld bc,08828h		;93f0	01 28 88 	. ( . 
	ld (bc),a			;93f3	02 	. 
	ld d,b			;93f4	50 	P 
	adc a,b			;93f5	88 	. 
	inc b			;93f6	04 	. 
	and b			;93f7	a0 	. 
	adc a,b			;93f8	88 	. 
	dec b			;93f9	05 	. 
	ld b,b			;93fa	40 	@ 
	adc a,b			;93fb	88 	. 
	inc b			;93fc	04 	. 
	ret nz			;93fd	c0 	. 
	and a			;93fe	a7 	. 
	rlca			;93ff	07 	. 
	ex (sp),hl			;9400	e3 	. 
	cp 003h		;9401	fe 03 	. . 
	add a,b			;9403	80 	. 
	xor a			;9404	af 	. 
	jp (hl)			;9405	e9 	. 
	ld b,0d0h		;9406	06 d0 	. . 
	ld a,b			;9408	78 	x 
	ret po			;9409	e0 	. 
	jp m,043feh		;940a	fa fe 43 	. . C 
	rla			;940d	17 	. 
	ld d,l			;940e	55 	U 
	ld d,l			;940f	55 	U 
	add a,b			;9410	80 	. 
	add a,l			;9411	85 	. 
	nop			;9412	00 	. 
	ld h,d			;9413	62 	b 
	ld a,a			;9414	7f 	 
	rst 38h			;9415	ff 	. 
	sbc a,(hl)			;9416	9e 	. 
	cp 05fh		;9417	fe 5f 	. _ 
	ld a,a			;9419	7f 	 
	ret m			;941a	f8 	. 
	add a,e			;941b	83 	. 
	rlca			;941c	07 	. 
	rrca			;941d	0f 	. 
	ld c,040h		;941e	0e 40 	. @ 
	and b			;9420	a0 	. 
	pop hl			;9421	e1 	. 
	ld (bc),a			;9422	02 	. 
	push hl			;9423	e5 	. 
	xor b			;9424	a8 	. 
	ld l,(hl)			;9425	6e 	n 
	ld a,(hl)			;9426	7e 	~ 
	cp 083h		;9427	fe 83 	. . 
	ld h,e			;9429	63 	c 
	jr $+101		;942a	18 63 	. c 
	ld h,b			;942c	60 	` 
	cp d			;942d	ba 	. 
	ret m			;942e	f8 	. 
	ex de,hl			;942f	eb 	. 
	jr $-99		;9430	18 9b 	. . 
	ld h,b			;9432	60 	` 
	ld h,b			;9433	60 	` 
	jr $-63		;9434	18 bf 	. . 
	rst 38h			;9436	ff 	. 
	ld a,(hl)			;9437	7e 	~ 
	defb 0fdh,0cdh,0aah	;illegal sequence		;9438	fd cd aa 	. . . 
	rst 38h			;943b	ff 	. 
	ld b,a			;943c	47 	G 
	rlca			;943d	07 	. 
	xor d			;943e	aa 	. 
	ld b,l			;943f	45 	E 
	dec b			;9440	05 	. 
	and a			;9441	a7 	. 
	rrca			;9442	0f 	. 
	ld d,l			;9443	55 	U 
	ld d,l			;9444	55 	U 
	add a,b			;9445	80 	. 
	sub h			;9446	94 	. 
	nop			;9447	00 	. 
	cp d			;9448	ba 	. 
	jr c,$-6		;9449	38 f8 	8 . 
	sbc a,d			;944b	9a 	. 
	ld a,h			;944c	7c 	| 
	ret po			;944d	e0 	. 
	add hl,hl			;944e	29 	) 
	inc bc			;944f	03 	. 
	adc a,(hl)			;9450	8e 	. 
	ld c,0e4h		;9451	0e e4 	. . 
	pop de			;9453	d1 	. 
	ld (0fc3bh),hl		;9454	22 3b fc 	" ; . 
	cp d			;9457	ba 	. 
	rst 28h			;9458	ef 	. 
	ex (sp),hl			;9459	e3 	. 
	cp h			;945a	bc 	. 
	ld l,c			;945b	69 	i 
	ret p			;945c	f0 	. 
	xor c			;945d	a9 	. 
	ret nz			;945e	c0 	. 
	xor c			;945f	a9 	. 
	rrca			;9460	0f 	. 
	ld l,a			;9461	6f 	o 
	nop			;9462	00 	. 
	rra			;9463	1f 	. 
	and (hl)			;9464	a6 	. 
	inc de			;9465	13 	. 
	cp d			;9466	ba 	. 
	inc bc			;9467	03 	. 
	ret m			;9468	f8 	. 
	jp (hl)			;9469	e9 	. 
	add a,b			;946a	80 	. 
	adc a,a			;946b	8f 	. 
	rra			;946c	1f 	. 
	and a			;946d	a7 	. 
	ld c,081h		;946e	0e 81 	. . 
	jp m,04599h		;9470	fa 99 45 	. . E 
	dec b			;9473	05 	. 
	ld b,l			;9474	45 	E 
	defb 0fdh,0fdh,0edh	;illegal sequence		;9475	fd fd ed 	. . . 
	ld d,l			;9478	55 	U 
	ld d,(hl)			;9479	56 	V 
	sub e			;947a	93 	. 
	nop			;947b	00 	. 
	and (hl)			;947c	a6 	. 
	rst 30h			;947d	f7 	. 
	ret m			;947e	f8 	. 
	ld (0e0ffh),hl		;947f	22 ff e0 	" . . 
	cp d			;9482	ba 	. 
	rst 8			;9483	cf 	. 
	ld sp,hl			;9484	f9 	. 
	call 0e099h		;9485	cd 99 e0 	. . . 
	ld bc,09affh		;9488	01 ff 9a 	. . . 
	rst 18h			;948b	df 	. 
	cp 060h		;948c	fe 60 	. ` 
	ld (0beffh),hl		;948e	22 ff be 	" . . 
	ld e,d			;9491	5a 	Z 
	sbc a,a			;9492	9f 	. 
	rst 38h			;9493	ff 	. 
	ret po			;9494	e0 	. 
	inc bc			;9495	03 	. 
	sbc a,e			;9496	9b 	. 
	rst 30h			;9497	f7 	. 
	ret nz			;9498	c0 	. 
	ld h,0ffh		;9499	26 ff 	& . 
	ccf			;949b	3f 	? 
	adc a,b			;949c	88 	. 
	inc a			;949d	3c 	< 
	and l			;949e	a5 	. 
	ld a,a			;949f	7f 	 
	call m,00788h		;94a0	fc 88 07 	. . . 
	rst 30h			;94a3	f7 	. 
	rst 38h			;94a4	ff 	. 
	add a,b			;94a5	80 	. 
	ld b,07eh		;94a6	06 7e 	. ~ 
	rst 28h			;94a8	ef 	. 
	and d			;94a9	a2 	. 
	ld a,a			;94aa	7f 	 
	rst 38h			;94ab	ff 	. 
	rlca			;94ac	07 	. 
	call pe,0fc63h		;94ad	ec 63 fc 	. c . 
	ld sp,hl			;94b0	f9 	. 
	adc a,b			;94b1	88 	. 
	adc a,c			;94b2	89 	. 
	ld a,a			;94b3	7f 	 
	exx			;94b4	d9 	. 
	jp m,066bfh		;94b5	fa bf 66 	. . f 
	cp l			;94b8	bd 	. 
	rrca			;94b9	0f 	. 
	cp 0a1h		;94ba	fe a1 	. . 
	rlca			;94bc	07 	. 
	ld (hl),l			;94bd	75 	u 
	ld d,l			;94be	55 	U 
	ld e,b			;94bf	58 	X 
	jp m,01c92h		;94c0	fa 92 1c 	. . . 
	sub e			;94c3	93 	. 
	ld d,l			;94c4	55 	U 
	sub e			;94c5	93 	. 
	adc a,b			;94c6	88 	. 
	sub e			;94c7	93 	. 
	ld a,d			;94c8	7a 	z 
	sub h			;94c9	94 	. 
	ld de,0d194h		;94ca	11 94 d1 	. . . 
	sub e			;94cd	93 	. 
	ld b,(hl)			;94ce	46 	F 
	sub h			;94cf	94 	. 
	ld bc,0ffffh		;94d0	01 ff ff 	. . . 
	ld (094feh),bc		;94d3	ed 43 fe 94 	. C . . 
	inc bc			;94d7	03 	. 
	ld a,080h		;94d8	3e 80 	> . 
	jr $+45		;94da	18 2b 	. + 
	ld c,0feh		;94dc	0e fe 	. . 
	add a,a			;94de	87 	. 
	jp nz,094e5h		;94df	c2 e5 94 	. . . 
	ld a,(hl)			;94e2	7e 	~ 
	inc hl			;94e3	23 	# 
	rla			;94e4	17 	. 
	call nc,09525h		;94e5	d4 25 95 	. % . 
	inc c			;94e8	0c 	. 
	ret z			;94e9	c8 	. 
	ld b,c			;94ea	41 	A 
	ld c,(hl)			;94eb	4e 	N 
	inc hl			;94ec	23 	# 
	rr b		;94ed	cb 18 	. . 
	rr c		;94ef	cb 19 	. . 
	ld (094feh),bc		;94f1	ed 43 fe 94 	. C . . 
	ld bc,00001h		;94f5	01 01 00 	. . . 
	call nc,09525h		;94f8	d4 25 95 	. % . 
	inc bc			;94fb	03 	. 
	push hl			;94fc	e5 	. 
	ld hl,00000h		;94fd	21 00 00 	! . . 
	add hl,de			;9500	19 	. 
	ldir		;9501	ed b0 	. . 
	pop hl			;9503	e1 	. 
	add a,a			;9504	87 	. 
	jr c,$-41		;9505	38 d5 	8 . 
	inc c			;9507	0c 	. 
	add a,a			;9508	87 	. 
	jp nz,0950fh		;9509	c2 0f 95 	. . . 
	ld a,(hl)			;950c	7e 	~ 
	inc hl			;950d	23 	# 
	rla			;950e	17 	. 
	call nc,09525h		;950f	d4 25 95 	. % . 
	ldir		;9512	ed b0 	. . 
	add a,a			;9514	87 	. 
	jr c,$-57		;9515	38 c5 	8 . 
	inc c			;9517	0c 	. 
	add a,a			;9518	87 	. 
	jp nz,0951fh		;9519	c2 1f 95 	. . . 
	ld a,(hl)			;951c	7e 	~ 
	inc hl			;951d	23 	# 
	rla			;951e	17 	. 
	call nc,09525h		;951f	d4 25 95 	. % . 
	jp 094fch		;9522	c3 fc 94 	. . . 
	add a,a			;9525	87 	. 
	rl c		;9526	cb 11 	. . 
	add a,a			;9528	87 	. 
	jr nc,$-4		;9529	30 fa 	0 . 
	ret nz			;952b	c0 	. 
	ld a,(hl)			;952c	7e 	~ 
	inc hl			;952d	23 	# 
	rla			;952e	17 	. 
	ret c			;952f	d8 	. 
	add a,a			;9530	87 	. 
	rl c		;9531	cb 11 	. . 
	add a,a			;9533	87 	. 
	ret c			;9534	d8 	. 
	add a,a			;9535	87 	. 
	rl c		;9536	cb 11 	. . 
	add a,a			;9538	87 	. 
	ret c			;9539	d8 	. 
	add a,a			;953a	87 	. 
	rl c		;953b	cb 11 	. . 
	add a,a			;953d	87 	. 
	ret c			;953e	d8 	. 
	add a,a			;953f	87 	. 
	rl c		;9540	cb 11 	. . 
	rl b		;9542	cb 10 	. . 
	add a,a			;9544	87 	. 
	jr nc,$-6		;9545	30 f8 	0 . 
	ret nz			;9547	c0 	. 
	ld a,(hl)			;9548	7e 	~ 
	inc hl			;9549	23 	# 
	rla			;954a	17 	. 
	jr nc,$-12		;954b	30 f2 	0 . 
	ret			;954d	c9 	. 
	ld d,e			;954e	53 	S 
	and c			;954f	a1 	. 
	ld l,e			;9550	6b 	k 
	and c			;9551	a1 	. 
	ret p			;9552	f0 	. 
	and c			;9553	a1 	. 
	sbc a,e			;9554	9b 	. 
	and c			;9555	a1 	. 
	ld b,h			;9556	44 	D 
	and c			;9557	a1 	. 
	ld l,l			;9558	6d 	m 
	and d			;9559	a2 	. 
	ld e,0a2h		;955a	1e a2 	. . 
	or l			;955c	b5 	. 
	and d			;955d	a2 	. 
	ld c,(hl)			;955e	4e 	N 
	and d			;955f	a2 	. 
	dec sp			;9560	3b 	; 
	and e			;9561	a3 	. 
	ret z			;9562	c8 	. 
	and d			;9563	a2 	. 
	inc hl			;9564	23 	# 
	and e			;9565	a3 	. 
	push bc			;9566	c5 	. 
	and c			;9567	a1 	. 
	pop bc			;9568	c1 	. 
	and e			;9569	a3 	. 
	ret m			;956a	f8 	. 
	and d			;956b	a2 	. 
	add a,l			;956c	85 	. 
	and d			;956d	a2 	. 
	ld c,d			;956e	4a 	J 
	and h			;956f	a4 	. 
	cp a			;9570	bf 	. 
	and h			;9571	a4 	. 
	rst 28h			;9572	ef 	. 
	and e			;9573	a3 	. 
	sub d			;9574	92 	. 
	and h			;9575	a4 	. 
	ld h,a			;9576	67 	g 
	and e			;9577	a3 	. 
	sub (hl)			;9578	96 	. 
	and e			;9579	a3 	. 
	ex de,hl			;957a	eb 	. 
	and h			;957b	a4 	. 
	ld a,(de)			;957c	1a 	. 
	and h			;957d	a4 	. 
	ld h,h			;957e	64 	d 
	and h			;957f	a4 	. 
	ld bc,(0d1bch)		;9580	ed 4b bc d1 	. K . . 
	ld h,0f9h		;9584	26 f9 	& . 
	ld a,(de)			;9586	1a 	. 
	ld l,a			;9587	6f 	o 
	ld l,(hl)			;9588	6e 	n 
	inc h			;9589	24 	$ 
	ld a,(bc)			;958a	0a 	. 
	and (hl)			;958b	a6 	. 
	or l			;958c	b5 	. 
	ld (bc),a			;958d	02 	. 
	inc e			;958e	1c 	. 
	inc bc			;958f	03 	. 
	ld a,(de)			;9590	1a 	. 
	ld l,a			;9591	6f 	o 
	ld a,(bc)			;9592	0a 	. 
	and (hl)			;9593	a6 	. 
	or l			;9594	b5 	. 
	ld (bc),a			;9595	02 	. 
	inc e			;9596	1c 	. 
	inc bc			;9597	03 	. 
	dec h			;9598	25 	% 
	ld a,(de)			;9599	1a 	. 
	ld l,a			;959a	6f 	o 
	ld l,(hl)			;959b	6e 	n 
	inc h			;959c	24 	$ 
	ld a,(bc)			;959d	0a 	. 
	and (hl)			;959e	a6 	. 
	or l			;959f	b5 	. 
	ld (bc),a			;95a0	02 	. 
	inc e			;95a1	1c 	. 
	inc bc			;95a2	03 	. 
	ld a,(de)			;95a3	1a 	. 
	ld l,a			;95a4	6f 	o 
	ld a,(bc)			;95a5	0a 	. 
	and (hl)			;95a6	a6 	. 
	or l			;95a7	b5 	. 
	ld (bc),a			;95a8	02 	. 
	inc e			;95a9	1c 	. 
	inc bc			;95aa	03 	. 
	dec h			;95ab	25 	% 
	ld a,(de)			;95ac	1a 	. 
	ld l,a			;95ad	6f 	o 
	ld l,(hl)			;95ae	6e 	n 
	inc h			;95af	24 	$ 
	ld a,(bc)			;95b0	0a 	. 
	and (hl)			;95b1	a6 	. 
	or l			;95b2	b5 	. 
	ld (bc),a			;95b3	02 	. 
	inc e			;95b4	1c 	. 
	inc bc			;95b5	03 	. 
	ld a,(de)			;95b6	1a 	. 
	ld l,a			;95b7	6f 	o 
	ld a,(bc)			;95b8	0a 	. 
	and (hl)			;95b9	a6 	. 
	or l			;95ba	b5 	. 
	ld (bc),a			;95bb	02 	. 
	inc e			;95bc	1c 	. 
	inc bc			;95bd	03 	. 
	dec h			;95be	25 	% 
	ld a,(de)			;95bf	1a 	. 
	ld l,a			;95c0	6f 	o 
	ld l,(hl)			;95c1	6e 	n 
	inc h			;95c2	24 	$ 
	ld a,(bc)			;95c3	0a 	. 
	and (hl)			;95c4	a6 	. 
	or l			;95c5	b5 	. 
	ld (bc),a			;95c6	02 	. 
	inc e			;95c7	1c 	. 
	inc bc			;95c8	03 	. 
	ld a,(de)			;95c9	1a 	. 
	ld l,a			;95ca	6f 	o 
	ld a,(bc)			;95cb	0a 	. 
	and (hl)			;95cc	a6 	. 
	or l			;95cd	b5 	. 
	ld (bc),a			;95ce	02 	. 
	ret			;95cf	c9 	. 
	ld bc,(0d1bch)		;95d0	ed 4b bc d1 	. K . . 
	ld h,0fah		;95d4	26 fa 	& . 
	ld a,(de)			;95d6	1a 	. 
	ld l,a			;95d7	6f 	o 
	ld a,(bc)			;95d8	0a 	. 
	and (hl)			;95d9	a6 	. 
	or l			;95da	b5 	. 
	ld (bc),a			;95db	02 	. 
	inc e			;95dc	1c 	. 
	inc bc			;95dd	03 	. 
	dec h			;95de	25 	% 
	ld a,(de)			;95df	1a 	. 
	ld l,a			;95e0	6f 	o 
	ld l,(hl)			;95e1	6e 	n 
	inc h			;95e2	24 	$ 
	ld a,(bc)			;95e3	0a 	. 
	and (hl)			;95e4	a6 	. 
	or l			;95e5	b5 	. 
	ld (bc),a			;95e6	02 	. 
	inc e			;95e7	1c 	. 
	inc bc			;95e8	03 	. 
	ld a,(de)			;95e9	1a 	. 
	ld l,a			;95ea	6f 	o 
	ld a,(bc)			;95eb	0a 	. 
	and (hl)			;95ec	a6 	. 
	or l			;95ed	b5 	. 
	ld (bc),a			;95ee	02 	. 
	inc e			;95ef	1c 	. 
	inc bc			;95f0	03 	. 
	dec h			;95f1	25 	% 
	ld a,(de)			;95f2	1a 	. 
	ld l,a			;95f3	6f 	o 
	ld l,(hl)			;95f4	6e 	n 
	inc h			;95f5	24 	$ 
	ld a,(bc)			;95f6	0a 	. 
	and (hl)			;95f7	a6 	. 
	or l			;95f8	b5 	. 
	ld (bc),a			;95f9	02 	. 
	inc e			;95fa	1c 	. 
	inc bc			;95fb	03 	. 
	ld a,(de)			;95fc	1a 	. 
	ld l,a			;95fd	6f 	o 
	ld a,(bc)			;95fe	0a 	. 
	and (hl)			;95ff	a6 	. 
	or l			;9600	b5 	. 
	ld (bc),a			;9601	02 	. 
	inc e			;9602	1c 	. 
	inc bc			;9603	03 	. 
	dec h			;9604	25 	% 
	ld a,(de)			;9605	1a 	. 
	ld l,a			;9606	6f 	o 
	ld l,(hl)			;9607	6e 	n 
	inc h			;9608	24 	$ 
	ld a,(bc)			;9609	0a 	. 
	and (hl)			;960a	a6 	. 
	or l			;960b	b5 	. 
	ld (bc),a			;960c	02 	. 
	inc e			;960d	1c 	. 
	inc bc			;960e	03 	. 
	ld a,(de)			;960f	1a 	. 
	ld l,a			;9610	6f 	o 
	ld a,(bc)			;9611	0a 	. 
	and (hl)			;9612	a6 	. 
	or l			;9613	b5 	. 
	ld (bc),a			;9614	02 	. 
	inc e			;9615	1c 	. 
	inc bc			;9616	03 	. 
	dec h			;9617	25 	% 
	ld a,(de)			;9618	1a 	. 
	ld l,a			;9619	6f 	o 
	ld l,(hl)			;961a	6e 	n 
	inc h			;961b	24 	$ 
	ld a,(bc)			;961c	0a 	. 
	and (hl)			;961d	a6 	. 
	or l			;961e	b5 	. 
	ld (bc),a			;961f	02 	. 
	ret			;9620	c9 	. 
	add a,b			;9621	80 	. 
	nop			;9622	00 	. 
	ld b,002h		;9623	06 02 	. . 
	jr nc,$+126		;9625	30 7c 	0 | 
	ld a,d			;9627	7a 	z 
	ld a,00fh		;9628	3e 0f 	> . 
	rlca			;962a	07 	. 
	ld bc,01100h		;962b	01 00 11 	. . . 
	ld h,d			;962e	62 	b 
	adc a,a			;962f	8f 	. 
	rra			;9630	1f 	. 
	sub (hl)			;9631	96 	. 
	rla			;9632	17 	. 
	rra			;9633	1f 	. 
	dec b			;9634	05 	. 
	inc bc			;9635	03 	. 
	ld b,c			;9636	41 	A 
	ld c,c			;9637	49 	I 
	nop			;9638	00 	. 
	ld d,d			;9639	52 	R 
	ld h,d			;963a	62 	b 
	ld bc,00323h		;963b	01 23 03 	. # . 
	ld h,0c3h		;963e	26 c3 	& . 
	inc bc			;9640	03 	. 
	and d			;9641	a2 	. 
	ld bc,00021h		;9642	01 21 00 	. ! . 
	ld b,h			;9645	44 	D 
	ld c,c			;9646	49 	I 
	add hl,de			;9647	19 	. 
	sbc a,b			;9648	98 	. 
	call po,0f3d2h		;9649	e4 d2 f3 	. . . 
	ld sp,hl			;964c	f9 	. 
	ret m			;964d	f8 	. 
	sbc a,h			;964e	9c 	. 
	adc a,h			;964f	8c 	. 
	adc a,b			;9650	88 	. 
	and c			;9651	a1 	. 
	and e			;9652	a3 	. 
	ld a,a			;9653	7f 	 
	rst 38h			;9654	ff 	. 
	add hl,hl			;9655	29 	) 
	ld a,a			;9656	7f 	 
	and h			;9657	a4 	. 
	ccf			;9658	3f 	? 
	xor l			;9659	ad 	. 
	rra			;965a	1f 	. 
	add a,(hl)			;965b	86 	. 
	ld b,h			;965c	44 	D 
	ld c,001h		;965d	0e 01 	. . 
	rrca			;965f	0f 	. 
	ld c,e			;9660	4b 	K 
	rra			;9661	1f 	. 
	rst 38h			;9662	ff 	. 
	nop			;9663	00 	. 
	xor (hl)			;9664	ae 	. 
	rst 38h			;9665	ff 	. 
	defb 0fdh,0feh,0fdh	;illegal sequence		;9666	fd fe fd 	. . . 
	ret pe			;9669	e8 	. 
	push de			;966a	d5 	. 
	ret m			;966b	f8 	. 
	call p,0fdfah		;966c	f4 fa fd 	. . . 
	cp 07dh		;966f	fe 7d 	. } 
	ld a,(hl)			;9671	7e 	~ 
	ccf			;9672	3f 	? 
	dec sp			;9673	3b 	; 
	cp a			;9674	bf 	. 
	ccf			;9675	3f 	? 
	and a			;9676	a7 	. 
	ret pe			;9677	e8 	. 
	cp 096h		;9678	fe 96 	. . 
	jr c,$-4		;967a	38 fa 	8 . 
	pop af			;967c	f1 	. 
	ret po			;967d	e0 	. 
	push af			;967e	f5 	. 
	pop de			;967f	d1 	. 
	rrca			;9680	0f 	. 
	xor d			;9681	aa 	. 
	push de			;9682	d5 	. 
	ret pe			;9683	e8 	. 
	push af			;9684	f5 	. 
	ret m			;9685	f8 	. 
	call m,0dcfeh		;9686	fc fe dc 	. . . 
	cp c			;9689	b9 	. 
	rst 20h			;968a	e7 	. 
	exx			;968b	d9 	. 
	ld a,c			;968c	79 	y 
	rrca			;968d	0f 	. 
	rrca			;968e	0f 	. 
	add a,a			;968f	87 	. 
	ld l,e			;9690	6b 	k 
	ld h,b			;9691	60 	` 
	ld h,c			;9692	61 	a 
	ld h,l			;9693	65 	e 
	inc (hl)			;9694	34 	4 
	adc a,a			;9695	8f 	. 
	ld sp,06111h		;9696	31 11 61 	1 . a 
	sub b			;9699	90 	. 
	cp 008h		;969a	fe 08 	. . 
	ld c,d			;969c	4a 	J 
	sbc a,b			;969d	98 	. 
	and h			;969e	a4 	. 
	ld (hl),h			;969f	74 	t 
	ld a,b			;96a0	78 	x 
	call p,0feebh		;96a1	f4 eb fe 	. . . 
	rst 8			;96a4	cf 	. 
	inc bc			;96a5	03 	. 
	nop			;96a6	00 	. 
	ld hl,(0c080h)		;96a7	2a 80 c0 	* . . 
	ret po			;96aa	e0 	. 
	and h			;96ab	a4 	. 
	rst 38h			;96ac	ff 	. 
	ld l,a			;96ad	6f 	o 
	ld a,b			;96ae	78 	x 
	or h			;96af	b4 	. 
	dec l			;96b0	2d 	- 
	ret po			;96b1	e0 	. 
	push hl			;96b2	e5 	. 
	or d			;96b3	b2 	. 
	jp pe,0ab5fh		;96b4	ea 5f ab 	. _ . 
	dec b			;96b7	05 	. 
	and e			;96b8	a3 	. 
	ld d,c			;96b9	51 	Q 
	xor d			;96ba	aa 	. 
	ld d,l			;96bb	55 	U 
	ld iy,(0aa85h)		;96bc	fd 2a 85 aa 	. * . . 
	ret c			;96c0	d8 	. 
	sub l			;96c1	95 	. 
	ret po			;96c2	e0 	. 
	jp m,0dc75h		;96c3	fa 75 dc 	. u . 
	sbc a,a			;96c6	9f 	. 
	ld d,a			;96c7	57 	W 
	dec hl			;96c8	2b 	+ 
	ld d,a			;96c9	57 	W 
	jp (hl)			;96ca	e9 	. 
	adc a,c			;96cb	89 	. 
	call po,0d5d8h		;96cc	e4 d8 d5 	. . . 
	xor e			;96cf	ab 	. 
	rst 18h			;96d0	df 	. 
	dec h			;96d1	25 	% 
	xor e			;96d2	ab 	. 
	jp m,0f1f5h		;96d3	fa f5 f1 	. . . 
	xor e			;96d6	ab 	. 
	ld (iy-003h),l		;96d7	fd 75 fd 	. u . 
	ld l,d			;96da	6a 	j 
	jr nc,$-31		;96db	30 df 	0 . 
	sub d			;96dd	92 	. 
	call p,0f1e8h		;96de	f4 e8 f1 	. . . 
	jp po,0faf1h		;96e1	e2 f1 fa 	. . . 
	sbc a,l			;96e4	9d 	. 
	ld a,(01e7dh)		;96e5	3a 7d 1e 	: } . 
	add a,l			;96e8	85 	. 
	ld a,b			;96e9	78 	x 
	ex af,af'			;96ea	08 	. 
	ld (00403h),a		;96eb	32 03 04 	2 . . 
	add a,h			;96ee	84 	. 
	ld (hl),c			;96ef	71 	q 
	sbc a,b			;96f0	98 	. 
	res 2,(hl)		;96f1	cb 96 	. . 
	add hl,sp			;96f3	39 	9 
	dec sp			;96f4	3b 	; 
	cp 023h		;96f5	fe 23 	. # 
	cp 0f8h		;96f7	fe f8 	. . 
	jp nz,06ab4h		;96f9	c2 b4 6a 	. . j 
	add a,b			;96fc	80 	. 
	ret nz			;96fd	c0 	. 
	ret po			;96fe	e0 	. 
	ld sp,hl			;96ff	f9 	. 
	adc a,(hl)			;9700	8e 	. 
	xor e			;9701	ab 	. 
	ld d,l			;9702	55 	U 
	defb 0fdh,0d9h,0aeh	;illegal sequence		;9703	fd d9 ae 	. . . 
	add a,h			;9706	84 	. 
	and b			;9707	a0 	. 
	ld e,l			;9708	5d 	] 
	sub b			;9709	90 	. 
	xor l			;970a	ad 	. 
	xor a			;970b	af 	. 
	ld d,a			;970c	57 	W 
	xor (hl)			;970d	ae 	. 
	ld e,l			;970e	5d 	] 
	cp 0f5h		;970f	fe f5 	. . 
	ret pe			;9711	e8 	. 
	pop de			;9712	d1 	. 
	jp po,0a2d5h		;9713	e2 d5 a2 	. . . 
	ld b,l			;9716	45 	E 
	ld b,l			;9717	45 	E 
	sub d			;9718	92 	. 
	ld d,b			;9719	50 	P 
	dec de			;971a	1b 	. 
	ld e,a			;971b	5f 	_ 
	ei			;971c	fb 	. 
	ld d,l			;971d	55 	U 
	and d			;971e	a2 	. 
	ld bc,03061h		;971f	01 61 30 	. a 0 
	xor (hl)			;9722	ae 	. 
	ld a,l			;9723	7d 	} 
	adc a,l			;9724	8d 	. 
	ld hl,0bf5fh		;9725	21 5f bf 	! _ . 
	cp l			;9728	bd 	. 
	dec hl			;9729	2b 	+ 
	pop af			;972a	f1 	. 
	push de			;972b	d5 	. 
	sbc a,b			;972c	98 	. 
	ld l,d			;972d	6a 	j 
	ld bc,0077dh		;972e	01 7d 07 	. } . 
	rlca			;9731	07 	. 
	rrca			;9732	0f 	. 
	cp 0a9h		;9733	fe a9 	. . 
	add a,a			;9735	87 	. 
	add a,c			;9736	81 	. 
	rlca			;9737	07 	. 
	ld (hl),a			;9738	77 	w 
	rst 38h			;9739	ff 	. 
	ld l,e			;973a	6b 	k 
	ld a,a			;973b	7f 	 
	and c			;973c	a1 	. 
	rst 30h			;973d	f7 	. 
	ld a,a			;973e	7f 	 
	ld a,h			;973f	7c 	| 
	add a,063h		;9740	c6 63 	. c 
	cp a			;9742	bf 	. 
	ld e,a			;9743	5f 	_ 
	ld h,e			;9744	63 	c 
	adc a,c			;9745	89 	. 
	ex de,hl			;9746	eb 	. 
	ld (hl),l			;9747	75 	u 
	inc h			;9748	24 	$ 
	dec e			;9749	1d 	. 
	adc a,a			;974a	8f 	. 
	xor d			;974b	aa 	. 
	dec d			;974c	15 	. 
	xor d			;974d	aa 	. 
	dec b			;974e	05 	. 
	ld (0fc51h),hl		;974f	22 51 fc 	" Q . 
	ld c,(hl)			;9752	4e 	N 
	pop hl			;9753	e1 	. 
	ld l,d			;9754	6a 	j 
	pop bc			;9755	c1 	. 
	ret pe			;9756	e8 	. 
	ld (hl),h			;9757	74 	t 
	ld (hl),l			;9758	75 	u 
	rla			;9759	17 	. 
	ld e,b			;975a	58 	X 
	ld sp,hl			;975b	f9 	. 
	ret c			;975c	d8 	. 
	rst 18h			;975d	df 	. 
	xor a			;975e	af 	. 
	dec l			;975f	2d 	- 
	or l			;9760	b5 	. 
	push af			;9761	f5 	. 
	jp m,0e4b7h		;9762	fa b7 e4 	. . . 
	add a,h			;9765	84 	. 
	ld d,c			;9766	51 	Q 
	or a			;9767	b7 	. 
	inc e			;9768	1c 	. 
	jp pe,0f465h		;9769	ea 65 f4 	. e . 
	add a,a			;976c	87 	. 
	ld bc,0cf00h		;976d	01 00 cf 	. . . 
	ld b,l			;9770	45 	E 
	ret nz			;9771	c0 	. 
	rst 38h			;9772	ff 	. 
	cp 00dh		;9773	fe 0d 	. . 
	daa			;9775	27 	' 
	cp l			;9776	bd 	. 
	xor a			;9777	af 	. 
	rst 30h			;9778	f7 	. 
	jp m,08c60h		;9779	fa 60 8c 	. ` . 
	ld hl,0ab8eh		;977c	21 8e ab 	! . . 
	ld d,a			;977f	57 	W 
	xor (hl)			;9780	ae 	. 
	ld e,h			;9781	5c 	\ 
	cp b			;9782	b8 	. 
	defb 0fdh,00ah,07dh	;illegal sequence		;9783	fd 0a 7d 	. . } 
	ld l,057h		;9786	2e 57 	. W 
	ld a,(bc)			;9788	0a 	. 
	xor (hl)			;9789	ae 	. 
	xor d			;978a	aa 	. 
	xor e			;978b	ab 	. 
	ret nz			;978c	c0 	. 
	ld (0ffbfh),hl		;978d	22 bf ff 	" . . 
	adc a,c			;9790	89 	. 
	push af			;9791	f5 	. 
	ret pe			;9792	e8 	. 
	ld (0e401h),a		;9793	32 01 e4 	2 . . 
	jr nz,$+0		;9796	20 fe 	  . 
	and l			;9798	a5 	. 
	djnz $+42		;9799	10 28 	. ( 
	ccf			;979b	3f 	? 
	and c			;979c	a1 	. 
	add hl,bc			;979d	09 	. 
	and d			;979e	a2 	. 
	ex af,af'			;979f	08 	. 
	ld h,00bh		;97a0	26 0b 	& . 
	rlca			;97a2	07 	. 
	sbc a,d			;97a3	9a 	. 
	dec b			;97a4	05 	. 
	inc bc			;97a5	03 	. 
	add hl,de			;97a6	19 	. 
	ex (sp),hl			;97a7	e3 	. 
	rlca			;97a8	07 	. 
	inc b			;97a9	04 	. 
	rlca			;97aa	07 	. 
	jp p,0ff8ah		;97ab	f2 8a ff 	. . . 
	add a,a			;97ae	87 	. 
	rst 0			;97af	c7 	. 
	xor e			;97b0	ab 	. 
	rst 20h			;97b1	e7 	. 
	rst 30h			;97b2	f7 	. 
	daa			;97b3	27 	' 
	ld l,h			;97b4	6c 	l 
	ld (hl),l			;97b5	75 	u 
	or h			;97b6	b4 	. 
	ld a,b			;97b7	78 	x 
	or a			;97b8	b7 	. 
	add a,h			;97b9	84 	. 
	rst 18h			;97ba	df 	. 
	cp a			;97bb	bf 	. 
	ld h,0deh		;97bc	26 de 	& . 
	or (hl)			;97be	b6 	. 
	ld a,d			;97bf	7a 	z 
	inc sp			;97c0	33 	3 
	ld e,c			;97c1	59 	Y 
	ld (hl),c			;97c2	71 	q 
	add a,b			;97c3	80 	. 
	adc a,d			;97c4	8a 	. 
	ld e,a			;97c5	5f 	_ 
	cp d			;97c6	ba 	. 
	ld (hl),a			;97c7	77 	w 
	jp m,00e5dh		;97c8	fa 5d 0e 	. ] . 
	sbc a,c			;97cb	99 	. 
	sub e			;97cc	93 	. 
	ret c			;97cd	d8 	. 
	call z,000e1h		;97ce	cc e1 00 	. . . 
	or h			;97d1	b4 	. 
	ld e,l			;97d2	5d 	] 
	ret			;97d3	c9 	. 
	inc c			;97d4	0c 	. 
	push hl			;97d5	e5 	. 
	push de			;97d6	d5 	. 
	rst 38h			;97d7	ff 	. 
	ld (bc),a			;97d8	02 	. 
	cp 024h		;97d9	fe 24 	. $ 
	ld h,c			;97db	61 	a 
	ei			;97dc	fb 	. 
	rst 0			;97dd	c7 	. 
	jp (hl)			;97de	e9 	. 
	cp d			;97df	ba 	. 
	and a			;97e0	a7 	. 
	pop bc			;97e1	c1 	. 
	add a,c			;97e2	81 	. 
	and d			;97e3	a2 	. 
	sub d			;97e4	92 	. 
	jp nc,087c3h		;97e5	d2 c3 87 	. . . 
	rst 38h			;97e8	ff 	. 
	add hl,hl			;97e9	29 	) 
	defb 0fdh,0c8h,05eh	;illegal sequence		;97ea	fd c8 5e 	. . ^ 
	adc a,c			;97ed	89 	. 
	rlca			;97ee	07 	. 
	ret m			;97ef	f8 	. 
	ld b,020h		;97f0	06 20 	.   
	rst 0			;97f2	c7 	. 
	ret m			;97f3	f8 	. 
	jp m,0fcfeh		;97f4	fa fe fc 	. . . 
	ret m			;97f7	f8 	. 
	ld sp,hl			;97f8	f9 	. 
	ret pe			;97f9	e8 	. 
	sbc a,042h		;97fa	de 42 	. B 
	sub a			;97fc	97 	. 
	adc a,a			;97fd	8f 	. 
	and a			;97fe	a7 	. 
	pop hl			;97ff	e1 	. 
	ld sp,hl			;9800	f9 	. 
	jp nc,05bfch		;9801	d2 fc 5b 	. . [ 
	rst 28h			;9804	ef 	. 
	rst 18h			;9805	df 	. 
	xor 0f7h		;9806	ee f7 	. . 
	cp e			;9808	bb 	. 
	ld e,a			;9809	5f 	_ 
	cp (hl)			;980a	be 	. 
	rrca			;980b	0f 	. 
	call nc,06457h		;980c	d4 57 64 	. W d 
	ld h,a			;980f	67 	g 
	xor d			;9810	aa 	. 
	ld (hl),a			;9811	77 	w 
	cp e			;9812	bb 	. 
	dec l			;9813	2d 	- 
	jr $-86		;9814	18 a8 	. . 
	ld e,b			;9816	58 	X 
	ld d,h			;9817	54 	T 
	dec de			;9818	1b 	. 
	ld d,c			;9819	51 	Q 
	ld a,(bc)			;981a	0a 	. 
	ret			;981b	c9 	. 
	adc a,d			;981c	8a 	. 
	jr z,$+71		;981d	28 45 	( E 
	ld a,(bc)			;981f	0a 	. 
	xor a			;9820	af 	. 
	adc a,a			;9821	8f 	. 
	rst 38h			;9822	ff 	. 
	nop			;9823	00 	. 
	cp 014h		;9824	fe 14 	. . 
	and e			;9826	a3 	. 
	add a,b			;9827	80 	. 
	cp c			;9828	b9 	. 
	or 0feh		;9829	f6 fe 	. . 
	jr z,$+66		;982b	28 40 	( @ 
	jr $-73		;982d	18 b5 	. . 
	ret nz			;982f	c0 	. 
	ret p			;9830	f0 	. 
	add a,b			;9831	80 	. 
	ld e,b			;9832	58 	X 
	adc a,l			;9833	8d 	. 
	ret nc			;9834	d0 	. 
	cp 0e0h		;9835	fe e0 	. . 
	ld (hl),d			;9837	72 	r 
	ret pe			;9838	e8 	. 
	ld a,h			;9839	7c 	| 
	inc a			;983a	3c 	< 
	sbc a,b			;983b	98 	. 
	sub b			;983c	90 	. 
	cp 028h		;983d	fe 28 	. ( 
	ret m			;983f	f8 	. 
	inc a			;9840	3c 	< 
	call m,096c8h		;9841	fc c8 96 	. . . 
	adc a,b			;9844	88 	. 
	ex af,af'			;9845	08 	. 
	xor d			;9846	aa 	. 
	inc b			;9847	04 	. 
	add a,h			;9848	84 	. 
	and d			;9849	a2 	. 
	call nz,0f4e4h		;984a	c4 e4 f4 	. . . 
	xor b			;984d	a8 	. 
	call m,0bc72h		;984e	fc 72 bc 	. r . 
	rra			;9851	1f 	. 
	rst 28h			;9852	ef 	. 
	rst 10h			;9853	d7 	. 
	rst 28h			;9854	ef 	. 
	pop bc			;9855	c1 	. 
	jp nz,0dd7dh		;9856	c2 7d dd 	. } . 
	ld e,e			;9859	5b 	[ 
	cp 07fh		;985a	fe 7f 	.  
	ret pe			;985c	e8 	. 
	call p,0c1e0h		;985d	f4 e0 c1 	. . . 
	adc a,d			;9860	8a 	. 
	and e			;9861	a3 	. 
	ld iy,(0b046h)		;9862	fd 2a 46 b0 	. * F . 
	dec c			;9866	0d 	. 
	xor c			;9867	a9 	. 
	ld b,h			;9868	44 	D 
	push de			;9869	d5 	. 
	adc a,a			;986a	8f 	. 
	ld d,a			;986b	57 	W 
	xor a			;986c	af 	. 
	defb 0fdh,03fh,0e7h	;illegal sequence		;986d	fd 3f e7 	. ? . 
	defb 0fdh,0feh,0a0h	;illegal sequence		;9870	fd fe a0 	. . . 
	nop			;9873	00 	. 
	dec d			;9874	15 	. 
	inc hl			;9875	23 	# 
	add a,c			;9876	81 	. 
	ret m			;9877	f8 	. 
	ld e,c			;9878	59 	Y 
	sbc a,c			;9879	99 	. 
	adc a,l			;987a	8d 	. 
	ld sp,hl			;987b	f9 	. 
	ld d,a			;987c	57 	W 
	ex de,hl			;987d	eb 	. 
	ld e,d			;987e	5a 	Z 
	ld (hl),h			;987f	74 	t 
	inc h			;9880	24 	$ 
	nop			;9881	00 	. 
	ld bc,02973h		;9882	01 73 29 	. s ) 
	ld b,(hl)			;9885	46 	F 
	call 04137h		;9886	cd 37 41 	. 7 A 
	adc a,d			;9889	8a 	. 
	ld a,l			;988a	7d 	} 
	push hl			;988b	e5 	. 
	pop af			;988c	f1 	. 
	cp 0a0h		;988d	fe a0 	. . 
	nop			;988f	00 	. 
	dec d			;9890	15 	. 
	ld h,h			;9891	64 	d 
	sub 003h		;9892	d6 03 	. . 
	jr nz,$+2		;9894	20 00 	  . 
	call z,0fe6eh		;9896	cc 6e fe 	. n . 
	ld sp,hl			;9899	f9 	. 
	adc a,e			;989a	8b 	. 
	xor (iy+037h)		;989b	fd ae 37 	. . 7 
	jr $-88		;989e	18 a6 	. . 
	ld sp,hl			;98a0	f9 	. 
	ld d,a			;98a1	57 	W 
	ld a,h			;98a2	7c 	| 
	rst 30h			;98a3	f7 	. 
	ei			;98a4	fb 	. 
	ld e,a			;98a5	5f 	_ 
	exx			;98a6	d9 	. 
	inc (hl)			;98a7	34 	4 
	add a,d			;98a8	82 	. 
	jp (hl)			;98a9	e9 	. 
	rst 38h			;98aa	ff 	. 
	ld c,012h		;98ab	0e 12 	. . 
	add a,e			;98ad	83 	. 
	ex af,af'			;98ae	08 	. 
	sub h			;98af	94 	. 
	ret nz			;98b0	c0 	. 
	ld e,e			;98b1	5b 	[ 
	djnz $-65		;98b2	10 bd 	. . 
	or 0c0h		;98b4	f6 c0 	. . 
	ld d,095h		;98b6	16 95 	. . 
	ex af,af'			;98b8	08 	. 
	dec e			;98b9	1d 	. 
	xor l			;98ba	ad 	. 
	push bc			;98bb	c5 	. 
	jr z,$-58		;98bc	28 c4 	( . 
	adc a,h			;98be	8c 	. 
	rst 30h			;98bf	f7 	. 
	dec b			;98c0	05 	. 
	add a,h			;98c1	84 	. 
	rlca			;98c2	07 	. 
	jp m,0c0c9h		;98c3	fa c9 c0 	. . . 
	djnz $+126		;98c6	10 7c 	. | 
	ld a,(hl)			;98c8	7e 	~ 
	ld e,a			;98c9	5f 	_ 
	ld b,c			;98ca	41 	A 
	call nc,0a1c0h		;98cb	d4 c0 a1 	. . . 
	ex af,af'			;98ce	08 	. 
	ld b,b			;98cf	40 	@ 
	in a,(0c6h)		;98d0	db c6 	. . 
	ret nc			;98d2	d0 	. 
	nop			;98d3	00 	. 
	cp 0c3h		;98d4	fe c3 	. . 
	rst 38h			;98d6	ff 	. 
	add a,b			;98d7	80 	. 
	ld a,l			;98d8	7d 	} 
	cp (hl)			;98d9	be 	. 
	ld c,a			;98da	4f 	O 
	jp nz,0ff13h		;98db	c2 13 ff 	. . . 
	cp 0bfh		;98de	fe bf 	. . 
	ret nz			;98e0	c0 	. 
	ld b,e			;98e1	43 	C 
	cp (iy-040h)		;98e2	fd be c0 	. . . 
	rra			;98e5	1f 	. 
	rst 38h			;98e6	ff 	. 
	call nc,0d27eh		;98e7	d4 7e d2 	. ~ . 
	jp m,08457h		;98ea	fa 57 84 	. W . 
	add a,b			;98ed	80 	. 
	dec c			;98ee	0d 	. 
	ld d,l			;98ef	55 	U 
	ld d,(hl)			;98f0	56 	V 
	ld iy,05c3ah		;98f1	fd 21 3a 5c 	. ! : \ 
	ld a,001h		;98f5	3e 01 	> . 
	out (0feh),a		;98f7	d3 fe 	. . 
	ld hl,09621h		;98f9	21 21 96 	! ! . 
	ld de,08574h		;98fc	11 74 85 	. t . 
	push de			;98ff	d5 	. 
	call 094d0h		;9900	cd d0 94 	. . . 
	pop de			;9903	d1 	. 
	ld l,015h		;9904	2e 15 	. . 
	ld h,040h		;9906	26 40 	& @ 
	ld c,h			;9908	4c 	L 
	ld b,004h		;9909	06 04 	. . 
	ld a,(de)			;990b	1a 	. 
	ld (hl),a			;990c	77 	w 
	inc h			;990d	24 	$ 
	inc de			;990e	13 	. 
	ld a,(de)			;990f	1a 	. 
	ld (hl),a			;9910	77 	w 
	inc h			;9911	24 	$ 
	inc de			;9912	13 	. 
	djnz $-8		;9913	10 f6 	. . 
	ld a,l			;9915	7d 	} 
	add a,020h		;9916	c6 20 	.   
	ld l,a			;9918	6f 	o 
	jr c,$+3		;9919	38 01 	8 . 
	ld h,c			;991b	61 	a 
	ld c,h			;991c	4c 	L 
	ld a,h			;991d	7c 	| 
	cp 058h		;991e	fe 58 	. X 
	jr nz,$-23		;9920	20 e7 	  . 
	inc l			;9922	2c 	, 
	bit 5,l		;9923	cb 6d 	. m 
	jr z,$-31		;9925	28 df 	( . 
	ld l,b			;9927	68 	h 
	call 0dc25h		;9928	cd 25 dc 	. % . 
	jp 0dc00h		;992b	c3 00 dc 	. . . 
	and e			;992e	a3 	. 
	and h			;992f	a4 	. 
	and h			;9930	a4 	. 
	and h			;9931	a4 	. 
	and h			;9932	a4 	. 
	and h			;9933	a4 	. 
	and h			;9934	a4 	. 
	and h			;9935	a4 	. 
	and h			;9936	a4 	. 
	and l			;9937	a5 	. 
	rst 38h			;9938	ff 	. 
	rst 38h			;9939	ff 	. 
	rst 38h			;993a	ff 	. 
	rst 38h			;993b	ff 	. 
	rst 38h			;993c	ff 	. 
	rst 38h			;993d	ff 	. 
	rst 38h			;993e	ff 	. 
	rst 38h			;993f	ff 	. 
	rst 38h			;9940	ff 	. 
	rst 38h			;9941	ff 	. 
	rst 38h			;9942	ff 	. 
	rst 38h			;9943	ff 	. 
	rst 38h			;9944	ff 	. 
	rst 38h			;9945	ff 	. 
	sub e			;9946	93 	. 
	sub h			;9947	94 	. 
	rst 38h			;9948	ff 	. 
	rst 38h			;9949	ff 	. 
	rst 38h			;994a	ff 	. 
	rst 38h			;994b	ff 	. 
	sub l			;994c	95 	. 
	sub (hl)			;994d	96 	. 
	sub a			;994e	97 	. 
	sbc a,b			;994f	98 	. 
	rst 38h			;9950	ff 	. 
	rst 38h			;9951	ff 	. 
	sbc a,c			;9952	99 	. 
	sbc a,d			;9953	9a 	. 
	sbc a,e			;9954	9b 	. 
	rst 38h			;9955	ff 	. 
	rst 38h			;9956	ff 	. 
	rst 38h			;9957	ff 	. 
	sbc a,h			;9958	9c 	. 
	sbc a,l			;9959	9d 	. 
	sbc a,(hl)			;995a	9e 	. 
	rst 38h			;995b	ff 	. 
	rst 38h			;995c	ff 	. 
	sbc a,a			;995d	9f 	. 
	and b			;995e	a0 	. 
	and c			;995f	a1 	. 
	and d			;9960	a2 	. 
	rst 38h			;9961	ff 	. 
	ld (hl),a			;9962	77 	w 
	ld a,b			;9963	78 	x 
	rst 38h			;9964	ff 	. 
	rst 38h			;9965	ff 	. 
	rst 38h			;9966	ff 	. 
	ld a,c			;9967	79 	y 
	ld a,d			;9968	7a 	z 
	ld a,e			;9969	7b 	{ 
	rst 38h			;996a	ff 	. 
	rst 38h			;996b	ff 	. 
	rst 38h			;996c	ff 	. 
	ld a,h			;996d	7c 	| 
	ld a,l			;996e	7d 	} 
	ld a,(hl)			;996f	7e 	~ 
	ld a,a			;9970	7f 	 
	rst 38h			;9971	ff 	. 
	rst 38h			;9972	ff 	. 
	rst 38h			;9973	ff 	. 
	add a,b			;9974	80 	. 
	add a,c			;9975	81 	. 
	add a,d			;9976	82 	. 
	rst 38h			;9977	ff 	. 
	rst 38h			;9978	ff 	. 
	rst 38h			;9979	ff 	. 
	add a,e			;997a	83 	. 
	add a,h			;997b	84 	. 
	add a,l			;997c	85 	. 
	rst 38h			;997d	ff 	. 
	rst 38h			;997e	ff 	. 
	rst 38h			;997f	ff 	. 
	rst 38h			;9980	ff 	. 
	add a,(hl)			;9981	86 	. 
	rst 38h			;9982	ff 	. 
	rst 38h			;9983	ff 	. 
	rst 38h			;9984	ff 	. 
	rst 38h			;9985	ff 	. 
	rst 38h			;9986	ff 	. 
	add a,a			;9987	87 	. 
	rst 38h			;9988	ff 	. 
	rst 38h			;9989	ff 	. 
	rst 38h			;998a	ff 	. 
	jr nz,$+35		;998b	20 21 	  ! 
	ld (02423h),hl		;998d	22 23 24 	" # $ 
	dec h			;9990	25 	% 
	ld h,027h		;9991	26 27 	& ' 
	or b			;9993	b0 	. 
	or c			;9994	b1 	. 
	jr z,$+43		;9995	28 29 	( ) 
	ld hl,(02bffh)		;9997	2a ff 2b 	* . + 
	inc l			;999a	2c 	, 
	dec l			;999b	2d 	- 
	rst 38h			;999c	ff 	. 
	rst 38h			;999d	ff 	. 
	rst 38h			;999e	ff 	. 
	ld l,0ffh		;999f	2e ff 	. . 
	rst 38h			;99a1	ff 	. 
	cpl			;99a2	2f 	/ 
	jr nc,$+51		;99a3	30 31 	0 1 
	ld (0ff53h),a		;99a5	32 53 ff 	2 S . 
	rst 38h			;99a8	ff 	. 
	ld d,h			;99a9	54 	T 
	ld d,l			;99aa	55 	U 
	ld d,(hl)			;99ab	56 	V 
	ld d,a			;99ac	57 	W 
	ld e,b			;99ad	58 	X 
	ld e,c			;99ae	59 	Y 
	ld e,d			;99af	5a 	Z 
	rst 38h			;99b0	ff 	. 
	rst 38h			;99b1	ff 	. 
	rst 38h			;99b2	ff 	. 
	ld e,e			;99b3	5b 	[ 
	ld e,h			;99b4	5c 	\ 
	ld e,l			;99b5	5d 	] 
	ld e,(hl)			;99b6	5e 	^ 
	ld e,a			;99b7	5f 	_ 
	rst 38h			;99b8	ff 	. 
	rst 38h			;99b9	ff 	. 
	ld h,b			;99ba	60 	` 
	adc a,b			;99bb	88 	. 
	adc a,c			;99bc	89 	. 
	adc a,d			;99bd	8a 	. 
	and (hl)			;99be	a6 	. 
	rst 38h			;99bf	ff 	. 
	and a			;99c0	a7 	. 
	xor b			;99c1	a8 	. 
	xor c			;99c2	a9 	. 
	xor d			;99c3	aa 	. 
	xor e			;99c4	ab 	. 
	xor h			;99c5	ac 	. 
	xor l			;99c6	ad 	. 
	rst 38h			;99c7	ff 	. 
	rst 38h			;99c8	ff 	. 
	rst 38h			;99c9	ff 	. 
	rst 38h			;99ca	ff 	. 
	xor (hl)			;99cb	ae 	. 
	xor a			;99cc	af 	. 
	rst 38h			;99cd	ff 	. 
	rst 38h			;99ce	ff 	. 
	rst 38h			;99cf	ff 	. 
	or d			;99d0	b2 	. 
	or e			;99d1	b3 	. 
	or h			;99d2	b4 	. 
	or l			;99d3	b5 	. 
	rst 38h			;99d4	ff 	. 
	rst 38h			;99d5	ff 	. 
	rst 38h			;99d6	ff 	. 
	rst 38h			;99d7	ff 	. 
	or (hl)			;99d8	b6 	. 
	or a			;99d9	b7 	. 
	cp b			;99da	b8 	. 
	cp c			;99db	b9 	. 
	rst 38h			;99dc	ff 	. 
	rst 38h			;99dd	ff 	. 
	rst 38h			;99de	ff 	. 
	rst 38h			;99df	ff 	. 
	rst 38h			;99e0	ff 	. 
	cp d			;99e1	ba 	. 
	cp e			;99e2	bb 	. 
	cp h			;99e3	bc 	. 
	rst 38h			;99e4	ff 	. 
	rst 38h			;99e5	ff 	. 
	nop			;99e6	00 	. 
	ld bc,0ffffh		;99e7	01 ff ff 	. . . 
	rst 38h			;99ea	ff 	. 
	rst 38h			;99eb	ff 	. 
	ld (bc),a			;99ec	02 	. 
	inc bc			;99ed	03 	. 
	rst 38h			;99ee	ff 	. 
	rst 38h			;99ef	ff 	. 
	rst 38h			;99f0	ff 	. 
	rst 38h			;99f1	ff 	. 
	inc b			;99f2	04 	. 
	dec b			;99f3	05 	. 
	rst 38h			;99f4	ff 	. 
	rst 38h			;99f5	ff 	. 
	rst 38h			;99f6	ff 	. 
	rst 38h			;99f7	ff 	. 
	ld b,007h		;99f8	06 07 	. . 
	ex af,af'			;99fa	08 	. 
	rst 38h			;99fb	ff 	. 
	rst 38h			;99fc	ff 	. 
	rst 38h			;99fd	ff 	. 
	add hl,bc			;99fe	09 	. 
	ld a,(bc)			;99ff	0a 	. 
	dec bc			;9a00	0b 	. 
	rst 38h			;9a01	ff 	. 
	rst 38h			;9a02	ff 	. 
	rst 38h			;9a03	ff 	. 
	inc c			;9a04	0c 	. 
	dec c			;9a05	0d 	. 
	ld c,0ffh		;9a06	0e ff 	. . 
	rst 38h			;9a08	ff 	. 
	rst 38h			;9a09	ff 	. 
	rrca			;9a0a	0f 	. 
	rst 38h			;9a0b	ff 	. 
	djnz $+1		;9a0c	10 ff 	. . 
	rst 38h			;9a0e	ff 	. 
	nop			;9a0f	00 	. 
	ld bc,0ffffh		;9a10	01 ff ff 	. . . 
	rst 38h			;9a13	ff 	. 
	rst 38h			;9a14	ff 	. 
	ld de,0ff12h		;9a15	11 12 ff 	. . . 
	rst 38h			;9a18	ff 	. 
	rst 38h			;9a19	ff 	. 
	rst 38h			;9a1a	ff 	. 
	inc de			;9a1b	13 	. 
	inc d			;9a1c	14 	. 
	rst 38h			;9a1d	ff 	. 
	rst 38h			;9a1e	ff 	. 
	rst 38h			;9a1f	ff 	. 
	rst 38h			;9a20	ff 	. 
	dec d			;9a21	15 	. 
	ld d,0ffh		;9a22	16 ff 	. . 
	rst 38h			;9a24	ff 	. 
	rst 38h			;9a25	ff 	. 
	rst 38h			;9a26	ff 	. 
	rla			;9a27	17 	. 
	jr $+1		;9a28	18 ff 	. . 
	rst 38h			;9a2a	ff 	. 
	rst 38h			;9a2b	ff 	. 
	rst 38h			;9a2c	ff 	. 
	rst 38h			;9a2d	ff 	. 
	add hl,de			;9a2e	19 	. 
	rst 38h			;9a2f	ff 	. 
	rst 38h			;9a30	ff 	. 
	rst 38h			;9a31	ff 	. 
	rst 38h			;9a32	ff 	. 
	rst 38h			;9a33	ff 	. 
	ld a,(de)			;9a34	1a 	. 
	rst 38h			;9a35	ff 	. 
	rst 38h			;9a36	ff 	. 
	rst 38h			;9a37	ff 	. 
	nop			;9a38	00 	. 
	ld bc,0ffffh		;9a39	01 ff ff 	. . . 
	rst 38h			;9a3c	ff 	. 
	rst 38h			;9a3d	ff 	. 
	dec de			;9a3e	1b 	. 
	inc e			;9a3f	1c 	. 
	rst 38h			;9a40	ff 	. 
	rst 38h			;9a41	ff 	. 
	rst 38h			;9a42	ff 	. 
	rst 38h			;9a43	ff 	. 
	dec e			;9a44	1d 	. 
	ld e,01fh		;9a45	1e 1f 	. . 
	rst 38h			;9a47	ff 	. 
	rst 38h			;9a48	ff 	. 
	rst 38h			;9a49	ff 	. 
	inc (hl)			;9a4a	34 	4 
	dec (hl)			;9a4b	35 	5 
	ld (hl),0ffh		;9a4c	36 ff 	6 . 
	rst 38h			;9a4e	ff 	. 
	rst 38h			;9a4f	ff 	. 
	scf			;9a50	37 	7 
	jr c,$+59		;9a51	38 39 	8 9 
	rst 38h			;9a53	ff 	. 
	rst 38h			;9a54	ff 	. 
	rst 38h			;9a55	ff 	. 
	ld a,(03c3bh)		;9a56	3a 3b 3c 	: ; < 
	rst 38h			;9a59	ff 	. 
	rst 38h			;9a5a	ff 	. 
	rst 38h			;9a5b	ff 	. 
	dec a			;9a5c	3d 	= 
	rst 38h			;9a5d	ff 	. 
	ld a,0ffh		;9a5e	3e ff 	> . 
	rst 38h			;9a60	ff 	. 
	ccf			;9a61	3f 	? 
	ld b,b			;9a62	40 	@ 
	rst 38h			;9a63	ff 	. 
	rst 38h			;9a64	ff 	. 
	rst 38h			;9a65	ff 	. 
	ld b,c			;9a66	41 	A 
	ld b,d			;9a67	42 	B 
	ld b,e			;9a68	43 	C 
	rst 38h			;9a69	ff 	. 
	rst 38h			;9a6a	ff 	. 
	rst 38h			;9a6b	ff 	. 
	ld b,h			;9a6c	44 	D 
	ld b,l			;9a6d	45 	E 
	ld b,(hl)			;9a6e	46 	F 
	rst 38h			;9a6f	ff 	. 
	rst 38h			;9a70	ff 	. 
	rst 38h			;9a71	ff 	. 
	ld b,a			;9a72	47 	G 
	ld c,b			;9a73	48 	H 
	ld c,c			;9a74	49 	I 
	rst 38h			;9a75	ff 	. 
	rst 38h			;9a76	ff 	. 
	rst 38h			;9a77	ff 	. 
	ld c,d			;9a78	4a 	J 
	ld c,e			;9a79	4b 	K 
	ld c,h			;9a7a	4c 	L 
	rst 38h			;9a7b	ff 	. 
	rst 38h			;9a7c	ff 	. 
	rst 38h			;9a7d	ff 	. 
	ld c,l			;9a7e	4d 	M 
	ld c,(hl)			;9a7f	4e 	N 
	ld c,a			;9a80	4f 	O 
	rst 38h			;9a81	ff 	. 
	rst 38h			;9a82	ff 	. 
	rst 38h			;9a83	ff 	. 
	ld d,b			;9a84	50 	P 
	ld d,c			;9a85	51 	Q 
	ld d,d			;9a86	52 	R 
	rst 38h			;9a87	ff 	. 
	rst 38h			;9a88	ff 	. 
	ld h,d			;9a89	62 	b 
	ld h,c			;9a8a	61 	a 
	rst 38h			;9a8b	ff 	. 
	rst 38h			;9a8c	ff 	. 
	rst 38h			;9a8d	ff 	. 
	rst 38h			;9a8e	ff 	. 
	ld h,a			;9a8f	67 	g 
	ld h,(hl)			;9a90	66 	f 
	ld h,l			;9a91	65 	e 
	rst 38h			;9a92	ff 	. 
	ld h,h			;9a93	64 	d 
	ld h,e			;9a94	63 	c 
	ld l,l			;9a95	6d 	m 
	ld l,h			;9a96	6c 	l 
	ld l,e			;9a97	6b 	k 
	ld l,d			;9a98	6a 	j 
	ld l,c			;9a99	69 	i 
	ld l,b			;9a9a	68 	h 
	rst 38h			;9a9b	ff 	. 
	ld (hl),b			;9a9c	70 	p 
	ld l,a			;9a9d	6f 	o 
	ld l,(hl)			;9a9e	6e 	n 
	rst 38h			;9a9f	ff 	. 
	rst 38h			;9aa0	ff 	. 
	rst 38h			;9aa1	ff 	. 
	ld (hl),d			;9aa2	72 	r 
	ld (hl),c			;9aa3	71 	q 
	rst 38h			;9aa4	ff 	. 
	rst 38h			;9aa5	ff 	. 
	rst 38h			;9aa6	ff 	. 
	rst 38h			;9aa7	ff 	. 
	ld (hl),h			;9aa8	74 	t 
	ld (hl),e			;9aa9	73 	s 
	rst 38h			;9aaa	ff 	. 
	rst 38h			;9aab	ff 	. 
	rst 38h			;9aac	ff 	. 
	rst 38h			;9aad	ff 	. 
	halt			;9aae	76 	v 
	ld (hl),l			;9aaf	75 	u 
	rst 38h			;9ab0	ff 	. 
	rst 38h			;9ab1	ff 	. 
	rst 38h			;9ab2	ff 	. 
	rst 38h			;9ab3	ff 	. 
	rst 38h			;9ab4	ff 	. 
	rst 38h			;9ab5	ff 	. 
	rst 38h			;9ab6	ff 	. 
	adc a,0ffh		;9ab7	ce ff 	. . 
	rst 38h			;9ab9	ff 	. 
	rst 38h			;9aba	ff 	. 
	rst 38h			;9abb	ff 	. 
	rst 38h			;9abc	ff 	. 
	rst 8			;9abd	cf 	. 
	ret nc			;9abe	d0 	. 
	pop de			;9abf	d1 	. 
	rst 38h			;9ac0	ff 	. 
	rst 38h			;9ac1	ff 	. 
	rst 38h			;9ac2	ff 	. 
	sub 0d7h		;9ac3	d6 d7 	. . 
	ret c			;9ac5	d8 	. 
	exx			;9ac6	d9 	. 
	rst 38h			;9ac7	ff 	. 
	rst 38h			;9ac8	ff 	. 
	rst 38h			;9ac9	ff 	. 
	rst 38h			;9aca	ff 	. 
	rst 38h			;9acb	ff 	. 
	rst 38h			;9acc	ff 	. 
	rst 38h			;9acd	ff 	. 
	rst 38h			;9ace	ff 	. 
	rst 38h			;9acf	ff 	. 
	rst 38h			;9ad0	ff 	. 
	rst 38h			;9ad1	ff 	. 
	rst 38h			;9ad2	ff 	. 
	rst 38h			;9ad3	ff 	. 
	rst 38h			;9ad4	ff 	. 
	rst 38h			;9ad5	ff 	. 
	rst 38h			;9ad6	ff 	. 
	rst 38h			;9ad7	ff 	. 
	rst 38h			;9ad8	ff 	. 
	rst 38h			;9ad9	ff 	. 
	cp l			;9ada	bd 	. 
	rst 38h			;9adb	ff 	. 
	rst 38h			;9adc	ff 	. 
	rst 38h			;9add	ff 	. 
	cp (hl)			;9ade	be 	. 
	cp a			;9adf	bf 	. 
	ret nz			;9ae0	c0 	. 
	pop bc			;9ae1	c1 	. 
	jp nz,0ffc3h		;9ae2	c2 c3 ff 	. . . 
	rst 38h			;9ae5	ff 	. 
	rst 38h			;9ae6	ff 	. 
	rst 38h			;9ae7	ff 	. 
	rst 38h			;9ae8	ff 	. 
	rst 38h			;9ae9	ff 	. 
	add a,0ffh		;9aea	c6 ff 	. . 
	rst 38h			;9aec	ff 	. 
	rst 38h			;9aed	ff 	. 
	rst 38h			;9aee	ff 	. 
	rst 38h			;9aef	ff 	. 
	rst 0			;9af0	c7 	. 
	ret z			;9af1	c8 	. 
	ret			;9af2	c9 	. 
	jp z,0cccbh		;9af3	ca cb cc 	. . . 
	rst 38h			;9af6	ff 	. 
	call 0ffffh		;9af7	cd ff ff 	. . . 
	rst 38h			;9afa	ff 	. 
	rst 38h			;9afb	ff 	. 
	rst 38h			;9afc	ff 	. 
	rst 38h			;9afd	ff 	. 
	rst 38h			;9afe	ff 	. 
	rst 38h			;9aff	ff 	. 
	rst 38h			;9b00	ff 	. 
	rst 38h			;9b01	ff 	. 
	rst 38h			;9b02	ff 	. 
	rst 38h			;9b03	ff 	. 
	rst 38h			;9b04	ff 	. 
	rst 38h			;9b05	ff 	. 
	rst 38h			;9b06	ff 	. 
	rst 38h			;9b07	ff 	. 
	rst 38h			;9b08	ff 	. 
	rst 38h			;9b09	ff 	. 
	rst 38h			;9b0a	ff 	. 
	rst 38h			;9b0b	ff 	. 
	rst 38h			;9b0c	ff 	. 
	rst 38h			;9b0d	ff 	. 
	rst 38h			;9b0e	ff 	. 
	rst 38h			;9b0f	ff 	. 
	rst 38h			;9b10	ff 	. 
	rst 38h			;9b11	ff 	. 
	rst 38h			;9b12	ff 	. 
	rst 38h			;9b13	ff 	. 
	rst 38h			;9b14	ff 	. 
	rst 38h			;9b15	ff 	. 
	rst 38h			;9b16	ff 	. 
	adc a,e			;9b17	8b 	. 
	adc a,h			;9b18	8c 	. 
	rst 38h			;9b19	ff 	. 
	rst 38h			;9b1a	ff 	. 
	rst 38h			;9b1b	ff 	. 
	adc a,l			;9b1c	8d 	. 
	adc a,(hl)			;9b1d	8e 	. 
	adc a,a			;9b1e	8f 	. 
	sub b			;9b1f	90 	. 
	sub c			;9b20	91 	. 
	sub d			;9b21	92 	. 
	rst 38h			;9b22	ff 	. 
	rst 38h			;9b23	ff 	. 
	rst 38h			;9b24	ff 	. 
	rst 38h			;9b25	ff 	. 
	rst 38h			;9b26	ff 	. 
	rst 38h			;9b27	ff 	. 
	rst 38h			;9b28	ff 	. 
	rst 38h			;9b29	ff 	. 
	and b			;9b2a	a0 	. 
	and c			;9b2b	a1 	. 
	rst 38h			;9b2c	ff 	. 
	rst 38h			;9b2d	ff 	. 
	rst 38h			;9b2e	ff 	. 
	rst 38h			;9b2f	ff 	. 
	and d			;9b30	a2 	. 
	and e			;9b31	a3 	. 
	and h			;9b32	a4 	. 
	rst 38h			;9b33	ff 	. 
	rst 38h			;9b34	ff 	. 
	rst 38h			;9b35	ff 	. 
	and l			;9b36	a5 	. 
	and (hl)			;9b37	a6 	. 
	and a			;9b38	a7 	. 
	rst 38h			;9b39	ff 	. 
	rst 38h			;9b3a	ff 	. 
	rst 38h			;9b3b	ff 	. 
	rst 38h			;9b3c	ff 	. 
	xor b			;9b3d	a8 	. 
	xor c			;9b3e	a9 	. 
	rst 38h			;9b3f	ff 	. 
	rst 38h			;9b40	ff 	. 
	rst 38h			;9b41	ff 	. 
	rst 38h			;9b42	ff 	. 
	rst 38h			;9b43	ff 	. 
	rst 38h			;9b44	ff 	. 
	rst 38h			;9b45	ff 	. 
	rst 38h			;9b46	ff 	. 
	rst 38h			;9b47	ff 	. 
	rst 38h			;9b48	ff 	. 
	rst 38h			;9b49	ff 	. 
	rst 38h			;9b4a	ff 	. 
	rst 38h			;9b4b	ff 	. 
	rst 38h			;9b4c	ff 	. 
	rst 38h			;9b4d	ff 	. 
	rst 38h			;9b4e	ff 	. 
	rst 38h			;9b4f	ff 	. 
	rst 38h			;9b50	ff 	. 
	rst 38h			;9b51	ff 	. 
	rst 38h			;9b52	ff 	. 
	rst 38h			;9b53	ff 	. 
	ld de,0ff12h		;9b54	11 12 ff 	. . . 
	inc de			;9b57	13 	. 
	inc d			;9b58	14 	. 
	dec d			;9b59	15 	. 
	ld d,017h		;9b5a	16 17 	. . 
	rst 38h			;9b5c	ff 	. 
	rst 38h			;9b5d	ff 	. 
	ld b,e			;9b5e	43 	C 
	ld b,h			;9b5f	44 	D 
	ld b,l			;9b60	45 	E 
	ld b,(hl)			;9b61	46 	F 
	rst 38h			;9b62	ff 	. 
	ld b,a			;9b63	47 	G 
	ld c,b			;9b64	48 	H 
	ld c,c			;9b65	49 	I 
	rst 38h			;9b66	ff 	. 
	ld c,d			;9b67	4a 	J 
	rst 38h			;9b68	ff 	. 
	rst 38h			;9b69	ff 	. 
	rst 38h			;9b6a	ff 	. 
	rst 38h			;9b6b	ff 	. 
	rst 38h			;9b6c	ff 	. 
	rst 38h			;9b6d	ff 	. 
	rst 38h			;9b6e	ff 	. 
	rst 38h			;9b6f	ff 	. 
	rst 38h			;9b70	ff 	. 
	xor d			;9b71	aa 	. 
	xor e			;9b72	ab 	. 
	rst 38h			;9b73	ff 	. 
	rst 38h			;9b74	ff 	. 
	rst 38h			;9b75	ff 	. 
	xor h			;9b76	ac 	. 
	xor l			;9b77	ad 	. 
	xor (hl)			;9b78	ae 	. 
	rst 38h			;9b79	ff 	. 
	rst 38h			;9b7a	ff 	. 
	rst 38h			;9b7b	ff 	. 
	xor a			;9b7c	af 	. 
	or b			;9b7d	b0 	. 
	or c			;9b7e	b1 	. 
	rst 38h			;9b7f	ff 	. 
	rst 38h			;9b80	ff 	. 
	rst 38h			;9b81	ff 	. 
	rst 38h			;9b82	ff 	. 
	rst 38h			;9b83	ff 	. 
	rst 38h			;9b84	ff 	. 
	rst 38h			;9b85	ff 	. 
	rst 38h			;9b86	ff 	. 
	rst 38h			;9b87	ff 	. 
	rst 38h			;9b88	ff 	. 
	rst 38h			;9b89	ff 	. 
	rst 38h			;9b8a	ff 	. 
	rst 38h			;9b8b	ff 	. 
	rst 38h			;9b8c	ff 	. 
	rst 38h			;9b8d	ff 	. 
	rst 38h			;9b8e	ff 	. 
	rst 38h			;9b8f	ff 	. 
	rst 38h			;9b90	ff 	. 
	rst 38h			;9b91	ff 	. 
	rst 38h			;9b92	ff 	. 
	rst 38h			;9b93	ff 	. 
	ld de,0ff12h		;9b94	11 12 ff 	. . . 
	rst 38h			;9b97	ff 	. 
	rst 38h			;9b98	ff 	. 
	ld (bc),a			;9b99	02 	. 
	ld d,017h		;9b9a	16 17 	. . 
	rst 38h			;9b9c	ff 	. 
	rst 38h			;9b9d	ff 	. 
	ld c,e			;9b9e	4b 	K 
	ld c,h			;9b9f	4c 	L 
	ld b,l			;9ba0	45 	E 
	ld b,(hl)			;9ba1	46 	F 
	rst 38h			;9ba2	ff 	. 
	rst 38h			;9ba3	ff 	. 
	ld c,l			;9ba4	4d 	M 
	ld c,(hl)			;9ba5	4e 	N 
	rst 38h			;9ba6	ff 	. 
	ld c,d			;9ba7	4a 	J 
	rst 38h			;9ba8	ff 	. 
	rst 38h			;9ba9	ff 	. 
	rst 38h			;9baa	ff 	. 
	rst 38h			;9bab	ff 	. 
	rst 38h			;9bac	ff 	. 
	rst 38h			;9bad	ff 	. 
	rst 38h			;9bae	ff 	. 
	rst 38h			;9baf	ff 	. 
	or d			;9bb0	b2 	. 
	or e			;9bb1	b3 	. 
	or h			;9bb2	b4 	. 
	rst 38h			;9bb3	ff 	. 
	rst 38h			;9bb4	ff 	. 
	rst 38h			;9bb5	ff 	. 
	or l			;9bb6	b5 	. 
	or (hl)			;9bb7	b6 	. 
	or a			;9bb8	b7 	. 
	rst 38h			;9bb9	ff 	. 
	rst 38h			;9bba	ff 	. 
	rst 38h			;9bbb	ff 	. 
	cp b			;9bbc	b8 	. 
	cp c			;9bbd	b9 	. 
	cp d			;9bbe	ba 	. 
	rst 38h			;9bbf	ff 	. 
	rst 38h			;9bc0	ff 	. 
	rst 38h			;9bc1	ff 	. 
	rst 38h			;9bc2	ff 	. 
	cp e			;9bc3	bb 	. 
	cp h			;9bc4	bc 	. 
	rst 38h			;9bc5	ff 	. 
	rst 38h			;9bc6	ff 	. 
	rst 38h			;9bc7	ff 	. 
	rst 38h			;9bc8	ff 	. 
	rst 38h			;9bc9	ff 	. 
	rst 38h			;9bca	ff 	. 
	rst 38h			;9bcb	ff 	. 
	rst 38h			;9bcc	ff 	. 
	rst 38h			;9bcd	ff 	. 
	rst 38h			;9bce	ff 	. 
	rst 38h			;9bcf	ff 	. 
	rst 38h			;9bd0	ff 	. 
	rst 38h			;9bd1	ff 	. 
	nop			;9bd2	00 	. 
	ld bc,0ffffh		;9bd3	01 ff ff 	. . . 
	rst 38h			;9bd6	ff 	. 
	rst 38h			;9bd7	ff 	. 
	ld (bc),a			;9bd8	02 	. 
	inc bc			;9bd9	03 	. 
	inc b			;9bda	04 	. 
	rst 38h			;9bdb	ff 	. 
	rst 38h			;9bdc	ff 	. 
	rst 38h			;9bdd	ff 	. 
	dec b			;9bde	05 	. 
	ld b,007h		;9bdf	06 07 	. . 
	rst 38h			;9be1	ff 	. 
	rst 38h			;9be2	ff 	. 
	rst 38h			;9be3	ff 	. 
	ex af,af'			;9be4	08 	. 
	add hl,bc			;9be5	09 	. 
	rst 38h			;9be6	ff 	. 
	rst 38h			;9be7	ff 	. 
	rst 38h			;9be8	ff 	. 
	rst 38h			;9be9	ff 	. 
	ld a,(bc)			;9bea	0a 	. 
	dec bc			;9beb	0b 	. 
	inc c			;9bec	0c 	. 
	rst 38h			;9bed	ff 	. 
	rst 38h			;9bee	ff 	. 
	dec c			;9bef	0d 	. 
	ld c,00fh		;9bf0	0e 0f 	. . 
	djnz $+1		;9bf2	10 ff 	. . 
	rst 38h			;9bf4	ff 	. 
	rst 38h			;9bf5	ff 	. 
	ld h,e			;9bf6	63 	c 
	rst 38h			;9bf7	ff 	. 
	rst 38h			;9bf8	ff 	. 
	rst 38h			;9bf9	ff 	. 
	ld h,h			;9bfa	64 	d 
	ld h,l			;9bfb	65 	e 
	ld h,(hl)			;9bfc	66 	f 
	rst 38h			;9bfd	ff 	. 
	rst 38h			;9bfe	ff 	. 
	rst 38h			;9bff	ff 	. 
	ld h,a			;9c00	67 	g 
	ld l,b			;9c01	68 	h 
	ld l,c			;9c02	69 	i 
	rst 38h			;9c03	ff 	. 
	rst 38h			;9c04	ff 	. 
	rst 38h			;9c05	ff 	. 
	rst 38h			;9c06	ff 	. 
	ld l,d			;9c07	6a 	j 
	ld l,e			;9c08	6b 	k 
	rst 38h			;9c09	ff 	. 
	rst 38h			;9c0a	ff 	. 
	rst 38h			;9c0b	ff 	. 
	rst 38h			;9c0c	ff 	. 
	ld l,h			;9c0d	6c 	l 
	ld l,l			;9c0e	6d 	m 
	ld l,(hl)			;9c0f	6e 	n 
	rst 38h			;9c10	ff 	. 
	rst 38h			;9c11	ff 	. 
	rst 38h			;9c12	ff 	. 
	ld l,a			;9c13	6f 	o 
	ld (hl),b			;9c14	70 	p 
	rst 38h			;9c15	ff 	. 
	rst 38h			;9c16	ff 	. 
	rst 38h			;9c17	ff 	. 
	rst 38h			;9c18	ff 	. 
	ld (hl),c			;9c19	71 	q 
	rst 38h			;9c1a	ff 	. 
	rst 38h			;9c1b	ff 	. 
	rst 38h			;9c1c	ff 	. 
	rst 38h			;9c1d	ff 	. 
	rst 38h			;9c1e	ff 	. 
	rst 38h			;9c1f	ff 	. 
	rst 38h			;9c20	ff 	. 
	rst 38h			;9c21	ff 	. 
	rst 38h			;9c22	ff 	. 
	ld de,0ff12h		;9c23	11 12 ff 	. . . 
	inc de			;9c26	13 	. 
	inc d			;9c27	14 	. 
	dec d			;9c28	15 	. 
	ld d,017h		;9c29	16 17 	. . 
	rst 38h			;9c2b	ff 	. 
	rst 38h			;9c2c	ff 	. 
	rst 38h			;9c2d	ff 	. 
	jr $+27		;9c2e	18 19 	. . 
	ld a,(de)			;9c30	1a 	. 
	rst 38h			;9c31	ff 	. 
	rst 38h			;9c32	ff 	. 
	rst 38h			;9c33	ff 	. 
	ex af,af'			;9c34	08 	. 
	add hl,bc			;9c35	09 	. 
	rst 38h			;9c36	ff 	. 
	rst 38h			;9c37	ff 	. 
	rst 38h			;9c38	ff 	. 
	rst 38h			;9c39	ff 	. 
	ld a,(bc)			;9c3a	0a 	. 
	dec bc			;9c3b	0b 	. 
	inc c			;9c3c	0c 	. 
	rst 38h			;9c3d	ff 	. 
	rst 38h			;9c3e	ff 	. 
	dec c			;9c3f	0d 	. 
	ld c,00fh		;9c40	0e 0f 	. . 
	djnz $+1		;9c42	10 ff 	. . 
	adc a,e			;9c44	8b 	. 
	adc a,h			;9c45	8c 	. 
	adc a,l			;9c46	8d 	. 
	adc a,(hl)			;9c47	8e 	. 
	rst 38h			;9c48	ff 	. 
	rst 38h			;9c49	ff 	. 
	adc a,a			;9c4a	8f 	. 
	sub b			;9c4b	90 	. 
	sub c			;9c4c	91 	. 
	sub d			;9c4d	92 	. 
	rst 38h			;9c4e	ff 	. 
	rst 38h			;9c4f	ff 	. 
	rst 38h			;9c50	ff 	. 
	sub e			;9c51	93 	. 
	sub h			;9c52	94 	. 
	sub l			;9c53	95 	. 
	rst 38h			;9c54	ff 	. 
	rst 38h			;9c55	ff 	. 
	rst 38h			;9c56	ff 	. 
	sub (hl)			;9c57	96 	. 
	sub a			;9c58	97 	. 
	rst 38h			;9c59	ff 	. 
	rst 38h			;9c5a	ff 	. 
	rst 38h			;9c5b	ff 	. 
	sbc a,b			;9c5c	98 	. 
	sbc a,c			;9c5d	99 	. 
	sbc a,d			;9c5e	9a 	. 
	rst 38h			;9c5f	ff 	. 
	rst 38h			;9c60	ff 	. 
	rst 38h			;9c61	ff 	. 
	sbc a,e			;9c62	9b 	. 
	sbc a,h			;9c63	9c 	. 
	sbc a,l			;9c64	9d 	. 
	rst 38h			;9c65	ff 	. 
	rst 38h			;9c66	ff 	. 
	rst 38h			;9c67	ff 	. 
	rst 38h			;9c68	ff 	. 
	sbc a,(hl)			;9c69	9e 	. 
	sbc a,a			;9c6a	9f 	. 
	rst 38h			;9c6b	ff 	. 
	rst 38h			;9c6c	ff 	. 
	rst 38h			;9c6d	ff 	. 
	rst 38h			;9c6e	ff 	. 
	rst 38h			;9c6f	ff 	. 
	rst 38h			;9c70	ff 	. 
	rst 38h			;9c71	ff 	. 
	rst 38h			;9c72	ff 	. 
	dec de			;9c73	1b 	. 
	rst 38h			;9c74	ff 	. 
	rst 38h			;9c75	ff 	. 
	rst 38h			;9c76	ff 	. 
	rst 38h			;9c77	ff 	. 
	inc e			;9c78	1c 	. 
	dec e			;9c79	1d 	. 
	ld e,0ffh		;9c7a	1e ff 	. . 
	rst 38h			;9c7c	ff 	. 
	rst 38h			;9c7d	ff 	. 
	rra			;9c7e	1f 	. 
	jr nz,$+35		;9c7f	20 21 	  ! 
	rst 38h			;9c81	ff 	. 
	rst 38h			;9c82	ff 	. 
	rst 38h			;9c83	ff 	. 
	rst 38h			;9c84	ff 	. 
	rst 38h			;9c85	ff 	. 
	rst 38h			;9c86	ff 	. 
	rst 38h			;9c87	ff 	. 
	rst 38h			;9c88	ff 	. 
	rst 38h			;9c89	ff 	. 
	rst 38h			;9c8a	ff 	. 
	rst 38h			;9c8b	ff 	. 
	rst 38h			;9c8c	ff 	. 
	rst 38h			;9c8d	ff 	. 
	rst 38h			;9c8e	ff 	. 
	rst 38h			;9c8f	ff 	. 
	rst 38h			;9c90	ff 	. 
	rst 38h			;9c91	ff 	. 
	rst 38h			;9c92	ff 	. 
	rst 38h			;9c93	ff 	. 
	rst 38h			;9c94	ff 	. 
	ld (0ff23h),hl		;9c95	22 23 ff 	" # . 
	rst 38h			;9c98	ff 	. 
	rst 38h			;9c99	ff 	. 
	rst 38h			;9c9a	ff 	. 
	inc h			;9c9b	24 	$ 
	dec h			;9c9c	25 	% 
	rst 38h			;9c9d	ff 	. 
	rst 38h			;9c9e	ff 	. 
	rst 38h			;9c9f	ff 	. 
	rst 38h			;9ca0	ff 	. 
	ld h,027h		;9ca1	26 27 	& ' 
	rst 38h			;9ca3	ff 	. 
	jr z,$+43		;9ca4	28 29 	( ) 
	ld hl,(0ffffh)		;9ca6	2a ff ff 	* . . 
	rst 38h			;9ca9	ff 	. 
	dec hl			;9caa	2b 	+ 
	inc l			;9cab	2c 	, 
	dec l			;9cac	2d 	- 
	rst 38h			;9cad	ff 	. 
	rst 38h			;9cae	ff 	. 
	rst 38h			;9caf	ff 	. 
	rst 38h			;9cb0	ff 	. 
	ld l,02fh		;9cb1	2e 2f 	. / 
	rst 38h			;9cb3	ff 	. 
	jr nc,$+51		;9cb4	30 31 	0 1 
	ld (0ffffh),a		;9cb6	32 ff ff 	2 . . 
	rst 38h			;9cb9	ff 	. 
	inc sp			;9cba	33 	3 
	inc (hl)			;9cbb	34 	4 
	dec (hl)			;9cbc	35 	5 
	rst 38h			;9cbd	ff 	. 
	rst 38h			;9cbe	ff 	. 
	rst 38h			;9cbf	ff 	. 
	rst 38h			;9cc0	ff 	. 
	ld (hl),037h		;9cc1	36 37 	6 7 
	jr c,$+59		;9cc3	38 39 	8 9 
	ld a,(0ff3bh)		;9cc5	3a 3b ff 	: ; . 
	rst 38h			;9cc8	ff 	. 
	rst 38h			;9cc9	ff 	. 
	inc a			;9cca	3c 	< 
	dec a			;9ccb	3d 	= 
	ld a,03fh		;9ccc	3e 3f 	> ? 
	rst 38h			;9cce	ff 	. 
	rst 38h			;9ccf	ff 	. 
	ld b,b			;9cd0	40 	@ 
	rst 38h			;9cd1	ff 	. 
	ld b,c			;9cd2	41 	A 
	ld b,d			;9cd3	42 	B 
	rst 38h			;9cd4	ff 	. 
	ld (hl),d			;9cd5	72 	r 
	rst 38h			;9cd6	ff 	. 
	ld (hl),e			;9cd7	73 	s 
	ld (hl),h			;9cd8	74 	t 
	rst 38h			;9cd9	ff 	. 
	ld (hl),l			;9cda	75 	u 
	halt			;9cdb	76 	v 
	ld (hl),a			;9cdc	77 	w 
	ld a,b			;9cdd	78 	x 
	ld a,c			;9cde	79 	y 
	rst 38h			;9cdf	ff 	. 
	ld a,d			;9ce0	7a 	z 
	ld a,e			;9ce1	7b 	{ 
	ld a,h			;9ce2	7c 	| 
	ld a,l			;9ce3	7d 	} 
	ld a,(hl)			;9ce4	7e 	~ 
	rst 38h			;9ce5	ff 	. 
	rst 38h			;9ce6	ff 	. 
	rst 38h			;9ce7	ff 	. 
	ld a,a			;9ce8	7f 	 
	add a,b			;9ce9	80 	. 
	add a,c			;9cea	81 	. 
	rst 38h			;9ceb	ff 	. 
	rst 38h			;9cec	ff 	. 
	rst 38h			;9ced	ff 	. 
	rst 38h			;9cee	ff 	. 
	add a,d			;9cef	82 	. 
	add a,e			;9cf0	83 	. 
	rst 38h			;9cf1	ff 	. 
	rst 38h			;9cf2	ff 	. 
	rst 38h			;9cf3	ff 	. 
	rst 38h			;9cf4	ff 	. 
	add a,h			;9cf5	84 	. 
	rst 38h			;9cf6	ff 	. 
	rst 38h			;9cf7	ff 	. 
	rst 38h			;9cf8	ff 	. 
	rst 38h			;9cf9	ff 	. 
	rst 38h			;9cfa	ff 	. 
	rst 38h			;9cfb	ff 	. 
	rst 38h			;9cfc	ff 	. 
	rst 38h			;9cfd	ff 	. 
	ld d,l			;9cfe	55 	U 
	ld de,0ffffh		;9cff	11 ff ff 	. . . 
	rst 38h			;9d02	ff 	. 
	rst 38h			;9d03	ff 	. 
	ld d,(hl)			;9d04	56 	V 
	ld d,a			;9d05	57 	W 
	rst 38h			;9d06	ff 	. 
	rst 38h			;9d07	ff 	. 
	rst 38h			;9d08	ff 	. 
	rst 38h			;9d09	ff 	. 
	ld e,b			;9d0a	58 	X 
	ld e,c			;9d0b	59 	Y 
	rst 38h			;9d0c	ff 	. 
	rst 38h			;9d0d	ff 	. 
	rst 38h			;9d0e	ff 	. 
	rst 38h			;9d0f	ff 	. 
	ld e,d			;9d10	5a 	Z 
	ld e,e			;9d11	5b 	[ 
	rst 38h			;9d12	ff 	. 
	rst 38h			;9d13	ff 	. 
	rst 38h			;9d14	ff 	. 
	rst 38h			;9d15	ff 	. 
	ld e,h			;9d16	5c 	\ 
	ld e,l			;9d17	5d 	] 
	rst 38h			;9d18	ff 	. 
	rst 38h			;9d19	ff 	. 
	rst 38h			;9d1a	ff 	. 
	rst 38h			;9d1b	ff 	. 
	rst 38h			;9d1c	ff 	. 
	ld e,(hl)			;9d1d	5e 	^ 
	rst 38h			;9d1e	ff 	. 
	rst 38h			;9d1f	ff 	. 
	rst 38h			;9d20	ff 	. 
	rst 38h			;9d21	ff 	. 
	rst 38h			;9d22	ff 	. 
	rst 38h			;9d23	ff 	. 
	rst 38h			;9d24	ff 	. 
	ld e,a			;9d25	5f 	_ 
	ld d,l			;9d26	55 	U 
	ld de,0ffffh		;9d27	11 ff ff 	. . . 
	rst 38h			;9d2a	ff 	. 
	ld h,b			;9d2b	60 	` 
	ld d,(hl)			;9d2c	56 	V 
	ld d,a			;9d2d	57 	W 
	rst 38h			;9d2e	ff 	. 
	rst 38h			;9d2f	ff 	. 
	rst 38h			;9d30	ff 	. 
	rst 38h			;9d31	ff 	. 
	ld h,c			;9d32	61 	a 
	ld e,c			;9d33	59 	Y 
	rst 38h			;9d34	ff 	. 
	rst 38h			;9d35	ff 	. 
	rst 38h			;9d36	ff 	. 
	rst 38h			;9d37	ff 	. 
	ld h,d			;9d38	62 	b 
	ld e,e			;9d39	5b 	[ 
	rst 38h			;9d3a	ff 	. 
	rst 38h			;9d3b	ff 	. 
	rst 38h			;9d3c	ff 	. 
	rst 38h			;9d3d	ff 	. 
	ld e,h			;9d3e	5c 	\ 
	ld e,l			;9d3f	5d 	] 
	rst 38h			;9d40	ff 	. 
	rst 38h			;9d41	ff 	. 
	rst 38h			;9d42	ff 	. 
	rst 38h			;9d43	ff 	. 
	rst 38h			;9d44	ff 	. 
	ld e,(hl)			;9d45	5e 	^ 
	rst 38h			;9d46	ff 	. 
	rst 38h			;9d47	ff 	. 
	dec de			;9d48	1b 	. 
	inc e			;9d49	1c 	. 
	rst 38h			;9d4a	ff 	. 
	rst 38h			;9d4b	ff 	. 
	rst 38h			;9d4c	ff 	. 
	rst 38h			;9d4d	ff 	. 
	rst 38h			;9d4e	ff 	. 
	rst 38h			;9d4f	ff 	. 
	rst 38h			;9d50	ff 	. 
	rst 38h			;9d51	ff 	. 
	dec e			;9d52	1d 	. 
	ld e,02bh		;9d53	1e 2b 	. + 
	inc l			;9d55	2c 	, 
	dec l			;9d56	2d 	- 
	ld l,01fh		;9d57	2e 1f 	. . 
	rst 38h			;9d59	ff 	. 
	rst 38h			;9d5a	ff 	. 
	rst 38h			;9d5b	ff 	. 
	jr nz,$+106		;9d5c	20 68 	  h 
	ld l,c			;9d5e	69 	i 
	ld l,d			;9d5f	6a 	j 
	ld (hl),b			;9d60	70 	p 
	ld (hl),c			;9d61	71 	q 
	ld l,l			;9d62	6d 	m 
	ld l,(hl)			;9d63	6e 	n 
	ld l,a			;9d64	6f 	o 
	rst 38h			;9d65	ff 	. 
	rst 38h			;9d66	ff 	. 
	ld hl,02322h		;9d67	21 22 23 	! " # 
	ld (hl),e			;9d6a	73 	s 
	ld (hl),d			;9d6b	72 	r 
	ld (hl),l			;9d6c	75 	u 
	halt			;9d6d	76 	v 
	ld (hl),a			;9d6e	77 	w 
	inc h			;9d6f	24 	$ 
	rst 38h			;9d70	ff 	. 
	rst 38h			;9d71	ff 	. 
	dec h			;9d72	25 	% 
	ld h,027h		;9d73	26 27 	& ' 
	ld b,d			;9d75	42 	B 
	ld b,e			;9d76	43 	C 
	ld b,h			;9d77	44 	D 
	jr z,$+43		;9d78	28 29 	( ) 
	ld hl,(0ffffh)		;9d7a	2a ff ff 	* . . 
	dec de			;9d7d	1b 	. 
	inc e			;9d7e	1c 	. 
	rst 38h			;9d7f	ff 	. 
	rst 38h			;9d80	ff 	. 
	rst 38h			;9d81	ff 	. 
	rst 38h			;9d82	ff 	. 
	rst 38h			;9d83	ff 	. 
	rst 38h			;9d84	ff 	. 
	rst 38h			;9d85	ff 	. 
	rst 38h			;9d86	ff 	. 
	dec e			;9d87	1d 	. 
	ld e,0ffh		;9d88	1e ff 	. . 
	rst 38h			;9d8a	ff 	. 
	rst 38h			;9d8b	ff 	. 
	rst 38h			;9d8c	ff 	. 
	rra			;9d8d	1f 	. 
	rst 38h			;9d8e	ff 	. 
	rst 38h			;9d8f	ff 	. 
	rst 38h			;9d90	ff 	. 
	jr nz,$+106		;9d91	20 68 	  h 
	ld l,c			;9d93	69 	i 
	ld l,d			;9d94	6a 	j 
	ld l,e			;9d95	6b 	k 
	ld l,h			;9d96	6c 	l 
	ld l,l			;9d97	6d 	m 
	ld l,(hl)			;9d98	6e 	n 
	ld l,a			;9d99	6f 	o 
	rst 38h			;9d9a	ff 	. 
	rst 38h			;9d9b	ff 	. 
	ld hl,02322h		;9d9c	21 22 23 	! " # 
	ld (hl),e			;9d9f	73 	s 
	ld (hl),h			;9da0	74 	t 
	ld (hl),l			;9da1	75 	u 
	halt			;9da2	76 	v 
	ld (hl),a			;9da3	77 	w 
	inc h			;9da4	24 	$ 
	rst 38h			;9da5	ff 	. 
	rst 38h			;9da6	ff 	. 
	dec h			;9da7	25 	% 
	ld h,027h		;9da8	26 27 	& ' 
	ld b,d			;9daa	42 	B 
	ld b,e			;9dab	43 	C 
	ld b,h			;9dac	44 	D 
	jr z,$+43		;9dad	28 29 	( ) 
	ld hl,(0ffffh)		;9daf	2a ff ff 	* . . 
	rst 38h			;9db2	ff 	. 
	rst 38h			;9db3	ff 	. 
	ld b,l			;9db4	45 	E 
	ld b,(hl)			;9db5	46 	F 
	ld b,a			;9db6	47 	G 
	ld c,b			;9db7	48 	H 
	ld c,c			;9db8	49 	I 
	ld c,d			;9db9	4a 	J 
	rst 38h			;9dba	ff 	. 
	ld c,e			;9dbb	4b 	K 
	ld c,h			;9dbc	4c 	L 
	ld c,l			;9dbd	4d 	M 
	ld c,(hl)			;9dbe	4e 	N 
	ld c,a			;9dbf	4f 	O 
	ld d,b			;9dc0	50 	P 
	ld d,c			;9dc1	51 	Q 
	ld d,d			;9dc2	52 	R 
	ld d,e			;9dc3	53 	S 
	rst 38h			;9dc4	ff 	. 
	rst 38h			;9dc5	ff 	. 
	ld d,h			;9dc6	54 	T 
	ld d,l			;9dc7	55 	U 
	ld d,(hl)			;9dc8	56 	V 
	ld d,a			;9dc9	57 	W 
	ld e,b			;9dca	58 	X 
	ld e,c			;9dcb	59 	Y 
	ld e,d			;9dcc	5a 	Z 
	ld e,e			;9dcd	5b 	[ 
	ld e,h			;9dce	5c 	\ 
	ld e,l			;9dcf	5d 	] 
	rst 38h			;9dd0	ff 	. 
	rst 38h			;9dd1	ff 	. 
	rst 38h			;9dd2	ff 	. 
	rst 38h			;9dd3	ff 	. 
	ld e,(hl)			;9dd4	5e 	^ 
	ld e,a			;9dd5	5f 	_ 
	rst 38h			;9dd6	ff 	. 
	ld h,b			;9dd7	60 	` 
	ld h,c			;9dd8	61 	a 
	rst 38h			;9dd9	ff 	. 
	rst 38h			;9dda	ff 	. 
	rst 38h			;9ddb	ff 	. 
	rst 38h			;9ddc	ff 	. 
	rst 38h			;9ddd	ff 	. 
	rst 38h			;9dde	ff 	. 
	rst 38h			;9ddf	ff 	. 
	rst 38h			;9de0	ff 	. 
	cp l			;9de1	bd 	. 
	cp (hl)			;9de2	be 	. 
	cp a			;9de3	bf 	. 
	rst 38h			;9de4	ff 	. 
	rst 38h			;9de5	ff 	. 
	rst 38h			;9de6	ff 	. 
	ret nz			;9de7	c0 	. 
	pop bc			;9de8	c1 	. 
	jp nz,0ffffh		;9de9	c2 ff ff 	. . . 
	rst 38h			;9dec	ff 	. 
	jp 0c5c4h		;9ded	c3 c4 c5 	. . . 
	rst 38h			;9df0	ff 	. 
	rst 38h			;9df1	ff 	. 
	rst 38h			;9df2	ff 	. 
	rst 38h			;9df3	ff 	. 
	rst 38h			;9df4	ff 	. 
	rst 38h			;9df5	ff 	. 
	rst 38h			;9df6	ff 	. 
	rst 38h			;9df7	ff 	. 
	rst 38h			;9df8	ff 	. 
	rst 38h			;9df9	ff 	. 
	rst 38h			;9dfa	ff 	. 
	rst 38h			;9dfb	ff 	. 
	rst 38h			;9dfc	ff 	. 
	rst 38h			;9dfd	ff 	. 
	rst 38h			;9dfe	ff 	. 
	rst 38h			;9dff	ff 	. 
	rst 38h			;9e00	ff 	. 
	rst 38h			;9e01	ff 	. 
	rst 38h			;9e02	ff 	. 
	ld c,a			;9e03	4f 	O 
	ld d,b			;9e04	50 	P 
	ld d,c			;9e05	51 	Q 
	ld (de),a			;9e06	12 	. 
	ld d,d			;9e07	52 	R 
	ld d,e			;9e08	53 	S 
	ld (bc),a			;9e09	02 	. 
	ld d,04ah		;9e0a	16 4a 	. J 
	inc d			;9e0c	14 	. 
	ld (bc),a			;9e0d	02 	. 
	rla			;9e0e	17 	. 
	rst 38h			;9e0f	ff 	. 
	rst 38h			;9e10	ff 	. 
	rst 38h			;9e11	ff 	. 
	rst 38h			;9e12	ff 	. 
	rst 38h			;9e13	ff 	. 
	rst 38h			;9e14	ff 	. 
	rst 38h			;9e15	ff 	. 
	rst 38h			;9e16	ff 	. 
	rst 38h			;9e17	ff 	. 
	rst 38h			;9e18	ff 	. 
	rst 38h			;9e19	ff 	. 
	rst 38h			;9e1a	ff 	. 
	rst 38h			;9e1b	ff 	. 
	rst 38h			;9e1c	ff 	. 
	rst 38h			;9e1d	ff 	. 
	rst 38h			;9e1e	ff 	. 
	rst 38h			;9e1f	ff 	. 
	rst 38h			;9e20	ff 	. 
	rst 38h			;9e21	ff 	. 
	rst 38h			;9e22	ff 	. 
	rst 38h			;9e23	ff 	. 
	rst 38h			;9e24	ff 	. 
	rst 38h			;9e25	ff 	. 
	rst 38h			;9e26	ff 	. 
	rst 38h			;9e27	ff 	. 
	rst 38h			;9e28	ff 	. 
	rst 38h			;9e29	ff 	. 
	rst 38h			;9e2a	ff 	. 
	rst 38h			;9e2b	ff 	. 
	rst 38h			;9e2c	ff 	. 
	rst 38h			;9e2d	ff 	. 
	rst 38h			;9e2e	ff 	. 
	add a,(hl)			;9e2f	86 	. 
	rst 38h			;9e30	ff 	. 
	rst 38h			;9e31	ff 	. 
	rst 38h			;9e32	ff 	. 
	rst 38h			;9e33	ff 	. 
	add a,a			;9e34	87 	. 
	adc a,b			;9e35	88 	. 
	adc a,c			;9e36	89 	. 
	adc a,d			;9e37	8a 	. 
	rst 38h			;9e38	ff 	. 
	call nc,0d2d2h		;9e39	d4 d2 d2 	. . . 
	out (0d3h),a		;9e3c	d3 d3 	. . 
	push de			;9e3e	d5 	. 
	nop			;9e3f	00 	. 
	call p,0f600h		;9e40	f4 00 f6 	. . . 
	ret m			;9e43	f8 	. 
	push af			;9e44	f5 	. 
	ei			;9e45	fb 	. 
	ei			;9e46	fb 	. 
	ei			;9e47	fb 	. 
	ei			;9e48	fb 	. 
	ei			;9e49	fb 	. 
	ei			;9e4a	fb 	. 
	add a,c			;9e4b	81 	. 
	add a,d			;9e4c	82 	. 
	add a,d			;9e4d	82 	. 
	add a,d			;9e4e	82 	. 
	add a,d			;9e4f	82 	. 
	add a,d			;9e50	82 	. 
	add a,d			;9e51	82 	. 
	add a,d			;9e52	82 	. 
	add a,e			;9e53	83 	. 
	add a,h			;9e54	84 	. 
	ld bc,00101h		;9e55	01 01 01 	. . . 
	ld bc,00101h		;9e58	01 01 01 	. . . 
	ld bc,08485h		;9e5b	01 85 84 	. . . 
	ld bc,00101h		;9e5e	01 01 01 	. . . 
	ld bc,00101h		;9e61	01 01 01 	. . . 
	ld bc,08485h		;9e64	01 85 84 	. . . 
	ld bc,00101h		;9e67	01 01 01 	. . . 
	ld bc,00101h		;9e6a	01 01 01 	. . . 
	ld bc,08485h		;9e6d	01 85 84 	. . . 
	ld bc,00101h		;9e70	01 01 01 	. . . 
	ld bc,00101h		;9e73	01 01 01 	. . . 
	ld bc,08685h		;9e76	01 85 86 	. . . 
	add a,a			;9e79	87 	. 
	add a,a			;9e7a	87 	. 
	add a,a			;9e7b	87 	. 
	add a,a			;9e7c	87 	. 
	add a,a			;9e7d	87 	. 
	add a,a			;9e7e	87 	. 
	add a,a			;9e7f	87 	. 
	adc a,b			;9e80	88 	. 
	adc a,c			;9e81	89 	. 
	adc a,d			;9e82	8a 	. 
	adc a,d			;9e83	8a 	. 
	adc a,d			;9e84	8a 	. 
	adc a,d			;9e85	8a 	. 
	adc a,e			;9e86	8b 	. 
	adc a,h			;9e87	8c 	. 
	and c			;9e88	a1 	. 
	and d			;9e89	a2 	. 
	and c			;9e8a	a1 	. 
	and e			;9e8b	a3 	. 
	adc a,l			;9e8c	8d 	. 
	adc a,h			;9e8d	8c 	. 
	and e			;9e8e	a3 	. 
	and c			;9e8f	a1 	. 
	and d			;9e90	a2 	. 
	and d			;9e91	a2 	. 
	adc a,l			;9e92	8d 	. 
	adc a,h			;9e93	8c 	. 
	and c			;9e94	a1 	. 
	and d			;9e95	a2 	. 
	and c			;9e96	a1 	. 
	and d			;9e97	a2 	. 
	adc a,l			;9e98	8d 	. 
	adc a,(hl)			;9e99	8e 	. 
	adc a,a			;9e9a	8f 	. 
	adc a,a			;9e9b	8f 	. 
	adc a,a			;9e9c	8f 	. 
	adc a,a			;9e9d	8f 	. 
	sub b			;9e9e	90 	. 
	nop			;9e9f	00 	. 
	sub c			;9ea0	91 	. 
	sub d			;9ea1	92 	. 
	sub e			;9ea2	93 	. 
	sub h			;9ea3	94 	. 
	nop			;9ea4	00 	. 
	and c			;9ea5	a1 	. 
	and c			;9ea6	a1 	. 
	and c			;9ea7	a1 	. 
	and c			;9ea8	a1 	. 
	and c			;9ea9	a1 	. 
	and c			;9eaa	a1 	. 
	and c			;9eab	a1 	. 
	and c			;9eac	a1 	. 
	and c			;9ead	a1 	. 
	and c			;9eae	a1 	. 
	and c			;9eaf	a1 	. 
	and c			;9eb0	a1 	. 
	and d			;9eb1	a2 	. 
	and d			;9eb2	a2 	. 
	and d			;9eb3	a2 	. 
	and d			;9eb4	a2 	. 
	and d			;9eb5	a2 	. 
	and d			;9eb6	a2 	. 
	and d			;9eb7	a2 	. 
	and d			;9eb8	a2 	. 
	and d			;9eb9	a2 	. 
	and d			;9eba	a2 	. 
	and d			;9ebb	a2 	. 
	and d			;9ebc	a2 	. 
	and e			;9ebd	a3 	. 
	and e			;9ebe	a3 	. 
	and e			;9ebf	a3 	. 
	and e			;9ec0	a3 	. 
	and e			;9ec1	a3 	. 
	and e			;9ec2	a3 	. 
	and e			;9ec3	a3 	. 
	and e			;9ec4	a3 	. 
	and e			;9ec5	a3 	. 
	and e			;9ec6	a3 	. 
	and e			;9ec7	a3 	. 
	and e			;9ec8	a3 	. 
	and c			;9ec9	a1 	. 
	and d			;9eca	a2 	. 
	and e			;9ecb	a3 	. 
	and e			;9ecc	a3 	. 
	and d			;9ecd	a2 	. 
	and e			;9ece	a3 	. 
	and c			;9ecf	a1 	. 
	and e			;9ed0	a3 	. 
	and c			;9ed1	a1 	. 
	and d			;9ed2	a2 	. 
	and c			;9ed3	a1 	. 
	and e			;9ed4	a3 	. 
	sub l			;9ed5	95 	. 
	sub (hl)			;9ed6	96 	. 
	sub a			;9ed7	97 	. 
	sbc a,b			;9ed8	98 	. 
	sbc a,c			;9ed9	99 	. 
	sbc a,d			;9eda	9a 	. 
	sbc a,e			;9edb	9b 	. 
	sbc a,h			;9edc	9c 	. 
	sbc a,l			;9edd	9d 	. 
	sbc a,(hl)			;9ede	9e 	. 
	sbc a,a			;9edf	9f 	. 
	and b			;9ee0	a0 	. 
	ret m			;9ee1	f8 	. 
	ret m			;9ee2	f8 	. 
	ret m			;9ee3	f8 	. 
	pop de			;9ee4	d1 	. 
	pop de			;9ee5	d1 	. 
	nop			;9ee6	00 	. 
	ret m			;9ee7	f8 	. 
	ret m			;9ee8	f8 	. 
	ret nc			;9ee9	d0 	. 
	ret m			;9eea	f8 	. 
	nop			;9eeb	00 	. 
	ret nc			;9eec	d0 	. 
	nop			;9eed	00 	. 
	nop			;9eee	00 	. 
	adc a,000h		;9eef	ce 00 	. . 
	adc a,0cfh		;9ef1	ce cf 	. . 
	adc a,0cfh		;9ef3	ce cf 	. . 
	rst 8			;9ef5	cf 	. 
	call 00000h		;9ef6	cd 00 00 	. . . 
	rst 8			;9ef9	cf 	. 
	call 0cf00h		;9efa	cd 00 cf 	. . . 
	rst 8			;9efd	cf 	. 
	call 0f600h		;9efe	cd 00 f6 	. . . 
	or 0f8h		;9f01	f6 f8 	. . 
	ret m			;9f03	f8 	. 
	ret m			;9f04	f8 	. 
	ret m			;9f05	f8 	. 
	ret m			;9f06	f8 	. 
	ret m			;9f07	f8 	. 
	ret m			;9f08	f8 	. 
	pop de			;9f09	d1 	. 
	nop			;9f0a	00 	. 
	push af			;9f0b	f5 	. 
	nop			;9f0c	00 	. 
	ret m			;9f0d	f8 	. 
	push af			;9f0e	f5 	. 
	ret m			;9f0f	f8 	. 
	ret m			;9f10	f8 	. 
	ret m			;9f11	f8 	. 
	ret m			;9f12	f8 	. 
	ret m			;9f13	f8 	. 
	ret m			;9f14	f8 	. 
	nop			;9f15	00 	. 
	ret nc			;9f16	d0 	. 
	ld bc,0201fh		;9f17	01 1f 20 	. .   
	ld e,01eh		;9f1a	1e 1e 	. . 
	ld hl,01e1eh		;9f1c	21 1e 1e 	! . . 
	ld e,01eh		;9f1f	1e 1e 	. . 
	ld bc,02322h		;9f21	01 22 23 	. " # 
	inc h			;9f24	24 	$ 
	inc h			;9f25	24 	$ 
	daa			;9f26	27 	' 
	jr z,$+43		;9f27	28 29 	( ) 
	ld e,02ah		;9f29	1e 2a 	. * 
	dec hl			;9f2b	2b 	+ 
	ld d,(hl)			;9f2c	56 	V 
	ld d,a			;9f2d	57 	W 
	ld e,b			;9f2e	58 	X 
	ld d,a			;9f2f	57 	W 
	ld e,c			;9f30	59 	Y 
	ld e,d			;9f31	5a 	Z 
	ld e,h			;9f32	5c 	\ 
	ld e,e			;9f33	5b 	[ 
	ld e,h			;9f34	5c 	\ 
	ld e,l			;9f35	5d 	] 
	ld e,d			;9f36	5a 	Z 
	ld e,h			;9f37	5c 	\ 
	ld e,e			;9f38	5b 	[ 
	ld e,h			;9f39	5c 	\ 
	ld e,l			;9f3a	5d 	] 
	ld e,d			;9f3b	5a 	Z 
	ld e,(hl)			;9f3c	5e 	^ 
	ld e,a			;9f3d	5f 	_ 
	ld h,b			;9f3e	60 	` 
	ld e,l			;9f3f	5d 	] 
	ld e,d			;9f40	5a 	Z 
	ld e,h			;9f41	5c 	\ 
	ld e,e			;9f42	5b 	[ 
	ld e,h			;9f43	5c 	\ 
	ld e,l			;9f44	5d 	] 
	ld e,d			;9f45	5a 	Z 
	ld e,h			;9f46	5c 	\ 
	ld e,e			;9f47	5b 	[ 
	ld e,h			;9f48	5c 	\ 
	ld e,l			;9f49	5d 	] 
	ld e,d			;9f4a	5a 	Z 
	ld e,h			;9f4b	5c 	\ 
	ld e,e			;9f4c	5b 	[ 
	ld e,h			;9f4d	5c 	\ 
	ld e,l			;9f4e	5d 	] 
	ld h,c			;9f4f	61 	a 
	ld h,d			;9f50	62 	b 
	ld h,d			;9f51	62 	b 
	ld h,d			;9f52	62 	b 
	ld h,e			;9f53	63 	c 
	ld l,02fh		;9f54	2e 2f 	. / 
	cpl			;9f56	2f 	/ 
	cpl			;9f57	2f 	/ 
	jr nc,$+51		;9f58	30 31 	0 1 
	ld (03433h),a		;9f5a	32 33 34 	2 3 4 
	dec (hl)			;9f5d	35 	5 
	ld sp,03736h		;9f5e	31 36 37 	1 6 7 
	jr c,$+55		;9f61	38 35 	8 5 
	ld sp,03939h		;9f63	31 39 39 	1 9 9 
	add hl,sp			;9f66	39 	9 
	dec (hl)			;9f67	35 	5 
	ld sp,03939h		;9f68	31 39 39 	1 9 9 
	ld a,(03135h)		;9f6b	3a 35 31 	: 5 1 
	add hl,sp			;9f6e	39 	9 
	add hl,sp			;9f6f	39 	9 
	add hl,sp			;9f70	39 	9 
	dec (hl)			;9f71	35 	5 
	ld sp,03939h		;9f72	31 39 39 	1 9 9 
	add hl,sp			;9f75	39 	9 
	dec (hl)			;9f76	35 	5 
	ld sp,03939h		;9f77	31 39 39 	1 9 9 
	add hl,sp			;9f7a	39 	9 
	dec (hl)			;9f7b	35 	5 
	dec sp			;9f7c	3b 	; 
	ld b,b			;9f7d	40 	@ 
	ld b,h			;9f7e	44 	D 
	ld b,d			;9f7f	42 	B 
	ld b,b			;9f80	40 	@ 
	ld b,c			;9f81	41 	A 
	ccf			;9f82	3f 	? 
	dec sp			;9f83	3b 	; 
	inc a			;9f84	3c 	< 
	dec a			;9f85	3d 	= 
	dec a			;9f86	3d 	= 
	dec a			;9f87	3d 	= 
	ld a,03fh		;9f88	3e 3f 	> ? 
	dec sp			;9f8a	3b 	; 
	ld b,e			;9f8b	43 	C 
	ld b,c			;9f8c	41 	A 
	ld b,l			;9f8d	45 	E 
	ld b,d			;9f8e	42 	B 
	ld b,h			;9f8f	44 	D 
	ccf			;9f90	3f 	? 
	dec sp			;9f91	3b 	; 
	inc a			;9f92	3c 	< 
	dec a			;9f93	3d 	= 
	dec a			;9f94	3d 	= 
	dec a			;9f95	3d 	= 
	ld a,03fh		;9f96	3e 3f 	> ? 
	dec sp			;9f98	3b 	; 
	ld b,e			;9f99	43 	C 
	ld b,d			;9f9a	42 	B 
	ld b,b			;9f9b	40 	@ 
	ld b,l			;9f9c	45 	E 
	ld b,d			;9f9d	42 	B 
	ccf			;9f9e	3f 	? 
	dec sp			;9f9f	3b 	; 
	inc a			;9fa0	3c 	< 
	dec a			;9fa1	3d 	= 
	dec a			;9fa2	3d 	= 
	dec a			;9fa3	3d 	= 
	ld a,03fh		;9fa4	3e 3f 	> ? 
	dec sp			;9fa6	3b 	; 
	ld b,l			;9fa7	45 	E 
	ld b,b			;9fa8	40 	@ 
	ld b,h			;9fa9	44 	D 
	ld b,e			;9faa	43 	C 
	ld b,c			;9fab	41 	A 
	ccf			;9fac	3f 	? 
	dec sp			;9fad	3b 	; 
	inc a			;9fae	3c 	< 
	dec a			;9faf	3d 	= 
	dec a			;9fb0	3d 	= 
	dec a			;9fb1	3d 	= 
	ld a,03fh		;9fb2	3e 3f 	> ? 
	dec sp			;9fb4	3b 	; 
	nop			;9fb5	00 	. 
	nop			;9fb6	00 	. 
	nop			;9fb7	00 	. 
	nop			;9fb8	00 	. 
	nop			;9fb9	00 	. 
	ccf			;9fba	3f 	? 
	ld c,h			;9fbb	4c 	L 
	ld c,h			;9fbc	4c 	L 
	ld c,h			;9fbd	4c 	L 
	ld c,h			;9fbe	4c 	L 
	ld c,h			;9fbf	4c 	L 
	ld c,l			;9fc0	4d 	M 
	ld c,l			;9fc1	4d 	M 
	ld c,l			;9fc2	4d 	M 
	ld c,l			;9fc3	4d 	M 
	ld c,l			;9fc4	4d 	M 
	ld c,(hl)			;9fc5	4e 	N 
	ld c,(hl)			;9fc6	4e 	N 
	ld c,(hl)			;9fc7	4e 	N 
	ld c,(hl)			;9fc8	4e 	N 
	ld c,(hl)			;9fc9	4e 	N 
	ld b,(hl)			;9fca	46 	F 
	ld b,a			;9fcb	47 	G 
	ld c,b			;9fcc	48 	H 
	ld c,c			;9fcd	49 	I 
	ld c,d			;9fce	4a 	J 
	ld c,e			;9fcf	4b 	K 
	ld h,l			;9fd0	65 	e 
	ld h,(hl)			;9fd1	66 	f 
	ld h,a			;9fd2	67 	g 
	ld l,b			;9fd3	68 	h 
	ld l,c			;9fd4	69 	i 
	ld l,d			;9fd5	6a 	j 
	xor l			;9fd6	ad 	. 
	xor (hl)			;9fd7	ae 	. 
	xor a			;9fd8	af 	. 
	or b			;9fd9	b0 	. 
	or c			;9fda	b1 	. 
	or d			;9fdb	b2 	. 
	or e			;9fdc	b3 	. 
	or h			;9fdd	b4 	. 
	or l			;9fde	b5 	. 
	or (hl)			;9fdf	b6 	. 
	or a			;9fe0	b7 	. 
	cp b			;9fe1	b8 	. 
	cp c			;9fe2	b9 	. 
	cp d			;9fe3	ba 	. 
	cp e			;9fe4	bb 	. 
	inc d			;9fe5	14 	. 
	dec d			;9fe6	15 	. 
	ld d,017h		;9fe7	16 17 	. . 
	rla			;9fe9	17 	. 
	rla			;9fea	17 	. 
	rla			;9feb	17 	. 
	rla			;9fec	17 	. 
	rla			;9fed	17 	. 
	rla			;9fee	17 	. 
	rla			;9fef	17 	. 
	rla			;9ff0	17 	. 
	rla			;9ff1	17 	. 
	rla			;9ff2	17 	. 
	rla			;9ff3	17 	. 
	nop			;9ff4	00 	. 
	nop			;9ff5	00 	. 
	nop			;9ff6	00 	. 
	nop			;9ff7	00 	. 
	nop			;9ff8	00 	. 
	nop			;9ff9	00 	. 
	nop			;9ffa	00 	. 
	nop			;9ffb	00 	. 
	ld l,e			;9ffc	6b 	k 
	ld l,h			;9ffd	6c 	l 
	nop			;9ffe	00 	. 
	nop			;9fff	00 	. 
	ld l,l			;a000	6d 	m 
	ld l,(hl)			;a001	6e 	n 
	ld l,a			;a002	6f 	o 
	ld l,a			;a003	6f 	o 
	ld (hl),b			;a004	70 	p 
	ld (hl),c			;a005	71 	q 
	ld (hl),d			;a006	72 	r 
	ld (hl),e			;a007	73 	s 
	ld (hl),h			;a008	74 	t 
	ld (hl),l			;a009	75 	u 
	halt			;a00a	76 	v 
	ld (hl),a			;a00b	77 	w 
	ld (hl),d			;a00c	72 	r 
	ld (hl),e			;a00d	73 	s 
	ld a,b			;a00e	78 	x 
	ld a,c			;a00f	79 	y 
	halt			;a010	76 	v 
	ld (hl),a			;a011	77 	w 
	ld a,d			;a012	7a 	z 
	nop			;a013	00 	. 
	ld a,e			;a014	7b 	{ 
	ld a,h			;a015	7c 	| 
	nop			;a016	00 	. 
	ld a,l			;a017	7d 	} 
	ld bc,00302h		;a018	01 02 03 	. . . 
	inc bc			;a01b	03 	. 
	inc b			;a01c	04 	. 
	dec b			;a01d	05 	. 
	inc a			;a01e	3c 	< 
	inc a			;a01f	3c 	< 
	inc a			;a020	3c 	< 
	dec a			;a021	3d 	= 
	dec b			;a022	05 	. 
	inc a			;a023	3c 	< 
	inc a			;a024	3c 	< 
	inc a			;a025	3c 	< 
	ld b,c			;a026	41 	A 
	ld a,03fh		;a027	3e 3f 	> ? 
	ld b,b			;a029	40 	@ 
	ld b,c			;a02a	41 	A 
	rst 38h			;a02b	ff 	. 
	ld h,d			;a02c	62 	b 
	ld h,e			;a02d	63 	c 
	ld h,h			;a02e	64 	d 
	ld h,l			;a02f	65 	e 
	ld h,(hl)			;a030	66 	f 
	ld h,a			;a031	67 	g 
	ld a,b			;a032	78 	x 
	ld a,c			;a033	79 	y 
	ld a,d			;a034	7a 	z 
	ld a,e			;a035	7b 	{ 
	ld a,h			;a036	7c 	| 
	ld a,l			;a037	7d 	} 
	ld a,(hl)			;a038	7e 	~ 
	ld a,a			;a039	7f 	 
	add a,b			;a03a	80 	. 
	inc sp			;a03b	33 	3 
	inc (hl)			;a03c	34 	4 
	inc (hl)			;a03d	34 	4 
	inc (hl)			;a03e	34 	4 
	inc (hl)			;a03f	34 	4 
	inc (hl)			;a040	34 	4 
	inc (hl)			;a041	34 	4 
	dec (hl)			;a042	35 	5 
	ld (hl),037h		;a043	36 37 	6 7 
	scf			;a045	37 	7 
	scf			;a046	37 	7 
	scf			;a047	37 	7 
	scf			;a048	37 	7 
	scf			;a049	37 	7 
	jr c,$+56		;a04a	38 36 	8 6 
	scf			;a04c	37 	7 
	scf			;a04d	37 	7 
	scf			;a04e	37 	7 
	scf			;a04f	37 	7 
	scf			;a050	37 	7 
	scf			;a051	37 	7 
	jr c,$+59		;a052	38 39 	8 9 
	ld a,(03a3ah)		;a054	3a 3a 3a 	: : : 
	ld a,(03a3ah)		;a057	3a 3a 3a 	: : : 
	dec sp			;a05a	3b 	; 
	cpl			;a05b	2f 	/ 
	adc a,d			;a05c	8a 	. 
	adc a,d			;a05d	8a 	. 
	adc a,e			;a05e	8b 	. 
	rst 38h			;a05f	ff 	. 
	rst 38h			;a060	ff 	. 
	adc a,l			;a061	8d 	. 
	rst 38h			;a062	ff 	. 
	rst 38h			;a063	ff 	. 
	rst 38h			;a064	ff 	. 
	adc a,l			;a065	8d 	. 
	rst 38h			;a066	ff 	. 
	rst 38h			;a067	ff 	. 
	rst 38h			;a068	ff 	. 
	adc a,l			;a069	8d 	. 
	rst 38h			;a06a	ff 	. 
	rst 38h			;a06b	ff 	. 
	rst 38h			;a06c	ff 	. 
	rlca			;a06d	07 	. 
	ex af,af'			;a06e	08 	. 
	rst 38h			;a06f	ff 	. 
	rst 38h			;a070	ff 	. 
	rst 38h			;a071	ff 	. 
	add hl,bc			;a072	09 	. 
	ld a,(bc)			;a073	0a 	. 
	dec bc			;a074	0b 	. 
	rst 38h			;a075	ff 	. 
	rst 38h			;a076	ff 	. 
	inc c			;a077	0c 	. 
	rst 38h			;a078	ff 	. 
	dec c			;a079	0d 	. 
	ld c,00fh		;a07a	0e 0f 	. . 
	djnz $+1		;a07c	10 ff 	. . 
	rst 38h			;a07e	ff 	. 
	ld de,0ff12h		;a07f	11 12 ff 	. . . 
	rst 38h			;a082	ff 	. 
	rst 38h			;a083	ff 	. 
	inc de			;a084	13 	. 
	rst 38h			;a085	ff 	. 
	rst 38h			;a086	ff 	. 
	rst 38h			;a087	ff 	. 
	rst 38h			;a088	ff 	. 
	inc d			;a089	14 	. 
	rst 38h			;a08a	ff 	. 
	rst 38h			;a08b	ff 	. 
	rst 38h			;a08c	ff 	. 
	dec d			;a08d	15 	. 
	ld d,0ffh		;a08e	16 ff 	. . 
	rst 38h			;a090	ff 	. 
	rst 38h			;a091	ff 	. 
	rla			;a092	17 	. 
	jr $+1		;a093	18 ff 	. . 
	rst 38h			;a095	ff 	. 
	rst 38h			;a096	ff 	. 
	add hl,de			;a097	19 	. 
	ld a,(de)			;a098	1a 	. 
	rst 38h			;a099	ff 	. 
	rst 38h			;a09a	ff 	. 
	rst 38h			;a09b	ff 	. 
	rst 38h			;a09c	ff 	. 
	inc sp			;a09d	33 	3 
	inc (hl)			;a09e	34 	4 
	inc (hl)			;a09f	34 	4 
	dec (hl)			;a0a0	35 	5 
	rst 38h			;a0a1	ff 	. 
	rst 38h			;a0a2	ff 	. 
	rst 38h			;a0a3	ff 	. 
	rst 38h			;a0a4	ff 	. 
	rst 38h			;a0a5	ff 	. 
	rst 38h			;a0a6	ff 	. 
	ld (hl),037h		;a0a7	36 37 	6 7 
	scf			;a0a9	37 	7 
	jr c,$+1		;a0aa	38 ff 	8 . 
	rst 38h			;a0ac	ff 	. 
	rst 38h			;a0ad	ff 	. 
	rst 38h			;a0ae	ff 	. 
	rst 38h			;a0af	ff 	. 
	rst 38h			;a0b0	ff 	. 
	add hl,sp			;a0b1	39 	9 
	ld a,(03b3ah)		;a0b2	3a 3a 3b 	: : ; 
	rst 38h			;a0b5	ff 	. 
	rst 38h			;a0b6	ff 	. 
	rst 38h			;a0b7	ff 	. 
	rst 38h			;a0b8	ff 	. 
	inc sp			;a0b9	33 	3 
	inc (hl)			;a0ba	34 	4 
	inc (hl)			;a0bb	34 	4 
	dec (hl)			;a0bc	35 	5 
	rst 38h			;a0bd	ff 	. 
	inc sp			;a0be	33 	3 
	inc (hl)			;a0bf	34 	4 
	dec (hl)			;a0c0	35 	5 
	inc sp			;a0c1	33 	3 
	inc (hl)			;a0c2	34 	4 
	dec (hl)			;a0c3	35 	5 
	scf			;a0c4	37 	7 
	scf			;a0c5	37 	7 
	jr c,$+1		;a0c6	38 ff 	8 . 
	ld (hl),037h		;a0c8	36 37 	6 7 
	jr c,$+56		;a0ca	38 36 	8 6 
	scf			;a0cc	37 	7 
	jr c,$+57		;a0cd	38 37 	8 7 
	scf			;a0cf	37 	7 
	jr c,$+1		;a0d0	38 ff 	8 . 
	ld (hl),037h		;a0d2	36 37 	6 7 
	jr c,$+59		;a0d4	38 39 	8 9 
	ld a,(03a3bh)		;a0d6	3a 3b 3a 	: ; : 
	ld a,(0ff3bh)		;a0d9	3a 3b ff 	: ; . 
	add hl,sp			;a0dc	39 	9 
	ld a,(0813bh)		;a0dd	3a 3b 81 	: ; . 
	add a,d			;a0e0	82 	. 
	add a,e			;a0e1	83 	. 
	add a,e			;a0e2	83 	. 
	add a,h			;a0e3	84 	. 
	add a,l			;a0e4	85 	. 
	add a,(hl)			;a0e5	86 	. 
	add a,a			;a0e6	87 	. 
	rst 38h			;a0e7	ff 	. 
	rst 38h			;a0e8	ff 	. 
	add a,(hl)			;a0e9	86 	. 
	add a,a			;a0ea	87 	. 
	add a,(hl)			;a0eb	86 	. 
	add a,a			;a0ec	87 	. 
	rst 38h			;a0ed	ff 	. 
	rst 38h			;a0ee	ff 	. 
	add a,(hl)			;a0ef	86 	. 
	add a,a			;a0f0	87 	. 
	jr nc,$+1		;a0f1	30 ff 	0 . 
	rst 38h			;a0f3	ff 	. 
	rst 38h			;a0f4	ff 	. 
	rst 38h			;a0f5	ff 	. 
	ld sp,03433h		;a0f6	31 33 34 	1 3 4 
	dec (hl)			;a0f9	35 	5 
	rst 38h			;a0fa	ff 	. 
	rst 38h			;a0fb	ff 	. 
	rst 38h			;a0fc	ff 	. 
	rst 38h			;a0fd	ff 	. 
	rst 38h			;a0fe	ff 	. 
	rst 38h			;a0ff	ff 	. 
	rst 38h			;a100	ff 	. 
	rst 38h			;a101	ff 	. 
	ld (hl),037h		;a102	36 37 	6 7 
	jr c,$+1		;a104	38 ff 	8 . 
	rst 38h			;a106	ff 	. 
	rst 38h			;a107	ff 	. 
	inc sp			;a108	33 	3 
	inc (hl)			;a109	34 	4 
	inc (hl)			;a10a	34 	4 
	dec (hl)			;a10b	35 	5 
	rst 38h			;a10c	ff 	. 
	add hl,sp			;a10d	39 	9 
	ld a,(0ff3bh)		;a10e	3a 3b ff 	: ; . 
	rst 38h			;a111	ff 	. 
	rst 38h			;a112	ff 	. 
	ld (hl),037h		;a113	36 37 	6 7 
	scf			;a115	37 	7 
	jr c,$+1		;a116	38 ff 	8 . 
	inc sp			;a118	33 	3 
	inc (hl)			;a119	34 	4 
	inc (hl)			;a11a	34 	4 
	inc (hl)			;a11b	34 	4 
	dec (hl)			;a11c	35 	5 
	rst 38h			;a11d	ff 	. 
	add hl,sp			;a11e	39 	9 
	ld a,(03b3ah)		;a11f	3a 3a 3b 	: : ; 
	rst 38h			;a122	ff 	. 
	ld (hl),037h		;a123	36 37 	6 7 
	scf			;a125	37 	7 
	scf			;a126	37 	7 
	inc sp			;a127	33 	3 
	inc (hl)			;a128	34 	4 
	dec (hl)			;a129	35 	5 
	rst 38h			;a12a	ff 	. 
	inc sp			;a12b	33 	3 
	inc (hl)			;a12c	34 	4 
	dec (hl)			;a12d	35 	5 
	ld (hl),037h		;a12e	36 37 	6 7 
	scf			;a130	37 	7 
	scf			;a131	37 	7 
	ld (hl),037h		;a132	36 37 	6 7 
	jr c,$+1		;a134	38 ff 	8 . 
	ld (hl),037h		;a136	36 37 	6 7 
	jr c,$+59		;a138	38 39 	8 9 
	ld a,(03a3ah)		;a13a	3a 3a 3a 	: : : 
	add hl,sp			;a13d	39 	9 
	ld a,(0ff3bh)		;a13e	3a 3b ff 	: ; . 
	add hl,sp			;a141	39 	9 
	ld a,(0df3bh)		;a142	3a 3b df 	: ; . 
	sbc a,0dch		;a145	de dc 	. . 
	sbc a,0dbh		;a147	de db 	. . 
	defb 0ddh,0deh,0dfh	;illegal sequence		;a149	dd de df 	. . . 
	ex af,af'			;a14c	08 	. 
	defb 0ddh,008h,0ddh	;illegal sequence		;a14d	dd 08 dd 	. . . 
	ex af,af'			;a150	08 	. 
	ex af,af'			;a151	08 	. 
	call c,00808h		;a152	dc 08 08 	. . . 
	ex af,af'			;a155	08 	. 
	ex af,af'			;a156	08 	. 
	ex af,af'			;a157	08 	. 
	ex af,af'			;a158	08 	. 
	ex af,af'			;a159	08 	. 
	ex af,af'			;a15a	08 	. 
	ex af,af'			;a15b	08 	. 
	ex af,af'			;a15c	08 	. 
	ex af,af'			;a15d	08 	. 
	ex af,af'			;a15e	08 	. 
	ex af,af'			;a15f	08 	. 
	ex af,af'			;a160	08 	. 
	ex af,af'			;a161	08 	. 
	ex af,af'			;a162	08 	. 
	ex af,af'			;a163	08 	. 
	ex af,af'			;a164	08 	. 
	ex af,af'			;a165	08 	. 
	ex af,af'			;a166	08 	. 
	ex af,af'			;a167	08 	. 
	ex af,af'			;a168	08 	. 
	ex af,af'			;a169	08 	. 
	ex af,af'			;a16a	08 	. 
	ex af,af'			;a16b	08 	. 
	ex af,af'			;a16c	08 	. 
	ex af,af'			;a16d	08 	. 
	ex af,af'			;a16e	08 	. 
	ex af,af'			;a16f	08 	. 
	ex af,af'			;a170	08 	. 
	ex af,af'			;a171	08 	. 
	ex af,af'			;a172	08 	. 
	ex af,af'			;a173	08 	. 
	ex af,af'			;a174	08 	. 
	ex af,af'			;a175	08 	. 
	ex af,af'			;a176	08 	. 
	ex af,af'			;a177	08 	. 
	ex af,af'			;a178	08 	. 
	ex af,af'			;a179	08 	. 
	ex af,af'			;a17a	08 	. 
	ex af,af'			;a17b	08 	. 
	ex af,af'			;a17c	08 	. 
	ex af,af'			;a17d	08 	. 
	ex af,af'			;a17e	08 	. 
	ex af,af'			;a17f	08 	. 
	ex af,af'			;a180	08 	. 
	ex af,af'			;a181	08 	. 
	ex af,af'			;a182	08 	. 
	ret p			;a183	f0 	. 
	rst 28h			;a184	ef 	. 
	xor 0e9h		;a185	ee e9 	. . 
	ret pe			;a187	e8 	. 
	jp pe,0eee9h		;a188	ea e9 ee 	. . . 
	defb 0edh;next byte illegal after ed		;a18b	ed 	. 
	rst 20h			;a18c	e7 	. 
	call pe,0e7eah		;a18d	ec ea e7 	. . . 
	xor 0e7h		;a190	ee e7 	. . 
	rst 20h			;a192	e7 	. 
	rst 20h			;a193	e7 	. 
	rst 20h			;a194	e7 	. 
	ex de,hl			;a195	eb 	. 
	rst 20h			;a196	e7 	. 
	rst 20h			;a197	e7 	. 
	rst 20h			;a198	e7 	. 
	rst 20h			;a199	e7 	. 
	rst 20h			;a19a	e7 	. 
	ex af,af'			;a19b	08 	. 
	ex af,af'			;a19c	08 	. 
	ex af,af'			;a19d	08 	. 
	ret po			;a19e	e0 	. 
	ret pe			;a19f	e8 	. 
	xor 0e7h		;a1a0	ee e7 	. . 
	rst 20h			;a1a2	e7 	. 
	ex af,af'			;a1a3	08 	. 
	ex af,af'			;a1a4	08 	. 
	ret po			;a1a5	e0 	. 
	xor 0e7h		;a1a6	ee e7 	. . 
	rst 20h			;a1a8	e7 	. 
	rst 20h			;a1a9	e7 	. 
	rst 20h			;a1aa	e7 	. 
	ret po			;a1ab	e0 	. 
	ret pe			;a1ac	e8 	. 
	xor 0ech		;a1ad	ee ec 	. . 
	rst 20h			;a1af	e7 	. 
	rst 20h			;a1b0	e7 	. 
	rst 20h			;a1b1	e7 	. 
	rst 20h			;a1b2	e7 	. 
	xor 0e7h		;a1b3	ee e7 	. . 
	rst 20h			;a1b5	e7 	. 
	rst 20h			;a1b6	e7 	. 
	rst 20h			;a1b7	e7 	. 
	rst 20h			;a1b8	e7 	. 
	rst 20h			;a1b9	e7 	. 
	rst 20h			;a1ba	e7 	. 
	call pe,0e7e7h		;a1bb	ec e7 e7 	. . . 
	rst 20h			;a1be	e7 	. 
	rst 20h			;a1bf	e7 	. 
	rst 20h			;a1c0	e7 	. 
	rst 20h			;a1c1	e7 	. 
	rst 20h			;a1c2	e7 	. 
	rst 20h			;a1c3	e7 	. 
	xor 0e7h		;a1c4	ee e7 	. . 
	rst 20h			;a1c6	e7 	. 
	rst 20h			;a1c7	e7 	. 
	rst 20h			;a1c8	e7 	. 
	rst 20h			;a1c9	e7 	. 
	rst 20h			;a1ca	e7 	. 
	rst 20h			;a1cb	e7 	. 
	rst 20h			;a1cc	e7 	. 
	rst 20h			;a1cd	e7 	. 
	rst 20h			;a1ce	e7 	. 
	rst 20h			;a1cf	e7 	. 
	rst 20h			;a1d0	e7 	. 
	rst 20h			;a1d1	e7 	. 
	rst 20h			;a1d2	e7 	. 
	rst 20h			;a1d3	e7 	. 
	rst 20h			;a1d4	e7 	. 
	rst 20h			;a1d5	e7 	. 
	rst 20h			;a1d6	e7 	. 
	rst 20h			;a1d7	e7 	. 
	rst 20h			;a1d8	e7 	. 
	ret p			;a1d9	f0 	. 
	rst 18h			;a1da	df 	. 
	call c,0e7dbh		;a1db	dc db e7 	. . . 
	rst 20h			;a1de	e7 	. 
	rst 20h			;a1df	e7 	. 
	rst 20h			;a1e0	e7 	. 
	rst 18h			;a1e1	df 	. 
	ex af,af'			;a1e2	08 	. 
	ex af,af'			;a1e3	08 	. 
	ex af,af'			;a1e4	08 	. 
	rst 20h			;a1e5	e7 	. 
	rst 20h			;a1e6	e7 	. 
	rst 20h			;a1e7	e7 	. 
	defb 0ddh,008h,008h	;illegal sequence		;a1e8	dd 08 08 	. . . 
	ex af,af'			;a1eb	08 	. 
	ex af,af'			;a1ec	08 	. 
	rst 20h			;a1ed	e7 	. 
	rst 20h			;a1ee	e7 	. 
	ret c			;a1ef	d8 	. 
	ex af,af'			;a1f0	08 	. 
	ex af,af'			;a1f1	08 	. 
	ex af,af'			;a1f2	08 	. 
	ex af,af'			;a1f3	08 	. 
	ex af,af'			;a1f4	08 	. 
	and 0e7h		;a1f5	e6 e7 	. . 
	rst 20h			;a1f7	e7 	. 
	ex af,af'			;a1f8	08 	. 
	ex af,af'			;a1f9	08 	. 
	ex af,af'			;a1fa	08 	. 
	ex af,af'			;a1fb	08 	. 
	ex af,af'			;a1fc	08 	. 
	push hl			;a1fd	e5 	. 
	rst 20h			;a1fe	e7 	. 
	rst 20h			;a1ff	e7 	. 
	ex af,af'			;a200	08 	. 
	ex af,af'			;a201	08 	. 
	ex af,af'			;a202	08 	. 
	ex af,af'			;a203	08 	. 
	ex af,af'			;a204	08 	. 
	call po,0e7e3h		;a205	e4 e3 e7 	. . . 
	ex af,af'			;a208	08 	. 
	ex af,af'			;a209	08 	. 
	ex af,af'			;a20a	08 	. 
	ex af,af'			;a20b	08 	. 
	ex af,af'			;a20c	08 	. 
	and 0e7h		;a20d	e6 e7 	. . 
	rst 20h			;a20f	e7 	. 
	ex af,af'			;a210	08 	. 
	ex af,af'			;a211	08 	. 
	ex af,af'			;a212	08 	. 
	ex af,af'			;a213	08 	. 
	ex af,af'			;a214	08 	. 
	jp po,0e7e1h		;a215	e2 e1 e7 	. . . 
	ex af,af'			;a218	08 	. 
	ex af,af'			;a219	08 	. 
	ex af,af'			;a21a	08 	. 
	ex af,af'			;a21b	08 	. 
	ex af,af'			;a21c	08 	. 
	call po,0e7e7h		;a21d	e4 e7 e7 	. . . 
	jp c,00808h		;a220	da 08 08 	. . . 
	ex af,af'			;a223	08 	. 
	ex af,af'			;a224	08 	. 
	ex af,af'			;a225	08 	. 
	rst 20h			;a226	e7 	. 
	rst 20h			;a227	e7 	. 
	exx			;a228	d9 	. 
	ex af,af'			;a229	08 	. 
	ex af,af'			;a22a	08 	. 
	ex af,af'			;a22b	08 	. 
	ex af,af'			;a22c	08 	. 
	ex af,af'			;a22d	08 	. 
	rst 20h			;a22e	e7 	. 
	pop hl			;a22f	e1 	. 
	jp c,00808h		;a230	da 08 08 	. . . 
	ex af,af'			;a233	08 	. 
	ex af,af'			;a234	08 	. 
	ex af,af'			;a235	08 	. 
	rst 20h			;a236	e7 	. 
	rst 20h			;a237	e7 	. 
	ret c			;a238	d8 	. 
	ex af,af'			;a239	08 	. 
	ex af,af'			;a23a	08 	. 
	ex af,af'			;a23b	08 	. 
	ex af,af'			;a23c	08 	. 
	ex af,af'			;a23d	08 	. 
	rst 20h			;a23e	e7 	. 
	exx			;a23f	d9 	. 
	jp c,00808h		;a240	da 08 08 	. . . 
	ex af,af'			;a243	08 	. 
	ex af,af'			;a244	08 	. 
	ex af,af'			;a245	08 	. 
	rst 20h			;a246	e7 	. 
	rst 20h			;a247	e7 	. 
	ret c			;a248	d8 	. 
	ex af,af'			;a249	08 	. 
	ex af,af'			;a24a	08 	. 
	ex af,af'			;a24b	08 	. 
	ex af,af'			;a24c	08 	. 
	ex af,af'			;a24d	08 	. 
	rst 20h			;a24e	e7 	. 
	rst 20h			;a24f	e7 	. 
	ret p			;a250	f0 	. 
	jp pe,008e8h		;a251	ea e8 08 	. . . 
	ex af,af'			;a254	08 	. 
	ex af,af'			;a255	08 	. 
	rst 20h			;a256	e7 	. 
	rst 20h			;a257	e7 	. 
	ret p			;a258	f0 	. 
	rst 20h			;a259	e7 	. 
	rst 20h			;a25a	e7 	. 
	rst 28h			;a25b	ef 	. 
	ex af,af'			;a25c	08 	. 
	ex af,af'			;a25d	08 	. 
	rst 20h			;a25e	e7 	. 
	rst 20h			;a25f	e7 	. 
	rst 20h			;a260	e7 	. 
	rst 20h			;a261	e7 	. 
	rst 20h			;a262	e7 	. 
	ret p			;a263	f0 	. 
	ret pe			;a264	e8 	. 
	ex af,af'			;a265	08 	. 
	rst 20h			;a266	e7 	. 
	rst 20h			;a267	e7 	. 
	rst 20h			;a268	e7 	. 
	rst 20h			;a269	e7 	. 
	rst 20h			;a26a	e7 	. 
	rst 20h			;a26b	e7 	. 
	defb 0edh;next byte illegal after ed		;a26c	ed 	. 
	rst 20h			;a26d	e7 	. 
	rst 20h			;a26e	e7 	. 
	rst 20h			;a26f	e7 	. 
	rst 20h			;a270	e7 	. 
	rst 20h			;a271	e7 	. 
	rst 20h			;a272	e7 	. 
	rst 20h			;a273	e7 	. 
	rst 20h			;a274	e7 	. 
	rst 20h			;a275	e7 	. 
	rst 20h			;a276	e7 	. 
	rst 20h			;a277	e7 	. 
	rst 20h			;a278	e7 	. 
	rst 20h			;a279	e7 	. 
	rst 20h			;a27a	e7 	. 
	rst 20h			;a27b	e7 	. 
	rst 20h			;a27c	e7 	. 
	rst 20h			;a27d	e7 	. 
	rst 20h			;a27e	e7 	. 
	rst 20h			;a27f	e7 	. 
	rst 20h			;a280	e7 	. 
	rst 20h			;a281	e7 	. 
	rst 20h			;a282	e7 	. 
	rst 20h			;a283	e7 	. 
	rst 20h			;a284	e7 	. 
	rst 20h			;a285	e7 	. 
	rst 20h			;a286	e7 	. 
	rst 20h			;a287	e7 	. 
	rst 20h			;a288	e7 	. 
	rst 20h			;a289	e7 	. 
	rst 20h			;a28a	e7 	. 
	rst 20h			;a28b	e7 	. 
	rst 20h			;a28c	e7 	. 
	rst 20h			;a28d	e7 	. 
	rst 20h			;a28e	e7 	. 
	rst 20h			;a28f	e7 	. 
	rst 20h			;a290	e7 	. 
	rst 20h			;a291	e7 	. 
	rst 20h			;a292	e7 	. 
	rst 20h			;a293	e7 	. 
	rst 20h			;a294	e7 	. 
	rst 20h			;a295	e7 	. 
	rst 20h			;a296	e7 	. 
	rst 20h			;a297	e7 	. 
	rst 20h			;a298	e7 	. 
	rst 20h			;a299	e7 	. 
	rst 20h			;a29a	e7 	. 
	rst 20h			;a29b	e7 	. 
	rst 20h			;a29c	e7 	. 
	rst 18h			;a29d	df 	. 
	dec bc			;a29e	0b 	. 
	inc c			;a29f	0c 	. 
	inc c			;a2a0	0c 	. 
	inc c			;a2a1	0c 	. 
	inc c			;a2a2	0c 	. 
	dec c			;a2a3	0d 	. 
	rst 18h			;a2a4	df 	. 
	ex af,af'			;a2a5	08 	. 
	ex af,af'			;a2a6	08 	. 
	ex af,af'			;a2a7	08 	. 
	ex af,af'			;a2a8	08 	. 
	ex af,af'			;a2a9	08 	. 
	ex af,af'			;a2aa	08 	. 
	ex af,af'			;a2ab	08 	. 
	ex af,af'			;a2ac	08 	. 
	ex af,af'			;a2ad	08 	. 
	ex af,af'			;a2ae	08 	. 
	ex af,af'			;a2af	08 	. 
	ex af,af'			;a2b0	08 	. 
	ex af,af'			;a2b1	08 	. 
	ex af,af'			;a2b2	08 	. 
	ex af,af'			;a2b3	08 	. 
	ex af,af'			;a2b4	08 	. 
	rst 20h			;a2b5	e7 	. 
	call pe,008d8h		;a2b6	ec d8 08 	. . . 
	ex af,af'			;a2b9	08 	. 
	ex af,af'			;a2ba	08 	. 
	ex af,af'			;a2bb	08 	. 
	ex af,af'			;a2bc	08 	. 
	sbc a,0dbh		;a2bd	de db 	. . 
	ex af,af'			;a2bf	08 	. 
	ex af,af'			;a2c0	08 	. 
	ex af,af'			;a2c1	08 	. 
	ex af,af'			;a2c2	08 	. 
	ex af,af'			;a2c3	08 	. 
	ex af,af'			;a2c4	08 	. 
	defb 0ddh,008h,008h	;illegal sequence		;a2c5	dd 08 08 	. . . 
	ex af,af'			;a2c8	08 	. 
	ex af,af'			;a2c9	08 	. 
	ex af,af'			;a2ca	08 	. 
	ex af,af'			;a2cb	08 	. 
	ex af,af'			;a2cc	08 	. 
	ex af,af'			;a2cd	08 	. 
	ex af,af'			;a2ce	08 	. 
	ex af,af'			;a2cf	08 	. 
	ex af,af'			;a2d0	08 	. 
	ex af,af'			;a2d1	08 	. 
	ex af,af'			;a2d2	08 	. 
	ex af,af'			;a2d3	08 	. 
	ex af,af'			;a2d4	08 	. 
	ex af,af'			;a2d5	08 	. 
	ex af,af'			;a2d6	08 	. 
	ex af,af'			;a2d7	08 	. 
	ex af,af'			;a2d8	08 	. 
	ex af,af'			;a2d9	08 	. 
	ex af,af'			;a2da	08 	. 
	ex af,af'			;a2db	08 	. 
	ex af,af'			;a2dc	08 	. 
	ex af,af'			;a2dd	08 	. 
	ex af,af'			;a2de	08 	. 
	ex af,af'			;a2df	08 	. 
	ex af,af'			;a2e0	08 	. 
	ex af,af'			;a2e1	08 	. 
	ex af,af'			;a2e2	08 	. 
	ex af,af'			;a2e3	08 	. 
	ex af,af'			;a2e4	08 	. 
	ret po			;a2e5	e0 	. 
	rst 10h			;a2e6	d7 	. 
	ret po			;a2e7	e0 	. 
	ex af,af'			;a2e8	08 	. 
	ex af,af'			;a2e9	08 	. 
	ex af,af'			;a2ea	08 	. 
	ex af,af'			;a2eb	08 	. 
	ex af,af'			;a2ec	08 	. 
	jp po,0e7e1h		;a2ed	e2 e1 e7 	. . . 
	ex af,af'			;a2f0	08 	. 
	ex af,af'			;a2f1	08 	. 
	ex af,af'			;a2f2	08 	. 
	ex af,af'			;a2f3	08 	. 
	ex af,af'			;a2f4	08 	. 
	call po,0e7e7h		;a2f5	e4 e7 e7 	. . . 
	sbc a,0dfh		;a2f8	de df 	. . 
	rst 18h			;a2fa	df 	. 
	sbc a,0deh		;a2fb	de de 	. . 
	rst 20h			;a2fd	e7 	. 
	rst 18h			;a2fe	df 	. 
	sbc a,0ddh		;a2ff	de dd 	. . 
	ex af,af'			;a301	08 	. 
	ex af,af'			;a302	08 	. 
	ex af,af'			;a303	08 	. 
	call c,008dbh		;a304	dc db 08 	. . . 
	defb 0ddh,008h,008h	;illegal sequence		;a307	dd 08 08 	. . . 
	ex af,af'			;a30a	08 	. 
	ex af,af'			;a30b	08 	. 
	ex af,af'			;a30c	08 	. 
	ex af,af'			;a30d	08 	. 
	ex af,af'			;a30e	08 	. 
	ex af,af'			;a30f	08 	. 
	ex af,af'			;a310	08 	. 
	ex af,af'			;a311	08 	. 
	ex af,af'			;a312	08 	. 
	ex af,af'			;a313	08 	. 
	ex af,af'			;a314	08 	. 
	ex af,af'			;a315	08 	. 
	ex af,af'			;a316	08 	. 
	ex af,af'			;a317	08 	. 
	ex af,af'			;a318	08 	. 
	ex af,af'			;a319	08 	. 
	ex af,af'			;a31a	08 	. 
	ex af,af'			;a31b	08 	. 
	ex af,af'			;a31c	08 	. 
	ex af,af'			;a31d	08 	. 
	ex af,af'			;a31e	08 	. 
	ex af,af'			;a31f	08 	. 
	ex af,af'			;a320	08 	. 
	ex af,af'			;a321	08 	. 
	ex af,af'			;a322	08 	. 
	ex af,af'			;a323	08 	. 
	ex af,af'			;a324	08 	. 
	ex af,af'			;a325	08 	. 
	ex af,af'			;a326	08 	. 
	ex af,af'			;a327	08 	. 
	sub 0e7h		;a328	d6 e7 	. . 
	rst 20h			;a32a	e7 	. 
	ex af,af'			;a32b	08 	. 
	ex af,af'			;a32c	08 	. 
	ex af,af'			;a32d	08 	. 
	ex af,af'			;a32e	08 	. 
	ex af,af'			;a32f	08 	. 
	ex af,af'			;a330	08 	. 
	sbc a,0dbh		;a331	de db 	. . 
	ex af,af'			;a333	08 	. 
	ex af,af'			;a334	08 	. 
	ex af,af'			;a335	08 	. 
	ex af,af'			;a336	08 	. 
	ex af,af'			;a337	08 	. 
	ex af,af'			;a338	08 	. 
	defb 0ddh,008h,008h	;illegal sequence		;a339	dd 08 08 	. . . 
	ex af,af'			;a33c	08 	. 
	ex af,af'			;a33d	08 	. 
	ex af,af'			;a33e	08 	. 
	ex af,af'			;a33f	08 	. 
	ex af,af'			;a340	08 	. 
	ex af,af'			;a341	08 	. 
	ex af,af'			;a342	08 	. 
	ex af,af'			;a343	08 	. 
	ex af,af'			;a344	08 	. 
	ex af,af'			;a345	08 	. 
	ex af,af'			;a346	08 	. 
	ex af,af'			;a347	08 	. 
	ex af,af'			;a348	08 	. 
	ex af,af'			;a349	08 	. 
	ex af,af'			;a34a	08 	. 
	ex af,af'			;a34b	08 	. 
	ex af,af'			;a34c	08 	. 
	ex af,af'			;a34d	08 	. 
	ex af,af'			;a34e	08 	. 
	ex af,af'			;a34f	08 	. 
	ex af,af'			;a350	08 	. 
	ex af,af'			;a351	08 	. 
	ex af,af'			;a352	08 	. 
	rst 10h			;a353	d7 	. 
	ex af,af'			;a354	08 	. 
	ex af,af'			;a355	08 	. 
	ex af,af'			;a356	08 	. 
	ex af,af'			;a357	08 	. 
	ex af,af'			;a358	08 	. 
	ex af,af'			;a359	08 	. 
	ex af,af'			;a35a	08 	. 
	rst 20h			;a35b	e7 	. 
	jp (hl)			;a35c	e9 	. 
	ret pe			;a35d	e8 	. 
	rst 10h			;a35e	d7 	. 
	ex af,af'			;a35f	08 	. 
	ex af,af'			;a360	08 	. 
	ex af,af'			;a361	08 	. 
	ex af,af'			;a362	08 	. 
	rst 20h			;a363	e7 	. 
	rst 20h			;a364	e7 	. 
	call pe,008dfh		;a365	ec df 08 	. . . 
	ex af,af'			;a368	08 	. 
	ex af,af'			;a369	08 	. 
	ex af,af'			;a36a	08 	. 
	ld (de),a			;a36b	12 	. 
	ld bc,00101h		;a36c	01 01 01 	. . . 
	ex af,af'			;a36f	08 	. 
	ex af,af'			;a370	08 	. 
	ex af,af'			;a371	08 	. 
	ex af,af'			;a372	08 	. 
	ex af,af'			;a373	08 	. 
	ld de,00101h		;a374	11 01 01 	. . . 
	ex af,af'			;a377	08 	. 
	ex af,af'			;a378	08 	. 
	ex af,af'			;a379	08 	. 
	ex af,af'			;a37a	08 	. 
	ex af,af'			;a37b	08 	. 
	ld (de),a			;a37c	12 	. 
	ld bc,0e901h		;a37d	01 01 e9 	. . . 
	ret pe			;a380	e8 	. 
	jp (hl)			;a381	e9 	. 
	ret pe			;a382	e8 	. 
	jp (hl)			;a383	e9 	. 
	jp (hl)			;a384	e9 	. 
	ret pe			;a385	e8 	. 
	rst 10h			;a386	d7 	. 
	rst 20h			;a387	e7 	. 
	rst 20h			;a388	e7 	. 
	rst 20h			;a389	e7 	. 
	rst 20h			;a38a	e7 	. 
	rst 20h			;a38b	e7 	. 
	rst 20h			;a38c	e7 	. 
	rst 20h			;a38d	e7 	. 
	rst 18h			;a38e	df 	. 
	rst 20h			;a38f	e7 	. 
	rst 20h			;a390	e7 	. 
	rst 20h			;a391	e7 	. 
	rst 20h			;a392	e7 	. 
	rst 20h			;a393	e7 	. 
	in a,(0dfh)		;a394	db df 	. . 
	ld bc,00101h		;a396	01 01 01 	. . . 
	ld bc,00101h		;a399	01 01 01 	. . . 
	ld bc,00101h		;a39c	01 01 01 	. . . 
	ld bc,00101h		;a39f	01 01 01 	. . . 
	ld bc,00101h		;a3a2	01 01 01 	. . . 
	ld bc,00101h		;a3a5	01 01 01 	. . . 
	ld bc,00101h		;a3a8	01 01 01 	. . . 
	ld bc,00101h		;a3ab	01 01 01 	. . . 
	ret p			;a3ae	f0 	. 
	rst 28h			;a3af	ef 	. 
	xor 0e9h		;a3b0	ee e9 	. . 
	ret pe			;a3b2	e8 	. 
	jp pe,0eee9h		;a3b3	ea e9 ee 	. . . 
	defb 0edh;next byte illegal after ed		;a3b6	ed 	. 
	rst 20h			;a3b7	e7 	. 
	call pe,0e7eah		;a3b8	ec ea e7 	. . . 
	xor 0e7h		;a3bb	ee e7 	. . 
	rst 20h			;a3bd	e7 	. 
	rst 20h			;a3be	e7 	. 
	rst 20h			;a3bf	e7 	. 
	ex de,hl			;a3c0	eb 	. 
	rst 20h			;a3c1	e7 	. 
	rst 20h			;a3c2	e7 	. 
	rst 20h			;a3c3	e7 	. 
	rst 20h			;a3c4	e7 	. 
	rst 20h			;a3c5	e7 	. 
	rst 20h			;a3c6	e7 	. 
	rst 20h			;a3c7	e7 	. 
	rst 20h			;a3c8	e7 	. 
	sub 0deh		;a3c9	d6 de 	. . 
	rst 20h			;a3cb	e7 	. 
	rst 20h			;a3cc	e7 	. 
	rst 20h			;a3cd	e7 	. 
	rst 20h			;a3ce	e7 	. 
	rst 20h			;a3cf	e7 	. 
	rst 20h			;a3d0	e7 	. 
	ex af,af'			;a3d1	08 	. 
	defb 0ddh,0dbh,0e7h	;illegal sequence		;a3d2	dd db e7 	. . . 
	rst 20h			;a3d5	e7 	. 
	rst 20h			;a3d6	e7 	. 
	rst 20h			;a3d7	e7 	. 
	rst 20h			;a3d8	e7 	. 
	ex af,af'			;a3d9	08 	. 
	ex af,af'			;a3da	08 	. 
	ex af,af'			;a3db	08 	. 
	call c,0e7e7h		;a3dc	dc e7 e7 	. . . 
	rst 20h			;a3df	e7 	. 
	rst 20h			;a3e0	e7 	. 
	ex af,af'			;a3e1	08 	. 
	ex af,af'			;a3e2	08 	. 
	ex af,af'			;a3e3	08 	. 
	ex af,af'			;a3e4	08 	. 
	sub 0e7h		;a3e5	d6 e7 	. . 
	rst 20h			;a3e7	e7 	. 
	rst 20h			;a3e8	e7 	. 
	ex af,af'			;a3e9	08 	. 
	ex af,af'			;a3ea	08 	. 
	ex af,af'			;a3eb	08 	. 
	ex af,af'			;a3ec	08 	. 
	ex af,af'			;a3ed	08 	. 
	call po,0e7e7h		;a3ee	e4 e7 e7 	. . . 
	jp c,00101h		;a3f1	da 01 01 	. . . 
	ld bc,00101h		;a3f4	01 01 01 	. . . 
	rst 20h			;a3f7	e7 	. 
	rst 20h			;a3f8	e7 	. 
	exx			;a3f9	d9 	. 
	ld bc,00101h		;a3fa	01 01 01 	. . . 
	ld bc,0e701h		;a3fd	01 01 e7 	. . . 
	pop hl			;a400	e1 	. 
	jp c,00101h		;a401	da 01 01 	. . . 
	ld bc,00101h		;a404	01 01 01 	. . . 
	rst 20h			;a407	e7 	. 
	rst 20h			;a408	e7 	. 
	ret c			;a409	d8 	. 
	ld bc,00101h		;a40a	01 01 01 	. . . 
	ld bc,0e701h		;a40d	01 01 e7 	. . . 
	exx			;a410	d9 	. 
	jp c,00101h		;a411	da 01 01 	. . . 
	ld bc,00101h		;a414	01 01 01 	. . . 
	rst 20h			;a417	e7 	. 
	rst 20h			;a418	e7 	. 
	ret c			;a419	d8 	. 
	ld bc,00101h		;a41a	01 01 01 	. . . 
	ld bc,0e601h		;a41d	01 01 e6 	. . . 
	rst 20h			;a420	e7 	. 
	rst 20h			;a421	e7 	. 
	ld bc,00101h		;a422	01 01 01 	. . . 
	ld bc,0e501h		;a425	01 01 e5 	. . . 
	rst 20h			;a428	e7 	. 
	rst 20h			;a429	e7 	. 
	ld bc,00101h		;a42a	01 01 01 	. . . 
	ld bc,0e401h		;a42d	01 01 e4 	. . . 
	ex (sp),hl			;a430	e3 	. 
	rst 20h			;a431	e7 	. 
	ld bc,00101h		;a432	01 01 01 	. . . 
	ld bc,0e601h		;a435	01 01 e6 	. . . 
	rst 20h			;a438	e7 	. 
	rst 20h			;a439	e7 	. 
	ld bc,00101h		;a43a	01 01 01 	. . . 
	ld bc,0e201h		;a43d	01 01 e2 	. . . 
	pop hl			;a440	e1 	. 
	rst 20h			;a441	e7 	. 
	ld bc,00101h		;a442	01 01 01 	. . . 
	ld bc,0e401h		;a445	01 01 e4 	. . . 
	rst 20h			;a448	e7 	. 
	rst 20h			;a449	e7 	. 
	ld bc,00101h		;a44a	01 01 01 	. . . 
	ld bc,00101h		;a44d	01 01 01 	. . . 
	ld bc,00101h		;a450	01 01 01 	. . . 
	ld bc,00101h		;a453	01 01 01 	. . . 
	ld bc,00101h		;a456	01 01 01 	. . . 
	ld bc,00101h		;a459	01 01 01 	. . . 
	ld bc,00101h		;a45c	01 01 01 	. . . 
	ld bc,00101h		;a45f	01 01 01 	. . . 
	ld bc,00101h		;a462	01 01 01 	. . . 
	ld bc,00101h		;a465	01 01 01 	. . . 
	ld bc,00101h		;a468	01 01 01 	. . . 
	ld bc,00101h		;a46b	01 01 01 	. . . 
	ld bc,00101h		;a46e	01 01 01 	. . . 
	ld bc,00101h		;a471	01 01 01 	. . . 
	ld bc,00101h		;a474	01 01 01 	. . . 
	ld bc,00101h		;a477	01 01 01 	. . . 
	ld bc,00101h		;a47a	01 01 01 	. . . 
	ld bc,00101h		;a47d	01 01 01 	. . . 
	ld bc,0fee0h		;a480	01 e0 fe 	. . . 
	cp 001h		;a483	fe 01 	. . 
	ld bc,00101h		;a485	01 01 01 	. . . 
	ld bc,0e1e2h		;a488	01 e2 e1 	. . . 
	rst 20h			;a48b	e7 	. 
	ld bc,00101h		;a48c	01 01 01 	. . . 
	ld bc,0e401h		;a48f	01 01 e4 	. . . 
	rst 20h			;a492	e7 	. 
	rst 20h			;a493	e7 	. 
	jp c,00101h		;a494	da 01 01 	. . . 
	ld bc,00101h		;a497	01 01 01 	. . . 
	call c,0d8deh		;a49a	dc de d8 	. . . 
	ld bc,00101h		;a49d	01 01 01 	. . . 
	ld bc,00801h		;a4a0	01 01 08 	. . . 
	ex af,af'			;a4a3	08 	. 
	ld (de),a			;a4a4	12 	. 
	ld bc,00101h		;a4a5	01 01 01 	. . . 
	ld bc,00801h		;a4a8	01 01 08 	. . . 
	ex af,af'			;a4ab	08 	. 
	ex af,af'			;a4ac	08 	. 
	ld de,00101h		;a4ad	11 01 01 	. . . 
	ld bc,00801h		;a4b0	01 01 08 	. . . 
	ex af,af'			;a4b3	08 	. 
	ex af,af'			;a4b4	08 	. 
	ld (de),a			;a4b5	12 	. 
	ld bc,00101h		;a4b6	01 01 01 	. . . 
	ld bc,00808h		;a4b9	01 08 08 	. . . 
	ex af,af'			;a4bc	08 	. 
	ex af,af'			;a4bd	08 	. 
	ld de,00101h		;a4be	11 01 01 	. . . 
	ld bc,00101h		;a4c1	01 01 01 	. . . 
	ld bc,00101h		;a4c4	01 01 01 	. . . 
	ld bc,00101h		;a4c7	01 01 01 	. . . 
	ld bc,00101h		;a4ca	01 01 01 	. . . 
	ld bc,00101h		;a4cd	01 01 01 	. . . 
	ld bc,00101h		;a4d0	01 01 01 	. . . 
	ld bc,00101h		;a4d3	01 01 01 	. . . 
	ld bc,0fefeh		;a4d6	01 fe fe 	. . . 
	rst 10h			;a4d9	d7 	. 
	ld bc,00101h		;a4da	01 01 01 	. . . 
	ld bc,0e701h		;a4dd	01 01 e7 	. . . 
	rst 20h			;a4e0	e7 	. 
	rst 20h			;a4e1	e7 	. 
	rst 10h			;a4e2	d7 	. 
	ld bc,00101h		;a4e3	01 01 01 	. . . 
	ld bc,0e7e7h		;a4e6	01 e7 e7 	. . . 
	call pe,001dfh		;a4e9	ec df 01 	. . . 
	ld bc,00101h		;a4ec	01 01 01 	. . . 
	ld bc,0e1e2h		;a4ef	01 e2 e1 	. . . 
	rst 20h			;a4f2	e7 	. 
	ld bc,00101h		;a4f3	01 01 01 	. . . 
	ld bc,0e401h		;a4f6	01 01 e4 	. . . 
	rst 20h			;a4f9	e7 	. 
	rst 20h			;a4fa	e7 	. 
	ld bc,00101h		;a4fb	01 01 01 	. . . 
	ld bc,0d601h		;a4fe	01 01 d6 	. . . 
	rst 20h			;a501	e7 	. 
	rst 20h			;a502	e7 	. 
	ld bc,00101h		;a503	01 01 01 	. . . 
	ld bc,00101h		;a506	01 01 01 	. . . 
	sbc a,008h		;a509	de 08 	. . 
	ld bc,00101h		;a50b	01 01 01 	. . . 
	ld bc,00101h		;a50e	01 01 01 	. . . 
	defb 0ddh,008h,001h	;illegal sequence		;a511	dd 08 01 	. . . 
	ld bc,00101h		;a514	01 01 01 	. . . 
	ld bc,00101h		;a517	01 01 01 	. . . 
	ex af,af'			;a51a	08 	. 
	ld (bc),a			;a51b	02 	. 
	ex af,af'			;a51c	08 	. 
	jp po,0008bh		;a51d	e2 8b 00 	. . . 
	nop			;a520	00 	. 
	nop			;a521	00 	. 
	nop			;a522	00 	. 
	nop			;a523	00 	. 
	inc bc			;a524	03 	. 
	inc c			;a525	0c 	. 
	cp 08bh		;a526	fe 8b 	. . 
	nop			;a528	00 	. 
	nop			;a529	00 	. 
	nop			;a52a	00 	. 
	nop			;a52b	00 	. 
	nop			;a52c	00 	. 
	inc bc			;a52d	03 	. 
	ld c,0aeh		;a52e	0e ae 	. . 
	adc a,e			;a530	8b 	. 
	nop			;a531	00 	. 
	nop			;a532	00 	. 
	nop			;a533	00 	. 
	nop			;a534	00 	. 
	nop			;a535	00 	. 
	dec b			;a536	05 	. 
	jr $-54		;a537	18 c8 	. . 
	adc a,e			;a539	8b 	. 
	nop			;a53a	00 	. 
	nop			;a53b	00 	. 
	nop			;a53c	00 	. 
	nop			;a53d	00 	. 
	nop			;a53e	00 	. 
	rlca			;a53f	07 	. 
	dec de			;a540	1b 	. 
	cp e			;a541	bb 	. 
	adc a,e			;a542	8b 	. 
	nop			;a543	00 	. 
	nop			;a544	00 	. 
	nop			;a545	00 	. 
	nop			;a546	00 	. 
	nop			;a547	00 	. 
	rlca			;a548	07 	. 
	ld de,08bcfh		;a549	11 cf 8b 	. . . 
	nop			;a54c	00 	. 
	nop			;a54d	00 	. 
	nop			;a54e	00 	. 
	nop			;a54f	00 	. 
	nop			;a550	00 	. 
	rlca			;a551	07 	. 
	ld d,0efh		;a552	16 ef 	. . 
	adc a,e			;a554	8b 	. 
	nop			;a555	00 	. 
	nop			;a556	00 	. 
	nop			;a557	00 	. 
	nop			;a558	00 	. 
	nop			;a559	00 	. 
	ex af,af'			;a55a	08 	. 
	dec de			;a55b	1b 	. 
	cp l			;a55c	bd 	. 
	adc a,e			;a55d	8b 	. 
	nop			;a55e	00 	. 
	nop			;a55f	00 	. 
	nop			;a560	00 	. 
	nop			;a561	00 	. 
	nop			;a562	00 	. 
	ex af,af'			;a563	08 	. 
	rrca			;a564	0f 	. 
	or a			;a565	b7 	. 
	adc a,d			;a566	8a 	. 
	nop			;a567	00 	. 
	nop			;a568	00 	. 
	nop			;a569	00 	. 
	nop			;a56a	00 	. 
	nop			;a56b	00 	. 
	add hl,bc			;a56c	09 	. 
	add hl,bc			;a56d	09 	. 
	rst 18h			;a56e	df 	. 
	adc a,e			;a56f	8b 	. 
	nop			;a570	00 	. 
	nop			;a571	00 	. 
	nop			;a572	00 	. 
	nop			;a573	00 	. 
	nop			;a574	00 	. 
	ld a,(bc)			;a575	0a 	. 
	inc b			;a576	04 	. 
	cp b			;a577	b8 	. 
	adc a,e			;a578	8b 	. 
	nop			;a579	00 	. 
	nop			;a57a	00 	. 
	nop			;a57b	00 	. 
	nop			;a57c	00 	. 
	nop			;a57d	00 	. 
	ld a,(bc)			;a57e	0a 	. 
	dec b			;a57f	05 	. 
	ret z			;a580	c8 	. 
	adc a,e			;a581	8b 	. 
	nop			;a582	00 	. 
	nop			;a583	00 	. 
	nop			;a584	00 	. 
	nop			;a585	00 	. 
	nop			;a586	00 	. 
	dec bc			;a587	0b 	. 
	inc b			;a588	04 	. 
	ex (sp),hl			;a589	e3 	. 
	adc a,e			;a58a	8b 	. 
	nop			;a58b	00 	. 
	nop			;a58c	00 	. 
	nop			;a58d	00 	. 
	nop			;a58e	00 	. 
	nop			;a58f	00 	. 
	dec bc			;a590	0b 	. 
	dec b			;a591	05 	. 
	in a,(08ah)		;a592	db 8a 	. . 
	nop			;a594	00 	. 
	nop			;a595	00 	. 
	nop			;a596	00 	. 
	nop			;a597	00 	. 
	nop			;a598	00 	. 
	inc c			;a599	0c 	. 
	inc b			;a59a	04 	. 
	rst 10h			;a59b	d7 	. 
	adc a,d			;a59c	8a 	. 
	nop			;a59d	00 	. 
	nop			;a59e	00 	. 
	nop			;a59f	00 	. 
	nop			;a5a0	00 	. 
	nop			;a5a1	00 	. 
	inc c			;a5a2	0c 	. 
	dec b			;a5a3	05 	. 
	rst 10h			;a5a4	d7 	. 
	adc a,e			;a5a5	8b 	. 
	nop			;a5a6	00 	. 
	nop			;a5a7	00 	. 
	nop			;a5a8	00 	. 
	nop			;a5a9	00 	. 
	nop			;a5aa	00 	. 
	inc c			;a5ab	0c 	. 
	ex af,af'			;a5ac	08 	. 
	ld e,c			;a5ad	59 	Y 
	adc a,e			;a5ae	8b 	. 
	nop			;a5af	00 	. 
	nop			;a5b0	00 	. 
	nop			;a5b1	00 	. 
	nop			;a5b2	00 	. 
	nop			;a5b3	00 	. 
	inc c			;a5b4	0c 	. 
	dec c			;a5b5	0d 	. 
	rst 18h			;a5b6	df 	. 
	adc a,e			;a5b7	8b 	. 
	nop			;a5b8	00 	. 
	nop			;a5b9	00 	. 
	nop			;a5ba	00 	. 
	nop			;a5bb	00 	. 
	nop			;a5bc	00 	. 
	ld c,011h		;a5bd	0e 11 	. . 
	xor (hl)			;a5bf	ae 	. 
	adc a,e			;a5c0	8b 	. 
	nop			;a5c1	00 	. 
	nop			;a5c2	00 	. 
	nop			;a5c3	00 	. 
	nop			;a5c4	00 	. 
	nop			;a5c5	00 	. 
	rrca			;a5c6	0f 	. 
	rla			;a5c7	17 	. 
	cp (hl)			;a5c8	be 	. 
	adc a,e			;a5c9	8b 	. 
	nop			;a5ca	00 	. 
	nop			;a5cb	00 	. 
	nop			;a5cc	00 	. 
	nop			;a5cd	00 	. 
	nop			;a5ce	00 	. 
	djnz $+11		;a5cf	10 09 	. . 
	ld l,c			;a5d1	69 	i 
	adc a,e			;a5d2	8b 	. 
	nop			;a5d3	00 	. 
	nop			;a5d4	00 	. 
	nop			;a5d5	00 	. 
	nop			;a5d6	00 	. 
	nop			;a5d7	00 	. 
	djnz $+14		;a5d8	10 0c 	. . 
	ld e,e			;a5da	5b 	[ 
	adc a,e			;a5db	8b 	. 
	nop			;a5dc	00 	. 
	nop			;a5dd	00 	. 
	nop			;a5de	00 	. 
	nop			;a5df	00 	. 
	nop			;a5e0	00 	. 
	inc de			;a5e1	13 	. 
	dec b			;a5e2	05 	. 
	cp b			;a5e3	b8 	. 
	adc a,e			;a5e4	8b 	. 
	nop			;a5e5	00 	. 
	nop			;a5e6	00 	. 
	nop			;a5e7	00 	. 
	nop			;a5e8	00 	. 
	nop			;a5e9	00 	. 
	inc de			;a5ea	13 	. 
	ld de,08bech		;a5eb	11 ec 8b 	. . . 
	nop			;a5ee	00 	. 
	nop			;a5ef	00 	. 
	nop			;a5f0	00 	. 
	nop			;a5f1	00 	. 
	nop			;a5f2	00 	. 
	dec d			;a5f3	15 	. 
	inc c			;a5f4	0c 	. 
	cp h			;a5f5	bc 	. 
	adc a,e			;a5f6	8b 	. 
	nop			;a5f7	00 	. 
	nop			;a5f8	00 	. 
	nop			;a5f9	00 	. 
	nop			;a5fa	00 	. 
	nop			;a5fb	00 	. 
	dec d			;a5fc	15 	. 
	ld e,0b7h		;a5fd	1e b7 	. . 
	adc a,e			;a5ff	8b 	. 
	nop			;a600	00 	. 
	nop			;a601	00 	. 
	nop			;a602	00 	. 
	nop			;a603	00 	. 
	nop			;a604	00 	. 
	jr $+15		;a605	18 0d 	. . 
	cp (hl)			;a607	be 	. 
	adc a,e			;a608	8b 	. 
	nop			;a609	00 	. 
	nop			;a60a	00 	. 
	nop			;a60b	00 	. 
	nop			;a60c	00 	. 
	nop			;a60d	00 	. 
	jr $+21		;a60e	18 13 	. . 
	cp b			;a610	b8 	. 
	adc a,e			;a611	8b 	. 
	nop			;a612	00 	. 
	nop			;a613	00 	. 
	nop			;a614	00 	. 
	nop			;a615	00 	. 
	nop			;a616	00 	. 
	dec de			;a617	1b 	. 
	ex af,af'			;a618	08 	. 
	ret z			;a619	c8 	. 
	adc a,e			;a61a	8b 	. 
	nop			;a61b	00 	. 
	nop			;a61c	00 	. 
	nop			;a61d	00 	. 
	nop			;a61e	00 	. 
	nop			;a61f	00 	. 
	inc e			;a620	1c 	. 
	jr $-56		;a621	18 c6 	. . 
	adc a,e			;a623	8b 	. 
	nop			;a624	00 	. 
	nop			;a625	00 	. 
	nop			;a626	00 	. 
	nop			;a627	00 	. 
	nop			;a628	00 	. 
	dec e			;a629	1d 	. 
	rra			;a62a	1f 	. 
	adc a,08bh		;a62b	ce 8b 	. . 
	nop			;a62d	00 	. 
	nop			;a62e	00 	. 
	nop			;a62f	00 	. 
	nop			;a630	00 	. 
	nop			;a631	00 	. 
	dec e			;a632	1d 	. 
	ld d,0cah		;a633	16 ca 	. . 
	adc a,e			;a635	8b 	. 
	nop			;a636	00 	. 
	nop			;a637	00 	. 
	nop			;a638	00 	. 
	nop			;a639	00 	. 
	nop			;a63a	00 	. 
	ld e,001h		;a63b	1e 01 	. . 
	call z,0008bh		;a63d	cc 8b 00 	. . . 
	nop			;a640	00 	. 
	nop			;a641	00 	. 
	nop			;a642	00 	. 
	nop			;a643	00 	. 
	nop			;a644	00 	. 
	nop			;a645	00 	. 
	add a,(hl)			;a646	86 	. 
	ld a,(bc)			;a647	0a 	. 
	add hl,de			;a648	19 	. 
	add hl,de			;a649	19 	. 
	nop			;a64a	00 	. 
	ld a,(de)			;a64b	1a 	. 
	dec b			;a64c	05 	. 
	ex af,af'			;a64d	08 	. 
	nop			;a64e	00 	. 
	nop			;a64f	00 	. 
	adc a,e			;a650	8b 	. 
	ld a,(bc)			;a651	0a 	. 
	inc de			;a652	13 	. 
	ld (de),a			;a653	12 	. 
	ld c,015h		;a654	0e 15 	. . 
	ld b,008h		;a656	06 08 	. . 
	nop			;a658	00 	. 
	nop			;a659	00 	. 
	adc a,e			;a65a	8b 	. 
	ld a,(bc)			;a65b	0a 	. 
	rlca			;a65c	07 	. 
	ld b,00fh		;a65d	06 0f 	. . 
	ex af,af'			;a65f	08 	. 
	rrca			;a660	0f 	. 
	ex af,af'			;a661	08 	. 
	nop			;a662	00 	. 
	nop			;a663	00 	. 
	adc a,a			;a664	8f 	. 
	ld a,(bc)			;a665	0a 	. 
	ld b,004h		;a666	06 04 	. . 
	inc d			;a668	14 	. 
	rlca			;a669	07 	. 
	rrca			;a66a	0f 	. 
	ex af,af'			;a66b	08 	. 
	nop			;a66c	00 	. 
	nop			;a66d	00 	. 
	dec de			;a66e	1b 	. 
	ld a,(bc)			;a66f	0a 	. 
	inc b			;a670	04 	. 
	inc bc			;a671	03 	. 
	ld bc,00f0bh		;a672	01 0b 0f 	. . . 
	adc a,b			;a675	88 	. 
	nop			;a676	00 	. 
	nop			;a677	00 	. 
	sbc a,e			;a678	9b 	. 
	ld a,(bc)			;a679	0a 	. 
	rlca			;a67a	07 	. 
	inc bc			;a67b	03 	. 
	ld (bc),a			;a67c	02 	. 
	ld a,(bc)			;a67d	0a 	. 
	rrca			;a67e	0f 	. 
	ex af,af'			;a67f	08 	. 
	nop			;a680	00 	. 
	nop			;a681	00 	. 
	adc a,b			;a682	88 	. 
	ld a,(bc)			;a683	0a 	. 
	ld c,00dh		;a684	0e 0d 	. . 
	dec b			;a686	05 	. 
	rrca			;a687	0f 	. 
	dec de			;a688	1b 	. 
	add hl,bc			;a689	09 	. 
	nop			;a68a	00 	. 
	nop			;a68b	00 	. 
	adc a,b			;a68c	88 	. 
	ld a,(bc)			;a68d	0a 	. 
	jr $+23		;a68e	18 15 	. . 
	rrca			;a690	0f 	. 
	add hl,de			;a691	19 	. 
	rrca			;a692	0f 	. 
	add hl,bc			;a693	09 	. 
	nop			;a694	00 	. 
	nop			;a695	00 	. 
	add a,a			;a696	87 	. 
	ld a,(bc)			;a697	0a 	. 
	jr $+25		;a698	18 17 	. . 
	ld a,(de)			;a69a	1a 	. 
	add hl,de			;a69b	19 	. 
	ld d,009h		;a69c	16 09 	. . 
	nop			;a69e	00 	. 
	nop			;a69f	00 	. 
	rlca			;a6a0	07 	. 
	ld a,(bc)			;a6a1	0a 	. 
	add hl,de			;a6a2	19 	. 
	add hl,de			;a6a3	19 	. 
	ld (bc),a			;a6a4	02 	. 
	add hl,de			;a6a5	19 	. 
	rla			;a6a6	17 	. 
	adc a,c			;a6a7	89 	. 
	nop			;a6a8	00 	. 
	nop			;a6a9	00 	. 
	add hl,bc			;a6aa	09 	. 
	ld a,(bc)			;a6ab	0a 	. 
	jr $+23		;a6ac	18 15 	. . 
	ld a,(de)			;a6ae	1a 	. 
	add hl,de			;a6af	19 	. 
	ld c,086h		;a6b0	0e 86 	. . 
	nop			;a6b2	00 	. 
	nop			;a6b3	00 	. 
	ld a,(bc)			;a6b4	0a 	. 
	ld a,(bc)			;a6b5	0a 	. 
	ld a,(de)			;a6b6	1a 	. 
	jr $+16		;a6b7	18 0e 	. . 
	dec de			;a6b9	1b 	. 
	dec d			;a6ba	15 	. 
	adc a,d			;a6bb	8a 	. 
	nop			;a6bc	00 	. 
	nop			;a6bd	00 	. 
	rlca			;a6be	07 	. 
	inc d			;a6bf	14 	. 
	rla			;a6c0	17 	. 
	rla			;a6c1	17 	. 
	dec c			;a6c2	0d 	. 
	jr $+16		;a6c3	18 0e 	. . 
	add a,c			;a6c5	81 	. 
	nop			;a6c6	00 	. 
	nop			;a6c7	00 	. 
	add a,e			;a6c8	83 	. 
	inc d			;a6c9	14 	. 
	rrca			;a6ca	0f 	. 
	rrca			;a6cb	0f 	. 
	dec bc			;a6cc	0b 	. 
	djnz $+22		;a6cd	10 14 	. . 
	add hl,bc			;a6cf	09 	. 
	nop			;a6d0	00 	. 
	nop			;a6d1	00 	. 
	dec b			;a6d2	05 	. 
	inc d			;a6d3	14 	. 
	ld de,01510h		;a6d4	11 10 15 	. . . 
	ld de,00919h		;a6d7	11 19 09 	. . . 
	nop			;a6da	00 	. 
	nop			;a6db	00 	. 
	add a,a			;a6dc	87 	. 
	inc d			;a6dd	14 	. 
	rrca			;a6de	0f 	. 
	rrca			;a6df	0f 	. 
	rrca			;a6e0	0f 	. 
	rrca			;a6e1	0f 	. 
	ld a,(de)			;a6e2	1a 	. 
	ex af,af'			;a6e3	08 	. 
	nop			;a6e4	00 	. 
	nop			;a6e5	00 	. 
	add a,d			;a6e6	82 	. 
	add hl,bc			;a6e7	09 	. 
	inc c			;a6e8	0c 	. 
	dec bc			;a6e9	0b 	. 
	djnz $+14		;a6ea	10 0c 	. . 
	inc c			;a6ec	0c 	. 
	ex af,af'			;a6ed	08 	. 
	nop			;a6ee	00 	. 
	nop			;a6ef	00 	. 
	ld (bc),a			;a6f0	02 	. 
	dec b			;a6f1	05 	. 
	inc c			;a6f2	0c 	. 
	dec bc			;a6f3	0b 	. 
	djnz $+14		;a6f4	10 0c 	. . 
	inc c			;a6f6	0c 	. 
	adc a,b			;a6f7	88 	. 
	nop			;a6f8	00 	. 
	nop			;a6f9	00 	. 
	adc a,e			;a6fa	8b 	. 
	inc d			;a6fb	14 	. 
	inc e			;a6fc	1c 	. 
	inc e			;a6fd	1c 	. 
	ld c,01ch		;a6fe	0e 1c 	. . 
	inc e			;a700	1c 	. 
	ex af,af'			;a701	08 	. 
	nop			;a702	00 	. 
	nop			;a703	00 	. 
	add a,h			;a704	84 	. 
	ld a,(bc)			;a705	0a 	. 
	ld c,00dh		;a706	0e 0d 	. . 
	ld (de),a			;a708	12 	. 
	rrca			;a709	0f 	. 
	ld (bc),a			;a70a	02 	. 
	rlca			;a70b	07 	. 
	nop			;a70c	00 	. 
	nop			;a70d	00 	. 
	inc b			;a70e	04 	. 
	ld a,(bc)			;a70f	0a 	. 
	ld a,(bc)			;a710	0a 	. 
	add hl,bc			;a711	09 	. 
	ld a,(bc)			;a712	0a 	. 
	dec c			;a713	0d 	. 
	ld a,(bc)			;a714	0a 	. 
	adc a,c			;a715	89 	. 
	nop			;a716	00 	. 
	nop			;a717	00 	. 
	inc b			;a718	04 	. 
	ld a,(bc)			;a719	0a 	. 
	inc c			;a71a	0c 	. 
	add hl,bc			;a71b	09 	. 
	dec bc			;a71c	0b 	. 
	inc c			;a71d	0c 	. 
	jr $+11		;a71e	18 09 	. . 
	nop			;a720	00 	. 
	nop			;a721	00 	. 
	ld a,(bc)			;a722	0a 	. 
	ld a,(bc)			;a723	0a 	. 
	ex af,af'			;a724	08 	. 
	ex af,af'			;a725	08 	. 
	nop			;a726	00 	. 
	ld a,(bc)			;a727	0a 	. 
	add hl,de			;a728	19 	. 
	add a,e			;a729	83 	. 
	nop			;a72a	00 	. 
	nop			;a72b	00 	. 
	inc c			;a72c	0c 	. 
	ld b,017h		;a72d	06 17 	. . 
	ld d,016h		;a72f	16 16 	. . 
	rla			;a731	17 	. 
	dec de			;a732	1b 	. 
	rlca			;a733	07 	. 
	nop			;a734	00 	. 
	nop			;a735	00 	. 
	dec bc			;a736	0b 	. 
	ld b,019h		;a737	06 19 	. . 
	jr $+24		;a739	18 16 	. . 
	inc e			;a73b	1c 	. 
	ld b,087h		;a73c	06 87 	. . 
	nop			;a73e	00 	. 
	nop			;a73f	00 	. 
	add hl,bc			;a740	09 	. 
	ld b,01bh		;a741	06 1b 	. . 
	ld a,(de)			;a743	1a 	. 
	ld a,(de)			;a744	1a 	. 
	dec de			;a745	1b 	. 
	jr $+10		;a746	18 08 	. . 
	nop			;a748	00 	. 
	nop			;a749	00 	. 
	adc a,l			;a74a	8d 	. 
	ld b,017h		;a74b	06 17 	. . 
	ld d,010h		;a74d	16 10 	. . 
	ld a,(de)			;a74f	1a 	. 
	ld a,(de)			;a750	1a 	. 
	ex af,af'			;a751	08 	. 
	nop			;a752	00 	. 
	nop			;a753	00 	. 
	dec c			;a754	0d 	. 
	ex af,af'			;a755	08 	. 
	ld a,(de)			;a756	1a 	. 
	add hl,de			;a757	19 	. 
	ld bc,0081dh		;a758	01 1d 08 	. . . 
	adc a,b			;a75b	88 	. 
	nop			;a75c	00 	. 
	nop			;a75d	00 	. 
	adc a,(hl)			;a75e	8e 	. 
	ld b,018h		;a75f	06 18 	. . 
	rla			;a761	17 	. 
	djnz $+30		;a762	10 1c 	. . 
	dec bc			;a764	0b 	. 
	ex af,af'			;a765	08 	. 
	nop			;a766	00 	. 
	nop			;a767	00 	. 
	rrca			;a768	0f 	. 
	ld b,01bh		;a769	06 1b 	. . 
	ld a,(de)			;a76b	1a 	. 
	ld de,00b1dh		;a76c	11 1d 0b 	. . . 
	ex af,af'			;a76f	08 	. 
	nop			;a770	00 	. 
	nop			;a771	00 	. 
	sub d			;a772	92 	. 
	add hl,bc			;a773	09 	. 
	jr $+25		;a774	18 17 	. . 
	ld de,01a19h		;a776	11 19 1a 	. . . 
	ex af,af'			;a779	08 	. 
	nop			;a77a	00 	. 
	nop			;a77b	00 	. 
	ld (de),a			;a77c	12 	. 
	ld b,018h		;a77d	06 18 	. . 
	rla			;a77f	17 	. 
	ld de,00c1dh		;a780	11 1d 0c 	. . . 
	adc a,b			;a783	88 	. 
	nop			;a784	00 	. 
	nop			;a785	00 	. 
	sub l			;a786	95 	. 
	ld b,018h		;a787	06 18 	. . 
	rla			;a789	17 	. 
	djnz $+28		;a78a	10 1a 	. . 
	ld a,(de)			;a78c	1a 	. 
	ex af,af'			;a78d	08 	. 
	nop			;a78e	00 	. 
	nop			;a78f	00 	. 
	ld d,006h		;a790	16 06 	. . 
	jr $+24		;a792	18 16 	. . 
	inc d			;a794	14 	. 
	dec de			;a795	1b 	. 
	dec bc			;a796	0b 	. 
	ex af,af'			;a797	08 	. 
	nop			;a798	00 	. 
	nop			;a799	00 	. 
	jr $+8		;a79a	18 06 	. . 
	rla			;a79c	17 	. 
	ld d,001h		;a79d	16 01 	. . 
	jr $+28		;a79f	18 1a 	. . 
	adc a,b			;a7a1	88 	. 
	nop			;a7a2	00 	. 
	nop			;a7a3	00 	. 
	sbc a,c			;a7a4	99 	. 
	ld b,016h		;a7a5	06 16 	. . 
	dec d			;a7a7	15 	. 
	ld de,00618h		;a7a8	11 18 06 	. . . 
	ex af,af'			;a7ab	08 	. 
	nop			;a7ac	00 	. 
	nop			;a7ad	00 	. 
	sbc a,d			;a7ae	9a 	. 
	ld b,014h		;a7af	06 14 	. . 
	ld (de),a			;a7b1	12 	. 
	djnz $+23		;a7b2	10 15 	. . 
	dec bc			;a7b4	0b 	. 
	ex af,af'			;a7b5	08 	. 
	nop			;a7b6	00 	. 
	nop			;a7b7	00 	. 
	sbc a,e			;a7b8	9b 	. 
	ld b,014h		;a7b9	06 14 	. . 
	inc de			;a7bb	13 	. 
	ld bc,00b17h		;a7bc	01 17 0b 	. . . 
	ex af,af'			;a7bf	08 	. 
	nop			;a7c0	00 	. 
	nop			;a7c1	00 	. 
	sbc a,e			;a7c2	9b 	. 
	ld b,01ah		;a7c3	06 1a 	. . 
	ld a,(de)			;a7c5	1a 	. 
	nop			;a7c6	00 	. 
	dec de			;a7c7	1b 	. 
	dec bc			;a7c8	0b 	. 
	ex af,af'			;a7c9	08 	. 
	nop			;a7ca	00 	. 
	nop			;a7cb	00 	. 
	dec e			;a7cc	1d 	. 
	ld b,017h		;a7cd	06 17 	. . 
	dec d			;a7cf	15 	. 
	djnz $+28		;a7d0	10 1a 	. . 
	ex af,af'			;a7d2	08 	. 
	ex af,af'			;a7d3	08 	. 
	nop			;a7d4	00 	. 
	nop			;a7d5	00 	. 
	dec e			;a7d6	1d 	. 
	ld a,(bc)			;a7d7	0a 	. 
	dec e			;a7d8	1d 	. 
	inc e			;a7d9	1c 	. 
	djnz $+32		;a7da	10 1e 	. . 
	ld a,(de)			;a7dc	1a 	. 
	adc a,b			;a7dd	88 	. 
	nop			;a7de	00 	. 
	nop			;a7df	00 	. 
	sbc a,(hl)			;a7e0	9e 	. 
	ld b,017h		;a7e1	06 17 	. . 
	ld (de),a			;a7e3	12 	. 
	djnz $+30		;a7e4	10 1c 	. . 
	dec bc			;a7e6	0b 	. 
	ex af,af'			;a7e7	08 	. 
	nop			;a7e8	00 	. 
	nop			;a7e9	00 	. 
	ld e,00ch		;a7ea	1e 0c 	. . 
	rla			;a7ec	17 	. 
	ld (de),a			;a7ed	12 	. 
	djnz $+30		;a7ee	10 1c 	. . 
	dec bc			;a7f0	0b 	. 
	adc a,b			;a7f1	88 	. 
	nop			;a7f2	00 	. 
	nop			;a7f3	00 	. 
	ld a,(bc)			;a7f4	0a 	. 
	ld a,(bc)			;a7f5	0a 	. 
	inc b			;a7f6	04 	. 
	inc b			;a7f7	04 	. 
	inc bc			;a7f8	03 	. 
	dec b			;a7f9	05 	. 
	dec d			;a7fa	15 	. 
	ex af,af'			;a7fb	08 	. 
	nop			;a7fc	00 	. 
	nop			;a7fd	00 	. 
	sub l			;a7fe	95 	. 
	ld b,013h		;a7ff	06 13 	. . 
	ld (de),a			;a801	12 	. 
	nop			;a802	00 	. 
	inc d			;a803	14 	. 
	dec bc			;a804	0b 	. 
	ex af,af'			;a805	08 	. 
	nop			;a806	00 	. 
	nop			;a807	00 	. 
	ld d,006h		;a808	16 06 	. . 
	inc d			;a80a	14 	. 
	inc de			;a80b	13 	. 
	djnz $+22		;a80c	10 14 	. . 
	dec bc			;a80e	0b 	. 
	ex af,af'			;a80f	08 	. 
	nop			;a810	00 	. 
	nop			;a811	00 	. 
	sub d			;a812	92 	. 
	ld bc,01011h		;a813	01 11 10 	. . . 
	inc bc			;a816	03 	. 
	ld de,00717h		;a817	11 17 07 	. . . 
	nop			;a81a	00 	. 
	nop			;a81b	00 	. 
	dec e			;a81c	1d 	. 
	ld a,(bc)			;a81d	0a 	. 
	rra			;a81e	1f 	. 
	inc e			;a81f	1c 	. 
	ld c,020h		;a820	0e 20 	.   
	inc bc			;a822	03 	. 
	ex af,af'			;a823	08 	. 
	nop			;a824	00 	. 
	nop			;a825	00 	. 
	dec de			;a826	1b 	. 
	dec c			;a827	0d 	. 
	ld (bc),a			;a828	02 	. 
	ld bc,0020fh		;a829	01 0f 02 	. . . 
	jr $-118		;a82c	18 88 	. . 
	nop			;a82e	00 	. 
	nop			;a82f	00 	. 
	sbc a,e			;a830	9b 	. 
	ld a,(bc)			;a831	0a 	. 
	ld (bc),a			;a832	02 	. 
	ld bc,0020fh		;a833	01 0f 02 	. . . 
	jr $+10		;a836	18 08 	. . 
	nop			;a838	00 	. 
	nop			;a839	00 	. 
	ld b,00fh		;a83a	06 0f 	. . 
	dec b			;a83c	05 	. 
	dec b			;a83d	05 	. 
	ld a,(bc)			;a83e	0a 	. 
	dec b			;a83f	05 	. 
	inc d			;a840	14 	. 
	dec b			;a841	05 	. 
	nop			;a842	00 	. 
	nop			;a843	00 	. 
	adc a,c			;a844	89 	. 
	rrca			;a845	0f 	. 
	inc b			;a846	04 	. 
	inc b			;a847	04 	. 
	ld b,004h		;a848	06 04 	. . 
	inc d			;a84a	14 	. 
	ex af,af'			;a84b	08 	. 
	nop			;a84c	00 	. 
	nop			;a84d	00 	. 
	ld a,(bc)			;a84e	0a 	. 
	rrca			;a84f	0f 	. 
	inc b			;a850	04 	. 
	inc b			;a851	04 	. 
	ld bc,01405h		;a852	01 05 14 	. . . 
	adc a,b			;a855	88 	. 
	nop			;a856	00 	. 
	nop			;a857	00 	. 
	dec bc			;a858	0b 	. 
	rrca			;a859	0f 	. 
	inc b			;a85a	04 	. 
	inc b			;a85b	04 	. 
	ld bc,00705h		;a85c	01 05 07 	. . . 
	ld bc,00000h		;a85f	01 00 00 	. . . 
	dec bc			;a862	0b 	. 
	djnz $+6		;a863	10 04 	. . 
	inc b			;a865	04 	. 
	ld bc,01a04h		;a866	01 04 1a 	. . . 
	adc a,c			;a869	89 	. 
	nop			;a86a	00 	. 
	nop			;a86b	00 	. 
	inc c			;a86c	0c 	. 
	rrca			;a86d	0f 	. 
	inc b			;a86e	04 	. 
	inc b			;a86f	04 	. 
	ld bc,01404h		;a870	01 04 14 	. . . 
	ld bc,00000h		;a873	01 00 00 	. . . 
	inc c			;a876	0c 	. 
	djnz $+6		;a877	10 04 	. . 
	inc b			;a879	04 	. 
	ld bc,01a04h		;a87a	01 04 1a 	. . . 
	adc a,c			;a87d	89 	. 
	nop			;a87e	00 	. 
	nop			;a87f	00 	. 
	dec bc			;a880	0b 	. 
	ld a,(bc)			;a881	0a 	. 
	ld a,(bc)			;a882	0a 	. 
	ld a,(bc)			;a883	0a 	. 
	ld bc,0190ah		;a884	01 0a 19 	. . . 
	ld bc,00000h		;a887	01 00 00 	. . . 
	dec bc			;a88a	0b 	. 
	dec bc			;a88b	0b 	. 
	ld a,(bc)			;a88c	0a 	. 
	ld a,(bc)			;a88d	0a 	. 
	ld bc,0190ah		;a88e	01 0a 19 	. . . 
	add a,c			;a891	81 	. 
	nop			;a892	00 	. 
	nop			;a893	00 	. 
	ld a,(bc)			;a894	0a 	. 
	ld a,(bc)			;a895	0a 	. 
	add hl,bc			;a896	09 	. 
	ex af,af'			;a897	08 	. 
	ld bc,0140ah		;a898	01 0a 14 	. . . 
	inc bc			;a89b	03 	. 
	nop			;a89c	00 	. 
	nop			;a89d	00 	. 
	add hl,bc			;a89e	09 	. 
	ld a,(bc)			;a89f	0a 	. 
	add hl,bc			;a8a0	09 	. 
	ex af,af'			;a8a1	08 	. 
	ld bc,0140ah		;a8a2	01 0a 14 	. . . 
	add hl,bc			;a8a5	09 	. 
	nop			;a8a6	00 	. 
	nop			;a8a7	00 	. 
	add hl,bc			;a8a8	09 	. 
	dec bc			;a8a9	0b 	. 
	add hl,bc			;a8aa	09 	. 
	ex af,af'			;a8ab	08 	. 
	ld bc,0140ah		;a8ac	01 0a 14 	. . . 
	adc a,c			;a8af	89 	. 
	nop			;a8b0	00 	. 
	nop			;a8b1	00 	. 
	ex af,af'			;a8b2	08 	. 
	ld a,(bc)			;a8b3	0a 	. 
	ex af,af'			;a8b4	08 	. 
	ex af,af'			;a8b5	08 	. 
	ld bc,00409h		;a8b6	01 09 04 	. . . 
	add hl,bc			;a8b9	09 	. 
	nop			;a8ba	00 	. 
	nop			;a8bb	00 	. 
	ex af,af'			;a8bc	08 	. 
	ld a,(bc)			;a8bd	0a 	. 
	ld a,(bc)			;a8be	0a 	. 
	add hl,bc			;a8bf	09 	. 
	inc de			;a8c0	13 	. 
	ld a,(bc)			;a8c1	0a 	. 
	inc d			;a8c2	14 	. 
	adc a,c			;a8c3	89 	. 
	nop			;a8c4	00 	. 
	nop			;a8c5	00 	. 
	rlca			;a8c6	07 	. 
	ld a,(bc)			;a8c7	0a 	. 
	ex af,af'			;a8c8	08 	. 
	ex af,af'			;a8c9	08 	. 
	ld bc,01808h		;a8ca	01 08 18 	. . . 
	add hl,bc			;a8cd	09 	. 
	nop			;a8ce	00 	. 
	nop			;a8cf	00 	. 
	rlca			;a8d0	07 	. 
	ld a,(bc)			;a8d1	0a 	. 
	ld a,(bc)			;a8d2	0a 	. 
	ld a,(bc)			;a8d3	0a 	. 
	ld bc,0180ah		;a8d4	01 0a 18 	. . . 
	adc a,c			;a8d7	89 	. 
	nop			;a8d8	00 	. 
	nop			;a8d9	00 	. 
	add hl,bc			;a8da	09 	. 
	ld a,(bc)			;a8db	0a 	. 
	dec c			;a8dc	0d 	. 
	inc c			;a8dd	0c 	. 
	inc b			;a8de	04 	. 
	ld de,00818h		;a8df	11 18 08 	. . . 
	nop			;a8e2	00 	. 
	nop			;a8e3	00 	. 
	ld a,(bc)			;a8e4	0a 	. 
	ld a,(bc)			;a8e5	0a 	. 
	ld de,01410h		;a8e6	11 10 14 	. . . 
	ld de,00918h		;a8e9	11 18 09 	. . . 
	nop			;a8ec	00 	. 
	nop			;a8ed	00 	. 
	ld a,(bc)			;a8ee	0a 	. 
	ld a,(bc)			;a8ef	0a 	. 
	rrca			;a8f0	0f 	. 
	ld c,014h		;a8f1	0e 14 	. . 
	djnz $+11		;a8f3	10 09 	. . 
	adc a,c			;a8f5	89 	. 
	nop			;a8f6	00 	. 
	nop			;a8f7	00 	. 
	ld a,(bc)			;a8f8	0a 	. 
	ld a,(bc)			;a8f9	0a 	. 
	dec c			;a8fa	0d 	. 
	inc c			;a8fb	0c 	. 
	inc b			;a8fc	04 	. 
	ld c,009h		;a8fd	0e 09 	. . 
	add hl,bc			;a8ff	09 	. 
	nop			;a900	00 	. 
	nop			;a901	00 	. 
	dec bc			;a902	0b 	. 
	ld a,(bc)			;a903	0a 	. 
	djnz $+14		;a904	10 0c 	. . 
	dec b			;a906	05 	. 
	ld de,0080bh		;a907	11 0b 08 	. . . 
	nop			;a90a	00 	. 
	nop			;a90b	00 	. 
	inc c			;a90c	0c 	. 
	ld a,(bc)			;a90d	0a 	. 
	ld c,00ch		;a90e	0e 0c 	. . 
	inc b			;a910	04 	. 
	rrca			;a911	0f 	. 
	ex af,af'			;a912	08 	. 
	add hl,bc			;a913	09 	. 
	nop			;a914	00 	. 
	nop			;a915	00 	. 
	inc c			;a916	0c 	. 
	ld a,(bc)			;a917	0a 	. 
	djnz $+17		;a918	10 0f 	. . 
	inc d			;a91a	14 	. 
	ld de,08917h		;a91b	11 17 89 	. . . 
	nop			;a91e	00 	. 
	ld b,b			;a91f	40 	@ 
	ld de,00c0ah		;a920	11 0a 0c 	. . . 
	inc c			;a923	0c 	. 
	dec b			;a924	05 	. 
	ld c,017h		;a925	0e 17 	. . 
	dec b			;a927	05 	. 
	nop			;a928	00 	. 
	ld b,b			;a929	40 	@ 
	inc c			;a92a	0c 	. 
	ld a,(bc)			;a92b	0a 	. 
	add hl,bc			;a92c	09 	. 
	ex af,af'			;a92d	08 	. 
	ld b,00ah		;a92e	06 0a 	. . 
	jr $+7		;a930	18 05 	. . 
	nop			;a932	00 	. 
	ld b,b			;a933	40 	@ 
	dec c			;a934	0d 	. 
	ld a,(bc)			;a935	0a 	. 
	add hl,bc			;a936	09 	. 
	rlca			;a937	07 	. 
	djnz $+12		;a938	10 0a 	. . 
	jr $+10		;a93a	18 08 	. . 
	nop			;a93c	00 	. 
	ld b,b			;a93d	40 	@ 
	ld c,00ah		;a93e	0e 0a 	. . 
	add hl,bc			;a940	09 	. 
	ex af,af'			;a941	08 	. 
	ld b,00ah		;a942	06 0a 	. . 
	jr $+7		;a944	18 05 	. . 
	nop			;a946	00 	. 
	ld b,b			;a947	40 	@ 
	rrca			;a948	0f 	. 
	ld a,(bc)			;a949	0a 	. 
	add hl,bc			;a94a	09 	. 
	ex af,af'			;a94b	08 	. 
	ld bc,0180ah		;a94c	01 0a 18 	. . . 
	ex af,af'			;a94f	08 	. 
	nop			;a950	00 	. 
	ld b,b			;a951	40 	@ 
	djnz $+12		;a952	10 0a 	. . 
	add hl,bc			;a954	09 	. 
	ex af,af'			;a955	08 	. 
	ld b,00ah		;a956	06 0a 	. . 
	jr $-121		;a958	18 85 	. . 
	nop			;a95a	00 	. 
	ld b,b			;a95b	40 	@ 
	djnz $+12		;a95c	10 0a 	. . 
	dec c			;a95e	0d 	. 
	inc c			;a95f	0c 	. 
	inc b			;a960	04 	. 
	ld c,017h		;a961	0e 17 	. . 
	dec b			;a963	05 	. 
	nop			;a964	00 	. 
	ld b,b			;a965	40 	@ 
	djnz $+12		;a966	10 0a 	. . 
	inc c			;a968	0c 	. 
	inc c			;a969	0c 	. 
	dec b			;a96a	05 	. 
	ld c,017h		;a96b	0e 17 	. . 
	add a,l			;a96d	85 	. 
	nop			;a96e	00 	. 
	ld b,b			;a96f	40 	@ 
	ld de,0090ah		;a970	11 0a 09 	. . . 
	ex af,af'			;a973	08 	. 
	ld b,00ah		;a974	06 0a 	. . 
	jr $+7		;a976	18 05 	. . 
	nop			;a978	00 	. 
	ld b,b			;a979	40 	@ 
	dec c			;a97a	0d 	. 
	ld a,(bc)			;a97b	0a 	. 
	ld c,00ch		;a97c	0e 0c 	. . 
	inc b			;a97e	04 	. 
	djnz $+25		;a97f	10 17 	. . 
	rlca			;a981	07 	. 
	nop			;a982	00 	. 
	ld b,b			;a983	40 	@ 
	dec c			;a984	0d 	. 
	ld a,(bc)			;a985	0a 	. 
	ld de,00110h		;a986	11 10 01 	. . . 
	ld de,08717h		;a989	11 17 87 	. . . 
	nop			;a98c	00 	. 
	ld b,b			;a98d	40 	@ 
	ld c,00ah		;a98e	0e 0a 	. . 
	ld c,00ch		;a990	0e 0c 	. . 
	inc b			;a992	04 	. 
	ld de,00717h		;a993	11 17 07 	. . . 
	nop			;a996	00 	. 
	ld b,b			;a997	40 	@ 
	ld c,00ah		;a998	0e 0a 	. . 
	ld de,00110h		;a99a	11 10 01 	. . . 
	ld de,08717h		;a99d	11 17 87 	. . . 
	nop			;a9a0	00 	. 
	ld b,b			;a9a1	40 	@ 
	rrca			;a9a2	0f 	. 
	ld a,(bc)			;a9a3	0a 	. 
	dec c			;a9a4	0d 	. 
	dec bc			;a9a5	0b 	. 
	inc d			;a9a6	14 	. 
	ld c,018h		;a9a7	0e 18 	. . 
	ex af,af'			;a9a9	08 	. 
	nop			;a9aa	00 	. 
	ld b,c			;a9ab	41 	A 
	dec bc			;a9ac	0b 	. 
	inc de			;a9ad	13 	. 
	ld (de),a			;a9ae	12 	. 
	ld (de),a			;a9af	12 	. 
	ld de,00615h		;a9b0	11 15 06 	. . . 
	adc a,h			;a9b3	8c 	. 
	nop			;a9b4	00 	. 
	ld b,c			;a9b5	41 	A 
	add hl,bc			;a9b6	09 	. 
	ld a,(bc)			;a9b7	0a 	. 
	jr $+23		;a9b8	18 15 	. . 
	ld a,(de)			;a9ba	1a 	. 
	add hl,de			;a9bb	19 	. 
	ld c,00ah		;a9bc	0e 0a 	. . 
	nop			;a9be	00 	. 
	ld b,c			;a9bf	41 	A 
	rrca			;a9c0	0f 	. 
	ld a,(bc)			;a9c1	0a 	. 
	dec c			;a9c2	0d 	. 
	dec bc			;a9c3	0b 	. 
	inc d			;a9c4	14 	. 
	ld c,018h		;a9c5	0e 18 	. . 
	adc a,h			;a9c7	8c 	. 
	nop			;a9c8	00 	. 
	ld bc,00112h		;a9c9	01 12 01 	. . . 
	ld de,00310h		;a9cc	11 10 03 	. . . 
	ld de,08b17h		;a9cf	11 17 8b 	. . . 
	nop			;a9d2	00 	. 
	ld bc,0060ch		;a9d3	01 0c 06 	. . . 
	rla			;a9d6	17 	. 
	ld d,016h		;a9d7	16 16 	. . 
	rla			;a9d9	17 	. 
	dec de			;a9da	1b 	. 
	adc a,e			;a9db	8b 	. 
	nop			;a9dc	00 	. 
	ld bc,0060bh		;a9dd	01 0b 06 	. . . 
	add hl,de			;a9e0	19 	. 
	jr $+24		;a9e1	18 16 	. . 
	dec de			;a9e3	1b 	. 
	add hl,de			;a9e4	19 	. 
	dec bc			;a9e5	0b 	. 
	nop			;a9e6	00 	. 
	ld bc,0060dh		;a9e7	01 0d 06 	. . . 
	rla			;a9ea	17 	. 
	ld d,010h		;a9eb	16 10 	. . 
	jr $+28		;a9ed	18 1a 	. . 
	adc a,h			;a9ef	8c 	. 
	nop			;a9f0	00 	. 
	ld bc,0060dh		;a9f1	01 0d 06 	. . . 
	inc e			;a9f4	1c 	. 
	dec de			;a9f5	1b 	. 
	ld bc,0081dh		;a9f6	01 1d 08 	. . . 
	inc c			;a9f9	0c 	. 
	nop			;a9fa	00 	. 
	ld bc,00612h		;a9fb	01 12 06 	. . . 
	dec de			;a9fe	1b 	. 
	ld a,(de)			;a9ff	1a 	. 
	ld bc,00c1dh		;aa00	01 1d 0c 	. . . 
	inc c			;aa03	0c 	. 
	nop			;aa04	00 	. 
	ld bc,00616h		;aa05	01 16 06 	. . . 
	jr $+24		;aa08	18 16 	. . 
	inc d			;aa0a	14 	. 
	dec de			;aa0b	1b 	. 
	dec bc			;aa0c	0b 	. 
	adc a,h			;aa0d	8c 	. 
	nop			;aa0e	00 	. 
	ld bc,00618h		;aa0f	01 18 06 	. . . 
	dec d			;aa12	15 	. 
	inc d			;aa13	14 	. 
	ld de,01a17h		;aa14	11 17 1a 	. . . 
	inc c			;aa17	0c 	. 
	nop			;aa18	00 	. 
	ld bc,00618h		;aa19	01 18 06 	. . . 
	add hl,de			;aa1c	19 	. 
	jr $+3		;aa1d	18 01 	. . 
	dec de			;aa1f	1b 	. 
	ld a,(de)			;aa20	1a 	. 
	inc c			;aa21	0c 	. 
	nop			;aa22	00 	. 
	ld bc,00a0bh		;aa23	01 0b 0a 	. . . 
	rlca			;aa26	07 	. 
	ld b,00fh		;aa27	06 0f 	. . 
	ex af,af'			;aa29	08 	. 
	dec de			;aa2a	1b 	. 
	adc a,h			;aa2b	8c 	. 
	nop			;aa2c	00 	. 
	ld bc,00a0bh		;aa2d	01 0b 0a 	. . . 
	ld c,00ch		;aa30	0e 0c 	. . 
	inc b			;aa32	04 	. 
	djnz $+27		;aa33	10 19 	. . 
	adc a,h			;aa35	8c 	. 
	nop			;aa36	00 	. 
	inc c			;aa37	0c 	. 
	ld b,a			;aa38	47 	G 
	rlca			;aa39	07 	. 
	dec de			;aa3a	1b 	. 
	jr c,$+15		;aa3b	38 0d 	8 . 
	inc bc			;aa3d	03 	. 
	ld b,e			;aa3e	43 	C 
	dec c			;aa3f	0d 	. 
	ld c,05eh		;aa40	0e 5e 	. ^ 
	rrca			;aa42	0f 	. 
	dec b			;aa43	05 	. 
	jr c,$+17		;aa44	38 0f 	8 . 
	inc e			;aa46	1c 	. 
	jr c,$+17		;aa47	38 0f 	8 . 
	inc e			;aa49	1c 	. 
	ld b,b			;aa4a	40 	@ 
	ld (de),a			;aa4b	12 	. 
	add hl,de			;aa4c	19 	. 
	ld b,b			;aa4d	40 	@ 
	inc de			;aa4e	13 	. 
	ld e,041h		;aa4f	1e 41 	. A 
	ld d,016h		;aa51	16 16 	. . 
	ld b,h			;aa53	44 	D 
	ld d,016h		;aa54	16 16 	. . 
	ld b,l			;aa56	45 	E 
	ld d,018h		;aa57	16 18 	. . 
	ld c,e			;aa59	4b 	K 
	ld d,018h		;aa5a	16 18 	. . 
	ld c,h			;aa5c	4c 	L 
	add hl,de			;aa5d	19 	. 
	inc c			;aa5e	0c 	. 
	ld b,b			;aa5f	40 	@ 
	dec de			;aa60	1b 	. 
	nop			;aa61	00 	. 
	ld c,b			;aa62	48 	H 
	dec de			;aa63	1b 	. 
	dec b			;aa64	05 	. 
	dec hl			;aa65	2b 	+ 
	dec de			;aa66	1b 	. 
	rlca			;aa67	07 	. 
	ld b,(hl)			;aa68	46 	F 
	dec de			;aa69	1b 	. 
	add hl,bc			;aa6a	09 	. 
	add hl,sp			;aa6b	39 	9 
	dec de			;aa6c	1b 	. 
	dec c			;aa6d	0d 	. 
	jr c,$+29		;aa6e	38 1b 	8 . 
	ld c,04ch		;aa70	0e 4c 	. L 
	dec de			;aa72	1b 	. 
	ld c,04bh		;aa73	0e 4b 	. K 
	dec e			;aa75	1d 	. 
	rra			;aa76	1f 	. 
	ld b,d			;aa77	42 	B 
	cp 082h		;aa78	fe 82 	. . 
	and d			;aa7a	a2 	. 
	and d			;aa7b	a2 	. 
	cp d			;aa7c	ba 	. 
	add a,d			;aa7d	82 	. 
	cp 000h		;aa7e	fe 00 	. . 
	jr nz,$+2		;aa80	20 00 	  . 
	nop			;aa82	00 	. 
	nop			;aa83	00 	. 
	nop			;aa84	00 	. 
	nop			;aa85	00 	. 
	nop			;aa86	00 	. 
	nop			;aa87	00 	. 
	nop			;aa88	00 	. 
	ex af,af'			;aa89	08 	. 
	jr c,$+54		;aa8a	38 34 	8 4 
	inc l			;aa8c	2c 	, 
	inc e			;aa8d	1c 	. 
	inc e			;aa8e	1c 	. 
	inc l			;aa8f	2c 	, 
	inc (hl)			;aa90	34 	4 
	jr c,$+59		;aa91	38 39 	8 9 
	ld bc,00703h		;aa93	01 03 07 	. . . 
	dec c			;aa96	0d 	. 
	add hl,de			;aa97	19 	. 
	ld sp,0c161h		;aa98	31 61 c1 	1 a . 
	rrca			;aa9b	0f 	. 
	add a,b			;aa9c	80 	. 
	ret nz			;aa9d	c0 	. 
	ret po			;aa9e	e0 	. 
	or b			;aa9f	b0 	. 
	sbc a,b			;aaa0	98 	. 
	adc a,h			;aaa1	8c 	. 
	add a,(hl)			;aaa2	86 	. 
	add a,e			;aaa3	83 	. 
	rrca			;aaa4	0f 	. 
	jr nz,$+42		;aaa5	20 28 	  ( 
	jr nz,$+41		;aaa7	20 27 	  ' 
	cpl			;aaa9	2f 	/ 
	cpl			;aaaa	2f 	/ 
	cpl			;aaab	2f 	/ 
	cpl			;aaac	2f 	/ 
	add hl,sp			;aaad	39 	9 
	ld (bc),a			;aaae	02 	. 
	ld a,(bc)			;aaaf	0a 	. 
	ld (bc),a			;aab0	02 	. 
	jp po,0f2f2h		;aab1	e2 f2 f2 	. . . 
	jp p,039f2h		;aab4	f2 f2 39 	. . 9 
	xor d			;aab7	aa 	. 
	nop			;aab8	00 	. 
	nop			;aab9	00 	. 
	nop			;aaba	00 	. 
	nop			;aabb	00 	. 
	nop			;aabc	00 	. 
	nop			;aabd	00 	. 
	nop			;aabe	00 	. 
	ld a,(bc)			;aabf	0a 	. 
	rst 38h			;aac0	ff 	. 
	ld b,b			;aac1	40 	@ 
	ld b,b			;aac2	40 	@ 
	ld b,b			;aac3	40 	@ 
	rst 38h			;aac4	ff 	. 
	inc b			;aac5	04 	. 
	inc b			;aac6	04 	. 
	inc b			;aac7	04 	. 
	ex af,af'			;aac8	08 	. 
	djnz $+25		;aac9	10 17 	. . 
	rra			;aacb	1f 	. 
	rra			;aacc	1f 	. 
	djnz $+25		;aacd	10 17 	. . 
	rra			;aacf	1f 	. 
	rra			;aad0	1f 	. 
	add hl,sp			;aad1	39 	9 
	ex af,af'			;aad2	08 	. 
	ret pe			;aad3	e8 	. 
	ret m			;aad4	f8 	. 
	ret m			;aad5	f8 	. 
	ex af,af'			;aad6	08 	. 
	ret pe			;aad7	e8 	. 
	ret m			;aad8	f8 	. 
	ret m			;aad9	f8 	. 
	add hl,sp			;aada	39 	9 
	rst 38h			;aadb	ff 	. 
	rst 38h			;aadc	ff 	. 
	rst 38h			;aadd	ff 	. 
	rst 38h			;aade	ff 	. 
	rst 38h			;aadf	ff 	. 
	add a,a			;aae0	87 	. 
	rlca			;aae1	07 	. 
	inc bc			;aae2	03 	. 
	ex af,af'			;aae3	08 	. 
	rst 38h			;aae4	ff 	. 
	rst 38h			;aae5	ff 	. 
	rst 38h			;aae6	ff 	. 
	nop			;aae7	00 	. 
	rst 38h			;aae8	ff 	. 
	nop			;aae9	00 	. 
	nop			;aaea	00 	. 
	nop			;aaeb	00 	. 
	djnz $+1		;aaec	10 ff 	. . 
	rst 38h			;aaee	ff 	. 
	rst 38h			;aaef	ff 	. 
	rst 30h			;aaf0	f7 	. 
	di			;aaf1	f3 	. 
	jp po,0c0e2h		;aaf2	e2 e2 c0 	. . . 
	ex af,af'			;aaf5	08 	. 
	rst 30h			;aaf6	f7 	. 
	add a,b			;aaf7	80 	. 
	xor d			;aaf8	aa 	. 
	add a,h			;aaf9	84 	. 
	xor d			;aafa	aa 	. 
	add a,b			;aafb	80 	. 
	xor d			;aafc	aa 	. 
	nop			;aafd	00 	. 
	jr nz,$-16		;aafe	20 ee 	  . 
	nop			;ab00	00 	. 
	xor d			;ab01	aa 	. 
	nop			;ab02	00 	. 
	xor d			;ab03	aa 	. 
	ld (bc),a			;ab04	02 	. 
	xor (hl)			;ab05	ae 	. 
	nop			;ab06	00 	. 
	jr nz,$+84		;ab07	20 52 	  R 
	ld d,h			;ab09	54 	T 
	ld d,l			;ab0a	55 	U 
	or l			;ab0b	b5 	. 
	or (hl)			;ab0c	b6 	. 
	sub d			;ab0d	92 	. 
	jp z,0104ah		;ab0e	ca 4a 10 	. J . 
	add a,b			;ab11	80 	. 
	ret nz			;ab12	c0 	. 
	ld b,b			;ab13	40 	@ 
	ld h,b			;ab14	60 	` 
	ret po			;ab15	e0 	. 
	jr nz,$+34		;ab16	20 20 	    
	jr nc,$+10		;ab18	30 08 	0 . 
	ret m			;ab1a	f8 	. 
	ld c,h			;ab1b	4c 	L 
	ld b,h			;ab1c	44 	D 
	ld b,(hl)			;ab1d	46 	F 
	cp 006h		;ab1e	fe 06 	. . 
	rlca			;ab20	07 	. 
	dec b			;ab21	05 	. 
	ex af,af'			;ab22	08 	. 
	xor d			;ab23	aa 	. 
	ld d,(hl)			;ab24	56 	V 
	xor d			;ab25	aa 	. 
	ld d,(hl)			;ab26	56 	V 
	xor d			;ab27	aa 	. 
	ld d,(hl)			;ab28	56 	V 
	xor d			;ab29	aa 	. 
	ld d,(hl)			;ab2a	56 	V 
	jr nz,$+2		;ab2b	20 00 	  . 
	ld a,a			;ab2d	7f 	 
	ld a,l			;ab2e	7d 	} 
	ld a,l			;ab2f	7d 	} 
	ld a,l			;ab30	7d 	} 
	ld a,l			;ab31	7d 	} 
	ld a,a			;ab32	7f 	 
	nop			;ab33	00 	. 
	add hl,sp			;ab34	39 	9 
	nop			;ab35	00 	. 
	rst 38h			;ab36	ff 	. 
	ld de,0d511h		;ab37	11 11 d5 	. . . 
	pop de			;ab3a	d1 	. 
	rst 38h			;ab3b	ff 	. 
	nop			;ab3c	00 	. 
	add hl,sp			;ab3d	39 	9 
	nop			;ab3e	00 	. 
	cp 01eh		;ab3f	fe 1e 	. . 
	sbc a,0deh		;ab41	de de 	. . 
	sbc a,0feh		;ab43	de fe 	. . 
	nop			;ab45	00 	. 
	add hl,sp			;ab46	39 	9 
	nop			;ab47	00 	. 
	ld a,(hl)			;ab48	7e 	~ 
	nop			;ab49	00 	. 
	ld d,h			;ab4a	54 	T 
	nop			;ab4b	00 	. 
	ld d,h			;ab4c	54 	T 
	nop			;ab4d	00 	. 
	nop			;ab4e	00 	. 
	add hl,sp			;ab4f	39 	9 
	add a,b			;ab50	80 	. 
	ret nz			;ab51	c0 	. 
	ld b,b			;ab52	40 	@ 
	ld h,b			;ab53	60 	` 
	ld sp,00c1ah		;ab54	31 1a 0c 	1 . . 
	nop			;ab57	00 	. 
	ex af,af'			;ab58	08 	. 
	ex af,af'			;ab59	08 	. 
	jr nc,$+66		;ab5a	30 40 	0 @ 
	add a,b			;ab5c	80 	. 
	nop			;ab5d	00 	. 
	nop			;ab5e	00 	. 
	nop			;ab5f	00 	. 
	nop			;ab60	00 	. 
	ex af,af'			;ab61	08 	. 
	ret m			;ab62	f8 	. 
	ret po			;ab63	e0 	. 
	pop bc			;ab64	c1 	. 
	add a,b			;ab65	80 	. 
	add a,c			;ab66	81 	. 
	ld (bc),a			;ab67	02 	. 
	ld bc,03902h		;ab68	01 02 39 	. . 9 
	ld e,a			;ab6b	5f 	_ 
	xor a			;ab6c	af 	. 
	ld d,a			;ab6d	57 	W 
	xor e			;ab6e	ab 	. 
	ld d,l			;ab6f	55 	U 
	xor d			;ab70	aa 	. 
	ld d,l			;ab71	55 	U 
	xor d			;ab72	aa 	. 
	add hl,hl			;ab73	29 	) 
	ld bc,00102h		;ab74	01 02 01 	. . . 
	add a,b			;ab77	80 	. 
	add a,c			;ab78	81 	. 
	ret nz			;ab79	c0 	. 
	ret po			;ab7a	e0 	. 
	ret m			;ab7b	f8 	. 
	add hl,sp			;ab7c	39 	9 
	ld d,l			;ab7d	55 	U 
	xor d			;ab7e	aa 	. 
	ld d,l			;ab7f	55 	U 
	xor e			;ab80	ab 	. 
	ld d,l			;ab81	55 	U 
	xor e			;ab82	ab 	. 
	ld d,a			;ab83	57 	W 
	rra			;ab84	1f 	. 
	add hl,hl			;ab85	29 	) 
	nop			;ab86	00 	. 
	nop			;ab87	00 	. 
	nop			;ab88	00 	. 
	nop			;ab89	00 	. 
	nop			;ab8a	00 	. 
	nop			;ab8b	00 	. 
	nop			;ab8c	00 	. 
	nop			;ab8d	00 	. 
	jr nz,$-6		;ab8e	20 f8 	  . 
	pop hl			;ab90	e1 	. 
	inc a			;ab91	3c 	< 
	rst 0			;ab92	c7 	. 
	add a,(hl)			;ab93	86 	. 
	ld sp,hl			;ab94	f9 	. 
	ld (021d4h),hl		;ab95	22 d4 21 	" . ! 
	ld a,b			;ab98	78 	x 
	nop			;ab99	00 	. 
	nop			;ab9a	00 	. 
	ret po			;ab9b	e0 	. 
	nop			;ab9c	00 	. 
	nop			;ab9d	00 	. 
	nop			;ab9e	00 	. 
	nop			;ab9f	00 	. 
	ld hl,0caf5h		;aba0	21 f5 ca 	! . . 
	call po,0f41ah		;aba3	e4 1a f4 	. . . 
	ret m			;aba6	f8 	. 
	sub h			;aba7	94 	. 
	jp pe,0d021h		;aba8	ea 21 d0 	. ! . 
	ld a,0e5h		;abab	3e e5 	> . 
	ld c,d			;abad	4a 	J 
	dec (hl)			;abae	35 	5 
	ei			;abaf	fb 	. 
	sub h			;abb0	94 	. 
	ex de,hl			;abb1	eb 	. 
	ld hl,00000h		;abb2	21 00 00 	! . . 
	nop			;abb5	00 	. 
	and b			;abb6	a0 	. 
	ld d,l			;abb7	55 	U 
	jp pe,0f856h		;abb8	ea 56 f8 	. V . 
	ld hl,00000h		;abbb	21 00 00 	! . . 
	nop			;abbe	00 	. 
	nop			;abbf	00 	. 
	nop			;abc0	00 	. 
	xor b			;abc1	a8 	. 
	ld d,h			;abc2	54 	T 
	and 021h		;abc3	e6 21 	. ! 
	ld l,a			;abc5	6f 	o 
	ld l,a			;abc6	6f 	o 
	ld l,b			;abc7	68 	h 
	ld h,b			;abc8	60 	` 
	ld l,a			;abc9	6f 	o 
	ld h,h			;abca	64 	d 
	ld h,h			;abcb	64 	d 
	ld h,h			;abcc	64 	d 
	djnz $-8		;abcd	10 f6 	. . 
	or 016h		;abcf	f6 16 	. . 
	ld b,(hl)			;abd1	46 	F 
	or 006h		;abd2	f6 06 	. . 
	ld b,006h		;abd4	06 06 	. . 
	djnz $-66		;abd6	10 bc 	. . 
	nop			;abd8	00 	. 
	nop			;abd9	00 	. 
	nop			;abda	00 	. 
	nop			;abdb	00 	. 
	nop			;abdc	00 	. 
	nop			;abdd	00 	. 
	nop			;abde	00 	. 
	ld hl,0003fh		;abdf	21 3f 00 	! ? . 
	nop			;abe2	00 	. 
	nop			;abe3	00 	. 
	nop			;abe4	00 	. 
	nop			;abe5	00 	. 
	nop			;abe6	00 	. 
	nop			;abe7	00 	. 
	ld hl,00bffh		;abe8	21 ff 0b 	! . . 
	inc e			;abeb	1c 	. 
	inc bc			;abec	03 	. 
	dec b			;abed	05 	. 
	ccf			;abee	3f 	? 
	ld bc,02103h		;abef	01 03 21 	. . ! 
	nop			;abf2	00 	. 
	nop			;abf3	00 	. 
	nop			;abf4	00 	. 
	nop			;abf5	00 	. 
	nop			;abf6	00 	. 
	nop			;abf7	00 	. 
	ld c,003h		;abf8	0e 03 	. . 
	ld hl,00300h		;abfa	21 00 03 	! . . 
	nop			;abfd	00 	. 
	nop			;abfe	00 	. 
	rrca			;abff	0f 	. 
	dec de			;ac00	1b 	. 
	rlca			;ac01	07 	. 
	rst 8			;ac02	cf 	. 
	ld hl,06f6fh		;ac03	21 6f 6f 	! o o 
	ld l,b			;ac06	68 	h 
	ld h,d			;ac07	62 	b 
	ld l,d			;ac08	6a 	j 
	ld h,d			;ac09	62 	b 
	ld l,(hl)			;ac0a	6e 	n 
	ld h,b			;ac0b	60 	` 
	jr nz,$-8		;ac0c	20 f6 	  . 
	or 016h		;ac0e	f6 16 	. . 
	and (hl)			;ac10	a6 	. 
	or (hl)			;ac11	b6 	. 
	add a,(hl)			;ac12	86 	. 
	or 006h		;ac13	f6 06 	. . 
	jr nz,$-126		;ac15	20 80 	  . 
	ld b,b			;ac17	40 	@ 
	jr nz,$+33		;ac18	20 1f 	  . 
	djnz $+18		;ac1a	10 10 	. . 
	djnz $+18		;ac1c	10 10 	. . 
	jr c,$+2		;ac1e	38 00 	8 . 
	nop			;ac20	00 	. 
	nop			;ac21	00 	. 
	rst 38h			;ac22	ff 	. 
	nop			;ac23	00 	. 
	nop			;ac24	00 	. 
	nop			;ac25	00 	. 
	nop			;ac26	00 	. 
	jr c,$+3		;ac27	38 01 	8 . 
	ld (bc),a			;ac29	02 	. 
	inc b			;ac2a	04 	. 
	ret m			;ac2b	f8 	. 
	ex af,af'			;ac2c	08 	. 
	ex af,af'			;ac2d	08 	. 
	ex af,af'			;ac2e	08 	. 
	ex af,af'			;ac2f	08 	. 
	jr c,$+18		;ac30	38 10 	8 . 
	djnz $+18		;ac32	10 10 	. . 
	djnz $+18		;ac34	10 10 	. . 
	djnz $+18		;ac36	10 10 	. . 
	djnz $+58		;ac38	10 38 	. 8 
	nop			;ac3a	00 	. 
	rrca			;ac3b	0f 	. 
	ex af,af'			;ac3c	08 	. 
	ld a,(bc)			;ac3d	0a 	. 
	ex af,af'			;ac3e	08 	. 
	ex af,af'			;ac3f	08 	. 
	add hl,bc			;ac40	09 	. 
	ex af,af'			;ac41	08 	. 
	add hl,sp			;ac42	39 	9 
	nop			;ac43	00 	. 
	rst 38h			;ac44	ff 	. 
	nop			;ac45	00 	. 
	jr nz,$+67		;ac46	20 41 	  A 
	and d			;ac48	a2 	. 
	ld b,c			;ac49	41 	A 
	and b			;ac4a	a0 	. 
	add hl,sp			;ac4b	39 	9 
	nop			;ac4c	00 	. 
	ret p			;ac4d	f0 	. 
	djnz $-110		;ac4e	10 90 	. . 
	ld d,b			;ac50	50 	P 
	sub b			;ac51	90 	. 
	djnz $-110		;ac52	10 90 	. . 
	add hl,sp			;ac54	39 	9 
	ex af,af'			;ac55	08 	. 
	ex af,af'			;ac56	08 	. 
	ex af,af'			;ac57	08 	. 
	ex af,af'			;ac58	08 	. 
	ex af,af'			;ac59	08 	. 
	ex af,af'			;ac5a	08 	. 
	ex af,af'			;ac5b	08 	. 
	ex af,af'			;ac5c	08 	. 
	jr c,$+11		;ac5d	38 09 	8 . 
	ld a,(bc)			;ac5f	0a 	. 
	add hl,bc			;ac60	09 	. 
	ld a,(bc)			;ac61	0a 	. 
	add hl,bc			;ac62	09 	. 
	ex af,af'			;ac63	08 	. 
	rrca			;ac64	0f 	. 
	nop			;ac65	00 	. 
	add hl,sp			;ac66	39 	9 
	ld b,c			;ac67	41 	A 
	add a,d			;ac68	82 	. 
	ld b,l			;ac69	45 	E 
	ld (bc),a			;ac6a	02 	. 
	inc d			;ac6b	14 	. 
	nop			;ac6c	00 	. 
	rst 38h			;ac6d	ff 	. 
	nop			;ac6e	00 	. 
	add hl,sp			;ac6f	39 	9 
	djnz $+18		;ac70	10 10 	. . 
	ld d,b			;ac72	50 	P 
	sub b			;ac73	90 	. 
	ld d,b			;ac74	50 	P 
	djnz $-14		;ac75	10 f0 	. . 
	nop			;ac77	00 	. 
	add hl,sp			;ac78	39 	9 
	nop			;ac79	00 	. 
	nop			;ac7a	00 	. 
	nop			;ac7b	00 	. 
	nop			;ac7c	00 	. 
	nop			;ac7d	00 	. 
	nop			;ac7e	00 	. 
	nop			;ac7f	00 	. 
	nop			;ac80	00 	. 
	add hl,sp			;ac81	39 	9 
	nop			;ac82	00 	. 
	ld b,03eh		;ac83	06 3e 	. > 
	ld b,006h		;ac85	06 06 	. . 
	ld b,006h		;ac87	06 06 	. . 
	nop			;ac89	00 	. 
	add hl,sp			;ac8a	39 	9 
	rst 30h			;ac8b	f7 	. 
	add a,a			;ac8c	87 	. 
	and a			;ac8d	a7 	. 
	and a			;ac8e	a7 	. 
	or a			;ac8f	b7 	. 
	add a,a			;ac90	87 	. 
	rst 30h			;ac91	f7 	. 
	rlca			;ac92	07 	. 
	jr nz,$+1		;ac93	20 ff 	  . 
	rst 38h			;ac95	ff 	. 
	ret nz			;ac96	c0 	. 
	and d			;ac97	a2 	. 
	ld a,(07e02h)		;ac98	3a 02 7e 	: . ~ 
	nop			;ac9b	00 	. 
	jr nz,$+1		;ac9c	20 ff 	  . 
	rst 38h			;ac9e	ff 	. 
	nop			;ac9f	00 	. 
	and d			;aca0	a2 	. 
	cp d			;aca1	ba 	. 
	add a,d			;aca2	82 	. 
	cp 000h		;aca3	fe 00 	. . 
	jr nz,$+1		;aca5	20 ff 	  . 
	rst 38h			;aca7	ff 	. 
	inc bc			;aca8	03 	. 
	and c			;aca9	a1 	. 
	cp c			;acaa	b9 	. 
	add a,d			;acab	82 	. 
	cp 000h		;acac	fe 00 	. . 
	jr nz,$-16		;acae	20 ee 	  . 
	jp po,0e2e2h		;acb0	e2 e2 e2 	. . . 
	jp pe,0eee2h		;acb3	ea e2 ee 	. . . 
	ret po			;acb6	e0 	. 
	jr nz,$+58		;acb7	20 38 	  8 
	jr c,$+58		;acb9	38 38 	8 8 
	jr c,$+58		;acbb	38 38 	8 8 
	ld hl,(0382ah)		;acbd	2a 2a 38 	* * 8 
	ld de,0e3e3h		;acc0	11 e3 e3 	. . . 
	ex (sp),hl			;acc3	e3 	. 
	ex (sp),hl			;acc4	e3 	. 
	ex (sp),hl			;acc5	e3 	. 
	xor e			;acc6	ab 	. 
	xor e			;acc7	ab 	. 
	ex (sp),hl			;acc8	e3 	. 
	add hl,de			;acc9	19 	. 
	rst 0			;acca	c7 	. 
	rst 0			;accb	c7 	. 
	rst 0			;accc	c7 	. 
	rst 0			;accd	c7 	. 
	rst 0			;acce	c7 	. 
	push de			;accf	d5 	. 
	push de			;acd0	d5 	. 
	rst 0			;acd1	c7 	. 
	ld sp,01818h		;acd2	31 18 18 	1 . . 
	jr $+26		;acd5	18 18 	. . 
	jr $+92		;acd7	18 5a 	. Z 
	ld e,d			;acd9	5a 	Z 
	jr $+26		;acda	18 18 	. . 
	di			;acdc	f3 	. 
	di			;acdd	f3 	. 
	di			;acde	f3 	. 
	di			;acdf	f3 	. 
	di			;ace0	f3 	. 
	sub e			;ace1	93 	. 
	sub e			;ace2	93 	. 
	di			;ace3	f3 	. 
	djnz $-47		;ace4	10 cf 	. . 
	rst 8			;ace6	cf 	. 
	rst 8			;ace7	cf 	. 
	rst 8			;ace8	cf 	. 
	rst 8			;ace9	cf 	. 
	ret			;acea	c9 	. 
	ret			;aceb	c9 	. 
	rst 8			;acec	cf 	. 
	jr z,$+2		;aced	28 00 	( . 
	rst 38h			;acef	ff 	. 
	or l			;acf0	b5 	. 
	xor d			;acf1	aa 	. 
	or l			;acf2	b5 	. 
	xor d			;acf3	aa 	. 
	or l			;acf4	b5 	. 
	nop			;acf5	00 	. 
	jr z,$+2		;acf6	28 00 	( . 
	ld sp,hl			;acf8	f9 	. 
	ld b,c			;acf9	41 	A 
	and c			;acfa	a1 	. 
	ld b,c			;acfb	41 	A 
	and c			;acfc	a1 	. 
	ld b,c			;acfd	41 	A 
	nop			;acfe	00 	. 
	jr c,$+1		;acff	38 ff 	8 . 
	xor d			;ad01	aa 	. 
	or l			;ad02	b5 	. 
	xor d			;ad03	aa 	. 
	or l			;ad04	b5 	. 
	xor d			;ad05	aa 	. 
	nop			;ad06	00 	. 
	rst 38h			;ad07	ff 	. 
	jr z,$-5		;ad08	28 f9 	( . 
	and c			;ad0a	a1 	. 
	ld b,c			;ad0b	41 	A 
	and c			;ad0c	a1 	. 
	ld b,c			;ad0d	41 	A 
	and c			;ad0e	a1 	. 
	nop			;ad0f	00 	. 
	ld sp,hl			;ad10	f9 	. 
	jr c,$-73		;ad11	38 b5 	8 . 
	xor d			;ad13	aa 	. 
	or l			;ad14	b5 	. 
	xor d			;ad15	aa 	. 
	or l			;ad16	b5 	. 
	nop			;ad17	00 	. 
	rst 38h			;ad18	ff 	. 
	xor d			;ad19	aa 	. 
	jr z,$+67		;ad1a	28 41 	( A 
	and c			;ad1c	a1 	. 
	ld b,c			;ad1d	41 	A 
	and c			;ad1e	a1 	. 
	ld b,c			;ad1f	41 	A 
	nop			;ad20	00 	. 
	ld sp,hl			;ad21	f9 	. 
	and c			;ad22	a1 	. 
	jr c,$-27		;ad23	38 e3 	8 . 
	rst 30h			;ad25	f7 	. 
	ex (sp),hl			;ad26	e3 	. 
	ret			;ad27	c9 	. 
	pop de			;ad28	d1 	. 
	xor b			;ad29	a8 	. 
	sub b			;ad2a	90 	. 
	cp (hl)			;ad2b	be 	. 
	add hl,sp			;ad2c	39 	9 
	sub b			;ad2d	90 	. 
	or (hl)			;ad2e	b6 	. 
	sub b			;ad2f	90 	. 
	cp (hl)			;ad30	be 	. 
	sub b			;ad31	90 	. 
	and b			;ad32	a0 	. 
	sub b			;ad33	90 	. 
	and b			;ad34	a0 	. 
	add hl,sp			;ad35	39 	9 
	sub b			;ad36	90 	. 
	and b			;ad37	a0 	. 
	sub b			;ad38	90 	. 
	and b			;ad39	a0 	. 
	sub b			;ad3a	90 	. 
	and b			;ad3b	a0 	. 
	sub b			;ad3c	90 	. 
	add a,b			;ad3d	80 	. 
	add hl,sp			;ad3e	39 	9 
	nop			;ad3f	00 	. 
	nop			;ad40	00 	. 
	inc b			;ad41	04 	. 
	ld (bc),a			;ad42	02 	. 
	nop			;ad43	00 	. 
	nop			;ad44	00 	. 
	nop			;ad45	00 	. 
	ld b,00eh		;ad46	06 0e 	. . 
	nop			;ad48	00 	. 
	nop			;ad49	00 	. 
	ld (bc),a			;ad4a	02 	. 
	inc c			;ad4b	0c 	. 
	nop			;ad4c	00 	. 
	inc b			;ad4d	04 	. 
	ld (bc),a			;ad4e	02 	. 
	nop			;ad4f	00 	. 
	dec c			;ad50	0d 	. 
	nop			;ad51	00 	. 
	nop			;ad52	00 	. 
	ld a,(bc)			;ad53	0a 	. 
	djnz $+2		;ad54	10 00 	. . 
	ld a,(bc)			;ad56	0a 	. 
	inc b			;ad57	04 	. 
	nop			;ad58	00 	. 
	rrca			;ad59	0f 	. 
	nop			;ad5a	00 	. 
	nop			;ad5b	00 	. 
	nop			;ad5c	00 	. 
	nop			;ad5d	00 	. 
	nop			;ad5e	00 	. 
	nop			;ad5f	00 	. 
	nop			;ad60	00 	. 
	nop			;ad61	00 	. 
	ex af,af'			;ad62	08 	. 
	nop			;ad63	00 	. 
	nop			;ad64	00 	. 
	ld b,b			;ad65	40 	@ 
	jr nc,$+2		;ad66	30 00 	0 . 
	nop			;ad68	00 	. 
	ld b,b			;ad69	40 	@ 
	nop			;ad6a	00 	. 
	ld c,000h		;ad6b	0e 00 	. . 
	jr nc,$+66		;ad6d	30 40 	0 @ 
	jr nz,$+2		;ad6f	20 00 	  . 
	ld b,b			;ad71	40 	@ 
	jr nc,$+2		;ad72	30 00 	0 . 
	dec c			;ad74	0d 	. 
	nop			;ad75	00 	. 
	nop			;ad76	00 	. 
	jr z,$+82		;ad77	28 50 	( P 
	nop			;ad79	00 	. 
	nop			;ad7a	00 	. 
	ld h,b			;ad7b	60 	` 
	jr $+17		;ad7c	18 0f 	. . 
	rst 38h			;ad7e	ff 	. 
	add a,b			;ad7f	80 	. 
	add a,b			;ad80	80 	. 
	add a,b			;ad81	80 	. 
	sbc a,a			;ad82	9f 	. 
	sub b			;ad83	90 	. 
	sub b			;ad84	90 	. 
	sub b			;ad85	90 	. 
	jr z,$+1		;ad86	28 ff 	( . 
	nop			;ad88	00 	. 
	nop			;ad89	00 	. 
	nop			;ad8a	00 	. 
	rst 38h			;ad8b	ff 	. 
	nop			;ad8c	00 	. 
	nop			;ad8d	00 	. 
	nop			;ad8e	00 	. 
	jr z,$+1		;ad8f	28 ff 	( . 
	nop			;ad91	00 	. 
	nop			;ad92	00 	. 
	nop			;ad93	00 	. 
	rst 38h			;ad94	ff 	. 
	ex af,af'			;ad95	08 	. 
	ex af,af'			;ad96	08 	. 
	ex af,af'			;ad97	08 	. 
	jr z,$+1		;ad98	28 ff 	( . 
	ld bc,00101h		;ad9a	01 01 01 	. . . 
	ld sp,hl			;ad9d	f9 	. 
	add hl,bc			;ad9e	09 	. 
	add hl,bc			;ad9f	09 	. 
	add hl,bc			;ada0	09 	. 
	jr z,$-110		;ada1	28 90 	( . 
	sub b			;ada3	90 	. 
	sub b			;ada4	90 	. 
	sub b			;ada5	90 	. 
	sub b			;ada6	90 	. 
	sub b			;ada7	90 	. 
	sub b			;ada8	90 	. 
	sub b			;ada9	90 	. 
	jr z,$+10		;adaa	28 08 	( . 
	ex af,af'			;adac	08 	. 
	ex af,af'			;adad	08 	. 
	ex af,af'			;adae	08 	. 
	ex af,af'			;adaf	08 	. 
	ex af,af'			;adb0	08 	. 
	ex af,af'			;adb1	08 	. 
	ex af,af'			;adb2	08 	. 
	jr z,$+2		;adb3	28 00 	( . 
	nop			;adb5	00 	. 
	nop			;adb6	00 	. 
	nop			;adb7	00 	. 
	nop			;adb8	00 	. 
	nop			;adb9	00 	. 
	nop			;adba	00 	. 
	nop			;adbb	00 	. 
	jr z,$+11		;adbc	28 09 	( . 
	add hl,bc			;adbe	09 	. 
	add hl,bc			;adbf	09 	. 
	add hl,bc			;adc0	09 	. 
	add hl,bc			;adc1	09 	. 
	add hl,bc			;adc2	09 	. 
	add hl,bc			;adc3	09 	. 
	add hl,bc			;adc4	09 	. 
	jr z,$+2		;adc5	28 00 	( . 
	nop			;adc7	00 	. 
	nop			;adc8	00 	. 
	nop			;adc9	00 	. 
	ld bc,00000h		;adca	01 00 00 	. . . 
	nop			;adcd	00 	. 
	jr z,$+10		;adce	28 08 	( . 
	ex af,af'			;add0	08 	. 
	ex af,af'			;add1	08 	. 
	ld l,e			;add2	6b 	k 
	xor d			;add3	aa 	. 
	ld l,e			;add4	6b 	k 
	ld l,e			;add5	6b 	k 
	ex af,af'			;add6	08 	. 
	jr z,$+2		;add7	28 00 	( . 
	nop			;add9	00 	. 
	nop			;adda	00 	. 
	nop			;addb	00 	. 
	ret nz			;addc	c0 	. 
	nop			;addd	00 	. 
	nop			;adde	00 	. 
	nop			;addf	00 	. 
	jr z,$-95		;ade0	28 9f 	( . 
	add a,b			;ade2	80 	. 
	add a,b			;ade3	80 	. 
	add a,b			;ade4	80 	. 
	add a,b			;ade5	80 	. 
	add a,b			;ade6	80 	. 
	add a,b			;ade7	80 	. 
	add a,b			;ade8	80 	. 
	jr z,$+1		;ade9	28 ff 	( . 
	nop			;adeb	00 	. 
	nop			;adec	00 	. 
	nop			;aded	00 	. 
	nop			;adee	00 	. 
	nop			;adef	00 	. 
	nop			;adf0	00 	. 
	nop			;adf1	00 	. 
	jr z,$-5		;adf2	28 f9 	( . 
	ld bc,00101h		;adf4	01 01 01 	. . . 
	ld bc,00101h		;adf7	01 01 01 	. . . 
	ld bc,00028h		;adfa	01 28 00 	. ( . 
	nop			;adfd	00 	. 
	nop			;adfe	00 	. 
	nop			;adff	00 	. 
	nop			;ae00	00 	. 
	nop			;ae01	00 	. 
	nop			;ae02	00 	. 
	nop			;ae03	00 	. 
	jp p,055aah		;ae04	f2 aa 55 	. . U 
	ccf			;ae07	3f 	? 
	ccf			;ae08	3f 	? 
	dec sp			;ae09	3b 	; 
	scf			;ae0a	37 	7 
	ld a,03dh		;ae0b	3e 3d 	> = 
	add hl,sp			;ae0d	39 	9 
	xor d			;ae0e	aa 	. 
	ld d,l			;ae0f	55 	U 
	rst 38h			;ae10	ff 	. 
	rst 38h			;ae11	ff 	. 
	cp a			;ae12	bf 	. 
	ld a,a			;ae13	7f 	 
	rst 38h			;ae14	ff 	. 
	rst 38h			;ae15	ff 	. 
	add hl,sp			;ae16	39 	9 
	xor d			;ae17	aa 	. 
	ld d,l			;ae18	55 	U 
	cp 0fdh		;ae19	fe fd 	. . 
	cp 0fdh		;ae1b	fe fd 	. . 
	cp 0fdh		;ae1d	fe fd 	. . 
	add hl,sp			;ae1f	39 	9 
	dec sp			;ae20	3b 	; 
	ccf			;ae21	3f 	? 
	ccf			;ae22	3f 	? 
	ccf			;ae23	3f 	? 
	ccf			;ae24	3f 	? 
	ccf			;ae25	3f 	? 
	ld b,b			;ae26	40 	@ 
	add a,b			;ae27	80 	. 
	add hl,sp			;ae28	39 	9 
	rst 38h			;ae29	ff 	. 
	rst 38h			;ae2a	ff 	. 
	rst 38h			;ae2b	ff 	. 
	rst 38h			;ae2c	ff 	. 
	rst 38h			;ae2d	ff 	. 
	rst 38h			;ae2e	ff 	. 
	nop			;ae2f	00 	. 
	nop			;ae30	00 	. 
	add hl,sp			;ae31	39 	9 
	cp 0fdh		;ae32	fe fd 	. . 
	cp 0fdh		;ae34	fe fd 	. . 
	cp 0fdh		;ae36	fe fd 	. . 
	ld (bc),a			;ae38	02 	. 
	ld bc,02039h		;ae39	01 39 20 	. 9   
	ld b,b			;ae3c	40 	@ 
	ld b,b			;ae3d	40 	@ 
	ld b,b			;ae3e	40 	@ 
	ld b,b			;ae3f	40 	@ 
	ld b,b			;ae40	40 	@ 
	jr nz,$-30		;ae41	20 e0 	  . 
	inc d			;ae43	14 	. 
	dec b			;ae44	05 	. 
	inc bc			;ae45	03 	. 
	inc bc			;ae46	03 	. 
	inc bc			;ae47	03 	. 
	inc bc			;ae48	03 	. 
	inc bc			;ae49	03 	. 
	dec b			;ae4a	05 	. 
	rlca			;ae4b	07 	. 
	inc d			;ae4c	14 	. 
	rst 38h			;ae4d	ff 	. 
	add a,b			;ae4e	80 	. 
	add a,b			;ae4f	80 	. 
	rst 38h			;ae50	ff 	. 
	add a,b			;ae51	80 	. 
	add a,b			;ae52	80 	. 
	add a,b			;ae53	80 	. 
	add a,b			;ae54	80 	. 
	jr z,$+1		;ae55	28 ff 	( . 
	nop			;ae57	00 	. 
	nop			;ae58	00 	. 
	rst 38h			;ae59	ff 	. 
	ld (bc),a			;ae5a	02 	. 
	ld (bc),a			;ae5b	02 	. 
	ld (bc),a			;ae5c	02 	. 
	inc bc			;ae5d	03 	. 
	jr z,$+1		;ae5e	28 ff 	( . 
	nop			;ae60	00 	. 
	nop			;ae61	00 	. 
	rst 38h			;ae62	ff 	. 
	nop			;ae63	00 	. 
	nop			;ae64	00 	. 
	nop			;ae65	00 	. 
	rst 38h			;ae66	ff 	. 
	jr z,$+1		;ae67	28 ff 	( . 
	nop			;ae69	00 	. 
	nop			;ae6a	00 	. 
	rst 38h			;ae6b	ff 	. 
	ld b,b			;ae6c	40 	@ 
	ld b,b			;ae6d	40 	@ 
	ld b,b			;ae6e	40 	@ 
	ret nz			;ae6f	c0 	. 
	jr z,$+1		;ae70	28 ff 	( . 
	ld bc,0ff01h		;ae72	01 01 ff 	. . . 
	ld bc,00101h		;ae75	01 01 01 	. . . 
	ld bc,08028h		;ae78	01 28 80 	. ( . 
	add a,b			;ae7b	80 	. 
	add a,b			;ae7c	80 	. 
	add a,b			;ae7d	80 	. 
	add a,b			;ae7e	80 	. 
	add a,b			;ae7f	80 	. 
	add a,b			;ae80	80 	. 
	rst 38h			;ae81	ff 	. 
	jr z,$+4		;ae82	28 02 	( . 
	ld (bc),a			;ae84	02 	. 
	ld (bc),a			;ae85	02 	. 
	ld (bc),a			;ae86	02 	. 
	ld (bc),a			;ae87	02 	. 
	ld (bc),a			;ae88	02 	. 
	ld (bc),a			;ae89	02 	. 
	cp 028h		;ae8a	fe 28 	. ( 
	ret p			;ae8c	f0 	. 
	ld d,b			;ae8d	50 	P 
	ld h,b			;ae8e	60 	` 
	ld a,a			;ae8f	7f 	 
	ld b,b			;ae90	40 	@ 
	add a,b			;ae91	80 	. 
	add a,b			;ae92	80 	. 
	ret nz			;ae93	c0 	. 
	inc d			;ae94	14 	. 
	rrca			;ae95	0f 	. 
	dec c			;ae96	0d 	. 
	dec b			;ae97	05 	. 
	defb 0fdh,003h,001h	;illegal sequence		;ae98	fd 03 01 	. . . 
	ld bc,01403h		;ae9b	01 03 14 	. . . 
	ld b,b			;ae9e	40 	@ 
	ld b,b			;ae9f	40 	@ 
	ld b,b			;aea0	40 	@ 
	ld b,b			;aea1	40 	@ 
	ld b,b			;aea2	40 	@ 
	ld b,b			;aea3	40 	@ 
	ld b,b			;aea4	40 	@ 
	ld a,a			;aea5	7f 	 
	jr z,$+3		;aea6	28 01 	( . 
	ld bc,00101h		;aea8	01 01 01 	. . . 
	ld bc,00101h		;aeab	01 01 01 	. . . 
	rst 38h			;aeae	ff 	. 
	jr z,$-59		;aeaf	28 c3 	( . 
	add a,c			;aeb1	81 	. 
	and c			;aeb2	a1 	. 
	and c			;aeb3	a1 	. 
	cp c			;aeb4	b9 	. 
	add a,c			;aeb5	81 	. 
	defb 0fdh,001h,020h	;illegal sequence		;aeb6	fd 01 20 	. .   
	jp nz,0a282h		;aeb9	c2 82 a2 	. . . 
	and d			;aebc	a2 	. 
	cp d			;aebd	ba 	. 
	add a,d			;aebe	82 	. 
	cp (hl)			;aebf	be 	. 
	add a,b			;aec0	80 	. 
	jr nz,$+114		;aec1	20 70 	  p 
	ld (hl),d			;aec3	72 	r 
	ld (hl),d			;aec4	72 	r 
	ld (hl),d			;aec5	72 	r 
	ld (hl),d			;aec6	72 	r 
	ld (hl),d			;aec7	72 	r 
	halt			;aec8	76 	v 
	ld (hl),b			;aec9	70 	p 
	jr nz,$-1		;aeca	20 fd 	  . 
	add a,c			;aecc	81 	. 
	and c			;aecd	a1 	. 
	and c			;aece	a1 	. 
	cp c			;aecf	b9 	. 
	add a,c			;aed0	81 	. 
	ex (sp),hl			;aed1	e3 	. 
	rra			;aed2	1f 	. 
	jr nz,$-64		;aed3	20 be 	  . 
	add a,d			;aed5	82 	. 
	and d			;aed6	a2 	. 
	and d			;aed7	a2 	. 
	cp d			;aed8	ba 	. 
	add a,d			;aed9	82 	. 
	add a,0f8h		;aeda	c6 f8 	. . 
	jr nz,$+16		;aedc	20 0e 	  . 
	adc a,(hl)			;aede	8e 	. 
	xor (hl)			;aedf	ae 	. 
	xor (hl)			;aee0	ae 	. 
	xor (hl)			;aee1	ae 	. 
	adc a,(hl)			;aee2	8e 	. 
	xor 00eh		;aee3	ee 0e 	. . 
	jr nz,$-25		;aee5	20 e5 	  . 
	push hl			;aee7	e5 	. 
	push hl			;aee8	e5 	. 
	push hl			;aee9	e5 	. 
	push hl			;aeea	e5 	. 
	push hl			;aeeb	e5 	. 
	push hl			;aeec	e5 	. 
	push hl			;aeed	e5 	. 
	djnz $+3		;aeee	10 01 	. . 
	ld bc,00101h		;aef0	01 01 01 	. . . 
	ld bc,00101h		;aef3	01 01 01 	. . . 
	ld bc,00308h		;aef6	01 08 03 	. . . 
	inc bc			;aef9	03 	. 
	inc bc			;aefa	03 	. 
	inc bc			;aefb	03 	. 
	rlca			;aefc	07 	. 
	rlca			;aefd	07 	. 
	rrca			;aefe	0f 	. 
	rra			;aeff	1f 	. 
	ex af,af'			;af00	08 	. 
	ret nz			;af01	c0 	. 
	cp a			;af02	bf 	. 
	rst 18h			;af03	df 	. 
	xor a			;af04	af 	. 
	rst 10h			;af05	d7 	. 
	xor e			;af06	ab 	. 
	call nc,008ach		;af07	d4 ac 08 	. . . 
	nop			;af0a	00 	. 
	rst 38h			;af0b	ff 	. 
	rst 38h			;af0c	ff 	. 
	rst 38h			;af0d	ff 	. 
	rst 38h			;af0e	ff 	. 
	rst 38h			;af0f	ff 	. 
	nop			;af10	00 	. 
	nop			;af11	00 	. 
	ex af,af'			;af12	08 	. 
	ld bc,0fafch		;af13	01 fc fa 	. . . 
	or 0eeh		;af16	f6 ee 	. . 
	sbc a,03eh		;af18	de 3e 	. > 
	ld a,008h		;af1a	3e 08 	> . 
	call nc,0d4ach		;af1c	d4 ac d4 	. . . 
	xor h			;af1f	ac 	. 
	call nc,0d4ach		;af20	d4 ac d4 	. . . 
	xor h			;af23	ac 	. 
	ex af,af'			;af24	08 	. 
	ld a,03eh		;af25	3e 3e 	> > 
	ld a,03eh		;af27	3e 3e 	> > 
	ld a,03eh		;af29	3e 3e 	> > 
	ld a,03eh		;af2b	3e 3e 	> > 
	ex af,af'			;af2d	08 	. 
	call nc,0d7ach		;af2e	d4 ac d7 	. . . 
	xor (hl)			;af31	ae 	. 
	defb 0ddh,0bah,0f5h	;illegal sequence		;af32	dd ba f5 	. . . 
	rst 38h			;af35	ff 	. 
	ex af,af'			;af36	08 	. 
	nop			;af37	00 	. 
	nop			;af38	00 	. 
	rst 38h			;af39	ff 	. 
	xor d			;af3a	aa 	. 
	ld d,l			;af3b	55 	U 
	xor d			;af3c	aa 	. 
	ld d,l			;af3d	55 	U 
	rst 38h			;af3e	ff 	. 
	ex af,af'			;af3f	08 	. 
	ld a,03eh		;af40	3e 3e 	> > 
	sbc a,0aeh		;af42	de ae 	. . 
	ld d,(hl)			;af44	56 	V 
	xor d			;af45	aa 	. 
	ld d,l			;af46	55 	U 
	rst 38h			;af47	ff 	. 
	ex af,af'			;af48	08 	. 
	rst 18h			;af49	df 	. 
	cp a			;af4a	bf 	. 
	ld h,b			;af4b	60 	` 
	call z,0d0d0h		;af4c	cc d0 d0 	. . . 
	ret nz			;af4f	c0 	. 
	pop bc			;af50	c1 	. 
	jr z,$+1		;af51	28 ff 	( . 
	rst 38h			;af53	ff 	. 
	nop			;af54	00 	. 
	ld h,(hl)			;af55	66 	f 
	ld b,h			;af56	44 	D 
	nop			;af57	00 	. 
	rst 38h			;af58	ff 	. 
	nop			;af59	00 	. 
	jr z,$-4		;af5a	28 fa 	( . 
	call m,00d02h		;af5c	fc 02 0d 	. . . 
	ld de,00111h		;af5f	11 11 01 	. . . 
	add a,c			;af62	81 	. 
	jr z,$-36		;af63	28 da 	( . 
	jp nc,0c2d2h		;af65	d2 d2 c2 	. . . 
	jp c,0d2d2h		;af68	da d2 d2 	. . . 
	jp nz,0cd28h		;af6b	c2 28 cd 	. ( . 
	ret			;af6e	c9 	. 
	ret			;af6f	c9 	. 
	pop bc			;af70	c1 	. 
	call 0c9c9h		;af71	cd c9 c9 	. . . 
	pop bc			;af74	c1 	. 
	jr z,$-61		;af75	28 c1 	( . 
	call z,0d0d0h		;af77	cc d0 d0 	. . . 
	ret nz			;af7a	c0 	. 
	ld h,b			;af7b	60 	` 
	cp a			;af7c	bf 	. 
	nop			;af7d	00 	. 
	jr z,$+1		;af7e	28 ff 	( . 
	rst 38h			;af80	ff 	. 
	nop			;af81	00 	. 
	ld h,(hl)			;af82	66 	f 
	ld b,h			;af83	44 	D 
	nop			;af84	00 	. 
	rst 38h			;af85	ff 	. 
	add a,b			;af86	80 	. 
	jr z,$-125		;af87	28 81 	( . 
	dec c			;af89	0d 	. 
	ld de,00211h		;af8a	11 11 02 	. . . 
	inc b			;af8d	04 	. 
	jp m,02800h		;af8e	fa 00 28 	. . ( 
	rst 38h			;af91	ff 	. 
	rst 18h			;af92	df 	. 
	rst 30h			;af93	f7 	. 
	cp 0ffh		;af94	fe ff 	. . 
	rst 38h			;af96	ff 	. 
	rst 38h			;af97	ff 	. 
	rst 38h			;af98	ff 	. 
	jr c,$+1		;af99	38 ff 	8 . 
	xor d			;af9b	aa 	. 
	rst 38h			;af9c	ff 	. 
	ld a,a			;af9d	7f 	 
	rst 38h			;af9e	ff 	. 
	rst 38h			;af9f	ff 	. 
	rst 38h			;afa0	ff 	. 
	rst 38h			;afa1	ff 	. 
	jr z,$+1		;afa2	28 ff 	( . 
	rst 28h			;afa4	ef 	. 
	xor (hl)			;afa5	ae 	. 
	xor d			;afa6	aa 	. 
	rst 38h			;afa7	ff 	. 
	rst 38h			;afa8	ff 	. 
	rst 38h			;afa9	ff 	. 
	rst 38h			;afaa	ff 	. 
	djnz $+1		;afab	10 ff 	. . 
	cp l			;afad	bd 	. 
	rst 38h			;afae	ff 	. 
	defb 0fdh,0ffh,0ffh	;illegal sequence		;afaf	fd ff ff 	. . . 
	rst 38h			;afb2	ff 	. 
	rst 38h			;afb3	ff 	. 
	jr nc,$+1		;afb4	30 ff 	0 . 
	ret po			;afb6	e0 	. 
	rst 18h			;afb7	df 	. 
	rst 18h			;afb8	df 	. 
	rst 18h			;afb9	df 	. 
	rst 18h			;afba	df 	. 
	ret c			;afbb	d8 	. 
	ret c			;afbc	d8 	. 
	ex af,af'			;afbd	08 	. 
	rst 38h			;afbe	ff 	. 
	rrca			;afbf	0f 	. 
	rst 38h			;afc0	ff 	. 
	rst 38h			;afc1	ff 	. 
	rst 38h			;afc2	ff 	. 
	rst 38h			;afc3	ff 	. 
	nop			;afc4	00 	. 
	xor d			;afc5	aa 	. 
	ex af,af'			;afc6	08 	. 
	cp 0fdh		;afc7	fe fd 	. . 
	jp m,0faefh		;afc9	fa ef fa 	. . . 
	push af			;afcc	f5 	. 
	cp 0fdh		;afcd	fe fd 	. . 
	jr nz,$+34		;afcf	20 20 	    
	ld b,b			;afd1	40 	@ 
	jr nz,$+2		;afd2	20 00 	  . 
	add a,d			;afd4	82 	. 
	dec b			;afd5	05 	. 
	xor d			;afd6	aa 	. 
	ld d,c			;afd7	51 	Q 
	jr nz,$-31		;afd8	20 df 	  . 
	in a,(0dfh)		;afda	db df 	. . 
	in a,(0dfh)		;afdc	db df 	. . 
	jp c,0d8d8h		;afde	da d8 d8 	. . . 
	ex af,af'			;afe1	08 	. 
	ld d,h			;afe2	54 	T 
	xor d			;afe3	aa 	. 
	call nc,0d4aah		;afe4	d4 aa d4 	. . . 
	xor d			;afe7	aa 	. 
	inc b			;afe8	04 	. 
	ld (bc),a			;afe9	02 	. 
	ex af,af'			;afea	08 	. 
	rst 18h			;afeb	df 	. 
	rst 38h			;afec	ff 	. 
	rst 18h			;afed	df 	. 
	rst 38h			;afee	ff 	. 
	rst 18h			;afef	df 	. 
	ex de,hl			;aff0	eb 	. 
	push de			;aff1	d5 	. 
	jp pe,0c308h		;aff2	ea 08 c3 	. . . 
	ret p			;aff5	f0 	. 
	ret m			;aff6	f8 	. 
	ret m			;aff7	f8 	. 
	ret m			;aff8	f8 	. 
	ret m			;aff9	f8 	. 
	ret m			;affa	f8 	. 
	ret m			;affb	f8 	. 
	djnz $+33		;affc	10 1f 	. . 
	ld e,a			;affe	5f 	_ 
	sbc a,a			;afff	9f 	. 
	ld b,b			;b000	40 	@ 
	call m,0f053h		;b001	fc 53 f0 	. S . 
	inc bc			;b004	03 	. 
	jr nz,$+1		;b005	20 ff 	  . 
	rst 38h			;b007	ff 	. 
	rst 38h			;b008	ff 	. 
	nop			;b009	00 	. 
	rst 38h			;b00a	ff 	. 
	ld d,a			;b00b	57 	W 
	ld hl,(02014h)		;b00c	2a 14 20 	* .   
	ret nz			;b00f	c0 	. 
	rst 0			;b010	c7 	. 
	ret nz			;b011	c0 	. 
	jr nz,$+1		;b012	20 ff 	  . 
	ret po			;b014	e0 	. 
	rra			;b015	1f 	. 
	nop			;b016	00 	. 
	jr nz,$+9		;b017	20 07 	  . 
	rrca			;b019	0f 	. 
	rrca			;b01a	0f 	. 
	rra			;b01b	1f 	. 
	rra			;b01c	1f 	. 
	rlca			;b01d	07 	. 
	nop			;b01e	00 	. 
	nop			;b01f	00 	. 
	ld (0ffbeh),hl		;b020	22 be ff 	" . . 
	or a			;b023	b7 	. 
	defb 0edh;next byte illegal after ed		;b024	ed 	. 
	rst 38h			;b025	ff 	. 
	ld a,a			;b026	7f 	 
	in a,(0ffh)		;b027	db ff 	. . 
	ld a,b			;b029	78 	x 
	ei			;b02a	fb 	. 
	rst 18h			;b02b	df 	. 
	rst 38h			;b02c	ff 	. 
	or a			;b02d	b7 	. 
	cp 0efh		;b02e	fe ef 	. . 
	ei			;b030	fb 	. 
	ld a,a			;b031	7f 	 
	ld a,b			;b032	78 	x 
	rst 28h			;b033	ef 	. 
	cp a			;b034	bf 	. 
	push af			;b035	f5 	. 
	ld a,a			;b036	7f 	 
	rst 38h			;b037	ff 	. 
	sub 0ffh		;b038	d6 ff 	. . 
	cp l			;b03a	bd 	. 
	ld a,b			;b03b	78 	x 
	rst 38h			;b03c	ff 	. 
	ret p			;b03d	f0 	. 
	add a,b			;b03e	80 	. 
	add a,b			;b03f	80 	. 
	add a,b			;b040	80 	. 
	add a,b			;b041	80 	. 
	add a,b			;b042	80 	. 
	add a,b			;b043	80 	. 
	jr c,$-123		;b044	38 83 	8 . 
	dec bc			;b046	0b 	. 
	dec bc			;b047	0b 	. 
	dec bc			;b048	0b 	. 
	inc bc			;b049	03 	. 
	inc bc			;b04a	03 	. 
	inc bc			;b04b	03 	. 
	inc bc			;b04c	03 	. 
	jr c,$-14		;b04d	38 f0 	8 . 
	rst 38h			;b04f	ff 	. 
	ret p			;b050	f0 	. 
	rst 38h			;b051	ff 	. 
	add a,b			;b052	80 	. 
	add a,b			;b053	80 	. 
	add a,b			;b054	80 	. 
	rst 38h			;b055	ff 	. 
	jr c,$+13		;b056	38 0b 	8 . 
	add a,e			;b058	83 	. 
	rst 38h			;b059	ff 	. 
	rst 38h			;b05a	ff 	. 
	rra			;b05b	1f 	. 
	inc de			;b05c	13 	. 
	ld de,038ffh		;b05d	11 ff 38 	. . 8 
	rst 38h			;b060	ff 	. 
	add a,l			;b061	85 	. 
	add a,l			;b062	85 	. 
	add a,l			;b063	85 	. 
	rst 38h			;b064	ff 	. 
	set 1,e		;b065	cb cb 	. . 
	rl b		;b067	cb 10 	. . 
	ex (sp),hl			;b069	e3 	. 
	ex (sp),hl			;b06a	e3 	. 
	adc a,b			;b06b	88 	. 
	sub h			;b06c	94 	. 
	adc a,b			;b06d	88 	. 
	ex (sp),hl			;b06e	e3 	. 
	ex (sp),hl			;b06f	e3 	. 
	rst 38h			;b070	ff 	. 
	jr $+54		;b071	18 34 	. 4 
	inc h			;b073	24 	$ 
	inc (hl)			;b074	34 	4 
	inc h			;b075	24 	$ 
	inc (hl)			;b076	34 	4 
	inc h			;b077	24 	$ 
	inc (hl)			;b078	34 	4 
	inc h			;b079	24 	$ 
	ex af,af'			;b07a	08 	. 
	add a,c			;b07b	81 	. 
	add a,c			;b07c	81 	. 
	rst 38h			;b07d	ff 	. 
	add a,c			;b07e	81 	. 
	add a,c			;b07f	81 	. 
	rst 38h			;b080	ff 	. 
	sub c			;b081	91 	. 
	rst 38h			;b082	ff 	. 
	ld d,c			;b083	51 	Q 
	nop			;b084	00 	. 
	nop			;b085	00 	. 
	nop			;b086	00 	. 
	nop			;b087	00 	. 
	nop			;b088	00 	. 
	nop			;b089	00 	. 
	nop			;b08a	00 	. 
	nop			;b08b	00 	. 
	jr c,$+2		;b08c	38 00 	8 . 
	nop			;b08e	00 	. 
	ld bc,00603h		;b08f	01 03 06 	. . . 
	ld h,a			;b092	67 	g 
	rst 38h			;b093	ff 	. 
	rst 38h			;b094	ff 	. 
	dec c			;b095	0d 	. 
	ld h,d			;b096	62 	b 
	rst 28h			;b097	ef 	. 
	rst 38h			;b098	ff 	. 
	ld e,a			;b099	5f 	_ 
	rst 8			;b09a	cf 	. 
	ld h,a			;b09b	67 	g 
	sub 0e4h		;b09c	d6 e4 	. . 
	dec c			;b09e	0d 	. 
	nop			;b09f	00 	. 
	adc a,b			;b0a0	88 	. 
	adc a,h			;b0a1	8c 	. 
	add a,b			;b0a2	80 	. 
	nop			;b0a3	00 	. 
	ld b,00fh		;b0a4	06 0f 	. . 
	sbc a,a			;b0a6	9f 	. 
	inc c			;b0a7	0c 	. 
	nop			;b0a8	00 	. 
	inc b			;b0a9	04 	. 
	ld (bc),a			;b0aa	02 	. 
	ld b,a			;b0ab	47 	G 
	adc a,a			;b0ac	8f 	. 
	ld a,a			;b0ad	7f 	 
	rst 18h			;b0ae	df 	. 
	rst 18h			;b0af	df 	. 
	ld c,000h		;b0b0	0e 00 	. . 
	nop			;b0b2	00 	. 
	nop			;b0b3	00 	. 
	jr nc,$+34		;b0b4	30 20 	0   
	ret m			;b0b6	f8 	. 
	cp 0fch		;b0b7	fe fc 	. . 
	ld c,07fh		;b0b9	0e 7f 	.  
	rrca			;b0bb	0f 	. 
	rlca			;b0bc	07 	. 
	rlca			;b0bd	07 	. 
	rlca			;b0be	07 	. 
	inc bc			;b0bf	03 	. 
	ld b,b			;b0c0	40 	@ 
	nop			;b0c1	00 	. 
	dec c			;b0c2	0d 	. 
	and b			;b0c3	a0 	. 
	ret p			;b0c4	f0 	. 
	ret m			;b0c5	f8 	. 
	ret po			;b0c6	e0 	. 
	ret z			;b0c7	c8 	. 
	ld b,b			;b0c8	40 	@ 
	and b			;b0c9	a0 	. 
	ld a,b			;b0ca	78 	x 
	dec c			;b0cb	0d 	. 
	cpl			;b0cc	2f 	/ 
	ld l,a			;b0cd	6f 	o 
	ccf			;b0ce	3f 	? 
	ld h,a			;b0cf	67 	g 
	inc sp			;b0d0	33 	3 
	ld a,l			;b0d1	7d 	} 
	ld a,(hl)			;b0d2	7e 	~ 
	ld a,a			;b0d3	7f 	 
	inc c			;b0d4	0c 	. 
	cp a			;b0d5	bf 	. 
	cp a			;b0d6	bf 	. 
	ld a,a			;b0d7	7f 	 
	rst 38h			;b0d8	ff 	. 
	rst 38h			;b0d9	ff 	. 
	rst 38h			;b0da	ff 	. 
	or (hl)			;b0db	b6 	. 
	dec d			;b0dc	15 	. 
	ld c,0f0h		;b0dd	0e f0 	. . 
	jp pe,0c0d0h		;b0df	ea d0 c0 	. . . 
	and b			;b0e2	a0 	. 
	ld b,b			;b0e3	40 	@ 
	nop			;b0e4	00 	. 
	nop			;b0e5	00 	. 
	ld c,009h		;b0e6	0e 09 	. . 
	nop			;b0e8	00 	. 
	ex af,af'			;b0e9	08 	. 
	ld e,l			;b0ea	5d 	] 
	ex af,af'			;b0eb	08 	. 
	nop			;b0ec	00 	. 
	ex af,af'			;b0ed	08 	. 
	nop			;b0ee	00 	. 
	rrca			;b0ef	0f 	. 
	inc a			;b0f0	3c 	< 
	ld a,01eh		;b0f1	3e 1e 	> . 
	inc e			;b0f3	1c 	. 
	jr $+34		;b0f4	18 20 	.   
	jr nc,$+2		;b0f6	30 00 	0 . 
	inc c			;b0f8	0c 	. 
	ld e,00eh		;b0f9	1e 0e 	. . 
	ld c,00dh		;b0fb	0e 0d 	. . 
	nop			;b0fd	00 	. 
	nop			;b0fe	00 	. 
	nop			;b0ff	00 	. 
	nop			;b100	00 	. 
	inc c			;b101	0c 	. 
	ld (bc),a			;b102	02 	. 
	ld bc,00180h		;b103	01 80 01 	. . . 
	nop			;b106	00 	. 
	nop			;b107	00 	. 
	nop			;b108	00 	. 
	nop			;b109	00 	. 
	inc c			;b10a	0c 	. 
	sub b			;b10b	90 	. 
	ld h,b			;b10c	60 	` 
	call po,0a0f0h		;b10d	e4 f0 a0 	. . . 
	ld (bc),a			;b110	02 	. 
	inc b			;b111	04 	. 
	nop			;b112	00 	. 
	dec c			;b113	0d 	. 
	ld a,a			;b114	7f 	 
	ld bc,001efh		;b115	01 ef 01 	. . . 
	rst 30h			;b118	f7 	. 
	ld bc,002f7h		;b119	01 f7 02 	. . . 
	rst 30h			;b11c	f7 	. 
	inc b			;b11d	04 	. 
	rst 30h			;b11e	f7 	. 
	ex af,af'			;b11f	08 	. 
	rst 30h			;b120	f7 	. 
	djnz $-15		;b121	10 ef 	. . 
	djnz $-15		;b123	10 ef 	. . 
	ex af,af'			;b125	08 	. 
	rst 28h			;b126	ef 	. 
	inc b			;b127	04 	. 
	rst 28h			;b128	ef 	. 
	ld (bc),a			;b129	02 	. 
	defb 0fdh,001h,07fh	;illegal sequence		;b12a	fd 01 7f 	. .  
	djnz $+0		;b12d	10 fe 	. . 
	ex af,af'			;b12f	08 	. 
	defb 0fdh,004h,0fbh	;illegal sequence		;b130	fd 04 fb 	. . . 
	inc b			;b133	04 	. 
	defb 0fdh,008h,0fdh	;illegal sequence		;b134	fd 08 fd 	. . . 
	djnz $-63		;b137	10 bf 	. . 
	djnz $-31		;b139	10 df 	. . 
	inc b			;b13b	04 	. 
	cp a			;b13c	bf 	. 
	ex af,af'			;b13d	08 	. 
	cp a			;b13e	bf 	. 
	inc b			;b13f	04 	. 
	cp a			;b140	bf 	. 
	ld (bc),a			;b141	02 	. 
	ld a,a			;b142	7f 	 
	inc b			;b143	04 	. 
	ld a,a			;b144	7f 	 
	ex af,af'			;b145	08 	. 
	rst 18h			;b146	df 	. 
	ld (bc),a			;b147	02 	. 
	rst 18h			;b148	df 	. 
	ld bc,001fbh		;b149	01 fb 01 	. . . 
	ei			;b14c	fb 	. 
	ex af,af'			;b14d	08 	. 
	defb 0fdh,002h,0fbh	;illegal sequence		;b14e	fd 02 fb 	. . . 
	djnz $-31		;b151	10 df 	. . 
	ex af,af'			;b153	08 	. 
	cp 010h		;b154	fe 10 	. . 
	ei			;b156	fb 	. 
	ld (bc),a			;b157	02 	. 
	cp 004h		;b158	fe 04 	. . 
	rst 18h			;b15a	df 	. 
	djnz $+0		;b15b	10 fe 	. . 
	ld (bc),a			;b15d	02 	. 
	ld a,(bc)			;b15e	0a 	. 
	nop			;b15f	00 	. 
	ld a,(bc)			;b160	0a 	. 
	ex af,af'			;b161	08 	. 
	ld a,(bc)			;b162	0a 	. 
	nop			;b163	00 	. 
	ex af,af'			;b164	08 	. 
	nop			;b165	00 	. 
	ex af,af'			;b166	08 	. 
	ex af,af'			;b167	08 	. 
	add hl,bc			;b168	09 	. 
	nop			;b169	00 	. 
	add hl,bc			;b16a	09 	. 
	ex af,af'			;b16b	08 	. 
	add hl,bc			;b16c	09 	. 
	nop			;b16d	00 	. 
	rst 38h			;b16e	ff 	. 
	add a,b			;b16f	80 	. 
	sbc a,(hl)			;b170	9e 	. 
	pop af			;b171	f1 	. 
	sub c			;b172	91 	. 
	jr nz,$+34		;b173	20 20 	    
	rst 38h			;b175	ff 	. 
	jr c,$+2		;b176	38 00 	8 . 
	nop			;b178	00 	. 
	nop			;b179	00 	. 
	nop			;b17a	00 	. 
	nop			;b17b	00 	. 
	nop			;b17c	00 	. 
	nop			;b17d	00 	. 
	nop			;b17e	00 	. 
	nop			;b17f	00 	. 
	inc de			;b180	13 	. 
	dec b			;b181	05 	. 
	inc de			;b182	13 	. 
	dec b			;b183	05 	. 
	inc de			;b184	13 	. 
	dec b			;b185	05 	. 
	inc de			;b186	13 	. 
	dec b			;b187	05 	. 
	jr z,$+2		;b188	28 00 	( . 
	nop			;b18a	00 	. 
	nop			;b18b	00 	. 
	nop			;b18c	00 	. 
	nop			;b18d	00 	. 
	nop			;b18e	00 	. 
	nop			;b18f	00 	. 
	nop			;b190	00 	. 
	nop			;b191	00 	. 
	ld h,h			;b192	64 	d 
	ld h,l			;b193	65 	e 
	ld h,a			;b194	67 	g 
	ld h,a			;b195	67 	g 
	ld h,a			;b196	67 	g 
	ld h,a			;b197	67 	g 
	ld h,a			;b198	67 	g 
	ld h,a			;b199	67 	g 
	add hl,sp			;b19a	39 	9 
	ld h,0a6h		;b19b	26 a6 	& . 
	and 0e6h		;b19d	e6 e6 	. . 
	and 0e6h		;b19f	e6 e6 	. . 
	and 0e6h		;b1a1	e6 e6 	. . 
	add hl,sp			;b1a3	39 	9 
	call m,07ffdh		;b1a4	fc fd 7f 	. .  
	ld a,a			;b1a7	7f 	 
	ld a,a			;b1a8	7f 	 
	ccf			;b1a9	3f 	? 
	rrca			;b1aa	0f 	. 
	rlca			;b1ab	07 	. 
	ld a,(bc)			;b1ac	0a 	. 
	cp (hl)			;b1ad	be 	. 
	jp nz,0f2e2h		;b1ae	c2 e2 f2 	. . . 
	jp m,0fefch		;b1b1	fa fc fe 	. . . 
	rst 38h			;b1b4	ff 	. 
	jr nz,$-1		;b1b5	20 fd 	  . 
	add a,e			;b1b7	83 	. 
	and a			;b1b8	a7 	. 
	xor a			;b1b9	af 	. 
	sbc a,a			;b1ba	9f 	. 
	cp a			;b1bb	bf 	. 
	ld a,a			;b1bc	7f 	 
	rst 38h			;b1bd	ff 	. 
	jr nz,$+2		;b1be	20 00 	  . 
	nop			;b1c0	00 	. 
	nop			;b1c1	00 	. 
	nop			;b1c2	00 	. 
	nop			;b1c3	00 	. 
	nop			;b1c4	00 	. 
	nop			;b1c5	00 	. 
	nop			;b1c6	00 	. 
	nop			;b1c7	00 	. 
	rst 38h			;b1c8	ff 	. 
	ld a,a			;b1c9	7f 	 
	cp a			;b1ca	bf 	. 
	sbc a,a			;b1cb	9f 	. 
	xor a			;b1cc	af 	. 
	add a,a			;b1cd	87 	. 
	ei			;b1ce	fb 	. 
	ld bc,0ff22h		;b1cf	01 22 ff 	. " . 
	cp 0fch		;b1d2	fe fc 	. . 
	jp m,0e2f2h		;b1d4	fa f2 e2 	. . . 
	sbc a,080h		;b1d7	de 80 	. . 
	ld (00000h),hl		;b1d9	22 00 00 	" . . 
	nop			;b1dc	00 	. 
	nop			;b1dd	00 	. 
	nop			;b1de	00 	. 
	nop			;b1df	00 	. 
	nop			;b1e0	00 	. 
	rst 38h			;b1e1	ff 	. 
	ld l,b			;b1e2	68 	h 
	nop			;b1e3	00 	. 
	nop			;b1e4	00 	. 
	nop			;b1e5	00 	. 
	nop			;b1e6	00 	. 
	nop			;b1e7	00 	. 
	nop			;b1e8	00 	. 
	nop			;b1e9	00 	. 
	rst 38h			;b1ea	ff 	. 
	jr z,$-30		;b1eb	28 e0 	( . 
	ret po			;b1ed	e0 	. 
	ret po			;b1ee	e0 	. 
	ret po			;b1ef	e0 	. 
	ret po			;b1f0	e0 	. 
	ret po			;b1f1	e0 	. 
	ret po			;b1f2	e0 	. 
	ret po			;b1f3	e0 	. 
	ld l,a			;b1f4	6f 	o 
	rlca			;b1f5	07 	. 
	rlca			;b1f6	07 	. 
	rlca			;b1f7	07 	. 
	rlca			;b1f8	07 	. 
	rlca			;b1f9	07 	. 
	rlca			;b1fa	07 	. 
	rlca			;b1fb	07 	. 
	rlca			;b1fc	07 	. 
	jr z,$+129		;b1fd	28 7f 	(  
	ld a,a			;b1ff	7f 	 
	ccf			;b200	3f 	? 
	ccf			;b201	3f 	? 
	scf			;b202	37 	7 
	or e			;b203	b3 	. 
	ld (de),a			;b204	12 	. 
	nop			;b205	00 	. 
	ex af,af'			;b206	08 	. 
	ld c,a			;b207	4f 	O 
	sub b			;b208	90 	. 
	jp p,0fefeh		;b209	f2 fe fe 	. . . 
	cp a			;b20c	bf 	. 
	cp a			;b20d	bf 	. 
	ei			;b20e	fb 	. 
	ex af,af'			;b20f	08 	. 
	cp 0f4h		;b210	fe f4 	. . 
	rst 38h			;b212	ff 	. 
	rst 38h			;b213	ff 	. 
	cp 0f0h		;b214	fe f0 	. . 
	ret po			;b216	e0 	. 
	call m,0ff08h		;b217	fc 08 ff 	. . . 
	rst 38h			;b21a	ff 	. 
	adc a,b			;b21b	88 	. 
	cp 0ffh		;b21c	fe ff 	. . 
	call m,0fedfh		;b21e	fc df fe 	. . . 
	ex af,af'			;b221	08 	. 
	ret po			;b222	e0 	. 
	ld e,0feh		;b223	1e fe 	. . 
	cp 000h		;b225	fe 00 	. . 
	call m,0fefeh		;b227	fc fe fe 	. . . 
	ex af,af'			;b22a	08 	. 
	defb 0fdh,0d8h,038h	;illegal sequence		;b22b	fd d8 38 	. . 8 
	djnz $+57		;b22e	10 37 	. 7 
	inc d			;b230	14 	. 
	inc b			;b231	04 	. 
	inc b			;b232	04 	. 
	ex af,af'			;b233	08 	. 
	ld a,a			;b234	7f 	 
	rla			;b235	17 	. 
	ld c,(hl)			;b236	4e 	N 
	ld d,0cch		;b237	16 cc 	. . 
	inc d			;b239	14 	. 
	inc c			;b23a	0c 	. 
	ex af,af'			;b23b	08 	. 
	ex af,af'			;b23c	08 	. 
	ld e,(hl)			;b23d	5e 	^ 
	ld l,h			;b23e	6c 	l 
	adc a,h			;b23f	8c 	. 
	ld b,b			;b240	40 	@ 
	rst 38h			;b241	ff 	. 
	inc b			;b242	04 	. 
	inc b			;b243	04 	. 
	inc b			;b244	04 	. 
	ex af,af'			;b245	08 	. 
	rst 38h			;b246	ff 	. 
	cp a			;b247	bf 	. 
	rst 38h			;b248	ff 	. 
	rst 18h			;b249	df 	. 
	sbc a,(hl)			;b24a	9e 	. 
	ld e,(hl)			;b24b	5e 	^ 
	ld a,05eh		;b24c	3e 5e 	> ^ 
	ex af,af'			;b24e	08 	. 
	rst 38h			;b24f	ff 	. 
	rst 38h			;b250	ff 	. 
	cp ixl		;b251	dd bd 	. . 
	sbc a,0dah		;b253	de da 	. . 
	and 080h		;b255	e6 80 	. . 
	ex af,af'			;b257	08 	. 
	ld b,e			;b258	43 	C 
	ld d,e			;b259	53 	S 
	ld e,a			;b25a	5f 	_ 
	ld a,a			;b25b	7f 	 
	ld (hl),a			;b25c	77 	w 
	ld a,a			;b25d	7f 	 
	rst 38h			;b25e	ff 	. 
	rst 38h			;b25f	ff 	. 
	ex af,af'			;b260	08 	. 
	rst 38h			;b261	ff 	. 
	add a,e			;b262	83 	. 
	ld a,a			;b263	7f 	 
	rst 38h			;b264	ff 	. 
	pop af			;b265	f1 	. 
	ld c,0ffh		;b266	0e ff 	. . 
	rst 38h			;b268	ff 	. 
	ex af,af'			;b269	08 	. 
	ld a,a			;b26a	7f 	 
	ccf			;b26b	3f 	? 
	ret nz			;b26c	c0 	. 
	rst 38h			;b26d	ff 	. 
	rst 38h			;b26e	ff 	. 
	ret m			;b26f	f8 	. 
	rlca			;b270	07 	. 
	ccf			;b271	3f 	? 
	ex af,af'			;b272	08 	. 
	rst 38h			;b273	ff 	. 
	rst 38h			;b274	ff 	. 
	ccf			;b275	3f 	? 
	rst 20h			;b276	e7 	. 
	rst 38h			;b277	ff 	. 
	rst 38h			;b278	ff 	. 
	rst 38h			;b279	ff 	. 
	cp a			;b27a	bf 	. 
	ex af,af'			;b27b	08 	. 
	rst 38h			;b27c	ff 	. 
	ld a,a			;b27d	7f 	 
	inc b			;b27e	04 	. 
	ccf			;b27f	3f 	? 
	ld a,a			;b280	7f 	 
	ld a,a			;b281	7f 	 
	ld a,a			;b282	7f 	 
	rst 38h			;b283	ff 	. 
	ex af,af'			;b284	08 	. 
	ld a,a			;b285	7f 	 
	ld a,a			;b286	7f 	 
	rst 38h			;b287	ff 	. 
	rst 20h			;b288	e7 	. 
	dec de			;b289	1b 	. 
	ld a,a			;b28a	7f 	 
	rst 38h			;b28b	ff 	. 
	rst 38h			;b28c	ff 	. 
	ex af,af'			;b28d	08 	. 
	rst 38h			;b28e	ff 	. 
	ld bc,0ff7fh		;b28f	01 7f ff 	.  . 
	rst 38h			;b292	ff 	. 
	ld a,a			;b293	7f 	 
	ld bc,0083eh		;b294	01 3e 08 	. > . 
	rst 38h			;b297	ff 	. 
	rst 38h			;b298	ff 	. 
	rst 38h			;b299	ff 	. 
	rst 38h			;b29a	ff 	. 
	rst 38h			;b29b	ff 	. 
	rst 38h			;b29c	ff 	. 
	rst 38h			;b29d	ff 	. 
	rst 38h			;b29e	ff 	. 
	ex af,af'			;b29f	08 	. 
	ret po			;b2a0	e0 	. 
	ld sp,hl			;b2a1	f9 	. 
	rst 38h			;b2a2	ff 	. 
	cp 0feh		;b2a3	fe fe 	. . 
	cp l			;b2a5	bd 	. 
	defb 0fdh,0feh,008h	;illegal sequence		;b2a6	fd fe 08 	. . . 
	adc a,l			;b2a9	8d 	. 
	call 0dfdfh		;b2aa	cd df df 	. . . 
	rst 38h			;b2ad	ff 	. 
	rst 38h			;b2ae	ff 	. 
	rst 38h			;b2af	ff 	. 
	rst 38h			;b2b0	ff 	. 
	ex af,af'			;b2b1	08 	. 
	di			;b2b2	f3 	. 
	rst 38h			;b2b3	ff 	. 
	ei			;b2b4	fb 	. 
	rst 20h			;b2b5	e7 	. 
	rst 38h			;b2b6	ff 	. 
	cp a			;b2b7	bf 	. 
	cp l			;b2b8	bd 	. 
	ld a,a			;b2b9	7f 	 
	ex af,af'			;b2ba	08 	. 
	defb 0fdh,0feh,0feh	;illegal sequence		;b2bb	fd fe fe 	. . . 
	cp 0ffh		;b2be	fe ff 	. . 
	rst 38h			;b2c0	ff 	. 
	rst 38h			;b2c1	ff 	. 
	rst 38h			;b2c2	ff 	. 
	ex af,af'			;b2c3	08 	. 
	rst 28h			;b2c4	ef 	. 
	rst 28h			;b2c5	ef 	. 
	rst 28h			;b2c6	ef 	. 
	rst 28h			;b2c7	ef 	. 
	rst 38h			;b2c8	ff 	. 
	ei			;b2c9	fb 	. 
	ei			;b2ca	fb 	. 
	ei			;b2cb	fb 	. 
	ex af,af'			;b2cc	08 	. 
	rst 28h			;b2cd	ef 	. 
	rst 28h			;b2ce	ef 	. 
	rst 28h			;b2cf	ef 	. 
	rst 38h			;b2d0	ff 	. 
	rst 28h			;b2d1	ef 	. 
	rst 28h			;b2d2	ef 	. 
	rst 28h			;b2d3	ef 	. 
	rst 28h			;b2d4	ef 	. 
	ex af,af'			;b2d5	08 	. 
	ld (hl),a			;b2d6	77 	w 
	rst 38h			;b2d7	ff 	. 
	cp a			;b2d8	bf 	. 
	cp a			;b2d9	bf 	. 
	cp a			;b2da	bf 	. 
	rst 18h			;b2db	df 	. 
	rst 18h			;b2dc	df 	. 
	rst 38h			;b2dd	ff 	. 
	ex af,af'			;b2de	08 	. 
	add a,e			;b2df	83 	. 
	ret m			;b2e0	f8 	. 
	rst 38h			;b2e1	ff 	. 
	rst 38h			;b2e2	ff 	. 
	rst 38h			;b2e3	ff 	. 
	rst 18h			;b2e4	df 	. 
	rst 38h			;b2e5	ff 	. 
	rst 38h			;b2e6	ff 	. 
	ex af,af'			;b2e7	08 	. 
	call m,0fdfeh		;b2e8	fc fe fd 	. . . 
	defb 0fdh,0ffh,0f7h	;illegal sequence		;b2eb	fd ff f7 	. . . 
	rst 30h			;b2ee	f7 	. 
	rst 30h			;b2ef	f7 	. 
	ex af,af'			;b2f0	08 	. 
	rst 38h			;b2f1	ff 	. 
	ld h,b			;b2f2	60 	` 
	jr nc,$+26		;b2f3	30 18 	0 . 
	inc c			;b2f5	0c 	. 
	ld b,003h		;b2f6	06 03 	. . 
	ld bc,0ff0fh		;b2f8	01 0f ff 	. . . 
	rst 38h			;b2fb	ff 	. 
	add a,c			;b2fc	81 	. 
	ld b,d			;b2fd	42 	B 
	inc h			;b2fe	24 	$ 
	jr $+1		;b2ff	18 ff 	. . 
	rst 38h			;b301	ff 	. 
	rrca			;b302	0f 	. 
	rst 38h			;b303	ff 	. 
	ld b,00ch		;b304	06 0c 	. . 
	jr $+50		;b306	18 30 	. 0 
	ld h,b			;b308	60 	` 
	ret nz			;b309	c0 	. 
	add a,b			;b30a	80 	. 
	rrca			;b30b	0f 	. 
	cp 082h		;b30c	fe 82 	. . 
	and d			;b30e	a2 	. 
	and d			;b30f	a2 	. 
	sbc a,d			;b310	9a 	. 
	cp h			;b311	bc 	. 
	ld a,(hl)			;b312	7e 	~ 
	rst 38h			;b313	ff 	. 
	ld (0c2beh),hl		;b314	22 be c2 	" . . 
	jp po,0faf2h		;b317	e2 f2 fa 	. . . 
	call m,0fffeh		;b31a	fc fe ff 	. . . 
	ld (083fdh),hl		;b31d	22 fd 83 	" . . 
	and a			;b320	a7 	. 
	xor a			;b321	af 	. 
	sbc a,a			;b322	9f 	. 
	cp a			;b323	bf 	. 
	ld a,a			;b324	7f 	 
	rst 38h			;b325	ff 	. 
	ld (00000h),hl		;b326	22 00 00 	" . . 
	nop			;b329	00 	. 
	nop			;b32a	00 	. 
	nop			;b32b	00 	. 
	nop			;b32c	00 	. 
	nop			;b32d	00 	. 
	nop			;b32e	00 	. 
	jr z,$+2		;b32f	28 00 	( . 
	nop			;b331	00 	. 
	nop			;b332	00 	. 
	nop			;b333	00 	. 
	nop			;b334	00 	. 
	nop			;b335	00 	. 
	nop			;b336	00 	. 
	nop			;b337	00 	. 
	djnz $+87		;b338	10 55 	. U 
	xor d			;b33a	aa 	. 
	xor d			;b33b	aa 	. 
	xor d			;b33c	aa 	. 
	xor d			;b33d	aa 	. 
	rst 38h			;b33e	ff 	. 
	xor d			;b33f	aa 	. 
	ld d,l			;b340	55 	U 
	jr z,$+1		;b341	28 ff 	( . 
	rst 38h			;b343	ff 	. 
	defb 0fdh,0ffh,0ffh	;illegal sequence		;b344	fd ff ff 	. . . 
	rst 38h			;b347	ff 	. 
	rst 38h			;b348	ff 	. 
	cp a			;b349	bf 	. 
	ex af,af'			;b34a	08 	. 
	nop			;b34b	00 	. 
	nop			;b34c	00 	. 
	nop			;b34d	00 	. 
	nop			;b34e	00 	. 
	nop			;b34f	00 	. 
	nop			;b350	00 	. 
	nop			;b351	00 	. 
	nop			;b352	00 	. 
	ld a,c			;b353	79 	y 
	ex af,af'			;b354	08 	. 
	ex af,af'			;b355	08 	. 
	ex af,af'			;b356	08 	. 
	rst 38h			;b357	ff 	. 
	add a,b			;b358	80 	. 
	add a,b			;b359	80 	. 
	add a,b			;b35a	80 	. 
	rst 38h			;b35b	ff 	. 
	djnz $+2		;b35c	10 00 	. . 
	nop			;b35e	00 	. 
	nop			;b35f	00 	. 
	nop			;b360	00 	. 
	nop			;b361	00 	. 
	nop			;b362	00 	. 
	nop			;b363	00 	. 
	nop			;b364	00 	. 
	nop			;b365	00 	. 
	ld l,l			;b366	6d 	m 
	rst 38h			;b367	ff 	. 
	rst 38h			;b368	ff 	. 
	rst 38h			;b369	ff 	. 
	or e			;b36a	b3 	. 
	sub b			;b36b	90 	. 
	inc b			;b36c	04 	. 
	ld b,b			;b36d	40 	@ 
	inc b			;b36e	04 	. 
	ld h,(hl)			;b36f	66 	f 
	rst 38h			;b370	ff 	. 
	ret po			;b371	e0 	. 
	rst 18h			;b372	df 	. 
	or h			;b373	b4 	. 
	ret c			;b374	d8 	. 
	ld l,l			;b375	6d 	m 
	ld c,l			;b376	4d 	M 
	rrca			;b377	0f 	. 
	adc a,d			;b378	8a 	. 
	sbc a,b			;b379	98 	. 
	xor d			;b37a	aa 	. 
	adc a,d			;b37b	8a 	. 
	cp 0fdh		;b37c	fe fd 	. . 
	ld a,l			;b37e	7d 	} 
	rst 28h			;b37f	ef 	. 
	jp m,0f5f5h		;b380	fa f5 f5 	. . . 
	dec e			;b383	1d 	. 
	adc a,a			;b384	8f 	. 
	add hl,hl			;b385	29 	) 
	ld a,(0827ah)		;b386	3a 7a 82 	: z . 
	dec b			;b389	05 	. 
	xor d			;b38a	aa 	. 
	ld d,c			;b38b	51 	Q 
	jr nz,$-31		;b38c	20 df 	  . 
	in a,(0fch)		;b38e	db fc 	. . 
	jp (hl)			;b390	e9 	. 
	jp c,0ecb8h		;b391	da b8 ec 	. . . 
	ld d,h			;b394	54 	T 
	xor d			;b395	aa 	. 
	call nc,077fch		;b396	d4 fc 77 	. . w 
	res 7,l		;b399	cb bd 	. . 
	push hl			;b39b	e5 	. 
	ld c,e			;b39c	4b 	K 
	defb 0fdh,0edh,0ebh	;illegal sequence		;b39d	fd ed eb 	. . . 
	push de			;b3a0	d5 	. 
	jp pe,0c308h		;b3a1	ea 08 c3 	. . . 
	ret p			;b3a4	f0 	. 
	ret m			;b3a5	f8 	. 
	cp 008h		;b3a6	fe 08 	. . 
	cp l			;b3a8	bd 	. 
	ld a,(bc)			;b3a9	0a 	. 
	djnz $+33		;b3aa	10 1f 	. . 
	ld e,a			;b3ac	5f 	_ 
	sbc a,a			;b3ad	9f 	. 
	ld b,b			;b3ae	40 	@ 
	call m,0f053h		;b3af	fc 53 f0 	. S . 
	add a,(hl)			;b3b2	86 	. 
	jr nz,$+96		;b3b3	20 5e 	  ^ 
	ld d,a			;b3b5	57 	W 
	ld hl,(02014h)		;b3b6	2a 14 20 	* .   
	ret nz			;b3b9	c0 	. 
	rst 0			;b3ba	c7 	. 
	ret nz			;b3bb	c0 	. 
	rst 20h			;b3bc	e7 	. 
	dec hl			;b3bd	2b 	+ 
	ret po			;b3be	e0 	. 
	rra			;b3bf	1f 	. 
	jr nz,$+52		;b3c0	20 32 	  2 
	set 1,c		;b3c2	cb c9 	. . 
	ld (hl),01fh		;b3c4	36 1f 	6 . 
	rlca			;b3c6	07 	. 
	inc sp			;b3c7	33 	3 
	push de			;b3c8	d5 	. 
	ld (06055h),hl		;b3c9	22 55 60 	" U ` 
	ret m			;b3cc	f8 	. 
	defb 0fdh,0f4h,0a4h	;illegal sequence		;b3cd	fd f4 a4 	. . . 
	rst 8			;b3d0	cf 	. 
	ei			;b3d1	fb 	. 
	call 0fb08h		;b3d2	cd 08 fb 	. . . 
	defb 0fdh,07fh,0f8h	;illegal sequence		;b3d5	fd 7f f8 	.  . 
	ret nz			;b3d8	c0 	. 
	sbc a,l			;b3d9	9d 	. 
	sbc a,l			;b3da	9d 	. 
	sbc a,c			;b3db	99 	. 
	defb 0fdh,0fbh,08fh	;illegal sequence		;b3dc	fd fb 8f 	. . . 
	sbc a,061h		;b3df	de 61 	. a 
	ld d,b			;b3e1	50 	P 
	ld a,b			;b3e2	78 	x 
	defb 0fdh,0f7h,0efh	;illegal sequence		;b3e3	fd f7 ef 	. . . 
	sub l			;b3e6	95 	. 
	ret m			;b3e7	f8 	. 
	jp m,0cbefh		;b3e8	fa ef cb 	. . . 
	or e			;b3eb	b3 	. 
	adc a,e			;b3ec	8b 	. 
	ld e,(hl)			;b3ed	5e 	^ 
	ex de,hl			;b3ee	eb 	. 
	cp 0f7h		;b3ef	fe f7 	. . 
	rst 28h			;b3f1	ef 	. 
	adc a,c			;b3f2	89 	. 
	xor a			;b3f3	af 	. 
	and e			;b3f4	a3 	. 
	call m,04f00h		;b3f5	fc 00 4f 	. . O 
	exx			;b3f8	d9 	. 
	xor 07eh		;b3f9	ee 7e 	. ~ 
	ld c,l			;b3fb	4d 	M 
	ld a,a			;b3fc	7f 	 
	rst 8			;b3fd	cf 	. 
	or a			;b3fe	b7 	. 
	or a			;b3ff	b7 	. 
	rst 10h			;b400	d7 	. 
	cp e			;b401	bb 	. 
	rst 38h			;b402	ff 	. 
	add a,e			;b403	83 	. 
	cp b			;b404	b8 	. 
	rst 8			;b405	cf 	. 
	cp l			;b406	bd 	. 
	inc (hl)			;b407	34 	4 
	call m,0f5f8h		;b408	fc f8 f5 	. . . 
	ex af,af'			;b40b	08 	. 
	adc a,d			;b40c	8a 	. 
	jp p,03805h		;b40d	f2 05 38 	. . 8 
	xor 089h		;b410	ee 89 	. . 
	ld hl,(0f855h)		;b412	2a 55 f8 	* U . 
	push bc			;b415	c5 	. 
	cp c			;b416	b9 	. 
	dec l			;b417	2d 	- 
	or a			;b418	b7 	. 
	ld (hl),a			;b419	77 	w 
	rst 30h			;b41a	f7 	. 
	ld c,a			;b41b	4f 	O 
	ld d,l			;b41c	55 	U 
	ld d,(hl)			;b41d	56 	V 
	ccf			;b41e	3f 	? 
	cp (hl)			;b41f	be 	. 
	ld d,a			;b420	57 	W 
	dec e			;b421	1d 	. 
	call m,00896h		;b422	fc 96 08 	. . . 
	xor d			;b425	aa 	. 
	push de			;b426	d5 	. 
	jp pe,0ae5fh		;b427	ea 5f ae 	. _ . 
	ld d,l			;b42a	55 	U 
	rst 38h			;b42b	ff 	. 
	rst 28h			;b42c	ef 	. 
	jp (hl)			;b42d	e9 	. 
	cp e			;b42e	bb 	. 
	cp b			;b42f	b8 	. 
	di			;b430	f3 	. 
	and (hl)			;b431	a6 	. 
	defb 0ddh,0a1h,0aeh	;illegal sequence		;b432	dd a1 ae 	. . . 
	ld a,l			;b435	7d 	} 
	sbc a,a			;b436	9f 	. 
	rst 18h			;b437	df 	. 
	or d			;b438	b2 	. 
	ld h,e			;b439	63 	c 
	jp nz,0b883h		;b43a	c2 83 b8 	. . . 
	add hl,sp			;b43d	39 	9 
	out (03ah),a		;b43e	d3 3a 	. : 
	xor a			;b440	af 	. 
	ld e,h			;b441	5c 	\ 
	cp b			;b442	b8 	. 
	ld (hl),h			;b443	74 	t 
	cp a			;b444	bf 	. 
	ld (hl),l			;b445	75 	u 
	xor 0d0h		;b446	ee d0 	. . 
	cp 0aeh		;b448	fe ae 	. . 
	rst 20h			;b44a	e7 	. 
	dec b			;b44b	05 	. 
	cp c			;b44c	b9 	. 
	ld a,(bc)			;b44d	0a 	. 
	add a,d			;b44e	82 	. 
	add a,e			;b44f	83 	. 
	jp nz,06163h		;b450	c2 63 61 	. c a 
	rst 18h			;b453	df 	. 
	jp pe,082d5h		;b454	ea d5 82 	. . . 
	xor e			;b457	ab 	. 
	ld d,a			;b458	57 	W 
	xor (hl)			;b459	ae 	. 
	ld e,l			;b45a	5d 	] 
	cp l			;b45b	bd 	. 
	rst 38h			;b45c	ff 	. 
	ld (hl),c			;b45d	71 	q 
	jp m,07160h		;b45e	fa 60 71 	. ` q 
	rst 38h			;b461	ff 	. 
	ld a,b			;b462	78 	x 
	ld c,h			;b463	4c 	L 
	adc a,d			;b464	8a 	. 
	jp pe,06a75h		;b465	ea 75 6a 	. u j 
	push af			;b468	f5 	. 
	cp d			;b469	ba 	. 
	ld e,l			;b46a	5d 	] 
	ld d,a			;b46b	57 	W 
	push de			;b46c	d5 	. 
	ld d,l			;b46d	55 	U 
	ld h,b			;b46e	60 	` 
	or a			;b46f	b7 	. 
	nop			;b470	00 	. 
	adc a,c			;b471	89 	. 
	ld b,(hl)			;b472	46 	F 
	call 003d2h		;b473	cd d2 03 	. . . 
	daa			;b476	27 	' 
	ld (bc),a			;b477	02 	. 
	ld b,006h		;b478	06 06 	. . 
	add a,a			;b47a	87 	. 
	ld c,e			;b47b	4b 	K 
	bit 1,e		;b47c	cb 4b 	. K 
	adc a,e			;b47e	8b 	. 
	rrca			;b47f	0f 	. 
	inc de			;b480	13 	. 
	sub (hl)			;b481	96 	. 
	xor 052h		;b482	ee 52 	. R 
	ld bc,01d06h		;b484	01 06 1d 	. . . 
	ld l,d			;b487	6a 	j 
	ld a,a			;b488	7f 	 
	rrca			;b489	0f 	. 
	rrca			;b48a	0f 	. 
	dec de			;b48b	1b 	. 
	ld l,e			;b48c	6b 	k 
	in a,(0aeh)		;b48d	db ae 	. . 
	ld d,l			;b48f	55 	U 
	xor d			;b490	aa 	. 
	rst 38h			;b491	ff 	. 
	exx			;b492	d9 	. 
	sbc a,d			;b493	9a 	. 
	adc a,(hl)			;b494	8e 	. 
	xor (hl)			;b495	ae 	. 
	ret m			;b496	f8 	. 
	rst 28h			;b497	ef 	. 
	ld e,b			;b498	58 	X 
	cp 0aeh		;b499	fe ae 	. . 
	ld e,b			;b49b	58 	X 
	ret po			;b49c	e0 	. 
	add a,b			;b49d	80 	. 
	ld b,b			;b49e	40 	@ 
	ld b,b			;b49f	40 	@ 
	pop hl			;b4a0	e1 	. 
	add a,c			;b4a1	81 	. 
	cp c			;b4a2	b9 	. 
	ld b,005h		;b4a3	06 05 	. . 
	ld b,01bh		;b4a5	06 1b 	. . 
	ld h,(hl)			;b4a7	66 	f 
	xor l			;b4a8	ad 	. 
	in a,(018h)		;b4a9	db 18 	. . 
	ld h,b			;b4ab	60 	` 
	add a,b			;b4ac	80 	. 
	sbc a,b			;b4ad	98 	. 
	ld b,d			;b4ae	42 	B 
	dec de			;b4af	1b 	. 
	ld e,e			;b4b0	5b 	[ 
	jr nc,$+50		;b4b1	30 30 	0 0 
	jr nc,$+53		;b4b3	30 33 	0 3 
	ccf			;b4b5	3f 	? 
	call m,05f30h		;b4b6	fc 30 5f 	. 0 _ 
	xor b			;b4b9	a8 	. 
	ld b,a			;b4ba	47 	G 
	ld l,e			;b4bb	6b 	k 
	or l			;b4bc	b5 	. 
	cp b			;b4bd	b8 	. 
	ld d,l			;b4be	55 	U 
	ld e,b			;b4bf	58 	X 
	dec d			;b4c0	15 	. 
	jp pe,0bf00h		;b4c1	ea 00 bf 	. . . 
	nop			;b4c4	00 	. 
	ei			;b4c5	fb 	. 
	jr nz,$-31		;b4c6	20 df 	  . 
	ld b,d			;b4c8	42 	B 
	or l			;b4c9	b5 	. 
	nop			;b4ca	00 	. 
	rst 38h			;b4cb	ff 	. 
	ex af,af'			;b4cc	08 	. 
	or a			;b4cd	b7 	. 
	ex af,af'			;b4ce	08 	. 
	rst 30h			;b4cf	f7 	. 
	ld hl,000ffh		;b4d0	21 ff 00 	! . . 
	rst 38h			;b4d3	ff 	. 
	nop			;b4d4	00 	. 
	rst 38h			;b4d5	ff 	. 
	nop			;b4d6	00 	. 
	call m,0fe03h		;b4d7	fc 03 fe 	. . . 
	ld bc,001feh		;b4da	01 fe 01 	. . . 
	ret p			;b4dd	f0 	. 
	rrca			;b4de	0f 	. 
	ret nz			;b4df	c0 	. 
	ld a,(0fc20h)		;b4e0	3a 20 fc 	:   . 
	inc bc			;b4e3	03 	. 
	ret m			;b4e4	f8 	. 
	inc b			;b4e5	04 	. 
	ret nz			;b4e6	c0 	. 
	jr c,$+2		;b4e7	38 00 	8 . 
	ret nz			;b4e9	c0 	. 
	nop			;b4ea	00 	. 
	nop			;b4eb	00 	. 
	nop			;b4ec	00 	. 
	nop			;b4ed	00 	. 
	nop			;b4ee	00 	. 
	nop			;b4ef	00 	. 
	nop			;b4f0	00 	. 
	nop			;b4f1	00 	. 
	jr nz,$+16		;b4f2	20 0e 	  . 
	pop af			;b4f4	f1 	. 
	nop			;b4f5	00 	. 
	ld c,000h		;b4f6	0e 00 	. . 
	nop			;b4f8	00 	. 
	nop			;b4f9	00 	. 
	nop			;b4fa	00 	. 
	nop			;b4fb	00 	. 
	nop			;b4fc	00 	. 
	nop			;b4fd	00 	. 
	nop			;b4fe	00 	. 
	nop			;b4ff	00 	. 
	nop			;b500	00 	. 
	nop			;b501	00 	. 
	nop			;b502	00 	. 
	jr nz,$+129		;b503	20 7f 	   
	add a,b			;b505	80 	. 
	rra			;b506	1f 	. 
	ld h,b			;b507	60 	` 
	rrca			;b508	0f 	. 
	djnz $+17		;b509	10 0f 	. . 
	djnz $+9		;b50b	10 07 	. . 
	ex af,af'			;b50d	08 	. 
	inc bc			;b50e	03 	. 
	inc c			;b50f	0c 	. 
	ld bc,00102h		;b510	01 02 01 	. . . 
	ld (bc),a			;b513	02 	. 
	jr nz,$-126		;b514	20 80 	  . 
	ld d,l			;b516	55 	U 
	ret nz			;b517	c0 	. 
	ld a,(014e0h)		;b518	3a e0 14 	: . . 
	ret nz			;b51b	c0 	. 
	ld a,(0d400h)		;b51c	3a 00 d4 	: . . 
	ret nz			;b51f	c0 	. 
	ld hl,(037c0h)		;b520	2a c0 37 	* . 7 
	add a,b			;b523	80 	. 
	ld l,d			;b524	6a 	j 
	jr nz,$+60		;b525	20 3a 	  : 
	dec sp			;b527	3b 	; 
	ret nc			;b528	d0 	. 
	ld hl,081a7h		;b529	21 a7 81 	! . . 
	dec a			;b52c	3d 	= 
	ret z			;b52d	c8 	. 
	dec a			;b52e	3d 	= 
	jr z,$+4		;b52f	28 02 	( . 
	ld l,0c7h		;b531	2e c7 	. . 
	ld (0d048h),hl		;b533	22 48 d0 	" H . 
	ret			;b536	c9 	. 
	ret m			;b537	f8 	. 
	nop			;b538	00 	. 
	jr nc,$+8		;b539	30 06 	0 . 
	jr $-61		;b53b	18 c1 	. . 
	inc c			;b53d	0c 	. 
	ld hl,011c4h		;b53e	21 c4 11 	! . . 
	add a,b			;b541	80 	. 
	ld (de),a			;b542	12 	. 
	nop			;b543	00 	. 
	ld l,l			;b544	6d 	m 
	nop			;b545	00 	. 
	adc a,(hl)			;b546	8e 	. 
	ex af,af'			;b547	08 	. 
	rra			;b548	1f 	. 
	ld b,b			;b549	40 	@ 
	ccf			;b54a	3f 	? 
	add a,b			;b54b	80 	. 
	ld a,a			;b54c	7f 	 
	nop			;b54d	00 	. 
	ccf			;b54e	3f 	? 
	nop			;b54f	00 	. 
	rra			;b550	1f 	. 
	ld b,b			;b551	40 	@ 
	ccf			;b552	3f 	? 
	add a,b			;b553	80 	. 
	ld a,a			;b554	7f 	 
	nop			;b555	00 	. 
	rst 38h			;b556	ff 	. 
	nop			;b557	00 	. 
	ex af,af'			;b558	08 	. 
	ld b,c			;b559	41 	A 
	jr $-59		;b55a	18 c3 	. . 
	jr $-123		;b55c	18 83 	. . 
	jr z,$-123		;b55e	28 83 	( . 
	jr c,$-125		;b560	38 81 	8 . 
	inc (hl)			;b562	34 	4 
	ld b,e			;b563	43 	C 
	jr $+4		;b564	18 02 	. . 
	sbc a,b			;b566	98 	. 
	nop			;b567	00 	. 
	ld d,l			;b568	55 	U 
	ex af,af'			;b569	08 	. 
	rst 38h			;b56a	ff 	. 
	nop			;b56b	00 	. 
	rst 28h			;b56c	ef 	. 
	nop			;b56d	00 	. 
	rst 0			;b56e	c7 	. 
	djnz $-111		;b56f	10 8f 	. . 
	jr nz,$+9		;b571	20 07 	  . 
	ld (hl),b			;b573	70 	p 
	rrca			;b574	0f 	. 
	ld b,b			;b575	40 	@ 
	ccf			;b576	3f 	? 
	add a,b			;b577	80 	. 
	ccf			;b578	3f 	? 
	add a,b			;b579	80 	. 
	ex af,af'			;b57a	08 	. 
	rst 38h			;b57b	ff 	. 
	nop			;b57c	00 	. 
	rst 38h			;b57d	ff 	. 
	nop			;b57e	00 	. 
	rst 38h			;b57f	ff 	. 
	nop			;b580	00 	. 
	ei			;b581	fb 	. 
	nop			;b582	00 	. 
	ld (hl),c			;b583	71 	q 
	inc b			;b584	04 	. 
	ld bc,00384h		;b585	01 84 03 	. . . 
	ld a,b			;b588	78 	x 
	add a,c			;b589	81 	. 
	ex af,af'			;b58a	08 	. 
	ex af,af'			;b58b	08 	. 
	nop			;b58c	00 	. 
	ld d,l			;b58d	55 	U 
	add a,b			;b58e	80 	. 
	ld a,(03e80h)		;b58f	3a 80 3e 	: . > 
	add a,c			;b592	81 	. 
	inc a			;b593	3c 	< 
	add a,e			;b594	83 	. 
	jr z,$-119		;b595	28 87 	( . 
	jr nc,$+9		;b597	30 07 	0 . 
	ld (hl),b			;b599	70 	p 
	rlca			;b59a	07 	. 
	ld (hl),b			;b59b	70 	p 
	ex af,af'			;b59c	08 	. 
	add a,b			;b59d	80 	. 
	ld a,000h		;b59e	3e 00 	> . 
	ld e,d			;b5a0	5a 	Z 
	and b			;b5a1	a0 	. 
	rrca			;b5a2	0f 	. 
	ret p			;b5a3	f0 	. 
	dec b			;b5a4	05 	. 
	ret po			;b5a5	e0 	. 
	ld b,080h		;b5a6	06 80 	. . 
	rra			;b5a8	1f 	. 
	nop			;b5a9	00 	. 
	ld h,c			;b5aa	61 	a 
	ld e,080h		;b5ab	1e 80 	. . 
	ex af,af'			;b5ad	08 	. 
	add a,e			;b5ae	83 	. 
	jr $+9		;b5af	18 07 	. . 
	ld h,b			;b5b1	60 	` 
	inc bc			;b5b2	03 	. 
	ret nc			;b5b3	d0 	. 
	ld hl,0338ch		;b5b4	21 8c 33 	! . 3 
	add a,b			;b5b7	80 	. 
	rra			;b5b8	1f 	. 
	ld b,b			;b5b9	40 	@ 
	rrca			;b5ba	0f 	. 
	and b			;b5bb	a0 	. 
	rrca			;b5bc	0f 	. 
	and b			;b5bd	a0 	. 
	ex af,af'			;b5be	08 	. 
	cp 000h		;b5bf	fe 00 	. . 
	call m,0dc00h		;b5c1	fc 00 dc 	. . . 
	ld bc,02388h		;b5c4	01 88 23 	. . # 
	ret nz			;b5c7	c0 	. 
	rla			;b5c8	17 	. 
	ret nz			;b5c9	c0 	. 
	ld e,081h		;b5ca	1e 81 	. . 
	inc (hl)			;b5cc	34 	4 
	inc bc			;b5cd	03 	. 
	ld l,b			;b5ce	68 	h 
	ex af,af'			;b5cf	08 	. 
	rrca			;b5d0	0f 	. 
	ret po			;b5d1	e0 	. 
	rra			;b5d2	1f 	. 
	ret nz			;b5d3	c0 	. 
	ccf			;b5d4	3f 	? 
	add a,b			;b5d5	80 	. 
	ld a,a			;b5d6	7f 	 
	nop			;b5d7	00 	. 
	ld a,a			;b5d8	7f 	 
	nop			;b5d9	00 	. 
	rst 38h			;b5da	ff 	. 
	nop			;b5db	00 	. 
	rst 38h			;b5dc	ff 	. 
	nop			;b5dd	00 	. 
	rst 38h			;b5de	ff 	. 
	nop			;b5df	00 	. 
	ex af,af'			;b5e0	08 	. 
	ld (bc),a			;b5e1	02 	. 
	ret nc			;b5e2	d0 	. 
	nop			;b5e3	00 	. 
	ld l,l			;b5e4	6d 	m 
	nop			;b5e5	00 	. 
	ld d,e			;b5e6	53 	S 
	add a,b			;b5e7	80 	. 
	dec sp			;b5e8	3b 	; 
	ret nz			;b5e9	c0 	. 
	ld e,0e0h		;b5ea	1e e0 	. . 
	ld c,0f0h		;b5ec	0e f0 	. . 
	rlca			;b5ee	07 	. 
	ret p			;b5ef	f0 	. 
	rlca			;b5f0	07 	. 
	ex af,af'			;b5f1	08 	. 
	rlca			;b5f2	07 	. 
	ret p			;b5f3	f0 	. 
	rlca			;b5f4	07 	. 
	ret p			;b5f5	f0 	. 
	rrca			;b5f6	0f 	. 
	and b			;b5f7	a0 	. 
	rra			;b5f8	1f 	. 
	ret nz			;b5f9	c0 	. 
	ccf			;b5fa	3f 	? 
	add a,b			;b5fb	80 	. 
	ccf			;b5fc	3f 	? 
	add a,b			;b5fd	80 	. 
	ld a,a			;b5fe	7f 	 
	nop			;b5ff	00 	. 
	ld a,a			;b600	7f 	 
	nop			;b601	00 	. 
	ex af,af'			;b602	08 	. 
	ret p			;b603	f0 	. 
	dec b			;b604	05 	. 
	ret po			;b605	e0 	. 
	dec c			;b606	0d 	. 
	ret po			;b607	e0 	. 
	dec c			;b608	0d 	. 
	ret po			;b609	e0 	. 
	ld a,(bc)			;b60a	0a 	. 
	ret nz			;b60b	c0 	. 
	ld a,(de)			;b60c	1a 	. 
	pop bc			;b60d	c1 	. 
	inc e			;b60e	1c 	. 
	pop bc			;b60f	c1 	. 
	inc e			;b610	1c 	. 
	add a,c			;b611	81 	. 
	inc (hl)			;b612	34 	4 
	ex af,af'			;b613	08 	. 
	add a,c			;b614	81 	. 
	inc (hl)			;b615	34 	4 
	add a,e			;b616	83 	. 
	jr c,$+5		;b617	38 03 	8 . 
	ld e,b			;b619	58 	X 
	inc bc			;b61a	03 	. 
	ld l,b			;b61b	68 	h 
	inc bc			;b61c	03 	. 
	ld l,b			;b61d	68 	h 
	inc bc			;b61e	03 	. 
	ret pe			;b61f	e8 	. 
	inc bc			;b620	03 	. 
	xor b			;b621	a8 	. 
	rlca			;b622	07 	. 
	ret nc			;b623	d0 	. 
	ex af,af'			;b624	08 	. 
	call m,0fc01h		;b625	fc 01 fc 	. . . 
	ld bc,001fch		;b628	01 fc 01 	. . . 
	ret m			;b62b	f8 	. 
	inc bc			;b62c	03 	. 
	ret m			;b62d	f8 	. 
	inc bc			;b62e	03 	. 
	ret m			;b62f	f8 	. 
	inc bc			;b630	03 	. 
	ret p			;b631	f0 	. 
	dec b			;b632	05 	. 
	ret p			;b633	f0 	. 
	dec b			;b634	05 	. 
	ex af,af'			;b635	08 	. 
	rlca			;b636	07 	. 
	ret nc			;b637	d0 	. 
	rlca			;b638	07 	. 
	ret nc			;b639	d0 	. 
	rlca			;b63a	07 	. 
	ret nc			;b63b	d0 	. 
	rrca			;b63c	0f 	. 
	and b			;b63d	a0 	. 
	rrca			;b63e	0f 	. 
	and b			;b63f	a0 	. 
	rrca			;b640	0f 	. 
	and b			;b641	a0 	. 
	rrca			;b642	0f 	. 
	and b			;b643	a0 	. 
	rrca			;b644	0f 	. 
	and b			;b645	a0 	. 
	ex af,af'			;b646	08 	. 
	ret p			;b647	f0 	. 
	rlca			;b648	07 	. 
	ret po			;b649	e0 	. 
	rrca			;b64a	0f 	. 
	ret po			;b64b	e0 	. 
	ld c,0e0h		;b64c	0e e0 	. . 
	ld a,(bc)			;b64e	0a 	. 
	ret nz			;b64f	c0 	. 
	ld a,(de)			;b650	1a 	. 
	ret nz			;b651	c0 	. 
	rra			;b652	1f 	. 
	ret nz			;b653	c0 	. 
	dec e			;b654	1d 	. 
	add a,b			;b655	80 	. 
	inc a			;b656	3c 	< 
	ex af,af'			;b657	08 	. 
	rra			;b658	1f 	. 
	ld b,b			;b659	40 	@ 
	rra			;b65a	1f 	. 
	ld b,b			;b65b	40 	@ 
	rra			;b65c	1f 	. 
	ret nz			;b65d	c0 	. 
	rra			;b65e	1f 	. 
	ret nz			;b65f	c0 	. 
	rra			;b660	1f 	. 
	ld b,b			;b661	40 	@ 
	rra			;b662	1f 	. 
	ld b,b			;b663	40 	@ 
	rra			;b664	1f 	. 
	ld b,b			;b665	40 	@ 
	rrca			;b666	0f 	. 
	ld h,b			;b667	60 	` 
	ex af,af'			;b668	08 	. 
	add a,b			;b669	80 	. 
	ld a,080h		;b66a	3e 80 	> . 
	dec (hl)			;b66c	35 	5 
	nop			;b66d	00 	. 
	ld a,a			;b66e	7f 	 
	nop			;b66f	00 	. 
	ld a,a			;b670	7f 	 
	nop			;b671	00 	. 
	halt			;b672	76 	v 
	nop			;b673	00 	. 
	ld l,a			;b674	6f 	o 
	nop			;b675	00 	. 
	ld l,(hl)			;b676	6e 	n 
	nop			;b677	00 	. 
	defb 0edh;next byte illegal after ed		;b678	ed 	. 
	ex af,af'			;b679	08 	. 
	rrca			;b67a	0f 	. 
	and b			;b67b	a0 	. 
	rra			;b67c	1f 	. 
	ld b,b			;b67d	40 	@ 
	rra			;b67e	1f 	. 
	ld b,b			;b67f	40 	@ 
	rra			;b680	1f 	. 
	ld b,b			;b681	40 	@ 
	rrca			;b682	0f 	. 
	and b			;b683	a0 	. 
	rlca			;b684	07 	. 
	ld d,b			;b685	50 	P 
	nop			;b686	00 	. 
	xor b			;b687	a8 	. 
	nop			;b688	00 	. 
	rst 10h			;b689	d7 	. 
	ex af,af'			;b68a	08 	. 
	ret m			;b68b	f8 	. 
	ld bc,006f1h		;b68c	01 f1 06 	. . . 
	jp po,0c508h		;b68f	e2 08 c5 	. . . 
	djnz $-116		;b692	10 8a 	. . 
	jr nz,$+22		;b694	20 14 	  . 
	ld b,b			;b696	40 	@ 
	ld hl,(05441h)		;b697	2a 41 54 	* A T 
	ld b,l			;b69a	45 	E 
	ex af,af'			;b69b	08 	. 
	rra			;b69c	1f 	. 
	ret nz			;b69d	c0 	. 
	rra			;b69e	1f 	. 
	ld b,b			;b69f	40 	@ 
	rra			;b6a0	1f 	. 
	ld b,b			;b6a1	40 	@ 
	ccf			;b6a2	3f 	? 
	add a,b			;b6a3	80 	. 
	ccf			;b6a4	3f 	? 
	add a,b			;b6a5	80 	. 
	ccf			;b6a6	3f 	? 
	add a,b			;b6a7	80 	. 
	ld a,a			;b6a8	7f 	 
	nop			;b6a9	00 	. 
	ld a,a			;b6aa	7f 	 
	nop			;b6ab	00 	. 
	ex af,af'			;b6ac	08 	. 
	cp 000h		;b6ad	fe 00 	. . 
	call m,0fc01h		;b6af	fc 01 fc 	. . . 
	ld bc,003f8h		;b6b2	01 f8 03 	. . . 
	ret p			;b6b5	f0 	. 
	ld b,0e0h		;b6b6	06 e0 	. . 
	ld c,0e0h		;b6b8	0e e0 	. . 
	rrca			;b6ba	0f 	. 
	ret po			;b6bb	e0 	. 
	add hl,bc			;b6bc	09 	. 
	ex af,af'			;b6bd	08 	. 
	and b			;b6be	a0 	. 
	add a,c			;b6bf	81 	. 
	ld b,b			;b6c0	40 	@ 
	rrca			;b6c1	0f 	. 
	add a,b			;b6c2	80 	. 
	rla			;b6c3	17 	. 
	ld b,b			;b6c4	40 	@ 
	ld a,000h		;b6c5	3e 00 	> . 
	cp (hl)			;b6c7	be 	. 
	nop			;b6c8	00 	. 
	ld e,a			;b6c9	5f 	_ 
	nop			;b6ca	00 	. 
	rst 18h			;b6cb	df 	. 
	nop			;b6cc	00 	. 
	rst 20h			;b6cd	e7 	. 
	ex af,af'			;b6ce	08 	. 
	rst 38h			;b6cf	ff 	. 
	nop			;b6d0	00 	. 
	rst 38h			;b6d1	ff 	. 
	nop			;b6d2	00 	. 
	rst 38h			;b6d3	ff 	. 
	nop			;b6d4	00 	. 
	rst 38h			;b6d5	ff 	. 
	nop			;b6d6	00 	. 
	rst 38h			;b6d7	ff 	. 
	nop			;b6d8	00 	. 
	ld bc,00000h		;b6d9	01 00 00 	. . . 
	cp 000h		;b6dc	fe 00 	. . 
	ld bc,0ff08h		;b6de	01 08 ff 	. . . 
	nop			;b6e1	00 	. 
	rst 38h			;b6e2	ff 	. 
	nop			;b6e3	00 	. 
	rst 38h			;b6e4	ff 	. 
	nop			;b6e5	00 	. 
	rst 38h			;b6e6	ff 	. 
	nop			;b6e7	00 	. 
	call m,0f800h		;b6e8	fc 00 f8 	. . . 
	inc bc			;b6eb	03 	. 
	ret m			;b6ec	f8 	. 
	ld bc,002f8h		;b6ed	01 f8 02 	. . . 
	ex af,af'			;b6f0	08 	. 
	ret p			;b6f1	f0 	. 
	rlca			;b6f2	07 	. 
	ret p			;b6f3	f0 	. 
	rlca			;b6f4	07 	. 
	ret po			;b6f5	e0 	. 
	rrca			;b6f6	0f 	. 
	ret po			;b6f7	e0 	. 
	rrca			;b6f8	0f 	. 
	ret nz			;b6f9	c0 	. 
	rra			;b6fa	1f 	. 
	ret nz			;b6fb	c0 	. 
	ld e,0c0h		;b6fc	1e c0 	. . 
	ld e,0c0h		;b6fe	1e c0 	. . 
	ld e,008h		;b700	1e 08 	. . 
	nop			;b702	00 	. 
	sbc a,e			;b703	9b 	. 
	nop			;b704	00 	. 
	rst 0			;b705	c7 	. 
	djnz $-120		;b706	10 86 	. . 
	ld b,b			;b708	40 	@ 
	inc c			;b709	0c 	. 
	nop			;b70a	00 	. 
	inc l			;b70b	2c 	, 
	nop			;b70c	00 	. 
	ld e,h			;b70d	5c 	\ 
	add a,b			;b70e	80 	. 
	ld e,d			;b70f	5a 	Z 
	nop			;b710	00 	. 
	ld e,d			;b711	5a 	Z 
	ex af,af'			;b712	08 	. 
	nop			;b713	00 	. 
	ld l,a			;b714	6f 	o 
	nop			;b715	00 	. 
	ld (hl),a			;b716	77 	w 
	nop			;b717	00 	. 
	ei			;b718	fb 	. 
	nop			;b719	00 	. 
	defb 0fdh,000h,03dh	;illegal sequence		;b71a	fd 00 3d 	. . = 
	add a,b			;b71d	80 	. 
	add hl,de			;b71e	19 	. 
	nop			;b71f	00 	. 
	dec d			;b720	15 	. 
	add a,b			;b721	80 	. 
	dec l			;b722	2d 	- 
	ld a,(bc)			;b723	0a 	. 
	inc bc			;b724	03 	. 
	cp b			;b725	b8 	. 
	inc bc			;b726	03 	. 
	ret c			;b727	d8 	. 
	ld bc,000ech		;b728	01 ec 00 	. . . 
	and 000h		;b72b	e6 00 	. . 
	or 001h		;b72d	f6 01 	. . 
	ret p			;b72f	f0 	. 
	rlca			;b730	07 	. 
	ret p			;b731	f0 	. 
	rlca			;b732	07 	. 
	ret p			;b733	f0 	. 
	ex af,af'			;b734	08 	. 
	ret nz			;b735	c0 	. 
	ld e,0e0h		;b736	1e e0 	. . 
	rrca			;b738	0f 	. 
	ret po			;b739	e0 	. 
	rrca			;b73a	0f 	. 
	ret p			;b73b	f0 	. 
	rlca			;b73c	07 	. 
	ret p			;b73d	f0 	. 
	rlca			;b73e	07 	. 
	ret m			;b73f	f8 	. 
	inc bc			;b740	03 	. 
	call m,0fe01h		;b741	fc 01 fe 	. . . 
	nop			;b744	00 	. 
	ex af,af'			;b745	08 	. 
	ld bc,00264h		;b746	01 64 02 	. d . 
	jr c,$+71		;b749	38 45 	8 E 
	nop			;b74b	00 	. 
	nop			;b74c	00 	. 
	add a,b			;b74d	80 	. 
	nop			;b74e	00 	. 
	rst 38h			;b74f	ff 	. 
	nop			;b750	00 	. 
	rst 38h			;b751	ff 	. 
	nop			;b752	00 	. 
	rst 38h			;b753	ff 	. 
	nop			;b754	00 	. 
	ld a,a			;b755	7f 	 
	ex af,af'			;b756	08 	. 
	nop			;b757	00 	. 
	inc a			;b758	3c 	< 
	add a,d			;b759	82 	. 
	jr c,$+5		;b75a	38 03 	8 . 
	ld a,b			;b75c	78 	x 
	rlca			;b75d	07 	. 
	ret p			;b75e	f0 	. 
	rlca			;b75f	07 	. 
	ret p			;b760	f0 	. 
	rrca			;b761	0f 	. 
	ret po			;b762	e0 	. 
	rra			;b763	1f 	. 
	ret nz			;b764	c0 	. 
	ccf			;b765	3f 	? 
	nop			;b766	00 	. 
	ex af,af'			;b767	08 	. 
	nop			;b768	00 	. 
	ld d,l			;b769	55 	U 
	nop			;b76a	00 	. 
	rst 38h			;b76b	ff 	. 
	nop			;b76c	00 	. 
	ld a,(hl)			;b76d	7e 	~ 
	nop			;b76e	00 	. 
	ld a,a			;b76f	7f 	 
	add a,b			;b770	80 	. 
	ccf			;b771	3f 	? 
	ret nz			;b772	c0 	. 
	rra			;b773	1f 	. 
	ret po			;b774	e0 	. 
	rrca			;b775	0f 	. 
	ret p			;b776	f0 	. 
	inc bc			;b777	03 	. 
	ex af,af'			;b778	08 	. 
	nop			;b779	00 	. 
	ld d,a			;b77a	57 	W 
	nop			;b77b	00 	. 
	ld sp,hl			;b77c	f9 	. 
	and b			;b77d	a0 	. 
	inc bc			;b77e	03 	. 
	nop			;b77f	00 	. 
	rrca			;b780	0f 	. 
	nop			;b781	00 	. 
	rst 38h			;b782	ff 	. 
	nop			;b783	00 	. 
	rst 38h			;b784	ff 	. 
	nop			;b785	00 	. 
	rst 38h			;b786	ff 	. 
	nop			;b787	00 	. 
	call m,00708h		;b788	fc 08 07 	. . . 
	ret p			;b78b	f0 	. 
	rrca			;b78c	0f 	. 
	ret po			;b78d	e0 	. 
	rrca			;b78e	0f 	. 
	ret po			;b78f	e0 	. 
	rra			;b790	1f 	. 
	ret nz			;b791	c0 	. 
	rra			;b792	1f 	. 
	ret nz			;b793	c0 	. 
	ccf			;b794	3f 	? 
	add a,b			;b795	80 	. 
	ld a,a			;b796	7f 	 
	nop			;b797	00 	. 
	rst 38h			;b798	ff 	. 
	nop			;b799	00 	. 
	ex af,af'			;b79a	08 	. 
	ld a,a			;b79b	7f 	 
	nop			;b79c	00 	. 
	ccf			;b79d	3f 	? 
	add a,b			;b79e	80 	. 
	rlca			;b79f	07 	. 
	ret po			;b7a0	e0 	. 
	nop			;b7a1	00 	. 
	ret m			;b7a2	f8 	. 
	nop			;b7a3	00 	. 
	rst 38h			;b7a4	ff 	. 
	nop			;b7a5	00 	. 
	rst 38h			;b7a6	ff 	. 
	nop			;b7a7	00 	. 
	rst 38h			;b7a8	ff 	. 
	nop			;b7a9	00 	. 
	rst 38h			;b7aa	ff 	. 
	ex af,af'			;b7ab	08 	. 
	rst 38h			;b7ac	ff 	. 
	nop			;b7ad	00 	. 
	rst 38h			;b7ae	ff 	. 
	nop			;b7af	00 	. 
	rst 38h			;b7b0	ff 	. 
	nop			;b7b1	00 	. 
	rst 38h			;b7b2	ff 	. 
	nop			;b7b3	00 	. 
	rlca			;b7b4	07 	. 
	nop			;b7b5	00 	. 
	nop			;b7b6	00 	. 
	ret m			;b7b7	f8 	. 
	nop			;b7b8	00 	. 
	rst 38h			;b7b9	ff 	. 
	nop			;b7ba	00 	. 
	rst 38h			;b7bb	ff 	. 
	ex af,af'			;b7bc	08 	. 
	rst 38h			;b7bd	ff 	. 
	nop			;b7be	00 	. 
	rst 38h			;b7bf	ff 	. 
	nop			;b7c0	00 	. 
	rst 38h			;b7c1	ff 	. 
	nop			;b7c2	00 	. 
	rst 38h			;b7c3	ff 	. 
	nop			;b7c4	00 	. 
	rst 38h			;b7c5	ff 	. 
	nop			;b7c6	00 	. 
	rst 38h			;b7c7	ff 	. 
	nop			;b7c8	00 	. 
	inc bc			;b7c9	03 	. 
	nop			;b7ca	00 	. 
	nop			;b7cb	00 	. 
	call m,0ff08h		;b7cc	fc 08 ff 	. . . 
	nop			;b7cf	00 	. 
	rst 38h			;b7d0	ff 	. 
	nop			;b7d1	00 	. 
	rst 38h			;b7d2	ff 	. 
	nop			;b7d3	00 	. 
	rst 38h			;b7d4	ff 	. 
	nop			;b7d5	00 	. 
	rst 38h			;b7d6	ff 	. 
	nop			;b7d7	00 	. 
	call m,0e000h		;b7d8	fc 00 e0 	. . . 
	inc bc			;b7db	03 	. 
	nop			;b7dc	00 	. 
	inc e			;b7dd	1c 	. 
	ex af,af'			;b7de	08 	. 
	rst 38h			;b7df	ff 	. 
	nop			;b7e0	00 	. 
	nop			;b7e1	00 	. 
	rst 38h			;b7e2	ff 	. 
	nop			;b7e3	00 	. 
	rst 38h			;b7e4	ff 	. 
	nop			;b7e5	00 	. 
	add a,b			;b7e6	80 	. 
	nop			;b7e7	00 	. 
	cp a			;b7e8	bf 	. 
	nop			;b7e9	00 	. 
	add a,c			;b7ea	81 	. 
	nop			;b7eb	00 	. 
	add a,b			;b7ec	80 	. 
	nop			;b7ed	00 	. 
	rst 38h			;b7ee	ff 	. 
	jr z,$-123		;b7ef	28 83 	( . 
	jr c,$-123		;b7f1	38 83 	8 . 
	jr c,$-123		;b7f3	38 83 	8 . 
	jr c,$-123		;b7f5	38 83 	8 . 
	jr c,$-123		;b7f7	38 83 	8 . 
	jr c,$-123		;b7f9	38 83 	8 . 
	jr c,$-123		;b7fb	38 83 	8 . 
	jr c,$-123		;b7fd	38 83 	8 . 
	jr c,$+34		;b7ff	38 20 	8   
	pop bc			;b801	c1 	. 
	inc e			;b802	1c 	. 
	pop bc			;b803	c1 	. 
	inc e			;b804	1c 	. 
	pop bc			;b805	c1 	. 
	inc e			;b806	1c 	. 
	pop bc			;b807	c1 	. 
	inc e			;b808	1c 	. 
	pop bc			;b809	c1 	. 
	inc e			;b80a	1c 	. 
	pop bc			;b80b	c1 	. 
	inc e			;b80c	1c 	. 
	pop bc			;b80d	c1 	. 
	inc e			;b80e	1c 	. 
	pop bc			;b80f	c1 	. 
	inc e			;b810	1c 	. 
	jr nz,$-125		;b811	20 81 	  . 
	rst 38h			;b813	ff 	. 
	add a,c			;b814	81 	. 
	add a,c			;b815	81 	. 
	add a,c			;b816	81 	. 
	add a,c			;b817	81 	. 
	add a,c			;b818	81 	. 
	add a,c			;b819	81 	. 
	jr nc,$+1		;b81a	30 ff 	0 . 
	ret c			;b81c	d8 	. 
	xor b			;b81d	a8 	. 
	ret c			;b81e	d8 	. 
	rst 38h			;b81f	ff 	. 
	adc a,d			;b820	8a 	. 
	adc a,d			;b821	8a 	. 
	adc a,d			;b822	8a 	. 
	jr nc,$+1		;b823	30 ff 	0 . 
	nop			;b825	00 	. 
	nop			;b826	00 	. 
	nop			;b827	00 	. 
	rst 38h			;b828	ff 	. 
	xor d			;b829	aa 	. 
	xor d			;b82a	aa 	. 
	xor d			;b82b	aa 	. 
	jr nc,$+1		;b82c	30 ff 	0 . 
	dec d			;b82e	15 	. 
	dec de			;b82f	1b 	. 
	dec d			;b830	15 	. 
	rst 38h			;b831	ff 	. 
	or c			;b832	b1 	. 
	or c			;b833	b1 	. 
	or c			;b834	b1 	. 
	jr nc,$-116		;b835	30 8a 	0 . 
	adc a,d			;b837	8a 	. 
	adc a,a			;b838	8f 	. 
	xor b			;b839	a8 	. 
	xor b			;b83a	a8 	. 
	adc a,b			;b83b	88 	. 
	adc a,a			;b83c	8f 	. 
	adc a,d			;b83d	8a 	. 
	jr nc,$-84		;b83e	30 aa 	0 . 
	xor d			;b840	aa 	. 
	rst 38h			;b841	ff 	. 
	nop			;b842	00 	. 
	nop			;b843	00 	. 
	nop			;b844	00 	. 
	rst 38h			;b845	ff 	. 
	xor d			;b846	aa 	. 
	jr nc,$-77		;b847	30 b1 	0 . 
	or c			;b849	b1 	. 
	pop af			;b84a	f1 	. 
	dec d			;b84b	15 	. 
	dec d			;b84c	15 	. 
	ld de,0b1f1h		;b84d	11 f1 b1 	. . . 
	jr nc,$-116		;b850	30 8a 	0 . 
	adc a,d			;b852	8a 	. 
	adc a,d			;b853	8a 	. 
	adc a,a			;b854	8f 	. 
	xor b			;b855	a8 	. 
	xor b			;b856	a8 	. 
	adc a,b			;b857	88 	. 
	rst 38h			;b858	ff 	. 
	jr nc,$-84		;b859	30 aa 	0 . 
	xor d			;b85b	aa 	. 
	xor d			;b85c	aa 	. 
	rst 38h			;b85d	ff 	. 
	nop			;b85e	00 	. 
	nop			;b85f	00 	. 
	nop			;b860	00 	. 
	rst 38h			;b861	ff 	. 
	jr nc,$-77		;b862	30 b1 	0 . 
	or c			;b864	b1 	. 
	or c			;b865	b1 	. 
	pop af			;b866	f1 	. 
	dec d			;b867	15 	. 
	dec d			;b868	15 	. 
	ld de,030ffh		;b869	11 ff 30 	. . 0 
	nop			;b86c	00 	. 
	nop			;b86d	00 	. 
	nop			;b86e	00 	. 
	nop			;b86f	00 	. 
	nop			;b870	00 	. 
	nop			;b871	00 	. 
	nop			;b872	00 	. 
	nop			;b873	00 	. 
	jr nz,$+0		;b874	20 fe 	  . 
	cp 0ffh		;b876	fe ff 	. . 
	rst 38h			;b878	ff 	. 
	cp 0f8h		;b879	fe f8 	. . 
	cp 0fch		;b87b	fe fc 	. . 
	inc c			;b87d	0c 	. 
	exx			;b87e	d9 	. 
	xor d			;b87f	aa 	. 
	ld d,l			;b880	55 	U 
	xor d			;b881	aa 	. 
	exx			;b882	d9 	. 
	xor d			;b883	aa 	. 
	exx			;b884	d9 	. 
	jp m,00020h		;b885	fa 20 00 	.   . 
	nop			;b888	00 	. 
	nop			;b889	00 	. 
	add a,b			;b88a	80 	. 
	ld d,b			;b88b	50 	P 
	ret pe			;b88c	e8 	. 
	push af			;b88d	f5 	. 
	jp pe,00020h		;b88e	ea 20 00 	.   . 
	nop			;b891	00 	. 
	nop			;b892	00 	. 
	nop			;b893	00 	. 
	nop			;b894	00 	. 
	nop			;b895	00 	. 
	ld bc,0203eh		;b896	01 3e 20 	. >   
	cp 0feh		;b899	fe fe 	. . 
	call m,0fefeh		;b89b	fc fe fe 	. . . 
	ret m			;b89e	f8 	. 
	call m,00cc0h		;b89f	fc c0 0c 	. . . 
	rst 20h			;b8a2	e7 	. 
	pop af			;b8a3	f1 	. 
	ld a,a			;b8a4	7f 	 
	ccf			;b8a5	3f 	? 
	nop			;b8a6	00 	. 
	nop			;b8a7	00 	. 
	nop			;b8a8	00 	. 
	nop			;b8a9	00 	. 
	ld a,(bc)			;b8aa	0a 	. 
	rst 20h			;b8ab	e7 	. 
	rst 38h			;b8ac	ff 	. 
	rst 38h			;b8ad	ff 	. 
	rst 38h			;b8ae	ff 	. 
	nop			;b8af	00 	. 
	nop			;b8b0	00 	. 
	nop			;b8b1	00 	. 
	nop			;b8b2	00 	. 
	ld a,(bc)			;b8b3	0a 	. 
	pop af			;b8b4	f1 	. 
	rst 38h			;b8b5	ff 	. 
	rst 38h			;b8b6	ff 	. 
	call m,00000h		;b8b7	fc 00 00 	. . . 
	nop			;b8ba	00 	. 
	nop			;b8bb	00 	. 
	ld a,(bc)			;b8bc	0a 	. 
	nop			;b8bd	00 	. 
	nop			;b8be	00 	. 
	nop			;b8bf	00 	. 
	nop			;b8c0	00 	. 
	nop			;b8c1	00 	. 
	nop			;b8c2	00 	. 
	inc bc			;b8c3	03 	. 
	ld a,a			;b8c4	7f 	 
	ld c,000h		;b8c5	0e 00 	. . 
	nop			;b8c7	00 	. 
	nop			;b8c8	00 	. 
	nop			;b8c9	00 	. 
	nop			;b8ca	00 	. 
	rra			;b8cb	1f 	. 
	rst 38h			;b8cc	ff 	. 
	rst 38h			;b8cd	ff 	. 
	ld c,000h		;b8ce	0e 00 	. . 
	nop			;b8d0	00 	. 
	nop			;b8d1	00 	. 
	rlca			;b8d2	07 	. 
	rst 38h			;b8d3	ff 	. 
	rst 38h			;b8d4	ff 	. 
	rst 38h			;b8d5	ff 	. 
	rst 38h			;b8d6	ff 	. 
	ld c,000h		;b8d7	0e 00 	. . 
	nop			;b8d9	00 	. 
	rra			;b8da	1f 	. 
	rst 38h			;b8db	ff 	. 
	rst 38h			;b8dc	ff 	. 
	rst 38h			;b8dd	ff 	. 
	rst 38h			;b8de	ff 	. 
	rst 38h			;b8df	ff 	. 
	ld c,001h		;b8e0	0e 01 	. . 
	ld a,a			;b8e2	7f 	 
	rst 38h			;b8e3	ff 	. 
	rst 38h			;b8e4	ff 	. 
	rst 38h			;b8e5	ff 	. 
	rst 38h			;b8e6	ff 	. 
	rst 38h			;b8e7	ff 	. 
	rst 38h			;b8e8	ff 	. 
	ld c,0f8h		;b8e9	0e f8 	. . 
	call m,0fefeh		;b8eb	fc fe fe 	. . . 
	rst 38h			;b8ee	ff 	. 
	rst 38h			;b8ef	ff 	. 
	rst 38h			;b8f0	ff 	. 
	ret nz			;b8f1	c0 	. 
	ld c,000h		;b8f2	0e 00 	. . 
	nop			;b8f4	00 	. 
	nop			;b8f5	00 	. 
	nop			;b8f6	00 	. 
	nop			;b8f7	00 	. 
	rra			;b8f8	1f 	. 
	ld a,a			;b8f9	7f 	 
	rst 38h			;b8fa	ff 	. 
	ld c,000h		;b8fb	0e 00 	. . 
	nop			;b8fd	00 	. 
	nop			;b8fe	00 	. 
	rlca			;b8ff	07 	. 
	rst 38h			;b900	ff 	. 
	rst 38h			;b901	ff 	. 
	rst 38h			;b902	ff 	. 
	add a,b			;b903	80 	. 
	ld c,000h		;b904	0e 00 	. . 
	ld bc,0ff3fh		;b906	01 3f ff 	. ? . 
	rst 38h			;b909	ff 	. 
	rst 38h			;b90a	ff 	. 
	add a,b			;b90b	80 	. 
	ld a,a			;b90c	7f 	 
	ld c,00fh		;b90d	0e 0f 	. . 
	rst 38h			;b90f	ff 	. 
	rst 38h			;b910	ff 	. 
	rst 38h			;b911	ff 	. 
	rst 38h			;b912	ff 	. 
	add a,b			;b913	80 	. 
	ld d,l			;b914	55 	U 
	rst 38h			;b915	ff 	. 
	ld b,0ffh		;b916	06 ff 	. . 
	rst 38h			;b918	ff 	. 
	rst 38h			;b919	ff 	. 
	rst 38h			;b91a	ff 	. 
	ret nz			;b91b	c0 	. 
	xor d			;b91c	aa 	. 
	ld d,l			;b91d	55 	U 
	rst 38h			;b91e	ff 	. 
	ld b,0ffh		;b91f	06 ff 	. . 
	rst 38h			;b921	ff 	. 
	rst 38h			;b922	ff 	. 
	ret po			;b923	e0 	. 
	dec d			;b924	15 	. 
	xor d			;b925	aa 	. 
	ld d,a			;b926	57 	W 
	rst 38h			;b927	ff 	. 
	ld b,0ffh		;b928	06 ff 	. . 
	rst 38h			;b92a	ff 	. 
	ret p			;b92b	f0 	. 
	ld a,(bc)			;b92c	0a 	. 
	ld d,l			;b92d	55 	U 
	xor d			;b92e	aa 	. 
	rst 38h			;b92f	ff 	. 
	rst 38h			;b930	ff 	. 
	ld b,0ffh		;b931	06 ff 	. . 
	ret po			;b933	e0 	. 
	dec d			;b934	15 	. 
	xor d			;b935	aa 	. 
	ld d,l			;b936	55 	U 
	xor d			;b937	aa 	. 
	rst 38h			;b938	ff 	. 
	rst 38h			;b939	ff 	. 
	ld b,0e4h		;b93a	06 e4 	. . 
	inc c			;b93c	0c 	. 
	ld d,h			;b93d	54 	T 
	xor h			;b93e	ac 	. 
	ld d,(hl)			;b93f	56 	V 
	cp (hl)			;b940	be 	. 
	rst 38h			;b941	ff 	. 
	rst 38h			;b942	ff 	. 
	ld b,070h		;b943	06 70 	. p 
	rrca			;b945	0f 	. 
	ld bc,00000h		;b946	01 00 00 	. . . 
	nop			;b949	00 	. 
	nop			;b94a	00 	. 
	nop			;b94b	00 	. 
	ld c,000h		;b94c	0e 00 	. . 
	rst 38h			;b94e	ff 	. 
	ret p			;b94f	f0 	. 
	rrca			;b950	0f 	. 
	nop			;b951	00 	. 
	nop			;b952	00 	. 
	nop			;b953	00 	. 
	nop			;b954	00 	. 
	ld c,000h		;b955	0e 00 	. . 
	rst 38h			;b957	ff 	. 
	dec b			;b958	05 	. 
	rst 38h			;b959	ff 	. 
	ccf			;b95a	3f 	? 
	nop			;b95b	00 	. 
	nop			;b95c	00 	. 
	nop			;b95d	00 	. 
	ld c,000h		;b95e	0e 00 	. . 
	rst 38h			;b960	ff 	. 
	ld d,l			;b961	55 	U 
	rst 38h			;b962	ff 	. 
	rst 38h			;b963	ff 	. 
	rst 38h			;b964	ff 	. 
	inc bc			;b965	03 	. 
	nop			;b966	00 	. 
	ld c,000h		;b967	0e 00 	. . 
	cp a			;b969	bf 	. 
	dec b			;b96a	05 	. 
	ld hl,(06f6fh)		;b96b	2a 6f 6f 	* o o 
	ld d,a			;b96e	57 	W 
	nop			;b96f	00 	. 
	ld c,000h		;b970	0e 00 	. . 
	rst 38h			;b972	ff 	. 
	ld d,l			;b973	55 	U 
	xor d			;b974	aa 	. 
	push de			;b975	d5 	. 
	rst 38h			;b976	ff 	. 
	rst 38h			;b977	ff 	. 
	rst 38h			;b978	ff 	. 
	ld b,000h		;b979	06 00 	. . 
	rst 38h			;b97b	ff 	. 
	ld d,l			;b97c	55 	U 
	xor d			;b97d	aa 	. 
	ld d,l			;b97e	55 	U 
	jp m,0ffffh		;b97f	fa ff ff 	. . . 
	ld b,000h		;b982	06 00 	. . 
	rst 38h			;b984	ff 	. 
	ld d,l			;b985	55 	U 
	xor d			;b986	aa 	. 
	ld d,(hl)			;b987	56 	V 
	xor h			;b988	ac 	. 
	call p,006feh		;b989	f4 fe 06 	. . . 
	nop			;b98c	00 	. 
	rst 38h			;b98d	ff 	. 
	nop			;b98e	00 	. 
	nop			;b98f	00 	. 
	nop			;b990	00 	. 
	nop			;b991	00 	. 
	nop			;b992	00 	. 
	nop			;b993	00 	. 
	ld c,040h		;b994	0e 40 	. @ 
	ret po			;b996	e0 	. 
	nop			;b997	00 	. 
	nop			;b998	00 	. 
	nop			;b999	00 	. 
	nop			;b99a	00 	. 
	nop			;b99b	00 	. 
	nop			;b99c	00 	. 
	ld c,004h		;b99d	0e 04 	. . 
	ex af,af'			;b99f	08 	. 
	ex af,af'			;b9a0	08 	. 
	ld de,02131h		;b9a1	11 31 21 	. 1 ! 
	ld (008b5h),hl		;b9a4	22 b5 08 	" . . 
	xor b			;b9a7	a8 	. 
	xor b			;b9a8	a8 	. 
	and h			;b9a9	a4 	. 
	inc d			;b9aa	14 	. 
	inc d			;b9ab	14 	. 
	ld (de),a			;b9ac	12 	. 
	dec b			;b9ad	05 	. 
	defb 0ddh,008h,0ffh	;illegal sequence		;b9ae	dd 08 ff 	. . . 
	ld bc,00000h		;b9b1	01 00 00 	. . . 
	nop			;b9b4	00 	. 
	nop			;b9b5	00 	. 
	nop			;b9b6	00 	. 
	nop			;b9b7	00 	. 
	ld c,0ffh		;b9b8	0e ff 	. . 
	rst 38h			;b9ba	ff 	. 
	nop			;b9bb	00 	. 
	nop			;b9bc	00 	. 
	nop			;b9bd	00 	. 
	nop			;b9be	00 	. 
	nop			;b9bf	00 	. 
	nop			;b9c0	00 	. 
	ld c,0ffh		;b9c1	0e ff 	. . 
	nop			;b9c3	00 	. 
	ld c,d			;b9c4	4a 	J 
	ld d,l			;b9c5	55 	U 
	ld c,d			;b9c6	4a 	J 
	ld d,l			;b9c7	55 	U 
	ld c,d			;b9c8	4a 	J 
	rst 38h			;b9c9	ff 	. 
	dec b			;b9ca	05 	. 
	rst 38h			;b9cb	ff 	. 
	ld b,0beh		;b9cc	06 be 	. . 
	ld e,(hl)			;b9ce	5e 	^ 
	cp (hl)			;b9cf	be 	. 
	ld e,(hl)			;b9d0	5e 	^ 
	cp (hl)			;b9d1	be 	. 
	rst 38h			;b9d2	ff 	. 
	rrca			;b9d3	0f 	. 
	nop			;b9d4	00 	. 
	ld d,l			;b9d5	55 	U 
	ld c,d			;b9d6	4a 	J 
	ld d,l			;b9d7	55 	U 
	ld c,d			;b9d8	4a 	J 
	ld d,l			;b9d9	55 	U 
	rst 38h			;b9da	ff 	. 
	nop			;b9db	00 	. 
	dec b			;b9dc	05 	. 
	ld b,05eh		;b9dd	06 5e 	. ^ 
	cp (hl)			;b9df	be 	. 
	ld e,(hl)			;b9e0	5e 	^ 
	cp (hl)			;b9e1	be 	. 
	ld e,(hl)			;b9e2	5e 	^ 
	rst 38h			;b9e3	ff 	. 
	ld b,00fh		;b9e4	06 0f 	. . 
	ld c,d			;b9e6	4a 	J 
	ld d,l			;b9e7	55 	U 
	ld c,d			;b9e8	4a 	J 
	ld d,l			;b9e9	55 	U 
	ld c,d			;b9ea	4a 	J 
	rst 38h			;b9eb	ff 	. 
	nop			;b9ec	00 	. 
	ld d,l			;b9ed	55 	U 
	dec b			;b9ee	05 	. 
	cp (hl)			;b9ef	be 	. 
	ld e,(hl)			;b9f0	5e 	^ 
	cp (hl)			;b9f1	be 	. 
	ld e,(hl)			;b9f2	5e 	^ 
	cp (hl)			;b9f3	be 	. 
	rst 38h			;b9f4	ff 	. 
	ld b,05eh		;b9f5	06 5e 	. ^ 
	rrca			;b9f7	0f 	. 
	dec bc			;b9f8	0b 	. 
	rrca			;b9f9	0f 	. 
	rlca			;b9fa	07 	. 
	inc bc			;b9fb	03 	. 
	call m,0fdfdh		;b9fc	fc fd fd 	. . . 
	ld a,e			;b9ff	7b 	{ 
	ld a,(bc)			;ba00	0a 	. 
	ret m			;ba01	f8 	. 
	cp 0ffh		;ba02	fe ff 	. . 
	rst 38h			;ba04	ff 	. 
	rst 38h			;ba05	ff 	. 
	ld a,a			;ba06	7f 	 
	cp (hl)			;ba07	be 	. 
	sbc a,a			;ba08	9f 	. 
	ld a,(bc)			;ba09	0a 	. 
	nop			;ba0a	00 	. 
	nop			;ba0b	00 	. 
	add a,b			;ba0c	80 	. 
	or 0f6h		;ba0d	f6 f6 	. . 
	push af			;ba0f	f5 	. 
	ld (hl),l			;ba10	75 	u 
	dec sp			;ba11	3b 	; 
	ld (bc),a			;ba12	02 	. 
	rst 8			;ba13	cf 	. 
	cp a			;ba14	bf 	. 
	ld a,a			;ba15	7f 	 
	ld a,a			;ba16	7f 	 
	ld a,b			;ba17	78 	x 
	cp l			;ba18	bd 	. 
	cp l			;ba19	bd 	. 
	cp (hl)			;ba1a	be 	. 
	ex af,af'			;ba1b	08 	. 
	rst 38h			;ba1c	ff 	. 
	rst 38h			;ba1d	ff 	. 
	rst 38h			;ba1e	ff 	. 
	add a,b			;ba1f	80 	. 
	nop			;ba20	00 	. 
	xor d			;ba21	aa 	. 
	push de			;ba22	d5 	. 
	xor d			;ba23	aa 	. 
	djnz $+65		;ba24	10 3f 	. ? 
	ld a,a			;ba26	7f 	 
	rst 38h			;ba27	ff 	. 
	defb 0fdh,0aah,055h	;illegal sequence		;ba28	fd aa 55 	. . U 
	xor h			;ba2b	ac 	. 
	nop			;ba2c	00 	. 
	ld (bc),a			;ba2d	02 	. 
	rst 38h			;ba2e	ff 	. 
	rst 38h			;ba2f	ff 	. 
	rst 38h			;ba30	ff 	. 
	ld a,a			;ba31	7f 	 
	cp a			;ba32	bf 	. 
	jp 00000h		;ba33	c3 00 00 	. . . 
	ld (bc),a			;ba36	02 	. 
	ret nz			;ba37	c0 	. 
	ret po			;ba38	e0 	. 
	ret pe			;ba39	e8 	. 
	ret pe			;ba3a	e8 	. 
	ret po			;ba3b	e0 	. 
	ret po			;ba3c	e0 	. 
	sub b			;ba3d	90 	. 
	ld d,b			;ba3e	50 	P 
	ld a,(bc)			;ba3f	0a 	. 
	rst 38h			;ba40	ff 	. 
	ccf			;ba41	3f 	? 
	rst 38h			;ba42	ff 	. 
	rra			;ba43	1f 	. 
	ld h,a			;ba44	67 	g 
	or c			;ba45	b1 	. 
	xor l			;ba46	ad 	. 
	xor b			;ba47	a8 	. 
	jr z,$-14		;ba48	28 f0 	( . 
	ret nz			;ba4a	c0 	. 
	add a,b			;ba4b	80 	. 
	nop			;ba4c	00 	. 
	nop			;ba4d	00 	. 
	xor d			;ba4e	aa 	. 
	push de			;ba4f	d5 	. 
	xor d			;ba50	aa 	. 
	djnz $+95		;ba51	10 5d 	. ] 
	ld c,b			;ba53	48 	H 
	xor h			;ba54	ac 	. 
	sub h			;ba55	94 	. 
	ld d,h			;ba56	54 	T 
	ld l,d			;ba57	6a 	j 
	xor d			;ba58	aa 	. 
	sbc a,028h		;ba59	de 28 	. ( 
	sbc a,l			;ba5b	9d 	. 
	sbc a,l			;ba5c	9d 	. 
	xor (hl)			;ba5d	ae 	. 
	xor (hl)			;ba5e	ae 	. 
	or a			;ba5f	b7 	. 
	rst 10h			;ba60	d7 	. 
	rst 8			;ba61	cf 	. 
	rst 28h			;ba62	ef 	. 
	ld (bc),a			;ba63	02 	. 
	ld e,a			;ba64	5f 	_ 
	ld e,(hl)			;ba65	5e 	^ 
	xor (hl)			;ba66	ae 	. 
	sub a			;ba67	97 	. 
	ld d,a			;ba68	57 	W 
	ld l,e			;ba69	6b 	k 
	and a			;ba6a	a7 	. 
	rst 8			;ba6b	cf 	. 
	jr z,$+2		;ba6c	28 00 	( . 
	call m,0ed47h		;ba6e	fc 47 ed 	. G . 
	and l			;ba71	a5 	. 
	xor c			;ba72	a9 	. 
	ld d,a			;ba73	57 	W 
	ld a,d			;ba74	7a 	z 
	jr z,$-45		;ba75	28 d1 	( . 
	cp b			;ba77	b8 	. 
	cp h			;ba78	bc 	. 
	cp 0c1h		;ba79	fe c1 	. . 
	cp 0c0h		;ba7b	fe c0 	. . 
	xor d			;ba7d	aa 	. 
	jr z,$-119		;ba7e	28 87 	( . 
	add a,a			;ba80	87 	. 
	ld b,e			;ba81	43 	C 
	inc a			;ba82	3c 	< 
	ret po			;ba83	e0 	. 
	nop			;ba84	00 	. 
	dec d			;ba85	15 	. 
	xor d			;ba86	aa 	. 
	jr z,$+2		;ba87	28 00 	( . 
	ld c,035h		;ba89	0e 35 	. 5 
	ld l,e			;ba8b	6b 	k 
	ld l,a			;ba8c	6f 	o 
	sbc a,035h		;ba8d	de 35 	. 5 
	cp d			;ba8f	ba 	. 
	inc d			;ba90	14 	. 
	nop			;ba91	00 	. 
	sub 06fh		;ba92	d6 6f 	. o 
	sbc a,06bh		;ba94	de 6b 	. k 
	cp d			;ba96	ba 	. 
	ld l,a			;ba97	6f 	o 
	ld l,e			;ba98	6b 	k 
	inc d			;ba99	14 	. 
	nop			;ba9a	00 	. 
	call nc,0debah		;ba9b	d4 ba de 	. . . 
	cp d			;ba9e	ba 	. 
	ld l,a			;ba9f	6f 	o 
	dec (hl)			;baa0	35 	5 
	sub 014h		;baa1	d6 14 	. . 
	rst 38h			;baa3	ff 	. 
	add a,b			;baa4	80 	. 
	add a,b			;baa5	80 	. 
	sbc a,a			;baa6	9f 	. 
	sbc a,b			;baa7	98 	. 
	sbc a,b			;baa8	98 	. 
	sbc a,b			;baa9	98 	. 
	sbc a,b			;baaa	98 	. 
	jr nc,$+1		;baab	30 ff 	0 . 
	nop			;baad	00 	. 
	nop			;baae	00 	. 
	rst 38h			;baaf	ff 	. 
	nop			;bab0	00 	. 
	nop			;bab1	00 	. 
	nop			;bab2	00 	. 
	nop			;bab3	00 	. 
	jr nc,$+1		;bab4	30 ff 	0 . 
	ld bc,0f901h		;bab6	01 01 f9 	. . . 
	add hl,bc			;bab9	09 	. 
	add hl,bc			;baba	09 	. 
	add hl,bc			;babb	09 	. 
	add hl,bc			;babc	09 	. 
	jr nc,$-102		;babd	30 98 	0 . 
	sbc a,b			;babf	98 	. 
	sbc a,a			;bac0	9f 	. 
	sbc a,a			;bac1	9f 	. 
	add a,b			;bac2	80 	. 
	add a,b			;bac3	80 	. 
	add a,b			;bac4	80 	. 
	rst 38h			;bac5	ff 	. 
	jr nc,$+2		;bac6	30 00 	0 . 
	nop			;bac8	00 	. 
	rst 38h			;bac9	ff 	. 
	rst 38h			;baca	ff 	. 
	nop			;bacb	00 	. 
	nop			;bacc	00 	. 
	nop			;bacd	00 	. 
	rst 38h			;bace	ff 	. 
	jr nc,$+11		;bacf	30 09 	0 . 
	add hl,bc			;bad1	09 	. 
	ld sp,hl			;bad2	f9 	. 
	ld sp,hl			;bad3	f9 	. 
	ld bc,00101h		;bad4	01 01 01 	. . . 
	rst 38h			;bad7	ff 	. 
	jr nc,$+1		;bad8	30 ff 	0 . 
	add a,b			;bada	80 	. 
	add a,b			;badb	80 	. 
	rst 38h			;badc	ff 	. 
	add a,b			;badd	80 	. 
	add a,b			;bade	80 	. 
	add a,b			;badf	80 	. 
	add a,b			;bae0	80 	. 
	jr z,$+1		;bae1	28 ff 	( . 
	nop			;bae3	00 	. 
	nop			;bae4	00 	. 
	rst 38h			;bae5	ff 	. 
	ld bc,00101h		;bae6	01 01 01 	. . . 
	ld bc,0ff28h		;bae9	01 28 ff 	. ( . 
	nop			;baec	00 	. 
	nop			;baed	00 	. 
	rst 38h			;baee	ff 	. 
	nop			;baef	00 	. 
	nop			;baf0	00 	. 
	nop			;baf1	00 	. 
	rst 38h			;baf2	ff 	. 
	jr z,$+1		;baf3	28 ff 	( . 
	nop			;baf5	00 	. 
	nop			;baf6	00 	. 
	rst 38h			;baf7	ff 	. 
	add a,b			;baf8	80 	. 
	add a,b			;baf9	80 	. 
	add a,b			;bafa	80 	. 
	add a,b			;bafb	80 	. 
	jr z,$+1		;bafc	28 ff 	( . 
	ld bc,0ff01h		;bafe	01 01 ff 	. . . 
	ld bc,00101h		;bb01	01 01 01 	. . . 
	ld bc,08028h		;bb04	01 28 80 	. ( . 
	add a,b			;bb07	80 	. 
	add a,b			;bb08	80 	. 
	add a,b			;bb09	80 	. 
	add a,b			;bb0a	80 	. 
	add a,b			;bb0b	80 	. 
	add a,b			;bb0c	80 	. 
	rst 38h			;bb0d	ff 	. 
	jr z,$+3		;bb0e	28 01 	( . 
	ld bc,00101h		;bb10	01 01 01 	. . . 
	ld bc,00101h		;bb13	01 01 01 	. . . 
	rst 38h			;bb16	ff 	. 
	jr z,$+1		;bb17	28 ff 	( . 
	adc a,b			;bb19	88 	. 
	xor a			;bb1a	af 	. 
	adc a,b			;bb1b	88 	. 
	adc a,a			;bb1c	8f 	. 
	xor b			;bb1d	a8 	. 
	adc a,a			;bb1e	8f 	. 
	rst 38h			;bb1f	ff 	. 
	jr nc,$+1		;bb20	30 ff 	0 . 
	ld de,011f5h		;bb22	11 f5 11 	. . . 
	pop af			;bb25	f1 	. 
	dec d			;bb26	15 	. 
	pop af			;bb27	f1 	. 
	rst 38h			;bb28	ff 	. 
	jr nc,$+1		;bb29	30 ff 	0 . 
	rst 38h			;bb2b	ff 	. 
	nop			;bb2c	00 	. 
	ld a,(hl)			;bb2d	7e 	~ 
	ld (bc),a			;bb2e	02 	. 
	ld (bc),a			;bb2f	02 	. 
	nop			;bb30	00 	. 
	rst 38h			;bb31	ff 	. 
	jr z,$+1		;bb32	28 ff 	( . 
	rst 38h			;bb34	ff 	. 
	ld bc,005fdh		;bb35	01 fd 05 	. . . 
	dec b			;bb38	05 	. 
	ld bc,028ffh		;bb39	01 ff 28 	. . ( 
	rst 38h			;bb3c	ff 	. 
	rst 38h			;bb3d	ff 	. 
	defb 0fdh,0ffh,0ffh	;illegal sequence		;bb3e	fd ff ff 	. . . 
	rst 38h			;bb41	ff 	. 
	rst 38h			;bb42	ff 	. 
	cp a			;bb43	bf 	. 
	ex af,af'			;bb44	08 	. 
	rla			;bb45	17 	. 
	dec hl			;bb46	2b 	+ 
	rla			;bb47	17 	. 
	dec hl			;bb48	2b 	+ 
	rla			;bb49	17 	. 
	dec hl			;bb4a	2b 	+ 
	rla			;bb4b	17 	. 
	dec hl			;bb4c	2b 	+ 
	ld b,l			;bb4d	45 	E 
	ld hl,088cah		;bb4e	21 ca 88 	! . . 
	jr $+10		;bb51	18 08 	. . 
	ld hl,088fbh		;bb53	21 fb 88 	! . . 
	jr $+5		;bb56	18 03 	. . 
	ld hl,088aah		;bb58	21 aa 88 	! . . 
	ld de,09ff4h		;bb5b	11 f4 9f 	. . . 
	ld a,0a4h		;bb5e	3e a4 	> . 
	ld (de),a			;bb60	12 	. 
	inc a			;bb61	3c 	< 
	ld (09ff5h),a		;bb62	32 f5 9f 	2 . . 
	inc a			;bb65	3c 	< 
	ld (09ffah),a		;bb66	32 fa 9f 	2 . . 
	inc a			;bb69	3c 	< 
	ld (09ffbh),a		;bb6a	32 fb 9f 	2 . . 
	inc a			;bb6d	3c 	< 
	ld (09ffeh),a		;bb6e	32 fe 9f 	2 . . 
	inc a			;bb71	3c 	< 
	ld (09ff8h),a		;bb72	32 f8 9f 	2 . . 
	jr $+13		;bb75	18 0b 	. . 
	ld a,001h		;bb77	3e 01 	> . 
	ld (0f8edh),a		;bb79	32 ed f8 	2 . . 
	ld hl,08818h		;bb7c	21 18 88 	! . . 
	ld de,09e81h		;bb7f	11 81 9e 	. . . 
	ld bc,00606h		;bb82	01 06 06 	. . . 
	jp 0bdd0h		;bb85	c3 d0 bd 	. . . 
	ld hl,087e5h		;bb88	21 e5 87 	! . . 
	jr $+15		;bb8b	18 0d 	. . 
	ld hl,087d7h		;bb8d	21 d7 87 	! . . 
	jr $+10		;bb90	18 08 	. . 
	ld hl,087dch		;bb92	21 dc 87 	! . . 
	jr $+5		;bb95	18 03 	. . 
	ld hl,087e7h		;bb97	21 e7 87 	! . . 
	ld a,(0efffh)		;bb9a	3a ff ef 	: . . 
	cp 00ch		;bb9d	fe 0c 	. . 
	jp nc,0bde1h		;bb9f	d2 e1 bd 	. . . 
	ld de,09e4bh		;bba2	11 4b 9e 	. K . 
	ld bc,00906h		;bba5	01 06 09 	. . . 
	jp 0bdd0h		;bba8	c3 d0 bd 	. . . 
	ld hl,088dch		;bbab	21 dc 88 	! . . 
	jr $+40		;bbae	18 26 	. & 
	ld hl,088e3h		;bbb0	21 e3 88 	! . . 
	jr $+35		;bbb3	18 21 	. ! 
	ld hl,08901h		;bbb5	21 01 89 	! . . 
	jr $+30		;bbb8	18 1c 	. . 
	ld hl,088f6h		;bbba	21 f6 88 	! . . 
	jr $+25		;bbbd	18 17 	. . 
	ld hl,08943h		;bbbf	21 43 89 	! C . 
	jr $+20		;bbc2	18 12 	. . 
	ld hl,0893bh		;bbc4	21 3b 89 	! ; . 
	jr $+15		;bbc7	18 0d 	. . 
	ld hl,08925h		;bbc9	21 25 89 	! % . 
	jr $+10		;bbcc	18 08 	. . 
	ld hl,08914h		;bbce	21 14 89 	! . . 
	jr $+5		;bbd1	18 03 	. . 
	ld hl,088fdh		;bbd3	21 fd 88 	! . . 
	ex de,hl			;bbd6	eb 	. 
	ld hl,00000h		;bbd7	21 00 00 	! . . 
	ld (09ffah),hl		;bbda	22 fa 9f 	" . . 
	ld (09ffeh),hl		;bbdd	22 fe 9f 	" . . 
	ex de,hl			;bbe0	eb 	. 
	ld de,09ffah		;bbe1	11 fa 9f 	. . . 
	jp 0bdcdh		;bbe4	c3 cd bd 	. . . 
	ld hl,0884ah		;bbe7	21 4a 88 	! J . 
	ld de,09fd0h		;bbea	11 d0 9f 	. . . 
	ld bc,00302h		;bbed	01 02 03 	. . . 
	jr $+117		;bbf0	18 73 	. s 
	ld hl,08b7eh		;bbf2	21 7e 8b 	! ~ . 
	jr $+5		;bbf5	18 03 	. . 
	ld hl,08b78h		;bbf7	21 78 8b 	! x . 
	ld de,0a02ch		;bbfa	11 2c a0 	. , . 
	jr $+89		;bbfd	18 57 	. W 
	ld hl,0885ch		;bbff	21 5c 88 	! \ . 
	jr $+20		;bc02	18 12 	. . 
	ld hl,088ceh		;bc04	21 ce 88 	! . . 
	jr $+27		;bc07	18 19 	. . 
	ld hl,088c2h		;bc09	21 c2 88 	! . . 
	jr $+10		;bc0c	18 08 	. . 
	ld hl,088b6h		;bc0e	21 b6 88 	! . . 
	jr $+17		;bc11	18 0f 	. . 
	ld hl,088a8h		;bc13	21 a8 88 	! . . 
	ld a,017h		;bc16	3e 17 	> . 
	jr $+12		;bc18	18 0a 	. . 
	ld hl,08869h		;bc1a	21 69 88 	! i . 
	jr $+5		;bc1d	18 03 	. . 
	ld hl,088b7h		;bc1f	21 b7 88 	! . . 
	ld a,05ch		;bc22	3e 5c 	> \ 
	ld (09f37h),a		;bc24	32 37 9f 	2 7 . 
	ld de,09f2ch		;bc27	11 2c 9f 	. , . 
	jp 0bdedh		;bc2a	c3 ed bd 	. . . 
	ld hl,0893eh		;bc2d	21 3e 89 	! > . 
	jr $+35		;bc30	18 21 	. ! 
	ld hl,08942h		;bc32	21 42 89 	! B . 
	jr $+30		;bc35	18 1c 	. . 
	ld hl,08945h		;bc37	21 45 89 	! E . 
	jr $+25		;bc3a	18 17 	. . 
	ld hl,08948h		;bc3c	21 48 89 	! H . 
	ld de,09fbbh		;bc3f	11 bb 9f 	. . . 
	ld b,005h		;bc42	06 05 	. . 
	jr $+20		;bc44	18 12 	. . 
	ld hl,0885ch		;bc46	21 5c 88 	! \ . 
	ld de,09fd6h		;bc49	11 d6 9f 	. . . 
	ld b,005h		;bc4c	06 05 	. . 
	jr $+10		;bc4e	18 08 	. . 
	ld hl,0891dh		;bc50	21 1d 89 	! . . 
	ld de,09fcah		;bc53	11 ca 9f 	. . . 
	ld b,002h		;bc56	06 02 	. . 
	ld c,003h		;bc58	0e 03 	. . 
	jr $+11		;bc5a	18 09 	. . 
	ld hl,088a1h		;bc5c	21 a1 88 	! . . 
	ld de,09f7ch		;bc5f	11 7c 9f 	. | . 
	ld bc,00709h		;bc62	01 09 07 	. . . 
	jp 0bdd0h		;bc65	c3 d0 bd 	. . . 
	ld hl,08aaeh		;bc68	21 ae 8a 	! . . 
	jr $+10		;bc6b	18 08 	. . 
	ld hl,08aa5h		;bc6d	21 a5 8a 	! . . 
	jr $+5		;bc70	18 03 	. . 
	ld hl,08a99h		;bc72	21 99 8a 	! . . 
	ld de,0a06ah		;bc75	11 6a a0 	. j . 
	ld bc,0050ah		;bc78	01 0a 05 	. . . 
	jr $-22		;bc7b	18 e8 	. . 
	ld hl,08896h		;bc7d	21 96 88 	! . . 
	jr $-33		;bc80	18 dd 	. . 
	ld hl,088abh		;bc82	21 ab 88 	! . . 
	jr $-38		;bc85	18 d8 	. . 
	ld hl,0efffh		;bc87	21 ff ef 	! . . 
	ld a,05ch		;bc8a	3e 5c 	> \ 
	sub (hl)			;bc8c	96 	. 
	ld (06711h),a		;bc8d	32 11 67 	2 . g 
	ld de,0670ah		;bc90	11 0a 67 	. . g 
	ld hl,08ae5h		;bc93	21 e5 8a 	! . . 
	ld b,009h		;bc96	06 09 	. . 
	call 0d2efh		;bc98	cd ef d2 	. . . 
	jp 0bde1h		;bc9b	c3 e1 bd 	. . . 
	ld de,069ffh		;bc9e	11 ff 69 	. . i 
	ld hl,08a5fh		;bca1	21 5f 8a 	! _ . 
	jr $-14		;bca4	18 f0 	. . 
	ld a,(0effeh)		;bca6	3a fe ef 	: . . 
	cp 006h		;bca9	fe 06 	. . 
	jp nz,0bde1h		;bcab	c2 e1 bd 	. . . 
	ld b,00ah		;bcae	06 0a 	. . 
	ld de,069ech		;bcb0	11 ec 69 	. . i 
	ld hl,08a54h		;bcb3	21 54 8a 	! T . 
	call 0d2efh		;bcb6	cd ef d2 	. . . 
	ld b,00ah		;bcb9	06 0a 	. . 
	ld de,069f6h		;bcbb	11 f6 69 	. . i 
	ld hl,08a74h		;bcbe	21 74 8a 	! t . 
	jr $-41		;bcc1	18 d5 	. . 
	ld de,09ee1h		;bcc3	11 e1 9e 	. . . 
	ld hl,088e0h		;bcc6	21 e0 88 	! . . 
	jr $-115		;bcc9	18 8b 	. . 
	ld de,09ee7h		;bccb	11 e7 9e 	. . . 
	ld hl,088e9h		;bcce	21 e9 88 	! . . 
	jr $-123		;bcd1	18 83 	. . 
	ld de,09eedh		;bcd3	11 ed 9e 	. . . 
	ld hl,08941h		;bcd6	21 41 89 	! A . 
	ld b,003h		;bcd9	06 03 	. . 
	jp 0bc58h		;bcdb	c3 58 bc 	. X . 
	ld de,09ef6h		;bcde	11 f6 9e 	. . . 
	ld hl,08947h		;bce1	21 47 89 	! G . 
	jr $-11		;bce4	18 f3 	. . 
	ld de,09f26h		;bce6	11 26 9f 	. & . 
	ld bc,00302h		;bce9	01 02 03 	. . . 
	jr $+29		;bcec	18 1b 	. . 
	ld de,09f17h		;bcee	11 17 9f 	. . . 
	ld bc,00503h		;bcf1	01 03 05 	. . . 
	jr $+21		;bcf4	18 13 	. . 
	ld de,09effh		;bcf6	11 ff 9e 	. . . 
	ld bc,00206h		;bcf9	01 06 02 	. . . 
	jr $+13		;bcfc	18 0b 	. . 
	ld de,09f0bh		;bcfe	11 0b 9f 	. . . 
	jr $-8		;bd01	18 f6 	. . 
	ld de,09e39h		;bd03	11 39 9e 	. 9 . 
	ld bc,00601h		;bd06	01 01 06 	. . . 
	pop hl			;bd09	e1 	. 
	ld a,(hl)			;bd0a	7e 	~ 
	inc hl			;bd0b	23 	# 
	push hl			;bd0c	e5 	. 
	ld h,(hl)			;bd0d	66 	f 
	ld l,a			;bd0e	6f 	o 
	ld a,020h		;bd0f	3e 20 	>   
	sub b			;bd11	90 	. 
	push bc			;bd12	c5 	. 
	ld c,b			;bd13	48 	H 
	ld b,000h		;bd14	06 00 	. . 
	ex de,hl			;bd16	eb 	. 
	ldir		;bd17	ed b0 	. . 
	ex de,hl			;bd19	eb 	. 
	ld c,a			;bd1a	4f 	O 
	add hl,bc			;bd1b	09 	. 
	pop bc			;bd1c	c1 	. 
	dec c			;bd1d	0d 	. 
	jr nz,$-12		;bd1e	20 f2 	  . 
	jp 0c146h		;bd20	c3 46 c1 	. F . 
	ld hl,08c05h		;bd23	21 05 8c 	! . . 
	ld bc,08c8ch		;bd26	01 8c 8c 	. . . 
	ld d,c			;bd29	51 	Q 
	ld e,c			;bd2a	59 	Y 
	jr $+69		;bd2b	18 43 	. C 
	call 0df18h		;bd2d	cd 18 df 	. . . 
	ld de,0a032h		;bd30	11 32 a0 	. 2 . 
	ld hl,08b88h		;bd33	21 88 8b 	! . . 
	jr $-93		;bd36	18 a1 	. . 
	ld a,012h		;bd38	3e 12 	> . 
	ld hl,087b4h		;bd3a	21 b4 87 	! . . 
	ld de,00f0eh		;bd3d	11 0e 0f 	. . . 
	ld b,010h		;bd40	06 10 	. . 
	ld (hl),e			;bd42	73 	s 
	inc l			;bd43	2c 	, 
	ld (hl),d			;bd44	72 	r 
	inc hl			;bd45	23 	# 
	djnz $-4		;bd46	10 fa 	. . 
	ld c,e			;bd48	4b 	K 
	ld e,d			;bd49	5a 	Z 
	ld d,c			;bd4a	51 	Q 
	dec a			;bd4b	3d 	= 
	jr nz,$-12		;bd4c	20 f2 	  . 
	jp 0bde1h		;bd4e	c3 e1 bd 	. . . 
	pop hl			;bd51	e1 	. 
	ld a,(hl)			;bd52	7e 	~ 
	push hl			;bd53	e5 	. 
	ld hl,087b4h		;bd54	21 b4 87 	! . . 
	ld b,024h		;bd57	06 24 	. $ 
	call 0d30eh		;bd59	cd 0e d3 	. . . 
	dec a			;bd5c	3d 	= 
	jp nz,0c146h		;bd5d	c2 46 c1 	. F . 
	pop hl			;bd60	e1 	. 
	inc hl			;bd61	23 	# 
	push hl			;bd62	e5 	. 
	ld hl,0880dh		;bd63	21 0d 88 	! . . 
	ld a,(hl)			;bd66	7e 	~ 
	dec a			;bd67	3d 	= 
	jr nz,$+121		;bd68	20 77 	  w 
	ld bc,01a1bh		;bd6a	01 1b 1a 	. . . 
	ld de,01c1dh		;bd6d	11 1d 1c 	. . . 
	ld a,01fh		;bd70	3e 1f 	> . 
	ld (hl),b			;bd72	70 	p 
	inc hl			;bd73	23 	# 
	ld (hl),c			;bd74	71 	q 
	add a,l			;bd75	85 	. 
	ld l,a			;bd76	6f 	o 
	jr nc,$+3		;bd77	30 01 	0 . 
	inc h			;bd79	24 	$ 
	ld (hl),d			;bd7a	72 	r 
	inc hl			;bd7b	23 	# 
	ld (hl),e			;bd7c	73 	s 
	jr $+100		;bd7d	18 62 	. b 
	ld hl,0894bh		;bd7f	21 4b 89 	! K . 
	jr $+60		;bd82	18 3a 	. : 
	ld hl,0892dh		;bd84	21 2d 89 	! - . 
	jr $+55		;bd87	18 35 	. 5 
	ld de,0a018h		;bd89	11 18 a0 	. . . 
	ld hl,08aa7h		;bd8c	21 a7 8a 	! . . 
	ld bc,00504h		;bd8f	01 04 05 	. . . 
	jr $+62		;bd92	18 3c 	. < 
	ld de,09e3fh		;bd94	11 3f 9e 	. ? . 
	ld hl,08844h		;bd97	21 44 88 	! D . 
	ld bc,00304h		;bd9a	01 04 03 	. . . 
	jr $+51		;bd9d	18 31 	. 1 
	ld hl,0881ah		;bd9f	21 1a 88 	! . . 
	ld de,09fe5h		;bda2	11 e5 9f 	. . . 
	ld bc,00305h		;bda5	01 05 03 	. . . 
	jr $+40		;bda8	18 26 	. & 
	ld a,0abh		;bdaa	3e ab 	> . 
	ld (08957h),a		;bdac	32 57 89 	2 W . 
	ld (08966h),a		;bdaf	32 66 89 	2 f . 
	dec a			;bdb2	3d 	= 
	ld (08977h),a		;bdb3	32 77 89 	2 w . 
	ld (08986h),a		;bdb6	32 86 89 	2 . . 
	jr $+40		;bdb9	18 26 	. & 
	ld hl,088b5h		;bdbb	21 b5 88 	! . . 
	ld de,09ffah		;bdbe	11 fa 9f 	. . . 
	ld bc,042c6h		;bdc1	01 c6 42 	. . B 
	ld (09ffah),bc		;bdc4	ed 43 fa 9f 	. C . . 
	ld a,043h		;bdc8	3e 43 	> C 
	ld (09ffeh),a		;bdca	32 fe 9f 	2 . . 
	ld bc,00605h		;bdcd	01 05 06 	. . . 
	ld a,020h		;bdd0	3e 20 	>   
	sub b			;bdd2	90 	. 
	push bc			;bdd3	c5 	. 
	ex de,hl			;bdd4	eb 	. 
	ld c,b			;bdd5	48 	H 
	ld b,000h		;bdd6	06 00 	. . 
	ldir		;bdd8	ed b0 	. . 
	ex de,hl			;bdda	eb 	. 
	ld c,a			;bddb	4f 	O 
	add hl,bc			;bddc	09 	. 
	pop bc			;bddd	c1 	. 
	dec c			;bdde	0d 	. 
	jr nz,$-12		;bddf	20 f2 	  . 
	pop hl			;bde1	e1 	. 
	dec hl			;bde2	2b 	+ 
	push hl			;bde3	e5 	. 
	jp 0c146h		;bde4	c3 46 c1 	. F . 
	ld de,09f54h		;bde7	11 54 9f 	. T . 
	ld hl,088c8h		;bdea	21 c8 88 	! . . 
	ld bc,00508h		;bded	01 08 05 	. . . 
	jr $-32		;bdf0	18 de 	. . 
	ld hl,08b3bh		;bdf2	21 3b 8b 	! ; . 
	jr $+66		;bdf5	18 40 	. @ 
	ld hl,08b7eh		;bdf7	21 7e 8b 	! ~ . 
	jr $+50		;bdfa	18 30 	. 0 
	ld hl,08a1bh		;bdfc	21 1b 8a 	! . . 
	jr $+25		;bdff	18 17 	. . 
	ld hl,08b15h		;be01	21 15 8b 	! . . 
	jr $+51		;be04	18 31 	. 1 
	ld hl,08a15h		;be06	21 15 8a 	! . . 
	jr $+15		;be09	18 0d 	. . 
	ld hl,08b03h		;be0b	21 03 8b 	! . . 
	jr $+41		;be0e	18 27 	. ' 
	ld hl,08af5h		;be10	21 f5 8a 	! . . 
	jr $+36		;be13	18 22 	. " 
	ld hl,08b07h		;be15	21 07 8b 	! . . 
	ld b,00ah		;be18	06 0a 	. . 
	ld de,0a099h		;be1a	11 99 a0 	. . . 
	jr $+31		;be1d	18 1d 	. . 
	ld hl,08b06h		;be1f	21 06 8b 	! . . 
	jr $+21		;be22	18 13 	. . 
	ld hl,08af7h		;be24	21 f7 8a 	! . . 
	jr $+16		;be27	18 0e 	. . 
	ld hl,08b5dh		;be29	21 5d 8b 	! ] . 
	ld bc,00804h		;be2c	01 04 08 	. . . 
	ld de,0a03bh		;be2f	11 3b a0 	. ; . 
	jr $-98		;be32	18 9c 	. . 
	ld hl,08b1eh		;be34	21 1e 8b 	! . . 
	ld b,00bh		;be37	06 0b 	. . 
	ld de,0a0f7h		;be39	11 f7 a0 	. . . 
	ld c,007h		;be3c	0e 07 	. . 
	jr $-110		;be3e	18 90 	. . 
	ld de,0a0dfh		;be40	11 df a0 	. . . 
	ld hl,08b8ch		;be43	21 8c 8b 	! . . 
	ld bc,00604h		;be46	01 04 06 	. . . 
	jr $-121		;be49	18 85 	. . 
	ld a,(0f8f3h)		;be4b	3a f3 f8 	: . . 
	inc a			;be4e	3c 	< 
	jp nz,0bde1h		;be4f	c2 e1 bd 	. . . 
	ld de,09d46h		;be52	11 46 9d 	. F . 
	ld hl,08b40h		;be55	21 40 8b 	! @ . 
	ld bc,00b05h		;be58	01 05 0b 	. . . 
	jr $-18		;be5b	18 ec 	. . 
	ld a,(0f8f3h)		;be5d	3a f3 f8 	: . . 
	cp 0feh		;be60	fe fe 	. . 
	jr nz,$+7		;be62	20 05 	  . 
	ld a,010h		;be64	3e 10 	> . 
	ld (0f8f3h),a		;be66	32 f3 f8 	2 . . 
	jp 0bde1h		;be69	c3 e1 bd 	. . . 
	ld a,05ah		;be6c	3e 5a 	> Z 
	ld (0f8e0h),a		;be6e	32 e0 f8 	2 . . 
	jr $-8		;be71	18 f6 	. . 
	ld hl,08b58h		;be73	21 58 8b 	! X . 
	ld de,0fb80h		;be76	11 80 fb 	. . . 
	ex de,hl			;be79	eb 	. 
	add hl,de			;be7a	19 	. 
	ld (0c2e1h),hl		;be7b	22 e1 c2 	" . . 
	ex de,hl			;be7e	eb 	. 
	ld de,0a05bh		;be7f	11 5b a0 	. [ . 
	ld bc,00404h		;be82	01 04 04 	. . . 
	jr $-60		;be85	18 c2 	. . 
	ld hl,08997h		;be87	21 97 89 	! . . 
	ld de,09e3ah		;be8a	11 3a 9e 	. : . 
	ld bc,00501h		;be8d	01 01 05 	. . . 
	jr $-71		;be90	18 b7 	. . 
	ld hl,08984h		;be92	21 84 89 	! . . 
	jr $-11		;be95	18 f3 	. . 
	ld hl,08b45h		;be97	21 45 8b 	! E . 
	jr $-36		;be9a	18 da 	. . 
	ld hl,088d5h		;be9c	21 d5 88 	! . . 
	jr $+10		;be9f	18 08 	. . 
	ld hl,08908h		;bea1	21 08 89 	! . . 
	jr $+5		;bea4	18 03 	. . 
	ld hl,088c2h		;bea6	21 c2 88 	! . . 
	ld de,09ffah		;bea9	11 fa 9f 	. . . 
	ld bc,04342h		;beac	01 42 43 	. B C 
	ld (09ffah),bc		;beaf	ed 43 fa 9f 	. C . . 
	ld a,0c6h		;beb3	3e c6 	> . 
	ld (09ffeh),a		;beb5	32 fe 9f 	2 . . 
	jp 0bdcdh		;beb8	c3 cd bd 	. . . 
	ld a,001h		;bebb	3e 01 	> . 
	jr $+8		;bebd	18 06 	. . 
	ld a,002h		;bebf	3e 02 	> . 
	jr $+4		;bec1	18 02 	. . 
	ld a,003h		;bec3	3e 03 	> . 
	ld (0f8f6h),a		;bec5	32 f6 f8 	2 . . 
	jr $-95		;bec8	18 9f 	. . 
	ld a,008h		;beca	3e 08 	> . 
	call 0df05h		;becc	cd 05 df 	. . . 
	jr $-102		;becf	18 98 	. . 
	ld a,010h		;bed1	3e 10 	> . 
	jr $-7		;bed3	18 f7 	. . 
	pop hl			;bed5	e1 	. 
	ld a,(hl)			;bed6	7e 	~ 
	inc hl			;bed7	23 	# 
	ld e,(hl)			;bed8	5e 	^ 
	inc hl			;bed9	23 	# 
	ld d,(hl)			;beda	56 	V 
	push hl			;bedb	e5 	. 
	ld (de),a			;bedc	12 	. 
	jp 0c146h		;bedd	c3 46 c1 	. F . 
	ld a,0cah		;bee0	3e ca 	> . 
	pop hl			;bee2	e1 	. 
	ld e,(hl)			;bee3	5e 	^ 
	inc hl			;bee4	23 	# 
	ld d,(hl)			;bee5	56 	V 
	push hl			;bee6	e5 	. 
	ld (de),a			;bee7	12 	. 
	inc de			;bee8	13 	. 
	inc a			;bee9	3c 	< 
	ld (de),a			;beea	12 	. 
	jp 0c146h		;beeb	c3 46 c1 	. F . 
	pop hl			;beee	e1 	. 
	ld c,(hl)			;beef	4e 	N 
	inc hl			;bef0	23 	# 
	ld b,(hl)			;bef1	46 	F 
	inc hl			;bef2	23 	# 
	ld a,(hl)			;bef3	7e 	~ 
	inc hl			;bef4	23 	# 
	push hl			;bef5	e5 	. 
	ld h,(hl)			;bef6	66 	f 
	ld l,a			;bef7	6f 	o 
	ld d,h			;bef8	54 	T 
	ld e,l			;bef9	5d 	] 
	inc de			;befa	13 	. 
	ld (hl),b			;befb	70 	p 
	ld b,000h		;befc	06 00 	. . 
	dec c			;befe	0d 	. 
	ldir		;beff	ed b0 	. . 
	jp 0c146h		;bf01	c3 46 c1 	. F . 
	ld hl,0bfddh		;bf04	21 dd bf 	! . . 
	ex (sp),hl			;bf07	e3 	. 
	ld e,021h		;bf08	1e 21 	. ! 
	jr $+8		;bf0a	18 06 	. . 
	ld e,01fh		;bf0c	1e 1f 	. . 
	jr $+4		;bf0e	18 02 	. . 
	ld e,020h		;bf10	1e 20 	.   
	ld d,000h		;bf12	16 00 	. . 
	pop hl			;bf14	e1 	. 
	ld b,(hl)			;bf15	46 	F 
	inc hl			;bf16	23 	# 
	ld c,(hl)			;bf17	4e 	N 
	inc hl			;bf18	23 	# 
	ld a,(hl)			;bf19	7e 	~ 
	inc hl			;bf1a	23 	# 
	push hl			;bf1b	e5 	. 
	ld h,(hl)			;bf1c	66 	f 
	ld l,a			;bf1d	6f 	o 
	ld (hl),c			;bf1e	71 	q 
	add hl,de			;bf1f	19 	. 
	djnz $-2		;bf20	10 fc 	. . 
	jp 0c146h		;bf22	c3 46 c1 	. F . 
	ld c,02ch		;bf25	0e 2c 	. , 
	jr $+12		;bf27	18 0a 	. . 
	ld c,009h		;bf29	0e 09 	. . 
	jr $+8		;bf2b	18 06 	. . 
	ld c,025h		;bf2d	0e 25 	. % 
	jr $+4		;bf2f	18 02 	. . 
	ld c,005h		;bf31	0e 05 	. . 
	ld de,0001fh		;bf33	11 1f 00 	. . . 
	pop hl			;bf36	e1 	. 
	ld b,(hl)			;bf37	46 	F 
	inc hl			;bf38	23 	# 
	ld a,(hl)			;bf39	7e 	~ 
	inc hl			;bf3a	23 	# 
	push hl			;bf3b	e5 	. 
	ld h,(hl)			;bf3c	66 	f 
	ld l,a			;bf3d	6f 	o 
	ld a,c			;bf3e	79 	y 
	inc a			;bf3f	3c 	< 
	ld (hl),c			;bf40	71 	q 
	inc hl			;bf41	23 	# 
	ld (hl),a			;bf42	77 	w 
	add hl,de			;bf43	19 	. 
	djnz $-4		;bf44	10 fa 	. . 
	jp 0c146h		;bf46	c3 46 c1 	. F . 
	exx			;bf49	d9 	. 
	ld de,087b4h		;bf4a	11 b4 87 	. . . 
	exx			;bf4d	d9 	. 
	ld c,003h		;bf4e	0e 03 	. . 
	ld b,004h		;bf50	06 04 	. . 
	pop hl			;bf52	e1 	. 
	ld a,(hl)			;bf53	7e 	~ 
	inc hl			;bf54	23 	# 
	push hl			;bf55	e5 	. 
	exx			;bf56	d9 	. 
	add a,a			;bf57	87 	. 
	add a,04eh		;bf58	c6 4e 	. N 
	ld (0bf5eh),a		;bf5a	32 5e bf 	2 ^ . 
	ld hl,(0954eh)		;bf5d	2a 4e 95 	* N . 
	ld bc,00630h		;bf60	01 30 06 	. 0 . 
	ldi		;bf63	ed a0 	. . 
	ldi		;bf65	ed a0 	. . 
	ldi		;bf67	ed a0 	. . 
	ldi		;bf69	ed a0 	. . 
	ldi		;bf6b	ed a0 	. . 
	ldi		;bf6d	ed a0 	. . 
	ldi		;bf6f	ed a0 	. . 
	ldi		;bf71	ed a0 	. . 
	ld a,e			;bf73	7b 	{ 
	add a,018h		;bf74	c6 18 	. . 
	ld e,a			;bf76	5f 	_ 
	jr nc,$+3		;bf77	30 01 	0 . 
	inc d			;bf79	14 	. 
	djnz $-23		;bf7a	10 e7 	. . 
	ld hl,0ff48h		;bf7c	21 48 ff 	! H . 
	add hl,de			;bf7f	19 	. 
	ex de,hl			;bf80	eb 	. 
	exx			;bf81	d9 	. 
	djnz $-48		;bf82	10 ce 	. . 
	exx			;bf84	d9 	. 
	ld hl,000a0h		;bf85	21 a0 00 	! . . 
	add hl,de			;bf88	19 	. 
	ex de,hl			;bf89	eb 	. 
	exx			;bf8a	d9 	. 
	dec c			;bf8b	0d 	. 
	jr nz,$-60		;bf8c	20 c2 	  . 
	jp 0bde1h		;bf8e	c3 e1 bd 	. . . 
	ld de,0ffe0h		;bf91	11 e0 ff 	. . . 
	jr $+19		;bf94	18 11 	. . 
	ld de,0ffe1h		;bf96	11 e1 ff 	. . . 
	jr $+14		;bf99	18 0c 	. . 
	ld hl,0bfe1h		;bf9b	21 e1 bf 	! . . 
	ex (sp),hl			;bf9e	e3 	. 
	ld de,00021h		;bf9f	11 21 00 	. ! . 
	jr $+5		;bfa2	18 03 	. . 
	ld de,00020h		;bfa4	11 20 00 	.   . 
	pop hl			;bfa7	e1 	. 
	ld c,(hl)			;bfa8	4e 	N 
	inc hl			;bfa9	23 	# 
	ld b,(hl)			;bfaa	46 	F 
	inc hl			;bfab	23 	# 
	ld a,(hl)			;bfac	7e 	~ 
	inc hl			;bfad	23 	# 
	push hl			;bfae	e5 	. 
	ld h,(hl)			;bfaf	66 	f 
	ld l,a			;bfb0	6f 	o 
	ld a,b			;bfb1	78 	x 
	ld b,c			;bfb2	41 	A 
	push hl			;bfb3	e5 	. 
	ld (hl),a			;bfb4	77 	w 
	inc hl			;bfb5	23 	# 
	djnz $-2		;bfb6	10 fc 	. . 
	pop hl			;bfb8	e1 	. 
	add hl,de			;bfb9	19 	. 
	dec c			;bfba	0d 	. 
	jr nz,$-9		;bfbb	20 f5 	  . 
	jp 0c146h		;bfbd	c3 46 c1 	. F . 
	pop hl			;bfc0	e1 	. 
	ld b,(hl)			;bfc1	46 	F 
	inc hl			;bfc2	23 	# 
	ld d,(hl)			;bfc3	56 	V 
	inc hl			;bfc4	23 	# 
	ld e,(hl)			;bfc5	5e 	^ 
	inc hl			;bfc6	23 	# 
	ld a,(hl)			;bfc7	7e 	~ 
	inc hl			;bfc8	23 	# 
	push hl			;bfc9	e5 	. 
	ld h,(hl)			;bfca	66 	f 
	ld l,a			;bfcb	6f 	o 
	ld a,020h		;bfcc	3e 20 	>   
	sub b			;bfce	90 	. 
	ld c,a			;bfcf	4f 	O 
	ld a,b			;bfd0	78 	x 
	ld b,a			;bfd1	47 	G 
	ld (hl),e			;bfd2	73 	s 
	inc hl			;bfd3	23 	# 
	djnz $-2		;bfd4	10 fc 	. . 
	add hl,bc			;bfd6	09 	. 
	dec d			;bfd7	15 	. 
	jr nz,$-7		;bfd8	20 f7 	  . 
	jp 0c146h		;bfda	c3 46 c1 	. F . 
	ld b,0d6h		;bfdd	06 d6 	. . 
	xor 087h		;bfdf	ee 87 	. . 
	ld b,0e7h		;bfe1	06 e7 	. . 
	adc a,087h		;bfe3	ce 87 	. . 
	ld a,(0f8f8h)		;bfe5	3a f8 f8 	: . . 
	or a			;bfe8	b7 	. 
	ld hl,05085h		;bfe9	21 85 50 	! . P 
	ld (0ef83h),hl		;bfec	22 83 ef 	" . . 
	jr z,$+8		;bfef	28 06 	( . 
	add a,l			;bff1	85 	. 
	ld l,a			;bff2	6f 	o 
	ld h,05ah		;bff3	26 5a 	& Z 
	ld (hl),00ch		;bff5	36 0c 	6 . 
	ld hl,066f7h		;bff7	21 f7 66 	! . f 
	ld b,006h		;bffa	06 06 	. . 
	ld (hl),030h		;bffc	36 30 	6 0 
	inc hl			;bffe	23 	# 
	djnz $-3		;bfff	10 fb 	. . 
	ld hl,066e1h		;c001	21 e1 66 	! . f 
	ld de,050c1h		;c004	11 c1 50 	. . P 
	call 0d06bh		;c007	cd 6b d0 	. k . 
	ld e,0d5h		;c00a	1e d5 	. . 
	call 0d06bh		;c00c	cd 6b d0 	. k . 
	ld e,0dbh		;c00f	1e db 	. . 
	call 0d06bh		;c011	cd 6b d0 	. k . 
	call 0d064h		;c014	cd 64 d0 	. d . 
	ld a,00eh		;c017	3e 0e 	> . 
	ld (0df20h),a		;c019	32 20 df 	2   . 
	ld hl,00726h		;c01c	21 26 07 	! & . 
	ld (0effch),hl		;c01f	22 fc ef 	" . . 
	ld hl,00106h		;c022	21 06 01 	! . . 
	ld (0effah),hl		;c025	22 fa ef 	" . . 
	ld hl,00011h		;c028	21 11 00 	! . . 
	ld (0effeh),hl		;c02b	22 fe ef 	" . . 
	ld a,008h		;c02e	3e 08 	> . 
	call 0df05h		;c030	cd 05 df 	. . . 
	call 0db1dh		;c033	cd 1d db 	. . . 
	ld (0d53ah),a		;c036	32 3a d5 	2 : . 
	ld (0f8f7h),a		;c039	32 f7 f8 	2 . . 
	ld (0f8feh),a		;c03c	32 fe f8 	2 . . 
	ld (0d238h),a		;c03f	32 38 d2 	2 8 . 
	ld (0f8f9h),a		;c042	32 f9 f8 	2 . . 
	ld hl,09ae4h		;c045	21 e4 9a 	! . . 
	ld (0cc6dh),hl		;c048	22 6d cc 	" m . 
	ld hl,0cf86h		;c04b	21 86 cf 	! . . 
	ld (0c2aeh),hl		;c04e	22 ae c2 	" . . 
	ld (0f8e0h),a		;c051	32 e0 f8 	2 . . 
	ld (0f8ech),a		;c054	32 ec f8 	2 . . 
	ld (0df1dh),a		;c057	32 1d df 	2 . . 
	ld hl,08184h		;c05a	21 84 81 	! . . 
	ld (0c123h),hl		;c05d	22 23 c1 	" # . 
	ld h,a			;c060	67 	g 
	ld l,a			;c061	6f 	o 
	ld (0ef85h),hl		;c062	22 85 ef 	" . . 
	inc a			;c065	3c 	< 
	ld h,a			;c066	67 	g 
	ld l,a			;c067	6f 	o 
	ld (0ef76h),hl		;c068	22 76 ef 	" v . 
	ld (0df2eh),a		;c06b	32 2e df 	2 . . 
	ld (0f8fah),a		;c06e	32 fa f8 	2 . . 
	ld (0fb0dh),a		;c071	32 0d fb 	2 . . 
	ld (0d9f8h),a		;c074	32 f8 d9 	2 . . 
	ld hl,05b00h		;c077	21 00 5b 	! . [ 
	ld de,0e0e0h		;c07a	11 e0 e0 	. . . 
	push de			;c07d	d5 	. 
	call 094d0h		;c07e	cd d0 94 	. . . 
	pop de			;c081	d1 	. 
	ld hl,0a644h		;c082	21 44 a6 	! D . 
	ld a,065h		;c085	3e 65 	> e 
	ld (hl),005h		;c087	36 05 	6 . 
	inc hl			;c089	23 	# 
	ex de,hl			;c08a	eb 	. 
	ldi		;c08b	ed a0 	. . 
	inc de			;c08d	13 	. 
	ldi		;c08e	ed a0 	. . 
	ldi		;c090	ed a0 	. . 
	ex de,hl			;c092	eb 	. 
	ld bc,00005h		;c093	01 05 00 	. . . 
	add hl,bc			;c096	09 	. 
	dec a			;c097	3d 	= 
	jr nz,$-17		;c098	20 ed 	  . 
	ld a,00ah		;c09a	3e 0a 	> . 
	ld (0a95ah),a		;c09c	32 5a a9 	2 Z . 
	call 0d6a2h		;c09f	cd a2 d6 	. . . 
	ld b,019h		;c0a2	06 19 	. . 
	ld de,0000ah		;c0a4	11 0a 00 	. . . 
	ld hl,0a645h		;c0a7	21 45 a6 	! E . 
	res 7,(hl)		;c0aa	cb be 	. . 
	add hl,de			;c0ac	19 	. 
	res 7,(hl)		;c0ad	cb be 	. . 
	add hl,de			;c0af	19 	. 
	res 7,(hl)		;c0b0	cb be 	. . 
	add hl,de			;c0b2	19 	. 
	res 7,(hl)		;c0b3	cb be 	. . 
	add hl,de			;c0b5	19 	. 
	djnz $-12		;c0b6	10 f2 	. . 
	res 7,(hl)		;c0b8	cb be 	. . 
	ld a,003h		;c0ba	3e 03 	> . 
	ld (0c85ch),a		;c0bc	32 5c c8 	2 \ . 
	xor a			;c0bf	af 	. 
	ld (0c2e2h),a		;c0c0	32 e2 c2 	2 . . 
	ld (0f8edh),a		;c0c3	32 ed f8 	2 . . 
	ld a,028h		;c0c6	3e 28 	> ( 
	ld (081f5h),a		;c0c8	32 f5 81 	2 . . 
	ld a,(0efffh)		;c0cb	3a ff ef 	: . . 
	ld hl,0d1e0h		;c0ce	21 e0 d1 	! . . 
	cp 010h		;c0d1	fe 10 	. . 
	jr nz,$+3		;c0d3	20 01 	  . 
	inc b			;c0d5	04 	. 
	ld (hl),b			;c0d6	70 	p 
	cp 013h		;c0d7	fe 13 	. . 
	jr c,$+21		;c0d9	38 13 	8 . 
	ld a,(0f8f3h)		;c0db	3a f3 f8 	: . . 
	inc a			;c0de	3c 	< 
	jr nz,$+15		;c0df	20 0d 	  . 
	ld hl,0f8f7h		;c0e1	21 f7 f8 	! . . 
	or (hl)			;c0e4	b6 	. 
	jr nz,$+9		;c0e5	20 07 	  . 
	inc (hl)			;c0e7	34 	4 
	ld hl,067d7h		;c0e8	21 d7 67 	! . g 
	call 0d064h		;c0eb	cd 64 d0 	. d . 
	ld b,006h		;c0ee	06 06 	. . 
	ld hl,0ef4ch		;c0f0	21 4c ef 	! L . 
	ld de,00007h		;c0f3	11 07 00 	. . . 
	ld (hl),d			;c0f6	72 	r 
	add hl,de			;c0f7	19 	. 
	djnz $-2		;c0f8	10 fc 	. . 
	ld a,(0effeh)		;c0fa	3a fe ef 	: . . 
	dec a			;c0fd	3d 	= 
	jr nz,$+7		;c0fe	20 05 	  . 
	ld a,001h		;c100	3e 01 	> . 
	ld (080dfh),a		;c102	32 df 80 	2 . . 
	xor a			;c105	af 	. 
	ld (0f8f6h),a		;c106	32 f6 f8 	2 . . 
	ld b,048h		;c109	06 48 	. H 
	ld hl,08574h		;c10b	21 74 85 	! t . 
	call 0d30eh		;c10e	cd 0e d3 	. . . 
	ld b,090h		;c111	06 90 	. . 
	call 0d30ch		;c113	cd 0c d3 	. . . 
	ld (0c2ebh),a		;c116	32 eb c2 	2 . . 
	ld (0c2f3h),a		;c119	32 f3 c2 	2 . . 
	ld a,(0efffh)		;c11c	3a ff ef 	: . . 
	or a			;c11f	b7 	. 
	jr z,$+5		;c120	28 03 	( . 
	ld a,(00000h)		;c122	3a 00 00 	: . . 
	ld (0c25ah),a		;c125	32 5a c2 	2 Z . 
	ld h,b			;c128	60 	` 
	ld l,a			;c129	6f 	o 
	add hl,hl			;c12a	29 	) 
	ld de,06a08h		;c12b	11 08 6a 	. . j 
	add hl,de			;c12e	19 	. 
	ld a,(hl)			;c12f	7e 	~ 
	inc hl			;c130	23 	# 
	ld h,(hl)			;c131	66 	f 
	ld l,a			;c132	6f 	o 
	ld a,(hl)			;c133	7e 	~ 
	inc a			;c134	3c 	< 
	jr z,$+20		;c135	28 12 	( . 
	inc hl			;c137	23 	# 
	push hl			;c138	e5 	. 
	dec a			;c139	3d 	= 
	add a,a			;c13a	87 	. 
	ld (0c13fh),a		;c13b	32 3f c1 	2 ? . 
	ld hl,(0f800h)		;c13e	2a 00 f8 	* . . 
	jp (hl)			;c141	e9 	. 
	pop hl			;c142	e1 	. 
	inc hl			;c143	23 	# 
	jr $-17		;c144	18 ed 	. . 
	jp 0c142h		;c146	c3 42 c1 	. B . 
	ld hl,0c177h		;c149	21 77 c1 	! w . 
	ld (0c147h),hl		;c14c	22 47 c1 	" G . 
	ld bc,01680h		;c14f	01 80 16 	. . . 
	ld hl,0aa36h		;c152	21 36 aa 	! 6 . 
	ld a,(0efffh)		;c155	3a ff ef 	: . . 
	cp (hl)			;c158	be 	. 
	jr z,$+9		;c159	28 07 	( . 
	jr c,$+33		;c15b	38 1f 	8 . 
	inc hl			;c15d	23 	# 
	inc hl			;c15e	23 	# 
	jp 0c179h		;c15f	c3 79 c1 	. y . 
	ld a,(0effeh)		;c162	3a fe ef 	: . . 
	inc hl			;c165	23 	# 
	cp (hl)			;c166	be 	. 
	jr c,$+21		;c167	38 13 	8 . 
	jr nz,$-11		;c169	20 f3 	  . 
	inc hl			;c16b	23 	# 
	push hl			;c16c	e5 	. 
	ld a,(hl)			;c16d	7e 	~ 
	add a,a			;c16e	87 	. 
	ld (0c173h),a		;c16f	32 73 c1 	2 s . 
	ld hl,(0f800h)		;c172	2a 00 f8 	* . . 
	push bc			;c175	c5 	. 
	jp (hl)			;c176	e9 	. 
	pop bc			;c177	c1 	. 
	pop hl			;c178	e1 	. 
	inc hl			;c179	23 	# 
	djnz $-37		;c17a	10 d9 	. . 
	ld hl,0c142h		;c17c	21 42 c1 	! B . 
	ld (0c147h),hl		;c17f	22 47 c1 	" G . 
	ld a,(0efffh)		;c182	3a ff ef 	: . . 
	cp 01fh		;c185	fe 1f 	. . 
	jr nz,$+21		;c187	20 13 	  . 
	ld bc,000c7h		;c189	01 c7 00 	. . . 
	ld de,089d3h		;c18c	11 d3 89 	. . . 
	ld hl,08c13h		;c18f	21 13 8c 	! . . 
	ld a,(de)			;c192	1a 	. 
	cp c			;c193	b9 	. 
	jr nc,$+4		;c194	30 02 	0 . 
	ld (hl),000h		;c196	36 00 	6 . 
	dec hl			;c198	2b 	+ 
	dec de			;c199	1b 	. 
	djnz $-8		;c19a	10 f6 	. . 
	ld hl,0a51bh		;c19c	21 1b a5 	! . . 
	ld de,00008h		;c19f	11 08 00 	. . . 
	ld b,021h		;c1a2	06 21 	. ! 
	ld a,(0efffh)		;c1a4	3a ff ef 	: . . 
	ld c,a			;c1a7	4f 	O 
	ld a,c			;c1a8	79 	y 
	cp (hl)			;c1a9	be 	. 
	inc hl			;c1aa	23 	# 
	jr c,$+43		;c1ab	38 29 	8 ) 
	jr z,$+7		;c1ad	28 05 	( . 
	add hl,de			;c1af	19 	. 
	djnz $-8		;c1b0	10 f6 	. . 
	jr $+36		;c1b2	18 22 	. " 
	ld a,(0effeh)		;c1b4	3a fe ef 	: . . 
	cp (hl)			;c1b7	be 	. 
	jr nz,$-9		;c1b8	20 f5 	  . 
	inc hl			;c1ba	23 	# 
	ld e,(hl)			;c1bb	5e 	^ 
	inc hl			;c1bc	23 	# 
	ld d,(hl)			;c1bd	56 	V 
	inc hl			;c1be	23 	# 
	ld (0f8f0h),hl		;c1bf	22 f0 f8 	" . . 
	ex de,hl			;c1c2	eb 	. 
	ld a,(hl)			;c1c3	7e 	~ 
	inc a			;c1c4	3c 	< 
	jr nz,$+8		;c1c5	20 06 	  . 
	ld (hl),088h		;c1c7	36 88 	6 . 
	inc hl			;c1c9	23 	# 
	ld (hl),089h		;c1ca	36 89 	6 . 
	dec hl			;c1cc	2b 	+ 
	ld de,0fdc0h		;c1cd	11 c0 fd 	. . . 
	add hl,de			;c1d0	19 	. 
	ld (hl),064h		;c1d1	36 64 	6 d 
	inc hl			;c1d3	23 	# 
	ld (hl),064h		;c1d4	36 64 	6 d 
	ld a,(0c25ah)		;c1d6	3a 5a c2 	: Z . 
	ld hl,08a55h		;c1d9	21 55 8a 	! U . 
	cp 03ah		;c1dc	fe 3a 	. : 
	jr z,$+8		;c1de	28 06 	( . 
	cp 03ch		;c1e0	fe 3c 	. < 
	jr nz,$+12		;c1e2	20 0a 	  . 
	ld l,060h		;c1e4	2e 60 	. ` 
	ld de,06712h		;c1e6	11 12 67 	. . g 
	ld b,006h		;c1e9	06 06 	. . 
	call 0d2efh		;c1eb	cd ef d2 	. . . 
	call 0d0abh		;c1ee	cd ab d0 	. . . 
	ld a,0f0h		;c1f1	3e f0 	> . 
	ld (0ca08h),a		;c1f3	32 08 ca 	2 . . 
	ld a,(0f8f6h)		;c1f6	3a f6 f8 	: . . 
	dec a			;c1f9	3d 	= 
	jr nz,$+12		;c1fa	20 0a 	  . 
	ld de,05033h		;c1fc	11 33 50 	. 3 P 
	ld a,043h		;c1ff	3e 43 	> C 
	call 0d060h		;c201	cd 60 d0 	. ` . 
	jr $+57		;c204	18 37 	. 7 
	dec a			;c206	3d 	= 
	jr nz,$+25		;c207	20 17 	  . 
	ld hl,05be8h		;c209	21 e8 5b 	! . [ 
	ld c,012h		;c20c	0e 12 	. . 
	ld de,04013h		;c20e	11 13 40 	. . @ 
	ld a,020h		;c211	3e 20 	>   
	ld (0d084h),a		;c213	32 84 d0 	2 . . 
	call 0d06dh		;c216	cd 6d d0 	. m . 
	ld a,001h		;c219	3e 01 	> . 
	ld (0d084h),a		;c21b	32 84 d0 	2 . . 
	jr $+31		;c21e	18 1d 	. . 
	dec a			;c220	3d 	= 
	jr nz,$+28		;c221	20 1a 	  . 
	ld hl,05bfah		;c223	21 fa 5b 	! . [ 
	ld c,006h		;c226	0e 06 	. . 
	jr $-26		;c228	18 e4 	. . 
	ex de,hl			;c22a	eb 	. 
	ld bc,00004h		;c22b	01 04 00 	. . . 
	ldir		;c22e	ed b0 	. . 
	ld hl,0fdbfh		;c230	21 bf fd 	! . . 
	add hl,de			;c233	19 	. 
	inc b			;c234	04 	. 
	ld (hl),b			;c235	70 	p 
	dec hl			;c236	2b 	+ 
	ld (hl),b			;c237	70 	p 
	dec hl			;c238	2b 	+ 
	ld (hl),b			;c239	70 	p 
	dec hl			;c23a	2b 	+ 
	ld (hl),b			;c23b	70 	p 
	ret			;c23c	c9 	. 
	ld a,(0fb04h)		;c23d	3a 04 fb 	: . . 
	ld (0fb05h),a		;c240	32 05 fb 	2 . . 
	ld a,000h		;c243	3e 00 	> . 
	or a			;c245	b7 	. 
	jr z,$+19		;c246	28 11 	( . 
	ld b,a			;c248	47 	G 
	ld hl,08e74h		;c249	21 74 8e 	! t . 
	ld a,h			;c24c	7c 	| 
	sub 009h		;c24d	d6 09 	. . 
	ld h,a			;c24f	67 	g 
	ld (hl),001h		;c250	36 01 	6 . 
	inc hl			;c252	23 	# 
	djnz $-3		;c253	10 fb 	. . 
	xor a			;c255	af 	. 
	ld (0c244h),a		;c256	32 44 c2 	2 D . 
	ld a,000h		;c259	3e 00 	> . 
	cp 09eh		;c25b	fe 9e 	. . 
	jr nz,$+44		;c25d	20 2a 	  * 
	ld hl,089c1h		;c25f	21 c1 89 	! . . 
	ld de,0ef48h		;c262	11 48 ef 	. H . 
	push hl			;c265	e5 	. 
	call 0c22ah		;c266	cd 2a c2 	. * . 
	pop hl			;c269	e1 	. 
	ld bc,0fb0fh		;c26a	01 0f fb 	. . . 
	ld a,(bc)			;c26d	0a 	. 
	or a			;c26e	b7 	. 
	jr z,$+7		;c26f	28 05 	( . 
	inc hl			;c271	23 	# 
	ld a,0cah		;c272	3e ca 	> . 
	jr $+5		;c274	18 03 	. . 
	dec hl			;c276	2b 	+ 
	ld a,0b7h		;c277	3e b7 	> . 
	cp l			;c279	bd 	. 
	jr nz,$+6		;c27a	20 04 	  . 
	ld a,(bc)			;c27c	0a 	. 
	xor 001h		;c27d	ee 01 	. . 
	ld (bc),a			;c27f	02 	. 
	ld (0c260h),hl		;c280	22 60 c2 	" ` . 
	ld de,09e3bh		;c283	11 3b 9e 	. ; . 
	call 0c22ah		;c286	cd 2a c2 	. * . 
	call 0dbc0h		;c289	cd c0 db 	. . . 
	call 0cc26h		;c28c	cd 26 cc 	. & . 
	call 0dbdah		;c28f	cd da db 	. . . 
	ld (0f8fdh),a		;c292	32 fd f8 	2 . . 
	ld b,a			;c295	47 	G 
	ld a,(0e666h)		;c296	3a 66 e6 	: f . 
	cp 064h		;c299	fe 64 	. d 
	jr nz,$+6		;c29b	20 04 	  . 
	ld hl,(0f8f0h)		;c29d	2a f0 f8 	* . . 
	ld b,(hl)			;c2a0	46 	F 
	ld a,b			;c2a1	78 	x 
	ld hl,0ef77h		;c2a2	21 77 ef 	! w . 
	cp (hl)			;c2a5	be 	. 
	ld (hl),a			;c2a6	77 	w 
	call nz,0d67bh		;c2a7	c4 7b d6 	. { . 
	call 0d03ah		;c2aa	cd 3a d0 	. : . 
	jp 00000h		;c2ad	c3 00 00 	. . . 
	inc a			;c2b0	3c 	< 
	ld (0f8ech),a		;c2b1	32 ec f8 	2 . . 
	call 0e08fh		;c2b4	cd 8f e0 	. . . 
	ld hl,006c0h		;c2b7	21 c0 06 	! . . 
	call 0e0b6h		;c2ba	cd b6 e0 	. . . 
	call 0cc65h		;c2bd	cd 65 cc 	. e . 
	call 0e0ach		;c2c0	cd ac e0 	. . . 
	ld a,(0c2e2h)		;c2c3	3a e2 c2 	: . . 
	or a			;c2c6	b7 	. 
	jr z,$+35		;c2c7	28 21 	( ! 
	ld hl,(0effah)		;c2c9	2a fa ef 	* . . 
	ld de,08a56h		;c2cc	11 56 8a 	. V . 
	add hl,de			;c2cf	19 	. 
	ld a,(hl)			;c2d0	7e 	~ 
	cp 08ah		;c2d1	fe 8a 	. . 
	ld a,018h		;c2d3	3e 18 	> . 
	jr z,$+4		;c2d5	28 02 	( . 
	ld a,028h		;c2d7	3e 28 	> ( 
	ld hl,081f5h		;c2d9	21 f5 81 	! . . 
	cp (hl)			;c2dc	be 	. 
	jr z,$+13		;c2dd	28 0b 	( . 
	ld (hl),a			;c2df	77 	w 
	ld hl,00000h		;c2e0	21 00 00 	! . . 
	ld b,004h		;c2e3	06 04 	. . 
	ld (hl),001h		;c2e5	36 01 	6 . 
	inc hl			;c2e7	23 	# 
	djnz $-3		;c2e8	10 fb 	. . 
	ld a,000h		;c2ea	3e 00 	> . 
	ld hl,08e74h		;c2ec	21 74 8e 	! t . 
	call 081e8h		;c2ef	cd e8 81 	. . . 
	ld a,000h		;c2f2	3e 00 	> . 
	ld hl,090b4h		;c2f4	21 b4 90 	! . . 
	call 081e8h		;c2f7	cd e8 81 	. . . 
	ld a,0ffh		;c2fa	3e ff 	> . 
	ld (0c2ebh),a		;c2fc	32 eb c2 	2 . . 
	ld (0c2f3h),a		;c2ff	32 f3 c2 	2 . . 
	ld a,(0f8fdh)		;c302	3a fd f8 	: . . 
	or a			;c305	b7 	. 
	ld b,002h		;c306	06 02 	. . 
	call nz,0df1dh		;c308	c4 1d df 	. . . 
	ld hl,0c319h		;c30b	21 19 c3 	! . . 
	ld a,(hl)			;c30e	7e 	~ 
	add a,002h		;c30f	c6 02 	. . 
	cp 0e8h		;c311	fe e8 	. . 
	jr nz,$+4		;c313	20 02 	  . 
	sub 008h		;c315	d6 08 	. . 
	ld (hl),a			;c317	77 	w 
	ld hl,(0f0e0h)		;c318	2a e0 f0 	* . . 
	ld (0c583h),hl		;c31b	22 83 c5 	" . . 
	ld hl,0c32ch		;c31e	21 2c c3 	! , . 
	ld a,(hl)			;c321	7e 	~ 
	add a,002h		;c322	c6 02 	. . 
	cp 0feh		;c324	fe fe 	. . 
	jr nz,$+4		;c326	20 02 	  . 
	sub 006h		;c328	d6 06 	. . 
	ld (hl),a			;c32a	77 	w 
	ld hl,(0f7f8h)		;c32b	2a f8 f7 	* . . 
	ld (0c5b1h),hl		;c32e	22 b1 c5 	" . . 
	ld a,(0f8ech)		;c331	3a ec f8 	: . . 
	ld (0c7b9h),a		;c334	32 b9 c7 	2 . . 
	ld hl,0cc11h		;c337	21 11 cc 	! . . 
	ld (0d336h),hl		;c33a	22 36 d3 	" 6 . 
	ld hl,0a645h		;c33d	21 45 a6 	! E . 
	ld bc,05702h		;c340	01 02 57 	. . W 
	ld iyh,000h		;c343	fd 26 00 	. & . 
	ld de,0000ah		;c346	11 0a 00 	. . . 
	ld a,(hl)			;c349	7e 	~ 
	rlca			;c34a	07 	. 
	jr nc,$+8		;c34b	30 06 	0 . 
	add hl,de			;c34d	19 	. 
	djnz $-5		;c34e	10 f9 	. . 
	jp 0c778h		;c350	c3 78 c7 	. x . 
	push bc			;c353	c5 	. 
	rlca			;c354	07 	. 
	and 001h		;c355	e6 01 	. . 
	ld (0f8ech),a		;c357	32 ec f8 	2 . . 
	ld a,(hl)			;c35a	7e 	~ 
	and 00fh		;c35b	e6 0f 	. . 
	ld iyl,a		;c35d	fd 6f 	. o 
	inc hl			;c35f	23 	# 
	ld b,(hl)			;c360	46 	F 
	ld d,h			;c361	54 	T 
	ld e,l			;c362	5d 	] 
	ld ixh,d		;c363	dd 62 	. b 
	ld ixl,e		;c365	dd 6b 	. k 
	inc l			;c367	2c 	, 
	inc hl			;c368	23 	# 
	ld a,(hl)			;c369	7e 	~ 
	ex de,hl			;c36a	eb 	. 
	ld hl,0effeh		;c36b	21 fe ef 	! . . 
	sub (hl)			;c36e	96 	. 
	ld c,a			;c36f	4f 	O 
	add a,005h		;c370	c6 05 	. . 
	cp 00ch		;c372	fe 0c 	. . 
	jp nc,0c75bh		;c374	d2 5b c7 	. [ . 
	inc l			;c377	2c 	, 
	ld a,b			;c378	78 	x 
	and 07fh		;c379	e6 7f 	.  
	sub (hl)			;c37b	96 	. 
	ld b,a			;c37c	47 	G 
	add a,003h		;c37d	c6 03 	. . 
	cp 006h		;c37f	fe 06 	. . 
	jp nc,0c75bh		;c381	d2 5b c7 	. [ . 
	ld a,b			;c384	78 	x 
	or c			;c385	b1 	. 
	ld (0c3b8h),a		;c386	32 b8 c3 	2 . . 
	jp nz,0c392h		;c389	c2 92 c3 	. . . 
	call 0e0c5h		;c38c	cd c5 e0 	. . . 
	call 0cc00h		;c38f	cd 00 cc 	. . . 
	ld a,iyl		;c392	fd 7d 	. } 
	cp 002h		;c394	fe 02 	. . 
	jp nc,0c412h		;c396	d2 12 c4 	. . . 
	ld b,(ix+001h)		;c399	dd 46 01 	. F . 
	ld a,(0f8ech)		;c39c	3a ec f8 	: . . 
	or a			;c39f	b7 	. 
	ld c,a			;c3a0	4f 	O 
	jr z,$+83		;c3a1	28 51 	( Q 
	ld a,(ix+002h)		;c3a3	dd 7e 02 	. ~ . 
	cp (ix+003h)		;c3a6	dd be 03 	. . . 
	jr nz,$+62		;c3a9	20 3c 	  < 
	ld a,(ix+004h)		;c3ab	dd 7e 04 	. ~ . 
	cp b			;c3ae	b8 	. 
	jr nz,$+56		;c3af	20 36 	  6 
	bit 7,(ix+000h)		;c3b1	dd cb 00 7e 	. . . ~ 
	jr z,$+31		;c3b5	28 1d 	( . 
	ld a,000h		;c3b7	3e 00 	> . 
	or a			;c3b9	b7 	. 
	jr nz,$+41		;c3ba	20 27 	  ' 
	ld a,b			;c3bc	78 	x 
	add a,00ah		;c3bd	c6 0a 	. . 
	ld e,a			;c3bf	5f 	_ 
	ld a,(0effch)		;c3c0	3a fc ef 	: . . 
	add a,00ah		;c3c3	c6 0a 	. . 
	cp e			;c3c5	bb 	. 
	ld a,000h		;c3c6	3e 00 	> . 
	jr nc,$+3		;c3c8	30 01 	0 . 
	inc a			;c3ca	3c 	< 
	cp c			;c3cb	b9 	. 
	jr nz,$+8		;c3cc	20 06 	  . 
	ld a,r		;c3ce	ed 5f 	. _ 
	and 003h		;c3d0	e6 03 	. . 
	jr nz,$+11		;c3d2	20 09 	  . 
	ld a,iyl		;c3d4	fd 7d 	. } 
	add a,a			;c3d6	87 	. 
	add a,007h		;c3d7	c6 07 	. . 
	ld iyl,a		;c3d9	fd 6f 	. o 
	jr $+55		;c3db	18 35 	. 5 
	rlca			;c3dd	07 	. 
	rlca			;c3de	07 	. 
	dec a			;c3df	3d 	= 
	ld (0e062h),a		;c3e0	32 62 e0 	2 b . 
	ld a,00ch		;c3e3	3e 0c 	> . 
	jr $-12		;c3e5	18 f2 	. . 
	dec b			;c3e7	05 	. 
	ld a,b			;c3e8	78 	x 
	cp 0fch		;c3e9	fe fc 	. . 
	jr nz,$+36		;c3eb	20 22 	  " 
	ld a,01ch		;c3ed	3e 1c 	> . 
	dec (ix+002h)		;c3ef	dd 35 02 	. 5 . 
	jr $+29		;c3f2	18 1b 	. . 
	ld a,(ix+002h)		;c3f4	dd 7e 02 	. ~ . 
	cp (ix+005h)		;c3f7	dd be 05 	. . . 
	jr nz,$+10		;c3fa	20 08 	  . 
	ld a,(ix+006h)		;c3fc	dd 7e 06 	. ~ . 
	cp b			;c3ff	b8 	. 
	jr nz,$+4		;c400	20 02 	  . 
	jr $-81		;c402	18 ad 	. . 
	inc b			;c404	04 	. 
	ld a,b			;c405	78 	x 
	cp 01eh		;c406	fe 1e 	. . 
	jr nz,$+7		;c408	20 05 	  . 
	ld a,0feh		;c40a	3e fe 	> . 
	inc (ix+002h)		;c40c	dd 34 02 	. 4 . 
	ld (ix+001h),a		;c40f	dd 77 01 	. w . 
	ld a,(0effeh)		;c412	3a fe ef 	: . . 
	cp (ix+002h)		;c415	dd be 02 	. . . 
	jp nz,0c75dh		;c418	c2 5d c7 	. ] . 
	ld a,(0efffh)		;c41b	3a ff ef 	: . . 
	sub (ix+000h)		;c41e	dd 96 00 	. . . 
	and 07fh		;c421	e6 7f 	.  
	jp nz,0c75dh		;c423	c2 5d c7 	. ] . 
	inc a			;c426	3c 	< 
	bit 7,(ix+007h)		;c427	dd cb 07 7e 	. . . ~ 
	call nz,0e05eh		;c42b	c4 5e e0 	. ^ . 
	call 0e0c5h		;c42e	cd c5 e0 	. . . 
	ld a,(0c717h)		;c431	3a 17 c7 	: . . 
	ld c,a			;c434	4f 	O 
	or a			;c435	b7 	. 
	ld hl,00900h		;c436	21 00 09 	! . . 
	jr z,$+5		;c439	28 03 	( . 
	ld hl,00b40h		;c43b	21 40 0b 	! @ . 
	call 0e0b6h		;c43e	cd b6 e0 	. . . 
	ld a,c			;c441	79 	y 
	inc a			;c442	3c 	< 
	ld hl,0fb0eh		;c443	21 0e fb 	! . . 
	sub (hl)			;c446	96 	. 
	jr nz,$+70		;c447	20 44 	  D 
	ld a,iyl		;c449	fd 7d 	. } 
	cp 005h		;c44b	fe 05 	. . 
	jr c,$+6		;c44d	38 04 	8 . 
	cp 007h		;c44f	fe 07 	. . 
	jr c,$+62		;c451	38 3c 	8 < 
	ld a,001h		;c453	3e 01 	> . 
	ld (0fb03h),a		;c455	32 03 fb 	2 . . 
	ld a,000h		;c458	3e 00 	> . 
	or a			;c45a	b7 	. 
	ld b,a			;c45b	47 	G 
	jp p,0c469h		;c45c	f2 69 c4 	. i . 
	ld a,(0c482h)		;c45f	3a 82 c4 	: . . 
	add a,a			;c462	87 	. 
	add a,007h		;c463	c6 07 	. . 
	ld iyl,a		;c465	fd 6f 	. o 
	res 7,b		;c467	cb b8 	. . 
	push bc			;c469	c5 	. 
	ld de,00206h		;c46a	11 06 02 	. . . 
	call 0dbdfh		;c46d	cd df db 	. . . 
	dec (ix-002h)		;c470	dd 35 fe 	. 5 . 
	jr z,$+13		;c473	28 0b 	( . 
	ld a,r		;c475	ed 5f 	. _ 
	and 007h		;c477	e6 07 	. . 
	jr z,$+7		;c479	28 05 	( . 
	pop bc			;c47b	c1 	. 
	djnz $-19		;c47c	10 eb 	. . 
	jr $+15		;c47e	18 0d 	. . 
	pop af			;c480	f1 	. 
	ld a,000h		;c481	3e 00 	> . 
	add a,005h		;c483	c6 05 	. . 
	ld iyl,a		;c485	fd 6f 	. o 
	ld de,00105h		;c487	11 05 01 	. . . 
	call 0dbdfh		;c48a	cd df db 	. . . 
	ld a,iyl		;c48d	fd 7d 	. } 
	ld b,a			;c48f	47 	G 
	add a,a			;c490	87 	. 
	add a,0a7h		;c491	c6 a7 	. . 
	ld (0c497h),a		;c493	32 97 c4 	2 . . 
	ld hl,(0c4a7h)		;c496	2a a7 c4 	* . . 
	ld a,(0c717h)		;c499	3a 17 c7 	: . . 
	or a			;c49c	b7 	. 
	ld a,b			;c49d	78 	x 
	ld de,0c2ebh		;c49e	11 eb c2 	. . . 
	jr z,$+4		;c4a1	28 02 	( . 
	ld e,0f3h		;c4a3	1e f3 	. . 
	ld (de),a			;c4a5	12 	. 
	jp (hl)			;c4a6	e9 	. 
	pop bc			;c4a7	c1 	. 
	call nz,0c588h		;c4a8	c4 88 c5 	. . . 
	call nc,0a0c5h		;c4ab	d4 c5 a0 	. . . 
	add a,0ceh		;c4ae	c6 ce 	. . 
	add a,092h		;c4b0	c6 92 	. . 
	add a,099h		;c4b2	c6 99 	. . 
	add a,06bh		;c4b4	c6 6b 	. k 
	add a,073h		;c4b6	c6 73 	. s 
	add a,082h		;c4b8	c6 82 	. . 
	add a,08ah		;c4ba	c6 8a 	. . 
	add a,0c6h		;c4bc	c6 c6 	. . 
	add a,008h		;c4be	c6 08 	. . 
	add a,03ah		;c4c0	c6 3a 	. : 
	call pe,047f8h		;c4c2	ec f8 47 	. . G 
	or a			;c4c5	b7 	. 
	ld a,(ix+001h)		;c4c6	dd 7e 01 	. ~ . 
	ld hl,08c99h		;c4c9	21 99 8c 	! . . 
	jr z,$+8		;c4cc	28 06 	( . 
	ld l,094h		;c4ce	2e 94 	. . 
	xor 0ffh		;c4d0	ee ff 	. . 
	jr $+4		;c4d2	18 02 	. . 
	cp 01bh		;c4d4	fe 1b 	. . 
	jp p,0c57fh		;c4d6	f2 7f c5 	.  . 
	ld de,(0cc11h)		;c4d9	ed 5b 11 cc 	. [ . . 
	add hl,de			;c4dd	19 	. 
	ld a,(hl)			;c4de	7e 	~ 
	inc a			;c4df	3c 	< 
	jr z,$+17		;c4e0	28 0f 	( . 
	ld a,r		;c4e2	ed 5f 	. _ 
	rra			;c4e4	1f 	. 
	jr nc,$+12		;c4e5	30 0a 	0 . 
	ld (0f8dch),hl		;c4e7	22 dc f8 	" . . 
	ld iyl,002h		;c4ea	fd 2e 02 	. . . 
	ld a,003h		;c4ed	3e 03 	> . 
	jr $+24		;c4ef	18 16 	. . 
	ld a,b			;c4f1	78 	x 
	or a			;c4f2	b7 	. 
	ld hl,08c79h		;c4f3	21 79 8c 	! y . 
	jr z,$+4		;c4f6	28 02 	( . 
	ld l,074h		;c4f8	2e 74 	. t 
	add hl,de			;c4fa	19 	. 
	ld a,(hl)			;c4fb	7e 	~ 
	inc a			;c4fc	3c 	< 
	jr z,$+15		;c4fd	28 0d 	( . 
	ld (0f8dch),hl		;c4ff	22 dc f8 	" . . 
	ld a,002h		;c502	3e 02 	> . 
	ld iyl,00bh		;c504	fd 2e 0b 	. . . 
	ld (0e062h),a		;c507	32 62 e0 	2 b . 
	jr $+120		;c50a	18 76 	. v 
	ld a,r		;c50c	ed 5f 	. _ 
	and 007h		;c50e	e6 07 	. . 
	jr nz,$+111		;c510	20 6d 	  m 
	ld a,(0ef53h)		;c512	3a 53 ef 	: S . 
	or a			;c515	b7 	. 
	jr nz,$+105		;c516	20 67 	  g 
	ld hl,0effdh		;c518	21 fd ef 	! . . 
	ld a,(ix+007h)		;c51b	dd 7e 07 	. ~ . 
	and 03fh		;c51e	e6 3f 	. ? 
	sub (hl)			;c520	96 	. 
	add a,004h		;c521	c6 04 	. . 
	cp 009h		;c523	fe 09 	. . 
	jr nc,$+90		;c525	30 58 	0 X 
	ex de,hl			;c527	eb 	. 
	ld de,00064h		;c528	11 64 00 	. d . 
	add hl,de			;c52b	19 	. 
	ld bc,00408h		;c52c	01 08 04 	. . . 
	ld a,(ix+001h)		;c52f	dd 7e 01 	. ~ . 
	add a,00ah		;c532	c6 0a 	. . 
	ld e,a			;c534	5f 	_ 
	ld a,(0effch)		;c535	3a fc ef 	: . . 
	add a,00ah		;c538	c6 0a 	. . 
	sub e			;c53a	93 	. 
	jr nc,$+9		;c53b	30 07 	0 . 
	ld bc,00104h		;c53d	01 04 01 	. . . 
	inc d			;c540	14 	. 
	dec hl			;c541	2b 	+ 
	dec hl			;c542	2b 	+ 
	dec hl			;c543	2b 	+ 
	inc a			;c544	3c 	< 
	cp 003h		;c545	fe 03 	. . 
	jr c,$+56		;c547	38 36 	8 6 
	ld a,(0f8ech)		;c549	3a ec f8 	: . . 
	cp d			;c54c	ba 	. 
	jr nz,$+50		;c54d	20 30 	  0 
	ld a,(ix+001h)		;c54f	dd 7e 01 	. ~ . 
	add a,b			;c552	80 	. 
	ld (0ef55h),a		;c553	32 55 ef 	2 U . 
	ld (0ef56h),hl		;c556	22 56 ef 	" V . 
	ld hl,09938h		;c559	21 38 99 	! 8 . 
	ld (0f8dch),hl		;c55c	22 dc f8 	" . . 
	ld a,c			;c55f	79 	y 
	ld (0ef58h),a		;c560	32 58 ef 	2 X . 
	ld (0ef59h),a		;c563	32 59 ef 	2 Y . 
	ld a,0d4h		;c566	3e d4 	> . 
	ld (0ef53h),a		;c568	32 53 ef 	2 S . 
	ld a,(ix+007h)		;c56b	dd 7e 07 	. ~ . 
	and 03fh		;c56e	e6 3f 	. ? 
	add a,003h		;c570	c6 03 	. . 
	ld (0ef54h),a		;c572	32 54 ef 	2 T . 
	ld iyl,002h		;c575	fd 2e 02 	. . . 
	ld a,003h		;c578	3e 03 	> . 
	ld (0e062h),a		;c57a	32 62 e0 	2 b . 
	jr $+5		;c57d	18 03 	. . 
	call 0c5b6h		;c57f	cd b6 c5 	. . . 
	ld de,00000h		;c582	11 00 00 	. . . 
	jp 0c6ddh		;c585	c3 dd c6 	. . . 
	ld a,(0f8ech)		;c588	3a ec f8 	: . . 
	or a			;c58b	b7 	. 
	ld hl,08c5ah		;c58c	21 5a 8c 	! Z . 
	ld a,(ix+001h)		;c58f	dd 7e 01 	. ~ . 
	jr z,$+8		;c592	28 06 	( . 
	ld l,055h		;c594	2e 55 	. U 
	xor 0ffh		;c596	ee ff 	. . 
	jr $+4		;c598	18 02 	. . 
	cp 019h		;c59a	fe 19 	. . 
	jp p,0c5adh		;c59c	f2 ad c5 	. . . 
	ld de,(0cc11h)		;c59f	ed 5b 11 cc 	. [ . . 
	add hl,de			;c5a3	19 	. 
	ld a,(hl)			;c5a4	7e 	~ 
	inc a			;c5a5	3c 	< 
	jr z,$+7		;c5a6	28 05 	( . 
	ld iyl,004h		;c5a8	fd 2e 04 	. . . 
	jr $+5		;c5ab	18 03 	. . 
	call 0c5b6h		;c5ad	cd b6 c5 	. . . 
	ld de,00000h		;c5b0	11 00 00 	. . . 
	jp 0c6ddh		;c5b3	c3 dd c6 	. . . 
	ld b,000h		;c5b6	06 00 	. . 
	ld a,(0effch)		;c5b8	3a fc ef 	: . . 
	sub (ix+001h)		;c5bb	dd 96 01 	. . . 
	jp p,0c5c2h		;c5be	f2 c2 c5 	. . . 
	inc b			;c5c1	04 	. 
	ld a,(0f8ech)		;c5c2	3a ec f8 	: . . 
	cp b			;c5c5	b8 	. 
	ret z			;c5c6	c8 	. 
	ld a,r		;c5c7	ed 5f 	. _ 
	and 003h		;c5c9	e6 03 	. . 
	ret nz			;c5cb	c0 	. 
	ld a,iyl		;c5cc	fd 7d 	. } 
	add a,a			;c5ce	87 	. 
	add a,007h		;c5cf	c6 07 	. . 
	ld iyl,a		;c5d1	fd 6f 	. o 
	ret			;c5d3	c9 	. 
	ld hl,0e062h		;c5d4	21 62 e0 	! b . 
	ld a,002h		;c5d7	3e 02 	> . 
	cp (hl)			;c5d9	be 	. 
	jr nz,$+21		;c5da	20 13 	  . 
	push hl			;c5dc	e5 	. 
	ld hl,(0f8dch)		;c5dd	2a dc f8 	* . . 
	ld a,(hl)			;c5e0	7e 	~ 
	inc a			;c5e1	3c 	< 
	jr z,$+12		;c5e2	28 0a 	( . 
	ld a,001h		;c5e4	3e 01 	> . 
	ld (0fb03h),a		;c5e6	32 03 fb 	2 . . 
	ld b,00ch		;c5e9	06 0c 	. . 
	call 0df1dh		;c5eb	cd 1d df 	. . . 
	pop hl			;c5ee	e1 	. 
	dec (hl)			;c5ef	35 	5 
	jr nz,$+5		;c5f0	20 03 	  . 
	ld iyl,000h		;c5f2	fd 2e 00 	. . . 
	ld de,09938h		;c5f5	11 38 99 	. 8 . 
	jp 0c6ddh		;c5f8	c3 dd c6 	. . . 
	push hl			;c5fb	e5 	. 
	ld hl,00000h		;c5fc	21 00 00 	! . . 
	inc hl			;c5ff	23 	# 
	res 6,h		;c600	cb b4 	. . 
	ld (0c5fdh),hl		;c602	22 fd c5 	" . . 
	ld a,(hl)			;c605	7e 	~ 
	pop hl			;c606	e1 	. 
	ret			;c607	c9 	. 
	ld de,08edah		;c608	11 da 8e 	. . . 
	ld b,00ch		;c60b	06 0c 	. . 
	ld c,(ix+001h)		;c60d	dd 4e 01 	. N . 
	ld a,(0f8ech)		;c610	3a ec f8 	: . . 
	dec a			;c613	3d 	= 
	ld a,023h		;c614	3e 23 	> # 
	jr nz,$+8		;c616	20 06 	  . 
	dec c			;c618	0d 	. 
	ld e,0d3h		;c619	1e d3 	. . 
	inc b			;c61b	04 	. 
	ld a,02bh		;c61c	3e 2b 	> + 
	ld (0c652h),a		;c61e	32 52 c6 	2 R . 
	ld (0c252h),a		;c621	32 52 c2 	2 R . 
	ld a,b			;c624	78 	x 
	ld (0c654h),a		;c625	32 54 c6 	2 T . 
	ld hl,(0cc11h)		;c628	2a 11 cc 	* . . 
	add hl,de			;c62b	19 	. 
	ld (0c24ah),hl		;c62c	22 4a c2 	" J . 
	ld de,0992eh		;c62f	11 2e 99 	. . . 
	ld b,00ah		;c632	06 0a 	. . 
	exx			;c634	d9 	. 
	ld de,0f940h		;c635	11 40 f9 	. @ . 
	ld bc,0fdc0h		;c638	01 c0 fd 	. . . 
	exx			;c63b	d9 	. 
	ld a,019h		;c63c	3e 19 	> . 
	cp c			;c63e	b9 	. 
	jr c,$+24		;c63f	38 16 	8 . 
	push hl			;c641	e5 	. 
	exx			;c642	d9 	. 
	pop hl			;c643	e1 	. 
	add hl,de			;c644	19 	. 
	ld a,(hl)			;c645	7e 	~ 
	exx			;c646	d9 	. 
	cp 0c7h		;c647	fe c7 	. . 
	jr nc,$+14		;c649	30 0c 	0 . 
	ld a,(de)			;c64b	1a 	. 
	ld (hl),a			;c64c	77 	w 
	exx			;c64d	d9 	. 
	add hl,bc			;c64e	09 	. 
	ld (hl),001h		;c64f	36 01 	6 . 
	exx			;c651	d9 	. 
	inc hl			;c652	23 	# 
	inc de			;c653	13 	. 
	nop			;c654	00 	. 
	djnz $-25		;c655	10 e5 	. . 
	ld a,00ah		;c657	3e 0a 	> . 
	sub b			;c659	90 	. 
	ld (0c244h),a		;c65a	32 44 c2 	2 D . 
	ld hl,0e062h		;c65d	21 62 e0 	! b . 
	dec (hl)			;c660	35 	5 
	jr nz,$+5		;c661	20 03 	  . 
	ld iyl,007h		;c663	fd 2e 07 	. . . 
	ld de,09938h		;c666	11 38 99 	. 8 . 
	jr $+116		;c669	18 72 	. r 
	ld iyl,008h		;c66b	fd 2e 08 	. . . 
	ld de,09a5fh		;c66e	11 5f 9a 	. _ . 
	jr $+108		;c671	18 6a 	. j 
	ld iyl,000h		;c673	fd 2e 00 	. . . 
	ld de,09a5fh		;c676	11 5f 9a 	. _ . 
	ld hl,0f8ech		;c679	21 ec f8 	! . . 
	ld a,001h		;c67c	3e 01 	> . 
	xor (hl)			;c67e	ae 	. 
	ld (hl),a			;c67f	77 	w 
	jr $+93		;c680	18 5b 	. [ 
	ld iyl,00ah		;c682	fd 2e 0a 	. . . 
	ld de,099ceh		;c685	11 ce 99 	. . . 
	jr $+85		;c688	18 53 	. S 
	ld iyl,001h		;c68a	fd 2e 01 	. . . 
	ld de,099ceh		;c68d	11 ce 99 	. . . 
	jr $-23		;c690	18 e7 	. . 
	ld de,09af8h		;c692	11 f8 9a 	. . . 
	inc iyh		;c695	fd 24 	. $ 
	jr $+70		;c697	18 44 	. D 
	ld de,09acdh		;c699	11 cd 9a 	. . . 
	inc iyh		;c69c	fd 24 	. $ 
	jr $+63		;c69e	18 3d 	. = 
	ld hl,0e062h		;c6a0	21 62 e0 	! b . 
	ld a,001h		;c6a3	3e 01 	> . 
	cp (hl)			;c6a5	be 	. 
	jr nz,$+21		;c6a6	20 13 	  . 
	push hl			;c6a8	e5 	. 
	ld hl,(0f8dch)		;c6a9	2a dc f8 	* . . 
	ld a,(hl)			;c6ac	7e 	~ 
	inc a			;c6ad	3c 	< 
	jr z,$+12		;c6ae	28 0a 	( . 
	ld a,001h		;c6b0	3e 01 	> . 
	ld (0fb03h),a		;c6b2	32 03 fb 	2 . . 
	ld b,007h		;c6b5	06 07 	. . 
	call 0df1dh		;c6b7	cd 1d df 	. . . 
	pop hl			;c6ba	e1 	. 
	dec (hl)			;c6bb	35 	5 
	jr nz,$+5		;c6bc	20 03 	  . 
	ld iyl,000h		;c6be	fd 2e 00 	. . . 
	ld de,09a89h		;c6c1	11 89 9a 	. . . 
	jr $+25		;c6c4	18 17 	. . 
	ld iyl,003h		;c6c6	fd 2e 03 	. . . 
	ld de,09961h		;c6c9	11 61 99 	. a . 
	jr $+17		;c6cc	18 0f 	. . 
	ld a,001h		;c6ce	3e 01 	> . 
	ld (0fb03h),a		;c6d0	32 03 fb 	2 . . 
	ld iyl,a		;c6d3	fd 6f 	. o 
	ld b,006h		;c6d5	06 06 	. . 
	call 0df1dh		;c6d7	cd 1d df 	. . . 
	ld de,099a0h		;c6da	11 a0 99 	. . . 
	ld hl,0f8eah		;c6dd	21 ea f8 	! . . 
	ld bc,08e74h		;c6e0	01 74 8e 	. t . 
	ld a,(0c717h)		;c6e3	3a 17 c7 	: . . 
	or a			;c6e6	b7 	. 
	ld a,001h		;c6e7	3e 01 	> . 
	jr z,$+8		;c6e9	28 06 	( . 
	inc l			;c6eb	2c 	, 
	ld bc,090b4h		;c6ec	01 b4 90 	. . . 
	ld a,004h		;c6ef	3e 04 	> . 
	ld (0c6f6h),a		;c6f1	32 f6 c6 	2 . . 
	ld (0cc01h),de		;c6f4	ed 53 01 cc 	. S . . 
	ld a,(0f8ech)		;c6f8	3a ec f8 	: . . 
	ld (hl),a			;c6fb	77 	w 
	call 0e08fh		;c6fc	cd 8f e0 	. . . 
	ld hl,(0cc11h)		;c6ff	2a 11 cc 	* . . 
	add hl,bc			;c702	09 	. 
	ld bc,(0cc18h)		;c703	ed 4b 18 cc 	. K . . 
	exx			;c707	d9 	. 
	ld d,(ix+007h)		;c708	dd 56 07 	. V . 
	res 7,d		;c70b	cb ba 	. . 
	ld e,(ix+001h)		;c70d	dd 5e 01 	. ^ . 
	call 0d335h		;c710	cd 35 d3 	. 5 . 
	call 0e0ach		;c713	cd ac e0 	. . . 
	ld a,000h		;c716	3e 00 	> . 
	dec a			;c718	3d 	= 
	call z,0e05eh		;c719	cc 5e e0 	. ^ . 
	jr $+12		;c71c	18 0a 	. . 
	ld hl,0f8ech		;c71e	21 ec f8 	! . . 
	ld a,001h		;c721	3e 01 	> . 
	xor (hl)			;c723	ae 	. 
	ld (hl),a			;c724	77 	w 
	ld iyl,000h		;c725	fd 2e 00 	. . . 
	ld a,(0f8ech)		;c728	3a ec f8 	: . . 
	rrca			;c72b	0f 	. 
	rrca			;c72c	0f 	. 
	or iyl		;c72d	fd b5 	. . 
	ld (ix-001h),a		;c72f	dd 77 ff 	. w . 
	dec iyh		;c732	fd 25 	. % 
	jr nz,$+53		;c734	20 33 	  3 
	set 7,(ix-001h)		;c736	dd cb ff fe 	. . . . 
	ld d,ixh		;c73a	dd 54 	. T 
	ld e,ixl		;c73c	dd 5d 	. ] 
	ld hl,00009h		;c73e	21 09 00 	! . . 
	add hl,de			;c741	19 	. 
	pop bc			;c742	c1 	. 
	dec b			;c743	05 	. 
	jp nz,0c346h		;c744	c2 46 c3 	. F . 
	jp 0c778h		;c747	c3 78 c7 	. x . 
	ld hl,0f8ech		;c74a	21 ec f8 	! . . 
	ld a,001h		;c74d	3e 01 	> . 
	xor (hl)			;c74f	ae 	. 
	ld (hl),a			;c750	77 	w 
	ld iyl,001h		;c751	fd 2e 01 	. . . 
	jr $-44		;c754	18 d2 	. . 
	ld iyl,007h		;c756	fd 2e 07 	. . . 
	jr $-49		;c759	18 cd 	. . 
	inc iyh		;c75b	fd 24 	. $ 
	ld a,iyl		;c75d	fd 7d 	. } 
	add a,a			;c75f	87 	. 
	add a,0e0h		;c760	c6 e0 	. . 
	ld (0c766h),a		;c762	32 66 c7 	2 f . 
	ld hl,(0efe0h)		;c765	2a e0 ef 	* . . 
	jp (hl)			;c768	e9 	. 
	inc iyh		;c769	fd 24 	. $ 
	ld d,ixh		;c76b	dd 54 	. T 
	ld e,ixl		;c76d	dd 5d 	. ] 
	ld hl,00009h		;c76f	21 09 00 	! . . 
	add hl,de			;c772	19 	. 
	pop bc			;c773	c1 	. 
	dec b			;c774	05 	. 
	jp nz,0c346h		;c775	c2 46 c3 	. F . 
	dec c			;c778	0d 	. 
	jr z,$+34		;c779	28 20 	(   
	ld a,c			;c77b	79 	y 
	ld (0c482h),a		;c77c	32 82 c4 	2 . . 
	ld a,010h		;c77f	3e 10 	> . 
	ld (0d3dch),a		;c781	32 dc d3 	2 . . 
	ld (0d3eah),a		;c784	32 ea d3 	2 . . 
	ld a,018h		;c787	3e 18 	> . 
	ld (0d3d8h),a		;c789	32 d8 d3 	2 . . 
	ld (0d3e2h),a		;c78c	32 e2 d3 	2 . . 
	ld de,00803h		;c78f	11 03 08 	. . . 
	ld (0cc18h),de		;c792	ed 53 18 cc 	. S . . 
	ld b,00eh		;c796	06 0e 	. . 
	jp 0c346h		;c798	c3 46 c3 	. F . 
	ld a,01ah		;c79b	3e 1a 	> . 
	ld (0d3e2h),a		;c79d	32 e2 d3 	2 . . 
	ld (0d3d8h),a		;c7a0	32 d8 d3 	2 . . 
	ld a,00ch		;c7a3	3e 0c 	> . 
	ld (0d3eah),a		;c7a5	32 ea d3 	2 . . 
	ld (0d3dch),a		;c7a8	32 dc d3 	2 . . 
	ld hl,00607h		;c7ab	21 07 06 	! . . 
	ld (0cc18h),hl		;c7ae	22 18 cc 	" . . 
	xor a			;c7b1	af 	. 
	ld (0c482h),a		;c7b2	32 82 c4 	2 . . 
	ld (0fb0eh),a		;c7b5	32 0e fb 	2 . . 
	ld a,000h		;c7b8	3e 00 	> . 
	ld (0f8ech),a		;c7ba	32 ec f8 	2 . . 
	ld hl,0effah		;c7bd	21 fa ef 	! . . 
	ld (0d336h),hl		;c7c0	22 36 d3 	" 6 . 
	ld hl,(0effeh)		;c7c3	2a fe ef 	* . . 
	ld de,00d04h		;c7c6	11 04 0d 	. . . 
	sbc hl,de		;c7c9	ed 52 	. R 
	jr nz,$+34		;c7cb	20 20 	    
	ld hl,0ba90h		;c7cd	21 90 ba 	! . . 
	ld a,(hl)			;c7d0	7e 	~ 
	inc a			;c7d1	3c 	< 
	cp 016h		;c7d2	fe 16 	. . 
	jr z,$-3		;c7d4	28 fb 	( . 
	cp 018h		;c7d6	fe 18 	. . 
	jr nz,$+4		;c7d8	20 02 	  . 
	ld a,013h		;c7da	3e 13 	> . 
	ld (hl),a			;c7dc	77 	w 
	ld (0ba99h),a		;c7dd	32 99 ba 	2 . . 
	ld (0baa2h),a		;c7e0	32 a2 ba 	2 . . 
	ld hl,00101h		;c7e3	21 01 01 	! . . 
	ld (08708h),hl		;c7e6	22 08 87 	" . . 
	ld a,l			;c7e9	7d 	} 
	ld (0870ah),a		;c7ea	32 0a 87 	2 . . 
	ld a,(0c25ah)		;c7ed	3a 5a c2 	: Z . 
	cp 0eeh		;c7f0	fe ee 	. . 
	jr nz,$+105		;c7f2	20 67 	  g 
	ld hl,085fbh		;c7f4	21 fb 85 	! . . 
	ld de,0883bh		;c7f7	11 3b 88 	. ; . 
	ld bc,00a01h		;c7fa	01 01 0a 	. . . 
	ld a,r		;c7fd	ed 5f 	. _ 
	and 003h		;c7ff	e6 03 	. . 
	add a,04fh		;c801	c6 4f 	. O 
	ld (de),a			;c803	12 	. 
	inc de			;c804	13 	. 
	inc de			;c805	13 	. 
	ld (hl),c			;c806	71 	q 
	inc hl			;c807	23 	# 
	inc hl			;c808	23 	# 
	ld (hl),c			;c809	71 	q 
	add a,003h		;c80a	c6 03 	. . 
	ld (de),a			;c80c	12 	. 
	push bc			;c80d	c5 	. 
	ld bc,0001eh		;c80e	01 1e 00 	. . . 
	add hl,bc			;c811	09 	. 
	ex de,hl			;c812	eb 	. 
	add hl,bc			;c813	09 	. 
	ex de,hl			;c814	eb 	. 
	pop bc			;c815	c1 	. 
	djnz $-25		;c816	10 e5 	. . 
	ld a,(0df1dh)		;c818	3a 1d df 	: . . 
	ld b,a			;c81b	47 	G 
	ld a,(0f8feh)		;c81c	3a fe f8 	: . . 
	or b			;c81f	b0 	. 
	jr nz,$+59		;c820	20 39 	  9 
	ld hl,0883dh		;c822	21 3d 88 	! = . 
	ld a,(0effeh)		;c825	3a fe ef 	: . . 
	cp 001h		;c828	fe 01 	. . 
	jr z,$+4		;c82a	28 02 	( . 
	dec hl			;c82c	2b 	+ 
	dec hl			;c82d	2b 	+ 
	ld de,00480h		;c82e	11 80 04 	. . . 
	ld bc,00a20h		;c831	01 20 0a 	.   . 
	ld a,(hl)			;c834	7e 	~ 
	dec a			;c835	3d 	= 
	jr z,$+29		;c836	28 1b 	( . 
	add hl,de			;c838	19 	. 
	ld a,(hl)			;c839	7e 	~ 
	inc a			;c83a	3c 	< 
	jr z,$+21		;c83b	28 13 	( . 
	cp 0d3h		;c83d	fe d3 	. . 
	jr c,$+10		;c83f	38 08 	8 . 
	cp 0d7h		;c841	fe d7 	. . 
	jr c,$+13		;c843	38 0b 	8 . 
	cp 0dbh		;c845	fe db 	. . 
	jr nc,$+9		;c847	30 07 	0 . 
	ld a,001h		;c849	3e 01 	> . 
	ld (0f8feh),a		;c84b	32 fe f8 	2 . . 
	jr $+13		;c84e	18 0b 	. . 
	or a			;c850	b7 	. 
	sbc hl,de		;c851	ed 52 	. R 
	ld a,c			;c853	79 	y 
	add a,l			;c854	85 	. 
	ld l,a			;c855	6f 	o 
	jr nc,$+3		;c856	30 01 	0 . 
	inc h			;c858	24 	$ 
	djnz $-37		;c859	10 d9 	. . 
	ld a,005h		;c85b	3e 05 	> . 
	or a			;c85d	b7 	. 
	jr z,$+9		;c85e	28 07 	( . 
	dec a			;c860	3d 	= 
	ld (0c85ch),a		;c861	32 5c c8 	2 \ . 
	jp 0c8f2h		;c864	c3 f2 c8 	. . . 
	ld a,(0efffh)		;c867	3a ff ef 	: . . 
	cp 01fh		;c86a	fe 1f 	. . 
	jr z,$-8		;c86c	28 f6 	( . 
	ld a,(0c25ah)		;c86e	3a 5a c2 	: Z . 
	cp 01dh		;c871	fe 1d 	. . 
	jr z,$+18		;c873	28 10 	( . 
	cp 023h		;c875	fe 23 	. # 
	jr z,$+14		;c877	28 0c 	( . 
	cp 022h		;c879	fe 22 	. " 
	jr z,$+10		;c87b	28 08 	( . 
	cp 026h		;c87d	fe 26 	. & 
	jr z,$+6		;c87f	28 04 	( . 
	cp 02ah		;c881	fe 2a 	. * 
	jr nz,$+111		;c883	20 6d 	  m 
	call 0c5fbh		;c885	cd fb c5 	. . . 
	and 03fh		;c888	e6 3f 	. ? 
	inc a			;c88a	3c 	< 
	cp 005h		;c88b	fe 05 	. . 
	jr nc,$+76		;c88d	30 4a 	0 J 
	ld hl,0ef53h		;c88f	21 53 ef 	! S . 
	ld de,00007h		;c892	11 07 00 	. . . 
	add hl,de			;c895	19 	. 
	dec a			;c896	3d 	= 
	jr nz,$-2		;c897	20 fc 	  . 
	ld a,(hl)			;c899	7e 	~ 
	or a			;c89a	b7 	. 
	jr nz,$+62		;c89b	20 3c 	  < 
	ld (hl),0e0h		;c89d	36 e0 	6 . 
	inc hl			;c89f	23 	# 
	ld (hl),009h		;c8a0	36 09 	6 . 
	inc hl			;c8a2	23 	# 
	ld (hl),a			;c8a3	77 	w 
	inc hl			;c8a4	23 	# 
	ld bc,00120h		;c8a5	01 20 01 	.   . 
	ld (hl),c			;c8a8	71 	q 
	inc hl			;c8a9	23 	# 
	ld (hl),b			;c8aa	70 	p 
	inc hl			;c8ab	23 	# 
	call 0c5fbh		;c8ac	cd fb c5 	. . . 
	and e			;c8af	a3 	. 
	add a,a			;c8b0	87 	. 
	ex de,hl			;c8b1	eb 	. 
	ld hl,0b15eh		;c8b2	21 5e b1 	! ^ . 
	add a,l			;c8b5	85 	. 
	ld l,a			;c8b6	6f 	o 
	ldi		;c8b7	ed a0 	. . 
	ld a,(hl)			;c8b9	7e 	~ 
	ld (de),a			;c8ba	12 	. 
	ex de,hl			;c8bb	eb 	. 
	call 0c5fbh		;c8bc	cd fb c5 	. . . 
	and b			;c8bf	a0 	. 
	jr z,$+25		;c8c0	28 17 	( . 
	ld a,(hl)			;c8c2	7e 	~ 
	xor 00ch		;c8c3	ee 0c 	. . 
	ld (hl),a			;c8c5	77 	w 
	dec hl			;c8c6	2b 	+ 
	ld a,(hl)			;c8c7	7e 	~ 
	xor 00ch		;c8c8	ee 0c 	. . 
	ld (hl),a			;c8ca	77 	w 
	dec hl			;c8cb	2b 	+ 
	ld d,(hl)			;c8cc	56 	V 
	dec hl			;c8cd	2b 	+ 
	ld a,(hl)			;c8ce	7e 	~ 
	dec hl			;c8cf	2b 	+ 
	ld (hl),c			;c8d0	71 	q 
	inc hl			;c8d1	23 	# 
	add a,c			;c8d2	81 	. 
	ld (hl),a			;c8d3	77 	w 
	jr nc,$+3		;c8d4	30 01 	0 . 
	inc d			;c8d6	14 	. 
	inc hl			;c8d7	23 	# 
	ld (hl),d			;c8d8	72 	r 
	ld b,004h		;c8d9	06 04 	. . 
	ld hl,0ef5bh		;c8db	21 5b ef 	! [ . 
	ld de,00003h		;c8de	11 03 00 	. . . 
	ld a,(hl)			;c8e1	7e 	~ 
	add hl,de			;c8e2	19 	. 
	inc hl			;c8e3	23 	# 
	cp 008h		;c8e4	fe 08 	. . 
	jr z,$+6		;c8e6	28 04 	( . 
	cp 00ah		;c8e8	fe 0a 	. . 
	jr nz,$+5		;c8ea	20 03 	  . 
	ld a,(hl)			;c8ec	7e 	~ 
	xor e			;c8ed	ab 	. 
	ld (hl),a			;c8ee	77 	w 
	add hl,de			;c8ef	19 	. 
	djnz $-15		;c8f0	10 ef 	. . 
	ld iyl,006h		;c8f2	fd 2e 06 	. . . 
	ld ix,0ef4ch		;c8f5	dd 21 4c ef 	. ! L . 
	ld b,001h		;c8f9	06 01 	. . 
	ld a,(ix+000h)		;c8fb	dd 7e 00 	. ~ . 
	or a			;c8fe	b7 	. 
	jr z,$+114		;c8ff	28 70 	( p 
	ld l,(ix+003h)		;c901	dd 6e 03 	. n . 
	ld h,(ix+004h)		;c904	dd 66 04 	. f . 
	ld de,08574h		;c907	11 74 85 	. t . 
	add hl,de			;c90a	19 	. 
	ld (hl),b			;c90b	70 	p 
	ld c,(ix+005h)		;c90c	dd 4e 05 	. N . 
	push bc			;c90f	c5 	. 
	inc b			;c910	04 	. 
	ld l,(ix+003h)		;c911	dd 6e 03 	. n . 
	ld h,(ix+004h)		;c914	dd 66 04 	. f . 
	bit 0,c		;c917	cb 41 	. A 
	call nz,0cbb7h		;c919	c4 b7 cb 	. . . 
	bit 1,c		;c91c	cb 49 	. I 
	call nz,0cbd4h		;c91e	c4 d4 cb 	. . . 
	bit 2,c		;c921	cb 51 	. Q 
	call nz,0cbe3h		;c923	c4 e3 cb 	. . . 
	bit 3,c		;c926	cb 59 	. Y 
	call nz,0cbf1h		;c928	c4 f1 cb 	. . . 
	ld de,087b4h		;c92b	11 b4 87 	. . . 
	add hl,de			;c92e	19 	. 
	ld a,(hl)			;c92f	7e 	~ 
	cp 0c7h		;c930	fe c7 	. . 
	jr nc,$+27		;c932	30 19 	0 . 
	ld c,002h		;c934	0e 02 	. . 
	ld de,00900h		;c936	11 00 09 	. . . 
	add hl,de			;c939	19 	. 
	ld a,iyl		;c93a	fd 7d 	. } 
	cp 006h		;c93c	fe 06 	. . 
	jr nz,$+62		;c93e	20 3c 	  < 
	ld a,(hl)			;c940	7e 	~ 
	inc a			;c941	3c 	< 
	jr z,$+58		;c942	28 38 	( 8 
	ld a,c			;c944	79 	y 
	ld (0fb0eh),a		;c945	32 0e fb 	2 . . 
	ld a,002h		;c948	3e 02 	> . 
	ld (0c459h),a		;c94a	32 59 c4 	2 Y . 
	ld (ix+000h),000h		;c94d	dd 36 00 00 	. 6 . . 
	pop bc			;c951	c1 	. 
	jr $+31		;c952	18 1d 	. . 
	ld c,(ix+006h)		;c954	dd 4e 06 	. N . 
	djnz $-70		;c957	10 b8 	. . 
	pop bc			;c959	c1 	. 
	ld l,(ix+003h)		;c95a	dd 6e 03 	. n . 
	ld h,(ix+004h)		;c95d	dd 66 04 	. f . 
	ld de,08c34h		;c960	11 34 8c 	. 4 . 
	add hl,de			;c963	19 	. 
	ld a,(ix+000h)		;c964	dd 7e 00 	. ~ . 
	ld (hl),a			;c967	77 	w 
	xor b			;c968	a8 	. 
	ld (ix+000h),a		;c969	dd 77 00 	. w . 
	ld de,0f940h		;c96c	11 40 f9 	. @ . 
	add hl,de			;c96f	19 	. 
	ld (hl),b			;c970	70 	p 
	ld de,00007h		;c971	11 07 00 	. . . 
	add ix,de		;c974	dd 19 	. . 
	dec iyl		;c976	fd 2d 	. - 
	jr nz,$-125		;c978	20 81 	  . 
	jr $+45		;c97a	18 2b 	. + 
	dec c			;c97c	0d 	. 
	jr z,$+7		;c97d	28 05 	( . 
	ld de,0fdc0h		;c97f	11 c0 fd 	. . . 
	jr $-73		;c982	18 b5 	. . 
	ld a,iyl		;c984	fd 7d 	. } 
	cp 006h		;c986	fe 06 	. . 
	jr z,$-52		;c988	28 ca 	( . 
	add hl,de			;c98a	19 	. 
	ld a,(hl)			;c98b	7e 	~ 
	cp 0e0h		;c98c	fe e0 	. . 
	jr nc,$-58		;c98e	30 c4 	0 . 
	ld a,004h		;c990	3e 04 	> . 
	cp iyl		;c992	fd bd 	. . 
	adc a,000h		;c994	ce 00 	. . 
	ld b,a			;c996	47 	G 
	call 0df1dh		;c997	cd 1d df 	. . . 
	ld a,001h		;c99a	3e 01 	> . 
	ld (0fb03h),a		;c99c	32 03 fb 	2 . . 
	ld a,iyl		;c99f	fd 7d 	. } 
	cp 005h		;c9a1	fe 05 	. . 
	jr c,$-74		;c9a3	38 b4 	8 . 
	jr $-88		;c9a5	18 a6 	. . 
	ld a,(0efffh)		;c9a7	3a ff ef 	: . . 
	or a			;c9aa	b7 	. 
	jr nz,$+34		;c9ab	20 20 	    
	ld d,a			;c9ad	57 	W 
	ld a,(0effch)		;c9ae	3a fc ef 	: . . 
	add a,030h		;c9b1	c6 30 	. 0 
	ld e,a			;c9b3	5f 	_ 
	ld hl,0006eh		;c9b4	21 6e 00 	! n . 
	add hl,de			;c9b7	19 	. 
	ld (0fb07h),hl		;c9b8	22 07 fb 	" . . 
	ld de,09db0h		;c9bb	11 b0 9d 	. . . 
	ld bc,089f4h		;c9be	01 f4 89 	. . . 
	call 0cf44h		;c9c1	cd 44 cf 	. D . 
	ld de,0a44ah		;c9c4	11 4a a4 	. J . 
	ld bc,08574h		;c9c7	01 74 85 	. t . 
	call 0cf44h		;c9ca	cd 44 cf 	. D . 
	ld hl,0f8edh		;c9cd	21 ed f8 	! . . 
	ld a,(hl)			;c9d0	7e 	~ 
	or a			;c9d1	b7 	. 
	jr z,$+119		;c9d2	28 75 	( u 
	inc hl			;c9d4	23 	# 
	dec (hl)			;c9d5	35 	5 
	jr nz,$+45		;c9d6	20 2b 	  + 
	ld a,r		;c9d8	ed 5f 	. _ 
	or a			;c9da	b7 	. 
	or 020h		;c9db	f6 20 	.   
	ld (hl),a			;c9dd	77 	w 
	inc hl			;c9de	23 	# 
	and 001h		;c9df	e6 01 	. . 
	jr z,$+40		;c9e1	28 26 	( & 
	call 0c5fbh		;c9e3	cd fb c5 	. . . 
	and 003h		;c9e6	e6 03 	. . 
	ld (hl),004h		;c9e8	36 04 	6 . 
	add a,a			;c9ea	87 	. 
	add a,000h		;c9eb	c6 00 	. . 
	ld (0c9f1h),a		;c9ed	32 f1 c9 	2 . . 
	ld hl,(0f000h)		;c9f0	2a 00 f0 	* . . 
	ld de,0afb5h		;c9f3	11 b5 af 	. . . 
	call 094d0h		;c9f6	cd d0 94 	. . . 
	ld a,040h		;c9f9	3e 40 	> @ 
	ld (0ca08h),a		;c9fb	32 08 ca 	2 . . 
	ld hl,09ed5h		;c9fe	21 d5 9e 	! . . 
	jr $+32		;ca01	18 1e 	. . 
	inc hl			;ca03	23 	# 
	ld a,(hl)			;ca04	7e 	~ 
	cp 004h		;ca05	fe 04 	. . 
	jr z,$-14		;ca07	28 f0 	( . 
	call 0c5fbh		;ca09	cd fb c5 	. . . 
	and 003h		;ca0c	e6 03 	. . 
	cp (hl)			;ca0e	be 	. 
	jr nz,$+5		;ca0f	20 03 	  . 
	inc a			;ca11	3c 	< 
	and 003h		;ca12	e6 03 	. . 
	ld (hl),a			;ca14	77 	w 
	add a,a			;ca15	87 	. 
	add a,a			;ca16	87 	. 
	ld b,a			;ca17	47 	G 
	add a,a			;ca18	87 	. 
	add a,b			;ca19	80 	. 
	ld e,a			;ca1a	5f 	_ 
	ld d,000h		;ca1b	16 00 	. . 
	ld hl,09ea5h		;ca1d	21 a5 9e 	! . . 
	add hl,de			;ca20	19 	. 
	ld de,08839h		;ca21	11 39 88 	. 9 . 
	ld a,003h		;ca24	3e 03 	> . 
	ldi		;ca26	ed a0 	. . 
	ldi		;ca28	ed a0 	. . 
	ldi		;ca2a	ed a0 	. . 
	ldi		;ca2c	ed a0 	. . 
	ld bc,0001ch		;ca2e	01 1c 00 	. . . 
	ex de,hl			;ca31	eb 	. 
	add hl,bc			;ca32	09 	. 
	ex de,hl			;ca33	eb 	. 
	dec a			;ca34	3d 	= 
	jr nz,$-15		;ca35	20 ef 	  . 
	ld de,00301h		;ca37	11 01 03 	. . . 
	ld hl,085f9h		;ca3a	21 f9 85 	! . . 
	inc c			;ca3d	0c 	. 
	ld (hl),e			;ca3e	73 	s 
	inc hl			;ca3f	23 	# 
	ld (hl),e			;ca40	73 	s 
	inc hl			;ca41	23 	# 
	ld (hl),e			;ca42	73 	s 
	inc hl			;ca43	23 	# 
	ld (hl),e			;ca44	73 	s 
	add hl,bc			;ca45	09 	. 
	dec d			;ca46	15 	. 
	jr nz,$-9		;ca47	20 f5 	  . 
	ld a,(081f5h)		;ca49	3a f5 81 	: . . 
	ld (0b7efh),a		;ca4c	32 ef b7 	2 . . 
	ld (0bb32h),a		;ca4f	32 32 bb 	2 2 . 
	ld (0bb3bh),a		;ca52	32 3b bb 	2 ; . 
	ld bc,0d080h		;ca55	01 80 d0 	. . . 
	ld hl,0f8eah		;ca58	21 ea f8 	! . . 
	ld a,(hl)			;ca5b	7e 	~ 
	or a			;ca5c	b7 	. 
	ld a,b			;ca5d	78 	x 
	jr nz,$+3		;ca5e	20 01 	  . 
	ld a,c			;ca60	79 	y 
	ld (0d1fch),a		;ca61	32 fc d1 	2 . . 
	inc hl			;ca64	23 	# 
	ld a,(hl)			;ca65	7e 	~ 
	or a			;ca66	b7 	. 
	ld a,b			;ca67	78 	x 
	jr nz,$+3		;ca68	20 01 	  . 
	ld a,c			;ca6a	79 	y 
	ld (0d20ah),a		;ca6b	32 0a d2 	2 . . 
	inc hl			;ca6e	23 	# 
	ld a,(hl)			;ca6f	7e 	~ 
	or a			;ca70	b7 	. 
	ld a,b			;ca71	78 	x 
	jr nz,$+3		;ca72	20 01 	  . 
	ld a,c			;ca74	79 	y 
	ld (0d249h),a		;ca75	32 49 d2 	2 I . 
	ld a,06ah		;ca78	3e 6a 	> j 
	ld (0ca81h),a		;ca7a	32 81 ca 	2 . . 
	call 0d17fh		;ca7d	cd 7f d1 	.  . 
	ld a,000h		;ca80	3e 00 	> . 
	add a,096h		;ca82	c6 96 	. . 
	jr z,$+99		;ca84	28 61 	( a 
	ld b,a			;ca86	47 	G 
	ld c,0b0h		;ca87	0e b0 	. . 
	ld a,(0fb06h)		;ca89	3a 06 fb 	: . . 
	cp 002h		;ca8c	fe 02 	. . 
	jr c,$+3		;ca8e	38 01 	8 . 
	halt			;ca90	76 	v 
	ld (0cab8h),sp		;ca91	ed 73 b8 ca 	. s . . 
	ld sp,0e0e0h		;ca95	31 e0 e0 	1 . . 
	pop hl			;ca98	e1 	. 
	pop de			;ca99	d1 	. 
	ld (hl),e			;ca9a	73 	s 
	inc h			;ca9b	24 	$ 
	ld (hl),d			;ca9c	72 	r 
	inc h			;ca9d	24 	$ 
	pop de			;ca9e	d1 	. 
	ld (hl),e			;ca9f	73 	s 
	inc h			;caa0	24 	$ 
	ld (hl),d			;caa1	72 	r 
	inc h			;caa2	24 	$ 
	pop de			;caa3	d1 	. 
	ld (hl),e			;caa4	73 	s 
	inc h			;caa5	24 	$ 
	ld (hl),d			;caa6	72 	r 
	inc h			;caa7	24 	$ 
	pop de			;caa8	d1 	. 
	ld (hl),e			;caa9	73 	s 
	inc h			;caaa	24 	$ 
	ld (hl),d			;caab	72 	r 
	ld a,h			;caac	7c 	| 
	rrca			;caad	0f 	. 
	rrca			;caae	0f 	. 
	rrca			;caaf	0f 	. 
	xor c			;cab0	a9 	. 
	ld h,a			;cab1	67 	g 
	dec sp			;cab2	3b 	; 
	pop de			;cab3	d1 	. 
	ld (hl),d			;cab4	72 	r 
	djnz $-29		;cab5	10 e1 	. . 
	ld sp,00000h		;cab7	31 00 00 	1 . . 
	ld a,000h		;caba	3e 00 	> . 
	inc a			;cabc	3c 	< 
	and 003h		;cabd	e6 03 	. . 
	ld (0cabbh),a		;cabf	32 bb ca 	2 . . 
	jr nz,$+30		;cac2	20 1c 	  . 
	ld hl,0a644h		;cac4	21 44 a6 	! D . 
	ld de,0000ah		;cac7	11 0a 00 	. . . 
	or (hl)			;caca	b6 	. 
	jr z,$+6		;cacb	28 04 	( . 
	cp 005h		;cacd	fe 05 	. . 
	adc a,d			;cacf	8a 	. 
	ld (hl),a			;cad0	77 	w 
	ld bc,0aa2ch		;cad1	01 2c aa 	. , . 
	sbc hl,bc		;cad4	ed 42 	. B 
	add hl,bc			;cad6	09 	. 
	jr nz,$+5		;cad7	20 03 	  . 
	ld hl,0a63ah		;cad9	21 3a a6 	! : . 
	add hl,de			;cadc	19 	. 
	ld (0cac5h),hl		;cadd	22 c5 ca 	" . . 
	ld a,(0fb03h)		;cae0	3a 03 fb 	: . . 
	or a			;cae3	b7 	. 
	call nz,0e00fh		;cae4	c4 0f e0 	. . . 
	ld bc,0fefeh		;cae7	01 fe fe 	. . . 
	in a,(c)		;caea	ed 78 	. x 
	and 001h		;caec	e6 01 	. . 
	jr nz,$+60		;caee	20 3a 	  : 
	dec b			;caf0	05 	. 
	in a,(c)		;caf1	ed 78 	. x 
	and 002h		;caf3	e6 02 	. . 
	jr nz,$+18		;caf5	20 10 	  . 
	call 0dd45h		;caf7	cd 45 dd 	. E . 
	ld hl,06918h		;cafa	21 18 69 	! . i 
	ld de,05066h		;cafd	11 66 50 	. f P 
	ld c,00eh		;cb00	0e 0e 	. . 
	call 0d06dh		;cb02	cd 6d d0 	. m . 
	jr $+21		;cb05	18 13 	. . 
	ld a,0dfh		;cb07	3e df 	> . 
	in a,(0feh)		;cb09	db fe 	. . 
	and 001h		;cb0b	e6 01 	. . 
	jr nz,$+16		;cb0d	20 0e 	  . 
	call 0e044h		;cb0f	cd 44 e0 	. D . 
	ld a,0dfh		;cb12	3e df 	> . 
	in a,(0feh)		;cb14	db fe 	. . 
	and 001h		;cb16	e6 01 	. . 
	jr nz,$-6		;cb18	20 f8 	  . 
	call 0e02dh		;cb1a	cd 2d e0 	. - . 
	ld a,07fh		;cb1d	3e 7f 	>  
	in a,(0feh)		;cb1f	db fe 	. . 
	and 001h		;cb21	e6 01 	. . 
	jr nz,$+7		;cb23	20 05 	  . 
	ld a,003h		;cb25	3e 03 	> . 
	ld (0f8f9h),a		;cb27	32 f9 f8 	2 . . 
	ld a,(0f8feh)		;cb2a	3a fe f8 	: . . 
	or a			;cb2d	b7 	. 
	jr z,$+22		;cb2e	28 14 	( . 
	ld a,r		;cb30	ed 5f 	. _ 
	and 007h		;cb32	e6 07 	. . 
	cp 001h		;cb34	fe 01 	. . 
	jr z,$-6		;cb36	28 f8 	( . 
	cp 004h		;cb38	fe 04 	. . 
	jr z,$-10		;cb3a	28 f4 	( . 
	ld (0d238h),a		;cb3c	32 38 d2 	2 8 . 
	ld b,014h		;cb3f	06 14 	. . 
	call 0df1dh		;cb41	cd 1d df 	. . . 
	ld bc,0f8f9h		;cb44	01 f9 f8 	. . . 
	ld a,(bc)			;cb47	0a 	. 
	or a			;cb48	b7 	. 
	jr z,$+27		;cb49	28 19 	( . 
	ld hl,0f8fah		;cb4b	21 fa f8 	! . . 
	ld a,(hl)			;cb4e	7e 	~ 
	or a			;cb4f	b7 	. 
	jr nz,$+15		;cb50	20 0d 	  . 
	inc (hl)			;cb52	34 	4 
	ld hl,09c43h		;cb53	21 43 9c 	! C . 
	ld (0cc6dh),hl		;cb56	22 6d cc 	" m . 
	ld hl,0d9b4h		;cb59	21 b4 d9 	! . . 
	ld (0c2aeh),hl		;cb5c	22 ae c2 	" . . 
	ld a,(bc)			;cb5f	0a 	. 
	cp 002h		;cb60	fe 02 	. . 
	jr z,$+56		;cb62	28 36 	( 6 
	ld de,02f39h		;cb64	11 39 2f 	. 9 / 
	ld hl,0fb0dh		;cb67	21 0d fb 	! . . 
	dec (hl)			;cb6a	35 	5 
	jr nz,$+47		;cb6b	20 2d 	  - 
	ld (hl),014h		;cb6d	36 14 	6 . 
	dec hl			;cb6f	2b 	+ 
	dec (hl)			;cb70	35 	5 
	ld a,d			;cb71	7a 	z 
	cp (hl)			;cb72	be 	. 
	jr nz,$+30		;cb73	20 1c 	  . 
	ld (hl),e			;cb75	73 	s 
	dec hl			;cb76	2b 	+ 
	dec (hl)			;cb77	35 	5 
	cp (hl)			;cb78	be 	. 
	jr nz,$+24		;cb79	20 16 	  . 
	ld (hl),e			;cb7b	73 	s 
	dec hl			;cb7c	2b 	+ 
	dec (hl)			;cb7d	35 	5 
	ld a,(hl)			;cb7e	7e 	~ 
	cp d			;cb7f	ba 	. 
	jr nz,$+7		;cb80	20 05 	  . 
	ld a,002h		;cb82	3e 02 	> . 
	ld (bc),a			;cb84	02 	. 
	jr $+21		;cb85	18 13 	. . 
	cp 030h		;cb87	fe 30 	. 0 
	jr nz,$+8		;cb89	20 06 	  . 
	ld hl,0678ah		;cb8b	21 8a 67 	! . g 
	call 0d064h		;cb8e	cd 64 d0 	. d . 
	ld de,05096h		;cb91	11 96 50 	. . P 
	ld hl,0fb09h		;cb94	21 09 fb 	! . . 
	call 0d06bh		;cb97	cd 6b d0 	. k . 
	ld hl,0fb04h		;cb9a	21 04 fb 	! . . 
	ld a,(0fb06h)		;cb9d	3a 06 fb 	: . . 
	cp 002h		;cba0	fe 02 	. . 
	jr c,$+15		;cba2	38 0d 	8 . 
	ld a,(hl)			;cba4	7e 	~ 
	inc l			;cba5	2c 	, 
	sub (hl)			;cba6	96 	. 
	inc l			;cba7	2c 	, 
	sub (hl)			;cba8	96 	. 
	jr nc,$+6		;cba9	30 04 	0 . 
	halt			;cbab	76 	v 
	inc a			;cbac	3c 	< 
	jr nz,$-2		;cbad	20 fc 	  . 
	ld l,004h		;cbaf	2e 04 	. . 
	ld a,(hl)			;cbb1	7e 	~ 
	inc l			;cbb2	2c 	, 
	ld (hl),a			;cbb3	77 	w 
	jp 0c243h		;cbb4	c3 43 c2 	. C . 
	xor a			;cbb7	af 	. 
	cp (ix+001h)		;cbb8	dd be 01 	. . . 
	jr z,$+16		;cbbb	28 0e 	( . 
	dec (ix+001h)		;cbbd	dd 35 01 	. 5 . 
	ld de,0ffe0h		;cbc0	11 e0 ff 	. . . 
	add hl,de			;cbc3	19 	. 
	ld (ix+003h),l		;cbc4	dd 75 03 	. u . 
	ld (ix+004h),h		;cbc7	dd 74 04 	. t . 
	ret			;cbca	c9 	. 
	ld (ix+000h),000h		;cbcb	dd 36 00 00 	. 6 . . 
	pop bc			;cbcf	c1 	. 
	pop bc			;cbd0	c1 	. 
	jp 0c971h		;cbd1	c3 71 c9 	. q . 
	ld a,011h		;cbd4	3e 11 	> . 
	cp (ix+001h)		;cbd6	dd be 01 	. . . 
	jr z,$-14		;cbd9	28 f0 	( . 
	inc (ix+001h)		;cbdb	dd 34 01 	. 4 . 
	ld de,00020h		;cbde	11 20 00 	.   . 
	jr $-30		;cbe1	18 e0 	. . 
	xor a			;cbe3	af 	. 
	cp (ix+002h)		;cbe4	dd be 02 	. . . 
	jr z,$-28		;cbe7	28 e2 	( . 
	dec (ix+002h)		;cbe9	dd 35 02 	. 5 . 
	ld de,0ffffh		;cbec	11 ff ff 	. . . 
	jr $-44		;cbef	18 d2 	. . 
	ld a,01fh		;cbf1	3e 1f 	> . 
	cp (ix+002h)		;cbf3	dd be 02 	. . . 
	jr z,$-43		;cbf6	28 d3 	( . 
	inc (ix+002h)		;cbf8	dd 34 02 	. 4 . 
	ld de,00001h		;cbfb	11 01 00 	. . . 
	jr $-59		;cbfe	18 c3 	. . 
	ld de,0cc01h		;cc00	11 01 cc 	. . . 
	ld hl,0cc04h		;cc03	21 04 cc 	! . . 
	bit 7,(ix+007h)		;cc06	dd cb 07 7e 	. . . ~ 
	jr z,$+3		;cc0a	28 01 	( . 
	ex de,hl			;cc0c	eb 	. 
	call 0e09ah		;cc0d	cd 9a e0 	. . . 
	ld hl,00000h		;cc10	21 00 00 	! . . 
	ld bc,08574h		;cc13	01 74 85 	. t . 
	add hl,bc			;cc16	09 	. 
	ld bc,00607h		;cc17	01 07 06 	. . . 
	exx			;cc1a	d9 	. 
	ld d,(ix+007h)		;cc1b	dd 56 07 	. V . 
	res 7,d		;cc1e	cb ba 	. . 
	ld e,(ix+001h)		;cc20	dd 5e 01 	. ^ . 
	jp 0d335h		;cc23	c3 35 d3 	. 5 . 
	call 0e09ah		;cc26	cd 9a e0 	. . . 
	ld hl,(0effah)		;cc29	2a fa ef 	* . . 
	ld de,08574h		;cc2c	11 74 85 	. t . 
	add hl,de			;cc2f	19 	. 
	ld de,09ae4h		;cc30	11 e4 9a 	. . . 
	ld bc,00607h		;cc33	01 07 06 	. . . 
	exx			;cc36	d9 	. 
	ld de,(0effch)		;cc37	ed 5b fc ef 	. [ . . 
	call 0d335h		;cc3b	cd 35 d3 	. 5 . 
	ld a,(0effdh)		;cc3e	3a fd ef 	: . . 
	cp 00bh		;cc41	fe 0b 	. . 
	ret z			;cc43	c8 	. 
	ld hl,0cc5dh		;cc44	21 5d cc 	! ] . 
	ld a,(0f8ech)		;cc47	3a ec f8 	: . . 
	add a,00ch		;cc4a	c6 0c 	. . 
	ld (hl),a			;cc4c	77 	w 
	exx			;cc4d	d9 	. 
	ld d,006h		;cc4e	16 06 	. . 
	ld a,(0effch)		;cc50	3a fc ef 	: . . 
	ld e,a			;cc53	5f 	_ 
	ld a,e			;cc54	7b 	{ 
	cp 020h		;cc55	fe 20 	.   
	jr nc,$+4		;cc57	30 02 	0 . 
	ld a,(hl)			;cc59	7e 	~ 
	ld (bc),a			;cc5a	02 	. 
	inc e			;cc5b	1c 	. 
	inc hl			;cc5c	23 	# 
	inc c			;cc5d	0c 	. 
	dec d			;cc5e	15 	. 
	jr nz,$-11		;cc5f	20 f3 	  . 
	ret			;cc61	c9 	. 
	call 0e079h		;cc62	cd 79 e0 	. y . 
	ld hl,(0effah)		;cc65	2a fa ef 	* . . 
	ld de,08c34h		;cc68	11 34 8c 	. 4 . 
	add hl,de			;cc6b	19 	. 
	ld de,00000h		;cc6c	11 00 00 	. . . 
	ld (0cc31h),de		;cc6f	ed 53 31 cc 	. S 1 . 
	ld bc,00607h		;cc73	01 07 06 	. . . 
	exx			;cc76	d9 	. 
	ld de,(0effch)		;cc77	ed 5b fc ef 	. [ . . 
	jp 0d335h		;cc7b	c3 35 d3 	. 5 . 
	ld a,(0f8ech)		;cc7e	3a ec f8 	: . . 
	add a,a			;cc81	87 	. 
	ld d,000h		;cc82	16 00 	. . 
	ld e,a			;cc84	5f 	_ 
	dec de			;cc85	1b 	. 
	ld hl,0effch		;cc86	21 fc ef 	! . . 
	ld a,(hl)			;cc89	7e 	~ 
	add a,e			;cc8a	83 	. 
	ld (hl),a			;cc8b	77 	w 
	ld hl,(0effah)		;cc8c	2a fa ef 	* . . 
	add hl,de			;cc8f	19 	. 
	ld (0effah),hl		;cc90	22 fa ef 	" . . 
	ret			;cc93	c9 	. 
	ld a,(0f8ech)		;cc94	3a ec f8 	: . . 
	or a			;cc97	b7 	. 
	ld a,(0effch)		;cc98	3a fc ef 	: . . 
	jr nz,$+9		;cc9b	20 07 	  . 
	cp 0fdh		;cc9d	fe fd 	. . 
	ret nz			;cc9f	c0 	. 
	pop hl			;cca0	e1 	. 
	jp 0cedbh		;cca1	c3 db ce 	. . . 
	cp 01dh		;cca4	fe 1d 	. . 
	ret nz			;cca6	c0 	. 
	pop hl			;cca7	e1 	. 
	jp 0cebeh		;cca8	c3 be ce 	. . . 
	call 0cfe2h		;ccab	cd e2 cf 	. . . 
	call 0cc94h		;ccae	cd 94 cc 	. . . 
	call 0cd91h		;ccb1	cd 91 cd 	. . . 
	call 0cc7eh		;ccb4	cd 7e cc 	. ~ . 
	ld b,004h		;ccb7	06 04 	. . 
	ld hl,0e641h		;ccb9	21 41 e6 	! A . 
	ld a,(hl)			;ccbc	7e 	~ 
	inc a			;ccbd	3c 	< 
	cp 0c8h		;ccbe	fe c8 	. . 
	jr nc,$+26		;ccc0	30 18 	0 . 
	inc hl			;ccc2	23 	# 
	djnz $-7		;ccc3	10 f7 	. . 
	ld hl,0effdh		;ccc5	21 fd ef 	! . . 
	dec (hl)			;ccc8	35 	5 
	ld hl,(0effah)		;ccc9	2a fa ef 	* . . 
	ld de,0ffe0h		;cccc	11 e0 ff 	. . . 
	add hl,de			;cccf	19 	. 
	ld (0effah),hl		;ccd0	22 fa ef 	" . . 
	ld hl,0f8e0h		;ccd3	21 e0 f8 	! . . 
	dec (hl)			;ccd6	35 	5 
	jp nz,0c2b4h		;ccd7	c2 b4 c2 	. . . 
	ld a,004h		;ccda	3e 04 	> . 
	ld hl,0f8e1h		;ccdc	21 e1 f8 	! . . 
	ld (hl),000h		;ccdf	36 00 	6 . 
	ld hl,0cceah		;cce1	21 ea cc 	! . . 
	ld de,09b22h		;cce4	11 22 9b 	. " . 
	jp 0db27h		;cce7	c3 27 db 	. ' . 
	ld hl,0f8e1h		;ccea	21 e1 f8 	! . . 
	ld a,(hl)			;cced	7e 	~ 
	add a,002h		;ccee	c6 02 	. . 
	and 006h		;ccf0	e6 06 	. . 
	ld (hl),a			;ccf2	77 	w 
	add a,l			;ccf3	85 	. 
	inc a			;ccf4	3c 	< 
	ld l,a			;ccf5	6f 	o 
	ld e,(hl)			;ccf6	5e 	^ 
	inc l			;ccf7	2c 	, 
	ld d,(hl)			;ccf8	56 	V 
	ld (0cc6dh),de		;ccf9	ed 53 6d cc 	. S m . 
	jr $+39		;ccfd	18 25 	. % 
	ld hl,0cd08h		;ccff	21 08 cd 	! . . 
	ld de,09cd4h		;cd02	11 d4 9c 	. . . 
	jp 0db2ah		;cd05	c3 2a db 	. * . 
	ld a,(0e646h)		;cd08	3a 46 e6 	: F . 
	inc a			;cd0b	3c 	< 
	jr z,$+24		;cd0c	28 16 	( . 
	ld de,08e94h		;cd0e	11 94 8e 	. . . 
	ld a,r		;cd11	ed 5f 	. _ 
	and 003h		;cd13	e6 03 	. . 
	rrca			;cd15	0f 	. 
	add a,002h		;cd16	c6 02 	. . 
	ld c,a			;cd18	4f 	O 
	ld a,(0f8ech)		;cd19	3a ec f8 	: . . 
	dec a			;cd1c	3d 	= 
	jr nz,$+4		;cd1d	20 02 	  . 
	ld e,099h		;cd1f	1e 99 	. . 
	call 0d5f4h		;cd21	cd f4 d5 	. . . 
	call 0cc94h		;cd24	cd 94 cc 	. . . 
	call 0cd91h		;cd27	cd 91 cd 	. . . 
	call 0cc7eh		;cd2a	cd 7e cc 	. ~ . 
	ld hl,0f8e0h		;cd2d	21 e0 f8 	! . . 
	dec (hl)			;cd30	35 	5 
	jp nz,0c2b4h		;cd31	c2 b4 c2 	. . . 
	ld (hl),006h		;cd34	36 06 	6 . 
	ld hl,0cdfah		;cd36	21 fa cd 	! . . 
	jp 0db2eh		;cd39	c3 2e db 	. . . 
	call 0d988h		;cd3c	cd 88 d9 	. . . 
	call 0cc94h		;cd3f	cd 94 cc 	. . . 
	call 0d42bh		;cd42	cd 2b d4 	. + . 
	jp nc,0d9f7h		;cd45	d2 f7 d9 	. . . 
	ld hl,0d9f8h		;cd48	21 f8 d9 	! . . 
	inc (hl)			;cd4b	34 	4 
	ld a,000h		;cd4c	3e 00 	> . 
	xor 001h		;cd4e	ee 01 	. . 
	ld (0cd4dh),a		;cd50	32 4d cd 	2 M . 
	jr z,$+17		;cd53	28 0f 	( . 
	call 0cd91h		;cd55	cd 91 cd 	. . . 
	ld a,(0e66ah)		;cd58	3a 6a e6 	: j . 
	inc a			;cd5b	3c 	< 
	cp 0c8h		;cd5c	fe c8 	. . 
	jp nc,0db08h		;cd5e	d2 08 db 	. . . 
	call 0cc7eh		;cd61	cd 7e cc 	. ~ . 
	ld hl,0effdh		;cd64	21 fd ef 	! . . 
	inc (hl)			;cd67	34 	4 
	ld de,00020h		;cd68	11 20 00 	.   . 
	ld hl,(0effah)		;cd6b	2a fa ef 	* . . 
	add hl,de			;cd6e	19 	. 
	ld (0effah),hl		;cd6f	22 fa ef 	" . . 
	ld hl,0f8e0h		;cd72	21 e0 f8 	! . . 
	dec (hl)			;cd75	35 	5 
	jp nz,0c2b4h		;cd76	c2 b4 c2 	. . . 
	ld de,09c43h		;cd79	11 43 9c 	. C . 
	jp 0d700h		;cd7c	c3 00 d7 	. . . 
	ld b,006h		;cd7f	06 06 	. . 
	ld hl,0e646h		;cd81	21 46 e6 	! F . 
	ld de,00006h		;cd84	11 06 00 	. . . 
	ld a,(hl)			;cd87	7e 	~ 
	inc a			;cd88	3c 	< 
	cp 0c8h		;cd89	fe c8 	. . 
	ret nc			;cd8b	d0 	. 
	add hl,de			;cd8c	19 	. 
	djnz $-6		;cd8d	10 f8 	. . 
	scf			;cd8f	37 	7 
	ret			;cd90	c9 	. 
	call 0cd7fh		;cd91	cd 7f cd 	.  . 
	ret c			;cd94	d8 	. 
	pop hl			;cd95	e1 	. 
	jr $-29		;cd96	18 e1 	. . 
	ld a,(0e66bh)		;cd98	3a 6b e6 	: k . 
	cp 007h		;cd9b	fe 07 	. . 
	ret z			;cd9d	c8 	. 
	ld a,(0e66eh)		;cd9e	3a 6e e6 	: n . 
	cp 007h		;cda1	fe 07 	. . 
	ret z			;cda3	c8 	. 
	ld b,005h		;cda4	06 05 	. . 
	call 0cd81h		;cda6	cd 81 cd 	. . . 
	pop bc			;cda9	c1 	. 
	jp nc,0db08h		;cdaa	d2 08 db 	. . . 
	ld a,(0e664h)		;cdad	3a 64 e6 	: d . 
	inc a			;cdb0	3c 	< 
	cp 0c8h		;cdb1	fe c8 	. . 
	jr c,$+21		;cdb3	38 13 	8 . 
	ld hl,0effdh		;cdb5	21 fd ef 	! . . 
	dec (hl)			;cdb8	35 	5 
	ld de,0ffe0h		;cdb9	11 e0 ff 	. . . 
	ld hl,(0effah)		;cdbc	2a fa ef 	* . . 
	add hl,de			;cdbf	19 	. 
	ld (0effah),hl		;cdc0	22 fa ef 	" . . 
	call 0cfe2h		;cdc3	cd e2 cf 	. . . 
	push bc			;cdc6	c5 	. 
	ret			;cdc7	c9 	. 
	push bc			;cdc8	c5 	. 
	ld a,(0e66dh)		;cdc9	3a 6d e6 	: m . 
	cp 0c7h		;cdcc	fe c7 	. . 
	ret nc			;cdce	d0 	. 
	ld a,(0e66ah)		;cdcf	3a 6a e6 	: j . 
	cp 0c7h		;cdd2	fe c7 	. . 
	ret nc			;cdd4	d0 	. 
	ld hl,0effdh		;cdd5	21 fd ef 	! . . 
	inc (hl)			;cdd8	34 	4 
	ld de,00020h		;cdd9	11 20 00 	.   . 
	ld hl,(0effah)		;cddc	2a fa ef 	* . . 
	add hl,de			;cddf	19 	. 
	ld (0effah),hl		;cde0	22 fa ef 	" . . 
	pop bc			;cde3	c1 	. 
	call 0d988h		;cde4	cd 88 d9 	. . . 
	push bc			;cde7	c5 	. 
	call 0dbc0h		;cde8	cd c0 db 	. . . 
	call 0cc26h		;cdeb	cd 26 cc 	. & . 
	call 0dbdah		;cdee	cd da db 	. . . 
	call 0d42bh		;cdf1	cd 2b d4 	. + . 
	ld a,005h		;cdf4	3e 05 	> . 
	ret nc			;cdf6	d0 	. 
	pop bc			;cdf7	c1 	. 
	jr $+58		;cdf8	18 38 	. 8 
	call 0d988h		;cdfa	cd 88 d9 	. . . 
	call 0cc94h		;cdfd	cd 94 cc 	. . . 
	call 0cd91h		;ce00	cd 91 cd 	. . . 
	ld a,(0e66ah)		;ce03	3a 6a e6 	: j . 
	inc a			;ce06	3c 	< 
	cp 0c8h		;ce07	fe c8 	. . 
	jp nc,0db08h		;ce09	d2 08 db 	. . . 
	call 0d42bh		;ce0c	cd 2b d4 	. + . 
	jp nc,0d4e3h		;ce0f	d2 e3 d4 	. . . 
	call 0cc7eh		;ce12	cd 7e cc 	. ~ . 
	ld hl,0effdh		;ce15	21 fd ef 	! . . 
	inc (hl)			;ce18	34 	4 
	ld de,00020h		;ce19	11 20 00 	.   . 
	ld hl,(0effah)		;ce1c	2a fa ef 	* . . 
	add hl,de			;ce1f	19 	. 
	ld (0effah),hl		;ce20	22 fa ef 	" . . 
	ld hl,09cf6h		;ce23	21 f6 9c 	! . . 
	ld (0cc6dh),hl		;ce26	22 6d cc 	" m . 
	ld hl,0f8e0h		;ce29	21 e0 f8 	! . . 
	dec (hl)			;ce2c	35 	5 
	jp nz,0c2b4h		;ce2d	c2 b4 c2 	. . . 
	ld a,019h		;ce30	3e 19 	> . 
	ld (0f8e0h),a		;ce32	32 e0 f8 	2 . . 
	ld (0f8fah),a		;ce35	32 fa f8 	2 . . 
	ld de,09c43h		;ce38	11 43 9c 	. C . 
	ld hl,0cd3ch		;ce3b	21 3c cd 	! < . 
	jp 0db2ah		;ce3e	c3 2a db 	. * . 
	ld a,(0effdh)		;ce41	3a fd ef 	: . . 
	cp 0ffh		;ce44	fe ff 	. . 
	ld de,08a16h		;ce46	11 16 8a 	. . . 
	jp p,0ce4fh		;ce49	f2 4f ce 	. O . 
	ld de,08ab6h		;ce4c	11 b6 8a 	. . . 
	call 0db82h		;ce4f	cd 82 db 	. . . 
	ld hl,(0effah)		;ce52	2a fa ef 	* . . 
	add hl,de			;ce55	19 	. 
	ld a,(hl)			;ce56	7e 	~ 
	or a			;ce57	b7 	. 
	ret			;ce58	c9 	. 
	call 0ce41h		;ce59	cd 41 ce 	. A . 
	jp z,0d454h		;ce5c	ca 54 d4 	. T . 
	call 0cc94h		;ce5f	cd 94 cc 	. . . 
	call 0cd98h		;ce62	cd 98 cd 	. . . 
	call 0cc7eh		;ce65	cd 7e cc 	. ~ . 
	call 0cfffh		;ce68	cd ff cf 	. . . 
	ld a,(0f7feh)		;ce6b	3a fe f7 	: . . 
	bit 3,a		;ce6e	cb 5f 	. _ 
	jr z,$+25		;ce70	28 17 	( . 
	ld a,001h		;ce72	3e 01 	> . 
	ld (0f8fah),a		;ce74	32 fa f8 	2 . . 
	ld a,004h		;ce77	3e 04 	> . 
	ld hl,0ccabh		;ce79	21 ab cc 	! . . 
	ld de,09cf6h		;ce7c	11 f6 9c 	. . . 
	jp 0db27h		;ce7f	c3 27 db 	. ' . 
	ld a,005h		;ce82	3e 05 	> . 
	ld hl,0ccffh		;ce84	21 ff cc 	! . . 
	jr $-11		;ce87	18 f3 	. . 
	bit 4,a		;ce89	cb 67 	. g 
	jp nz,0ce82h		;ce8b	c2 82 ce 	. . . 
	bit 0,a		;ce8e	cb 47 	. G 
	jp z,0db08h		;ce90	ca 08 db 	. . . 
	jp 0c2b4h		;ce93	c3 b4 c2 	. . . 
	ld hl,05800h		;ce96	21 00 58 	! . X 
	ld b,024h		;ce99	06 24 	. $ 
	call 0d30ch		;ce9b	cd 0c d3 	. . . 
	ld hl,0181eh		;ce9e	21 1e 18 	! . . 
	ld (0effeh),hl		;cea1	22 fe ef 	" . . 
	ld hl,00504h		;cea4	21 04 05 	! . . 
	ld (0effch),hl		;cea7	22 fc ef 	" . . 
	ld hl,000a4h		;ceaa	21 a4 00 	! . . 
	ld (0effah),hl		;cead	22 fa ef 	" . . 
	ld hl,08491h		;ceb0	21 91 84 	! . . 
	ld (0c123h),hl		;ceb3	22 23 c1 	" # . 
	ld a,002h		;ceb6	3e 02 	> . 
	ld (0d238h),a		;ceb8	32 38 d2 	2 8 . 
	jp 0c0a2h		;cebb	c3 a2 c0 	. . . 
	ld a,(0c25ah)		;cebe	3a 5a c2 	: Z . 
	cp 041h		;cec1	fe 41 	. A 
	jr z,$-45		;cec3	28 d1 	( . 
	ld hl,0effeh		;cec5	21 fe ef 	! . . 
	inc (hl)			;cec8	34 	4 
	ld a,0fdh		;cec9	3e fd 	> . 
	ld (0effch),a		;cecb	32 fc ef 	2 . . 
	ld hl,(0effah)		;cece	2a fa ef 	* . . 
	ld de,0ffe0h		;ced1	11 e0 ff 	. . . 
	add hl,de			;ced4	19 	. 
	ld de,00001h		;ced5	11 01 00 	. . . 
	jp 0d9a3h		;ced8	c3 a3 d9 	. . . 
	ld hl,0effeh		;cedb	21 fe ef 	! . . 
	dec (hl)			;cede	35 	5 
	ld a,01dh		;cedf	3e 1d 	> . 
	ld (0effch),a		;cee1	32 fc ef 	2 . . 
	ld hl,(0effah)		;cee4	2a fa ef 	* . . 
	ld de,00020h		;cee7	11 20 00 	.   . 
	add hl,de			;ceea	19 	. 
	ld de,0ffffh		;ceeb	11 ff ff 	. . . 
	jp 0d9a3h		;ceee	c3 a3 d9 	. . . 
	call 0ce41h		;cef1	cd 41 ce 	. A . 
	jp z,0d454h		;cef4	ca 54 d4 	. T . 
	call 0cc94h		;cef7	cd 94 cc 	. . . 
	call 0cd98h		;cefa	cd 98 cd 	. . . 
	call 0cc7eh		;cefd	cd 7e cc 	. ~ . 
	call 0cfffh		;cf00	cd ff cf 	. . . 
	ld hl,0f8f3h		;cf03	21 f3 f8 	! . . 
	ld a,(hl)			;cf06	7e 	~ 
	inc a			;cf07	3c 	< 
	jr z,$+39		;cf08	28 25 	( % 
	inc a			;cf0a	3c 	< 
	jr z,$+36		;cf0b	28 22 	( " 
	dec (hl)			;cf0d	35 	5 
	jp nz,0c2b4h		;cf0e	c2 b4 c2 	. . . 
	ld b,012h		;cf11	06 12 	. . 
	ld de,06717h		;cf13	11 17 67 	. . g 
	ld hl,08afbh		;cf16	21 fb 8a 	! . . 
	call 0d2efh		;cf19	cd ef d2 	. . . 
	ld b,012h		;cf1c	06 12 	. . 
	ld de,06728h		;cf1e	11 28 67 	. ( g 
	ld hl,08b5bh		;cf21	21 5b 8b 	! [ . 
	call 0d2efh		;cf24	cd ef d2 	. . . 
	ld a,0c8h		;cf27	3e c8 	> . 
	ld (0f8f3h),a		;cf29	32 f3 f8 	2 . . 
	jp 0db08h		;cf2c	c3 08 db 	. . . 
	ld a,(0f7feh)		;cf2f	3a fe f7 	: . . 
	bit 3,a		;cf32	cb 5f 	. _ 
	jp nz,0ce72h		;cf34	c2 72 ce 	. r . 
	bit 4,a		;cf37	cb 67 	. g 
	jp nz,0ce82h		;cf39	c2 82 ce 	. . . 
	bit 1,a		;cf3c	cb 4f 	. O 
	jp z,0db08h		;cf3e	ca 08 db 	. . . 
	jp 0c2b4h		;cf41	c3 b4 c2 	. . . 
	call 0e079h		;cf44	cd 79 e0 	. y . 
	ld hl,0fb07h		;cf47	21 07 fb 	! . . 
	ld (0d336h),hl		;cf4a	22 36 d3 	" 6 . 
	ld hl,(0fb07h)		;cf4d	2a 07 fb 	* . . 
	add hl,bc			;cf50	09 	. 
	ld bc,00b04h		;cf51	01 04 0b 	. . . 
	exx			;cf54	d9 	. 
	ld d,005h		;cf55	16 05 	. . 
	ld a,(0effch)		;cf57	3a fc ef 	: . . 
	sub 002h		;cf5a	d6 02 	. . 
	ld e,a			;cf5c	5f 	_ 
	call 0d335h		;cf5d	cd 35 d3 	. 5 . 
	ld hl,0effah		;cf60	21 fa ef 	! . . 
	ld (0d336h),hl		;cf63	22 36 d3 	" 6 . 
	ret			;cf66	c9 	. 
	call 0e079h		;cf67	cd 79 e0 	. y . 
	ld hl,0f8f4h		;cf6a	21 f4 f8 	! . . 
	ld (0d336h),hl		;cf6d	22 36 d3 	" 6 . 
	ld hl,(0effah)		;cf70	2a fa ef 	* . . 
	ld a,03eh		;cf73	3e 3e 	> > 
	add a,l			;cf75	85 	. 
	ld l,a			;cf76	6f 	o 
	jr nc,$+3		;cf77	30 01 	0 . 
	inc h			;cf79	24 	$ 
	ld (0f8f4h),hl		;cf7a	22 f4 f8 	" . . 
	add hl,bc			;cf7d	09 	. 
	ld bc,00b05h		;cf7e	01 05 0b 	. . . 
	exx			;cf81	d9 	. 
	ld d,00ah		;cf82	16 0a 	. . 
	jr $-45		;cf84	18 d1 	. . 
	ld a,(0effch)		;cf86	3a fc ef 	: . . 
	cp 0fdh		;cf89	fe fd 	. . 
	jp z,0cedbh		;cf8b	ca db ce 	. . . 
	call 0cc7eh		;cf8e	cd 7e cc 	. ~ . 
	ld a,(0f7feh)		;cf91	3a fe f7 	: . . 
	and 010h		;cf94	e6 10 	. . 
	jr nz,$+9		;cf96	20 07 	  . 
	ld hl,0f8e0h		;cf98	21 e0 f8 	! . . 
	dec (hl)			;cf9b	35 	5 
	jp nz,0c2b4h		;cf9c	c2 b4 c2 	. . . 
	ld a,001h		;cf9f	3e 01 	> . 
	jp 0ccdch		;cfa1	c3 dc cc 	. . . 
	ld a,(0effch)		;cfa4	3a fc ef 	: . . 
	cp 0fdh		;cfa7	fe fd 	. . 
	jp z,0cedbh		;cfa9	ca db ce 	. . . 
	call 0cc7eh		;cfac	cd 7e cc 	. ~ . 
	ld a,000h		;cfaf	3e 00 	> . 
	xor 001h		;cfb1	ee 01 	. . 
	ld (0cfb0h),a		;cfb3	32 b0 cf 	2 . . 
	jr nz,$-18		;cfb6	20 ec 	  . 
	ld de,09d7bh		;cfb8	11 7b 9d 	. { . 
	ld bc,089f4h		;cfbb	01 f4 89 	. . . 
	call 0cf67h		;cfbe	cd 67 cf 	. g . 
	ld de,0a44ah		;cfc1	11 4a a4 	. J . 
	ld bc,08574h		;cfc4	01 74 85 	. t . 
	call 0cf67h		;cfc7	cd 67 cf 	. g . 
	ld hl,0f8e0h		;cfca	21 e0 f8 	! . . 
	dec (hl)			;cfcd	35 	5 
	jp nz,0c2b4h		;cfce	c2 b4 c2 	. . . 
	ld de,09d46h		;cfd1	11 46 9d 	. F . 
	ld bc,089f4h		;cfd4	01 f4 89 	. . . 
	call 0cf67h		;cfd7	cd 67 cf 	. g . 
	ld a,010h		;cfda	3e 10 	> . 
	ld (0f8f3h),a		;cfdc	32 f3 f8 	2 . . 
	jp 0db08h		;cfdf	c3 08 db 	. . . 
	ld a,(0effdh)		;cfe2	3a fd ef 	: . . 
	cp 0f9h		;cfe5	fe f9 	. . 
	ret nz			;cfe7	c0 	. 
	ld hl,0efffh		;cfe8	21 ff ef 	! . . 
	dec (hl)			;cfeb	35 	5 
	pop hl			;cfec	e1 	. 
	add a,012h		;cfed	c6 12 	. . 
	ld (0effdh),a		;cfef	32 fd ef 	2 . . 
	ld hl,(0effah)		;cff2	2a fa ef 	* . . 
	ld de,00240h		;cff5	11 40 02 	. @ . 
	add hl,de			;cff8	19 	. 
	ld de,0ffe0h		;cff9	11 e0 ff 	. . . 
	jp 0d9a3h		;cffc	c3 a3 d9 	. . . 
	ld a,000h		;cfff	3e 00 	> . 
	xor 001h		;d001	ee 01 	. . 
	ld (0d000h),a		;d003	32 00 d0 	2 . . 
	jr nz,$+9		;d006	20 07 	  . 
	ld hl,09c7ah		;d008	21 7a 9c 	! z . 
	ld a,09bh		;d00b	3e 9b 	> . 
	xor (hl)			;d00d	ae 	. 
	ld (hl),a			;d00e	77 	w 
	ld hl,0d032h		;d00f	21 32 d0 	! 2 . 
	ld a,(hl)			;d012	7e 	~ 
	ld bc,00010h		;d013	01 10 00 	. . . 
	add a,c			;d016	81 	. 
	ld (hl),a			;d017	77 	w 
	cp 0d4h		;d018	fe d4 	. . 
	jr nz,$+23		;d01a	20 15 	  . 
	ld (hl),094h		;d01c	36 94 	6 . 
	ld b,002h		;d01e	06 02 	. . 
	ld a,(0e66ch)		;d020	3a 6c e6 	: l . 
	cp 0feh		;d023	fe fe 	. . 
	jr z,$+4		;d025	28 02 	( . 
	ld b,00ah		;d027	06 0a 	. . 
	ld a,c			;d029	79 	y 
	out (0feh),a		;d02a	d3 fe 	. . 
	xor a			;d02c	af 	. 
	out (0feh),a		;d02d	d3 fe 	. . 
	djnz $-6		;d02f	10 f8 	. . 
	ld hl,00000h		;d031	21 00 00 	! . . 
	ld de,09c84h		;d034	11 84 9c 	. . . 
	ldir		;d037	ed b0 	. . 
	ret			;d039	c9 	. 
	ld a,000h		;d03a	3e 00 	> . 
	dec a			;d03c	3d 	= 
	jr nz,$+8		;d03d	20 06 	  . 
	in a,(01fh)		;d03f	db 1f 	. . 
	ld (0f7feh),a		;d041	32 fe f7 	2 . . 
	ret			;d044	c9 	. 
	push hl			;d045	e5 	. 
	push bc			;d046	c5 	. 
	ld hl,081c7h		;d047	21 c7 81 	! . . 
	ld bc,00500h		;d04a	01 00 05 	. . . 
	ld a,(hl)			;d04d	7e 	~ 
	in a,(0feh)		;d04e	db fe 	. . 
	inc hl			;d050	23 	# 
	and (hl)			;d051	a6 	. 
	inc hl			;d052	23 	# 
	jr nz,$+5		;d053	20 03 	  . 
	ld a,(hl)			;d055	7e 	~ 
	or c			;d056	b1 	. 
	ld c,a			;d057	4f 	O 
	inc hl			;d058	23 	# 
	djnz $-12		;d059	10 f2 	. . 
	ld a,c			;d05b	79 	y 
	pop bc			;d05c	c1 	. 
	pop hl			;d05d	e1 	. 
	jr $-29		;d05e	18 e1 	. . 
	ld c,001h		;d060	0e 01 	. . 
	jr $+12		;d062	18 0a 	. . 
	ld de,05066h		;d064	11 66 50 	. f P 
	ld c,00eh		;d067	0e 0e 	. . 
	jr $+4		;d069	18 02 	. . 
	ld c,(hl)			;d06b	4e 	N 
	inc hl			;d06c	23 	# 
	ld a,(hl)			;d06d	7e 	~ 
	push hl			;d06e	e5 	. 
	ld h,000h		;d06f	26 00 	& . 
	add a,a			;d071	87 	. 
	ld l,a			;d072	6f 	o 
	add hl,hl			;d073	29 	) 
	add hl,hl			;d074	29 	) 
	push de			;d075	d5 	. 
	ld de,03c00h		;d076	11 00 3c 	. . < 
	add hl,de			;d079	19 	. 
	pop de			;d07a	d1 	. 
	ld b,008h		;d07b	06 08 	. . 
	ld a,(hl)			;d07d	7e 	~ 
	ld (de),a			;d07e	12 	. 
	inc hl			;d07f	23 	# 
	inc d			;d080	14 	. 
	djnz $-4		;d081	10 fa 	. . 
	ld a,001h		;d083	3e 01 	> . 
	add a,e			;d085	83 	. 
	ld e,a			;d086	5f 	_ 
	jr c,$+6		;d087	38 04 	8 . 
	ld a,d			;d089	7a 	z 
	sub 008h		;d08a	d6 08 	. . 
	ld d,a			;d08c	57 	W 
	pop hl			;d08d	e1 	. 
	inc hl			;d08e	23 	# 
	dec c			;d08f	0d 	. 
	jr nz,$-35		;d090	20 db 	  . 
	ret			;d092	c9 	. 
	xor a			;d093	af 	. 
	ld (05c08h),a		;d094	32 08 5c 	2 . \ 
	push af			;d097	f5 	. 
	push bc			;d098	c5 	. 
	push de			;d099	d5 	. 
	push hl			;d09a	e5 	. 
	call 002bfh		;d09b	cd bf 02 	. . . 
	pop hl			;d09e	e1 	. 
	pop de			;d09f	d1 	. 
	pop bc			;d0a0	c1 	. 
	pop af			;d0a1	f1 	. 
	ld a,(05c08h)		;d0a2	3a 08 5c 	: . \ 
	cp 05dh		;d0a5	fe 5d 	. ] 
	ret c			;d0a7	d8 	. 
	sub 020h		;d0a8	d6 20 	.   
	ret			;d0aa	c9 	. 
	ld hl,0e0f0h		;d0ab	21 f0 e0 	! . . 
	ld (0d1bch),hl		;d0ae	22 bc d1 	" . . 
	ld de,05800h		;d0b1	11 00 58 	. . X 
	ld hl,04000h		;d0b4	21 00 40 	! . @ 
	exx			;d0b7	d9 	. 
	ld hl,089f4h		;d0b8	21 f4 89 	! . . 
	ld ix,064feh		;d0bb	dd 21 fe 64 	. ! . d 
	ld d,0e0h		;d0bf	16 e0 	. . 
	ld bc,00002h		;d0c1	01 02 00 	. . . 
	push bc			;d0c4	c5 	. 
	push hl			;d0c5	e5 	. 
	ld a,(hl)			;d0c6	7e 	~ 
	ex af,af'			;d0c7	08 	. 
	ld bc,0fdc0h		;d0c8	01 c0 fd 	. . . 
	add hl,bc			;d0cb	09 	. 
	ld a,(hl)			;d0cc	7e 	~ 
	cp ixh		;d0cd	dd bc 	. . 
	jr nz,$+9		;d0cf	20 07 	  . 
	ex af,af'			;d0d1	08 	. 
	cp ixl		;d0d2	dd bd 	. . 
	jp z,0d112h		;d0d4	ca 12 d1 	. . . 
	ex af,af'			;d0d7	08 	. 
	ld l,a			;d0d8	6f 	o 
	ld ixh,a		;d0d9	dd 67 	. g 
	ld h,05eh		;d0db	26 5e 	& ^ 
	ld a,(hl)			;d0dd	7e 	~ 
	inc h			;d0de	24 	$ 
	ld e,0f0h		;d0df	1e f0 	. . 
	ld h,(hl)			;d0e1	66 	f 
	ld l,a			;d0e2	6f 	o 
	ldi		;d0e3	ed a0 	. . 
	ldi		;d0e5	ed a0 	. . 
	ldi		;d0e7	ed a0 	. . 
	ldi		;d0e9	ed a0 	. . 
	ldi		;d0eb	ed a0 	. . 
	ldi		;d0ed	ed a0 	. . 
	ldi		;d0ef	ed a0 	. . 
	ldi		;d0f1	ed a0 	. . 
	ld a,(hl)			;d0f3	7e 	~ 
	ld (de),a			;d0f4	12 	. 
	ex af,af'			;d0f5	08 	. 
	ld ixl,a		;d0f6	dd 6f 	. o 
	inc a			;d0f8	3c 	< 
	jp z,0d112h		;d0f9	ca 12 d1 	. . . 
	cp 033h		;d0fc	fe 33 	. 3 
	jr c,$+91		;d0fe	38 59 	8 Y 
	cp 0e5h		;d100	fe e5 	. . 
	ld l,a			;d102	6f 	o 
	jr nc,$+80		;d103	30 4e 	0 N 
	ld h,05eh		;d105	26 5e 	& ^ 
	ld e,(hl)			;d107	5e 	^ 
	inc h			;d108	24 	$ 
	ld d,(hl)			;d109	56 	V 
	ld hl,00bcfh		;d10a	21 cf 0b 	! . . 
	call 0d2d7h		;d10d	cd d7 d2 	. . . 
	ld a,(hl)			;d110	7e 	~ 
	ld (de),a			;d111	12 	. 
	exx			;d112	d9 	. 
	ld bc,0e0f0h		;d113	01 f0 e0 	. . . 
	ld a,(bc)			;d116	0a 	. 
	ld (hl),a			;d117	77 	w 
	inc h			;d118	24 	$ 
	inc c			;d119	0c 	. 
	ld a,(bc)			;d11a	0a 	. 
	ld (hl),a			;d11b	77 	w 
	inc h			;d11c	24 	$ 
	inc c			;d11d	0c 	. 
	ld a,(bc)			;d11e	0a 	. 
	ld (hl),a			;d11f	77 	w 
	inc h			;d120	24 	$ 
	inc c			;d121	0c 	. 
	ld a,(bc)			;d122	0a 	. 
	ld (hl),a			;d123	77 	w 
	inc h			;d124	24 	$ 
	inc c			;d125	0c 	. 
	ld a,(bc)			;d126	0a 	. 
	ld (hl),a			;d127	77 	w 
	inc h			;d128	24 	$ 
	inc c			;d129	0c 	. 
	ld a,(bc)			;d12a	0a 	. 
	ld (hl),a			;d12b	77 	w 
	inc h			;d12c	24 	$ 
	inc c			;d12d	0c 	. 
	ld a,(bc)			;d12e	0a 	. 
	ld (hl),a			;d12f	77 	w 
	inc h			;d130	24 	$ 
	inc c			;d131	0c 	. 
	ld a,(bc)			;d132	0a 	. 
	ld (hl),a			;d133	77 	w 
	inc c			;d134	0c 	. 
	ld a,(bc)			;d135	0a 	. 
	ld (de),a			;d136	12 	. 
	ld bc,0f901h		;d137	01 01 f9 	. . . 
	add hl,bc			;d13a	09 	. 
	inc de			;d13b	13 	. 
	exx			;d13c	d9 	. 
	pop hl			;d13d	e1 	. 
	pop bc			;d13e	c1 	. 
	inc hl			;d13f	23 	# 
	dec b			;d140	05 	. 
	jp nz,0d0c4h		;d141	c2 c4 d0 	. . . 
	dec c			;d144	0d 	. 
	ret m			;d145	f8 	. 
	jr nz,$+4		;d146	20 02 	  . 
	ld b,040h		;d148	06 40 	. @ 
	exx			;d14a	d9 	. 
	ld a,007h		;d14b	3e 07 	> . 
	add a,h			;d14d	84 	. 
	ld h,a			;d14e	67 	g 
	exx			;d14f	d9 	. 
	jp 0d0c4h		;d150	c3 c4 d0 	. . . 
	call 0d2cfh		;d153	cd cf d2 	. . . 
	jp 0d111h		;d156	c3 11 d1 	. . . 
	ld h,000h		;d159	26 00 	& . 
	ld d,h			;d15b	54 	T 
	ld e,a			;d15c	5f 	_ 
	add a,a			;d15d	87 	. 
	add a,a			;d15e	87 	. 
	ld l,a			;d15f	6f 	o 
	add hl,hl			;d160	29 	) 
	add hl,hl			;d161	29 	) 
	add hl,de			;d162	19 	. 
	ld de,0b4afh		;d163	11 af b4 	. . . 
	add hl,de			;d166	19 	. 
	ld de,0e0f0h		;d167	11 f0 e0 	. . . 
	ld b,004h		;d16a	06 04 	. . 
	ld a,(de)			;d16c	1a 	. 
	and (hl)			;d16d	a6 	. 
	inc hl			;d16e	23 	# 
	or (hl)			;d16f	b6 	. 
	inc hl			;d170	23 	# 
	ld (de),a			;d171	12 	. 
	inc e			;d172	1c 	. 
	ld a,(de)			;d173	1a 	. 
	and (hl)			;d174	a6 	. 
	inc hl			;d175	23 	# 
	or (hl)			;d176	b6 	. 
	inc hl			;d177	23 	# 
	ld (de),a			;d178	12 	. 
	inc e			;d179	1c 	. 
	djnz $-14		;d17a	10 f0 	. . 
	jp 0d110h		;d17c	c3 10 d1 	. . . 
	ld de,0e0e2h		;d17f	11 e2 e0 	. . . 
	ld (0d1bch),de		;d182	ed 53 bc d1 	. S . . 
	dec de			;d186	1b 	. 
	dec de			;d187	1b 	. 
	exx			;d188	d9 	. 
	ld hl,0d1eah		;d189	21 ea d1 	! . . 
	ld a,(hl)			;d18c	7e 	~ 
	xor 004h		;d18d	ee 04 	. . 
	ld (hl),a			;d18f	77 	w 
	ld hl,08574h		;d190	21 74 85 	! t . 
	ld bc,00241h		;d193	01 41 02 	. A . 
	ld a,001h		;d196	3e 01 	> . 
	cpir		;d198	ed b1 	. . 
	ret po			;d19a	e0 	. 
	push hl			;d19b	e5 	. 
	dec hl			;d19c	2b 	+ 
	push bc			;d19d	c5 	. 
	ld (hl),h			;d19e	74 	t 
	push hl			;d19f	e5 	. 
	ld de,00240h		;d1a0	11 40 02 	. @ . 
	add hl,de			;d1a3	19 	. 
	ld a,(hl)			;d1a4	7e 	~ 
	add hl,de			;d1a5	19 	. 
	ld b,(hl)			;d1a6	46 	F 
	ld iyl,b		;d1a7	fd 68 	. h 
	add hl,de			;d1a9	19 	. 
	ld b,(hl)			;d1aa	46 	F 
	ld iyh,b		;d1ab	fd 60 	. ` 
	ld (hl),0ffh		;d1ad	36 ff 	6 . 
	add hl,de			;d1af	19 	. 
	ld c,(hl)			;d1b0	4e 	N 
	add hl,de			;d1b1	19 	. 
	ld b,(hl)			;d1b2	46 	F 
	ld ixh,b		;d1b3	dd 60 	. ` 
	ld h,05eh		;d1b5	26 5e 	& ^ 
	ld l,a			;d1b7	6f 	o 
	ex af,af'			;d1b8	08 	. 
	ld b,(hl)			;d1b9	46 	F 
	inc h			;d1ba	24 	$ 
	ld de,00000h		;d1bb	11 00 00 	. . . 
	ld h,(hl)			;d1be	66 	f 
	ld l,b			;d1bf	68 	h 
	ldi		;d1c0	ed a0 	. . 
	ldi		;d1c2	ed a0 	. . 
	ldi		;d1c4	ed a0 	. . 
	ldi		;d1c6	ed a0 	. . 
	ldi		;d1c8	ed a0 	. . 
	ldi		;d1ca	ed a0 	. . 
	ldi		;d1cc	ed a0 	. . 
	ldi		;d1ce	ed a0 	. . 
	ld a,(hl)			;d1d0	7e 	~ 
	ld ixl,a		;d1d1	dd 6f 	. o 
	ld a,019h		;d1d3	3e 19 	> . 
	ld (0d21dh),a		;d1d5	32 1d d2 	2 . . 
	ld a,008h		;d1d8	3e 08 	> . 
	add a,c			;d1da	81 	. 
	ld l,a			;d1db	6f 	o 
	inc a			;d1dc	3c 	< 
	jr z,$+33		;d1dd	28 1f 	( . 
	ld c,000h		;d1df	0e 00 	. . 
	cp 0a4h		;d1e1	fe a4 	. . 
	jr c,$+12		;d1e3	38 0a 	8 . 
	cp 0a7h		;d1e5	fe a7 	. . 
	jr nc,$+8		;d1e7	30 06 	0 . 
	ld c,002h		;d1e9	0e 02 	. . 
	xor a			;d1eb	af 	. 
	ld (0d21dh),a		;d1ec	32 1d d2 	2 . . 
	ld a,ixl		;d1ef	dd 7d 	. } 
	and 0f8h		;d1f1	e6 f8 	. . 
	or c			;d1f3	b1 	. 
	ld ixl,a		;d1f4	dd 6f 	. o 
	ld h,060h		;d1f6	26 60 	& ` 
	ld e,(hl)			;d1f8	5e 	^ 
	inc h			;d1f9	24 	$ 
	ld d,(hl)			;d1fa	56 	V 
	call 095d0h		;d1fb	cd d0 95 	. . . 
	ld a,ixh		;d1fe	dd 7c 	. | 
	ld l,a			;d200	6f 	o 
	inc a			;d201	3c 	< 
	jr z,$+16		;d202	28 0e 	( . 
	ld h,060h		;d204	26 60 	& ` 
	ld e,(hl)			;d206	5e 	^ 
	inc h			;d207	24 	$ 
	ld d,(hl)			;d208	56 	V 
	call 095d0h		;d209	cd d0 95 	. . . 
	ld a,ixl		;d20c	dd 7d 	. } 
	and 0f8h		;d20e	e6 f8 	. . 
	ld ixl,a		;d210	dd 6f 	. o 
	ld a,iyh		;d212	fd 7c 	. | 
	ld l,a			;d214	6f 	o 
	inc a			;d215	3c 	< 
	jr z,$+53		;d216	28 33 	( 3 
	cp 0d3h		;d218	fe d3 	. . 
	jr nc,$+13		;d21a	30 0b 	0 . 
	jr $+27		;d21c	18 19 	. . 
	push hl			;d21e	e5 	. 
	ld b,003h		;d21f	06 03 	. . 
	call 0df1dh		;d221	cd 1d df 	. . . 
	pop hl			;d224	e1 	. 
	jr $+27		;d225	18 19 	. . 
	cp 0d7h		;d227	fe d7 	. . 
	jr c,$+6		;d229	38 04 	8 . 
	cp 0dbh		;d22b	fe db 	. . 
	jr c,$-17		;d22d	38 ed 	8 . 
	ex af,af'			;d22f	08 	. 
	dec a			;d230	3d 	= 
	jr nz,$+15		;d231	20 0d 	  . 
	ld c,007h		;d233	0e 07 	. . 
	jr $+4		;d235	18 02 	. . 
	ld c,000h		;d237	0e 00 	. . 
	ld a,ixl		;d239	dd 7d 	. } 
	and 0f8h		;d23b	e6 f8 	. . 
	or c			;d23d	b1 	. 
	ld ixl,a		;d23e	dd 6f 	. o 
	ld h,060h		;d240	26 60 	& ` 
	ld e,(hl)			;d242	5e 	^ 
	inc h			;d243	24 	$ 
	ld a,(hl)			;d244	7e 	~ 
	add a,008h		;d245	c6 08 	. . 
	ld d,a			;d247	57 	W 
	call 095d0h		;d248	cd d0 95 	. . . 
	inc iyl		;d24b	fd 2c 	. , 
	jp z,0d27bh		;d24d	ca 7b d2 	. { . 
	ld a,iyl		;d250	fd 7d 	. } 
	cp 033h		;d252	fe 33 	. 3 
	jr c,$+84		;d254	38 52 	8 R 
	cp 0e5h		;d256	fe e5 	. . 
	ld l,a			;d258	6f 	o 
	jr nc,$+74		;d259	30 48 	0 H 
	ld h,05eh		;d25b	26 5e 	& ^ 
	ld e,(hl)			;d25d	5e 	^ 
	inc h			;d25e	24 	$ 
	ld d,(hl)			;d25f	56 	V 
	ld hl,00bcfh		;d260	21 cf 0b 	! . . 
	add hl,de			;d263	19 	. 
	ld de,(0d1bch)		;d264	ed 5b bc d1 	. [ . . 
	ldi		;d268	ed a0 	. . 
	ldi		;d26a	ed a0 	. . 
	ldi		;d26c	ed a0 	. . 
	ldi		;d26e	ed a0 	. . 
	ldi		;d270	ed a0 	. . 
	ldi		;d272	ed a0 	. . 
	ldi		;d274	ed a0 	. . 
	ldi		;d276	ed a0 	. . 
	ld a,(hl)			;d278	7e 	~ 
	ld ixl,a		;d279	dd 6f 	. o 
	exx			;d27b	d9 	. 
	pop hl			;d27c	e1 	. 
	ld bc,07a8ch		;d27d	01 8c 7a 	. . z 
	add hl,bc			;d280	09 	. 
	ld a,l			;d281	7d 	} 
	ld (de),a			;d282	12 	. 
	inc de			;d283	13 	. 
	ld b,0fbh		;d284	06 fb 	. . 
	ld c,h			;d286	4c 	L 
	ld a,(bc)			;d287	0a 	. 
	ld (de),a			;d288	12 	. 
	ld hl,00009h		;d289	21 09 00 	! . . 
	add hl,de			;d28c	19 	. 
	ld a,ixl		;d28d	dd 7d 	. } 
	ld (hl),a			;d28f	77 	w 
	inc hl			;d290	23 	# 
	ld d,h			;d291	54 	T 
	ld e,l			;d292	5d 	] 
	inc hl			;d293	23 	# 
	inc hl			;d294	23 	# 
	ld (0d1bch),hl		;d295	22 bc d1 	" . . 
	ld hl,0ca81h		;d298	21 81 ca 	! . . 
	inc (hl)			;d29b	34 	4 
	exx			;d29c	d9 	. 
	pop bc			;d29d	c1 	. 
	pop hl			;d29e	e1 	. 
	jp nz,0d196h		;d29f	c2 96 d1 	. . . 
	ret			;d2a2	c9 	. 
	call 0d2cfh		;d2a3	cd cf d2 	. . . 
	jr $-45		;d2a6	18 d1 	. . 
	ld h,000h		;d2a8	26 00 	& . 
	ld d,h			;d2aa	54 	T 
	ld e,a			;d2ab	5f 	_ 
	add a,a			;d2ac	87 	. 
	add a,a			;d2ad	87 	. 
	ld l,a			;d2ae	6f 	o 
	add hl,hl			;d2af	29 	) 
	add hl,hl			;d2b0	29 	) 
	add hl,de			;d2b1	19 	. 
	ld de,0b4afh		;d2b2	11 af b4 	. . . 
	add hl,de			;d2b5	19 	. 
	ld de,(0d1bch)		;d2b6	ed 5b bc d1 	. [ . . 
	ld b,004h		;d2ba	06 04 	. . 
	ld a,(de)			;d2bc	1a 	. 
	and (hl)			;d2bd	a6 	. 
	inc hl			;d2be	23 	# 
	or (hl)			;d2bf	b6 	. 
	ld (de),a			;d2c0	12 	. 
	inc hl			;d2c1	23 	# 
	inc de			;d2c2	13 	. 
	ld a,(de)			;d2c3	1a 	. 
	and (hl)			;d2c4	a6 	. 
	inc hl			;d2c5	23 	# 
	or (hl)			;d2c6	b6 	. 
	ld (de),a			;d2c7	12 	. 
	inc hl			;d2c8	23 	# 
	inc de			;d2c9	13 	. 
	djnz $-14		;d2ca	10 f0 	. . 
	jp 0d278h		;d2cc	c3 78 d2 	. x . 
	ld h,060h		;d2cf	26 60 	& ` 
	ld e,(hl)			;d2d1	5e 	^ 
	inc h			;d2d2	24 	$ 
	ld d,(hl)			;d2d3	56 	V 
	ld hl,0fff8h		;d2d4	21 f8 ff 	! . . 
	add hl,de			;d2d7	19 	. 
	ld de,(0d1bch)		;d2d8	ed 5b bc d1 	. [ . . 
	ldi		;d2dc	ed a0 	. . 
	ldi		;d2de	ed a0 	. . 
	ldi		;d2e0	ed a0 	. . 
	ldi		;d2e2	ed a0 	. . 
	ldi		;d2e4	ed a0 	. . 
	ldi		;d2e6	ed a0 	. . 
	ldi		;d2e8	ed a0 	. . 
	ldi		;d2ea	ed a0 	. . 
	ld a,030h		;d2ec	3e 30 	> 0 
	ret			;d2ee	c9 	. 
	ld c,b			;d2ef	48 	H 
	ld a,(de)			;d2f0	1a 	. 
	add a,0a4h		;d2f1	c6 a4 	. . 
	ld (hl),a			;d2f3	77 	w 
	inc de			;d2f4	13 	. 
	inc hl			;d2f5	23 	# 
	djnz $-6		;d2f6	10 f8 	. . 
	ld a,c			;d2f8	79 	y 
	cp 00bh		;d2f9	fe 0b 	. . 
	ret c			;d2fb	d8 	. 
	ld b,c			;d2fc	41 	A 
	ld de,0fb80h		;d2fd	11 80 fb 	. . . 
	add hl,de			;d300	19 	. 
	dec hl			;d301	2b 	+ 
	ld (hl),001h		;d302	36 01 	6 . 
	djnz $-3		;d304	10 fb 	. . 
	ret			;d306	c9 	. 
	ld hl,08c34h		;d307	21 34 8c 	! 4 . 
	ld b,024h		;d30a	06 24 	. $ 
	ld a,0ffh		;d30c	3e ff 	> . 
	ld d,000h		;d30e	16 00 	. . 
	ld e,b			;d310	58 	X 
	ex de,hl			;d311	eb 	. 
	add hl,hl			;d312	29 	) 
	add hl,hl			;d313	29 	) 
	add hl,hl			;d314	29 	) 
	add hl,hl			;d315	29 	) 
	add hl,de			;d316	19 	. 
	ld d,a			;d317	57 	W 
	ld e,a			;d318	5f 	_ 
	ld (0d32ah),sp		;d319	ed 73 2a d3 	. s * . 
	di			;d31d	f3 	. 
	ld sp,hl			;d31e	f9 	. 
	push de			;d31f	d5 	. 
	push de			;d320	d5 	. 
	push de			;d321	d5 	. 
	push de			;d322	d5 	. 
	push de			;d323	d5 	. 
	push de			;d324	d5 	. 
	push de			;d325	d5 	. 
	push de			;d326	d5 	. 
	djnz $-8		;d327	10 f6 	. . 
	ld sp,00000h		;d329	31 00 00 	1 . . 
	ei			;d32c	fb 	. 
	ret			;d32d	c9 	. 
	ld b,048h		;d32e	06 48 	. H 
	ld hl,08e74h		;d330	21 74 8e 	! t . 
	jr $-39		;d333	18 d7 	. . 
	ld hl,(0effah)		;d335	2a fa ef 	* . . 
	ld bc,087b4h		;d338	01 b4 87 	. . . 
	add hl,bc			;d33b	09 	. 
	ld bc,0e640h		;d33c	01 40 e6 	. @ . 
	ld a,(0f8ech)		;d33f	3a ec f8 	: . . 
	dec a			;d342	3d 	= 
	jr z,$+96		;d343	28 5e 	( ^ 
	exx			;d345	d9 	. 
	ld a,b			;d346	78 	x 
	ld (0d35bh),a		;d347	32 5b d3 	2 [ . 
	ld a,020h		;d34a	3e 20 	>   
	sub b			;d34c	90 	. 
	ld (0d37bh),a		;d34d	32 7b d3 	2 { . 
	ld (0d380h),a		;d350	32 80 d3 	2 . . 
	exx			;d353	d9 	. 
	bit 7,d		;d354	cb 7a 	. z 
	jr nz,$+55		;d356	20 35 	  5 
	ld d,e			;d358	53 	S 
	exx			;d359	d9 	. 
	ld b,006h		;d35a	06 06 	. . 
	exx			;d35c	d9 	. 
	ld a,e			;d35d	7b 	{ 
	cp 020h		;d35e	fe 20 	.   
	jr nc,$+17		;d360	30 0f 	0 . 
	ld a,(hl)			;d362	7e 	~ 
	nop			;d363	00 	. 
	cp 0c7h		;d364	fe c7 	. . 
	jr nc,$+11		;d366	30 09 	0 . 
	exx			;d368	d9 	. 
	ld a,(de)			;d369	1a 	. 
	inc a			;d36a	3c 	< 
	jr z,$+5		;d36b	28 03 	( . 
	ld a,001h		;d36d	3e 01 	> . 
	ld (hl),a			;d36f	77 	w 
	exx			;d370	d9 	. 
	inc e			;d371	1c 	. 
	inc hl			;d372	23 	# 
	inc c			;d373	0c 	. 
	exx			;d374	d9 	. 
	inc hl			;d375	23 	# 
	inc de			;d376	13 	. 
	djnz $-27		;d377	10 e3 	. . 
	ld a,c			;d379	79 	y 
	ld c,020h		;d37a	0e 20 	.   
	add hl,bc			;d37c	09 	. 
	ld c,a			;d37d	4f 	O 
	exx			;d37e	d9 	. 
	ld a,000h		;d37f	3e 00 	> . 
	add a,l			;d381	85 	. 
	ld l,a			;d382	6f 	o 
	jr nc,$+3		;d383	30 01 	0 . 
	inc h			;d385	24 	$ 
	ld e,d			;d386	5a 	Z 
	exx			;d387	d9 	. 
	dec c			;d388	0d 	. 
	jp nz,0d35ah		;d389	c2 5a d3 	. Z . 
	ret			;d38c	c9 	. 
	call 0d409h		;d38d	cd 09 d4 	. . . 
	ret z			;d390	c8 	. 
	jr $-57		;d391	18 c5 	. . 
	push hl			;d393	e5 	. 
	ld a,l			;d394	7d 	} 
	sub 040h		;d395	d6 40 	. @ 
	ld l,a			;d397	6f 	o 
	ld a,h			;d398	7c 	| 
	sbc a,002h		;d399	de 02 	. . 
	ld h,a			;d39b	67 	g 
	ld (hl),001h		;d39c	36 01 	6 . 
	pop hl			;d39e	e1 	. 
	ld a,(de)			;d39f	1a 	. 
	jp 0d36fh		;d3a0	c3 6f d3 	. o . 
	ld c,045h		;d3a3	0e 45 	. E 
	exx			;d3a5	d9 	. 
	ld a,b			;d3a6	78 	x 
	ld (0d3b8h),a		;d3a7	32 b8 d3 	2 . . 
	dec a			;d3aa	3d 	= 
	add a,e			;d3ab	83 	. 
	ld e,a			;d3ac	5f 	_ 
	jr nc,$+3		;d3ad	30 01 	0 . 
	inc d			;d3af	14 	. 
	exx			;d3b0	d9 	. 
	bit 7,d		;d3b1	cb 7a 	. z 
	jr nz,$+64		;d3b3	20 3e 	  > 
	ld d,e			;d3b5	53 	S 
	exx			;d3b6	d9 	. 
	ld b,006h		;d3b7	06 06 	. . 
	exx			;d3b9	d9 	. 
	ld a,e			;d3ba	7b 	{ 
	cp 020h		;d3bb	fe 20 	.   
	jr nc,$+17		;d3bd	30 0f 	0 . 
	ld a,(hl)			;d3bf	7e 	~ 
	nop			;d3c0	00 	. 
	cp 0c7h		;d3c1	fe c7 	. . 
	jr nc,$+11		;d3c3	30 09 	0 . 
	exx			;d3c5	d9 	. 
	ld a,(de)			;d3c6	1a 	. 
	inc a			;d3c7	3c 	< 
	jr z,$+5		;d3c8	28 03 	( . 
	ld a,001h		;d3ca	3e 01 	> . 
	ld (hl),a			;d3cc	77 	w 
	exx			;d3cd	d9 	. 
	inc e			;d3ce	1c 	. 
	inc hl			;d3cf	23 	# 
	dec c			;d3d0	0d 	. 
	exx			;d3d1	d9 	. 
	inc hl			;d3d2	23 	# 
	dec de			;d3d3	1b 	. 
	djnz $-27		;d3d4	10 e3 	. . 
	ld a,c			;d3d6	79 	y 
	ld c,01ah		;d3d7	0e 1a 	. . 
	add hl,bc			;d3d9	09 	. 
	ex de,hl			;d3da	eb 	. 
	ld c,00ch		;d3db	0e 0c 	. . 
	add hl,bc			;d3dd	09 	. 
	ex de,hl			;d3de	eb 	. 
	ld c,a			;d3df	4f 	O 
	exx			;d3e0	d9 	. 
	ld a,01ah		;d3e1	3e 1a 	> . 
	add a,l			;d3e3	85 	. 
	ld l,a			;d3e4	6f 	o 
	jr nc,$+3		;d3e5	30 01 	0 . 
	inc h			;d3e7	24 	$ 
	ld e,d			;d3e8	5a 	Z 
	ld a,00ch		;d3e9	3e 0c 	> . 
	add a,c			;d3eb	81 	. 
	ld c,a			;d3ec	4f 	O 
	exx			;d3ed	d9 	. 
	dec c			;d3ee	0d 	. 
	jp nz,0d3b7h		;d3ef	c2 b7 d3 	. . . 
	ret			;d3f2	c9 	. 
	call 0d409h		;d3f3	cd 09 d4 	. . . 
	ret z			;d3f6	c8 	. 
	jr $-66		;d3f7	18 bc 	. . 
	push hl			;d3f9	e5 	. 
	ld a,l			;d3fa	7d 	} 
	sub 040h		;d3fb	d6 40 	. @ 
	ld l,a			;d3fd	6f 	o 
	ld a,h			;d3fe	7c 	| 
	sbc a,002h		;d3ff	de 02 	. . 
	ld h,a			;d401	67 	g 
	ld (hl),001h		;d402	36 01 	6 . 
	pop hl			;d404	e1 	. 
	ld a,(de)			;d405	1a 	. 
	jp 0d3cch		;d406	c3 cc d3 	. . . 
	ld a,020h		;d409	3e 20 	>   
	add a,l			;d40b	85 	. 
	ld l,a			;d40c	6f 	o 
	jr nc,$+3		;d40d	30 01 	0 . 
	inc h			;d40f	24 	$ 
	exx			;d410	d9 	. 
	ld a,b			;d411	78 	x 
	exx			;d412	d9 	. 
	add a,c			;d413	81 	. 
	ld c,a			;d414	4f 	O 
	exx			;d415	d9 	. 
	ld a,020h		;d416	3e 20 	>   
	add a,l			;d418	85 	. 
	ld l,a			;d419	6f 	o 
	jr nc,$+3		;d41a	30 01 	0 . 
	inc h			;d41c	24 	$ 
	ld a,b			;d41d	78 	x 
	add a,e			;d41e	83 	. 
	ld e,a			;d41f	5f 	_ 
	jr nc,$+3		;d420	30 01 	0 . 
	inc d			;d422	14 	. 
	dec c			;d423	0d 	. 
	ret z			;d424	c8 	. 
	exx			;d425	d9 	. 
	inc d			;d426	14 	. 
	jr nz,$-30		;d427	20 e0 	  . 
	inc d			;d429	14 	. 
	ret			;d42a	c9 	. 
	ld hl,0e66bh		;d42b	21 6b e6 	! k . 
	ld bc,004c8h		;d42e	01 c8 04 	. . . 
	ld a,(hl)			;d431	7e 	~ 
	inc a			;d432	3c 	< 
	cp c			;d433	b9 	. 
	ret nc			;d434	d0 	. 
	inc hl			;d435	23 	# 
	djnz $-5		;d436	10 f9 	. . 
	ret			;d438	c9 	. 
	call 0ce41h		;d439	cd 41 ce 	. A . 
	jr z,$+24		;d43c	28 16 	( . 
	ld a,(0f7feh)		;d43e	3a fe f7 	: . . 
	bit 4,a		;d441	cb 67 	. g 
	jp z,0d45ah		;d443	ca 5a d4 	. Z . 
	ld a,001h		;d446	3e 01 	> . 
	ld (0f8e0h),a		;d448	32 e0 f8 	2 . . 
	ld hl,0d4a7h		;d44b	21 a7 d4 	! . . 
	ld de,09b3fh		;d44e	11 3f 9b 	. ? . 
	jp 0db2ah		;d451	c3 2a db 	. * . 
	inc a			;d454	3c 	< 
	ld (0f8fdh),a		;d455	32 fd f8 	2 . . 
	jr $+7		;d458	18 05 	. . 
	bit 2,a		;d45a	cb 57 	. W 
	jp z,0db08h		;d45c	ca 08 db 	. . . 
	ld a,(0f7feh)		;d45f	3a fe f7 	: . . 
	bit 1,a		;d462	cb 4f 	. O 
	jr z,$+35		;d464	28 21 	( ! 
	ld a,(0f8ech)		;d466	3a ec f8 	: . . 
	dec a			;d469	3d 	= 
	jp z,0c2b1h		;d46a	ca b1 c2 	. . . 
	call 0d49eh		;d46d	cd 9e d4 	. . . 
	ld de,09df1h		;d470	11 f1 9d 	. . . 
	ld hl,0db8ah		;d473	21 8a db 	! . . 
	jp 0db2ah		;d476	c3 2a db 	. * . 
	bit 3,a		;d479	cb 5f 	. _ 
	jp z,0c2b4h		;d47b	ca b4 c2 	. . . 
	ld hl,0d439h		;d47e	21 39 d4 	! 9 . 
	ld de,09b7fh		;d481	11 7f 9b 	.  . 
	jp 0d897h		;d484	c3 97 d8 	. . . 
	bit 0,a		;d487	cb 47 	. G 
	jr z,$-16		;d489	28 ee 	( . 
	ld a,(0f8ech)		;d48b	3a ec f8 	: . . 
	or a			;d48e	b7 	. 
	jp z,0c2b0h		;d48f	ca b0 c2 	. . . 
	call 0d49eh		;d492	cd 9e d4 	. . . 
	ld de,09df1h		;d495	11 f1 9d 	. . . 
	ld hl,0db34h		;d498	21 34 db 	! 4 . 
	jp 0db2ah		;d49b	c3 2a db 	. * . 
	ld a,(0f8fdh)		;d49e	3a fd f8 	: . . 
	or a			;d4a1	b7 	. 
	ret nz			;d4a2	c0 	. 
	pop hl			;d4a3	e1 	. 
	jp 0c2b4h		;d4a4	c3 b4 c2 	. . . 
	ld a,(0f8e0h)		;d4a7	3a e0 f8 	: . . 
	or a			;d4aa	b7 	. 
	jr z,$+48		;d4ab	28 2e 	( . 
	ld a,(0e664h)		;d4ad	3a 64 e6 	: d . 
	inc a			;d4b0	3c 	< 
	jr z,$+18		;d4b1	28 10 	( . 
	ld de,08f34h		;d4b3	11 34 8f 	. 4 . 
	ld c,001h		;d4b6	0e 01 	. . 
	ld a,(0f8ech)		;d4b8	3a ec f8 	: . . 
	dec a			;d4bb	3d 	= 
	jr nz,$+4		;d4bc	20 02 	  . 
	ld e,039h		;d4be	1e 39 	. 9 
	call 0d5f4h		;d4c0	cd f4 d5 	. . . 
	ld a,(0e658h)		;d4c3	3a 58 e6 	: X . 
	inc a			;d4c6	3c 	< 
	jr z,$+16		;d4c7	28 0e 	( . 
	ld de,08ef4h		;d4c9	11 f4 8e 	. . . 
	ld a,(0f8ech)		;d4cc	3a ec f8 	: . . 
	dec a			;d4cf	3d 	= 
	jr nz,$+4		;d4d0	20 02 	  . 
	ld e,0f9h		;d4d2	1e f9 	. . 
	call 0d5f4h		;d4d4	cd f4 d5 	. . . 
	xor a			;d4d7	af 	. 
	ld (0f8e0h),a		;d4d8	32 e0 f8 	2 . . 
	ld a,(0f7feh)		;d4db	3a fe f7 	: . . 
	bit 4,a		;d4de	cb 67 	. g 
	jp nz,0c2b4h		;d4e0	c2 b4 c2 	. . . 
	xor a			;d4e3	af 	. 
	ld (0f8fah),a		;d4e4	32 fa f8 	2 . . 
	ld hl,0d439h		;d4e7	21 39 d4 	! 9 . 
	ld de,09b7fh		;d4ea	11 7f 9b 	.  . 
	jp 0db2ah		;d4ed	c3 2a db 	. * . 
	ld hl,0f8e0h		;d4f0	21 e0 f8 	! . . 
	dec (hl)			;d4f3	35 	5 
	jp nz,0c2b4h		;d4f4	c2 b4 c2 	. . . 
	ld hl,(0f8f0h)		;d4f7	2a f0 f8 	* . . 
	ld a,(hl)			;d4fa	7e 	~ 
	ld (0f8f2h),a		;d4fb	32 f2 f8 	2 . . 
	ld b,005h		;d4fe	06 05 	. . 
	inc hl			;d500	23 	# 
	ld a,(hl)			;d501	7e 	~ 
	dec hl			;d502	2b 	+ 
	ld (hl),a			;d503	77 	w 
	inc hl			;d504	23 	# 
	cp 003h		;d505	fe 03 	. . 
	jr z,$+4		;d507	28 02 	( . 
	djnz $-9		;d509	10 f5 	. . 
	dec hl			;d50b	2b 	+ 
	ld a,(0f8f2h)		;d50c	3a f2 f8 	: . . 
	cp 004h		;d50f	fe 04 	. . 
	jr nz,$+38		;d511	20 24 	  $ 
	ld (hl),003h		;d513	36 03 	6 . 
	ld hl,(0ef83h)		;d515	2a 83 ef 	* . . 
	inc hl			;d518	23 	# 
	ld (0ef83h),hl		;d519	22 83 ef 	" . . 
	ex de,hl			;d51c	eb 	. 
	ld hl,0ef85h		;d51d	21 85 ef 	! . . 
	inc (hl)			;d520	34 	4 
	dec hl			;d521	2b 	+ 
	ld a,r		;d522	ed 5f 	. _ 
	and 001h		;d524	e6 01 	. . 
	add a,025h		;d526	c6 25 	. % 
	call 0d060h		;d528	cd 60 d0 	. ` . 
	ld de,00104h		;d52b	11 04 01 	. . . 
	call 0dbdfh		;d52e	cd df db 	. . . 
	call 0e04ah		;d531	cd 4a e0 	. J . 
	jp 0db08h		;d534	c3 08 db 	. . . 
	ld b,000h		;d537	06 00 	. . 
	ld a,000h		;d539	3e 00 	> . 
	or a			;d53b	b7 	. 
	jr nz,$+4		;d53c	20 02 	  . 
	ld b,080h		;d53e	06 80 	. . 
	ld a,(0ef76h)		;d540	3a 76 ef 	: v . 
	or a			;d543	b7 	. 
	jr nz,$+5		;d544	20 03 	  . 
	ld b,a			;d546	47 	G 
	ld a,003h		;d547	3e 03 	> . 
	or b			;d549	b0 	. 
	ld (hl),a			;d54a	77 	w 
	jp p,0d553h		;d54b	f2 53 d5 	. S . 
	ld a,001h		;d54e	3e 01 	> . 
	ld (0d53ah),a		;d550	32 3a d5 	2 : . 
	ld a,(0f8f2h)		;d553	3a f2 f8 	: . . 
	bit 7,a		;d556	cb 7f 	.  
	jr z,$+21		;d558	28 13 	( . 
	and 07fh		;d55a	e6 7f 	.  
	ex af,af'			;d55c	08 	. 
	ld hl,08f8fh		;d55d	21 8f 8f 	! . . 
	ld (05adbh),hl		;d560	22 db 5a 	" . Z 
	ld (05addh),hl		;d563	22 dd 5a 	" . Z 
	ld hl,06760h		;d566	21 60 67 	! ` g 
	call 0d064h		;d569	cd 64 d0 	. d . 
	ex af,af'			;d56c	08 	. 
	cp 003h		;d56d	fe 03 	. . 
	jr nz,$+3		;d56f	20 01 	  . 
	xor a			;d571	af 	. 
	ld (0ef76h),a		;d572	32 76 ef 	2 v . 
	call 0d6a5h		;d575	cd a5 d6 	. . . 
	jp 0db08h		;d578	c3 08 db 	. . . 
	ld a,(0e64ch)		;d57b	3a 4c e6 	: L . 
	inc a			;d57e	3c 	< 
	jr z,$+102		;d57f	28 64 	( d 
	ld a,(0ef76h)		;d581	3a 76 ef 	: v . 
	or a			;d584	b7 	. 
	jr z,$+74		;d585	28 48 	( H 
	ld a,(0f8ech)		;d587	3a ec f8 	: . . 
	dec a			;d58a	3d 	= 
	ld bc,00804h		;d58b	01 04 08 	. . . 
	ld de,00044h		;d58e	11 44 00 	. D . 
	jr z,$+7		;d591	28 05 	( . 
	ld bc,00401h		;d593	01 01 04 	. . . 
	ld e,041h		;d596	1e 41 	. A 
	ld hl,(0effah)		;d598	2a fa ef 	* . . 
	add hl,de			;d59b	19 	. 
	ld (0ef4fh),hl		;d59c	22 4f ef 	" O . 
	ld hl,(0effch)		;d59f	2a fc ef 	* . . 
	ld a,c			;d5a2	79 	y 
	add a,l			;d5a3	85 	. 
	inc h			;d5a4	24 	$ 
	inc h			;d5a5	24 	$ 
	ld l,h			;d5a6	6c 	l 
	ld h,a			;d5a7	67 	g 
	ld (0ef4dh),hl		;d5a8	22 4d ef 	" M . 
	ld hl,0ef76h		;d5ab	21 76 ef 	! v . 
	ld a,(hl)			;d5ae	7e 	~ 
	ld (hl),000h		;d5af	36 00 	6 . 
	add a,a			;d5b1	87 	. 
	add a,0d0h		;d5b2	c6 d0 	. . 
	ld (0ef4ch),a		;d5b4	32 4c ef 	2 L . 
	ld hl,0ef51h		;d5b7	21 51 ef 	! Q . 
	ld (hl),b			;d5ba	70 	p 
	inc hl			;d5bb	23 	# 
	ld a,(0f7feh)		;d5bc	3a fe f7 	: . . 
	bit 3,a		;d5bf	cb 5f 	. _ 
	jr nz,$+7		;d5c1	20 05 	  . 
	and 004h		;d5c3	e6 04 	. . 
	jr z,$+4		;d5c5	28 02 	( . 
	inc b			;d5c7	04 	. 
	inc b			;d5c8	04 	. 
	ld (hl),b			;d5c9	70 	p 
	call 0d6a2h		;d5ca	cd a2 d6 	. . . 
	jr $+24		;d5cd	18 16 	. . 
	ld a,(0f8e0h)		;d5cf	3a e0 f8 	: . . 
	or a			;d5d2	b7 	. 
	jr z,$+22		;d5d3	28 14 	( . 
	ld de,08e94h		;d5d5	11 94 8e 	. . . 
	ld c,001h		;d5d8	0e 01 	. . 
	ld a,(0f8ech)		;d5da	3a ec f8 	: . . 
	dec a			;d5dd	3d 	= 
	jr nz,$+4		;d5de	20 02 	  . 
	ld e,099h		;d5e0	1e 99 	. . 
	call 0d5f4h		;d5e2	cd f4 d5 	. . . 
	xor a			;d5e5	af 	. 
	ld (0f8e0h),a		;d5e6	32 e0 f8 	2 . . 
	ld a,(0f7feh)		;d5e9	3a fe f7 	: . . 
	bit 4,a		;d5ec	cb 67 	. g 
	jp z,0db08h		;d5ee	ca 08 db 	. . . 
	jp 0c2b4h		;d5f1	c3 b4 c2 	. . . 
	ld hl,(0effah)		;d5f4	2a fa ef 	* . . 
	add hl,de			;d5f7	19 	. 
	ld a,(hl)			;d5f8	7e 	~ 
	inc a			;d5f9	3c 	< 
	jr z,$+25		;d5fa	28 17 	( . 
	cp 0a4h		;d5fc	fe a4 	. . 
	jr c,$+6		;d5fe	38 04 	8 . 
	cp 0a7h		;d600	fe a7 	. . 
	jr c,$+17		;d602	38 0f 	8 . 
	ld a,001h		;d604	3e 01 	> . 
	ld (0fb0eh),a		;d606	32 0e fb 	2 . . 
	ld a,001h		;d609	3e 01 	> . 
	ld (0f8e0h),a		;d60b	32 e0 f8 	2 . . 
	ld a,c			;d60e	79 	y 
	ld (0c459h),a		;d60f	32 59 c4 	2 Y . 
	ret			;d612	c9 	. 
	ld de,00240h		;d613	11 40 02 	. @ . 
	add hl,de			;d616	19 	. 
	ld a,(hl)			;d617	7e 	~ 
	inc a			;d618	3c 	< 
	ret z			;d619	c8 	. 
	ld a,002h		;d61a	3e 02 	> . 
	jr $-22		;d61c	18 e8 	. . 
	ld a,002h		;d61e	3e 02 	> . 
	ld (0f8e0h),a		;d620	32 e0 f8 	2 . . 
	ld hl,0d62ch		;d623	21 2c d6 	! , . 
	ld de,09d1eh		;d626	11 1e 9d 	. . . 
	jp 0db2ah		;d629	c3 2a db 	. * . 
	ld hl,0f8e0h		;d62c	21 e0 f8 	! . . 
	dec (hl)			;d62f	35 	5 
	jr nz,$+11		;d630	20 09 	  . 
	ld hl,0db08h		;d632	21 08 db 	! . . 
	ld de,09cf6h		;d635	11 f6 9c 	. . . 
	jp 0db2ah		;d638	c3 2a db 	. * . 
	ld a,(0e647h)		;d63b	3a 47 e6 	: G . 
	inc a			;d63e	3c 	< 
	jr z,$+18		;d63f	28 10 	( . 
	ld de,08e95h		;d641	11 95 8e 	. . . 
	ld c,002h		;d644	0e 02 	. . 
	ld a,(0f8ech)		;d646	3a ec f8 	: . . 
	dec a			;d649	3d 	= 
	jr nz,$+4		;d64a	20 02 	  . 
	ld e,098h		;d64c	1e 98 	. . 
	call 0d5f4h		;d64e	cd f4 d5 	. . . 
	jp 0c2b4h		;d651	c3 b4 c2 	. . . 
	ld hl,0f7ffh		;d654	21 ff f7 	! . . 
	dec (hl)			;d657	35 	5 
	ret nz			;d658	c0 	. 
	ld (hl),002h		;d659	36 02 	6 . 
	ld a,(0df20h)		;d65b	3a 20 df 	:   . 
	cp 00eh		;d65e	fe 0e 	. . 
	jr nz,$+8		;d660	20 06 	  . 
	ld a,(0df2eh)		;d662	3a 2e df 	: . . 
	cp 001h		;d665	fe 01 	. . 
	ret z			;d667	c8 	. 
	call 0d670h		;d668	cd 70 d6 	. p . 
	ld b,001h		;d66b	06 01 	. . 
	call 0df1eh		;d66d	cd 1e df 	. . . 
	ld hl,0df2eh		;d670	21 2e df 	! . . 
	rrc (hl)		;d673	cb 0e 	. . 
	ret nc			;d675	d0 	. 
	ld hl,0df20h		;d676	21 20 df 	!   . 
	inc (hl)			;d679	34 	4 
	ret			;d67a	c9 	. 
	or a			;d67b	b7 	. 
	jr nz,$+33		;d67c	20 1f 	  . 
	ld hl,0d53ah		;d67e	21 3a d5 	! : . 
	ld a,(hl)			;d681	7e 	~ 
	or a			;d682	b7 	. 
	jr z,$+26		;d683	28 18 	( . 
	dec (hl)			;d685	35 	5 
	ld hl,(0f8f0h)		;d686	2a f0 f8 	* . . 
	ld b,005h		;d689	06 05 	. . 
	res 7,(hl)		;d68b	cb be 	. . 
	inc hl			;d68d	23 	# 
	djnz $-3		;d68e	10 fb 	. . 
	ld hl,00f0fh		;d690	21 0f 0f 	! . . 
	ld (05adbh),hl		;d693	22 db 5a 	" . Z 
	ld (05addh),hl		;d696	22 dd 5a 	" . Z 
	call 0dbedh		;d699	cd ed db 	. . . 
	xor a			;d69c	af 	. 
	ld de,0507bh		;d69d	11 7b 50 	. { P 
	jr $+8		;d6a0	18 06 	. . 
	ld a,(0ef76h)		;d6a2	3a 76 ef 	: v . 
	ld de,05061h		;d6a5	11 61 50 	. a P 
	push de			;d6a8	d5 	. 
	add a,a			;d6a9	87 	. 
	add a,0c0h		;d6aa	c6 c0 	. . 
	ld (0d6b0h),a		;d6ac	32 b0 d6 	2 . . 
	ld hl,(094c0h)		;d6af	2a c0 94 	* . . 
	ld de,0e0e0h		;d6b2	11 e0 e0 	. . . 
	call 094d0h		;d6b5	cd d0 94 	. . . 
	pop de			;d6b8	d1 	. 
	ld hl,0e0e0h		;d6b9	21 e0 e0 	! . . 
	ld c,06ch		;d6bc	0e 6c 	. l 
	ld b,008h		;d6be	06 08 	. . 
	push de			;d6c0	d5 	. 
	ldi		;d6c1	ed a0 	. . 
	ldi		;d6c3	ed a0 	. . 
	ldi		;d6c5	ed a0 	. . 
	ldi		;d6c7	ed a0 	. . 
	pop de			;d6c9	d1 	. 
	inc d			;d6ca	14 	. 
	djnz $-11		;d6cb	10 f3 	. . 
	ld a,d			;d6cd	7a 	z 
	sub 008h		;d6ce	d6 08 	. . 
	ld d,a			;d6d0	57 	W 
	ld a,e			;d6d1	7b 	{ 
	add a,020h		;d6d2	c6 20 	.   
	ld e,a			;d6d4	5f 	_ 
	cp 0c0h		;d6d5	fe c0 	. . 
	jr c,$-25		;d6d7	38 e5 	8 . 
	ld d,05ah		;d6d9	16 5a 	. Z 
	ld a,e			;d6db	7b 	{ 
	sub 060h		;d6dc	d6 60 	. ` 
	ld e,a			;d6de	5f 	_ 
	ld b,003h		;d6df	06 03 	. . 
	ldi		;d6e1	ed a0 	. . 
	ldi		;d6e3	ed a0 	. . 
	ldi		;d6e5	ed a0 	. . 
	ldi		;d6e7	ed a0 	. . 
	ld a,01ch		;d6e9	3e 1c 	> . 
	add a,e			;d6eb	83 	. 
	ld e,a			;d6ec	5f 	_ 
	djnz $-12		;d6ed	10 f2 	. . 
	ret			;d6ef	c9 	. 
	call 0d654h		;d6f0	cd 54 d6 	. T . 
	call 0d42bh		;d6f3	cd 2b d4 	. + . 
	jr nc,$+16		;d6f6	30 0e 	0 . 
	ld de,09c43h		;d6f8	11 43 9c 	. C . 
	ld a,001h		;d6fb	3e 01 	> . 
	ld (0f8fah),a		;d6fd	32 fa f8 	2 . . 
	ld hl,0d9b4h		;d700	21 b4 d9 	! . . 
	jp 0db2ah		;d703	c3 2a db 	. * . 
	ld a,(0f8f3h)		;d706	3a f3 f8 	: . . 
	cp 010h		;d709	fe 10 	. . 
	jp z,0d7efh		;d70b	ca ef d7 	. . . 
	cp 0c8h		;d70e	fe c8 	. . 
	jp z,0df4dh		;d710	ca 4d df 	. M . 
	call 0ce41h		;d713	cd 41 ce 	. A . 
	jp z,0d454h		;d716	ca 54 d4 	. T . 
	ld a,(0f7feh)		;d719	3a fe f7 	: . . 
	bit 4,a		;d71c	cb 67 	. g 
	jp z,0d7e5h		;d71e	ca e5 d7 	. . . 
	ld a,(0e654h)		;d721	3a 54 e6 	: T . 
	inc a			;d724	3c 	< 
	jp z,0d7cah		;d725	ca ca d7 	. . . 
	ld hl,(0effah)		;d728	2a fa ef 	* . . 
	ld de,08a56h		;d72b	11 56 8a 	. V . 
	add hl,de			;d72e	19 	. 
	ld a,(hl)			;d72f	7e 	~ 
	cp 08ah		;d730	fe 8a 	. . 
	jp nz,0d7cah		;d732	c2 ca d7 	. . . 
	ld a,(0c25ah)		;d735	3a 5a c2 	: Z . 
	cp 03dh		;d738	fe 3d 	. = 
	jr z,$+62		;d73a	28 3c 	( < 
	cp 04dh		;d73c	fe 4d 	. M 
	jr z,$+34		;d73e	28 20 	(   
	ld a,(071a4h)		;d740	3a a4 71 	: . q 
	or a			;d743	b7 	. 
	call z,0db14h		;d744	cc 14 db 	. . . 
	call nz,0db1dh		;d747	c4 1d db 	. . . 
	ld hl,067a4h		;d74a	21 a4 67 	! . g 
	inc a			;d74d	3c 	< 
	jr z,$+13		;d74e	28 0b 	( . 
	ld hl,067b1h		;d750	21 b1 67 	! . g 
	call 0e02dh		;d753	cd 2d e0 	. - . 
	call 0d064h		;d756	cd 64 d0 	. d . 
	jr $+94		;d759	18 5c 	. \ 
	call 0e044h		;d75b	cd 44 e0 	. D . 
	jr $-8		;d75e	18 f6 	. . 
	ld a,(0c101h)		;d760	3a 01 c1 	: . . 
	inc a			;d763	3c 	< 
	jr z,$+102		;d764	28 64 	( d 
	ld hl,0c7f1h		;d766	21 f1 c7 	! . . 
	ld a,(hl)			;d769	7e 	~ 
	xor 011h		;d76a	ee 11 	. . 
	ld (hl),a			;d76c	77 	w 
	ld hl,067cah		;d76d	21 ca 67 	! . g 
	inc a			;d770	3c 	< 
	jr z,$-22		;d771	28 e8 	( . 
	ld hl,067bdh		;d773	21 bd 67 	! . g 
	jr $-35		;d776	18 db 	. . 
	ld hl,0ef86h		;d778	21 86 ef 	! . . 
	ld a,(hl)			;d77b	7e 	~ 
	dec hl			;d77c	2b 	+ 
	or a			;d77d	b7 	. 
	jr z,$+3		;d77e	28 01 	( . 
	ld (hl),a			;d780	77 	w 
	ld de,05066h		;d781	11 66 50 	. f P 
	ld a,(hl)			;d784	7e 	~ 
	or a			;d785	b7 	. 
	jr z,$+52		;d786	28 32 	( 2 
	ld a,(0f8f8h)		;d788	3a f8 f8 	: . . 
	cp (hl)			;d78b	be 	. 
	jr c,$+4		;d78c	38 02 	8 . 
	jr nz,$+49		;d78e	20 2f 	  / 
	inc hl			;d790	23 	# 
	ld a,(hl)			;d791	7e 	~ 
	or a			;d792	b7 	. 
	jr nz,$+11		;d793	20 09 	  . 
	ld de,00504h		;d795	11 04 05 	. . . 
	call 0dbdfh		;d798	cd df db 	. . . 
	call 0e02dh		;d79b	cd 2d e0 	. - . 
	ld a,(0ef85h)		;d79e	3a 85 ef 	: . . 
	ld (0ef86h),a		;d7a1	32 86 ef 	2 . . 
	ld hl,0676eh		;d7a4	21 6e 67 	! n g 
	call 0d064h		;d7a7	cd 64 d0 	. d . 
	ld e,085h		;d7aa	1e 85 	. . 
	ld (0ef83h),de		;d7ac	ed 53 83 ef 	. S . . 
	inc de			;d7b0	13 	. 
	ld hl,0686bh		;d7b1	21 6b 68 	! k h 
	call 0d067h		;d7b4	cd 67 d0 	. g . 
	jp 0c2b4h		;d7b7	c3 b4 c2 	. . . 
	ld hl,06797h		;d7ba	21 97 67 	! . g 
	jr $-9		;d7bd	18 f5 	. . 
	call 0e044h		;d7bf	cd 44 e0 	. D . 
	ld hl,0677ch		;d7c2	21 7c 67 	! | g 
	call 0d067h		;d7c5	cd 67 d0 	. g . 
	jr $-30		;d7c8	18 e0 	. . 
	ld a,(0ef77h)		;d7ca	3a 77 ef 	: w . 
	or a			;d7cd	b7 	. 
	jr z,$+13		;d7ce	28 0b 	( . 
	ld a,002h		;d7d0	3e 02 	> . 
	ld de,09b7fh		;d7d2	11 7f 9b 	.  . 
	ld hl,0d4f0h		;d7d5	21 f0 d4 	! . . 
	jp 0db27h		;d7d8	c3 27 db 	. ' . 
	inc a			;d7db	3c 	< 
	ld hl,0d57bh		;d7dc	21 7b d5 	! { . 
	ld de,09c1ah		;d7df	11 1a 9c 	. . . 
	jp 0db27h		;d7e2	c3 27 db 	. ' . 
	bit 1,a		;d7e5	cb 4f 	. O 
	jr z,$+20		;d7e7	28 12 	( . 
	ld a,(0f8ech)		;d7e9	3a ec f8 	: . . 
	dec a			;d7ec	3d 	= 
	jr z,$+111		;d7ed	28 6d 	( m 
	call 0d8d7h		;d7ef	cd d7 d8 	. . . 
	ld hl,0cef1h		;d7f2	21 f1 ce 	! . . 
	ld de,09c6bh		;d7f5	11 6b 9c 	. k . 
	jp 0db2ah		;d7f8	c3 2a db 	. * . 
	bit 2,a		;d7fb	cb 57 	. W 
	jr z,$+84		;d7fd	28 52 	( R 
	ld a,(0f8ech)		;d7ff	3a ec f8 	: . . 
	or a			;d802	b7 	. 
	ld a,(0e66fh)		;d803	3a 6f e6 	: o . 
	jr z,$+5		;d806	28 03 	( . 
	ld a,(0e66ah)		;d808	3a 6a e6 	: j . 
	cp 0d5h		;d80b	fe d5 	. . 
	jr nz,$+18		;d80d	20 10 	  . 
	ld a,(089b9h)		;d80f	3a b9 89 	: . . 
	cp 008h		;d812	fe 08 	. . 
	jr nz,$+11		;d814	20 09 	  . 
	call 0dbedh		;d816	cd ed db 	. . . 
	ld hl,0da23h		;d819	21 23 da 	! # . 
	jp 0db2eh		;d81c	c3 2e db 	. . . 
	ld a,(0f8ech)		;d81f	3a ec f8 	: . . 
	ld hl,0e66ch		;d822	21 6c e6 	! l . 
	add a,l			;d825	85 	. 
	ld l,a			;d826	6f 	o 
	ld a,(hl)			;d827	7e 	~ 
	cp 02ch		;d828	fe 2c 	. , 
	jr z,$+15		;d82a	28 0d 	( . 
	cp 025h		;d82c	fe 25 	. % 
	jr z,$+11		;d82e	28 09 	( . 
	cp 009h		;d830	fe 09 	. . 
	jr z,$+7		;d832	28 05 	( . 
	cp 005h		;d834	fe 05 	. . 
	jp nz,0d4e3h		;d836	c2 e3 d4 	. . . 
	ld hl,0d8e3h		;d839	21 e3 d8 	! . . 
	ld (0c2aeh),hl		;d83c	22 ae c2 	" . . 
	ld hl,09bf3h		;d83f	21 f3 9b 	! . . 
	ld (0cc6dh),hl		;d842	22 6d cc 	" m . 
	jp 0d97bh		;d845	c3 7b d9 	. { . 
	ld hl,0d8e3h		;d848	21 e3 d8 	! . . 
	ld de,09bf3h		;d84b	11 f3 9b 	. . . 
	jp 0db2ah		;d84e	c3 2a db 	. * . 
	bit 0,a		;d851	cb 47 	. G 
	jr z,$+23		;d853	28 15 	( . 
	ld a,(0f8ech)		;d855	3a ec f8 	: . . 
	or a			;d858	b7 	. 
	jr nz,$+9		;d859	20 07 	  . 
	inc a			;d85b	3c 	< 
	ld (0f8ech),a		;d85c	32 ec f8 	2 . . 
	jp 0c2b4h		;d85f	c3 b4 c2 	. . . 
	call 0d8d7h		;d862	cd d7 d8 	. . . 
	ld hl,0ce59h		;d865	21 59 ce 	! Y . 
	jr $-115		;d868	18 8b 	. . 
	bit 3,a		;d86a	cb 5f 	. _ 
	jp z,0c2b4h		;d86c	ca b4 c2 	. . . 
	ld a,(0f8ech)		;d86f	3a ec f8 	: . . 
	or a			;d872	b7 	. 
	jr nz,$+68		;d873	20 42 	  B 
	ld hl,(0effah)		;d875	2a fa ef 	* . . 
	ld de,08a34h		;d878	11 34 8a 	. 4 . 
	add hl,de			;d87b	19 	. 
	ld a,(hl)			;d87c	7e 	~ 
	cp 01bh		;d87d	fe 1b 	. . 
	jr nz,$+56		;d87f	20 36 	  6 
	ld hl,0cfa4h		;d881	21 a4 cf 	! . . 
	ld de,09ab0h		;d884	11 b0 9a 	. . . 
	ld a,0fdh		;d887	3e fd 	> . 
	ld (0f8f3h),a		;d889	32 f3 f8 	2 . . 
	ld a,06dh		;d88c	3e 6d 	> m 
	jp 0db27h		;d88e	c3 27 db 	. ' . 
	ld hl,0d61eh		;d891	21 1e d6 	! . . 
	ld de,09cf6h		;d894	11 f6 9c 	. . . 
	ld a,(0f8ech)		;d897	3a ec f8 	: . . 
	ld bc,0e666h		;d89a	01 66 e6 	. f . 
	add a,c			;d89d	81 	. 
	ld c,a			;d89e	4f 	O 
	ld a,(bc)			;d89f	0a 	. 
	cp 009h		;d8a0	fe 09 	. . 
	jr z,$-90		;d8a2	28 a4 	( . 
	cp 005h		;d8a4	fe 05 	. . 
	jr z,$-94		;d8a6	28 a0 	( . 
	cp 025h		;d8a8	fe 25 	. % 
	jr z,$-98		;d8aa	28 9c 	( . 
	cp 02ch		;d8ac	fe 2c 	. , 
	jr z,$-102		;d8ae	28 98 	( . 
	cp 010h		;d8b0	fe 10 	. . 
	jr z,$-106		;d8b2	28 94 	( . 
	jp 0db2ah		;d8b4	c3 2a db 	. * . 
	ld a,(0f8ech)		;d8b7	3a ec f8 	: . . 
	or a			;d8ba	b7 	. 
	ld a,(0e66ah)		;d8bb	3a 6a e6 	: j . 
	jr z,$+5		;d8be	28 03 	( . 
	ld a,(0e66fh)		;d8c0	3a 6f e6 	: o . 
	cp 0d4h		;d8c3	fe d4 	. . 
	jr nz,$-52		;d8c5	20 ca 	  . 
	ld a,(089b9h)		;d8c7	3a b9 89 	: . . 
	cp 008h		;d8ca	fe 08 	. . 
	jr z,$-59		;d8cc	28 c3 	( . 
	call 0dbedh		;d8ce	cd ed db 	. . . 
	ld hl,0da93h		;d8d1	21 93 da 	! . . 
	jp 0db2eh		;d8d4	c3 2e db 	. . . 
	ld hl,09c94h		;d8d7	21 94 9c 	! . . 
	ld (0d032h),hl		;d8da	22 32 d0 	" 2 . 
	ld bc,00010h		;d8dd	01 10 00 	. . . 
	jp 0d034h		;d8e0	c3 34 d0 	. 4 . 
	ld a,(0f8ech)		;d8e3	3a ec f8 	: . . 
	ld hl,0e666h		;d8e6	21 66 e6 	! f . 
	add a,l			;d8e9	85 	. 
	ld l,a			;d8ea	6f 	o 
	ld a,(hl)			;d8eb	7e 	~ 
	cp 009h		;d8ec	fe 09 	. . 
	jr z,$+25		;d8ee	28 17 	( . 
	cp 02ch		;d8f0	fe 2c 	. , 
	jr z,$+21		;d8f2	28 13 	( . 
	cp 005h		;d8f4	fe 05 	. . 
	jr z,$+17		;d8f6	28 0f 	( . 
	cp 010h		;d8f8	fe 10 	. . 
	jr z,$+13		;d8fa	28 0b 	( . 
	cp 025h		;d8fc	fe 25 	. % 
	jr z,$+9		;d8fe	28 07 	( . 
	cp 0c8h		;d900	fe c8 	. . 
	jr nc,$+5		;d902	30 03 	0 . 
	jp 0db08h		;d904	c3 08 db 	. . . 
	ld a,(0f7feh)		;d907	3a fe f7 	: . . 
	bit 0,a		;d90a	cb 47 	. G 
	jr z,$+6		;d90c	28 04 	( . 
	ld a,001h		;d90e	3e 01 	> . 
	jr $+7		;d910	18 05 	. . 
	bit 1,a		;d912	cb 4f 	. O 
	jr z,$+26		;d914	28 18 	( . 
	xor a			;d916	af 	. 
	ld (0f8ech),a		;d917	32 ec f8 	2 . . 
	ld a,(0e665h)		;d91a	3a 65 e6 	: e . 
	cp 0c7h		;d91d	fe c7 	. . 
	jp nc,0c2b4h		;d91f	d2 b4 c2 	. . . 
	ld a,(0e66bh)		;d922	3a 6b e6 	: k . 
	inc a			;d925	3c 	< 
	cp 0c7h		;d926	fe c7 	. . 
	jp nc,0db08h		;d928	d2 08 db 	. . . 
	jp 0c2b4h		;d92b	c3 b4 c2 	. . . 
	bit 3,a		;d92e	cb 5f 	. _ 
	jr z,$+52		;d930	28 32 	( 2 
	ld de,0effdh		;d932	11 fd ef 	. . . 
	ld a,(de)			;d935	1a 	. 
	dec a			;d936	3d 	= 
	jp m,0d947h		;d937	fa 47 d9 	. G . 
	ld hl,(0effah)		;d93a	2a fa ef 	* . . 
	ld bc,08796h		;d93d	01 96 87 	. . . 
	add hl,bc			;d940	09 	. 
	ld a,(hl)			;d941	7e 	~ 
	cp 0cdh		;d942	fe cd 	. . 
	jp nc,0c2b4h		;d944	d2 b4 c2 	. . . 
	ex de,hl			;d947	eb 	. 
	dec (hl)			;d948	35 	5 
	ld de,0ffe0h		;d949	11 e0 ff 	. . . 
	call 0d955h		;d94c	cd 55 d9 	. U . 
	call 0cfe2h		;d94f	cd e2 cf 	. . . 
	jp 0c2b4h		;d952	c3 b4 c2 	. . . 
	ld hl,(0effah)		;d955	2a fa ef 	* . . 
	add hl,de			;d958	19 	. 
	ld (0effah),hl		;d959	22 fa ef 	" . . 
	ld hl,0f8ech		;d95c	21 ec f8 	! . . 
	ld a,001h		;d95f	3e 01 	> . 
	xor (hl)			;d961	ae 	. 
	ld (hl),a			;d962	77 	w 
	ret			;d963	c9 	. 
	bit 2,a		;d964	cb 57 	. W 
	jp z,0c2b4h		;d966	ca b4 c2 	. . . 
	ld a,(0e66ch)		;d969	3a 6c e6 	: l . 
	inc a			;d96c	3c 	< 
	cp 0c7h		;d96d	fe c7 	. . 
	jp nc,0db08h		;d96f	d2 08 db 	. . . 
	ld a,(0e66dh)		;d972	3a 6d e6 	: m . 
	inc a			;d975	3c 	< 
	cp 0c7h		;d976	fe c7 	. . 
	jp nc,0db08h		;d978	d2 08 db 	. . . 
	call 0d988h		;d97b	cd 88 d9 	. . . 
	inc (hl)			;d97e	34 	4 
	ld de,00020h		;d97f	11 20 00 	.   . 
	call 0d955h		;d982	cd 55 d9 	. U . 
	jp 0c2b4h		;d985	c3 b4 c2 	. . . 
	ld hl,0effdh		;d988	21 fd ef 	! . . 
	ld a,(hl)			;d98b	7e 	~ 
	cp 00bh		;d98c	fe 0b 	. . 
	ret nz			;d98e	c0 	. 
	ld hl,0efffh		;d98f	21 ff ef 	! . . 
	inc (hl)			;d992	34 	4 
	pop hl			;d993	e1 	. 
	sub 011h		;d994	d6 11 	. . 
	ld (0effdh),a		;d996	32 fd ef 	2 . . 
	ld hl,(0effah)		;d999	2a fa ef 	* . . 
	ld de,0fde0h		;d99c	11 e0 fd 	. . . 
	add hl,de			;d99f	19 	. 
	ld de,00020h		;d9a0	11 20 00 	.   . 
	ld (0effah),hl		;d9a3	22 fa ef 	" . . 
	ld hl,(0c123h)		;d9a6	2a 23 c1 	* # . 
	add hl,de			;d9a9	19 	. 
	ld (0c123h),hl		;d9aa	22 23 c1 	" # . 
	xor a			;d9ad	af 	. 
	ld (0d238h),a		;d9ae	32 38 d2 	2 8 . 
	jp 0c0a2h		;d9b1	c3 a2 c0 	. . . 
	call 0d988h		;d9b4	cd 88 d9 	. . . 
	call 0d42bh		;d9b7	cd 2b d4 	. + . 
	jr c,$+88		;d9ba	38 56 	8 V 
	ld a,(0f8f9h)		;d9bc	3a f9 f8 	: . . 
	or a			;d9bf	b7 	. 
	jr z,$+55		;d9c0	28 35 	( 5 
	ld b,014h		;d9c2	06 14 	. . 
	ld de,06739h		;d9c4	11 39 67 	. 9 g 
	dec a			;d9c7	3d 	= 
	jr nz,$+5		;d9c8	20 03 	  . 
	ld de,0674ch		;d9ca	11 4c 67 	. L g 
	ld hl,08afah		;d9cd	21 fa 8a 	! . . 
	call 0d2efh		;d9d0	cd ef d2 	. . . 
	ld a,(0f8f3h)		;d9d3	3a f3 f8 	: . . 
	cp 0fdh		;d9d6	fe fd 	. . 
	jr nz,$+20		;d9d8	20 12 	  . 
	ld de,09d46h		;d9da	11 46 9d 	. F . 
	ld bc,089f4h		;d9dd	01 f4 89 	. . . 
	call 0cf67h		;d9e0	cd 67 cf 	. g . 
	ld de,0a44ah		;d9e3	11 4a a4 	. J . 
	ld bc,08574h		;d9e6	01 74 85 	. t . 
	call 0cf67h		;d9e9	cd 67 cf 	. g . 
	ld de,09e0fh		;d9ec	11 0f 9e 	. . . 
	ld hl,0dc2ch		;d9ef	21 2c dc 	! , . 
	ld a,01eh		;d9f2	3e 1e 	> . 
	jp 0db27h		;d9f4	c3 27 db 	. ' . 
	ld a,001h		;d9f7	3e 01 	> . 
	cp 00fh		;d9f9	fe 0f 	. . 
	jr c,$+12		;d9fb	38 0a 	8 . 
	cp 025h		;d9fd	fe 25 	. % 
	jr nc,$+4		;d9ff	30 02 	0 . 
	srl a		;da01	cb 3f 	. ? 
	ld b,a			;da03	47 	G 
	call 0df1dh		;da04	cd 1d df 	. . . 
	ld a,001h		;da07	3e 01 	> . 
	ld (0d9f8h),a		;da09	32 f8 d9 	2 . . 
	ld (0fb03h),a		;da0c	32 03 fb 	2 . . 
	jp 0d4e3h		;da0f	c3 e3 d4 	. . . 
	ld hl,0d9f8h		;da12	21 f8 d9 	! . . 
	inc (hl)			;da15	34 	4 
	jr nz,$+3		;da16	20 01 	  . 
	dec (hl)			;da18	35 	5 
	ld hl,0effdh		;da19	21 fd ef 	! . . 
	inc (hl)			;da1c	34 	4 
	ld de,00020h		;da1d	11 20 00 	.   . 
	jp 0db78h		;da20	c3 78 db 	. x . 
	call 0db1dh		;da23	cd 1d db 	. . . 
	call 0d654h		;da26	cd 54 d6 	. T . 
	call 0d988h		;da29	cd 88 d9 	. . . 
	ld hl,0effdh		;da2c	21 fd ef 	! . . 
	inc (hl)			;da2f	34 	4 
	ld hl,(0effah)		;da30	2a fa ef 	* . . 
	ld de,00020h		;da33	11 20 00 	.   . 
	add hl,de			;da36	19 	. 
	ld (0effah),hl		;da37	22 fa ef 	" . . 
	ld de,08874h		;da3a	11 74 88 	. t . 
	add hl,de			;da3d	19 	. 
	ld b,006h		;da3e	06 06 	. . 
	ld (hl),008h		;da40	36 08 	6 . 
	inc hl			;da42	23 	# 
	djnz $-3		;da43	10 fb 	. . 
	ld a,(0effdh)		;da45	3a fd ef 	: . . 
	cp 00bh		;da48	fe 0b 	. . 
	jr z,$+68		;da4a	28 42 	( B 
	ld de,0001ah		;da4c	11 1a 00 	. . . 
	add hl,de			;da4f	19 	. 
	ld de,09e39h		;da50	11 39 9e 	. 9 . 
	ld bc,00006h		;da53	01 06 00 	. . . 
	ex de,hl			;da56	eb 	. 
	ldir		;da57	ed b0 	. . 
	ld hl,0fdc0h		;da59	21 c0 fd 	! . . 
	add hl,de			;da5c	19 	. 
	ld a,001h		;da5d	3e 01 	> . 
	ld b,006h		;da5f	06 06 	. . 
	dec hl			;da61	2b 	+ 
	ld (hl),a			;da62	77 	w 
	djnz $-2		;da63	10 fc 	. . 
	ld de,0ffe0h		;da65	11 e0 ff 	. . . 
	add hl,de			;da68	19 	. 
	ld b,006h		;da69	06 06 	. . 
	ld (hl),001h		;da6b	36 01 	6 . 
	inc hl			;da6d	23 	# 
	djnz $-3		;da6e	10 fb 	. . 
	ld a,(0f7feh)		;da70	3a fe f7 	: . . 
	ld hl,0da93h		;da73	21 93 da 	! . . 
	bit 3,a		;da76	cb 5f 	. _ 
	jp nz,0db2eh		;da78	c2 2e db 	. . . 
	ld hl,(0effah)		;da7b	2a fa ef 	* . . 
	ld de,088b4h		;da7e	11 b4 88 	. . . 
	add hl,de			;da81	19 	. 
	ld a,(hl)			;da82	7e 	~ 
	cp 0fah		;da83	fe fa 	. . 
	jp nz,0c2b4h		;da85	c2 b4 c2 	. . . 
	call 0db14h		;da88	cd 14 db 	. . . 
	jp 0d4e3h		;da8b	c3 e3 d4 	. . . 
	ld hl,08799h		;da8e	21 99 87 	! . . 
	jr $-40		;da91	18 d6 	. . 
	call 0db14h		;da93	cd 14 db 	. . . 
	call 0d654h		;da96	cd 54 d6 	. T . 
	ld hl,0effdh		;da99	21 fd ef 	! . . 
	dec (hl)			;da9c	35 	5 
	ld hl,(0effah)		;da9d	2a fa ef 	* . . 
	ld de,0ffe0h		;daa0	11 e0 ff 	. . . 
	add hl,de			;daa3	19 	. 
	ld (0effah),hl		;daa4	22 fa ef 	" . . 
	call 0cfe2h		;daa7	cd e2 cf 	. . . 
	ld de,08894h		;daaa	11 94 88 	. . . 
	add hl,de			;daad	19 	. 
	ld bc,00006h		;daae	01 06 00 	. . . 
	ld de,09e39h		;dab1	11 39 9e 	. 9 . 
	ex de,hl			;dab4	eb 	. 
	ldir		;dab5	ed b0 	. . 
	cp 00ah		;dab7	fe 0a 	. . 
	ld hl,08799h		;dab9	21 99 87 	! . . 
	jr z,$+28		;dabc	28 1a 	( . 
	ld hl,0001ah		;dabe	21 1a 00 	! . . 
	add hl,de			;dac1	19 	. 
	ld b,006h		;dac2	06 06 	. . 
	ld (hl),008h		;dac4	36 08 	6 . 
	inc hl			;dac6	23 	# 
	djnz $-3		;dac7	10 fb 	. . 
	ld de,0fdc0h		;dac9	11 c0 fd 	. . . 
	add hl,de			;dacc	19 	. 
	ld b,006h		;dacd	06 06 	. . 
	dec hl			;dacf	2b 	+ 
	ld (hl),001h		;dad0	36 01 	6 . 
	djnz $-3		;dad2	10 fb 	. . 
	ld de,0ffe0h		;dad4	11 e0 ff 	. . . 
	add hl,de			;dad7	19 	. 
	ld (hl),001h		;dad8	36 01 	6 . 
	ld de,00005h		;dada	11 05 00 	. . . 
	add hl,de			;dadd	19 	. 
	ld (hl),001h		;dade	36 01 	6 . 
	ld a,(0f7feh)		;dae0	3a fe f7 	: . . 
	ld hl,0da23h		;dae3	21 23 da 	! # . 
	bit 2,a		;dae6	cb 57 	. W 
	jr nz,$+70		;dae8	20 44 	  D 
	ld hl,(0effah)		;daea	2a fa ef 	* . . 
	ld de,08873h		;daed	11 73 88 	. s . 
	add hl,de			;daf0	19 	. 
	ld a,(hl)			;daf1	7e 	~ 
	cp 008h		;daf2	fe 08 	. . 
	jp nz,0c2b4h		;daf4	c2 b4 c2 	. . . 
	ld hl,0effdh		;daf7	21 fd ef 	! . . 
	dec (hl)			;dafa	35 	5 
	ld de,0ffe0h		;dafb	11 e0 ff 	. . . 
	ld hl,(0effah)		;dafe	2a fa ef 	* . . 
	add hl,de			;db01	19 	. 
	ld (0effah),hl		;db02	22 fa ef 	" . . 
	call 0db1dh		;db05	cd 1d db 	. . . 
	xor a			;db08	af 	. 
	ld (0f8fah),a		;db09	32 fa f8 	2 . . 
	ld hl,0d6f0h		;db0c	21 f0 d6 	! . . 
	ld de,09bcah		;db0f	11 ca 9b 	. . . 
	jr $+24		;db12	18 16 	. . 
	ld a,0ffh		;db14	3e ff 	> . 
	ld (0716dh),a		;db16	32 6d 71 	2 m q 
	ld (071a4h),a		;db19	32 a4 71 	2 . q 
	ret			;db1c	c9 	. 
	ld a,011h		;db1d	3e 11 	> . 
	ld (0716dh),a		;db1f	32 6d 71 	2 m q 
	xor a			;db22	af 	. 
	ld (071a4h),a		;db23	32 a4 71 	2 . q 
	ret			;db26	c9 	. 
	ld (0f8e0h),a		;db27	32 e0 f8 	2 . . 
	ld (0cc6dh),de		;db2a	ed 53 6d cc 	. S m . 
	ld (0c2aeh),hl		;db2e	22 ae c2 	" . . 
	jp 0c2b4h		;db31	c3 b4 c2 	. . . 
	ld bc,0effch		;db34	01 fc ef 	. . . 
	ld a,(bc)			;db37	0a 	. 
	cp 01dh		;db38	fe 1d 	. . 
	jp z,0cebeh		;db3a	ca be ce 	. . . 
	cp 01ah		;db3d	fe 1a 	. . 
	jr nc,$+15		;db3f	30 0d 	0 . 
	ld hl,(0effah)		;db41	2a fa ef 	* . . 
	ld de,0887ah		;db44	11 7a 88 	. z . 
	add hl,de			;db47	19 	. 
	ld a,(hl)			;db48	7e 	~ 
	cp 0c7h		;db49	fe c7 	. . 
	jr nc,$+12		;db4b	30 0a 	0 . 
	ld a,(bc)			;db4d	0a 	. 
	inc a			;db4e	3c 	< 
	ld (bc),a			;db4f	02 	. 
	ld hl,(0effah)		;db50	2a fa ef 	* . . 
	inc hl			;db53	23 	# 
	ld (0effah),hl		;db54	22 fa ef 	" . . 
	call 0dbb8h		;db57	cd b8 db 	. . . 
	ld a,(0f7feh)		;db5a	3a fe f7 	: . . 
	bit 0,a		;db5d	cb 47 	. G 
	jp z,0db08h		;db5f	ca 08 db 	. . . 
	ld de,08a56h		;db62	11 56 8a 	. V . 
	call 0db82h		;db65	cd 82 db 	. . . 
	ld hl,(0effah)		;db68	2a fa ef 	* . . 
	add hl,de			;db6b	19 	. 
	ld a,(hl)			;db6c	7e 	~ 
	or a			;db6d	b7 	. 
	jp nz,0c2b4h		;db6e	c2 b4 c2 	. . . 
	ld hl,0effdh		;db71	21 fd ef 	! . . 
	dec (hl)			;db74	35 	5 
	ld de,0ffe0h		;db75	11 e0 ff 	. . . 
	ld hl,(0effah)		;db78	2a fa ef 	* . . 
	add hl,de			;db7b	19 	. 
	ld (0effah),hl		;db7c	22 fa ef 	" . . 
	jp 0c2b4h		;db7f	c3 b4 c2 	. . . 
	ld a,(0effch)		;db82	3a fc ef 	: . . 
	cp 0fdh		;db85	fe fd 	. . 
	ret nz			;db87	c0 	. 
	inc de			;db88	13 	. 
	ret			;db89	c9 	. 
	ld bc,0effch		;db8a	01 fc ef 	. . . 
	ld a,(bc)			;db8d	0a 	. 
	cp 0fdh		;db8e	fe fd 	. . 
	jp z,0cedbh		;db90	ca db ce 	. . . 
	cp 001h		;db93	fe 01 	. . 
	jp m,0dba5h		;db95	fa a5 db 	. . . 
	ld hl,(0effah)		;db98	2a fa ef 	* . . 
	ld de,08873h		;db9b	11 73 88 	. s . 
	add hl,de			;db9e	19 	. 
	ld a,(hl)			;db9f	7e 	~ 
	cp 0c7h		;dba0	fe c7 	. . 
	jr nc,$+12		;dba2	30 0a 	0 . 
	ld a,(bc)			;dba4	0a 	. 
	dec a			;dba5	3d 	= 
	ld (bc),a			;dba6	02 	. 
	ld hl,(0effah)		;dba7	2a fa ef 	* . . 
	dec hl			;dbaa	2b 	+ 
	ld (0effah),hl		;dbab	22 fa ef 	" . . 
	call 0dbb8h		;dbae	cd b8 db 	. . . 
	ld a,(0f7feh)		;dbb1	3a fe f7 	: . . 
	bit 1,a		;dbb4	cb 4f 	. O 
	jr $-87		;dbb6	18 a7 	. . 
	ld hl,09e08h		;dbb8	21 08 9e 	! . . 
	ld a,007h		;dbbb	3e 07 	> . 
	xor (hl)			;dbbd	ae 	. 
	ld (hl),a			;dbbe	77 	w 
	ret			;dbbf	c9 	. 
	ld hl,0e670h		;dbc0	21 70 e6 	! p . 
	ld de,0ffffh		;dbc3	11 ff ff 	. . . 
	ld b,003h		;dbc6	06 03 	. . 
	call 0d319h		;dbc8	cd 19 d3 	. . . 
	ld a,002h		;dbcb	3e 02 	> . 
	ld b,0cdh		;dbcd	06 cd 	. . 
	ld hl,0cc3bh		;dbcf	21 3b cc 	! ; . 
	ld (hl),b			;dbd2	70 	p 
	ld (0d363h),a		;dbd3	32 63 d3 	2 c . 
	ld (0d3c0h),a		;dbd6	32 c0 d3 	2 . . 
	ret			;dbd9	c9 	. 
	ld b,0c3h		;dbda	06 c3 	. . 
	xor a			;dbdc	af 	. 
	jr $-14		;dbdd	18 f0 	. . 
	ld hl,066f6h		;dbdf	21 f6 66 	! . f 
	ld a,e			;dbe2	7b 	{ 
	add a,l			;dbe3	85 	. 
	ld l,a			;dbe4	6f 	o 
	ld c,03ah		;dbe5	0e 3a 	. : 
	ld a,(hl)			;dbe7	7e 	~ 
	add a,d			;dbe8	82 	. 
	cp c			;dbe9	b9 	. 
	jr nc,$+9		;dbea	30 07 	0 . 
	ld (hl),a			;dbec	77 	w 
	ld hl,066f1h		;dbed	21 f1 66 	! . f 
	jp 0d064h		;dbf0	c3 64 d0 	. d . 
	sub 00ah		;dbf3	d6 0a 	. . 
	ld (hl),a			;dbf5	77 	w 
	dec hl			;dbf6	2b 	+ 
	inc (hl)			;dbf7	34 	4 
	ld a,(hl)			;dbf8	7e 	~ 
	cp c			;dbf9	b9 	. 
	jr nz,$-13		;dbfa	20 f1 	  . 
	ld (hl),030h		;dbfc	36 30 	6 0 
	jr $-8		;dbfe	18 f6 	. . 
	ld hl,04000h		;dc00	21 00 40 	! . @ 
	ld e,l			;dc03	5d 	] 
	ld d,h			;dc04	54 	T 
	ld c,015h		;dc05	0e 15 	. . 
	ld b,004h		;dc07	06 04 	. . 
	ld (hl),e			;dc09	73 	s 
	inc h			;dc0a	24 	$ 
	ld (hl),e			;dc0b	73 	s 
	inc h			;dc0c	24 	$ 
	djnz $-4		;dc0d	10 fa 	. . 
	ld h,d			;dc0f	62 	b 
	inc l			;dc10	2c 	, 
	dec c			;dc11	0d 	. 
	jr nz,$-11		;dc12	20 f3 	  . 
	ld a,00bh		;dc14	3e 0b 	> . 
	add a,l			;dc16	85 	. 
	ld l,a			;dc17	6f 	o 
	jr nc,$-19		;dc18	30 eb 	0 . 
	ld a,h			;dc1a	7c 	| 
	add a,008h		;dc1b	c6 08 	. . 
	ld h,a			;dc1d	67 	g 
	cp 058h		;dc1e	fe 58 	. X 
	jr nz,$-28		;dc20	20 e2 	  . 
	ld de,08db4h		;dc22	11 b4 8d 	. . . 
	ex de,hl			;dc25	eb 	. 
	ld bc,00300h		;dc26	01 00 03 	. . . 
	ldir		;dc29	ed b0 	. . 
	ret			;dc2b	c9 	. 
	ld hl,0f8e0h		;dc2c	21 e0 f8 	! . . 
	dec (hl)			;dc2f	35 	5 
	jp nz,0c2b4h		;dc30	c2 b4 c2 	. . . 
	call 098f1h		;dc33	cd f1 98 	. . . 
	ld b,00fh		;dc36	06 0f 	. . 
	ld hl,06508h		;dc38	21 08 65 	! . e 
	ld de,066f7h		;dc3b	11 f7 66 	. . f 
	push hl			;dc3e	e5 	. 
	ld c,006h		;dc3f	0e 06 	. . 
	ld a,(de)			;dc41	1a 	. 
	cp (hl)			;dc42	be 	. 
	jr c,$+9		;dc43	38 07 	8 . 
	jr nz,$+16		;dc45	20 0e 	  . 
	inc hl			;dc47	23 	# 
	inc de			;dc48	13 	. 
	dec c			;dc49	0d 	. 
	jr nz,$-9		;dc4a	20 f5 	  . 
	pop hl			;dc4c	e1 	. 
	ld de,00011h		;dc4d	11 11 00 	. . . 
	add hl,de			;dc50	19 	. 
	djnz $-22		;dc51	10 e8 	. . 
	jr $+69		;dc53	18 43 	. C 
	pop hl			;dc55	e1 	. 
	push bc			;dc56	c5 	. 
	ld de,04043h		;dc57	11 43 40 	. C @ 
	ld hl,064bah		;dc5a	21 ba 64 	! . d 
	call 0d06bh		;dc5d	cd 6b d0 	. k . 
	ld e,0a2h		;dc60	1e a2 	. . 
	call 0d06bh		;dc62	cd 6b d0 	. k . 
	ld e,0e4h		;dc65	1e e4 	. . 
	call 0d06bh		;dc67	cd 6b d0 	. k . 
	ld de,04863h		;dc6a	11 63 48 	. c H 
	call 0d06bh		;dc6d	cd 6b d0 	. k . 
	call 0dee0h		;dc70	cd e0 de 	. . . 
	call 0de8eh		;dc73	cd 8e de 	. . . 
	pop bc			;dc76	c1 	. 
	ld de,06617h		;dc77	11 17 66 	. . f 
	ld hl,06606h		;dc7a	21 06 66 	! . f 
	ld a,b			;dc7d	78 	x 
	ld bc,00011h		;dc7e	01 11 00 	. . . 
	lddr		;dc81	ed b8 	. . 
	dec a			;dc83	3d 	= 
	jr nz,$-6		;dc84	20 f8 	  . 
	inc hl			;dc86	23 	# 
	ex de,hl			;dc87	eb 	. 
	ld hl,066f7h		;dc88	21 f7 66 	! . f 
	ld c,006h		;dc8b	0e 06 	. . 
	ldir		;dc8d	ed b0 	. . 
	inc hl			;dc8f	23 	# 
	inc hl			;dc90	23 	# 
	ld c,00bh		;dc91	0e 0b 	. . 
	ldir		;dc93	ed b0 	. . 
	call 0dc00h		;dc95	cd 00 dc 	. . . 
	ld hl,064fch		;dc98	21 fc 64 	! . d 
	ld de,04064h		;dc9b	11 64 40 	. d @ 
	call 0d06bh		;dc9e	cd 6b d0 	. k . 
	ld b,00fh		;dca1	06 0f 	. . 
	ld hl,06508h		;dca3	21 08 65 	! . e 
	ld e,0c1h		;dca6	1e c1 	. . 
	push bc			;dca8	c5 	. 
	ld c,006h		;dca9	0e 06 	. . 
	call 0d06dh		;dcab	cd 6d d0 	. m . 
	push hl			;dcae	e5 	. 
	ld hl,06618h		;dcaf	21 18 66 	! . f 
	ld c,002h		;dcb2	0e 02 	. . 
	call 0d06dh		;dcb4	cd 6d d0 	. m . 
	pop hl			;dcb7	e1 	. 
	ld c,00bh		;dcb8	0e 0b 	. . 
	call 0d06dh		;dcba	cd 6d d0 	. m . 
	ld a,e			;dcbd	7b 	{ 
	add a,00dh		;dcbe	c6 0d 	. . 
	ld e,a			;dcc0	5f 	_ 
	jr nc,$+6		;dcc1	30 04 	0 . 
	ld a,d			;dcc3	7a 	z 
	add a,008h		;dcc4	c6 08 	. . 
	ld d,a			;dcc6	57 	W 
	pop bc			;dcc7	c1 	. 
	djnz $-32		;dcc8	10 de 	. . 
	call 0dee0h		;dcca	cd e0 de 	. . . 
	call 0fb10h		;dccd	cd 10 fb 	. . . 
	call 0dc00h		;dcd0	cd 00 dc 	. . . 
	ld hl,068d1h		;dcd3	21 d1 68 	! . h 
	ld de,04063h		;dcd6	11 63 40 	. c @ 
	call 0d06bh		;dcd9	cd 6b d0 	. k . 
	ld e,0a3h		;dcdc	1e a3 	. . 
	call 0d06bh		;dcde	cd 6b d0 	. k . 
	ld e,0e3h		;dce1	1e e3 	. . 
	call 0d06bh		;dce3	cd 6b d0 	. k . 
	ld de,04843h		;dce6	11 43 48 	. C H 
	call 0d06bh		;dce9	cd 6b d0 	. k . 
	ld e,083h		;dcec	1e 83 	. . 
	call 0d06bh		;dcee	cd 6b d0 	. k . 
	ld e,0c3h		;dcf1	1e c3 	. . 
	call 0d06bh		;dcf3	cd 6b d0 	. k . 
	ld de,05023h		;dcf6	11 23 50 	. # P 
	call 0d06bh		;dcf9	cd 6b d0 	. k . 
	ld e,0c1h		;dcfc	1e c1 	. . 
	call 0d06bh		;dcfe	cd 6b d0 	. k . 
	ld e,0e1h		;dd01	1e e1 	. . 
	call 0d06bh		;dd03	cd 6b d0 	. k . 
	call 0dee0h		;dd06	cd e0 de 	. . . 
	call 0dda1h		;dd09	cd a1 dd 	. . . 
	ld bc,07530h		;dd0c	01 30 75 	. 0 u 
	push bc			;dd0f	c5 	. 
	call 0d093h		;dd10	cd 93 d0 	. . . 
	cp 04bh		;dd13	fe 4b 	. K 
	jr z,$+84		;dd15	28 52 	( R 
	cp 050h		;dd17	fe 50 	. P 
	jr z,$+87		;dd19	28 55 	( U 
	cp 04ah		;dd1b	fe 4a 	. J 
	jr z,$+106		;dd1d	28 68 	( h 
	cp 052h		;dd1f	fe 52 	. R 
	jp z,0de0ah		;dd21	ca 0a de 	. . . 
	cp 04dh		;dd24	fe 4d 	. M 
	jp z,0dda5h		;dd26	ca a5 dd 	. . . 
	cp 047h		;dd29	fe 47 	. G 
	jr z,$+22		;dd2b	28 14 	( . 
	cp 053h		;dd2d	fe 53 	. S 
	jr z,$+15		;dd2f	28 0d 	( . 
	ld a,(0d03bh)		;dd31	3a 3b d0 	: ; . 
	or a			;dd34	b7 	. 
	jr z,$+73		;dd35	28 47 	( G 
	call 0d03ah		;dd37	cd 3a d0 	. : . 
	and 010h		;dd3a	e6 10 	. . 
	jr z,$+66		;dd3c	28 40 	( @ 
	jp 05c70h		;dd3e	c3 70 5c 	. p \ 
	ld hl,0dcd3h		;dd41	21 d3 dc 	! . . 
	ex (sp),hl			;dd44	e3 	. 
	ld hl,06925h		;dd45	21 25 69 	! % i 
	ld a,(hl)			;dd48	7e 	~ 
	and 00fh		;dd49	e6 0f 	. . 
	inc a			;dd4b	3c 	< 
	daa			;dd4c	27 	' 
	or 030h		;dd4d	f6 30 	. 0 
	ld (hl),a			;dd4f	77 	w 
	ld a,03ah		;dd50	3e 3a 	> : 
	sub (hl)			;dd52	96 	. 
	ld (0fb06h),a		;dd53	32 06 fb 	2 . . 
	ld b,003h		;dd56	06 03 	. . 
	cp 004h		;dd58	fe 04 	. . 
	jr c,$+10		;dd5a	38 08 	8 . 
	ld b,008h		;dd5c	06 08 	. . 
	cp 006h		;dd5e	fe 06 	. . 
	jr c,$+4		;dd60	38 02 	8 . 
	ld b,00eh		;dd62	06 0e 	. . 
	ld a,b			;dd64	78 	x 
	ld (0e010h),a		;dd65	32 10 e0 	2 . . 
	ret			;dd68	c9 	. 
	ld hl,05862h		;dd69	21 62 58 	! b X 
	ld c,000h		;dd6c	0e 00 	. . 
	jr $+7		;dd6e	18 05 	. . 
	ld hl,058a2h		;dd70	21 a2 58 	! . X 
	ld c,002h		;dd73	0e 02 	. . 
	call 0dd8eh		;dd75	cd 8e dd 	. . . 
	call 0dd9ah		;dd78	cd 9a dd 	. . . 
	call 0b526h		;dd7b	cd 26 b5 	. & . 
	pop bc			;dd7e	c1 	. 
	dec bc			;dd7f	0b 	. 
	ld a,b			;dd80	78 	x 
	or c			;dd81	b1 	. 
	jr nz,$-115		;dd82	20 8b 	  . 
	jp 0dc95h		;dd84	c3 95 dc 	. . . 
	ld hl,058e2h		;dd87	21 e2 58 	! . X 
	ld c,001h		;dd8a	0e 01 	. . 
	jr $-23		;dd8c	18 e7 	. . 
	ld a,00eh		;dd8e	3e 0e 	> . 
	ld de,05862h		;dd90	11 62 58 	. b X 
	ld b,00dh		;dd93	06 0d 	. . 
	ld (de),a			;dd95	12 	. 
	inc de			;dd96	13 	. 
	djnz $-2		;dd97	10 fc 	. . 
	ret			;dd99	c9 	. 
	ld a,c			;dd9a	79 	y 
	ld (0d03bh),a		;dd9b	32 3b d0 	2 ; . 
	ld (0dd91h),hl		;dd9e	22 91 dd 	" . . 
	ld a,031h		;dda1	3e 31 	> 1 
	jr $-19		;dda3	18 eb 	. . 
	call 0dc00h		;dda5	cd 00 dc 	. . . 
	ld de,04044h		;dda8	11 44 40 	. D @ 
	ld hl,06879h		;ddab	21 79 68 	! y h 
	call 0d06bh		;ddae	cd 6b d0 	. k . 
	ld e,084h		;ddb1	1e 84 	. . 
	call 0d06bh		;ddb3	cd 6b d0 	. k . 
	ld e,0e3h		;ddb6	1e e3 	. . 
	call 0d06bh		;ddb8	cd 6b d0 	. k . 
	ld de,04822h		;ddbb	11 22 48 	. " H 
	call 0d06bh		;ddbe	cd 6b d0 	. k . 
	call 0dee0h		;ddc1	cd e0 de 	. . . 
	call 0de8eh		;ddc4	cd 8e de 	. . . 
	ld b,009h		;ddc7	06 09 	. . 
	ld hl,06813h		;ddc9	21 13 68 	! . h 
	ld de,066ffh		;ddcc	11 ff 66 	. . f 
	ld c,00bh		;ddcf	0e 0b 	. . 
	ld a,(de)			;ddd1	1a 	. 
	cp (hl)			;ddd2	be 	. 
	jr nz,$+29		;ddd3	20 1b 	  . 
	inc hl			;ddd5	23 	# 
	inc de			;ddd6	13 	. 
	dec c			;ddd7	0d 	. 
	jr nz,$-7		;ddd8	20 f7 	  . 
	ld a,b			;ddda	78 	x 
	ld (0f8fbh),a		;dddb	32 fb f8 	2 . . 
	add a,030h		;ddde	c6 30 	. 0 
	ld (067edh),a		;dde0	32 ed 67 	2 . g 
	ld hl,067e5h		;dde3	21 e5 67 	! . g 
	ld c,012h		;dde6	0e 12 	. . 
	ld de,048a2h		;dde8	11 a2 48 	. . H 
	call 0d06dh		;ddeb	cd 6d d0 	. m . 
	jr $+21		;ddee	18 13 	. . 
	ld a,l			;ddf0	7d 	} 
	add a,c			;ddf1	81 	. 
	ld l,a			;ddf2	6f 	o 
	djnz $-39		;ddf3	10 d7 	. . 
	ld hl,067f7h		;ddf5	21 f7 67 	! . g 
	ld de,048a5h		;ddf8	11 a5 48 	. . H 
	call 0d06bh		;ddfb	cd 6b d0 	. k . 
	ld e,0c4h		;ddfe	1e c4 	. . 
	call 0d06bh		;de00	cd 6b d0 	. k . 
	call 0dfe9h		;de03	cd e9 df 	. . . 
	pop bc			;de06	c1 	. 
	jp 0dcd0h		;de07	c3 d0 dc 	. . . 
	call 0dc00h		;de0a	cd 00 dc 	. . . 
	ld de,04046h		;de0d	11 46 40 	. F @ 
	ld hl,068f7h		;de10	21 f7 68 	! . h 
	ld c,00dh		;de13	0e 0d 	. . 
	call 0d06dh		;de15	cd 6d d0 	. m . 
	call 0dee0h		;de18	cd e0 de 	. . . 
	ld hl,081c7h		;de1b	21 c7 81 	! . . 
	ld (0de6eh),hl		;de1e	22 6e de 	" n . 
	ld e,084h		;de21	1e 84 	. . 
	ld hl,068b8h		;de23	21 b8 68 	! . h 
	ld bc,0053bh		;de26	01 3b 05 	. ; . 
	push bc			;de29	c5 	. 
	ld c,005h		;de2a	0e 05 	. . 
	call 0d06dh		;de2c	cd 6d d0 	. m . 
	push hl			;de2f	e5 	. 
	push de			;de30	d5 	. 
	call 0d093h		;de31	cd 93 d0 	. . . 
	cp 05bh		;de34	fe 5b 	. [ 
	jr nc,$-5		;de36	30 f9 	0 . 
	cp 020h		;de38	fe 20 	.   
	jr z,$+14		;de3a	28 0c 	( . 
	cp 030h		;de3c	fe 30 	. 0 
	jr c,$-13		;de3e	38 f1 	8 . 
	cp 03ah		;de40	fe 3a 	. : 
	jr c,$+6		;de42	38 04 	8 . 
	cp 041h		;de44	fe 41 	. A 
	jr c,$-21		;de46	38 e9 	8 . 
	ld (068b6h),a		;de48	32 b6 68 	2 . h 
	ld hl,00006h		;de4b	21 06 00 	! . . 
	add hl,de			;de4e	19 	. 
	ex de,hl			;de4f	eb 	. 
	ld hl,068b5h		;de50	21 b5 68 	! . h 
	ld c,003h		;de53	0e 03 	. . 
	call 0d06dh		;de55	cd 6d d0 	. m . 
	ld a,(068b6h)		;de58	3a b6 68 	: . h 
	sub 020h		;de5b	d6 20 	.   
	jr z,$+10		;de5d	28 08 	( . 
	sub 00fh		;de5f	d6 0f 	. . 
	cp 00eh		;de61	fe 0e 	. . 
	jr c,$+4		;de63	38 02 	8 . 
	sub 007h		;de65	d6 07 	. . 
	ld hl,0b114h		;de67	21 14 b1 	! . . 
	add a,a			;de6a	87 	. 
	add a,l			;de6b	85 	. 
	ld l,a			;de6c	6f 	o 
	ld de,0de0ah		;de6d	11 0a de 	. . . 
	ldi		;de70	ed a0 	. . 
	ldi		;de72	ed a0 	. . 
	inc de			;de74	13 	. 
	ex de,hl			;de75	eb 	. 
	ld (0de6eh),hl		;de76	22 6e de 	" n . 
	call 0dee0h		;de79	cd e0 de 	. . . 
	pop de			;de7c	d1 	. 
	pop hl			;de7d	e1 	. 
	pop bc			;de7e	c1 	. 
	ld a,e			;de7f	7b 	{ 
	add a,c			;de80	81 	. 
	ld e,a			;de81	5f 	_ 
	jr nc,$+6		;de82	30 04 	0 . 
	ld a,d			;de84	7a 	z 
	add a,008h		;de85	c6 08 	. . 
	ld d,a			;de87	57 	W 
	djnz $-95		;de88	10 9f 	. . 
	pop bc			;de8a	c1 	. 
	jp 0dcd0h		;de8b	c3 d0 dc 	. . . 
	ld b,00bh		;de8e	06 0b 	. . 
	ld hl,066ffh		;de90	21 ff 66 	! . f 
	push hl			;de93	e5 	. 
	ld (hl),020h		;de94	36 20 	6   
	inc hl			;de96	23 	# 
	djnz $-3		;de97	10 fb 	. . 
	ld ixl,b		;de99	dd 68 	. h 
	exx			;de9b	d9 	. 
	ld hl,059a6h		;de9c	21 a6 59 	! . Y 
	ld de,0e30eh		;de9f	11 0e e3 	. . . 
	exx			;dea2	d9 	. 
	ld de,048a6h		;dea3	11 a6 48 	. . H 
	pop hl			;dea6	e1 	. 
	exx			;dea7	d9 	. 
	ld (hl),d			;dea8	72 	r 
	exx			;dea9	d9 	. 
	call 0d093h		;deaa	cd 93 d0 	. . . 
	cp 00ch		;dead	fe 0c 	. . 
	jr z,$+63		;deaf	28 3d 	( = 
	cp 030h		;deb1	fe 30 	. 0 
	jr z,$+59		;deb3	28 39 	( 9 
	cp 00dh		;deb5	fe 0d 	. . 
	jr z,$+37		;deb7	28 23 	( # 
	ld c,a			;deb9	4f 	O 
	ld a,00bh		;deba	3e 0b 	> . 
	cp ixl		;debc	dd bd 	. . 
	ld a,c			;debe	79 	y 
	jr z,$-21		;debf	28 e9 	( . 
	cp 020h		;dec1	fe 20 	.   
	jr z,$+10		;dec3	28 08 	( . 
	cp 041h		;dec5	fe 41 	. A 
	jr c,$-29		;dec7	38 e1 	8 . 
	cp 05ch		;dec9	fe 5c 	. \ 
	jr nc,$-33		;decb	30 dd 	0 . 
	ld (hl),a			;decd	77 	w 
	call 0d060h		;dece	cd 60 d0 	. ` . 
	exx			;ded1	d9 	. 
	ld (hl),e			;ded2	73 	s 
	inc hl			;ded3	23 	# 
	exx			;ded4	d9 	. 
	inc ixl		;ded5	dd 2c 	. , 
	call 0dee0h		;ded7	cd e0 de 	. . . 
	jr $-51		;deda	18 cb 	. . 
	exx			;dedc	d9 	. 
	ld (hl),e			;dedd	73 	s 
	exx			;dede	d9 	. 
	ret			;dedf	c9 	. 
	call 0d093h		;dee0	cd 93 d0 	. . . 
	or a			;dee3	b7 	. 
	jr nz,$-4		;dee4	20 fa 	  . 
	ret			;dee6	c9 	. 
	call 0d093h		;dee7	cd 93 d0 	. . . 
	or a			;deea	b7 	. 
	jr z,$-4		;deeb	28 fa 	( . 
	ret			;deed	c9 	. 
	ld a,ixl		;deee	dd 7d 	. } 
	or a			;def0	b7 	. 
	jr z,$-74		;def1	28 b4 	( . 
	dec ixl		;def3	dd 2d 	. - 
	dec hl			;def5	2b 	+ 
	dec de			;def6	1b 	. 
	ld a,020h		;def7	3e 20 	>   
	ld (hl),a			;def9	77 	w 
	call 0d060h		;defa	cd 60 d0 	. ` . 
	dec hl			;defd	2b 	+ 
	dec de			;defe	1b 	. 
	exx			;deff	d9 	. 
	ld (hl),e			;df00	73 	s 
	dec hl			;df01	2b 	+ 
	exx			;df02	d9 	. 
	jr $-44		;df03	18 d2 	. . 
	ld (0aac8h),a		;df05	32 c8 aa 	2 . . 
	ld hl,0b206h		;df08	21 06 b2 	! . . 
	ld de,00009h		;df0b	11 09 00 	. . . 
	ld b,e			;df0e	43 	C 
	ld (hl),a			;df0f	77 	w 
	add hl,de			;df10	19 	. 
	ld (hl),a			;df11	77 	w 
	add hl,de			;df12	19 	. 
	ld (hl),a			;df13	77 	w 
	add hl,de			;df14	19 	. 
	djnz $-6		;df15	10 f8 	. . 
	ret			;df17	c9 	. 
	ld a,0c9h		;df18	3e c9 	> . 
	ld (0df1dh),a		;df1a	32 1d df 	2 . . 
	nop			;df1d	00 	. 
	push bc			;df1e	c5 	. 
	ld a,000h		;df1f	3e 00 	> . 
	ld de,050a5h		;df21	11 a5 50 	. . P 
	add a,e			;df24	83 	. 
	ld e,a			;df25	5f 	_ 
	add a,020h		;df26	c6 20 	.   
	ld l,a			;df28	6f 	o 
	ld h,d			;df29	62 	b 
	ld b,008h		;df2a	06 08 	. . 
	ld a,(hl)			;df2c	7e 	~ 
	xor 001h		;df2d	ee 01 	. . 
	ld (hl),a			;df2f	77 	w 
	ld (de),a			;df30	12 	. 
	inc h			;df31	24 	$ 
	inc d			;df32	14 	. 
	djnz $-4		;df33	10 fa 	. . 
	pop bc			;df35	c1 	. 
	ld hl,0df2eh		;df36	21 2e df 	! . . 
	rlc (hl)		;df39	cb 06 	. . 
	jr c,$+5		;df3b	38 03 	8 . 
	djnz $-31		;df3d	10 df 	. . 
	ret			;df3f	c9 	. 
	ld hl,0df20h		;df40	21 20 df 	!   . 
	dec (hl)			;df43	35 	5 
	jr nz,$-7		;df44	20 f7 	  . 
	ld a,001h		;df46	3e 01 	> . 
	ld (0f8f9h),a		;df48	32 f9 f8 	2 . . 
	jr $-51		;df4b	18 cb 	. . 
	ld de,00504h		;df4d	11 04 05 	. . . 
	call 0dbdfh		;df50	cd df db 	. . . 
	ld b,065h		;df53	06 65 	. e 
	halt			;df55	76 	v 
	djnz $-1		;df56	10 fd 	. . 
	call 098f1h		;df58	cd f1 98 	. . . 
	ld a,(0f8fch)		;df5b	3a fc f8 	: . . 
	ld hl,0ef85h		;df5e	21 85 ef 	! . . 
	add a,l			;df61	85 	. 
	ld l,a			;df62	6f 	o 
	ld a,(hl)			;df63	7e 	~ 
	ld hl,0f8f8h		;df64	21 f8 f8 	! . . 
	cp (hl)			;df67	be 	. 
	jp c,0dc33h		;df68	da 33 dc 	. 3 . 
	ld de,00103h		;df6b	11 03 01 	. . . 
	call 0dbdfh		;df6e	cd df db 	. . . 
	ld de,05061h		;df71	11 61 50 	. a P 
	ld hl,069a5h		;df74	21 a5 69 	! . i 
	call 0d06bh		;df77	cd 6b d0 	. k . 
	ld hl,064bah		;df7a	21 ba 64 	! . d 
	ld de,04043h		;df7d	11 43 40 	. C @ 
	call 0d06bh		;df80	cd 6b d0 	. k . 
	ld hl,069abh		;df83	21 ab 69 	! . i 
	ld e,0a1h		;df86	1e a1 	. . 
	call 0d06bh		;df88	cd 6b d0 	. k . 
	ld e,0e0h		;df8b	1e e0 	. . 
	call 0d06bh		;df8d	cd 6b d0 	. k . 
	ld a,(0f8fbh)		;df90	3a fb f8 	: . . 
	cp 009h		;df93	fe 09 	. . 
	jr nz,$+29		;df95	20 1b 	  . 
	ld hl,0695bh		;df97	21 5b 69 	! [ i 
	ld de,04822h		;df9a	11 22 48 	. " H 
	call 0d06bh		;df9d	cd 6b d0 	. k . 
	ld e,061h		;dfa0	1e 61 	. a 
	call 0d06bh		;dfa2	cd 6b d0 	. k . 
	ld e,0c2h		;dfa5	1e c2 	. . 
	call 0d06bh		;dfa7	cd 6b d0 	. k . 
	ld de,05001h		;dfaa	11 01 50 	. . P 
	call 0d06bh		;dfad	cd 6b d0 	. k . 
	jr $+51		;dfb0	18 31 	. 1 
	add a,031h		;dfb2	c6 31 	. 1 
	ld (069e8h),a		;dfb4	32 e8 69 	2 . i 
	ld hl,069d4h		;dfb7	21 d4 69 	! . i 
	ld de,04864h		;dfba	11 64 48 	. d H 
	call 0d06bh		;dfbd	cd 6b d0 	. k . 
	ld e,0a5h		;dfc0	1e a5 	. . 
	call 0d06bh		;dfc2	cd 6b d0 	. k . 
	ld e,0e5h		;dfc5	1e e5 	. . 
	ld a,022h		;dfc7	3e 22 	> " 
	call 0d060h		;dfc9	cd 60 d0 	. ` . 
	ld a,(0f8fbh)		;dfcc	3a fb f8 	: . . 
	ld bc,0fff5h		;dfcf	01 f5 ff 	. . . 
	ld hl,0686bh		;dfd2	21 6b 68 	! k h 
	add hl,bc			;dfd5	09 	. 
	dec a			;dfd6	3d 	= 
	jr nz,$-2		;dfd7	20 fc 	  . 
	ld c,00bh		;dfd9	0e 0b 	. . 
	call 0d06dh		;dfdb	cd 6d d0 	. m . 
	ld a,023h		;dfde	3e 23 	> # 
	call 0d060h		;dfe0	cd 60 d0 	. ` . 
	call 0dfe9h		;dfe3	cd e9 df 	. . . 
	jp 0dc33h		;dfe6	c3 33 dc 	. 3 . 
	ld hl,0620fh		;dfe9	21 0f 62 	! . b 
	ld de,050a4h		;dfec	11 a4 50 	. . P 
	call 0d06bh		;dfef	cd 6b d0 	. k . 
	ld e,0c4h		;dff2	1e c4 	. . 
	ld c,00ch		;dff4	0e 0c 	. . 
	call 0d06dh		;dff6	cd 6d d0 	. m . 
	call 0dee0h		;dff9	cd e0 de 	. . . 
	call 0d03ah		;dffc	cd 3a d0 	. : . 
	or a			;dfff	b7 	. 
	jr nz,$-7		;e000	20 f7 	  . 
	call 0d093h		;e002	cd 93 d0 	. . . 
	or a			;e005	b7 	. 
	ret nz			;e006	c0 	. 
	call 0d03ah		;e007	cd 3a d0 	. : . 
	and 010h		;e00a	e6 10 	. . 
	jr z,$-10		;e00c	28 f4 	( . 
	ret			;e00e	c9 	. 
	ld d,003h		;e00f	16 03 	. . 
	ld b,008h		;e011	06 08 	. . 
	ld a,r		;e013	ed 5f 	. _ 
	ld c,a			;e015	4f 	O 
	and 010h		;e016	e6 10 	. . 
	out (0feh),a		;e018	d3 fe 	. . 
	ld a,055h		;e01a	3e 55 	> U 
	dec a			;e01c	3d 	= 
	jr nz,$-1		;e01d	20 fd 	  . 
	ld a,c			;e01f	79 	y 
	rlca			;e020	07 	. 
	djnz $-12		;e021	10 f2 	. . 
	dec d			;e023	15 	. 
	jr nz,$-19		;e024	20 eb 	  . 
	xor a			;e026	af 	. 
	out (0feh),a		;e027	d3 fe 	. . 
	ld (0fb03h),a		;e029	32 03 fb 	2 . . 
	ret			;e02c	c9 	. 
	push de			;e02d	d5 	. 
	ld de,08060h		;e02e	11 60 80 	. ` . 
	ld a,010h		;e031	3e 10 	> . 
	ld b,e			;e033	43 	C 
	out (0feh),a		;e034	d3 fe 	. . 
	jr $+2		;e036	18 00 	. . 
	djnz $-4		;e038	10 fa 	. . 
	xor 010h		;e03a	ee 10 	. . 
	dec d			;e03c	15 	. 
	jr nz,$-10		;e03d	20 f4 	  . 
	xor a			;e03f	af 	. 
	out (0feh),a		;e040	d3 fe 	. . 
	pop de			;e042	d1 	. 
	ret			;e043	c9 	. 
	push de			;e044	d5 	. 
	ld de,040c0h		;e045	11 c0 40 	. . @ 
	jr $-23		;e048	18 e7 	. . 
	ld c,028h		;e04a	0e 28 	. ( 
	ld a,010h		;e04c	3e 10 	> . 
	ld b,c			;e04e	41 	A 
	out (0feh),a		;e04f	d3 fe 	. . 
	jr $+2		;e051	18 00 	. . 
	djnz $-4		;e053	10 fa 	. . 
	xor 010h		;e055	ee 10 	. . 
	dec c			;e057	0d 	. 
	jr nz,$-10		;e058	20 f4 	  . 
	xor a			;e05a	af 	. 
	out (0feh),a		;e05b	d3 fe 	. . 
	ret			;e05d	c9 	. 
	ld (0c717h),a		;e05e	32 17 c7 	2 . . 
	ld hl,00000h		;e061	21 00 00 	! . . 
	ld a,h			;e064	7c 	| 
	ld h,l			;e065	65 	e 
	ld l,a			;e066	6f 	o 
	ld (0e062h),hl		;e067	22 62 e0 	" b . 
	ld hl,(0f8dch)		;e06a	2a dc f8 	* . . 
	ex de,hl			;e06d	eb 	. 
	ld hl,(0f8deh)		;e06e	2a de f8 	* . . 
	ld (0f8dch),hl		;e071	22 dc f8 	" . . 
	ex de,hl			;e074	eb 	. 
	ld (0f8deh),hl		;e075	22 de f8 	" . . 
	ret			;e078	c9 	. 
	ld hl,06fc3h		;e079	21 c3 6f 	! . o 
	ld (0d36ah),hl		;e07c	22 6a d3 	" j . 
	ld h,0cch		;e07f	26 cc 	& . 
	ld (0d3c7h),hl		;e081	22 c7 d3 	" . . 
	ld a,0d3h		;e084	3e d3 	> . 
	ld (0d36ch),a		;e086	32 6c d3 	2 l . 
	ld a,0d3h		;e089	3e d3 	> . 
	ld (0d3c9h),a		;e08b	32 c9 d3 	2 . . 
	ret			;e08e	c9 	. 
	ld hl,02418h		;e08f	21 18 24 	! . $ 
	ld (0d36dh),hl		;e092	22 6d d3 	" m . 
	ld h,02dh		;e095	26 2d 	& - 
	ld (0d3cah),hl		;e097	22 ca d3 	" . . 
	ld hl,0283ch		;e09a	21 3c 28 	! < ( 
	ld (0d36ah),hl		;e09d	22 6a d3 	" j . 
	ld (0d3c7h),hl		;e0a0	22 c7 d3 	" . . 
	ld a,003h		;e0a3	3e 03 	> . 
	ld (0d36ch),a		;e0a5	32 6c d3 	2 l . 
	ld (0d3c9h),a		;e0a8	32 c9 d3 	2 . . 
	ret			;e0ab	c9 	. 
	ld hl,0013eh		;e0ac	21 3e 01 	! > . 
	ld (0d36dh),hl		;e0af	22 6d d3 	" m . 
	ld (0d3cah),hl		;e0b2	22 ca d3 	" . . 
	ret			;e0b5	c9 	. 
	ld a,l			;e0b6	7d 	} 
	ld (0d396h),a		;e0b7	32 96 d3 	2 . . 
	ld (0d3fch),a		;e0ba	32 fc d3 	2 . . 
	ld a,h			;e0bd	7c 	| 
	ld (0d39ah),a		;e0be	32 9a d3 	2 . . 
	ld (0d400h),a		;e0c1	32 00 d4 	2 . . 
	ret			;e0c4	c9 	. 
	ld a,(ix+007h)		;e0c5	dd 7e 07 	. ~ . 
	ld h,000h		;e0c8	26 00 	& . 
	add a,a			;e0ca	87 	. 
	add a,a			;e0cb	87 	. 
	add a,a			;e0cc	87 	. 
	add a,a			;e0cd	87 	. 
	ld l,a			;e0ce	6f 	o 
	add hl,hl			;e0cf	29 	) 
	ld e,(ix+001h)		;e0d0	dd 5e 01 	. ^ . 
	ld a,e			;e0d3	7b 	{ 
	add a,a			;e0d4	87 	. 
	sbc a,a			;e0d5	9f 	. 
	ld d,a			;e0d6	57 	W 
	add hl,de			;e0d7	19 	. 
	ld (0cc11h),hl		;e0d8	22 11 cc 	" . . 
	ret			;e0db	c9 	. 
	ld (hl),d			;e0dc	72 	r 
	ld sp,03031h		;e0dd	31 31 30 	1 1 0 
	nop			;e0e0	00 	. 
	nop			;e0e1	00 	. 
	nop			;e0e2	00 	. 
	nop			;e0e3	00 	. 
	nop			;e0e4	00 	. 
	nop			;e0e5	00 	. 
	nop			;e0e6	00 	. 
	nop			;e0e7	00 	. 
	nop			;e0e8	00 	. 
	nop			;e0e9	00 	. 
	nop			;e0ea	00 	. 
	nop			;e0eb	00 	. 
	nop			;e0ec	00 	. 
	nop			;e0ed	00 	. 
	nop			;e0ee	00 	. 
	nop			;e0ef	00 	. 
	nop			;e0f0	00 	. 
	nop			;e0f1	00 	. 
	nop			;e0f2	00 	. 
	nop			;e0f3	00 	. 
	nop			;e0f4	00 	. 
	nop			;e0f5	00 	. 
	nop			;e0f6	00 	. 
	nop			;e0f7	00 	. 
	nop			;e0f8	00 	. 
	nop			;e0f9	00 	. 
	nop			;e0fa	00 	. 
	nop			;e0fb	00 	. 
	nop			;e0fc	00 	. 
	nop			;e0fd	00 	. 
	nop			;e0fe	00 	. 
	nop			;e0ff	00 	. 
	nop			;e100	00 	. 
	nop			;e101	00 	. 
	nop			;e102	00 	. 
	nop			;e103	00 	. 
	nop			;e104	00 	. 
	nop			;e105	00 	. 
	nop			;e106	00 	. 
	nop			;e107	00 	. 
	nop			;e108	00 	. 
	nop			;e109	00 	. 
	nop			;e10a	00 	. 
	nop			;e10b	00 	. 
	nop			;e10c	00 	. 
	nop			;e10d	00 	. 
	nop			;e10e	00 	. 
	nop			;e10f	00 	. 
	nop			;e110	00 	. 
	nop			;e111	00 	. 
	nop			;e112	00 	. 
	nop			;e113	00 	. 
	nop			;e114	00 	. 
	nop			;e115	00 	. 
	nop			;e116	00 	. 
	nop			;e117	00 	. 
	nop			;e118	00 	. 
	nop			;e119	00 	. 
	nop			;e11a	00 	. 
	nop			;e11b	00 	. 
	nop			;e11c	00 	. 
	nop			;e11d	00 	. 
	nop			;e11e	00 	. 
	nop			;e11f	00 	. 
	nop			;e120	00 	. 
	nop			;e121	00 	. 
	nop			;e122	00 	. 
	nop			;e123	00 	. 
	nop			;e124	00 	. 
	nop			;e125	00 	. 
	nop			;e126	00 	. 
	nop			;e127	00 	. 
	nop			;e128	00 	. 
	nop			;e129	00 	. 
	nop			;e12a	00 	. 
	nop			;e12b	00 	. 
	nop			;e12c	00 	. 
	nop			;e12d	00 	. 
	nop			;e12e	00 	. 
	nop			;e12f	00 	. 
	nop			;e130	00 	. 
	nop			;e131	00 	. 
	nop			;e132	00 	. 
	nop			;e133	00 	. 
	nop			;e134	00 	. 
	nop			;e135	00 	. 
	nop			;e136	00 	. 
	nop			;e137	00 	. 
	nop			;e138	00 	. 
	nop			;e139	00 	. 
	nop			;e13a	00 	. 
	nop			;e13b	00 	. 
	nop			;e13c	00 	. 
	nop			;e13d	00 	. 
	nop			;e13e	00 	. 
	nop			;e13f	00 	. 
	nop			;e140	00 	. 
	nop			;e141	00 	. 
	nop			;e142	00 	. 
	nop			;e143	00 	. 
	nop			;e144	00 	. 
	nop			;e145	00 	. 
	nop			;e146	00 	. 
	nop			;e147	00 	. 
	nop			;e148	00 	. 
	nop			;e149	00 	. 
	nop			;e14a	00 	. 
	nop			;e14b	00 	. 
	nop			;e14c	00 	. 
	nop			;e14d	00 	. 
	nop			;e14e	00 	. 
	nop			;e14f	00 	. 
	nop			;e150	00 	. 
	nop			;e151	00 	. 
	nop			;e152	00 	. 
	nop			;e153	00 	. 
	nop			;e154	00 	. 
	nop			;e155	00 	. 
	nop			;e156	00 	. 
	nop			;e157	00 	. 
	nop			;e158	00 	. 
	nop			;e159	00 	. 
	nop			;e15a	00 	. 
	nop			;e15b	00 	. 
	nop			;e15c	00 	. 
	nop			;e15d	00 	. 
	nop			;e15e	00 	. 
	nop			;e15f	00 	. 
	nop			;e160	00 	. 
	nop			;e161	00 	. 
	nop			;e162	00 	. 
	nop			;e163	00 	. 
	nop			;e164	00 	. 
	nop			;e165	00 	. 
	nop			;e166	00 	. 
	nop			;e167	00 	. 
	nop			;e168	00 	. 
	nop			;e169	00 	. 
	nop			;e16a	00 	. 
	nop			;e16b	00 	. 
	nop			;e16c	00 	. 
	nop			;e16d	00 	. 
	nop			;e16e	00 	. 
	nop			;e16f	00 	. 
	nop			;e170	00 	. 
	nop			;e171	00 	. 
	nop			;e172	00 	. 
	nop			;e173	00 	. 
	nop			;e174	00 	. 
	nop			;e175	00 	. 
	nop			;e176	00 	. 
	nop			;e177	00 	. 
	nop			;e178	00 	. 
	nop			;e179	00 	. 
	nop			;e17a	00 	. 
	nop			;e17b	00 	. 
	nop			;e17c	00 	. 
	nop			;e17d	00 	. 
	nop			;e17e	00 	. 
	nop			;e17f	00 	. 
	nop			;e180	00 	. 
	nop			;e181	00 	. 
	nop			;e182	00 	. 
	nop			;e183	00 	. 
	nop			;e184	00 	. 
	nop			;e185	00 	. 
	nop			;e186	00 	. 
	nop			;e187	00 	. 
	nop			;e188	00 	. 
	nop			;e189	00 	. 
	nop			;e18a	00 	. 
	nop			;e18b	00 	. 
	nop			;e18c	00 	. 
	nop			;e18d	00 	. 
	nop			;e18e	00 	. 
	nop			;e18f	00 	. 
	nop			;e190	00 	. 
	nop			;e191	00 	. 
	nop			;e192	00 	. 
	nop			;e193	00 	. 
	nop			;e194	00 	. 
	nop			;e195	00 	. 
	nop			;e196	00 	. 
	nop			;e197	00 	. 
	nop			;e198	00 	. 
	nop			;e199	00 	. 
	nop			;e19a	00 	. 
	nop			;e19b	00 	. 
	nop			;e19c	00 	. 
	nop			;e19d	00 	. 
	nop			;e19e	00 	. 
	nop			;e19f	00 	. 
	nop			;e1a0	00 	. 
	nop			;e1a1	00 	. 
	nop			;e1a2	00 	. 
	nop			;e1a3	00 	. 
	nop			;e1a4	00 	. 
	nop			;e1a5	00 	. 
	nop			;e1a6	00 	. 
	nop			;e1a7	00 	. 
	nop			;e1a8	00 	. 
	nop			;e1a9	00 	. 
	nop			;e1aa	00 	. 
	nop			;e1ab	00 	. 
	nop			;e1ac	00 	. 
	nop			;e1ad	00 	. 
	nop			;e1ae	00 	. 
	nop			;e1af	00 	. 
	nop			;e1b0	00 	. 
	nop			;e1b1	00 	. 
	nop			;e1b2	00 	. 
	nop			;e1b3	00 	. 
	nop			;e1b4	00 	. 
	nop			;e1b5	00 	. 
	nop			;e1b6	00 	. 
	nop			;e1b7	00 	. 
	nop			;e1b8	00 	. 
	nop			;e1b9	00 	. 
	nop			;e1ba	00 	. 
	nop			;e1bb	00 	. 
	nop			;e1bc	00 	. 
	nop			;e1bd	00 	. 
	nop			;e1be	00 	. 
	nop			;e1bf	00 	. 
	nop			;e1c0	00 	. 
	nop			;e1c1	00 	. 
	nop			;e1c2	00 	. 
	nop			;e1c3	00 	. 
	nop			;e1c4	00 	. 
	nop			;e1c5	00 	. 
	nop			;e1c6	00 	. 
	nop			;e1c7	00 	. 
	nop			;e1c8	00 	. 
	nop			;e1c9	00 	. 
	nop			;e1ca	00 	. 
	nop			;e1cb	00 	. 
	nop			;e1cc	00 	. 
	nop			;e1cd	00 	. 
	nop			;e1ce	00 	. 
	nop			;e1cf	00 	. 
	nop			;e1d0	00 	. 
	nop			;e1d1	00 	. 
	nop			;e1d2	00 	. 
	nop			;e1d3	00 	. 
	nop			;e1d4	00 	. 
	nop			;e1d5	00 	. 
	nop			;e1d6	00 	. 
	nop			;e1d7	00 	. 
	nop			;e1d8	00 	. 
	nop			;e1d9	00 	. 
	nop			;e1da	00 	. 
	nop			;e1db	00 	. 
	nop			;e1dc	00 	. 
	nop			;e1dd	00 	. 
	nop			;e1de	00 	. 
	nop			;e1df	00 	. 
	nop			;e1e0	00 	. 
	nop			;e1e1	00 	. 
	nop			;e1e2	00 	. 
	nop			;e1e3	00 	. 
	nop			;e1e4	00 	. 
	nop			;e1e5	00 	. 
	nop			;e1e6	00 	. 
	nop			;e1e7	00 	. 
	nop			;e1e8	00 	. 
	nop			;e1e9	00 	. 
	nop			;e1ea	00 	. 
	nop			;e1eb	00 	. 
	nop			;e1ec	00 	. 
	nop			;e1ed	00 	. 
	nop			;e1ee	00 	. 
	nop			;e1ef	00 	. 
	nop			;e1f0	00 	. 
	nop			;e1f1	00 	. 
	nop			;e1f2	00 	. 
	nop			;e1f3	00 	. 
	nop			;e1f4	00 	. 
	nop			;e1f5	00 	. 
	nop			;e1f6	00 	. 
	nop			;e1f7	00 	. 
	nop			;e1f8	00 	. 
	nop			;e1f9	00 	. 
	nop			;e1fa	00 	. 
	nop			;e1fb	00 	. 
	nop			;e1fc	00 	. 
	nop			;e1fd	00 	. 
	nop			;e1fe	00 	. 
	nop			;e1ff	00 	. 
	nop			;e200	00 	. 
	nop			;e201	00 	. 
	nop			;e202	00 	. 
	nop			;e203	00 	. 
	nop			;e204	00 	. 
	nop			;e205	00 	. 
	nop			;e206	00 	. 
	nop			;e207	00 	. 
	nop			;e208	00 	. 
	nop			;e209	00 	. 
	nop			;e20a	00 	. 
	nop			;e20b	00 	. 
	nop			;e20c	00 	. 
	nop			;e20d	00 	. 
	nop			;e20e	00 	. 
	nop			;e20f	00 	. 
	nop			;e210	00 	. 
	nop			;e211	00 	. 
	nop			;e212	00 	. 
	nop			;e213	00 	. 
	nop			;e214	00 	. 
	nop			;e215	00 	. 
	nop			;e216	00 	. 
	nop			;e217	00 	. 
	nop			;e218	00 	. 
	nop			;e219	00 	. 
	nop			;e21a	00 	. 
	nop			;e21b	00 	. 
	nop			;e21c	00 	. 
	nop			;e21d	00 	. 
	nop			;e21e	00 	. 
	nop			;e21f	00 	. 
	nop			;e220	00 	. 
	nop			;e221	00 	. 
	nop			;e222	00 	. 
	nop			;e223	00 	. 
	nop			;e224	00 	. 
	nop			;e225	00 	. 
	nop			;e226	00 	. 
	nop			;e227	00 	. 
	nop			;e228	00 	. 
	nop			;e229	00 	. 
	nop			;e22a	00 	. 
	nop			;e22b	00 	. 
	nop			;e22c	00 	. 
	nop			;e22d	00 	. 
	nop			;e22e	00 	. 
	nop			;e22f	00 	. 
	nop			;e230	00 	. 
	nop			;e231	00 	. 
	nop			;e232	00 	. 
	nop			;e233	00 	. 
	nop			;e234	00 	. 
	nop			;e235	00 	. 
	nop			;e236	00 	. 
	nop			;e237	00 	. 
	nop			;e238	00 	. 
	nop			;e239	00 	. 
	nop			;e23a	00 	. 
	nop			;e23b	00 	. 
	nop			;e23c	00 	. 
	nop			;e23d	00 	. 
	nop			;e23e	00 	. 
	nop			;e23f	00 	. 
	nop			;e240	00 	. 
	nop			;e241	00 	. 
	nop			;e242	00 	. 
	nop			;e243	00 	. 
	nop			;e244	00 	. 
	nop			;e245	00 	. 
	nop			;e246	00 	. 
	nop			;e247	00 	. 
	nop			;e248	00 	. 
	nop			;e249	00 	. 
	nop			;e24a	00 	. 
	nop			;e24b	00 	. 
	nop			;e24c	00 	. 
	nop			;e24d	00 	. 
	nop			;e24e	00 	. 
	nop			;e24f	00 	. 
	nop			;e250	00 	. 
	nop			;e251	00 	. 
	nop			;e252	00 	. 
	nop			;e253	00 	. 
	nop			;e254	00 	. 
	nop			;e255	00 	. 
	nop			;e256	00 	. 
	nop			;e257	00 	. 
	nop			;e258	00 	. 
	nop			;e259	00 	. 
	nop			;e25a	00 	. 
	nop			;e25b	00 	. 
	nop			;e25c	00 	. 
	nop			;e25d	00 	. 
	nop			;e25e	00 	. 
	nop			;e25f	00 	. 
	nop			;e260	00 	. 
	nop			;e261	00 	. 
	nop			;e262	00 	. 
	nop			;e263	00 	. 
	nop			;e264	00 	. 
	nop			;e265	00 	. 
	nop			;e266	00 	. 
	nop			;e267	00 	. 
	nop			;e268	00 	. 
	nop			;e269	00 	. 
	nop			;e26a	00 	. 
	nop			;e26b	00 	. 
	nop			;e26c	00 	. 
	nop			;e26d	00 	. 
	nop			;e26e	00 	. 
	nop			;e26f	00 	. 
	nop			;e270	00 	. 
	nop			;e271	00 	. 
	nop			;e272	00 	. 
	nop			;e273	00 	. 
	nop			;e274	00 	. 
	nop			;e275	00 	. 
	nop			;e276	00 	. 
	nop			;e277	00 	. 
	nop			;e278	00 	. 
	nop			;e279	00 	. 
	nop			;e27a	00 	. 
	nop			;e27b	00 	. 
	nop			;e27c	00 	. 
	nop			;e27d	00 	. 
	nop			;e27e	00 	. 
	nop			;e27f	00 	. 
	nop			;e280	00 	. 
	nop			;e281	00 	. 
	nop			;e282	00 	. 
	nop			;e283	00 	. 
	nop			;e284	00 	. 
	nop			;e285	00 	. 
	nop			;e286	00 	. 
	nop			;e287	00 	. 
	nop			;e288	00 	. 
	nop			;e289	00 	. 
	nop			;e28a	00 	. 
	nop			;e28b	00 	. 
	nop			;e28c	00 	. 
	nop			;e28d	00 	. 
	nop			;e28e	00 	. 
	nop			;e28f	00 	. 
	nop			;e290	00 	. 
	nop			;e291	00 	. 
	nop			;e292	00 	. 
	nop			;e293	00 	. 
	nop			;e294	00 	. 
	nop			;e295	00 	. 
	nop			;e296	00 	. 
	nop			;e297	00 	. 
	nop			;e298	00 	. 
	nop			;e299	00 	. 
	nop			;e29a	00 	. 
	nop			;e29b	00 	. 
	nop			;e29c	00 	. 
	nop			;e29d	00 	. 
	nop			;e29e	00 	. 
	nop			;e29f	00 	. 
	nop			;e2a0	00 	. 
	nop			;e2a1	00 	. 
	nop			;e2a2	00 	. 
	nop			;e2a3	00 	. 
	nop			;e2a4	00 	. 
	nop			;e2a5	00 	. 
	nop			;e2a6	00 	. 
	nop			;e2a7	00 	. 
	nop			;e2a8	00 	. 
	nop			;e2a9	00 	. 
	nop			;e2aa	00 	. 
	nop			;e2ab	00 	. 
	nop			;e2ac	00 	. 
	nop			;e2ad	00 	. 
	nop			;e2ae	00 	. 
	nop			;e2af	00 	. 
	nop			;e2b0	00 	. 
	nop			;e2b1	00 	. 
	nop			;e2b2	00 	. 
	nop			;e2b3	00 	. 
	nop			;e2b4	00 	. 
	nop			;e2b5	00 	. 
	nop			;e2b6	00 	. 
	nop			;e2b7	00 	. 
	nop			;e2b8	00 	. 
	nop			;e2b9	00 	. 
	nop			;e2ba	00 	. 
	nop			;e2bb	00 	. 
	nop			;e2bc	00 	. 
	nop			;e2bd	00 	. 
	nop			;e2be	00 	. 
	nop			;e2bf	00 	. 
	nop			;e2c0	00 	. 
	nop			;e2c1	00 	. 
	nop			;e2c2	00 	. 
	nop			;e2c3	00 	. 
	nop			;e2c4	00 	. 
	nop			;e2c5	00 	. 
	nop			;e2c6	00 	. 
	nop			;e2c7	00 	. 
	nop			;e2c8	00 	. 
	nop			;e2c9	00 	. 
	nop			;e2ca	00 	. 
	nop			;e2cb	00 	. 
	nop			;e2cc	00 	. 
	nop			;e2cd	00 	. 
	nop			;e2ce	00 	. 
	nop			;e2cf	00 	. 
	nop			;e2d0	00 	. 
	nop			;e2d1	00 	. 
	nop			;e2d2	00 	. 
	nop			;e2d3	00 	. 
	nop			;e2d4	00 	. 
	nop			;e2d5	00 	. 
	nop			;e2d6	00 	. 
	nop			;e2d7	00 	. 
	nop			;e2d8	00 	. 
	nop			;e2d9	00 	. 
	nop			;e2da	00 	. 
	nop			;e2db	00 	. 
	nop			;e2dc	00 	. 
	nop			;e2dd	00 	. 
	nop			;e2de	00 	. 
	nop			;e2df	00 	. 
	nop			;e2e0	00 	. 
	nop			;e2e1	00 	. 
	nop			;e2e2	00 	. 
	nop			;e2e3	00 	. 
	nop			;e2e4	00 	. 
	nop			;e2e5	00 	. 
	nop			;e2e6	00 	. 
	nop			;e2e7	00 	. 
	nop			;e2e8	00 	. 
	nop			;e2e9	00 	. 
	nop			;e2ea	00 	. 
	nop			;e2eb	00 	. 
	nop			;e2ec	00 	. 
	nop			;e2ed	00 	. 
	nop			;e2ee	00 	. 
	nop			;e2ef	00 	. 
	nop			;e2f0	00 	. 
	nop			;e2f1	00 	. 
	nop			;e2f2	00 	. 
	nop			;e2f3	00 	. 
	nop			;e2f4	00 	. 
	nop			;e2f5	00 	. 
	nop			;e2f6	00 	. 
	nop			;e2f7	00 	. 
	nop			;e2f8	00 	. 
	nop			;e2f9	00 	. 
	nop			;e2fa	00 	. 
	nop			;e2fb	00 	. 
	nop			;e2fc	00 	. 
	nop			;e2fd	00 	. 
	nop			;e2fe	00 	. 
	nop			;e2ff	00 	. 
	nop			;e300	00 	. 
	nop			;e301	00 	. 
	nop			;e302	00 	. 
	nop			;e303	00 	. 
	nop			;e304	00 	. 
	nop			;e305	00 	. 
	nop			;e306	00 	. 
	nop			;e307	00 	. 
	nop			;e308	00 	. 
	nop			;e309	00 	. 
	nop			;e30a	00 	. 
	nop			;e30b	00 	. 
	nop			;e30c	00 	. 
	nop			;e30d	00 	. 
	nop			;e30e	00 	. 
	nop			;e30f	00 	. 
	nop			;e310	00 	. 
	nop			;e311	00 	. 
	nop			;e312	00 	. 
	nop			;e313	00 	. 
	nop			;e314	00 	. 
	nop			;e315	00 	. 
	nop			;e316	00 	. 
	nop			;e317	00 	. 
	nop			;e318	00 	. 
	nop			;e319	00 	. 
	nop			;e31a	00 	. 
	nop			;e31b	00 	. 
	nop			;e31c	00 	. 
	nop			;e31d	00 	. 
	nop			;e31e	00 	. 
	nop			;e31f	00 	. 
	nop			;e320	00 	. 
	nop			;e321	00 	. 
	nop			;e322	00 	. 
	nop			;e323	00 	. 
	nop			;e324	00 	. 
	nop			;e325	00 	. 
	nop			;e326	00 	. 
	nop			;e327	00 	. 
	nop			;e328	00 	. 
	nop			;e329	00 	. 
	nop			;e32a	00 	. 
	nop			;e32b	00 	. 
	nop			;e32c	00 	. 
	nop			;e32d	00 	. 
	nop			;e32e	00 	. 
	nop			;e32f	00 	. 
	nop			;e330	00 	. 
	nop			;e331	00 	. 
	nop			;e332	00 	. 
	nop			;e333	00 	. 
	nop			;e334	00 	. 
	nop			;e335	00 	. 
	nop			;e336	00 	. 
	nop			;e337	00 	. 
	nop			;e338	00 	. 
	nop			;e339	00 	. 
	nop			;e33a	00 	. 
	nop			;e33b	00 	. 
	nop			;e33c	00 	. 
	nop			;e33d	00 	. 
	nop			;e33e	00 	. 
	nop			;e33f	00 	. 
	nop			;e340	00 	. 
	nop			;e341	00 	. 
	nop			;e342	00 	. 
	nop			;e343	00 	. 
	nop			;e344	00 	. 
	nop			;e345	00 	. 
	nop			;e346	00 	. 
	nop			;e347	00 	. 
	nop			;e348	00 	. 
	nop			;e349	00 	. 
	nop			;e34a	00 	. 
	nop			;e34b	00 	. 
	nop			;e34c	00 	. 
	nop			;e34d	00 	. 
	nop			;e34e	00 	. 
	nop			;e34f	00 	. 
	nop			;e350	00 	. 
	nop			;e351	00 	. 
	nop			;e352	00 	. 
	nop			;e353	00 	. 
	nop			;e354	00 	. 
	nop			;e355	00 	. 
	nop			;e356	00 	. 
	nop			;e357	00 	. 
	nop			;e358	00 	. 
	nop			;e359	00 	. 
	nop			;e35a	00 	. 
	nop			;e35b	00 	. 
	nop			;e35c	00 	. 
	nop			;e35d	00 	. 
	nop			;e35e	00 	. 
	nop			;e35f	00 	. 
	nop			;e360	00 	. 
	nop			;e361	00 	. 
	nop			;e362	00 	. 
	nop			;e363	00 	. 
	nop			;e364	00 	. 
	nop			;e365	00 	. 
	nop			;e366	00 	. 
	nop			;e367	00 	. 
	nop			;e368	00 	. 
	nop			;e369	00 	. 
	nop			;e36a	00 	. 
	nop			;e36b	00 	. 
	nop			;e36c	00 	. 
	nop			;e36d	00 	. 
	nop			;e36e	00 	. 
	nop			;e36f	00 	. 
	nop			;e370	00 	. 
	nop			;e371	00 	. 
	nop			;e372	00 	. 
	nop			;e373	00 	. 
	nop			;e374	00 	. 
	nop			;e375	00 	. 
	nop			;e376	00 	. 
	nop			;e377	00 	. 
	nop			;e378	00 	. 
	nop			;e379	00 	. 
	nop			;e37a	00 	. 
	nop			;e37b	00 	. 
	nop			;e37c	00 	. 
	nop			;e37d	00 	. 
	nop			;e37e	00 	. 
	nop			;e37f	00 	. 
	nop			;e380	00 	. 
	nop			;e381	00 	. 
	nop			;e382	00 	. 
	nop			;e383	00 	. 
	nop			;e384	00 	. 
	nop			;e385	00 	. 
	nop			;e386	00 	. 
	nop			;e387	00 	. 
	nop			;e388	00 	. 
	nop			;e389	00 	. 
	nop			;e38a	00 	. 
	nop			;e38b	00 	. 
	nop			;e38c	00 	. 
	nop			;e38d	00 	. 
	nop			;e38e	00 	. 
	nop			;e38f	00 	. 
	nop			;e390	00 	. 
	nop			;e391	00 	. 
	nop			;e392	00 	. 
	nop			;e393	00 	. 
	nop			;e394	00 	. 
	nop			;e395	00 	. 
	nop			;e396	00 	. 
	nop			;e397	00 	. 
	nop			;e398	00 	. 
	nop			;e399	00 	. 
	nop			;e39a	00 	. 
	nop			;e39b	00 	. 
	nop			;e39c	00 	. 
	nop			;e39d	00 	. 
	nop			;e39e	00 	. 
	nop			;e39f	00 	. 
	nop			;e3a0	00 	. 
	nop			;e3a1	00 	. 
	nop			;e3a2	00 	. 
	nop			;e3a3	00 	. 
	nop			;e3a4	00 	. 
	nop			;e3a5	00 	. 
	nop			;e3a6	00 	. 
	nop			;e3a7	00 	. 
	nop			;e3a8	00 	. 
	nop			;e3a9	00 	. 
	nop			;e3aa	00 	. 
	nop			;e3ab	00 	. 
	nop			;e3ac	00 	. 
	nop			;e3ad	00 	. 
	nop			;e3ae	00 	. 
	nop			;e3af	00 	. 
	nop			;e3b0	00 	. 
	nop			;e3b1	00 	. 
	nop			;e3b2	00 	. 
	nop			;e3b3	00 	. 
	nop			;e3b4	00 	. 
	nop			;e3b5	00 	. 
	nop			;e3b6	00 	. 
	nop			;e3b7	00 	. 
	nop			;e3b8	00 	. 
	nop			;e3b9	00 	. 
	nop			;e3ba	00 	. 
	nop			;e3bb	00 	. 
	nop			;e3bc	00 	. 
	nop			;e3bd	00 	. 
	nop			;e3be	00 	. 
	nop			;e3bf	00 	. 
	nop			;e3c0	00 	. 
	nop			;e3c1	00 	. 
	nop			;e3c2	00 	. 
	nop			;e3c3	00 	. 
	nop			;e3c4	00 	. 
	nop			;e3c5	00 	. 
	nop			;e3c6	00 	. 
	nop			;e3c7	00 	. 
	nop			;e3c8	00 	. 
	nop			;e3c9	00 	. 
	nop			;e3ca	00 	. 
	nop			;e3cb	00 	. 
	nop			;e3cc	00 	. 
	nop			;e3cd	00 	. 
	nop			;e3ce	00 	. 
	nop			;e3cf	00 	. 
	nop			;e3d0	00 	. 
	nop			;e3d1	00 	. 
	nop			;e3d2	00 	. 
	nop			;e3d3	00 	. 
	nop			;e3d4	00 	. 
	nop			;e3d5	00 	. 
	nop			;e3d6	00 	. 
	nop			;e3d7	00 	. 
	nop			;e3d8	00 	. 
	nop			;e3d9	00 	. 
	nop			;e3da	00 	. 
	nop			;e3db	00 	. 
	nop			;e3dc	00 	. 
	nop			;e3dd	00 	. 
	nop			;e3de	00 	. 
	nop			;e3df	00 	. 
	nop			;e3e0	00 	. 
	nop			;e3e1	00 	. 
	nop			;e3e2	00 	. 
	nop			;e3e3	00 	. 
	nop			;e3e4	00 	. 
	nop			;e3e5	00 	. 
	nop			;e3e6	00 	. 
	nop			;e3e7	00 	. 
	nop			;e3e8	00 	. 
	nop			;e3e9	00 	. 
	nop			;e3ea	00 	. 
	nop			;e3eb	00 	. 
	nop			;e3ec	00 	. 
	nop			;e3ed	00 	. 
	nop			;e3ee	00 	. 
	nop			;e3ef	00 	. 
	nop			;e3f0	00 	. 
	nop			;e3f1	00 	. 
	nop			;e3f2	00 	. 
	nop			;e3f3	00 	. 
	nop			;e3f4	00 	. 
	nop			;e3f5	00 	. 
	nop			;e3f6	00 	. 
	nop			;e3f7	00 	. 
	nop			;e3f8	00 	. 
	nop			;e3f9	00 	. 
	nop			;e3fa	00 	. 
	nop			;e3fb	00 	. 
	nop			;e3fc	00 	. 
	nop			;e3fd	00 	. 
	nop			;e3fe	00 	. 
	nop			;e3ff	00 	. 
	nop			;e400	00 	. 
	nop			;e401	00 	. 
	nop			;e402	00 	. 
	nop			;e403	00 	. 
	nop			;e404	00 	. 
	nop			;e405	00 	. 
	nop			;e406	00 	. 
	nop			;e407	00 	. 
	nop			;e408	00 	. 
	nop			;e409	00 	. 
	nop			;e40a	00 	. 
	nop			;e40b	00 	. 
	nop			;e40c	00 	. 
	nop			;e40d	00 	. 
	nop			;e40e	00 	. 
	nop			;e40f	00 	. 
	nop			;e410	00 	. 
	nop			;e411	00 	. 
	nop			;e412	00 	. 
	nop			;e413	00 	. 
	nop			;e414	00 	. 
	nop			;e415	00 	. 
	nop			;e416	00 	. 
	nop			;e417	00 	. 
	nop			;e418	00 	. 
	nop			;e419	00 	. 
	nop			;e41a	00 	. 
	nop			;e41b	00 	. 
	nop			;e41c	00 	. 
	nop			;e41d	00 	. 
	nop			;e41e	00 	. 
	nop			;e41f	00 	. 
	nop			;e420	00 	. 
	nop			;e421	00 	. 
	nop			;e422	00 	. 
	nop			;e423	00 	. 
	nop			;e424	00 	. 
	nop			;e425	00 	. 
	nop			;e426	00 	. 
	nop			;e427	00 	. 
	nop			;e428	00 	. 
	nop			;e429	00 	. 
	nop			;e42a	00 	. 
	nop			;e42b	00 	. 
	nop			;e42c	00 	. 
	nop			;e42d	00 	. 
	nop			;e42e	00 	. 
	nop			;e42f	00 	. 
	nop			;e430	00 	. 
	nop			;e431	00 	. 
	nop			;e432	00 	. 
	nop			;e433	00 	. 
	nop			;e434	00 	. 
	nop			;e435	00 	. 
	nop			;e436	00 	. 
	nop			;e437	00 	. 
	nop			;e438	00 	. 
	nop			;e439	00 	. 
	nop			;e43a	00 	. 
	nop			;e43b	00 	. 
	nop			;e43c	00 	. 
	nop			;e43d	00 	. 
	nop			;e43e	00 	. 
	nop			;e43f	00 	. 
	nop			;e440	00 	. 
	nop			;e441	00 	. 
	nop			;e442	00 	. 
	nop			;e443	00 	. 
	nop			;e444	00 	. 
	nop			;e445	00 	. 
	nop			;e446	00 	. 
	nop			;e447	00 	. 
	nop			;e448	00 	. 
	nop			;e449	00 	. 
	nop			;e44a	00 	. 
	nop			;e44b	00 	. 
	nop			;e44c	00 	. 
	nop			;e44d	00 	. 
	nop			;e44e	00 	. 
	nop			;e44f	00 	. 
	nop			;e450	00 	. 
	nop			;e451	00 	. 
	nop			;e452	00 	. 
	nop			;e453	00 	. 
	nop			;e454	00 	. 
	nop			;e455	00 	. 
	nop			;e456	00 	. 
	nop			;e457	00 	. 
	nop			;e458	00 	. 
	nop			;e459	00 	. 
	nop			;e45a	00 	. 
	nop			;e45b	00 	. 
	nop			;e45c	00 	. 
	nop			;e45d	00 	. 
	nop			;e45e	00 	. 
	nop			;e45f	00 	. 
	nop			;e460	00 	. 
	nop			;e461	00 	. 
	nop			;e462	00 	. 
	nop			;e463	00 	. 
	nop			;e464	00 	. 
	nop			;e465	00 	. 
	nop			;e466	00 	. 
	nop			;e467	00 	. 
	nop			;e468	00 	. 
	nop			;e469	00 	. 
	nop			;e46a	00 	. 
	nop			;e46b	00 	. 
	nop			;e46c	00 	. 
	nop			;e46d	00 	. 
	nop			;e46e	00 	. 
	nop			;e46f	00 	. 
	nop			;e470	00 	. 
	nop			;e471	00 	. 
	nop			;e472	00 	. 
	nop			;e473	00 	. 
	nop			;e474	00 	. 
	nop			;e475	00 	. 
	nop			;e476	00 	. 
	nop			;e477	00 	. 
	nop			;e478	00 	. 
	nop			;e479	00 	. 
	nop			;e47a	00 	. 
	nop			;e47b	00 	. 
	nop			;e47c	00 	. 
	nop			;e47d	00 	. 
	nop			;e47e	00 	. 
	nop			;e47f	00 	. 
	nop			;e480	00 	. 
	nop			;e481	00 	. 
	nop			;e482	00 	. 
	nop			;e483	00 	. 
	nop			;e484	00 	. 
	nop			;e485	00 	. 
	nop			;e486	00 	. 
	nop			;e487	00 	. 
	nop			;e488	00 	. 
	nop			;e489	00 	. 
	nop			;e48a	00 	. 
	nop			;e48b	00 	. 
	nop			;e48c	00 	. 
	nop			;e48d	00 	. 
	nop			;e48e	00 	. 
	nop			;e48f	00 	. 
	nop			;e490	00 	. 
	nop			;e491	00 	. 
	nop			;e492	00 	. 
	nop			;e493	00 	. 
	nop			;e494	00 	. 
	nop			;e495	00 	. 
	nop			;e496	00 	. 
	nop			;e497	00 	. 
	nop			;e498	00 	. 
	nop			;e499	00 	. 
	nop			;e49a	00 	. 
	nop			;e49b	00 	. 
	nop			;e49c	00 	. 
	nop			;e49d	00 	. 
	nop			;e49e	00 	. 
	nop			;e49f	00 	. 
	nop			;e4a0	00 	. 
	nop			;e4a1	00 	. 
	nop			;e4a2	00 	. 
	nop			;e4a3	00 	. 
	nop			;e4a4	00 	. 
	nop			;e4a5	00 	. 
	nop			;e4a6	00 	. 
	nop			;e4a7	00 	. 
	nop			;e4a8	00 	. 
	nop			;e4a9	00 	. 
	nop			;e4aa	00 	. 
	nop			;e4ab	00 	. 
	nop			;e4ac	00 	. 
	nop			;e4ad	00 	. 
	nop			;e4ae	00 	. 
	nop			;e4af	00 	. 
	nop			;e4b0	00 	. 
	nop			;e4b1	00 	. 
	nop			;e4b2	00 	. 
	nop			;e4b3	00 	. 
	nop			;e4b4	00 	. 
	nop			;e4b5	00 	. 
	nop			;e4b6	00 	. 
	nop			;e4b7	00 	. 
	nop			;e4b8	00 	. 
	nop			;e4b9	00 	. 
	nop			;e4ba	00 	. 
	nop			;e4bb	00 	. 
	nop			;e4bc	00 	. 
	nop			;e4bd	00 	. 
	nop			;e4be	00 	. 
	nop			;e4bf	00 	. 
	nop			;e4c0	00 	. 
	nop			;e4c1	00 	. 
	nop			;e4c2	00 	. 
	nop			;e4c3	00 	. 
	nop			;e4c4	00 	. 
	nop			;e4c5	00 	. 
	nop			;e4c6	00 	. 
	nop			;e4c7	00 	. 
	nop			;e4c8	00 	. 
	nop			;e4c9	00 	. 
	nop			;e4ca	00 	. 
	nop			;e4cb	00 	. 
	nop			;e4cc	00 	. 
	nop			;e4cd	00 	. 
	nop			;e4ce	00 	. 
	nop			;e4cf	00 	. 
	nop			;e4d0	00 	. 
	nop			;e4d1	00 	. 
	nop			;e4d2	00 	. 
	nop			;e4d3	00 	. 
	nop			;e4d4	00 	. 
	nop			;e4d5	00 	. 
	nop			;e4d6	00 	. 
	nop			;e4d7	00 	. 
	nop			;e4d8	00 	. 
	nop			;e4d9	00 	. 
	nop			;e4da	00 	. 
	nop			;e4db	00 	. 
	nop			;e4dc	00 	. 
	nop			;e4dd	00 	. 
	nop			;e4de	00 	. 
	nop			;e4df	00 	. 
	nop			;e4e0	00 	. 
	nop			;e4e1	00 	. 
	nop			;e4e2	00 	. 
	nop			;e4e3	00 	. 
	nop			;e4e4	00 	. 
	nop			;e4e5	00 	. 
	nop			;e4e6	00 	. 
	nop			;e4e7	00 	. 
	nop			;e4e8	00 	. 
	nop			;e4e9	00 	. 
	nop			;e4ea	00 	. 
	nop			;e4eb	00 	. 
	nop			;e4ec	00 	. 
	nop			;e4ed	00 	. 
	nop			;e4ee	00 	. 
	nop			;e4ef	00 	. 
	nop			;e4f0	00 	. 
	nop			;e4f1	00 	. 
	nop			;e4f2	00 	. 
	nop			;e4f3	00 	. 
	nop			;e4f4	00 	. 
	nop			;e4f5	00 	. 
	nop			;e4f6	00 	. 
	nop			;e4f7	00 	. 
	nop			;e4f8	00 	. 
	nop			;e4f9	00 	. 
	nop			;e4fa	00 	. 
	nop			;e4fb	00 	. 
	nop			;e4fc	00 	. 
	nop			;e4fd	00 	. 
	nop			;e4fe	00 	. 
	nop			;e4ff	00 	. 
	nop			;e500	00 	. 
	nop			;e501	00 	. 
	nop			;e502	00 	. 
	nop			;e503	00 	. 
	nop			;e504	00 	. 
	nop			;e505	00 	. 
	nop			;e506	00 	. 
	nop			;e507	00 	. 
	nop			;e508	00 	. 
	nop			;e509	00 	. 
	nop			;e50a	00 	. 
	nop			;e50b	00 	. 
	nop			;e50c	00 	. 
	nop			;e50d	00 	. 
	nop			;e50e	00 	. 
	nop			;e50f	00 	. 
	nop			;e510	00 	. 
	nop			;e511	00 	. 
	nop			;e512	00 	. 
	nop			;e513	00 	. 
	nop			;e514	00 	. 
	nop			;e515	00 	. 
	nop			;e516	00 	. 
	nop			;e517	00 	. 
	nop			;e518	00 	. 
	nop			;e519	00 	. 
	nop			;e51a	00 	. 
	nop			;e51b	00 	. 
	nop			;e51c	00 	. 
	nop			;e51d	00 	. 
	nop			;e51e	00 	. 
	nop			;e51f	00 	. 
	nop			;e520	00 	. 
	nop			;e521	00 	. 
	nop			;e522	00 	. 
	nop			;e523	00 	. 
	nop			;e524	00 	. 
	nop			;e525	00 	. 
	nop			;e526	00 	. 
	nop			;e527	00 	. 
	nop			;e528	00 	. 
	nop			;e529	00 	. 
	nop			;e52a	00 	. 
	nop			;e52b	00 	. 
	nop			;e52c	00 	. 
	nop			;e52d	00 	. 
	nop			;e52e	00 	. 
	nop			;e52f	00 	. 
	nop			;e530	00 	. 
	nop			;e531	00 	. 
	nop			;e532	00 	. 
	nop			;e533	00 	. 
	nop			;e534	00 	. 
	nop			;e535	00 	. 
	nop			;e536	00 	. 
	nop			;e537	00 	. 
	nop			;e538	00 	. 
	nop			;e539	00 	. 
	nop			;e53a	00 	. 
	nop			;e53b	00 	. 
	nop			;e53c	00 	. 
	nop			;e53d	00 	. 
	nop			;e53e	00 	. 
	nop			;e53f	00 	. 
	nop			;e540	00 	. 
	nop			;e541	00 	. 
	nop			;e542	00 	. 
	nop			;e543	00 	. 
	nop			;e544	00 	. 
	nop			;e545	00 	. 
	nop			;e546	00 	. 
	nop			;e547	00 	. 
	nop			;e548	00 	. 
	nop			;e549	00 	. 
	nop			;e54a	00 	. 
	nop			;e54b	00 	. 
	nop			;e54c	00 	. 
	nop			;e54d	00 	. 
	nop			;e54e	00 	. 
	nop			;e54f	00 	. 
	nop			;e550	00 	. 
	nop			;e551	00 	. 
	nop			;e552	00 	. 
	nop			;e553	00 	. 
	nop			;e554	00 	. 
	nop			;e555	00 	. 
	nop			;e556	00 	. 
	nop			;e557	00 	. 
	nop			;e558	00 	. 
	nop			;e559	00 	. 
	nop			;e55a	00 	. 
	nop			;e55b	00 	. 
	nop			;e55c	00 	. 
	nop			;e55d	00 	. 
	nop			;e55e	00 	. 
	nop			;e55f	00 	. 
	nop			;e560	00 	. 
	nop			;e561	00 	. 
	nop			;e562	00 	. 
	nop			;e563	00 	. 
	nop			;e564	00 	. 
	nop			;e565	00 	. 
	nop			;e566	00 	. 
	nop			;e567	00 	. 
	nop			;e568	00 	. 
	nop			;e569	00 	. 
	nop			;e56a	00 	. 
	nop			;e56b	00 	. 
	nop			;e56c	00 	. 
	nop			;e56d	00 	. 
	nop			;e56e	00 	. 
	nop			;e56f	00 	. 
	nop			;e570	00 	. 
	nop			;e571	00 	. 
	nop			;e572	00 	. 
	nop			;e573	00 	. 
	nop			;e574	00 	. 
	nop			;e575	00 	. 
	nop			;e576	00 	. 
	nop			;e577	00 	. 
	nop			;e578	00 	. 
	nop			;e579	00 	. 
	nop			;e57a	00 	. 
	nop			;e57b	00 	. 
	nop			;e57c	00 	. 
	nop			;e57d	00 	. 
	nop			;e57e	00 	. 
	nop			;e57f	00 	. 
	nop			;e580	00 	. 
	nop			;e581	00 	. 
	nop			;e582	00 	. 
	nop			;e583	00 	. 
	nop			;e584	00 	. 
	nop			;e585	00 	. 
	nop			;e586	00 	. 
	nop			;e587	00 	. 
	nop			;e588	00 	. 
	nop			;e589	00 	. 
	nop			;e58a	00 	. 
	nop			;e58b	00 	. 
	nop			;e58c	00 	. 
	nop			;e58d	00 	. 
	nop			;e58e	00 	. 
	nop			;e58f	00 	. 
	nop			;e590	00 	. 
	nop			;e591	00 	. 
	nop			;e592	00 	. 
	nop			;e593	00 	. 
	nop			;e594	00 	. 
	nop			;e595	00 	. 
	nop			;e596	00 	. 
	nop			;e597	00 	. 
	nop			;e598	00 	. 
	nop			;e599	00 	. 
	nop			;e59a	00 	. 
	nop			;e59b	00 	. 
	nop			;e59c	00 	. 
	nop			;e59d	00 	. 
	nop			;e59e	00 	. 
	nop			;e59f	00 	. 
	nop			;e5a0	00 	. 
	nop			;e5a1	00 	. 
	nop			;e5a2	00 	. 
	nop			;e5a3	00 	. 
	nop			;e5a4	00 	. 
	nop			;e5a5	00 	. 
	nop			;e5a6	00 	. 
	nop			;e5a7	00 	. 
	nop			;e5a8	00 	. 
	nop			;e5a9	00 	. 
	nop			;e5aa	00 	. 
	nop			;e5ab	00 	. 
	nop			;e5ac	00 	. 
	nop			;e5ad	00 	. 
	nop			;e5ae	00 	. 
	nop			;e5af	00 	. 
	nop			;e5b0	00 	. 
	nop			;e5b1	00 	. 
	nop			;e5b2	00 	. 
	nop			;e5b3	00 	. 
	nop			;e5b4	00 	. 
	nop			;e5b5	00 	. 
	nop			;e5b6	00 	. 
	nop			;e5b7	00 	. 
	nop			;e5b8	00 	. 
	nop			;e5b9	00 	. 
	nop			;e5ba	00 	. 
	nop			;e5bb	00 	. 
	nop			;e5bc	00 	. 
	nop			;e5bd	00 	. 
	nop			;e5be	00 	. 
	nop			;e5bf	00 	. 
	nop			;e5c0	00 	. 
	nop			;e5c1	00 	. 
	nop			;e5c2	00 	. 
	nop			;e5c3	00 	. 
	nop			;e5c4	00 	. 
	nop			;e5c5	00 	. 
	nop			;e5c6	00 	. 
	nop			;e5c7	00 	. 
	nop			;e5c8	00 	. 
	nop			;e5c9	00 	. 
	nop			;e5ca	00 	. 
	nop			;e5cb	00 	. 
	nop			;e5cc	00 	. 
	nop			;e5cd	00 	. 
	nop			;e5ce	00 	. 
	nop			;e5cf	00 	. 
	nop			;e5d0	00 	. 
	nop			;e5d1	00 	. 
	nop			;e5d2	00 	. 
	nop			;e5d3	00 	. 
	nop			;e5d4	00 	. 
	nop			;e5d5	00 	. 
	nop			;e5d6	00 	. 
	nop			;e5d7	00 	. 
	nop			;e5d8	00 	. 
	nop			;e5d9	00 	. 
	nop			;e5da	00 	. 
	nop			;e5db	00 	. 
	nop			;e5dc	00 	. 
	nop			;e5dd	00 	. 
	nop			;e5de	00 	. 
	nop			;e5df	00 	. 
	nop			;e5e0	00 	. 
	nop			;e5e1	00 	. 
	nop			;e5e2	00 	. 
	nop			;e5e3	00 	. 
	nop			;e5e4	00 	. 
	nop			;e5e5	00 	. 
	nop			;e5e6	00 	. 
	nop			;e5e7	00 	. 
	nop			;e5e8	00 	. 
	nop			;e5e9	00 	. 
	nop			;e5ea	00 	. 
	nop			;e5eb	00 	. 
	nop			;e5ec	00 	. 
	nop			;e5ed	00 	. 
	nop			;e5ee	00 	. 
	nop			;e5ef	00 	. 
	nop			;e5f0	00 	. 
	nop			;e5f1	00 	. 
	nop			;e5f2	00 	. 
	nop			;e5f3	00 	. 
	nop			;e5f4	00 	. 
	nop			;e5f5	00 	. 
	nop			;e5f6	00 	. 
	nop			;e5f7	00 	. 
	nop			;e5f8	00 	. 
	nop			;e5f9	00 	. 
	nop			;e5fa	00 	. 
	nop			;e5fb	00 	. 
	nop			;e5fc	00 	. 
	nop			;e5fd	00 	. 
	nop			;e5fe	00 	. 
	nop			;e5ff	00 	. 
	nop			;e600	00 	. 
	nop			;e601	00 	. 
	nop			;e602	00 	. 
	nop			;e603	00 	. 
	nop			;e604	00 	. 
	nop			;e605	00 	. 
	nop			;e606	00 	. 
	nop			;e607	00 	. 
	nop			;e608	00 	. 
	nop			;e609	00 	. 
	nop			;e60a	00 	. 
	nop			;e60b	00 	. 
	nop			;e60c	00 	. 
	nop			;e60d	00 	. 
	nop			;e60e	00 	. 
	nop			;e60f	00 	. 
	nop			;e610	00 	. 
	nop			;e611	00 	. 
	nop			;e612	00 	. 
	nop			;e613	00 	. 
	nop			;e614	00 	. 
	nop			;e615	00 	. 
	nop			;e616	00 	. 
	nop			;e617	00 	. 
	nop			;e618	00 	. 
	nop			;e619	00 	. 
	nop			;e61a	00 	. 
	nop			;e61b	00 	. 
	nop			;e61c	00 	. 
	nop			;e61d	00 	. 
	nop			;e61e	00 	. 
	nop			;e61f	00 	. 
	nop			;e620	00 	. 
	nop			;e621	00 	. 
	nop			;e622	00 	. 
	nop			;e623	00 	. 
	nop			;e624	00 	. 
	nop			;e625	00 	. 
	nop			;e626	00 	. 
	nop			;e627	00 	. 
	nop			;e628	00 	. 
	nop			;e629	00 	. 
	nop			;e62a	00 	. 
	nop			;e62b	00 	. 
	nop			;e62c	00 	. 
	nop			;e62d	00 	. 
	nop			;e62e	00 	. 
	nop			;e62f	00 	. 
	nop			;e630	00 	. 
	nop			;e631	00 	. 
	nop			;e632	00 	. 
	nop			;e633	00 	. 
	nop			;e634	00 	. 
	nop			;e635	00 	. 
	nop			;e636	00 	. 
	nop			;e637	00 	. 
	nop			;e638	00 	. 
	nop			;e639	00 	. 
	nop			;e63a	00 	. 
	nop			;e63b	00 	. 
	nop			;e63c	00 	. 
	nop			;e63d	00 	. 
	nop			;e63e	00 	. 
	nop			;e63f	00 	. 
	nop			;e640	00 	. 
	nop			;e641	00 	. 
	nop			;e642	00 	. 
	nop			;e643	00 	. 
	nop			;e644	00 	. 
	nop			;e645	00 	. 
	nop			;e646	00 	. 
	nop			;e647	00 	. 
	nop			;e648	00 	. 
	nop			;e649	00 	. 
	nop			;e64a	00 	. 
	nop			;e64b	00 	. 
	nop			;e64c	00 	. 
	nop			;e64d	00 	. 
	nop			;e64e	00 	. 
	nop			;e64f	00 	. 
	nop			;e650	00 	. 
	nop			;e651	00 	. 
	nop			;e652	00 	. 
	nop			;e653	00 	. 
	nop			;e654	00 	. 
	nop			;e655	00 	. 
	nop			;e656	00 	. 
	nop			;e657	00 	. 
	nop			;e658	00 	. 
	nop			;e659	00 	. 
	nop			;e65a	00 	. 
	nop			;e65b	00 	. 
	nop			;e65c	00 	. 
	nop			;e65d	00 	. 
	nop			;e65e	00 	. 
	nop			;e65f	00 	. 
	nop			;e660	00 	. 
	nop			;e661	00 	. 
	nop			;e662	00 	. 
	nop			;e663	00 	. 
	nop			;e664	00 	. 
	nop			;e665	00 	. 
	nop			;e666	00 	. 
	nop			;e667	00 	. 
	nop			;e668	00 	. 
	nop			;e669	00 	. 
	nop			;e66a	00 	. 
	nop			;e66b	00 	. 
	nop			;e66c	00 	. 
	nop			;e66d	00 	. 
	nop			;e66e	00 	. 
	nop			;e66f	00 	. 
	nop			;e670	00 	. 
	nop			;e671	00 	. 
	nop			;e672	00 	. 
	nop			;e673	00 	. 
	nop			;e674	00 	. 
	nop			;e675	00 	. 
	nop			;e676	00 	. 
	nop			;e677	00 	. 
	nop			;e678	00 	. 
	nop			;e679	00 	. 
	nop			;e67a	00 	. 
	nop			;e67b	00 	. 
	nop			;e67c	00 	. 
	nop			;e67d	00 	. 
	nop			;e67e	00 	. 
	nop			;e67f	00 	. 
	nop			;e680	00 	. 
	nop			;e681	00 	. 
	nop			;e682	00 	. 
	nop			;e683	00 	. 
	nop			;e684	00 	. 
	nop			;e685	00 	. 
	nop			;e686	00 	. 
	nop			;e687	00 	. 
	nop			;e688	00 	. 
	nop			;e689	00 	. 
	nop			;e68a	00 	. 
	nop			;e68b	00 	. 
	nop			;e68c	00 	. 
	nop			;e68d	00 	. 
	nop			;e68e	00 	. 
	nop			;e68f	00 	. 
	nop			;e690	00 	. 
	nop			;e691	00 	. 
	nop			;e692	00 	. 
	nop			;e693	00 	. 
	nop			;e694	00 	. 
	nop			;e695	00 	. 
	nop			;e696	00 	. 
	nop			;e697	00 	. 
	nop			;e698	00 	. 
	nop			;e699	00 	. 
	nop			;e69a	00 	. 
	nop			;e69b	00 	. 
	nop			;e69c	00 	. 
	nop			;e69d	00 	. 
	nop			;e69e	00 	. 
	nop			;e69f	00 	. 
	nop			;e6a0	00 	. 
	nop			;e6a1	00 	. 
	nop			;e6a2	00 	. 
	nop			;e6a3	00 	. 
	nop			;e6a4	00 	. 
	nop			;e6a5	00 	. 
	nop			;e6a6	00 	. 
	nop			;e6a7	00 	. 
	nop			;e6a8	00 	. 
	nop			;e6a9	00 	. 
	nop			;e6aa	00 	. 
	nop			;e6ab	00 	. 
	nop			;e6ac	00 	. 
	nop			;e6ad	00 	. 
	nop			;e6ae	00 	. 
	nop			;e6af	00 	. 
	nop			;e6b0	00 	. 
	nop			;e6b1	00 	. 
	nop			;e6b2	00 	. 
	nop			;e6b3	00 	. 
	nop			;e6b4	00 	. 
	nop			;e6b5	00 	. 
	nop			;e6b6	00 	. 
	nop			;e6b7	00 	. 
	nop			;e6b8	00 	. 
	nop			;e6b9	00 	. 
	nop			;e6ba	00 	. 
	nop			;e6bb	00 	. 
	nop			;e6bc	00 	. 
	nop			;e6bd	00 	. 
	nop			;e6be	00 	. 
	nop			;e6bf	00 	. 
	nop			;e6c0	00 	. 
	nop			;e6c1	00 	. 
	nop			;e6c2	00 	. 
	nop			;e6c3	00 	. 
	nop			;e6c4	00 	. 
	nop			;e6c5	00 	. 
	nop			;e6c6	00 	. 
	nop			;e6c7	00 	. 
	nop			;e6c8	00 	. 
	nop			;e6c9	00 	. 
	nop			;e6ca	00 	. 
	nop			;e6cb	00 	. 
	nop			;e6cc	00 	. 
	nop			;e6cd	00 	. 
	nop			;e6ce	00 	. 
	nop			;e6cf	00 	. 
	nop			;e6d0	00 	. 
	nop			;e6d1	00 	. 
	nop			;e6d2	00 	. 
	nop			;e6d3	00 	. 
	nop			;e6d4	00 	. 
	nop			;e6d5	00 	. 
	nop			;e6d6	00 	. 
	nop			;e6d7	00 	. 
	nop			;e6d8	00 	. 
	nop			;e6d9	00 	. 
	nop			;e6da	00 	. 
	nop			;e6db	00 	. 
	nop			;e6dc	00 	. 
	nop			;e6dd	00 	. 
	nop			;e6de	00 	. 
	nop			;e6df	00 	. 
	nop			;e6e0	00 	. 
	nop			;e6e1	00 	. 
	nop			;e6e2	00 	. 
	nop			;e6e3	00 	. 
	nop			;e6e4	00 	. 
	nop			;e6e5	00 	. 
	nop			;e6e6	00 	. 
	nop			;e6e7	00 	. 
	nop			;e6e8	00 	. 
	nop			;e6e9	00 	. 
	nop			;e6ea	00 	. 
	nop			;e6eb	00 	. 
	nop			;e6ec	00 	. 
	nop			;e6ed	00 	. 
	nop			;e6ee	00 	. 
	nop			;e6ef	00 	. 
	nop			;e6f0	00 	. 
	nop			;e6f1	00 	. 
	nop			;e6f2	00 	. 
	nop			;e6f3	00 	. 
	nop			;e6f4	00 	. 
	nop			;e6f5	00 	. 
	nop			;e6f6	00 	. 
	nop			;e6f7	00 	. 
	nop			;e6f8	00 	. 
	nop			;e6f9	00 	. 
	nop			;e6fa	00 	. 
	nop			;e6fb	00 	. 
	nop			;e6fc	00 	. 
	nop			;e6fd	00 	. 
	nop			;e6fe	00 	. 
	nop			;e6ff	00 	. 
	nop			;e700	00 	. 
	nop			;e701	00 	. 
	nop			;e702	00 	. 
	nop			;e703	00 	. 
	nop			;e704	00 	. 
	nop			;e705	00 	. 
	nop			;e706	00 	. 
	nop			;e707	00 	. 
	nop			;e708	00 	. 
	nop			;e709	00 	. 
	nop			;e70a	00 	. 
	nop			;e70b	00 	. 
	nop			;e70c	00 	. 
	nop			;e70d	00 	. 
	nop			;e70e	00 	. 
	nop			;e70f	00 	. 
	nop			;e710	00 	. 
	nop			;e711	00 	. 
	nop			;e712	00 	. 
	nop			;e713	00 	. 
	nop			;e714	00 	. 
	nop			;e715	00 	. 
	nop			;e716	00 	. 
	nop			;e717	00 	. 
	nop			;e718	00 	. 
	nop			;e719	00 	. 
	nop			;e71a	00 	. 
	nop			;e71b	00 	. 
	nop			;e71c	00 	. 
	nop			;e71d	00 	. 
	nop			;e71e	00 	. 
	nop			;e71f	00 	. 
	nop			;e720	00 	. 
	nop			;e721	00 	. 
	nop			;e722	00 	. 
	nop			;e723	00 	. 
	nop			;e724	00 	. 
	nop			;e725	00 	. 
	nop			;e726	00 	. 
	nop			;e727	00 	. 
	nop			;e728	00 	. 
	nop			;e729	00 	. 
	nop			;e72a	00 	. 
	nop			;e72b	00 	. 
	nop			;e72c	00 	. 
	nop			;e72d	00 	. 
	nop			;e72e	00 	. 
	nop			;e72f	00 	. 
	nop			;e730	00 	. 
	nop			;e731	00 	. 
	nop			;e732	00 	. 
	nop			;e733	00 	. 
	nop			;e734	00 	. 
	nop			;e735	00 	. 
	nop			;e736	00 	. 
	nop			;e737	00 	. 
	nop			;e738	00 	. 
	nop			;e739	00 	. 
	nop			;e73a	00 	. 
	nop			;e73b	00 	. 
	nop			;e73c	00 	. 
	nop			;e73d	00 	. 
	nop			;e73e	00 	. 
	nop			;e73f	00 	. 
	nop			;e740	00 	. 
	nop			;e741	00 	. 
	nop			;e742	00 	. 
	nop			;e743	00 	. 
	nop			;e744	00 	. 
	nop			;e745	00 	. 
	nop			;e746	00 	. 
	nop			;e747	00 	. 
	nop			;e748	00 	. 
	nop			;e749	00 	. 
	nop			;e74a	00 	. 
	nop			;e74b	00 	. 
	nop			;e74c	00 	. 
	nop			;e74d	00 	. 
	nop			;e74e	00 	. 
	nop			;e74f	00 	. 
	nop			;e750	00 	. 
	nop			;e751	00 	. 
	nop			;e752	00 	. 
	nop			;e753	00 	. 
	nop			;e754	00 	. 
	nop			;e755	00 	. 
	nop			;e756	00 	. 
	nop			;e757	00 	. 
	nop			;e758	00 	. 
	nop			;e759	00 	. 
	nop			;e75a	00 	. 
	nop			;e75b	00 	. 
	nop			;e75c	00 	. 
	nop			;e75d	00 	. 
	nop			;e75e	00 	. 
	nop			;e75f	00 	. 
	nop			;e760	00 	. 
	nop			;e761	00 	. 
	nop			;e762	00 	. 
	nop			;e763	00 	. 
	nop			;e764	00 	. 
	nop			;e765	00 	. 
	nop			;e766	00 	. 
	nop			;e767	00 	. 
	nop			;e768	00 	. 
	nop			;e769	00 	. 
	nop			;e76a	00 	. 
	nop			;e76b	00 	. 
	nop			;e76c	00 	. 
	nop			;e76d	00 	. 
	nop			;e76e	00 	. 
	nop			;e76f	00 	. 
	nop			;e770	00 	. 
	nop			;e771	00 	. 
	nop			;e772	00 	. 
	nop			;e773	00 	. 
	nop			;e774	00 	. 
	nop			;e775	00 	. 
	nop			;e776	00 	. 
	nop			;e777	00 	. 
	nop			;e778	00 	. 
	nop			;e779	00 	. 
	nop			;e77a	00 	. 
	nop			;e77b	00 	. 
	nop			;e77c	00 	. 
	nop			;e77d	00 	. 
	nop			;e77e	00 	. 
	nop			;e77f	00 	. 
	nop			;e780	00 	. 
	nop			;e781	00 	. 
	nop			;e782	00 	. 
	nop			;e783	00 	. 
	nop			;e784	00 	. 
	nop			;e785	00 	. 
	nop			;e786	00 	. 
	nop			;e787	00 	. 
	nop			;e788	00 	. 
	nop			;e789	00 	. 
	nop			;e78a	00 	. 
	nop			;e78b	00 	. 
	nop			;e78c	00 	. 
	nop			;e78d	00 	. 
	nop			;e78e	00 	. 
	nop			;e78f	00 	. 
	nop			;e790	00 	. 
	nop			;e791	00 	. 
	nop			;e792	00 	. 
	nop			;e793	00 	. 
	nop			;e794	00 	. 
	nop			;e795	00 	. 
	nop			;e796	00 	. 
	nop			;e797	00 	. 
	nop			;e798	00 	. 
	nop			;e799	00 	. 
	nop			;e79a	00 	. 
	nop			;e79b	00 	. 
	nop			;e79c	00 	. 
	nop			;e79d	00 	. 
	nop			;e79e	00 	. 
	nop			;e79f	00 	. 
	nop			;e7a0	00 	. 
	nop			;e7a1	00 	. 
	nop			;e7a2	00 	. 
	nop			;e7a3	00 	. 
	nop			;e7a4	00 	. 
	nop			;e7a5	00 	. 
	nop			;e7a6	00 	. 
	nop			;e7a7	00 	. 
	nop			;e7a8	00 	. 
	nop			;e7a9	00 	. 
	nop			;e7aa	00 	. 
	nop			;e7ab	00 	. 
	nop			;e7ac	00 	. 
	nop			;e7ad	00 	. 
	nop			;e7ae	00 	. 
	nop			;e7af	00 	. 
	nop			;e7b0	00 	. 
	nop			;e7b1	00 	. 
	nop			;e7b2	00 	. 
	nop			;e7b3	00 	. 
	nop			;e7b4	00 	. 
	nop			;e7b5	00 	. 
	nop			;e7b6	00 	. 
	nop			;e7b7	00 	. 
	nop			;e7b8	00 	. 
	nop			;e7b9	00 	. 
	nop			;e7ba	00 	. 
	nop			;e7bb	00 	. 
	nop			;e7bc	00 	. 
	nop			;e7bd	00 	. 
	nop			;e7be	00 	. 
	nop			;e7bf	00 	. 
	nop			;e7c0	00 	. 
	nop			;e7c1	00 	. 
	nop			;e7c2	00 	. 
	nop			;e7c3	00 	. 
	nop			;e7c4	00 	. 
	nop			;e7c5	00 	. 
	nop			;e7c6	00 	. 
	nop			;e7c7	00 	. 
	nop			;e7c8	00 	. 
	nop			;e7c9	00 	. 
	nop			;e7ca	00 	. 
	nop			;e7cb	00 	. 
	nop			;e7cc	00 	. 
	nop			;e7cd	00 	. 
	nop			;e7ce	00 	. 
	nop			;e7cf	00 	. 
	nop			;e7d0	00 	. 
	nop			;e7d1	00 	. 
	nop			;e7d2	00 	. 
	nop			;e7d3	00 	. 
	nop			;e7d4	00 	. 
	nop			;e7d5	00 	. 
	nop			;e7d6	00 	. 
	nop			;e7d7	00 	. 
	nop			;e7d8	00 	. 
	nop			;e7d9	00 	. 
	nop			;e7da	00 	. 
	nop			;e7db	00 	. 
	nop			;e7dc	00 	. 
	nop			;e7dd	00 	. 
	nop			;e7de	00 	. 
	nop			;e7df	00 	. 
	nop			;e7e0	00 	. 
	nop			;e7e1	00 	. 
	nop			;e7e2	00 	. 
	nop			;e7e3	00 	. 
	nop			;e7e4	00 	. 
	nop			;e7e5	00 	. 
	nop			;e7e6	00 	. 
	nop			;e7e7	00 	. 
	nop			;e7e8	00 	. 
	nop			;e7e9	00 	. 
	nop			;e7ea	00 	. 
	nop			;e7eb	00 	. 
	nop			;e7ec	00 	. 
	nop			;e7ed	00 	. 
	nop			;e7ee	00 	. 
	nop			;e7ef	00 	. 
	nop			;e7f0	00 	. 
	nop			;e7f1	00 	. 
	nop			;e7f2	00 	. 
	nop			;e7f3	00 	. 
	nop			;e7f4	00 	. 
	nop			;e7f5	00 	. 
	nop			;e7f6	00 	. 
	nop			;e7f7	00 	. 
	nop			;e7f8	00 	. 
	nop			;e7f9	00 	. 
	nop			;e7fa	00 	. 
	nop			;e7fb	00 	. 
	nop			;e7fc	00 	. 
	nop			;e7fd	00 	. 
	nop			;e7fe	00 	. 
	nop			;e7ff	00 	. 
	nop			;e800	00 	. 
	nop			;e801	00 	. 
	nop			;e802	00 	. 
	nop			;e803	00 	. 
	nop			;e804	00 	. 
	nop			;e805	00 	. 
	nop			;e806	00 	. 
	nop			;e807	00 	. 
	nop			;e808	00 	. 
	nop			;e809	00 	. 
	nop			;e80a	00 	. 
	nop			;e80b	00 	. 
	nop			;e80c	00 	. 
	nop			;e80d	00 	. 
	nop			;e80e	00 	. 
	nop			;e80f	00 	. 
	nop			;e810	00 	. 
	nop			;e811	00 	. 
	nop			;e812	00 	. 
	nop			;e813	00 	. 
	nop			;e814	00 	. 
	nop			;e815	00 	. 
	nop			;e816	00 	. 
	nop			;e817	00 	. 
	nop			;e818	00 	. 
	nop			;e819	00 	. 
	nop			;e81a	00 	. 
	nop			;e81b	00 	. 
	nop			;e81c	00 	. 
	nop			;e81d	00 	. 
	nop			;e81e	00 	. 
	nop			;e81f	00 	. 
	nop			;e820	00 	. 
	nop			;e821	00 	. 
	nop			;e822	00 	. 
	nop			;e823	00 	. 
	nop			;e824	00 	. 
	nop			;e825	00 	. 
	nop			;e826	00 	. 
	nop			;e827	00 	. 
	nop			;e828	00 	. 
	nop			;e829	00 	. 
	nop			;e82a	00 	. 
	nop			;e82b	00 	. 
	nop			;e82c	00 	. 
	nop			;e82d	00 	. 
	nop			;e82e	00 	. 
	nop			;e82f	00 	. 
	nop			;e830	00 	. 
	nop			;e831	00 	. 
	nop			;e832	00 	. 
	nop			;e833	00 	. 
	nop			;e834	00 	. 
	nop			;e835	00 	. 
	nop			;e836	00 	. 
	nop			;e837	00 	. 
	nop			;e838	00 	. 
	nop			;e839	00 	. 
	nop			;e83a	00 	. 
	nop			;e83b	00 	. 
	nop			;e83c	00 	. 
	nop			;e83d	00 	. 
	nop			;e83e	00 	. 
	nop			;e83f	00 	. 
	nop			;e840	00 	. 
	nop			;e841	00 	. 
	nop			;e842	00 	. 
	nop			;e843	00 	. 
	nop			;e844	00 	. 
	nop			;e845	00 	. 
	nop			;e846	00 	. 
	nop			;e847	00 	. 
	nop			;e848	00 	. 
	nop			;e849	00 	. 
	nop			;e84a	00 	. 
	nop			;e84b	00 	. 
	nop			;e84c	00 	. 
	nop			;e84d	00 	. 
	nop			;e84e	00 	. 
	nop			;e84f	00 	. 
	nop			;e850	00 	. 
	nop			;e851	00 	. 
	nop			;e852	00 	. 
	nop			;e853	00 	. 
	nop			;e854	00 	. 
	nop			;e855	00 	. 
	nop			;e856	00 	. 
	nop			;e857	00 	. 
	nop			;e858	00 	. 
	nop			;e859	00 	. 
	nop			;e85a	00 	. 
	nop			;e85b	00 	. 
	nop			;e85c	00 	. 
	nop			;e85d	00 	. 
	nop			;e85e	00 	. 
	nop			;e85f	00 	. 
	nop			;e860	00 	. 
	nop			;e861	00 	. 
	nop			;e862	00 	. 
	nop			;e863	00 	. 
	nop			;e864	00 	. 
	nop			;e865	00 	. 
	nop			;e866	00 	. 
	nop			;e867	00 	. 
	nop			;e868	00 	. 
	nop			;e869	00 	. 
	nop			;e86a	00 	. 
	nop			;e86b	00 	. 
	nop			;e86c	00 	. 
	nop			;e86d	00 	. 
	nop			;e86e	00 	. 
	nop			;e86f	00 	. 
	nop			;e870	00 	. 
	nop			;e871	00 	. 
	nop			;e872	00 	. 
	nop			;e873	00 	. 
	nop			;e874	00 	. 
	nop			;e875	00 	. 
	nop			;e876	00 	. 
	nop			;e877	00 	. 
	nop			;e878	00 	. 
	nop			;e879	00 	. 
	nop			;e87a	00 	. 
	nop			;e87b	00 	. 
	nop			;e87c	00 	. 
	nop			;e87d	00 	. 
	nop			;e87e	00 	. 
	nop			;e87f	00 	. 
	nop			;e880	00 	. 
	nop			;e881	00 	. 
	nop			;e882	00 	. 
	nop			;e883	00 	. 
	nop			;e884	00 	. 
	nop			;e885	00 	. 
	nop			;e886	00 	. 
	nop			;e887	00 	. 
	nop			;e888	00 	. 
	nop			;e889	00 	. 
	nop			;e88a	00 	. 
	nop			;e88b	00 	. 
	nop			;e88c	00 	. 
	nop			;e88d	00 	. 
	nop			;e88e	00 	. 
	nop			;e88f	00 	. 
	nop			;e890	00 	. 
	nop			;e891	00 	. 
	nop			;e892	00 	. 
	nop			;e893	00 	. 
	nop			;e894	00 	. 
	nop			;e895	00 	. 
	nop			;e896	00 	. 
	nop			;e897	00 	. 
	nop			;e898	00 	. 
	nop			;e899	00 	. 
	nop			;e89a	00 	. 
	nop			;e89b	00 	. 
	nop			;e89c	00 	. 
	nop			;e89d	00 	. 
	nop			;e89e	00 	. 
	nop			;e89f	00 	. 
	nop			;e8a0	00 	. 
	nop			;e8a1	00 	. 
	nop			;e8a2	00 	. 
	nop			;e8a3	00 	. 
	nop			;e8a4	00 	. 
	nop			;e8a5	00 	. 
	nop			;e8a6	00 	. 
	nop			;e8a7	00 	. 
	nop			;e8a8	00 	. 
	nop			;e8a9	00 	. 
	nop			;e8aa	00 	. 
	nop			;e8ab	00 	. 
	nop			;e8ac	00 	. 
	nop			;e8ad	00 	. 
	nop			;e8ae	00 	. 
	nop			;e8af	00 	. 
	nop			;e8b0	00 	. 
	nop			;e8b1	00 	. 
	nop			;e8b2	00 	. 
	nop			;e8b3	00 	. 
	nop			;e8b4	00 	. 
	nop			;e8b5	00 	. 
	nop			;e8b6	00 	. 
	nop			;e8b7	00 	. 
	nop			;e8b8	00 	. 
	nop			;e8b9	00 	. 
	nop			;e8ba	00 	. 
	nop			;e8bb	00 	. 
	nop			;e8bc	00 	. 
	nop			;e8bd	00 	. 
	nop			;e8be	00 	. 
	nop			;e8bf	00 	. 
	nop			;e8c0	00 	. 
	nop			;e8c1	00 	. 
	nop			;e8c2	00 	. 
	nop			;e8c3	00 	. 
	nop			;e8c4	00 	. 
	nop			;e8c5	00 	. 
	nop			;e8c6	00 	. 
	nop			;e8c7	00 	. 
	nop			;e8c8	00 	. 
	nop			;e8c9	00 	. 
	nop			;e8ca	00 	. 
	nop			;e8cb	00 	. 
	nop			;e8cc	00 	. 
	nop			;e8cd	00 	. 
	nop			;e8ce	00 	. 
	nop			;e8cf	00 	. 
	nop			;e8d0	00 	. 
	nop			;e8d1	00 	. 
	nop			;e8d2	00 	. 
	nop			;e8d3	00 	. 
	nop			;e8d4	00 	. 
	nop			;e8d5	00 	. 
	nop			;e8d6	00 	. 
	nop			;e8d7	00 	. 
	nop			;e8d8	00 	. 
	nop			;e8d9	00 	. 
	nop			;e8da	00 	. 
	nop			;e8db	00 	. 
	nop			;e8dc	00 	. 
	nop			;e8dd	00 	. 
	nop			;e8de	00 	. 
	nop			;e8df	00 	. 
	nop			;e8e0	00 	. 
	nop			;e8e1	00 	. 
	nop			;e8e2	00 	. 
	nop			;e8e3	00 	. 
	nop			;e8e4	00 	. 
	nop			;e8e5	00 	. 
	nop			;e8e6	00 	. 
	nop			;e8e7	00 	. 
	nop			;e8e8	00 	. 
	nop			;e8e9	00 	. 
	ld bc,00101h		;e8ea	01 01 01 	. . . 
	ld bc,00101h		;e8ed	01 01 01 	. . . 
	ld a,b			;e8f0	78 	x 
	call m,0f2fch		;e8f1	fc fc f2 	. . . 
	jp po,0f2e2h		;e8f4	e2 e2 f2 	. . . 
	call m,07c38h		;e8f7	fc 38 7c 	. 8 | 
	ld a,l			;e8fa	7d 	} 
	ld a,(hl)			;e8fb	7e 	~ 
	ld a,e			;e8fc	7b 	{ 
	ld a,e			;e8fd	7b 	{ 
	ld (hl),a			;e8fe	77 	w 
	ld (hl),a			;e8ff	77 	w 
	call m,0e0dch		;e900	fc dc e0 	. . . 
	cp 0feh		;e903	fe fe 	. . 
	rst 38h			;e905	ff 	. 
	rst 38h			;e906	ff 	. 
	rst 30h			;e907	f7 	. 
	ld (hl),a			;e908	77 	w 
	ld (hl),a			;e909	77 	w 
	ld (hl),a			;e90a	77 	w 
	ld (hl),a			;e90b	77 	w 
	ld (hl),a			;e90c	77 	w 
	ld (hl),a			;e90d	77 	w 
	ld (hl),a			;e90e	77 	w 
	ld a,e			;e90f	7b 	{ 
	rst 30h			;e910	f7 	. 
	ld a,e			;e911	7b 	{ 
	ld a,e			;e912	7b 	{ 
	ld a,l			;e913	7d 	} 
	ld a,l			;e914	7d 	} 
	cp l			;e915	bd 	. 
	cp (hl)			;e916	be 	. 
	rst 18h			;e917	df 	. 
	ld a,e			;e918	7b 	{ 
	ld a,a			;e919	7f 	 
	add hl,sp			;e91a	39 	9 
	dec b			;e91b	05 	. 
	dec c			;e91c	0d 	. 
	dec c			;e91d	0d 	. 
	ld bc,0ef01h		;e91e	01 01 ef 	. . . 
	rla			;e921	17 	. 
	ld sp,hl			;e922	f9 	. 
	cp 0feh		;e923	fe fe 	. . 
	cp (hl)			;e925	be 	. 
	cp 0bch		;e926	fe bc 	. . 
	add a,b			;e928	80 	. 
	ret po			;e929	e0 	. 
	ret p			;e92a	f0 	. 
	ret p			;e92b	f0 	. 
	ld h,b			;e92c	60 	` 
	nop			;e92d	00 	. 
	nop			;e92e	00 	. 
	nop			;e92f	00 	. 
	ld bc,00101h		;e930	01 01 01 	. . . 
	inc bc			;e933	03 	. 
	inc bc			;e934	03 	. 
	ld (bc),a			;e935	02 	. 
	inc bc			;e936	03 	. 
	ld b,07ch		;e937	06 7c 	. | 
	defb 0fdh,07bh,0fbh	;illegal sequence		;e939	fd 7b fb 	. { . 
	ei			;e93c	fb 	. 
	rst 30h			;e93d	f7 	. 
	rst 30h			;e93e	f7 	. 
	rst 30h			;e93f	f7 	. 
	nop			;e940	00 	. 
	nop			;e941	00 	. 
	nop			;e942	00 	. 
	add a,b			;e943	80 	. 
	add a,b			;e944	80 	. 
	add a,b			;e945	80 	. 
	ret nz			;e946	c0 	. 
	ret nz			;e947	c0 	. 
	dec b			;e948	05 	. 
	rlca			;e949	07 	. 
	dec c			;e94a	0d 	. 
	rrca			;e94b	0f 	. 
	rrca			;e94c	0f 	. 
	dec de			;e94d	1b 	. 
	rla			;e94e	17 	. 
	rra			;e94f	1f 	. 
	rst 28h			;e950	ef 	. 
	rst 0			;e951	c7 	. 
	jp 083c3h		;e952	c3 c3 83 	. . . 
	add a,c			;e955	81 	. 
	ld bc,0e001h		;e956	01 01 e0 	. . . 
	ret po			;e959	e0 	. 
	ret po			;e95a	e0 	. 
	ret po			;e95b	e0 	. 
	ret po			;e95c	e0 	. 
	ret po			;e95d	e0 	. 
	ret p			;e95e	f0 	. 
	ret p			;e95f	f0 	. 
	ld e,03eh		;e960	1e 3e 	. > 
	inc a			;e962	3c 	< 
	inc h			;e963	24 	$ 
	ld a,b			;e964	78 	x 
	ld a,a			;e965	7f 	 
	ld a,a			;e966	7f 	 
	rrca			;e967	0f 	. 
	ret p			;e968	f0 	. 
	ret p			;e969	f0 	. 
	ret p			;e96a	f0 	. 
	ret p			;e96b	f0 	. 
	adc a,(hl)			;e96c	8e 	. 
	cp 0feh		;e96d	fe fe 	. . 
	ret p			;e96f	f0 	. 
	jr c,$+126		;e970	38 7c 	8 | 
	ld a,l			;e972	7d 	} 
	ld a,(hl)			;e973	7e 	~ 
	ld a,e			;e974	7b 	{ 
	ld a,e			;e975	7b 	{ 
	halt			;e976	76 	v 
	halt			;e977	76 	v 
	call m,0e0dch		;e978	fc dc e0 	. . . 
	call m,07ebeh		;e97b	fc be 7e 	. . ~ 
	rst 38h			;e97e	ff 	. 
	rst 38h			;e97f	ff 	. 
	halt			;e980	76 	v 
	ld (hl),l			;e981	75 	u 
	ld (hl),l			;e982	75 	u 
	ld (hl),l			;e983	75 	u 
	ld (hl),l			;e984	75 	u 
	ld (hl),l			;e985	75 	u 
	halt			;e986	76 	v 
	ld a,d			;e987	7a 	z 
	rst 38h			;e988	ff 	. 
	rst 38h			;e989	ff 	. 
	rst 30h			;e98a	f7 	. 
	rst 30h			;e98b	f7 	. 
	rst 30h			;e98c	f7 	. 
	xor 0eeh		;e98d	ee ee 	. . 
	xor 07ah		;e98f	ee 7a 	. z 
	ld a,(hl)			;e991	7e 	~ 
	dec sp			;e992	3b 	; 
	inc bc			;e993	03 	. 
	inc bc			;e994	03 	. 
	inc bc			;e995	03 	. 
	inc bc			;e996	03 	. 
	inc bc			;e997	03 	. 
	call pe,074f4h		;e998	ec f4 74 	. . t 
	ld d,h			;e99b	54 	T 
	ld a,b			;e99c	78 	x 
	cp h			;e99d	bc 	. 
	call c,001e0h		;e99e	dc e0 01 	. . . 
	ld bc,00101h		;e9a1	01 01 01 	. . . 
	ld bc,00001h		;e9a4	01 01 00 	. . . 
	nop			;e9a7	00 	. 
	ld a,b			;e9a8	78 	x 
	ret m			;e9a9	f8 	. 
	ld a,b			;e9aa	78 	x 
	call m,0bc7ch		;e9ab	fc 7c bc 	. | . 
	call m,0fcbch		;e9ae	fc bc fc 	. . . 
	cp h			;e9b1	bc 	. 
	ret m			;e9b2	f8 	. 
	cp b			;e9b3	b8 	. 
	ret m			;e9b4	f8 	. 
	cp b			;e9b5	b8 	. 
	ret m			;e9b6	f8 	. 
	cp b			;e9b7	b8 	. 
	and b			;e9b8	a0 	. 
	ld a,b			;e9b9	78 	x 
	ld a,b			;e9ba	78 	x 
	ld a,b			;e9bb	78 	x 
	adc a,b			;e9bc	88 	. 
	cp 0feh		;e9bd	fe fe 	. . 
	cp 038h		;e9bf	fe 38 	. 8 
	ld a,h			;e9c1	7c 	| 
	ld a,l			;e9c2	7d 	} 
	ld a,(hl)			;e9c3	7e 	~ 
	ld a,e			;e9c4	7b 	{ 
	ld a,e			;e9c5	7b 	{ 
	halt			;e9c6	76 	v 
	ld (hl),l			;e9c7	75 	u 
	call m,0e0dch		;e9c8	fc dc e0 	. . . 
	cp 0feh		;e9cb	fe fe 	. . 
	ccf			;e9cd	3f 	? 
	rst 18h			;e9ce	df 	. 
	rst 38h			;e9cf	ff 	. 
	ld (hl),e			;e9d0	73 	s 
	ld (hl),a			;e9d1	77 	w 
	ld (hl),a			;e9d2	77 	w 
	ld l,a			;e9d3	6f 	o 
	ld l,a			;e9d4	6f 	o 
	ld l,a			;e9d5	6f 	o 
	ld l,a			;e9d6	6f 	o 
	ld l,(hl)			;e9d7	6e 	n 
	rst 38h			;e9d8	ff 	. 
	rst 38h			;e9d9	ff 	. 
	rst 38h			;e9da	ff 	. 
	cp a			;e9db	bf 	. 
	ld a,a			;e9dc	7f 	 
	ld a,(hl)			;e9dd	7e 	~ 
	ld a,(hl)			;e9de	7e 	~ 
	cp 000h		;e9df	fe 00 	. . 
	nop			;e9e1	00 	. 
	nop			;e9e2	00 	. 
	nop			;e9e3	00 	. 
	nop			;e9e4	00 	. 
	add a,b			;e9e5	80 	. 
	add a,b			;e9e6	80 	. 
	add a,b			;e9e7	80 	. 
	nop			;e9e8	00 	. 
	nop			;e9e9	00 	. 
	nop			;e9ea	00 	. 
	nop			;e9eb	00 	. 
	nop			;e9ec	00 	. 
	nop			;e9ed	00 	. 
	ld bc,00007h		;e9ee	01 07 00 	. . . 
	nop			;e9f1	00 	. 
	nop			;e9f2	00 	. 
	nop			;e9f3	00 	. 
	rrca			;e9f4	0f 	. 
	ld a,a			;e9f5	7f 	 
	rst 38h			;e9f6	ff 	. 
	rst 38h			;e9f7	ff 	. 
	nop			;e9f8	00 	. 
	nop			;e9f9	00 	. 
	nop			;e9fa	00 	. 
	nop			;e9fb	00 	. 
	ccf			;e9fc	3f 	? 
	rst 38h			;e9fd	ff 	. 
	rst 38h			;e9fe	ff 	. 
	rst 38h			;e9ff	ff 	. 
	nop			;ea00	00 	. 
	nop			;ea01	00 	. 
	ld bc,0ff0fh		;ea02	01 0f ff 	. . . 
	rst 30h			;ea05	f7 	. 
	ei			;ea06	fb 	. 
	ei			;ea07	fb 	. 
	nop			;ea08	00 	. 
	rrca			;ea09	0f 	. 
	rst 38h			;ea0a	ff 	. 
	rst 38h			;ea0b	ff 	. 
	rst 38h			;ea0c	ff 	. 
	rst 38h			;ea0d	ff 	. 
	rst 38h			;ea0e	ff 	. 
	ld iyh,b		;ea0f	fd 60 	. ` 
	ret nz			;ea11	c0 	. 
	ret po			;ea12	e0 	. 
	ret p			;ea13	f0 	. 
	ret nc			;ea14	d0 	. 
	ret p			;ea15	f0 	. 
	ret m			;ea16	f8 	. 
	ret p			;ea17	f0 	. 
	nop			;ea18	00 	. 
	nop			;ea19	00 	. 
	nop			;ea1a	00 	. 
	nop			;ea1b	00 	. 
	nop			;ea1c	00 	. 
	inc bc			;ea1d	03 	. 
	ld a,a			;ea1e	7f 	 
	ld a,(hl)			;ea1f	7e 	~ 
	nop			;ea20	00 	. 
	nop			;ea21	00 	. 
	nop			;ea22	00 	. 
	inc bc			;ea23	03 	. 
	rra			;ea24	1f 	. 
	cp 0f0h		;ea25	fe f0 	. . 
	ld bc,0ffffh		;ea27	01 ff ff 	. . . 
	rst 38h			;ea2a	ff 	. 
	rst 38h			;ea2b	ff 	. 
	rst 38h			;ea2c	ff 	. 
	rst 38h			;ea2d	ff 	. 
	ld a,a			;ea2e	7f 	 
	nop			;ea2f	00 	. 
	rst 38h			;ea30	ff 	. 
	rst 38h			;ea31	ff 	. 
	rst 38h			;ea32	ff 	. 
	rst 38h			;ea33	ff 	. 
	cp 0f8h		;ea34	fe f8 	. . 
	ret po			;ea36	e0 	. 
	nop			;ea37	00 	. 
	ret nc			;ea38	d0 	. 
	ret po			;ea39	e0 	. 
	ret m			;ea3a	f8 	. 
	call m,01cfeh		;ea3b	fc fe 1c 	. . . 
	inc a			;ea3e	3c 	< 
	jr c,$+2		;ea3f	38 00 	8 . 
	nop			;ea41	00 	. 
	nop			;ea42	00 	. 
	nop			;ea43	00 	. 
	nop			;ea44	00 	. 
	ld bc,00303h		;ea45	01 03 03 	. . . 
	rlca			;ea48	07 	. 
	rra			;ea49	1f 	. 
	ld a,0fch		;ea4a	3e fc 	> . 
	ret c			;ea4c	d8 	. 
	or b			;ea4d	b0 	. 
	or b			;ea4e	b0 	. 
	cp b			;ea4f	b8 	. 
	cp 0c0h		;ea50	fe c0 	. . 
	nop			;ea52	00 	. 
	nop			;ea53	00 	. 
	nop			;ea54	00 	. 
	nop			;ea55	00 	. 
	nop			;ea56	00 	. 
	nop			;ea57	00 	. 
	ret p			;ea58	f0 	. 
	ret nz			;ea59	c0 	. 
	nop			;ea5a	00 	. 
	nop			;ea5b	00 	. 
	nop			;ea5c	00 	. 
	nop			;ea5d	00 	. 
	nop			;ea5e	00 	. 
	nop			;ea5f	00 	. 
	nop			;ea60	00 	. 
	nop			;ea61	00 	. 
	nop			;ea62	00 	. 
	ld bc,01e07h		;ea63	01 07 1e 	. . . 
	ld a,l			;ea66	7d 	} 
	pop af			;ea67	f1 	. 
	nop			;ea68	00 	. 
	rlca			;ea69	07 	. 
	ld a,a			;ea6a	7f 	 
	rst 38h			;ea6b	ff 	. 
	rst 38h			;ea6c	ff 	. 
	rst 38h			;ea6d	ff 	. 
	rst 38h			;ea6e	ff 	. 
	rst 38h			;ea6f	ff 	. 
	nop			;ea70	00 	. 
	add a,b			;ea71	80 	. 
	ret po			;ea72	e0 	. 
	ret m			;ea73	f8 	. 
	cp 0ffh		;ea74	fe ff 	. . 
	rst 38h			;ea76	ff 	. 
	ld a,a			;ea77	7f 	 
	nop			;ea78	00 	. 
	nop			;ea79	00 	. 
	nop			;ea7a	00 	. 
	nop			;ea7b	00 	. 
	nop			;ea7c	00 	. 
	nop			;ea7d	00 	. 
	cp 0ffh		;ea7e	fe ff 	. . 
	rst 38h			;ea80	ff 	. 
	rst 38h			;ea81	ff 	. 
	rst 38h			;ea82	ff 	. 
	rst 38h			;ea83	ff 	. 
	rst 38h			;ea84	ff 	. 
	rst 38h			;ea85	ff 	. 
	rst 38h			;ea86	ff 	. 
	rst 38h			;ea87	ff 	. 
	ld l,(hl)			;ea88	6e 	n 
	ld l,a			;ea89	6f 	o 
	add hl,hl			;ea8a	29 	) 
	rrca			;ea8b	0f 	. 
	rrca			;ea8c	0f 	. 
	ld b,001h		;ea8d	06 01 	. . 
	inc bc			;ea8f	03 	. 
	defb 0fdh,005h,07dh	;illegal sequence		;ea90	fd 05 7d 	. . } 
	ld a,l			;ea93	7d 	} 
	ld a,h			;ea94	7c 	| 
	call m,0febeh		;ea95	fc be fe 	. . . 
	ret nz			;ea98	c0 	. 
	ret nz			;ea99	c0 	. 
	ret po			;ea9a	e0 	. 
	ret po			;ea9b	e0 	. 
	ret nz			;ea9c	c0 	. 
	nop			;ea9d	00 	. 
	nop			;ea9e	00 	. 
	nop			;ea9f	00 	. 
	ld bc,00201h		;eaa0	01 01 02 	. . . 
	inc bc			;eaa3	03 	. 
	inc bc			;eaa4	03 	. 
	rlca			;eaa5	07 	. 
	rlca			;eaa6	07 	. 
	rlca			;eaa7	07 	. 
	cp (hl)			;eaa8	be 	. 
	rst 18h			;eaa9	df 	. 
	rst 38h			;eaaa	ff 	. 
	ld e,a			;eaab	5f 	_ 
	xor a			;eaac	af 	. 
	rst 10h			;eaad	d7 	. 
	ex de,hl			;eaae	eb 	. 
	defb 0edh;next byte illegal after ed		;eaaf	ed 	. 
	nop			;eab0	00 	. 
	nop			;eab1	00 	. 
	nop			;eab2	00 	. 
	add a,b			;eab3	80 	. 
	add a,b			;eab4	80 	. 
	ret nz			;eab5	c0 	. 
	ret nz			;eab6	c0 	. 
	ret nz			;eab7	c0 	. 
	rlca			;eab8	07 	. 
	rlca			;eab9	07 	. 
	rrca			;eaba	0f 	. 
	rrca			;eabb	0f 	. 
	rrca			;eabc	0f 	. 
	rra			;eabd	1f 	. 
	rra			;eabe	1f 	. 
	rra			;eabf	1f 	. 
	rst 20h			;eac0	e7 	. 
	rst 0			;eac1	c7 	. 
	jp nz,083c3h		;eac2	c2 c3 83 	. . . 
	add a,c			;eac5	81 	. 
	ld bc,0e001h		;eac6	01 01 e0 	. . . 
	ret po			;eac9	e0 	. 
	ret po			;eaca	e0 	. 
	ld h,b			;eacb	60 	` 
	ret po			;eacc	e0 	. 
	ret p			;eacd	f0 	. 
	or b			;eace	b0 	. 
	ret p			;eacf	f0 	. 
	ld e,03eh		;ead0	1e 3e 	. > 
	inc a			;ead2	3c 	< 
	inc h			;ead3	24 	$ 
	ld a,b			;ead4	78 	x 
	ld a,a			;ead5	7f 	 
	ld a,a			;ead6	7f 	 
	rrca			;ead7	0f 	. 
	or b			;ead8	b0 	. 
	ret p			;ead9	f0 	. 
	or b			;eada	b0 	. 
	ret p			;eadb	f0 	. 
	adc a,(hl)			;eadc	8e 	. 
	cp 0feh		;eadd	fe fe 	. . 
	ret p			;eadf	f0 	. 
	ld e,03fh		;eae0	1e 3f 	. ? 
	ld a,a			;eae2	7f 	 
	ld h,b			;eae3	60 	` 
	ld b,b			;eae4	40 	@ 
	ld b,b			;eae5	40 	@ 
	ld h,d			;eae6	62 	b 
	ld a,a			;eae7	7f 	 
	nop			;eae8	00 	. 
	nop			;eae9	00 	. 
	nop			;eaea	00 	. 
	add a,b			;eaeb	80 	. 
	add a,b			;eaec	80 	. 
	add a,b			;eaed	80 	. 
	add a,b			;eaee	80 	. 
	add a,b			;eaef	80 	. 
	rrca			;eaf0	0f 	. 
	rra			;eaf1	1f 	. 
	ld e,01dh		;eaf2	1e 1d 	. . 
	dec de			;eaf4	1b 	. 
	dec de			;eaf5	1b 	. 
	rla			;eaf6	17 	. 
	rla			;eaf7	17 	. 
	cp a			;eaf8	bf 	. 
	ccf			;eaf9	3f 	? 
	pop hl			;eafa	e1 	. 
	rst 38h			;eafb	ff 	. 
	rst 38h			;eafc	ff 	. 
	rst 38h			;eafd	ff 	. 
	rst 38h			;eafe	ff 	. 
	rst 38h			;eaff	ff 	. 
	and b			;eb00	a0 	. 
	ld (hl),b			;eb01	70 	p 
	jr nc,$-46		;eb02	30 d0 	0 . 
	ret po			;eb04	e0 	. 
	ret p			;eb05	f0 	. 
	ret nc			;eb06	d0 	. 
	ret pe			;eb07	e8 	. 
	rla			;eb08	17 	. 
	rla			;eb09	17 	. 
	rla			;eb0a	17 	. 
	rla			;eb0b	17 	. 
	rla			;eb0c	17 	. 
	rla			;eb0d	17 	. 
	rla			;eb0e	17 	. 
	rla			;eb0f	17 	. 
	rst 38h			;eb10	ff 	. 
	rst 18h			;eb11	df 	. 
	rst 18h			;eb12	df 	. 
	rst 18h			;eb13	df 	. 
	rst 18h			;eb14	df 	. 
	cp a			;eb15	bf 	. 
	cp a			;eb16	bf 	. 
	cp a			;eb17	bf 	. 
	ret pe			;eb18	e8 	. 
	ret pe			;eb19	e8 	. 
	call pe,0dcdch		;eb1a	ec dc dc 	. . . 
	call c,05cdch		;eb1d	dc dc 5c 	. . \ 
	dec de			;eb20	1b 	. 
	dec de			;eb21	1b 	. 
	dec c			;eb22	0d 	. 
	ld bc,00100h		;eb23	01 00 01 	. . . 
	ld bc,0a001h		;eb26	01 01 a0 	. . . 
	rst 18h			;eb29	df 	. 
	rst 18h			;eb2a	df 	. 
	xor a			;eb2b	af 	. 
	ld (hl),a			;eb2c	77 	w 
	ld (hl),a			;eb2d	77 	w 
	adc a,a			;eb2e	8f 	. 
	rst 38h			;eb2f	ff 	. 
	call c,0cedeh		;eb30	dc de ce 	. . . 
	jp pe,0eeeeh		;eb33	ea ee ee 	. . . 
	call pe,001e0h		;eb36	ec e0 01 	. . . 
	ld bc,00203h		;eb39	01 03 02 	. . . 
	inc bc			;eb3c	03 	. 
	ld (bc),a			;eb3d	02 	. 
	inc bc			;eb3e	03 	. 
	ld (bc),a			;eb3f	02 	. 
	ld a,a			;eb40	7f 	 
	ei			;eb41	fb 	. 
	ld a,e			;eb42	7b 	{ 
	ei			;eb43	fb 	. 
	ld (hl),a			;eb44	77 	w 
	rst 30h			;eb45	f7 	. 
	rst 30h			;eb46	f7 	. 
	rst 28h			;eb47	ef 	. 
	ret po			;eb48	e0 	. 
	ret nz			;eb49	c0 	. 
	ret nz			;eb4a	c0 	. 
	ret nz			;eb4b	c0 	. 
	ret nz			;eb4c	c0 	. 
	ret nz			;eb4d	c0 	. 
	ret po			;eb4e	e0 	. 
	ret po			;eb4f	e0 	. 
	inc bc			;eb50	03 	. 
	ld (bc),a			;eb51	02 	. 
	inc bc			;eb52	03 	. 
	ld b,005h		;eb53	06 05 	. . 
	rlca			;eb55	07 	. 
	dec b			;eb56	05 	. 
	rlca			;eb57	07 	. 
	rst 20h			;eb58	e7 	. 
	rst 20h			;eb59	e7 	. 
	rst 0			;eb5a	c7 	. 
	jp 08783h		;eb5b	c3 83 87 	. . . 
	add a,a			;eb5e	87 	. 
	add a,a			;eb5f	87 	. 
	ret po			;eb60	e0 	. 
	ret po			;eb61	e0 	. 
	ret po			;eb62	e0 	. 
	ret po			;eb63	e0 	. 
	ret nz			;eb64	c0 	. 
	ret nz			;eb65	c0 	. 
	ret nz			;eb66	c0 	. 
	ret nz			;eb67	c0 	. 
	dec b			;eb68	05 	. 
	rlca			;eb69	07 	. 
	rrca			;eb6a	0f 	. 
	rrca			;eb6b	0f 	. 
	add hl,bc			;eb6c	09 	. 
	rrca			;eb6d	0f 	. 
	rrca			;eb6e	0f 	. 
	rrca			;eb6f	0f 	. 
	add a,a			;eb70	87 	. 
	add a,e			;eb71	83 	. 
	inc bc			;eb72	03 	. 
	inc bc			;eb73	03 	. 
	ld (bc),a			;eb74	02 	. 
	add a,e			;eb75	83 	. 
	add a,e			;eb76	83 	. 
	add a,e			;eb77	83 	. 
	ret nz			;eb78	c0 	. 
	ret nz			;eb79	c0 	. 
	ret nz			;eb7a	c0 	. 
	ret nz			;eb7b	c0 	. 
	ld b,b			;eb7c	40 	@ 
	ret po			;eb7d	e0 	. 
	ret po			;eb7e	e0 	. 
	ret po			;eb7f	e0 	. 
	nop			;eb80	00 	. 
	nop			;eb81	00 	. 
	nop			;eb82	00 	. 
	nop			;eb83	00 	. 
	nop			;eb84	00 	. 
	nop			;eb85	00 	. 
	inc bc			;eb86	03 	. 
	ld c,003h		;eb87	0e 03 	. . 
	rlca			;eb89	07 	. 
	ld c,018h		;eb8a	0e 18 	. . 
	jr nc,$+2		;eb8c	30 00 	0 . 
	nop			;eb8e	00 	. 
	nop			;eb8f	00 	. 
	jp 00101h		;eb90	c3 01 01 	. . . 
	nop			;eb93	00 	. 
	nop			;eb94	00 	. 
	nop			;eb95	00 	. 
	ld bc,0fe03h		;eb96	01 03 fe 	. . . 
	rst 38h			;eb99	ff 	. 
	rst 38h			;eb9a	ff 	. 
	cp 07dh		;eb9b	fe 7d 	. } 
	ret m			;eb9d	f8 	. 
	ret po			;eb9e	e0 	. 
	ret nz			;eb9f	c0 	. 
	rst 38h			;eba0	ff 	. 
	ld a,a			;eba1	7f 	 
	ld a,a			;eba2	7f 	 
	cp 0fdh		;eba3	fe fd 	. . 
	ld a,l			;eba5	7d 	} 
	rrca			;eba6	0f 	. 
	ld bc,0dfdfh		;eba7	01 df df 	. . . 
	cp a			;ebaa	bf 	. 
	ld a,a			;ebab	7f 	 
	rst 38h			;ebac	ff 	. 
	rst 38h			;ebad	ff 	. 
	rst 38h			;ebae	ff 	. 
	di			;ebaf	f3 	. 
	cp a			;ebb0	bf 	. 
	rst 38h			;ebb1	ff 	. 
	cp 0ffh		;ebb2	fe ff 	. . 
	rst 38h			;ebb4	ff 	. 
	rst 30h			;ebb5	f7 	. 
	ret po			;ebb6	e0 	. 
	ret po			;ebb7	e0 	. 
	nop			;ebb8	00 	. 
	add a,b			;ebb9	80 	. 
	add a,b			;ebba	80 	. 
	ret nz			;ebbb	c0 	. 
	ret nz			;ebbc	c0 	. 
	add a,b			;ebbd	80 	. 
	nop			;ebbe	00 	. 
	nop			;ebbf	00 	. 
	ret m			;ebc0	f8 	. 
	ld a,h			;ebc1	7c 	| 
	inc e			;ebc2	1c 	. 
	ex af,af'			;ebc3	08 	. 
	nop			;ebc4	00 	. 
	nop			;ebc5	00 	. 
	nop			;ebc6	00 	. 
	nop			;ebc7	00 	. 
	ld bc,00101h		;ebc8	01 01 01 	. . . 
	ld bc,00303h		;ebcb	01 03 03 	. . . 
	ld bc,0c100h		;ebce	01 00 c1 	. . . 
	pop bc			;ebd1	c1 	. 
	add a,b			;ebd2	80 	. 
	add a,b			;ebd3	80 	. 
	add a,b			;ebd4	80 	. 
	add a,b			;ebd5	80 	. 
	ret nz			;ebd6	c0 	. 
	ret po			;ebd7	e0 	. 
	ret po			;ebd8	e0 	. 
	ret p			;ebd9	f0 	. 
	call m,01f7eh		;ebda	fc 7e 1f 	. ~ . 
	rlca			;ebdd	07 	. 
	ld bc,00000h		;ebde	01 00 00 	. . . 
	nop			;ebe1	00 	. 
	nop			;ebe2	00 	. 
	nop			;ebe3	00 	. 
	nop			;ebe4	00 	. 
	ret p			;ebe5	f0 	. 
	ret p			;ebe6	f0 	. 
	nop			;ebe7	00 	. 
	nop			;ebe8	00 	. 
	nop			;ebe9	00 	. 
	ld bc,00f07h		;ebea	01 07 0f 	. . . 
	rra			;ebed	1f 	. 
	ccf			;ebee	3f 	? 
	ld a,a			;ebef	7f 	 
	nop			;ebf0	00 	. 
	nop			;ebf1	00 	. 
	ret po			;ebf2	e0 	. 
	ret p			;ebf3	f0 	. 
	ret p			;ebf4	f0 	. 
	adc a,b			;ebf5	88 	. 
	ex af,af'			;ebf6	08 	. 
	adc a,b			;ebf7	88 	. 
	nop			;ebf8	00 	. 
	nop			;ebf9	00 	. 
	ld bc,00703h		;ebfa	01 03 07 	. . . 
	rlca			;ebfd	07 	. 
	rlca			;ebfe	07 	. 
	rlca			;ebff	07 	. 
	nop			;ec00	00 	. 
	nop			;ec01	00 	. 
	nop			;ec02	00 	. 
	nop			;ec03	00 	. 
	ld (hl),b			;ec04	70 	p 
	ret p			;ec05	f0 	. 
	ld a,b			;ec06	78 	x 
	cp b			;ec07	b8 	. 
	nop			;ec08	00 	. 
	nop			;ec09	00 	. 
	nop			;ec0a	00 	. 
	nop			;ec0b	00 	. 
	nop			;ec0c	00 	. 
	nop			;ec0d	00 	. 
	ld b,03fh		;ec0e	06 3f 	. ? 
	nop			;ec10	00 	. 
	nop			;ec11	00 	. 
	add a,b			;ec12	80 	. 
	ret nz			;ec13	c0 	. 
	ret nz			;ec14	c0 	. 
	ret nz			;ec15	c0 	. 
	ret po			;ec16	e0 	. 
	ret po			;ec17	e0 	. 
	ret p			;ec18	f0 	. 
	ret p			;ec19	f0 	. 
	rst 28h			;ec1a	ef 	. 
	rst 18h			;ec1b	df 	. 
	rst 38h			;ec1c	ff 	. 
	rst 38h			;ec1d	ff 	. 
	push hl			;ec1e	e5 	. 
	exx			;ec1f	d9 	. 
	rlca			;ec20	07 	. 
	rlca			;ec21	07 	. 
	rla			;ec22	17 	. 
	inc bc			;ec23	03 	. 
	ld (hl),a			;ec24	77 	w 
	ld (hl),a			;ec25	77 	w 
	rla			;ec26	17 	. 
	ld (hl),a			;ec27	77 	w 
	cp b			;ec28	b8 	. 
	nop			;ec29	00 	. 
	nop			;ec2a	00 	. 
	nop			;ec2b	00 	. 
	nop			;ec2c	00 	. 
	nop			;ec2d	00 	. 
	nop			;ec2e	00 	. 
	nop			;ec2f	00 	. 
	rst 28h			;ec30	ef 	. 
	ld a,(hl)			;ec31	7e 	~ 
	call m,0c0f0h		;ec32	fc f0 c0 	. . . 
	nop			;ec35	00 	. 
	nop			;ec36	00 	. 
	nop			;ec37	00 	. 
	ld bc,07a0fh		;ec38	01 0f 7a 	. . z 
	rst 10h			;ec3b	d7 	. 
	cp a			;ec3c	bf 	. 
	rst 38h			;ec3d	ff 	. 
	call m,0e0f0h		;ec3e	fc f0 e0 	. . . 
	ret po			;ec41	e0 	. 
	ret po			;ec42	e0 	. 
	rst 0			;ec43	c7 	. 
	ld a,0f5h		;ec44	3e f5 	> . 
	cp a			;ec46	bf 	. 
	ld a,a			;ec47	7f 	 
	defb 0ddh,0eeh,0f7h	;illegal sequence		;ec48	dd ee f7 	. . . 
	ld sp,hl			;ec4b	f9 	. 
	cp 0ffh		;ec4c	fe ff 	. . 
	ld a,a			;ec4e	7f 	 
	cp a			;ec4f	bf 	. 
	ld (hl),a			;ec50	77 	w 
	ld (hl),a			;ec51	77 	w 
	ld a,e			;ec52	7b 	{ 
	ld a,e			;ec53	7b 	{ 
	ld a,l			;ec54	7d 	} 
	ld a,(00031h)		;ec55	3a 31 00 	: 1 . 
	ret nz			;ec58	c0 	. 
	nop			;ec59	00 	. 
	nop			;ec5a	00 	. 
	nop			;ec5b	00 	. 
	nop			;ec5c	00 	. 
	nop			;ec5d	00 	. 
	nop			;ec5e	00 	. 
	nop			;ec5f	00 	. 
	rst 38h			;ec60	ff 	. 
	rst 38h			;ec61	ff 	. 
	call m,0f8f8h		;ec62	fc f8 f8 	. . . 
	ret p			;ec65	f0 	. 
	ret p			;ec66	f0 	. 
	ret p			;ec67	f0 	. 
	sbc a,065h		;ec68	de 65 	. e 
	ld (hl),a			;ec6a	77 	w 
	rlca			;ec6b	07 	. 
	rlca			;ec6c	07 	. 
	rlca			;ec6d	07 	. 
	rlca			;ec6e	07 	. 
	inc bc			;ec6f	03 	. 
	ret p			;ec70	f0 	. 
	ret p			;ec71	f0 	. 
	ret m			;ec72	f8 	. 
	ret m			;ec73	f8 	. 
	ret m			;ec74	f8 	. 
	ret m			;ec75	f8 	. 
	ret m			;ec76	f8 	. 
	ret p			;ec77	f0 	. 
	inc bc			;ec78	03 	. 
	inc bc			;ec79	03 	. 
	inc bc			;ec7a	03 	. 
	inc bc			;ec7b	03 	. 
	inc bc			;ec7c	03 	. 
	inc bc			;ec7d	03 	. 
	inc bc			;ec7e	03 	. 
	ld bc,0f0f0h		;ec7f	01 f0 f0 	. . . 
	ret p			;ec82	f0 	. 
	ret p			;ec83	f0 	. 
	ret p			;ec84	f0 	. 
	ret p			;ec85	f0 	. 
	ret p			;ec86	f0 	. 
	ret p			;ec87	f0 	. 
	ld bc,00101h		;ec88	01 01 01 	. . . 
	ld bc,00000h		;ec8b	01 00 00 	. . . 
	nop			;ec8e	00 	. 
	nop			;ec8f	00 	. 
	ret po			;ec90	e0 	. 
	ret po			;ec91	e0 	. 
	ret p			;ec92	f0 	. 
	sub b			;ec93	90 	. 
	ret p			;ec94	f0 	. 
	ret p			;ec95	f0 	. 
	ret p			;ec96	f0 	. 
	add a,b			;ec97	80 	. 
	nop			;ec98	00 	. 
	nop			;ec99	00 	. 
	nop			;ec9a	00 	. 
	nop			;ec9b	00 	. 
	nop			;ec9c	00 	. 
	inc bc			;ec9d	03 	. 
	rlca			;ec9e	07 	. 
	rlca			;ec9f	07 	. 
	nop			;eca0	00 	. 
	rrca			;eca1	0f 	. 
	rra			;eca2	1f 	. 
	ccf			;eca3	3f 	? 
	inc a			;eca4	3c 	< 
	jr c,$+62		;eca5	38 3c 	8 < 
	ccf			;eca7	3f 	? 
	nop			;eca8	00 	. 
	nop			;eca9	00 	. 
	add a,b			;ecaa	80 	. 
	add a,b			;ecab	80 	. 
	ld b,b			;ecac	40 	@ 
	ld b,b			;ecad	40 	@ 
	ld b,b			;ecae	40 	@ 
	add a,b			;ecaf	80 	. 
	nop			;ecb0	00 	. 
	ld bc,00001h		;ecb1	01 01 00 	. . . 
	ld bc,00101h		;ecb4	01 01 01 	. . . 
	ld bc,0df1fh		;ecb7	01 1f df 	. . . 
	ccf			;ecba	3f 	? 
	rst 38h			;ecbb	ff 	. 
	rst 38h			;ecbc	ff 	. 
	rst 38h			;ecbd	ff 	. 
	di			;ecbe	f3 	. 
	defb 0edh;next byte illegal after ed		;ecbf	ed 	. 
	adc a,(hl)			;ecc0	8e 	. 
	xor (hl)			;ecc1	ae 	. 
	ld l,0c6h		;ecc2	2e c6 	. . 
	rst 28h			;ecc4	ef 	. 
	rst 28h			;ecc5	ef 	. 
	rst 28h			;ecc6	ef 	. 
	rst 28h			;ecc7	ef 	. 
	ld bc,00101h		;ecc8	01 01 01 	. . . 
	ld bc,00101h		;eccb	01 01 01 	. . . 
	nop			;ecce	00 	. 
	nop			;eccf	00 	. 
	defb 0edh;next byte illegal after ed		;ecd0	ed 	. 
	sbc a,e			;ecd1	9b 	. 
	ei			;ecd2	fb 	. 
	rst 30h			;ecd3	f7 	. 
	rst 30h			;ecd4	f7 	. 
	rst 28h			;ecd5	ef 	. 
	rst 28h			;ecd6	ef 	. 
	sbc a,0efh		;ecd7	de ef 	. . 
	rst 28h			;ecd9	ef 	. 
	or 0f9h		;ecda	f6 f9 	. . 
	ei			;ecdc	fb 	. 
	rst 30h			;ecdd	f7 	. 
	cpl			;ecde	2f 	/ 
	rst 38h			;ecdf	ff 	. 
	nop			;ece0	00 	. 
	nop			;ece1	00 	. 
	ret po			;ece2	e0 	. 
	ret p			;ece3	f0 	. 
	ret p			;ece4	f0 	. 
	ret m			;ece5	f8 	. 
	ret m			;ece6	f8 	. 
	ret m			;ece7	f8 	. 
	dec l			;ece8	2d 	- 
	scf			;ece9	37 	7 
	ld a,(00203h)		;ecea	3a 03 02 	: . . 
	inc bc			;eced	03 	. 
	inc bc			;ecee	03 	. 
	ld bc,0ffffh		;ecef	01 ff ff 	. . . 
	defb 0fdh,0fdh,0fdh	;illegal sequence		;ecf2	fd fd fd 	. . . 
	ld a,h			;ecf5	7c 	| 
	call m,0f87ch		;ecf6	fc 7c f8 	. | . 
	ret m			;ecf9	f8 	. 
	ret m			;ecfa	f8 	. 
	ret p			;ecfb	f0 	. 
	ret p			;ecfc	f0 	. 
	ret p			;ecfd	f0 	. 
	sub b			;ecfe	90 	. 
	ret p			;ecff	f0 	. 
	ld bc,00101h		;ed00	01 01 01 	. . . 
	ld bc,00101h		;ed03	01 01 01 	. . . 
	ld bc,0fc00h		;ed06	01 00 fc 	. . . 
	ld a,h			;ed09	7c 	| 
	call m,0f878h		;ed0a	fc 78 f8 	. x . 
	ld a,b			;ed0d	78 	x 
	cp b			;ed0e	b8 	. 
	ret m			;ed0f	f8 	. 
	ret p			;ed10	f0 	. 
	ret po			;ed11	e0 	. 
	ret po			;ed12	e0 	. 
	ret p			;ed13	f0 	. 
	ret p			;ed14	f0 	. 
	ret p			;ed15	f0 	. 
	ret p			;ed16	f0 	. 
	ld h,b			;ed17	60 	` 
	cp b			;ed18	b8 	. 
	ret m			;ed19	f8 	. 
	cp b			;ed1a	b8 	. 
	ret m			;ed1b	f8 	. 
	ld a,b			;ed1c	78 	x 
	ld a,b			;ed1d	78 	x 
	ld a,b			;ed1e	78 	x 
	ld a,b			;ed1f	78 	x 
	ld (hl),b			;ed20	70 	p 
	ld (hl),b			;ed21	70 	p 
	ld (hl),b			;ed22	70 	p 
	ld (hl),b			;ed23	70 	p 
	ld c,b			;ed24	48 	H 
	ret m			;ed25	f8 	. 
	ret m			;ed26	f8 	. 
	ret m			;ed27	f8 	. 
	nop			;ed28	00 	. 
	ld a,(hl)			;ed29	7e 	~ 
	rst 38h			;ed2a	ff 	. 
	rst 38h			;ed2b	ff 	. 
	rst 38h			;ed2c	ff 	. 
	rst 38h			;ed2d	ff 	. 
	rst 38h			;ed2e	ff 	. 
	rst 38h			;ed2f	ff 	. 
	nop			;ed30	00 	. 
	nop			;ed31	00 	. 
	add a,b			;ed32	80 	. 
	ret p			;ed33	f0 	. 
	call m,0ffffh		;ed34	fc ff ff 	. . . 
	rst 38h			;ed37	ff 	. 
	nop			;ed38	00 	. 
	nop			;ed39	00 	. 
	nop			;ed3a	00 	. 
	nop			;ed3b	00 	. 
	nop			;ed3c	00 	. 
	rst 0			;ed3d	c7 	. 
	rst 38h			;ed3e	ff 	. 
	rst 38h			;ed3f	ff 	. 
	nop			;ed40	00 	. 
	nop			;ed41	00 	. 
	nop			;ed42	00 	. 
	nop			;ed43	00 	. 
	nop			;ed44	00 	. 
	rra			;ed45	1f 	. 
	ld a,a			;ed46	7f 	 
	rst 38h			;ed47	ff 	. 
	nop			;ed48	00 	. 
	nop			;ed49	00 	. 
	nop			;ed4a	00 	. 
	nop			;ed4b	00 	. 
	nop			;ed4c	00 	. 
	add a,b			;ed4d	80 	. 
	ret p			;ed4e	f0 	. 
	cp 01fh		;ed4f	fe 1f 	. . 
	ld hl,07878h		;ed51	21 78 78 	! x x 
	ld a,l			;ed54	7d 	} 
	ld a,a			;ed55	7f 	 
	ld a,a			;ed56	7f 	 
	inc a			;ed57	3c 	< 
	ld a,a			;ed58	7f 	 
	cp a			;ed59	bf 	. 
	cp e			;ed5a	bb 	. 
	or l			;ed5b	b5 	. 
	xor (hl)			;ed5c	ae 	. 
	sbc a,(hl)			;ed5d	9e 	. 
	ld e,a			;ed5e	5f 	_ 
	xor 0ffh		;ed5f	ee ff 	. . 
	cp 0feh		;ed61	fe fe 	. . 
	add a,e			;ed63	83 	. 
	ld a,l			;ed64	7d 	} 
	cp 07eh		;ed65	fe 7e 	. ~ 
	defb 0fdh,0fch,00fh	;illegal sequence		;ed67	fd fc 0f 	. . . 
	or b			;ed6a	b0 	. 
	ld a,a			;ed6b	7f 	 
	ld a,a			;ed6c	7f 	 
	xor d			;ed6d	aa 	. 
	cp a			;ed6e	bf 	. 
	ret p			;ed6f	f0 	. 
	nop			;ed70	00 	. 
	ret po			;ed71	e0 	. 
	inc a			;ed72	3c 	< 
	rst 8			;ed73	cf 	. 
	ret p			;ed74	f0 	. 
	xor a			;ed75	af 	. 
	ld d,l			;ed76	55 	U 
	rst 38h			;ed77	ff 	. 
	nop			;ed78	00 	. 
	ld c,008h		;ed79	0e 08 	. . 
	or 02eh		;ed7b	f6 2e 	. . 
	xor 06eh		;ed7d	ee 6e 	. n 
	cp 000h		;ed7f	fe 00 	. . 
	nop			;ed81	00 	. 
	nop			;ed82	00 	. 
	nop			;ed83	00 	. 
	nop			;ed84	00 	. 
	ld e,03eh		;ed85	1e 3e 	. > 
	dec a			;ed87	3d 	= 
	inc a			;ed88	3c 	< 
	ld a,(hl)			;ed89	7e 	~ 
	ld a,b			;ed8a	78 	x 
	ld a,b			;ed8b	78 	x 
	ld a,(hl)			;ed8c	7e 	~ 
	ld a,(hl)			;ed8d	7e 	~ 
	ld a,(hl)			;ed8e	7e 	~ 
	ret m			;ed8f	f8 	. 
	dec a			;ed90	3d 	= 
	dec a			;ed91	3d 	= 
	dec sp			;ed92	3b 	; 
	dec sp			;ed93	3b 	; 
	ld a,e			;ed94	7b 	{ 
	ld a,e			;ed95	7b 	{ 
	ld a,e			;ed96	7b 	{ 
	ld a,e			;ed97	7b 	{ 
	rst 38h			;ed98	ff 	. 
	rst 38h			;ed99	ff 	. 
	rst 38h			;ed9a	ff 	. 
	ld a,a			;ed9b	7f 	 
	sbc a,a			;ed9c	9f 	. 
	ret po			;ed9d	e0 	. 
	rst 38h			;ed9e	ff 	. 
	rst 38h			;ed9f	ff 	. 
	add a,a			;eda0	87 	. 
	rst 38h			;eda1	ff 	. 
	rst 38h			;eda2	ff 	. 
	rst 38h			;eda3	ff 	. 
	rst 28h			;eda4	ef 	. 
	nop			;eda5	00 	. 
	rra			;eda6	1f 	. 
	ld h,b			;eda7	60 	` 
	add a,0ffh		;eda8	c6 ff 	. . 
	rst 30h			;edaa	f7 	. 
	rst 38h			;edab	ff 	. 
	adc a,000h		;edac	ce 00 	. . 
	nop			;edae	00 	. 
	nop			;edaf	00 	. 
	ld a,e			;edb0	7b 	{ 
	ld a,e			;edb1	7b 	{ 
	ld a,d			;edb2	7a 	z 
	ld (hl),a			;edb3	77 	w 
	ld (hl),a			;edb4	77 	w 
	rst 0			;edb5	c7 	. 
	scf			;edb6	37 	7 
	rlca			;edb7	07 	. 
	cp 0fdh		;edb8	fe fd 	. . 
	call m,0c078h		;edba	fc 78 c0 	. x . 
	ld a,a			;edbd	7f 	 
	xor d			;edbe	aa 	. 
	push de			;edbf	d5 	. 
	ret p			;edc0	f0 	. 
	ret p			;edc1	f0 	. 
	ret po			;edc2	e0 	. 
	nop			;edc3	00 	. 
	nop			;edc4	00 	. 
	ret po			;edc5	e0 	. 
	ret p			;edc6	f0 	. 
	ld (hl),b			;edc7	70 	p 
	rlca			;edc8	07 	. 
	rlca			;edc9	07 	. 
	inc bc			;edca	03 	. 
	nop			;edcb	00 	. 
	inc bc			;edcc	03 	. 
	inc bc			;edcd	03 	. 
	inc bc			;edce	03 	. 
	inc bc			;edcf	03 	. 
	rst 38h			;edd0	ff 	. 
	rst 38h			;edd1	ff 	. 
	rst 38h			;edd2	ff 	. 
	ld bc,0f3f1h		;edd3	01 f1 f3 	. . . 
	jp p,0b0e3h		;edd6	f2 e3 b0 	. . . 
	ld (hl),b			;edd9	70 	p 
	or b			;edda	b0 	. 
	ld (hl),b			;eddb	70 	p 
	and b			;eddc	a0 	. 
	ld h,b			;eddd	60 	` 
	ret po			;edde	e0 	. 
	ld b,b			;eddf	40 	@ 
	nop			;ede0	00 	. 
	rlca			;ede1	07 	. 
	rrca			;ede2	0f 	. 
	rrca			;ede3	0f 	. 
	rra			;ede4	1f 	. 
	inc e			;ede5	1c 	. 
	inc e			;ede6	1c 	. 
	jr $+5		;ede7	18 03 	. . 
	add a,e			;ede9	83 	. 
	rst 38h			;edea	ff 	. 
	ld a,a			;edeb	7f 	 
	rst 38h			;edec	ff 	. 
	rst 38h			;eded	ff 	. 
	rra			;edee	1f 	. 
	inc bc			;edef	03 	. 
	push hl			;edf0	e5 	. 
	and 0e7h		;edf1	e6 e7 	. . 
	rst 20h			;edf3	e7 	. 
	rst 8			;edf4	cf 	. 
	rst 8			;edf5	cf 	. 
	rst 8			;edf6	cf 	. 
	adc a,a			;edf7	8f 	. 
	ret nz			;edf8	c0 	. 
	add a,b			;edf9	80 	. 
	add a,b			;edfa	80 	. 
	nop			;edfb	00 	. 
	ret nz			;edfc	c0 	. 
	ret po			;edfd	e0 	. 
	ret po			;edfe	e0 	. 
	ret po			;edff	e0 	. 
	ld bc,0ff37h		;ee00	01 37 ff 	. 7 . 
	ld a,l			;ee03	7d 	} 
	rrca			;ee04	0f 	. 
	nop			;ee05	00 	. 
	nop			;ee06	00 	. 
	nop			;ee07	00 	. 
	ld l,h			;ee08	6c 	l 
	ei			;ee09	fb 	. 
	rst 28h			;ee0a	ef 	. 
	cp l			;ee0b	bd 	. 
	rst 28h			;ee0c	ef 	. 
	ld (00000h),a		;ee0d	32 00 00 	2 . . 
	ret nz			;ee10	c0 	. 
	cp h			;ee11	bc 	. 
	xor 070h		;ee12	ee 70 	. p 
	and b			;ee14	a0 	. 
	ld (hl),b			;ee15	70 	p 
	nop			;ee16	00 	. 
	nop			;ee17	00 	. 
	nop			;ee18	00 	. 
	nop			;ee19	00 	. 
	jr nz,$+66		;ee1a	20 40 	  @ 
	ret p			;ee1c	f0 	. 
	call m,0f4fch		;ee1d	fc fc f4 	. . . 
	nop			;ee20	00 	. 
	nop			;ee21	00 	. 
	nop			;ee22	00 	. 
	nop			;ee23	00 	. 
	ld a,a			;ee24	7f 	 
	ld a,a			;ee25	7f 	 
	nop			;ee26	00 	. 
	nop			;ee27	00 	. 
	nop			;ee28	00 	. 
	inc bc			;ee29	03 	. 
	rrca			;ee2a	0f 	. 
	ld a,a			;ee2b	7f 	 
	ret m			;ee2c	f8 	. 
	add a,b			;ee2d	80 	. 
	nop			;ee2e	00 	. 
	nop			;ee2f	00 	. 
	rst 38h			;ee30	ff 	. 
	rst 38h			;ee31	ff 	. 
	cp a			;ee32	bf 	. 
	rra			;ee33	1f 	. 
	rrca			;ee34	0f 	. 
	inc bc			;ee35	03 	. 
	nop			;ee36	00 	. 
	nop			;ee37	00 	. 
	rst 38h			;ee38	ff 	. 
	rst 38h			;ee39	ff 	. 
	rst 30h			;ee3a	f7 	. 
	ei			;ee3b	fb 	. 
	defb 0fdh,0fch,0fch	;illegal sequence		;ee3c	fd fc fc 	. . . 
	call m,0ffffh		;ee3f	fc ff ff 	. . . 
	rst 38h			;ee42	ff 	. 
	rst 38h			;ee43	ff 	. 
	rst 38h			;ee44	ff 	. 
	rst 38h			;ee45	ff 	. 
	ret m			;ee46	f8 	. 
	ld a,b			;ee47	78 	x 
	rst 38h			;ee48	ff 	. 
	rst 38h			;ee49	ff 	. 
	rst 38h			;ee4a	ff 	. 
	call m,0c0f0h		;ee4b	fc f0 c0 	. . . 
	nop			;ee4e	00 	. 
	nop			;ee4f	00 	. 
	cp 0feh		;ee50	fe fe 	. . 
	ld a,h			;ee52	7c 	| 
	nop			;ee53	00 	. 
	nop			;ee54	00 	. 
	nop			;ee55	00 	. 
	nop			;ee56	00 	. 
	nop			;ee57	00 	. 
	ret m			;ee58	f8 	. 
	ld (hl),b			;ee59	70 	p 
	ld (hl),b			;ee5a	70 	p 
	ret p			;ee5b	f0 	. 
	ret p			;ee5c	f0 	. 
	call m,00f3fh		;ee5d	fc 3f 0f 	. ? . 
	ld (hl),b			;ee60	70 	p 
	ld (hl),b			;ee61	70 	p 
	ld (hl),b			;ee62	70 	p 
	ld h,b			;ee63	60 	` 
	ld h,b			;ee64	60 	` 
	ld h,b			;ee65	60 	` 
	or b			;ee66	b0 	. 
	ret p			;ee67	f0 	. 
	rra			;ee68	1f 	. 
	ccf			;ee69	3f 	? 
	rst 38h			;ee6a	ff 	. 
	rst 38h			;ee6b	ff 	. 
	cp a			;ee6c	bf 	. 
	ld a,a			;ee6d	7f 	 
	rst 38h			;ee6e	ff 	. 
	rst 38h			;ee6f	ff 	. 
	rst 38h			;ee70	ff 	. 
	rst 38h			;ee71	ff 	. 
	rst 38h			;ee72	ff 	. 
	rst 38h			;ee73	ff 	. 
	rst 38h			;ee74	ff 	. 
	rst 38h			;ee75	ff 	. 
	ret nc			;ee76	d0 	. 
	add a,b			;ee77	80 	. 
	nop			;ee78	00 	. 
	nop			;ee79	00 	. 
	nop			;ee7a	00 	. 
	inc bc			;ee7b	03 	. 
	inc bc			;ee7c	03 	. 
	dec b			;ee7d	05 	. 
	dec c			;ee7e	0d 	. 
	dec e			;ee7f	1d 	. 
	rlca			;ee80	07 	. 
	ccf			;ee81	3f 	? 
	rst 38h			;ee82	ff 	. 
	rst 38h			;ee83	ff 	. 
	rst 38h			;ee84	ff 	. 
	rst 38h			;ee85	ff 	. 
	rst 38h			;ee86	ff 	. 
	rst 28h			;ee87	ef 	. 
	add a,b			;ee88	80 	. 
	ret po			;ee89	e0 	. 
	ret p			;ee8a	f0 	. 
	call m,0fbfeh		;ee8b	fc fe fb 	. . . 
	cp ixl		;ee8e	dd bd 	. . 
	nop			;ee90	00 	. 
	nop			;ee91	00 	. 
	nop			;ee92	00 	. 
	nop			;ee93	00 	. 
	ld (bc),a			;ee94	02 	. 
	add a,h			;ee95	84 	. 
	call m,019feh		;ee96	fc fe 19 	. . . 
	jr nc,$+50		;ee99	30 30 	0 0 
	ld h,b			;ee9b	60 	` 
	ld h,b			;ee9c	60 	` 
	ret nz			;ee9d	c0 	. 
	pop bc			;ee9e	c1 	. 
	ld bc,0f7efh		;ee9f	01 ef f7 	. . . 
	rst 30h			;eea2	f7 	. 
	ei			;eea3	fb 	. 
	ld a,h			;eea4	7c 	| 
	halt			;eea5	76 	v 
	halt			;eea6	76 	v 
	ld l,h			;eea7	6c 	l 
	ld a,(hl)			;eea8	7e 	~ 
	ld a,l			;eea9	7d 	} 
	ld a,l			;eeaa	7d 	} 
	ld a,l			;eeab	7d 	} 
	cp (hl)			;eeac	be 	. 
	ccf			;eead	3f 	? 
	ccf			;eeae	3f 	? 
	ld a,0d6h		;eeaf	3e d6 	> . 
	cp 0feh		;eeb1	fe fe 	. . 
	or h			;eeb3	b4 	. 
	ld a,b			;eeb4	78 	x 
	add a,b			;eeb5	80 	. 
	ret po			;eeb6	e0 	. 
	ld h,b			;eeb7	60 	` 
	ret nc			;eeb8	d0 	. 
	ret nz			;eeb9	c0 	. 
	ret nc			;eeba	d0 	. 
	ret pe			;eebb	e8 	. 
	call pe,07870h		;eebc	ec 70 78 	. p x 
	ld a,b			;eebf	78 	x 
	add hl,sp			;eec0	39 	9 
	add hl,sp			;eec1	39 	9 
	dec sp			;eec2	3b 	; 
	dec de			;eec3	1b 	. 
	dec e			;eec4	1d 	. 
	inc l			;eec5	2c 	, 
	inc l			;eec6	2c 	, 
	inc e			;eec7	1c 	. 
	ret po			;eec8	e0 	. 
	ret nz			;eec9	c0 	. 
	add a,b			;eeca	80 	. 
	add a,b			;eecb	80 	. 
	nop			;eecc	00 	. 
	nop			;eecd	00 	. 
	nop			;eece	00 	. 
	nop			;eecf	00 	. 
	nop			;eed0	00 	. 
	nop			;eed1	00 	. 
	nop			;eed2	00 	. 
	nop			;eed3	00 	. 
	nop			;eed4	00 	. 
	nop			;eed5	00 	. 
	nop			;eed6	00 	. 
	ret p			;eed7	f0 	. 
	nop			;eed8	00 	. 
	nop			;eed9	00 	. 
	nop			;eeda	00 	. 
	nop			;eedb	00 	. 
	nop			;eedc	00 	. 
	rrca			;eedd	0f 	. 
	ld a,a			;eede	7f 	 
	ld a,b			;eedf	78 	x 
	nop			;eee0	00 	. 
	nop			;eee1	00 	. 
	ld bc,00703h		;eee2	01 03 07 	. . . 
	adc a,a			;eee5	8f 	. 
	rst 30h			;eee6	f7 	. 
	ei			;eee7	fb 	. 
	ld a,a			;eee8	7f 	 
	call m,0ffffh		;eee9	fc ff ff 	. . . 
	rst 38h			;eeec	ff 	. 
	rst 38h			;eeed	ff 	. 
	ei			;eeee	fb 	. 
	call m,0ff0fh		;eeef	fc 0f ff 	. . . 
	rst 38h			;eef2	ff 	. 
	rst 38h			;eef3	ff 	. 
	rst 38h			;eef4	ff 	. 
	rst 38h			;eef5	ff 	. 
	rst 38h			;eef6	ff 	. 
	rst 38h			;eef7	ff 	. 
	call m,0fefeh		;eef8	fc fe fe 	. . . 
	rst 38h			;eefb	ff 	. 
	rst 38h			;eefc	ff 	. 
	rst 38h			;eefd	ff 	. 
	rst 38h			;eefe	ff 	. 
	defb 0fdh,000h,000h	;illegal sequence		;eeff	fd 00 00 	. . . 
	ex af,af'			;ef02	08 	. 
	call m,0fffeh		;ef03	fc fe ff 	. . . 
	rst 38h			;ef06	ff 	. 
	rst 38h			;ef07	ff 	. 
	nop			;ef08	00 	. 
	nop			;ef09	00 	. 
	nop			;ef0a	00 	. 
	nop			;ef0b	00 	. 
	nop			;ef0c	00 	. 
	nop			;ef0d	00 	. 
	nop			;ef0e	00 	. 
	nop			;ef0f	00 	. 
	nop			;ef10	00 	. 
	ld (hl),049h		;ef11	36 49 	6 I 
	ld b,c			;ef13	41 	A 
	ld b,c			;ef14	41 	A 
	ld (00814h),hl		;ef15	22 14 08 	" . . 
	ld a,(bc)			;ef18	0a 	. 
	ld a,(bc)			;ef19	0a 	. 
	nop			;ef1a	00 	. 
	nop			;ef1b	00 	. 
	nop			;ef1c	00 	. 
	nop			;ef1d	00 	. 
	nop			;ef1e	00 	. 
	nop			;ef1f	00 	. 
	ld d,b			;ef20	50 	P 
	ld d,b			;ef21	50 	P 
	nop			;ef22	00 	. 
	nop			;ef23	00 	. 
	nop			;ef24	00 	. 
	nop			;ef25	00 	. 
	nop			;ef26	00 	. 
	nop			;ef27	00 	. 
	nop			;ef28	00 	. 
	ex af,af'			;ef29	08 	. 
	ld a,028h		;ef2a	3e 28 	> ( 
	ld a,00ah		;ef2c	3e 0a 	> . 
	ld a,008h		;ef2e	3e 08 	> . 
	rst 38h			;ef30	ff 	. 
	rst 38h			;ef31	ff 	. 
	sbc a,0ffh		;ef32	de ff 	. . 
	defb 0edh;next byte illegal after ed		;ef34	ed 	. 
	cp a			;ef35	bf 	. 
	rst 38h			;ef36	ff 	. 
	nop			;ef37	00 	. 
	rst 38h			;ef38	ff 	. 
	cp (hl)			;ef39	be 	. 
	ei			;ef3a	fb 	. 
	rst 38h			;ef3b	ff 	. 
	sbc a,0ffh		;ef3c	de ff 	. . 
	rst 38h			;ef3e	ff 	. 
	nop			;ef3f	00 	. 
	nop			;ef40	00 	. 
	nop			;ef41	00 	. 
	ex af,af'			;ef42	08 	. 
	nop			;ef43	00 	. 
	nop			;ef44	00 	. 
	ex af,af'			;ef45	08 	. 
	nop			;ef46	00 	. 
	nop			;ef47	00 	. 
	ld l,a			;ef48	6f 	o 
	ld l,a			;ef49	6f 	o 
	ld l,a			;ef4a	6f 	o 
	ld l,a			;ef4b	6f 	o 
	nop			;ef4c	00 	. 
	nop			;ef4d	00 	. 
	nop			;ef4e	00 	. 
	nop			;ef4f	00 	. 
	nop			;ef50	00 	. 
	nop			;ef51	00 	. 
	nop			;ef52	00 	. 
	nop			;ef53	00 	. 
	ex af,af'			;ef54	08 	. 
	add hl,de			;ef55	19 	. 
	add hl,de			;ef56	19 	. 
	ld bc,00000h		;ef57	01 00 00 	. . . 
	nop			;ef5a	00 	. 
	ex af,af'			;ef5b	08 	. 
	rla			;ef5c	17 	. 
	rla			;ef5d	17 	. 
	ld bc,00000h		;ef5e	01 00 00 	. . . 
	nop			;ef61	00 	. 
	ex af,af'			;ef62	08 	. 
	rla			;ef63	17 	. 
	rla			;ef64	17 	. 
	ld bc,00000h		;ef65	01 00 00 	. . . 
	nop			;ef68	00 	. 
	ex af,af'			;ef69	08 	. 
	rla			;ef6a	17 	. 
	rla			;ef6b	17 	. 
	ld bc,00000h		;ef6c	01 00 00 	. . . 
	nop			;ef6f	00 	. 
	ex af,af'			;ef70	08 	. 
	rla			;ef71	17 	. 
	rla			;ef72	17 	. 
	ld bc,00000h		;ef73	01 00 00 	. . . 
	ld bc,0f501h		;ef76	01 01 f5 	. . . 
	ld a,(0fb04h)		;ef79	3a 04 fb 	: . . 
	inc a			;ef7c	3c 	< 
	ld (0fb04h),a		;ef7d	32 04 fb 	2 . . 
	pop af			;ef80	f1 	. 
	ei			;ef81	fb 	. 
	ret			;ef82	c9 	. 
	nop			;ef83	00 	. 
	nop			;ef84	00 	. 
	nop			;ef85	00 	. 
	nop			;ef86	00 	. 
	nop			;ef87	00 	. 
	nop			;ef88	00 	. 
	ld a,(hl)			;ef89	7e 	~ 
	ld b,d			;ef8a	42 	B 
	ld b,d			;ef8b	42 	B 
	ld b,(hl)			;ef8c	46 	F 
	ld b,(hl)			;ef8d	46 	F 
	ld a,(hl)			;ef8e	7e 	~ 
	nop			;ef8f	00 	. 
	nop			;ef90	00 	. 
	ex af,af'			;ef91	08 	. 
	ex af,af'			;ef92	08 	. 
	ex af,af'			;ef93	08 	. 
	jr $+26		;ef94	18 18 	. . 
	jr $+2		;ef96	18 00 	. . 
	nop			;ef98	00 	. 
	ld a,(hl)			;ef99	7e 	~ 
	ld (bc),a			;ef9a	02 	. 
	ld (bc),a			;ef9b	02 	. 
	ld a,(hl)			;ef9c	7e 	~ 
	ld h,b			;ef9d	60 	` 
	ld a,(hl)			;ef9e	7e 	~ 
	nop			;ef9f	00 	. 
	nop			;efa0	00 	. 
	ld a,(hl)			;efa1	7e 	~ 
	ld (bc),a			;efa2	02 	. 
	ld e,006h		;efa3	1e 06 	. . 
	ld b,07eh		;efa5	06 7e 	. ~ 
	nop			;efa7	00 	. 
	nop			;efa8	00 	. 
	ld b,d			;efa9	42 	B 
	ld b,d			;efaa	42 	B 
	ld a,(hl)			;efab	7e 	~ 
	ld b,006h		;efac	06 06 	. . 
	ld b,000h		;efae	06 00 	. . 
	nop			;efb0	00 	. 
	ld a,(hl)			;efb1	7e 	~ 
	ld b,b			;efb2	40 	@ 
	ld a,(hl)			;efb3	7e 	~ 
	ld b,006h		;efb4	06 06 	. . 
	ld a,(hl)			;efb6	7e 	~ 
	nop			;efb7	00 	. 
	nop			;efb8	00 	. 
	ld a,(hl)			;efb9	7e 	~ 
	ld b,b			;efba	40 	@ 
	ld a,(hl)			;efbb	7e 	~ 
	ld b,(hl)			;efbc	46 	F 
	ld b,(hl)			;efbd	46 	F 
	ld a,(hl)			;efbe	7e 	~ 
	nop			;efbf	00 	. 
	nop			;efc0	00 	. 
	ld a,(hl)			;efc1	7e 	~ 
	ld (bc),a			;efc2	02 	. 
	ld (bc),a			;efc3	02 	. 
	ld b,006h		;efc4	06 06 	. . 
	ld b,000h		;efc6	06 00 	. . 
	nop			;efc8	00 	. 
	ld a,(hl)			;efc9	7e 	~ 
	ld b,d			;efca	42 	B 
	ld a,(hl)			;efcb	7e 	~ 
	ld b,(hl)			;efcc	46 	F 
	ld b,(hl)			;efcd	46 	F 
	ld a,(hl)			;efce	7e 	~ 
	nop			;efcf	00 	. 
	nop			;efd0	00 	. 
	ld a,(hl)			;efd1	7e 	~ 
	ld b,d			;efd2	42 	B 
	ld a,(hl)			;efd3	7e 	~ 
	ld b,006h		;efd4	06 06 	. . 
	ld b,000h		;efd6	06 00 	. . 
	nop			;efd8	00 	. 
	nop			;efd9	00 	. 
	djnz $+2		;efda	10 00 	. . 
	nop			;efdc	00 	. 
	djnz $+2		;efdd	10 00 	. . 
	nop			;efdf	00 	. 
	jr z,$-55		;efe0	28 c7 	( . 
	jr z,$-55		;efe2	28 c7 	( . 
	dec h			;efe4	25 	% 
	rst 0			;efe5	c7 	. 
	dec h			;efe6	25 	% 
	rst 0			;efe7	c7 	. 
	ld d,c			;efe8	51 	Q 
	rst 0			;efe9	c7 	. 
	jr z,$-55		;efea	28 c7 	( . 
	jr z,$-55		;efec	28 c7 	( . 
	ld e,0c7h		;efee	1e c7 	. . 
	dec h			;eff0	25 	% 
	rst 0			;eff1	c7 	. 
	ld c,d			;eff2	4a 	J 
	rst 0			;eff3	c7 	. 
	ld d,c			;eff4	51 	Q 
	rst 0			;eff5	c7 	. 
	dec h			;eff6	25 	% 
	rst 0			;eff7	c7 	. 
	ld d,(hl)			;eff8	56 	V 
	rst 0			;eff9	c7 	. 
	ld c,d			;effa	4a 	J 
	ld bc,00a0ah		;effb	01 0a 0a 	. . . 
	nop			;effe	00 	. 
	nop			;efff	00 	. 
	ld l,a			;f000	6f 	o 
	or e			;f001	b3 	. 
	call z,01eb3h		;f002	cc b3 1e 	. . . 
	or h			;f005	b4 	. 
	ld l,a			;f006	6f 	o 
	or h			;f007	b4 	. 
	nop			;f008	00 	. 
	nop			;f009	00 	. 
	nop			;f00a	00 	. 
	nop			;f00b	00 	. 
	nop			;f00c	00 	. 
	nop			;f00d	00 	. 
	nop			;f00e	00 	. 
	nop			;f00f	00 	. 
	nop			;f010	00 	. 
	ld a,(hl)			;f011	7e 	~ 
	ld b,d			;f012	42 	B 
	ld b,d			;f013	42 	B 
	ld a,(hl)			;f014	7e 	~ 
	ld b,(hl)			;f015	46 	F 
	ld b,(hl)			;f016	46 	F 
	nop			;f017	00 	. 
	nop			;f018	00 	. 
	ld a,h			;f019	7c 	| 
	ld b,d			;f01a	42 	B 
	ld a,h			;f01b	7c 	| 
	ld b,(hl)			;f01c	46 	F 
	ld b,(hl)			;f01d	46 	F 
	ld a,h			;f01e	7c 	| 
	nop			;f01f	00 	. 
	nop			;f020	00 	. 
	ld a,(hl)			;f021	7e 	~ 
	ld b,b			;f022	40 	@ 
	ld b,b			;f023	40 	@ 
	ld h,b			;f024	60 	` 
	ld h,b			;f025	60 	` 
	ld a,(hl)			;f026	7e 	~ 
	nop			;f027	00 	. 
	nop			;f028	00 	. 
	ld a,h			;f029	7c 	| 
	ld b,d			;f02a	42 	B 
	ld b,d			;f02b	42 	B 
	ld b,(hl)			;f02c	46 	F 
	ld b,(hl)			;f02d	46 	F 
	ld a,h			;f02e	7c 	| 
	nop			;f02f	00 	. 
	nop			;f030	00 	. 
	ld a,(hl)			;f031	7e 	~ 
	ld b,b			;f032	40 	@ 
	ld a,(hl)			;f033	7e 	~ 
	ld h,b			;f034	60 	` 
	ld h,b			;f035	60 	` 
	ld a,(hl)			;f036	7e 	~ 
	nop			;f037	00 	. 
	nop			;f038	00 	. 
	ld a,(hl)			;f039	7e 	~ 
	ld b,b			;f03a	40 	@ 
	ld a,(hl)			;f03b	7e 	~ 
	ld h,b			;f03c	60 	` 
	ld h,b			;f03d	60 	` 
	ld h,b			;f03e	60 	` 
	nop			;f03f	00 	. 
	nop			;f040	00 	. 
	ld a,(hl)			;f041	7e 	~ 
	ld b,d			;f042	42 	B 
	ld b,b			;f043	40 	@ 
	ld c,(hl)			;f044	4e 	N 
	ld b,(hl)			;f045	46 	F 
	ld a,(hl)			;f046	7e 	~ 
	nop			;f047	00 	. 
	nop			;f048	00 	. 
	ld b,d			;f049	42 	B 
	ld b,d			;f04a	42 	B 
	ld a,(hl)			;f04b	7e 	~ 
	ld b,(hl)			;f04c	46 	F 
	ld b,(hl)			;f04d	46 	F 
	ld b,(hl)			;f04e	46 	F 
	nop			;f04f	00 	. 
	nop			;f050	00 	. 
	ex af,af'			;f051	08 	. 
	ex af,af'			;f052	08 	. 
	ex af,af'			;f053	08 	. 
	jr $+26		;f054	18 18 	. . 
	jr $+2		;f056	18 00 	. . 
	nop			;f058	00 	. 
	ld (bc),a			;f059	02 	. 
	ld (bc),a			;f05a	02 	. 
	ld (bc),a			;f05b	02 	. 
	ld b,(hl)			;f05c	46 	F 
	ld b,(hl)			;f05d	46 	F 
	ld a,(hl)			;f05e	7e 	~ 
	nop			;f05f	00 	. 
	nop			;f060	00 	. 
	ld b,d			;f061	42 	B 
	ld b,d			;f062	42 	B 
	ld a,(hl)			;f063	7e 	~ 
	ld c,h			;f064	4c 	L 
	ld c,h			;f065	4c 	L 
	ld c,h			;f066	4c 	L 
	nop			;f067	00 	. 
	nop			;f068	00 	. 
	ld b,b			;f069	40 	@ 
	ld b,b			;f06a	40 	@ 
	ld b,b			;f06b	40 	@ 
	ld b,b			;f06c	40 	@ 
	ld b,b			;f06d	40 	@ 
	ld a,(hl)			;f06e	7e 	~ 
	nop			;f06f	00 	. 
	nop			;f070	00 	. 
	ld a,(hl)			;f071	7e 	~ 
	ld d,d			;f072	52 	R 
	ld d,d			;f073	52 	R 
	ld d,(hl)			;f074	56 	V 
	ld d,(hl)			;f075	56 	V 
	ld d,(hl)			;f076	56 	V 
	nop			;f077	00 	. 
	nop			;f078	00 	. 
	ld (hl),d			;f079	72 	r 
	ld d,d			;f07a	52 	R 
	ld d,d			;f07b	52 	R 
	ld d,(hl)			;f07c	56 	V 
	ld d,(hl)			;f07d	56 	V 
	ld e,(hl)			;f07e	5e 	^ 
	nop			;f07f	00 	. 
	nop			;f080	00 	. 
	ld a,(hl)			;f081	7e 	~ 
	ld b,d			;f082	42 	B 
	ld b,d			;f083	42 	B 
	ld b,(hl)			;f084	46 	F 
	ld b,(hl)			;f085	46 	F 
	ld a,(hl)			;f086	7e 	~ 
	nop			;f087	00 	. 
	nop			;f088	00 	. 
	ld a,(hl)			;f089	7e 	~ 
	ld b,d			;f08a	42 	B 
	ld b,d			;f08b	42 	B 
	ld a,(hl)			;f08c	7e 	~ 
	ld h,b			;f08d	60 	` 
	ld h,b			;f08e	60 	` 
	nop			;f08f	00 	. 
	nop			;f090	00 	. 
	ld a,(hl)			;f091	7e 	~ 
	ld b,d			;f092	42 	B 
	ld b,d			;f093	42 	B 
	ld c,(hl)			;f094	4e 	N 
	ld c,(hl)			;f095	4e 	N 
	ld a,a			;f096	7f 	 
	rlca			;f097	07 	. 
	nop			;f098	00 	. 
	ld a,(hl)			;f099	7e 	~ 
	ld b,d			;f09a	42 	B 
	ld b,d			;f09b	42 	B 
	ld a,(hl)			;f09c	7e 	~ 
	ld c,h			;f09d	4c 	L 
	ld c,h			;f09e	4c 	L 
	nop			;f09f	00 	. 
	nop			;f0a0	00 	. 
	ld a,(hl)			;f0a1	7e 	~ 
	ld b,b			;f0a2	40 	@ 
	ld a,(hl)			;f0a3	7e 	~ 
	ld b,006h		;f0a4	06 06 	. . 
	ld a,(hl)			;f0a6	7e 	~ 
	nop			;f0a7	00 	. 
	nop			;f0a8	00 	. 
	ld a,(hl)			;f0a9	7e 	~ 
	ex af,af'			;f0aa	08 	. 
	ex af,af'			;f0ab	08 	. 
	jr $+26		;f0ac	18 18 	. . 
	jr $+2		;f0ae	18 00 	. . 
	nop			;f0b0	00 	. 
	ld b,d			;f0b1	42 	B 
	ld b,d			;f0b2	42 	B 
	ld b,d			;f0b3	42 	B 
	ld b,(hl)			;f0b4	46 	F 
	ld b,(hl)			;f0b5	46 	F 
	ld a,(hl)			;f0b6	7e 	~ 
	nop			;f0b7	00 	. 
	nop			;f0b8	00 	. 
	ld b,d			;f0b9	42 	B 
	ld b,d			;f0ba	42 	B 
	ld b,d			;f0bb	42 	B 
	inc l			;f0bc	2c 	, 
	inc l			;f0bd	2c 	, 
	jr $+2		;f0be	18 00 	. . 
	nop			;f0c0	00 	. 
	ld d,d			;f0c1	52 	R 
	ld d,d			;f0c2	52 	R 
	ld d,d			;f0c3	52 	R 
	ld d,(hl)			;f0c4	56 	V 
	ld d,(hl)			;f0c5	56 	V 
	ld a,(hl)			;f0c6	7e 	~ 
	nop			;f0c7	00 	. 
	nop			;f0c8	00 	. 
	ld b,d			;f0c9	42 	B 
	inc h			;f0ca	24 	$ 
	jr $+26		;f0cb	18 18 	. . 
	inc l			;f0cd	2c 	, 
	ld b,(hl)			;f0ce	46 	F 
	nop			;f0cf	00 	. 
	nop			;f0d0	00 	. 
	ld b,d			;f0d1	42 	B 
	ld b,d			;f0d2	42 	B 
	ld a,(hl)			;f0d3	7e 	~ 
	jr $+26		;f0d4	18 18 	. . 
	jr $+2		;f0d6	18 00 	. . 
	nop			;f0d8	00 	. 
	ld a,(hl)			;f0d9	7e 	~ 
	ld (bc),a			;f0da	02 	. 
	ld a,(hl)			;f0db	7e 	~ 
	ld h,b			;f0dc	60 	` 
	ld h,b			;f0dd	60 	` 
	ld a,(hl)			;f0de	7e 	~ 
	nop			;f0df	00 	. 
	push hl			;f0e0	e5 	. 
	sbc a,c			;f0e1	99 	. 
	ld c,09ah		;f0e2	0e 9a 	. . 
	scf			;f0e4	37 	7 
	sbc a,d			;f0e5	9a 	. 
	ld c,09ah		;f0e6	0e 9a 	. . 
	nop			;f0e8	00 	. 
	nop			;f0e9	00 	. 
	ld bc,00101h		;f0ea	01 01 01 	. . . 
	ld bc,02201h		;f0ed	01 01 22 	. . " 
	nop			;f0f0	00 	. 
	ret po			;f0f1	e0 	. 
	ret p			;f0f2	f0 	. 
	ret p			;f0f3	f0 	. 
	jr nc,$-14		;f0f4	30 f0 	0 . 
	ret m			;f0f6	f8 	. 
	sub (hl)			;f0f7	96 	. 
	ld (hl),c			;f0f8	71 	q 
	ld (hl),c			;f0f9	71 	q 
	ld h,e			;f0fa	63 	c 
	ld (hl),a			;f0fb	77 	w 
	scf			;f0fc	37 	7 
	ccf			;f0fd	3f 	? 
	ccf			;f0fe	3f 	? 
	ccf			;f0ff	3f 	? 
	ld a,b			;f100	78 	x 
	rst 38h			;f101	ff 	. 
	sbc a,a			;f102	9f 	. 
	ld l,a			;f103	6f 	o 
	ld (hl),a			;f104	77 	w 
	or a			;f105	b7 	. 
	call c,000efh		;f106	dc ef 00 	. . . 
	nop			;f109	00 	. 
	nop			;f10a	00 	. 
	add a,b			;f10b	80 	. 
	add a,b			;f10c	80 	. 
	ret nz			;f10d	c0 	. 
	ret nz			;f10e	c0 	. 
	ret nz			;f10f	c0 	. 
	dec a			;f110	3d 	= 
	add hl,sp			;f111	39 	9 
	ld de,00101h		;f112	11 01 01 	. . . 
	inc bc			;f115	03 	. 
	inc bc			;f116	03 	. 
	ld b,037h		;f117	06 37 	. 7 
	ld sp,hl			;f119	f9 	. 
	inc b			;f11a	04 	. 
	ld a,h			;f11b	7c 	| 
	call m,0f2feh		;f11c	fc fe f2 	. . . 
	xor 0c0h		;f11f	ee c0 	. . 
	ret nz			;f121	c0 	. 
	nop			;f122	00 	. 
	nop			;f123	00 	. 
	nop			;f124	00 	. 
	nop			;f125	00 	. 
	nop			;f126	00 	. 
	nop			;f127	00 	. 
	rlca			;f128	07 	. 
	rlca			;f129	07 	. 
	rrca			;f12a	0f 	. 
	rrca			;f12b	0f 	. 
	rrca			;f12c	0f 	. 
	rrca			;f12d	0f 	. 
	rra			;f12e	1f 	. 
	rra			;f12f	1f 	. 
	ld e,a			;f130	5f 	_ 
	sbc a,a			;f131	9f 	. 
	rst 38h			;f132	ff 	. 
	rst 18h			;f133	df 	. 
	sbc a,a			;f134	9f 	. 
	adc a,a			;f135	8f 	. 
	rrca			;f136	0f 	. 
	rlca			;f137	07 	. 
	ld e,01ch		;f138	1e 1c 	. . 
	inc a			;f13a	3c 	< 
	inc a			;f13b	3c 	< 
	inc a			;f13c	3c 	< 
	inc l			;f13d	2c 	, 
	inc (hl)			;f13e	34 	4 
	ld a,b			;f13f	78 	x 
	rlca			;f140	07 	. 
	inc bc			;f141	03 	. 
	inc bc			;f142	03 	. 
	inc bc			;f143	03 	. 
	inc bc			;f144	03 	. 
	inc bc			;f145	03 	. 
	ld (bc),a			;f146	02 	. 
	ld bc,08080h		;f147	01 80 80 	. . . 
	add a,b			;f14a	80 	. 
	add a,b			;f14b	80 	. 
	add a,b			;f14c	80 	. 
	ret nz			;f14d	c0 	. 
	ld b,b			;f14e	40 	@ 
	ret nz			;f14f	c0 	. 
	nop			;f150	00 	. 
	nop			;f151	00 	. 
	nop			;f152	00 	. 
	nop			;f153	00 	. 
	nop			;f154	00 	. 
	ld bc,00701h		;f155	01 01 07 	. . . 
	ld a,b			;f158	78 	x 
	ld (hl),b			;f159	70 	p 
	ld h,b			;f15a	60 	` 
	ld h,b			;f15b	60 	` 
	ret po			;f15c	e0 	. 
	ret po			;f15d	e0 	. 
	ret nz			;f15e	c0 	. 
	ret nz			;f15f	c0 	. 
	ld bc,00000h		;f160	01 00 00 	. . . 
	nop			;f163	00 	. 
	nop			;f164	00 	. 
	nop			;f165	00 	. 
	ld bc,0c001h		;f166	01 01 c0 	. . . 
	ret nz			;f169	c0 	. 
	ret nz			;f16a	c0 	. 
	ret nz			;f16b	c0 	. 
	ret nz			;f16c	c0 	. 
	ret po			;f16d	e0 	. 
	ret po			;f16e	e0 	. 
	ret po			;f16f	e0 	. 
	nop			;f170	00 	. 
	inc e			;f171	1c 	. 
	ld e,03eh		;f172	1e 3e 	. > 
	ld h,03eh		;f174	26 3e 	& > 
	ld a,01eh		;f176	3e 1e 	> . 
	nop			;f178	00 	. 
	nop			;f179	00 	. 
	nop			;f17a	00 	. 
	nop			;f17b	00 	. 
	nop			;f17c	00 	. 
	nop			;f17d	00 	. 
	nop			;f17e	00 	. 
	ret po			;f17f	e0 	. 
	nop			;f180	00 	. 
	inc bc			;f181	03 	. 
	rlca			;f182	07 	. 
	inc bc			;f183	03 	. 
	nop			;f184	00 	. 
	nop			;f185	00 	. 
	nop			;f186	00 	. 
	nop			;f187	00 	. 
	nop			;f188	00 	. 
	sbc a,(hl)			;f189	9e 	. 
	rst 38h			;f18a	ff 	. 
	rst 38h			;f18b	ff 	. 
	rrca			;f18c	0f 	. 
	nop			;f18d	00 	. 
	nop			;f18e	00 	. 
	nop			;f18f	00 	. 
	nop			;f190	00 	. 
	ccf			;f191	3f 	? 
	rst 38h			;f192	ff 	. 
	rst 38h			;f193	ff 	. 
	rst 20h			;f194	e7 	. 
	ld bc,00001h		;f195	01 01 00 	. . . 
	and 0ffh		;f198	e6 ff 	. . 
	rst 38h			;f19a	ff 	. 
	ld (hl),a			;f19b	77 	w 
	ld (hl),a			;f19c	77 	w 
	sbc a,c			;f19d	99 	. 
	rst 38h			;f19e	ff 	. 
	rst 38h			;f19f	ff 	. 
	ret p			;f1a0	f0 	. 
	ld (hl),b			;f1a1	70 	p 
	ld h,b			;f1a2	60 	` 
	ret po			;f1a3	e0 	. 
	ld (hl),b			;f1a4	70 	p 
	ld (hl),b			;f1a5	70 	p 
	ld (hl),b			;f1a6	70 	p 
	ld (hl),b			;f1a7	70 	p 
	nop			;f1a8	00 	. 
	ld bc,00101h		;f1a9	01 01 01 	. . . 
	ld bc,00303h		;f1ac	01 03 03 	. . . 
	ld b,0ffh		;f1af	06 ff 	. . 
	rst 38h			;f1b1	ff 	. 
	ld (bc),a			;f1b2	02 	. 
	jp p,0fefeh		;f1b3	f2 fe fe 	. . . 
	di			;f1b6	f3 	. 
	rst 28h			;f1b7	ef 	. 
	ret p			;f1b8	f0 	. 
	ret po			;f1b9	e0 	. 
	ret po			;f1ba	e0 	. 
	ret nz			;f1bb	c0 	. 
	nop			;f1bc	00 	. 
	nop			;f1bd	00 	. 
	nop			;f1be	00 	. 
	nop			;f1bf	00 	. 
	nop			;f1c0	00 	. 
	nop			;f1c1	00 	. 
	nop			;f1c2	00 	. 
	nop			;f1c3	00 	. 
	jr c,$+126		;f1c4	38 7c 	8 | 
	ld a,h			;f1c6	7c 	| 
	ld c,h			;f1c7	4c 	L 
	nop			;f1c8	00 	. 
	nop			;f1c9	00 	. 
	nop			;f1ca	00 	. 
	nop			;f1cb	00 	. 
	nop			;f1cc	00 	. 
	ld bc,00001h		;f1cd	01 01 00 	. . . 
	ld a,l			;f1d0	7d 	} 
	ld a,03fh		;f1d1	3e 3f 	> ? 
	ld c,01dh		;f1d3	0e 1d 	. . 
	cp l			;f1d5	bd 	. 
	cp e			;f1d6	bb 	. 
	dec sp			;f1d7	3b 	; 
	ret p			;f1d8	f0 	. 
	ld c,h			;f1d9	4c 	L 
	ld (0ca92h),hl		;f1da	22 92 ca 	" . . 
	ret z			;f1dd	c8 	. 
	ret nz			;f1de	c0 	. 
	ret nz			;f1df	c0 	. 
	inc bc			;f1e0	03 	. 
	inc bc			;f1e1	03 	. 
	ld bc,00000h		;f1e2	01 00 00 	. . . 
	nop			;f1e5	00 	. 
	nop			;f1e6	00 	. 
	nop			;f1e7	00 	. 
	rrca			;f1e8	0f 	. 
	rst 38h			;f1e9	ff 	. 
	rst 38h			;f1ea	ff 	. 
	ld a,005h		;f1eb	3e 05 	> . 
	rrca			;f1ed	0f 	. 
	rrca			;f1ee	0f 	. 
	ex af,af'			;f1ef	08 	. 
	add a,b			;f1f0	80 	. 
	add a,b			;f1f1	80 	. 
	ld b,b			;f1f2	40 	@ 
	ret nz			;f1f3	c0 	. 
	add a,b			;f1f4	80 	. 
	add a,b			;f1f5	80 	. 
	ret nz			;f1f6	c0 	. 
	ret nz			;f1f7	c0 	. 
	rrca			;f1f8	0f 	. 
	rrca			;f1f9	0f 	. 
	rrca			;f1fa	0f 	. 
	rra			;f1fb	1f 	. 
	ccf			;f1fc	3f 	? 
	ld a,a			;f1fd	7f 	 
	ld a,a			;f1fe	7f 	 
	rst 38h			;f1ff	ff 	. 
	ret nz			;f200	c0 	. 
	ret nz			;f201	c0 	. 
	ret nz			;f202	c0 	. 
	ret nz			;f203	c0 	. 
	ret nz			;f204	c0 	. 
	add a,b			;f205	80 	. 
	add a,b			;f206	80 	. 
	add a,b			;f207	80 	. 
	rst 30h			;f208	f7 	. 
	rst 38h			;f209	ff 	. 
	ld a,a			;f20a	7f 	 
	ccf			;f20b	3f 	? 
	rrca			;f20c	0f 	. 
	rlca			;f20d	07 	. 
	rlca			;f20e	07 	. 
	rrca			;f20f	0f 	. 
	add a,b			;f210	80 	. 
	nop			;f211	00 	. 
	nop			;f212	00 	. 
	nop			;f213	00 	. 
	ret nz			;f214	c0 	. 
	ld (hl),b			;f215	70 	p 
	ret m			;f216	f8 	. 
	inc a			;f217	3c 	< 
	add hl,bc			;f218	09 	. 
	ld c,00eh		;f219	0e 0e 	. . 
	ld c,00ch		;f21b	0e 0c 	. . 
	inc e			;f21d	1c 	. 
	inc a			;f21e	3c 	< 
	ld a,h			;f21f	7c 	| 
	inc c			;f220	0c 	. 
	inc c			;f221	0c 	. 
	inc b			;f222	04 	. 
	nop			;f223	00 	. 
	nop			;f224	00 	. 
	nop			;f225	00 	. 
	nop			;f226	00 	. 
	nop			;f227	00 	. 
	nop			;f228	00 	. 
	nop			;f229	00 	. 
	nop			;f22a	00 	. 
	nop			;f22b	00 	. 
	nop			;f22c	00 	. 
	nop			;f22d	00 	. 
	ld bc,00f03h		;f22e	01 03 0f 	. . . 
	rrca			;f231	0f 	. 
	rrca			;f232	0f 	. 
	rra			;f233	1f 	. 
	ld a,a			;f234	7f 	 
	rst 38h			;f235	ff 	. 
	rst 38h			;f236	ff 	. 
	rst 38h			;f237	ff 	. 
	ret po			;f238	e0 	. 
	ret po			;f239	e0 	. 
	ret nz			;f23a	c0 	. 
	ret nz			;f23b	c0 	. 
	ret nz			;f23c	c0 	. 
	ret nz			;f23d	c0 	. 
	ret nz			;f23e	c0 	. 
	add a,b			;f23f	80 	. 
	inc bc			;f240	03 	. 
	inc bc			;f241	03 	. 
	inc bc			;f242	03 	. 
	ld bc,00000h		;f243	01 00 00 	. . . 
	nop			;f246	00 	. 
	nop			;f247	00 	. 
	rst 28h			;f248	ef 	. 
	rst 0			;f249	c7 	. 
	rst 0			;f24a	c7 	. 
	rst 20h			;f24b	e7 	. 
	out (053h),a		;f24c	d3 53 	. S 
	add hl,sp			;f24e	39 	9 
	inc e			;f24f	1c 	. 
	add a,b			;f250	80 	. 
	add a,b			;f251	80 	. 
	add a,b			;f252	80 	. 
	add a,b			;f253	80 	. 
	ret nz			;f254	c0 	. 
	ret nz			;f255	c0 	. 
	ret nz			;f256	c0 	. 
	and b			;f257	a0 	. 
	ld c,006h		;f258	0e 06 	. . 
	ld b,002h		;f25a	06 02 	. . 
	ld (bc),a			;f25c	02 	. 
	nop			;f25d	00 	. 
	nop			;f25e	00 	. 
	nop			;f25f	00 	. 
	ld h,b			;f260	60 	` 
	ld (hl),b			;f261	70 	p 
	jr nc,$+50		;f262	30 30 	0 0 
	jr $+26		;f264	18 18 	. . 
	inc a			;f266	3c 	< 
	ld a,b			;f267	78 	x 
	nop			;f268	00 	. 
	nop			;f269	00 	. 
	nop			;f26a	00 	. 
	nop			;f26b	00 	. 
	nop			;f26c	00 	. 
	ld bc,00703h		;f26d	01 03 07 	. . . 
	rra			;f270	1f 	. 
	rra			;f271	1f 	. 
	ccf			;f272	3f 	? 
	ld a,a			;f273	7f 	 
	rst 38h			;f274	ff 	. 
	rst 38h			;f275	ff 	. 
	rst 38h			;f276	ff 	. 
	rst 38h			;f277	ff 	. 
	ret po			;f278	e0 	. 
	ret po			;f279	e0 	. 
	ret po			;f27a	e0 	. 
	ret po			;f27b	e0 	. 
	ret nz			;f27c	c0 	. 
	ret nz			;f27d	c0 	. 
	ret nz			;f27e	c0 	. 
	ret nz			;f27f	c0 	. 
	rlca			;f280	07 	. 
	rlca			;f281	07 	. 
	rlca			;f282	07 	. 
	inc bc			;f283	03 	. 
	ld bc,00000h		;f284	01 00 00 	. . . 
	nop			;f287	00 	. 
	rst 20h			;f288	e7 	. 
	jp 0c1c3h		;f289	c3 c3 c1 	. . . 
	ld hl,0e0e0h		;f28c	21 e0 e0 	! . . 
	ret p			;f28f	f0 	. 
	ret nz			;f290	c0 	. 
	ret po			;f291	e0 	. 
	ret po			;f292	e0 	. 
	ret p			;f293	f0 	. 
	ret p			;f294	f0 	. 
	ret m			;f295	f8 	. 
	cp 07bh		;f296	fe 7b 	. { 
	ld (hl),b			;f298	70 	p 
	jr c,$+26		;f299	38 18 	8 . 
	jr $+58		;f29b	18 38 	. 8 
	jr nc,$+2		;f29d	30 00 	0 . 
	nop			;f29f	00 	. 
	rla			;f2a0	17 	. 
	rrca			;f2a1	0f 	. 
	ld bc,00000h		;f2a2	01 00 00 	. . . 
	nop			;f2a5	00 	. 
	nop			;f2a6	00 	. 
	nop			;f2a7	00 	. 
	add a,b			;f2a8	80 	. 
	ret po			;f2a9	e0 	. 
	ret p			;f2aa	f0 	. 
	ld (hl),b			;f2ab	70 	p 
	jr nc,$+50		;f2ac	30 30 	0 0 
	jr nc,$+114		;f2ae	30 70 	0 p 
	nop			;f2b0	00 	. 
	nop			;f2b1	00 	. 
	nop			;f2b2	00 	. 
	nop			;f2b3	00 	. 
	nop			;f2b4	00 	. 
	nop			;f2b5	00 	. 
	ld bc,00f01h		;f2b6	01 01 0f 	. . . 
	rrca			;f2b9	0f 	. 
	rra			;f2ba	1f 	. 
	ccf			;f2bb	3f 	? 
	ld a,a			;f2bc	7f 	 
	rst 38h			;f2bd	ff 	. 
	rst 38h			;f2be	ff 	. 
	rst 38h			;f2bf	ff 	. 
	ret po			;f2c0	e0 	. 
	ret po			;f2c1	e0 	. 
	ret po			;f2c2	e0 	. 
	ret po			;f2c3	e0 	. 
	ret p			;f2c4	f0 	. 
	ret p			;f2c5	f0 	. 
	ret p			;f2c6	f0 	. 
	ret p			;f2c7	f0 	. 
	inc bc			;f2c8	03 	. 
	inc bc			;f2c9	03 	. 
	inc bc			;f2ca	03 	. 
	inc bc			;f2cb	03 	. 
	inc bc			;f2cc	03 	. 
	inc bc			;f2cd	03 	. 
	ld (bc),a			;f2ce	02 	. 
	inc bc			;f2cf	03 	. 
	pop af			;f2d0	f1 	. 
	ret p			;f2d1	f0 	. 
	ret po			;f2d2	e0 	. 
	ret nz			;f2d3	c0 	. 
	add a,b			;f2d4	80 	. 
	add a,b			;f2d5	80 	. 
	add a,b			;f2d6	80 	. 
	nop			;f2d7	00 	. 
	ret p			;f2d8	f0 	. 
	ret p			;f2d9	f0 	. 
	call m,07e7ch		;f2da	fc 7c 7e 	. | ~ 
	ld a,00fh		;f2dd	3e 0f 	> . 
	ld b,000h		;f2df	06 00 	. . 
	nop			;f2e1	00 	. 
	nop			;f2e2	00 	. 
	nop			;f2e3	00 	. 
	nop			;f2e4	00 	. 
	nop			;f2e5	00 	. 
	add a,b			;f2e6	80 	. 
	ret nz			;f2e7	c0 	. 
	rlca			;f2e8	07 	. 
	ld b,006h		;f2e9	06 06 	. . 
	ld c,00ch		;f2eb	0e 0c 	. . 
	inc e			;f2ed	1c 	. 
	inc a			;f2ee	3c 	< 
	ld a,b			;f2ef	78 	x 
	ld bc,00000h		;f2f0	01 00 00 	. . . 
	nop			;f2f3	00 	. 
	nop			;f2f4	00 	. 
	nop			;f2f5	00 	. 
	nop			;f2f6	00 	. 
	nop			;f2f7	00 	. 
	ret po			;f2f8	e0 	. 
	ret p			;f2f9	f0 	. 
	jr c,$+16		;f2fa	38 0e 	8 . 
	ld b,002h		;f2fc	06 02 	. . 
	ld (bc),a			;f2fe	02 	. 
	nop			;f2ff	00 	. 
	nop			;f300	00 	. 
	nop			;f301	00 	. 
	nop			;f302	00 	. 
	nop			;f303	00 	. 
	ld bc,00703h		;f304	01 03 07 	. . . 
	rrca			;f307	0f 	. 
	nop			;f308	00 	. 
	inc bc			;f309	03 	. 
	rrca			;f30a	0f 	. 
	ld a,a			;f30b	7f 	 
	rst 38h			;f30c	ff 	. 
	rst 38h			;f30d	ff 	. 
	rst 38h			;f30e	ff 	. 
	rst 38h			;f30f	ff 	. 
	ld a,a			;f310	7f 	 
	ccf			;f311	3f 	? 
	cp 0feh		;f312	fe fe 	. . 
	rst 38h			;f314	ff 	. 
	rst 38h			;f315	ff 	. 
	rst 38h			;f316	ff 	. 
	add a,e			;f317	83 	. 
	ret p			;f318	f0 	. 
	ret po			;f319	e0 	. 
	call pe,03edeh		;f31a	ec de 3e 	. . > 
	cp 0feh		;f31d	fe fe 	. . 
	call m,00000h		;f31f	fc 00 00 	. . . 
	ld bc,00f03h		;f322	01 03 0f 	. . . 
	ccf			;f325	3f 	? 
	call m,01ffch		;f326	fc fc 1f 	. . . 
	ld a,a			;f329	7f 	 
	cp 0f8h		;f32a	fe f8 	. . 
	ret nz			;f32c	c0 	. 
	nop			;f32d	00 	. 
	nop			;f32e	00 	. 
	nop			;f32f	00 	. 
	ret po			;f330	e0 	. 
	add a,b			;f331	80 	. 
	nop			;f332	00 	. 
	nop			;f333	00 	. 
	nop			;f334	00 	. 
	nop			;f335	00 	. 
	nop			;f336	00 	. 
	nop			;f337	00 	. 
	inc a			;f338	3c 	< 
	jr c,$+58		;f339	38 38 	8 8 
	ld (hl),b			;f33b	70 	p 
	ld (hl),b			;f33c	70 	p 
	ret po			;f33d	e0 	. 
	ret p			;f33e	f0 	. 
	call m,00301h		;f33f	fc 01 03 	. . . 
	inc bc			;f342	03 	. 
	inc bc			;f343	03 	. 
	inc bc			;f344	03 	. 
	ld bc,00101h		;f345	01 01 01 	. . . 
	cp h			;f348	bc 	. 
	cp b			;f349	b8 	. 
	rst 10h			;f34a	d7 	. 
	rst 28h			;f34b	ef 	. 
	rst 38h			;f34c	ff 	. 
	rst 38h			;f34d	ff 	. 
	rst 28h			;f34e	ef 	. 
	di			;f34f	f3 	. 
	nop			;f350	00 	. 
	nop			;f351	00 	. 
	nop			;f352	00 	. 
	nop			;f353	00 	. 
	nop			;f354	00 	. 
	nop			;f355	00 	. 
	ld bc,0f003h		;f356	01 03 f0 	. . . 
	ret p			;f359	f0 	. 
	ret p			;f35a	f0 	. 
	ret po			;f35b	e0 	. 
	ret po			;f35c	e0 	. 
	ld (hl),b			;f35d	70 	p 
	ret p			;f35e	f0 	. 
	ret p			;f35f	f0 	. 
	nop			;f360	00 	. 
	nop			;f361	00 	. 
	inc bc			;f362	03 	. 
	rlca			;f363	07 	. 
	rlca			;f364	07 	. 
	inc b			;f365	04 	. 
	ld h,a			;f366	67 	g 
	ld (hl),e			;f367	73 	s 
	nop			;f368	00 	. 
	nop			;f369	00 	. 
	add a,b			;f36a	80 	. 
	ret nz			;f36b	c0 	. 
	ret nz			;f36c	c0 	. 
	adc a,0ffh		;f36d	ce ff 	. . 
	rst 38h			;f36f	ff 	. 
	nop			;f370	00 	. 
	nop			;f371	00 	. 
	nop			;f372	00 	. 
	nop			;f373	00 	. 
	nop			;f374	00 	. 
	nop			;f375	00 	. 
	add a,(hl)			;f376	86 	. 
	rst 28h			;f377	ef 	. 
	nop			;f378	00 	. 
	nop			;f379	00 	. 
	nop			;f37a	00 	. 
	nop			;f37b	00 	. 
	nop			;f37c	00 	. 
	nop			;f37d	00 	. 
	ld bc,00007h		;f37e	01 07 00 	. . . 
	nop			;f381	00 	. 
	nop			;f382	00 	. 
	nop			;f383	00 	. 
	nop			;f384	00 	. 
	jr z,$-124		;f385	28 82 	( . 
	ret nz			;f387	c0 	. 
	nop			;f388	00 	. 
	ld (bc),a			;f389	02 	. 
	ld b,b			;f38a	40 	@ 
	inc b			;f38b	04 	. 
	nop			;f38c	00 	. 
	ret m			;f38d	f8 	. 
	ret p			;f38e	f0 	. 
	add a,d			;f38f	82 	. 
	nop			;f390	00 	. 
	nop			;f391	00 	. 
	nop			;f392	00 	. 
	nop			;f393	00 	. 
	jr nc,$+125		;f394	30 7b 	0 { 
	ld (hl),a			;f396	77 	w 
	ld (hl),a			;f397	77 	w 
	ld (hl),a			;f398	77 	w 
	ld l,00eh		;f399	2e 0e 	. . 
	rra			;f39b	1f 	. 
	rra			;f39c	1f 	. 
	rst 18h			;f39d	df 	. 
	rst 28h			;f39e	ef 	. 
	ret p			;f39f	f0 	. 
	ld h,(hl)			;f3a0	66 	f 
	sbc a,e			;f3a1	9b 	. 
	ld a,l			;f3a2	7d 	} 
	defb 0fdh,0fbh,0e7h	;illegal sequence		;f3a3	fd fb e7 	. . . 
	sbc a,a			;f3a6	9f 	. 
	ld a,(hl)			;f3a7	7e 	~ 
	call m,0fefeh		;f3a8	fc fe fe 	. . . 
	rst 38h			;f3ab	ff 	. 
	ld a,a			;f3ac	7f 	 
	ld d,a			;f3ad	57 	W 
	ld (hl),a			;f3ae	77 	w 
	dec sp			;f3af	3b 	; 
	call m,078fch		;f3b0	fc fc 78 	. . x 
	ret m			;f3b3	f8 	. 
	call m,0fcfch		;f3b4	fc fc fc 	. . . 
	call m,03c39h		;f3b7	fc 39 3c 	. 9 < 
	dec e			;f3ba	1d 	. 
	dec e			;f3bb	1d 	. 
	add hl,sp			;f3bc	39 	9 
	add hl,sp			;f3bd	39 	9 
	ld (hl),e			;f3be	73 	s 
	ld h,e			;f3bf	63 	c 
	call m,030f8h		;f3c0	fc f8 30 	. . 0 
	ret p			;f3c3	f0 	. 
	ret p			;f3c4	f0 	. 
	ret p			;f3c5	f0 	. 
	ret p			;f3c6	f0 	. 
	ret po			;f3c7	e0 	. 
	inc bc			;f3c8	03 	. 
	inc bc			;f3c9	03 	. 
	ld bc,00001h		;f3ca	01 01 00 	. . . 
	nop			;f3cd	00 	. 
	nop			;f3ce	00 	. 
	nop			;f3cf	00 	. 
	ret po			;f3d0	e0 	. 
	ret nz			;f3d1	c0 	. 
	ret po			;f3d2	e0 	. 
	sub b			;f3d3	90 	. 
	ret p			;f3d4	f0 	. 
	ret m			;f3d5	f8 	. 
	ld a,b			;f3d6	78 	x 
	jr c,$+62		;f3d7	38 3c 	8 < 
	inc e			;f3d9	1c 	. 
	inc e			;f3da	1c 	. 
	ld c,00eh		;f3db	0e 0e 	. . 
	ld c,07ch		;f3dd	0e 7c 	. | 
	ret m			;f3df	f8 	. 
	nop			;f3e0	00 	. 
	nop			;f3e1	00 	. 
	nop			;f3e2	00 	. 
	add a,b			;f3e3	80 	. 
	ret nz			;f3e4	c0 	. 
	ret nz			;f3e5	c0 	. 
	ret nz			;f3e6	c0 	. 
	ret po			;f3e7	e0 	. 
	ret po			;f3e8	e0 	. 
	ret m			;f3e9	f8 	. 
	ld a,01fh		;f3ea	3e 1f 	> . 
	rrca			;f3ec	0f 	. 
	rlca			;f3ed	07 	. 
	rlca			;f3ee	07 	. 
	inc bc			;f3ef	03 	. 
	call m,07f7eh		;f3f0	fc 7e 7f 	. ~  
	ccf			;f3f3	3f 	? 
	rra			;f3f4	1f 	. 
	rrca			;f3f5	0f 	. 
	rlca			;f3f6	07 	. 
	inc bc			;f3f7	03 	. 
	ld bc,00100h		;f3f8	01 00 01 	. . . 
	ld bc,00101h		;f3fb	01 01 01 	. . . 
	inc bc			;f3fe	03 	. 
	inc bc			;f3ff	03 	. 
	ret p			;f400	f0 	. 
	ret p			;f401	f0 	. 
	ret p			;f402	f0 	. 
	ld (hl),b			;f403	70 	p 
	jr c,$+62		;f404	38 3c 	8 < 
	inc e			;f406	1c 	. 
	ld e,000h		;f407	1e 00 	. . 
	nop			;f409	00 	. 
	nop			;f40a	00 	. 
	nop			;f40b	00 	. 
	ld bc,00101h		;f40c	01 01 01 	. . . 
	inc bc			;f40f	03 	. 
	ld a,h			;f410	7c 	| 
	ld a,e			;f411	7b 	{ 
	rst 30h			;f412	f7 	. 
	rst 20h			;f413	e7 	. 
	rst 20h			;f414	e7 	. 
	rst 0			;f415	c7 	. 
	rst 0			;f416	c7 	. 
	rrc (hl)		;f417	cb 0e 	. . 
	adc a,(hl)			;f419	8e 	. 
	rst 8			;f41a	cf 	. 
	rst 8			;f41b	cf 	. 
	sbc a,0deh		;f41c	de de 	. . 
	sbc a,0ach		;f41e	de ac 	. . 
	inc bc			;f420	03 	. 
	inc bc			;f421	03 	. 
	inc bc			;f422	03 	. 
	nop			;f423	00 	. 
	nop			;f424	00 	. 
	nop			;f425	00 	. 
	nop			;f426	00 	. 
	nop			;f427	00 	. 
	call c,0d6bfh		;f428	dc bf d6 	. . . 
	defb 0edh;next byte illegal after ed		;f42b	ed 	. 
	ld (01f3fh),a		;f42c	32 3f 1f 	2 ? . 
	rra			;f42f	1f 	. 
	ld (hl),h			;f430	74 	t 
	call nc,090e8h		;f431	d4 e8 90 	. . . 
	ld (hl),b			;f434	70 	p 
	ret p			;f435	f0 	. 
	ret p			;f436	f0 	. 
	ret po			;f437	e0 	. 
	rrca			;f438	0f 	. 
	rrca			;f439	0f 	. 
	rrca			;f43a	0f 	. 
	rla			;f43b	17 	. 
	jr $+33		;f43c	18 1f 	. . 
	rra			;f43e	1f 	. 
	rrca			;f43f	0f 	. 
	ret po			;f440	e0 	. 
	ret po			;f441	e0 	. 
	ret po			;f442	e0 	. 
	sub b			;f443	90 	. 
	ld (hl),b			;f444	70 	p 
	ret p			;f445	f0 	. 
	ret pe			;f446	e8 	. 
	sbc a,00bh		;f447	de 0b 	. . 
	dec e			;f449	1d 	. 
	ld e,01fh		;f44a	1e 1f 	. . 
	rra			;f44c	1f 	. 
	ccf			;f44d	3f 	? 
	ld a,03eh		;f44e	3e 3e 	> > 
	cp a			;f450	bf 	. 
	ld a,a			;f451	7f 	 
	rst 38h			;f452	ff 	. 
	ccf			;f453	3f 	? 
	rrca			;f454	0f 	. 
	inc bc			;f455	03 	. 
	rlca			;f456	07 	. 
	ld b,000h		;f457	06 00 	. . 
	ret nz			;f459	c0 	. 
	ret po			;f45a	e0 	. 
	ret po			;f45b	e0 	. 
	ret po			;f45c	e0 	. 
	ret nz			;f45d	c0 	. 
	ret nz			;f45e	c0 	. 
	add a,b			;f45f	80 	. 
	ld a,07ch		;f460	3e 7c 	> | 
	ld a,h			;f462	7c 	| 
	ld a,h			;f463	7c 	| 
	jr c,$+54		;f464	38 34 	8 4 
	inc l			;f466	2c 	, 
	inc e			;f467	1c 	. 
	add hl,bc			;f468	09 	. 
	rra			;f469	1f 	. 
	ld e,03ch		;f46a	1e 3c 	. < 
	ld a,b			;f46c	78 	x 
	ld (hl),b			;f46d	70 	p 
	call m,01efch		;f46e	fc fc 1e 	. . . 
	ld c,00eh		;f471	0e 0e 	. . 
	rlca			;f473	07 	. 
	rlca			;f474	07 	. 
	rra			;f475	1f 	. 
	rra			;f476	1f 	. 
	rra			;f477	1f 	. 
	nop			;f478	00 	. 
	nop			;f479	00 	. 
	nop			;f47a	00 	. 
	nop			;f47b	00 	. 
	nop			;f47c	00 	. 
	nop			;f47d	00 	. 
	ld b,00fh		;f47e	06 0f 	. . 
	nop			;f480	00 	. 
	nop			;f481	00 	. 
	nop			;f482	00 	. 
	nop			;f483	00 	. 
	nop			;f484	00 	. 
	rlca			;f485	07 	. 
	rrca			;f486	0f 	. 
	rrca			;f487	0f 	. 
	nop			;f488	00 	. 
	nop			;f489	00 	. 
	nop			;f48a	00 	. 
	nop			;f48b	00 	. 
	nop			;f48c	00 	. 
	add a,b			;f48d	80 	. 
	ret nz			;f48e	c0 	. 
	ret nz			;f48f	c0 	. 
	nop			;f490	00 	. 
	nop			;f491	00 	. 
	nop			;f492	00 	. 
	ld bc,00703h		;f493	01 03 07 	. . . 
	rrca			;f496	0f 	. 
	rrca			;f497	0f 	. 
	rrca			;f498	0f 	. 
	ld b,003h		;f499	06 03 	. . 
	pop bc			;f49b	c1 	. 
	ret nz			;f49c	c0 	. 
	ret nz			;f49d	c0 	. 
	add a,b			;f49e	80 	. 
	ld h,b			;f49f	60 	` 
	nop			;f4a0	00 	. 
	add a,b			;f4a1	80 	. 
	ret po			;f4a2	e0 	. 
	call m,07fffh		;f4a3	fc ff 7f 	. .  
	rra			;f4a6	1f 	. 
	inc bc			;f4a7	03 	. 
	add hl,bc			;f4a8	09 	. 
	rrca			;f4a9	0f 	. 
	rrca			;f4aa	0f 	. 
	rra			;f4ab	1f 	. 
	rst 30h			;f4ac	f7 	. 
	ret m			;f4ad	f8 	. 
	rst 38h			;f4ae	ff 	. 
	ret m			;f4af	f8 	. 
	rst 0			;f4b0	c7 	. 
	jp pe,0faf4h		;f4b1	ea f4 fa 	. . . 
	defb 0edh;next byte illegal after ed		;f4b4	ed 	. 
	ret nc			;f4b5	d0 	. 
	ret m			;f4b6	f8 	. 
	call m,00003h		;f4b7	fc 03 00 	. . . 
	nop			;f4ba	00 	. 
	nop			;f4bb	00 	. 
	nop			;f4bc	00 	. 
	nop			;f4bd	00 	. 
	nop			;f4be	00 	. 
	nop			;f4bf	00 	. 
	call m,07bfbh		;f4c0	fc fb 7b 	. . { 
	rla			;f4c3	17 	. 
	rlca			;f4c4	07 	. 
	ld bc,00000h		;f4c5	01 00 00 	. . . 
	nop			;f4c8	00 	. 
	nop			;f4c9	00 	. 
	ret nz			;f4ca	c0 	. 
	ret p			;f4cb	f0 	. 
	call m,07ffeh		;f4cc	fc fe 7f 	. .  
	ccf			;f4cf	3f 	? 
	halt			;f4d0	76 	v 
	ld (hl),037h		;f4d1	36 37 	6 7 
	dec sp			;f4d3	3b 	; 
	dec a			;f4d4	3d 	= 
	ld a,(hl)			;f4d5	7e 	~ 
	sbc a,a			;f4d6	9f 	. 
	rst 20h			;f4d7	e7 	. 
	ld a,(hl)			;f4d8	7e 	~ 
	ld a,a			;f4d9	7f 	 
	xor a			;f4da	af 	. 
	rst 0			;f4db	c7 	. 
	rst 38h			;f4dc	ff 	. 
	ld a,a			;f4dd	7f 	 
	cp (hl)			;f4de	be 	. 
	call z,00f1fh		;f4df	cc 1f 0f 	. . . 
	inc bc			;f4e2	03 	. 
	ld bc,00000h		;f4e3	01 00 00 	. . . 
	nop			;f4e6	00 	. 
	nop			;f4e7	00 	. 
	cp c			;f4e8	b9 	. 
	cp (hl)			;f4e9	be 	. 
	cp a			;f4ea	bf 	. 
	cp h			;f4eb	bc 	. 
	ld (hl),e			;f4ec	73 	s 
	cpl			;f4ed	2f 	/ 
	rra			;f4ee	1f 	. 
	rlca			;f4ef	07 	. 
	add a,b			;f4f0	80 	. 
	nop			;f4f1	00 	. 
	add a,b			;f4f2	80 	. 
	add a,b			;f4f3	80 	. 
	ret nz			;f4f4	c0 	. 
	ret p			;f4f5	f0 	. 
	call m,001feh		;f4f6	fc fe 01 	. . . 
	ld (bc),a			;f4f9	02 	. 
	rrca			;f4fa	0f 	. 
	ld a,(hl)			;f4fb	7e 	~ 
	rst 38h			;f4fc	ff 	. 
	rst 38h			;f4fd	ff 	. 
	ld a,b			;f4fe	78 	x 
	jr c,$-96		;f4ff	38 9e 	8 . 
	ld a,(hl)			;f501	7e 	~ 
	cp 0feh		;f502	fe fe 	. . 
	ld a,b			;f504	78 	x 
	ld b,b			;f505	40 	@ 
	nop			;f506	00 	. 
	nop			;f507	00 	. 
	inc a			;f508	3c 	< 
	inc e			;f509	1c 	. 
	nop			;f50a	00 	. 
	nop			;f50b	00 	. 
	nop			;f50c	00 	. 
	nop			;f50d	00 	. 
	nop			;f50e	00 	. 
	nop			;f50f	00 	. 
	call 04cb2h		;f510	cd b2 4c 	. . L 
	and b			;f513	a0 	. 
	sbc a,(hl)			;f514	9e 	. 
	ret nz			;f515	c0 	. 
	ret nz			;f516	c0 	. 
	ret nz			;f517	c0 	. 
	nop			;f518	00 	. 
	nop			;f519	00 	. 
	nop			;f51a	00 	. 
	nop			;f51b	00 	. 
	nop			;f51c	00 	. 
	nop			;f51d	00 	. 
	nop			;f51e	00 	. 
	inc a			;f51f	3c 	< 
	nop			;f520	00 	. 
	ld (bc),a			;f521	02 	. 
	halt			;f522	76 	v 
	jp m,0fafah		;f523	fa fa fa 	. . . 
	ei			;f526	fb 	. 
	ld (hl),a			;f527	77 	w 
	ld a,(hl)			;f528	7e 	~ 
	rst 38h			;f529	ff 	. 
	rst 38h			;f52a	ff 	. 
	rst 38h			;f52b	ff 	. 
	cp 0fch		;f52c	fe fc 	. . 
	ld (hl),c			;f52e	71 	q 
	cp (hl)			;f52f	be 	. 
	cp 07fh		;f530	fe 7f 	.  
	or b			;f532	b0 	. 
	or a			;f533	b7 	. 
	cp a			;f534	bf 	. 
	cp a			;f535	bf 	. 
	ld a,a			;f536	7f 	 
	call m,0e000h		;f537	fc 00 e0 	. . . 
	jr nc,$-46		;f53a	30 d0 	0 . 
	xor (hl)			;f53c	ae 	. 
	xor a			;f53d	af 	. 
	xor a			;f53e	af 	. 
	ld (hl),000h		;f53f	36 00 	6 . 
	nop			;f541	00 	. 
	nop			;f542	00 	. 
	nop			;f543	00 	. 
	nop			;f544	00 	. 
	ld bc,00101h		;f545	01 01 01 	. . . 
	nop			;f548	00 	. 
	nop			;f549	00 	. 
	ld (hl),b			;f54a	70 	p 
	ret p			;f54b	f0 	. 
	ret po			;f54c	e0 	. 
	ret nz			;f54d	c0 	. 
	add a,b			;f54e	80 	. 
	add a,b			;f54f	80 	. 
	nop			;f550	00 	. 
	ld bc,00001h		;f551	01 01 00 	. . . 
	ld a,(bc)			;f554	0a 	. 
	ld a,(bc)			;f555	0a 	. 
	add hl,bc			;f556	09 	. 
	dec b			;f557	05 	. 
	ret nz			;f558	c0 	. 
	ret nz			;f559	c0 	. 
	ret nz			;f55a	c0 	. 
	ret po			;f55b	e0 	. 
	ret po			;f55c	e0 	. 
	ld (hl),b			;f55d	70 	p 
	ld (hl),b			;f55e	70 	p 
	jr z,$+5		;f55f	28 03 	( . 
	inc bc			;f561	03 	. 
	ld (bc),a			;f562	02 	. 
	ld bc,00001h		;f563	01 01 00 	. . . 
	nop			;f566	00 	. 
	nop			;f567	00 	. 
	add a,b			;f568	80 	. 
	add a,b			;f569	80 	. 
	ld b,b			;f56a	40 	@ 
	ret po			;f56b	e0 	. 
	ret p			;f56c	f0 	. 
	call m,03f7eh		;f56d	fc 7e 3f 	. ~ ? 
	ld (hl),l			;f570	75 	u 
	jp m,09afah		;f571	fa fa 9a 	. . . 
	cp 0fdh		;f574	fe fd 	. . 
	ei			;f576	fb 	. 
	ld (hl),a			;f577	77 	w 
	jr c,$+58		;f578	38 38 	8 8 
	ld a,b			;f57a	78 	x 
	ret p			;f57b	f0 	. 
	ret p			;f57c	f0 	. 
	ret po			;f57d	e0 	. 
	ret po			;f57e	e0 	. 
	ret nz			;f57f	c0 	. 
	rra			;f580	1f 	. 
	rlca			;f581	07 	. 
	rlca			;f582	07 	. 
	rlca			;f583	07 	. 
	inc bc			;f584	03 	. 
	nop			;f585	00 	. 
	inc bc			;f586	03 	. 
	inc bc			;f587	03 	. 
	adc a,a			;f588	8f 	. 
	rst 38h			;f589	ff 	. 
	rst 38h			;f58a	ff 	. 
	cp a			;f58b	bf 	. 
	cp (hl)			;f58c	be 	. 
	add a,0feh		;f58d	c6 fe 	. . 
	cp 080h		;f58f	fe 80 	. . 
	add a,b			;f591	80 	. 
	nop			;f592	00 	. 
	nop			;f593	00 	. 
	nop			;f594	00 	. 
	nop			;f595	00 	. 
	nop			;f596	00 	. 
	nop			;f597	00 	. 
	inc bc			;f598	03 	. 
	inc bc			;f599	03 	. 
	ld (bc),a			;f59a	02 	. 
	rlca			;f59b	07 	. 
	dec bc			;f59c	0b 	. 
	dec e			;f59d	1d 	. 
	dec a			;f59e	3d 	= 
	ld a,(hl)			;f59f	7e 	~ 
	call m,0f8fch		;f5a0	fc fc f8 	. . . 
	ex af,af'			;f5a3	08 	. 
	ret m			;f5a4	f8 	. 
	call po,0bcdch		;f5a5	e4 dc bc 	. . . 
	nop			;f5a8	00 	. 
	nop			;f5a9	00 	. 
	ld bc,00301h		;f5aa	01 01 03 	. . . 
	inc bc			;f5ad	03 	. 
	inc bc			;f5ae	03 	. 
	inc bc			;f5af	03 	. 
	cp 0ffh		;f5b0	fe ff 	. . 
	cp 0f8h		;f5b2	fe f8 	. . 
	ret p			;f5b4	f0 	. 
	ret nz			;f5b5	c0 	. 
	ret nz			;f5b6	c0 	. 
	ret po			;f5b7	e0 	. 
	call m,0f8f8h		;f5b8	fc f8 f8 	. . . 
	ret m			;f5bb	f8 	. 
	ret m			;f5bc	f8 	. 
	ret m			;f5bd	f8 	. 
	ret p			;f5be	f0 	. 
	ret p			;f5bf	f0 	. 
	ld bc,00000h		;f5c0	01 00 00 	. . . 
	nop			;f5c3	00 	. 
	nop			;f5c4	00 	. 
	nop			;f5c5	00 	. 
	nop			;f5c6	00 	. 
	nop			;f5c7	00 	. 
	ret po			;f5c8	e0 	. 
	ret po			;f5c9	e0 	. 
	ld d,b			;f5ca	50 	P 
	jr c,$+30		;f5cb	38 1c 	8 . 
	dec c			;f5cd	0d 	. 
	dec c			;f5ce	0d 	. 
	dec e			;f5cf	1d 	. 
	ret p			;f5d0	f0 	. 
	ret p			;f5d1	f0 	. 
	ret p			;f5d2	f0 	. 
	ret po			;f5d3	e0 	. 
	and b			;f5d4	a0 	. 
	ret nz			;f5d5	c0 	. 
	ret nz			;f5d6	c0 	. 
	ret nz			;f5d7	c0 	. 
	add hl,de			;f5d8	19 	. 
	nop			;f5d9	00 	. 
	inc bc			;f5da	03 	. 
	inc bc			;f5db	03 	. 
	inc bc			;f5dc	03 	. 
	inc bc			;f5dd	03 	. 
	inc bc			;f5de	03 	. 
	inc bc			;f5df	03 	. 
	ret nz			;f5e0	c0 	. 
	ret nz			;f5e1	c0 	. 
	ld b,b			;f5e2	40 	@ 
	add a,b			;f5e3	80 	. 
	add a,b			;f5e4	80 	. 
	add a,b			;f5e5	80 	. 
	add a,b			;f5e6	80 	. 
	nop			;f5e7	00 	. 
	nop			;f5e8	00 	. 
	nop			;f5e9	00 	. 
	nop			;f5ea	00 	. 
	inc e			;f5eb	1c 	. 
	ld a,03fh		;f5ec	3e 3f 	> ? 
	dec sp			;f5ee	3b 	; 
	inc sp			;f5ef	33 	3 
	nop			;f5f0	00 	. 
	ex af,af'			;f5f1	08 	. 
	ld d,039h		;f5f2	16 39 	. 9 
	ld b,(hl)			;f5f4	46 	F 
	or c			;f5f5	b1 	. 
	call pe,017d6h		;f5f6	ec d6 17 	. . . 
	rlca			;f5f9	07 	. 
	ld bc,00101h		;f5fa	01 01 01 	. . . 
	ld b,00fh		;f5fd	06 0f 	. . 
	rrca			;f5ff	0f 	. 
	cp e			;f600	bb 	. 
	cp l			;f601	bd 	. 
	cp l			;f602	bd 	. 
	defb 0ddh,0deh,0eeh	;illegal sequence		;f603	dd de ee 	. . . 
	xor 0eeh		;f606	ee ee 	. . 
	nop			;f608	00 	. 
	add a,b			;f609	80 	. 
	add a,b			;f60a	80 	. 
	ret nz			;f60b	c0 	. 
	ret nz			;f60c	c0 	. 
	ret po			;f60d	e0 	. 
	ret po			;f60e	e0 	. 
	ret nc			;f60f	d0 	. 
	rrca			;f610	0f 	. 
	rrca			;f611	0f 	. 
	ld b,001h		;f612	06 01 	. . 
	inc bc			;f614	03 	. 
	inc bc			;f615	03 	. 
	nop			;f616	00 	. 
	nop			;f617	00 	. 
	sbc a,0bdh		;f618	de bd 	. . 
	ld a,e			;f61a	7b 	{ 
	rst 20h			;f61b	e7 	. 
	rst 18h			;f61c	df 	. 
	or h			;f61d	b4 	. 
	ld l,a			;f61e	6f 	o 
	rra			;f61f	1f 	. 
	cp b			;f620	b8 	. 
	ret m			;f621	f8 	. 
	ret m			;f622	f8 	. 
	ret m			;f623	f8 	. 
	ret m			;f624	f8 	. 
	ret p			;f625	f0 	. 
	nop			;f626	00 	. 
	add a,b			;f627	80 	. 
	rlca			;f628	07 	. 
	inc bc			;f629	03 	. 
	ld bc,00001h		;f62a	01 01 00 	. . . 
	nop			;f62d	00 	. 
	nop			;f62e	00 	. 
	nop			;f62f	00 	. 
	add a,b			;f630	80 	. 
	add a,b			;f631	80 	. 
	add a,b			;f632	80 	. 
	add a,b			;f633	80 	. 
	nop			;f634	00 	. 
	nop			;f635	00 	. 
	nop			;f636	00 	. 
	nop			;f637	00 	. 
	nop			;f638	00 	. 
	nop			;f639	00 	. 
	nop			;f63a	00 	. 
	nop			;f63b	00 	. 
	nop			;f63c	00 	. 
	nop			;f63d	00 	. 
	rlca			;f63e	07 	. 
	rra			;f63f	1f 	. 
	nop			;f640	00 	. 
	nop			;f641	00 	. 
	nop			;f642	00 	. 
	nop			;f643	00 	. 
	nop			;f644	00 	. 
	nop			;f645	00 	. 
	add a,b			;f646	80 	. 
	ret nz			;f647	c0 	. 
	ld c,b			;f648	48 	H 
	ld d,c			;f649	51 	Q 
	and a			;f64a	a7 	. 
	xor a			;f64b	af 	. 
	ld e,(hl)			;f64c	5e 	^ 
	cp c			;f64d	b9 	. 
	or a			;f64e	b7 	. 
	or a			;f64f	b7 	. 
	ld l,a			;f650	6f 	o 
	rst 30h			;f651	f7 	. 
	rst 30h			;f652	f7 	. 
	rst 38h			;f653	ff 	. 
	rrca			;f654	0f 	. 
	di			;f655	f3 	. 
	defb 0fdh,0fdh,0c0h	;illegal sequence		;f656	fd fd c0 	. . . 
	rst 8			;f659	cf 	. 
	rst 18h			;f65a	df 	. 
	cp b			;f65b	b8 	. 
	ld (hl),b			;f65c	70 	p 
	ret p			;f65d	f0 	. 
	and b			;f65e	a0 	. 
	ret nz			;f65f	c0 	. 
	ld (hl),a			;f660	77 	w 
	jr c,$+129		;f661	38 7f 	8  
	rst 38h			;f663	ff 	. 
	call pe,0f0e4h		;f664	ec e4 f0 	. . . 
	ld (hl),b			;f667	70 	p 
	ld e,0eeh		;f668	1e ee 	. . 
	rst 30h			;f66a	f7 	. 
	rst 30h			;f66b	f7 	. 
	rst 30h			;f66c	f7 	. 
	ei			;f66d	fb 	. 
	ld (hl),e			;f66e	73 	s 
	inc bc			;f66f	03 	. 
	add a,b			;f670	80 	. 
	nop			;f671	00 	. 
	nop			;f672	00 	. 
	nop			;f673	00 	. 
	add a,b			;f674	80 	. 
	add a,b			;f675	80 	. 
	add a,b			;f676	80 	. 
	nop			;f677	00 	. 
	ld bc,00101h		;f678	01 01 01 	. . . 
	ld bc,00001h		;f67b	01 01 00 	. . . 
	rrca			;f67e	0f 	. 
	rra			;f67f	1f 	. 
	add a,b			;f680	80 	. 
	add a,b			;f681	80 	. 
	ret nz			;f682	c0 	. 
	ret po			;f683	e0 	. 
	ret m			;f684	f8 	. 
	or 02dh		;f685	f6 2d 	. - 
	ei			;f687	fb 	. 
	nop			;f688	00 	. 
	nop			;f689	00 	. 
	nop			;f68a	00 	. 
	nop			;f68b	00 	. 
	nop			;f68c	00 	. 
	nop			;f68d	00 	. 
	ret nz			;f68e	c0 	. 
	ret nz			;f68f	c0 	. 
	rra			;f690	1f 	. 
	rra			;f691	1f 	. 
	rra			;f692	1f 	. 
	rra			;f693	1f 	. 
	dec e			;f694	1d 	. 
	dec bc			;f695	0b 	. 
	rlca			;f696	07 	. 
	rlca			;f697	07 	. 
	rst 20h			;f698	e7 	. 
	sbc a,0bdh		;f699	de bd 	. . 
	ld a,e			;f69b	7b 	{ 
	ld (hl),a			;f69c	77 	w 
	ld (hl),a			;f69d	77 	w 
	ld (hl),a			;f69e	77 	w 
	ld a,e			;f69f	7b 	{ 
	add a,b			;f6a0	80 	. 
	ld h,b			;f6a1	60 	` 
	ret p			;f6a2	f0 	. 
	ret p			;f6a3	f0 	. 
	ret p			;f6a4	f0 	. 
	ret p			;f6a5	f0 	. 
	ld h,b			;f6a6	60 	` 
	add a,b			;f6a7	80 	. 
	inc bc			;f6a8	03 	. 
	inc bc			;f6a9	03 	. 
	ld bc,00001h		;f6aa	01 01 00 	. . . 
	nop			;f6ad	00 	. 
	nop			;f6ae	00 	. 
	ld bc,0bdbbh		;f6af	01 bb bd 	. . . 
	cp l			;f6b2	bd 	. 
	cp l			;f6b3	bd 	. 
	ld ixl,e		;f6b4	dd 6b 	. k 
	scf			;f6b6	37 	7 
	adc a,l			;f6b7	8d 	. 
	add a,b			;f6b8	80 	. 
	add a,b			;f6b9	80 	. 
	ret po			;f6ba	e0 	. 
	ret pe			;f6bb	e8 	. 
	call z,0fcdch		;f6bc	cc dc fc 	. . . 
	ld a,h			;f6bf	7c 	| 
	ld h,d			;f6c0	62 	b 
	sbc a,h			;f6c1	9c 	. 
	ld l,b			;f6c2	68 	h 
	djnz $+2		;f6c3	10 00 	. . 
	nop			;f6c5	00 	. 
	nop			;f6c6	00 	. 
	nop			;f6c7	00 	. 
	jr c,$+2		;f6c8	38 00 	8 . 
	nop			;f6ca	00 	. 
	nop			;f6cb	00 	. 
	nop			;f6cc	00 	. 
	nop			;f6cd	00 	. 
	nop			;f6ce	00 	. 
	nop			;f6cf	00 	. 
	nop			;f6d0	00 	. 
	nop			;f6d1	00 	. 
	nop			;f6d2	00 	. 
	nop			;f6d3	00 	. 
	nop			;f6d4	00 	. 
	nop			;f6d5	00 	. 
	nop			;f6d6	00 	. 
	ld bc,00000h		;f6d7	01 00 00 	. . . 
	nop			;f6da	00 	. 
	nop			;f6db	00 	. 
	nop			;f6dc	00 	. 
	nop			;f6dd	00 	. 
	ret nz			;f6de	c0 	. 
	adc a,000h		;f6df	ce 00 	. . 
	nop			;f6e1	00 	. 
	nop			;f6e2	00 	. 
	nop			;f6e3	00 	. 
	nop			;f6e4	00 	. 
	nop			;f6e5	00 	. 
	ld c,00fh		;f6e6	0e 0f 	. . 
	ld bc,00001h		;f6e8	01 01 00 	. . . 
	nop			;f6eb	00 	. 
	nop			;f6ec	00 	. 
	ld bc,00503h		;f6ed	01 03 05 	. . . 
	rst 18h			;f6f0	df 	. 
	rst 28h			;f6f1	ef 	. 
	xor 0efh		;f6f2	ee ef 	. . 
	ld (hl),a			;f6f4	77 	w 
	ld a,b			;f6f5	78 	x 
	cp a			;f6f6	bf 	. 
	cp a			;f6f7	bf 	. 
	daa			;f6f8	27 	' 
	scf			;f6f9	37 	7 
	rst 38h			;f6fa	ff 	. 
	cp 01ch		;f6fb	fe 1c 	. . 
	xor 0edh		;f6fd	ee ed 	. . 
	defb 0edh;next byte illegal after ed		;f6ff	ed 	. 
	rrca			;f700	0f 	. 
	ld c,01dh		;f701	0e 1d 	. . 
	ei			;f703	fb 	. 
	di			;f704	f3 	. 
	inc bc			;f705	03 	. 
	inc bc			;f706	03 	. 
	ld bc,0f0cfh		;f707	01 cf f0 	. . . 
	rst 38h			;f70a	ff 	. 
	rst 28h			;f70b	ef 	. 
	rst 28h			;f70c	ef 	. 
	or 0f8h		;f70d	f6 f8 	. . 
	ret po			;f70f	e0 	. 
	sbc a,l			;f710	9d 	. 
	ld a,d			;f711	7a 	z 
	push af			;f712	f5 	. 
	push hl			;f713	e5 	. 
	adc a,d			;f714	8a 	. 
	ld (de),a			;f715	12 	. 
	nop			;f716	00 	. 
	nop			;f717	00 	. 
	nop			;f718	00 	. 
	nop			;f719	00 	. 
	nop			;f71a	00 	. 
	ld bc,0fd7ah		;f71b	01 7a fd 	. z . 
	rst 38h			;f71e	ff 	. 
	sbc a,05eh		;f71f	de 5e 	. ^ 
	dec a			;f721	3d 	= 
	add a,e			;f722	83 	. 
	defb 0ddh,01ch,001h	;illegal sequence		;f723	dd 1c 01 	. . . 
	rlca			;f726	07 	. 
	rlca			;f727	07 	. 
	defb 0ddh,0ddh,0ebh	;illegal sequence		;f728	dd dd eb 	. . . 
	ld l,e			;f72b	6b 	k 
	ld (hl),a			;f72c	77 	w 
	rst 30h			;f72d	f7 	. 
	jp po,0fb04h		;f72e	e2 04 fb 	. . . 
	defb 0fdh,0fdh,0ffh	;illegal sequence		;f731	fd fd ff 	. . . 
	ret p			;f734	f0 	. 
	nop			;f735	00 	. 
	nop			;f736	00 	. 
	nop			;f737	00 	. 
	ret m			;f738	f8 	. 
	rst 38h			;f739	ff 	. 
	rst 38h			;f73a	ff 	. 
	rst 38h			;f73b	ff 	. 
	ld a,a			;f73c	7f 	 
	rrca			;f73d	0f 	. 
	nop			;f73e	00 	. 
	nop			;f73f	00 	. 
	nop			;f740	00 	. 
	inc bc			;f741	03 	. 
	cp a			;f742	bf 	. 
	defb 0fdh,0fdh,0feh	;illegal sequence		;f743	fd fd fe 	. . . 
	ret po			;f746	e0 	. 
	nop			;f747	00 	. 
	jr nc,$-6		;f748	30 f8 	0 . 
	call m,0c7feh		;f74a	fc fe c7 	. . . 
	nop			;f74d	00 	. 
	nop			;f74e	00 	. 
	nop			;f74f	00 	. 
	ld (hl),h			;f750	74 	t 
	jr $+2		;f751	18 00 	. . 
	nop			;f753	00 	. 
	nop			;f754	00 	. 
	nop			;f755	00 	. 
	nop			;f756	00 	. 
	nop			;f757	00 	. 
	nop			;f758	00 	. 
	nop			;f759	00 	. 
	nop			;f75a	00 	. 
	nop			;f75b	00 	. 
	nop			;f75c	00 	. 
	nop			;f75d	00 	. 
	nop			;f75e	00 	. 
	rlca			;f75f	07 	. 
	rrca			;f760	0f 	. 
	rrca			;f761	0f 	. 
	add hl,bc			;f762	09 	. 
	rrca			;f763	0f 	. 
	rlca			;f764	07 	. 
	ld bc,00000h		;f765	01 00 00 	. . . 
	ret nz			;f768	c0 	. 
	ret po			;f769	e0 	. 
	call m,0f1ffh		;f76a	fc ff f1 	. . . 
	rst 10h			;f76d	d7 	. 
	cpl			;f76e	2f 	/ 
	ld e,a			;f76f	5f 	_ 
	nop			;f770	00 	. 
	nop			;f771	00 	. 
	nop			;f772	00 	. 
	nop			;f773	00 	. 
	add a,b			;f774	80 	. 
	ret nz			;f775	c0 	. 
	ret nz			;f776	c0 	. 
	ret po			;f777	e0 	. 
	djnz $+18		;f778	10 10 	. . 
	jr $+65		;f77a	18 3f 	. ? 
	call m,00818h		;f77c	fc 18 08 	. . . 
	ex af,af'			;f77f	08 	. 
	nop			;f780	00 	. 
	ld b,d			;f781	42 	B 
	inc l			;f782	2c 	, 
	jr c,$+30		;f783	38 1c 	8 . 
	inc (hl)			;f785	34 	4 
	ld b,d			;f786	42 	B 
	nop			;f787	00 	. 
	nop			;f788	00 	. 
	nop			;f789	00 	. 
	jr nz,$-2		;f78a	20 fc 	  . 
	rst 38h			;f78c	ff 	. 
	jr nz,$+2		;f78d	20 00 	  . 
	nop			;f78f	00 	. 
	nop			;f790	00 	. 
	nop			;f791	00 	. 
	jr nz,$+1		;f792	20 ff 	  . 
	call m,00020h		;f794	fc 20 00 	.   . 
	nop			;f797	00 	. 
	nop			;f798	00 	. 
	add a,e			;f799	83 	. 
	ld l,h			;f79a	6c 	l 
	rst 30h			;f79b	f7 	. 
	rst 38h			;f79c	ff 	. 
	ccf			;f79d	3f 	? 
	ret nz			;f79e	c0 	. 
	rst 38h			;f79f	ff 	. 
	ld e,a			;f7a0	5f 	_ 
	cp a			;f7a1	bf 	. 
	ld a,l			;f7a2	7d 	} 
	ld sp,hl			;f7a3	f9 	. 
	pop af			;f7a4	f1 	. 
	rst 8			;f7a5	cf 	. 
	inc a			;f7a6	3c 	< 
	di			;f7a7	f3 	. 
	ret p			;f7a8	f0 	. 
	ret m			;f7a9	f8 	. 
	cp 0ffh		;f7aa	fe ff 	. . 
	rst 38h			;f7ac	ff 	. 
	rrca			;f7ad	0f 	. 
	rst 38h			;f7ae	ff 	. 
	rst 38h			;f7af	ff 	. 
	nop			;f7b0	00 	. 
	nop			;f7b1	00 	. 
	nop			;f7b2	00 	. 
	nop			;f7b3	00 	. 
	add a,b			;f7b4	80 	. 
	ret nz			;f7b5	c0 	. 
	jp 000dch		;f7b6	c3 dc 00 	. . . 
	nop			;f7b9	00 	. 
	nop			;f7ba	00 	. 
	rst 38h			;f7bb	ff 	. 
	rst 38h			;f7bc	ff 	. 
	nop			;f7bd	00 	. 
	nop			;f7be	00 	. 
	nop			;f7bf	00 	. 
	jr $+26		;f7c0	18 18 	. . 
	jr $+26		;f7c2	18 18 	. . 
	jr $+26		;f7c4	18 18 	. . 
	jr $+26		;f7c6	18 18 	. . 
	nop			;f7c8	00 	. 
	nop			;f7c9	00 	. 
	jr $+64		;f7ca	18 3e 	. > 
	ld a,01ch		;f7cc	3e 1c 	> . 
	nop			;f7ce	00 	. 
	nop			;f7cf	00 	. 
	nop			;f7d0	00 	. 
	jr nc,$+58		;f7d1	30 38 	0 8 
	ld a,h			;f7d3	7c 	| 
	ld a,h			;f7d4	7c 	| 
	jr nc,$+2		;f7d5	30 00 	0 . 
	nop			;f7d7	00 	. 
	ld h,b			;f7d8	60 	` 
	and b			;f7d9	a0 	. 
	ret p			;f7da	f0 	. 
	jr c,$+30		;f7db	38 1c 	8 . 
	rrca			;f7dd	0f 	. 
	dec b			;f7de	05 	. 
	ld b,006h		;f7df	06 06 	. . 
	dec b			;f7e1	05 	. 
	rrca			;f7e2	0f 	. 
	inc e			;f7e3	1c 	. 
	jr c,$-14		;f7e4	38 f0 	8 . 
	and b			;f7e6	a0 	. 
	ld h,b			;f7e7	60 	` 
	nop			;f7e8	00 	. 
	nop			;f7e9	00 	. 
	nop			;f7ea	00 	. 
	inc h			;f7eb	24 	$ 
	ld a,(hl)			;f7ec	7e 	~ 
	in a,(081h)		;f7ed	db 81 	. . 
	nop			;f7ef	00 	. 
	nop			;f7f0	00 	. 
	inc h			;f7f1	24 	$ 
	ld h,(hl)			;f7f2	66 	f 
	rst 20h			;f7f3	e7 	. 
	inc a			;f7f4	3c 	< 
	jr $+2		;f7f5	18 00 	. . 
	nop			;f7f7	00 	. 
	adc a,c			;f7f8	89 	. 
	sbc a,c			;f7f9	99 	. 
	and b			;f7fa	a0 	. 
	sbc a,c			;f7fb	99 	. 
	cp b			;f7fc	b8 	. 
	sbc a,c			;f7fd	99 	. 
	nop			;f7fe	00 	. 
	ld bc,0beeeh		;f7ff	01 ee be 	. . . 
	djnz $-63		;f802	10 bf 	. . 
	ret nz			;f804	c0 	. 
	cp a			;f805	bf 	. 
	ld d,c			;f806	51 	Q 
	cp l			;f807	bd 	. 
	push de			;f808	d5 	. 
	cp (hl)			;f809	be 	. 
	sub h			;f80a	94 	. 
	cp l			;f80b	bd 	. 
	ex af,af'			;f80c	08 	. 
	cp a			;f80d	bf 	. 
	inc c			;f80e	0c 	. 
	cp a			;f80f	bf 	. 
	ld sp,049bfh		;f810	31 bf 49 	1 . I 
	cp a			;f813	bf 	. 
	and h			;f814	a4 	. 
	cp a			;f815	bf 	. 
	sub c			;f816	91 	. 
	cp a			;f817	bf 	. 
	sub (hl)			;f818	96 	. 
	cp a			;f819	bf 	. 
	sbc a,a			;f81a	9f 	. 
	cp a			;f81b	bf 	. 
	add hl,hl			;f81c	29 	) 
	cp a			;f81d	bf 	. 
	ret po			;f81e	e0 	. 
	cp (hl)			;f81f	be 	. 
	inc b			;f820	04 	. 
	cp h			;f821	bc 	. 
	inc bc			;f822	03 	. 
	cp l			;f823	bd 	. 
	adc a,c			;f824	89 	. 
	cp l			;f825	bd 	. 
	ld h,e			;f826	63 	c 
	cp l			;f827	bd 	. 
	or 0bch		;f828	f6 bc 	. . 
	cp 0bch		;f82a	fe bc 	. . 
	jp 0cbbch		;f82c	c3 bc cb 	. . . 
	cp h			;f82f	bc 	. 
	out (0bch),a		;f830	d3 bc 	. . 
	sbc a,0bch		;f832	de bc 	. . 
	jp z,0d1beh		;f834	ca be d1 	. . . 
	cp (hl)			;f837	be 	. 
	xor 0bch		;f838	ee bc 	. . 
	dec l			;f83a	2d 	- 
	cp l			;f83b	bd 	. 
	dec l			;f83c	2d 	- 
	cp a			;f83d	bf 	. 
	inc hl			;f83e	23 	# 
	cp l			;f83f	bd 	. 
	and 0bch		;f840	e6 bc 	. . 
	dec h			;f842	25 	% 
	cp a			;f843	bf 	. 
	cp e			;f844	bb 	. 
	cp (hl)			;f845	be 	. 
	cp a			;f846	bf 	. 
	cp (hl)			;f847	be 	. 
	jp 034beh		;f848	c3 be 34 	. . 4 
	cp (hl)			;f84b	be 	. 
	ld b,b			;f84c	40 	@ 
	cp (hl)			;f84d	be 	. 
	rst 20h			;f84e	e7 	. 
	cp l			;f84f	bd 	. 
	ld e,h			;f850	5c 	\ 
	cp h			;f851	bc 	. 
	ld a,l			;f852	7d 	} 
	cp h			;f853	bc 	. 
	ld d,b			;f854	50 	P 
	cp h			;f855	bc 	. 
	inc a			;f856	3c 	< 
	cp h			;f857	bc 	. 
	scf			;f858	37 	7 
	cp h			;f859	bc 	. 
	ld (087bch),a		;f85a	32 bc 87 	2 . . 
	cp h			;f85d	bc 	. 
	rra			;f85e	1f 	. 
	cp h			;f85f	bc 	. 
	rst 30h			;f860	f7 	. 
	cp e			;f861	bb 	. 
	jp p,0e7bbh		;f862	f2 bb e7 	. . . 
	cp e			;f865	bb 	. 
	out (0bbh),a		;f866	d3 bb 	. . 
	and c			;f868	a1 	. 
	cp (hl)			;f869	be 	. 
	add hl,bc			;f86a	09 	. 
	cp h			;f86b	bc 	. 
	ld c,0bch		;f86c	0e bc 	. . 
	inc de			;f86e	13 	. 
	cp h			;f86f	bc 	. 
	inc h			;f870	24 	$ 
	cp (hl)			;f871	be 	. 
	rra			;f872	1f 	. 
	cp (hl)			;f873	be 	. 
	cp e			;f874	bb 	. 
	cp l			;f875	bd 	. 
	and (hl)			;f876	a6 	. 
	cp (hl)			;f877	be 	. 
	rst 38h			;f878	ff 	. 
	cp e			;f879	bb 	. 
	ld e,b			;f87a	58 	X 
	cp e			;f87b	bb 	. 
	ld a,(de)			;f87c	1a 	. 
	cp h			;f87d	bc 	. 
	add a,d			;f87e	82 	. 
	cp h			;f87f	bc 	. 
	dec d			;f880	15 	. 
	cp (hl)			;f881	be 	. 
	ld (hl),d			;f882	72 	r 
	cp h			;f883	bc 	. 
	ld l,b			;f884	68 	h 
	cp h			;f885	bc 	. 
	ld l,l			;f886	6d 	m 
	cp h			;f887	bc 	. 
	sbc a,e			;f888	9b 	. 
	cp a			;f889	bf 	. 
	inc b			;f88a	04 	. 
	cp a			;f88b	bf 	. 
	ld c,e			;f88c	4b 	K 
	cp (hl)			;f88d	be 	. 
	ld l,h			;f88e	6c 	l 
	cp (hl)			;f88f	be 	. 
	ld e,l			;f890	5d 	] 
	cp (hl)			;f891	be 	. 
	add a,a			;f892	87 	. 
	cp (hl)			;f893	be 	. 
	ld (hl),e			;f894	73 	s 
	cp (hl)			;f895	be 	. 
	sub d			;f896	92 	. 
	cp (hl)			;f897	be 	. 
	sub a			;f898	97 	. 
	cp (hl)			;f899	be 	. 
	djnz $-64		;f89a	10 be 	. . 
	add hl,hl			;f89c	29 	) 
	cp (hl)			;f89d	be 	. 
	dec bc			;f89e	0b 	. 
	cp (hl)			;f89f	be 	. 
	ld b,0beh		;f8a0	06 be 	. . 
	ld bc,0fcbeh		;f8a2	01 be fc 	. . . 
	cp l			;f8a5	bd 	. 
	rst 30h			;f8a6	f7 	. 
	cp l			;f8a7	bd 	. 
	adc a,0bbh		;f8a8	ce bb 	. . 
	ld d,e			;f8aa	53 	S 
	cp e			;f8ab	bb 	. 
	ret			;f8ac	c9 	. 
	cp e			;f8ad	bb 	. 
	add a,h			;f8ae	84 	. 
	cp l			;f8af	bd 	. 
	call nz,0bfbbh		;f8b0	c4 bb bf 	. . . 
	cp e			;f8b3	bb 	. 
	ld a,a			;f8b4	7f 	 
	cp l			;f8b5	bd 	. 
	cp d			;f8b6	ba 	. 
	cp e			;f8b7	bb 	. 
	or l			;f8b8	b5 	. 
	cp e			;f8b9	bb 	. 
	sbc a,h			;f8ba	9c 	. 
	cp (hl)			;f8bb	be 	. 
	or b			;f8bc	b0 	. 
	cp e			;f8bd	bb 	. 
	ld c,(hl)			;f8be	4e 	N 
	cp e			;f8bf	bb 	. 
	xor e			;f8c0	ab 	. 
	cp e			;f8c1	bb 	. 
	jp p,092bdh		;f8c2	f2 bd 92 	. . . 
	cp e			;f8c5	bb 	. 
	sub a			;f8c6	97 	. 
	cp e			;f8c7	bb 	. 
	adc a,l			;f8c8	8d 	. 
	cp e			;f8c9	bb 	. 
	adc a,b			;f8ca	88 	. 
	cp e			;f8cb	bb 	. 
	ld (hl),a			;f8cc	77 	w 
	cp e			;f8cd	bb 	. 
	dec l			;f8ce	2d 	- 
	cp h			;f8cf	bc 	. 
	jr c,$-65		;f8d0	38 bd 	8 . 
	sbc a,a			;f8d2	9f 	. 
	cp l			;f8d3	bd 	. 
	xor d			;f8d4	aa 	. 
	cp l			;f8d5	bd 	. 
	ld b,(hl)			;f8d6	46 	F 
	cp h			;f8d7	bc 	. 
	and (hl)			;f8d8	a6 	. 
	cp h			;f8d9	bc 	. 
	sbc a,(hl)			;f8da	9e 	. 
	cp h			;f8db	bc 	. 
	nop			;f8dc	00 	. 
	nop			;f8dd	00 	. 
	nop			;f8de	00 	. 
	nop			;f8df	00 	. 
	nop			;f8e0	00 	. 
	nop			;f8e1	00 	. 
	ld (0689bh),hl		;f8e2	22 9b 68 	" . h 
	sbc a,e			;f8e5	9b 	. 
	xor b			;f8e6	a8 	. 
	sbc a,e			;f8e7	9b 	. 
	exx			;f8e8	d9 	. 
	sbc a,l			;f8e9	9d 	. 
	nop			;f8ea	00 	. 
	nop			;f8eb	00 	. 
	nop			;f8ec	00 	. 
	nop			;f8ed	00 	. 
	nop			;f8ee	00 	. 
	nop			;f8ef	00 	. 
	nop			;f8f0	00 	. 
	nop			;f8f1	00 	. 
	nop			;f8f2	00 	. 
	nop			;f8f3	00 	. 
	nop			;f8f4	00 	. 
	nop			;f8f5	00 	. 
	nop			;f8f6	00 	. 
	nop			;f8f7	00 	. 
	nop			;f8f8	00 	. 
	nop			;f8f9	00 	. 
	nop			;f8fa	00 	. 
	ld bc,00000h		;f8fb	01 00 00 	. . . 
	nop			;f8fe	00 	. 
	nop			;f8ff	00 	. 
	nop			;f900	00 	. 
	nop			;f901	00 	. 
	nop			;f902	00 	. 
	nop			;f903	00 	. 
	nop			;f904	00 	. 
	nop			;f905	00 	. 
	nop			;f906	00 	. 
	nop			;f907	00 	. 
	nop			;f908	00 	. 
	nop			;f909	00 	. 
	nop			;f90a	00 	. 
	nop			;f90b	00 	. 
	nop			;f90c	00 	. 
	nop			;f90d	00 	. 
	nop			;f90e	00 	. 
	nop			;f90f	00 	. 
	nop			;f910	00 	. 
	nop			;f911	00 	. 
	nop			;f912	00 	. 
	nop			;f913	00 	. 
	nop			;f914	00 	. 
	nop			;f915	00 	. 
	nop			;f916	00 	. 
	nop			;f917	00 	. 
	nop			;f918	00 	. 
	nop			;f919	00 	. 
	nop			;f91a	00 	. 
	nop			;f91b	00 	. 
	nop			;f91c	00 	. 
	nop			;f91d	00 	. 
	nop			;f91e	00 	. 
	nop			;f91f	00 	. 
	nop			;f920	00 	. 
	nop			;f921	00 	. 
	nop			;f922	00 	. 
	nop			;f923	00 	. 
	nop			;f924	00 	. 
	nop			;f925	00 	. 
	nop			;f926	00 	. 
	nop			;f927	00 	. 
	nop			;f928	00 	. 
	nop			;f929	00 	. 
	nop			;f92a	00 	. 
	nop			;f92b	00 	. 
	nop			;f92c	00 	. 
	nop			;f92d	00 	. 
	nop			;f92e	00 	. 
	nop			;f92f	00 	. 
	nop			;f930	00 	. 
	nop			;f931	00 	. 
	nop			;f932	00 	. 
	nop			;f933	00 	. 
	nop			;f934	00 	. 
	nop			;f935	00 	. 
	nop			;f936	00 	. 
	nop			;f937	00 	. 
	nop			;f938	00 	. 
	nop			;f939	00 	. 
	nop			;f93a	00 	. 
	nop			;f93b	00 	. 
	nop			;f93c	00 	. 
	nop			;f93d	00 	. 
	nop			;f93e	00 	. 
	nop			;f93f	00 	. 
	nop			;f940	00 	. 
	nop			;f941	00 	. 
	nop			;f942	00 	. 
	nop			;f943	00 	. 
	nop			;f944	00 	. 
	nop			;f945	00 	. 
	nop			;f946	00 	. 
	nop			;f947	00 	. 
	nop			;f948	00 	. 
	nop			;f949	00 	. 
	nop			;f94a	00 	. 
	nop			;f94b	00 	. 
	nop			;f94c	00 	. 
	nop			;f94d	00 	. 
	nop			;f94e	00 	. 
	nop			;f94f	00 	. 
	nop			;f950	00 	. 
	nop			;f951	00 	. 
	nop			;f952	00 	. 
	nop			;f953	00 	. 
	nop			;f954	00 	. 
	nop			;f955	00 	. 
	nop			;f956	00 	. 
	nop			;f957	00 	. 
	nop			;f958	00 	. 
	nop			;f959	00 	. 
	nop			;f95a	00 	. 
	nop			;f95b	00 	. 
	nop			;f95c	00 	. 
	nop			;f95d	00 	. 
	nop			;f95e	00 	. 
	nop			;f95f	00 	. 
	nop			;f960	00 	. 
	nop			;f961	00 	. 
	nop			;f962	00 	. 
	nop			;f963	00 	. 
	nop			;f964	00 	. 
	nop			;f965	00 	. 
	nop			;f966	00 	. 
	nop			;f967	00 	. 
	nop			;f968	00 	. 
	nop			;f969	00 	. 
	nop			;f96a	00 	. 
	nop			;f96b	00 	. 
	nop			;f96c	00 	. 
	nop			;f96d	00 	. 
	nop			;f96e	00 	. 
	nop			;f96f	00 	. 
	nop			;f970	00 	. 
	nop			;f971	00 	. 
	nop			;f972	00 	. 
	nop			;f973	00 	. 
	nop			;f974	00 	. 
	nop			;f975	00 	. 
	nop			;f976	00 	. 
	nop			;f977	00 	. 
	nop			;f978	00 	. 
	nop			;f979	00 	. 
	nop			;f97a	00 	. 
	nop			;f97b	00 	. 
	nop			;f97c	00 	. 
	nop			;f97d	00 	. 
	nop			;f97e	00 	. 
	nop			;f97f	00 	. 
	nop			;f980	00 	. 
	nop			;f981	00 	. 
	nop			;f982	00 	. 
	nop			;f983	00 	. 
	nop			;f984	00 	. 
	nop			;f985	00 	. 
	nop			;f986	00 	. 
	nop			;f987	00 	. 
	nop			;f988	00 	. 
	nop			;f989	00 	. 
	nop			;f98a	00 	. 
	nop			;f98b	00 	. 
	nop			;f98c	00 	. 
	nop			;f98d	00 	. 
	nop			;f98e	00 	. 
	nop			;f98f	00 	. 
	nop			;f990	00 	. 
	nop			;f991	00 	. 
	nop			;f992	00 	. 
	nop			;f993	00 	. 
	nop			;f994	00 	. 
	nop			;f995	00 	. 
	nop			;f996	00 	. 
	nop			;f997	00 	. 
	nop			;f998	00 	. 
	nop			;f999	00 	. 
	nop			;f99a	00 	. 
	nop			;f99b	00 	. 
	nop			;f99c	00 	. 
	nop			;f99d	00 	. 
	nop			;f99e	00 	. 
	nop			;f99f	00 	. 
	nop			;f9a0	00 	. 
	nop			;f9a1	00 	. 
	nop			;f9a2	00 	. 
	nop			;f9a3	00 	. 
	nop			;f9a4	00 	. 
	nop			;f9a5	00 	. 
	nop			;f9a6	00 	. 
	nop			;f9a7	00 	. 
	nop			;f9a8	00 	. 
	nop			;f9a9	00 	. 
	nop			;f9aa	00 	. 
	nop			;f9ab	00 	. 
	nop			;f9ac	00 	. 
	nop			;f9ad	00 	. 
	nop			;f9ae	00 	. 
	nop			;f9af	00 	. 
	nop			;f9b0	00 	. 
	nop			;f9b1	00 	. 
	nop			;f9b2	00 	. 
	nop			;f9b3	00 	. 
	nop			;f9b4	00 	. 
	nop			;f9b5	00 	. 
	nop			;f9b6	00 	. 
	nop			;f9b7	00 	. 
	nop			;f9b8	00 	. 
	nop			;f9b9	00 	. 
	nop			;f9ba	00 	. 
	nop			;f9bb	00 	. 
	nop			;f9bc	00 	. 
	nop			;f9bd	00 	. 
	nop			;f9be	00 	. 
	nop			;f9bf	00 	. 
	nop			;f9c0	00 	. 
	nop			;f9c1	00 	. 
	nop			;f9c2	00 	. 
	nop			;f9c3	00 	. 
	nop			;f9c4	00 	. 
	nop			;f9c5	00 	. 
	nop			;f9c6	00 	. 
	nop			;f9c7	00 	. 
	nop			;f9c8	00 	. 
	nop			;f9c9	00 	. 
	nop			;f9ca	00 	. 
	nop			;f9cb	00 	. 
	nop			;f9cc	00 	. 
	nop			;f9cd	00 	. 
	nop			;f9ce	00 	. 
	nop			;f9cf	00 	. 
	nop			;f9d0	00 	. 
	nop			;f9d1	00 	. 
	nop			;f9d2	00 	. 
	nop			;f9d3	00 	. 
	nop			;f9d4	00 	. 
	nop			;f9d5	00 	. 
	nop			;f9d6	00 	. 
	nop			;f9d7	00 	. 
	nop			;f9d8	00 	. 
	nop			;f9d9	00 	. 
	nop			;f9da	00 	. 
	nop			;f9db	00 	. 
	nop			;f9dc	00 	. 
	nop			;f9dd	00 	. 
	nop			;f9de	00 	. 
	nop			;f9df	00 	. 
	nop			;f9e0	00 	. 
	nop			;f9e1	00 	. 
	nop			;f9e2	00 	. 
	nop			;f9e3	00 	. 
	nop			;f9e4	00 	. 
	nop			;f9e5	00 	. 
	nop			;f9e6	00 	. 
	nop			;f9e7	00 	. 
	nop			;f9e8	00 	. 
	nop			;f9e9	00 	. 
	nop			;f9ea	00 	. 
	nop			;f9eb	00 	. 
	nop			;f9ec	00 	. 
	nop			;f9ed	00 	. 
	nop			;f9ee	00 	. 
	nop			;f9ef	00 	. 
	nop			;f9f0	00 	. 
	nop			;f9f1	00 	. 
	nop			;f9f2	00 	. 
	nop			;f9f3	00 	. 
	nop			;f9f4	00 	. 
	nop			;f9f5	00 	. 
	nop			;f9f6	00 	. 
	nop			;f9f7	00 	. 
	nop			;f9f8	00 	. 
	nop			;f9f9	00 	. 
	nop			;f9fa	00 	. 
	nop			;f9fb	00 	. 
	nop			;f9fc	00 	. 
	nop			;f9fd	00 	. 
	nop			;f9fe	00 	. 
	nop			;f9ff	00 	. 
	nop			;fa00	00 	. 
	nop			;fa01	00 	. 
	nop			;fa02	00 	. 
	nop			;fa03	00 	. 
	nop			;fa04	00 	. 
	nop			;fa05	00 	. 
	nop			;fa06	00 	. 
	nop			;fa07	00 	. 
	nop			;fa08	00 	. 
	nop			;fa09	00 	. 
	nop			;fa0a	00 	. 
	nop			;fa0b	00 	. 
	nop			;fa0c	00 	. 
	nop			;fa0d	00 	. 
	nop			;fa0e	00 	. 
	nop			;fa0f	00 	. 
	nop			;fa10	00 	. 
	nop			;fa11	00 	. 
	nop			;fa12	00 	. 
	nop			;fa13	00 	. 
	nop			;fa14	00 	. 
	nop			;fa15	00 	. 
	nop			;fa16	00 	. 
	nop			;fa17	00 	. 
	nop			;fa18	00 	. 
	nop			;fa19	00 	. 
	nop			;fa1a	00 	. 
	nop			;fa1b	00 	. 
	nop			;fa1c	00 	. 
	nop			;fa1d	00 	. 
	nop			;fa1e	00 	. 
	nop			;fa1f	00 	. 
	nop			;fa20	00 	. 
	nop			;fa21	00 	. 
	nop			;fa22	00 	. 
	nop			;fa23	00 	. 
	nop			;fa24	00 	. 
	nop			;fa25	00 	. 
	nop			;fa26	00 	. 
	nop			;fa27	00 	. 
	nop			;fa28	00 	. 
	nop			;fa29	00 	. 
	nop			;fa2a	00 	. 
	nop			;fa2b	00 	. 
	nop			;fa2c	00 	. 
	nop			;fa2d	00 	. 
	nop			;fa2e	00 	. 
	nop			;fa2f	00 	. 
	nop			;fa30	00 	. 
	nop			;fa31	00 	. 
	nop			;fa32	00 	. 
	nop			;fa33	00 	. 
	nop			;fa34	00 	. 
	nop			;fa35	00 	. 
	nop			;fa36	00 	. 
	nop			;fa37	00 	. 
	nop			;fa38	00 	. 
	nop			;fa39	00 	. 
	nop			;fa3a	00 	. 
	nop			;fa3b	00 	. 
	nop			;fa3c	00 	. 
	nop			;fa3d	00 	. 
	nop			;fa3e	00 	. 
	nop			;fa3f	00 	. 
	nop			;fa40	00 	. 
	nop			;fa41	00 	. 
	nop			;fa42	00 	. 
	nop			;fa43	00 	. 
	nop			;fa44	00 	. 
	nop			;fa45	00 	. 
	nop			;fa46	00 	. 
	nop			;fa47	00 	. 
	nop			;fa48	00 	. 
	nop			;fa49	00 	. 
	nop			;fa4a	00 	. 
	nop			;fa4b	00 	. 
	nop			;fa4c	00 	. 
	nop			;fa4d	00 	. 
	nop			;fa4e	00 	. 
	nop			;fa4f	00 	. 
	nop			;fa50	00 	. 
	nop			;fa51	00 	. 
	nop			;fa52	00 	. 
	nop			;fa53	00 	. 
	nop			;fa54	00 	. 
	nop			;fa55	00 	. 
	nop			;fa56	00 	. 
	nop			;fa57	00 	. 
	nop			;fa58	00 	. 
	nop			;fa59	00 	. 
	nop			;fa5a	00 	. 
	nop			;fa5b	00 	. 
	nop			;fa5c	00 	. 
	nop			;fa5d	00 	. 
	nop			;fa5e	00 	. 
	nop			;fa5f	00 	. 
	nop			;fa60	00 	. 
	nop			;fa61	00 	. 
	nop			;fa62	00 	. 
	nop			;fa63	00 	. 
	nop			;fa64	00 	. 
	nop			;fa65	00 	. 
	nop			;fa66	00 	. 
	nop			;fa67	00 	. 
	nop			;fa68	00 	. 
	nop			;fa69	00 	. 
	nop			;fa6a	00 	. 
	nop			;fa6b	00 	. 
	nop			;fa6c	00 	. 
	nop			;fa6d	00 	. 
	nop			;fa6e	00 	. 
	nop			;fa6f	00 	. 
	nop			;fa70	00 	. 
	nop			;fa71	00 	. 
	nop			;fa72	00 	. 
	nop			;fa73	00 	. 
	nop			;fa74	00 	. 
	nop			;fa75	00 	. 
	nop			;fa76	00 	. 
	nop			;fa77	00 	. 
	nop			;fa78	00 	. 
	nop			;fa79	00 	. 
	nop			;fa7a	00 	. 
	nop			;fa7b	00 	. 
	nop			;fa7c	00 	. 
	nop			;fa7d	00 	. 
	nop			;fa7e	00 	. 
	nop			;fa7f	00 	. 
	nop			;fa80	00 	. 
	nop			;fa81	00 	. 
	nop			;fa82	00 	. 
	nop			;fa83	00 	. 
	nop			;fa84	00 	. 
	nop			;fa85	00 	. 
	nop			;fa86	00 	. 
	nop			;fa87	00 	. 
	nop			;fa88	00 	. 
	nop			;fa89	00 	. 
	nop			;fa8a	00 	. 
	nop			;fa8b	00 	. 
	nop			;fa8c	00 	. 
	nop			;fa8d	00 	. 
	nop			;fa8e	00 	. 
	nop			;fa8f	00 	. 
	nop			;fa90	00 	. 
	nop			;fa91	00 	. 
	nop			;fa92	00 	. 
	nop			;fa93	00 	. 
	nop			;fa94	00 	. 
	nop			;fa95	00 	. 
	nop			;fa96	00 	. 
	nop			;fa97	00 	. 
	nop			;fa98	00 	. 
	nop			;fa99	00 	. 
	nop			;fa9a	00 	. 
	nop			;fa9b	00 	. 
	nop			;fa9c	00 	. 
	nop			;fa9d	00 	. 
	nop			;fa9e	00 	. 
	nop			;fa9f	00 	. 
	nop			;faa0	00 	. 
	nop			;faa1	00 	. 
	nop			;faa2	00 	. 
	nop			;faa3	00 	. 
	nop			;faa4	00 	. 
	nop			;faa5	00 	. 
	nop			;faa6	00 	. 
	nop			;faa7	00 	. 
	nop			;faa8	00 	. 
	nop			;faa9	00 	. 
	nop			;faaa	00 	. 
	nop			;faab	00 	. 
	nop			;faac	00 	. 
	nop			;faad	00 	. 
	nop			;faae	00 	. 
	nop			;faaf	00 	. 
	nop			;fab0	00 	. 
	nop			;fab1	00 	. 
	nop			;fab2	00 	. 
	nop			;fab3	00 	. 
	nop			;fab4	00 	. 
	nop			;fab5	00 	. 
	nop			;fab6	00 	. 
	nop			;fab7	00 	. 
	nop			;fab8	00 	. 
	nop			;fab9	00 	. 
	nop			;faba	00 	. 
	nop			;fabb	00 	. 
	nop			;fabc	00 	. 
	nop			;fabd	00 	. 
	nop			;fabe	00 	. 
	nop			;fabf	00 	. 
	nop			;fac0	00 	. 
	nop			;fac1	00 	. 
	nop			;fac2	00 	. 
	nop			;fac3	00 	. 
	nop			;fac4	00 	. 
	nop			;fac5	00 	. 
	nop			;fac6	00 	. 
	nop			;fac7	00 	. 
	nop			;fac8	00 	. 
	nop			;fac9	00 	. 
	nop			;faca	00 	. 
	nop			;facb	00 	. 
	nop			;facc	00 	. 
	nop			;facd	00 	. 
	nop			;face	00 	. 
	nop			;facf	00 	. 
	nop			;fad0	00 	. 
	nop			;fad1	00 	. 
	nop			;fad2	00 	. 
	nop			;fad3	00 	. 
	nop			;fad4	00 	. 
	nop			;fad5	00 	. 
	nop			;fad6	00 	. 
	nop			;fad7	00 	. 
	nop			;fad8	00 	. 
	nop			;fad9	00 	. 
	nop			;fada	00 	. 
	nop			;fadb	00 	. 
	nop			;fadc	00 	. 
	nop			;fadd	00 	. 
	nop			;fade	00 	. 
	nop			;fadf	00 	. 
	nop			;fae0	00 	. 
	nop			;fae1	00 	. 
	nop			;fae2	00 	. 
	nop			;fae3	00 	. 
	nop			;fae4	00 	. 
	nop			;fae5	00 	. 
	nop			;fae6	00 	. 
	nop			;fae7	00 	. 
	nop			;fae8	00 	. 
	nop			;fae9	00 	. 
	nop			;faea	00 	. 
	nop			;faeb	00 	. 
	nop			;faec	00 	. 
	nop			;faed	00 	. 
	nop			;faee	00 	. 
	nop			;faef	00 	. 
	nop			;faf0	00 	. 
	nop			;faf1	00 	. 
	nop			;faf2	00 	. 
	nop			;faf3	00 	. 
	nop			;faf4	00 	. 
	nop			;faf5	00 	. 
	nop			;faf6	00 	. 
	nop			;faf7	00 	. 
	nop			;faf8	00 	. 
	nop			;faf9	00 	. 
	nop			;fafa	00 	. 
	nop			;fafb	00 	. 
	nop			;fafc	00 	. 
	nop			;fafd	00 	. 
	nop			;fafe	00 	. 
	nop			;faff	00 	. 
	ld b,b			;fb00	40 	@ 
	ld c,b			;fb01	48 	H 
	ld d,b			;fb02	50 	P 
	nop			;fb03	00 	. 
	nop			;fb04	00 	. 
	nop			;fb05	00 	. 
	dec b			;fb06	05 	. 
	nop			;fb07	00 	. 
	nop			;fb08	00 	. 
	inc bc			;fb09	03 	. 
	add hl,sp			;fb0a	39 	9 
	add hl,sp			;fb0b	39 	9 
	add hl,sp			;fb0c	39 	9 
	ld bc,00000h		;fb0d	01 00 00 	. . . 
	di			;fb10	f3 	. 
	ld hl,0ff45h		;fb11	21 45 ff 	! E . 
	call 0fd98h		;fb14	cd 98 fd 	. . . 
	ld (0fd4dh),a		;fb17	32 4d fd 	2 M . 
	ld b,004h		;fb1a	06 04 	. . 
	ld c,000h		;fb1c	0e 00 	. . 
	exx			;fb1e	d9 	. 
	ld hl,0fd34h		;fb1f	21 34 fd 	! 4 . 
	ld (0fff5h),hl		;fb22	22 f5 ff 	" . . 
	ld a,0c3h		;fb25	3e c3 	> . 
	ld (0fff4h),a		;fb27	32 f4 ff 	2 . . 
	ld a,018h		;fb2a	3e 18 	> . 
	ld (0ffffh),a		;fb2c	32 ff ff 	2 . . 
	ld a,03bh		;fb2f	3e 3b 	> ; 
	ld i,a		;fb31	ed 47 	. G 
	im 2		;fb33	ed 5e 	. ^ 
	call 0fb3ah		;fb35	cd 3a fb 	. : . 
	di			;fb38	f3 	. 
	ret			;fb39	c9 	. 
	ld hl,0ff0eh		;fb3a	21 0e ff 	! . . 
	ld (0fd43h),sp		;fb3d	ed 73 43 fd 	. s C . 
	jr $+5		;fb41	18 03 	. . 
	ld hl,0fe5eh		;fb43	21 5e fe 	! ^ . 
	ld a,(hl)			;fb46	7e 	~ 
	inc hl			;fb47	23 	# 
	or a			;fb48	b7 	. 
	jp p,0fbc1h		;fb49	f2 c1 fb 	. . . 
	and 07fh		;fb4c	e6 7f 	.  
	jp z,0fd42h		;fb4e	ca 42 fd 	. B . 
	dec a			;fb51	3d 	= 
	jr nz,$+10		;fb52	20 08 	  . 
	ld e,(hl)			;fb54	5e 	^ 
	inc hl			;fb55	23 	# 
	ld d,(hl)			;fb56	56 	V 
	inc hl			;fb57	23 	# 
	push hl			;fb58	e5 	. 
	ex de,hl			;fb59	eb 	. 
	jr $-20		;fb5a	18 ea 	. . 
	dec a			;fb5c	3d 	= 
	jr nz,$+5		;fb5d	20 03 	  . 
	pop hl			;fb5f	e1 	. 
	jr $-26		;fb60	18 e4 	. . 
	dec a			;fb62	3d 	= 
	jr nz,$+23		;fb63	20 15 	  . 
	ld e,(hl)			;fb65	5e 	^ 
	inc hl			;fb66	23 	# 
	ld d,(hl)			;fb67	56 	V 
	inc hl			;fb68	23 	# 
	ld b,(hl)			;fb69	46 	F 
	inc hl			;fb6a	23 	# 
	ld a,000h		;fb6b	3e 00 	> . 
	or a			;fb6d	b7 	. 
	jr nz,$+3		;fb6e	20 01 	  . 
	ld a,b			;fb70	78 	x 
	dec a			;fb71	3d 	= 
	ld (0fb6ch),a		;fb72	32 6c fb 	2 l . 
	jr z,$-47		;fb75	28 cf 	( . 
	ex de,hl			;fb77	eb 	. 
	jr $-50		;fb78	18 cc 	. . 
	dec a			;fb7a	3d 	= 
	jr nz,$+9		;fb7b	20 07 	  . 
	ld a,(hl)			;fb7d	7e 	~ 
	inc hl			;fb7e	23 	# 
	ld (0fdcfh),a		;fb7f	32 cf fd 	2 . . 
	jr $-60		;fb82	18 c2 	. . 
	dec a			;fb84	3d 	= 
	jr nz,$+27		;fb85	20 19 	  . 
	ld b,001h		;fb87	06 01 	. . 
	ld a,(hl)			;fb89	7e 	~ 
	inc hl			;fb8a	23 	# 
	or a			;fb8b	b7 	. 
	jr z,$+15		;fb8c	28 0d 	( . 
	add a,03ch		;fb8e	c6 3c 	. < 
	ld e,a			;fb90	5f 	_ 
	ld d,0feh		;fb91	16 fe 	. . 
	jr nc,$+3		;fb93	30 01 	0 . 
	inc d			;fb95	14 	. 
	ld (0fe06h),de		;fb96	ed 53 06 fe 	. S . . 
	ld a,b			;fb9a	78 	x 
	ld (0fbd8h),a		;fb9b	32 d8 fb 	2 . . 
	jr $-88		;fb9e	18 a6 	. . 
	dec a			;fba0	3d 	= 
	jr nz,$+6		;fba1	20 04 	  . 
	ld b,002h		;fba3	06 02 	. . 
	jr $-28		;fba5	18 e2 	. . 
	ld a,(hl)			;fba7	7e 	~ 
	inc hl			;fba8	23 	# 
	add a,03ch		;fba9	c6 3c 	. < 
	ld e,a			;fbab	5f 	_ 
	ld d,0feh		;fbac	16 fe 	. . 
	jr nc,$+3		;fbae	30 01 	0 . 
	inc d			;fbb0	14 	. 
	ld a,(de)			;fbb1	1a 	. 
	ld (0fc50h),a		;fbb2	32 50 fc 	2 P . 
	inc de			;fbb5	13 	. 
	ld a,(de)			;fbb6	1a 	. 
	ld (0fc78h),a		;fbb7	32 78 fc 	2 x . 
	inc de			;fbba	13 	. 
	ld a,(de)			;fbbb	1a 	. 
	ld (0fc69h),a		;fbbc	32 69 fc 	2 i . 
	jr $-121		;fbbf	18 85 	. . 
	ld (0fdbdh),a		;fbc1	32 bd fd 	2 . . 
	ld a,(hl)			;fbc4	7e 	~ 
	inc hl			;fbc5	23 	# 
	ld (0fb44h),hl		;fbc6	22 44 fb 	" D . 
	ld c,a			;fbc9	4f 	O 
	and 0f8h		;fbca	e6 f8 	. . 
	ld (0fc25h),a		;fbcc	32 25 fc 	2 % . 
	ld a,c			;fbcf	79 	y 
	call 0fdc8h		;fbd0	cd c8 fd 	. . . 
	jp z,0fd30h		;fbd3	ca 30 fd 	. 0 . 
	ex af,af'			;fbd6	08 	. 
	ld a,001h		;fbd7	3e 01 	> . 
	rra			;fbd9	1f 	. 
	jr nc,$+56		;fbda	30 36 	0 6 
	ld a,014h		;fbdc	3e 14 	> . 
	ld (0fd0bh),a		;fbde	32 0b fd 	2 . . 
	call 0fe04h		;fbe1	cd 04 fe 	. . . 
	ld c,a			;fbe4	4f 	O 
	ld b,000h		;fbe5	06 00 	. . 
	or a			;fbe7	b7 	. 
	sbc hl,bc		;fbe8	ed 42 	. B 
	ld (0fcf2h),hl		;fbea	22 f2 fc 	" . . 
	add hl,bc			;fbed	09 	. 
	add hl,bc			;fbee	09 	. 
	ld (0fce6h),hl		;fbef	22 e6 fc 	" . . 
	sbc hl,bc		;fbf2	ed 42 	. B 
	inc de			;fbf4	13 	. 
	ld a,(de)			;fbf5	1a 	. 
	or a			;fbf6	b7 	. 
	jr z,$+82		;fbf7	28 50 	( P 
	ld b,a			;fbf9	47 	G 
	ex af,af'			;fbfa	08 	. 
	sub b			;fbfb	90 	. 
	jr nc,$+6		;fbfc	30 04 	0 . 
	add a,b			;fbfe	80 	. 
	ex af,af'			;fbff	08 	. 
	jr $+73		;fc00	18 47 	. G 
	jr z,$-4		;fc02	28 fa 	( . 
	ld c,a			;fc04	4f 	O 
	ld a,b			;fc05	78 	x 
	ex af,af'			;fc06	08 	. 
	ld a,c			;fc07	79 	y 
	ld (0fda7h),a		;fc08	32 a7 fd 	2 . . 
	ld a,018h		;fc0b	3e 18 	> . 
	ld (0fcd9h),a		;fc0d	32 d9 fc 	2 . . 
	jr $+57		;fc10	18 37 	. 7 
	rra			;fc12	1f 	. 
	jr nc,$+34		;fc13	30 20 	0   
	xor a			;fc15	af 	. 
	ld (0fd0bh),a		;fc16	32 0b fd 	2 . . 
	call 0fe04h		;fc19	cd 04 fe 	. . . 
	push de			;fc1c	d5 	. 
	push hl			;fc1d	e5 	. 
	bit 7,b		;fc1e	cb 78 	. x 
	jr nz,$+4		;fc20	20 02 	  . 
	neg		;fc22	ed 44 	. D 
	add a,058h		;fc24	c6 58 	. X 
	ld a,090h		;fc26	3e 90 	> . 
	call 0fdc8h		;fc28	cd c8 fd 	. . . 
	ld (0fcf2h),hl		;fc2b	22 f2 fc 	" . . 
	ld (0fce6h),hl		;fc2e	22 e6 fc 	" . . 
	pop hl			;fc31	e1 	. 
	pop de			;fc32	d1 	. 
	jr $-63		;fc33	18 bf 	. . 
	ld (0fce6h),hl		;fc35	22 e6 fc 	" . . 
	ld (0fcf2h),hl		;fc38	22 f2 fc 	" . . 
	ld de,00000h		;fc3b	11 00 00 	. . . 
	ld (0fcdch),de		;fc3e	ed 53 dc fc 	. S . . 
	xor a			;fc42	af 	. 
	ld (0fd0bh),a		;fc43	32 0b fd 	2 . . 
	ld (0fce6h),hl		;fc46	22 e6 fc 	" . . 
	ld (0fccfh),hl		;fc49	22 cf fc 	" . . 
	ld de,00000h		;fc4c	11 00 00 	. . . 
	ld a,002h		;fc4f	3e 02 	> . 
	or a			;fc51	b7 	. 
	jr z,$+18		;fc52	28 10 	( . 
	ld e,l			;fc54	5d 	] 
	ld d,h			;fc55	54 	T 
	ld b,a			;fc56	47 	G 
	dec de			;fc57	1b 	. 
	dec de			;fc58	1b 	. 
	dec b			;fc59	05 	. 
	jr z,$+10		;fc5a	28 08 	( . 
	inc de			;fc5c	13 	. 
	inc de			;fc5d	13 	. 
	srl d		;fc5e	cb 3a 	. : 
	rr e		;fc60	cb 1b 	. . 
	djnz $-4		;fc62	10 fa 	. . 
	ld (0fc6fh),de		;fc64	ed 53 6f fc 	. S o . 
	ld a,000h		;fc68	3e 00 	> . 
	ld (0fc7bh),a		;fc6a	32 7b fc 	2 { . 
	ei			;fc6d	fb 	. 
	ld de,000bah		;fc6e	11 ba 00 	. . . 
	ld a,04ah		;fc71	3e 4a 	> J 
	inc a			;fc73	3c 	< 
	ld (0fc72h),a		;fc74	32 72 fc 	2 r . 
	and 0ffh		;fc77	e6 ff 	. . 
	jr nz,$+3		;fc79	20 01 	  . 
	nop			;fc7b	00 	. 
	ld a,(0fcc6h)		;fc7c	3a c6 fc 	: . . 
	bit 4,a		;fc7f	cb 67 	. g 
	jr z,$+10		;fc81	28 08 	( . 
	add hl,de			;fc83	19 	. 
	nop			;fc84	00 	. 
	nop			;fc85	00 	. 
	nop			;fc86	00 	. 
	nop			;fc87	00 	. 
	nop			;fc88	00 	. 
	jr $+26		;fc89	18 18 	. . 
	or a			;fc8b	b7 	. 
	dec hl			;fc8c	2b 	+ 
	sbc hl,de		;fc8d	ed 52 	. R 
	inc hl			;fc8f	23 	# 
	jr nc,$+19		;fc90	30 11 	0 . 
	ld hl,00001h		;fc92	21 01 00 	! . . 
	ld a,(0fc7bh)		;fc95	3a 7b fc 	: { . 
	xor 008h		;fc98	ee 08 	. . 
	ld (0fc7bh),a		;fc9a	32 7b fc 	2 { . 
	ld (0fca0h),a		;fc9d	32 a0 fc 	2 . . 
	dec de			;fca0	1b 	. 
	jr $+19		;fca1	18 11 	. . 
	nop			;fca3	00 	. 
	nop			;fca4	00 	. 
	nop			;fca5	00 	. 
	nop			;fca6	00 	. 
	nop			;fca7	00 	. 
	nop			;fca8	00 	. 
	nop			;fca9	00 	. 
	nop			;fcaa	00 	. 
	nop			;fcab	00 	. 
	nop			;fcac	00 	. 
	nop			;fcad	00 	. 
	nop			;fcae	00 	. 
	nop			;fcaf	00 	. 
	nop			;fcb0	00 	. 
	nop			;fcb1	00 	. 
	nop			;fcb2	00 	. 
	nop			;fcb3	00 	. 
	ld (0fc6fh),de		;fcb4	ed 53 6f fc 	. S o . 
	inc h			;fcb8	24 	$ 
	srl l		;fcb9	cb 3d 	. = 
	inc l			;fcbb	2c 	, 
	dec l			;fcbc	2d 	- 
	jr nz,$-1		;fcbd	20 fd 	  . 
	ld l,07fh		;fcbf	2e 7f 	.  
	dec h			;fcc1	25 	% 
	jp nz,0fcbch		;fcc2	c2 bc fc 	. . . 
	ld a,010h		;fcc5	3e 10 	> . 
	xor 010h		;fcc7	ee 10 	. . 
	ld (0fcc6h),a		;fcc9	32 c6 fc 	2 . . 
	out (0feh),a		;fccc	d3 fe 	. . 
	ld hl,00174h		;fcce	21 74 01 	! t . 
	ld a,0b7h		;fcd1	3e b7 	> . 
	dec a			;fcd3	3d 	= 
	ld (0fcd2h),a		;fcd4	32 d2 fc 	2 . . 
	and 003h		;fcd7	e6 03 	. . 
	jr $+80		;fcd9	18 4e 	. N 
	ld de,00001h		;fcdb	11 01 00 	. . . 
	add hl,de			;fcde	19 	. 
	bit 7,d		;fcdf	cb 7a 	. z 
	ld e,l			;fce1	5d 	] 
	ld d,h			;fce2	54 	T 
	jr nz,$+14		;fce3	20 0c 	  . 
	ld bc,0017ah		;fce5	01 7a 01 	. z . 
	dec hl			;fce8	2b 	+ 
	or a			;fce9	b7 	. 
	sbc hl,bc		;fcea	ed 42 	. B 
	jr nc,$+27		;fcec	30 19 	0 . 
	jp 0fcfch		;fcee	c3 fc fc 	. . . 
	ld bc,0016eh		;fcf1	01 6e 01 	. n . 
	or a			;fcf4	b7 	. 
	sbc hl,bc		;fcf5	ed 42 	. B 
	jr c,$+16		;fcf7	38 0e 	8 . 
	nop			;fcf9	00 	. 
	nop			;fcfa	00 	. 
	nop			;fcfb	00 	. 
	ld b,007h		;fcfc	06 07 	. . 
	djnz $+0		;fcfe	10 fe 	. . 
	ex de,hl			;fd00	eb 	. 
	ld (0fccfh),hl		;fd01	22 cf fc 	" . . 
	jp 0fc6eh		;fd04	c3 6e fc 	. n . 
	ld hl,00000h		;fd07	21 00 00 	! . . 
	jr $+22		;fd0a	18 14 	. . 
	nop			;fd0c	00 	. 
	nop			;fd0d	00 	. 
	nop			;fd0e	00 	. 
	nop			;fd0f	00 	. 
	nop			;fd10	00 	. 
	nop			;fd11	00 	. 
	nop			;fd12	00 	. 
	nop			;fd13	00 	. 
	nop			;fd14	00 	. 
	nop			;fd15	00 	. 
	nop			;fd16	00 	. 
	nop			;fd17	00 	. 
	nop			;fd18	00 	. 
	ld (0fcdch),hl		;fd19	22 dc fc 	" . . 
	ld l,c			;fd1c	69 	i 
	ld h,b			;fd1d	60 	` 
	jr $-29		;fd1e	18 e1 	. . 
	ld de,(0fcdch)		;fd20	ed 5b dc fc 	. [ . . 
	or a			;fd24	b7 	. 
	sbc hl,de		;fd25	ed 52 	. R 
	jr $-14		;fd27	18 f0 	. . 
	ld b,010h		;fd29	06 10 	. . 
	djnz $+0		;fd2b	10 fe 	. . 
	jp 0fc6eh		;fd2d	c3 6e fc 	. n . 
	ex af,af'			;fd30	08 	. 
	ei			;fd31	fb 	. 
	jr $+0		;fd32	18 fe 	. . 
	ex af,af'			;fd34	08 	. 
	exx			;fd35	d9 	. 
	djnz $+88		;fd36	10 56 	. V 
	push af			;fd38	f5 	. 
	xor a			;fd39	af 	. 
	in a,(0feh)		;fd3a	db fe 	. . 
	cpl			;fd3c	2f 	/ 
	and 01fh		;fd3d	e6 1f 	. . 
	jr z,$+7		;fd3f	28 05 	( . 
	scf			;fd41	37 	7 
	ld sp,0e8e8h		;fd42	31 e8 e8 	1 . . 
	ret			;fd45	c9 	. 
	inc c			;fd46	0c 	. 
	ld a,c			;fd47	79 	y 
	cp 010h		;fd48	fe 10 	. . 
	jr nz,$+13		;fd4a	20 0b 	  . 
	ld a,007h		;fd4c	3e 07 	> . 
	dec a			;fd4e	3d 	= 
	call z,0fd95h		;fd4f	cc 95 fd 	. . . 
	ld (0fd4dh),a		;fd52	32 4d fd 	2 M . 
	xor a			;fd55	af 	. 
	ld c,a			;fd56	4f 	O 
	ld hl,0ff60h		;fd57	21 60 ff 	! ` . 
	call 0fe1dh		;fd5a	cd 1d fe 	. . . 
	or a			;fd5d	b7 	. 
	jr z,$+45		;fd5e	28 2b 	( + 
	ld e,01fh		;fd60	1e 1f 	. . 
	dec a			;fd62	3d 	= 
	jr nz,$+5		;fd63	20 03 	  . 
	ld e,000h		;fd65	1e 00 	. . 
	inc a			;fd67	3c 	< 
	ld (0fd78h),a		;fd68	32 78 fd 	2 x . 
	ld a,e			;fd6b	7b 	{ 
	ld (0fd7ah),a		;fd6c	32 7a fd 	2 z . 
	ld e,014h		;fd6f	1e 14 	. . 
	ld hl,01000h		;fd71	21 00 10 	! . . 
	ld d,000h		;fd74	16 00 	. . 
	ld a,(hl)			;fd76	7e 	~ 
	ld b,001h		;fd77	06 01 	. . 
	or a			;fd79	b7 	. 
	nop			;fd7a	00 	. 
	djnz $-2		;fd7b	10 fc 	. . 
	inc a			;fd7d	3c 	< 
	ld b,a			;fd7e	47 	G 
	djnz $+0		;fd7f	10 fe 	. . 
	ld a,d			;fd81	7a 	z 
	xor 010h		;fd82	ee 10 	. . 
	ld d,a			;fd84	57 	W 
	out (0feh),a		;fd85	d3 fe 	. . 
	dec e			;fd87	1d 	. 
	inc hl			;fd88	23 	# 
	jr nz,$-19		;fd89	20 eb 	  . 
	ld b,005h		;fd8b	06 05 	. . 
	pop af			;fd8d	f1 	. 
	exx			;fd8e	d9 	. 
	dec a			;fd8f	3d 	= 
	jr z,$+22		;fd90	28 14 	( . 
	ex af,af'			;fd92	08 	. 
	ei			;fd93	fb 	. 
	ret			;fd94	c9 	. 
	ld hl,0ff48h		;fd95	21 48 ff 	! H . 
	ld e,(hl)			;fd98	5e 	^ 
	inc hl			;fd99	23 	# 
	ld d,(hl)			;fd9a	56 	V 
	inc hl			;fd9b	23 	# 
	ld a,(hl)			;fd9c	7e 	~ 
	inc hl			;fd9d	23 	# 
	ld (0fd96h),hl		;fd9e	22 96 fd 	" . . 
	ld (0fd58h),de		;fda1	ed 53 58 fd 	. S X . 
	ret			;fda5	c9 	. 
	ld a,00ch		;fda6	3e 0c 	> . 
	or a			;fda8	b7 	. 
	jr z,$+15		;fda9	28 0d 	( . 
	push af			;fdab	f5 	. 
	ld a,020h		;fdac	3e 20 	>   
	ld (0fcd9h),a		;fdae	32 d9 fc 	2 . . 
	xor a			;fdb1	af 	. 
	ld (0fda7h),a		;fdb2	32 a7 fd 	2 . . 
	pop af			;fdb5	f1 	. 
	jr $-36		;fdb6	18 da 	. . 
	pop hl			;fdb8	e1 	. 
	ld hl,(0fb44h)		;fdb9	2a 44 fb 	* D . 
	ld a,013h		;fdbc	3e 13 	> . 
	dec a			;fdbe	3d 	= 
	ld (0fdbdh),a		;fdbf	32 bd fd 	2 . . 
	jp z,0fb46h		;fdc2	ca 46 fb 	. F . 
	jp 0fbc4h		;fdc5	c3 c4 fb 	. . . 
	ld c,a			;fdc8	4f 	O 
	rra			;fdc9	1f 	. 
	rra			;fdca	1f 	. 
	rra			;fdcb	1f 	. 
	and 01fh		;fdcc	e6 1f 	. . 
	add a,024h		;fdce	c6 24 	. $ 
	ld b,0ffh		;fdd0	06 ff 	. . 
	inc b			;fdd2	04 	. 
	sub 00ch		;fdd3	d6 0c 	. . 
	jr nc,$-3		;fdd5	30 fb 	0 . 
	add a,00ch		;fdd7	c6 0c 	. . 
	add a,a			;fdd9	87 	. 
	ld hl,0fe24h		;fdda	21 24 fe 	! $ . 
	call 0fe1dh		;fddd	cd 1d fe 	. . . 
	inc hl			;fde0	23 	# 
	ld h,(hl)			;fde1	66 	f 
	ld l,a			;fde2	6f 	o 
	ld a,b			;fde3	78 	x 
	or a			;fde4	b7 	. 
	jr z,$+8		;fde5	28 06 	( . 
	srl h		;fde7	cb 3c 	. < 
	rr l		;fde9	cb 1d 	. . 
	djnz $-4		;fdeb	10 fa 	. . 
	ld de,00046h		;fded	11 46 00 	. F . 
	or a			;fdf0	b7 	. 
	sbc hl,de		;fdf1	ed 52 	. R 
	ld a,c			;fdf3	79 	y 
	and 007h		;fdf4	e6 07 	. . 
	ex de,hl			;fdf6	eb 	. 
	ld hl,0ff3dh		;fdf7	21 3d ff 	! = . 
	call 0fe1dh		;fdfa	cd 1d fe 	. . . 
	ex de,hl			;fdfd	eb 	. 
	ld b,a			;fdfe	47 	G 
	ld a,c			;fdff	79 	y 
	and 0f8h		;fe00	e6 f8 	. . 
	ld a,b			;fe02	78 	x 
	ret			;fe03	c9 	. 
	ex de,hl			;fe04	eb 	. 
	ld hl,0fe4ch		;fe05	21 4c fe 	! L . 
	ld a,(hl)			;fe08	7e 	~ 
	ld (0fcd8h),a		;fe09	32 d8 fc 	2 . . 
	inc hl			;fe0c	23 	# 
	ld c,(hl)			;fe0d	4e 	N 
	ld b,000h		;fe0e	06 00 	. . 
	inc hl			;fe10	23 	# 
	bit 7,c		;fe11	cb 79 	. y 
	jr z,$+3		;fe13	28 01 	( . 
	dec b			;fe15	05 	. 
	ld (0fcdch),bc		;fe16	ed 43 dc fc 	. C . . 
	ld a,(hl)			;fe1a	7e 	~ 
	ex de,hl			;fe1b	eb 	. 
	ret			;fe1c	c9 	. 
	add a,l			;fe1d	85 	. 
	ld l,a			;fe1e	6f 	o 
	jr nc,$+3		;fe1f	30 01 	0 . 
	inc h			;fe21	24 	$ 
	ld a,(hl)			;fe22	7e 	~ 
	ret			;fe23	c9 	. 
	ld hl,0aa1ah		;fe24	21 1a aa 	! . . 
	jr $+73		;fe27	18 47 	. G 
	rla			;fe29	17 	. 
	ld sp,hl			;fe2a	f9 	. 
	dec d			;fe2b	15 	. 
	cp l			;fe2c	bd 	. 
	inc d			;fe2d	14 	. 
	sub e			;fe2e	93 	. 
	inc de			;fe2f	13 	. 
	ld a,d			;fe30	7a 	z 
	ld (de),a			;fe31	12 	. 
	ld (hl),b			;fe32	70 	p 
	ld de,01076h		;fe33	11 76 10 	. v . 
	adc a,c			;fe36	89 	. 
	rrca			;fe37	0f 	. 
	xor d			;fe38	aa 	. 
	ld c,0d7h		;fe39	0e d7 	. . 
	dec c			;fe3b	0d 	. 
	ld bc,01300h		;fe3c	01 00 13 	. . . 
	ld (bc),a			;fe3f	02 	. 
	rst 38h			;fe40	ff 	. 
	nop			;fe41	00 	. 
	ld (bc),a			;fe42	02 	. 
	rlca			;fe43	07 	. 
	dec de			;fe44	1b 	. 
	ld (bc),a			;fe45	02 	. 
	rra			;fe46	1f 	. 
	dec de			;fe47	1b 	. 
	inc bc			;fe48	03 	. 
	ld bc,00608h		;fe49	01 08 06 	. . . 
	inc bc			;fe4c	03 	. 
	ld bc,01206h		;fe4d	01 06 12 	. . . 
	ld bc,01001h		;fe50	01 01 10 	. . . 
	inc b			;fe53	04 	. 
	nop			;fe54	00 	. 
	ld bc,00318h		;fe55	01 18 03 	. . . 
	nop			;fe58	00 	. 
	rst 38h			;fe59	ff 	. 
	ld h,b			;fe5a	60 	` 
	inc d			;fe5b	14 	. 
	inc de			;fe5c	13 	. 
	ld e,e			;fe5d	5b 	[ 
	ld d,b			;fe5e	50 	P 
	ld b,b			;fe5f	40 	@ 
	ld e,l			;fe60	5d 	] 
	ld b,d			;fe61	42 	B 
	ld d,d			;fe62	52 	R 
	ld e,d			;fe63	5a 	Z 
	ld l,e			;fe64	6b 	k 
	ld e,b			;fe65	58 	X 
	ld d,b			;fe66	50 	P 
	ld l,l			;fe67	6d 	m 
	ld l,d			;fe68	6a 	j 
	ld a,d			;fe69	7a 	z 
	add a,d			;fe6a	82 	. 
	add a,e			;fe6b	83 	. 
	ld e,(hl)			;fe6c	5e 	^ 
	ld l,h			;fe6d	6c 	l 
	ld a,d			;fe6e	7a 	z 
	add a,d			;fe6f	82 	. 
	add a,d			;fe70	82 	. 
	ex af,af'			;fe71	08 	. 
	sub d			;fe72	92 	. 
	add a,d			;fe73	82 	. 
	ld a,d			;fe74	7a 	z 
	ld l,d			;fe75	6a 	j 
	ld a,d			;fe76	7a 	z 
	ld l,d			;fe77	6a 	j 
	ld e,d			;fe78	5a 	Z 
	ld d,d			;fe79	52 	R 
	add a,d			;fe7a	82 	. 
	ex af,af'			;fe7b	08 	. 
	sub d			;fe7c	92 	. 
	add a,d			;fe7d	82 	. 
	ld (hl),d			;fe7e	72 	r 
	ld l,d			;fe7f	6a 	j 
	ld (hl),d			;fe80	72 	r 
	ld l,d			;fe81	6a 	j 
	ld e,d			;fe82	5a 	Z 
	ld c,d			;fe83	4a 	J 
	add a,d			;fe84	82 	. 
	dec c			;fe85	0d 	. 
	add hl,sp			;fe86	39 	9 
	jr nc,$+34		;fe87	30 20 	0   
	dec sp			;fe89	3b 	; 
	jr nz,$+50		;fe8a	20 30 	  0 
	add hl,sp			;fe8c	39 	9 
	jr nc,$+34		;fe8d	30 20 	0   
	ld sp,01820h		;fe8f	31 20 18 	1   . 
	dec (hl)			;fe92	35 	5 
	add a,d			;fe93	82 	. 
	ld a,(bc)			;fe94	0a 	. 
	add hl,sp			;fe95	39 	9 
	jr nc,$+34		;fe96	30 20 	0   
	dec sp			;fe98	3b 	; 
	jr nz,$+50		;fe99	20 30 	  0 
	add hl,sp			;fe9b	39 	9 
	jr nc,$+34		;fe9c	30 20 	0   
	ld c,a			;fe9e	4f 	O 
	add a,d			;fe9f	82 	. 
	add hl,bc			;fea0	09 	. 
	ld sp,01020h		;fea1	31 20 10 	1   . 
	inc sp			;fea4	33 	3 
	ld sp,03830h		;fea5	31 30 38 	1 0 8 
	ld c,c			;fea8	49 	I 
	ld d,a			;fea9	57 	W 
	add a,d			;feaa	82 	. 
	ld a,(bc)			;feab	0a 	. 
	ld e,d			;feac	5a 	Z 
	ld d,c			;fead	51 	Q 
	ld (04149h),a		;feae	32 49 41 	2 I A 
	ld hl,0313ah		;feb1	21 3a 31 	! : 1 
	ld de,08637h		;feb4	11 37 86 	. 7 . 
	inc e			;feb7	1c 	. 
	ld bc,08534h		;feb8	01 34 85 	. 4 . 
	inc c			;febb	0c 	. 
	dec bc			;febc	0b 	. 
	sub d			;febd	92 	. 
	adc a,c			;febe	89 	. 
	ld l,d			;febf	6a 	j 
	add a,c			;fec0	81 	. 
	ld a,c			;fec1	79 	y 
	ld e,c			;fec2	59 	Y 
	ld (hl),d			;fec3	72 	r 
	ld l,c			;fec4	69 	i 
	ld c,c			;fec5	49 	I 
	ld l,h			;fec6	6c 	l 
	ld l,a			;fec7	6f 	o 
	add a,d			;fec8	82 	. 
	dec bc			;fec9	0b 	. 
	ld a,c			;feca	79 	y 
	ld e,c			;fecb	59 	Y 
	ld b,c			;fecc	41 	A 
	ld e,b			;fecd	58 	X 
	ld a,b			;fece	78 	x 
	ld a,c			;fecf	79 	y 
	ld e,b			;fed0	58 	X 
	ld b,b			;fed1	40 	@ 
	add a,c			;fed2	81 	. 
	ld a,b			;fed3	78 	x 
	ld e,b			;fed4	58 	X 
	add a,e			;fed5	83 	. 
	ret			;fed6	c9 	. 
	cp 002h		;fed7	fe 02 	. . 
	add a,l			;fed9	85 	. 
	inc d			;feda	14 	. 
	dec bc			;fedb	0b 	. 
	add a,c			;fedc	81 	. 
	ld l,c			;fedd	69 	i 
	ld b,c			;fede	41 	A 
	ld l,b			;fedf	68 	h 
	add a,b			;fee0	80 	. 
	add a,c			;fee1	81 	. 
	ld l,b			;fee2	68 	h 
	ld b,b			;fee3	40 	@ 
	sub c			;fee4	91 	. 
	add a,b			;fee5	80 	. 
	ld a,b			;fee6	78 	x 
	add a,e			;fee7	83 	. 
	in a,(0feh)		;fee8	db fe 	. . 
	ld (bc),a			;feea	02 	. 
	dec bc			;feeb	0b 	. 
	ld l,c			;feec	69 	i 
	ld e,c			;feed	59 	Y 
	ld d,c			;feee	51 	Q 
	ld e,b			;feef	58 	X 
	ld l,b			;fef0	68 	h 
	ld l,c			;fef1	69 	i 
	ld e,b			;fef2	58 	X 
	ld d,b			;fef3	50 	P 
	add a,c			;fef4	81 	. 
	ld a,b			;fef5	78 	x 
	ld e,b			;fef6	58 	X 
	add a,e			;fef7	83 	. 
	ex de,hl			;fef8	eb 	. 
	cp 002h		;fef9	fe 02 	. . 
	add a,l			;fefb	85 	. 
	jr $+13		;fefc	18 0b 	. . 
	ld a,c			;fefe	79 	y 
	ld l,c			;feff	69 	i 
	ld d,c			;ff00	51 	Q 
	ld l,b			;ff01	68 	h 
	ld a,b			;ff02	78 	x 
	ld a,c			;ff03	79 	y 
	ld l,b			;ff04	68 	h 
	ld d,b			;ff05	50 	P 
	add a,c			;ff06	81 	. 
	ld a,b			;ff07	78 	x 
	ld l,b			;ff08	68 	h 
	add a,e			;ff09	83 	. 
	defb 0fdh,0feh,002h	;illegal sequence		;ff0a	fd fe 02 	. . . 
	add a,d			;ff0d	82 	. 
	add a,h			;ff0e	84 	. 
	inc h			;ff0f	24 	$ 
	add a,l			;ff10	85 	. 
	djnz $-119		;ff11	10 87 	. . 
	inc bc			;ff13	03 	. 
	add a,c			;ff14	81 	. 
	ld e,h			;ff15	5c 	\ 
	cp 081h		;ff16	fe 81 	. . 
	ld (hl),c			;ff18	71 	q 
	cp 087h		;ff19	fe 87 	. . 
	add hl,bc			;ff1b	09 	. 
	add a,c			;ff1c	81 	. 
	ld e,h			;ff1d	5c 	\ 
	cp 087h		;ff1e	fe 87 	. . 
	ld b,081h		;ff20	06 81 	. . 
	ld a,e			;ff22	7b 	{ 
	cp 087h		;ff23	fe 87 	. . 
	nop			;ff25	00 	. 
	add a,l			;ff26	85 	. 
	nop			;ff27	00 	. 
	add a,c			;ff28	81 	. 
	add a,l			;ff29	85 	. 
	cp 081h		;ff2a	fe 81 	. . 
	sub h			;ff2c	94 	. 
	cp 081h		;ff2d	fe 81 	. . 
	add a,l			;ff2f	85 	. 
	cp 081h		;ff30	fe 81 	. . 
	and b			;ff32	a0 	. 
	cp 085h		;ff33	fe 85 	. . 
	inc c			;ff35	0c 	. 
	add a,c			;ff36	81 	. 
	xor e			;ff37	ab 	. 
	cp 081h		;ff38	fe 81 	. . 
	ret			;ff3a	c9 	. 
	cp 080h		;ff3b	fe 80 	. . 
	dec b			;ff3d	05 	. 
	ld a,(bc)			;ff3e	0a 	. 
	inc d			;ff3f	14 	. 
	ld e,028h		;ff40	1e 28 	. ( 
	inc a			;ff42	3c 	< 
	ld (06050h),a		;ff43	32 50 60 	2 P ` 
	rst 38h			;ff46	ff 	. 
	rlca			;ff47	07 	. 
	ld (hl),b			;ff48	70 	p 
	rst 38h			;ff49	ff 	. 
	ld bc,0ff60h		;ff4a	01 60 ff 	. ` . 
	ld b,070h		;ff4d	06 70 	. p 
	rst 38h			;ff4f	ff 	. 
	dec b			;ff50	05 	. 
	ld h,b			;ff51	60 	` 
	rst 38h			;ff52	ff 	. 
	ld bc,0ff70h		;ff53	01 70 ff 	. p . 
	ld (bc),a			;ff56	02 	. 
	ld h,b			;ff57	60 	` 
	rst 38h			;ff58	ff 	. 
	ld (bc),a			;ff59	02 	. 
	add a,b			;ff5a	80 	. 
	rst 38h			;ff5b	ff 	. 
	ld b,060h		;ff5c	06 60 	. ` 
	rst 38h			;ff5e	ff 	. 
	add hl,bc			;ff5f	09 	. 
	ld bc,00101h		;ff60	01 01 01 	. . . 
	nop			;ff63	00 	. 
	dec b			;ff64	05 	. 
	nop			;ff65	00 	. 
	ld bc,00100h		;ff66	01 00 01 	. . . 
	nop			;ff69	00 	. 
	ld bc,00501h		;ff6a	01 01 05 	. . . 
	nop			;ff6d	00 	. 
	dec b			;ff6e	05 	. 
	nop			;ff6f	00 	. 
	ld bc,00202h		;ff70	01 02 02 	. . . 
	nop			;ff73	00 	. 
	ld (bc),a			;ff74	02 	. 
	nop			;ff75	00 	. 
	dec b			;ff76	05 	. 
	nop			;ff77	00 	. 
	ld bc,00200h		;ff78	01 00 02 	. . . 
	ld (bc),a			;ff7b	02 	. 
	dec b			;ff7c	05 	. 
	nop			;ff7d	00 	. 
	inc b			;ff7e	04 	. 
	nop			;ff7f	00 	. 
	ld bc,00000h		;ff80	01 00 00 	. . . 
	nop			;ff83	00 	. 
	nop			;ff84	00 	. 
	nop			;ff85	00 	. 
	nop			;ff86	00 	. 
	nop			;ff87	00 	. 
	inc bc			;ff88	03 	. 
	nop			;ff89	00 	. 
	nop			;ff8a	00 	. 
	nop			;ff8b	00 	. 
	nop			;ff8c	00 	. 
	nop			;ff8d	00 	. 
	nop			;ff8e	00 	. 
	nop			;ff8f	00 	. 
	nop			;ff90	00 	. 
	djnz $-119		;ff91	10 87 	. . 
	inc bc			;ff93	03 	. 
	add a,c			;ff94	81 	. 
	ld e,h			;ff95	5c 	\ 
	cp 081h		;ff96	fe 81 	. . 
	ld (hl),c			;ff98	71 	q 
	cp 087h		;ff99	fe 87 	. . 
	add hl,bc			;ff9b	09 	. 
	add a,c			;ff9c	81 	. 
	ld e,h			;ff9d	5c 	\ 
	cp 087h		;ff9e	fe 87 	. . 
	ld b,081h		;ffa0	06 81 	. . 
	ld a,e			;ffa2	7b 	{ 
	cp 087h		;ffa3	fe 87 	. . 
	nop			;ffa5	00 	. 
	add a,l			;ffa6	85 	. 
	nop			;ffa7	00 	. 
	add a,c			;ffa8	81 	. 
	add a,l			;ffa9	85 	. 
	cp 081h		;ffaa	fe 81 	. . 
	sub h			;ffac	94 	. 
	cp 081h		;ffad	fe 81 	. . 
	add a,l			;ffaf	85 	. 
	cp 081h		;ffb0	fe 81 	. . 
	and b			;ffb2	a0 	. 
	cp 085h		;ffb3	fe 85 	. . 
	inc c			;ffb5	0c 	. 
	add a,c			;ffb6	81 	. 
	xor e			;ffb7	ab 	. 
	cp 081h		;ffb8	fe 81 	. . 
	ret			;ffba	c9 	. 
	cp 080h		;ffbb	fe 80 	. . 
	dec b			;ffbd	05 	. 
	ld a,(bc)			;ffbe	0a 	. 
	inc d			;ffbf	14 	. 
	ld e,028h		;ffc0	1e 28 	. ( 
	inc a			;ffc2	3c 	< 
	ld (06050h),a		;ffc3	32 50 60 	2 P ` 
	rst 38h			;ffc6	ff 	. 
	rlca			;ffc7	07 	. 
	ld (hl),b			;ffc8	70 	p 
	rst 38h			;ffc9	ff 	. 
	ld bc,0ff60h		;ffca	01 60 ff 	. ` . 
	ld b,070h		;ffcd	06 70 	. p 
	rst 38h			;ffcf	ff 	. 
	dec b			;ffd0	05 	. 
	ld h,b			;ffd1	60 	` 
	rst 38h			;ffd2	ff 	. 
	ld bc,0ff70h		;ffd3	01 70 ff 	. p . 
	ld (bc),a			;ffd6	02 	. 
	ld h,b			;ffd7	60 	` 
	rst 38h			;ffd8	ff 	. 
	ld (bc),a			;ffd9	02 	. 
	add a,b			;ffda	80 	. 
	rst 38h			;ffdb	ff 	. 
	ld b,060h		;ffdc	06 60 	. ` 
	rst 38h			;ffde	ff 	. 
	add hl,bc			;ffdf	09 	. 
	ld bc,00101h		;ffe0	01 01 01 	. . . 
	nop			;ffe3	00 	. 
	dec b			;ffe4	05 	. 
	nop			;ffe5	00 	. 
	ld bc,00100h		;ffe6	01 00 01 	. . . 
	nop			;ffe9	00 	. 
	ld bc,00501h		;ffea	01 01 05 	. . . 
	nop			;ffed	00 	. 
	dec b			;ffee	05 	. 
	nop			;ffef	00 	. 
	ld bc,00202h		;fff0	01 02 02 	. . . 
	nop			;fff3	00 	. 
	djnz $+18		;fff4	10 10 	. . 
	djnz $+2		;fff6	10 00 	. . 
	nop			;fff8	00 	. 
	ld b,d			;fff9	42 	B 
	ld b,d			;fffa	42 	B 
	ld b,d			;fffb	42 	B 
