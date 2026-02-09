; ======================================================================
; data_antipiracy.asm
; ======================================================================
;
; Anti-Piracy Message & Durell Address
;
; Address range: 6C0Ch - 6F0Bh (768 bytes)
; Source binary: block7_main.bin (loaded at 620Ch)
;
; Software piracy warning from Durell Software.
; Contains the full anti-piracy notice and company address.
; Followed by zero padding.
;
; ======================================================================

b1_end:

; BLOCK 'b2' (start 0x6c0c end 0x6f0c)
b2_start:
; "nuinereplacement copy and a reward of`100  if your information  "
; "leads    to a successful prosecution.                           "
; ... (165 chars total)
	defb 06eh		;6c0c  'n'
	defb 075h		;6c0d  'u'
	defb 069h		;6c0e  'i'
	defb 06eh		;6c0f  'n'
	defb 065h		;6c10  'e'
	defb 072h		;6c11  'r'
	defb 065h		;6c12  'e'
	defb 070h		;6c13  'p'
	defb 06ch		;6c14  'l'
	defb 061h		;6c15  'a'
	defb 063h		;6c16  'c'
	defb 065h		;6c17  'e'
	defb 06dh		;6c18  'm'
	defb 065h		;6c19  'e'
	defb 06eh		;6c1a  'n'
	defb 074h		;6c1b  't'
	defb 020h		;6c1c  ' '
	defb 063h		;6c1d  'c'
	defb 06fh		;6c1e  'o'
	defb 070h		;6c1f  'p'
	defb 079h		;6c20  'y'
	defb 020h		;6c21  ' '
	defb 061h		;6c22  'a'
	defb 06eh		;6c23  'n'
	defb 064h		;6c24  'd'
	defb 020h		;6c25  ' '
	defb 061h		;6c26  'a'
	defb 020h		;6c27  ' '
	defb 072h		;6c28  'r'
	defb 065h		;6c29  'e'
	defb 077h		;6c2a  'w'
	defb 061h		;6c2b  'a'
	defb 072h		;6c2c  'r'
	defb 064h		;6c2d  'd'
	defb 020h		;6c2e  ' '
	defb 06fh		;6c2f  'o'
	defb 066h		;6c30  'f'
	defb 060h		;6c31  '`' (Spectrum: £)
	defb 031h		;6c32  '1'
	defb 030h		;6c33  '0'
	defb 030h		;6c34  '0'
	defb 020h		;6c35  ' '
	defb 020h		;6c36  ' '
	defb 069h		;6c37  'i'
	defb 066h		;6c38  'f'
	defb 020h		;6c39  ' '
	defb 079h		;6c3a  'y'
	defb 06fh		;6c3b  'o'
	defb 075h		;6c3c  'u'
	defb 072h		;6c3d  'r'
	defb 020h		;6c3e  ' '
	defb 069h		;6c3f  'i'
	defb 06eh		;6c40  'n'
	defb 066h		;6c41  'f'
	defb 06fh		;6c42  'o'
	defb 072h		;6c43  'r'
	defb 06dh		;6c44  'm'
	defb 061h		;6c45  'a'
	defb 074h		;6c46  't'
	defb 069h		;6c47  'i'
	defb 06fh		;6c48  'o'
	defb 06eh		;6c49  'n'
	defb 020h		;6c4a  ' '
	defb 020h		;6c4b  ' '
	defb 06ch		;6c4c  'l'
	defb 065h		;6c4d  'e'
	defb 061h		;6c4e  'a'
	defb 064h		;6c4f  'd'
	defb 073h		;6c50  's'
	defb 020h		;6c51  ' '
	defb 020h		;6c52  ' '
	defb 020h		;6c53  ' '
	defb 020h		;6c54  ' '
	defb 074h		;6c55  't'
	defb 06fh		;6c56  'o'
	defb 020h		;6c57  ' '
	defb 061h		;6c58  'a'
	defb 020h		;6c59  ' '
	defb 073h		;6c5a  's'
	defb 075h		;6c5b  'u'
	defb 063h		;6c5c  'c'
	defb 063h		;6c5d  'c'
	defb 065h		;6c5e  'e'
	defb 073h		;6c5f  's'
	defb 073h		;6c60  's'
	defb 066h		;6c61  'f'
	defb 075h		;6c62  'u'
	defb 06ch		;6c63  'l'
	defb 020h		;6c64  ' '
	defb 070h		;6c65  'p'
	defb 072h		;6c66  'r'
	defb 06fh		;6c67  'o'
	defb 073h		;6c68  's'
	defb 065h		;6c69  'e'
	defb 063h		;6c6a  'c'
	defb 075h		;6c6b  'u'
	defb 074h		;6c6c  't'
	defb 069h		;6c6d  'i'
	defb 06fh		;6c6e  'o'
	defb 06eh		;6c6f  'n'
	defb 02eh		;6c70  '.'
	defb 020h		;6c71  ' '
	defb 020h		;6c72  ' '
	defb 020h		;6c73  ' '
	defb 020h		;6c74  ' '
	defb 020h		;6c75  ' '
	defb 020h		;6c76  ' '
	defb 020h		;6c77  ' '
	defb 020h		;6c78  ' '
	defb 020h		;6c79  ' '
	defb 020h		;6c7a  ' '
	defb 020h		;6c7b  ' '
	defb 020h		;6c7c  ' '
	defb 020h		;6c7d  ' '
	defb 020h		;6c7e  ' '
	defb 020h		;6c7f  ' '
	defb 020h		;6c80  ' '
	defb 020h		;6c81  ' '
	defb 020h		;6c82  ' '
	defb 020h		;6c83  ' '
	defb 020h		;6c84  ' '
	defb 020h		;6c85  ' '
	defb 020h		;6c86  ' '
	defb 020h		;6c87  ' '
	defb 020h		;6c88  ' '
	defb 020h		;6c89  ' '
	defb 020h		;6c8a  ' '
	defb 020h		;6c8b  ' '
	defb 020h		;6c8c  ' '
	defb 020h		;6c8d  ' '
	defb 020h		;6c8e  ' '
	defb 020h		;6c8f  ' '
	defb 020h		;6c90  ' '
	defb 020h		;6c91  ' '
	defb 020h		;6c92  ' '
	defb 020h		;6c93  ' '
	defb 050h		;6c94  'P'
	defb 052h		;6c95  'R'
	defb 045h		;6c96  'E'
	defb 053h		;6c97  'S'
	defb 053h		;6c98  'S'
	defb 020h		;6c99  ' '
	defb 041h		;6c9a  'A'
	defb 04eh		;6c9b  'N'
	defb 059h		;6c9c  'Y'
	defb 020h		;6c9d  ' '
	defb 04bh		;6c9e  'K'
	defb 045h		;6c9f  'E'
	defb 059h		;6ca0  'Y'
	defb 020h		;6ca1  ' '
	defb 054h		;6ca2  'T'
	defb 04fh		;6ca3  'O'
	defb 020h		;6ca4  ' '
	defb 043h		;6ca5  'C'
	defb 04fh		;6ca6  'O'
	defb 04eh		;6ca7  'N'
	defb 054h		;6ca8  'T'
	defb 049h		;6ca9  'I'
	defb 04eh		;6caa  'N'
	defb 055h		;6cab  'U'
	defb 045h		;6cac  'E'
	defb 020h		;6cad  ' '
	defb 020h		;6cae  ' '
	defb 020h		;6caf  ' '
	defb 020h		;6cb0  ' '
; --- 155 zero bytes ---
	defb 000h		;6cb1
	defb 000h		;6cb2
	defb 000h		;6cb3
	defb 000h		;6cb4
	defb 000h		;6cb5
	defb 000h		;6cb6
	defb 000h		;6cb7
	defb 000h		;6cb8
	defb 000h		;6cb9
	defb 000h		;6cba
	defb 000h		;6cbb
	defb 000h		;6cbc
	defb 000h		;6cbd
	defb 000h		;6cbe
	defb 000h		;6cbf
	defb 000h		;6cc0
	defb 000h		;6cc1
	defb 000h		;6cc2
	defb 000h		;6cc3
	defb 000h		;6cc4
	defb 000h		;6cc5
	defb 000h		;6cc6
	defb 000h		;6cc7
	defb 000h		;6cc8
	defb 000h		;6cc9
	defb 000h		;6cca
	defb 000h		;6ccb
	defb 000h		;6ccc
	defb 000h		;6ccd
	defb 000h		;6cce
	defb 000h		;6ccf
	defb 000h		;6cd0
	defb 000h		;6cd1
	defb 000h		;6cd2
	defb 000h		;6cd3
	defb 000h		;6cd4
	defb 000h		;6cd5
	defb 000h		;6cd6
	defb 000h		;6cd7
	defb 000h		;6cd8
	defb 000h		;6cd9
	defb 000h		;6cda
	defb 000h		;6cdb
	defb 000h		;6cdc
	defb 000h		;6cdd
	defb 000h		;6cde
	defb 000h		;6cdf
	defb 000h		;6ce0
	defb 000h		;6ce1
	defb 000h		;6ce2
	defb 000h		;6ce3
	defb 000h		;6ce4
	defb 000h		;6ce5
	defb 000h		;6ce6
	defb 000h		;6ce7
	defb 000h		;6ce8
	defb 000h		;6ce9
	defb 000h		;6cea
	defb 000h		;6ceb
	defb 000h		;6cec
	defb 000h		;6ced
	defb 000h		;6cee
	defb 000h		;6cef
	defb 000h		;6cf0
	defb 000h		;6cf1
	defb 000h		;6cf2
	defb 000h		;6cf3
	defb 000h		;6cf4
	defb 000h		;6cf5
	defb 000h		;6cf6
	defb 000h		;6cf7
	defb 000h		;6cf8
	defb 000h		;6cf9
	defb 000h		;6cfa
	defb 000h		;6cfb
	defb 000h		;6cfc
	defb 000h		;6cfd
	defb 000h		;6cfe
	defb 000h		;6cff
	defb 000h		;6d00
	defb 000h		;6d01
	defb 000h		;6d02
	defb 000h		;6d03
	defb 000h		;6d04
	defb 000h		;6d05
	defb 000h		;6d06
	defb 000h		;6d07
	defb 000h		;6d08
	defb 000h		;6d09
	defb 000h		;6d0a
	defb 000h		;6d0b
	defb 000h		;6d0c
	defb 000h		;6d0d
	defb 000h		;6d0e
	defb 000h		;6d0f
	defb 000h		;6d10
	defb 000h		;6d11
	defb 000h		;6d12
	defb 000h		;6d13
	defb 000h		;6d14
	defb 000h		;6d15
	defb 000h		;6d16
	defb 000h		;6d17
	defb 000h		;6d18
	defb 000h		;6d19
	defb 000h		;6d1a
	defb 000h		;6d1b
	defb 000h		;6d1c
	defb 000h		;6d1d
	defb 000h		;6d1e
	defb 000h		;6d1f
	defb 000h		;6d20
	defb 000h		;6d21
	defb 000h		;6d22
	defb 000h		;6d23
	defb 000h		;6d24
	defb 000h		;6d25
	defb 000h		;6d26
	defb 000h		;6d27
	defb 000h		;6d28
	defb 000h		;6d29
	defb 000h		;6d2a
	defb 000h		;6d2b
	defb 000h		;6d2c
	defb 000h		;6d2d
	defb 000h		;6d2e
	defb 000h		;6d2f
	defb 000h		;6d30
	defb 000h		;6d31
	defb 000h		;6d32
	defb 000h		;6d33
	defb 000h		;6d34
	defb 000h		;6d35
	defb 000h		;6d36
	defb 000h		;6d37
	defb 000h		;6d38
	defb 000h		;6d39
	defb 000h		;6d3a
	defb 000h		;6d3b
	defb 000h		;6d3c
	defb 000h		;6d3d
	defb 000h		;6d3e
	defb 000h		;6d3f
	defb 000h		;6d40
	defb 000h		;6d41
	defb 000h		;6d42
	defb 000h		;6d43
	defb 000h		;6d44
	defb 000h		;6d45
	defb 000h		;6d46
	defb 000h		;6d47
	defb 000h		;6d48
	defb 000h		;6d49
	defb 000h		;6d4a
	defb 000h		;6d4b
l6d4ch:
; --- 29 zero bytes ---
	defb 000h		;6d4c
	defb 000h		;6d4d
	defb 000h		;6d4e
	defb 000h		;6d4f
	defb 000h		;6d50
	defb 000h		;6d51
	defb 000h		;6d52
	defb 000h		;6d53
	defb 000h		;6d54
	defb 000h		;6d55
	defb 000h		;6d56
	defb 000h		;6d57
	defb 000h		;6d58
	defb 000h		;6d59
	defb 000h		;6d5a
	defb 000h		;6d5b
	defb 000h		;6d5c
	defb 000h		;6d5d
	defb 000h		;6d5e
	defb 000h		;6d5f
	defb 000h		;6d60
	defb 000h		;6d61
	defb 000h		;6d62
	defb 000h		;6d63
	defb 000h		;6d64
	defb 000h		;6d65
	defb 000h		;6d66
	defb 000h		;6d67
	defb 000h		;6d68
l6d69h:
; --- 419 zero bytes ---
	defb 000h		;6d69
	defb 000h		;6d6a
	defb 000h		;6d6b
	defb 000h		;6d6c
	defb 000h		;6d6d
	defb 000h		;6d6e
	defb 000h		;6d6f
	defb 000h		;6d70
	defb 000h		;6d71
	defb 000h		;6d72
	defb 000h		;6d73
	defb 000h		;6d74
	defb 000h		;6d75
	defb 000h		;6d76
	defb 000h		;6d77
	defb 000h		;6d78
	defb 000h		;6d79
	defb 000h		;6d7a
	defb 000h		;6d7b
	defb 000h		;6d7c
	defb 000h		;6d7d
	defb 000h		;6d7e
	defb 000h		;6d7f
	defb 000h		;6d80
	defb 000h		;6d81
	defb 000h		;6d82
	defb 000h		;6d83
	defb 000h		;6d84
	defb 000h		;6d85
	defb 000h		;6d86
	defb 000h		;6d87
	defb 000h		;6d88
	defb 000h		;6d89
	defb 000h		;6d8a
	defb 000h		;6d8b
	defb 000h		;6d8c
	defb 000h		;6d8d
	defb 000h		;6d8e
	defb 000h		;6d8f
	defb 000h		;6d90
	defb 000h		;6d91
	defb 000h		;6d92
	defb 000h		;6d93
	defb 000h		;6d94
	defb 000h		;6d95
	defb 000h		;6d96
	defb 000h		;6d97
	defb 000h		;6d98
	defb 000h		;6d99
	defb 000h		;6d9a
	defb 000h		;6d9b
	defb 000h		;6d9c
	defb 000h		;6d9d
	defb 000h		;6d9e
	defb 000h		;6d9f
	defb 000h		;6da0
	defb 000h		;6da1
	defb 000h		;6da2
	defb 000h		;6da3
	defb 000h		;6da4
	defb 000h		;6da5
	defb 000h		;6da6
	defb 000h		;6da7
	defb 000h		;6da8
	defb 000h		;6da9
	defb 000h		;6daa
	defb 000h		;6dab
	defb 000h		;6dac
	defb 000h		;6dad
	defb 000h		;6dae
	defb 000h		;6daf
	defb 000h		;6db0
	defb 000h		;6db1
	defb 000h		;6db2
	defb 000h		;6db3
	defb 000h		;6db4
	defb 000h		;6db5
	defb 000h		;6db6
	defb 000h		;6db7
	defb 000h		;6db8
	defb 000h		;6db9
	defb 000h		;6dba
	defb 000h		;6dbb
	defb 000h		;6dbc
	defb 000h		;6dbd
	defb 000h		;6dbe
	defb 000h		;6dbf
	defb 000h		;6dc0
	defb 000h		;6dc1
	defb 000h		;6dc2
	defb 000h		;6dc3
	defb 000h		;6dc4
	defb 000h		;6dc5
	defb 000h		;6dc6
	defb 000h		;6dc7
	defb 000h		;6dc8
	defb 000h		;6dc9
	defb 000h		;6dca
	defb 000h		;6dcb
	defb 000h		;6dcc
	defb 000h		;6dcd
	defb 000h		;6dce
	defb 000h		;6dcf
	defb 000h		;6dd0
	defb 000h		;6dd1
	defb 000h		;6dd2
	defb 000h		;6dd3
	defb 000h		;6dd4
	defb 000h		;6dd5
	defb 000h		;6dd6
	defb 000h		;6dd7
	defb 000h		;6dd8
	defb 000h		;6dd9
	defb 000h		;6dda
	defb 000h		;6ddb
	defb 000h		;6ddc
	defb 000h		;6ddd
	defb 000h		;6dde
	defb 000h		;6ddf
	defb 000h		;6de0
	defb 000h		;6de1
	defb 000h		;6de2
	defb 000h		;6de3
	defb 000h		;6de4
	defb 000h		;6de5
	defb 000h		;6de6
	defb 000h		;6de7
	defb 000h		;6de8
	defb 000h		;6de9
	defb 000h		;6dea
	defb 000h		;6deb
	defb 000h		;6dec
	defb 000h		;6ded
	defb 000h		;6dee
	defb 000h		;6def
	defb 000h		;6df0
	defb 000h		;6df1
	defb 000h		;6df2
	defb 000h		;6df3
	defb 000h		;6df4
	defb 000h		;6df5
	defb 000h		;6df6
	defb 000h		;6df7
	defb 000h		;6df8
	defb 000h		;6df9
	defb 000h		;6dfa
	defb 000h		;6dfb
	defb 000h		;6dfc
	defb 000h		;6dfd
	defb 000h		;6dfe
	defb 000h		;6dff
	defb 000h		;6e00
	defb 000h		;6e01
	defb 000h		;6e02
	defb 000h		;6e03
	defb 000h		;6e04
	defb 000h		;6e05
	defb 000h		;6e06
	defb 000h		;6e07
	defb 000h		;6e08
	defb 000h		;6e09
	defb 000h		;6e0a
	defb 000h		;6e0b
	defb 000h		;6e0c
	defb 000h		;6e0d
	defb 000h		;6e0e
	defb 000h		;6e0f
	defb 000h		;6e10
	defb 000h		;6e11
	defb 000h		;6e12
	defb 000h		;6e13
	defb 000h		;6e14
	defb 000h		;6e15
	defb 000h		;6e16
	defb 000h		;6e17
	defb 000h		;6e18
	defb 000h		;6e19
	defb 000h		;6e1a
	defb 000h		;6e1b
	defb 000h		;6e1c
	defb 000h		;6e1d
	defb 000h		;6e1e
	defb 000h		;6e1f
	defb 000h		;6e20
	defb 000h		;6e21
	defb 000h		;6e22
	defb 000h		;6e23
	defb 000h		;6e24
	defb 000h		;6e25
	defb 000h		;6e26
	defb 000h		;6e27
	defb 000h		;6e28
	defb 000h		;6e29
	defb 000h		;6e2a
	defb 000h		;6e2b
	defb 000h		;6e2c
	defb 000h		;6e2d
	defb 000h		;6e2e
	defb 000h		;6e2f
	defb 000h		;6e30
	defb 000h		;6e31
	defb 000h		;6e32
	defb 000h		;6e33
	defb 000h		;6e34
	defb 000h		;6e35
	defb 000h		;6e36
	defb 000h		;6e37
	defb 000h		;6e38
	defb 000h		;6e39
	defb 000h		;6e3a
	defb 000h		;6e3b
	defb 000h		;6e3c
	defb 000h		;6e3d
	defb 000h		;6e3e
	defb 000h		;6e3f
	defb 000h		;6e40
	defb 000h		;6e41
	defb 000h		;6e42
	defb 000h		;6e43
	defb 000h		;6e44
	defb 000h		;6e45
	defb 000h		;6e46
	defb 000h		;6e47
	defb 000h		;6e48
	defb 000h		;6e49
	defb 000h		;6e4a
	defb 000h		;6e4b
	defb 000h		;6e4c
	defb 000h		;6e4d
	defb 000h		;6e4e
	defb 000h		;6e4f
	defb 000h		;6e50
	defb 000h		;6e51
	defb 000h		;6e52
	defb 000h		;6e53
	defb 000h		;6e54
	defb 000h		;6e55
	defb 000h		;6e56
	defb 000h		;6e57
	defb 000h		;6e58
	defb 000h		;6e59
	defb 000h		;6e5a
	defb 000h		;6e5b
	defb 000h		;6e5c
	defb 000h		;6e5d
	defb 000h		;6e5e
	defb 000h		;6e5f
	defb 000h		;6e60
	defb 000h		;6e61
	defb 000h		;6e62
	defb 000h		;6e63
	defb 000h		;6e64
	defb 000h		;6e65
	defb 000h		;6e66
	defb 000h		;6e67
	defb 000h		;6e68
	defb 000h		;6e69
	defb 000h		;6e6a
	defb 000h		;6e6b
	defb 000h		;6e6c
	defb 000h		;6e6d
	defb 000h		;6e6e
	defb 000h		;6e6f
	defb 000h		;6e70
	defb 000h		;6e71
	defb 000h		;6e72
	defb 000h		;6e73
	defb 000h		;6e74
	defb 000h		;6e75
	defb 000h		;6e76
	defb 000h		;6e77
	defb 000h		;6e78
	defb 000h		;6e79
	defb 000h		;6e7a
	defb 000h		;6e7b
	defb 000h		;6e7c
	defb 000h		;6e7d
	defb 000h		;6e7e
	defb 000h		;6e7f
	defb 000h		;6e80
	defb 000h		;6e81
	defb 000h		;6e82
	defb 000h		;6e83
	defb 000h		;6e84
	defb 000h		;6e85
	defb 000h		;6e86
	defb 000h		;6e87
	defb 000h		;6e88
	defb 000h		;6e89
	defb 000h		;6e8a
	defb 000h		;6e8b
	defb 000h		;6e8c
	defb 000h		;6e8d
	defb 000h		;6e8e
	defb 000h		;6e8f
	defb 000h		;6e90
	defb 000h		;6e91
	defb 000h		;6e92
	defb 000h		;6e93
	defb 000h		;6e94
	defb 000h		;6e95
	defb 000h		;6e96
	defb 000h		;6e97
	defb 000h		;6e98
	defb 000h		;6e99
	defb 000h		;6e9a
	defb 000h		;6e9b
	defb 000h		;6e9c
	defb 000h		;6e9d
	defb 000h		;6e9e
	defb 000h		;6e9f
	defb 000h		;6ea0
	defb 000h		;6ea1
	defb 000h		;6ea2
	defb 000h		;6ea3
	defb 000h		;6ea4
	defb 000h		;6ea5
	defb 000h		;6ea6
	defb 000h		;6ea7
	defb 000h		;6ea8
	defb 000h		;6ea9
	defb 000h		;6eaa
	defb 000h		;6eab
	defb 000h		;6eac
	defb 000h		;6ead
	defb 000h		;6eae
	defb 000h		;6eaf
	defb 000h		;6eb0
	defb 000h		;6eb1
	defb 000h		;6eb2
	defb 000h		;6eb3
	defb 000h		;6eb4
	defb 000h		;6eb5
	defb 000h		;6eb6
	defb 000h		;6eb7
	defb 000h		;6eb8
	defb 000h		;6eb9
	defb 000h		;6eba
	defb 000h		;6ebb
	defb 000h		;6ebc
	defb 000h		;6ebd
	defb 000h		;6ebe
	defb 000h		;6ebf
	defb 000h		;6ec0
	defb 000h		;6ec1
	defb 000h		;6ec2
	defb 000h		;6ec3
	defb 000h		;6ec4
	defb 000h		;6ec5
	defb 000h		;6ec6
	defb 000h		;6ec7
	defb 000h		;6ec8
	defb 000h		;6ec9
	defb 000h		;6eca
	defb 000h		;6ecb
	defb 000h		;6ecc
	defb 000h		;6ecd
	defb 000h		;6ece
	defb 000h		;6ecf
	defb 000h		;6ed0
	defb 000h		;6ed1
	defb 000h		;6ed2
	defb 000h		;6ed3
	defb 000h		;6ed4
	defb 000h		;6ed5
	defb 000h		;6ed6
	defb 000h		;6ed7
	defb 000h		;6ed8
	defb 000h		;6ed9
	defb 000h		;6eda
	defb 000h		;6edb
	defb 000h		;6edc
	defb 000h		;6edd
	defb 000h		;6ede
	defb 000h		;6edf
	defb 000h		;6ee0
	defb 000h		;6ee1
	defb 000h		;6ee2
	defb 000h		;6ee3
	defb 000h		;6ee4
	defb 000h		;6ee5
	defb 000h		;6ee6
	defb 000h		;6ee7
	defb 000h		;6ee8
	defb 000h		;6ee9
	defb 000h		;6eea
	defb 000h		;6eeb
	defb 000h		;6eec
	defb 000h		;6eed
	defb 000h		;6eee
	defb 000h		;6eef
	defb 000h		;6ef0
	defb 000h		;6ef1
	defb 000h		;6ef2
	defb 000h		;6ef3
	defb 000h		;6ef4
	defb 000h		;6ef5
	defb 000h		;6ef6
	defb 000h		;6ef7
	defb 000h		;6ef8
	defb 000h		;6ef9
	defb 000h		;6efa
	defb 000h		;6efb
	defb 000h		;6efc
	defb 000h		;6efd
	defb 000h		;6efe
	defb 000h		;6eff
	defb 000h		;6f00
	defb 000h		;6f01
	defb 000h		;6f02
	defb 000h		;6f03
	defb 000h		;6f04
	defb 000h		;6f05
	defb 000h		;6f06
	defb 000h		;6f07
	defb 000h		;6f08
	defb 000h		;6f09
	defb 000h		;6f0a
	defb 000h		;6f0b
