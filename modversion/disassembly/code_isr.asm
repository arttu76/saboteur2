; ======================================================================
; code_isr.asm
; ======================================================================
;
; ISR, Speed Engine, Beeper Driver & Sound Data (NEW)
;
; Address range: $FB10-$FFFB (1260 bytes)
; Source binary: mod_decompressed.bin (loaded at $620C)
;
; Complete new interrupt-driven system replacing the original's
; AY-3-8912 sound engine with a 48K-compatible beeper driver.
;
; Memory map:
;   $FB10-$FB39  IM2 initialization (sets I=$3B, JP $FD34 at $FFF4)
;   $FB3A-$FC11  Sound data interpreter (command-driven music engine)
;   $FC12-$FD0B  Beeper frequency generator (cycle-accurate timing)
;   $FD0C-$FD18  Self-modifying storage (runtime variables)
;   $FD19-$FD33  Pitch/timing helper routines
;   $FD34-$FD94  MAIN ISR HANDLER (frame timing, keyboard, beeper)
;   $FD95-$FDC7  Speed control engine (CS+S cycles, CS+P pause)
;   $FDC8-$FE1C  Note frequency computation + table loader
;   $FE1D-$FF3F  Sound data: frequency table, note patterns, effects
;   $FF40-$FF5F  Speed preset table (3-byte entries, cycled by CS+S)
;   $FF60-$FFF3  Feature flags, RNG seeds, game state variables
;   $FFF4-$FFFB  IM2 vector: JP $FD34 (overwritten at runtime)
;
; ======================================================================

newtab_end:

; ==========================================================================
; IM2 INITIALIZATION ($FB10)
; ==========================================================================
; Sets up IM2 interrupt mode with ISR at $FD34.
; IM2 vector: I=$3B, bus returns $FF → vector at ($3BFF) = $FFF4.
; At $FFF4 a JP $FD34 instruction is written.
;
isr_code_start:
	di			;fb10  ; Disable interrupts during setup
	ld hl,lff45h		;fb11  ; HL -> initial sound data table
	call sub_fd98h		;fb14  ; Load first sound entry (sets beeper params)
	ld (0fd4dh),a		;fb17  ; Store initial speed counter value
	ld b,004h		;fb1a  ; B' = 4 (ISR frame divider: run every 4th frame)
	ld c,000h		;fb1c  ; C' = 0 (sub-frame counter)
	exx			;fb1e  ; Save B'/C' in alternate register set
	ld hl,lfd34h		;fb1f  ; HL = ISR entry point address
	ld (lfff5h),hl		;fb22  ; Store ISR target at $FFF5 (JP operand)
	ld a,0c3h		;fb25  ; A = $C3 (JP opcode)
	ld (snd_data_end),a		;fb27  ; Write JP opcode at $FFF4
	ld a,018h		;fb2a  ; A = $18 (JR opcode, unused padding)
	ld (0ffffh),a		;fb2c  ; Write at $FFFF (IM2 bus byte returns here)
	ld a,03bh		;fb2f  ; A = $3B (I register value)
	ld i,a		;fb31  ; Set I register → vector = $3BFF
	im 2		;fb33  ; Enable IM2 interrupt mode
	call sub_fb3ah		;fb35  ; Initialize sound engine
	di			;fb38  ; Disable interrupts on return
	ret			;fb39
; ==========================================================================
; SOUND DATA INTERPRETER ($FB3A)
; ==========================================================================
; Command-driven music engine. Reads bytecoded sound data and dispatches:
;   $00-$7F: Note/duration pair (bits 6-0 = duration, next byte = note)
;   $80: END — restore SP, return to caller
;   $81: CALL — push return addr, jump to 2-byte target
;   $82: RETURN — pop return addr, continue
;   $83: LOOP — repeat B times to 2-byte target (self-mod counter)
;   $84: SET TRANSPOSE — set octave offset byte
;   $85: SET CHANNEL 1 — configure tone channel 1
;   $86: SET CHANNEL 2 — configure tone channel 2
;   $87: SET EFFECT — load vibrato/effect params from freq table
;
sub_fb3ah:
	ld hl,lff0eh		;fb3a  ; HL -> default sound data table
	ld (lfd42h+1),sp		;fb3d  ; Save SP for END command (self-mod at $FD43)
	jr lfb46h		;fb41  ; Enter interpreter loop
	ld hl,lfe5eh		;fb43  ; Alternate entry: HL -> sound data at $FE5E
; --- Main interpreter loop ---
lfb46h:
	ld a,(hl)			;fb46  ; A = next sound data byte
	inc hl			;fb47  ; Advance data pointer
	or a			;fb48  ; Test byte value
	jp p,lfbc1h		;fb49  ; Bit 7 clear (0-127) → note/duration handler
	and 07fh		;fb4c  ; Mask off bit 7 → command code (1-7)
	jp z,lfd42h		;fb4e  ; Code 0 ($80 byte) → END: restore SP, return
	dec a			;fb51  ; Test for command $81
	jr nz,lfb5ch		;fb52  ; Not $81 → try next command
; --- Command $81: CALL subroutine ---
	ld e,(hl)			;fb54  ; DE = 2-byte subroutine address (lo)
	inc hl			;fb55
	ld d,(hl)			;fb56  ; DE = subroutine address (hi)
	inc hl			;fb57
	push hl			;fb58  ; Push return address onto stack
	ex de,hl			;fb59  ; HL = subroutine address
	jr lfb46h		;fb5a  ; Continue interpreting from subroutine
; --- Command $82: RETURN from subroutine ---
lfb5ch:
	dec a			;fb5c  ; Test for command $82
	jr nz,lfb62h		;fb5d  ; Not $82 → try next
	pop hl			;fb5f  ; Pop return address
	jr lfb46h		;fb60  ; Continue from return point
; --- Command $83: LOOP ---
; Format: $83, addr_lo, addr_hi, count
; Loops 'count' times to target address. Counter at $FB6C is self-modified.
;
lfb62h:
	dec a			;fb62  ; Test for command $83
	jr nz,lfb7ah		;fb63  ; Not $83 → try next
	ld e,(hl)			;fb65  ; DE = loop target address (lo)
	inc hl			;fb66
	ld d,(hl)			;fb67  ; DE = loop target (hi)
	inc hl			;fb68
	ld b,(hl)			;fb69  ; B = initial loop count
	inc hl			;fb6a
	ld a,000h		;fb6b  ; A = current counter (self-modified at $FB6C)
	or a			;fb6d  ; First iteration?
	jr nz,lfb71h		;fb6e  ; No → use current counter
	ld a,b			;fb70  ; Yes → initialize with count from data
lfb71h:
	dec a			;fb71  ; Decrement loop counter
	ld (0fb6ch),a		;fb72  ; Store back (self-mod)
	jr z,lfb46h		;fb75  ; Counter=0 → loop done, continue after
	ex de,hl			;fb77  ; HL = loop target address
	jr lfb46h		;fb78  ; Jump back to loop start
; --- Command $84: SET TRANSPOSE ---
lfb7ah:
	dec a			;fb7a  ; Test for command $84
	jr nz,lfb84h		;fb7b  ; Not $84 → try next
	ld a,(hl)			;fb7d  ; A = transpose/octave offset value
	inc hl			;fb7e
	ld (0fdcfh),a		;fb7f  ; Store at $FDCF (used by freq computation)
	jr lfb46h		;fb82  ; Continue interpreting
; --- Command $85: SET CHANNEL 1 tone ---
; Reads note byte, computes frequency table pointer, stores for playback.
;
lfb84h:
	dec a			;fb84  ; Test for command $85
	jr nz,lfba0h		;fb85  ; Not $85 → try next
	ld b,001h		;fb87  ; B = channel 1 flag
lfb89h:
	ld a,(hl)			;fb89  ; A = note value from sound data
	inc hl			;fb8a
	or a			;fb8b  ; Note = 0?
	jr z,lfb9bh		;fb8c  ; Yes → rest (silence this channel)
	add a,03ch		;fb8e  ; A = note + $3C (offset into freq table)
	ld e,a			;fb90  ; E = table offset low
	ld d,0feh		;fb91  ; D = $FE (table base page)
	jr nc,lfb96h		;fb93  ; No carry → address is $FExx
	inc d			;fb95  ; Carry → address is $FFxx
lfb96h:
	ld (0fe06h),de		;fb96  ; Store freq table pointer (self-mod at $FE06)
	ld a,b			;fb9a  ; A = channel flag (1 or 2)
lfb9bh:
	ld (0fbd8h),a		;fb9b  ; Store channel active flag (self-mod at $FBD8)
	jr lfb46h		;fb9e  ; Continue interpreting
; --- Command $86: SET CHANNEL 2 tone ---
lfba0h:
	dec a			;fba0  ; Test for command $86
	jr nz,lfba7h		;fba1  ; Not $86 → try next
	ld b,002h		;fba3  ; B = channel 2 flag
	jr lfb89h		;fba5  ; Share channel setup code with $85
; --- Command $87: SET EFFECT parameters ---
; Reads note offset, looks up 3 effect bytes from frequency table,
; patches them into the beeper generator at $FC50, $FC78, $FC69.
;
lfba7h:
	ld a,(hl)			;fba7  ; A = effect note offset
	inc hl			;fba8
	add a,03ch		;fba9  ; A += $3C (table base offset)
	ld e,a			;fbab  ; E = low byte
	ld d,0feh		;fbac  ; D = $FE (table page)
	jr nc,lfbb1h		;fbae  ; No overflow → $FExx
	inc d			;fbb0  ; Overflow → $FFxx
lfbb1h:
	ld a,(de)			;fbb1  ; Read effect param 1
	ld (0fc50h),a		;fbb2  ; Patch into beeper: vibrato depth
	inc de			;fbb5
	ld a,(de)			;fbb6  ; Read effect param 2
	ld (0fc78h),a		;fbb7  ; Patch into beeper: vibrato rate
	inc de			;fbba
	ld a,(de)			;fbbb  ; Read effect param 3
	ld (0fc69h),a		;fbbc  ; Patch into beeper: waveform select
	jr lfb46h		;fbbf  ; Continue interpreting
; --- NOTE HANDLER ($FBC1) ---
; Called when data byte < $80. Duration in A, next byte is note code.
; Note code: bits 7-3 = pitch class, bits 2-0 = ornament/waveform.
;
lfbc1h:
	ld (0fdbdh),a		;fbc1  ; Store duration counter (self-mod at $FDBD)
lfbc4h:
	ld a,(hl)			;fbc4  ; A = note code byte
	inc hl			;fbc5
	ld (0fb44h),hl		;fbc6  ; Save data pointer (self-mod at $FB44)
	ld c,a			;fbc9  ; C = note code (save)
	and 0f8h		;fbca  ; Mask: keep bits 7-3 (pitch class)
	ld (lfc24h+1),a		;fbcc  ; Self-mod: store pitch for freq calc ($FC25)
	ld a,c			;fbcf  ; Restore full note code
	call sub_fdc8h		;fbd0  ; Compute frequency → HL = period
	jp z,lfd30h		;fbd3  ; Zero freq → rest (silence + wait loop)
	ex af,af'			;fbd6  ; Save note flags in A'
	ld a,001h		;fbd7  ; A = channel flag (self-mod: $01 or $02)
	rra			;fbd9  ; Test bit 0 (channel 1?)
	jr nc,lfc12h		;fbda  ; Not channel 1 → check channel 2
; --- Channel 1: portamento/slide setup ---
	ld a,014h		;fbdc  ; A = $14 = 20 (tone cycles per frame)
	ld (0fd0bh),a		;fbde  ; Store beeper cycle count (self-mod)
	call sub_fe04h		;fbe1  ; Load effect parameters from table
	ld c,a			;fbe4  ; C = effect offset value
	ld b,000h		;fbe5  ; BC = effect offset (16-bit)
	or a			;fbe7  ; Clear carry
	sbc hl,bc		;fbe8  ; HL = base freq - offset (slide start)
	ld (lfcf1h+1),hl		;fbea  ; Store slide lower bound (self-mod $FCF2)
	add hl,bc			;fbed  ; HL = base freq
	add hl,bc			;fbee  ; HL = base freq + offset (slide end)
	ld (0fce6h),hl		;fbef  ; Store slide upper bound (self-mod $FCE6)
	sbc hl,bc		;fbf2  ; HL = base freq (restore center)
; --- Duration countdown / note-off detection ---
lfbf4h:
	inc de			;fbf4  ; Advance effect data pointer
	ld a,(de)			;fbf5  ; A = next effect byte
	or a			;fbf6  ; Zero?
	jr z,lfc49h		;fbf7  ; Yes → no effect change, play note
	ld b,a			;fbf9  ; B = effect delta
	ex af,af'			;fbfa  ; A' = remaining duration
	sub b			;fbfb  ; Duration -= delta
	jr nc,lfc02h		;fbfc  ; Still positive → check for exact zero
lfbfeh:
	add a,b			;fbfe  ; Undo subtraction (restore duration)
	ex af,af'			;fbff  ; Save back to A'
	jr lfc49h		;fc00  ; Play note (duration not expired)
lfc02h:
	jr z,lfbfeh		;fc02  ; Exactly zero → keep playing
	ld c,a			;fc04  ; C = new duration remainder
	ld a,b			;fc05  ; A = effect delta
	ex af,af'			;fc06  ; Swap: A' = delta, A = remainder
	ld a,c			;fc07  ; A = remainder
	ld (lfda6h+1),a		;fc08  ; Store as pause counter (self-mod at $FDA7)
	ld a,018h		;fc0b  ; A = $18 (JR opcode)
	ld (lfcd9h),a		;fc0d  ; Patch beeper loop: skip to next (pause)
	jr lfc49h		;fc10  ; Continue to beeper setup
; ==========================================================================
; BEEPER FREQUENCY GENERATOR ($FC12)
; ==========================================================================
; Generates cycle-accurate beeper tones with portamento, vibrato, and
; duty cycle control. Self-modifying code patches timing values at runtime.
;
; --- Channel 2 setup ---
lfc12h:
	rra			;fc12  ; Test bit 1 (channel 2?)
	jr nc,lfc35h		;fc13  ; Not channel 2 → silence/rest
	xor a			;fc15  ; A = 0
	ld (0fd0bh),a		;fc16  ; Clear beeper cycle count (no audible tone)
	call sub_fe04h		;fc19  ; Load effect parameters
	push de			;fc1c  ; Save registers
	push hl			;fc1d
	bit 7,b		;fc1e  ; Test effect direction bit
lfc20h:
	jr nz,lfc24h		;fc20  ; Negative → skip negation
	neg		;fc22  ; Negate A (reverse effect direction)
lfc24h:
	add a,058h		;fc24  ; A += $58 (self-mod: pitch class from $FBCC)
	ld a,090h		;fc26  ; A = $90 (base note for channel 2)
	call sub_fdc8h		;fc28  ; Compute frequency for effect note
	ld (lfcf1h+1),hl		;fc2b  ; Store as both slide bounds (no slide)
	ld (0fce6h),hl		;fc2e
	pop hl			;fc31  ; Restore registers
	pop de			;fc32
	jr lfbf4h		;fc33  ; Continue with duration check
; --- Rest/silence: no active channel ---
lfc35h:
	ld (0fce6h),hl		;fc35  ; Store freq as upper bound
	ld (lfcf1h+1),hl		;fc38  ; Store freq as lower bound (no slide)
lfc3bh:
	ld de,00000h		;fc3b  ; DE = 0
	ld (0fcdch),de		;fc3e  ; Clear slide delta
	xor a			;fc42  ; A = 0
	ld (0fd0bh),a		;fc43  ; Clear beeper cycle count (silence)
	ld (0fce6h),hl		;fc46  ; Store upper bound
; --- BEEPER PLAYBACK SETUP ---
; Computes vibrato delta from frequency and effect parameters.
;
lfc49h:
	ld (0fccfh),hl		;fc49  ; Store current frequency
	ld de,00000h		;fc4c  ; DE = 0 (initial vibrato accumulator)
	ld a,002h		;fc4f  ; A = vibrato depth (self-mod at $FC50)
	or a			;fc51  ; Zero depth?
	jr z,lfc64h		;fc52  ; Yes → no vibrato
	ld e,l			;fc54  ; DE = frequency (copy HL)
	ld d,h			;fc55
	ld b,a			;fc56  ; B = vibrato depth
	dec de			;fc57  ; DE -= 2 (center adjustment)
	dec de			;fc58
	dec b			;fc59  ; B -= 1 (adjust for loop)
	jr z,lfc64h		;fc5a  ; Depth=1 → minimal vibrato
	inc de			;fc5c  ; Restore DE
	inc de			;fc5d
lfc5eh:
	srl d		;fc5e  ; DE >>= 1 (shift right)
	rr e		;fc60
	djnz lfc5eh		;fc62  ; Loop: divide by 2^depth
lfc64h:
	ld (lfc6eh+1),de		;fc64  ; Store vibrato step (self-mod at $FC6F)
	ld a,000h		;fc68  ; A = waveform select (self-mod at $FC69)
	ld (lfc7bh),a		;fc6a  ; Patch waveform instruction (NOP or EX)
	ei			;fc6d  ; Re-enable interrupts for tone output
; --- MAIN BEEPER TONE LOOP ---
; Generates one cycle of tone output with vibrato modulation.
; HL = current frequency period, DE = vibrato step.
; Self-modifying code controls vibrato rate, waveform, and speaker toggle.
;
lfc6eh:
	ld de,000bah		;fc6e  ; DE = vibrato step (self-mod at $FC6F)
	ld a,04ah		;fc71  ; A = vibrato rate counter (self-mod at $FC72)
	inc a			;fc73  ; Increment rate counter
	ld (0fc72h),a		;fc74  ; Store back (self-mod)
	and 0ffh		;fc77  ; Mask: vibrato rate (self-mod at $FC78)
	jr nz,lfc7ch		;fc79  ; Not zero → skip waveform change
lfc7bh:
	nop			;fc7b  ; Self-mod: NOP (flat) or EX DE,HL (swap)
lfc7ch:
	ld a,(0fcc6h)		;fc7c  ; A = speaker state (toggle bit)
	bit 4,a		;fc7f  ; Test speaker bit 4
	jr z,lfc8bh		;fc81  ; Speaker off → subtract frequency
; --- Speaker ON: add vibrato step ---
	add hl,de			;fc83  ; HL += DE (increase period)
	nop			;fc84  ; Timing padding (match cycle count with
	nop			;fc85  ;  subtract path for consistent timing)
	nop			;fc86
	nop			;fc87
	nop			;fc88
	jr lfca3h		;fc89  ; Skip to boundary check
; --- Speaker OFF: subtract vibrato step ---
lfc8bh:
	or a			;fc8b  ; Clear carry for SBC
	dec hl			;fc8c  ; HL -= 1 (pre-decrement)
	sbc hl,de		;fc8d  ; HL -= DE (decrease period)
	inc hl			;fc8f  ; HL += 1 (adjust)
	jr nc,lfca3h		;fc90  ; Period still positive → continue
; --- Underflow: period went negative, reverse vibrato direction ---
	ld hl,00001h		;fc92  ; HL = 1 (minimum period)
	ld a,(lfc7bh)		;fc95  ; A = waveform byte
	xor 008h		;fc98  ; Toggle bit 3 (reverse vibrato direction)
	ld (lfc7bh),a		;fc9a  ; Store back (self-mod)
	ld (lfca0h),a		;fc9d  ; Patch instruction at $FCA0
lfca0h:
	dec de			;fca0  ; Self-mod: DEC DE or INC DE (direction)
	jr lfcb4h		;fca1  ; Skip NOP padding
; --- NOP padding: cycle-count alignment for consistent timing ---
lfca3h:
	nop			;fca3  ; 17 NOPs = 68 T-states padding
	nop			;fca4  ; Ensures both speaker-on and speaker-off
	nop			;fca5  ; paths take identical cycle counts
	nop			;fca6
	nop			;fca7
	nop			;fca8
	nop			;fca9
	nop			;fcaa
	nop			;fcab
	nop			;fcac
	nop			;fcad
	nop			;fcae
	nop			;fcaf
	nop			;fcb0
	nop			;fcb1
	nop			;fcb2
	nop			;fcb3
; --- Tone output: frequency delay loop + speaker toggle ---
lfcb4h:
	ld (lfc6eh+1),de		;fcb4  ; Store updated vibrato step (self-mod)
	inc h			;fcb8  ; H += 1 (coarse period counter)
	srl l		;fcb9  ; L >>= 1 (fine period: half the resolution)
	inc l			;fcbb  ; L += 1 (ensure non-zero)
lfcbch:
	dec l			;fcbc  ; Inner delay loop: L cycles
	jr nz,lfcbch		;fcbd
	ld l,07fh		;fcbf  ; Reset L = 127 for outer loop
	dec h			;fcc1  ; Outer delay: H iterations
	jp nz,lfcbch		;fcc2  ; Loop until H = 0
; --- Toggle speaker ---
	ld a,010h		;fcc5  ; A = speaker state (self-mod at $FCC6)
	xor 010h		;fcc7  ; Toggle bit 4 (speaker)
	ld (0fcc6h),a		;fcc9  ; Store new state (self-mod)
	out (0feh),a		;fccc  ; Output to port $FE (speaker + border)
; --- Duration/portamento control ---
	ld hl,00174h		;fcce  ; HL = current freq (self-mod at $FCCF)
	ld a,0b7h		;fcd1  ; A = duration counter (self-mod at $FCD2)
	dec a			;fcd3  ; Decrement duration
	ld (0fcd2h),a		;fcd4  ; Store back (self-mod)
	and 003h		;fcd7  ; Mask: portamento rate (self-mod at $FCD8)
lfcd9h:
	jr lfd29h		;fcd9  ; Self-mod: JR (pause) or fall through (play)
; --- Portamento: slide frequency toward target ---
	ld de,00001h		;fcdb  ; DE = slide step (self-mod at $FCDC)
	add hl,de			;fcde  ; HL += step (slide frequency up)
	bit 7,d		;fcdf  ; D negative? (sliding down)
	ld e,l			;fce1  ; DE = HL (save current freq)
	ld d,h			;fce2
	jr nz,lfcf1h		;fce3  ; Sliding down → check lower bound
; --- Sliding up: check upper bound ---
	ld bc,0017ah		;fce5  ; BC = upper bound (self-mod at $FCE6)
	dec hl			;fce8
	or a			;fce9  ; Clear carry
	sbc hl,bc		;fcea  ; HL - upper bound
	jr nc,lfd07h		;fcec  ; HL >= bound → reached target, stop
	jp lfcfch		;fcee  ; Still sliding → continue delay
; --- Sliding down: check lower bound ---
lfcf1h:
	ld bc,0016eh		;fcf1  ; BC = lower bound (self-mod at $FCF2)
	or a			;fcf4  ; Clear carry
	sbc hl,bc		;fcf5  ; HL - lower bound
	jr c,lfd07h		;fcf7  ; HL < bound → reached target, stop
	nop			;fcf9  ; Timing padding
	nop			;fcfa
	nop			;fcfb
; --- Still sliding: timing delay and loop back ---
lfcfch:
	ld b,007h		;fcfc  ; B = 7 (timing delay)
lfcfeh:
	djnz lfcfeh		;fcfe  ; Waste cycles for consistent timing
	ex de,hl			;fd00  ; HL = saved frequency
lfd01h:
	ld (0fccfh),hl		;fd01  ; Store current freq (self-mod at $FCCF)
	jp lfc6eh		;fd04  ; Loop back for next tone cycle
; --- Slide reached target: reverse direction ---
lfd07h:
	ld hl,00000h		;fd07  ; HL = 0
	jr lfd20h		;fd0a  ; Jump to direction reversal
; ==========================================================================
; SELF-MODIFYING STORAGE ($FD0C-$FD18)
; ==========================================================================
; Runtime variables used by the beeper engine. Initialized to NOP ($00)
; and overwritten during playback.
;
	nop			;fd0c  ; Beeper var: slide direction flag
	nop			;fd0d  ; Beeper var: current waveform state
	nop			;fd0e  ; Beeper var: effect parameter 1
	nop			;fd0f  ; Beeper var: effect parameter 2
	nop			;fd10  ; Beeper var: tone counter low
	nop			;fd11  ; Beeper var: tone counter high
	nop			;fd12  ; Beeper var: envelope phase
	nop			;fd13  ; Beeper var: envelope counter
	nop			;fd14  ; Beeper var: channel state 1
	nop			;fd15  ; Beeper var: channel state 2
	nop			;fd16  ; Beeper var: mix level
	nop			;fd17  ; Beeper var: reserved
	nop			;fd18  ; Beeper var: reserved
; --- Slide direction reversal ---
; Negates the slide delta to reverse portamento direction.
;
lfd19h:
	ld (0fcdch),hl		;fd19  ; Store new slide delta (negated)
	ld l,c			;fd1c  ; HL = BC (boundary frequency)
	ld h,b			;fd1d
	jr lfd01h		;fd1e  ; Store freq and loop back
; --- Compute negated delta: HL = 0 - DE ---
lfd20h:
	ld de,(0fcdch)		;fd20  ; DE = current slide delta
	or a			;fd24  ; Clear carry
	sbc hl,de		;fd25  ; HL = 0 - DE (negate)
	jr lfd19h		;fd27  ; Store and continue
; --- Pause delay: waste time when beeper is paused ---
lfd29h:
	ld b,010h		;fd29  ; B = 16 (delay loop)
lfd2bh:
	djnz lfd2bh		;fd2b  ; Waste 15*13 + 8 = 203 T-states
	jp lfc6eh		;fd2d  ; Loop back to beeper
; --- REST handler: silence + halt until keypress ---
lfd30h:
	ex af,af'			;fd30  ; Restore A (note flags)
	ei			;fd31  ; Enable interrupts
lfd32h:
	jr lfd32h		;fd32  ; Infinite loop (ISR handles exit)
; ==========================================================================
; MAIN ISR HANDLER ($FD34)
; ==========================================================================
; Called on every frame interrupt via IM2 vector at $FFF4.
; Uses alternate register set: B' = frame divider, C' = sub-counter.
;
; Flow:
;   1. DJNZ B' → if B' != 0, skip to exit (speed control divider)
;   2. Read keyboard port $FE → if any key pressed, signal and return
;   3. Increment C' sub-counter → every 16th call, run speed engine
;   4. Generate beeper tones (20 cycles per frame)
;   5. Restore registers, EI, RET
;
lfd34h:
	ex af,af'			;fd34  ; Save A/flags to alternate set
	exx			;fd35  ; Switch to B'/C'/D'/E'/H'/L'
	djnz lfd8eh		;fd36  ; B'-- → if not zero, skip to ISR exit
; --- B' reached 0: process this frame ---
	push af			;fd38  ; Save flags
	xor a			;fd39  ; A = 0
	in a,(0feh)		;fd3a  ; Read keyboard port (all rows)
	cpl			;fd3c  ; Invert (pressed keys become 1)
	and 01fh		;fd3d  ; Mask to 5 key bits
	jr z,lfd46h		;fd3f  ; No keys → continue
; --- Key pressed: signal and return ---
	scf			;fd41  ; Set carry flag (key pressed signal)
lfd42h:
	ld sp,buf1_end		;fd42  ; Restore SP (self-modified by sound engine)
	ret			;fd45  ; Return to caller with carry set
; --- No key: increment sub-frame counter ---
lfd46h:
	inc c			;fd46  ; C'++ (sub-frame counter)
	ld a,c			;fd47
	cp 010h		;fd48  ; C' == 16?
	jr nz,lfd57h		;fd4a  ; Not yet → skip speed check
	ld a,007h		;fd4c  ; A = speed counter (self-modified)
	dec a			;fd4e  ; Decrement
	call z,sub_fd95h		;fd4f  ; If zero → cycle to next speed setting
	ld (0fd4dh),a		;fd52  ; Store updated counter (self-mod at $FD4D)
	xor a			;fd55  ; A = 0
	ld c,a			;fd56  ; Reset C' sub-counter
; --- Beeper tone generation ---
lfd57h:
	ld hl,lff60h		;fd57  ; HL = sound routine addr (self-modified)
	call isr_code_end		;fd5a  ; Call sound routine via trampoline
	or a			;fd5d  ; A = sound type (0 = silent)
	jr z,lfd8bh		;fd5e  ; Silent → skip beeper
	ld e,01fh		;fd60  ; E = $1F (border color mask)
	dec a			;fd62  ; Adjust sound type
	jr nz,lfd68h		;fd63
	ld e,000h		;fd65  ; Type 1: no border flash
	inc a			;fd67
lfd68h:
	ld (0fd78h),a		;fd68  ; Store pitch factor (self-mod)
	ld a,e			;fd6b
	ld (lfd7ah),a		;fd6c  ; Store border mask (self-mod)
; --- Beeper output loop: 20 tones ---
	ld e,014h		;fd6f  ; E = 20 (tone cycles per frame)
	ld hl,01000h		;fd71  ; HL = frequency counter
	ld d,000h		;fd74  ; D = border toggle state
lfd76h:
	ld a,(hl)			;fd76  ; A = waveform sample
	ld b,001h		;fd77  ; B = pitch loop count (self-modified)
lfd79h:
	or a			;fd79  ; Timing: 4 T-states
lfd7ah:
	nop			;fd7a  ; Self-modified: NOP or AND E (border mask)
	djnz lfd79h		;fd7b  ; Inner pitch delay loop
	inc a			;fd7d
	ld b,a			;fd7e  ; B = inverted pitch delay
lfd7fh:
	djnz lfd7fh		;fd7f  ; Complementary delay (constant total)
	ld a,d			;fd81  ; A = current border/speaker state
	xor 010h		;fd82  ; Toggle bit 4 (speaker)
	ld d,a			;fd84  ; Save new state
	out (0feh),a		;fd85  ; Output to speaker + border
	dec e			;fd87  ; Count down tone cycles
	inc hl			;fd88  ; Next waveform position
	jr nz,lfd76h		;fd89  ; Loop 20 cycles
; --- ISR exit ---
lfd8bh:
	ld b,005h		;fd8b  ; B' = 5 (reload frame divider)
	pop af			;fd8d  ; Restore flags
lfd8eh:
	exx			;fd8e  ; Restore main registers
	dec a			;fd8f  ; A'-- (check for pause trigger)
	jr z,lfda6h		;fd90  ; A' == 0 → handle pause (CS+P)
lfd92h:
	ex af,af'			;fd92  ; Restore A/flags
	ei			;fd93  ; Re-enable interrupts
	ret			;fd94  ; Return from ISR
; ==========================================================================
; SPEED CONTROL ENGINE ($FD95)
; ==========================================================================
; Cycles through speed presets stored at $FF40+. Each preset is 3 bytes:
;   Byte 0-1: sound routine address (loaded into $FD58)
;   Byte 2: speed counter value (loaded into $FD4D)
; CS+S triggers sub_fd95h which advances to next preset.
;
sub_fd95h:
	ld hl,lff48h		;fd95  ; HL -> speed table (self-modified to cycle)
sub_fd98h:
	ld e,(hl)			;fd98  ; DE = sound routine address from table
	inc hl			;fd99
	ld d,(hl)			;fd9a
	inc hl			;fd9b
	ld a,(hl)			;fd9c  ; A = speed counter value
	inc hl			;fd9d
	ld (sub_fd95h+1),hl		;fd9e  ; Self-mod: advance table pointer
	ld (lfd57h+1),de		;fda1  ; Self-mod: set sound routine address
	ret			;fda5
; --- PAUSE HANDLER (CS+P) ---
; When A' decrements to 0 (from ISR exit), checks if pause is active.
; Uses self-modifying code at $FCD9 to freeze the beeper loop.
;
lfda6h:
	ld a,00ch		;fda6  ; A = $0C (self-modified: $0C=active, $00=inactive)
	or a			;fda8  ; Test pause state
	jr z,lfdb8h		;fda9  ; If inactive → resume playback
	push af			;fdab  ; Pause active: freeze beeper
	ld a,020h		;fdac  ; A = $20 (JR NZ opcode)
	ld (lfcd9h),a		;fdae  ; Restore beeper to play mode (conditional portamento)
	xor a			;fdb1  ; A = 0
	ld (lfda6h+1),a		;fdb2  ; Clear pause flag (self-mod: next call resumes)
	pop af			;fdb5
	jr lfd92h		;fdb6  ; Return to ISR exit
; --- Resume from pause ---
lfdb8h:
	pop hl			;fdb8  ; Discard return address
	ld hl,(0fb44h)		;fdb9  ; HL = sound data continuation point
	ld a,013h		;fdbc  ; A = $13 (playback counter)
	dec a			;fdbe  ; A = $12
lfdbfh:
	ld (0fdbdh),a		;fdbf  ; Store counter (self-mod)
	jp z,lfb46h		;fdc2  ; If zero → restart sound interpreter
	jp lfbc4h		;fdc5  ; Continue sound playback
; ==========================================================================
; NOTE FREQUENCY COMPUTATION ($FDC8)
; ==========================================================================
; Converts a note code to a beeper frequency value.
; Input: A = encoded note (octave in bits 7-3, semitone in bits 2-0)
; Output: HL = frequency period value for beeper timing loop
;
; Algorithm:
;   1. Extract base note index: (A >> 3) + 36
;   2. Divide by 12 → octave (B), remainder → semitone (A)
;   3. Look up base period from table at $FE24
;   4. Shift right by octave number (halving period = doubling freq)
;
sub_fdc8h:
	ld c,a			;fdc8  ; C = original note code (save for later)
	rra			;fdc9  ; A = note >> 3 (shift right 3 times)
	rra			;fdca
	rra			;fdcb
	and 01fh		;fdcc  ; Mask to 5 bits (0-31)
	add a,024h		;fdce  ; A = note_index + 36 (base offset)
	ld b,0ffh		;fdd0  ; B = -1 (octave counter, will become 0+)
lfdd2h:
	inc b			;fdd2  ; B = octave number (0, 1, 2, ...)
	sub 00ch		;fdd3  ; Subtract 12 (semitones per octave)
	jr nc,lfdd2h		;fdd5  ; Loop while >= 0
	add a,00ch		;fdd7  ; A = semitone within octave (0-11)
	add a,a			;fdd9  ; A = semitone * 2 (2 bytes per table entry)
	ld hl,lfe24h		;fdda  ; HL -> frequency lookup table base
	call isr_code_end		;fddd  ; Add A to HL (table index)
lfde0h:
	inc hl			;fde0  ; Point to high byte
	ld h,(hl)			;fde1  ; H = period high byte
	ld l,a			;fde2  ; L = period low byte (from table)
	ld a,b			;fde3  ; A = octave number
	or a			;fde4  ; Octave 0?
	jr z,lfdedh		;fde5  ; Yes → no shifting needed
lfde7h:
	srl h		;fde7  ; Shift HL right (halve period = octave up)
	rr l		;fde9
	djnz lfde7h		;fdeb  ; Loop B times (one shift per octave)
; --- Post-frequency adjustment ---
; Applies fine-tuning offset and ornament lookup.
;
lfdedh:
	ld de,00046h		;fded  ; DE = $46 (tuning offset constant)
	or a			;fdf0  ; Clear carry
	sbc hl,de		;fdf1  ; HL -= $46 (apply tuning correction)
	ld a,c			;fdf3  ; A = original note code
	and 007h		;fdf4  ; Mask bits 2-0 (ornament index, 0-7)
	ex de,hl			;fdf6  ; DE = adjusted frequency
	ld hl,lff3dh		;fdf7  ; HL -> ornament table at $FF3D
	call isr_code_end		;fdfa  ; Add A to HL (index into ornament table)
; --- Return with ornament-adjusted frequency ---
sub_fdfdh:
	ex de,hl			;fdfd  ; HL = frequency, DE = ornament entry
	ld b,a			;fdfe  ; B = ornament value
	ld a,c			;fdff  ; A = original note code
	and 0f8h		;fe00  ; Keep bits 7-3 (pitch class, clear ornament)
	ld a,b			;fe02  ; A = ornament value (return in A)
sub_fe03h:
	ret			;fe03
; ==========================================================================
; EFFECT PARAMETER LOADER ($FE04)
; ==========================================================================
; Reads 3-byte effect entry from table at $FE4C.
; Byte 0: portamento rate mask (stored at $FCD8)
; Byte 1: slide step (signed, stored at $FCDC as 16-bit)
; Byte 2: envelope/volume parameter (returned in A)
;
sub_fe04h:
	ex de,hl			;fe04  ; DE = current freq, HL free
	ld hl,lfe4ch		;fe05  ; HL -> effect parameter table (self-mod)
	ld a,(hl)			;fe08  ; A = portamento rate mask
	ld (0fcd8h),a		;fe09  ; Store at $FCD8 (self-mod for AND mask)
	inc hl			;fe0c
	ld c,(hl)			;fe0d  ; C = slide step (signed byte)
	ld b,000h		;fe0e  ; B = 0 (extend to 16-bit, positive)
	inc hl			;fe10
	bit 7,c		;fe11  ; Test sign bit
	jr z,lfe16h		;fe13  ; Positive → BC is correct
	dec b			;fe15  ; Negative → B = $FF (sign extend)
lfe16h:
	ld (0fcdch),bc		;fe16  ; Store 16-bit slide step (self-mod at $FCDC)
	ld a,(hl)			;fe1a  ; A = envelope parameter
	ex de,hl			;fe1b  ; HL = frequency again
	ret			;fe1c
; --- Trampoline: table lookup via A + HL ---
; Used by CALL isr_code_end: adds A to L, handles page crossing,
; loads byte at (HL) into A, returns.
; Bytes: ADD A,L / LD L,A / JR NC,+1 / INC H / LD A,(HL) / RET.
;
isr_code_end:

; ==========================================================================
; SOUND DATA ($FE1D-$FF3F)
; ==========================================================================
; Contains the frequency lookup table, effect parameter tables, note
; pattern data, and ornament tables used by the sound interpreter.
; This data also embeds the ADD_A_TO_HL trampoline at $FE1D-$FE23.
;
snd_data_start:
	defb 085h		;fe1d  ; ADD A,L (trampoline code byte 1)
	defb 06fh		;fe1e  ; LD L,A  (trampoline code byte 2)
	defb 030h		;fe1f  ; JR NC,+1 (skip INC H when no page overflow)
	defb 001h		;fe20
	defb 024h		;fe21
	defb 07eh		;fe22  ; LD A,(HL) (part of trampoline path)
	defb 0c9h		;fe23  ; RET (trampoline return)
; --- FREQUENCY TABLE ($FE24-$FE3B) ---
; 12 two-byte entries: base period values for semitones C through B.
; Higher values = lower frequencies. Shifted right per octave.
;
lfe24h:
	defb 021h		;fe24  ; C  period = $1A21
	defb 01ah		;fe25
	defb 0aah		;fe26  ; C# period = $18AA
	defb 018h		;fe27
	defb 047h		;fe28  ; D  period = $1747
	defb 017h		;fe29
	defb 0f9h		;fe2a  ; D# period = $15F9
	defb 015h		;fe2b
	defb 0bdh		;fe2c  ; E  period = $14BD
	defb 014h		;fe2d
	defb 093h		;fe2e  ; F  period = $1393
	defb 013h		;fe2f
	defb 07ah		;fe30  ; F# period = $127A
	defb 012h		;fe31
	defb 070h		;fe32  ; G  period = $1170
	defb 011h		;fe33
	defb 076h		;fe34  ; G# period = $1076
	defb 010h		;fe35
	defb 089h		;fe36  ; A  period = $0F89
	defb 00fh		;fe37
	defb 0aah		;fe38  ; A# period = $0EAA
	defb 00eh		;fe39
	defb 0d7h		;fe3a  ; B  period = $0DD7
	defb 00dh		;fe3b
; --- EFFECT CONFIG TABLE ($FE3C-$FE4B) ---
; Entries used by command $87 (SET EFFECT). 3 bytes per entry:
;   vibrato depth, vibrato rate, waveform select
;
	defb 001h		;fe3c
	defb 000h		;fe3d
	defb 013h		;fe3e
	defb 002h		;fe3f
	defb 0ffh		;fe40
	defb 000h		;fe41
	defb 002h		;fe42
	defb 007h		;fe43
	defb 01bh		;fe44
	defb 002h		;fe45
	defb 01fh		;fe46
	defb 01bh		;fe47
	defb 003h		;fe48
	defb 001h		;fe49
	defb 008h		;fe4a
	defb 006h		;fe4b
; --- EFFECT PARAMETER TABLE ($FE4C-$FE5D) ---
; 3-byte entries: portamento rate mask, slide step, envelope param.
; Referenced by sub_fe04h.
;
lfe4ch:
	defb 003h		;fe4c
	defb 001h		;fe4d
	defb 006h		;fe4e
	defb 012h		;fe4f
	defb 001h		;fe50
	defb 001h		;fe51
	defb 010h		;fe52
	defb 004h		;fe53
	defb 000h		;fe54
	defb 001h		;fe55
	defb 018h		;fe56
	defb 003h		;fe57
	defb 000h		;fe58
	defb 0ffh		;fe59
	defb 060h		;fe5a
	defb 014h		;fe5b
	defb 013h		;fe5c
	defb 05bh		;fe5d
; --- SOUND PATTERN DATA ($FE5E-$FF0D) ---
; Bytecoded music/SFX sequences interpreted by sub_fb3ah.
; Format: command bytes ($80-$87) interleaved with note/duration data.
; Alternate entry point for the sound interpreter (called from $FB43).
;
lfe5eh:
	defb 050h		;fe5e
	defb 040h		;fe5f
	defb 05dh		;fe60
	defb 042h		;fe61
	defb 052h		;fe62
	defb 05ah		;fe63
	defb 06bh		;fe64
	defb 058h		;fe65
	defb 050h		;fe66
	defb 06dh		;fe67
	defb 06ah		;fe68
	defb 07ah		;fe69
	defb 082h		;fe6a
	defb 083h		;fe6b
	defb 05eh		;fe6c
	defb 06ch		;fe6d
	defb 07ah		;fe6e
	defb 082h		;fe6f
	defb 082h		;fe70
	defb 008h		;fe71
	defb 092h		;fe72
	defb 082h		;fe73
	defb 07ah		;fe74
	defb 06ah		;fe75
	defb 07ah		;fe76
	defb 06ah		;fe77
	defb 05ah		;fe78
	defb 052h		;fe79
	defb 082h		;fe7a
	defb 008h		;fe7b
	defb 092h		;fe7c
	defb 082h		;fe7d
	defb 072h		;fe7e
	defb 06ah		;fe7f
	defb 072h		;fe80
	defb 06ah		;fe81
	defb 05ah		;fe82
	defb 04ah		;fe83
	defb 082h		;fe84
	defb 00dh		;fe85
	defb 039h		;fe86
	defb 030h		;fe87
	defb 020h		;fe88
	defb 03bh		;fe89
	defb 020h		;fe8a
	defb 030h		;fe8b
	defb 039h		;fe8c
	defb 030h		;fe8d
	defb 020h		;fe8e
	defb 031h		;fe8f
	defb 020h		;fe90
	defb 018h		;fe91
	defb 035h		;fe92
	defb 082h		;fe93
	defb 00ah		;fe94
	defb 039h		;fe95
	defb 030h		;fe96
	defb 020h		;fe97
	defb 03bh		;fe98
	defb 020h		;fe99
	defb 030h		;fe9a
	defb 039h		;fe9b
	defb 030h		;fe9c
	defb 020h		;fe9d
	defb 04fh		;fe9e
	defb 082h		;fe9f
	defb 009h		;fea0
	defb 031h		;fea1
	defb 020h		;fea2
	defb 010h		;fea3
	defb 033h		;fea4
	defb 031h		;fea5
	defb 030h		;fea6
	defb 038h		;fea7
	defb 049h		;fea8
	defb 057h		;fea9
	defb 082h		;feaa
	defb 00ah		;feab
	defb 05ah		;feac
	defb 051h		;fead
	defb 032h		;feae
	defb 049h		;feaf
	defb 041h		;feb0
	defb 021h		;feb1
	defb 03ah		;feb2
	defb 031h		;feb3
	defb 011h		;feb4
	defb 037h		;feb5
	defb 086h		;feb6
	defb 01ch		;feb7
	defb 001h		;feb8
	defb 034h		;feb9
	defb 085h		;feba
	defb 00ch		;febb
	defb 00bh		;febc
	defb 092h		;febd
	defb 089h		;febe
	defb 06ah		;febf
	defb 081h		;fec0
	defb 079h		;fec1
	defb 059h		;fec2
	defb 072h		;fec3
	defb 069h		;fec4
	defb 049h		;fec5
	defb 06ch		;fec6
	defb 06fh		;fec7
	defb 082h		;fec8
	defb 00bh		;fec9
	defb 079h		;feca
	defb 059h		;fecb
	defb 041h		;fecc
	defb 058h		;fecd
	defb 078h		;fece
	defb 079h		;fecf
	defb 058h		;fed0
	defb 040h		;fed1
	defb 081h		;fed2
	defb 078h		;fed3
	defb 058h		;fed4
	defb 083h		;fed5
	defb 0c9h		;fed6
	defb 0feh		;fed7
	defb 002h		;fed8
	defb 085h		;fed9
	defb 014h		;feda
	defb 00bh		;fedb
	defb 081h		;fedc
	defb 069h		;fedd
	defb 041h		;fede
	defb 068h		;fedf
	defb 080h		;fee0
	defb 081h		;fee1
	defb 068h		;fee2
	defb 040h		;fee3
	defb 091h		;fee4
	defb 080h		;fee5
	defb 078h		;fee6
	defb 083h		;fee7
	defb 0dbh		;fee8
	defb 0feh		;fee9
	defb 002h		;feea
	defb 00bh		;feeb
	defb 069h		;feec
	defb 059h		;feed
	defb 051h		;feee
	defb 058h		;feef
	defb 068h		;fef0
	defb 069h		;fef1
	defb 058h		;fef2
	defb 050h		;fef3
	defb 081h		;fef4
	defb 078h		;fef5
	defb 058h		;fef6
	defb 083h		;fef7
	defb 0ebh		;fef8
	defb 0feh		;fef9
	defb 002h		;fefa
	defb 085h		;fefb
	defb 018h		;fefc
	defb 00bh		;fefd
sub_fefeh:
	defb 079h		;fefe
	defb 069h		;feff
	defb 051h		;ff00
lff01h:
	defb 068h		;ff01
	defb 078h		;ff02
	defb 079h		;ff03
	defb 068h		;ff04
	defb 050h		;ff05
	defb 081h		;ff06
	defb 078h		;ff07
lff08h:
	defb 068h		;ff08
	defb 083h		;ff09
	defb 0fdh		;ff0a
	defb 0feh		;ff0b
	defb 002h		;ff0c
	defb 082h		;ff0d
; --- DEFAULT SOUND DATA ($FF0E) ---
; Initial sound sequence loaded by IM2 init at $FB3A.
; Contains instrument setup ($84=transpose, $85=channel, $87=effect)
; and CALL commands ($81) to pattern data.
;
lff0eh:
	defb 084h		;ff0e  ; CMD $84: SET TRANSPOSE
	defb 024h		;ff0f
	defb 085h		;ff10
	defb 010h		;ff11
	defb 087h		;ff12
	defb 003h		;ff13
	defb 081h		;ff14
	defb 05ch		;ff15
	defb 0feh		;ff16
	defb 081h		;ff17
	defb 071h		;ff18
	defb 0feh		;ff19
	defb 087h		;ff1a
	defb 009h		;ff1b
	defb 081h		;ff1c
	defb 05ch		;ff1d
	defb 0feh		;ff1e
	defb 087h		;ff1f
	defb 006h		;ff20
	defb 081h		;ff21
	defb 07bh		;ff22
	defb 0feh		;ff23
	defb 087h		;ff24
	defb 000h		;ff25
	defb 085h		;ff26
	defb 000h		;ff27
lff28h:
	defb 081h		;ff28
	defb 085h		;ff29
	defb 0feh		;ff2a
	defb 081h		;ff2b
	defb 094h		;ff2c
	defb 0feh		;ff2d
	defb 081h		;ff2e
	defb 085h		;ff2f
	defb 0feh		;ff30
	defb 081h		;ff31
	defb 0a0h		;ff32
	defb 0feh		;ff33
	defb 085h		;ff34
	defb 00ch		;ff35
	defb 081h		;ff36
	defb 0abh		;ff37
	defb 0feh		;ff38
	defb 081h		;ff39
	defb 0c9h		;ff3a
	defb 0feh		;ff3b
	defb 080h		;ff3c
; --- ORNAMENT TABLE ($FF3D-$FF3F) ---
; 3-byte table indexed by note bits 2-0, used for fine-tuning.
;
lff3dh:
	defb 005h		;ff3d  ; Ornament 0: +5
	defb 00ah		;ff3e  ; Ornament 1: +10
lff3fh:
	defb 014h		;ff3f  ; Ornament 2: +20
; ==========================================================================
; SPEED PRESET TABLE ($FF40-$FF5F)
; ==========================================================================
; Speed presets, 3 bytes each. Cycled by CS+S via sub_fd95h.
; Format: sound_addr_lo, sound_addr_hi, speed_counter
;
	defb 01eh		;ff40  ; Preset 0: addr=$281E, speed=60
	defb 028h		;ff41
	defb 03ch		;ff42
	defb 032h		;ff43  ; Preset 1: addr=$5032, speed=96
	defb 050h		;ff44
lff45h:
	defb 060h		;ff45  ; Preset 2 (initial): addr=$FF60, speed=7
	defb 0ffh		;ff46
	defb 007h		;ff47
lff48h:
	defb 070h		;ff48  ; Preset 3: addr=$FF70, speed=1
	defb 0ffh		;ff49
	defb 001h		;ff4a
	defb 060h		;ff4b  ; Preset 4: addr=$FF60, speed=6
	defb 0ffh		;ff4c
	defb 006h		;ff4d
	defb 070h		;ff4e  ; Preset 5: addr=$FF70, speed=5
	defb 0ffh		;ff4f
	defb 005h		;ff50
	defb 060h		;ff51  ; Preset 6: addr=$FF60, speed=1
	defb 0ffh		;ff52
	defb 001h		;ff53
	defb 070h		;ff54  ; Preset 7: addr=$FF70, speed=2
	defb 0ffh		;ff55
	defb 002h		;ff56
	defb 060h		;ff57  ; Preset 8: addr=$FF60, speed=2
	defb 0ffh		;ff58
	defb 002h		;ff59
	defb 080h		;ff5a  ; Preset 9: addr=$FF80, speed=6
	defb 0ffh		;ff5b
	defb 006h		;ff5c
	defb 060h		;ff5d  ; Preset 10: addr=$FF60, speed=9
	defb 0ffh		;ff5e
	defb 009h		;ff5f
; ==========================================================================
; SOUND ROUTINE DATA ($FF60-$FF8F)
; ==========================================================================
; Small sound routine tables pointed to by speed presets.
; Each is a short sequence of beeper timing values.
;
lff60h:
	defb 001h		;ff60  ; Sound routine A: tone sequence
	defb 001h		;ff61
	defb 001h		;ff62
	defb 000h		;ff63
	defb 005h		;ff64
	defb 000h		;ff65
	defb 001h		;ff66
	defb 000h		;ff67
	defb 001h		;ff68
	defb 000h		;ff69
	defb 001h		;ff6a
	defb 001h		;ff6b
	defb 005h		;ff6c
	defb 000h		;ff6d
	defb 005h		;ff6e
	defb 000h		;ff6f
	defb 001h		;ff70  ; Sound routine B: alternate tone
	defb 002h		;ff71
	defb 002h		;ff72
	defb 000h		;ff73
	defb 002h		;ff74
	defb 000h		;ff75
	defb 005h		;ff76
	defb 000h		;ff77
	defb 001h		;ff78
	defb 000h		;ff79
	defb 002h		;ff7a
	defb 002h		;ff7b
	defb 005h		;ff7c
	defb 000h		;ff7d
	defb 004h		;ff7e
	defb 000h		;ff7f
	defb 001h		;ff80  ; Sound routine C: short tone
	defb 000h		;ff81
	defb 000h		;ff82
	defb 000h		;ff83
	defb 000h		;ff84
	defb 000h		;ff85
	defb 000h		;ff86
	defb 000h		;ff87
	defb 003h		;ff88
; ==========================================================================
; RUNTIME STATE / FEATURE FLAGS ($FF89-$FF90)
; ==========================================================================
; Initialized values used by game engine at runtime.
; Some are overwritten by the sound interpreter or ISR.
;
	defb 000h		;ff89
	defb 000h		;ff8a
	defb 000h		;ff8b
	defb 000h		;ff8c
	defb 000h		;ff8d
	defb 000h		;ff8e
	defb 000h		;ff8f
	defb 000h		;ff90
; --- DUPLICATE SOUND DATA ($FF91-$FFBC) ---
; Mirror copy of default sound sequence (same as $FF0E-$FF3C).
; May be used as a second playback channel or backup.
;
	defb 010h		;ff91
	defb 087h		;ff92
	defb 003h		;ff93
	defb 081h		;ff94
	defb 05ch		;ff95
	defb 0feh		;ff96
	defb 081h		;ff97
	defb 071h		;ff98
	defb 0feh		;ff99
	defb 087h		;ff9a
	defb 009h		;ff9b
	defb 081h		;ff9c
	defb 05ch		;ff9d
	defb 0feh		;ff9e
	defb 087h		;ff9f
	defb 006h		;ffa0
	defb 081h		;ffa1
	defb 07bh		;ffa2
	defb 0feh		;ffa3
	defb 087h		;ffa4
	defb 000h		;ffa5
	defb 085h		;ffa6
	defb 000h		;ffa7
	defb 081h		;ffa8
	defb 085h		;ffa9
	defb 0feh		;ffaa
	defb 081h		;ffab
	defb 094h		;ffac
	defb 0feh		;ffad
	defb 081h		;ffae
	defb 085h		;ffaf
	defb 0feh		;ffb0
	defb 081h		;ffb1
	defb 0a0h		;ffb2
	defb 0feh		;ffb3
	defb 085h		;ffb4
	defb 00ch		;ffb5
	defb 081h		;ffb6
	defb 0abh		;ffb7
	defb 0feh		;ffb8
	defb 081h		;ffb9
	defb 0c9h		;ffba
	defb 0feh		;ffbb
	defb 080h		;ffbc
	defb 005h		;ffbd
	defb 00ah		;ffbe
	defb 014h		;ffbf
	defb 01eh		;ffc0
	defb 028h		;ffc1
	defb 03ch		;ffc2
	defb 032h		;ffc3
	defb 050h		;ffc4
	defb 060h		;ffc5
	defb 0ffh		;ffc6
	defb 007h		;ffc7
	defb 070h		;ffc8
	defb 0ffh		;ffc9
	defb 001h		;ffca
	defb 060h		;ffcb
	defb 0ffh		;ffcc
	defb 006h		;ffcd
	defb 070h		;ffce
	defb 0ffh		;ffcf
	defb 005h		;ffd0
	defb 060h		;ffd1
	defb 0ffh		;ffd2
	defb 001h		;ffd3
	defb 070h		;ffd4
	defb 0ffh		;ffd5
	defb 002h		;ffd6
	defb 060h		;ffd7
	defb 0ffh		;ffd8
	defb 002h		;ffd9
	defb 080h		;ffda
	defb 0ffh		;ffdb
	defb 006h		;ffdc
	defb 060h		;ffdd
	defb 0ffh		;ffde
	defb 009h		;ffdf
; --- DUPLICATE SOUND ROUTINES ($FFE0-$FFF3) ---
; Mirror copy of sound routine data (same as $FF60-$FF80).
;
lffe0h:
	defb 001h		;ffe0
lffe1h:
	defb 001h		;ffe1
	defb 001h		;ffe2
	defb 000h		;ffe3
	defb 005h		;ffe4
	defb 000h		;ffe5
	defb 001h		;ffe6
	defb 000h		;ffe7
	defb 001h		;ffe8
	defb 000h		;ffe9
	defb 001h		;ffea
	defb 001h		;ffeb
	defb 005h		;ffec
	defb 000h		;ffed
	defb 005h		;ffee
	defb 000h		;ffef
	defb 001h		;fff0
	defb 002h		;fff1
	defb 002h		;fff2
	defb 000h		;fff3
snd_data_end:

; ==========================================================================
; IM2 INTERRUPT VECTOR ($FFF4-$FFFB)
; ==========================================================================
; At runtime, $FFF4 is overwritten with: JP $FD34 (C3 34 FD).
; Initial values here are placeholders from the binary.
; $FFFF is also written (A=$18) to ensure IM2 bus byte works correctly.
;
im2_jp_start:
	defb 010h		;fff4  ; Overwritten: $C3 (JP opcode)
lfff5h:
	defb 010h		;fff5  ; Overwritten: $34 (ISR addr low)
	defb 010h		;fff6  ; Overwritten: $FD (ISR addr high)
	defb 000h		;fff7  ; Padding
lfff8h:
	defb 000h		;fff8  ; Padding
	defb 042h		;fff9  ; Padding ($42 = 'B')
	defb 042h		;fffa  ; Padding ($42 = 'B')
	defb 042h		;fffb  ; Padding ($42 = 'B')
im2_jp_end:
