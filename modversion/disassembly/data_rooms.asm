; ======================================================================
; data_rooms.asm
; ======================================================================
;
; Room Definitions & Lookup Tables
;
; Address range: $6A09-$820B (6147 bytes)
; Source binary: mod_decompressed.bin (loaded at $620C)
;
; Room layout data defining the game world. 98% new content.
; Contains room address lookup tables (pointer arrays) and
; 32-byte room definition blocks. Almost entirely new level
; designs compared to the original.
;
; ======================================================================

text_end:

rooms_start:
	defb 06bh		;6a09  'k'
	defb 0f9h		;6a0a
	defb 06bh		;6a0b  'k'
	defb 010h		;6a0c
; "l.lxl"
	defb 06ch		;6a0d  'l'
	defb 02eh		;6a0e  '.'
	defb 06ch		;6a0f  'l'
	defb 078h		;6a10  'x'
	defb 06ch		;6a11  'l'
	defb 0beh		;6a12
	defb 06ch		;6a13  'l'
	defb 0d9h		;6a14
	defb 06ch		;6a15  'l'
	defb 003h		;6a16
	defb 06dh		;6a17  'm'
	defb 00bh		;6a18
	defb 06dh		;6a19  'm'
	defb 015h		;6a1a
; "m@mSmhm"
	defb 06dh		;6a1b  'm'
	defb 040h		;6a1c  '@'
	defb 06dh		;6a1d  'm'
	defb 053h		;6a1e  'S'
	defb 06dh		;6a1f  'm'
	defb 068h		;6a20  'h'
	defb 06dh		;6a21  'm'
	defb 090h		;6a22
	defb 06dh		;6a23  'm'
	defb 099h		;6a24
	defb 06dh		;6a25  'm'
	defb 0a6h		;6a26
	defb 06dh		;6a27  'm'
	defb 0e2h		;6a28
	defb 06dh		;6a29  'm'
	defb 005h		;6a2a
	defb 06eh		;6a2b  'n'
	defb 00eh		;6a2c
; "n+n4nan"
	defb 06eh		;6a2d  'n'
	defb 02bh		;6a2e  '+'
	defb 06eh		;6a2f  'n'
	defb 034h		;6a30  '4'
	defb 06eh		;6a31  'n'
	defb 061h		;6a32  'a'
	defb 06eh		;6a33  'n'
	defb 08bh		;6a34
	defb 06eh		;6a35  'n'
	defb 0a4h		;6a36
	defb 06eh		;6a37  'n'
	defb 0b9h		;6a38
	defb 06eh		;6a39  'n'
	defb 0e9h		;6a3a
	defb 06eh		;6a3b  'n'
	defb 011h		;6a3c
; "o,o=oOo]ooo"
	defb 06fh		;6a3d  'o'
	defb 02ch		;6a3e  ','
	defb 06fh		;6a3f  'o'
	defb 03dh		;6a40  '='
	defb 06fh		;6a41  'o'
	defb 04fh		;6a42  'O'
	defb 06fh		;6a43  'o'
	defb 05dh		;6a44  ']'
	defb 06fh		;6a45  'o'
	defb 06fh		;6a46  'o'
	defb 06fh		;6a47  'o'
	defb 081h		;6a48
	defb 06fh		;6a49  'o'
	defb 098h		;6a4a
	defb 06fh		;6a4b  'o'
	defb 0afh		;6a4c
	defb 06fh		;6a4d  'o'
	defb 0c1h		;6a4e
	defb 06fh		;6a4f  'o'
	defb 0d8h		;6a50
	defb 06fh		;6a51  'o'
	defb 0efh		;6a52
	defb 06fh		;6a53  'o'
	defb 006h		;6a54
	defb 070h		;6a55  'p'
	defb 01dh		;6a56
; "p+p9pKpYpipxp"
	defb 070h		;6a57  'p'
	defb 02bh		;6a58  '+'
	defb 070h		;6a59  'p'
	defb 039h		;6a5a  '9'
	defb 070h		;6a5b  'p'
	defb 04bh		;6a5c  'K'
	defb 070h		;6a5d  'p'
l6a5eh:
	defb 059h		;6a5e  'Y'
	defb 070h		;6a5f  'p'
	defb 069h		;6a60  'i'
	defb 070h		;6a61  'p'
	defb 078h		;6a62  'x'
	defb 070h		;6a63  'p'
	defb 087h		;6a64
	defb 070h		;6a65  'p'
	defb 096h		;6a66
	defb 070h		;6a67  'p'
	defb 0a4h		;6a68
	defb 070h		;6a69  'p'
	defb 0b2h		;6a6a
	defb 070h		;6a6b  'p'
	defb 0c0h		;6a6c
	defb 070h		;6a6d  'p'
	defb 0ceh		;6a6e
	defb 070h		;6a6f  'p'
	defb 0d1h		;6a70
	defb 070h		;6a71  'p'
	defb 0dfh		;6a72
	defb 070h		;6a73  'p'
	defb 0edh		;6a74
	defb 070h		;6a75  'p'
	defb 005h		;6a76
	defb 071h		;6a77  'q'
	defb 013h		;6a78
; "q9qGqqq"
	defb 071h		;6a79  'q'
	defb 039h		;6a7a  '9'
	defb 071h		;6a7b  'q'
	defb 047h		;6a7c  'G'
	defb 071h		;6a7d  'q'
	defb 071h		;6a7e  'q'
	defb 071h		;6a7f  'q'
	defb 085h		;6a80
	defb 071h		;6a81  'q'
	defb 0aah		;6a82
	defb 071h		;6a83  'q'
	defb 0e0h		;6a84
	defb 071h		;6a85  'q'
	defb 01eh		;6a86
; "r'r0rKrir"
	defb 072h		;6a87  'r'
	defb 027h		;6a88  '''
	defb 072h		;6a89  'r'
	defb 030h		;6a8a  '0'
	defb 072h		;6a8b  'r'
	defb 04bh		;6a8c  'K'
	defb 072h		;6a8d  'r'
	defb 069h		;6a8e  'i'
	defb 072h		;6a8f  'r'
	defb 080h		;6a90
	defb 072h		;6a91  'r'
	defb 0a0h		;6a92
	defb 072h		;6a93  'r'
	defb 0b7h		;6a94
	defb 072h		;6a95  'r'
	defb 0ceh		;6a96
	defb 072h		;6a97  'r'
	defb 0e6h		;6a98
	defb 072h		;6a99  'r'
	defb 0fah		;6a9a
	defb 072h		;6a9b  'r'
	defb 00dh		;6a9c
; "s*s<sPsts"
	defb 073h		;6a9d  's'
	defb 02ah		;6a9e  '*'
	defb 073h		;6a9f  's'
	defb 03ch		;6aa0  '<'
	defb 073h		;6aa1  's'
	defb 050h		;6aa2  'P'
	defb 073h		;6aa3  's'
	defb 074h		;6aa4  't'
	defb 073h		;6aa5  's'
	defb 08ah		;6aa6
	defb 073h		;6aa7  's'
	defb 098h		;6aa8
	defb 073h		;6aa9  's'
	defb 09eh		;6aaa
	defb 073h		;6aab  's'
	defb 0aah		;6aac
	defb 073h		;6aad  's'
	defb 0b7h		;6aae
	defb 073h		;6aaf  's'
	defb 0cah		;6ab0
	defb 073h		;6ab1  's'
	defb 0e3h		;6ab2
	defb 073h		;6ab3  's'
	defb 0eeh		;6ab4
	defb 073h		;6ab5  's'
	defb 0fbh		;6ab6
	defb 073h		;6ab7  's'
	defb 00ch		;6ab8
	defb 074h		;6ab9  't'
	defb 01ah		;6aba
; "t&t2tBtStityt"
	defb 074h		;6abb  't'
	defb 026h		;6abc  '&'
	defb 074h		;6abd  't'
	defb 032h		;6abe  '2'
	defb 074h		;6abf  't'
	defb 042h		;6ac0  'B'
	defb 074h		;6ac1  't'
	defb 053h		;6ac2  'S'
	defb 074h		;6ac3  't'
	defb 069h		;6ac4  'i'
	defb 074h		;6ac5  't'
	defb 079h		;6ac6  'y'
	defb 074h		;6ac7  't'
	defb 0a1h		;6ac8
	defb 074h		;6ac9  't'
	defb 0cch		;6aca
	defb 074h		;6acb  't'
	defb 0eeh		;6acc
	defb 074h		;6acd  't'
	defb 011h		;6ace
; "u#u,u>uPuiu"
	defb 075h		;6acf  'u'
	defb 023h		;6ad0  '#'
	defb 075h		;6ad1  'u'
	defb 02ch		;6ad2  ','
	defb 075h		;6ad3  'u'
	defb 03eh		;6ad4  '>'
	defb 075h		;6ad5  'u'
	defb 050h		;6ad6  'P'
	defb 075h		;6ad7  'u'
	defb 069h		;6ad8  'i'
	defb 075h		;6ad9  'u'
	defb 080h		;6ada
	defb 075h		;6adb  'u'
	defb 08fh		;6adc
	defb 075h		;6add  'u'
	defb 0afh		;6ade
	defb 075h		;6adf  'u'
	defb 0c1h		;6ae0
	defb 075h		;6ae1  'u'
	defb 0e7h		;6ae2
	defb 075h		;6ae3  'u'
	defb 0feh		;6ae4
	defb 075h		;6ae5  'u'
	defb 007h		;6ae6
	defb 076h		;6ae7  'v'
	defb 018h		;6ae8
; "v&v3v>vIvYv"
	defb 076h		;6ae9  'v'
	defb 026h		;6aea  '&'
	defb 076h		;6aeb  'v'
	defb 033h		;6aec  '3'
	defb 076h		;6aed  'v'
	defb 03eh		;6aee  '>'
	defb 076h		;6aef  'v'
	defb 049h		;6af0  'I'
	defb 076h		;6af1  'v'
	defb 059h		;6af2  'Y'
	defb 076h		;6af3  'v'
	defb 08ch		;6af4
	defb 076h		;6af5  'v'
	defb 09ah		;6af6
	defb 076h		;6af7  'v'
	defb 0b1h		;6af8
	defb 076h		;6af9  'v'
	defb 0cah		;6afa
	defb 076h		;6afb  'v'
	defb 0ddh		;6afc
	defb 076h		;6afd  'v'
	defb 00bh		;6afe
; "w.wLwUw"
	defb 077h		;6aff  'w'
	defb 02eh		;6b00  '.'
	defb 077h		;6b01  'w'
	defb 04ch		;6b02  'L'
	defb 077h		;6b03  'w'
	defb 055h		;6b04  'U'
	defb 077h		;6b05  'w'
	defb 085h		;6b06
	defb 077h		;6b07  'w'
	defb 096h		;6b08
	defb 077h		;6b09  'w'
	defb 0b6h		;6b0a
	defb 077h		;6b0b  'w'
	defb 0c6h		;6b0c
	defb 077h		;6b0d  'w'
	defb 0d1h		;6b0e
	defb 077h		;6b0f  'w'
	defb 0f0h		;6b10
	defb 077h		;6b11  'w'
	defb 003h		;6b12
	defb 078h		;6b13  'x'
	defb 00bh		;6b14
; "x%x?xGxVxwx"
	defb 078h		;6b15  'x'
	defb 025h		;6b16  '%'
	defb 078h		;6b17  'x'
	defb 03fh		;6b18  '?'
	defb 078h		;6b19  'x'
	defb 047h		;6b1a  'G'
	defb 078h		;6b1b  'x'
	defb 056h		;6b1c  'V'
	defb 078h		;6b1d  'x'
	defb 077h		;6b1e  'w'
	defb 078h		;6b1f  'x'
	defb 088h		;6b20
	defb 078h		;6b21  'x'
	defb 0a1h		;6b22
	defb 078h		;6b23  'x'
	defb 0c6h		;6b24
	defb 078h		;6b25  'x'
	defb 0e4h		;6b26
	defb 078h		;6b27  'x'
	defb 011h		;6b28
; "y*y`y{y"
	defb 079h		;6b29  'y'
	defb 02ah		;6b2a  '*'
	defb 079h		;6b2b  'y'
	defb 060h		;6b2c  '`' (Spectrum: GBP)
	defb 079h		;6b2d  'y'
	defb 07bh		;6b2e  '{'
	defb 079h		;6b2f  'y'
	defb 0a4h		;6b30
	defb 079h		;6b31  'y'
	defb 0b2h		;6b32
	defb 079h		;6b33  'y'
	defb 0d5h		;6b34
	defb 079h		;6b35  'y'
	defb 0f5h		;6b36
	defb 079h		;6b37  'y'
	defb 006h		;6b38
; "z'z@zVzczoz"
	defb 07ah		;6b39  'z'
	defb 027h		;6b3a  '''
	defb 07ah		;6b3b  'z'
	defb 040h		;6b3c  '@'
	defb 07ah		;6b3d  'z'
	defb 056h		;6b3e  'V'
	defb 07ah		;6b3f  'z'
	defb 063h		;6b40  'c'
	defb 07ah		;6b41  'z'
	defb 06fh		;6b42  'o'
	defb 07ah		;6b43  'z'
	defb 084h		;6b44
	defb 07ah		;6b45  'z'
	defb 09ah		;6b46
	defb 07ah		;6b47  'z'
	defb 0a9h		;6b48
	defb 07ah		;6b49  'z'
	defb 0b8h		;6b4a
	defb 07ah		;6b4b  'z'
	defb 0d4h		;6b4c
	defb 07ah		;6b4d  'z'
	defb 0e8h		;6b4e
	defb 07ah		;6b4f  'z'
	defb 002h		;6b50
	defb 07bh		;6b51  '{'
	defb 010h		;6b52
; "{!{H{i{"
	defb 07bh		;6b53  '{'
	defb 021h		;6b54  '!'
	defb 07bh		;6b55  '{'
	defb 048h		;6b56  'H'
	defb 07bh		;6b57  '{'
	defb 069h		;6b58  'i'
	defb 07bh		;6b59  '{'
	defb 091h		;6b5a
	defb 07bh		;6b5b  '{'
	defb 09eh		;6b5c
	defb 07bh		;6b5d  '{'
	defb 0b1h		;6b5e
	defb 07bh		;6b5f  '{'
	defb 0bfh		;6b60
	defb 07bh		;6b61  '{'
	defb 0d1h		;6b62
	defb 07bh		;6b63  '{'
	defb 0f5h		;6b64
	defb 07bh		;6b65  '{'
	defb 00dh		;6b66
; "|$|1|9|M|c|k|||"
	defb 07ch		;6b67  '|'
	defb 024h		;6b68  '$'
	defb 07ch		;6b69  '|'
	defb 031h		;6b6a  '1'
	defb 07ch		;6b6b  '|'
	defb 039h		;6b6c  '9'
	defb 07ch		;6b6d  '|'
	defb 04dh		;6b6e  'M'
	defb 07ch		;6b6f  '|'
	defb 063h		;6b70  'c'
	defb 07ch		;6b71  '|'
	defb 06bh		;6b72  'k'
	defb 07ch		;6b73  '|'
	defb 07ch		;6b74  '|'
	defb 07ch		;6b75  '|'
	defb 0a2h		;6b76
	defb 07ch		;6b77  '|'
	defb 0b4h		;6b78
	defb 07ch		;6b79  '|'
	defb 0c7h		;6b7a
	defb 07ch		;6b7b  '|'
	defb 0ech		;6b7c
	defb 07ch		;6b7d  '|'
	defb 0fdh		;6b7e
	defb 07ch		;6b7f  '|'
	defb 005h		;6b80
	defb 07dh		;6b81  '}'
	defb 00ch		;6b82
	defb 07dh		;6b83  '}'
	defb 014h		;6b84
; "} }=}G}^}n}"
	defb 07dh		;6b85  '}'
	defb 020h		;6b86  ' '
	defb 07dh		;6b87  '}'
	defb 03dh		;6b88  '='
	defb 07dh		;6b89  '}'
	defb 047h		;6b8a  'G'
	defb 07dh		;6b8b  '}'
	defb 05eh		;6b8c  '^'
	defb 07dh		;6b8d  '}'
	defb 06eh		;6b8e  'n'
	defb 07dh		;6b8f  '}'
	defb 08bh		;6b90
	defb 07dh		;6b91  '}'
	defb 0a2h		;6b92
	defb 07dh		;6b93  '}'
	defb 0b9h		;6b94
	defb 07dh		;6b95  '}'
	defb 0d4h		;6b96
	defb 07dh		;6b97  '}'
	defb 0e7h		;6b98
	defb 07dh		;6b99  '}'
	defb 010h		;6b9a
	defb 07eh		;6b9b  '~'
	defb 01fh		;6b9c
; "~A~]~|~"
	defb 07eh		;6b9d  '~'
	defb 041h		;6b9e  'A'
	defb 07eh		;6b9f  '~'
	defb 05dh		;6ba0  ']'
	defb 07eh		;6ba1  '~'
	defb 07ch		;6ba2  '|'
	defb 07eh		;6ba3  '~'
	defb 09ah		;6ba4
	defb 07eh		;6ba5  '~'
	defb 0b2h		;6ba6
	defb 07eh		;6ba7  '~'
	defb 0c5h		;6ba8
	defb 07eh		;6ba9  '~'
	defb 0edh		;6baa
	defb 07eh		;6bab  '~'
	defb 008h		;6bac
	defb 07fh		;6bad
	defb 01ah		;6bae
	defb 07fh		;6baf
	defb 02dh		;6bb0  '-'
	defb 07fh		;6bb1
	defb 040h		;6bb2  '@'
	defb 07fh		;6bb3
	defb 053h		;6bb4  'S'
	defb 07fh		;6bb5
	defb 065h		;6bb6  'e'
	defb 07fh		;6bb7
	defb 078h		;6bb8  'x'
	defb 07fh		;6bb9
	defb 08bh		;6bba
	defb 07fh		;6bbb
	defb 091h		;6bbc
	defb 07fh		;6bbd
	defb 09dh		;6bbe
	defb 07fh		;6bbf
	defb 0b0h		;6bc0
	defb 07fh		;6bc1
	defb 0c2h		;6bc2
	defb 07fh		;6bc3
	defb 0ceh		;6bc4
	defb 07fh		;6bc5
	defb 0deh		;6bc6
	defb 07fh		;6bc7
	defb 0eah		;6bc8
	defb 07fh		;6bc9
	defb 0f3h		;6bca
	defb 07fh		;6bcb
	defb 005h		;6bcc
	defb 080h		;6bcd
	defb 013h		;6bce
	defb 080h		;6bcf
	defb 01ch		;6bd0
	defb 080h		;6bd1
	defb 02dh		;6bd2  '-'
	defb 080h		;6bd3
	defb 03fh		;6bd4  '?'
	defb 080h		;6bd5
	defb 050h		;6bd6  'P'
	defb 080h		;6bd7
	defb 05ah		;6bd8  'Z'
	defb 080h		;6bd9
	defb 06ch		;6bda  'l'
	defb 080h		;6bdb
	defb 083h		;6bdc
	defb 080h		;6bdd
	defb 09eh		;6bde
	defb 080h		;6bdf
	defb 0ach		;6be0
	defb 080h		;6be1
	defb 0c2h		;6be2
	defb 080h		;6be3
	defb 0d1h		;6be4
	defb 080h		;6be5
	defb 0e5h		;6be6
	defb 080h		;6be7
	defb 0f4h		;6be8
	defb 080h		;6be9
	defb 069h		;6bea  'i'
	defb 081h		;6beb
	defb 003h		;6bec
	defb 081h		;6bed
	defb 02fh		;6bee  '/'
	defb 081h		;6bef
	defb 03eh		;6bf0  '>'
	defb 081h		;6bf1
	defb 04ch		;6bf2  'L'
	defb 081h		;6bf3
	defb 056h		;6bf4  'V'
	defb 081h		;6bf5
	defb 003h		;6bf6
	defb 001h		;6bf7
	defb 0ffh		;6bf8
	defb 000h		;6bf9
	defb 040h		;6bfa  '@'
	defb 0fch		;6bfb
	defb 0b4h		;6bfc
	defb 089h		;6bfd
	defb 000h		;6bfe
	defb 011h		;6bff
	defb 0fch		;6c00
	defb 0b4h		;6c01
	defb 088h		;6c02
	defb 000h		;6c03
	defb 020h		;6c04  ' '
	defb 0fah		;6c05
	defb 0b4h		;6c06
	defb 087h		;6c07
	defb 021h		;6c08  '!'
	defb 00fh		;6c09
	defb 0e5h		;6c0a
	defb 087h		;6c0b
	defb 064h		;6c0c  'd'
	defb 063h		;6c0d  'c'
	defb 013h		;6c0e
	defb 0ffh		;6c0f
	defb 000h		;6c10
	defb 044h		;6c11  'D'
	defb 0fah		;6c12
	defb 0b0h		;6c13
	defb 089h		;6c14
	defb 000h		;6c15
	defb 002h		;6c16
	defb 0fah		;6c17
	defb 092h		;6c18
	defb 089h		;6c19
	defb 002h		;6c1a
	defb 004h		;6c1b
	defb 002h		;6c1c
	defb 0fch		;6c1d
	defb 0b4h		;6c1e
	defb 089h		;6c1f
	defb 002h		;6c20
	defb 002h		;6c21
	defb 005h		;6c22
	defb 0fah		;6c23
	defb 0d2h		;6c24
	defb 087h		;6c25
	defb 021h		;6c26  '!'
	defb 002h		;6c27
	defb 0bfh		;6c28
	defb 089h		;6c29
	defb 028h		;6c2a  '('
	defb 029h		;6c2b  ')'
	defb 032h		;6c2c  '2'
	defb 0ffh		;6c2d
	defb 002h		;6c2e
	defb 00ah		;6c2f
	defb 012h		;6c30
	defb 0fah		;6c31
	defb 0b4h		;6c32
	defb 087h		;6c33
	defb 002h		;6c34
	defb 008h		;6c35
	defb 008h		;6c36
	defb 000h		;6c37
	defb 074h		;6c38  't'
	defb 088h		;6c39
	defb 002h		;6c3a
	defb 007h		;6c3b
	defb 012h		;6c3c
	defb 0fah		;6c3d
	defb 0cdh		;6c3e
	defb 087h		;6c3f
	defb 001h		;6c40
	defb 002h		;6c41
	defb 0f7h		;6c42
	defb 09dh		;6c43
	defb 088h		;6c44
	defb 001h		;6c45
	defb 002h		;6c46
	defb 000h		;6c47
	defb 09ch		;6c48
	defb 088h		;6c49
	defb 002h		;6c4a
	defb 005h		;6c4b
	defb 006h		;6c4c
	defb 0fbh		;6c4d
	defb 0e3h		;6c4e
	defb 088h		;6c4f
	defb 002h		;6c50
	defb 007h		;6c51
	defb 002h		;6c52
	defb 0fbh		;6c53
	defb 0c2h		;6c54
	defb 089h		;6c55
	defb 000h		;6c56
	defb 011h		;6c57
	defb 0f9h		;6c58
	defb 0ddh		;6c59
	defb 087h		;6c5a
	defb 000h		;6c5b
	defb 003h		;6c5c
	defb 0f8h		;6c5d
	defb 0c4h		;6c5e
	defb 088h		;6c5f
	defb 000h		;6c60
	defb 005h		;6c61
	defb 0f8h		;6c62
	defb 0a3h		;6c63
	defb 089h		;6c64
	defb 004h		;6c65
	defb 0f6h		;6c66
	defb 0c3h		;6c67
	defb 088h		;6c68
	defb 004h		;6c69
	defb 0f5h		;6c6a
	defb 0c7h		;6c6b
	defb 088h		;6c6c
	defb 004h		;6c6d
	defb 0f6h		;6c6e
	defb 0a2h		;6c6f
	defb 089h		;6c70
	defb 004h		;6c71
	defb 0f5h		;6c72
	defb 0a8h		;6c73
	defb 089h		;6c74
	defb 005h		;6c75
	defb 022h		;6c76  '"'
	defb 0ffh		;6c77
	defb 003h		;6c78
	defb 001h		;6c79
	defb 000h		;6c7a
	defb 060h		;6c7b  '`' (Spectrum: GBP)
	defb 0fah		;6c7c
	defb 094h		;6c7d
	defb 089h		;6c7e
	defb 001h		;6c7f
	defb 00ah		;6c80
	defb 002h		;6c81
	defb 0c0h		;6c82
	defb 087h		;6c83
	defb 001h		;6c84
	defb 00ah		;6c85
	defb 002h		;6c86
	defb 0cbh		;6c87
	defb 087h		;6c88
	defb 000h		;6c89
	defb 00ah		;6c8a
	defb 0f2h		;6c8b
	defb 0e1h		;6c8c
	defb 088h		;6c8d
	defb 007h		;6c8e
	defb 005h		;6c8f
	defb 0f3h		;6c90
	defb 000h		;6c91
	defb 089h		;6c92
	defb 007h		;6c93
	defb 005h		;6c94
	defb 003h		;6c95
	defb 0ffh		;6c96
	defb 088h		;6c97
	defb 007h		;6c98
	defb 003h		;6c99
	defb 003h		;6c9a
	defb 009h		;6c9b
	defb 089h		;6c9c
	defb 007h		;6c9d
	defb 004h		;6c9e
	defb 0f3h		;6c9f
	defb 00ah		;6ca0
	defb 089h		;6ca1
	defb 006h		;6ca2
	defb 005h		;6ca3
	defb 0f1h		;6ca4
	defb 00bh		;6ca5
	defb 089h		;6ca6
	defb 006h		;6ca7
	defb 005h		;6ca8
	defb 004h		;6ca9
	defb 00ch		;6caa
	defb 089h		;6cab
	defb 006h		;6cac
	defb 004h		;6cad
	defb 0f1h		;6cae
	defb 001h		;6caf
	defb 089h		;6cb0
	defb 006h		;6cb1
	defb 003h		;6cb2
	defb 004h		;6cb3
	defb 002h		;6cb4
	defb 089h		;6cb5
	defb 008h		;6cb6
	defb 00fh		;6cb7
	defb 0c5h		;6cb8
	defb 087h		;6cb9
	defb 00fh		;6cba
	defb 0e5h		;6cbb
	defb 088h		;6cbc
	defb 0ffh		;6cbd
	defb 003h		;6cbe
	defb 001h		;6cbf
	defb 001h		;6cc0
	defb 012h		;6cc1
	defb 002h		;6cc2
	defb 0c0h		;6cc3
	defb 087h		;6cc4
	defb 001h		;6cc5
	defb 012h		;6cc6
	defb 002h		;6cc7
	defb 0cbh		;6cc8
	defb 087h		;6cc9
	defb 000h		;6cca
	defb 00ah		;6ccb
	defb 0f2h		;6ccc
	defb 041h		;6ccd  'A'
	defb 088h		;6cce
	defb 000h		;6ccf
	defb 00ah		;6cd0
	defb 0f2h		;6cd1
	defb 0a1h		;6cd2
	defb 089h		;6cd3
	defb 008h		;6cd4
	defb 012h		;6cd5
	defb 0c5h		;6cd6
	defb 087h		;6cd7
	defb 0ffh		;6cd8
	defb 003h		;6cd9
	defb 001h		;6cda
	defb 001h		;6cdb
	defb 005h		;6cdc
	defb 002h		;6cdd
	defb 060h		;6cde  '`' (Spectrum: GBP)
	defb 089h		;6cdf
	defb 001h		;6ce0
	defb 005h		;6ce1
	defb 002h		;6ce2
	defb 06bh		;6ce3  'k'
	defb 089h		;6ce4
	defb 001h		;6ce5
	defb 00ch		;6ce6
	defb 002h		;6ce7
	defb 0cah		;6ce8
	defb 087h		;6ce9
	defb 001h		;6cea
	defb 00ch		;6ceb
	defb 002h		;6cec
	defb 0c8h		;6ced
	defb 087h		;6cee
	defb 001h		;6cef
	defb 003h		;6cf0
	defb 002h		;6cf1
	defb 0e9h		;6cf2
	defb 088h		;6cf3
	defb 000h		;6cf4
	defb 014h		;6cf5
	defb 0f2h		;6cf6
	defb 03bh		;6cf7  ';'
	defb 089h		;6cf8
	defb 008h		;6cf9
	defb 006h		;6cfa
	defb 045h		;6cfb  'E'
	defb 089h		;6cfc
	defb 000h		;6cfd
	defb 007h		;6cfe
	defb 007h		;6cff
	defb 034h		;6d00  '4'
	defb 089h		;6d01
	defb 0ffh		;6d02
	defb 003h		;6d03
	defb 001h		;6d04
	defb 000h		;6d05
	defb 020h		;6d06  ' '
	defb 007h		;6d07
	defb 034h		;6d08  '4'
	defb 089h		;6d09
	defb 0ffh		;6d0a
	defb 003h		;6d0b
	defb 001h		;6d0c
	defb 000h		;6d0d
	defb 060h		;6d0e  '`' (Spectrum: GBP)
	defb 0fah		;6d0f
	defb 094h		;6d10
	defb 089h		;6d11
	defb 02bh		;6d12  '+'
	defb 02dh		;6d13  '-'
	defb 0ffh		;6d14
	defb 000h		;6d15
	defb 040h		;6d16  '@'
	defb 0fch		;6d17
	defb 0b4h		;6d18
	defb 089h		;6d19
	defb 000h		;6d1a
	defb 006h		;6d1b
	defb 0fah		;6d1c
	defb 0b4h		;6d1d
	defb 088h		;6d1e
	defb 000h		;6d1f
	defb 01ah		;6d20
	defb 0fch		;6d21
	defb 0bah		;6d22
	defb 088h		;6d23
	defb 000h		;6d24
	defb 014h		;6d25
	defb 0fah		;6d26
	defb 0c0h		;6d27
	defb 087h		;6d28
	defb 007h		;6d29
	defb 007h		;6d2a
	defb 0fah		;6d2b
	defb 0dfh		;6d2c
	defb 087h		;6d2d
	defb 007h		;6d2e
	defb 007h		;6d2f
	defb 0fah		;6d30
	defb 0e0h		;6d31
	defb 087h		;6d32
	defb 00ah		;6d33
	defb 007h		;6d34
	defb 001h		;6d35
	defb 0b9h		;6d36
	defb 087h		;6d37
	defb 002h		;6d38
	defb 005h		;6d39
	defb 008h		;6d3a
	defb 001h		;6d3b
	defb 0b4h		;6d3c
	defb 087h		;6d3d
	defb 065h		;6d3e  'e'
	defb 0ffh		;6d3f
	defb 003h		;6d40
	defb 001h		;6d41
	defb 000h		;6d42
	defb 012h		;6d43
	defb 0fah		;6d44
	defb 0a2h		;6d45
	defb 089h		;6d46
	defb 000h		;6d47
	defb 013h		;6d48
	defb 0fah		;6d49
	defb 0c1h		;6d4a
	defb 089h		;6d4b
	defb 000h		;6d4c
	defb 014h		;6d4d
	defb 0fah		;6d4e
	defb 0e0h		;6d4f
	defb 089h		;6d50
	defb 02ch		;6d51  ','
	defb 0ffh		;6d52
	defb 003h		;6d53
	defb 001h		;6d54
	defb 002h		;6d55
	defb 00ah		;6d56
	defb 003h		;6d57
	defb 0fah		;6d58
	defb 094h		;6d59
	defb 089h		;6d5a
	defb 002h		;6d5b
	defb 007h		;6d5c
	defb 003h		;6d5d
	defb 0fah		;6d5e
	defb 0adh		;6d5f
	defb 089h		;6d60
	defb 000h		;6d61
	defb 011h		;6d62
	defb 0f9h		;6d63
	defb 0bdh		;6d64
	defb 089h		;6d65
	defb 030h		;6d66  '0'
	defb 0ffh		;6d67
	defb 003h		;6d68
	defb 001h		;6d69
	defb 000h		;6d6a
	defb 02ch		;6d6b  ','
	defb 0fch		;6d6c
	defb 0c8h		;6d6d
	defb 089h		;6d6e
	defb 002h		;6d6f
	defb 014h		;6d70
	defb 002h		;6d71
	defb 0fah		;6d72
	defb 0b4h		;6d73
	defb 089h		;6d74
	defb 000h		;6d75
	defb 007h		;6d76
	defb 0fah		;6d77
	defb 0cdh		;6d78
	defb 088h		;6d79
	defb 007h		;6d7a
	defb 007h		;6d7b
	defb 0fah		;6d7c
	defb 0ech		;6d7d
	defb 088h		;6d7e
	defb 007h		;6d7f
	defb 007h		;6d80
	defb 0fah		;6d81
	defb 0edh		;6d82
	defb 088h		;6d83
	defb 00ch		;6d84
	defb 006h		;6d85
	defb 000h		;6d86
	defb 0a8h		;6d87
	defb 089h		;6d88
	defb 002h		;6d89
	defb 006h		;6d8a
	defb 007h		;6d8b
	defb 000h		;6d8c
	defb 0eeh		;6d8d
	defb 088h		;6d8e
	defb 0ffh		;6d8f
	defb 003h		;6d90
	defb 001h		;6d91
	defb 002h		;6d92
	defb 01dh		;6d93
	defb 002h		;6d94
	defb 0fah		;6d95
	defb 0b7h		;6d96
	defb 089h		;6d97
	defb 0ffh		;6d98
	defb 003h		;6d99
	defb 001h		;6d9a
	defb 000h		;6d9b
	defb 020h		;6d9c  ' '
	defb 0feh		;6d9d
	defb 094h		;6d9e
	defb 089h		;6d9f
	defb 000h		;6da0
	defb 040h		;6da1  '@'
	defb 0fah		;6da2
	defb 0b4h		;6da3
	defb 089h		;6da4
	defb 0ffh		;6da5
	defb 003h		;6da6
	defb 001h		;6da7
	defb 000h		;6da8
	defb 020h		;6da9  ' '
	defb 0feh		;6daa
	defb 094h		;6dab
	defb 089h		;6dac
	defb 000h		;6dad
	defb 040h		;6dae  '@'
	defb 0fah		;6daf
	defb 0b4h		;6db0
	defb 089h		;6db1
	defb 002h		;6db2
	defb 002h		;6db3
	defb 006h		;6db4
	defb 010h		;6db5
	defb 0e7h		;6db6
	defb 088h		;6db7
	defb 000h		;6db8
	defb 005h		;6db9
	defb 0cch		;6dba
	defb 0c6h		;6dbb
	defb 088h		;6dbc
	defb 002h		;6dbd
	defb 00bh		;6dbe
	defb 006h		;6dbf
	defb 01eh		;6dc0
	defb 001h		;6dc1
	defb 088h		;6dc2
	defb 012h		;6dc3
	defb 01ch		;6dc4
	defb 0e2h		;6dc5
	defb 087h		;6dc6
	defb 01ch		;6dc7
	defb 061h		;6dc8  'a'
	defb 088h		;6dc9
	defb 01ch		;6dca
	defb 000h		;6dcb
	defb 088h		;6dcc
	defb 01ch		;6dcd
	defb 03fh		;6dce  '?'
	defb 088h		;6dcf
	defb 020h		;6dd0  ' '
	defb 0e7h		;6dd1
	defb 087h		;6dd2
	defb 020h		;6dd3  ' '
	defb 04ah		;6dd4  'J'
	defb 088h		;6dd5
	defb 020h		;6dd6  ' '
	defb 009h		;6dd7
	defb 088h		;6dd8
	defb 004h		;6dd9
	defb 07fh		;6dda
	defb 066h		;6ddb  'f'
	defb 089h		;6ddc
	defb 004h		;6ddd
	defb 080h		;6dde
	defb 086h		;6ddf
	defb 089h		;6de0
	defb 0ffh		;6de1
	defb 003h		;6de2
	defb 001h		;6de3
	defb 002h		;6de4
	defb 004h		;6de5
	defb 004h		;6de6
	defb 0fah		;6de7
	defb 0b4h		;6de8
	defb 087h		;6de9
	defb 002h		;6dea
	defb 004h		;6deb
	defb 006h		;6dec
	defb 0fah		;6ded
	defb 034h		;6dee  '4'
	defb 089h		;6def
	defb 000h		;6df0
	defb 00bh		;6df1
	defb 0f2h		;6df2
	defb 038h		;6df3  '8'
	defb 089h		;6df4
	defb 000h		;6df5
	defb 011h		;6df6
	defb 007h		;6df7
	defb 043h		;6df8  'C'
	defb 089h		;6df9
	defb 007h		;6dfa
	defb 004h		;6dfb
	defb 003h		;6dfc
	defb 05bh		;6dfd  '['
	defb 089h		;6dfe
	defb 007h		;6dff
	defb 005h		;6e00
	defb 0f3h		;6e01
	defb 05ch		;6e02  '\'
	defb 089h		;6e03
	defb 0ffh		;6e04
	defb 003h		;6e05
	defb 001h		;6e06
	defb 002h		;6e07
	defb 004h		;6e08
	defb 012h		;6e09
	defb 0fah		;6e0a
	defb 0b4h		;6e0b
	defb 087h		;6e0c
	defb 0ffh		;6e0d
	defb 003h		;6e0e
	defb 001h		;6e0f
	defb 002h		;6e10
	defb 004h		;6e11
	defb 012h		;6e12
	defb 0fah		;6e13
	defb 0b4h		;6e14
	defb 087h		;6e15
	defb 004h		;6e16
	defb 0fah		;6e17
	defb 0b8h		;6e18
	defb 089h		;6e19
	defb 001h		;6e1a
	defb 00eh		;6e1b
	defb 001h		;6e1c
	defb 0f7h		;6e1d
	defb 087h		;6e1e
	defb 001h		;6e1f
	defb 006h		;6e20
	defb 001h		;6e21
	defb 0f6h		;6e22
	defb 087h		;6e23
	defb 002h		;6e24
	defb 002h		;6e25
	defb 003h		;6e26
	defb 001h		;6e27
	defb 0f5h		;6e28
	defb 088h		;6e29
	defb 0ffh		;6e2a
	defb 003h		;6e2b
	defb 001h		;6e2c
	defb 002h		;6e2d
	defb 004h		;6e2e
	defb 003h		;6e2f
	defb 0fah		;6e30
	defb 094h		;6e31
	defb 089h		;6e32
	defb 0ffh		;6e33
	defb 002h		;6e34
	defb 004h		;6e35
	defb 00fh		;6e36
	defb 001h		;6e37
	defb 0b4h		;6e38
	defb 087h		;6e39
	defb 002h		;6e3a
	defb 003h		;6e3b
	defb 006h		;6e3c
	defb 0fah		;6e3d
	defb 0b7h		;6e3e
	defb 087h		;6e3f
	defb 000h		;6e40
	defb 01ah		;6e41
	defb 0fch		;6e42
	defb 0bah		;6e43
	defb 087h		;6e44
	defb 000h		;6e45
	defb 008h		;6e46
	defb 0fah		;6e47
	defb 097h		;6e48
	defb 089h		;6e49
	defb 000h		;6e4a
	defb 003h		;6e4b
	defb 0feh		;6e4c
	defb 094h		;6e4d
	defb 089h		;6e4e
	defb 000h		;6e4f
	defb 040h		;6e50  '@'
	defb 0fah		;6e51
	defb 0b4h		;6e52
	defb 089h		;6e53
	defb 001h		;6e54
	defb 00ah		;6e55
	defb 002h		;6e56
	defb 058h		;6e57  'X'
	defb 088h		;6e58
	defb 000h		;6e59
	defb 004h		;6e5a
	defb 0fch		;6e5b
	defb 0b0h		;6e5c
	defb 088h		;6e5d
	defb 027h		;6e5e  '''
	defb 06dh		;6e5f  'm'
	defb 0ffh		;6e60
	defb 003h		;6e61
	defb 001h		;6e62
	defb 002h		;6e63
	defb 004h		;6e64
	defb 002h		;6e65
	defb 0fah		;6e66
	defb 0b4h		;6e67
	defb 087h		;6e68
	defb 002h		;6e69
	defb 00ah		;6e6a
	defb 004h		;6e6b
	defb 0fah		;6e6c
	defb 0f4h		;6e6d
	defb 087h		;6e6e
	defb 002h		;6e6f
	defb 008h		;6e70
	defb 008h		;6e71
	defb 013h		;6e72
	defb 074h		;6e73  't'
	defb 088h		;6e74
	defb 000h		;6e75
	defb 00eh		;6e76
	defb 0fah		;6e77
	defb 074h		;6e78  't'
	defb 089h		;6e79
	defb 000h		;6e7a
	defb 060h		;6e7b  '`' (Spectrum: GBP)
	defb 0fah		;6e7c
	defb 094h		;6e7d
	defb 089h		;6e7e
	defb 000h		;6e7f
	defb 012h		;6e80
	defb 0feh		;6e81
	defb 0a2h		;6e82
	defb 089h		;6e83
	defb 001h		;6e84
	defb 008h		;6e85
	defb 032h		;6e86  '2'
	defb 0bch		;6e87
	defb 08ah		;6e88
	defb 06ch		;6e89  'l'
	defb 0ffh		;6e8a
	defb 003h		;6e8b
	defb 001h		;6e8c
	defb 002h		;6e8d
	defb 004h		;6e8e
	defb 003h		;6e8f
	defb 0fah		;6e90
	defb 0b4h		;6e91
	defb 087h		;6e92
	defb 002h		;6e93
	defb 004h		;6e94
	defb 003h		;6e95
	defb 0fah		;6e96
	defb 094h		;6e97
	defb 089h		;6e98
	defb 000h		;6e99
	defb 007h		;6e9a
	defb 0f2h		;6e9b
	defb 0b8h		;6e9c
	defb 089h		;6e9d
	defb 001h		;6e9e
	defb 00dh		;6e9f
	defb 002h		;6ea0
	defb 0f6h		;6ea1
	defb 087h		;6ea2
	defb 0ffh		;6ea3
	defb 000h		;6ea4
	defb 03ah		;6ea5  ':'
	defb 0fch		;6ea6
	defb 0bah		;6ea7
	defb 089h		;6ea8
	defb 002h		;6ea9
	defb 003h		;6eaa
	defb 012h		;6eab
	defb 001h		;6eac
	defb 0b4h		;6ead
	defb 087h		;6eae
	defb 002h		;6eaf
	defb 003h		;6eb0
	defb 012h		;6eb1
	defb 0fah		;6eb2
	defb 0b7h		;6eb3
	defb 087h		;6eb4
	defb 028h		;6eb5  '('
	defb 03fh		;6eb6  '?'
	defb 062h		;6eb7  'b'
	defb 0ffh		;6eb8
	defb 000h		;6eb9
	defb 01ah		;6eba
	defb 0fch		;6ebb
	defb 0bah		;6ebc
	defb 087h		;6ebd
	defb 002h		;6ebe
	defb 004h		;6ebf
	defb 003h		;6ec0
	defb 0fch		;6ec1
	defb 070h		;6ec2  'p'
	defb 089h		;6ec3
	defb 000h		;6ec4
	defb 027h		;6ec5  '''
	defb 0fch		;6ec6
	defb 0cdh		;6ec7
	defb 089h		;6ec8
	defb 001h		;6ec9
	defb 009h		;6eca
	defb 002h		;6ecb
	defb 058h		;6ecc  'X'
	defb 088h		;6ecd
	defb 002h		;6ece
	defb 004h		;6ecf
	defb 012h		;6ed0
	defb 001h		;6ed1
	defb 0b4h		;6ed2
	defb 087h		;6ed3
	defb 002h		;6ed4
	defb 003h		;6ed5
	defb 005h		;6ed6
	defb 0fah		;6ed7
	defb 0b7h		;6ed8
	defb 087h		;6ed9
	defb 002h		;6eda
	defb 003h		;6edb
	defb 004h		;6edc
	defb 0fah		;6edd
	defb 077h		;6ede  'w'
	defb 089h		;6edf
	defb 021h		;6ee0  '!'
	defb 001h		;6ee1
	defb 0eah		;6ee2
	defb 089h		;6ee3
	defb 061h		;6ee4  'a'
	defb 062h		;6ee5  'b'
	defb 063h		;6ee6  'c'
	defb 013h		;6ee7
	defb 0ffh		;6ee8
	defb 000h		;6ee9
	defb 026h		;6eea  '&'
	defb 0fch		;6eeb
	defb 0b7h		;6eec
	defb 087h		;6eed
	defb 000h		;6eee
	defb 03ah		;6eef  ':'
	defb 0fch		;6ef0
	defb 0bah		;6ef1
	defb 089h		;6ef2
	defb 002h		;6ef3
	defb 006h		;6ef4
	defb 008h		;6ef5
	defb 0fah		;6ef6
	defb 0f4h		;6ef7
	defb 088h		;6ef8
	defb 002h		;6ef9
	defb 003h		;6efa
	defb 005h		;6efb
	defb 001h		;6efc
	defb 054h		;6efd  'T'
	defb 089h		;6efe
	defb 002h		;6eff
	defb 003h		;6f00
	defb 00bh		;6f01
	defb 001h		;6f02
	defb 0b4h		;6f03
	defb 087h		;6f04
	defb 002h		;6f05
	defb 003h		;6f06
	defb 004h		;6f07
	defb 0fah		;6f08
	defb 0b7h		;6f09
	defb 087h		;6f0a
	defb 021h		;6f0b  '!'
	defb 010h		;6f0c
	defb 0cah		;6f0d
	defb 087h		;6f0e
	defb 028h		;6f0f  '('
	defb 0ffh		;6f10
	defb 000h		;6f11
	defb 006h		;6f12
	defb 0fch		;6f13
	defb 0b4h		;6f14
	defb 087h		;6f15
	defb 000h		;6f16
	defb 00ah		;6f17
	defb 0fch		;6f18
	defb 0b4h		;6f19
	defb 089h		;6f1a
	defb 000h		;6f1b
	defb 020h		;6f1c  ' '
	defb 0fch		;6f1d
	defb 0d4h		;6f1e
	defb 089h		;6f1f
	defb 000h		;6f20
	defb 004h		;6f21
	defb 06fh		;6f22  'o'
	defb 0e4h		;6f23
	defb 089h		;6f24
	defb 021h		;6f25  '!'
	defb 011h		;6f26
	defb 0d7h		;6f27
	defb 087h		;6f28
	defb 063h		;6f29  'c'
	defb 013h		;6f2a
	defb 0ffh		;6f2b
	defb 000h		;6f2c
	defb 020h		;6f2d  ' '
	defb 0fch		;6f2e
	defb 054h		;6f2f  'T'
	defb 089h		;6f30
	defb 000h		;6f31
	defb 006h		;6f32
	defb 06fh		;6f33  'o'
	defb 068h		;6f34  'h'
	defb 089h		;6f35
	defb 062h		;6f36  'b'
	defb 063h		;6f37  'c'
	defb 013h		;6f38
	defb 03ah		;6f39  ':'
	defb 03ch		;6f3a  '<'
	defb 03bh		;6f3b  ';'
	defb 0ffh		;6f3c
	defb 009h		;6f3d
	defb 005h		;6f3e
	defb 006h		;6f3f
	defb 002h		;6f40
	defb 005h		;6f41
	defb 005h		;6f42
	defb 006h		;6f43
	defb 002h		;6f44
	defb 005h		;6f45
	defb 005h		;6f46
	defb 006h		;6f47
	defb 002h		;6f48
	defb 005h		;6f49
	defb 00eh		;6f4a
	defb 012h		;6f4b
	defb 0c3h		;6f4c
	defb 087h		;6f4d
	defb 0ffh		;6f4e
	defb 009h		;6f4f
	defb 005h		;6f50
	defb 005h		;6f51
	defb 005h		;6f52
	defb 005h		;6f53
	defb 00eh		;6f54
	defb 004h		;6f55
	defb 004h		;6f56
	defb 00eh		;6f57
	defb 001h		;6f58
	defb 001h		;6f59
	defb 001h		;6f5a
	defb 001h		;6f5b
	defb 0ffh		;6f5c
	defb 009h		;6f5d
	defb 005h		;6f5e
	defb 006h		;6f5f
	defb 002h		;6f60
	defb 005h		;6f61
	defb 004h		;6f62
	defb 007h		;6f63
	defb 002h		;6f64
	defb 005h		;6f65
	defb 001h		;6f66
	defb 001h		;6f67
	defb 003h		;6f68
	defb 005h		;6f69
	defb 00eh		;6f6a
	defb 00fh		;6f6b
	defb 0c3h		;6f6c
	defb 087h		;6f6d
	defb 0ffh		;6f6e
l6f6fh:
	defb 009h		;6f6f
	defb 005h		;6f70
	defb 006h		;6f71
	defb 002h		;6f72
	defb 005h		;6f73
	defb 005h		;6f74
	defb 006h		;6f75
	defb 00bh		;6f76
	defb 00eh		;6f77
	defb 005h		;6f78
	defb 008h		;6f79
	defb 001h		;6f7a
	defb 001h		;6f7b
	defb 00eh		;6f7c
	defb 00fh		;6f7d
	defb 0c3h		;6f7e
	defb 087h		;6f7f
	defb 0ffh		;6f80
	defb 009h		;6f81
	defb 005h		;6f82
	defb 005h		;6f83
	defb 005h		;6f84
	defb 005h		;6f85
	defb 004h		;6f86
	defb 00eh		;6f87
	defb 00dh		;6f88
	defb 005h		;6f89
	defb 001h		;6f8a
	defb 009h		;6f8b
	defb 002h		;6f8c
	defb 005h		;6f8d
	defb 00eh		;6f8e
	defb 00ch		;6f8f
	defb 083h		;6f90
	defb 088h		;6f91
	defb 000h		;6f92
	defb 006h		;6f93
	defb 0f2h		;6f94
	defb 09dh		;6f95
	defb 089h		;6f96
	defb 0ffh		;6f97
	defb 009h		;6f98
	defb 005h		;6f99
	defb 005h		;6f9a
	defb 005h		;6f9b
	defb 005h		;6f9c
	defb 005h		;6f9d
	defb 00ch		;6f9e
	defb 00eh		;6f9f
	defb 004h		;6fa0
	defb 005h		;6fa1
	defb 006h		;6fa2
	defb 00ah		;6fa3
	defb 001h		;6fa4
	defb 00eh		;6fa5
	defb 00ch		;6fa6
	defb 083h		;6fa7
	defb 088h		;6fa8
	defb 000h		;6fa9
	defb 005h		;6faa
	defb 0f2h		;6fab
	defb 0a5h		;6fac
	defb 089h		;6fad
	defb 0ffh		;6fae
	defb 009h		;6faf
	defb 005h		;6fb0
	defb 006h		;6fb1
	defb 002h		;6fb2
	defb 005h		;6fb3
	defb 004h		;6fb4
	defb 007h		;6fb5
	defb 00bh		;6fb6
	defb 00eh		;6fb7
	defb 001h		;6fb8
	defb 001h		;6fb9
	defb 001h		;6fba
	defb 001h		;6fbb
	defb 00eh		;6fbc
	defb 00fh		;6fbd
	defb 0c3h		;6fbe
	defb 087h		;6fbf
	defb 0ffh		;6fc0
	defb 009h		;6fc1
	defb 005h		;6fc2
l6fc3h:
	defb 005h		;6fc3
	defb 005h		;6fc4
	defb 005h		;6fc5
	defb 004h		;6fc6
	defb 00eh		;6fc7
	defb 004h		;6fc8
	defb 00eh		;6fc9
	defb 001h		;6fca
	defb 009h		;6fcb
	defb 00ah		;6fcc
	defb 001h		;6fcd
	defb 000h		;6fce
	defb 00dh		;6fcf
	defb 0f2h		;6fd0
	defb 09dh		;6fd1
	defb 089h		;6fd2
	defb 00eh		;6fd3
	defb 00ch		;6fd4
	defb 083h		;6fd5
	defb 088h		;6fd6
	defb 0ffh		;6fd7
	defb 009h		;6fd8
	defb 005h		;6fd9
	defb 006h		;6fda
	defb 002h		;6fdb
	defb 005h		;6fdc
	defb 005h		;6fdd
	defb 006h		;6fde
	defb 00bh		;6fdf
	defb 004h		;6fe0
	defb 005h		;6fe1
	defb 006h		;6fe2
	defb 00ah		;6fe3
	defb 001h		;6fe4
	defb 00eh		;6fe5
	defb 012h		;6fe6
	defb 0c3h		;6fe7
	defb 087h		;6fe8
	defb 000h		;6fe9
	defb 005h		;6fea
	defb 0f2h		;6feb
	defb 0a5h		;6fec
	defb 089h		;6fed
	defb 0ffh		;6fee
	defb 009h		;6fef
	defb 005h		;6ff0
	defb 006h		;6ff1
	defb 002h		;6ff2
	defb 005h		;6ff3
	defb 00eh		;6ff4
	defb 007h		;6ff5
	defb 002h		;6ff6
	defb 005h		;6ff7
	defb 001h		;6ff8
	defb 009h		;6ff9
	defb 002h		;6ffa
	defb 005h		;6ffb
	defb 00eh		;6ffc
	defb 012h		;6ffd
	defb 0c3h		;6ffe
	defb 087h		;6fff
	defb 000h		;7000
	defb 006h		;7001
	defb 0f2h		;7002
	defb 09dh		;7003
	defb 089h		;7004
	defb 0ffh		;7005
	defb 009h		;7006
	defb 005h		;7007
	defb 006h		;7008
	defb 002h		;7009
	defb 005h		;700a
	defb 004h		;700b
	defb 007h		;700c
	defb 00bh		;700d
	defb 004h		;700e
	defb 001h		;700f
	defb 009h		;7010
	defb 00ah		;7011
	defb 001h		;7012
	defb 000h		;7013
	defb 00dh		;7014
	defb 0f2h		;7015
	defb 09dh		;7016
	defb 089h		;7017
	defb 00eh		;7018
	defb 012h		;7019
	defb 0c3h		;701a
	defb 087h		;701b
	defb 0ffh		;701c
	defb 009h		;701d
	defb 005h		;701e
	defb 005h		;701f
	defb 005h		;7020
	defb 005h		;7021
	defb 005h		;7022
	defb 00ch		;7023
	defb 004h		;7024
	defb 00eh		;7025
	defb 005h		;7026
	defb 008h		;7027
	defb 001h		;7028
	defb 001h		;7029
	defb 0ffh		;702a
	defb 009h		;702b
	defb 005h		;702c
	defb 005h		;702d
	defb 005h		;702e
	defb 005h		;702f
	defb 00eh		;7030
	defb 004h		;7031
	defb 00dh		;7032
	defb 005h		;7033
	defb 001h		;7034
	defb 001h		;7035
	defb 003h		;7036
	defb 005h		;7037
	defb 0ffh		;7038
	defb 009h		;7039
	defb 00ch		;703a
	defb 007h		;703b
	defb 00bh		;703c
	defb 00dh		;703d
	defb 006h		;703e
	defb 000h		;703f
	defb 000h		;7040
	defb 002h		;7041
	defb 008h		;7042
	defb 001h		;7043
	defb 001h		;7044
	defb 003h		;7045
	defb 00eh		;7046
	defb 00fh		;7047
	defb 0c3h		;7048
	defb 087h		;7049
	defb 0ffh		;704a
	defb 009h		;704b
	defb 005h		;704c
	defb 005h		;704d
	defb 005h		;704e
	defb 005h		;704f
	defb 004h		;7050
	defb 00eh		;7051
	defb 00eh		;7052
	defb 004h		;7053
	defb 001h		;7054
	defb 001h		;7055
	defb 001h		;7056
	defb 001h		;7057
	defb 0ffh		;7058
	defb 009h		;7059
	defb 00fh		;705a
	defb 00fh		;705b
	defb 00fh		;705c
	defb 00fh		;705d
	defb 000h		;705e
	defb 000h		;705f
	defb 000h		;7060
	defb 000h		;7061
	defb 001h		;7062
	defb 001h		;7063
	defb 001h		;7064
	defb 001h		;7065
	defb 030h		;7066  '0'
	defb 02ch		;7067  ','
	defb 0ffh		;7068
	defb 009h		;7069
	defb 010h		;706a
	defb 010h		;706b
	defb 010h		;706c
	defb 010h		;706d
	defb 010h		;706e
	defb 010h		;706f
	defb 010h		;7070
	defb 010h		;7071
	defb 011h		;7072
	defb 010h		;7073
	defb 010h		;7074
	defb 010h		;7075
	defb 013h		;7076
	defb 0ffh		;7077
	defb 009h		;7078
	defb 012h		;7079
	defb 010h		;707a
	defb 010h		;707b
	defb 010h		;707c
	defb 012h		;707d
	defb 010h		;707e
	defb 010h		;707f
	defb 010h		;7080
	defb 012h		;7081
	defb 010h		;7082
	defb 010h		;7083
	defb 010h		;7084
	defb 013h		;7085
	defb 0ffh		;7086
	defb 009h		;7087
	defb 012h		;7088
	defb 010h		;7089
	defb 010h		;708a
	defb 010h		;708b
	defb 013h		;708c
	defb 010h		;708d
	defb 010h		;708e
	defb 010h		;708f
	defb 014h		;7090
	defb 010h		;7091
	defb 010h		;7092
	defb 010h		;7093
	defb 013h		;7094
	defb 0ffh		;7095
	defb 009h		;7096
	defb 00ch		;7097
	defb 004h		;7098
	defb 004h		;7099
	defb 00eh		;709a
	defb 007h		;709b
	defb 000h		;709c
	defb 000h		;709d
	defb 000h		;709e
	defb 001h		;709f
	defb 001h		;70a0
	defb 009h		;70a1
	defb 000h		;70a2
	defb 0ffh		;70a3
	defb 009h		;70a4
	defb 004h		;70a5
	defb 00eh		;70a6
	defb 004h		;70a7
	defb 00eh		;70a8
; --- 8 zero bytes ---
	defb 000h		;70a9
	defb 000h		;70aa
	defb 000h		;70ab
	defb 000h		;70ac
	defb 000h		;70ad
	defb 000h		;70ae
	defb 000h		;70af
	defb 000h		;70b0
	defb 0ffh		;70b1
	defb 009h		;70b2
	defb 004h		;70b3
	defb 00eh		;70b4
	defb 00dh		;70b5
	defb 005h		;70b6
	defb 000h		;70b7
	defb 000h		;70b8
	defb 00bh		;70b9
	defb 004h		;70ba
	defb 000h		;70bb
	defb 000h		;70bc
	defb 00ah		;70bd
	defb 001h		;70be
	defb 0ffh		;70bf
	defb 009h		;70c0
	defb 005h		;70c1
	defb 005h		;70c2
	defb 006h		;70c3
	defb 000h		;70c4
	defb 005h		;70c5
	defb 00ch		;70c6
	defb 007h		;70c7
	defb 000h		;70c8
	defb 005h		;70c9
	defb 006h		;70ca
	defb 000h		;70cb
	defb 000h		;70cc
	defb 0ffh		;70cd
	defb 003h		;70ce
	defb 008h		;70cf
	defb 0ffh		;70d0
	defb 009h		;70d1
	defb 000h		;70d2
	defb 000h		;70d3
	defb 00bh		;70d4
	defb 00dh		;70d5
	defb 000h		;70d6
	defb 000h		;70d7
	defb 000h		;70d8
	defb 00bh		;70d9
	defb 000h		;70da
	defb 000h		;70db
	defb 000h		;70dc
	defb 00ah		;70dd
	defb 0ffh		;70de
	defb 009h		;70df
	defb 005h		;70e0
	defb 008h		;70e1
	defb 009h		;70e2
	defb 000h		;70e3
	defb 005h		;70e4
	defb 005h		;70e5
	defb 008h		;70e6
	defb 001h		;70e7
	defb 005h		;70e8
	defb 005h		;70e9
	defb 005h		;70ea
	defb 005h		;70eb
	defb 0ffh		;70ec
	defb 009h		;70ed
	defb 000h		;70ee
	defb 00ah		;70ef
	defb 001h		;70f0
	defb 009h		;70f1
	defb 001h		;70f2
	defb 003h		;70f3
	defb 005h		;70f4
	defb 006h		;70f5
	defb 005h		;70f6
	defb 005h		;70f7
	defb 005h		;70f8
	defb 008h		;70f9
	defb 007h		;70fa
	defb 005h		;70fb
	defb 003h		;70fc
	defb 03fh		;70fd  '?'
	defb 088h		;70fe
	defb 007h		;70ff
	defb 005h		;7100
	defb 0f3h		;7101
	defb 040h		;7102  '@'
	defb 088h		;7103
	defb 0ffh		;7104
	defb 009h		;7105
	defb 000h		;7106
	defb 000h		;7107
	defb 000h		;7108
	defb 002h		;7109
	defb 000h		;710a
	defb 000h		;710b
	defb 000h		;710c
	defb 00bh		;710d
	defb 001h		;710e
	defb 001h		;710f
	defb 001h		;7110
	defb 001h		;7111
	defb 0ffh		;7112
	defb 003h		;7113
	defb 001h		;7114
	defb 000h		;7115
	defb 01dh		;7116
	defb 0feh		;7117
	defb 097h		;7118
	defb 089h		;7119
	defb 002h		;711a
	defb 003h		;711b
	defb 010h		;711c
	defb 0fah		;711d
	defb 0b4h		;711e
	defb 087h		;711f
	defb 000h		;7120
	defb 040h		;7121  '@'
	defb 0fah		;7122
	defb 0b4h		;7123
	defb 089h		;7124
	defb 000h		;7125
	defb 00eh		;7126
	defb 0f2h		;7127
	defb 0bdh		;7128
	defb 089h		;7129
	defb 000h		;712a
	defb 00ah		;712b
	defb 008h		;712c
	defb 0dfh		;712d
	defb 089h		;712e
	defb 000h		;712f
	defb 00ch		;7130
	defb 001h		;7131
	defb 09eh		;7132
	defb 089h		;7133
	defb 00eh		;7134
	defb 002h		;7135
	defb 0c3h		;7136
	defb 089h		;7137
	defb 0ffh		;7138
	defb 003h		;7139
	defb 001h		;713a
	defb 002h		;713b
	defb 003h		;713c
	defb 00fh		;713d
	defb 0fah		;713e
	defb 0b4h		;713f
	defb 087h		;7140
	defb 000h		;7141
	defb 060h		;7142  '`' (Spectrum: GBP)
	defb 0fah		;7143
	defb 094h		;7144
	defb 089h		;7145
	defb 0ffh		;7146
	defb 003h		;7147
	defb 0fah		;7148
	defb 002h		;7149
	defb 01fh		;714a
	defb 00ch		;714b
	defb 008h		;714c
	defb 0b5h		;714d
	defb 087h		;714e
	defb 002h		;714f
	defb 006h		;7150
	defb 006h		;7151
	defb 008h		;7152
	defb 039h		;7153  '9'
	defb 089h		;7154
	defb 002h		;7155
	defb 00fh		;7156
	defb 003h		;7157
	defb 008h		;7158
	defb 045h		;7159  'E'
	defb 089h		;715a
	defb 00dh		;715b
	defb 002h		;715c
	defb 008h		;715d
	defb 043h		;715e  'C'
	defb 089h		;715f
	defb 001h		;7160
	defb 006h		;7161
	defb 0d5h		;7162
	defb 038h		;7163  '8'
	defb 089h		;7164
	defb 063h		;7165  'c'
	defb 064h		;7166  'd'
	defb 013h		;7167
	defb 001h		;7168
	defb 006h		;7169
	defb 0d4h		;716a
	defb 03fh		;716b  '?'
	defb 089h		;716c
l716dh:
	defb 011h		;716d
	defb 039h		;716e  '9'
	defb 089h		;716f
	defb 0ffh		;7170
	defb 003h		;7171
	defb 0fah		;7172
	defb 002h		;7173
	defb 006h		;7174
	defb 012h		;7175
	defb 008h		;7176
	defb 0b9h		;7177
	defb 087h		;7178
	defb 001h		;7179
	defb 012h		;717a
	defb 0d5h		;717b
	defb 0b8h		;717c
	defb 087h		;717d
	defb 001h		;717e
	defb 012h		;717f
	defb 0d4h		;7180
	defb 0bfh		;7181
	defb 087h		;7182
	defb 02eh		;7183  '.'
	defb 0ffh		;7184
	defb 003h		;7185
	defb 0fah		;7186
	defb 002h		;7187
	defb 01bh		;7188
	defb 00eh		;7189
	defb 008h		;718a
	defb 0b9h		;718b
	defb 087h		;718c
	defb 000h		;718d
	defb 015h		;718e
	defb 0fah		;718f
	defb 0bfh		;7190
	defb 087h		;7191
	defb 000h		;7192
	defb 00eh		;7193
	defb 008h		;7194
	defb 086h		;7195
	defb 089h		;7196
	defb 011h		;7197
	defb 059h		;7198  'Y'
	defb 089h		;7199
	defb 001h		;719a
	defb 00eh		;719b
	defb 0d5h		;719c
	defb 0b8h		;719d
	defb 087h		;719e
	defb 001h		;719f
	defb 00dh		;71a0
	defb 032h		;71a1  '2'
	defb 01fh		;71a2
	defb 08ah		;71a3
l71a4h:
	defb 000h		;71a4
	defb 006h		;71a5
	defb 008h		;71a6
	defb 059h		;71a7  'Y'
	defb 089h		;71a8
	defb 0ffh		;71a9
	defb 002h		;71aa
	defb 00ah		;71ab
	defb 012h		;71ac
	defb 0fah		;71ad
	defb 0b4h		;71ae
	defb 087h		;71af
	defb 002h		;71b0
	defb 008h		;71b1
	defb 00fh		;71b2
	defb 000h		;71b3
	defb 0d4h		;71b4
	defb 087h		;71b5
	defb 002h		;71b6
	defb 007h		;71b7
	defb 012h		;71b8
	defb 0fah		;71b9
	defb 0cdh		;71ba
	defb 087h		;71bb
	defb 001h		;71bc
	defb 002h		;71bd
	defb 0f7h		;71be
	defb 0ddh		;71bf
	defb 088h		;71c0
	defb 001h		;71c1
	defb 002h		;71c2
	defb 000h		;71c3
	defb 0dch		;71c4
	defb 088h		;71c5
	defb 002h		;71c6
	defb 007h		;71c7
	defb 012h		;71c8
	defb 0fbh		;71c9
	defb 0c2h		;71ca
	defb 087h		;71cb
	defb 000h		;71cc
	defb 007h		;71cd
	defb 0f8h		;71ce
	defb 0a2h		;71cf
	defb 089h		;71d0
	defb 001h		;71d1
	defb 006h		;71d2
	defb 0f8h		;71d3
	defb 065h		;71d4  'e'
	defb 088h		;71d5
	defb 014h		;71d6
	defb 060h		;71d7  '`' (Spectrum: GBP)
	defb 088h		;71d8
	defb 015h		;71d9
	defb 069h		;71da  'i'
	defb 088h		;71db
	defb 023h		;71dc  '#'
	defb 049h		;71dd  'I'
	defb 04ah		;71de  'J'
	defb 0ffh		;71df
	defb 000h		;71e0
	defb 060h		;71e1  '`' (Spectrum: GBP)
	defb 0fah		;71e2
	defb 094h		;71e3
	defb 089h		;71e4
	defb 002h		;71e5
	defb 00ah		;71e6
	defb 005h		;71e7
	defb 0fah		;71e8
	defb 0b4h		;71e9
	defb 087h		;71ea
	defb 001h		;71eb
	defb 00ch		;71ec
	defb 0f7h		;71ed
	defb 03dh		;71ee  '='
	defb 088h		;71ef
	defb 002h		;71f0
	defb 007h		;71f1
	defb 005h		;71f2
	defb 0fah		;71f3
	defb 0cdh		;71f4
	defb 087h		;71f5
	defb 001h		;71f6
	defb 00ch		;71f7
	defb 0f7h		;71f8
	defb 04dh		;71f9  'M'
	defb 088h		;71fa
	defb 002h		;71fb
	defb 006h		;71fc
	defb 00ah		;71fd
	defb 008h		;71fe
	defb 06eh		;71ff  'n'
	defb 088h		;7200
	defb 002h		;7201
	defb 007h		;7202
	defb 00ch		;7203
	defb 0fbh		;7204
	defb 0c2h		;7205
	defb 087h		;7206
	defb 002h		;7207
	defb 003h		;7208
	defb 004h		;7209
	defb 0cfh		;720a
	defb 024h		;720b  '$'
	defb 089h		;720c
	defb 001h		;720d
	defb 008h		;720e
	defb 0f8h		;720f
	defb 045h		;7210  'E'
	defb 088h		;7211
	defb 014h		;7212
	defb 040h		;7213  '@'
	defb 088h		;7214
	defb 015h		;7215
	defb 049h		;7216  'I'
	defb 088h		;7217
	defb 016h		;7218
	defb 017h		;7219
	defb 018h		;721a
	defb 019h		;721b
	defb 024h		;721c  '$'
	defb 0ffh		;721d
	defb 003h		;721e
	defb 001h		;721f
	defb 002h		;7220
	defb 004h		;7221
	defb 003h		;7222
	defb 0fah		;7223
	defb 0b0h		;7224
	defb 089h		;7225
	defb 0ffh		;7226
	defb 003h		;7227
	defb 001h		;7228
	defb 002h		;7229
	defb 004h		;722a
	defb 012h		;722b
	defb 0fah		;722c
	defb 0d0h		;722d
	defb 087h		;722e
	defb 0ffh		;722f
	defb 003h		;7230
	defb 0fah		;7231
	defb 002h		;7232
	defb 01ch		;7233
	defb 00fh		;7234
	defb 001h		;7235
	defb 0b4h		;7236
	defb 087h		;7237
	defb 013h		;7238
	defb 000h		;7239
	defb 01ch		;723a
	defb 0feh		;723b
	defb 094h		;723c
	defb 089h		;723d
	defb 002h		;723e
	defb 004h		;723f
	defb 008h		;7240
	defb 000h		;7241
	defb 030h		;7242  '0'
	defb 088h		;7243
	defb 002h		;7244
	defb 004h		;7245
	defb 008h		;7246
	defb 08ch		;7247
	defb 070h		;7248  'p'
	defb 08ah		;7249
	defb 0ffh		;724a
	defb 068h		;724b  'h'
	defb 000h		;724c
	defb 040h		;724d  '@'
	defb 0fah		;724e
	defb 0b4h		;724f
	defb 089h		;7250
	defb 001h		;7251
	defb 010h		;7252
	defb 0fah		;7253
	defb 0b4h		;7254
	defb 087h		;7255
	defb 000h		;7256
	defb 01fh		;7257
	defb 0fch		;7258
	defb 0b5h		;7259
	defb 088h		;725a
	defb 01ah		;725b
	defb 01eh		;725c
	defb 002h		;725d
	defb 0c5h		;725e
	defb 089h		;725f
	defb 01fh		;7260
	defb 00eh		;7261
	defb 010h		;7262
	defb 0cbh		;7263
	defb 087h		;7264
	defb 050h		;7265  'P'
	defb 051h		;7266  'Q'
	defb 053h		;7267  'S'
	defb 0ffh		;7268
	defb 068h		;7269  'h'
	defb 000h		;726a
	defb 003h		;726b
	defb 0fch		;726c
	defb 0b4h		;726d
	defb 088h		;726e
	defb 002h		;726f
	defb 008h		;7270
	defb 00fh		;7271
	defb 0fah		;7272
	defb 0cch		;7273
	defb 087h		;7274
	defb 000h		;7275
	defb 057h		;7276  'W'
	defb 0fah		;7277
	defb 09dh		;7278
	defb 089h		;7279
	defb 00ch		;727a
	defb 00eh		;727b
	defb 0fah		;727c
	defb 07eh		;727d  '~'
	defb 089h		;727e
	defb 0ffh		;727f
	defb 068h		;7280  'h'
	defb 001h		;7281
	defb 006h		;7282
	defb 0fah		;7283
	defb 0d3h		;7284
	defb 087h		;7285
	defb 002h		;7286
	defb 005h		;7287
	defb 004h		;7288
	defb 0fah		;7289
	defb 08fh		;728a
	defb 089h		;728b
	defb 00ch		;728c
	defb 003h		;728d
	defb 0fah		;728e
	defb 0ech		;728f
	defb 089h		;7290
	defb 000h		;7291
	defb 009h		;7292
	defb 0fch		;7293
	defb 0b4h		;7294
	defb 089h		;7295
	defb 000h		;7296
	defb 00dh		;7297
	defb 0fch		;7298
	defb 0b4h		;7299
	defb 088h		;729a
	defb 00eh		;729b
	defb 00eh		;729c
	defb 0cfh		;729d
	defb 087h		;729e
	defb 0ffh		;729f
	defb 068h		;72a0  'h'
	defb 001h		;72a1
	defb 012h		;72a2
	defb 0fah		;72a3
	defb 0b4h		;72a4
	defb 087h		;72a5
	defb 000h		;72a6
	defb 01fh		;72a7
	defb 0fch		;72a8
	defb 0b5h		;72a9
	defb 088h		;72aa
	defb 000h		;72ab
	defb 01fh		;72ac
	defb 0fch		;72ad
	defb 0b5h		;72ae
	defb 089h		;72af
	defb 00eh		;72b0
	defb 012h		;72b1
	defb 0cbh		;72b2
	defb 087h		;72b3
	defb 052h		;72b4  'R'
	defb 051h		;72b5  'Q'
	defb 0ffh		;72b6
	defb 068h		;72b7  'h'
	defb 000h		;72b8
	defb 021h		;72b9  '!'
	defb 0fah		;72ba
	defb 0b4h		;72bb
	defb 087h		;72bc
	defb 001h		;72bd
	defb 010h		;72be
	defb 0fah		;72bf
	defb 0f4h		;72c0
	defb 087h		;72c1
	defb 000h		;72c2
	defb 01fh		;72c3
	defb 0fch		;72c4
	defb 095h		;72c5
	defb 089h		;72c6
	defb 00eh		;72c7
	defb 003h		;72c8
	defb 0abh		;72c9
	defb 089h		;72ca
	defb 04dh		;72cb  'M'
	defb 040h		;72cc  '@'
	defb 0ffh		;72cd
	defb 068h		;72ce  'h'
	defb 000h		;72cf
	defb 020h		;72d0  ' '
	defb 0fah		;72d1
	defb 0b4h		;72d2
	defb 087h		;72d3
	defb 001h		;72d4
	defb 011h		;72d5
	defb 0fah		;72d6
	defb 0f3h		;72d7
	defb 087h		;72d8
	defb 000h		;72d9
	defb 01fh		;72da
	defb 0fch		;72db
	defb 094h		;72dc
	defb 089h		;72dd
	defb 00eh		;72de
	defb 011h		;72df
	defb 0efh		;72e0
	defb 087h		;72e1
	defb 038h		;72e2  '8'
	defb 04fh		;72e3  'O'
	defb 04eh		;72e4  'N'
	defb 0ffh		;72e5
	defb 009h		;72e6
	defb 005h		;72e7
	defb 006h		;72e8
	defb 002h		;72e9
	defb 005h		;72ea
	defb 00ch		;72eb
	defb 007h		;72ec
	defb 00bh		;72ed
	defb 00dh		;72ee
	defb 008h		;72ef
	defb 001h		;72f0
	defb 001h		;72f1
	defb 003h		;72f2
	defb 01bh		;72f3
	defb 01dh		;72f4
	defb 01eh		;72f5
	defb 00fh		;72f6
	defb 0c5h		;72f7
	defb 087h		;72f8
	defb 0ffh		;72f9
	defb 009h		;72fa
	defb 007h		;72fb
	defb 000h		;72fc
	defb 000h		;72fd
	defb 002h		;72fe
	defb 000h		;72ff
	defb 000h		;7300
	defb 000h		;7301
	defb 00bh		;7302
	defb 001h		;7303
	defb 001h		;7304
	defb 001h		;7305
	defb 001h		;7306
	defb 00eh		;7307
	defb 00fh		;7308
	defb 0cah		;7309
	defb 087h		;730a
	defb 06dh		;730b  'm'
	defb 0ffh		;730c
	defb 003h		;730d
	defb 008h		;730e
	defb 000h		;730f
	defb 020h		;7310  ' '
	defb 0fah		;7311
	defb 0b4h		;7312
	defb 087h		;7313
	defb 002h		;7314
	defb 003h		;7315
	defb 011h		;7316
	defb 0fah		;7317
	defb 0f1h		;7318
	defb 087h		;7319
	defb 002h		;731a
	defb 003h		;731b
	defb 003h		;731c
	defb 0fah		;731d
	defb 094h		;731e
	defb 089h		;731f
	defb 000h		;7320
	defb 01ch		;7321
	defb 0f2h		;7322
	defb 096h		;7323
	defb 089h		;7324
	defb 00eh		;7325
	defb 011h		;7326
	defb 0eah		;7327
	defb 087h		;7328
	defb 0ffh		;7329
	defb 009h		;732a
	defb 006h		;732b
	defb 000h		;732c
	defb 000h		;732d
	defb 002h		;732e
	defb 006h		;732f
	defb 000h		;7330
	defb 000h		;7331
	defb 002h		;7332
	defb 006h		;7333
	defb 000h		;7334
	defb 000h		;7335
	defb 002h		;7336
	defb 00eh		;7337
	defb 012h		;7338
	defb 0cah		;7339
	defb 087h		;733a
	defb 0ffh		;733b
	defb 003h		;733c
	defb 0fah		;733d
	defb 002h		;733e
	defb 01ah		;733f
	defb 00fh		;7340
	defb 008h		;7341
	defb 018h		;7342
	defb 088h		;7343
	defb 000h		;7344
	defb 01ch		;7345
	defb 0fch		;7346
	defb 097h		;7347
	defb 089h		;7348
	defb 00eh		;7349
	defb 00fh		;734a
	defb 02eh		;734b  '.'
	defb 088h		;734c
	defb 02dh		;734d  '-'
	defb 02ch		;734e  ','
	defb 0ffh		;734f
	defb 003h		;7350
	defb 0fah		;7351
	defb 002h		;7352
	defb 004h		;7353
	defb 00ah		;7354
	defb 008h		;7355
	defb 054h		;7356  'T'
	defb 088h		;7357
	defb 002h		;7358
	defb 01ah		;7359
	defb 00fh		;735a
	defb 008h		;735b
	defb 0b8h		;735c
	defb 087h		;735d
	defb 00eh		;735e
	defb 012h		;735f
	defb 0ceh		;7360
	defb 087h		;7361
	defb 002h		;7362
	defb 002h		;7363
	defb 003h		;7364
	defb 008h		;7365
	defb 0f6h		;7366
	defb 087h		;7367
	defb 04bh		;7368  'K'
	defb 04ch		;7369  'L'
	defb 066h		;736a  'f'
	defb 004h		;736b
	defb 008h		;736c
	defb 0b8h		;736d
	defb 088h		;736e
	defb 004h		;736f
	defb 008h		;7370
	defb 0bdh		;7371
	defb 088h		;7372
	defb 0ffh		;7373
	defb 003h		;7374
	defb 0fah		;7375
	defb 002h		;7376
	defb 01eh		;7377
	defb 007h		;7378
	defb 000h		;7379
	defb 0f4h		;737a
	defb 088h		;737b
	defb 000h		;737c
	defb 01fh		;737d
	defb 0fch		;737e
	defb 0d4h		;737f
	defb 089h		;7380
	defb 00eh		;7381
	defb 00ah		;7382
	defb 0ceh		;7383
	defb 087h		;7384
	defb 021h		;7385  '!'
	defb 007h		;7386
	defb 00eh		;7387
	defb 089h		;7388
	defb 0ffh		;7389
	defb 000h		;738a
	defb 080h		;738b
	defb 0fah		;738c
	defb 074h		;738d  't'
	defb 089h		;738e
	defb 002h		;738f
	defb 002h		;7390
	defb 006h		;7391
	defb 0fah		;7392
	defb 0d2h		;7393
	defb 087h		;7394
	defb 02ah		;7395  '*'
	defb 06dh		;7396  'm'
	defb 0ffh		;7397
	defb 000h		;7398
	defb 080h		;7399
	defb 0fah		;739a
	defb 074h		;739b  't'
	defb 089h		;739c
	defb 0ffh		;739d
	defb 000h		;739e
	defb 020h		;739f  ' '
	defb 0fch		;73a0
	defb 0d4h		;73a1
	defb 089h		;73a2
	defb 002h		;73a3
	defb 020h		;73a4  ' '
	defb 00ah		;73a5
	defb 0fah		;73a6
	defb 0b4h		;73a7
	defb 087h		;73a8
	defb 0ffh		;73a9
	defb 000h		;73aa
	defb 040h		;73ab  '@'
	defb 0fch		;73ac
	defb 0b4h		;73ad
	defb 089h		;73ae
	defb 021h		;73af  '!'
	defb 002h		;73b0
	defb 0b7h		;73b1
	defb 089h		;73b2
	defb 063h		;73b3  'c'
	defb 013h		;73b4
	defb 064h		;73b5  'd'
	defb 0ffh		;73b6
	defb 000h		;73b7
	defb 026h		;73b8  '&'
	defb 0fch		;73b9
	defb 054h		;73ba  'T'
	defb 089h		;73bb
	defb 002h		;73bc
	defb 006h		;73bd
	defb 003h		;73be
	defb 0fch		;73bf
	defb 094h		;73c0
	defb 089h		;73c1
	defb 021h		;73c2  '!'
	defb 00dh		;73c3
	defb 0b7h		;73c4
	defb 087h		;73c5
	defb 065h		;73c6  'e'
	defb 03bh		;73c7  ';'
	defb 03eh		;73c8  '>'
	defb 0ffh		;73c9
	defb 000h		;73ca
	defb 00ah		;73cb
	defb 0fch		;73cc
	defb 0b4h		;73cd
	defb 087h		;73ce
	defb 000h		;73cf
	defb 020h		;73d0  ' '
	defb 0fch		;73d1
	defb 094h		;73d2
	defb 088h		;73d3
	defb 000h		;73d4
	defb 007h		;73d5
	defb 0fah		;73d6
	defb 0b4h		;73d7
	defb 089h		;73d8
	defb 000h		;73d9
	defb 008h		;73da
	defb 0fah		;73db
	defb 0d4h		;73dc
	defb 089h		;73dd
	defb 021h		;73de  '!'
	defb 010h		;73df
	defb 0b7h		;73e0
	defb 087h		;73e1
	defb 0ffh		;73e2
	defb 000h		;73e3
	defb 040h		;73e4  '@'
	defb 0fch		;73e5
	defb 0b4h		;73e6
	defb 089h		;73e7
; "TUVbe"
	defb 054h		;73e8  'T'
	defb 055h		;73e9  'U'
	defb 056h		;73ea  'V'
	defb 062h		;73eb  'b'
	defb 065h		;73ec  'e'
	defb 0ffh		;73ed
	defb 000h		;73ee
	defb 020h		;73ef  ' '
	defb 0fch		;73f0
	defb 0d4h		;73f1
	defb 089h		;73f2
	defb 000h		;73f3
	defb 006h		;73f4
	defb 06fh		;73f5  'o'
	defb 0e8h		;73f6
	defb 089h		;73f7
	defb 066h		;73f8  'f'
	defb 065h		;73f9  'e'
	defb 0ffh		;73fa
	defb 002h		;73fb
	defb 008h		;73fc
	defb 00eh		;73fd
	defb 0fah		;73fe
	defb 0b4h		;73ff
	defb 087h		;7400
	defb 000h		;7401
	defb 080h		;7402
	defb 0fah		;7403
	defb 074h		;7404  't'
	defb 089h		;7405
	defb 00bh		;7406
	defb 00dh		;7407
	defb 0fah		;7408
	defb 05ch		;7409  '\'
	defb 089h		;740a
	defb 0ffh		;740b
	defb 000h		;740c
	defb 020h		;740d  ' '
	defb 0fch		;740e
	defb 0d4h		;740f
	defb 089h		;7410
	defb 000h		;7411
	defb 005h		;7412
	defb 06fh		;7413  'o'
	defb 0dbh		;7414
	defb 089h		;7415
	defb 063h		;7416  'c'
	defb 064h		;7417  'd'
	defb 013h		;7418
	defb 0ffh		;7419
	defb 000h		;741a
	defb 016h		;741b
	defb 0fch		;741c
	defb 094h		;741d
	defb 088h		;741e
	defb 002h		;741f
	defb 018h		;7420
	defb 006h		;7421
	defb 0ach		;7422
	defb 03ch		;7423  '<'
	defb 089h		;7424
	defb 0ffh		;7425
	defb 00ch		;7426
	defb 003h		;7427
	defb 0fah		;7428
	defb 0e6h		;7429
	defb 089h		;742a
	defb 002h		;742b
	defb 00bh		;742c
	defb 004h		;742d
	defb 0fah		;742e
	defb 089h		;742f
	defb 089h		;7430
	defb 0ffh		;7431
	defb 000h		;7432
	defb 080h		;7433
	defb 0fah		;7434
	defb 074h		;7435  't'
	defb 089h		;7436
	defb 00eh		;7437
	defb 004h		;7438
	defb 07ah		;7439  'z'
	defb 089h		;743a
	defb 002h		;743b
	defb 018h		;743c
	defb 007h		;743d
	defb 0ach		;743e
	defb 0bch		;743f
	defb 087h		;7440
	defb 0ffh		;7441
	defb 000h		;7442
	defb 09bh		;7443
	defb 0fah		;7444
	defb 059h		;7445  'Y'
	defb 089h		;7446
	defb 002h		;7447
	defb 00eh		;7448
	defb 00dh		;7449
	defb 0fah		;744a
	defb 0c6h		;744b
	defb 087h		;744c
	defb 00ch		;744d
	defb 00ch		;744e
	defb 0fah		;744f
	defb 03ah		;7450  ':'
	defb 089h		;7451
	defb 0ffh		;7452
	defb 003h		;7453
	defb 008h		;7454
	defb 002h		;7455
	defb 018h		;7456
	defb 002h		;7457
	defb 0fah		;7458
	defb 0bch		;7459
	defb 087h		;745a
	defb 000h		;745b
	defb 060h		;745c  '`' (Spectrum: GBP)
	defb 0fah		;745d
	defb 094h		;745e
	defb 089h		;745f
	defb 00eh		;7460
	defb 00fh		;7461
	defb 0bah		;7462
	defb 087h		;7463
; ",1KL"
	defb 02ch		;7464  ','
	defb 031h		;7465  '1'
	defb 04bh		;7466  'K'
	defb 04ch		;7467  'L'
	defb 0ffh		;7468
	defb 003h		;7469
	defb 008h		;746a
	defb 000h		;746b
	defb 040h		;746c  '@'
	defb 0fah		;746d
	defb 0b4h		;746e
	defb 087h		;746f
	defb 000h		;7470
	defb 060h		;7471  '`' (Spectrum: GBP)
	defb 0fah		;7472
	defb 094h		;7473
	defb 089h		;7474
	defb 02dh		;7475  '-'
	defb 02bh		;7476  '+'
	defb 030h		;7477  '0'
	defb 0ffh		;7478
	defb 003h		;7479
	defb 008h		;747a
	defb 002h		;747b
	defb 004h		;747c
	defb 002h		;747d
	defb 0fah		;747e
	defb 0b4h		;747f
	defb 087h		;7480
	defb 002h		;7481
	defb 002h		;7482
	defb 002h		;7483
	defb 0fah		;7484
	defb 0d2h		;7485
	defb 087h		;7486
	defb 000h		;7487
	defb 060h		;7488  '`' (Spectrum: GBP)
	defb 0fah		;7489
	defb 094h		;748a
	defb 089h		;748b
	defb 002h		;748c
	defb 00ch		;748d
	defb 002h		;748e
	defb 008h		;748f
	defb 0beh		;7490
	defb 089h		;7491
	defb 000h		;7492
	defb 00eh		;7493
	defb 0f2h		;7494
	defb 09dh		;7495
	defb 089h		;7496
	defb 00eh		;7497
	defb 003h		;7498
	defb 0a3h		;7499
	defb 089h		;749a
	defb 00eh		;749b
	defb 00fh		;749c
	defb 0ceh		;749d
	defb 087h		;749e
	defb 031h		;749f  '1'
	defb 0ffh		;74a0
	defb 009h		;74a1
; --- 8 zero bytes ---
	defb 000h		;74a2
	defb 000h		;74a3
	defb 000h		;74a4
	defb 000h		;74a5
	defb 000h		;74a6
	defb 000h		;74a7
	defb 000h		;74a8
	defb 000h		;74a9
	defb 001h		;74aa
	defb 001h		;74ab
	defb 001h		;74ac
	defb 001h		;74ad
	defb 002h		;74ae
	defb 00eh		;74af
	defb 003h		;74b0
	defb 0fah		;74b1
	defb 094h		;74b2
	defb 089h		;74b3
	defb 00ah		;74b4
	defb 002h		;74b5
	defb 0fah		;74b6
	defb 0a2h		;74b7
	defb 089h		;74b8
	defb 000h		;74b9
	defb 040h		;74ba  '@'
	defb 0fah		;74bb
	defb 0b4h		;74bc
	defb 087h		;74bd
	defb 00dh		;74be
	defb 005h		;74bf
	defb 0fah		;74c0
	defb 00ch		;74c1
	defb 088h		;74c2
	defb 002h		;74c3
	defb 003h		;74c4
	defb 006h		;74c5
	defb 0fah		;74c6
	defb 011h		;74c7
	defb 088h		;74c8
	defb 02bh		;74c9  '+'
	defb 02ch		;74ca  ','
	defb 0ffh		;74cb
	defb 000h		;74cc
	defb 040h		;74cd  '@'
	defb 0fah		;74ce
	defb 0b4h		;74cf
	defb 089h		;74d0
	defb 002h		;74d1
	defb 009h		;74d2
	defb 002h		;74d3
	defb 0fch		;74d4
	defb 0b4h		;74d5
	defb 089h		;74d6
	defb 000h		;74d7
	defb 01ch		;74d8
	defb 0fah		;74d9
	defb 0b8h		;74da
	defb 087h		;74db
	defb 00ah		;74dc
	defb 003h		;74dd
	defb 0fah		;74de
	defb 0e4h		;74df
	defb 087h		;74e0
	defb 002h		;74e1
	defb 00bh		;74e2
	defb 004h		;74e3
	defb 0fah		;74e4
	defb 0d9h		;74e5
	defb 087h		;74e6
	defb 021h		;74e7  '!'
	defb 010h		;74e8
	defb 0bfh		;74e9
	defb 087h		;74ea
	defb 027h		;74eb  '''
	defb 029h		;74ec  ')'
	defb 0ffh		;74ed
	defb 001h		;74ee
	defb 003h		;74ef
	defb 0fah		;74f0
	defb 0beh		;74f1
	defb 087h		;74f2
	defb 002h		;74f3
	defb 015h		;74f4
	defb 005h		;74f5
	defb 0fah		;74f6
	defb 0bfh		;74f7
	defb 087h		;74f8
	defb 000h		;74f9
	defb 00fh		;74fa
	defb 0fch		;74fb
	defb 054h		;74fc  'T'
	defb 089h		;74fd
	defb 000h		;74fe
	defb 00ah		;74ff
	defb 0fah		;7500
	defb 063h		;7501  'c'
	defb 089h		;7502
	defb 000h		;7503
	defb 00eh		;7504
	defb 0fah		;7505
	defb 082h		;7506
	defb 089h		;7507
	defb 002h		;7508
	defb 011h		;7509
	defb 003h		;750a
	defb 0fah		;750b
	defb 0a3h		;750c
	defb 089h		;750d
	defb 03ah		;750e  ':'
	defb 03bh		;750f  ';'
	defb 0ffh		;7510
	defb 00dh		;7511
	defb 009h		;7512
	defb 0fah		;7513
	defb 0c7h		;7514
	defb 087h		;7515
	defb 002h		;7516
	defb 004h		;7517
	defb 00ah		;7518
	defb 0fah		;7519
	defb 0d0h		;751a
	defb 087h		;751b
	defb 000h		;751c
	defb 020h		;751d  ' '
	defb 0fch		;751e
	defb 0d4h		;751f
	defb 089h		;7520
	defb 062h		;7521  'b'
	defb 0ffh		;7522
	defb 003h		;7523
	defb 001h		;7524
	defb 002h		;7525
	defb 007h		;7526
	defb 003h		;7527
	defb 0fah		;7528
	defb 0adh		;7529
	defb 089h		;752a
	defb 0ffh		;752b
	defb 003h		;752c
	defb 001h		;752d
	defb 000h		;752e
	defb 060h		;752f  '`' (Spectrum: GBP)
l7530h:
	defb 0fah		;7530
	defb 094h		;7531
	defb 089h		;7532
	defb 000h		;7533
	defb 008h		;7534
	defb 0fah		;7535
	defb 088h		;7536
	defb 089h		;7537
	defb 00eh		;7538
	defb 004h		;7539
	defb 08bh		;753a
	defb 089h		;753b
	defb 06ah		;753c  'j'
	defb 0ffh		;753d
	defb 000h		;753e
	defb 025h		;753f  '%'
	defb 0fch		;7540
	defb 0cfh		;7541
	defb 089h		;7542
	defb 002h		;7543
	defb 019h		;7544
	defb 012h		;7545
	defb 001h		;7546
	defb 0b4h		;7547
	defb 087h		;7548
	defb 002h		;7549
	defb 002h		;754a
	defb 012h		;754b
	defb 0fah		;754c
	defb 0cdh		;754d
	defb 087h		;754e
	defb 0ffh		;754f
	defb 003h		;7550
	defb 001h		;7551
	defb 002h		;7552
	defb 007h		;7553
	defb 003h		;7554
	defb 0fah		;7555
	defb 0cdh		;7556
	defb 087h		;7557
	defb 002h		;7558
	defb 007h		;7559
	defb 005h		;755a
	defb 0fah		;755b
	defb 06dh		;755c  'm'
	defb 089h		;755d
	defb 000h		;755e
	defb 014h		;755f
	defb 007h		;7560
	defb 034h		;7561  '4'
	defb 089h		;7562
	defb 000h		;7563
	defb 00ch		;7564
	defb 0f2h		;7565
	defb 048h		;7566  'H'
	defb 089h		;7567
	defb 0ffh		;7568
	defb 000h		;7569
	defb 027h		;756a  '''
	defb 0fah		;756b
	defb 0cdh		;756c
	defb 087h		;756d
	defb 000h		;756e
	defb 025h		;756f  '%'
	defb 0fch		;7570
	defb 0cfh		;7571
	defb 089h		;7572
	defb 002h		;7573
	defb 002h		;7574
	defb 010h		;7575
	defb 0fah		;7576
	defb 00dh		;7577
	defb 088h		;7578
	defb 002h		;7579
	defb 019h		;757a
	defb 012h		;757b
	defb 001h		;757c
	defb 0b4h		;757d
	defb 087h		;757e
	defb 0ffh		;757f
	defb 003h		;7580
	defb 001h		;7581
	defb 002h		;7582
	defb 007h		;7583
	defb 00eh		;7584
	defb 0fah		;7585
	defb 0cdh		;7586
	defb 087h		;7587
	defb 002h		;7588
	defb 005h		;7589
	defb 00ah		;758a
	defb 000h		;758b
	defb 0cfh		;758c
	defb 087h		;758d
	defb 0ffh		;758e
	defb 002h		;758f
	defb 004h		;7590
	defb 010h		;7591
	defb 001h		;7592
	defb 0b4h		;7593
	defb 087h		;7594
	defb 002h		;7595
	defb 003h		;7596
	defb 003h		;7597
	defb 0fah		;7598
	defb 0b7h		;7599
	defb 087h		;759a
	defb 000h		;759b
	defb 05dh		;759c  ']'
	defb 0fah		;759d
	defb 097h		;759e
	defb 089h		;759f
	defb 001h		;75a0
	defb 00ch		;75a1
	defb 002h		;75a2
	defb 018h		;75a3
	defb 088h		;75a4
	defb 000h		;75a5
	defb 003h		;75a6
	defb 0feh		;75a7
	defb 094h		;75a8
	defb 089h		;75a9
; "MObc"
	defb 04dh		;75aa  'M'
	defb 04fh		;75ab  'O'
	defb 062h		;75ac  'b'
	defb 063h		;75ad  'c'
	defb 0ffh		;75ae
	defb 000h		;75af
	defb 073h		;75b0  's'
	defb 0fah		;75b1
	defb 081h		;75b2
	defb 089h		;75b3
	defb 00ch		;75b4
	defb 005h		;75b5
	defb 0fah		;75b6
	defb 062h		;75b7  'b'
	defb 089h		;75b8
	defb 002h		;75b9
	defb 00dh		;75ba
	defb 006h		;75bb
	defb 0fah		;75bc
	defb 0c7h		;75bd
	defb 088h		;75be
	defb 064h		;75bf  'd'
	defb 0ffh		;75c0
	defb 002h		;75c1
	defb 020h		;75c2  ' '
	defb 00ah		;75c3
	defb 0fah		;75c4
	defb 0b4h		;75c5
	defb 088h		;75c6
	defb 021h		;75c7  '!'
	defb 008h		;75c8
	defb 0cbh		;75c9
	defb 087h		;75ca
	defb 00eh		;75cb
	defb 009h		;75cc
	defb 0bah		;75cd
	defb 088h		;75ce
	defb 00eh		;75cf
	defb 009h		;75d0
	defb 0c5h		;75d1
	defb 088h		;75d2
	defb 001h		;75d3
	defb 008h		;75d4
	defb 0fah		;75d5
	defb 0d3h		;75d6
	defb 087h		;75d7
	defb 000h		;75d8
	defb 01eh		;75d9
	defb 000h		;75da
	defb 0d5h		;75db
	defb 089h		;75dc
	defb 021h		;75dd  '!'
	defb 001h		;75de
	defb 0dah		;75df
	defb 089h		;75e0
	defb 021h		;75e1  '!'
	defb 001h		;75e2
	defb 0e5h		;75e3
	defb 089h		;75e4
	defb 052h		;75e5  'R'
	defb 0ffh		;75e6
	defb 000h		;75e7
	defb 03ah		;75e8  ':'
	defb 0fch		;75e9
	defb 0fah		;75ea
	defb 088h		;75eb
	defb 002h		;75ec
	defb 006h		;75ed
	defb 008h		;75ee
	defb 0fah		;75ef
	defb 0f4h		;75f0
	defb 088h		;75f1
	defb 002h		;75f2
	defb 003h		;75f3
	defb 004h		;75f4
	defb 001h		;75f5
	defb 074h		;75f6  't'
	defb 089h		;75f7
	defb 021h		;75f8  '!'
	defb 00ah		;75f9
	defb 0c8h		;75fa
	defb 087h		;75fb
	defb 064h		;75fc  'd'
	defb 0ffh		;75fd
	defb 000h		;75fe
	defb 040h		;75ff  '@'
	defb 0fch		;7600
	defb 0f4h		;7601
	defb 088h		;7602
	defb 064h		;7603  'd'
	defb 063h		;7604  'c'
	defb 013h		;7605
	defb 0ffh		;7606
	defb 000h		;7607
	defb 040h		;7608  '@'
	defb 0fch		;7609
	defb 0f4h		;760a
	defb 088h		;760b
	defb 021h		;760c  '!'
	defb 008h		;760d
	defb 00bh		;760e
	defb 089h		;760f
	defb 001h		;7610
	defb 012h		;7611
	defb 0fah		;7612
	defb 0d3h		;7613
	defb 087h		;7614
	defb 062h		;7615  'b'
	defb 065h		;7616  'e'
	defb 0ffh		;7617
	defb 000h		;7618
	defb 040h		;7619  '@'
	defb 0fch		;761a
	defb 0b4h		;761b
	defb 089h		;761c
	defb 001h		;761d
	defb 012h		;761e
	defb 0fah		;761f
	defb 0d3h		;7620
	defb 087h		;7621
	defb 036h		;7622  '6'
	defb 035h		;7623  '5'
	defb 010h		;7624
	defb 0ffh		;7625
	defb 063h		;7626  'c'
	defb 064h		;7627  'd'
	defb 013h		;7628
	defb 000h		;7629
	defb 040h		;762a  '@'
	defb 0fch		;762b
	defb 0b4h		;762c
	defb 089h		;762d
; "%/WV"
	defb 025h		;762e  '%'
	defb 02fh		;762f  '/'
	defb 057h		;7630  'W'
	defb 056h		;7631  'V'
	defb 0ffh		;7632
	defb 000h		;7633
	defb 040h		;7634  '@'
	defb 0fch		;7635
	defb 0b4h		;7636
	defb 089h		;7637
	defb 021h		;7638  '!'
	defb 012h		;7639
	defb 0c8h		;763a
	defb 087h		;763b
	defb 036h		;763c  '6'
	defb 0ffh		;763d
	defb 000h		;763e
	defb 040h		;763f  '@'
	defb 0fch		;7640
	defb 0b4h		;7641
	defb 089h		;7642
	defb 021h		;7643  '!'
	defb 012h		;7644
	defb 0c8h		;7645
	defb 087h		;7646
	defb 010h		;7647
	defb 0ffh		;7648
	defb 000h		;7649
	defb 040h		;764a  '@'
	defb 0fch		;764b
	defb 0b4h		;764c
	defb 089h		;764d
	defb 021h		;764e  '!'
	defb 002h		;764f
	defb 0c8h		;7650
	defb 089h		;7651
	defb 002h		;7652
	defb 007h		;7653
	defb 002h		;7654
	defb 0fah		;7655
	defb 0b4h		;7656
	defb 087h		;7657
	defb 0ffh		;7658
	defb 002h		;7659
	defb 007h		;765a
	defb 003h		;765b
	defb 0fah		;765c
	defb 0b4h		;765d
	defb 087h		;765e
	defb 002h		;765f
	defb 005h		;7660
	defb 009h		;7661
	defb 001h		;7662
	defb 014h		;7663
	defb 088h		;7664
	defb 002h		;7665
	defb 007h		;7666
	defb 006h		;7667
	defb 0fah		;7668
	defb 034h		;7669  '4'
	defb 089h		;766a
	defb 000h		;766b
	defb 003h		;766c
	defb 0fah		;766d
	defb 018h		;766e
	defb 089h		;766f
	defb 000h		;7670
	defb 006h		;7671
	defb 0f2h		;7672
	defb 034h		;7673  '4'
	defb 089h		;7674
	defb 001h		;7675
	defb 009h		;7676
	defb 002h		;7677
	defb 0f9h		;7678
	defb 087h		;7679
	defb 002h		;767a
	defb 00fh		;767b
	defb 002h		;767c
	defb 0fch		;767d
	defb 0c5h		;767e
	defb 089h		;767f
	defb 00bh		;7680
	defb 005h		;7681
	defb 0fch		;7682
	defb 0a5h		;7683
	defb 089h		;7684
	defb 002h		;7685
	defb 00ah		;7686
	defb 002h		;7687
	defb 0fch		;7688
	defb 01bh		;7689
	defb 089h		;768a
	defb 0ffh		;768b
	defb 065h		;768c  'e'
	defb 000h		;768d
	defb 040h		;768e  '@'
	defb 0fch		;768f
	defb 0b4h		;7690
	defb 089h		;7691
	defb 021h		;7692  '!'
	defb 010h		;7693
	defb 0bdh		;7694
	defb 087h		;7695
	defb 036h		;7696  '6'
	defb 035h		;7697  '5'
	defb 010h		;7698
	defb 0ffh		;7699
	defb 068h		;769a  'h'
	defb 064h		;769b  'd'
	defb 000h		;769c
	defb 040h		;769d  '@'
	defb 0fch		;769e
	defb 0b4h		;769f
	defb 089h		;76a0
	defb 021h		;76a1  '!'
	defb 002h		;76a2
	defb 0bdh		;76a3
	defb 089h		;76a4
	defb 002h		;76a5
	defb 004h		;76a6
	defb 007h		;76a7
	defb 0fch		;76a8
	defb 0c9h		;76a9
	defb 087h		;76aa
	defb 001h		;76ab
	defb 009h		;76ac
	defb 07eh		;76ad  '~'
	defb 0abh		;76ae
	defb 088h		;76af
	defb 0ffh		;76b0
	defb 068h		;76b1  'h'
	defb 064h		;76b2  'd'
	defb 002h		;76b3
	defb 01ah		;76b4
	defb 002h		;76b5
	defb 0fch		;76b6
	defb 0b4h		;76b7
	defb 089h		;76b8
	defb 000h		;76b9
	defb 00ah		;76ba
	defb 0fch		;76bb
	defb 0aah		;76bc
	defb 089h		;76bd
	defb 001h		;76be
	defb 006h		;76bf
	defb 0fah		;76c0
	defb 0d3h		;76c1
	defb 087h		;76c2
	defb 021h		;76c3  '!'
	defb 00fh		;76c4
	defb 0cbh		;76c5
	defb 087h		;76c6
	defb 035h		;76c7  '5'
	defb 02fh		;76c8  '/'
	defb 0ffh		;76c9
	defb 068h		;76ca  'h'
	defb 062h		;76cb  'b'
	defb 000h		;76cc
	defb 03fh		;76cd  '?'
	defb 0fch		;76ce
	defb 0b4h		;76cf
	defb 089h		;76d0
	defb 001h		;76d1
	defb 012h		;76d2
	defb 0fah		;76d3
	defb 0d3h		;76d4
	defb 087h		;76d5
	defb 021h		;76d6  '!'
	defb 012h		;76d7
	defb 0cbh		;76d8
	defb 087h		;76d9
	defb 036h		;76da  '6'
	defb 025h		;76db  '%'
	defb 0ffh		;76dc
	defb 068h		;76dd  'h'
	defb 002h		;76de
	defb 008h		;76df
	defb 006h		;76e0
	defb 0fah		;76e1
	defb 0b4h		;76e2
	defb 087h		;76e3
	defb 002h		;76e4
	defb 018h		;76e5
	defb 012h		;76e6
	defb 001h		;76e7
	defb 0bch		;76e8
	defb 087h		;76e9
	defb 002h		;76ea
	defb 004h		;76eb
	defb 003h		;76ec
	defb 001h		;76ed
	defb 0b8h		;76ee
	defb 087h		;76ef
	defb 000h		;76f0
	defb 006h		;76f1
	defb 0fch		;76f2
	defb 094h		;76f3
	defb 089h		;76f4
	defb 021h		;76f5  '!'
	defb 003h		;76f6
	defb 096h		;76f7
	defb 089h		;76f8
	defb 002h		;76f9
	defb 004h		;76fa
	defb 003h		;76fb
	defb 0fah		;76fc
	defb 09ah		;76fd
	defb 089h		;76fe
	defb 000h		;76ff
	defb 003h		;7700
	defb 0f2h		;7701
	defb 03ch		;7702  '<'
	defb 088h		;7703
	defb 000h		;7704
	defb 00bh		;7705
	defb 0f2h		;7706
	defb 09eh		;7707
	defb 089h		;7708
	defb 013h		;7709
	defb 0ffh		;770a
	defb 068h		;770b  'h'
	defb 002h		;770c
	defb 017h		;770d
	defb 010h		;770e
	defb 001h		;770f
	defb 0bdh		;7710
	defb 087h		;7711
	defb 002h		;7712
	defb 004h		;7713
	defb 005h		;7714
	defb 0fah		;7715
	defb 0bah		;7716
	defb 087h		;7717
	defb 021h		;7718  '!'
	defb 010h		;7719
	defb 0b6h		;771a
	defb 087h		;771b
	defb 000h		;771c
	defb 004h		;771d
	defb 0fah		;771e
	defb 09ah		;771f
	defb 089h		;7720
	defb 000h		;7721
	defb 03ah		;7722  ':'
	defb 0fah		;7723
	defb 0bah		;7724
	defb 089h		;7725
	defb 002h		;7726
	defb 006h		;7727
	defb 002h		;7728
	defb 0fch		;7729
	defb 0b4h		;772a
	defb 089h		;772b
	defb 013h		;772c
	defb 0ffh		;772d
	defb 002h		;772e
	defb 016h		;772f
	defb 010h		;7730
	defb 001h		;7731
	defb 0b4h		;7732
	defb 087h		;7733
	defb 000h		;7734
	defb 040h		;7735  '@'
	defb 0fah		;7736
	defb 0b4h		;7737
	defb 089h		;7738
	defb 00ch		;7739
	defb 006h		;773a
	defb 000h		;773b
	defb 0a4h		;773c
	defb 089h		;773d
	defb 002h		;773e
	defb 00ah		;773f
	defb 009h		;7740
	defb 0fah		;7741
	defb 0cah		;7742
	defb 087h		;7743
	defb 002h		;7744
	defb 006h		;7745
	defb 006h		;7746
	defb 001h		;7747
	defb 0cah		;7748
	defb 087h		;7749
	defb 013h		;774a
	defb 0ffh		;774b
	defb 003h		;774c
	defb 001h		;774d
	defb 002h		;774e
	defb 004h		;774f
	defb 003h		;7750
	defb 0fah		;7751
	defb 0b0h		;7752
	defb 089h		;7753
	defb 0ffh		;7754
	defb 002h		;7755
	defb 007h		;7756
	defb 00fh		;7757
	defb 001h		;7758
	defb 0b4h		;7759
	defb 087h		;775a
	defb 002h		;775b
	defb 003h		;775c
	defb 003h		;775d
	defb 0fah		;775e
	defb 0bbh		;775f
	defb 087h		;7760
	defb 002h		;7761
	defb 003h		;7762
	defb 006h		;7763
	defb 0fah		;7764
	defb 0d9h		;7765
	defb 088h		;7766
	defb 002h		;7767
	defb 008h		;7768
	defb 002h		;7769
	defb 0fah		;776a
	defb 094h		;776b
	defb 089h		;776c
	defb 000h		;776d
	defb 020h		;776e  ' '
	defb 0fah		;776f
	defb 0d4h		;7770
	defb 089h		;7771
	defb 002h		;7772
	defb 003h		;7773
	defb 007h		;7774
	defb 0fah		;7775
	defb 007h		;7776
	defb 089h		;7777
	defb 000h		;7778
	defb 00dh		;7779
	defb 0fch		;777a
	defb 0fbh		;777b
	defb 088h		;777c
	defb 00bh		;777d
	defb 006h		;777e
	defb 0fah		;777f
	defb 0cah		;7780
	defb 089h		;7781
	defb 063h		;7782  'c'
	defb 013h		;7783
	defb 0ffh		;7784
	defb 003h		;7785
	defb 001h		;7786
	defb 002h		;7787
	defb 019h		;7788
	defb 003h		;7789
	defb 0fah		;778a
	defb 09bh		;778b
	defb 089h		;778c
	defb 000h		;778d
	defb 009h		;778e
	defb 0fah		;778f
	defb 07bh		;7790  '{'
	defb 089h		;7791
	defb 02ah		;7792  '*'
	defb 02bh		;7793  '+'
	defb 02ch		;7794  ','
	defb 0ffh		;7795
	defb 003h		;7796
	defb 0fah		;7797
	defb 002h		;7798
	defb 008h		;7799
	defb 007h		;779a
	defb 000h		;779b
	defb 0ech		;779c
	defb 087h		;779d
	defb 000h		;779e
	defb 0e0h		;779f
	defb 000h		;77a0
	defb 0d4h		;77a1
	defb 088h		;77a2
	defb 000h		;77a3
	defb 008h		;77a4
	defb 000h		;77a5
	defb 0bfh		;77a6
	defb 088h		;77a7
	defb 000h		;77a8
	defb 008h		;77a9
	defb 0fch		;77aa
	defb 0cch		;77ab
	defb 088h		;77ac
	defb 021h		;77ad  '!'
	defb 00fh		;77ae
	defb 0edh		;77af
	defb 087h		;77b0
	defb 021h		;77b1  '!'
	defb 00ah		;77b2
	defb 0c2h		;77b3
	defb 088h		;77b4
	defb 0ffh		;77b5
	defb 000h		;77b6
	defb 003h		;77b7
	defb 0fah		;77b8
	defb 0d4h		;77b9
	defb 089h		;77ba
	defb 000h		;77bb
	defb 01dh		;77bc
	defb 0fch		;77bd
	defb 0d7h		;77be
	defb 089h		;77bf
	defb 021h		;77c0  '!'
	defb 012h		;77c1
	defb 0cbh		;77c2
	defb 087h		;77c3
	defb 062h		;77c4  'b'
	defb 0ffh		;77c5
	defb 000h		;77c6
	defb 020h		;77c7  ' '
	defb 0fch		;77c8
	defb 0d4h		;77c9
	defb 089h		;77ca
	defb 058h		;77cb  'X'
	defb 059h		;77cc  'Y'
	defb 063h		;77cd  'c'
	defb 013h		;77ce
	defb 064h		;77cf  'd'
	defb 0ffh		;77d0
	defb 000h		;77d1
	defb 003h		;77d2
	defb 0fah		;77d3
	defb 0b4h		;77d4
	defb 087h		;77d5
	defb 000h		;77d6
	defb 00ah		;77d7
	defb 0fch		;77d8
	defb 0b7h		;77d9
	defb 087h		;77da
	defb 021h		;77db  '!'
	defb 010h		;77dc
	defb 0cbh		;77dd
	defb 087h		;77de
	defb 000h		;77df
	defb 008h		;77e0
	defb 0fch		;77e1
	defb 0b4h		;77e2
	defb 088h		;77e3
	defb 002h		;77e4
	defb 002h		;77e5
	defb 002h		;77e6
	defb 0fah		;77e7
	defb 0b4h		;77e8
	defb 089h		;77e9
	defb 000h		;77ea
	defb 01eh		;77eb
	defb 0fch		;77ec
	defb 0b6h		;77ed
	defb 089h		;77ee
	defb 0ffh		;77ef
	defb 000h		;77f0
	defb 014h		;77f1
	defb 0fch		;77f2
	defb 0b4h		;77f3
	defb 089h		;77f4
	defb 002h		;77f5
	defb 00eh		;77f6
	defb 002h		;77f7
	defb 0fch		;77f8
	defb 086h		;77f9
	defb 089h		;77fa
	defb 004h		;77fb
	defb 0fch		;77fc
	defb 0a5h		;77fd
	defb 089h		;77fe
	defb 062h		;77ff  'b'
	defb 063h		;7800  'c'
	defb 013h		;7801
	defb 0ffh		;7802
	defb 000h		;7803
	defb 040h		;7804  '@'
	defb 0fch		;7805
	defb 074h		;7806  't'
	defb 089h		;7807
	defb 064h		;7808  'd'
	defb 065h		;7809  'e'
	defb 0ffh		;780a
	defb 000h		;780b
	defb 00dh		;780c
	defb 0fch		;780d
	defb 0d4h		;780e
	defb 089h		;780f
	defb 002h		;7810
	defb 003h		;7811
	defb 00eh		;7812
	defb 0fah		;7813
	defb 0c7h		;7814
	defb 087h		;7815
	defb 002h		;7816
	defb 00ah		;7817
	defb 00eh		;7818
	defb 001h		;7819
	defb 0cah		;781a
	defb 087h		;781b
	defb 013h		;781c
	defb 002h		;781d
	defb 013h		;781e
	defb 004h		;781f
	defb 0fah		;7820
	defb 081h		;7821
	defb 089h		;7822
	defb 062h		;7823  'b'
	defb 0ffh		;7824
	defb 003h		;7825
	defb 001h		;7826
	defb 001h		;7827
	defb 00ah		;7828
	defb 002h		;7829
	defb 0c6h		;782a
	defb 087h		;782b
	defb 002h		;782c
	defb 016h		;782d
	defb 003h		;782e
	defb 0fah		;782f
	defb 094h		;7830
	defb 089h		;7831
	defb 002h		;7832
	defb 00eh		;7833
	defb 005h		;7834
	defb 0fah		;7835
	defb 0fch		;7836
	defb 088h		;7837
	defb 002h		;7838
	defb 003h		;7839
	defb 004h		;783a
	defb 0fah		;783b
	defb 019h		;783c
	defb 089h		;783d
	defb 0ffh		;783e
	defb 003h		;783f
	defb 001h		;7840
	defb 001h		;7841
	defb 00bh		;7842
	defb 002h		;7843
	defb 0a6h		;7844
	defb 088h		;7845
	defb 0ffh		;7846
	defb 003h		;7847
	defb 001h		;7848
	defb 002h		;7849
	defb 00ch		;784a
	defb 004h		;784b
	defb 0fah		;784c
	defb 074h		;784d  't'
	defb 089h		;784e
	defb 000h		;784f
	defb 014h		;7850
	defb 0f2h		;7851
	defb 0c0h		;7852
	defb 089h		;7853
	defb 02ah		;7854  '*'
	defb 0ffh		;7855
	defb 003h		;7856
	defb 001h		;7857
	defb 000h		;7858
	defb 018h		;7859
	defb 0f2h		;785a
	defb 0b4h		;785b
	defb 089h		;785c
	defb 000h		;785d
	defb 00fh		;785e
	defb 0fah		;785f
	defb 0e5h		;7860
	defb 089h		;7861
	defb 00ch		;7862
	defb 002h		;7863
	defb 0fah		;7864
	defb 0cch		;7865
	defb 089h		;7866
	defb 008h		;7867
	defb 00eh		;7868
	defb 0cfh		;7869
	defb 087h		;786a
	defb 002h		;786b
	defb 006h		;786c
	defb 003h		;786d
	defb 0fah		;786e
	defb 08eh		;786f
	defb 089h		;7870
	defb 001h		;7871
	defb 00eh		;7872
	defb 002h		;7873
	defb 0d1h		;7874
	defb 087h		;7875
	defb 0ffh		;7876
	defb 003h		;7877
	defb 001h		;7878
	defb 000h		;7879
	defb 008h		;787a
	defb 0f2h		;787b
	defb 08ch		;787c
	defb 089h		;787d
	defb 001h		;787e
	defb 003h		;787f
	defb 002h		;7880
	defb 0b1h		;7881
	defb 089h		;7882
	defb 008h		;7883
	defb 004h		;7884
	defb 08fh		;7885
	defb 089h		;7886
	defb 0ffh		;7887
	defb 003h		;7888
	defb 001h		;7889
	defb 002h		;788a
	defb 007h		;788b
	defb 003h		;788c
	defb 0fah		;788d
	defb 0cdh		;788e
	defb 087h		;788f
	defb 002h		;7890
	defb 002h		;7891
	defb 00fh		;7892
	defb 0fah		;7893
	defb 032h		;7894  '2'
	defb 088h		;7895
	defb 000h		;7896
	defb 008h		;7897
	defb 0f2h		;7898
	defb 074h		;7899  't'
	defb 089h		;789a
	defb 001h		;789b
	defb 003h		;789c
	defb 002h		;789d
	defb 097h		;789e
	defb 089h		;789f
	defb 0ffh		;78a0
	defb 003h		;78a1
	defb 001h		;78a2
	defb 002h		;78a3
	defb 005h		;78a4
	defb 004h		;78a5
	defb 0fah		;78a6
	defb 074h		;78a7  't'
	defb 089h		;78a8
	defb 001h		;78a9
	defb 00eh		;78aa
	defb 002h		;78ab
	defb 0b7h		;78ac
	defb 087h		;78ad
	defb 002h		;78ae
	defb 002h		;78af
	defb 006h		;78b0
	defb 0fah		;78b1
	defb 0d2h		;78b2
	defb 087h		;78b3
	defb 002h		;78b4
	defb 010h		;78b5
	defb 00ch		;78b6
	defb 0fah		;78b7
	defb 084h		;78b8
	defb 088h		;78b9
	defb 002h		;78ba
	defb 009h		;78bb
	defb 004h		;78bc
	defb 001h		;78bd
	defb 084h		;78be
	defb 088h		;78bf
	defb 00ah		;78c0
	defb 004h		;78c1
	defb 001h		;78c2
	defb 004h		;78c3
	defb 089h		;78c4
	defb 0ffh		;78c5
	defb 003h		;78c6
	defb 0fah		;78c7
	defb 002h		;78c8
	defb 00bh		;78c9
	defb 012h		;78ca
	defb 001h		;78cb
	defb 0b9h		;78cc
	defb 087h		;78cd
	defb 002h		;78ce
	defb 00ch		;78cf
	defb 008h		;78d0
	defb 001h		;78d1
	defb 048h		;78d2  'H'
	defb 088h		;78d3
	defb 002h		;78d4
	defb 008h		;78d5
	defb 006h		;78d6
	defb 001h		;78d7
	defb 048h		;78d8  'H'
	defb 089h		;78d9
	defb 000h		;78da
	defb 008h		;78db
	defb 0fch		;78dc
	defb 068h		;78dd  'h'
	defb 089h		;78de
	defb 008h		;78df
	defb 005h		;78e0
	defb 06bh		;78e1  'k'
	defb 089h		;78e2
	defb 0ffh		;78e3
	defb 003h		;78e4
	defb 001h		;78e5
	defb 002h		;78e6
	defb 005h		;78e7
	defb 002h		;78e8
	defb 0fah		;78e9
	defb 0b4h		;78ea
	defb 087h		;78eb
	defb 002h		;78ec
	defb 004h		;78ed
	defb 002h		;78ee
	defb 0fah		;78ef
	defb 0c4h		;78f0
	defb 087h		;78f1
	defb 002h		;78f2
	defb 003h		;78f3
	defb 002h		;78f4
	defb 0fah		;78f5
	defb 0d0h		;78f6
	defb 087h		;78f7
	defb 001h		;78f8
	defb 012h		;78f9
	defb 0fah		;78fa
	defb 0d3h		;78fb
	defb 087h		;78fc
	defb 008h		;78fd
	defb 010h		;78fe
	defb 0cbh		;78ff
	defb 087h		;7900
	defb 001h		;7901
	defb 00eh		;7902
	defb 08dh		;7903
	defb 035h		;7904  '5'
	defb 08ah		;7905
	defb 000h		;7906
	defb 01fh		;7907
	defb 0fch		;7908
	defb 0b4h		;7909
	defb 089h		;790a
	defb 000h		;790b
	defb 01fh		;790c
	defb 000h		;790d
	defb 0d4h		;790e
	defb 089h		;790f
	defb 0ffh		;7910
	defb 003h		;7911
	defb 001h		;7912
	defb 002h		;7913
	defb 00eh		;7914
	defb 006h		;7915
	defb 0fah		;7916
	defb 0c5h		;7917
	defb 087h		;7918
	defb 001h		;7919
	defb 012h		;791a
	defb 0fah		;791b
	defb 0d3h		;791c
	defb 087h		;791d
	defb 002h		;791e
	defb 004h		;791f
	defb 00ch		;7920
	defb 0fah		;7921
	defb 083h		;7922
	defb 088h		;7923
	defb 00ah		;7924
	defb 003h		;7925
	defb 0fah		;7926
	defb 087h		;7927
	defb 088h		;7928
	defb 0ffh		;7929
	defb 003h		;792a
	defb 001h		;792b
	defb 001h		;792c
	defb 002h		;792d
	defb 0fah		;792e
	defb 0d3h		;792f
	defb 087h		;7930
	defb 002h		;7931
	defb 004h		;7932
	defb 007h		;7933
	defb 0fah		;7934
	defb 0c3h		;7935
	defb 087h		;7936
	defb 002h		;7937
	defb 004h		;7938
	defb 002h		;7939
	defb 0fah		;793a
	defb 0c3h		;793b
	defb 089h		;793c
	defb 001h		;793d
	defb 009h		;793e
	defb 08dh		;793f
	defb 0e5h		;7940
	defb 08ah		;7941
	defb 000h		;7942
	defb 00dh		;7943
	defb 0fch		;7944
	defb 0c7h		;7945
	defb 089h		;7946
	defb 000h		;7947
	defb 00dh		;7948
	defb 000h		;7949
	defb 0e7h		;794a
	defb 089h		;794b
	defb 000h		;794c
	defb 011h		;794d
	defb 0f2h		;794e
	defb 098h		;794f
	defb 089h		;7950
	defb 006h		;7951
	defb 002h		;7952
	defb 0f1h		;7953
	defb 0bbh		;7954
	defb 089h		;7955
	defb 006h		;7956
	defb 002h		;7957
	defb 004h		;7958
	defb 0bch		;7959
	defb 089h		;795a
	defb 021h		;795b  '!'
	defb 002h		;795c
	defb 0cdh		;795d
	defb 089h		;795e
	defb 0ffh		;795f
	defb 002h		;7960
	defb 00fh		;7961
	defb 012h		;7962
	defb 001h		;7963
	defb 0b4h		;7964
	defb 087h		;7965
	defb 002h		;7966
	defb 004h		;7967
	defb 012h		;7968
	defb 0fah		;7969
	defb 0c3h		;796a
	defb 087h		;796b
	defb 021h		;796c  '!'
	defb 012h		;796d
	defb 0cdh		;796e
	defb 087h		;796f
	defb 006h		;7970
	defb 006h		;7971
	defb 0f1h		;7972
	defb 0bdh		;7973
	defb 087h		;7974
	defb 006h		;7975
	defb 005h		;7976
	defb 004h		;7977
	defb 0beh		;7978
	defb 087h		;7979
	defb 0ffh		;797a
	defb 002h		;797b
	defb 015h		;797c
	defb 012h		;797d
	defb 001h		;797e
	defb 0bfh		;797f
	defb 087h		;7980
	defb 002h		;7981
	defb 003h		;7982
	defb 005h		;7983
	defb 0fah		;7984
	defb 0bdh		;7985
	defb 087h		;7986
	defb 002h		;7987
	defb 003h		;7988
	defb 004h		;7989
	defb 0fah		;798a
	defb 07dh		;798b  '}'
	defb 089h		;798c
	defb 002h		;798d
	defb 009h		;798e
	defb 002h		;798f
	defb 0fch		;7990
	defb 074h		;7991  't'
	defb 089h		;7992
	defb 000h		;7993
	defb 016h		;7994
	defb 0f2h		;7995
	defb 05bh		;7996  '['
	defb 089h		;7997
	defb 007h		;7998
	defb 003h		;7999
	defb 003h		;799a
	defb 082h		;799b
	defb 089h		;799c
	defb 007h		;799d
	defb 004h		;799e
	defb 0f3h		;799f
	defb 083h		;79a0
	defb 089h		;79a1
	defb 013h		;79a2
	defb 0ffh		;79a3
	defb 002h		;79a4
	defb 003h		;79a5
	defb 012h		;79a6
	defb 0fah		;79a7
	defb 0bdh		;79a8
	defb 087h		;79a9
	defb 002h		;79aa
	defb 014h		;79ab
	defb 012h		;79ac
	defb 001h		;79ad
	defb 0c0h		;79ae
	defb 087h		;79af
	defb 013h		;79b0
	defb 0ffh		;79b1
	defb 002h		;79b2
	defb 015h		;79b3
	defb 012h		;79b4
	defb 001h		;79b5
	defb 0bfh		;79b6
	defb 087h		;79b7
	defb 002h		;79b8
	defb 003h		;79b9
	defb 004h		;79ba
	defb 0fah		;79bb
	defb 0bdh		;79bc
	defb 087h		;79bd
	defb 000h		;79be
	defb 00ch		;79bf
	defb 0fah		;79c0
	defb 0d4h		;79c1
	defb 089h		;79c2
	defb 000h		;79c3
	defb 00ch		;79c4
	defb 0fch		;79c5
	defb 014h		;79c6
	defb 089h		;79c7
	defb 002h		;79c8
	defb 003h		;79c9
	defb 005h		;79ca
	defb 0fah		;79cb
	defb 03dh		;79cc  '='
	defb 089h		;79cd
	defb 000h		;79ce
	defb 009h		;79cf
	defb 0f2h		;79d0
	defb 03eh		;79d1  '>'
	defb 089h		;79d2
	defb 013h		;79d3
	defb 0ffh		;79d4
	defb 002h		;79d5
	defb 015h		;79d6
	defb 00fh		;79d7
	defb 001h		;79d8
	defb 0bfh		;79d9
	defb 087h		;79da
	defb 002h		;79db
	defb 00ch		;79dc
	defb 002h		;79dd
	defb 0fah		;79de
	defb 0b4h		;79df
	defb 087h		;79e0
	defb 000h		;79e1
	defb 009h		;79e2
	defb 0fch		;79e3
	defb 074h		;79e4  't'
	defb 089h		;79e5
	defb 002h		;79e6
	defb 005h		;79e7
	defb 005h		;79e8
	defb 0fah		;79e9
	defb 05dh		;79ea  ']'
	defb 089h		;79eb
	defb 002h		;79ec
	defb 012h		;79ed
	defb 003h		;79ee
	defb 0fah		;79ef
	defb 0a2h		;79f0
	defb 089h		;79f1
	defb 013h		;79f2
	defb 02bh		;79f3  '+'
	defb 0ffh		;79f4
	defb 002h		;79f5
	defb 013h		;79f6
	defb 012h		;79f7
	defb 0fah		;79f8
	defb 0b4h		;79f9
	defb 087h		;79fa
	defb 002h		;79fb
	defb 00fh		;79fc
	defb 00fh		;79fd
	defb 001h		;79fe
	defb 0b4h		;79ff
	defb 087h		;7a00
	defb 021h		;7a01  '!'
	defb 012h		;7a02
	defb 0cdh		;7a03
	defb 087h		;7a04
	defb 0ffh		;7a05
	defb 062h		;7a06  'b'
	defb 021h		;7a07  '!'
	defb 011h		;7a08
	defb 0b6h		;7a09
	defb 087h		;7a0a
	defb 000h		;7a0b
	defb 012h		;7a0c
	defb 0fch		;7a0d
	defb 0d4h		;7a0e
	defb 089h		;7a0f
	defb 002h		;7a10
	defb 003h		;7a11
	defb 012h		;7a12
	defb 0fah		;7a13
	defb 0c6h		;7a14
	defb 087h		;7a15
	defb 002h		;7a16
	defb 00bh		;7a17
	defb 002h		;7a18
	defb 0fah		;7a19
	defb 0c9h		;7a1a
	defb 087h		;7a1b
	defb 000h		;7a1c
	defb 00bh		;7a1d
	defb 0fch		;7a1e
	defb 089h		;7a1f
	defb 089h		;7a20
	defb 021h		;7a21  '!'
	defb 004h		;7a22
	defb 08eh		;7a23
	defb 089h		;7a24
	defb 058h		;7a25  'X'
	defb 0ffh		;7a26
	defb 000h		;7a27
	defb 040h		;7a28  '@'
	defb 0fch		;7a29
	defb 0b4h		;7a2a
	defb 089h		;7a2b
	defb 002h		;7a2c
	defb 003h		;7a2d
	defb 007h		;7a2e
	defb 0fah		;7a2f
	defb 0c6h		;7a30
	defb 087h		;7a31
	defb 002h		;7a32
	defb 00eh		;7a33
	defb 002h		;7a34
	defb 0fah		;7a35
	defb 0a6h		;7a36
	defb 088h		;7a37
	defb 021h		;7a38  '!'
	defb 010h		;7a39
	defb 0ceh		;7a3a
	defb 087h		;7a3b
	defb 054h		;7a3c  'T'
	defb 055h		;7a3d  'U'
	defb 056h		;7a3e  'V'
	defb 0ffh		;7a3f
	defb 000h		;7a40
	defb 040h		;7a41  '@'
	defb 0fch		;7a42
	defb 0b4h		;7a43
	defb 089h		;7a44
	defb 002h		;7a45
	defb 003h		;7a46
	defb 007h		;7a47
	defb 0fah		;7a48
	defb 0bdh		;7a49
	defb 087h		;7a4a
	defb 002h		;7a4b
	defb 00ch		;7a4c
	defb 002h		;7a4d
	defb 0fah		;7a4e
	defb 094h		;7a4f
	defb 088h		;7a50
; "TUVW"
	defb 054h		;7a51  'T'
	defb 055h		;7a52  'U'
	defb 056h		;7a53  'V'
	defb 057h		;7a54  'W'
	defb 0ffh		;7a55
	defb 002h		;7a56
	defb 01ch		;7a57
	defb 003h		;7a58
	defb 0fah		;7a59
	defb 0b8h		;7a5a
	defb 087h		;7a5b
	defb 002h		;7a5c
	defb 007h		;7a5d
	defb 003h		;7a5e
	defb 0fah		;7a5f
	defb 0adh		;7a60
	defb 089h		;7a61
	defb 0ffh		;7a62
	defb 062h		;7a63  'b'
	defb 065h		;7a64  'e'
	defb 000h		;7a65
	defb 040h		;7a66  '@'
	defb 0fch		;7a67
	defb 0b4h		;7a68
	defb 089h		;7a69
	defb 021h		;7a6a  '!'
	defb 002h		;7a6b
	defb 0cdh		;7a6c
	defb 089h		;7a6d
	defb 0ffh		;7a6e
	defb 000h		;7a6f
	defb 040h		;7a70  '@'
	defb 0fch		;7a71
	defb 0b4h		;7a72
	defb 089h		;7a73
	defb 002h		;7a74
	defb 008h		;7a75
	defb 002h		;7a76
	defb 000h		;7a77
	defb 0b9h		;7a78
	defb 089h		;7a79
	defb 002h		;7a7a
	defb 009h		;7a7b
	defb 002h		;7a7c
	defb 000h		;7a7d
	defb 0c6h		;7a7e
	defb 089h		;7a7f
	defb 063h		;7a80  'c'
	defb 013h		;7a81
	defb 064h		;7a82  'd'
	defb 0ffh		;7a83
	defb 002h		;7a84
	defb 005h		;7a85
	defb 004h		;7a86
	defb 0fch		;7a87
	defb 0c1h		;7a88
	defb 087h		;7a89
	defb 000h		;7a8a
	defb 040h		;7a8b  '@'
l7a8ch:
	defb 0fch		;7a8c
	defb 0b4h		;7a8d
	defb 089h		;7a8e
	defb 000h		;7a8f
	defb 013h		;7a90
	defb 000h		;7a91
	defb 0d9h		;7a92
	defb 089h		;7a93
	defb 000h		;7a94
	defb 017h		;7a95
	defb 06fh		;7a96  'o'
	defb 0b7h		;7a97
	defb 089h		;7a98
	defb 0ffh		;7a99
	defb 000h		;7a9a
	defb 040h		;7a9b  '@'
	defb 0fch		;7a9c
	defb 0b4h		;7a9d
	defb 089h		;7a9e
	defb 002h		;7a9f
	defb 005h		;7aa0
	defb 002h		;7aa1
	defb 000h		;7aa2
	defb 0c3h		;7aa3
	defb 089h		;7aa4
	defb 036h		;7aa5  '6'
	defb 055h		;7aa6  'U'
	defb 057h		;7aa7  'W'
	defb 0ffh		;7aa8
	defb 000h		;7aa9
	defb 03fh		;7aaa  '?'
	defb 0fch		;7aab
	defb 0b4h		;7aac
	defb 089h		;7aad
	defb 001h		;7aae
	defb 012h		;7aaf
	defb 0fah		;7ab0
	defb 0d3h		;7ab1
	defb 087h		;7ab2
	defb 021h		;7ab3  '!'
	defb 010h		;7ab4
	defb 0cdh		;7ab5
	defb 087h		;7ab6
	defb 0ffh		;7ab7
	defb 001h		;7ab8
	defb 012h		;7ab9
	defb 0fah		;7aba
	defb 0d3h		;7abb
	defb 087h		;7abc
	defb 002h		;7abd
	defb 00bh		;7abe
	defb 002h		;7abf
	defb 0fch		;7ac0
	defb 068h		;7ac1  'h'
	defb 089h		;7ac2
	defb 021h		;7ac3  '!'
	defb 012h		;7ac4
	defb 0cdh		;7ac5
	defb 087h		;7ac6
	defb 002h		;7ac7
	defb 009h		;7ac8
	defb 002h		;7ac9
	defb 0fch		;7aca
	defb 0b4h		;7acb
	defb 089h		;7acc
	defb 000h		;7acd
	defb 00fh		;7ace
	defb 0fch		;7acf
	defb 09bh		;7ad0
	defb 089h		;7ad1
	defb 064h		;7ad2  'd'
	defb 0ffh		;7ad3
	defb 064h		;7ad4  'd'
	defb 063h		;7ad5  'c'
	defb 013h		;7ad6
	defb 000h		;7ad7
	defb 040h		;7ad8  '@'
	defb 0fch		;7ad9
	defb 0b4h		;7ada
	defb 089h		;7adb
	defb 000h		;7adc
	defb 020h		;7add  ' '
	defb 0fah		;7ade
	defb 0b4h		;7adf
	defb 087h		;7ae0
	defb 021h		;7ae1  '!'
	defb 010h		;7ae2
	defb 0c2h		;7ae3
	defb 087h		;7ae4
	defb 051h		;7ae5  'Q'
	defb 03fh		;7ae6  '?'
	defb 0ffh		;7ae7
	defb 062h		;7ae8  'b'
	defb 065h		;7ae9  'e'
	defb 000h		;7aea
	defb 002h		;7aeb
	defb 0fah		;7aec
	defb 0b4h		;7aed
	defb 087h		;7aee
	defb 002h		;7aef
	defb 006h		;7af0
	defb 002h		;7af1
	defb 0fah		;7af2
	defb 0b4h		;7af3
	defb 089h		;7af4
	defb 004h		;7af5
	defb 0fch		;7af6
	defb 0b4h		;7af7
	defb 089h		;7af8
	defb 000h		;7af9
	defb 01bh		;7afa
	defb 0fch		;7afb
	defb 0b9h		;7afc
	defb 089h		;7afd
	defb 035h		;7afe  '5'
	defb 010h		;7aff
	defb 029h		;7b00  ')'
	defb 0ffh		;7b01
	defb 064h		;7b02  'd'
	defb 063h		;7b03  'c'
	defb 013h		;7b04
	defb 000h		;7b05
	defb 020h		;7b06  ' '
	defb 0fch		;7b07
	defb 0b4h		;7b08
	defb 089h		;7b09
; "%TUVW"
	defb 025h		;7b0a  '%'
	defb 054h		;7b0b  'T'
	defb 055h		;7b0c  'U'
	defb 056h		;7b0d  'V'
	defb 057h		;7b0e  'W'
	defb 0ffh		;7b0f
	defb 062h		;7b10  'b'
	defb 065h		;7b11  'e'
	defb 001h		;7b12
	defb 00ah		;7b13
	defb 07eh		;7b14  '~'
	defb 0ceh		;7b15
	defb 088h		;7b16
	defb 000h		;7b17
	defb 01dh		;7b18
	defb 0fch		;7b19
	defb 0b4h		;7b1a
	defb 089h		;7b1b
	defb 021h		;7b1c  '!'
	defb 002h		;7b1d
	defb 0b6h		;7b1e
	defb 089h		;7b1f
	defb 0ffh		;7b20
	defb 063h		;7b21  'c'
	defb 013h		;7b22
	defb 001h		;7b23
	defb 00ch		;7b24
	defb 07eh		;7b25  '~'
	defb 0ceh		;7b26
	defb 087h		;7b27
	defb 000h		;7b28
	defb 005h		;7b29
	defb 0fch		;7b2a
	defb 02fh		;7b2b  '/'
	defb 089h		;7b2c
	defb 000h		;7b2d
	defb 016h		;7b2e
	defb 0fch		;7b2f
	defb 094h		;7b30
	defb 089h		;7b31
	defb 021h		;7b32  '!'
	defb 012h		;7b33
	defb 0b6h		;7b34
	defb 087h		;7b35
	defb 000h		;7b36
	defb 00eh		;7b37
	defb 0fah		;7b38
	defb 0e6h		;7b39
	defb 089h		;7b3a
	defb 002h		;7b3b
	defb 003h		;7b3c
	defb 005h		;7b3d
	defb 0fah		;7b3e
	defb 04eh		;7b3f  'N'
	defb 089h		;7b40
	defb 00ch		;7b41
	defb 005h		;7b42
	defb 0fah		;7b43
	defb 0c9h		;7b44
	defb 089h		;7b45
	defb 038h		;7b46  '8'
	defb 0ffh		;7b47
	defb 002h		;7b48
	defb 002h		;7b49
	defb 003h		;7b4a
	defb 0fah		;7b4b
	defb 0b8h		;7b4c
	defb 087h		;7b4d
	defb 001h		;7b4e
	defb 00ch		;7b4f
	defb 002h		;7b50
	defb 018h		;7b51
	defb 088h		;7b52
	defb 002h		;7b53
	defb 005h		;7b54
	defb 003h		;7b55
	defb 0fah		;7b56
	defb 094h		;7b57
	defb 089h		;7b58
	defb 000h		;7b59
	defb 01bh		;7b5a
	defb 0fch		;7b5b
	defb 099h		;7b5c
	defb 089h		;7b5d
	defb 002h		;7b5e
	defb 004h		;7b5f
	defb 00fh		;7b60
	defb 008h		;7b61
	defb 0b4h		;7b62
	defb 087h		;7b63
; "KLbe"
	defb 04bh		;7b64  'K'
	defb 04ch		;7b65  'L'
	defb 062h		;7b66  'b'
	defb 065h		;7b67  'e'
	defb 0ffh		;7b68
	defb 002h		;7b69
	defb 005h		;7b6a
	defb 006h		;7b6b
	defb 0fah		;7b6c
	defb 0b4h		;7b6d
	defb 087h		;7b6e
	defb 002h		;7b6f
	defb 005h		;7b70
	defb 009h		;7b71
	defb 008h		;7b72
	defb 074h		;7b73  't'
	defb 088h		;7b74
	defb 002h		;7b75
	defb 00ah		;7b76
	defb 003h		;7b77
	defb 0fah		;7b78
	defb 094h		;7b79
	defb 089h		;7b7a
	defb 002h		;7b7b
	defb 003h		;7b7c
	defb 003h		;7b7d
	defb 0fah		;7b7e
	defb 0b1h		;7b7f
	defb 089h		;7b80
	defb 002h		;7b81
	defb 013h		;7b82
	defb 002h		;7b83
	defb 008h		;7b84
	defb 0beh		;7b85
	defb 089h		;7b86
	defb 000h		;7b87
	defb 015h		;7b88
	defb 0f2h		;7b89
	defb 09dh		;7b8a
	defb 089h		;7b8b
	defb 00eh		;7b8c
	defb 003h		;7b8d
	defb 0abh		;7b8e
	defb 089h		;7b8f
	defb 0ffh		;7b90
	defb 003h		;7b91
	defb 0fah		;7b92
	defb 002h		;7b93
	defb 013h		;7b94
	defb 012h		;7b95
	defb 008h		;7b96
	defb 0beh		;7b97
	defb 087h		;7b98
	defb 00eh		;7b99
	defb 012h		;7b9a
	defb 0cbh		;7b9b
	defb 087h		;7b9c
	defb 0ffh		;7b9d
	defb 003h		;7b9e
	defb 0fah		;7b9f
	defb 002h		;7ba0
	defb 013h		;7ba1
	defb 008h		;7ba2
	defb 008h		;7ba3
	defb 0beh		;7ba4
	defb 087h		;7ba5
	defb 000h		;7ba6
	defb 0e0h		;7ba7
	defb 008h		;7ba8
	defb 0b4h		;7ba9
	defb 088h		;7baa
	defb 00eh		;7bab
	defb 00fh		;7bac
	defb 0cbh		;7bad
	defb 087h		;7bae
	defb 039h		;7baf  '9'
	defb 0ffh		;7bb0
	defb 002h		;7bb1
	defb 003h		;7bb2
	defb 003h		;7bb3
	defb 0fah		;7bb4
	defb 094h		;7bb5
	defb 089h		;7bb6
	defb 002h		;7bb7
	defb 01eh		;7bb8
	defb 003h		;7bb9
	defb 0fch		;7bba
	defb 096h		;7bbb
	defb 089h		;7bbc
	defb 04dh		;7bbd  'M'
	defb 0ffh		;7bbe
	defb 068h		;7bbf  'h'
	defb 002h		;7bc0
	defb 003h		;7bc1
	defb 012h		;7bc2
	defb 0fah		;7bc3
	defb 0b4h		;7bc4
	defb 087h		;7bc5
	defb 000h		;7bc6
	defb 01eh		;7bc7
	defb 0fch		;7bc8
	defb 016h		;7bc9
	defb 089h		;7bca
	defb 001h		;7bcb
	defb 006h		;7bcc
	defb 07eh		;7bcd  '~'
	defb 04eh		;7bce  'N'
	defb 089h		;7bcf
	defb 0ffh		;7bd0
	defb 068h		;7bd1  'h'
	defb 002h		;7bd2
	defb 003h		;7bd3
	defb 008h		;7bd4
	defb 0fah		;7bd5
	defb 0b4h		;7bd6
	defb 087h		;7bd7
	defb 001h		;7bd8
	defb 007h		;7bd9
	defb 008h		;7bda
	defb 0b4h		;7bdb
	defb 088h		;7bdc
	defb 001h		;7bdd
	defb 007h		;7bde
	defb 07eh		;7bdf  '~'
	defb 0b5h		;7be0
	defb 088h		;7be1
	defb 001h		;7be2
	defb 00fh		;7be3
	defb 07eh		;7be4  '~'
	defb 0ceh		;7be5
	defb 087h		;7be6
	defb 000h		;7be7
	defb 05ch		;7be8  '\'
	defb 0fch		;7be9
	defb 098h		;7bea
	defb 089h		;7beb
	defb 002h		;7bec
	defb 004h		;7bed
	defb 003h		;7bee
	defb 0fah		;7bef
	defb 094h		;7bf0
	defb 089h		;7bf1
	defb 038h		;7bf2  '8'
	defb 04eh		;7bf3  'N'
	defb 0ffh		;7bf4
	defb 021h		;7bf5  '!'
	defb 00fh		;7bf6
	defb 0bah		;7bf7
	defb 087h		;7bf8
	defb 001h		;7bf9
	defb 006h		;7bfa
	defb 0fah		;7bfb
	defb 0d3h		;7bfc
	defb 087h		;7bfd
	defb 002h		;7bfe
	defb 003h		;7bff
	defb 003h		;7c00
	defb 0fah		;7c01
	defb 0b1h		;7c02
	defb 089h		;7c03
	defb 002h		;7c04
	defb 01eh		;7c05
	defb 003h		;7c06
	defb 0fch		;7c07
	defb 094h		;7c08
	defb 089h		;7c09
	defb 034h		;7c0a  '4'
	defb 04eh		;7c0b  'N'
	defb 0ffh		;7c0c
	defb 003h		;7c0d
	defb 0fah		;7c0e
	defb 000h		;7c0f
	defb 000h		;7c10
	defb 013h		;7c11
	defb 074h		;7c12  't'
	defb 088h		;7c13
	defb 000h		;7c14
	defb 020h		;7c15  ' '
	defb 013h		;7c16
	defb 074h		;7c17  't'
	defb 089h		;7c18
	defb 001h		;7c19
	defb 009h		;7c1a
	defb 07eh		;7c1b  '~'
	defb 078h		;7c1c  'x'
	defb 088h		;7c1d
	defb 001h		;7c1e
	defb 009h		;7c1f
	defb 07eh		;7c20  '~'
	defb 090h		;7c21
	defb 088h		;7c22
	defb 0ffh		;7c23
	defb 068h		;7c24  'h'
	defb 002h		;7c25
	defb 003h		;7c26
	defb 002h		;7c27
	defb 0fah		;7c28
	defb 0d1h		;7c29
	defb 087h		;7c2a
	defb 000h		;7c2b
	defb 020h		;7c2c  ' '
	defb 0fch		;7c2d
	defb 014h		;7c2e
	defb 089h		;7c2f
	defb 0ffh		;7c30
	defb 068h		;7c31  'h'
	defb 000h		;7c32
	defb 060h		;7c33  '`' (Spectrum: GBP)
	defb 0fch		;7c34
	defb 094h		;7c35
	defb 089h		;7c36
	defb 04fh		;7c37  'O'
	defb 0ffh		;7c38
	defb 068h		;7c39  'h'
	defb 000h		;7c3a
	defb 060h		;7c3b  '`' (Spectrum: GBP)
	defb 0fch		;7c3c
	defb 094h		;7c3d
	defb 089h		;7c3e
	defb 001h		;7c3f
	defb 00fh		;7c40
	defb 07eh		;7c41  '~'
	defb 0b8h		;7c42
	defb 087h		;7c43
	defb 001h		;7c44
	defb 00fh		;7c45
	defb 07eh		;7c46  '~'
	defb 0d0h		;7c47
	defb 087h		;7c48
	defb 040h		;7c49  '@'
	defb 04dh		;7c4a  'M'
	defb 04eh		;7c4b  'N'
	defb 0ffh		;7c4c
	defb 068h		;7c4d  'h'
	defb 000h		;7c4e
	defb 040h		;7c4f  '@'
	defb 0fah		;7c50
	defb 0b4h		;7c51
	defb 087h		;7c52
	defb 001h		;7c53
	defb 010h		;7c54
	defb 07eh		;7c55  '~'
	defb 0f8h		;7c56
	defb 087h		;7c57
	defb 001h		;7c58
	defb 010h		;7c59
	defb 07eh		;7c5a  '~'
	defb 010h		;7c5b
	defb 088h		;7c5c
	defb 000h		;7c5d
	defb 020h		;7c5e  ' '
	defb 0fch		;7c5f
	defb 014h		;7c60
	defb 089h		;7c61
	defb 0ffh		;7c62
	defb 000h		;7c63
	defb 020h		;7c64  ' '
	defb 0fch		;7c65
	defb 094h		;7c66
	defb 089h		;7c67
	defb 033h		;7c68  '3'
	defb 034h		;7c69  '4'
	defb 0ffh		;7c6a
	defb 068h		;7c6b  'h'
	defb 002h		;7c6c
	defb 004h		;7c6d
	defb 002h		;7c6e
	defb 0fah		;7c6f
	defb 0b4h		;7c70
	defb 087h		;7c71
	defb 021h		;7c72  '!'
	defb 00bh		;7c73
	defb 0b9h		;7c74
	defb 087h		;7c75
	defb 000h		;7c76
	defb 020h		;7c77  ' '
	defb 0fch		;7c78
	defb 014h		;7c79
	defb 089h		;7c7a
	defb 0ffh		;7c7b
	defb 068h		;7c7c  'h'
	defb 002h		;7c7d
	defb 002h		;7c7e
	defb 002h		;7c7f
	defb 0fch		;7c80
	defb 094h		;7c81
	defb 089h		;7c82
	defb 00ch		;7c83
	defb 003h		;7c84
	defb 0fah		;7c85
	defb 0d4h		;7c86
	defb 089h		;7c87
	defb 000h		;7c88
	defb 01ah		;7c89
	defb 0f2h		;7c8a
	defb 0b7h		;7c8b
	defb 089h		;7c8c
	defb 000h		;7c8d
	defb 01ah		;7c8e
	defb 008h		;7c8f
	defb 0d7h		;7c90
	defb 089h		;7c91
	defb 00eh		;7c92
	defb 002h		;7c93
	defb 0c7h		;7c94
	defb 089h		;7c95
	defb 002h		;7c96
	defb 002h		;7c97
	defb 002h		;7c98
	defb 0fch		;7c99
	defb 0b2h		;7c9a
	defb 089h		;7c9b
	defb 00bh		;7c9c
	defb 003h		;7c9d
	defb 0fah		;7c9e
	defb 0f1h		;7c9f
	defb 089h		;7ca0
	defb 0ffh		;7ca1
	defb 003h		;7ca2
	defb 0fah		;7ca3
	defb 002h		;7ca4
	defb 01ah		;7ca5
	defb 008h		;7ca6
	defb 008h		;7ca7
	defb 0b7h		;7ca8
	defb 087h		;7ca9
	defb 000h		;7caa
	defb 000h		;7cab
	defb 008h		;7cac
	defb 094h		;7cad
	defb 088h		;7cae
	defb 00eh		;7caf
	defb 00fh		;7cb0
	defb 0c7h		;7cb1
	defb 087h		;7cb2
	defb 0ffh		;7cb3
	defb 003h		;7cb4
	defb 0fah		;7cb5
	defb 002h		;7cb6
	defb 017h		;7cb7
	defb 008h		;7cb8
	defb 008h		;7cb9
	defb 0bah		;7cba
	defb 087h		;7cbb
	defb 002h		;7cbc
	defb 01dh		;7cbd
	defb 009h		;7cbe
	defb 008h		;7cbf
	defb 074h		;7cc0  't'
	defb 088h		;7cc1
	defb 00eh		;7cc2
	defb 00fh		;7cc3
	defb 0cah		;7cc4
	defb 087h		;7cc5
	defb 0ffh		;7cc6
	defb 068h		;7cc7  'h'
	defb 002h		;7cc8
	defb 003h		;7cc9
	defb 012h		;7cca
	defb 0fah		;7ccb
	defb 0d1h		;7ccc
	defb 087h		;7ccd
	defb 002h		;7cce
	defb 005h		;7ccf
	defb 003h		;7cd0
	defb 0fch		;7cd1
	defb 094h		;7cd2
	defb 089h		;7cd3
	defb 00ch		;7cd4
	defb 003h		;7cd5
	defb 0fah		;7cd6
	defb 0d7h		;7cd7
	defb 089h		;7cd8
	defb 021h		;7cd9  '!'
	defb 010h		;7cda
	defb 0cah		;7cdb
	defb 087h		;7cdc
	defb 000h		;7cdd
	defb 017h		;7cde
	defb 0f2h		;7cdf
	defb 0bah		;7ce0
	defb 089h		;7ce1
	defb 000h		;7ce2
	defb 017h		;7ce3
	defb 008h		;7ce4
	defb 0dah		;7ce5
	defb 089h		;7ce6
	defb 00eh		;7ce7
	defb 002h		;7ce8
	defb 0cah		;7ce9
	defb 089h		;7cea
	defb 0ffh		;7ceb
	defb 068h		;7cec  'h'
	defb 002h		;7ced
	defb 003h		;7cee
	defb 012h		;7cef
	defb 0fah		;7cf0
	defb 0d1h		;7cf1
	defb 087h		;7cf2
	defb 000h		;7cf3
	defb 01eh		;7cf4
	defb 0fch		;7cf5
	defb 014h		;7cf6
	defb 089h		;7cf7
	defb 021h		;7cf8  '!'
	defb 007h		;7cf9
	defb 02ah		;7cfa  '*'
	defb 089h		;7cfb
	defb 0ffh		;7cfc
	defb 068h		;7cfd  'h'
	defb 000h		;7cfe
	defb 060h		;7cff  '`' (Spectrum: GBP)
	defb 0fch		;7d00
	defb 094h		;7d01
	defb 089h		;7d02
	defb 037h		;7d03  '7'
	defb 0ffh		;7d04
	defb 068h		;7d05  'h'
	defb 000h		;7d06
	defb 020h		;7d07  ' '
	defb 0fch		;7d08
	defb 014h		;7d09
	defb 089h		;7d0a
	defb 0ffh		;7d0b
	defb 002h		;7d0c
	defb 020h		;7d0d  ' '
	defb 003h		;7d0e
	defb 0fch		;7d0f
	defb 094h		;7d10
	defb 089h		;7d11
	defb 037h		;7d12  '7'
	defb 0ffh		;7d13
	defb 000h		;7d14
	defb 020h		;7d15  ' '
	defb 0fch		;7d16
	defb 094h		;7d17
	defb 089h		;7d18
; "[34c"
	defb 05bh		;7d19  '['
	defb 033h		;7d1a  '3'
	defb 034h		;7d1b  '4'
	defb 063h		;7d1c  'c'
	defb 013h		;7d1d
	defb 064h		;7d1e  'd'
	defb 0ffh		;7d1f
	defb 000h		;7d20
	defb 004h		;7d21
	defb 0fah		;7d22
	defb 0b4h		;7d23
	defb 087h		;7d24
	defb 002h		;7d25
	defb 002h		;7d26
	defb 00eh		;7d27
	defb 008h		;7d28
	defb 0d4h		;7d29
	defb 087h		;7d2a
	defb 001h		;7d2b
	defb 00eh		;7d2c
	defb 002h		;7d2d
	defb 0d6h		;7d2e
	defb 087h		;7d2f
	defb 002h		;7d30
	defb 004h		;7d31
	defb 003h		;7d32
	defb 0fah		;7d33
	defb 094h		;7d34
	defb 089h		;7d35
	defb 000h		;7d36
	defb 01ch		;7d37
	defb 0fch		;7d38
	defb 098h		;7d39
	defb 089h		;7d3a
	defb 034h		;7d3b  '4'
	defb 0ffh		;7d3c
	defb 000h		;7d3d
	defb 020h		;7d3e  ' '
	defb 0fch		;7d3f
	defb 094h		;7d40
	defb 089h		;7d41
; "[\7k"
	defb 05bh		;7d42  '['
	defb 05ch		;7d43  '\'
	defb 037h		;7d44  '7'
	defb 06bh		;7d45  'k'
	defb 0ffh		;7d46
	defb 000h		;7d47
	defb 020h		;7d48  ' '
	defb 0fch		;7d49
	defb 094h		;7d4a
	defb 089h		;7d4b
	defb 002h		;7d4c
	defb 003h		;7d4d
	defb 002h		;7d4e
	defb 0fah		;7d4f
	defb 0d1h		;7d50
	defb 089h		;7d51
	defb 021h		;7d52  '!'
	defb 00fh		;7d53
	defb 0cdh		;7d54
	defb 087h		;7d55
	defb 021h		;7d56  '!'
	defb 003h		;7d57
	defb 0ach		;7d58
	defb 089h		;7d59
	defb 04bh		;7d5a  'K'
	defb 04ch		;7d5b  'L'
	defb 066h		;7d5c  'f'
	defb 0ffh		;7d5d
	defb 000h		;7d5e
	defb 002h		;7d5f
	defb 0fch		;7d60
	defb 094h		;7d61
	defb 089h		;7d62
	defb 000h		;7d63
	defb 007h		;7d64
	defb 0fah		;7d65
	defb 0b4h		;7d66
	defb 089h		;7d67
	defb 000h		;7d68
	defb 020h		;7d69  ' '
	defb 0fah		;7d6a
	defb 0d4h		;7d6b
	defb 089h		;7d6c
	defb 0ffh		;7d6d
	defb 003h		;7d6e
	defb 0fah		;7d6f
	defb 002h		;7d70
	defb 01dh		;7d71
	defb 00fh		;7d72
	defb 008h		;7d73
	defb 0b7h		;7d74
	defb 087h		;7d75
	defb 002h		;7d76
	defb 004h		;7d77
	defb 00ah		;7d78
	defb 0fah		;7d79
	defb 067h		;7d7a  'g'
	defb 088h		;7d7b
	defb 000h		;7d7c
	defb 013h		;7d7d
	defb 0fch		;7d7e
	defb 076h		;7d7f  'v'
	defb 088h		;7d80
	defb 001h		;7d81
	defb 005h		;7d82
	defb 002h		;7d83
	defb 0c9h		;7d84
	defb 087h		;7d85
	defb 00eh		;7d86
	defb 00fh		;7d87
	defb 0cch		;7d88
	defb 087h		;7d89
	defb 0ffh		;7d8a
	defb 003h		;7d8b
	defb 008h		;7d8c
	defb 002h		;7d8d
	defb 003h		;7d8e
	defb 012h		;7d8f
	defb 0fah		;7d90
	defb 0b4h		;7d91
	defb 087h		;7d92
	defb 001h		;7d93
	defb 012h		;7d94
	defb 002h		;7d95
	defb 0c9h		;7d96
	defb 087h		;7d97
	defb 000h		;7d98
	defb 014h		;7d99
	defb 0fch		;7d9a
	defb 0c0h		;7d9b
	defb 088h		;7d9c
	defb 00eh		;7d9d
	defb 012h		;7d9e
	defb 0cch		;7d9f
	defb 087h		;7da0
	defb 0ffh		;7da1
	defb 003h		;7da2
	defb 008h		;7da3
	defb 002h		;7da4
	defb 003h		;7da5
	defb 012h		;7da6
	defb 0fah		;7da7
	defb 0b4h		;7da8
	defb 087h		;7da9
	defb 001h		;7daa
	defb 012h		;7dab
	defb 002h		;7dac
	defb 0c9h		;7dad
	defb 087h		;7dae
	defb 000h		;7daf
	defb 00dh		;7db0
	defb 0fch		;7db1
	defb 047h		;7db2  'G'
	defb 089h		;7db3
	defb 00eh		;7db4
	defb 012h		;7db5
	defb 0cch		;7db6
	defb 087h		;7db7
	defb 0ffh		;7db8
	defb 003h		;7db9
	defb 008h		;7dba
	defb 002h		;7dbb
	defb 003h		;7dbc
	defb 012h		;7dbd
	defb 0fah		;7dbe
	defb 0b4h		;7dbf
	defb 087h		;7dc0
	defb 000h		;7dc1
	defb 01dh		;7dc2
	defb 0fch		;7dc3
	defb 077h		;7dc4  'w'
	defb 089h		;7dc5
	defb 00eh		;7dc6
	defb 004h		;7dc7
	defb 08ch		;7dc8
	defb 089h		;7dc9
	defb 001h		;7dca
	defb 003h		;7dcb
	defb 002h		;7dcc
	defb 0a9h		;7dcd
	defb 089h		;7dce
	defb 00eh		;7dcf
	defb 00eh		;7dd0
	defb 0bah		;7dd1
	defb 087h		;7dd2
	defb 0ffh		;7dd3
	defb 003h		;7dd4
	defb 008h		;7dd5
	defb 002h		;7dd6
	defb 003h		;7dd7
	defb 012h		;7dd8
	defb 0fah		;7dd9
	defb 0b4h		;7dda
	defb 087h		;7ddb
	defb 000h		;7ddc
	defb 01dh		;7ddd
	defb 0fch		;7dde
	defb 097h		;7ddf
	defb 089h		;7de0
	defb 00eh		;7de1
	defb 012h		;7de2
	defb 0bah		;7de3
	defb 087h		;7de4
	defb 037h		;7de5  '7'
	defb 0ffh		;7de6
	defb 002h		;7de7
	defb 003h		;7de8
	defb 003h		;7de9
	defb 0fah		;7dea
	defb 0b5h		;7deb
	defb 087h		;7dec
	defb 001h		;7ded
	defb 00fh		;7dee
	defb 008h		;7def
	defb 0b4h		;7df0
	defb 087h		;7df1
	defb 001h		;7df2
	defb 00ch		;7df3
	defb 002h		;7df4
	defb 015h		;7df5
	defb 088h		;7df6
	defb 002h		;7df7
	defb 003h		;7df8
	defb 003h		;7df9
	defb 0fah		;7dfa
	defb 094h		;7dfb
	defb 089h		;7dfc
	defb 000h		;7dfd
	defb 01dh		;7dfe
	defb 0fch		;7dff
	defb 0b7h		;7e00
	defb 089h		;7e01
	defb 000h		;7e02
	defb 01dh		;7e03
	defb 008h		;7e04
	defb 0d7h		;7e05
	defb 089h		;7e06
	defb 00eh		;7e07
	defb 002h		;7e08
	defb 0bah		;7e09
	defb 089h		;7e0a
	defb 021h		;7e0b  '!'
	defb 010h		;7e0c
	defb 0c4h		;7e0d
	defb 087h		;7e0e
	defb 0ffh		;7e0f
	defb 000h		;7e10
	defb 003h		;7e11
	defb 0fah		;7e12
	defb 0d4h		;7e13
	defb 089h		;7e14
	defb 000h		;7e15
	defb 01dh		;7e16
	defb 0fch		;7e17
	defb 0d7h		;7e18
	defb 089h		;7e19
	defb 021h		;7e1a  '!'
	defb 001h		;7e1b
	defb 0e4h		;7e1c
	defb 089h		;7e1d
	defb 0ffh		;7e1e
	defb 002h		;7e1f
	defb 003h		;7e20
	defb 006h		;7e21
	defb 0fah		;7e22
	defb 0d1h		;7e23
	defb 087h		;7e24
	defb 002h		;7e25
	defb 003h		;7e26
	defb 009h		;7e27
	defb 008h		;7e28
	defb 091h		;7e29
	defb 088h		;7e2a
	defb 002h		;7e2b
	defb 003h		;7e2c
	defb 003h		;7e2d
	defb 0fah		;7e2e
	defb 0b1h		;7e2f
	defb 089h		;7e30
	defb 000h		;7e31
	defb 00bh		;7e32
	defb 0fch		;7e33
	defb 0d4h		;7e34
	defb 089h		;7e35
	defb 000h		;7e36
	defb 00bh		;7e37
	defb 0f2h		;7e38
	defb 0a6h		;7e39
	defb 089h		;7e3a
	defb 000h		;7e3b
	defb 004h		;7e3c
	defb 0f2h		;7e3d
	defb 0ceh		;7e3e
	defb 089h		;7e3f
	defb 0ffh		;7e40
	defb 002h		;7e41
	defb 003h		;7e42
	defb 012h		;7e43
	defb 0fah		;7e44
	defb 0d1h		;7e45
	defb 087h		;7e46
	defb 001h		;7e47
	defb 010h		;7e48
	defb 002h		;7e49
	defb 0b7h		;7e4a
	defb 087h		;7e4b
	defb 000h		;7e4c
	defb 01dh		;7e4d
	defb 0fch		;7e4e
	defb 0b4h		;7e4f
	defb 089h		;7e50
	defb 000h		;7e51
	defb 01dh		;7e52
	defb 008h		;7e53
	defb 0d4h		;7e54
	defb 089h		;7e55
	defb 004h		;7e56
	defb 002h		;7e57
	defb 0dfh		;7e58
	defb 089h		;7e59
	defb 049h		;7e5a  'I'
	defb 04ah		;7e5b  'J'
	defb 0ffh		;7e5c
	defb 003h		;7e5d
	defb 008h		;7e5e
	defb 002h		;7e5f
	defb 003h		;7e60
	defb 006h		;7e61
	defb 0fah		;7e62
	defb 0d1h		;7e63
	defb 087h		;7e64
	defb 002h		;7e65
	defb 003h		;7e66
	defb 007h		;7e67
	defb 008h		;7e68
	defb 0d1h		;7e69
	defb 088h		;7e6a
	defb 002h		;7e6b
	defb 007h		;7e6c
	defb 003h		;7e6d
	defb 0fah		;7e6e
	defb 0adh		;7e6f
	defb 089h		;7e70
	defb 001h		;7e71
	defb 012h		;7e72
	defb 002h		;7e73
	defb 0bfh		;7e74
	defb 087h		;7e75
	defb 000h		;7e76
	defb 010h		;7e77
	defb 0fch		;7e78
	defb 094h		;7e79
	defb 089h		;7e7a
	defb 0ffh		;7e7b
	defb 003h		;7e7c
	defb 008h		;7e7d
	defb 001h		;7e7e
	defb 00eh		;7e7f
	defb 002h		;7e80
	defb 0bfh		;7e81
	defb 087h		;7e82
	defb 002h		;7e83
	defb 007h		;7e84
	defb 002h		;7e85
	defb 0fah		;7e86
	defb 0cdh		;7e87
	defb 087h		;7e88
	defb 002h		;7e89
	defb 003h		;7e8a
	defb 010h		;7e8b
	defb 0fah		;7e8c
	defb 011h		;7e8d
	defb 088h		;7e8e
	defb 000h		;7e8f
	defb 01dh		;7e90
	defb 0fch		;7e91
	defb 074h		;7e92  't'
	defb 089h		;7e93
	defb 001h		;7e94
	defb 003h		;7e95
	defb 002h		;7e96
	defb 095h		;7e97
	defb 089h		;7e98
	defb 0ffh		;7e99
	defb 003h		;7e9a
	defb 008h		;7e9b
	defb 002h		;7e9c
	defb 003h		;7e9d
	defb 012h		;7e9e
	defb 0fah		;7e9f
	defb 0d1h		;7ea0
	defb 087h		;7ea1
	defb 001h		;7ea2
	defb 012h		;7ea3
	defb 002h		;7ea4
	defb 0b5h		;7ea5
	defb 087h		;7ea6
	defb 000h		;7ea7
	defb 008h		;7ea8
	defb 0fch		;7ea9
	defb 034h		;7eaa  '4'
	defb 089h		;7eab
	defb 000h		;7eac
	defb 00eh		;7ead
	defb 0fch		;7eae
	defb 0c5h		;7eaf
	defb 089h		;7eb0
	defb 0ffh		;7eb1
	defb 003h		;7eb2
	defb 008h		;7eb3
	defb 002h		;7eb4
	defb 003h		;7eb5
	defb 012h		;7eb6
	defb 0fah		;7eb7
	defb 0d1h		;7eb8
	defb 087h		;7eb9
	defb 001h		;7eba
	defb 012h		;7ebb
	defb 002h		;7ebc
	defb 0b5h		;7ebd
	defb 087h		;7ebe
	defb 000h		;7ebf
	defb 006h		;7ec0
	defb 0fch		;7ec1
	defb 0b4h		;7ec2
	defb 088h		;7ec3
	defb 0ffh		;7ec4
	defb 003h		;7ec5
	defb 008h		;7ec6
	defb 002h		;7ec7
	defb 003h		;7ec8
	defb 006h		;7ec9
	defb 0fah		;7eca
	defb 0d1h		;7ecb
	defb 087h		;7ecc
	defb 002h		;7ecd
	defb 003h		;7ece
	defb 003h		;7ecf
	defb 0fah		;7ed0
	defb 094h		;7ed1
	defb 089h		;7ed2
	defb 001h		;7ed3
	defb 00fh		;7ed4
	defb 002h		;7ed5
	defb 0b5h		;7ed6
	defb 087h		;7ed7
	defb 002h		;7ed8
	defb 003h		;7ed9
	defb 003h		;7eda
	defb 0fah		;7edb
	defb 0b1h		;7edc
	defb 089h		;7edd
	defb 000h		;7ede
	defb 01ch		;7edf
	defb 0f2h		;7ee0
	defb 0b6h		;7ee1
	defb 089h		;7ee2
	defb 000h		;7ee3
	defb 01ah		;7ee4
	defb 008h		;7ee5
	defb 0d7h		;7ee6
	defb 089h		;7ee7
	defb 00eh		;7ee8
	defb 002h		;7ee9
	defb 0c3h		;7eea
	defb 089h		;7eeb
	defb 0ffh		;7eec
	defb 021h		;7eed  '!'
	defb 00eh		;7eee
	defb 0cah		;7eef
	defb 087h		;7ef0
	defb 002h		;7ef1
	defb 002h		;7ef2
	defb 006h		;7ef3
	defb 0fah		;7ef4
	defb 0d2h		;7ef5
	defb 087h		;7ef6
	defb 000h		;7ef7
	defb 011h		;7ef8
	defb 0fch		;7ef9
	defb 094h		;7efa
	defb 089h		;7efb
	defb 021h		;7efc  '!'
	defb 003h		;7efd
	defb 09ch		;7efe
	defb 089h		;7eff
	defb 002h		;7f00
	defb 00fh		;7f01
	defb 004h		;7f02
	defb 0fah		;7f03
	defb 085h		;7f04
	defb 089h		;7f05
	defb 066h		;7f06  'f'
	defb 0ffh		;7f07
	defb 000h		;7f08
	defb 03ch		;7f09  '<'
	defb 0fch		;7f0a
	defb 0b8h		;7f0b
	defb 089h		;7f0c
	defb 002h		;7f0d
	defb 004h		;7f0e
	defb 012h		;7f0f
	defb 0fah		;7f10
	defb 0b4h		;7f11
	defb 087h		;7f12
	defb 021h		;7f13  '!'
	defb 012h		;7f14
	defb 0bch		;7f15
	defb 087h		;7f16
	defb 010h		;7f17
	defb 056h		;7f18  'V'
	defb 0ffh		;7f19
	defb 002h		;7f1a
	defb 004h		;7f1b
	defb 012h		;7f1c
	defb 0fah		;7f1d
	defb 0b4h		;7f1e
	defb 087h		;7f1f
	defb 000h		;7f20
	defb 01ch		;7f21
	defb 0fch		;7f22
	defb 0d8h		;7f23
	defb 089h		;7f24
	defb 021h		;7f25  '!'
	defb 001h		;7f26
	defb 0dch		;7f27
	defb 089h		;7f28
	defb 05ah		;7f29  'Z'
	defb 065h		;7f2a  'e'
	defb 062h		;7f2b  'b'
	defb 0ffh		;7f2c
	defb 000h		;7f2d
	defb 03eh		;7f2e  '>'
	defb 0fch		;7f2f
	defb 0b4h		;7f30
	defb 089h		;7f31
	defb 021h		;7f32  '!'
	defb 002h		;7f33
	defb 0cah		;7f34
	defb 089h		;7f35
	defb 002h		;7f36
	defb 002h		;7f37
	defb 012h		;7f38
	defb 0fah		;7f39
	defb 0d2h		;7f3a
	defb 087h		;7f3b
	defb 028h		;7f3c  '('
	defb 054h		;7f3d  'T'
	defb 055h		;7f3e  'U'
	defb 0ffh		;7f3f
	defb 000h		;7f40
	defb 01eh		;7f41
	defb 0fch		;7f42
	defb 094h		;7f43
	defb 089h		;7f44
	defb 002h		;7f45
	defb 002h		;7f46
	defb 012h		;7f47
	defb 0fah		;7f48
	defb 0d2h		;7f49
	defb 087h		;7f4a
	defb 021h		;7f4b  '!'
	defb 012h		;7f4c
	defb 0cah		;7f4d
	defb 087h		;7f4e
	defb 05bh		;7f4f  '['
	defb 05ch		;7f50  '\'
	defb 066h		;7f51  'f'
	defb 0ffh		;7f52
	defb 000h		;7f53
	defb 03eh		;7f54  '>'
	defb 0fch		;7f55
	defb 0b4h		;7f56
	defb 089h		;7f57
	defb 021h		;7f58  '!'
	defb 012h		;7f59
	defb 0cah		;7f5a
	defb 087h		;7f5b
	defb 002h		;7f5c
	defb 002h		;7f5d
	defb 012h		;7f5e
	defb 0fah		;7f5f
	defb 0d2h		;7f60
	defb 087h		;7f61
	defb 054h		;7f62  'T'
	defb 055h		;7f63  'U'
	defb 0ffh		;7f64
	defb 001h		;7f65
	defb 012h		;7f66
	defb 0fah		;7f67
	defb 0d3h		;7f68
	defb 087h		;7f69
	defb 000h		;7f6a
	defb 01fh		;7f6b
	defb 0fch		;7f6c
	defb 094h		;7f6d
	defb 089h		;7f6e
	defb 021h		;7f6f  '!'
	defb 012h		;7f70
	defb 0bah		;7f71
	defb 087h		;7f72
	defb 021h		;7f73  '!'
	defb 012h		;7f74
	defb 0c5h		;7f75
	defb 087h		;7f76
	defb 0ffh		;7f77
	defb 001h		;7f78
	defb 012h		;7f79
	defb 0fah		;7f7a
	defb 0d3h		;7f7b
	defb 087h		;7f7c
	defb 000h		;7f7d
	defb 01fh		;7f7e
	defb 0fch		;7f7f
	defb 034h		;7f80  '4'
	defb 089h		;7f81
	defb 021h		;7f82  '!'
	defb 012h		;7f83
	defb 0bah		;7f84
	defb 087h		;7f85
	defb 021h		;7f86  '!'
	defb 012h		;7f87
	defb 0c5h		;7f88
	defb 087h		;7f89
	defb 0ffh		;7f8a
	defb 000h		;7f8b
	defb 020h		;7f8c  ' '
	defb 0fch		;7f8d
	defb 034h		;7f8e  '4'
	defb 089h		;7f8f
	defb 0ffh		;7f90
	defb 002h		;7f91
	defb 005h		;7f92
	defb 012h		;7f93
	defb 0fah		;7f94
	defb 0b4h		;7f95
	defb 087h		;7f96
	defb 000h		;7f97
	defb 01bh		;7f98
	defb 0fch		;7f99
	defb 039h		;7f9a  '9'
	defb 089h		;7f9b
	defb 0ffh		;7f9c
	defb 001h		;7f9d
	defb 012h		;7f9e
	defb 0fah		;7f9f
	defb 0d3h		;7fa0
	defb 087h		;7fa1
	defb 000h		;7fa2
	defb 01fh		;7fa3
	defb 0fch		;7fa4
	defb 034h		;7fa5  '4'
	defb 089h		;7fa6
	defb 021h		;7fa7  '!'
	defb 012h		;7fa8
	defb 0bah		;7fa9
	defb 087h		;7faa
	defb 021h		;7fab  '!'
	defb 00ch		;7fac
	defb 0c5h		;7fad
	defb 087h		;7fae
	defb 0ffh		;7faf
	defb 002h		;7fb0
	defb 003h		;7fb1
	defb 012h		;7fb2
	defb 0fah		;7fb3
	defb 0d1h		;7fb4
	defb 087h		;7fb5
	defb 002h		;7fb6
	defb 01eh		;7fb7
	defb 003h		;7fb8
	defb 0fch		;7fb9
	defb 094h		;7fba
	defb 089h		;7fbb
	defb 021h		;7fbc  '!'
	defb 00fh		;7fbd
	defb 0cch		;7fbe
	defb 087h		;7fbf
	defb 033h		;7fc0  '3'
	defb 0ffh		;7fc1
	defb 002h		;7fc2
	defb 004h		;7fc3
	defb 012h		;7fc4
	defb 0fah		;7fc5
	defb 0b4h		;7fc6
	defb 087h		;7fc7
	defb 000h		;7fc8
	defb 01ch		;7fc9
	defb 0fch		;7fca
	defb 038h		;7fcb  '8'
	defb 089h		;7fcc
	defb 0ffh		;7fcd
	defb 000h		;7fce
	defb 01dh		;7fcf
	defb 0fch		;7fd0
	defb 034h		;7fd1  '4'
	defb 089h		;7fd2
	defb 002h		;7fd3
	defb 003h		;7fd4
	defb 012h		;7fd5
	defb 0fah		;7fd6
	defb 0d1h		;7fd7
	defb 087h		;7fd8
	defb 021h		;7fd9  '!'
	defb 012h		;7fda
	defb 0cch		;7fdb
	defb 087h		;7fdc
	defb 0ffh		;7fdd
	defb 000h		;7fde
	defb 020h		;7fdf  ' '
	defb 0fch		;7fe0
	defb 074h		;7fe1  't'
	defb 089h		;7fe2
	defb 021h		;7fe3  '!'
	defb 012h		;7fe4
	defb 0cdh		;7fe5
	defb 087h		;7fe6
	defb 05dh		;7fe7  ']'
	defb 060h		;7fe8  '`' (Spectrum: GBP)
	defb 0ffh		;7fe9
	defb 069h		;7fea  'i'
	defb 000h		;7feb
	defb 020h		;7fec  ' '
	defb 0fch		;7fed
	defb 074h		;7fee  't'
	defb 089h		;7fef
	defb 05fh		;7ff0  '_'
	defb 060h		;7ff1  '`' (Spectrum: GBP)
	defb 0ffh		;7ff2
	defb 000h		;7ff3
	defb 03ch		;7ff4  '<'
	defb 0fch		;7ff5
	defb 0b8h		;7ff6
	defb 089h		;7ff7
	defb 002h		;7ff8
	defb 004h		;7ff9
	defb 012h		;7ffa
	defb 0fah		;7ffb
	defb 0b4h		;7ffc
	defb 087h		;7ffd
	defb 021h		;7ffe  '!'
	defb 010h		;7fff
	defb 0bch		;8000
	defb 087h		;8001
	defb 035h		;8002  '5'
	defb 010h		;8003
	defb 0ffh		;8004
	defb 002h		;8005
	defb 004h		;8006
	defb 012h		;8007
	defb 0fah		;8008
	defb 0b4h		;8009
	defb 087h		;800a
	defb 000h		;800b
	defb 01ch		;800c
	defb 0fch		;800d
	defb 078h		;800e  'x'
	defb 089h		;800f
	defb 05eh		;8010  '^'
	defb 060h		;8011  '`' (Spectrum: GBP)
	defb 0ffh		;8012
	defb 000h		;8013
	defb 020h		;8014  ' '
	defb 0fch		;8015
	defb 074h		;8016  't'
	defb 089h		;8017
	defb 05dh		;8018  ']'
	defb 05eh		;8019  '^'
	defb 05fh		;801a  '_'
	defb 0ffh		;801b
	defb 000h		;801c
	defb 03dh		;801d  '='
	defb 0fch		;801e
	defb 0b4h		;801f
	defb 089h		;8020
	defb 002h		;8021
	defb 003h		;8022
	defb 012h		;8023
	defb 0fah		;8024
	defb 0d1h		;8025
	defb 087h		;8026
	defb 021h		;8027  '!'
l8028h:
	defb 012h		;8028
	defb 0bch		;8029
	defb 087h		;802a
	defb 056h		;802b  'V'
	defb 0ffh		;802c
	defb 000h		;802d
	defb 01dh		;802e
	defb 0fch		;802f
	defb 074h		;8030  't'
	defb 089h		;8031
	defb 021h		;8032  '!'
	defb 012h		;8033
	defb 0bch		;8034
	defb 087h		;8035
	defb 002h		;8036
	defb 003h		;8037
	defb 012h		;8038
	defb 0fah		;8039
	defb 0d1h		;803a
	defb 087h		;803b
	defb 05dh		;803c  ']'
	defb 05fh		;803d  '_'
	defb 0ffh		;803e
	defb 000h		;803f
	defb 01dh		;8040
	defb 0fch		;8041
	defb 074h		;8042  't'
	defb 089h		;8043
	defb 021h		;8044  '!'
	defb 00eh		;8045
	defb 0bch		;8046
	defb 087h		;8047
	defb 002h		;8048
	defb 003h		;8049
	defb 012h		;804a
	defb 0fah		;804b
	defb 0d1h		;804c
	defb 087h		;804d
	defb 05eh		;804e  '^'
	defb 0ffh		;804f
	defb 000h		;8050
	defb 020h		;8051  ' '
	defb 0fch		;8052
	defb 074h		;8053  't'
	defb 089h		;8054
; "]^_`"
	defb 05dh		;8055  ']'
	defb 05eh		;8056  '^'
	defb 05fh		;8057  '_'
	defb 060h		;8058  '`' (Spectrum: GBP)
	defb 0ffh		;8059
	defb 002h		;805a
	defb 004h		;805b
	defb 012h		;805c
	defb 0fah		;805d
	defb 0b4h		;805e
	defb 087h		;805f
l8060h:
	defb 000h		;8060
	defb 01ch		;8061
	defb 0fch		;8062
	defb 098h		;8063
	defb 089h		;8064
	defb 021h		;8065  '!'
	defb 012h		;8066
	defb 0bch		;8067
	defb 087h		;8068
	defb 034h		;8069  '4'
	defb 05ch		;806a  '\'
	defb 0ffh		;806b
	defb 002h		;806c
	defb 004h		;806d
	defb 006h		;806e
	defb 0fah		;806f
	defb 0b4h		;8070
	defb 087h		;8071
	defb 002h		;8072
	defb 004h		;8073
	defb 003h		;8074
	defb 0fah		;8075
	defb 094h		;8076
	defb 089h		;8077
	defb 002h		;8078
	defb 01dh		;8079
	defb 003h		;807a
	defb 0fch		;807b
	defb 097h		;807c
	defb 089h		;807d
	defb 021h		;807e  '!'
	defb 003h		;807f
	defb 099h		;8080
	defb 089h		;8081
	defb 0ffh		;8082
	defb 002h		;8083
	defb 005h		;8084
	defb 006h		;8085
	defb 0fah		;8086
	defb 0b4h		;8087
	defb 087h		;8088
	defb 002h		;8089
	defb 005h		;808a
	defb 009h		;808b
	defb 008h		;808c
	defb 074h		;808d  't'
	defb 088h		;808e
	defb 002h		;808f
	defb 005h		;8090
	defb 003h		;8091
	defb 0fah		;8092
	defb 094h		;8093
	defb 089h		;8094
	defb 000h		;8095
	defb 01ch		;8096
	defb 0fch		;8097
	defb 098h		;8098
	defb 089h		;8099
	defb 033h		;809a  '3'
	defb 034h		;809b  '4'
	defb 06bh		;809c  'k'
	defb 0ffh		;809d
	defb 021h		;809e  '!'
	defb 010h		;809f
	defb 0cdh		;80a0
	defb 087h		;80a1
	defb 000h		;80a2
	defb 040h		;80a3  '@'
	defb 0fch		;80a4
	defb 0b4h		;80a5
	defb 089h		;80a6
; "&UVb"
	defb 026h		;80a7  '&'
	defb 055h		;80a8  'U'
	defb 056h		;80a9  'V'
	defb 062h		;80aa  'b'
	defb 0ffh		;80ab
	defb 009h		;80ac
	defb 010h		;80ad
	defb 010h		;80ae
	defb 010h		;80af
	defb 016h		;80b0
	defb 010h		;80b1
	defb 010h		;80b2
	defb 010h		;80b3
	defb 010h		;80b4
	defb 015h		;80b5
	defb 015h		;80b6
	defb 015h		;80b7
	defb 015h		;80b8
	defb 013h		;80b9
	defb 001h		;80ba
	defb 009h		;80bb
	defb 008h		;80bc
	defb 093h		;80bd
	defb 088h		;80be
	defb 031h		;80bf  '1'
	defb 067h		;80c0  'g'
	defb 0ffh		;80c1
	defb 009h		;80c2
	defb 010h		;80c3
	defb 010h		;80c4
	defb 010h		;80c5
	defb 010h		;80c6
	defb 010h		;80c7
	defb 010h		;80c8
	defb 010h		;80c9
	defb 010h		;80ca
	defb 015h		;80cb
	defb 015h		;80cc
	defb 015h		;80cd
	defb 015h		;80ce
	defb 013h		;80cf
	defb 0ffh		;80d0
	defb 009h		;80d1
	defb 010h		;80d2
	defb 010h		;80d3
	defb 010h		;80d4
	defb 010h		;80d5
	defb 010h		;80d6
	defb 010h		;80d7
	defb 010h		;80d8
	defb 010h		;80d9
	defb 015h		;80da
	defb 015h		;80db
	defb 015h		;80dc
	defb 015h		;80dd
	defb 013h		;80de
l80dfh:
	defb 001h		;80df
	defb 00ch		;80e0
	defb 0c8h		;80e1
	defb 01ch		;80e2
	defb 088h		;80e3
	defb 0ffh		;80e4
	defb 009h		;80e5
	defb 010h		;80e6
	defb 010h		;80e7
	defb 010h		;80e8
	defb 010h		;80e9
	defb 010h		;80ea
	defb 010h		;80eb
	defb 010h		;80ec
	defb 010h		;80ed
	defb 010h		;80ee
	defb 010h		;80ef
	defb 010h		;80f0
	defb 018h		;80f1
	defb 013h		;80f2
	defb 0ffh		;80f3
	defb 009h		;80f4
	defb 010h		;80f5
	defb 010h		;80f6
	defb 010h		;80f7
	defb 017h		;80f8
	defb 010h		;80f9
	defb 010h		;80fa
	defb 010h		;80fb
	defb 017h		;80fc
	defb 010h		;80fd
	defb 010h		;80fe
	defb 010h		;80ff
	defb 017h		;8100
	defb 013h		;8101
	defb 0ffh		;8102
	defb 009h		;8103
	defb 012h		;8104
	defb 010h		;8105
	defb 010h		;8106
	defb 010h		;8107
	defb 013h		;8108
	defb 010h		;8109
	defb 010h		;810a
	defb 010h		;810b
	defb 014h		;810c
	defb 010h		;810d
	defb 010h		;810e
	defb 010h		;810f
	defb 013h		;8110
	defb 000h		;8111
	defb 01dh		;8112
	defb 0feh		;8113
	defb 097h		;8114
	defb 089h		;8115
	defb 000h		;8116
	defb 060h		;8117  '`' (Spectrum: GBP)
	defb 0fah		;8118
	defb 094h		;8119
	defb 089h		;811a
	defb 000h		;811b
	defb 00eh		;811c
	defb 0f2h		;811d
	defb 09dh		;811e
	defb 089h		;811f
	defb 000h		;8120
	defb 00ah		;8121
	defb 008h		;8122
	defb 0dfh		;8123
	defb 089h		;8124
	defb 000h		;8125
	defb 00ah		;8126
	defb 008h		;8127
	defb 0bfh		;8128
	defb 089h		;8129
	defb 00eh		;812a
	defb 003h		;812b
	defb 0a3h		;812c
	defb 089h		;812d
	defb 0ffh		;812e
	defb 009h		;812f
	defb 00fh		;8130
	defb 00fh		;8131
	defb 00fh		;8132
	defb 00fh		;8133
	defb 000h		;8134
	defb 000h		;8135
	defb 000h		;8136
	defb 000h		;8137
	defb 001h		;8138
	defb 001h		;8139
	defb 001h		;813a
	defb 001h		;813b
	defb 02dh		;813c  '-'
	defb 0ffh		;813d
	defb 009h		;813e
	defb 00fh		;813f
	defb 00fh		;8140
	defb 00fh		;8141
	defb 00fh		;8142
	defb 000h		;8143
	defb 000h		;8144
	defb 000h		;8145
	defb 000h		;8146
	defb 001h		;8147
	defb 001h		;8148
	defb 001h		;8149
	defb 001h		;814a
	defb 0ffh		;814b
	defb 000h		;814c
	defb 020h		;814d  ' '
	defb 0fch		;814e
	defb 054h		;814f  'T'
	defb 089h		;8150
; ":=de"
	defb 03ah		;8151  ':'
	defb 03dh		;8152  '='
	defb 064h		;8153  'd'
	defb 065h		;8154  'e'
	defb 0ffh		;8155
	defb 068h		;8156  'h'
	defb 000h		;8157
	defb 025h		;8158  '%'
	defb 0fch		;8159
	defb 0cfh		;815a
	defb 089h		;815b
	defb 002h		;815c
	defb 019h		;815d
	defb 012h		;815e
	defb 001h		;815f
	defb 0b4h		;8160
	defb 087h		;8161
	defb 002h		;8162
	defb 002h		;8163
	defb 012h		;8164
	defb 0fah		;8165
	defb 0cdh		;8166
	defb 087h		;8167
	defb 0ffh		;8168
	defb 003h		;8169
	defb 001h		;816a
	defb 001h		;816b
	defb 00ch		;816c
	defb 002h		;816d
	defb 0c1h		;816e
	defb 087h		;816f
	defb 001h		;8170
	defb 00ch		;8171
	defb 002h		;8172
	defb 0c3h		;8173
	defb 087h		;8174
	defb 001h		;8175
	defb 004h		;8176
	defb 002h		;8177
	defb 0c2h		;8178
	defb 088h		;8179
	defb 000h		;817a
	defb 011h		;817b
	defb 0f2h		;817c
	defb 03eh		;817d  '>'
	defb 089h		;817e
	defb 000h		;817f
	defb 005h		;8180
	defb 007h		;8181
	defb 04fh		;8182  'O'
	defb 089h		;8183
l8184h:
	defb 001h		;8184
	defb 005h		;8185
	defb 002h		;8186
	defb 060h		;8187  '`' (Spectrum: GBP)
	defb 089h		;8188
	defb 001h		;8189
	defb 005h		;818a
	defb 002h		;818b
	defb 06bh		;818c  'k'
	defb 089h		;818d
	defb 008h		;818e
	defb 006h		;818f
	defb 045h		;8190  'E'
	defb 089h		;8191
	defb 0ffh		;8192
	defb 000h		;8193
	defb 000h		;8194
	defb 000h		;8195
	defb 000h		;8196
	defb 000h		;8197
	defb 000h		;8198
	defb 000h		;8199
	defb 064h		;819a  'd'
	defb 065h		;819b  'e'
	defb 013h		;819c
	defb 000h		;819d
	defb 000h		;819e
	defb 000h		;819f
	defb 000h		;81a0
	defb 088h		;81a1
	defb 000h		;81a2
	defb 000h		;81a3
	defb 064h		;81a4  'd'
	defb 013h		;81a5
	defb 000h		;81a6
l81a7h:
	defb 0efh		;81a7
	defb 008h		;81a8
	defb 008h		;81a9
	defb 0efh		;81aa
	defb 010h		;81ab
	defb 004h		;81ac
	defb 0f7h		;81ad
	defb 010h		;81ae
	defb 002h		;81af
	defb 0efh		;81b0
	defb 004h		;81b1
	defb 001h		;81b2
	defb 0efh		;81b3
	defb 001h		;81b4
	defb 010h		;81b5
	defb 000h		;81b6
	defb 000h		;81b7
	defb 000h		;81b8
	defb 000h		;81b9
	defb 0f6h		;81ba
	defb 079h		;81bb  'y'
	defb 012h		;81bc
	defb 000h		;81bd
	defb 07fh		;81be
	defb 065h		;81bf  'e'
	defb 008h		;81c0
	defb 087h		;81c1
	defb 000h		;81c2
	defb 08bh		;81c3
	defb 08ch		;81c4
	defb 012h		;81c5
	defb 000h		;81c6
l81c7h:
	defb 0fdh		;81c7
	defb 001h		;81c8
	defb 008h		;81c9
	defb 0feh		;81ca
	defb 002h		;81cb
	defb 004h		;81cc
	defb 07fh		;81cd
	defb 008h		;81ce
	defb 002h		;81cf
	defb 07fh		;81d0
	defb 004h		;81d1
	defb 001h		;81d2
	defb 07fh		;81d3
	defb 001h		;81d4
	defb 010h		;81d5
	defb 000h		;81d6
	defb 000h		;81d7
	defb 000h		;81d8
	defb 000h		;81d9
	defb 0f6h		;81da
; "xz}~"
	defb 078h		;81db  'x'
	defb 07ah		;81dc  'z'
	defb 07dh		;81dd  '}'
	defb 07eh		;81de  '~'
	defb 081h		;81df
	defb 082h		;81e0
	defb 086h		;81e1
	defb 089h		;81e2
	defb 08ah		;81e3
	defb 08dh		;81e4
	defb 011h		;81e5
	defb 000h		;81e6
	defb 000h		;81e7
sub_81e8h:
	defb 03ch		;81e8  '<'
	defb 0c8h		;81e9
	defb 0d6h		;81ea
	defb 006h		;81eb
	defb 0c8h		;81ec
	defb 03dh		;81ed  '='
	defb 0c8h		;81ee
	defb 006h		;81ef
	defb 024h		;81f0  '$'
	defb 0cdh		;81f1
	defb 00ch		;81f2
	defb 0d3h		;81f3
	defb 0c9h		;81f4
l81f5h:
	defb 000h		;81f5
	defb 000h		;81f6
	defb 000h		;81f7
	defb 000h		;81f8
	defb 000h		;81f9
	defb 0f6h		;81fa
	defb 077h		;81fb  'w'
	defb 07bh		;81fc  '{'
	defb 07ch		;81fd  '|'
	defb 080h		;81fe
	defb 083h		;81ff
	defb 084h		;8200
	defb 085h		;8201
	defb 093h		;8202
	defb 090h		;8203
	defb 08eh		;8204
	defb 010h		;8205
	defb 007h		;8206
	defb 007h		;8207
	defb 007h		;8208
	defb 007h		;8209
	defb 007h		;820a
	defb 006h		;820b
