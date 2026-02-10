; ======================================================================
; entry_jump.asm
; ======================================================================
;
; Entry Point Jump
;
; Address range: $620C-$620E (3 bytes)
; Source binary: mod_decompressed.bin (loaded at $620C)
;
; Single JP instruction redirecting to the main initialization at $8574.
; In the original 128K version, $620C contained the full initialization
; sequence. The mod moves init to $8574 to make room for packed data.
;
; ======================================================================

entry_start:
	jp tab1_end		;620c
