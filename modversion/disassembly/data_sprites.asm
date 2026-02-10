; ======================================================================
; data_sprites.asm
; ======================================================================
;
; Sprite Bitmap Data
;
; Address range: $AA8C-$B4CB (2624 bytes)
; Source binary: mod_decompressed.bin (loaded at $620C)
;
; Character sprites, animation frames, and item graphics.
; 74% preserved from the original, 26% modified/new.
; Includes guard sprites, ninja sprites, vehicles, items, scenery.
; Origin: data_spritebitmap + NEW
;
; ======================================================================

entities_end:

sprites_start:
	defb 02ch		;aa8c  ','
	defb 01ch		;aa8d
	defb 01ch		;aa8e
; ",489"
	defb 02ch		;aa8f  ','
	defb 034h		;aa90  '4'
	defb 038h		;aa91  '8'
	defb 039h		;aa92  '9'
	defb 001h		;aa93
	defb 003h		;aa94
	defb 007h		;aa95
	defb 00dh		;aa96
	defb 019h		;aa97
	defb 031h		;aa98  '1'
	defb 061h		;aa99  'a'
	defb 0c1h		;aa9a
	defb 00fh		;aa9b
	defb 080h		;aa9c
	defb 0c0h		;aa9d
	defb 0e0h		;aa9e
	defb 0b0h		;aa9f
	defb 098h		;aaa0
	defb 08ch		;aaa1
	defb 086h		;aaa2
	defb 083h		;aaa3
	defb 00fh		;aaa4
; " ( '////9"
	defb 020h		;aaa5  ' '
	defb 028h		;aaa6  '('
	defb 020h		;aaa7  ' '
	defb 027h		;aaa8  '''
	defb 02fh		;aaa9  '/'
	defb 02fh		;aaaa  '/'
	defb 02fh		;aaab  '/'
	defb 02fh		;aaac  '/'
	defb 039h		;aaad  '9'
	defb 002h		;aaae
	defb 00ah		;aaaf
	defb 002h		;aab0
	defb 0e2h		;aab1
	defb 0f2h		;aab2
	defb 0f2h		;aab3
	defb 0f2h		;aab4
	defb 0f2h		;aab5
	defb 039h		;aab6  '9'
	defb 0aah		;aab7
	defb 000h		;aab8
	defb 000h		;aab9
	defb 000h		;aaba
	defb 000h		;aabb
	defb 000h		;aabc
	defb 000h		;aabd
	defb 000h		;aabe
	defb 00ah		;aabf
	defb 0ffh		;aac0
	defb 040h		;aac1  '@'
	defb 040h		;aac2  '@'
	defb 040h		;aac3  '@'
	defb 0ffh		;aac4
	defb 004h		;aac5
	defb 004h		;aac6
	defb 004h		;aac7
laac8h:
	defb 008h		;aac8
	defb 010h		;aac9
	defb 017h		;aaca
	defb 01fh		;aacb
	defb 01fh		;aacc
	defb 010h		;aacd
	defb 017h		;aace
	defb 01fh		;aacf
	defb 01fh		;aad0
	defb 039h		;aad1  '9'
	defb 008h		;aad2
	defb 0e8h		;aad3
	defb 0f8h		;aad4
	defb 0f8h		;aad5
	defb 008h		;aad6
	defb 0e8h		;aad7
	defb 0f8h		;aad8
	defb 0f8h		;aad9
	defb 039h		;aada  '9'
	defb 0ffh		;aadb
	defb 0ffh		;aadc
	defb 0ffh		;aadd
	defb 0ffh		;aade
	defb 0ffh		;aadf
	defb 087h		;aae0
	defb 007h		;aae1
	defb 003h		;aae2
	defb 008h		;aae3
	defb 0ffh		;aae4
	defb 0ffh		;aae5
	defb 0ffh		;aae6
	defb 000h		;aae7
	defb 0ffh		;aae8
	defb 000h		;aae9
	defb 000h		;aaea
	defb 000h		;aaeb
	defb 010h		;aaec
	defb 0ffh		;aaed
	defb 0ffh		;aaee
	defb 0ffh		;aaef
	defb 0f7h		;aaf0
	defb 0f3h		;aaf1
	defb 0e2h		;aaf2
	defb 0e2h		;aaf3
	defb 0c0h		;aaf4
	defb 008h		;aaf5
	defb 0f7h		;aaf6
	defb 080h		;aaf7
	defb 0aah		;aaf8
	defb 084h		;aaf9
	defb 0aah		;aafa
	defb 080h		;aafb
	defb 0aah		;aafc
	defb 000h		;aafd
	defb 020h		;aafe  ' '
	defb 0eeh		;aaff
	defb 000h		;ab00
	defb 0aah		;ab01
	defb 000h		;ab02
	defb 0aah		;ab03
	defb 002h		;ab04
	defb 0aeh		;ab05
	defb 000h		;ab06
; " RTU"
	defb 020h		;ab07  ' '
	defb 052h		;ab08  'R'
	defb 054h		;ab09  'T'
	defb 055h		;ab0a  'U'
	defb 0b5h		;ab0b
	defb 0b6h		;ab0c
	defb 092h		;ab0d
	defb 0cah		;ab0e
	defb 04ah		;ab0f  'J'
	defb 010h		;ab10
	defb 080h		;ab11
	defb 0c0h		;ab12
	defb 040h		;ab13  '@'
	defb 060h		;ab14  '`' (Spectrum: GBP)
	defb 0e0h		;ab15
	defb 020h		;ab16  ' '
	defb 020h		;ab17  ' '
	defb 030h		;ab18  '0'
	defb 008h		;ab19
	defb 0f8h		;ab1a
	defb 04ch		;ab1b  'L'
	defb 044h		;ab1c  'D'
	defb 046h		;ab1d  'F'
	defb 0feh		;ab1e
	defb 006h		;ab1f
	defb 007h		;ab20
	defb 005h		;ab21
	defb 008h		;ab22
	defb 0aah		;ab23
	defb 056h		;ab24  'V'
	defb 0aah		;ab25
	defb 056h		;ab26  'V'
	defb 0aah		;ab27
	defb 056h		;ab28  'V'
	defb 0aah		;ab29
	defb 056h		;ab2a  'V'
	defb 020h		;ab2b  ' '
	defb 000h		;ab2c
	defb 07fh		;ab2d
; "}}}}"
	defb 07dh		;ab2e  '}'
	defb 07dh		;ab2f  '}'
	defb 07dh		;ab30  '}'
	defb 07dh		;ab31  '}'
	defb 07fh		;ab32
	defb 000h		;ab33
	defb 039h		;ab34  '9'
	defb 000h		;ab35
	defb 0ffh		;ab36
	defb 011h		;ab37
	defb 011h		;ab38
	defb 0d5h		;ab39
	defb 0d1h		;ab3a
	defb 0ffh		;ab3b
	defb 000h		;ab3c
	defb 039h		;ab3d  '9'
	defb 000h		;ab3e
	defb 0feh		;ab3f
	defb 01eh		;ab40
	defb 0deh		;ab41
	defb 0deh		;ab42
	defb 0deh		;ab43
	defb 0feh		;ab44
	defb 000h		;ab45
	defb 039h		;ab46  '9'
	defb 000h		;ab47
	defb 07eh		;ab48  '~'
	defb 000h		;ab49
	defb 054h		;ab4a  'T'
	defb 000h		;ab4b
	defb 054h		;ab4c  'T'
	defb 000h		;ab4d
	defb 000h		;ab4e
	defb 039h		;ab4f  '9'
	defb 080h		;ab50
	defb 0c0h		;ab51
	defb 040h		;ab52  '@'
	defb 060h		;ab53  '`' (Spectrum: GBP)
	defb 031h		;ab54  '1'
	defb 01ah		;ab55
	defb 00ch		;ab56
	defb 000h		;ab57
	defb 008h		;ab58
	defb 008h		;ab59
	defb 030h		;ab5a  '0'
	defb 040h		;ab5b  '@'
	defb 080h		;ab5c
	defb 000h		;ab5d
	defb 000h		;ab5e
	defb 000h		;ab5f
	defb 000h		;ab60
	defb 008h		;ab61
	defb 0f8h		;ab62
	defb 0e0h		;ab63
	defb 0c1h		;ab64
	defb 080h		;ab65
	defb 081h		;ab66
	defb 002h		;ab67
	defb 001h		;ab68
	defb 002h		;ab69
	defb 039h		;ab6a  '9'
	defb 05fh		;ab6b  '_'
	defb 0afh		;ab6c
	defb 057h		;ab6d  'W'
	defb 0abh		;ab6e
	defb 055h		;ab6f  'U'
	defb 0aah		;ab70
	defb 055h		;ab71  'U'
	defb 0aah		;ab72
	defb 029h		;ab73  ')'
	defb 001h		;ab74
	defb 002h		;ab75
	defb 001h		;ab76
	defb 080h		;ab77
	defb 081h		;ab78
	defb 0c0h		;ab79
	defb 0e0h		;ab7a
	defb 0f8h		;ab7b
	defb 039h		;ab7c  '9'
	defb 055h		;ab7d  'U'
	defb 0aah		;ab7e
	defb 055h		;ab7f  'U'
	defb 0abh		;ab80
	defb 055h		;ab81  'U'
	defb 0abh		;ab82
	defb 057h		;ab83  'W'
	defb 01fh		;ab84
	defb 029h		;ab85  ')'
; --- 8 zero bytes ---
	defb 000h		;ab86
	defb 000h		;ab87
	defb 000h		;ab88
	defb 000h		;ab89
	defb 000h		;ab8a
	defb 000h		;ab8b
	defb 000h		;ab8c
	defb 000h		;ab8d
	defb 020h		;ab8e  ' '
	defb 0f8h		;ab8f
	defb 0e1h		;ab90
	defb 03ch		;ab91  '<'
	defb 0c7h		;ab92
	defb 086h		;ab93
	defb 0f9h		;ab94
	defb 022h		;ab95  '"'
	defb 0d4h		;ab96
	defb 021h		;ab97  '!'
	defb 078h		;ab98  'x'
	defb 000h		;ab99
	defb 000h		;ab9a
	defb 0e0h		;ab9b
	defb 000h		;ab9c
	defb 000h		;ab9d
	defb 000h		;ab9e
	defb 000h		;ab9f
	defb 021h		;aba0  '!'
	defb 0f5h		;aba1
	defb 0cah		;aba2
	defb 0e4h		;aba3
	defb 01ah		;aba4
	defb 0f4h		;aba5
	defb 0f8h		;aba6
	defb 094h		;aba7
	defb 0eah		;aba8
	defb 021h		;aba9  '!'
	defb 0d0h		;abaa
	defb 03eh		;abab  '>'
	defb 0e5h		;abac
	defb 04ah		;abad  'J'
	defb 035h		;abae  '5'
	defb 0fbh		;abaf
	defb 094h		;abb0
	defb 0ebh		;abb1
	defb 021h		;abb2  '!'
	defb 000h		;abb3
	defb 000h		;abb4
	defb 000h		;abb5
	defb 0a0h		;abb6
	defb 055h		;abb7  'U'
	defb 0eah		;abb8
	defb 056h		;abb9  'V'
	defb 0f8h		;abba
	defb 021h		;abbb  '!'
	defb 000h		;abbc
	defb 000h		;abbd
	defb 000h		;abbe
	defb 000h		;abbf
	defb 000h		;abc0
	defb 0a8h		;abc1
	defb 054h		;abc2  'T'
	defb 0e6h		;abc3
; "!ooh`oddd"
	defb 021h		;abc4  '!'
	defb 06fh		;abc5  'o'
	defb 06fh		;abc6  'o'
	defb 068h		;abc7  'h'
	defb 060h		;abc8  '`' (Spectrum: GBP)
	defb 06fh		;abc9  'o'
	defb 064h		;abca  'd'
	defb 064h		;abcb  'd'
	defb 064h		;abcc  'd'
	defb 010h		;abcd
	defb 0f6h		;abce
	defb 0f6h		;abcf
	defb 016h		;abd0
	defb 046h		;abd1  'F'
	defb 0f6h		;abd2
	defb 006h		;abd3
	defb 006h		;abd4
	defb 006h		;abd5
	defb 010h		;abd6
	defb 0bch		;abd7
	defb 000h		;abd8
	defb 000h		;abd9
	defb 000h		;abda
	defb 000h		;abdb
	defb 000h		;abdc
	defb 000h		;abdd
	defb 000h		;abde
	defb 021h		;abdf  '!'
	defb 03fh		;abe0  '?'
	defb 000h		;abe1
	defb 000h		;abe2
	defb 000h		;abe3
	defb 000h		;abe4
	defb 000h		;abe5
	defb 000h		;abe6
	defb 000h		;abe7
	defb 021h		;abe8  '!'
	defb 0ffh		;abe9
	defb 00bh		;abea
	defb 01ch		;abeb
	defb 003h		;abec
	defb 005h		;abed
	defb 03fh		;abee  '?'
	defb 001h		;abef
	defb 003h		;abf0
	defb 021h		;abf1  '!'
	defb 000h		;abf2
	defb 000h		;abf3
	defb 000h		;abf4
	defb 000h		;abf5
	defb 000h		;abf6
	defb 000h		;abf7
	defb 00eh		;abf8
	defb 003h		;abf9
	defb 021h		;abfa  '!'
	defb 000h		;abfb
	defb 003h		;abfc
	defb 000h		;abfd
	defb 000h		;abfe
	defb 00fh		;abff
	defb 01bh		;ac00
	defb 007h		;ac01
	defb 0cfh		;ac02
; "!oohbjbn` "
	defb 021h		;ac03  '!'
	defb 06fh		;ac04  'o'
	defb 06fh		;ac05  'o'
	defb 068h		;ac06  'h'
	defb 062h		;ac07  'b'
	defb 06ah		;ac08  'j'
	defb 062h		;ac09  'b'
	defb 06eh		;ac0a  'n'
	defb 060h		;ac0b  '`' (Spectrum: GBP)
	defb 020h		;ac0c  ' '
	defb 0f6h		;ac0d
	defb 0f6h		;ac0e
	defb 016h		;ac0f
	defb 0a6h		;ac10
	defb 0b6h		;ac11
	defb 086h		;ac12
	defb 0f6h		;ac13
	defb 006h		;ac14
	defb 020h		;ac15  ' '
	defb 080h		;ac16
	defb 040h		;ac17  '@'
	defb 020h		;ac18  ' '
	defb 01fh		;ac19
	defb 010h		;ac1a
	defb 010h		;ac1b
	defb 010h		;ac1c
	defb 010h		;ac1d
	defb 038h		;ac1e  '8'
	defb 000h		;ac1f
	defb 000h		;ac20
	defb 000h		;ac21
	defb 0ffh		;ac22
	defb 000h		;ac23
	defb 000h		;ac24
	defb 000h		;ac25
	defb 000h		;ac26
	defb 038h		;ac27  '8'
	defb 001h		;ac28
	defb 002h		;ac29
	defb 004h		;ac2a
	defb 0f8h		;ac2b
	defb 008h		;ac2c
	defb 008h		;ac2d
	defb 008h		;ac2e
	defb 008h		;ac2f
	defb 038h		;ac30  '8'
	defb 010h		;ac31
	defb 010h		;ac32
	defb 010h		;ac33
	defb 010h		;ac34
	defb 010h		;ac35
	defb 010h		;ac36
	defb 010h		;ac37
	defb 010h		;ac38
	defb 038h		;ac39  '8'
	defb 000h		;ac3a
	defb 00fh		;ac3b
	defb 008h		;ac3c
	defb 00ah		;ac3d
	defb 008h		;ac3e
	defb 008h		;ac3f
	defb 009h		;ac40
	defb 008h		;ac41
	defb 039h		;ac42  '9'
	defb 000h		;ac43
	defb 0ffh		;ac44
	defb 000h		;ac45
	defb 020h		;ac46  ' '
	defb 041h		;ac47  'A'
	defb 0a2h		;ac48
	defb 041h		;ac49  'A'
	defb 0a0h		;ac4a
	defb 039h		;ac4b  '9'
	defb 000h		;ac4c
	defb 0f0h		;ac4d
	defb 010h		;ac4e
	defb 090h		;ac4f
	defb 050h		;ac50  'P'
	defb 090h		;ac51
	defb 010h		;ac52
	defb 090h		;ac53
	defb 039h		;ac54  '9'
	defb 008h		;ac55
	defb 008h		;ac56
	defb 008h		;ac57
	defb 008h		;ac58
	defb 008h		;ac59
	defb 008h		;ac5a
	defb 008h		;ac5b
	defb 008h		;ac5c
	defb 038h		;ac5d  '8'
	defb 009h		;ac5e
	defb 00ah		;ac5f
	defb 009h		;ac60
	defb 00ah		;ac61
	defb 009h		;ac62
	defb 008h		;ac63
	defb 00fh		;ac64
	defb 000h		;ac65
	defb 039h		;ac66  '9'
	defb 041h		;ac67  'A'
	defb 082h		;ac68
	defb 045h		;ac69  'E'
	defb 002h		;ac6a
	defb 014h		;ac6b
	defb 000h		;ac6c
	defb 0ffh		;ac6d
	defb 000h		;ac6e
	defb 039h		;ac6f  '9'
	defb 010h		;ac70
	defb 010h		;ac71
	defb 050h		;ac72  'P'
	defb 090h		;ac73
	defb 050h		;ac74  'P'
	defb 010h		;ac75
	defb 0f0h		;ac76
	defb 000h		;ac77
	defb 039h		;ac78  '9'
; --- 8 zero bytes ---
	defb 000h		;ac79
	defb 000h		;ac7a
	defb 000h		;ac7b
	defb 000h		;ac7c
	defb 000h		;ac7d
	defb 000h		;ac7e
	defb 000h		;ac7f
	defb 000h		;ac80
	defb 039h		;ac81  '9'
	defb 000h		;ac82
	defb 006h		;ac83
	defb 03eh		;ac84  '>'
	defb 006h		;ac85
	defb 006h		;ac86
	defb 006h		;ac87
	defb 006h		;ac88
	defb 000h		;ac89
	defb 039h		;ac8a  '9'
	defb 0f7h		;ac8b
	defb 087h		;ac8c
	defb 0a7h		;ac8d
	defb 0a7h		;ac8e
	defb 0b7h		;ac8f
	defb 087h		;ac90
	defb 0f7h		;ac91
	defb 007h		;ac92
	defb 020h		;ac93  ' '
	defb 0ffh		;ac94
	defb 0ffh		;ac95
	defb 0c0h		;ac96
	defb 0a2h		;ac97
	defb 03ah		;ac98  ':'
	defb 002h		;ac99
	defb 07eh		;ac9a  '~'
	defb 000h		;ac9b
	defb 020h		;ac9c  ' '
	defb 0ffh		;ac9d
	defb 0ffh		;ac9e
	defb 000h		;ac9f
	defb 0a2h		;aca0
	defb 0bah		;aca1
	defb 082h		;aca2
	defb 0feh		;aca3
	defb 000h		;aca4
	defb 020h		;aca5  ' '
	defb 0ffh		;aca6
	defb 0ffh		;aca7
	defb 003h		;aca8
	defb 0a1h		;aca9
	defb 0b9h		;acaa
	defb 082h		;acab
	defb 0feh		;acac
	defb 000h		;acad
	defb 020h		;acae  ' '
	defb 0eeh		;acaf
	defb 0e2h		;acb0
	defb 0e2h		;acb1
	defb 0e2h		;acb2
	defb 0eah		;acb3
	defb 0e2h		;acb4
	defb 0eeh		;acb5
	defb 0e0h		;acb6
; " 88888**8"
	defb 020h		;acb7  ' '
	defb 038h		;acb8  '8'
	defb 038h		;acb9  '8'
	defb 038h		;acba  '8'
	defb 038h		;acbb  '8'
	defb 038h		;acbc  '8'
	defb 02ah		;acbd  '*'
	defb 02ah		;acbe  '*'
	defb 038h		;acbf  '8'
	defb 011h		;acc0
	defb 0e3h		;acc1
	defb 0e3h		;acc2
	defb 0e3h		;acc3
	defb 0e3h		;acc4
	defb 0e3h		;acc5
	defb 0abh		;acc6
	defb 0abh		;acc7
	defb 0e3h		;acc8
	defb 019h		;acc9
	defb 0c7h		;acca
	defb 0c7h		;accb
	defb 0c7h		;accc
	defb 0c7h		;accd
	defb 0c7h		;acce
	defb 0d5h		;accf
	defb 0d5h		;acd0
	defb 0c7h		;acd1
	defb 031h		;acd2  '1'
	defb 018h		;acd3
	defb 018h		;acd4
	defb 018h		;acd5
	defb 018h		;acd6
	defb 018h		;acd7
	defb 05ah		;acd8  'Z'
	defb 05ah		;acd9  'Z'
	defb 018h		;acda
	defb 018h		;acdb
	defb 0f3h		;acdc
	defb 0f3h		;acdd
	defb 0f3h		;acde
	defb 0f3h		;acdf
	defb 0f3h		;ace0
	defb 093h		;ace1
	defb 093h		;ace2
	defb 0f3h		;ace3
	defb 010h		;ace4
	defb 0cfh		;ace5
	defb 0cfh		;ace6
	defb 0cfh		;ace7
	defb 0cfh		;ace8
	defb 0cfh		;ace9
	defb 0c9h		;acea
	defb 0c9h		;aceb
	defb 0cfh		;acec
	defb 028h		;aced  '('
	defb 000h		;acee
	defb 0ffh		;acef
	defb 0b5h		;acf0
	defb 0aah		;acf1
	defb 0b5h		;acf2
	defb 0aah		;acf3
	defb 0b5h		;acf4
	defb 000h		;acf5
	defb 028h		;acf6  '('
	defb 000h		;acf7
	defb 0f9h		;acf8
	defb 041h		;acf9  'A'
	defb 0a1h		;acfa
	defb 041h		;acfb  'A'
	defb 0a1h		;acfc
	defb 041h		;acfd  'A'
	defb 000h		;acfe
	defb 038h		;acff  '8'
	defb 0ffh		;ad00
	defb 0aah		;ad01
	defb 0b5h		;ad02
	defb 0aah		;ad03
	defb 0b5h		;ad04
	defb 0aah		;ad05
	defb 000h		;ad06
	defb 0ffh		;ad07
	defb 028h		;ad08  '('
	defb 0f9h		;ad09
	defb 0a1h		;ad0a
	defb 041h		;ad0b  'A'
	defb 0a1h		;ad0c
	defb 041h		;ad0d  'A'
	defb 0a1h		;ad0e
	defb 000h		;ad0f
	defb 0f9h		;ad10
	defb 038h		;ad11  '8'
	defb 0b5h		;ad12
	defb 0aah		;ad13
	defb 0b5h		;ad14
	defb 0aah		;ad15
	defb 0b5h		;ad16
	defb 000h		;ad17
	defb 0ffh		;ad18
	defb 0aah		;ad19
	defb 028h		;ad1a  '('
	defb 041h		;ad1b  'A'
	defb 0a1h		;ad1c
	defb 041h		;ad1d  'A'
	defb 0a1h		;ad1e
	defb 041h		;ad1f  'A'
	defb 000h		;ad20
	defb 0f9h		;ad21
	defb 0a1h		;ad22
	defb 038h		;ad23  '8'
	defb 0e3h		;ad24
	defb 0f7h		;ad25
	defb 0e3h		;ad26
	defb 0c9h		;ad27
	defb 0d1h		;ad28
	defb 0a8h		;ad29
	defb 090h		;ad2a
	defb 0beh		;ad2b
	defb 039h		;ad2c  '9'
	defb 090h		;ad2d
	defb 0b6h		;ad2e
	defb 090h		;ad2f
	defb 0beh		;ad30
	defb 090h		;ad31
	defb 0a0h		;ad32
	defb 090h		;ad33
	defb 0a0h		;ad34
	defb 039h		;ad35  '9'
	defb 090h		;ad36
	defb 0a0h		;ad37
	defb 090h		;ad38
	defb 0a0h		;ad39
	defb 090h		;ad3a
	defb 0a0h		;ad3b
	defb 090h		;ad3c
	defb 080h		;ad3d
	defb 039h		;ad3e  '9'
	defb 000h		;ad3f
	defb 000h		;ad40
	defb 004h		;ad41
	defb 002h		;ad42
	defb 000h		;ad43
	defb 000h		;ad44
	defb 000h		;ad45
	defb 006h		;ad46
	defb 00eh		;ad47
	defb 000h		;ad48
	defb 000h		;ad49
	defb 002h		;ad4a
	defb 00ch		;ad4b
	defb 000h		;ad4c
	defb 004h		;ad4d
	defb 002h		;ad4e
	defb 000h		;ad4f
	defb 00dh		;ad50
	defb 000h		;ad51
	defb 000h		;ad52
	defb 00ah		;ad53
	defb 010h		;ad54
	defb 000h		;ad55
	defb 00ah		;ad56
	defb 004h		;ad57
	defb 000h		;ad58
	defb 00fh		;ad59
; --- 8 zero bytes ---
	defb 000h		;ad5a
	defb 000h		;ad5b
	defb 000h		;ad5c
	defb 000h		;ad5d
	defb 000h		;ad5e
	defb 000h		;ad5f
	defb 000h		;ad60
	defb 000h		;ad61
	defb 008h		;ad62
	defb 000h		;ad63
	defb 000h		;ad64
	defb 040h		;ad65  '@'
	defb 030h		;ad66  '0'
	defb 000h		;ad67
	defb 000h		;ad68
	defb 040h		;ad69  '@'
	defb 000h		;ad6a
	defb 00eh		;ad6b
	defb 000h		;ad6c
	defb 030h		;ad6d  '0'
	defb 040h		;ad6e  '@'
	defb 020h		;ad6f  ' '
	defb 000h		;ad70
	defb 040h		;ad71  '@'
	defb 030h		;ad72  '0'
	defb 000h		;ad73
	defb 00dh		;ad74
	defb 000h		;ad75
	defb 000h		;ad76
	defb 028h		;ad77  '('
	defb 050h		;ad78  'P'
	defb 000h		;ad79
	defb 000h		;ad7a
	defb 060h		;ad7b  '`' (Spectrum: GBP)
	defb 018h		;ad7c
	defb 00fh		;ad7d
	defb 0ffh		;ad7e
	defb 080h		;ad7f
	defb 080h		;ad80
	defb 080h		;ad81
	defb 09fh		;ad82
	defb 090h		;ad83
	defb 090h		;ad84
	defb 090h		;ad85
	defb 028h		;ad86  '('
	defb 0ffh		;ad87
	defb 000h		;ad88
	defb 000h		;ad89
	defb 000h		;ad8a
	defb 0ffh		;ad8b
	defb 000h		;ad8c
	defb 000h		;ad8d
	defb 000h		;ad8e
	defb 028h		;ad8f  '('
	defb 0ffh		;ad90
	defb 000h		;ad91
	defb 000h		;ad92
	defb 000h		;ad93
	defb 0ffh		;ad94
	defb 008h		;ad95
	defb 008h		;ad96
	defb 008h		;ad97
	defb 028h		;ad98  '('
	defb 0ffh		;ad99
	defb 001h		;ad9a
	defb 001h		;ad9b
	defb 001h		;ad9c
	defb 0f9h		;ad9d
	defb 009h		;ad9e
	defb 009h		;ad9f
	defb 009h		;ada0
	defb 028h		;ada1  '('
	defb 090h		;ada2
	defb 090h		;ada3
	defb 090h		;ada4
	defb 090h		;ada5
	defb 090h		;ada6
	defb 090h		;ada7
	defb 090h		;ada8
	defb 090h		;ada9
	defb 028h		;adaa  '('
	defb 008h		;adab
	defb 008h		;adac
	defb 008h		;adad
	defb 008h		;adae
	defb 008h		;adaf
	defb 008h		;adb0
	defb 008h		;adb1
	defb 008h		;adb2
	defb 028h		;adb3  '('
; --- 8 zero bytes ---
	defb 000h		;adb4
	defb 000h		;adb5
	defb 000h		;adb6
	defb 000h		;adb7
	defb 000h		;adb8
	defb 000h		;adb9
	defb 000h		;adba
	defb 000h		;adbb
	defb 028h		;adbc  '('
	defb 009h		;adbd
	defb 009h		;adbe
	defb 009h		;adbf
	defb 009h		;adc0
	defb 009h		;adc1
	defb 009h		;adc2
	defb 009h		;adc3
	defb 009h		;adc4
	defb 028h		;adc5  '('
	defb 000h		;adc6
	defb 000h		;adc7
	defb 000h		;adc8
	defb 000h		;adc9
	defb 001h		;adca
	defb 000h		;adcb
	defb 000h		;adcc
	defb 000h		;adcd
	defb 028h		;adce  '('
	defb 008h		;adcf
	defb 008h		;add0
	defb 008h		;add1
	defb 06bh		;add2  'k'
	defb 0aah		;add3
	defb 06bh		;add4  'k'
	defb 06bh		;add5  'k'
	defb 008h		;add6
	defb 028h		;add7  '('
	defb 000h		;add8
	defb 000h		;add9
	defb 000h		;adda
	defb 000h		;addb
	defb 0c0h		;addc
	defb 000h		;addd
	defb 000h		;adde
	defb 000h		;addf
	defb 028h		;ade0  '('
	defb 09fh		;ade1
	defb 080h		;ade2
	defb 080h		;ade3
	defb 080h		;ade4
	defb 080h		;ade5
	defb 080h		;ade6
	defb 080h		;ade7
	defb 080h		;ade8
	defb 028h		;ade9  '('
	defb 0ffh		;adea
	defb 000h		;adeb
	defb 000h		;adec
	defb 000h		;aded
	defb 000h		;adee
	defb 000h		;adef
	defb 000h		;adf0
	defb 000h		;adf1
	defb 028h		;adf2  '('
	defb 0f9h		;adf3
	defb 001h		;adf4
	defb 001h		;adf5
	defb 001h		;adf6
	defb 001h		;adf7
	defb 001h		;adf8
	defb 001h		;adf9
	defb 001h		;adfa
	defb 028h		;adfb  '('
; --- 8 zero bytes ---
	defb 000h		;adfc
	defb 000h		;adfd
	defb 000h		;adfe
	defb 000h		;adff
	defb 000h		;ae00
	defb 000h		;ae01
	defb 000h		;ae02
	defb 000h		;ae03
	defb 0f2h		;ae04
	defb 0aah		;ae05
; "U??;7>=9"
	defb 055h		;ae06  'U'
	defb 03fh		;ae07  '?'
	defb 03fh		;ae08  '?'
	defb 03bh		;ae09  ';'
	defb 037h		;ae0a  '7'
	defb 03eh		;ae0b  '>'
	defb 03dh		;ae0c  '='
	defb 039h		;ae0d  '9'
	defb 0aah		;ae0e
	defb 055h		;ae0f  'U'
	defb 0ffh		;ae10
	defb 0ffh		;ae11
	defb 0bfh		;ae12
	defb 07fh		;ae13
	defb 0ffh		;ae14
	defb 0ffh		;ae15
	defb 039h		;ae16  '9'
	defb 0aah		;ae17
	defb 055h		;ae18  'U'
	defb 0feh		;ae19
	defb 0fdh		;ae1a
	defb 0feh		;ae1b
	defb 0fdh		;ae1c
	defb 0feh		;ae1d
	defb 0fdh		;ae1e
; "9;?????@"
	defb 039h		;ae1f  '9'
	defb 03bh		;ae20  ';'
	defb 03fh		;ae21  '?'
	defb 03fh		;ae22  '?'
	defb 03fh		;ae23  '?'
	defb 03fh		;ae24  '?'
	defb 03fh		;ae25  '?'
	defb 040h		;ae26  '@'
	defb 080h		;ae27
	defb 039h		;ae28  '9'
	defb 0ffh		;ae29
	defb 0ffh		;ae2a
	defb 0ffh		;ae2b
	defb 0ffh		;ae2c
	defb 0ffh		;ae2d
	defb 0ffh		;ae2e
	defb 000h		;ae2f
	defb 000h		;ae30
	defb 039h		;ae31  '9'
	defb 0feh		;ae32
	defb 0fdh		;ae33
	defb 0feh		;ae34
	defb 0fdh		;ae35
	defb 0feh		;ae36
	defb 0fdh		;ae37
	defb 002h		;ae38
	defb 001h		;ae39
; "9 @@@@@ "
	defb 039h		;ae3a  '9'
	defb 020h		;ae3b  ' '
	defb 040h		;ae3c  '@'
	defb 040h		;ae3d  '@'
	defb 040h		;ae3e  '@'
	defb 040h		;ae3f  '@'
	defb 040h		;ae40  '@'
	defb 020h		;ae41  ' '
	defb 0e0h		;ae42
	defb 014h		;ae43
	defb 005h		;ae44
	defb 003h		;ae45
	defb 003h		;ae46
	defb 003h		;ae47
	defb 003h		;ae48
	defb 003h		;ae49
	defb 005h		;ae4a
	defb 007h		;ae4b
	defb 014h		;ae4c
	defb 0ffh		;ae4d
	defb 080h		;ae4e
	defb 080h		;ae4f
	defb 0ffh		;ae50
	defb 080h		;ae51
	defb 080h		;ae52
	defb 080h		;ae53
	defb 080h		;ae54
	defb 028h		;ae55  '('
	defb 0ffh		;ae56
	defb 000h		;ae57
	defb 000h		;ae58
	defb 0ffh		;ae59
	defb 002h		;ae5a
	defb 002h		;ae5b
	defb 002h		;ae5c
	defb 003h		;ae5d
	defb 028h		;ae5e  '('
	defb 0ffh		;ae5f
	defb 000h		;ae60
	defb 000h		;ae61
	defb 0ffh		;ae62
	defb 000h		;ae63
	defb 000h		;ae64
	defb 000h		;ae65
	defb 0ffh		;ae66
	defb 028h		;ae67  '('
	defb 0ffh		;ae68
	defb 000h		;ae69
	defb 000h		;ae6a
	defb 0ffh		;ae6b
	defb 040h		;ae6c  '@'
	defb 040h		;ae6d  '@'
	defb 040h		;ae6e  '@'
	defb 0c0h		;ae6f
	defb 028h		;ae70  '('
	defb 0ffh		;ae71
	defb 001h		;ae72
	defb 001h		;ae73
	defb 0ffh		;ae74
	defb 001h		;ae75
	defb 001h		;ae76
	defb 001h		;ae77
	defb 001h		;ae78
	defb 028h		;ae79  '('
	defb 080h		;ae7a
	defb 080h		;ae7b
	defb 080h		;ae7c
	defb 080h		;ae7d
	defb 080h		;ae7e
	defb 080h		;ae7f
	defb 080h		;ae80
	defb 0ffh		;ae81
	defb 028h		;ae82  '('
	defb 002h		;ae83
	defb 002h		;ae84
	defb 002h		;ae85
	defb 002h		;ae86
	defb 002h		;ae87
	defb 002h		;ae88
	defb 002h		;ae89
	defb 0feh		;ae8a
	defb 028h		;ae8b  '('
	defb 0f0h		;ae8c
	defb 050h		;ae8d  'P'
	defb 060h		;ae8e  '`' (Spectrum: GBP)
	defb 07fh		;ae8f
	defb 040h		;ae90  '@'
	defb 080h		;ae91
	defb 080h		;ae92
	defb 0c0h		;ae93
	defb 014h		;ae94
	defb 00fh		;ae95
	defb 00dh		;ae96
	defb 005h		;ae97
	defb 0fdh		;ae98
	defb 003h		;ae99
	defb 001h		;ae9a
	defb 001h		;ae9b
	defb 003h		;ae9c
	defb 014h		;ae9d
; "@@@@@@@"
	defb 040h		;ae9e  '@'
	defb 040h		;ae9f  '@'
	defb 040h		;aea0  '@'
	defb 040h		;aea1  '@'
	defb 040h		;aea2  '@'
	defb 040h		;aea3  '@'
	defb 040h		;aea4  '@'
	defb 07fh		;aea5
	defb 028h		;aea6  '('
	defb 001h		;aea7
	defb 001h		;aea8
	defb 001h		;aea9
	defb 001h		;aeaa
	defb 001h		;aeab
	defb 001h		;aeac
	defb 001h		;aead
	defb 0ffh		;aeae
	defb 028h		;aeaf  '('
	defb 0c3h		;aeb0
	defb 081h		;aeb1
	defb 0a1h		;aeb2
	defb 0a1h		;aeb3
	defb 0b9h		;aeb4
	defb 081h		;aeb5
	defb 0fdh		;aeb6
	defb 001h		;aeb7
	defb 020h		;aeb8  ' '
	defb 0c2h		;aeb9
	defb 082h		;aeba
	defb 0a2h		;aebb
	defb 0a2h		;aebc
	defb 0bah		;aebd
	defb 082h		;aebe
	defb 0beh		;aebf
	defb 080h		;aec0
; " prrrrrvp "
	defb 020h		;aec1  ' '
	defb 070h		;aec2  'p'
	defb 072h		;aec3  'r'
	defb 072h		;aec4  'r'
	defb 072h		;aec5  'r'
	defb 072h		;aec6  'r'
	defb 072h		;aec7  'r'
	defb 076h		;aec8  'v'
	defb 070h		;aec9  'p'
	defb 020h		;aeca  ' '
	defb 0fdh		;aecb
	defb 081h		;aecc
	defb 0a1h		;aecd
	defb 0a1h		;aece
	defb 0b9h		;aecf
	defb 081h		;aed0
	defb 0e3h		;aed1
	defb 01fh		;aed2
	defb 020h		;aed3  ' '
	defb 0beh		;aed4
	defb 082h		;aed5
	defb 0a2h		;aed6
	defb 0a2h		;aed7
	defb 0bah		;aed8
	defb 082h		;aed9
	defb 0c6h		;aeda
	defb 0f8h		;aedb
	defb 020h		;aedc  ' '
	defb 00eh		;aedd
	defb 08eh		;aede
	defb 0aeh		;aedf
	defb 0aeh		;aee0
	defb 0aeh		;aee1
	defb 08eh		;aee2
	defb 0eeh		;aee3
	defb 00eh		;aee4
	defb 020h		;aee5  ' '
	defb 0e5h		;aee6
	defb 0e5h		;aee7
	defb 0e5h		;aee8
	defb 0e5h		;aee9
	defb 0e5h		;aeea
	defb 0e5h		;aeeb
	defb 0e5h		;aeec
	defb 0e5h		;aeed
	defb 010h		;aeee
	defb 001h		;aeef
	defb 001h		;aef0
	defb 001h		;aef1
	defb 001h		;aef2
	defb 001h		;aef3
	defb 001h		;aef4
	defb 001h		;aef5
	defb 001h		;aef6
	defb 008h		;aef7
	defb 003h		;aef8
	defb 003h		;aef9
	defb 003h		;aefa
	defb 003h		;aefb
	defb 007h		;aefc
	defb 007h		;aefd
	defb 00fh		;aefe
	defb 01fh		;aeff
	defb 008h		;af00
	defb 0c0h		;af01
	defb 0bfh		;af02
	defb 0dfh		;af03
	defb 0afh		;af04
	defb 0d7h		;af05
	defb 0abh		;af06
	defb 0d4h		;af07
	defb 0ach		;af08
	defb 008h		;af09
	defb 000h		;af0a
	defb 0ffh		;af0b
	defb 0ffh		;af0c
	defb 0ffh		;af0d
	defb 0ffh		;af0e
	defb 0ffh		;af0f
	defb 000h		;af10
	defb 000h		;af11
	defb 008h		;af12
	defb 001h		;af13
	defb 0fch		;af14
	defb 0fah		;af15
	defb 0f6h		;af16
	defb 0eeh		;af17
	defb 0deh		;af18
	defb 03eh		;af19  '>'
	defb 03eh		;af1a  '>'
	defb 008h		;af1b
	defb 0d4h		;af1c
	defb 0ach		;af1d
	defb 0d4h		;af1e
	defb 0ach		;af1f
	defb 0d4h		;af20
	defb 0ach		;af21
	defb 0d4h		;af22
	defb 0ach		;af23
	defb 008h		;af24
; ">>>>>>>>"
	defb 03eh		;af25  '>'
	defb 03eh		;af26  '>'
	defb 03eh		;af27  '>'
	defb 03eh		;af28  '>'
	defb 03eh		;af29  '>'
	defb 03eh		;af2a  '>'
	defb 03eh		;af2b  '>'
	defb 03eh		;af2c  '>'
	defb 008h		;af2d
	defb 0d4h		;af2e
	defb 0ach		;af2f
	defb 0d7h		;af30
	defb 0aeh		;af31
	defb 0ddh		;af32
	defb 0bah		;af33
	defb 0f5h		;af34
	defb 0ffh		;af35
	defb 008h		;af36
	defb 000h		;af37
	defb 000h		;af38
	defb 0ffh		;af39
	defb 0aah		;af3a
	defb 055h		;af3b  'U'
	defb 0aah		;af3c
	defb 055h		;af3d  'U'
	defb 0ffh		;af3e
	defb 008h		;af3f
	defb 03eh		;af40  '>'
	defb 03eh		;af41  '>'
	defb 0deh		;af42
	defb 0aeh		;af43
	defb 056h		;af44  'V'
	defb 0aah		;af45
	defb 055h		;af46  'U'
	defb 0ffh		;af47
	defb 008h		;af48
	defb 0dfh		;af49
	defb 0bfh		;af4a
	defb 060h		;af4b  '`' (Spectrum: GBP)
	defb 0cch		;af4c
	defb 0d0h		;af4d
	defb 0d0h		;af4e
	defb 0c0h		;af4f
	defb 0c1h		;af50
	defb 028h		;af51  '('
	defb 0ffh		;af52
	defb 0ffh		;af53
	defb 000h		;af54
	defb 066h		;af55  'f'
	defb 044h		;af56  'D'
	defb 000h		;af57
	defb 0ffh		;af58
	defb 000h		;af59
	defb 028h		;af5a  '('
	defb 0fah		;af5b
	defb 0fch		;af5c
	defb 002h		;af5d
	defb 00dh		;af5e
	defb 011h		;af5f
	defb 011h		;af60
	defb 001h		;af61
	defb 081h		;af62
	defb 028h		;af63  '('
	defb 0dah		;af64
	defb 0d2h		;af65
	defb 0d2h		;af66
	defb 0c2h		;af67
	defb 0dah		;af68
	defb 0d2h		;af69
	defb 0d2h		;af6a
	defb 0c2h		;af6b
	defb 028h		;af6c  '('
	defb 0cdh		;af6d
	defb 0c9h		;af6e
	defb 0c9h		;af6f
	defb 0c1h		;af70
	defb 0cdh		;af71
	defb 0c9h		;af72
	defb 0c9h		;af73
	defb 0c1h		;af74
	defb 028h		;af75  '('
	defb 0c1h		;af76
	defb 0cch		;af77
	defb 0d0h		;af78
	defb 0d0h		;af79
	defb 0c0h		;af7a
	defb 060h		;af7b  '`' (Spectrum: GBP)
	defb 0bfh		;af7c
	defb 000h		;af7d
	defb 028h		;af7e  '('
	defb 0ffh		;af7f
	defb 0ffh		;af80
	defb 000h		;af81
	defb 066h		;af82  'f'
	defb 044h		;af83  'D'
	defb 000h		;af84
	defb 0ffh		;af85
	defb 080h		;af86
	defb 028h		;af87  '('
	defb 081h		;af88
	defb 00dh		;af89
	defb 011h		;af8a
	defb 011h		;af8b
	defb 002h		;af8c
	defb 004h		;af8d
	defb 0fah		;af8e
	defb 000h		;af8f
	defb 028h		;af90  '('
	defb 0ffh		;af91
	defb 0dfh		;af92
	defb 0f7h		;af93
	defb 0feh		;af94
	defb 0ffh		;af95
	defb 0ffh		;af96
	defb 0ffh		;af97
	defb 0ffh		;af98
	defb 038h		;af99  '8'
	defb 0ffh		;af9a
	defb 0aah		;af9b
	defb 0ffh		;af9c
	defb 07fh		;af9d
	defb 0ffh		;af9e
	defb 0ffh		;af9f
	defb 0ffh		;afa0
	defb 0ffh		;afa1
	defb 028h		;afa2  '('
	defb 0ffh		;afa3
	defb 0efh		;afa4
	defb 0aeh		;afa5
	defb 0aah		;afa6
	defb 0ffh		;afa7
	defb 0ffh		;afa8
	defb 0ffh		;afa9
	defb 0ffh		;afaa
	defb 010h		;afab
	defb 0ffh		;afac
	defb 0bdh		;afad
	defb 0ffh		;afae
	defb 0fdh		;afaf
	defb 0ffh		;afb0
	defb 0ffh		;afb1
	defb 0ffh		;afb2
	defb 0ffh		;afb3
	defb 030h		;afb4  '0'
lafb5h:
	defb 0ffh		;afb5
	defb 0e0h		;afb6
	defb 0dfh		;afb7
	defb 0dfh		;afb8
	defb 0dfh		;afb9
	defb 0dfh		;afba
	defb 0d8h		;afbb
	defb 0d8h		;afbc
	defb 008h		;afbd
	defb 0ffh		;afbe
	defb 00fh		;afbf
	defb 0ffh		;afc0
	defb 0ffh		;afc1
	defb 0ffh		;afc2
	defb 0ffh		;afc3
	defb 000h		;afc4
	defb 0aah		;afc5
	defb 008h		;afc6
	defb 0feh		;afc7
	defb 0fdh		;afc8
	defb 0fah		;afc9
	defb 0efh		;afca
	defb 0fah		;afcb
	defb 0f5h		;afcc
	defb 0feh		;afcd
	defb 0fdh		;afce
; "  @ "
	defb 020h		;afcf  ' '
	defb 020h		;afd0  ' '
	defb 040h		;afd1  '@'
	defb 020h		;afd2  ' '
	defb 000h		;afd3
	defb 082h		;afd4
	defb 005h		;afd5
	defb 0aah		;afd6
	defb 051h		;afd7  'Q'
	defb 020h		;afd8  ' '
	defb 0dfh		;afd9
	defb 0dbh		;afda
	defb 0dfh		;afdb
	defb 0dbh		;afdc
	defb 0dfh		;afdd
	defb 0dah		;afde
	defb 0d8h		;afdf
	defb 0d8h		;afe0
	defb 008h		;afe1
	defb 054h		;afe2  'T'
	defb 0aah		;afe3
	defb 0d4h		;afe4
	defb 0aah		;afe5
	defb 0d4h		;afe6
	defb 0aah		;afe7
	defb 004h		;afe8
	defb 002h		;afe9
	defb 008h		;afea
	defb 0dfh		;afeb
	defb 0ffh		;afec
	defb 0dfh		;afed
	defb 0ffh		;afee
	defb 0dfh		;afef
	defb 0ebh		;aff0
	defb 0d5h		;aff1
	defb 0eah		;aff2
	defb 008h		;aff3
	defb 0c3h		;aff4
	defb 0f0h		;aff5
	defb 0f8h		;aff6
	defb 0f8h		;aff7
	defb 0f8h		;aff8
	defb 0f8h		;aff9
	defb 0f8h		;affa
	defb 0f8h		;affb
	defb 010h		;affc
	defb 01fh		;affd
	defb 05fh		;affe  '_'
	defb 09fh		;afff
	defb 040h		;b000  '@'
	defb 0fch		;b001
	defb 053h		;b002  'S'
	defb 0f0h		;b003
	defb 003h		;b004
	defb 020h		;b005  ' '
	defb 0ffh		;b006
	defb 0ffh		;b007
	defb 0ffh		;b008
	defb 000h		;b009
	defb 0ffh		;b00a
	defb 057h		;b00b  'W'
	defb 02ah		;b00c  '*'
	defb 014h		;b00d
	defb 020h		;b00e  ' '
	defb 0c0h		;b00f
	defb 0c7h		;b010
	defb 0c0h		;b011
	defb 020h		;b012  ' '
	defb 0ffh		;b013
	defb 0e0h		;b014
	defb 01fh		;b015
	defb 000h		;b016
	defb 020h		;b017  ' '
	defb 007h		;b018
	defb 00fh		;b019
	defb 00fh		;b01a
	defb 01fh		;b01b
	defb 01fh		;b01c
	defb 007h		;b01d
	defb 000h		;b01e
	defb 000h		;b01f
	defb 022h		;b020  '"'
	defb 0beh		;b021
	defb 0ffh		;b022
	defb 0b7h		;b023
	defb 0edh		;b024
	defb 0ffh		;b025
	defb 07fh		;b026
	defb 0dbh		;b027
	defb 0ffh		;b028
	defb 078h		;b029  'x'
	defb 0fbh		;b02a
	defb 0dfh		;b02b
	defb 0ffh		;b02c
	defb 0b7h		;b02d
	defb 0feh		;b02e
	defb 0efh		;b02f
	defb 0fbh		;b030
	defb 07fh		;b031
	defb 078h		;b032  'x'
	defb 0efh		;b033
	defb 0bfh		;b034
	defb 0f5h		;b035
	defb 07fh		;b036
	defb 0ffh		;b037
	defb 0d6h		;b038
	defb 0ffh		;b039
	defb 0bdh		;b03a
	defb 078h		;b03b  'x'
	defb 0ffh		;b03c
	defb 0f0h		;b03d
	defb 080h		;b03e
	defb 080h		;b03f
	defb 080h		;b040
	defb 080h		;b041
	defb 080h		;b042
	defb 080h		;b043
	defb 038h		;b044  '8'
	defb 083h		;b045
	defb 00bh		;b046
	defb 00bh		;b047
	defb 00bh		;b048
	defb 003h		;b049
	defb 003h		;b04a
	defb 003h		;b04b
	defb 003h		;b04c
	defb 038h		;b04d  '8'
	defb 0f0h		;b04e
	defb 0ffh		;b04f
	defb 0f0h		;b050
	defb 0ffh		;b051
	defb 080h		;b052
	defb 080h		;b053
	defb 080h		;b054
	defb 0ffh		;b055
	defb 038h		;b056  '8'
	defb 00bh		;b057
	defb 083h		;b058
	defb 0ffh		;b059
	defb 0ffh		;b05a
	defb 01fh		;b05b
	defb 013h		;b05c
	defb 011h		;b05d
	defb 0ffh		;b05e
	defb 038h		;b05f  '8'
	defb 0ffh		;b060
	defb 085h		;b061
	defb 085h		;b062
	defb 085h		;b063
	defb 0ffh		;b064
	defb 0cbh		;b065
	defb 0cbh		;b066
	defb 0cbh		;b067
	defb 010h		;b068
	defb 0e3h		;b069
	defb 0e3h		;b06a
	defb 088h		;b06b
	defb 094h		;b06c
	defb 088h		;b06d
	defb 0e3h		;b06e
	defb 0e3h		;b06f
	defb 0ffh		;b070
	defb 018h		;b071
; "4$4$4$4$"
	defb 034h		;b072  '4'
	defb 024h		;b073  '$'
	defb 034h		;b074  '4'
	defb 024h		;b075  '$'
	defb 034h		;b076  '4'
	defb 024h		;b077  '$'
	defb 034h		;b078  '4'
	defb 024h		;b079  '$'
	defb 008h		;b07a
	defb 081h		;b07b
	defb 081h		;b07c
	defb 0ffh		;b07d
	defb 081h		;b07e
	defb 081h		;b07f
	defb 0ffh		;b080
	defb 091h		;b081
	defb 0ffh		;b082
	defb 051h		;b083  'Q'
; --- 8 zero bytes ---
	defb 000h		;b084
	defb 000h		;b085
	defb 000h		;b086
	defb 000h		;b087
	defb 000h		;b088
	defb 000h		;b089
	defb 000h		;b08a
	defb 000h		;b08b
	defb 038h		;b08c  '8'
	defb 000h		;b08d
	defb 000h		;b08e
	defb 001h		;b08f
	defb 003h		;b090
	defb 006h		;b091
	defb 067h		;b092  'g'
	defb 0ffh		;b093
	defb 0ffh		;b094
	defb 00dh		;b095
	defb 062h		;b096  'b'
	defb 0efh		;b097
	defb 0ffh		;b098
	defb 05fh		;b099  '_'
	defb 0cfh		;b09a
	defb 067h		;b09b  'g'
	defb 0d6h		;b09c
	defb 0e4h		;b09d
	defb 00dh		;b09e
	defb 000h		;b09f
	defb 088h		;b0a0
	defb 08ch		;b0a1
	defb 080h		;b0a2
	defb 000h		;b0a3
	defb 006h		;b0a4
	defb 00fh		;b0a5
	defb 09fh		;b0a6
	defb 00ch		;b0a7
	defb 000h		;b0a8
	defb 004h		;b0a9
	defb 002h		;b0aa
	defb 047h		;b0ab  'G'
	defb 08fh		;b0ac
	defb 07fh		;b0ad
	defb 0dfh		;b0ae
	defb 0dfh		;b0af
	defb 00eh		;b0b0
	defb 000h		;b0b1
	defb 000h		;b0b2
	defb 000h		;b0b3
	defb 030h		;b0b4  '0'
	defb 020h		;b0b5  ' '
	defb 0f8h		;b0b6
	defb 0feh		;b0b7
	defb 0fch		;b0b8
	defb 00eh		;b0b9
	defb 07fh		;b0ba
	defb 00fh		;b0bb
	defb 007h		;b0bc
	defb 007h		;b0bd
	defb 007h		;b0be
	defb 003h		;b0bf
	defb 040h		;b0c0  '@'
	defb 000h		;b0c1
	defb 00dh		;b0c2
	defb 0a0h		;b0c3
	defb 0f0h		;b0c4
	defb 0f8h		;b0c5
	defb 0e0h		;b0c6
	defb 0c8h		;b0c7
	defb 040h		;b0c8  '@'
	defb 0a0h		;b0c9
	defb 078h		;b0ca  'x'
	defb 00dh		;b0cb
; "/o?g3}~"
	defb 02fh		;b0cc  '/'
	defb 06fh		;b0cd  'o'
	defb 03fh		;b0ce  '?'
	defb 067h		;b0cf  'g'
	defb 033h		;b0d0  '3'
	defb 07dh		;b0d1  '}'
	defb 07eh		;b0d2  '~'
	defb 07fh		;b0d3
	defb 00ch		;b0d4
	defb 0bfh		;b0d5
	defb 0bfh		;b0d6
	defb 07fh		;b0d7
	defb 0ffh		;b0d8
	defb 0ffh		;b0d9
	defb 0ffh		;b0da
	defb 0b6h		;b0db
	defb 015h		;b0dc
	defb 00eh		;b0dd
	defb 0f0h		;b0de
	defb 0eah		;b0df
	defb 0d0h		;b0e0
	defb 0c0h		;b0e1
	defb 0a0h		;b0e2
	defb 040h		;b0e3  '@'
	defb 000h		;b0e4
	defb 000h		;b0e5
	defb 00eh		;b0e6
	defb 009h		;b0e7
	defb 000h		;b0e8
	defb 008h		;b0e9
	defb 05dh		;b0ea  ']'
	defb 008h		;b0eb
	defb 000h		;b0ec
	defb 008h		;b0ed
	defb 000h		;b0ee
	defb 00fh		;b0ef
	defb 03ch		;b0f0  '<'
	defb 03eh		;b0f1  '>'
	defb 01eh		;b0f2
	defb 01ch		;b0f3
	defb 018h		;b0f4
	defb 020h		;b0f5  ' '
	defb 030h		;b0f6  '0'
	defb 000h		;b0f7
	defb 00ch		;b0f8
	defb 01eh		;b0f9
	defb 00eh		;b0fa
	defb 00eh		;b0fb
	defb 00dh		;b0fc
	defb 000h		;b0fd
	defb 000h		;b0fe
	defb 000h		;b0ff
	defb 000h		;b100
	defb 00ch		;b101
	defb 002h		;b102
	defb 001h		;b103
	defb 080h		;b104
	defb 001h		;b105
	defb 000h		;b106
	defb 000h		;b107
	defb 000h		;b108
	defb 000h		;b109
	defb 00ch		;b10a
	defb 090h		;b10b
	defb 060h		;b10c  '`' (Spectrum: GBP)
	defb 0e4h		;b10d
	defb 0f0h		;b10e
	defb 0a0h		;b10f
	defb 002h		;b110
	defb 004h		;b111
	defb 000h		;b112
	defb 00dh		;b113
lb114h:
	defb 07fh		;b114
	defb 001h		;b115
	defb 0efh		;b116
	defb 001h		;b117
	defb 0f7h		;b118
	defb 001h		;b119
	defb 0f7h		;b11a
	defb 002h		;b11b
	defb 0f7h		;b11c
	defb 004h		;b11d
	defb 0f7h		;b11e
	defb 008h		;b11f
	defb 0f7h		;b120
	defb 010h		;b121
	defb 0efh		;b122
	defb 010h		;b123
	defb 0efh		;b124
	defb 008h		;b125
	defb 0efh		;b126
	defb 004h		;b127
	defb 0efh		;b128
	defb 002h		;b129
	defb 0fdh		;b12a
	defb 001h		;b12b
	defb 07fh		;b12c
	defb 010h		;b12d
	defb 0feh		;b12e
	defb 008h		;b12f
	defb 0fdh		;b130
	defb 004h		;b131
	defb 0fbh		;b132
	defb 004h		;b133
	defb 0fdh		;b134
	defb 008h		;b135
	defb 0fdh		;b136
	defb 010h		;b137
	defb 0bfh		;b138
	defb 010h		;b139
	defb 0dfh		;b13a
	defb 004h		;b13b
	defb 0bfh		;b13c
	defb 008h		;b13d
	defb 0bfh		;b13e
	defb 004h		;b13f
	defb 0bfh		;b140
	defb 002h		;b141
	defb 07fh		;b142
	defb 004h		;b143
	defb 07fh		;b144
	defb 008h		;b145
	defb 0dfh		;b146
	defb 002h		;b147
	defb 0dfh		;b148
	defb 001h		;b149
	defb 0fbh		;b14a
	defb 001h		;b14b
	defb 0fbh		;b14c
	defb 008h		;b14d
	defb 0fdh		;b14e
	defb 002h		;b14f
	defb 0fbh		;b150
	defb 010h		;b151
	defb 0dfh		;b152
	defb 008h		;b153
	defb 0feh		;b154
	defb 010h		;b155
	defb 0fbh		;b156
	defb 002h		;b157
	defb 0feh		;b158
	defb 004h		;b159
	defb 0dfh		;b15a
	defb 010h		;b15b
	defb 0feh		;b15c
	defb 002h		;b15d
lb15eh:
	defb 00ah		;b15e
	defb 000h		;b15f
	defb 00ah		;b160
	defb 008h		;b161
	defb 00ah		;b162
	defb 000h		;b163
	defb 008h		;b164
	defb 000h		;b165
	defb 008h		;b166
	defb 008h		;b167
	defb 009h		;b168
	defb 000h		;b169
	defb 009h		;b16a
	defb 008h		;b16b
	defb 009h		;b16c
	defb 000h		;b16d
	defb 0ffh		;b16e
	defb 080h		;b16f
	defb 09eh		;b170
	defb 0f1h		;b171
	defb 091h		;b172
	defb 020h		;b173  ' '
	defb 020h		;b174  ' '
	defb 0ffh		;b175
	defb 038h		;b176  '8'
; --- 9 zero bytes ---
	defb 000h		;b177
	defb 000h		;b178
	defb 000h		;b179
	defb 000h		;b17a
	defb 000h		;b17b
	defb 000h		;b17c
	defb 000h		;b17d
	defb 000h		;b17e
	defb 000h		;b17f
	defb 013h		;b180
	defb 005h		;b181
	defb 013h		;b182
	defb 005h		;b183
	defb 013h		;b184
	defb 005h		;b185
	defb 013h		;b186
	defb 005h		;b187
	defb 028h		;b188  '('
; --- 9 zero bytes ---
	defb 000h		;b189
	defb 000h		;b18a
	defb 000h		;b18b
	defb 000h		;b18c
	defb 000h		;b18d
	defb 000h		;b18e
	defb 000h		;b18f
	defb 000h		;b190
	defb 000h		;b191
; "degggggg9&"
	defb 064h		;b192  'd'
	defb 065h		;b193  'e'
	defb 067h		;b194  'g'
	defb 067h		;b195  'g'
	defb 067h		;b196  'g'
	defb 067h		;b197  'g'
	defb 067h		;b198  'g'
	defb 067h		;b199  'g'
	defb 039h		;b19a  '9'
	defb 026h		;b19b  '&'
	defb 0a6h		;b19c
	defb 0e6h		;b19d
	defb 0e6h		;b19e
	defb 0e6h		;b19f
	defb 0e6h		;b1a0
	defb 0e6h		;b1a1
	defb 0e6h		;b1a2
	defb 039h		;b1a3  '9'
	defb 0fch		;b1a4
	defb 0fdh		;b1a5
	defb 07fh		;b1a6
	defb 07fh		;b1a7
	defb 07fh		;b1a8
	defb 03fh		;b1a9  '?'
	defb 00fh		;b1aa
	defb 007h		;b1ab
	defb 00ah		;b1ac
	defb 0beh		;b1ad
	defb 0c2h		;b1ae
	defb 0e2h		;b1af
	defb 0f2h		;b1b0
	defb 0fah		;b1b1
	defb 0fch		;b1b2
	defb 0feh		;b1b3
	defb 0ffh		;b1b4
	defb 020h		;b1b5  ' '
	defb 0fdh		;b1b6
	defb 083h		;b1b7
	defb 0a7h		;b1b8
	defb 0afh		;b1b9
	defb 09fh		;b1ba
	defb 0bfh		;b1bb
	defb 07fh		;b1bc
	defb 0ffh		;b1bd
	defb 020h		;b1be  ' '
; --- 9 zero bytes ---
	defb 000h		;b1bf
	defb 000h		;b1c0
	defb 000h		;b1c1
	defb 000h		;b1c2
	defb 000h		;b1c3
	defb 000h		;b1c4
	defb 000h		;b1c5
	defb 000h		;b1c6
	defb 000h		;b1c7
	defb 0ffh		;b1c8
	defb 07fh		;b1c9
	defb 0bfh		;b1ca
	defb 09fh		;b1cb
	defb 0afh		;b1cc
	defb 087h		;b1cd
	defb 0fbh		;b1ce
	defb 001h		;b1cf
	defb 022h		;b1d0  '"'
	defb 0ffh		;b1d1
	defb 0feh		;b1d2
	defb 0fch		;b1d3
	defb 0fah		;b1d4
	defb 0f2h		;b1d5
	defb 0e2h		;b1d6
	defb 0deh		;b1d7
	defb 080h		;b1d8
	defb 022h		;b1d9  '"'
	defb 000h		;b1da
	defb 000h		;b1db
	defb 000h		;b1dc
	defb 000h		;b1dd
	defb 000h		;b1de
	defb 000h		;b1df
	defb 000h		;b1e0
	defb 0ffh		;b1e1
	defb 068h		;b1e2  'h'
	defb 000h		;b1e3
	defb 000h		;b1e4
	defb 000h		;b1e5
	defb 000h		;b1e6
	defb 000h		;b1e7
	defb 000h		;b1e8
	defb 000h		;b1e9
	defb 0ffh		;b1ea
	defb 028h		;b1eb  '('
	defb 0e0h		;b1ec
	defb 0e0h		;b1ed
	defb 0e0h		;b1ee
	defb 0e0h		;b1ef
	defb 0e0h		;b1f0
lb1f1h:
	defb 0e0h		;b1f1
	defb 0e0h		;b1f2
	defb 0e0h		;b1f3
	defb 06fh		;b1f4  'o'
	defb 007h		;b1f5
	defb 007h		;b1f6
	defb 007h		;b1f7
	defb 007h		;b1f8
	defb 007h		;b1f9
	defb 007h		;b1fa
	defb 007h		;b1fb
	defb 007h		;b1fc
	defb 028h		;b1fd  '('
	defb 07fh		;b1fe
	defb 07fh		;b1ff
	defb 03fh		;b200  '?'
	defb 03fh		;b201  '?'
	defb 037h		;b202  '7'
	defb 0b3h		;b203
	defb 012h		;b204
	defb 000h		;b205
lb206h:
	defb 008h		;b206
	defb 04fh		;b207  'O'
	defb 090h		;b208
	defb 0f2h		;b209
	defb 0feh		;b20a
	defb 0feh		;b20b
	defb 0bfh		;b20c
	defb 0bfh		;b20d
	defb 0fbh		;b20e
	defb 008h		;b20f
	defb 0feh		;b210
	defb 0f4h		;b211
	defb 0ffh		;b212
	defb 0ffh		;b213
	defb 0feh		;b214
	defb 0f0h		;b215
	defb 0e0h		;b216
	defb 0fch		;b217
	defb 008h		;b218
	defb 0ffh		;b219
	defb 0ffh		;b21a
	defb 088h		;b21b
	defb 0feh		;b21c
	defb 0ffh		;b21d
	defb 0fch		;b21e
	defb 0dfh		;b21f
	defb 0feh		;b220
	defb 008h		;b221
	defb 0e0h		;b222
	defb 01eh		;b223
	defb 0feh		;b224
	defb 0feh		;b225
	defb 000h		;b226
	defb 0fch		;b227
	defb 0feh		;b228
	defb 0feh		;b229
	defb 008h		;b22a
	defb 0fdh		;b22b
	defb 0d8h		;b22c
	defb 038h		;b22d  '8'
	defb 010h		;b22e
	defb 037h		;b22f  '7'
	defb 014h		;b230
	defb 004h		;b231
	defb 004h		;b232
	defb 008h		;b233
	defb 07fh		;b234
	defb 017h		;b235
	defb 04eh		;b236  'N'
	defb 016h		;b237
	defb 0cch		;b238
	defb 014h		;b239
	defb 00ch		;b23a
	defb 008h		;b23b
	defb 008h		;b23c
	defb 05eh		;b23d  '^'
	defb 06ch		;b23e  'l'
	defb 08ch		;b23f
	defb 040h		;b240  '@'
	defb 0ffh		;b241
	defb 004h		;b242
	defb 004h		;b243
	defb 004h		;b244
	defb 008h		;b245
	defb 0ffh		;b246
	defb 0bfh		;b247
	defb 0ffh		;b248
	defb 0dfh		;b249
	defb 09eh		;b24a
	defb 05eh		;b24b  '^'
	defb 03eh		;b24c  '>'
	defb 05eh		;b24d  '^'
	defb 008h		;b24e
	defb 0ffh		;b24f
	defb 0ffh		;b250
	defb 0ddh		;b251
	defb 0bdh		;b252
	defb 0deh		;b253
	defb 0dah		;b254
	defb 0e6h		;b255
	defb 080h		;b256
	defb 008h		;b257
	defb 043h		;b258  'C'
	defb 053h		;b259  'S'
	defb 05fh		;b25a  '_'
	defb 07fh		;b25b
	defb 077h		;b25c  'w'
	defb 07fh		;b25d
	defb 0ffh		;b25e
	defb 0ffh		;b25f
	defb 008h		;b260
	defb 0ffh		;b261
	defb 083h		;b262
	defb 07fh		;b263
	defb 0ffh		;b264
	defb 0f1h		;b265
	defb 00eh		;b266
	defb 0ffh		;b267
	defb 0ffh		;b268
	defb 008h		;b269
	defb 07fh		;b26a
	defb 03fh		;b26b  '?'
	defb 0c0h		;b26c
	defb 0ffh		;b26d
	defb 0ffh		;b26e
	defb 0f8h		;b26f
	defb 007h		;b270
	defb 03fh		;b271  '?'
	defb 008h		;b272
	defb 0ffh		;b273
	defb 0ffh		;b274
	defb 03fh		;b275  '?'
	defb 0e7h		;b276
	defb 0ffh		;b277
	defb 0ffh		;b278
	defb 0ffh		;b279
	defb 0bfh		;b27a
	defb 008h		;b27b
	defb 0ffh		;b27c
	defb 07fh		;b27d
	defb 004h		;b27e
	defb 03fh		;b27f  '?'
	defb 07fh		;b280
	defb 07fh		;b281
	defb 07fh		;b282
	defb 0ffh		;b283
	defb 008h		;b284
	defb 07fh		;b285
	defb 07fh		;b286
	defb 0ffh		;b287
	defb 0e7h		;b288
	defb 01bh		;b289
	defb 07fh		;b28a
	defb 0ffh		;b28b
	defb 0ffh		;b28c
	defb 008h		;b28d
	defb 0ffh		;b28e
	defb 001h		;b28f
	defb 07fh		;b290
	defb 0ffh		;b291
	defb 0ffh		;b292
	defb 07fh		;b293
	defb 001h		;b294
	defb 03eh		;b295  '>'
	defb 008h		;b296
	defb 0ffh		;b297
	defb 0ffh		;b298
	defb 0ffh		;b299
	defb 0ffh		;b29a
	defb 0ffh		;b29b
	defb 0ffh		;b29c
	defb 0ffh		;b29d
	defb 0ffh		;b29e
	defb 008h		;b29f
	defb 0e0h		;b2a0
	defb 0f9h		;b2a1
	defb 0ffh		;b2a2
	defb 0feh		;b2a3
	defb 0feh		;b2a4
	defb 0bdh		;b2a5
	defb 0fdh		;b2a6
	defb 0feh		;b2a7
	defb 008h		;b2a8
	defb 08dh		;b2a9
	defb 0cdh		;b2aa
	defb 0dfh		;b2ab
	defb 0dfh		;b2ac
	defb 0ffh		;b2ad
	defb 0ffh		;b2ae
	defb 0ffh		;b2af
	defb 0ffh		;b2b0
	defb 008h		;b2b1
	defb 0f3h		;b2b2
	defb 0ffh		;b2b3
	defb 0fbh		;b2b4
	defb 0e7h		;b2b5
	defb 0ffh		;b2b6
	defb 0bfh		;b2b7
	defb 0bdh		;b2b8
	defb 07fh		;b2b9
	defb 008h		;b2ba
	defb 0fdh		;b2bb
	defb 0feh		;b2bc
	defb 0feh		;b2bd
	defb 0feh		;b2be
	defb 0ffh		;b2bf
	defb 0ffh		;b2c0
	defb 0ffh		;b2c1
	defb 0ffh		;b2c2
	defb 008h		;b2c3
	defb 0efh		;b2c4
	defb 0efh		;b2c5
	defb 0efh		;b2c6
	defb 0efh		;b2c7
	defb 0ffh		;b2c8
	defb 0fbh		;b2c9
	defb 0fbh		;b2ca
	defb 0fbh		;b2cb
	defb 008h		;b2cc
	defb 0efh		;b2cd
	defb 0efh		;b2ce
	defb 0efh		;b2cf
	defb 0ffh		;b2d0
	defb 0efh		;b2d1
	defb 0efh		;b2d2
	defb 0efh		;b2d3
	defb 0efh		;b2d4
	defb 008h		;b2d5
	defb 077h		;b2d6  'w'
	defb 0ffh		;b2d7
	defb 0bfh		;b2d8
	defb 0bfh		;b2d9
	defb 0bfh		;b2da
	defb 0dfh		;b2db
	defb 0dfh		;b2dc
	defb 0ffh		;b2dd
	defb 008h		;b2de
	defb 083h		;b2df
	defb 0f8h		;b2e0
	defb 0ffh		;b2e1
	defb 0ffh		;b2e2
	defb 0ffh		;b2e3
	defb 0dfh		;b2e4
	defb 0ffh		;b2e5
	defb 0ffh		;b2e6
	defb 008h		;b2e7
	defb 0fch		;b2e8
	defb 0feh		;b2e9
	defb 0fdh		;b2ea
	defb 0fdh		;b2eb
	defb 0ffh		;b2ec
	defb 0f7h		;b2ed
	defb 0f7h		;b2ee
	defb 0f7h		;b2ef
	defb 008h		;b2f0
	defb 0ffh		;b2f1
	defb 060h		;b2f2  '`' (Spectrum: GBP)
	defb 030h		;b2f3  '0'
	defb 018h		;b2f4
	defb 00ch		;b2f5
	defb 006h		;b2f6
	defb 003h		;b2f7
	defb 001h		;b2f8
	defb 00fh		;b2f9
	defb 0ffh		;b2fa
	defb 0ffh		;b2fb
	defb 081h		;b2fc
	defb 042h		;b2fd  'B'
	defb 024h		;b2fe  '$'
	defb 018h		;b2ff
	defb 0ffh		;b300
	defb 0ffh		;b301
	defb 00fh		;b302
	defb 0ffh		;b303
	defb 006h		;b304
	defb 00ch		;b305
	defb 018h		;b306
	defb 030h		;b307  '0'
	defb 060h		;b308  '`' (Spectrum: GBP)
	defb 0c0h		;b309
	defb 080h		;b30a
	defb 00fh		;b30b
	defb 0feh		;b30c
	defb 082h		;b30d
	defb 0a2h		;b30e
	defb 0a2h		;b30f
	defb 09ah		;b310
	defb 0bch		;b311
	defb 07eh		;b312  '~'
	defb 0ffh		;b313
	defb 022h		;b314  '"'
	defb 0beh		;b315
	defb 0c2h		;b316
	defb 0e2h		;b317
	defb 0f2h		;b318
	defb 0fah		;b319
	defb 0fch		;b31a
	defb 0feh		;b31b
	defb 0ffh		;b31c
	defb 022h		;b31d  '"'
	defb 0fdh		;b31e
	defb 083h		;b31f
	defb 0a7h		;b320
	defb 0afh		;b321
	defb 09fh		;b322
	defb 0bfh		;b323
	defb 07fh		;b324
	defb 0ffh		;b325
	defb 022h		;b326  '"'
; --- 8 zero bytes ---
	defb 000h		;b327
	defb 000h		;b328
	defb 000h		;b329
	defb 000h		;b32a
	defb 000h		;b32b
	defb 000h		;b32c
	defb 000h		;b32d
	defb 000h		;b32e
	defb 028h		;b32f  '('
; --- 8 zero bytes ---
	defb 000h		;b330
	defb 000h		;b331
	defb 000h		;b332
	defb 000h		;b333
	defb 000h		;b334
	defb 000h		;b335
	defb 000h		;b336
	defb 000h		;b337
	defb 010h		;b338
	defb 055h		;b339  'U'
	defb 0aah		;b33a
	defb 0aah		;b33b
	defb 0aah		;b33c
	defb 0aah		;b33d
	defb 0ffh		;b33e
	defb 0aah		;b33f
	defb 055h		;b340  'U'
	defb 028h		;b341  '('
	defb 0ffh		;b342
	defb 0ffh		;b343
	defb 0fdh		;b344
	defb 0ffh		;b345
	defb 0ffh		;b346
	defb 0ffh		;b347
	defb 0ffh		;b348
	defb 0bfh		;b349
	defb 008h		;b34a
; --- 8 zero bytes ---
	defb 000h		;b34b
	defb 000h		;b34c
	defb 000h		;b34d
	defb 000h		;b34e
	defb 000h		;b34f
	defb 000h		;b350
	defb 000h		;b351
	defb 000h		;b352
	defb 079h		;b353  'y'
	defb 008h		;b354
	defb 008h		;b355
	defb 008h		;b356
	defb 0ffh		;b357
	defb 080h		;b358
	defb 080h		;b359
	defb 080h		;b35a
	defb 0ffh		;b35b
	defb 010h		;b35c
; --- 9 zero bytes ---
	defb 000h		;b35d
	defb 000h		;b35e
	defb 000h		;b35f
	defb 000h		;b360
	defb 000h		;b361
	defb 000h		;b362
	defb 000h		;b363
	defb 000h		;b364
	defb 000h		;b365
	defb 06dh		;b366  'm'
	defb 0ffh		;b367
	defb 0ffh		;b368
	defb 0ffh		;b369
	defb 0b3h		;b36a
	defb 090h		;b36b
	defb 004h		;b36c
	defb 040h		;b36d  '@'
	defb 004h		;b36e
	defb 066h		;b36f  'f'
	defb 0ffh		;b370
	defb 0e0h		;b371
	defb 0dfh		;b372
	defb 0b4h		;b373
	defb 0d8h		;b374
	defb 06dh		;b375  'm'
	defb 04dh		;b376  'M'
	defb 00fh		;b377
	defb 08ah		;b378
	defb 098h		;b379
	defb 0aah		;b37a
	defb 08ah		;b37b
	defb 0feh		;b37c
	defb 0fdh		;b37d
	defb 07dh		;b37e  '}'
	defb 0efh		;b37f
	defb 0fah		;b380
	defb 0f5h		;b381
	defb 0f5h		;b382
	defb 01dh		;b383
	defb 08fh		;b384
	defb 029h		;b385  ')'
	defb 03ah		;b386  ':'
	defb 07ah		;b387  'z'
	defb 082h		;b388
	defb 005h		;b389
	defb 0aah		;b38a
	defb 051h		;b38b  'Q'
	defb 020h		;b38c  ' '
	defb 0dfh		;b38d
	defb 0dbh		;b38e
	defb 0fch		;b38f
	defb 0e9h		;b390
	defb 0dah		;b391
	defb 0b8h		;b392
	defb 0ech		;b393
	defb 054h		;b394  'T'
	defb 0aah		;b395
	defb 0d4h		;b396
	defb 0fch		;b397
	defb 077h		;b398  'w'
	defb 0cbh		;b399
	defb 0bdh		;b39a
	defb 0e5h		;b39b
	defb 04bh		;b39c  'K'
	defb 0fdh		;b39d
	defb 0edh		;b39e
	defb 0ebh		;b39f
	defb 0d5h		;b3a0
	defb 0eah		;b3a1
	defb 008h		;b3a2
	defb 0c3h		;b3a3
	defb 0f0h		;b3a4
	defb 0f8h		;b3a5
	defb 0feh		;b3a6
	defb 008h		;b3a7
	defb 0bdh		;b3a8
	defb 00ah		;b3a9
	defb 010h		;b3aa
	defb 01fh		;b3ab
	defb 05fh		;b3ac  '_'
	defb 09fh		;b3ad
	defb 040h		;b3ae  '@'
	defb 0fch		;b3af
	defb 053h		;b3b0  'S'
	defb 0f0h		;b3b1
	defb 086h		;b3b2
; " ^W*"
	defb 020h		;b3b3  ' '
	defb 05eh		;b3b4  '^'
	defb 057h		;b3b5  'W'
	defb 02ah		;b3b6  '*'
	defb 014h		;b3b7
	defb 020h		;b3b8  ' '
	defb 0c0h		;b3b9
	defb 0c7h		;b3ba
	defb 0c0h		;b3bb
	defb 0e7h		;b3bc
	defb 02bh		;b3bd  '+'
	defb 0e0h		;b3be
	defb 01fh		;b3bf
	defb 020h		;b3c0  ' '
	defb 032h		;b3c1  '2'
	defb 0cbh		;b3c2
	defb 0c9h		;b3c3
	defb 036h		;b3c4  '6'
	defb 01fh		;b3c5
	defb 007h		;b3c6
	defb 033h		;b3c7  '3'
	defb 0d5h		;b3c8
	defb 022h		;b3c9  '"'
	defb 055h		;b3ca  'U'
	defb 060h		;b3cb  '`' (Spectrum: GBP)
	defb 0f8h		;b3cc
	defb 0fdh		;b3cd
	defb 0f4h		;b3ce
	defb 0a4h		;b3cf
	defb 0cfh		;b3d0
	defb 0fbh		;b3d1
	defb 0cdh		;b3d2
	defb 008h		;b3d3
	defb 0fbh		;b3d4
	defb 0fdh		;b3d5
	defb 07fh		;b3d6
	defb 0f8h		;b3d7
	defb 0c0h		;b3d8
	defb 09dh		;b3d9
	defb 09dh		;b3da
	defb 099h		;b3db
	defb 0fdh		;b3dc
	defb 0fbh		;b3dd
	defb 08fh		;b3de
	defb 0deh		;b3df
	defb 061h		;b3e0  'a'
	defb 050h		;b3e1  'P'
	defb 078h		;b3e2  'x'
	defb 0fdh		;b3e3
	defb 0f7h		;b3e4
	defb 0efh		;b3e5
	defb 095h		;b3e6
	defb 0f8h		;b3e7
	defb 0fah		;b3e8
	defb 0efh		;b3e9
	defb 0cbh		;b3ea
	defb 0b3h		;b3eb
	defb 08bh		;b3ec
	defb 05eh		;b3ed  '^'
	defb 0ebh		;b3ee
	defb 0feh		;b3ef
	defb 0f7h		;b3f0
	defb 0efh		;b3f1
	defb 089h		;b3f2
	defb 0afh		;b3f3
	defb 0a3h		;b3f4
	defb 0fch		;b3f5
	defb 000h		;b3f6
	defb 04fh		;b3f7  'O'
	defb 0d9h		;b3f8
	defb 0eeh		;b3f9
	defb 07eh		;b3fa  '~'
	defb 04dh		;b3fb  'M'
	defb 07fh		;b3fc
	defb 0cfh		;b3fd
	defb 0b7h		;b3fe
	defb 0b7h		;b3ff
	defb 0d7h		;b400
	defb 0bbh		;b401
	defb 0ffh		;b402
	defb 083h		;b403
	defb 0b8h		;b404
	defb 0cfh		;b405
	defb 0bdh		;b406
	defb 034h		;b407  '4'
	defb 0fch		;b408
	defb 0f8h		;b409
	defb 0f5h		;b40a
	defb 008h		;b40b
	defb 08ah		;b40c
	defb 0f2h		;b40d
	defb 005h		;b40e
	defb 038h		;b40f  '8'
	defb 0eeh		;b410
	defb 089h		;b411
	defb 02ah		;b412  '*'
	defb 055h		;b413  'U'
	defb 0f8h		;b414
	defb 0c5h		;b415
	defb 0b9h		;b416
	defb 02dh		;b417  '-'
	defb 0b7h		;b418
	defb 077h		;b419  'w'
	defb 0f7h		;b41a
; "OUV?"
	defb 04fh		;b41b  'O'
	defb 055h		;b41c  'U'
	defb 056h		;b41d  'V'
	defb 03fh		;b41e  '?'
	defb 0beh		;b41f
	defb 057h		;b420  'W'
	defb 01dh		;b421
	defb 0fch		;b422
	defb 096h		;b423
	defb 008h		;b424
	defb 0aah		;b425
	defb 0d5h		;b426
	defb 0eah		;b427
	defb 05fh		;b428  '_'
	defb 0aeh		;b429
	defb 055h		;b42a  'U'
	defb 0ffh		;b42b
	defb 0efh		;b42c
	defb 0e9h		;b42d
	defb 0bbh		;b42e
	defb 0b8h		;b42f
	defb 0f3h		;b430
	defb 0a6h		;b431
	defb 0ddh		;b432
	defb 0a1h		;b433
	defb 0aeh		;b434
	defb 07dh		;b435  '}'
	defb 09fh		;b436
	defb 0dfh		;b437
	defb 0b2h		;b438
	defb 063h		;b439  'c'
	defb 0c2h		;b43a
	defb 083h		;b43b
	defb 0b8h		;b43c
	defb 039h		;b43d  '9'
	defb 0d3h		;b43e
	defb 03ah		;b43f  ':'
	defb 0afh		;b440
	defb 05ch		;b441  '\'
	defb 0b8h		;b442
	defb 074h		;b443  't'
	defb 0bfh		;b444
	defb 075h		;b445  'u'
	defb 0eeh		;b446
	defb 0d0h		;b447
	defb 0feh		;b448
	defb 0aeh		;b449
	defb 0e7h		;b44a
	defb 005h		;b44b
	defb 0b9h		;b44c
	defb 00ah		;b44d
	defb 082h		;b44e
	defb 083h		;b44f
	defb 0c2h		;b450
	defb 063h		;b451  'c'
	defb 061h		;b452  'a'
	defb 0dfh		;b453
	defb 0eah		;b454
	defb 0d5h		;b455
	defb 082h		;b456
	defb 0abh		;b457
	defb 057h		;b458  'W'
	defb 0aeh		;b459
	defb 05dh		;b45a  ']'
	defb 0bdh		;b45b
	defb 0ffh		;b45c
	defb 071h		;b45d  'q'
	defb 0fah		;b45e
	defb 060h		;b45f  '`' (Spectrum: GBP)
	defb 071h		;b460  'q'
	defb 0ffh		;b461
	defb 078h		;b462  'x'
	defb 04ch		;b463  'L'
	defb 08ah		;b464
	defb 0eah		;b465
	defb 075h		;b466  'u'
	defb 06ah		;b467  'j'
	defb 0f5h		;b468
	defb 0bah		;b469
	defb 05dh		;b46a  ']'
	defb 057h		;b46b  'W'
	defb 0d5h		;b46c
	defb 055h		;b46d  'U'
	defb 060h		;b46e  '`' (Spectrum: GBP)
	defb 0b7h		;b46f
	defb 000h		;b470
	defb 089h		;b471
	defb 046h		;b472  'F'
	defb 0cdh		;b473
	defb 0d2h		;b474
	defb 003h		;b475
	defb 027h		;b476  '''
	defb 002h		;b477
	defb 006h		;b478
	defb 006h		;b479
	defb 087h		;b47a
	defb 04bh		;b47b  'K'
	defb 0cbh		;b47c
	defb 04bh		;b47d  'K'
	defb 08bh		;b47e
	defb 00fh		;b47f
	defb 013h		;b480
	defb 096h		;b481
	defb 0eeh		;b482
	defb 052h		;b483  'R'
	defb 001h		;b484
	defb 006h		;b485
	defb 01dh		;b486
	defb 06ah		;b487  'j'
	defb 07fh		;b488
	defb 00fh		;b489
	defb 00fh		;b48a
	defb 01bh		;b48b
	defb 06bh		;b48c  'k'
	defb 0dbh		;b48d
	defb 0aeh		;b48e
	defb 055h		;b48f  'U'
	defb 0aah		;b490
	defb 0ffh		;b491
	defb 0d9h		;b492
	defb 09ah		;b493
	defb 08eh		;b494
	defb 0aeh		;b495
lb496h:
	defb 0f8h		;b496
	defb 0efh		;b497
	defb 058h		;b498  'X'
	defb 0feh		;b499
	defb 0aeh		;b49a
	defb 058h		;b49b  'X'
	defb 0e0h		;b49c
	defb 080h		;b49d
	defb 040h		;b49e  '@'
	defb 040h		;b49f  '@'
	defb 0e1h		;b4a0
	defb 081h		;b4a1
	defb 0b9h		;b4a2
	defb 006h		;b4a3
	defb 005h		;b4a4
	defb 006h		;b4a5
	defb 01bh		;b4a6
	defb 066h		;b4a7  'f'
	defb 0adh		;b4a8
	defb 0dbh		;b4a9
	defb 018h		;b4aa
	defb 060h		;b4ab  '`' (Spectrum: GBP)
	defb 080h		;b4ac
	defb 098h		;b4ad
	defb 042h		;b4ae  'B'
lb4afh:
	defb 01bh		;b4af
; "[0003?"
	defb 05bh		;b4b0  '['
	defb 030h		;b4b1  '0'
	defb 030h		;b4b2  '0'
	defb 030h		;b4b3  '0'
	defb 033h		;b4b4  '3'
	defb 03fh		;b4b5  '?'
	defb 0fch		;b4b6
	defb 030h		;b4b7  '0'
	defb 05fh		;b4b8  '_'
	defb 0a8h		;b4b9
	defb 047h		;b4ba  'G'
	defb 06bh		;b4bb  'k'
	defb 0b5h		;b4bc
	defb 0b8h		;b4bd
	defb 055h		;b4be  'U'
	defb 058h		;b4bf  'X'
	defb 015h		;b4c0
	defb 0eah		;b4c1
	defb 000h		;b4c2
	defb 0bfh		;b4c3
	defb 000h		;b4c4
	defb 0fbh		;b4c5
	defb 020h		;b4c6  ' '
	defb 0dfh		;b4c7
	defb 042h		;b4c8  'B'
	defb 0b5h		;b4c9
	defb 000h		;b4ca
	defb 0ffh		;b4cb
