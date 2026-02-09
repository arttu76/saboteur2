; ======================================================================
; code_roomrender.asm
; ======================================================================
;
; Room Rendering Command Interpreter & Graphics Data
;
; Address range: $770C-$800B (2304 bytes)
; Source binary: block7_main.bin (loaded at $620C)
;
; This file contains the room rendering command interpreter, which is
; the core system for drawing room layouts. Each room has a command
; list (stored at $D41C+ in data_roommap.asm) consisting of command
; bytes that index into the ROOM_CMD_TABLE. Each command handler
; draws a specific room element (wall, floor, door, ladder, object,
; etc.) using tile/bitmap data embedded in this file.
;
; Architecture:
;   1. Room command list is fetched from $D41C table by room number
;   2. Each command byte indexes into ROOM_CMD_TABLE ($7775)
;   3. Handler draws tiles via STATE_JUMP_TBL_2 (tile copy engine)
;   4. Command 0 = skip (advance to next), $FF = end of list
;   5. Handlers use IX for tile pattern data, B/C for dimensions
;
; Also contains:
;   - Screen fill/copy routines for attribute and pattern setup
;   - Lift/elevator state display handlers
;   - Mission completion state tracking
;   - Embedded tile pattern data for room elements
;   - Text data for in-game messages
;
; Cross-references:
;   Called from: code_mainloop.asm (room loading), code_mechanics.asm
;   Calls: COPY_DATA_BLK, PROCESS_INPUT, STATE_JUMP_TBL_2
;   Data: Room command lists in data_roommap.asm ($D41C+)
;   Data: Tile graphics in data_highscores.asm ($6400+ area)
;
; Memory map:
;   $770C-$7773  Room initialization & command interpreter loop
;   $7774-$7846  ROOM_CMD_TABLE (command handler address table)
;   $7847-$79FA  Tile pattern data (room element bitmaps)
;   $79FB-$7B15  Room drawing setup routines
;   $7B15-$7C95  Room element handlers with inline tile data
;   $7C96-$7CAD  STATE_JUMP_TBL_2 (tile copy engine)
;   $7CAE-$7D3D  Object drawing setup with inline tile data
;   $7D3E-$7DA5  Lift state display handlers
;   $7DA6-$7EC2  Lift/object tile pattern data + variables
;   $7EC3-$7F34  Mission state handlers & message text
;   $7F35-$7FC8  Screen fill/copy command handlers
;   $7FC9-$800B  Tile address lookup table + padding
;
; ======================================================================

; ==========================================================================
; ROOM INITIALIZATION ($770C)
; ==========================================================================
; Sets up the screen buffers and state for drawing a room. Clears
; three screen regions: high score area ($644C, 576 bytes with $00),
; a second region ($644C, 575 bytes with $FF), and the screen bitmap
; area ($620C, 575 bytes with $01). Then looks up the room's command
; list and begins executing it.
;
	djnz l7709h		;770c  ; (continuation from code_init.asm)
	ld a,(09943h)		;770e  ; A = current room number
	dec a			;7711  ; Test if room 1
	ld a,001h		;7712  ; A = 1 (default room config value)
	jr nz,l7718h		;7714  ; Not room 1 -> use default
	ld a,001h		;7716  ; A = 1 (room 1 config value, same)
l7718h:
	ld (lcf82h),a		;7718  ; Store room config parameter
	xor a			;771b  ; A = 0
	ld (l7ec3h),a		;771c  ; Clear mission completion state
	call 0aa27h		;771f  ; Initialize room entity state
	call PROCESS_INPUT		;7722  ; Process pending input

; --- Clear screen buffer regions ---
	ld hl,HISCORE_TBL		;7725  ; HL = $644C (high score / screen buffer)
	ld de,l644dh		;7728  ; DE = $644D (next byte)
	ld bc,00240h		;772b  ; BC = 576 bytes
	ld (hl),000h		;772e  ; Set first byte to $00
	ldir		;7730  ; Fill 576 bytes with $00
	ld (hl),0ffh		;7732  ; Set next byte to $FF
	ld bc,0023fh		;7734  ; BC = 575 bytes
	ldir		;7737  ; Fill 575 bytes with $FF
	ld hl,GAME_ENTRY		;7739  ; HL = $620C (game entry / screen area)
	ld de,l620dh		;773c  ; DE = $620D (next byte)
	ld bc,0023fh		;773f  ; BC = 575 bytes
	ld (hl),001h		;7742  ; Set first byte to $01
	ldir		;7744  ; Fill 575 bytes with $01

; ==========================================================================
; ROOM COMMAND INTERPRETER ($7746)
; ==========================================================================
; Fetches the command list for the current room from the room data
; table at $D41C. Each room entry is a 2-byte pointer to a command
; list. The room number comes from $9942 (room state byte), used as
; an index into the $D41C table.
;
	ld hl,00000h		;7746  ; HL = self-modifying pointer (initially 0)
	ld a,(09942h)		;7749  ; A = room state byte (room sub-index)
	or a			;774c  ; Is it zero?
	jr z,l7750h		;774d  ; Yes -> use A=0 as room index
	ld a,(hl)			;774f  ; No -> load room index from pointer
l7750h:
	ld l,a			;7750  ; L = room index
	ld h,000h		;7751  ; HL = room index (16-bit)
	add hl,hl			;7753  ; HL *= 2 (each table entry is 2 bytes)
	ld de,0d41ch		;7754  ; DE = $D41C (room data table base)
	add hl,de			;7757  ; HL -> room's command list pointer
	ld a,(hl)			;7758  ; A = command list address low byte
	inc hl			;7759
	ld h,(hl)			;775a  ; H = command list address high byte
	ld l,a			;775b  ; HL = command list address

; --- Command execution loop ---
; Reads command bytes from the list. $FF = end of list.
; Each command byte indexes into ROOM_CMD_TABLE to find the handler.
;
l775ch:
	ld a,(hl)			;775c  ; A = next command byte
	inc a			;775d  ; Test if $FF (inc $FF -> 0)
	jp z,l896ah		;775e  ; $FF = end of list -> finish room setup
	inc hl			;7761  ; HL -> next byte in command list
	push hl			;7762  ; Save command list position

; --- Look up command handler address ---
	ld l,a			;7763  ; L = command byte (already incremented)
	ld h,000h		;7764  ; HL = command index (16-bit)
	add hl,hl			;7766  ; HL *= 2 (2-byte address entries)
	ld de,STATE_JUMP_TBL+1		;7767  ; DE = $7775 (ROOM_CMD_TABLE base)
	add hl,de			;776a  ; HL -> handler address entry
	ld a,(hl)			;776b  ; A = handler address low byte
	inc hl			;776c
	ld h,(hl)			;776d  ; H = handler address high byte
	ld l,a			;776e  ; HL = handler address
	jp (hl)			;776f  ; Jump to command handler

; --- Command 0 handler: skip data byte and continue ---
l7770h:
	pop hl			;7770  ; Restore command list position
	inc hl			;7771  ; Skip one data byte
	jr l775ch		;7772  ; -> process next command
; ==========================================================================
; ROOM_CMD_TABLE / STATE_JUMP_TBL ($7774)
; ==========================================================================
; Room command handler address table. The first 3 bytes are a JP
; instruction (command 0 = skip/continue). Following that are 2-byte
; address entries indexed by command byte. Each entry points to a
; handler routine that draws a specific room element.
;
; The table extends from $7775 to approximately $7846, containing
; ~57 command handler entries. Commands correspond to room elements:
; walls, floors, doors, ladders, platforms, objects, decorations, etc.
;
; Handlers typically set up IX (tile data), B (height), C (width),
; HL (screen address), then jump to STATE_JUMP_TBL_2 to copy tiles.
;
STATE_JUMP_TBL:
	jp l7770h		;7774  ; Command 0: skip data byte, continue
; --- Command handler address entries (2 bytes each) ---
; Command 1+: each pair is a little-endian address
l7777h:
	dec (hl)			;7777  ; DATA: command handler addresses
	ld a,a			;7778
	ld c,l			;7779
	ld a,a			;777a
	ld a,(bc)			;777b
	adc a,c			;777c
	ld a,(bc)			;777d
	ld a,a			;777e
	inc e			;777f
	ld a,a			;7780
	call nc,0437bh		;7781
	ld a,a			;7784
	ld c,b			;7785
	ld a,a			;7786
	ld l,l			;7787
	ld a,a			;7788
	add a,l			;7789
	ld a,a			;778a
	and 088h		;778b
	adc a,088h		;778d
	out (088h),a		;778f
	pop hl			;7791
	adc a,b			;7792
	ld h,l			;7793
	ld a,a			;7794
	daa			;7795
	ld a,a			;7796
	cp l			;7797
	ld a,d			;7798
	scf			;7799
	ld a,h			;779a
	ld e,h			;779b
	ld a,e			;779c
	add a,a			;779d
	ld a,h			;779e
	dec bc			;779f
	ld a,h			;77a0
	dec d			;77a1
	ld a,h			;77a2
	ld a,(hl)			;77a3
	ld a,e			;77a4
	sub d			;77a5
	ld a,e			;77a6
	and (hl)			;77a7
	ld a,e			;77a8
	cp l			;77a9
	ld a,e			;77aa
	call m,0067eh		;77ab
	ld a,a			;77ae
	ld bc,0767ch		;77af
	ld a,h			;77b2
	ld l,c			;77b3
	ld a,a			;77b4
	ld l,c			;77b5
	ld a,h			;77b6
	rst 30h			;77b7
	ld a,e			;77b8
	ld h,c			;77b9
	ld a,a			;77ba
	push bc			;77bb
	ld a,(hl)			;77bc
	ret			;77bd
	ld a,(hl)			;77be
	call 0067eh		;77bf
	ld a,l			;77c2
	inc sp			;77c3
	ld a,l			;77c4
	or h			;77c5
	ld a,h			;77c6
	ld a,(bc)			;77c7
	ld a,e			;77c8
	cpl			;77c9
	ld a,e			;77ca
	defb 0fdh,07ah,0f2h	;illegal sequence		;77cb
	ld a,d			;77ce
	adc hl,sp		;77cf
	ret pe			;77d1
	ld a,d			;77d2
	add hl,sp			;77d3
	ld a,e			;77d4
	sub 07ah		;77d5
	xor a			;77d7
	ld a,d			;77d8
	xor d			;77d9
	ld a,d			;77da
	sbc a,l			;77db
	ld a,d			;77dc
	sub b			;77dd
	ld a,d			;77de
	adc a,e			;77df
	ld a,d			;77e0
	jp nz,lc77ah		;77e1
	ld a,d			;77e4
	call z,sub_f47ah		;77e5
	ld a,h			;77e8
	rst 28h			;77e9
	ld a,h			;77ea
	add a,(hl)			;77eb
	ld a,d			;77ec
	add a,c			;77ed
	ld a,d			;77ee
	cp b			;77ef
	ld a,d			;77f0
	ld a,h			;77f1
	ld a,d			;77f2
	pop de			;77f3
	ld a,d			;77f4
	inc (hl)			;77f5
	ld a,e			;77f6
	call po,0227ch		;77f7
	ld a,e			;77fa
	jr l7878h		;77fb
	dec e			;77fd
	ld a,e			;77fe
	call c,03e88h		;77ff
	ld a,a			;7802
	ld b,c			;7803
	ld a,l			;7804
	sbc a,(hl)			;7805
	ld a,l			;7806
	ld d,h			;7807
	ld a,l			;7808
	add a,(hl)			;7809
	ld a,l			;780a
	ld a,b			;780b
	ld a,l			;780c
	sub h			;780d
	ld a,l			;780e
	sbc a,c			;780f
	ld a,l			;7810
	rst 18h			;7811
	ld a,h			;7812
	ld sp,hl			;7813
	ld a,h			;7814
	jp c,0d57ch		;7815
	ld a,h			;7818
	ret nc			;7819
	ld a,h			;781a
	bit 7,h		;781b
	add a,07ch		;781d
	ld (hl),a			;781f
	ld a,d			;7820
	ld (hl),d			;7821
	ld a,d			;7822
	ld l,l			;7823
	ld a,d			;7824
	ld l,b			;7825
	ld a,d			;7826
	ld h,e			;7827
	ld a,d			;7828
	ld e,(hl)			;7829
	ld a,d			;782a
	ld e,c			;782b
	ld a,d			;782c
	ld d,h			;782d
	ld a,d			;782e
	ld c,a			;782f
	ld a,d			;7830
	ld c,d			;7831
	ld a,d			;7832
	ld b,l			;7833
	ld a,d			;7834
	ld b,b			;7835
	ld a,d			;7836
	dec sp			;7837
	ld a,d			;7838
	pop bc			;7839
	ld a,h			;783a
	jr nz,$+124		;783b
	dec h			;783d
	ld a,d			;783e
	dec de			;783f
	ld a,d			;7840
	ld d,07ah		;7841
	inc b			;7843
	ld a,d			;7844
	ex (sp),hl			;7845
	ld a,d			;7846
; ==========================================================================
; TILE PATTERN DATA ($7847-$79FA)
; ==========================================================================
; Bitmap data for room tile elements. Each tile pattern is a grid of
; bytes representing pixel rows. Used by the room drawing handlers
; via IX register. Multiple pattern blocks are packed sequentially:
;
;   $7847: Door/gate pattern (variable sizes)
;   $787F: Large room element (5x8 tiles)
;   $78A7: Object pattern (5x8 tiles)
;   $78CF: Wide element pattern (7x9 tiles)
;   $790E: Narrow element (5xN tiles)
;   $791D: Small element (2x3 tiles)
;   $7923: Tiny element (3x2 tiles)
;   $7929: Standard room tile (6x5 tiles)
;   $7947: Wide room tile (9x6 tiles)
;   $797D: Extended pattern (6x6 tiles)
;
; $FF bytes serve as empty/transparent pixels.
; Values $2B-$61 are tile index codes (mapped by the renderer).
;
l7847h:
	dec hl			;7847
	inc l			;7848
	dec l			;7849
	ld l,02fh		;784a
	jr nc,$+1		;784c
	rst 38h			;784e
	rst 38h			;784f
	ld sp,lff32h		;7850
	rst 38h			;7853
	rst 38h			;7854
	inc sp			;7855
	inc (hl)			;7856
	dec (hl)			;7857
	rst 38h			;7858
	rst 38h			;7859
	ld (hl),0ffh		;785a
	scf			;785c
	jr c,l7898h		;785d
	ld a,(IM2_JUMP_TARGET)		;785f
	dec sp			;7862
	inc a			;7863
	rst 38h			;7864
	rst 38h			;7865
	rst 38h			;7866
	dec a			;7867
	rst 38h			;7868
	rst 38h			;7869
	rst 38h			;786a
	rst 38h			;786b
	ld a,0ffh		;786c
	rst 38h			;786e
	rst 38h			;786f
	ccf			;7870
	ld b,b			;7871
	rst 38h			;7872
	rst 38h			;7873
	rst 38h			;7874
	ld b,c			;7875
	ld b,d			;7876
	rst 38h			;7877
l7878h:
	rst 38h			;7878
	rst 38h			;7879
	ld b,e			;787a
	ld b,h			;787b
	rst 38h			;787c
	rst 38h			;787d
	rst 38h			;787e
l787fh:
	ld d,(hl)			;787f
	ld d,a			;7880
	ld e,b			;7881
	ld d,a			;7882
	ld e,c			;7883
	ld e,d			;7884
	ld e,h			;7885
	ld e,e			;7886
	ld e,h			;7887
	ld e,l			;7888
	ld e,d			;7889
	ld e,h			;788a
	ld e,e			;788b
	ld e,h			;788c
	ld e,l			;788d
	ld e,d			;788e
	ld e,(hl)			;788f
	ld e,a			;7890
	ld h,b			;7891
	ld e,l			;7892
	ld e,d			;7893
	ld e,h			;7894
	ld e,e			;7895
	ld e,h			;7896
	ld e,l			;7897
l7898h:
	ld e,d			;7898
	ld e,h			;7899
	ld e,e			;789a
	ld e,h			;789b
	ld e,l			;789c
	ld e,d			;789d
	ld e,h			;789e
	ld e,e			;789f
	ld e,h			;78a0
	ld e,l			;78a1
	ld h,c			;78a2
	ld h,d			;78a3
	ld h,d			;78a4
	ld h,d			;78a5
	ld h,e			;78a6
l78a7h:
	ld l,02fh		;78a7
	cpl			;78a9
	cpl			;78aa
	jr nc,l78deh		;78ab
	ld (03433h),a		;78ad
	dec (hl)			;78b0
	ld sp,03736h		;78b1
	jr c,l78ebh		;78b4
	ld sp,03939h		;78b6
	add hl,sp			;78b9
	dec (hl)			;78ba
	ld sp,03939h		;78bb
	ld a,(03135h)		;78be
	add hl,sp			;78c1
	add hl,sp			;78c2
	add hl,sp			;78c3
	dec (hl)			;78c4
	ld sp,03939h		;78c5
	add hl,sp			;78c8
	dec (hl)			;78c9
	ld sp,03939h		;78ca
	add hl,sp			;78cd
	dec (hl)			;78ce
l78cfh:
	dec sp			;78cf
	ld b,b			;78d0
	ld b,h			;78d1
	ld b,d			;78d2
	ld b,b			;78d3
	ld b,c			;78d4
	ccf			;78d5
	dec sp			;78d6
	inc a			;78d7
	dec a			;78d8
	dec a			;78d9
	dec a			;78da
	ld a,03fh		;78db
	dec sp			;78dd
l78deh:
	ld b,e			;78de
	ld b,c			;78df
	ld b,l			;78e0
	ld b,d			;78e1
	ld b,h			;78e2
	ccf			;78e3
	dec sp			;78e4
	inc a			;78e5
	dec a			;78e6
	dec a			;78e7
	dec a			;78e8
	ld a,03fh		;78e9
l78ebh:
	dec sp			;78eb
	ld b,e			;78ec
	ld b,d			;78ed
	ld b,b			;78ee
	ld b,l			;78ef
	ld b,d			;78f0
	ccf			;78f1
	dec sp			;78f2
	inc a			;78f3
	dec a			;78f4
	dec a			;78f5
	dec a			;78f6
	ld a,03fh		;78f7
	dec sp			;78f9
	ld b,l			;78fa
	ld b,b			;78fb
	ld b,h			;78fc
	ld b,e			;78fd
	ld b,c			;78fe
	ccf			;78ff
	dec sp			;7900
	inc a			;7901
	dec a			;7902
	dec a			;7903
	dec a			;7904
	ld a,03fh		;7905
	dec sp			;7907
	nop			;7908
	nop			;7909
	nop			;790a
	nop			;790b
	nop			;790c
	ccf			;790d
l790eh:
	ld c,h			;790e
	ld c,h			;790f
	ld c,h			;7910
	ld c,h			;7911
	ld c,h			;7912
	ld c,l			;7913
	ld c,l			;7914
	ld c,l			;7915
	ld c,l			;7916
	ld c,l			;7917
	ld c,(hl)			;7918
	ld c,(hl)			;7919
	ld c,(hl)			;791a
	ld c,(hl)			;791b
	ld c,(hl)			;791c
l791dh:
	ld b,(hl)			;791d
	ld b,a			;791e
	ld c,b			;791f
	ld c,c			;7920
	ld c,d			;7921
	ld c,e			;7922
l7923h:
	ld h,l			;7923
	ld h,(hl)			;7924
	ld h,a			;7925
	ld l,b			;7926
	ld l,c			;7927
	ld l,d			;7928
l7929h:
	nop			;7929
	nop			;792a
	ld l,e			;792b
	ld l,h			;792c
	nop			;792d
	nop			;792e
	ld l,l			;792f
	ld l,(hl)			;7930
	ld l,a			;7931
	ld l,a			;7932
	ld (hl),b			;7933
	ld (hl),c			;7934
	ld (hl),d			;7935
	ld (hl),e			;7936
	ld (hl),h			;7937
	ld (hl),l			;7938
	halt			;7939
	ld (hl),a			;793a
	ld (hl),d			;793b
	ld (hl),e			;793c
	ld a,b			;793d
	ld a,c			;793e
	halt			;793f
	ld (hl),a			;7940
	ld a,d			;7941
	nop			;7942
	ld a,e			;7943
	ld a,h			;7944
	nop			;7945
	ld a,l			;7946
l7947h:
	add a,c			;7947
	add a,d			;7948
	add a,d			;7949
	add a,d			;794a
	add a,d			;794b
	add a,d			;794c
	add a,d			;794d
	add a,d			;794e
	add a,e			;794f
	add a,h			;7950
	ld bc,00101h		;7951
	ld bc,00101h		;7954
	ld bc,l8485h		;7957
	ld bc,00101h		;795a
	ld bc,00101h		;795d
	ld bc,l8485h		;7960
	ld bc,00101h		;7963
	ld bc,00101h		;7966
	ld bc,l8485h		;7969
	ld bc,00101h		;796c
	ld bc,00101h		;796f
	ld bc,l8685h		;7972
	add a,a			;7975
	add a,a			;7976
	add a,a			;7977
	add a,a			;7978
	add a,a			;7979
	add a,a			;797a
	add a,a			;797b
	adc a,b			;797c
l797dh:
	adc a,c			;797d
	adc a,d			;797e
	adc a,d			;797f
	adc a,d			;7980
	adc a,d			;7981
	adc a,e			;7982
	adc a,h			;7983
	and c			;7984
	and d			;7985
	and c			;7986
	and e			;7987
	adc a,l			;7988
	adc a,h			;7989
	and e			;798a
	and c			;798b
	and d			;798c
	and d			;798d
	adc a,l			;798e
	adc a,h			;798f
	and c			;7990
	and d			;7991
	and c			;7992
	and d			;7993
	adc a,l			;7994
	adc a,(hl)			;7995
	adc a,a			;7996
	adc a,a			;7997
	adc a,a			;7998
	adc a,a			;7999
	sub b			;799a
	nop			;799b
	sub c			;799c
	sub d			;799d
	sub e			;799e
	sub h			;799f
	nop			;79a0
l79a1h:
	and c			;79a1
	and c			;79a2
	and c			;79a3
	and c			;79a4
	and c			;79a5
	and c			;79a6
	and c			;79a7
	and c			;79a8
	and c			;79a9
	and c			;79aa
	and c			;79ab
	and c			;79ac
	and d			;79ad
	and d			;79ae
	and d			;79af
	and d			;79b0
	and d			;79b1
	and d			;79b2
	and d			;79b3
	and d			;79b4
	and d			;79b5
	and d			;79b6
	and d			;79b7
	and d			;79b8
	and e			;79b9
	and e			;79ba
	and e			;79bb
	and e			;79bc
	and e			;79bd
	and e			;79be
	and e			;79bf
	and e			;79c0
	and e			;79c1
	and e			;79c2
	and e			;79c3
	and e			;79c4
	and c			;79c5
	and d			;79c6
	and e			;79c7
	and e			;79c8
	and d			;79c9
	and e			;79ca
	and c			;79cb
	and e			;79cc
	and c			;79cd
	and d			;79ce
	and c			;79cf
	and e			;79d0
	sub l			;79d1
	sub (hl)			;79d2
	sub a			;79d3
	sbc a,b			;79d4
	sbc a,c			;79d5
	sbc a,d			;79d6
	sbc a,e			;79d7
	sbc a,h			;79d8
	sbc a,l			;79d9
	sbc a,(hl)			;79da
	sbc a,a			;79db
	and b			;79dc
	and h			;79dd
	and l			;79de
	and (hl)			;79df
	and a			;79e0
	xor b			;79e1
	xor c			;79e2
	xor d			;79e3
	xor e			;79e4
	xor h			;79e5
	xor l			;79e6
	xor (hl)			;79e7
	xor a			;79e8
	or b			;79e9
	or c			;79ea
	or d			;79eb
	or e			;79ec
	or h			;79ed
	or l			;79ee
	or (hl)			;79ef
	or a			;79f0
	cp b			;79f1
	cp c			;79f2
	cp d			;79f3
	cp e			;79f4
	cp h			;79f5
	cp l			;79f6
	ld bc,lbe01h		;79f7  ; (end of tile pattern data)
	cp a			;79fa

; ==========================================================================
; ROOM DRAWING SETUP ROUTINES ($79FB)
; ==========================================================================
; Command handlers that set up parameters for drawing room elements.
; Each handler loads:
;   HL = screen destination address (from room data tables)
;   IX = tile pattern data pointer (embedded in this file)
;   C  = width in tiles
;   B  = height in tiles
; Then jumps to STATE_JUMP_TBL_2 to perform the actual tile copy.
;
; The first few handlers draw variable room elements that depend
; on the room state ($9942). Others draw fixed room decorations.
;
	ret nz			;79fb  ; Return if not zero (conditional entry)
	pop bc			;79fc  ; Restore BC
	jp nz,lc4c3h		;79fd  ; Conditional jump to room handler
	push bc			;7a00  ; Save BC

; --- Room drawing state variables ---
l7a01h:
	nop			;7a01  ; DATA: room draw state flag
l7a02h:
	nop			;7a02  ; DATA: room draw parameter 1
	nop			;7a03  ; DATA: room draw parameter 2

; --- Handler: large room element (6x6 tiles) ---
	ld a,001h		;7a04  ; A = 1
	ld (l7a01h),a		;7a06  ; Set room draw state flag
	ld hl,l64b0h		;7a09  ; HL = screen destination
	ld ix,l797dh		;7a0c  ; IX -> extended tile pattern at $797D
	ld c,006h		;7a10  ; C = 6 tiles wide
	ld b,006h		;7a12  ; B = 6 tiles tall
	jr l7a38h		;7a14  ; -> draw via STATE_JUMP_TBL_2

; --- Handlers: room variants (9x6 tiles, different screen positions) ---
	ld hl,l647dh		;7a16  ; Screen position variant A
	jr l7a28h		;7a19
	ld hl,l646fh		;7a1b  ; Screen position variant B
	jr l7a28h		;7a1e
	ld hl,l6474h		;7a20  ; Screen position variant C
	jr l7a28h		;7a23
	ld hl,l647fh		;7a25  ; Screen position variant D
l7a28h:
	ld a,(09942h)		;7a28  ; A = room state byte
	cp 00ch		;7a2b  ; Room >= 12?
	jp nc,l7caah		;7a2d  ; Yes -> skip drawing (room out of range)
	ld ix,l7947h		;7a30  ; IX -> wide room tile pattern at $7947
	ld c,009h		;7a34  ; C = 9 tiles wide
	ld b,006h		;7a36  ; B = 6 tiles tall
l7a38h:
	jp STATE_JUMP_TBL_2		;7a38  ; -> tile copy engine
; --- Standard room element handlers (6x5 tiles each) ---
; Each handler loads a different screen address from the room layout
; data tables, then falls through to DRAW_ROOM which sets the standard
; 6x5 tile dimensions and IX -> tile pattern at $7929.
;
	ld hl,l6574h		;7a3b  ; Room element screen addr
	jr DRAW_ROOM		;7a3e
	ld hl,l6582h		;7a40
	jr DRAW_ROOM		;7a43
	ld hl,l657bh		;7a45
	jr DRAW_ROOM		;7a48
	ld hl,l656dh		;7a4a
	jr DRAW_ROOM		;7a4d
	ld hl,l6599h		;7a4f
	jr DRAW_ROOM		;7a52
	ld hl,l658eh		;7a54
	jr DRAW_ROOM		;7a57
	ld hl,l65e3h		;7a59
	jr DRAW_ROOM		;7a5c
	ld hl,l65dbh		;7a5e
	jr DRAW_ROOM		;7a61
	ld hl,l65d3h		;7a63
	jr DRAW_ROOM		;7a66
	ld hl,l65c5h		;7a68
	jr DRAW_ROOM		;7a6b
	ld hl,l65bdh		;7a6d
	jr DRAW_ROOM		;7a70
	ld hl,l65b3h		;7a72
	jr DRAW_ROOM		;7a75
	ld hl,l65ach		;7a77
	jr DRAW_ROOM		;7a7a
	ld hl,l6562h		;7a7c
	jr DRAW_ROOM		;7a7f
	ld hl,l655ah		;7a81
	jr DRAW_ROOM		;7a84
	ld hl,l654dh		;7a86
	jr DRAW_ROOM		;7a89
	ld hl,l65a0h		;7a8b
	jr DRAW_ROOM		;7a8e
	ld hl,l6595h		;7a90
; ==========================================================================
; DRAW_ROOM ($7A93) - Standard room tile drawer
; ==========================================================================
; Common entry point for the 18 room element handlers above.
; Sets IX to the standard wall/floor tile pattern and draws 6x5 tiles.
;
DRAW_ROOM:
	ld ix,l7929h		;7a93  ; IX -> standard room tile pattern (6x5)
	ld c,006h		;7a97  ; C = 6 tiles wide
	ld b,005h		;7a99  ; B = 5 tiles tall
	jr DRAW_ROOM_TILES		;7a9b  ; -> tile copy engine

; --- Small element handler (3x2 tiles) ---
	ld hl,l64e2h		;7a9d  ; Screen destination
	ld ix,l7923h		;7aa0  ; IX -> tiny tile pattern (3x2)
	ld c,003h		;7aa4  ; C = 3 tiles wide
	ld b,002h		;7aa6  ; B = 2 tiles tall
	jr DRAW_ROOM_TILES		;7aa8  ; -> tile copy engine

; --- Door/gate handlers (uses $7847 pattern) ---
	ld hl,l6816h		;7aaa  ; Door variant A screen addr
	jr l7ab2h		;7aad
	ld hl,l6810h		;7aaf  ; Door variant B screen addr
l7ab2h:
	ld ix,l7847h		;7ab2  ; IX -> door/gate tile pattern
	jr l7b04h		;7ab6  ; -> 2x3 tile setup
; --- Large room element handlers (5x8 tiles each) ---
; Seven handlers using the large room element tile pattern at $787F.
;
	ld hl,l64f4h		;7ab8
	jr LOAD_ROOM_GFX		;7abb
	ld hl,l6566h		;7abd
	jr LOAD_ROOM_GFX		;7ac0
	ld hl,l655ah		;7ac2
	jr LOAD_ROOM_GFX		;7ac5
	ld hl,l654eh		;7ac7
	jr LOAD_ROOM_GFX		;7aca
	ld hl,l6540h		;7acc
	jr LOAD_ROOM_GFX		;7acf
	ld hl,l6501h		;7ad1
	jr LOAD_ROOM_GFX		;7ad4
	ld hl,l654fh		;7ad6
LOAD_ROOM_GFX:
	ld ix,l787fh		;7ad9  ; IX -> large room element pattern (5x8)
	ld c,005h		;7add  ; C = 5 tiles wide
	ld b,008h		;7adf  ; B = 8 tiles tall
	jr DRAW_ROOM_TILES		;7ae1  ; -> tile copy engine
; --- Small element handlers (2x3 tiles) ---
	ld hl,l65d6h		;7ae3
	jr l7b00h		;7ae6
	ld hl,l65dah		;7ae8
	jr l7b00h		;7aeb
	ld hl,l65ddh		;7aed
	jr l7b00h		;7af0

; --- Medium element handler (5x3 tiles, uses $790E pattern) ---
	ld hl,l65e0h		;7af2
	ld ix,l790eh		;7af5  ; IX -> narrow element pattern (5xN)
	ld c,005h		;7af9  ; C = 5 tiles wide
	jr l7b06h		;7afb  ; -> B=3, draw

; --- Small element entry (2x3 tiles, uses $791D pattern) ---
	ld hl,l65b5h		;7afd
l7b00h:
	ld ix,l791dh		;7b00  ; IX -> small element pattern (2x3)
l7b04h:
	ld c,002h		;7b04  ; C = 2 tiles wide
l7b06h:
	ld b,003h		;7b06  ; B = 3 tiles tall
	jr DRAW_ROOM_TILES		;7b08  ; -> tile copy engine

; --- Wide element handler (7x9 tiles, uses $78CF pattern) ---
	ld hl,l6539h		;7b0a  ; Screen destination
l7b0dh:
	ld ix,l78cfh		;7b0d  ; IX -> wide element pattern (7x9)
	ld c,007h		;7b11  ; C = 7 tiles wide
	ld b,009h		;7b13  ; B = 9 tiles tall

; --- DRAW_ROOM_TILES: jumps to tile copy engine ---
DRAW_ROOM_TILES:
	jp STATE_JUMP_TBL_2		;7b15  ; -> tile copy engine at $7C96
; --- Tall element handlers (5x10 tiles, uses $784D pattern) ---
	ld hl,l6746h		;7b18
	jr l7b25h		;7b1b
	ld hl,l673dh		;7b1d
	jr l7b25h		;7b20
	ld hl,l6731h		;7b22
l7b25h:
	ld ix,0784dh		;7b25  ; IX -> tall element pattern at $784D
	ld c,005h		;7b29  ; C = 5 tiles wide
	ld b,00ah		;7b2b  ; B = 10 tiles tall
	jr DRAW_ROOM_TILES		;7b2d  ; -> tile copy engine

; --- Wide element handlers (7x9 tiles, reuses $78CF pattern) ---
	ld hl,l652eh		;7b2f
	jr l7b0dh		;7b32
	ld hl,l6543h		;7b34
	jr l7b0dh		;7b37

; ==========================================================================
; LEVEL NUMBER DISPLAY ($7B39)
; ==========================================================================
; Calculates the current level number from the room state and
; copies the "@LEVEL@X@" text with the computed level digit
; to the screen via COPY_DATA_BLK.
;
; Level digit = $5C - room_state (so room $00 = level 92, etc.)
;
	ld hl,09942h		;7b39  ; HL -> room state byte
	ld a,05ch		;7b3c  ; A = $5C (92 decimal)
	sub (hl)			;7b3e  ; A = $5C - room_state (level number tile)
	ld (l7b5ah),a		;7b3f  ; Store computed level digit into text data
	ld b,009h		;7b42  ; B = 9 bytes to copy
	ld de,l7b53h		;7b44  ; DE -> level text data: "@LEVEL@X@"
	ld hl,l677dh		;7b47  ; HL = screen destination for level display
	call COPY_DATA_BLK		;7b4a  ; Copy level text to screen
	pop hl			;7b4d  ; Restore command list position
	dec hl			;7b4e  ; Back up one byte
	push hl			;7b4f  ; Save adjusted position
	jp STATE_JUMP_TBL		;7b50  ; -> continue command processing

; --- Level display text data: "@LEVEL@X@" ---
; $40 = '@' (space), $4C = 'L', $45 = 'E', $56 = 'V'
; Byte at $7B5A is patched with the computed level number tile.
;
l7b53h:
	ld b,b			;7b53  ; DATA: $40 = '@' (space)
	ld c,h			;7b54  ; DATA: $4C = 'L'
	ld b,l			;7b55  ; DATA: $45 = 'E'
	ld d,(hl)			;7b56  ; DATA: $56 = 'V'
	ld b,l			;7b57  ; DATA: $45 = 'E'
	ld c,h			;7b58  ; DATA: $4C = 'L'
	ld b,b			;7b59  ; DATA: $40 = '@' (space)
l7b5ah:
	ld e,b			;7b5a  ; DATA: level digit (patched at runtime)
	ld b,b			;7b5b  ; DATA: $40 = '@' (space)
; ==========================================================================
; ROOM ELEMENT HANDLERS WITH INLINE TILE DATA ($7B5C)
; ==========================================================================
; These handlers have their tile pattern data embedded directly after
; the setup code, rather than using shared pattern blocks. Each
; handler sets IX to point to its own inline data.
;

; --- Element A: 5x4 tiles with inline pattern ---
	ld ix,l7b6ah		;7b5c  ; IX -> inline tile data below
	ld c,005h		;7b60  ; C = 5 tiles wide
	ld b,004h		;7b62  ; B = 4 tiles tall
	ld hl,l673fh		;7b64  ; Screen destination
	jp STATE_JUMP_TBL_2		;7b67  ; -> tile copy engine
l7b6ah:
	dec bc			;7b6a  ; DATA: inline tile pattern (20 bytes)
	inc c			;7b6b
	dec c			;7b6c
	dec c			;7b6d
	ld c,00fh		;7b6e
	djnz l7b82h		;7b70
	djnz $+19		;7b72
	rrca			;7b74
	djnz $+18		;7b75
	djnz l7b8eh		;7b77
	ld (de),a			;7b79
	inc de			;7b7a
	inc d			;7b7b
	dec d			;7b7c
	rst 38h			;7b7d

; --- Element B: 2x3 tiles with inline pattern ---
	ld ix,l7b8ch		;7b7e  ; IX -> inline tile data below
l7b82h:
	ld c,002h		;7b82  ; C = 2 tiles wide
	ld b,003h		;7b84  ; B = 3 tiles tall
	ld hl,l6578h		;7b86  ; Screen destination
	jp STATE_JUMP_TBL_2		;7b89  ; -> tile copy engine
l7b8ch:
	ret m			;7b8c  ; DATA: inline tile pattern (6 bytes)
	ret m			;7b8d
l7b8eh:
	ret m			;7b8e
	pop de			;7b8f
	pop de			;7b90
	nop			;7b91

; --- Element C: 2x3 tiles with inline pattern ---
	ld ix,l7ba0h		;7b92  ; IX -> inline tile data below
	ld c,002h		;7b96  ; C = 2 tiles wide
	ld b,003h		;7b98  ; B = 3 tiles tall
	ld hl,l6581h		;7b9a  ; Screen destination
	jp STATE_JUMP_TBL_2		;7b9d  ; -> tile copy engine
l7ba0h:
	ret m			;7ba0  ; DATA: inline tile pattern (6 bytes)
	ret m			;7ba1
	ret nc			;7ba2
	ret m			;7ba3
	nop			;7ba4
	ret nc			;7ba5

; --- Element D: 3x3 tiles with inline pattern ---
	ld ix,l7bb4h		;7ba6  ; IX -> inline tile data below
	ld c,003h		;7baa  ; C = 3 tiles wide
	ld b,003h		;7bac  ; B = 3 tiles tall
	ld hl,l65d9h		;7bae  ; Screen destination
	jp STATE_JUMP_TBL_2		;7bb1  ; -> tile copy engine
l7bb4h:
	nop			;7bb4  ; DATA: inline tile pattern (9 bytes)
	nop			;7bb5
	adc a,000h		;7bb6
	adc a,0cfh		;7bb8
	adc a,0cfh		;7bba
	rst 8			;7bbc

; --- Element E: 3x3 tiles with inline pattern ---
	ld ix,l7bcbh		;7bbd  ; IX -> inline tile data below
	ld c,003h		;7bc1  ; C = 3 tiles wide
	ld b,003h		;7bc3  ; B = 3 tiles tall
	ld hl,l65dfh		;7bc5  ; Screen destination
	jp STATE_JUMP_TBL_2		;7bc8  ; -> tile copy engine
l7bcbh:
	call 00000h		;7bcb  ; DATA: inline tile pattern (9 bytes)
	rst 8			;7bce
	call sub_cf00h		;7bcf
	rst 8			;7bd2

; --- Element F: 3x4 tiles (shared entry) ---
	call 021ddh		;7bd3  ; DATA: (inline data continues from above)
	jr nc,$-46		;7bd6  ; DATA: (part of inline pattern)
	ld c,003h		;7bd8  ; C = 3 tiles wide
	ld b,004h		;7bda  ; B = 4 tiles tall
	ld hl,l64dch		;7bdc  ; Screen destination
	jp STATE_JUMP_TBL_2		;7bdf  ; -> tile copy engine
; ==========================================================================
; SECONDARY TILE RENDERER HANDLERS ($7BE2)
; ==========================================================================
; These handlers use the secondary tile copy routine at $7C3F which
; uses D (width) instead of C, and reads screen addresses from the
; command data stream (inline data following the command byte).
;

; --- Inline tile pattern data for handlers below ---
l7be2h:
	ld bc,0201fh		;7be2  ; DATA: tile pattern (15 bytes)
	ld e,01eh		;7be5
	ld hl,01e1eh		;7be7
	ld e,01eh		;7bea
	ld bc,02322h		;7bec
	inc h			;7bef
	inc h			;7bf0
l7bf1h:
	daa			;7bf1  ; DATA: tile pattern (6 bytes)
	jr z,l7c1dh		;7bf2
	ld e,02ah		;7bf4
	dec hl			;7bf6

; --- Handler G: 3x2 tiles using secondary renderer ---
	ld ix,l7bf1h		;7bf7  ; IX -> inline tile data at $7BF1
	ld d,003h		;7bfb  ; D = 3 tiles wide
	ld b,002h		;7bfd  ; B = 2 tiles tall
	jr l7c3fh		;7bff  ; -> secondary tile copy

; --- Handler H: 5x3 tiles using secondary renderer ---
	ld ix,l7be2h		;7c01  ; IX -> inline tile data at $7BE2
	ld d,005h		;7c05  ; D = 5 tiles wide
	ld b,003h		;7c07  ; B = 3 tiles tall
	jr l7c3fh		;7c09  ; -> secondary tile copy

; --- Handler I: 2x6 tiles (vertical element) ---
	ld ix,l7c1fh		;7c0b  ; IX -> inline tile data at $7C1F
	ld d,002h		;7c0f  ; D = 2 tiles wide
	ld b,006h		;7c11  ; B = 6 tiles tall
	jr l7c3fh		;7c13  ; -> secondary tile copy

; --- Handler J: 2x6 tiles (vertical element variant) ---
	ld ix,l7c2bh		;7c15  ; IX -> inline tile data at $7C2B
	ld d,002h		;7c19  ; D = 2 tiles wide
	ld b,006h		;7c1b  ; B = 6 tiles tall
l7c1dh:
	jr l7c3fh		;7c1d  ; -> secondary tile copy

; --- Inline tile data for handler I (12 bytes) ---
l7c1fh:
	nop			;7c1f  ; DATA: $00
	or 0f6h		;7c20  ; DATA: $F6, $F6
	ret m			;7c22  ; DATA: $F8
	ret m			;7c23  ; DATA: $F8
	ret m			;7c24  ; DATA: $F8
	ret m			;7c25  ; DATA: $F8
	ret m			;7c26  ; DATA: $F8
	ret m			;7c27  ; DATA: $F8
	ret m			;7c28  ; DATA: $F8
	pop de			;7c29  ; DATA: $D1
	nop			;7c2a  ; DATA: $00

; --- Inline tile data for handler J (12 bytes) ---
l7c2bh:
	push af			;7c2b  ; DATA: $F5
	nop			;7c2c  ; DATA: $00
	ret m			;7c2d  ; DATA: $F8
	push af			;7c2e  ; DATA: $F5
	ret m			;7c2f  ; DATA: $F8
	ret m			;7c30  ; DATA: $F8
	ret m			;7c31  ; DATA: $F8
	ret m			;7c32  ; DATA: $F8
	ret m			;7c33  ; DATA: $F8
	ret m			;7c34  ; DATA: $F8
	nop			;7c35  ; DATA: $00
	ret nc			;7c36  ; DATA: $D0

; --- Handler K: 6x1 tiles (single row, uses external pattern) ---
	ld ix,ld024h		;7c37  ; IX -> tile pattern in data_roommap.asm
	ld d,006h		;7c3b  ; D = 6 tiles wide
	ld b,001h		;7c3d  ; B = 1 tile tall
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
l7c3fh:
	pop hl			;7c3f  ; Restore command list position
	ld a,(hl)			;7c40  ; A = screen address low byte (from data)
	inc hl			;7c41
	push hl			;7c42  ; Save updated command list position
	ld h,(hl)			;7c43  ; H = screen address high byte
	ld l,a			;7c44  ; HL = screen destination address

; --- Copy tile rows ---
l7c45h:
	push de			;7c45  ; Save width counter
	push hl			;7c46  ; Save row start address
l7c47h:
	ld a,(ix+000h)		;7c47  ; A = tile byte from pattern
	ld (hl),a			;7c4a  ; Write to screen buffer
	inc hl			;7c4b  ; Next screen position
	inc ix		;7c4c  ; Next pattern byte
	dec d			;7c4e  ; Decrement column counter
	jr nz,l7c47h		;7c4f  ; More columns -> continue row
	pop hl			;7c51  ; Restore row start
	ld de,00020h		;7c52  ; DE = 32 (bytes per screen row)
	add hl,de			;7c55  ; HL -> next row start
	pop de			;7c56  ; Restore width counter
	djnz l7c45h		;7c57  ; More rows -> continue
	jp STATE_JUMP_TBL		;7c59  ; -> return to command interpreter
; --- Inline tile data for small decorative elements ---
l7c5ch:
	ld d,017h		;7c5c  ; DATA: tile pattern (9 bytes)
	jr $+27		;7c5e
	ld a,(de)			;7c60
	dec de			;7c61
	inc e			;7c62
	dec e			;7c63
	ld e,01fh		;7c64
	rra			;7c66
	rra			;7c67
	rra			;7c68

; --- Small decorative element (2x2 tiles) ---
	ld ix,07c65h		;7c69  ; IX -> inline tile data
	ld c,002h		;7c6d  ; C = 2 tiles wide
	ld b,002h		;7c6f  ; B = 2 tiles tall
	ld hl,l689dh		;7c71  ; Screen destination
	jr STATE_JUMP_TBL_2		;7c74  ; -> tile copy engine

; --- Score display area handler ---
; Disables score updates while drawing, then renders 3x3 tile block.
;
	xor a			;7c76  ; A = 0
	ld (UPDATE_SCORE+1),a		;7c77  ; Disable score display update (self-mod)
	ld ix,l7c5ch		;7c7a  ; IX -> decorative tile pattern
	ld c,003h		;7c7e  ; C = 3 tiles wide
	ld b,003h		;7c80  ; B = 3 tiles tall
	ld hl,l6820h		;7c82  ; Screen destination
	jr STATE_JUMP_TBL_2		;7c85  ; -> tile copy engine

; --- Conditional element: only draws if room data == 1 ---
	ld hl,l64a5h		;7c87  ; HL -> room condition flag
	ld a,(hl)			;7c8a  ; A = condition value
	dec a			;7c8b  ; Test if 1
	jr nz,l7caah		;7c8c  ; Not 1 -> skip drawing
	ld ix,l7cb0h		;7c8e  ; IX -> tile pattern at $7CB0
	ld c,002h		;7c92  ; C = 2 tiles wide
	ld b,002h		;7c94  ; B = 2 tiles tall
; ==========================================================================
; STATE_JUMP_TBL_2 - TILE COPY ENGINE ($7C96)
; ==========================================================================
; The core tile rendering routine. Copies a rectangular block of tile
; bytes from the pattern data (pointed to by IX) to the screen buffer
; (pointed to by HL). Each row advances HL by 32 bytes ($20 = one
; screen line in the ZX Spectrum's screen buffer layout).
;
; On entry:
;   HL = screen buffer destination address
;   IX = source tile pattern data pointer
;   C  = width (tiles per row)
;   B  = height (number of rows)
;
; On exit:
;   IX advanced past all copied bytes
;   Returns to command interpreter via STATE_JUMP_TBL
;
STATE_JUMP_TBL_2:
	ld de,00020h		;7c96  ; DE = 32 (bytes per screen row)
l7c99h:
	push bc			;7c99  ; Save row/column counters
	push hl			;7c9a  ; Save row start address
l7c9bh:
	ld a,(ix+000h)		;7c9b  ; A = tile byte from pattern data
	ld (hl),a			;7c9e  ; Write to screen buffer
	inc hl			;7c9f  ; Next screen position
	inc ix		;7ca0  ; Next pattern byte
	dec c			;7ca2  ; Decrement column counter
	jr nz,l7c9bh		;7ca3  ; More columns -> continue this row
	pop hl			;7ca5  ; Restore row start address
	pop bc			;7ca6  ; Restore counters
	add hl,de			;7ca7  ; HL += 32 (advance to next row)
	djnz l7c99h		;7ca8  ; More rows -> continue

; --- Return to command interpreter ---
l7caah:
	pop hl			;7caa  ; Restore command list position
	dec hl			;7cab  ; Back up one byte
	push hl			;7cac  ; Save adjusted position
	jp STATE_JUMP_TBL		;7cad  ; -> process next command
; --- Conditional tile data (4 bytes) + object handler ---
l7cb0h:
	ld a,(de)			;7cb0  ; DATA: inline tile pattern (4 bytes)
	dec de			;7cb1
	inc e			;7cb2
	dec e			;7cb3

; --- Object pattern: 5x8 tiles using $78A7 pattern ---
	ld ix,l78a7h		;7cb4  ; IX -> object pattern at $78A7
	ld c,005h		;7cb8  ; C = 5 tiles wide
	ld b,008h		;7cba  ; B = 8 tiles tall
	ld hl,l6560h		;7cbc  ; Screen destination
	jr STATE_JUMP_TBL_2		;7cbf  ; -> tile copy engine

; ==========================================================================
; ROOM OBJECT HANDLERS ($7CC1)
; ==========================================================================
; Handlers for interactive room objects (doors, containers, items).
; Three tile pattern sizes:
;   ROOM_OBJECT_TBL: 11x7 tiles ($7E30) - standard large objects
;   l7ce7h:          10x7 tiles ($7E7D) - wide objects
;   l7cfch:           8x4 tiles ($7D13) - compact objects
;
	ld hl,l67d3h		;7cc1  ; Object screen position
	jr ROOM_OBJECT_TBL		;7cc4  ; -> 11x7 standard object

	ld hl,l6816h		;7cc6  ; Object screen position
	jr l7cfch		;7cc9  ; -> 8x4 compact object

	ld hl,l66b3h		;7ccb  ; Object screen position
	jr l7ce7h		;7cce  ; -> 10x7 wide object

	ld hl,l67adh		;7cd0  ; Object screen position
	jr ROOM_OBJECT_TBL		;7cd3  ; -> 11x7 standard object

	ld hl,l66adh		;7cd5  ; Object screen position
	jr l7ce7h		;7cd8  ; -> 10x7 wide object

	ld hl,l679bh		;7cda  ; Object screen position
	jr ROOM_OBJECT_TBL		;7cdd  ; -> 11x7 standard object

	ld hl,l678dh		;7cdf  ; Object screen position
	jr ROOM_OBJECT_TBL		;7ce2  ; -> 11x7 standard object

	ld hl,l679fh		;7ce4  ; Object screen position

; --- 10x7 wide object renderer ---
l7ce7h:
	ld c,00ah		;7ce7  ; C = 10 tiles wide
	ld ix,l7e7dh		;7ce9  ; IX -> wide object pattern at $7E7D
	jr l7d0fh		;7ced  ; -> B=7, draw

	ld hl,l679eh		;7cef  ; Object screen position
	jr ROOM_OBJECT_TBL		;7cf2  ; -> 11x7 standard object

	ld hl,l678fh		;7cf4  ; Object screen position
	jr ROOM_OBJECT_TBL		;7cf7  ; -> 11x7 standard object

; --- 8x4 compact object renderer ---
	ld hl,l67f5h		;7cf9  ; Object screen position
l7cfch:
	ld c,008h		;7cfc  ; C = 8 tiles wide
	ld ix,l7d13h		;7cfe  ; IX -> compact object pattern at $7D13
	ld b,004h		;7d02  ; B = 4 tiles tall
	jr STATE_JUMP_TBL_2		;7d04  ; -> tile copy engine

; --- 11x7 standard object renderer ---
	ld hl,l67b6h		;7d06  ; Object screen position
ROOM_OBJECT_TBL:
	ld c,00bh		;7d09  ; C = 11 tiles wide
	ld ix,l7e30h		;7d0b  ; IX -> standard object pattern at $7E30
l7d0fh:
	ld b,007h		;7d0f  ; B = 7 tiles tall
	jr STATE_JUMP_TBL_2		;7d11  ; -> tile copy engine
; ==========================================================================
; COMPACT OBJECT TILE DATA ($7D13)
; ==========================================================================
; 8x4 tile pattern for compact room objects (32 bytes).
; Used by the compact object renderer at l7cfch.
;
l7d13h:
	ld (bc),a			;7d13  ; DATA: object tile pattern
	inc bc			;7d14
	inc bc			;7d15
	inc bc			;7d16
	inc bc			;7d17
	inc bc			;7d18
	inc bc			;7d19
	inc b			;7d1a
	dec b			;7d1b
	ld b,006h		;7d1c
	ld b,006h		;7d1e
	ld b,006h		;7d20
	rlca			;7d22
	dec b			;7d23
	ld b,006h		;7d24
	ld b,006h		;7d26
	ld b,006h		;7d28
	rlca			;7d2a
	ex af,af'			;7d2b
	add hl,bc			;7d2c
	add hl,bc			;7d2d
	add hl,bc			;7d2e
	add hl,bc			;7d2f
	add hl,bc			;7d30
	add hl,bc			;7d31
	ld a,(bc)			;7d32  ; (end of compact object tile data)

; --- Element: 6x4 tiles using $7E18 pattern ---
	ld ix,l7e18h		;7d33  ; IX -> tile pattern at $7E18
	ld c,006h		;7d37  ; C = 6 tiles wide
	ld b,004h		;7d39  ; B = 4 tiles tall
	ld hl,l6824h		;7d3b  ; Screen destination
l7d3eh:
	jp STATE_JUMP_TBL_2		;7d3e  ; -> tile copy engine

; ==========================================================================
; LIFT STATE DISPLAY HANDLERS ($7D41)
; ==========================================================================
; Handles drawing the lift/elevator in its various states:
;   - LIFT_STATE_CTR == $FF: lift arrived, draw 11x5 arrival graphic
;   - LIFT_STATE_CTR == $FE: lift transitioning, reset to $10
;   - Otherwise: skip lift drawing
;
	ld a,(LIFT_STATE_CTR)		;7d41  ; A = lift state counter
	inc a			;7d44  ; Test if $FF (inc -> 0)
	jr nz,l7d60h		;7d45  ; Not $FF -> check alternate state

; --- Lift arrived: draw arrival graphic (11x5 tiles) ---
	ld ix,l7daah		;7d47  ; IX -> lift arrival tile pattern
	ld c,00bh		;7d4b  ; C = 11 tiles wide
	ld b,005h		;7d4d  ; B = 5 tiles tall
	ld hl,l67d8h		;7d4f  ; Screen destination for lift
	jr l7d3eh		;7d52  ; -> draw via tile copy engine

; --- Lift transition: reset counter ---
	ld a,(LIFT_STATE_CTR)		;7d54  ; A = lift state counter
	cp 0feh		;7d57  ; Is it $FE (transition state)?
	jr nz,l7d60h		;7d59  ; No -> skip
	ld a,010h		;7d5b  ; A = $10 (16: restart countdown)
	ld (LIFT_STATE_CTR),a		;7d5d  ; Reset lift counter

l7d60h:
	jp l7caah		;7d60  ; -> return to command interpreter
; --- Small tile patterns for misc room elements ---
l7d63h:
	adc a,c			;7d63  ; DATA: 4x4 tile pattern (16 bytes)
	adc a,d			;7d64
	adc a,d			;7d65
	adc a,e			;7d66
	rst 38h			;7d67
	rst 38h			;7d68
	ld hl,IM2_JUMP_TARGET		;7d69
	rst 38h			;7d6c
	ld hl,IM2_JUMP_TARGET		;7d6d
	rst 38h			;7d70
	ld hl,ld2ffh		;7d71
	jp nc,ld3d3h		;7d74
	push de			;7d77  ; (end of tile data)

; --- 4x4 tile element handler ---
	ld hl,l67f0h		;7d78  ; Screen destination
l7d7bh:
	ld ix,l7d63h		;7d7b  ; IX -> 4x4 tile pattern
	ld c,004h		;7d7f  ; C = 4 tiles wide
	ld b,004h		;7d81  ; B = 4 tiles tall
	jp STATE_JUMP_TBL_2		;7d83  ; -> tile copy engine

; --- Single-row element handler (5x1 tiles) ---
	ld hl,l662fh		;7d86  ; Screen destination
l7d89h:
	ld ix,07d73h		;7d89  ; IX -> single-row tile data
	ld c,005h		;7d8d  ; C = 5 tiles wide
	ld b,001h		;7d8f  ; B = 1 tile tall
	jp STATE_JUMP_TBL_2		;7d91  ; -> tile copy engine

; --- Single-row variant ---
	ld hl,l661ch		;7d94  ; Screen destination
	jr l7d89h		;7d97  ; -> 5x1 handler

; --- 4x4 element variant ---
	ld hl,l67ddh		;7d99  ; Screen destination
	jr l7d7bh		;7d9c  ; -> 4x4 handler

; --- Set transition counter handler ---
	ld a,05ah		;7d9e  ; A = $5A (90 frames)
	ld (TRANSITION_CTR),a		;7da0  ; Set transition counter
	jp l7caah		;7da3  ; -> return to command interpreter
; ==========================================================================
; GAME STATE VARIABLES ($7DA6)
; ==========================================================================
LIFT_STATE_CTR:
	nop			;7da6  ; DATA: lift state counter (0=idle, $FF=arrived)
	nop			;7da7  ; DATA: lift sub-state
l7da8h:
	nop			;7da8  ; DATA: message area position low byte
	nop			;7da9  ; DATA: message area position high byte

; ==========================================================================
; LIFT/OBJECT TILE PATTERN DATA ($7DAA-$7EC2)
; ==========================================================================
; Embedded tile pattern bitmaps for lift graphics, room objects, and
; decorative elements. Referenced by IX register from handlers above.
;
; Key pattern blocks:
;   $7DAA: Lift arrival graphic (11x5 = 55 bytes)
;   $7DE1: Alternate lift graphic (11x5 = 55 bytes)
;   $7E18: Room element pattern (6x4 = 24 bytes)
;   $7E30: Standard object pattern (11x7 = 77 bytes)
;   $7E7D: Wide object pattern (10x7 = 70 bytes)
;   $7EAC: Additional object patterns
;
; Tile byte values: $FF = empty/transparent, $62-$87 = tile indices
; for characters in the range 'b'-'G' (mapped by the renderer).
;
l7daah:
	rst 38h			;7daa  ; DATA: lift tile pattern start
	rst 38h			;7dab
	ld h,d			;7dac
	ld h,e			;7dad
	rst 38h			;7dae
	rst 38h			;7daf
	rst 38h			;7db0
	rst 38h			;7db1
	rst 38h			;7db2
	rst 38h			;7db3
	rst 38h			;7db4
	rst 38h			;7db5
	ld h,h			;7db6
l7db7h:
	ld h,l			;7db7
	add a,d			;7db8
	add a,e			;7db9
	add a,h			;7dba
	add a,l			;7dbb
	ld h,(hl)			;7dbc
	rst 38h			;7dbd
	rst 38h			;7dbe
	rst 38h			;7dbf
	ld h,a			;7dc0
	ld l,b			;7dc1
	ld l,c			;7dc2
	ld l,d			;7dc3
	add a,(hl)			;7dc4
	add a,a			;7dc5
	ld l,l			;7dc6
	ld l,(hl)			;7dc7
	ld l,a			;7dc8
	rst 38h			;7dc9
	rst 38h			;7dca
	ld (hl),b			;7dcb
	ld (hl),c			;7dcc
	ld (hl),d			;7dcd
	ld (hl),e			;7dce
	adc a,b			;7dcf
	ld (hl),l			;7dd0
	halt			;7dd1
	ld (hl),a			;7dd2
	ld a,b			;7dd3
	rst 38h			;7dd4
	rst 38h			;7dd5
	ld a,c			;7dd6
	ld a,d			;7dd7
	ld a,e			;7dd8
	ld a,h			;7dd9
	ld a,l			;7dda
	ld a,(hl)			;7ddb
	ld a,a			;7ddc
	add a,b			;7ddd
	add a,c			;7dde
	rst 38h			;7ddf
	rst 38h			;7de0
l7de1h:
	rst 38h			;7de1
	rst 38h			;7de2
	ld h,d			;7de3
	ld h,e			;7de4
	rst 38h			;7de5
	rst 38h			;7de6
	rst 38h			;7de7
	rst 38h			;7de8
	rst 38h			;7de9
	rst 38h			;7dea
	rst 38h			;7deb
	rst 38h			;7dec
	ld h,h			;7ded
	ld h,l			;7dee
	rst 38h			;7def
	rst 38h			;7df0
	rst 38h			;7df1
	rst 38h			;7df2
	ld h,(hl)			;7df3
	rst 38h			;7df4
	rst 38h			;7df5
	rst 38h			;7df6
	ld h,a			;7df7
	ld l,b			;7df8
	ld l,c			;7df9
	ld l,d			;7dfa
	ld l,e			;7dfb
	ld l,h			;7dfc
	ld l,l			;7dfd
	ld l,(hl)			;7dfe
	ld l,a			;7dff
	rst 38h			;7e00
	rst 38h			;7e01
	ld (hl),b			;7e02
	ld (hl),c			;7e03
	ld (hl),d			;7e04
	ld (hl),e			;7e05
	ld (hl),h			;7e06
	ld (hl),l			;7e07
	halt			;7e08
	ld (hl),a			;7e09
	ld a,b			;7e0a
	rst 38h			;7e0b
	rst 38h			;7e0c
	ld a,c			;7e0d
	ld a,d			;7e0e
	ld a,e			;7e0f
	ld a,h			;7e10
	ld a,l			;7e11
	ld a,(hl)			;7e12
	ld a,a			;7e13
	add a,b			;7e14
	add a,c			;7e15
	rst 38h			;7e16
	rst 38h			;7e17
l7e18h:
	ld (02423h),hl		;7e18
	inc h			;7e1b
	dec h			;7e1c
	ld h,027h		;7e1d
	jr z,$+1		;7e1f
	rst 38h			;7e21
	daa			;7e22
	jr z,l7e4ch		;7e23
	jr z,$+1		;7e25
	rst 38h			;7e27
	daa			;7e28
	jr z,l7db7h		;7e29
	rst 38h			;7e2b
	rst 38h			;7e2c
	rst 38h			;7e2d
	rst 38h			;7e2e
	adc a,l			;7e2f
l7e30h:
	ld (bc),a			;7e30
	inc bc			;7e31
	inc b			;7e32
	rst 38h			;7e33
	rst 38h			;7e34
	rst 38h			;7e35
	rst 38h			;7e36
	rst 38h			;7e37
	rst 38h			;7e38
	rst 38h			;7e39
	rst 38h			;7e3a
	dec b			;7e3b
	ld b,007h		;7e3c
	rst 38h			;7e3e
	rst 38h			;7e3f
	rst 38h			;7e40
	ld (bc),a			;7e41
	inc bc			;7e42
	inc bc			;7e43
	inc b			;7e44
	rst 38h			;7e45
	ex af,af'			;7e46
	add hl,bc			;7e47
	ld a,(bc)			;7e48
	rst 38h			;7e49
	rst 38h			;7e4a
	rst 38h			;7e4b
l7e4ch:
	dec b			;7e4c
	ld b,006h		;7e4d
	rlca			;7e4f
	rst 38h			;7e50
	ld (bc),a			;7e51
	inc bc			;7e52
	inc bc			;7e53
	inc bc			;7e54
	inc b			;7e55
	rst 38h			;7e56
	ex af,af'			;7e57
	add hl,bc			;7e58
	add hl,bc			;7e59
	ld a,(bc)			;7e5a
	rst 38h			;7e5b
	dec b			;7e5c
	ld b,006h		;7e5d
	ld b,002h		;7e5f
	inc bc			;7e61
	inc b			;7e62
	rst 38h			;7e63
	ld (bc),a			;7e64
	inc bc			;7e65
	inc b			;7e66
	dec b			;7e67
	ld b,006h		;7e68
	ld b,005h		;7e6a
	ld b,007h		;7e6c
	rst 38h			;7e6e
	dec b			;7e6f
	ld b,007h		;7e70
	ex af,af'			;7e72
	add hl,bc			;7e73
	add hl,bc			;7e74
	add hl,bc			;7e75
	ex af,af'			;7e76
	add hl,bc			;7e77
	ld a,(bc)			;7e78
	rst 38h			;7e79
	ex af,af'			;7e7a
	add hl,bc			;7e7b
	ld a,(bc)			;7e7c
l7e7dh:
	rst 38h			;7e7d
	rst 38h			;7e7e
	rst 38h			;7e7f
	rst 38h			;7e80
	ld (bc),a			;7e81
	inc bc			;7e82
	inc bc			;7e83
	inc b			;7e84
	rst 38h			;7e85
	rst 38h			;7e86
	rst 38h			;7e87
	rst 38h			;7e88
	rst 38h			;7e89
	rst 38h			;7e8a
	dec b			;7e8b
	ld b,006h		;7e8c
	rlca			;7e8e
	rst 38h			;7e8f
	rst 38h			;7e90
	rst 38h			;7e91
	rst 38h			;7e92
	rst 38h			;7e93
	rst 38h			;7e94
	ex af,af'			;7e95
	add hl,bc			;7e96
	add hl,bc			;7e97
	ld a,(bc)			;7e98
	rst 38h			;7e99
	rst 38h			;7e9a
	rst 38h			;7e9b
	rst 38h			;7e9c
	ld (bc),a			;7e9d
	inc bc			;7e9e
	inc bc			;7e9f
	inc b			;7ea0
	rst 38h			;7ea1
	ld (bc),a			;7ea2
	inc bc			;7ea3
	inc b			;7ea4
	ld (bc),a			;7ea5
	inc bc			;7ea6
	inc b			;7ea7
	ld b,006h		;7ea8
	rlca			;7eaa
	rst 38h			;7eab
l7each:
	dec b			;7eac
	ld b,007h		;7ead
	dec b			;7eaf
	ld b,007h		;7eb0
	ld b,006h		;7eb2
	rlca			;7eb4
	rst 38h			;7eb5
	dec b			;7eb6
	ld b,007h		;7eb7
	ex af,af'			;7eb9
	add hl,bc			;7eba
	ld a,(bc)			;7ebb
	add hl,bc			;7ebc
	add hl,bc			;7ebd
	ld a,(bc)			;7ebe
	rst 38h			;7ebf
	ex af,af'			;7ec0
	add hl,bc			;7ec1
	ld a,(bc)			;7ec2
; ==========================================================================
; MISSION COMPLETION STATE ($7EC3)
; ==========================================================================
; Three command handlers that set the mission completion flag to 1, 2,
; or 3 respectively. The flag at l7ec3h tracks which ending the player
; has reached (different completion states trigger different outcomes).
;
l7ec3h:
	nop			;7ec3  ; DATA: mission completion state (0-3)
	nop			;7ec4  ; DATA: (padding)

; --- Set completion state = 1 ---
	ld a,001h		;7ec5  ; A = 1
	jr l7ecfh		;7ec7  ; -> store state

; --- Set completion state = 2 ---
	ld a,002h		;7ec9  ; A = 2
	jr l7ecfh		;7ecb  ; -> store state

; --- Set completion state = 3 ---
	ld a,003h		;7ecd  ; A = 3
l7ecfh:
	ld (l7ec3h),a		;7ecf  ; Store mission completion state
	jr l7f00h		;7ed2  ; -> return to command interpreter
; ==========================================================================
; IN-GAME TEXT DATA ($7ED4)
; ==========================================================================
; Text strings used for room messages and mission narrative.
; Displayed as tile indices by the room command system.
;
; $7ED4 (18 bytes): "OLONEL RIGGSY  EX" (part of "COLONEL RIGGSY")
; $7EE6 (6 bytes):  "PLORER" (end of "EXPLORER")
;
l7ed4h:
	ld c,a			;7ed4  ; DATA: $4F = 'O'
	ld c,h			;7ed5  ; DATA: $4C = 'L'
	ld c,a			;7ed6  ; DATA: $4F = 'O'
	ld c,(hl)			;7ed7  ; DATA: $4E = 'N'
	ld b,l			;7ed8  ; DATA: $45 = 'E'
	ld c,h			;7ed9  ; DATA: $4C = 'L'
	jr nz,l7f1eh		;7eda  ; DATA: $20 = ' ', $42 (offset)
	ld d,d			;7edc  ; DATA: $52 = 'R'
	ld c,c			;7edd  ; DATA: $49 = 'I'
	ld b,a			;7ede  ; DATA: $47 = 'G'
	ld b,a			;7edf  ; DATA: $47 = 'G'
	ld d,e			;7ee0  ; DATA: $53 = 'S'
	ld e,c			;7ee1  ; DATA: $59 = 'Y'
	jr nz,$+34		;7ee2  ; DATA: $20 = ' ', $20 = ' '
	ld b,l			;7ee4  ; DATA: $45 = 'E'
	ld e,b			;7ee5  ; DATA: $58 = 'X'
l7ee6h:
	ld d,b			;7ee6  ; DATA: $50 = 'P'
	ld c,h			;7ee7  ; DATA: $4C = 'L'
	ld c,a			;7ee8  ; DATA: $4F = 'O'
	ld d,d			;7ee9  ; DATA: $52 = 'R'
	ld b,l			;7eea  ; DATA: $45 = 'E'
	ld d,d			;7eeb  ; DATA: $52 = 'R'
; --- Game state flags ---
l7eech:
	nop			;7eec  ; DATA: special room flag (0=not set, 1=set)
	nop			;7eed  ; DATA: (padding)

; --- " BIKE ARRIVED " message text (14 bytes) ---
; Displayed when the motorcycle arrives at the special room ($13).
; Referenced by code_init.asm l76f9h with C=14.
;
l7eeeh:
	jr nz,l7f32h		;7eee  ; DATA: $20 = ' ', $42 = 'B' (JR offset)
	ld c,c			;7ef0  ; DATA: $49 = 'I'
	ld c,e			;7ef1  ; DATA: $4B = 'K'
	ld b,l			;7ef2  ; DATA: $45 = 'E'
	jr nz,$+67		;7ef3  ; DATA: $20 = ' ', $41 = 'A' (JR offset)
	ld d,d			;7ef5  ; DATA: $52 = 'R'
	ld d,d			;7ef6  ; DATA: $52 = 'R'
	ld c,c			;7ef7  ; DATA: $49 = 'I'
	ld d,(hl)			;7ef8  ; DATA: $56 = 'V'
	ld b,l			;7ef9  ; DATA: $45 = 'E'
	ld b,h			;7efa  ; DATA: $44 = 'D'
	jr nz,l7each		;7efb  ; DATA: $20 = ' ', $AD (JR offset, part of next)
; ==========================================================================
; SCREEN COMPOSITOR & MEMORY WRITE COMMANDS ($7EFD)
; ==========================================================================
; Command handlers for setting game state and writing to memory.
;

; --- Set screen compositor state ---
l7efdh:
	ld (l9fdch),a		;7efd  ; Set compositor state to A

; --- Return to command interpreter (standard exit) ---
l7f00h:
	pop hl			;7f00  ; Restore command list position
	dec hl			;7f01  ; Back up one byte
	push hl			;7f02  ; Save adjusted position
	jp STATE_JUMP_TBL		;7f03  ; -> process next command

; --- Set compositor state to $77 ---
	ld a,077h		;7f06  ; A = $77 (specific compositor mode)
	jr l7efdh		;7f08  ; -> set and return

; --- Fill memory block: read fill value from command data ---
; Reads 1 byte from command list, fills 575 bytes at HISCORE_TBL.
;
	pop hl			;7f0a  ; Restore command list position
	ld a,(hl)			;7f0b  ; A = fill value from command data
	push hl			;7f0c  ; Save position
	ld hl,HISCORE_TBL		;7f0d  ; HL = $644C (target area)
	ld (hl),a			;7f10  ; Set first byte
	ld de,l644dh		;7f11  ; DE = $644D (next byte)
	ld bc,0023fh		;7f14  ; BC = 575 bytes
	ldir		;7f17  ; Fill entire area
	jp STATE_JUMP_TBL		;7f19  ; -> return to command interpreter

; --- Write byte to address: read value, addr_lo, addr_hi ---
	pop hl			;7f1c  ; Restore command list position
	ld a,(hl)			;7f1d  ; A = value to write
l7f1eh:
	inc hl			;7f1e  ; Skip to address low byte
	ld e,(hl)			;7f1f  ; E = address low byte
	inc hl			;7f20
	ld d,(hl)			;7f21  ; D = address high byte
	push hl			;7f22  ; Save command list position
	ld (de),a			;7f23  ; Write value to target address
	jp STATE_JUMP_TBL		;7f24  ; -> return to command interpreter

; --- Write two consecutive bytes ($CA, $CB) to address ---
	ld a,0cah		;7f27  ; A = $CA (first byte)
	pop hl			;7f29  ; Restore command list position
	ld e,(hl)			;7f2a  ; E = address low byte
	inc hl			;7f2b
	ld d,(hl)			;7f2c  ; D = address high byte
	push hl			;7f2d  ; Save position
	ld (de),a			;7f2e  ; Write $CA to target
	inc de			;7f2f  ; Next target byte
	inc a			;7f30  ; A = $CB
	ld (de),a			;7f31  ; Write $CB to target+1
l7f32h:
	jp STATE_JUMP_TBL		;7f32  ; -> return to command interpreter
; ==========================================================================
; SCREEN FILL COMMAND HANDLERS ($7F35)
; ==========================================================================
; Command handlers that fill screen areas with patterns. Each handler
; sets DE to a stride value, then reads parameters from the command
; data stream: B=count, C=fill_byte, then HL=screen_address.
;
; Stride values determine the fill direction:
;   DE=$0001: horizontal (fill right, 1 byte apart)
;   DE=$0020: vertical (fill down, 32 bytes = one row apart)
;   DE=$001F: diagonal left (32-1 = one row down, one col left)
;   DE=$0021: diagonal right (32+1 = one row down, one col right)
;

; --- Horizontal fill (stride = 1) ---
	ld de,00001h		;7f35  ; DE = 1 (horizontal: right)
	jr l7f50h		;7f38  ; -> common fill routine

; --- Inline data for diagonal repeat handler ---
l7f3ah:
	ld b,0d6h		;7f3a  ; DATA: inline parameters
	add a,(hl)			;7f3c
	ld h,h			;7f3d

; --- Diagonal fill with repeat (pushes return address) ---
	pop hl			;7f3e  ; Restore command list position
	ld hl,l7f3ah		;7f3f  ; HL = inline parameter address
	push hl			;7f42  ; Push as return target for repeat
	ld de,00021h		;7f43  ; DE = $21 (diagonal right: down+right)
	jr l7f50h		;7f46  ; -> common fill routine

; --- Diagonal left fill (stride = $1F) ---
	ld de,0001fh		;7f48  ; DE = $1F (diagonal left: down+left)
	jr l7f50h		;7f4b  ; -> common fill routine

; --- Vertical fill (stride = $20) ---
	ld de,00020h		;7f4d  ; DE = $20 (vertical: straight down)

; --- Common fill routine ---
; Reads from command data: B=count, C=fill_byte, addr_lo, addr_hi
; Fills B bytes with value C, advancing by DE between each byte.
;
l7f50h:
	pop hl			;7f50  ; Restore command list position
	ld b,(hl)			;7f51  ; B = fill count
	inc hl			;7f52
	ld c,(hl)			;7f53  ; C = fill value (tile byte)
	inc hl			;7f54
	ld a,(hl)			;7f55  ; A = screen address low byte
	inc hl			;7f56
	push hl			;7f57  ; Save command list position
	ld h,(hl)			;7f58  ; H = screen address high byte
	ld l,a			;7f59  ; HL = screen destination address
l7f5ah:
	ld (hl),c			;7f5a  ; Write fill byte to screen
	add hl,de			;7f5b  ; Advance by stride
	djnz l7f5ah		;7f5c  ; Loop for B bytes
	jp STATE_JUMP_TBL		;7f5e  ; -> return to command interpreter
; ==========================================================================
; PAIRED FILL HANDLERS ($7F61)
; ==========================================================================
; These handlers fill screen positions with alternating tile pairs.
; Each iteration writes C at position, then C+1 at position+1,
; then advances down by 32 bytes ($1F stride + the 1 from inc hl).
; The initial tile value C varies per handler (floor/wall types).
;
	ld c,02ch		;7f61  ; C = $2C (tile pair $2C/$2D)
	jr l7f6fh		;7f63
	ld c,009h		;7f65  ; C = $09 (tile pair $09/$0A)
	jr l7f6fh		;7f67
	ld c,025h		;7f69  ; C = $25 (tile pair $25/$26)
	jr l7f6fh		;7f6b
	ld c,005h		;7f6d  ; C = $05 (tile pair $05/$06)
l7f6fh:
	ld de,0001fh		;7f6f  ; DE = $1F (stride: down one row, back one col)
	pop hl			;7f72  ; Restore command list position
	ld b,(hl)			;7f73  ; B = fill count
	inc hl			;7f74
	ld a,(hl)			;7f75  ; A = screen address low byte
	inc hl			;7f76
	push hl			;7f77  ; Save command list position
	ld h,(hl)			;7f78  ; H = screen address high byte
	ld l,a			;7f79  ; HL = screen destination
l7f7ah:
	ld (hl),c			;7f7a  ; Write first tile of pair
	inc hl			;7f7b  ; Next column
	inc c			;7f7c  ; C = second tile of pair
	ld (hl),c			;7f7d  ; Write second tile
	dec c			;7f7e  ; Restore C to first tile
	add hl,de			;7f7f  ; Advance down by one row (net: +$20)
	djnz l7f7ah		;7f80  ; Loop for B rows
	jp STATE_JUMP_TBL		;7f82  ; -> return to command interpreter
; ==========================================================================
; BITMAP CHARACTER RENDERER ($7F85)
; ==========================================================================
; Renders bitmap characters to the ZX Spectrum screen buffer. Reads
; character indices from the command data and looks up their bitmap
; data in the address table at $7FC9. Each character is 8 bytes wide
; and 6 pixel rows tall, rendered to the high-score display area.
;
; Layout: 3 rows of 4 characters each (3x4 = 12 characters total).
; Screen buffer uses the ZX Spectrum's interleaved line layout:
;   - 8 bytes per character column within a row
;   - $18 (24) byte stride between pixel rows in screen memory
;   - $A0 (160) byte stride between character rows
;
	ld de,HISCORE_TBL		;7f85  ; DE = $644C (screen buffer destination)
	ld b,003h		;7f88  ; B = 3 (character rows)
l7f8ah:
	ld c,004h		;7f8a  ; C = 4 (characters per row)
l7f8ch:
	pop hl			;7f8c  ; Restore command list position
	ld a,(hl)			;7f8d  ; A = character index from data
	inc hl			;7f8e
	push hl			;7f8f  ; Save updated position
	push de			;7f90  ; Save screen destination

; --- Look up character bitmap address ---
	exx			;7f91  ; Switch to alternate registers
	ld l,a			;7f92  ; L = character index
	ld h,000h		;7f93  ; HL = index (16-bit)
	add hl,hl			;7f95  ; HL *= 2 (2-byte address entries)
	ld de,l7fc9h		;7f96  ; DE = bitmap address table base
	add hl,de			;7f99  ; HL -> address table entry
	ld a,(hl)			;7f9a  ; A = bitmap address low byte
	inc hl			;7f9b
	ld h,(hl)			;7f9c  ; H = bitmap address high byte
	ld l,a			;7f9d  ; HL = character bitmap source

; --- Copy 6 rows of 8 bytes each ---
	pop de			;7f9e  ; Restore screen destination
	ld b,006h		;7f9f  ; B = 6 pixel rows per character
l7fa1h:
	ld c,008h		;7fa1  ; C = 8 bytes per row (8 pixels wide)
l7fa3h:
	ld a,(hl)			;7fa3  ; A = bitmap byte
	inc hl			;7fa4
	ld (de),a			;7fa5  ; Write to screen buffer
	inc de			;7fa6
	dec c			;7fa7  ; Decrement column counter
	jr nz,l7fa3h		;7fa8  ; More bytes in row -> continue
	push hl			;7faa  ; Save source position
	ld hl,00018h		;7fab  ; HL = $18 (24 bytes to next pixel line)
	add hl,de			;7fae  ; DE += 24 (advance to next pixel row)
	ex de,hl			;7faf
	pop hl			;7fb0  ; Restore source position
	djnz l7fa1h		;7fb1  ; More rows -> continue

; --- Advance to next character position ---
	exx			;7fb3  ; Switch back to main registers
	ld hl,00008h		;7fb4  ; HL = 8 (character width in bytes)
	add hl,de			;7fb7  ; DE += 8 (next character column)
	ex de,hl			;7fb8
	dec c			;7fb9  ; Decrement character-per-row counter
	jr nz,l7f8ch		;7fba  ; More characters in row -> continue

; --- Advance to next character row ---
	ld hl,000a0h		;7fbc  ; HL = $A0 (160 bytes to next row)
	add hl,de			;7fbf  ; DE += 160
	ex de,hl			;7fc0
	djnz l7f8ah		;7fc1  ; More rows -> continue

	pop hl			;7fc3  ; Restore command list position
	dec hl			;7fc4
	push hl			;7fc5
	jp STATE_JUMP_TBL		;7fc6  ; -> return to command interpreter
; ==========================================================================
; BITMAP ADDRESS LOOKUP TABLE ($7FC9)
; ==========================================================================
; Address table for the bitmap character renderer at $7F85.
; Each entry is a 2-byte address pointing to a 48-byte bitmap
; (8 bytes wide x 6 rows). Indexed by character code from the
; command data stream.
;
l7fc9h:
	ei			;7fc9  ; DATA: address table entry 0
	ld a,a			;7fca
	dec hl			;7fcb  ; DATA: address table entry 1
	add a,b			;7fcc
	xor l			;7fcd
	add a,d			;7fce
	defb 0ddh,082h,00dh	;illegal sequence		;7fcf
	add a,e			;7fd2
	dec a			;7fd3
	add a,e			;7fd4
	ld l,l			;7fd5
	add a,e			;7fd6
	sbc a,l			;7fd7
	add a,e			;7fd8
	call sub_fd83h		;7fd9
	add a,e			;7fdc
	dec l			;7fdd
	add a,h			;7fde
	ld e,l			;7fdf
	add a,h			;7fe0
	adc a,l			;7fe1
	add a,h			;7fe2
	cp l			;7fe3
	add a,h			;7fe4
	defb 0edh;next byte illegal after ed		;7fe5
	add a,h			;7fe6
	dec e			;7fe7
	add a,l			;7fe8
	ld c,l			;7fe9
	add a,l			;7fea
	ld a,l			;7feb
	add a,l			;7fec
	xor l			;7fed
	add a,l			;7fee
	add a,ixl		;7fef
	dec c			;7ff1
	add a,(hl)			;7ff2
	dec a			;7ff3
	add a,(hl)			;7ff4
	ld l,l			;7ff5
	add a,(hl)			;7ff6
	sbc a,l			;7ff7
	add a,(hl)			;7ff8
	call 00886h		;7ff9  ; DATA: (end of address table entries)

; ==========================================================================
; PADDING ($7FFC-$800B)
; ==========================================================================
; 16 bytes of $08 padding, filling to the end of this block.
; Note: l7ffdh is referenced as a constant ($7FFD = 128K bank port)
; by code elsewhere, but here it's just padding data.
;
	ex af,af'			;7ffc  ; DATA: $08 padding
l7ffdh:
	ex af,af'			;7ffd  ; DATA: $08 padding (also: 128K port address)
	ex af,af'			;7ffe  ; DATA: $08
	ex af,af'			;7fff  ; DATA: $08
	ex af,af'			;8000  ; DATA: $08
	ex af,af'			;8001  ; DATA: $08
	ex af,af'			;8002  ; DATA: $08
	ex af,af'			;8003  ; DATA: $08
	ex af,af'			;8004  ; DATA: $08
	ex af,af'			;8005  ; DATA: $08
	ex af,af'			;8006  ; DATA: $08
	ex af,af'			;8007  ; DATA: $08
	ex af,af'			;8008  ; DATA: $08
	ex af,af'			;8009  ; DATA: $08
	ex af,af'			;800a  ; DATA: $08
	ex af,af'			;800b  ; DATA: $08
