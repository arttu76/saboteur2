; ======================================================================
; preloader.asm
; ======================================================================
;
; Pre-loader: Copy Sound Engine to 128K Bank 1
;
; Address range: $9C22-$9C3F (30 bytes)
; Source binary: block5_data.bin (loaded at $9C22)
;
; Executed by RANDOMIZE USR 39970 from the BASIC loader, before the
; main game binary loads. This short routine:
;   1. Disables interrupts
;   2. Pages 128K bank 1 into $C000-$FFFF
;   3. Copies the sound engine (2536 bytes) from $9C40 to $F618
;   4. Pages bank 0 back in
;   5. Re-enables interrupts and returns to BASIC
;
; After this runs, the sound engine lives in bank 1 at $F618-$FFFF.
; This preloader code (and the sound engine source data following it)
; are overwritten when the main game binary loads at $620C.
;
; Memory layout:
;   $9C22-$9C3F  This preloader code (30 bytes)
;   $9C40-$A627  Sound engine source data (2536 bytes)
;   $F618-$FFFF  Sound engine destination in bank 1
;   $7FFD         128K memory paging port
;
; ======================================================================


	org	09c22h

	di			;9c22  ; Disable interrupts during bank switching
	ld bc,07ffdh		;9c23  ; BC = $7FFD (128K memory paging port)
	ld a,011h		;9c26  ; A = $11 -> page in bank 1 at $C000-$FFFF
	out (c),a		;9c28  ; Switch to bank 1
	ld hl,SOUND_ENGINE_START		;9c2a  ; HL = $9C40 (sound engine source data)
	ld de,0f618h		;9c2d  ; DE = $F618 (destination in bank 1)
	ld bc,009e8h		;9c30  ; BC = 2536 bytes (size of sound engine)
	ldir		;9c33  ; Copy sound engine: $9C40 -> $F618 in bank 1
	ld bc,07ffdh		;9c35  ; BC = $7FFD (128K memory paging port)
	ld a,010h		;9c38  ; A = $10 -> page bank 0 back in
	out (c),a		;9c3a  ; Restore bank 0 at $C000-$FFFF
	ei			;9c3c  ; Re-enable interrupts
	ret			;9c3d  ; Return to BASIC loader
	nop			;9c3e  ; Padding
	nop			;9c3f  ; Padding
