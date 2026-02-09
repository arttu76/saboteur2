; ======================================================================
; code_behavior.asm
; ======================================================================
;
; Entity Behavior Scripts, Sprite Renderer & State Variables
;
; Address range: $AA0C-$AE0B (1024 bytes)
; Source binary: block7_main.bin (loaded at $620C)
;
; Contains three distinct sections:
;   1. Entity behavior script tables ($AA0C-$AD7D)
;      - Loaded into the behavior handler pointer at $9968
;      - $FF = idle frame, other values = behavior opcodes
;      - Scripts control entity movement, animation, and AI
;   2. RENDER_SPRITE_RAW ($AD7E-$ADDA)
;      - Forward-direction entity/sprite overlay renderer
;      - Mirror of the reverse renderer at $B99F
;   3. Game state variables ($ADDB-$AE0B)
;      - Working RAM for tile lookup, collision, and entity state
;
; Key entry points:
;   PROCESS_INPUT ($AA35) - Clear input/screen buffer area
;   RENDER_SPRITE_RAW ($AD7E) - Render entity sprite to screen map
;
; Data tables loaded into $9968 (behavior handler pointer):
;   laa96h  - Entity behavior table (from code_init.asm)
;   lab3fh  - Default behavior handler (from END_MISSION)
;   lab92h  - Transition behavior handler
;   lac58h  - Long transition behavior handler
;   ANIM_SEQ_TBL ($ACAC) - Animation sequence table
;   lad2ah  - Post-mission behavior handler
;   lad54h  - Post-pickup behavior handler
;
; Cross-references:
;   Called from: code_interaction.asm, code_mainloop.asm
;   Variables read by: code_interaction.asm (lae03h etc.)
;
; ======================================================================

b16_end:

; BLOCK 'b17' (start 0xaa0c end 0xb10c)
b17_start:

; ==========================================================================
; ENTITY BEHAVIOR POINTER TABLE ($AA0C-$AA2F)
; ==========================================================================
; Initial offset/pointer data for entity behavior dispatch.
; Each 2-byte entry is a relative jump target. Disassembled as
; jr/pop/inc instructions but is actually lookup table data.
;
	jr c,la991h		;aa0c  ; DATA: behavior pointer entry 0
	jr c,la993h		;aa0e  ; DATA: behavior pointer entry 1
	jr c,la995h		;aa10  ; DATA: behavior pointer entry 2
	jr c,la997h		;aa12  ; DATA: behavior pointer entry 3
	jr c,$+34		;aa14  ; DATA: behavior pointer entry 4
	pop bc			;aa16
	inc e			;aa17
	pop bc			;aa18
	inc e			;aa19
	pop bc			;aa1a
	inc e			;aa1b
	pop bc			;aa1c
	inc e			;aa1d
	pop bc			;aa1e
	inc e			;aa1f
	pop bc			;aa20
	inc e			;aa21
	pop bc			;aa22
	inc e			;aa23
	pop bc			;aa24
	inc e			;aa25
	jr nz,laa49h		;aa26
	call z,01168h		;aa28
	call 00168h		;aa2b
	ccf			;aa2e
	ld (bc),a			;aa2f
; ==========================================================================
; MEMORY FILL ($AA30) + PROCESS_INPUT ($AA35)
; ==========================================================================
; laa30h: Sets (HL) to $FF, then uses LDIR to propagate BC bytes.
; PROCESS_INPUT: Clears the input/screen work buffer at $6B0C-$6F8B
; (1151 bytes) with $FF.
;
laa30h:
	ld (hl),0ffh		;aa30  ; Set first byte to $FF
	ldir		;aa32  ; Copy BC bytes (fills entire buffer with $FF)
	ret			;aa34

PROCESS_INPUT:
	ld hl,l6b0ch		;aa35  ; HL = start of input/work buffer
	ld de,l6b0dh		;aa38  ; DE = HL + 1 (for LDIR propagation)
	ld bc,0047fh		;aa3b  ; BC = 1151 bytes
	jr laa30h		;aa3e  ; Fill buffer with $FF
; ==========================================================================
; INPUT_DISPATCH TABLE ($AA40-$AA95)
; ==========================================================================
; Entity input dispatch data. Mostly $01,$01,$01 triplets.
; Referenced as entity behavior handler during input processing.
;
INPUT_DISPATCH:
	ld bc,00101h		;aa40  ; DATA: $01,$01,$01 (entity behavior: idle)
	ld bc,00101h		;aa43
	ld bc,00101h		;aa46
laa49h:
	ld bc,00101h		;aa49
	ld bc,00101h		;aa4c
	ld bc,00101h		;aa4f
	ld bc,00101h		;aa52
	ld bc,00101h		;aa55
	ld bc,00101h		;aa58
	ld bc,00101h		;aa5b
	ld bc,00101h		;aa5e
	ld bc,00101h		;aa61
	ld bc,00101h		;aa64
	ld bc,00101h		;aa67
	ld bc,00101h		;aa6a
	ld bc,00101h		;aa6d
	ld bc,lff01h		;aa70
	rst 38h			;aa73
	rst 38h			;aa74
	rst 38h			;aa75
	rst 38h			;aa76
	rst 38h			;aa77
	rst 38h			;aa78
	adc a,0ffh		;aa79
	rst 38h			;aa7b
	rst 38h			;aa7c
	rst 38h			;aa7d
	rst 38h			;aa7e
	rst 8			;aa7f
	ret nc			;aa80
	pop de			;aa81
	rst 38h			;aa82
	rst 38h			;aa83
	rst 38h			;aa84
	sub 0d7h		;aa85
	ret c			;aa87
	exx			;aa88
	rst 38h			;aa89
	rst 38h			;aa8a
	rst 38h			;aa8b
	rst 38h			;aa8c
	rst 38h			;aa8d
	rst 38h			;aa8e
	rst 38h			;aa8f
	rst 38h			;aa90
	rst 38h			;aa91
	rst 38h			;aa92
	rst 38h			;aa93
	rst 38h			;aa94
	rst 38h			;aa95
; ==========================================================================
; ENTITY BEHAVIOR SCRIPT TABLES ($AA96-$AD7D)
; ==========================================================================
; Large block of entity behavior scripts. Each table is loaded into
; the behavior handler pointer ($9968) to control entity AI/animation.
; $FF bytes = idle frames (no action). Non-$FF values are behavior
; opcodes interpreted by the entity state machine in the main loop.
;
; Tables are referenced by label from code_interaction.asm:
;   laa96h  - Default entity behaviors (from code_init.asm init)
;   laab8h  - Secondary behavior set
;   lab3fh  - Default post-END_MISSION handler
;   lab92h  - Transition behavior
;   labbch  - Scroll behavior handler
;   labcbh  - Sound/timer behavior
;   labd4h  - Lift state buffer (18 bytes, zeroed on init)
;   labe6h  - Lift sound effect data
;   lac2eh  - Additional behavior set
;   lac58h  - Long transition behavior
;   lac82h  - Short sequence behavior
;   ANIM_SEQ_TBL ($ACAC) - Animation sequence table
;   lacd6h  - Extended animation data
;   lad00h  - Entity position/frame data
;   lad2ah  - Post-mission behavior
;   lad54h  - Post-pickup behavior
;
laa96h:
	rst 38h			;aa96  ; DATA: $FF (idle)
	rst 38h			;aa97
	rst 38h			;aa98
	rst 38h			;aa99
	rst 38h			;aa9a
	rst 38h			;aa9b
	add a,0ffh		;aa9c
	rst 38h			;aa9e
	rst 38h			;aa9f
	rst 38h			;aaa0
	rst 38h			;aaa1
	rst 0			;aaa2
	ret z			;aaa3
	ret			;aaa4
	jp z,lcccbh		;aaa5
	rst 38h			;aaa8
	call IM2_JUMP_TARGET		;aaa9
	rst 38h			;aaac
	rst 38h			;aaad
	rst 38h			;aaae
	rst 38h			;aaaf
	rst 38h			;aab0
	rst 38h			;aab1
	rst 38h			;aab2
	rst 38h			;aab3
	rst 38h			;aab4
	rst 38h			;aab5
	rst 38h			;aab6
	rst 38h			;aab7
; --- Entity behavior set 2 ($AAB8) ---
laab8h:
	rst 38h			;aab8
	rst 38h			;aab9
	rst 38h			;aaba
	rst 38h			;aabb
	rst 38h			;aabc
	rst 38h			;aabd
	rst 38h			;aabe
	rst 38h			;aabf
	and b			;aac0
	and c			;aac1
	rst 38h			;aac2
	rst 38h			;aac3
	rst 38h			;aac4
	rst 38h			;aac5
	and d			;aac6
	and e			;aac7
	and h			;aac8
	rst 38h			;aac9
	rst 38h			;aaca
	rst 38h			;aacb
	and l			;aacc
	and (hl)			;aacd
	and a			;aace
	rst 38h			;aacf
	rst 38h			;aad0
	rst 38h			;aad1
	rst 38h			;aad2
	xor b			;aad3
	xor c			;aad4
	rst 38h			;aad5
	rst 38h			;aad6
	rst 38h			;aad7
	rst 38h			;aad8
	rst 38h			;aad9
	rst 38h			;aada
	rst 38h			;aadb
	rst 38h			;aadc
	rst 38h			;aadd
	rst 38h			;aade
	rst 38h			;aadf
	rst 38h			;aae0
	rst 38h			;aae1
	xor d			;aae2
	xor e			;aae3
	rst 38h			;aae4
	rst 38h			;aae5
	rst 38h			;aae6
	xor h			;aae7
	xor l			;aae8
	xor (hl)			;aae9
	rst 38h			;aaea
	rst 38h			;aaeb
	rst 38h			;aaec
	xor a			;aaed
	or b			;aaee
	or c			;aaef
	rst 38h			;aaf0
	rst 38h			;aaf1
	rst 38h			;aaf2
	rst 38h			;aaf3
	rst 38h			;aaf4
	rst 38h			;aaf5
	rst 38h			;aaf6
	rst 38h			;aaf7
	rst 38h			;aaf8
	rst 38h			;aaf9
	rst 38h			;aafa
	rst 38h			;aafb
	rst 38h			;aafc
	rst 38h			;aafd
	rst 38h			;aafe
	rst 38h			;aaff
	rst 38h			;ab00
	rst 38h			;ab01
	rst 38h			;ab02
	or d			;ab03
	or e			;ab04
	or h			;ab05
	rst 38h			;ab06
	rst 38h			;ab07
	rst 38h			;ab08
	or l			;ab09
	or (hl)			;ab0a
	or a			;ab0b
	rst 38h			;ab0c
	rst 38h			;ab0d
	rst 38h			;ab0e
	cp b			;ab0f
	cp c			;ab10
	cp d			;ab11
	rst 38h			;ab12
	rst 38h			;ab13
	rst 38h			;ab14
	rst 38h			;ab15
	cp e			;ab16
	cp h			;ab17
	rst 38h			;ab18
	rst 38h			;ab19
	rst 38h			;ab1a
	rst 38h			;ab1b
	rst 38h			;ab1c
	rst 38h			;ab1d
	rst 38h			;ab1e
	rst 38h			;ab1f
	rst 38h			;ab20
	rst 38h			;ab21
	rst 38h			;ab22
	rst 38h			;ab23
	rst 38h			;ab24
	cp l			;ab25
	cp (hl)			;ab26
	cp a			;ab27
	rst 38h			;ab28
	rst 38h			;ab29
	rst 38h			;ab2a
	ret nz			;ab2b
	pop bc			;ab2c
	jp nz,IM2_JUMP_TARGET		;ab2d
	rst 38h			;ab30
	jp lc5c4h		;ab31
	rst 38h			;ab34
	rst 38h			;ab35
	rst 38h			;ab36
	rst 38h			;ab37
	rst 38h			;ab38
	rst 38h			;ab39
	rst 38h			;ab3a
	rst 38h			;ab3b
	rst 38h			;ab3c
	rst 38h			;ab3d
	rst 38h			;ab3e
; --- Default behavior handler ($AB3F) - installed by END_MISSION ---
lab3fh:
	rst 38h			;ab3f
	rst 38h			;ab40
	rst 38h			;ab41
	rst 38h			;ab42
	rst 38h			;ab43
	rst 38h			;ab44
	rst 38h			;ab45
	rst 38h			;ab46
	nop			;ab47
	ld bc,IM2_JUMP_TARGET		;ab48
	rst 38h			;ab4b
	rst 38h			;ab4c
	ld (bc),a			;ab4d
	inc bc			;ab4e
	inc b			;ab4f
	rst 38h			;ab50
	rst 38h			;ab51
	rst 38h			;ab52
	dec b			;ab53
	ld b,007h		;ab54
	rst 38h			;ab56
	rst 38h			;ab57
	rst 38h			;ab58
	ex af,af'			;ab59
	add hl,bc			;ab5a
	rst 38h			;ab5b
	rst 38h			;ab5c
	rst 38h			;ab5d
	rst 38h			;ab5e
	ld a,(bc)			;ab5f
	dec bc			;ab60
	inc c			;ab61
	rst 38h			;ab62
	rst 38h			;ab63
	dec c			;ab64
	ld c,00fh		;ab65
	djnz $+1		;ab67
	rst 38h			;ab69
	rst 38h			;ab6a
	ld h,e			;ab6b
	rst 38h			;ab6c
	rst 38h			;ab6d
	rst 38h			;ab6e
	ld h,h			;ab6f
	ld h,l			;ab70
	ld h,(hl)			;ab71
	rst 38h			;ab72
	rst 38h			;ab73
	rst 38h			;ab74
	ld h,a			;ab75
	ld l,b			;ab76
	ld l,c			;ab77
	rst 38h			;ab78
	rst 38h			;ab79
	rst 38h			;ab7a
	rst 38h			;ab7b
	ld l,d			;ab7c
	ld l,e			;ab7d
	rst 38h			;ab7e
	rst 38h			;ab7f
	rst 38h			;ab80
	rst 38h			;ab81
	ld l,h			;ab82
	ld l,l			;ab83
	ld l,(hl)			;ab84
	rst 38h			;ab85
	rst 38h			;ab86
	rst 38h			;ab87
	ld l,a			;ab88
	ld (hl),b			;ab89
	rst 38h			;ab8a
	rst 38h			;ab8b
	rst 38h			;ab8c
	rst 38h			;ab8d
	ld (hl),c			;ab8e
	rst 38h			;ab8f
	rst 38h			;ab90
	rst 38h			;ab91
; --- Transition behavior handler ($AB92) ---
lab92h:
	rst 38h			;ab92
	rst 38h			;ab93
	rst 38h			;ab94
	rst 38h			;ab95
	rst 38h			;ab96
	rst 38h			;ab97
	rst 38h			;ab98
	rst 38h			;ab99
	rst 38h			;ab9a
	ld de,lff12h		;ab9b
	inc de			;ab9e
	inc d			;ab9f
	dec d			;aba0
	ld d,017h		;aba1
	rst 38h			;aba3
	rst 38h			;aba4
	rst 38h			;aba5
	jr labc1h		;aba6
laba8h:
	ld a,(de)			;aba8
	rst 38h			;aba9
	rst 38h			;abaa
	rst 38h			;abab
	ex af,af'			;abac
	add hl,bc			;abad
	rst 38h			;abae
	rst 38h			;abaf
	rst 38h			;abb0
	rst 38h			;abb1
	ld a,(bc)			;abb2
	dec bc			;abb3
	inc c			;abb4
	rst 38h			;abb5
	rst 38h			;abb6
	dec c			;abb7
	ld c,00fh		;abb8
	djnz $+1		;abba
; --- Scroll behavior handler ($ABBC) ---
labbch:
	rst 38h			;abbc
	rst 38h			;abbd
	rst 38h			;abbe
	rst 38h			;abbf
	rst 38h			;abc0
labc1h:
	rst 38h			;abc1
	rst 38h			;abc2
	rst 38h			;abc3
	dec de			;abc4
	rst 38h			;abc5
	rst 38h			;abc6
	rst 38h			;abc7
	rst 38h			;abc8
	inc e			;abc9
	dec e			;abca
; --- Sound/timer behavior ($ABCB) ---
labcbh:
	ld e,0ffh		;abcb
	rst 38h			;abcd
	rst 38h			;abce
	rra			;abcf
	jr nz,labf3h		;abd0
	rst 38h			;abd2
	rst 38h			;abd3
; --- Lift state buffer ($ABD4, 18 bytes) - zeroed, filled by LIFT_HANDLER ---
labd4h:
	nop			;abd4
	nop			;abd5
	nop			;abd6
	nop			;abd7
	nop			;abd8
	nop			;abd9
	nop			;abda
	nop			;abdb
	nop			;abdc
	nop			;abdd
	nop			;abde
	nop			;abdf
	nop			;abe0
	nop			;abe1
	nop			;abe2
	nop			;abe3
	nop			;abe4
	nop			;abe5
; --- Lift sound effect data ($ABE6) - source for LDIR in LIFT_HANDLER ---
labe6h:
	rst 38h			;abe6
	rst 38h			;abe7
	ld (lff23h),hl		;abe8
	rst 38h			;abeb
	rst 38h			;abec
	rst 38h			;abed
	inc h			;abee
	dec h			;abef
	rst 38h			;abf0
	rst 38h			;abf1
	rst 38h			;abf2
labf3h:
	rst 38h			;abf3
	ld h,027h		;abf4
	rst 38h			;abf6
	rst 38h			;abf7
	rst 38h			;abf8
	jr z,lac24h		;abf9
	ld hl,(IM2_JUMP_TARGET)		;abfb
	rst 38h			;abfe
	dec hl			;abff
	inc l			;ac00
	dec l			;ac01
	rst 38h			;ac02
	rst 38h			;ac03
	rst 38h			;ac04
	rst 38h			;ac05
	ld l,02fh		;ac06
	rst 38h			;ac08
	rst 38h			;ac09
	rst 38h			;ac0a
	jr nc,lac3eh		;ac0b
	ld (IM2_JUMP_TARGET),a		;ac0d
	rst 38h			;ac10
	inc sp			;ac11
	inc (hl)			;ac12
	dec (hl)			;ac13
	rst 38h			;ac14
	rst 38h			;ac15
	rst 38h			;ac16
	rst 38h			;ac17
	ld (hl),037h		;ac18
	jr c,$+1		;ac1a
	rst 38h			;ac1c
	add hl,sp			;ac1d
	ld a,(lff3bh)		;ac1e
	rst 38h			;ac21
	rst 38h			;ac22
	inc a			;ac23
lac24h:
	dec a			;ac24
	ld a,03fh		;ac25
	rst 38h			;ac27
	rst 38h			;ac28
	ld b,b			;ac29
	rst 38h			;ac2a
	ld b,c			;ac2b
	ld b,d			;ac2c
	rst 38h			;ac2d
; --- Additional behavior set ($AC2E) ---
lac2eh:
	rst 38h			;ac2e
	rst 38h			;ac2f
	rst 38h			;ac30
	rst 38h			;ac31
	rst 38h			;ac32
	rst 38h			;ac33
	rst 38h			;ac34
	rst 38h			;ac35
	rst 38h			;ac36
	rst 38h			;ac37
	rst 38h			;ac38
	rst 38h			;ac39
	rst 38h			;ac3a
	rst 38h			;ac3b
	rst 38h			;ac3c
	rst 38h			;ac3d
lac3eh:
	rst 38h			;ac3e
	rst 38h			;ac3f
	rst 38h			;ac40
	rst 38h			;ac41
	rst 38h			;ac42
	ld de,lff12h		;ac43
	inc de			;ac46
	inc d			;ac47
	dec d			;ac48
	ld d,017h		;ac49
	rst 38h			;ac4b
	rst 38h			;ac4c
	ld b,e			;ac4d
	ld b,h			;ac4e
	ld b,l			;ac4f
	ld b,(hl)			;ac50
	rst 38h			;ac51
	ld b,a			;ac52
	ld c,b			;ac53
	ld c,c			;ac54
	rst 38h			;ac55
	ld c,d			;ac56
	rst 38h			;ac57
; --- Long transition behavior ($AC58) ---
lac58h:
	rst 38h			;ac58
	rst 38h			;ac59
	rst 38h			;ac5a
	rst 38h			;ac5b
	rst 38h			;ac5c
	rst 38h			;ac5d
	rst 38h			;ac5e
	rst 38h			;ac5f
	rst 38h			;ac60
	rst 38h			;ac61
	rst 38h			;ac62
	rst 38h			;ac63
	rst 38h			;ac64
	rst 38h			;ac65
	rst 38h			;ac66
	rst 38h			;ac67
	rst 38h			;ac68
	rst 38h			;ac69
	rst 38h			;ac6a
	rst 38h			;ac6b
	rst 38h			;ac6c
	ld de,lff12h		;ac6d
	rst 38h			;ac70
	rst 38h			;ac71
	ld (bc),a			;ac72
	ld d,017h		;ac73
	rst 38h			;ac75
	rst 38h			;ac76
	ld c,e			;ac77
	ld c,h			;ac78
	ld b,l			;ac79
	ld b,(hl)			;ac7a
	rst 38h			;ac7b
	rst 38h			;ac7c
	ld c,l			;ac7d
	ld c,(hl)			;ac7e
	rst 38h			;ac7f
	ld c,d			;ac80
	rst 38h			;ac81
; --- Short sequence behavior ($AC82) ---
lac82h:
	rst 38h			;ac82
	rst 38h			;ac83
	rst 38h			;ac84
	rst 38h			;ac85
	rst 38h			;ac86
	rst 38h			;ac87
	rst 38h			;ac88
	rst 38h			;ac89
	rst 38h			;ac8a
	rst 38h			;ac8b
	rst 38h			;ac8c
	rst 38h			;ac8d
	rst 38h			;ac8e
	rst 38h			;ac8f
	rst 38h			;ac90
	rst 38h			;ac91
	rst 38h			;ac92
	rst 38h			;ac93
	ld c,a			;ac94
	ld d,b			;ac95
	ld d,c			;ac96
	ld (de),a			;ac97
	ld d,d			;ac98
	ld d,e			;ac99
	ld (bc),a			;ac9a
	ld d,04ah		;ac9b
	inc d			;ac9d
	ld (bc),a			;ac9e
	rla			;ac9f
	rst 38h			;aca0
	rst 38h			;aca1
	rst 38h			;aca2
	rst 38h			;aca3
	rst 38h			;aca4
	rst 38h			;aca5
	rst 38h			;aca6
	rst 38h			;aca7
	rst 38h			;aca8
laca9h:
	rst 38h			;aca9
	rst 38h			;acaa
	rst 38h			;acab
; --- Animation sequence table ($ACAC) ---
ANIM_SEQ_TBL:
	rst 38h			;acac
	rst 38h			;acad
	rst 38h			;acae
	rst 38h			;acaf
	rst 38h			;acb0
	rst 38h			;acb1
	rst 38h			;acb2
	rst 38h			;acb3
	ld d,l			;acb4
	ld de,IM2_JUMP_TARGET		;acb5
	rst 38h			;acb8
	rst 38h			;acb9
	ld d,(hl)			;acba
	ld d,a			;acbb
	rst 38h			;acbc
	rst 38h			;acbd
	rst 38h			;acbe
	rst 38h			;acbf
	ld e,b			;acc0
	ld e,c			;acc1
	rst 38h			;acc2
	rst 38h			;acc3
	rst 38h			;acc4
	rst 38h			;acc5
	ld e,d			;acc6
	ld e,e			;acc7
	rst 38h			;acc8
	rst 38h			;acc9
	rst 38h			;acca
	rst 38h			;accb
	ld e,h			;accc
	ld e,l			;accd
	rst 38h			;acce
	rst 38h			;accf
	rst 38h			;acd0
	rst 38h			;acd1
	rst 38h			;acd2
	ld e,(hl)			;acd3
	rst 38h			;acd4
	rst 38h			;acd5
lacd6h:
	rst 38h			;acd6
	rst 38h			;acd7
	rst 38h			;acd8
	rst 38h			;acd9
	rst 38h			;acda
	rst 38h			;acdb
	rst 38h			;acdc
	ld e,a			;acdd
	ld d,l			;acde
	ld de,IM2_JUMP_TARGET		;acdf
	rst 38h			;ace2
	ld h,b			;ace3
	ld d,(hl)			;ace4
	ld d,a			;ace5
	rst 38h			;ace6
	rst 38h			;ace7
	rst 38h			;ace8
	rst 38h			;ace9
	ld h,c			;acea
	ld e,c			;aceb
	rst 38h			;acec
	rst 38h			;aced
	rst 38h			;acee
	rst 38h			;acef
	ld h,d			;acf0
	ld e,e			;acf1
	rst 38h			;acf2
	rst 38h			;acf3
	rst 38h			;acf4
	rst 38h			;acf5
	ld e,h			;acf6
	ld e,l			;acf7
	rst 38h			;acf8
	rst 38h			;acf9
	rst 38h			;acfa
	rst 38h			;acfb
	rst 38h			;acfc
	ld e,(hl)			;acfd
	rst 38h			;acfe
	rst 38h			;acff
lad00h:
	rst 38h			;ad00
	ld (hl),d			;ad01
	rst 38h			;ad02
	ld (hl),e			;ad03
	ld (hl),h			;ad04
	rst 38h			;ad05
	ld (hl),l			;ad06
	halt			;ad07
	ld (hl),a			;ad08
	ld a,b			;ad09
	ld a,c			;ad0a
	rst 38h			;ad0b
	ld a,d			;ad0c
	ld a,e			;ad0d
	ld a,h			;ad0e
	ld a,l			;ad0f
	ld a,(hl)			;ad10
	rst 38h			;ad11
	rst 38h			;ad12
	rst 38h			;ad13
	ld a,a			;ad14
	add a,b			;ad15
	add a,c			;ad16
	rst 38h			;ad17
	rst 38h			;ad18
	rst 38h			;ad19
	rst 38h			;ad1a
	add a,d			;ad1b
	add a,e			;ad1c
	rst 38h			;ad1d
	rst 38h			;ad1e
	rst 38h			;ad1f
	rst 38h			;ad20
	add a,h			;ad21
	rst 38h			;ad22
	rst 38h			;ad23
	rst 38h			;ad24
	rst 38h			;ad25
	rst 38h			;ad26
	rst 38h			;ad27
	rst 38h			;ad28
	rst 38h			;ad29
; --- Post-mission behavior ($AD2A) ---
lad2ah:
	rst 38h			;ad2a
	rst 38h			;ad2b
	rst 38h			;ad2c
	rst 38h			;ad2d
	rst 38h			;ad2e
	rst 38h			;ad2f
	rst 38h			;ad30
	rst 38h			;ad31
	rst 38h			;ad32
	rst 38h			;ad33
	rst 38h			;ad34
	rst 38h			;ad35
	rst 38h			;ad36
	rst 38h			;ad37
	rst 38h			;ad38
	rst 38h			;ad39
	rst 38h			;ad3a
	rst 38h			;ad3b
	rst 38h			;ad3c
	rst 38h			;ad3d
	rst 38h			;ad3e
	rst 38h			;ad3f
	rst 38h			;ad40
	rst 38h			;ad41
	rst 38h			;ad42
	rst 38h			;ad43
	rst 38h			;ad44
	rst 38h			;ad45
	rst 38h			;ad46
	rst 38h			;ad47
	rst 38h			;ad48
	rst 38h			;ad49
	add a,(hl)			;ad4a
	rst 38h			;ad4b
	rst 38h			;ad4c
	rst 38h			;ad4d
	rst 38h			;ad4e
	add a,a			;ad4f
	adc a,b			;ad50
	adc a,c			;ad51
	adc a,d			;ad52
	rst 38h			;ad53
; --- Post-pickup behavior ($AD54) ---
lad54h:
	rst 38h			;ad54
	adc a,e			;ad55
	adc a,h			;ad56
	adc a,l			;ad57
	adc a,(hl)			;ad58
	rst 38h			;ad59
	rst 38h			;ad5a
	adc a,a			;ad5b
	sub b			;ad5c
	sub c			;ad5d
	sub d			;ad5e
	rst 38h			;ad5f
	rst 38h			;ad60
	rst 38h			;ad61
	sub e			;ad62
	sub h			;ad63
	sub l			;ad64
	rst 38h			;ad65
	rst 38h			;ad66
	rst 38h			;ad67
	sub (hl)			;ad68
	sub a			;ad69
	rst 38h			;ad6a
	rst 38h			;ad6b
	rst 38h			;ad6c
	sbc a,b			;ad6d
	sbc a,c			;ad6e
	sbc a,d			;ad6f
	rst 38h			;ad70
	rst 38h			;ad71
	rst 38h			;ad72
	sbc a,e			;ad73
	sbc a,h			;ad74
	sbc a,l			;ad75
	rst 38h			;ad76
	rst 38h			;ad77
	rst 38h			;ad78
	rst 38h			;ad79
	sbc a,(hl)			;ad7a
	sbc a,a			;ad7b
	rst 38h			;ad7c
	rst 38h			;ad7d
; ==========================================================================
; RENDER_SPRITE_RAW ($AD7E)
; ==========================================================================
; Forward-direction entity/sprite overlay renderer. Copies entity tile
; data onto the screen map, checking bounds and collision. If the player
; faces left (PLAYER_DIR=1), delegates to the reverse renderer at $B99F.
;
; Uses the alternate register set for parallel tracking:
;   Main: HL=screen dest, DE=source data, C=width, B=row count
;   Alt:  HL=collision map, DE=position tracking, BC=bounds
;
; Bounds checks: column < 32, row < 18, no overwrite of solid ($C7+).
;
RENDER_SPRITE_RAW:
	ld (0ada2h),a		;ad7e  ; Store column count (self-modifying target)
	ld (0b9bch),a		;ad81  ; Store column count (reverse renderer too)
	ld a,(PLAYER_DIR)		;ad84  ; A = player facing direction
	dec a			;ad87  ; Is direction 1 (facing left)?
	jp z,lb99fh		;ad88  ; Yes -> use reverse renderer instead

	; --- Forward direction setup ---
	exx			;ad8b  ; Switch to alt registers
	ld bc,ladefh		;ad8c  ; BC' = collision map base
	ld hl,(PLAYER_POS_PTR)		;ad8f  ; HL' = player grid pointer
	push de			;ad92
	ld de,HISCORE_TBL		;ad93  ; DE' = grid offset
	add hl,de			;ad96  ; HL' = adjusted grid position
	pop de			;ad97
	exx			;ad98  ; Back to main registers

	; --- Initialize row/column tracking ---
	ld a,c			;ad99  ; A = width parameter
	ld (lad9dh+1),a		;ad9a  ; Self-modify: set width counter initial value

; --- Outer loop: process one row ---
lad9dh:
	ld c,006h		;ad9d  ; C = column count (self-modifying)
	exx			;ad9f  ; Alt registers
	push hl			;ada0  ; Save collision map row start
	ld e,000h		;ada1  ; E' = 0 (column counter reset)
	exx			;ada3  ; Main registers
	push hl			;ada4  ; Save screen row start

; --- Inner loop: process one tile ---
lada5h:
	exx			;ada5  ; Alt registers
	ld a,e			;ada6  ; A = current column index
	exx			;ada7  ; Main registers
	cp 020h		;ada8  ; Column >= 32 (off-screen)?
ladaah:
	jr nc,ladbdh		;adaa  ; Yes -> skip tile
	exx			;adac  ; Alt registers
	ld a,d			;adad  ; A = current row index
	exx			;adae  ; Main registers
	cp 012h		;adaf  ; Row >= 18 (off-screen)?
	jr nc,ladbdh		;adb1  ; Yes -> skip tile
	exx			;adb3  ; Alt registers
	ld a,(hl)			;adb4  ; A = collision map value
	nop			;adb5  ; (alignment padding)
	exx			;adb6  ; Main registers
	cp 0c7h		;adb7  ; Solid tile ($C7+)?
	jr nc,ladbdh		;adb9  ; Yes -> don't overwrite
	ld a,(de)			;adbb  ; A = source tile data
	ld (hl),a			;adbc  ; Write tile to screen map

; --- Advance to next column ---
ladbdh:
	exx			;adbd  ; Alt registers
	inc e			;adbe  ; E' = next column
	inc hl			;adbf  ; HL' = next collision map pos
	inc bc			;adc0  ; BC' = advance bounds counter
	exx			;adc1  ; Main registers
	inc hl			;adc2  ; HL = next screen position
	inc de			;adc3  ; DE = next source byte (forward)
	dec c			;adc4  ; C = columns remaining
	jr nz,lada5h		;adc5  ; More columns -> inner loop

	; --- Advance to next row ---
	pop hl			;adc7  ; HL = screen row start
	push de			;adc8
	ld de,00020h		;adc9  ; DE = 32 (screen row stride)
	add hl,de			;adcc  ; HL = next screen row
	pop de			;adcd

	exx			;adce  ; Alt registers
	inc d			;adcf  ; D' = next row index
	pop hl			;add0  ; HL' = collision row start
	push de			;add1
	ld de,00020h		;add2  ; DE' = 32 (collision row stride)
	add hl,de			;add5  ; HL' = next collision row
	pop de			;add6
	exx			;add7  ; Main registers
	djnz lad9dh		;add8  ; More rows -> outer loop
	ret			;adda  ; All rows rendered
; ==========================================================================
; GAME STATE VARIABLES ($ADDB-$AE0B)
; ==========================================================================
; Working RAM used by the entity/rendering system. All initialized to
; $00 (NOP) at load time; written by game logic at runtime.
; Many of these are read by code_interaction.asm for tile/collision
; checks and entity position tracking.
;
	nop			;addb  ; Variable: unused/padding
	nop			;addc
	nop			;addd
	nop			;adde
	nop			;addf
	nop			;ade0
	nop			;ade1
	nop			;ade2
	nop			;ade3
	nop			;ade4
	nop			;ade5
	nop			;ade6
	nop			;ade7
	nop			;ade8
	nop			;ade9
	nop			;adea
	nop			;adeb
	nop			;adec
	nop			;aded
	nop			;adee
ladefh:
	nop			;adef  ; Collision map base (forward renderer)
ladf0h:
	nop			;adf0  ; Entity position scratch
	nop			;adf1
	nop			;adf2
	nop			;adf3
ladf4h:
	nop			;adf4  ; Collision map base (reverse renderer)
ladf5h:
	nop			;adf5  ; Entity state byte
ladf6h:
	nop			;adf6  ; Entity state byte
	nop			;adf7
	nop			;adf8
	nop			;adf9
	nop			;adfa
ladfbh:
	nop			;adfb  ; Tile lookup result
	nop			;adfc
	nop			;adfd
ladfeh:
	nop			;adfe  ; Room/position state
	nop			;adff
lae00h:
	nop			;ae00  ; Working variable
	nop			;ae01
	nop			;ae02
lae03h:
	nop			;ae03  ; Tile type below player (read by interaction)
	nop			;ae04
lae05h:
	nop			;ae05  ; Entity collision flag
lae06h:
	nop			;ae06  ; Entity collision flag
lae07h:
	nop			;ae07  ; Entity state flag
	nop			;ae08
	nop			;ae09
	nop			;ae0a
	nop			;ae0b
