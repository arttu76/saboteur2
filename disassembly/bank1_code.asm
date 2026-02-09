; ======================================================================
; bank1_code.asm
; ======================================================================
;
; Bank 1 Sound/Music Engine (AY-3-8912)
;
; Address range: $9C40-$A627 (2536 bytes)
; Source binary: block5_data.bin (loaded at $9C22)
;
; Complete interrupt-driven music player and sound effects engine for
; the AY-3-8912 PSG chip found in the ZX Spectrum 128K. This code is
; copied to bank 1 at runtime addresses $F618-$FFFF (add $59D8 to
; convert source -> runtime addresses). All JP/CALL targets in this
; file use the runtime address space ($F6xx-$FFxx).
;
; Architecture:
;   - 3 sound channels (A, B, C) with independent pattern playback
;   - IX-indexed channel state structures at $F677, $F698, $F6B9
;     (33 bytes each: position, pattern ptr, volume, envelope, etc.)
;   - AY chip accessed via ports $FFFD (register select) and
;     $BFFD (data write)
;   - AY registers 0-5: tone periods (A/B/C, 12-bit each)
;   - AY register 6: noise period, register 7: mixer control
;   - AY registers 8-10: channel volumes, 11-13: envelope
;
; Code sections:
;   $9C40-$9C9E: Initialization (song load, channel setup)
;   $9D03-$9D6D: Main tick handler (called per interrupt)
;   $9D6E-$9D95: AY register write helpers
;   $9DB0-$A04F: Channel processing (pattern read, envelope, note calc)
;
; Data sections:
;   $9D96-$9DA8: Waveform/frequency lookup table
;   $A050-$A0F1: Note period table (AY tone register values)
;   $A0F2-$A14E: Duration/timing tables, init parameters
;   $A14F-$A627: Music pattern data (song sequences for all channels)
;
; Entry points (runtime addresses):
;   $F618 (SOUND_ENGINE_START): JP to song initializer
;   $F621: JP to stop routine
;   $F628: JP to channel initializer
;   $F6DB: JP to main tick handler
;
; Cross-references:
;   Called from: main game code via bank-switching (port $7FFD)
;   Score timer at $B0B6 calls $F253 for bank 1 score updates
;
; ======================================================================

; ==========================================================================
; SOUND ENGINE ENTRY POINTS ($9C40/$F618)
; ==========================================================================
; Jump table at the start of the engine, called from main game code
; after bank-switching to bank 1.
;
SOUND_ENGINE_START:
	jp 0f628h		;9c40  ; -> Song initializer (below at $9C50)
	jp 0f6dbh		;9c43  ; -> Main tick handler ($9D03)
	jp 0f621h		;9c46  ; -> Stop all sound ($9C49)
; --- Stop all sound ---
	xor a			;9c49  ; A = 0
	ld (0fb29h),a		;9c4a  ; Clear "engine active" flag
	jp 0f750h		;9c4d  ; -> Silence AY chip ($9D78)
; ==========================================================================
; SONG INITIALIZER ($9C50/$F628)
; ==========================================================================
; Loads a song and initializes all 3 channels. A = song number on entry.
; Each song has 3 channel pointers (6 bytes) in the song table at $FB2A.
; Channel state structures are at IX+$F677 (A), +$F698 (B), +$F6B9 (C),
; each 33 ($21) bytes apart.
;
	xor a			;9c50
	ld (0fb29h),a		;9c51  ; Clear engine active flag
	ld c,a			;9c54  ; C = song number
	add a,a			;9c55  ; A = song * 2
	add a,c			;9c56  ; A = song * 3
	add a,a			;9c57  ; A = song * 6 (6 bytes per song entry)
	ld c,a			;9c58  ; C = offset into song table
	ld b,000h		;9c59
	ld hl,0fb2ah		;9c5b  ; HL = song pointer table base
	add hl,bc			;9c5e  ; HL = this song's 3 channel pointers
	ld ix,0f677h		;9c5f  ; IX = channel A state structure
	ld c,021h		;9c63  ; C = $21 (33 bytes per channel struct)
	xor a			;9c65
	ld (0f952h),a		;9c66  ; Clear global tempo counter
	ld a,003h		;9c69  ; 3 channels to initialize
; --- Per-channel initialization loop ---
SOUND_INIT_LOOP:
	ld e,(hl)			;9c6b  ; Read channel pattern pointer (low)
	inc hl			;9c6c
	ld d,(hl)			;9c6d  ; Read channel pattern pointer (high)
	inc hl			;9c6e
	push hl			;9c6f  ; Save song table position
	ld (ix+010h),001h		;9c70  ; Set note duration counter = 1
	ld (ix+000h),b		;9c74  ; Clear channel flags (B=0)
	ld (ix+01dh),b		;9c77  ; Clear vibrato state
	ld (ix+003h),e		;9c7a  ; Store pattern base pointer (low)
	ld (ix+004h),d		;9c7d  ; Store pattern base pointer (high)
	ex de,hl			;9c80  ; HL = pattern base
	ld e,(hl)			;9c81  ; Read first 16-bit value from pattern
	inc hl			;9c82  ;   (initial sequence pointer)
	ld d,(hl)			;9c83
	ld (ix+005h),002h		;9c84  ; Set pattern offset = 2 (skip header)
	ld (ix+006h),b		;9c88  ; Clear pattern offset high byte
	pop hl			;9c8b  ; Restore song table position
	ld (ix+001h),e		;9c8c  ; Store sequence pointer (low)
	ld (ix+002h),d		;9c8f  ; Store sequence pointer (high)
	add ix,bc		;9c92  ; IX += 33 (advance to next channel)
	dec a			;9c94  ; Decrement channel counter
	jr nz,SOUND_INIT_LOOP		;9c95  ; Loop for all 3 channels
	inc a			;9c97  ; A = 1
	ld (0f6dah),a		;9c98  ; Set tick divider = 1 (play immediately)
	ld (0fb29h),a		;9c9b  ; Set engine active flag = 1
	ret			;9c9e
; --- Work RAM / scratch area ($9C9F-$9D00) ---
; Used as temporary storage by the sound engine at runtime.
; Mostly zeroed; non-zero bytes are initial values for counters.
;
	nop			;9c9f
	nop			;9ca0
	nop			;9ca1
	nop			;9ca2
	nop			;9ca3
	nop			;9ca4
	nop			;9ca5
	nop			;9ca6
	nop			;9ca7
	nop			;9ca8
	nop			;9ca9
	nop			;9caa
	nop			;9cab
	nop			;9cac
	nop			;9cad
	nop			;9cae
	nop			;9caf
	nop			;9cb0
	nop			;9cb1
	nop			;9cb2
	nop			;9cb3
	nop			;9cb4
	nop			;9cb5
	nop			;9cb6
	nop			;9cb7
	nop			;9cb8
	nop			;9cb9
	nop			;9cba
	nop			;9cbb
	nop			;9cbc
	nop			;9cbd
	nop			;9cbe
	add hl,bc			;9cbf  ; $09 - initial counter value
	nop			;9cc0
	nop			;9cc1
	nop			;9cc2
	nop			;9cc3
	nop			;9cc4
	nop			;9cc5
	nop			;9cc6
	nop			;9cc7
	nop			;9cc8
	nop			;9cc9
	nop			;9cca
	nop			;9ccb
	nop			;9ccc
	nop			;9ccd
	nop			;9cce
	nop			;9ccf
	nop			;9cd0
	nop			;9cd1
	nop			;9cd2
	nop			;9cd3
	nop			;9cd4
	nop			;9cd5
	nop			;9cd6
	nop			;9cd7
	nop			;9cd8
	nop			;9cd9
	nop			;9cda
	nop			;9cdb
	nop			;9cdc
	nop			;9cdd
	nop			;9cde
	nop			;9cdf
	ld (de),a			;9ce0
	nop			;9ce1
	nop			;9ce2
	nop			;9ce3
	nop			;9ce4
	nop			;9ce5
	nop			;9ce6
	nop			;9ce7
	nop			;9ce8
	nop			;9ce9
	nop			;9cea
	nop			;9ceb
	nop			;9cec
	nop			;9ced
	nop			;9cee
	nop			;9cef
	nop			;9cf0
	nop			;9cf1
	nop			;9cf2
	nop			;9cf3
	nop			;9cf4
	nop			;9cf5
	nop			;9cf6
	nop			;9cf7
	nop			;9cf8
	nop			;9cf9
	nop			;9cfa
	nop			;9cfb
	nop			;9cfc
	nop			;9cfd
	nop			;9cfe
	nop			;9cff
	nop			;9d00
	inc h			;9d01  ; $24 - work RAM value
	nop			;9d02
; ==========================================================================
; MAIN TICK HANDLER ($9D03/$F6DB)
; ==========================================================================
; Called once per interrupt frame. Processes all 3 sound channels:
; 1. If tick divider expires, advance pattern position for each channel
; 2. Calculate current frequency/volume for each channel
; 3. Write all 14 AY registers via output ports
;
	ld a,(0fb29h)		;9d03  ; Check engine active flag
	and a			;9d06
	ret z			;9d07  ; Not active -> return immediately
	ld a,000h		;9d08  ; Clear noise channel flag
	ld (0f72eh),a		;9d0a  ; Store at noise register shadow
	ld hl,0f6dah		;9d0d  ; Point to tick divider
	dec (hl)			;9d10  ; Decrement tick counter
	jr nz,l9d2eh		;9d11  ; Not zero -> skip pattern advance
; --- Tick divider expired: advance patterns for all 3 channels ---
	ld b,(hl)			;9d13  ; B = 0 (divider just hit zero)
	ld ix,0f677h		;9d14  ; IX = channel A state
	call 0f850h		;9d18  ; Advance channel A pattern ($9DB0)
	ld ix,0f698h		;9d1b  ; IX = channel B state
	call 0f850h		;9d1f  ; Advance channel B pattern
	ld ix,0f6b9h		;9d22  ; IX = channel C state
	call 0f850h		;9d26  ; Advance channel C pattern
	ld hl,0f6dah		;9d29  ; Point to tick divider
	ld (hl),001h		;9d2c  ; Reset divider to 1
; --- Calculate output values for all 3 channels ---
l9d2eh:
	ld ix,0f677h		;9d2e  ; IX = channel A state
	call 0f906h		;9d32  ; Calculate A frequency + volume ($9F2E)
	ld (0fa28h),hl		;9d35  ; Store channel A tone period (regs 0-1)
	ld (0fa30h),a		;9d38  ; Store channel A volume (reg 8)
	ld ix,0f698h		;9d3b  ; IX = channel B state
	call 0f906h		;9d3f  ; Calculate B frequency + volume
	ld (0fa2ah),hl		;9d42  ; Store channel B tone period (regs 2-3)
	ld (0fa31h),a		;9d45  ; Store channel B volume (reg 9)
	ld ix,0f6b9h		;9d48  ; IX = channel C state
	call 0f906h		;9d4c  ; Calculate C frequency + volume
	ld (0fa2ch),hl		;9d4f  ; Store channel C tone period (regs 4-5)
	ld (0fa32h),a		;9d52  ; Store channel C volume (reg 10)
; --- Write all AY registers from shadow buffer ---
	ld a,000h		;9d55  ; Noise period = 0
	ld (0fa2eh),a		;9d57  ; Store noise period (reg 6)
	ld hl,0fa35h		;9d5a  ; HL = end of 14-byte AY shadow buffer
	ld a,00dh		;9d5d  ; Start at register 13 (envelope shape)
	ld c,0fdh		;9d5f  ; C = $FD (AY port low byte)
	ld b,0ffh		;9d61  ; B = $FF -> port $FFFD (register select)
	out (c),a		;9d63  ; Select AY register A
	ld b,0bfh		;9d65  ; B = $BF -> port $BFFD (data write)
	outd		;9d67  ; Write (HL) to port, dec HL, dec B
	dec a			;9d69  ; Next register (13->12->...->0)
	jp p,0f739h		;9d6a  ; Loop while A >= 0 (runtime $F739)
	ret			;9d6d
; --- AY single register write: D=register, E=value ---
	ld bc,0fffdh		;9d6e  ; BC = $FFFD (register select port)
	out (c),d		;9d71  ; Select register D
	ld b,0bfh		;9d73  ; BC = $BFFD (data write port)
	out (c),e		;9d75  ; Write value E
	ret			;9d77
; ==========================================================================
; SILENCE AY CHIP ($9D78/$F750)
; ==========================================================================
; Zeroes all 14 AY registers then sets register 7 (mixer) to $3F
; (all channels tone+noise disabled). Called on stop/init.
;
	ld c,0fdh		;9d78  ; C = $FD (AY port low byte)
	ld de,00d00h		;9d7a  ; D=13 (start register), E=0 (value)
	sub a			;9d7d  ; A = 0
	ld b,0ffh		;9d7e  ; B = $FF -> port $FFFD
	out (c),d		;9d80  ; Select register D
	ld b,0bfh		;9d82  ; B = $BF -> port $BFFD
	out (c),a		;9d84  ; Write 0 to register
	dec d			;9d86  ; Next register (13->12->...->0)
	jp p,0f756h		;9d87  ; Loop while D >= 0 (runtime $F756)
; --- Set mixer register 7 = $3F (all off) ---
	ld de,0073fh		;9d8a  ; D=7 (mixer reg), E=$3F (all disabled)
	ld b,0ffh		;9d8d  ; Port $FFFD
	out (c),d		;9d8f  ; Select register 7
	ld b,0bfh		;9d91  ; Port $BFFD
	out (c),e		;9d93  ; Write $3F (all off)
	ret			;9d95
; --- Waveform/envelope shape lookup table ($9D96) ---
; 18-byte table used for envelope shape parameters.
;
	call 0b9b5h		;9d96  ; data: $CD,$B5,$B9
	cp (hl)			;9d99  ; data: $BE
	ld a,h			;9d9a  ; data: $7C
	xor e			;9d9b  ; data: $AB
	and (hl)			;9d9c  ; data: $A6
	inc de			;9d9d  ; data: $13
	sub l			;9d9e  ; data: $95
	adc a,l			;9d9f  ; data: $8D
	ld d,d			;9da0  ; data: $52
	inc a			;9da1  ; data: $3C
	ld h,h			;9da2  ; data: $64
	cp d			;9da3  ; data: $BA
	inc b			;9da4  ; data: $04
	pop bc			;9da5  ; data: $C1
	add a,0cbh		;9da6  ; data: $C6,$CB
; --- Emergency stop: deactivate engine, silence chip ---
	xor a			;9da8
	ld (0fb29h),a		;9da9  ; Clear engine active flag
	pop hl			;9dac  ; Discard return address
	jp 0f750h		;9dad  ; Jump to silence AY chip
; ==========================================================================
; CHANNEL PATTERN ADVANCE ($9DB0/$F850)
; ==========================================================================
; Reads the next 16-bit pattern pointer from the current channel's
; pattern list. If pointer is 0000, loops back to the start of the
; pattern (offset 0 in the list, reading the first entry again).
; IX = channel state structure.
;
	ld c,(ix+005h)		;9db0  ; BC = current pattern list offset
	ld b,(ix+006h)		;9db3
	ld l,(ix+003h)		;9db6  ; HL = pattern list base pointer
	ld h,(ix+004h)		;9db9
	add hl,bc			;9dbc  ; HL = current position in pattern list
	inc bc			;9dbd  ; Advance offset by 2 (16-bit entry)
	inc bc			;9dbe
	ld a,(hl)			;9dbf  ; Read pattern pointer (low)
	inc hl			;9dc0
	ld d,(hl)			;9dc1  ; Read pattern pointer (high)
	ld e,a			;9dc2  ; DE = pattern pointer
	or d			;9dc3  ; Is it $0000 (end of list)?
	jr nz,l9dd2h		;9dc4  ; No -> use this pattern
; --- End of pattern list: loop back to first entry ---
	ld l,(ix+003h)		;9dc6  ; HL = pattern list base
	ld h,(ix+004h)		;9dc9
	ld bc,00002h		;9dcc  ; Reset offset to 2 (skip header)
	ld e,(hl)			;9dcf  ; Read first pattern pointer
	inc hl			;9dd0
	ld d,(hl)			;9dd1
l9dd2h:
	ld (ix+005h),c		;9dd2  ; Store updated offset
	ld (ix+006h),b		;9dd5
	ld b,000h		;9dd8  ; B = 0
	jp 0f862h		;9dda  ; -> Continue to command dispatch
; --- Mixer commands: enable/disable tone and noise per channel ---
; These manipulate the AY mixer register (reg 7) shadow at $FA0D.
; Channel's bit mask is stored in IX+$20.
;
; Enable tone for this channel:
	ld a,(ix+020h)		;9ddd  ; Channel bit mask
	ld c,a			;9de0  ; Save mask
	and 007h		;9de1  ; Isolate tone enable bits (channels A/B/C)
	ld hl,0fa0dh		;9de3  ; HL = mixer register shadow
	xor (hl)			;9de6  ; Toggle bits
	and c			;9de7  ; Mask to this channel only
	xor (hl)			;9de8  ; Apply change
	ld (hl),a			;9de9  ; Store updated mixer value
	ld a,001h		;9dea
	ld (ix+01eh),a		;9dec  ; Set channel active flag
	jp 0f862h		;9def  ; -> Continue dispatch
; Enable noise for this channel:
	ld a,(ix+020h)		;9df2  ; Channel bit mask
	ld c,a			;9df5
	and 038h		;9df6  ; Isolate noise enable bits
	ld hl,0fa0dh		;9df8  ; Mixer shadow
	xor (hl)			;9dfb
	and c			;9dfc
	xor (hl)			;9dfd
	ld (hl),a			;9dfe  ; Store updated mixer
	xor a			;9dff
	ld (ix+01eh),a		;9e00  ; Clear channel active flag
	jp 0f862h		;9e03  ; -> Continue dispatch
; Disable this channel (clear both tone+noise bits):
	ld hl,0fa0dh		;9e06  ; Mixer shadow
	ld a,(ix+020h)		;9e09  ; Channel mask
	cpl			;9e0c  ; Invert mask
	and (hl)			;9e0d  ; Clear this channel's bits
	ld (hl),a			;9e0e  ; Store updated mixer
	ld a,001h		;9e0f
	ld (ix+01eh),a		;9e11  ; Set channel active
	jr SOUND_AY_DISPATCH		;9e14  ; -> Continue
; --- Set portamento/slide parameters ---
	ld a,(de)			;9e16  ; Read portamento target
	inc de			;9e17
	ld (ix+007h),b		;9e18  ; Clear slide accumulator (low)
	ld (ix+008h),b		;9e1b  ; Clear slide accumulator (high)
	ld (ix+00dh),a		;9e1e  ; Store slide target
	set 2,(ix+000h)		;9e21  ; Set "portamento active" flag
	ld a,(de)			;9e25  ; Read slide speed
	ld (ix+00eh),a		;9e26  ; Store slide speed
	inc de			;9e29
	jr SOUND_AY_DISPATCH		;9e2a  ; -> Continue
; --- Set global tempo ---
	ld a,(de)			;9e2c  ; Read tempo value
	inc de			;9e2d
	ld (0f952h),a		;9e2e  ; Store global tempo
	jr SOUND_AY_DISPATCH		;9e31  ; -> Continue
; --- Set vibrato parameters ---
	ld a,(de)			;9e33  ; Read vibrato depth
	ld (ix+01bh),a		;9e34  ; Store vibrato depth
	inc de			;9e37
	ld a,(de)			;9e38  ; Read vibrato speed
	ld (ix+01ah),a		;9e39  ; Store vibrato speed
	inc de			;9e3c
	ld (ix+01ch),a		;9e3d  ; Init vibrato counter = speed
	jr SOUND_AY_DISPATCH		;9e40  ; -> Continue
; --- Enable auto-envelope (volume slide up) ---
	set 7,(ix+000h)		;9e42  ; Set "envelope up" flag
	set 3,(ix+000h)		;9e46  ; Set "envelope active" flag
	jr SOUND_AY_DISPATCH		;9e4a  ; -> Continue
; --- Set vibrato mode: off / up / down ---
	ld (ix+01dh),b		;9e4c  ; Vibrato off (mode 0)
	jr SOUND_AY_DISPATCH		;9e4f
	ld (ix+01dh),040h		;9e51  ; Vibrato up (mode $40)
	jr SOUND_AY_DISPATCH		;9e55
	ld (ix+01dh),0c0h		;9e57  ; Vibrato down (mode $C0)
	jr SOUND_AY_DISPATCH		;9e5b
; --- Misc channel flags ---
	set 1,(ix+000h)		;9e5d  ; Set "sustain" flag
	jr SOUND_AY_DISPATCH		;9e61
	ld (ix+013h),b		;9e63  ; Clear frequency offset
	res 5,(ix+000h)		;9e66  ; Clear "arpeggio" flag
	jr SOUND_NOTE_CALC		;9e6a  ; -> Calculate note
	set 4,(ix+000h)		;9e6c  ; Set "new note" flag
	jr SOUND_AY_DISPATCH		;9e70
	set 0,(ix+01fh)		;9e72  ; Set "one-shot" flag
	jr SOUND_AY_DISPATCH		;9e76
; ==========================================================================
; COMMAND DISPATCHER ($9E78/$F862)
; ==========================================================================
; Main bytecode interpreter for pattern data. Decrements note duration;
; when it expires, reads the next byte from the pattern stream (DE).
; If byte < $80: it's a note/volume value.
; If byte >= $80: it's a command (handled by jump table at $F8B6).
;
	dec (ix+010h)		;9e78  ; Decrement note duration counter
	jr nz,SOUND_ENVELOPE		;9e7b  ; Not expired -> process envelope
; --- Duration expired: read next command/note ---
	ld (ix+000h),b		;9e7d  ; Clear all channel flags
	res 0,(ix+01fh)		;9e80  ; Clear one-shot flag
	ld e,(ix+001h)		;9e84  ; DE = current sequence pointer
	ld d,(ix+002h)		;9e87
SOUND_AY_DISPATCH:
	ld a,(de)			;9e8a  ; Read next byte from pattern
	inc de			;9e8b  ; Advance pointer
	and a			;9e8c  ; Check sign bit
	jp m,0f8b6h		;9e8d  ; Bit 7 set -> command byte ($9EDE)
; --- It's a note: set volume ---
	ld (ix+012h),a		;9e90  ; Store volume/note value
	bit 0,(ix+01eh)		;9e93  ; Is this the "priority" channel?
	jr z,SOUND_AY_WRITE		;9e97  ; No -> skip global store
	ld (0f6e1h),a		;9e99  ; Store as global volume reference
SOUND_AY_WRITE:
	bit 4,(ix+000h)		;9e9c  ; "new note" flag set?
	jr nz,SOUND_NOTE_CALC		;9ea0  ; Yes -> skip arpeggio setup
; --- Initialize arpeggio/sweep parameters ---
	ld a,(ix+019h)		;9ea2  ; Load arpeggio base
	ld (ix+013h),a		;9ea5  ; Set frequency offset
	set 5,(ix+000h)		;9ea8  ; Set "arpeggio active" flag
	set 6,(ix+000h)		;9eac  ; Set "sweep direction" flag
	res 4,(ix+000h)		;9eb0  ; Clear "new note" flag
	ld a,(ix+014h)		;9eb4  ; Load sweep speed
	ld (ix+016h),a		;9eb7  ; Init sweep counter
	ld a,(ix+017h)		;9eba  ; Load sweep length
	ld (ix+018h),a		;9ebd  ; Init sweep length counter
SOUND_NOTE_CALC:
	ld a,(ix+011h)		;9ec0  ; Load note duration value
	ld (ix+010h),a		;9ec3  ; Reset duration counter
	ld (ix+002h),d		;9ec6  ; Save updated sequence pointer (high)
	ld (ix+001h),e		;9ec9  ; Save updated sequence pointer (low)
	ret			;9ecc
; --- Envelope processing (note still sustaining) ---
SOUND_ENVELOPE:
	ld a,(ix+000h)		;9ecd  ; Load channel flags
	bit 3,a		;9ed0  ; Envelope active?
	ret z			;9ed2  ; No -> nothing to do
	rla			;9ed3  ; Bit 7 -> carry (envelope direction)
	jr nc,SOUND_VOLUME_SET		;9ed4  ; Carry clear -> volume down
	inc (ix+012h)		;9ed6  ; Volume up (fade in)
	ret			;9ed9
SOUND_VOLUME_SET:
	dec (ix+012h)		;9eda  ; Volume down (fade out)
	ret			;9edd
; ==========================================================================
; COMMAND BYTE HANDLER ($9EDE/$F8B6)
; ==========================================================================
; Dispatches command bytes (>= $80) from the pattern stream.
; Byte ranges determine the command type:
;   $80-$B7: Duration/note command
;   $B8-$D7: Noise period set
;   $D8-$E7: Tone/arpeggio parameters
;   $E8-$F7: Mixer control
;   $F8-$FF: Waveform/instrument select
;
	cp 0b8h		;9ede  ; < $B8?
	jr c,SOUND_DURATION		;9ee0  ; Yes -> duration command ($80-$B7)
	add a,020h		;9ee2  ; Shift range: $B8->$D8, $D8->$F8
	jr c,SOUND_NOISE_SET		;9ee4  ; Was $E0-$FF -> noise set
	add a,010h		;9ee6  ; Shift again
	jr c,SOUND_TONE_SET		;9ee8  ; Was $D0-$DF -> tone/arpeggio
	add a,010h		;9eea  ; Shift again
	jr nc,SOUND_MIXER_SET		;9eec  ; Was $C0-$CF -> mixer control
; --- Waveform/instrument select ($F8-$FF) ---
	ld c,a			;9eee  ; C = adjusted byte
	ld hl,0fadeh		;9eef  ; HL = waveform table base
	add hl,bc			;9ef2  ; Index into table
	ld c,(hl)			;9ef3  ; Read offset to waveform data
	add hl,bc			;9ef4  ; HL = waveform data pointer
	ld (ix+00bh),l		;9ef5  ; Store current waveform pos (low)
	ld (ix+009h),l		;9ef8  ; Store waveform start pos (low)
	ld (ix+00ch),h		;9efb  ; Store current waveform pos (high)
	ld (ix+00ah),h		;9efe  ; Store waveform start pos (high)
	jr SOUND_AY_DISPATCH		;9f01  ; -> Continue reading pattern
; --- Mixer control: set mixer register bits ---
SOUND_MIXER_SET:
	add a,009h		;9f03  ; Adjust to mixer value
	ld (0f705h),a		;9f05  ; Store mixer shadow
	jr SOUND_AY_DISPATCH		;9f08  ; -> Continue
; --- Set noise period ---
SOUND_NOISE_SET:
	inc a			;9f0a  ; Adjust noise value
	ld (ix+011h),a		;9f0b  ; Store as note duration (reused field)
	jp 0f862h		;9f0e  ; -> Command dispatch
; --- Set tone/arpeggio parameters (reads 3 more bytes) ---
SOUND_TONE_SET:
	ld (ix+019h),a		;9f11  ; Store arpeggio base note
	ld a,(de)			;9f14  ; Read sweep speed
	inc de			;9f15
	ld (ix+014h),a		;9f16  ; Store sweep speed
	ld a,(de)			;9f19  ; Read sweep target
	inc de			;9f1a
	ld (ix+015h),a		;9f1b  ; Store sweep target
	ld a,(de)			;9f1e  ; Read sweep length
	inc de			;9f1f
	ld (ix+017h),a		;9f20  ; Store sweep length
	jp 0f862h		;9f23  ; -> Command dispatch
; --- Duration command: look up duration in table, dispatch ---
SOUND_DURATION:
	ld hl,0f6eeh		;9f26  ; Duration lookup table base
	ld c,a			;9f29  ; C = duration index
	add hl,bc			;9f2a  ; Index into table
	ld c,(hl)			;9f2b  ; Read offset
	add hl,bc			;9f2c  ; HL = handler address
	jp (hl)			;9f2d  ; Jump to duration handler
; ==========================================================================
; FREQUENCY CALCULATION ($9F2E/$F906)
; ==========================================================================
; Calculates the current AY tone period for a channel, applying
; arpeggio, sweep, vibrato, and portamento effects.
; Returns: HL = 12-bit tone period, A = volume.
;
	ld c,(ix+000h)		;9f2e  ; C = channel flags
	bit 5,c		;9f31  ; Arpeggio active?
	jr z,SOUND_CHANNEL_ADV		;9f33  ; No -> skip arpeggio
; --- Arpeggio processing ---
	ld a,(ix+016h)		;9f35  ; Load sweep counter
	sub 010h		;9f38  ; Decrement by 16
	jr nc,SOUND_PATTERN		;9f3a  ; Still positive -> store and continue
	bit 6,c		;9f3c  ; Sweep direction flag
	jr z,SOUND_REST		;9f3e  ; Down -> handle rest
; --- Sweep up: add to frequency offset ---
	add a,(ix+013h)		;9f40  ; Add frequency offset
	jr nc,SOUND_LOOP_CHECK		;9f43  ; No overflow -> continue
	sbc a,a			;9f45  ; Overflow -> clamp to $FF
SOUND_LOOP_CHECK:
	add a,010h		;9f46  ; Re-add the 16 base
	ld (ix+013h),a		;9f48  ; Store updated frequency offset
	ld a,(ix+018h)		;9f4b  ; Load sweep length counter
	sub 010h		;9f4e  ; Decrement
	jr nc,SOUND_NEXT_NOTE		;9f50  ; Still positive -> continue
; --- Sweep cycle complete: reload and reverse ---
	res 6,c		;9f52  ; Clear direction (switch to down)
	ld a,(ix+015h)		;9f54  ; Reload sweep target
	ld (ix+016h),a		;9f57  ; Reset sweep counter
	jr SOUND_CHANNEL_ADV		;9f5a  ; -> Continue
SOUND_NEXT_NOTE:
	ld (ix+018h),a		;9f5c  ; Store decremented length
	jr SOUND_CHANNEL_ADV		;9f5f
SOUND_PATTERN:
	ld (ix+016h),a		;9f61  ; Store decremented counter
	jr SOUND_CHANNEL_ADV		;9f64
; --- Sweep down: subtract from frequency offset ---
SOUND_REST:
	cpl			;9f66  ; Invert A (negative counter)
	sub 00fh		;9f67  ; Adjust
	add a,(ix+013h)		;9f69  ; Subtract from frequency offset
	jr c,SOUND_LOOP_END		;9f6c  ; No underflow -> ok
	sub a			;9f6e  ; Underflow -> clamp to 0
SOUND_LOOP_END:
	ld (ix+013h),a		;9f6f  ; Store updated offset
	dec (ix+018h)		;9f72  ; Decrement sweep length
	jr nz,SOUND_CHANNEL_ADV		;9f75  ; Not zero -> continue
	res 5,c		;9f77  ; Zero -> disable arpeggio
; --- Look up note frequency from waveform + note tables ---
SOUND_CHANNEL_ADV:
	ld a,000h		;9f79  ; A = 0 (self-modified: base transpose)
	add a,(ix+012h)		;9f7b  ; Add current volume/note
	ld b,a			;9f7e  ; B = combined note index
	ld l,(ix+00bh)		;9f7f  ; HL = current waveform position
	ld h,(ix+00ch)		;9f82
	ld a,(hl)			;9f85  ; Read waveform value
	cp 087h		;9f86  ; End of waveform? ($87 = loop marker)
	jr c,SOUND_UPDATE		;9f88  ; No -> use this value
; --- Waveform loop: reset to start ---
	ld l,(ix+009h)		;9f8a  ; HL = waveform start position
	ld h,(ix+00ah)		;9f8d
	ld a,(hl)			;9f90  ; Read first waveform value
SOUND_UPDATE:
	inc hl			;9f91  ; Advance waveform position
	ld (ix+00bh),l		;9f92  ; Store updated position
	ld (ix+00ch),h		;9f95
; --- Look up 12-bit tone period from note table ---
	add a,b			;9f98  ; A = note + waveform offset
	ld hl,0fa36h		;9f99  ; Note period table base (runtime)
	ld d,000h		;9f9c
	add a,a			;9f9e  ; A * 2 (16-bit entries)
	ld e,a			;9f9f
	add hl,de			;9fa0  ; Index into note table
	ld e,(hl)			;9fa1  ; Read tone period (low)
	inc hl			;9fa2
	ld d,(hl)			;9fa3  ; Read tone period (high)
; --- Apply vibrato to tone period ---
	ld l,(ix+01dh)		;9fa4  ; L = vibrato mode (0/40/C0)
	bit 6,l		;9fa7  ; Vibrato enabled? (bit 6 of mode)
	jr z,SOUND_STOP_ALL		;9fa9  ; No -> skip vibrato
	ld h,a			;9fab  ; Save note index
	ld b,(ix+01ah)		;9fac  ; B = vibrato speed
	sla b		;9faf  ; B *= 2
; --- Vibrato direction processing ---
	bit 7,l		;9fb1  ; Vibrato down mode?
	ld a,(ix+01ch)		;9fb3  ; A = vibrato counter
	jr z,SOUND_TICK		;9fb6  ; Not down -> normal tick
	bit 0,c		;9fb8  ; Channel sustaining?
	jr nz,SOUND_SILENT		;9fba  ; Yes -> skip vibrato update
SOUND_TICK:
	bit 5,l		;9fbc  ; Vibrato phase (up or down half)?
	jr nz,SOUND_FRAME		;9fbe  ; In "up" phase
; --- Vibrato down phase ---
	sub (ix+01bh)		;9fc0  ; Subtract vibrato depth
	jr nc,SOUND_FRAME_END		;9fc3  ; Still positive -> store
	set 5,(ix+01dh)		;9fc5  ; Flip to up phase
	sub a			;9fc9  ; Clamp to 0
	jr SOUND_FRAME_END		;9fca
; --- Vibrato up phase ---
SOUND_FRAME:
	add a,(ix+01bh)		;9fcc  ; Add vibrato depth
	cp b			;9fcf  ; Exceeds max?
	jr c,SOUND_FRAME_END		;9fd0  ; No -> store
	res 5,(ix+01dh)		;9fd2  ; Flip to down phase
	ld a,b			;9fd6  ; Clamp to max
SOUND_FRAME_END:
	ld (ix+01ch),a		;9fd7  ; Store vibrato counter
; --- Apply vibrato offset to tone period ---
SOUND_SILENT:
	ex de,hl			;9fda  ; HL = tone period, DE preserved
	srl b		;9fdb  ; B = vibrato speed / 2
	sub b			;9fdd  ; A -= B (center the vibrato)
	ld e,a			;9fde  ; E = signed vibrato offset
	ld a,d			;9fdf  ; High byte
	ld d,000h		;9fe0
	jr nc,SOUND_CHECK_PLAY		;9fe2  ; Positive -> D stays 0
	dec d			;9fe4  ; Negative -> D = $FF (sign extend)
SOUND_CHECK_PLAY:
	add a,0a0h		;9fe5  ; Shift range for multiplication
	jr c,SOUND_STOP		;9fe7  ; Overflow -> skip multiply
; --- Multiply vibrato offset by tone period ---
SOUND_IS_PLAYING:
	sla e		;9fe9  ; Shift DE left (multiply by 2)
	rl d		;9feb
	add a,018h		;9fed  ; Count bits
	jr nc,SOUND_IS_PLAYING		;9fef  ; Loop until done
SOUND_STOP:
	add hl,de			;9ff1  ; Apply vibrato offset to period
	ex de,hl			;9ff2  ; DE = final tone period
; --- Store channel flags and handle portamento ---
SOUND_STOP_ALL:
	ld a,c			;9ff3  ; Get channel flags
	xor 001h		;9ff4  ; Toggle bit 0 (sustain)
	ld (ix+000h),a		;9ff6  ; Store updated flags
	bit 2,c		;9ff9  ; Portamento active?
	jr z,SOUND_AY_DONE		;9ffb  ; No -> skip portamento
; --- Apply portamento (pitch slide) ---
	ld b,(ix+00eh)		;9ffd  ; B = slide speed counter
	djnz SOUND_AY_LOOP		;a000  ; Not expired -> just decrement
	ld c,(ix+00dh)		;a002  ; C = slide target/step
	bit 7,c		;a005  ; Slide direction (up or down)?
	jr z,SOUND_AY_REG_W		;a007  ; Positive -> slide up
	dec b			;a009  ; Negative -> B = $FF (sign extend)
SOUND_AY_REG_W:
	ld l,(ix+007h)		;a00a  ; HL = slide accumulator
	ld h,(ix+008h)		;a00d
	add hl,bc			;a010  ; Add slide step
	ld (ix+007h),l		;a011  ; Store updated accumulator
	ld (ix+008h),h		;a014
	add hl,de			;a017  ; Apply to tone period
	ex de,hl			;a018  ; DE = final period with portamento
	jr SOUND_AY_DONE		;a019
SOUND_AY_LOOP:
	ld (ix+00eh),b		;a01b  ; Store decremented speed counter
; --- Build mixer register value for this channel ---
SOUND_AY_DONE:
	bit 0,(ix+01fh)		;a01e  ; One-shot flag?
	jr z,SOUND_DATA_PTR		;a022  ; No -> normal mixer
; --- One-shot: force noise off ---
	res 0,(ix+01fh)		;a024  ; Clear one-shot flag
	ld a,000h		;a028  ; Zero noise
	ld (0f72eh),a		;a02a  ; Clear noise register shadow
	ld a,007h		;a02d  ; Mixer value: all off except...
	jr SOUND_TABLE_BASE		;a02f  ; -> Apply to mixer
SOUND_DATA_PTR:
	cpl			;a031  ; Invert flags
	and 003h		;a032  ; Isolate channel number bits
	ld a,038h		;a034  ; Default: noise channels off
	jr nz,SOUND_TABLE_BASE		;a036  ; Not channel 0 -> use default
	ld a,(0f6e1h)		;a038  ; Channel 0: read global volume ref
	xor 008h		;a03b  ; Toggle noise bit
	ld (0f72eh),a		;a03d  ; Store noise shadow
	ld a,007h		;a040  ; Mixer base = 7
SOUND_TABLE_BASE:
	ld hl,0fa2fh		;a042  ; HL = mixer register shadow (reg 7)
	xor (hl)			;a045  ; XOR with current value
	and (ix+020h)		;a046  ; Mask to this channel's bits
	xor (hl)			;a049  ; Apply masked change
	ld (hl),a			;a04a  ; Store updated mixer
; --- Return: DE = tone period, A = volume ---
	ex de,hl			;a04b  ; HL = tone period
	ld a,(ix+013h)		;a04c  ; A = frequency offset (used as volume)
	ret			;a04f
; ==========================================================================
; WAVEFORM DATA TABLE ($A050/$FA28)
; ==========================================================================
; Waveform shape definitions used by the instrument system.
; Each waveform is a sequence of bytes (volume envelope steps)
; terminated by $87 (loop marker). Values < $87 are volume levels
; added to the note's base volume during playback.
;
	nop			;a050  ; Waveform 0: flat silence
	nop			;a051
	nop			;a052
	nop			;a053
	nop			;a054
	nop			;a055
	nop			;a056
	ccf			;a057  ; $3F
	rrca			;a058
	rrca			;a059
	rrca			;a05a
	nop			;a05b
	nop			;a05c
	nop			;a05d
	ret m			;a05e
	ld c,010h		;a05f
	ld c,060h		;a061
	dec c			;a063
	add a,b			;a064
	inc c			;a065
	ret c			;a066
	dec bc			;a067
	jr z,MUSIC_PLAY		;a068
	adc a,b			;a06a
	ld a,(bc)			;a06b
	ret p			;a06c
	add hl,bc			;a06d
	ld h,b			;a06e
	add hl,bc			;a06f
	ret po			;a070
	ex af,af'			;a071
	ld e,b			;a072
	ex af,af'			;a073
	ret po			;a074
; ==========================================================================
; NOTE PERIOD TABLE (16-bit, $A075/$FA4D)
; ==========================================================================
; 12-bit AY tone period values for each semitone. Lower values = higher
; pitch. Table spans ~6 octaves. Each entry is 2 bytes (little-endian).
; Index 0 = lowest note, higher indices = higher notes.
;
MUSIC_PLAY:
	rlca			;a075  ; data (note period table continues)
	ld a,h			;a076
	rlca			;a077
	ex af,af'			;a078
	rlca			;a079
	or b			;a07a
	ld b,040h		;a07b
	ld b,0ech		;a07d
	dec b			;a07f
	sub h			;a080
	dec b			;a081
	ld b,h			;a082
	dec b			;a083
	ret m			;a084
	inc b			;a085
	or b			;a086
	inc b			;a087
	ld (hl),b			;a088
	inc b			;a089
	inc l			;a08a
	inc b			;a08b
	ret p			;a08c
	inc bc			;a08d
	cp (hl)			;a08e
	inc bc			;a08f
	add a,h			;a090
	inc bc			;a091
	ld e,b			;a092
	inc bc			;a093
	jr nz,$+5		;a094
	or 002h		;a096
	jp z,MUSIC_MAIN		;a098
	ld (bc),a			;a09b
	ld a,h			;a09c
	ld (bc),a			;a09d
	ld e,b			;a09e
	ld (bc),a			;a09f
	jr c,MUSIC_HANDLER		;a0a0
	ld d,002h		;a0a2
MUSIC_HANDLER:
	ret m			;a0a4
	ld bc,001dfh		;a0a5
	jp nz,0ac01h		;a0a8
	ld bc,00190h		;a0ab
	ld a,e			;a0ae
	ld bc,00165h		;a0af
	ld d,c			;a0b2
	ld bc,0013eh		;a0b3
	inc l			;a0b6
	ld bc,0011ch		;a0b7
	dec bc			;a0ba
	ld bc,000fch		;a0bb
	rst 28h			;a0be
	nop			;a0bf
	pop hl			;a0c0
	nop			;a0c1
	sub 000h		;a0c2
	ret z			;a0c4
	nop			;a0c5
	cp l			;a0c6
	nop			;a0c7
	or d			;a0c8
	nop			;a0c9
	xor b			;a0ca
	nop			;a0cb
	sbc a,a			;a0cc
	nop			;a0cd
	sub (hl)			;a0ce
	nop			;a0cf
	adc a,(hl)			;a0d0
	nop			;a0d1
	add a,l			;a0d2
	nop			;a0d3
	ld a,(hl)			;a0d4
	nop			;a0d5
	ld (hl),a			;a0d6
	nop			;a0d7
	ld (hl),b			;a0d8
	nop			;a0d9
	ld l,e			;a0da
	nop			;a0db
	ld h,h			;a0dc
	nop			;a0dd
	ld e,(hl)			;a0de
	nop			;a0df
	ld e,c			;a0e0
	nop			;a0e1
	ld d,h			;a0e2
	nop			;a0e3
	ld c,a			;a0e4
	nop			;a0e5
	ld c,e			;a0e6
	nop			;a0e7
	ld b,a			;a0e8
	nop			;a0e9
	ld b,d			;a0ea
	nop			;a0eb
	ccf			;a0ec
	nop			;a0ed
	dec sp			;a0ee
	nop			;a0ef
	jr c,MUSIC_NOTE_TBL		;a0f0
; --- Extended note period table (continued) ---
MUSIC_NOTE_TBL:
	dec (hl)			;a0f2
	nop			;a0f3
	ld (02f00h),a		;a0f4
	nop			;a0f7
	inc l			;a0f8
	nop			;a0f9
	ld hl,(02700h)		;a0fa
	nop			;a0fd
	dec h			;a0fe
	nop			;a0ff
	inc hl			;a100
	nop			;a101
	ld hl,01f00h		;a102
	nop			;a105
	dec b			;a106
	ld b,01ah		;a107
	ld l,042h		;a109
	nop			;a10b
	add a,a			;a10c
	inc c			;a10d
	jr MUSIC_DURATION_TBL		;a10e
	inc c			;a110
	inc c			;a111
	ex af,af'			;a112
	ex af,af'			;a113
	rlca			;a114
	inc de			;a115
	rlca			;a116
	nop			;a117
	inc c			;a118
	nop			;a119
	nop			;a11a
	nop			;a11b
; ==========================================================================
; DURATION / TIMING TABLE ($A11C/$FAF4)
; ==========================================================================
; Lookup values for note duration commands. Indexed by the command
; byte ($80-$B7) to determine how many ticks a note should last.
;
MUSIC_DURATION_TBL:
	ex af,af'			;a11c  ; data: $08
	inc d			;a11d
	ex af,af'			;a11e
	rlca			;a11f
	rlca			;a120
	add a,a			;a121
	dec bc			;a122
	rla			;a123
	dec bc			;a124
	dec bc			;a125
	dec bc			;a126
	ld b,006h		;a127
	inc b			;a129
	djnz MUSIC_INIT		;a12a
	nop			;a12c
	inc c			;a12d
	nop			;a12e
	nop			;a12f
; --- Song initialization parameters ---
MUSIC_INIT:
	nop			;a130
	inc b			;a131
	djnz $+6		;a132
	ld b,006h		;a134
	add a,a			;a136
	ld b,012h		;a137
	ld b,006h		;a139
	ld b,004h		;a13b
	inc b			;a13d
	inc bc			;a13e
	rrca			;a13f
	inc bc			;a140
	nop			;a141
	inc c			;a142
	nop			;a143
	nop			;a144
	nop			;a145
	inc bc			;a146
	rrca			;a147
	inc bc			;a148
	inc b			;a149
	inc b			;a14a
	add a,a			;a14b
	nop			;a14c
	nop			;a14d
	nop			;a14e
; ==========================================================================
; MUSIC PATTERN DATA ($A14F/$FB27)
; ==========================================================================
; Song sequence data in the engine's bytecode format. Contains note
; sequences, channel assignments, instrument changes, and loop points
; for all in-game music tracks. The data is organized as:
;
;   - Song pointer table: 3 channel pointers per song (6 bytes each)
;   - Per-channel pattern lists: sequences of 16-bit pointers to patterns
;   - Patterns: streams of command bytes and note values
;
; Bytecode format:
;   $00-$7F: Note/volume values (higher = louder/higher note)
;   $80-$B7: Duration commands (set note length)
;   $B8-$DF: Noise/tone/mixer configuration
;   $E0-$F7: Arpeggio and sweep parameters
;   $F8-$FF: Waveform/instrument select
;   $FD xx:  Special commands (tempo, vibrato, etc.)
;
; Multiple songs stored sequentially, each with 3 channel streams
; (A, B, C) for the AY chip's 3 tone generators.
;
MUSIC_TICK_CHECK:
	inc c			;a14f
	add a,a			;a150
	nop			;a151
	jr nc,MUSIC_TICK_CHECK		;a152
	ld a,(hl)			;a154
	ei			;a155
	call p,073fbh		;a156
	rst 38h			;a159
	ld (hl),e			;a15a
	rst 38h			;a15b
	sbc a,e			;a15c
	call m,0fca5h		;a15d
	set 7,h		;a160
	and l			;a162
	call m,0fcd6h		;a163
	pop hl			;a166
	call m,0fcedh		;a167
	cp 0fch		;a16a
	defb 0edh;next byte illegal after ed		;a16c
	call m,0fd06h		;a16d
	defb 0edh;next byte illegal after ed		;a170
	call m,0fcfeh		;a171
	add hl,bc			;a174
	defb 0fdh,01ah,0fdh	;illegal sequence		;a175
	ld e,a			;a178
	defb 0fdh,05fh,0fdh	;illegal sequence		;a179
	halt			;a17c
	defb 0fdh,076h,0fdh	;illegal sequence		;a17d
	add a,a			;a180
	defb 0fdh,087h,0fdh	;illegal sequence		;a181
	sbc a,b			;a184
	defb 0fdh,098h,0fdh	;illegal sequence		;a185
	ld e,a			;a188
	defb 0fdh,05fh,0fdh	;illegal sequence		;a189
	halt			;a18c
	defb 0fdh,076h,0fdh	;illegal sequence		;a18d
	add a,a			;a190
	defb 0fdh,087h,0fdh	;illegal sequence		;a191
	sbc a,b			;a194
	defb 0fdh,098h,0fdh	;illegal sequence		;a195
	xor c			;a198
	defb 0fdh,0a9h,0fdh	;illegal sequence		;a199
	cp c			;a19c
	defb 0fdh,0b9h,0fdh	;illegal sequence		;a19d
	ex (sp),hl			;a1a0
	rst 38h			;a1a1
	ld (hl),a			;a1a2
	rst 38h			;a1a3
	nop			;a1a4
	nop			;a1a5
	inc d			;a1a6
	rst 38h			;a1a7
	inc d			;a1a8
	rst 38h			;a1a9
	inc d			;a1aa
	rst 38h			;a1ab
	inc d			;a1ac
	rst 38h			;a1ad
	inc d			;a1ae
	rst 38h			;a1af
	inc d			;a1b0
	rst 38h			;a1b1
	inc d			;a1b2
	rst 38h			;a1b3
	inc d			;a1b4
	rst 38h			;a1b5
	inc d			;a1b6
	rst 38h			;a1b7
	inc d			;a1b8
	rst 38h			;a1b9
	inc d			;a1ba
	rst 38h			;a1bb
	inc d			;a1bc
	rst 38h			;a1bd
	inc d			;a1be
	rst 38h			;a1bf
	inc d			;a1c0
	rst 38h			;a1c1
	inc d			;a1c2
	rst 38h			;a1c3
	inc d			;a1c4
	rst 38h			;a1c5
	inc d			;a1c6
	rst 38h			;a1c7
	inc d			;a1c8
	rst 38h			;a1c9
	inc d			;a1ca
	rst 38h			;a1cb
	inc d			;a1cc
	rst 38h			;a1cd
	ld c,a			;a1ce
	rst 38h			;a1cf
	ld c,a			;a1d0
	rst 38h			;a1d1
	ld c,a			;a1d2
	rst 38h			;a1d3
	ld c,a			;a1d4
	rst 38h			;a1d5
	ld c,a			;a1d6
	rst 38h			;a1d7
	ld c,a			;a1d8
	rst 38h			;a1d9
	ld c,a			;a1da
	rst 38h			;a1db
	ld c,a			;a1dc
	rst 38h			;a1dd
	ld c,a			;a1de
	rst 38h			;a1df
	ld c,a			;a1e0
	rst 38h			;a1e1
	ld c,a			;a1e2
	rst 38h			;a1e3
	ld c,a			;a1e4
	rst 38h			;a1e5
	inc d			;a1e6
	rst 38h			;a1e7
	inc d			;a1e8
	rst 38h			;a1e9
	inc d			;a1ea
	rst 38h			;a1eb
	inc d			;a1ec
	rst 38h			;a1ed
	inc d			;a1ee
	rst 38h			;a1ef
	inc d			;a1f0
	rst 38h			;a1f1
	inc d			;a1f2
	rst 38h			;a1f3
	inc d			;a1f4
	rst 38h			;a1f5
	inc d			;a1f6
	rst 38h			;a1f7
	inc d			;a1f8
	rst 38h			;a1f9
	ld c,a			;a1fa
	rst 38h			;a1fb
	ld c,a			;a1fc
	rst 38h			;a1fd
	ld c,a			;a1fe
	rst 38h			;a1ff
	ld c,a			;a200
	rst 38h			;a201
; --- Song 1: Main game music patterns ---
MUSIC_MAIN:
	ld c,a			;a202
	rst 38h			;a203
	ld c,a			;a204
	rst 38h			;a205
	ld c,a			;a206
	rst 38h			;a207
	ld c,a			;a208
	rst 38h			;a209
	inc d			;a20a
	rst 38h			;a20b
	inc d			;a20c
	rst 38h			;a20d
	inc d			;a20e
	rst 38h			;a20f
	inc d			;a210
	rst 38h			;a211
	inc d			;a212
	rst 38h			;a213
	inc d			;a214
	rst 38h			;a215
	inc d			;a216
	rst 38h			;a217
	inc d			;a218
	rst 38h			;a219
	nop			;a21a
	nop			;a21b
	ret z			;a21c
	defb 0fdh,0c8h,0fdh	;illegal sequence		;a21d
	ret z			;a220
	defb 0fdh,0c8h,0fdh	;illegal sequence		;a221
	ret z			;a224
	defb 0fdh,0c8h,0fdh	;illegal sequence		;a225
	ret z			;a228
	defb 0fdh,0c8h,0fdh	;illegal sequence		;a229
	ret z			;a22c
	defb 0fdh,0c8h,0fdh	;illegal sequence		;a22d
	ex de,hl			;a230
	defb 0fdh,0ebh,0fdh	;illegal sequence		;a231
	rlca			;a234
	cp 023h		;a235
	cp 03fh		;a237
	cp 05bh		;a239
	cp 0c8h		;a23b
	defb 0fdh,0c8h,0fdh	;illegal sequence		;a23d
	ex de,hl			;a240
	defb 0fdh,0ebh,0fdh	;illegal sequence		;a241
	rlca			;a244
	cp 023h		;a245
	cp 077h		;a247
	cp 097h		;a249
	cp 0b3h		;a24b
	cp 0b3h		;a24d
	cp 023h		;a24f
	cp 023h		;a251
	cp 03fh		;a253
	cp 03fh		;a255
	cp 05bh		;a257
	cp 05bh		;a259
; --- Channel A melody data ---
MUSIC_CH_A:
	cp 0b3h		;a25b
	cp 0cfh		;a25d
	cp 0b3h		;a25f
	cp 023h		;a261
	cp 0b3h		;a263
	cp 0cfh		;a265
	cp 077h		;a267
	cp 03fh		;a269
	cp 0ebh		;a26b
	cp 0c8h		;a26d
	defb 0fdh,0c8h,0fdh	;illegal sequence		;a26f
	ex de,hl			;a272
	defb 0fdh,0ebh,0fdh	;illegal sequence		;a273
	ccf			;a276
	cp 03fh		;a277
	cp 05bh		;a279
	cp 05bh		;a27b
	cp 0c8h		;a27d
	defb 0fdh,0c8h,0fdh	;illegal sequence		;a27f
	ex de,hl			;a282
	defb 0fdh,0ebh,0fdh	;illegal sequence		;a283
	ccf			;a286
	cp 03fh		;a287
	cp 05bh		;a289
	cp 05bh		;a28b
	cp 007h		;a28d
	cp 007h		;a28f
	cp 0ebh		;a291
	defb 0fdh,0ebh,0fdh	;illegal sequence		;a293
	add hl,bc			;a296
	rst 38h			;a297
	ret z			;a298
	defb 0fdh,0c8h,0fdh	;illegal sequence		;a299
; --- Channel B harmony/bass data ---
MUSIC_CH_B:
	ret z			;a29c
	defb 0fdh,0c8h,0fdh	;illegal sequence		;a29d
	ex de,hl			;a2a0
	defb 0fdh,0ebh,0fdh	;illegal sequence		;a2a1
	ex de,hl			;a2a4
	defb 0fdh,0ebh,0fdh	;illegal sequence		;a2a5
	ccf			;a2a8
	cp 03fh		;a2a9
	cp 03fh		;a2ab
	cp 03fh		;a2ad
	cp 05bh		;a2af
	cp 05bh		;a2b1
	cp 05bh		;a2b3
; --- Channel C percussion/rhythm data ---
MUSIC_CH_C:
	cp 05bh		;a2b5
	cp 000h		;a2b7
	nop			;a2b9
	adc a,c			;a2ba
	call m,08987h		;a2bb
	nop			;a2be
	add a,a			;a2bf
	adc a,c			;a2c0
	ld (bc),a			;a2c1
	add a,a			;a2c2
MUSIC_CH_ADVANCE:
	adc a,d			;a2c3
	rst 18h			;a2c4
	nop			;a2c5
	add a,c			;a2c6
	inc bc			;a2c7
	pop bc			;a2c8
	rst 38h			;a2c9
	jr c,MUSIC_CH_A		;a2ca
	add a,a			;a2cc
	ret nz			;a2cd
	adc a,b			;a2ce
	ld bc,08202h		;a2cf
	push hl			;a2d2
	jr z,MUSIC_CH_C		;a2d3
	daa			;a2d5
	dec h			;a2d6
	ex de,hl			;a2d7
	jr z,$-27		;a2d8
	dec h			;a2da
	daa			;a2db
	jr z,MUSIC_CH_ADVANCE		;a2dc
	ld hl,(028e0h)		;a2de
	daa			;a2e1
	ex de,hl			;a2e2
	ld hl,(02ae3h)		;a2e3
	inc l			;a2e6
	dec l			;a2e7
	push hl			;a2e8
	dec l			;a2e9
	jp (hl)			;a2ea
	jr z,$-23		;a2eb
	ld hl,(02ce3h)		;a2ed
	ex (sp),hl			;a2f0
	dec l			;a2f1
	add a,a			;a2f2
	ex (sp),hl			;a2f3
	cpl			;a2f4
	dec l			;a2f5
	inc l			;a2f6
	ld hl,(02ce3h)		;a2f7
	ld hl,(02728h)		;a2fa
MUSIC_CH_LOOP:
	add a,a			;a2fd
	ex (sp),hl			;a2fe
	cpl			;a2ff
	dec l			;a300
	dec hl			;a301
MUSIC_PATTERN_TBL:
	ld hl,(02be3h)		;a302
	ld hl,(02628h)		;a305
	add a,a			;a308
	add a,e			;a309
	rst 28h			;a30a
	inc h			;a30b
	add hl,hl			;a30c
	rst 38h			;a30d
	ld hl,(02aefh)		;a30e
	cpl			;a311
	rst 38h			;a312
	jr nc,MUSIC_CH_B		;a313
	pop hl			;a315
	jr nc,$-30		;a316
	cpl			;a318
	dec l			;a319
	push hl			;a31a
	jr nc,MUSIC_CH_LOOP		;a31b
	dec l			;a31d
	cpl			;a31e
MUSIC_SEQ_END:
	pop hl			;a31f
	jr nc,MUSIC_PATTERN_TBL		;a320
	cpl			;a322
	ret po			;a323
	dec l			;a324
	add a,a			;a325
MUSIC_SEQ_NEXT:
	pop hl			;a326
	cpl			;a327
	ret po			;a328
	dec l			;a329
	inc l			;a32a
	ex de,hl			;a32b
	cpl			;a32c
	add a,a			;a32d
	rst 28h			;a32e
	ld (0e187h),a		;a32f
	cpl			;a332
	ret po			;a333
	dec l			;a334
	dec hl			;a335
MUSIC_SEQ_LOOP:
	push hl			;a336
	cpl			;a337
	pop hl			;a338
	cpl			;a339
	ret po			;a33a
	cpl			;a33b
	jr nc,MUSIC_SEQ_END		;a33c
	ld (033efh),a		;a33e
MUSIC_SEQ_RESTART:
	add a,a			;a341
	ex (sp),hl			;a342
	jr z,MUSIC_SEQ_NEXT		;a343
	daa			;a345
	ex (sp),hl			;a346
	inc hl			;a347
	pop hl			;a348
	ld h,025h		;a349
	ld hl,024e3h		;a34b
	pop hl			;a34e
	inc hl			;a34f
	rra			;a350
	rst 30h			;a351
MUSIC_TRANSPOSE:
	inc hl			;a352
	ex (sp),hl			;a353
	cpl			;a354
	pop hl			;a355
	ld l,0e3h		;a356
	ld hl,(02de1h)		;a358
	inc l			;a35b
	jr z,MUSIC_SEQ_RESTART		;a35c
	dec hl			;a35e
	pop hl			;a35f
	ld hl,(0f726h)		;a360
	ld hl,(034e3h)		;a363
	pop hl			;a366
	inc sp			;a367
	ex (sp),hl			;a368
	cpl			;a369
	pop hl			;a36a
	ld (02d31h),a		;a36b
	ex (sp),hl			;a36e
	jr nc,MUSIC_TRANSPOSE		;a36f
	cpl			;a371
	dec hl			;a372
	rst 30h			;a373
	cpl			;a374
	ex (sp),hl			;a375
	dec sp			;a376
	pop hl			;a377
	ld a,(036e3h)		;a378
	pop hl			;a37b
	add hl,sp			;a37c
	jr c,MUSIC_ENV_STEP		;a37d
	ex (sp),hl			;a37f
	scf			;a380
	pop hl			;a381
	ld (hl),032h		;a382
	rst 30h			;a384
	ld (hl),087h		;a385
	rst 18h			;a387
	nop			;a388
	ld (08103h),hl		;a389
	pop hl			;a38c
	call nz,03438h		;a38d
	ld sp,034e0h		;a390
	jp po,0e038h		;a393
	inc (hl)			;a396
	ld sp,039e1h		;a397
	ret po			;a39a
	jr c,MUSIC_ENV_TABLE		;a39b
	add a,a			;a39d
	pop hl			;a39e
	add hl,sp			;a39f
	ld (hl),031h		;a3a0
	ret po			;a3a2
	ld (hl),0e2h		;a3a3
	add hl,sp			;a3a5
	ret po			;a3a6
	ld (hl),031h		;a3a7
MUSIC_VOL_ENV:
	pop hl			;a3a9
	dec sp			;a3aa
	ret po			;a3ab
	add hl,sp			;a3ac
	jr c,MUSIC_SEQ_LOOP		;a3ad
	pop hl			;a3af
	ld (hl),034h		;a3b0
	inc sp			;a3b2
MUSIC_ENV_STEP:
	ret po			;a3b3
	inc (hl)			;a3b4
	jp po,0e036h		;a3b5
	inc (hl)			;a3b8
	inc sp			;a3b9
	pop hl			;a3ba
	add hl,sp			;a3bb
	ret po			;a3bc
	jr c,MUSIC_ENV_SHAPE		;a3bd
	add a,a			;a3bf
	pop hl			;a3c0
	jr c,MUSIC_ENV_PERIOD		;a3c1
	inc sp			;a3c3
	ret po			;a3c4
	ld (hl),0e2h		;a3c5
	jr c,MUSIC_VOL_ENV		;a3c7
	ld (hl),033h		;a3c9
	pop hl			;a3cb
	add hl,sp			;a3cc
	ret po			;a3cd
	jr c,MUSIC_ENV_RESET		;a3ce
	add a,a			;a3d0
MUSIC_ENV_TABLE:
	pop hl			;a3d1
	add hl,sp			;a3d2
	jr c,MUSIC_ENV_DONE		;a3d3
	ret po			;a3d5
	scf			;a3d6
	jp po,0e136h		;a3d7
	ld (0e035h),a		;a3da
	inc (hl)			;a3dd
	ret po			;a3de
	ld sp,0e187h		;a3df
	ld (hl),035h		;a3e2
	ld sp,034e0h		;a3e4
	jp po,0e133h		;a3e7
	cpl			;a3ea
	ld (031e0h),a		;a3eb
	dec l			;a3ee
	add a,a			;a3ef
	ret nz			;a3f0
	adc a,d			;a3f1
	rst 18h			;a3f2
MUSIC_ENV_SHAPE:
	nop			;a3f3
	ld b,c			;a3f4
	dec b			;a3f5
	ret po			;a3f6
	sub c			;a3f7
	dec c			;a3f8
MUSIC_ENV_PERIOD:
	add hl,de			;a3f9
	pop hl			;a3fa
	sub c			;a3fb
	dec c			;a3fc
	add a,c			;a3fd
	ret po			;a3fe
	sub c			;a3ff
	dec c			;a400
	add hl,de			;a401
	sub c			;a402
	dec h			;a403
	pop hl			;a404
	sub c			;a405
MUSIC_ENV_RESET:
	dec c			;a406
	ret po			;a407
	add hl,de			;a408
MUSIC_ENV_DONE:
	pop hl			;a409
	sub c			;a40a
	add hl,de			;a40b
	sub c			;a40c
	dec c			;a40d
	sub c			;a40e
	ret po			;a40f
	add hl,de			;a410
	dec h			;a411
	add a,a			;a412
	ret po			;a413
	sub c			;a414
	ld (de),a			;a415
	ld e,0e1h		;a416
	sub c			;a418
	ld (de),a			;a419
	ret po			;a41a
	sub c			;a41b
	ld (de),a			;a41c
	ld e,091h		;a41d
	ld hl,(091e1h)		;a41f
	ld (de),a			;a422
	ret po			;a423
	ld e,0e1h		;a424
	sub c			;a426
	ld e,091h		;a427
	ld (de),a			;a429
; --- Sound effects data ---
MUSIC_SFX_START:
	sub c			;a42a
	ret po			;a42b
	ld e,02ah		;a42c
	add a,a			;a42e
	ret po			;a42f
	sub c			;a430
	add hl,bc			;a431
	dec d			;a432
	pop hl			;a433
	sub c			;a434
	add hl,bc			;a435
	ret po			;a436
	sub c			;a437
	add hl,bc			;a438
	dec d			;a439
	sub c			;a43a
	ld hl,091e1h		;a43b
	add hl,bc			;a43e
	ret po			;a43f
	dec d			;a440
	pop hl			;a441
	sub c			;a442
	dec d			;a443
	sub c			;a444
	add hl,bc			;a445
	sub c			;a446
	ret po			;a447
	dec d			;a448
	ld hl,0e087h		;a449
	sub c			;a44c
	ld c,01ah		;a44d
	pop hl			;a44f
	sub c			;a450
	ld c,0e0h		;a451
	sub c			;a453
	ld c,01ah		;a454
	sub c			;a456
	ld h,0e1h		;a457
	sub c			;a459
	ld c,0e0h		;a45a
MUSIC_SFX_CH_A:
	ld a,(de)			;a45c
	pop hl			;a45d
	sub c			;a45e
	ld a,(de)			;a45f
	sub c			;a460
	ld c,091h		;a461
	ret po			;a463
	ld a,(de)			;a464
	ld h,087h		;a465
	ret po			;a467
	sub c			;a468
MUSIC_SFX_CH_B:
	dec bc			;a469
	rla			;a46a
	pop hl			;a46b
	sub c			;a46c
	dec bc			;a46d
	ret po			;a46e
	sub c			;a46f
	dec bc			;a470
	rla			;a471
	sub c			;a472
	inc hl			;a473
	pop hl			;a474
	sub c			;a475
	dec bc			;a476
MUSIC_SFX_CH_C:
	ret po			;a477
	rla			;a478
	pop hl			;a479
	sub c			;a47a
	rla			;a47b
	sub c			;a47c
	dec bc			;a47d
	sub c			;a47e
	ret po			;a47f
	rla			;a480
	inc hl			;a481
	add a,a			;a482
	ret po			;a483
	sub c			;a484
	inc d			;a485
	jr nz,MUSIC_SFX_CH_B		;a486
	sub c			;a488
	inc d			;a489
	ret po			;a48a
	sub c			;a48b
	inc d			;a48c
	jr nz,$-109		;a48d
	inc d			;a48f
	pop hl			;a490
	sub c			;a491
	inc d			;a492
	ret po			;a493
	jr nz,MUSIC_SFX_CH_C		;a494
	sub c			;a496
	jr nz,MUSIC_SFX_START		;a497
	inc d			;a499
MUSIC_SFX_LOOP:
	sub c			;a49a
	ret po			;a49b
	jr nz,MUSIC_SFX_MIX		;a49c
	add a,a			;a49e
	ret po			;a49f
MUSIC_SFX_ITER:
	sub c			;a4a0
	inc de			;a4a1
	rra			;a4a2
	pop hl			;a4a3
	sub c			;a4a4
MUSIC_SFX_STEP:
	inc de			;a4a5
	ret po			;a4a6
	sub c			;a4a7
	inc de			;a4a8
	rra			;a4a9
MUSIC_SFX_DONE:
	sub c			;a4aa
	dec hl			;a4ab
	pop hl			;a4ac
	sub c			;a4ad
	inc de			;a4ae
	ret po			;a4af
	rra			;a4b0
	pop hl			;a4b1
	sub c			;a4b2
MUSIC_SFX_VOL:
	rra			;a4b3
	sub c			;a4b4
	inc de			;a4b5
	sub c			;a4b6
	ret po			;a4b7
MUSIC_SFX_TONE:
	add a,c			;a4b8
	rra			;a4b9
	adc a,b			;a4ba
	ld bc,02b01h		;a4bb
MUSIC_SFX_MIX:
	add a,a			;a4be
	ret po			;a4bf
	sub c			;a4c0
	inc c			;a4c1
	jr MUSIC_SFX_STEP		;a4c2
	sub c			;a4c4
	inc c			;a4c5
	ret po			;a4c6
	sub c			;a4c7
	inc c			;a4c8
	jr MUSIC_SFX_CH_A		;a4c9
	inc h			;a4cb
	pop hl			;a4cc
	sub c			;a4cd
	inc c			;a4ce
	ret po			;a4cf
	jr MUSIC_SFX_VOL		;a4d0
	sub c			;a4d2
	jr $-109		;a4d3
	inc c			;a4d5
	sub c			;a4d6
	ret po			;a4d7
	jr $+38		;a4d8
	add a,a			;a4da
	ret po			;a4db
	sub c			;a4dc
	ld de,0e11dh		;a4dd
	sub c			;a4e0
	ld de,091e0h		;a4e1
	ld de,0911dh		;a4e4
	add hl,hl			;a4e7
MUSIC_SFX_WRITE:
	pop hl			;a4e8
	sub c			;a4e9
	ld de,01de0h		;a4ea
	pop hl			;a4ed
	sub c			;a4ee
	dec e			;a4ef
	sub c			;a4f0
	ld de,0e091h		;a4f1
	dec e			;a4f4
	add hl,hl			;a4f5
	add a,a			;a4f6
	ret po			;a4f7
	sub c			;a4f8
	djnz MUSIC_SFX_REG		;a4f9
	pop hl			;a4fb
	sub c			;a4fc
	djnz $-30		;a4fd
	sub c			;a4ff
	djnz MUSIC_SFX_REG2		;a500
	sub c			;a502
	jr z,$-29		;a503
	sub c			;a505
	djnz MUSIC_SFX_WRITE		;a506
	inc e			;a508
	pop hl			;a509
	sub c			;a50a
	inc e			;a50b
	sub c			;a50c
	djnz MUSIC_SFX_ITER		;a50d
	ret po			;a50f
MUSIC_SFX_NEXT:
	inc e			;a510
	jr z,MUSIC_SFX_LOOP		;a511
	rst 18h			;a513
	nop			;a514
	sub c			;a515
	ld (bc),a			;a516
MUSIC_SFX_REG:
	add a,d			;a517
	rst 28h			;a518
	djnz MUSIC_SFX_DONE		;a519
	adc a,a			;a51b
	rst 28h			;a51c
	ld (de),a			;a51d
MUSIC_SFX_REG2:
	adc a,a			;a51e
	adc a,a			;a51f
	rst 20h			;a520
	dec bc			;a521
	dec c			;a522
	rst 20h			;a523
	ld c,00fh		;a524
	rst 28h			;a526
	djnz MUSIC_SFX_NEXT		;a527
	ld (de),a			;a529
	rst 20h			;a52a
	inc d			;a52b
	dec d			;a52c
	ld d,017h		;a52d
	jr MUSIC_SFX_TONE		;a52f
	rst 18h			;a531
	nop			;a532
	sub c			;a533
	ld (bc),a			;a534
	rst 38h			;a535
	add a,e			;a536
	jr MUSIC_DATA_START		;a537
	jr MUSIC_DATA_ALT		;a539
	add a,a			;a53b
	adc a,e			;a53c
	rst 18h			;a53d
	nop			;a53e
	ld bc,0e110h		;a53f
	adc a,l			;a542
	rra			;a543
	ret nz			;a544
	adc a,d			;a545
	add a,h			;a546
	inc b			;a547
	ld bc,08b37h		;a548
	jp po,0078dh		;a54b
	adc a,l			;a54e
	rra			;a54f
; --- Additional song pattern data ---
MUSIC_DATA_START:
	pop hl			;a550
	adc a,l			;a551
	rra			;a552
	adc a,l			;a553
	rlca			;a554
	adc a,d			;a555
	add a,h			;a556
	inc b			;a557
	ld bc,08b32h		;a558
MUSIC_DATA_ALT:
	adc a,l			;a55b
	rra			;a55c
	adc a,d			;a55d
	add a,h			;a55e
	inc b			;a55f
	ld bc,0e232h		;a560
	adc a,e			;a563
	adc a,l			;a564
	rlca			;a565
	adc a,l			;a566
	rra			;a567
	pop hl			;a568
	adc a,d			;a569
	add a,h			;a56a
	inc b			;a56b
	ld bc,08b37h		;a56c
	adc a,l			;a56f
	rlca			;a570
	ret po			;a571
	adc a,l			;a572
	rlca			;a573
	adc a,l			;a574
	rlca			;a575
	add a,a			;a576
	adc a,e			;a577
	rst 18h			;a578
	nop			;a579
	ld bc,0e110h		;a57a
	adc a,l			;a57d
MUSIC_PLAYER_ISR:
	rra			;a57e
	ret nz			;a57f
	adc a,d			;a580
	sub c			;a581
	add a,h			;a582
	inc b			;a583
	ld bc,08b2bh		;a584
	adc a,l			;a587
	rra			;a588
	adc a,d			;a589
	sub c			;a58a
	add a,h			;a58b
	inc b			;a58c
	ld bc,0912bh		;a58d
	add a,h			;a590
	inc b			;a591
	ld bc,08b2bh		;a592
	adc a,l			;a595
	rra			;a596
	ex (sp),hl			;a597
	adc a,l			;a598
	rlca			;a599
	add a,a			;a59a
	cp h			;a59b
	rst 38h			;a59c
	add a,b			;a59d
	add a,a			;a59e
	ret nz			;a59f
	adc a,d			;a5a0
	rst 18h			;a5a1
	nop			;a5a2
	add a,c			;a5a3
	inc bc			;a5a4
	adc a,b			;a5a5
	ld bc,08202h		;a5a6
	ex (sp),hl			;a5a9
	ld sp,030e1h		;a5aa
	ex (sp),hl			;a5ad
	inc l			;a5ae
	pop hl			;a5af
MUSIC_ISR_TICK:
	cpl			;a5b0
	ld l,02ah		;a5b1
	ex (sp),hl			;a5b3
	dec l			;a5b4
	pop hl			;a5b5
	inc l			;a5b6
	jr z,MUSIC_ISR_TICK		;a5b7
	inc l			;a5b9
	pop bc			;a5ba
	rst 28h			;a5bb
	jr c,MUSIC_PLAYER_ISR		;a5bc
	ex (sp),hl			;a5be
	ld (hl),0e1h		;a5bf
	dec (hl)			;a5c1
MUSIC_ISR_DONE:
	ex (sp),hl			;a5c2
	ld sp,034e1h		;a5c3
	inc sp			;a5c6
	cpl			;a5c7
	ex (sp),hl			;a5c8
	ld (031e1h),a		;a5c9
	dec l			;a5cc
	rst 30h			;a5cd
MUSIC_ISR_UPDATE:
	ld sp,0c1efh		;a5ce
	ld (hl),0e3h		;a5d1
	ret nz			;a5d3
	inc (hl)			;a5d4
	pop hl			;a5d5
	inc sp			;a5d6
	ex (sp),hl			;a5d7
MUSIC_ISR_FRAME:
	cpl			;a5d8
	pop hl			;a5d9
	ld (031e1h),a		;a5da
	dec l			;a5dd
	ex (sp),hl			;a5de
	jr nc,MUSIC_ISR_DONE		;a5df
	cpl			;a5e1
	pop hl			;a5e2
	dec hl			;a5e3
	rst 30h			;a5e4
	cpl			;a5e5
	rst 28h			;a5e6
	pop bc			;a5e7
	inc (hl)			;a5e8
	ret nz			;a5e9
	ex (sp),hl			;a5ea
	jr c,MUSIC_ISR_UPDATE		;a5eb
	ld (hl),0e3h		;a5ed
	inc sp			;a5ef
	pop hl			;a5f0
	add hl,sp			;a5f1
	jr c,$+54		;a5f2
	ex (sp),hl			;a5f4
	jr c,MUSIC_ISR_FRAME		;a5f5
	ld (hl),0e3h		;a5f7
	inc sp			;a5f9
	pop hl			;a5fa
	inc (hl)			;a5fb
	inc sp			;a5fc
	ld sp,038e3h		;a5fd
	pop hl			;a600
	ld (hl),0e3h		;a601
	inc sp			;a603
	pop hl			;a604
	ld (hl),034h		;a605
	ld sp,033efh		;a607
	add a,a			;a60a
	cp h			;a60b
	add a,c			;a60c
	jp nz,0df8ah		;a60d
	nop			;a610
	add a,c			;a611
	inc bc			;a612
	rst 38h			;a613
	inc a			;a614
	pop bc			;a615
	dec sp			;a616
	jp nz,0c33ch		;a617
	inc a			;a61a
	add a,a			;a61b
; --- Padding / end of sound engine ($A61C-$A627) ---
	nop			;a61c
	nop			;a61d
	nop			;a61e
	nop			;a61f
	nop			;a620
	nop			;a621
	nop			;a622
	nop			;a623
	nop			;a624
	nop			;a625
	nop			;a626
	nop			;a627

