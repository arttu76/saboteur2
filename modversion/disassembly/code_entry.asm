; ======================================================================
; code_entry.asm
; ======================================================================
;
; Entry Point & Initialization (NEW)
;
; Address range: $8574-$865C (233 bytes)
; Source binary: mod_decompressed.bin (loaded at $620C)
;
; New entry point for the mod. Sets up the system, displays the info
; screen, initializes attributes, builds lookup tables, copies font
; data, and jumps to game initialization.
;
; Memory map:
;   $8574-$8583  System init: disable interrupts, stack, border, keyboard
;   $8586-$8595  Decompress and display info screen image
;   $8598-$85A9  Set screen attributes (2 rows white, 1 cell = $71)
;   $85AC-$85AF  Wait for keypress loop
;   $85B1-$85BE  Set initial player position and game state
;   $85C1-$85CD  Build bit-reversal lookup table at $F900
;   $85D0-$85DB  Build mask lookup table (next page)
;   $85DD-$85F1  Build multiply-by-9 entity lookup at $5E00/$5F00
;   $85F3-$8606  Build multiply-by-8 lookup at $6000/$6100
;   $8608-$861C  Random sprite variation from R register
;   $861E-$8640  Copy font and graphics data to system areas
;   $8642-$8645  Call game init, jump to new game setup
;   $8648-$864E  FILL_MEMORY: fill B bytes at (HL) with A
;   $864F-$865C  BIT_REVERSE_BLOCK: apply bit-reverse table to data
;
; ======================================================================

tab1_end:

init_code_start:
; --- System initialization ---
	di			;8574  ; Disable interrupts
	ld sp,buf1_end		;8575  ; Set stack pointer to buffer end
	xor a			;8578  ; A = 0
	out (0feh),a		;8579  ; Set border to black
	inc a			;857b  ; A = 1
	ld (05c09h),a		;857c  ; REPDEL = 1 (fast key repeat delay)
	ld (05c0ah),a		;857f  ; REPPER = 1 (fast key repeat period)
	inc a			;8582  ; A = 2 (upper screen channel)
	call 01601h		;8583  ; ROM: CHAN_OPEN — open channel 2 (screen)
; --- Display info screen image ---
	ld de,l8d57h		;8586  ; DE -> compressed info screen data
	ld bc,002d3h		;8589  ; BC = 723 bytes (compressed size)
	call 0203ch		;858c  ; ROM: print string (BC bytes from DE to screen)
	ex de,hl			;858f  ; HL = end of decompressed data
	ld de,050c0h		;8590  ; DE = pixel screen area ($50C0)
	ld c,040h		;8593  ; C = 64 bytes to copy
	call sub_d06dh		;8595  ; Copy attributes from decompressed data
; --- Set screen attributes ---
	ld hl,05ac0h		;8598  ; HL = bottom attribute rows
	ld b,020h		;859b  ; B = 32 (one row)
	ld a,007h		;859d  ; A = $07 (white on black)
	call sub_8648h		;859f  ; Fill first row with white
	ld b,020h		;85a2  ; B = 32 (next row)
	call sub_8648h		;85a4  ; Fill second row with white
	ld a,071h		;85a7  ; A = $71 (blue ink, yellow paper, bright)
	ld (05a9fh),a		;85a9  ; Set specific attribute cell
; --- Wait for keypress ---
l85ach:
	call newtab_end		;85ac  ; Init ISR + play intro (returns carry on keypress)
	jr nc,l85ach		;85af  ; Loop until a key is pressed
; --- Initial player state ---
	ld a,011h		;85b1  ; A = $11 (initial player X position)
	ld (0fcc6h),a		;85b3  ; Store player X coordinate
	ld a,001h		;85b6  ; A = $01 (initial player Y position)
	ld (0fd75h),a		;85b8  ; Store player Y coordinate
	ld hl,lee08h		;85bb  ; HL = initial screen offset
	ld (0d077h),hl		;85be  ; Store player screen pointer
; --- Build bit-reversal lookup table at $F900 ---
	ld hl,lf900h		;85c1  ; HL = start of bit-reverse table
l85c4h:
	ld b,008h		;85c4  ; 8 bits per byte
l85c6h:
	rrc l		;85c6  ; Rotate source bit into carry
	rla			;85c8  ; Rotate carry into result (reverses bit order)
	djnz l85c6h		;85c9  ; Loop all 8 bits
	ld (hl),a			;85cb  ; Store bit-reversed value: table[n] = reverse(n)
	inc l			;85cc  ; Next index (0-255)
	jr nz,l85c4h		;85cd  ; Loop 256 entries
; --- Build mask lookup table (next page) ---
	inc h			;85cf  ; H++ → next 256-byte page
l85d0h:
	ld a,l			;85d0  ; A = index n
	add a,a			;85d1  ; A = n*2
	or l			;85d2  ; A = n*2 | n
	ld b,a			;85d3  ; B = n*2 | n
	rra			;85d4  ; A = (n*2 | n) >> 1
	or b			;85d5  ; A = (n*2|n) | ((n*2|n)>>1) — spread bits
	cpl			;85d6  ; Invert → create mask pattern
	ld (hl),a			;85d7  ; Store mask value
	inc l			;85d8  ; Next index
	jr nz,l85d0h		;85d9  ; Loop 256 entries
; --- Build multiply-by-9 entity lookup table at $5E00/$5F00 ---
	ld h,05eh		;85db  ; H = $5E (table base high byte)
l85ddh:
	ld e,l			;85dd  ; E = index n
	ex de,hl			;85de  ; Save HL, HL = 00:n
	ld h,000h		;85df  ; HL = n (16-bit)
	ld b,h			;85e1  ; BC = n
	ld c,l			;85e2
	add hl,hl			;85e3  ; HL = n*2
	add hl,hl			;85e4  ; HL = n*4
	add hl,hl			;85e5  ; HL = n*8
	add hl,bc			;85e6  ; HL = n*9
	ld bc,laa78h		;85e7  ; BC = entity table base address
	add hl,bc			;85ea  ; HL = base + n*9
	ex de,hl			;85eb  ; DE = result, HL = table ptr
	ld (hl),e			;85ec  ; Store low byte at $5E00+n
	inc h			;85ed  ; Point to $5F00
	ld (hl),d			;85ee  ; Store high byte at $5F00+n
	dec h			;85ef  ; Back to $5E00
	inc l			;85f0  ; Next entry
	jr nz,l85ddh		;85f1  ; Loop 256 entries
; --- Build multiply-by-8 lookup table at $6000/$6100 ---
	ld h,060h		;85f3  ; H = $60 (table base)
	ld bc,buf1_end		;85f5  ; BC = base address for *8 table
l85f8h:
	ld e,l			;85f8  ; E = index n
l85f9h:
	ex de,hl			;85f9  ; HL = 00:n
	ld h,000h		;85fa  ; HL = n (16-bit)
	add hl,hl			;85fc  ; n*2
	add hl,hl			;85fd  ; n*4
	add hl,hl			;85fe  ; n*8
	add hl,bc			;85ff  ; base + n*8
	ex de,hl			;8600  ; DE = result, HL = table ptr
	ld (hl),e			;8601  ; Store low byte at $6000+n
	inc h			;8602  ; Point to $6100
	ld (hl),d			;8603  ; Store high byte at $6100+n
	dec h			;8604  ; Back to $6000
	inc l			;8605  ; Next entry
	jr nz,l85f8h		;8606  ; Loop 256 entries
; --- Random sprite variation (R register pseudo-random) ---
	ld a,r		;8608  ; A = R register (pseudo-random)
	and 007h		;860a  ; A = 0-7
	jr z,l861eh		;860c  ; If 0, skip variation (use default sprites)
	ld hl,l855fh		;860e  ; HL -> sprite variation source data
l8611h:
	inc h			;8611  ; Step through pages (sprite variants)
	dec hl			;8612  ; Adjust pointer
	dec a			;8613  ; Count down
	jr nz,l8611h		;8614  ; Select variation page A
	ld de,l6508h		;8616  ; DE -> sprite destination
	ld bc,000ffh		;8619  ; BC = 255 bytes
	ldir		;861c  ; Copy sprite variation
; --- Copy font and graphics data ---
l861eh:
	ld hl,lf0e8h		;861e  ; HL -> graphics source 1
	ld c,0e2h		;8621  ; C = $E2 (outer loop count)
	call sub_864fh		;8623  ; Apply bit-reverse table to data block
	ld hl,buf1_end		;8626  ; HL -> graphics source 2
	ld c,0c4h		;8629  ; C = $C4 (outer loop count)
	call sub_864fh		;862b  ; Apply bit-reverse table to data block
	ld hl,l906ah		;862e  ; HL -> font data source
	ld de,05c70h		;8631  ; DE = font destination ($5C70)
	ld bc,00190h		;8634  ; BC = 400 bytes (font character set)
	ldir		;8637  ; Copy font to character area
	ld hl,l91f4h		;8639  ; HL -> printer buffer data source
	ld de,05b00h		;863c  ; DE = printer buffer area ($5B00)
	inc b			;863f  ; BC = $0100 (256 bytes, B was 0 after LDIR)
	ldir		;8640  ; Copy to printer buffer area
; --- Initialize game and start ---
	call sub_dd45h		;8642  ; Initialize game engine
	jp l92f4h		;8645  ; Jump to new game setup
; --- FILL_MEMORY: fill B bytes at (HL) with A ---
sub_8648h:
	ld (hl),a			;8648  ; Write fill byte
	inc hl			;8649  ; Next address
	djnz sub_8648h		;864a  ; Loop B times
	defb 0eeh		;864c  ; XOR n opcode — "eats" next byte to skip it
init_code_end:

; --- BIT_REVERSE_BLOCK: apply bit-reverse table to C*4 bytes ---
; Entry: HL = data pointer, C = outer loop count
; Uses bit-reverse table at $F900 built above.
; Actually code, but block def marks as data:
;   $864D: ADD HL,BC (operand eaten by XOR above)
;   $864E: RET (return from FILL_MEMORY when entered via sub_8648h)
;   $864F: LD D,$F9 / LD B,4 / loop: LD E,(HL) / LD A,(DE) / LD (HL),A
;          / INC L / INC HL / DJNZ loop / DEC C / JR NZ outer
init_data_start:
	defb 009h		;864d  ; ADD HL,BC (skipped by XOR above)
	defb 0c9h		;864e  ; RET
sub_864fh:
	defb 016h		;864f  ; LD D,$F9 — high byte of bit-reverse table
	defb 0f9h		;8650
	defb 006h		;8651  ; LD B,4 — 4 bytes per inner loop
	defb 004h		;8652
	defb 05eh		;8653  ; LD E,(HL) — read source byte
	defb 01ah		;8654  ; LD A,(DE) — lookup bit-reversed value
	defb 077h		;8655  ; LD (HL),A — store reversed byte
	defb 02ch		;8656  ; INC L — skip a byte
	defb 023h		;8657  ; INC HL — advance 2 bytes total
	defb 010h		;8658  ; DJNZ $8653 — inner loop
	defb 0f9h		;8659
	defb 00dh		;865a  ; DEC C — outer counter
	defb 020h		;865b  ; JR NZ,$8651 — outer loop
	defb 0f4h		;865c
