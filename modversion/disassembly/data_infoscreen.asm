; ======================================================================
; data_infoscreen.asm
; ======================================================================
;
; Info Screen Text & Layout (NEW)
;
; Address range: $8D5E-$900B (686 bytes)
; Source binary: mod_decompressed.bin (loaded at $620C)
;
; Text and attribute data for the mod's info/credits screen.
; Includes version string, credits, feature description, and
; key binding help (CS+P: pause, CS+S: speed).
;
; ======================================================================

hiscores_end:

info_text_start:
; "Saboteur II 48k thealfest mod v1                         "...
	defb 053h		;8d5e  'S'
	defb 061h		;8d5f  'a'
	defb 062h		;8d60  'b'
	defb 06fh		;8d61  'o'
	defb 074h		;8d62  't'
	defb 065h		;8d63  'e'
	defb 075h		;8d64  'u'
	defb 072h		;8d65  'r'
	defb 020h		;8d66  ' '
	defb 049h		;8d67  'I'
	defb 049h		;8d68  'I'
	defb 020h		;8d69  ' '
	defb 034h		;8d6a  '4'
	defb 038h		;8d6b  '8'
	defb 06bh		;8d6c  'k'
	defb 020h		;8d6d  ' '
	defb 074h		;8d6e  't'
	defb 068h		;8d6f  'h'
	defb 065h		;8d70  'e'
	defb 061h		;8d71  'a'
	defb 06ch		;8d72  'l'
	defb 066h		;8d73  'f'
	defb 065h		;8d74  'e'
	defb 073h		;8d75  's'
	defb 074h		;8d76  't'
	defb 020h		;8d77  ' '
	defb 06dh		;8d78  'm'
	defb 06fh		;8d79  'o'
	defb 064h		;8d7a  'd'
	defb 020h		;8d7b  ' '
	defb 076h		;8d7c  'v'
	defb 031h		;8d7d  '1'
	defb 020h		;8d7e  ' '
	defb 020h		;8d7f  ' '
	defb 020h		;8d80  ' '
	defb 020h		;8d81  ' '
	defb 020h		;8d82  ' '
	defb 020h		;8d83  ' '
	defb 020h		;8d84  ' '
	defb 020h		;8d85  ' '
	defb 020h		;8d86  ' '
	defb 020h		;8d87  ' '
	defb 020h		;8d88  ' '
	defb 020h		;8d89  ' '
	defb 020h		;8d8a  ' '
	defb 020h		;8d8b  ' '
	defb 020h		;8d8c  ' '
	defb 020h		;8d8d  ' '
	defb 020h		;8d8e  ' '
	defb 020h		;8d8f  ' '
	defb 020h		;8d90  ' '
	defb 020h		;8d91  ' '
	defb 020h		;8d92  ' '
	defb 020h		;8d93  ' '
	defb 020h		;8d94  ' '
	defb 020h		;8d95  ' '
	defb 020h		;8d96  ' '
	defb 020h		;8d97  ' '
	defb 020h		;8d98  ' '
	defb 020h		;8d99  ' '
	defb 020h		;8d9a  ' '
	defb 020h		;8d9b  ' '
	defb 020h		;8d9c  ' '
	defb 020h		;8d9d  ' '
	defb 010h		;8d9e
	defb 007h		;8d9f
	defb 011h		;8da0
	defb 001h		;8da1
; "This mod has bugfixes,adjustablespeed,  improved  game  b"...
	defb 054h		;8da2  'T'
	defb 068h		;8da3  'h'
	defb 069h		;8da4  'i'
	defb 073h		;8da5  's'
	defb 020h		;8da6  ' '
	defb 06dh		;8da7  'm'
	defb 06fh		;8da8  'o'
	defb 064h		;8da9  'd'
	defb 020h		;8daa  ' '
	defb 068h		;8dab  'h'
	defb 061h		;8dac  'a'
	defb 073h		;8dad  's'
	defb 020h		;8dae  ' '
	defb 062h		;8daf  'b'
	defb 075h		;8db0  'u'
	defb 067h		;8db1  'g'
	defb 066h		;8db2  'f'
	defb 069h		;8db3  'i'
l8db4h:
	defb 078h		;8db4  'x'
	defb 065h		;8db5  'e'
	defb 073h		;8db6  's'
	defb 02ch		;8db7  ','
	defb 061h		;8db8  'a'
	defb 064h		;8db9  'd'
	defb 06ah		;8dba  'j'
	defb 075h		;8dbb  'u'
	defb 073h		;8dbc  's'
	defb 074h		;8dbd  't'
	defb 061h		;8dbe  'a'
	defb 062h		;8dbf  'b'
	defb 06ch		;8dc0  'l'
	defb 065h		;8dc1  'e'
	defb 073h		;8dc2  's'
	defb 070h		;8dc3  'p'
	defb 065h		;8dc4  'e'
	defb 065h		;8dc5  'e'
	defb 064h		;8dc6  'd'
	defb 02ch		;8dc7  ','
	defb 020h		;8dc8  ' '
	defb 020h		;8dc9  ' '
	defb 069h		;8dca  'i'
	defb 06dh		;8dcb  'm'
	defb 070h		;8dcc  'p'
l8dcdh:
	defb 072h		;8dcd  'r'
	defb 06fh		;8dce  'o'
	defb 076h		;8dcf  'v'
	defb 065h		;8dd0  'e'
	defb 064h		;8dd1  'd'
	defb 020h		;8dd2  ' '
	defb 020h		;8dd3  ' '
	defb 067h		;8dd4  'g'
	defb 061h		;8dd5  'a'
	defb 06dh		;8dd6  'm'
	defb 065h		;8dd7  'e'
	defb 020h		;8dd8  ' '
	defb 020h		;8dd9  ' '
	defb 062h		;8dda  'b'
	defb 061h		;8ddb  'a'
	defb 06ch		;8ddc  'l'
	defb 061h		;8ddd  'a'
	defb 06eh		;8dde  'n'
	defb 063h		;8ddf  'c'
	defb 065h		;8de0  'e'
	defb 02ch		;8de1  ','
	defb 061h		;8de2  'a'
	defb 064h		;8de3  'd'
	defb 064h		;8de4  'd'
	defb 069h		;8de5  'i'
	defb 074h		;8de6  't'
	defb 069h		;8de7  'i'
	defb 06fh		;8de8  'o'
	defb 06eh		;8de9  'n'
	defb 061h		;8dea  'a'
	defb 06ch		;8deb  'l'
	defb 020h		;8dec  ' '
	defb 067h		;8ded  'g'
	defb 072h		;8dee  'r'
	defb 061h		;8def  'a'
	defb 070h		;8df0  'p'
	defb 068h		;8df1  'h'
	defb 069h		;8df2  'i'
	defb 063h		;8df3  'c'
	defb 073h		;8df4  's'
	defb 02ch		;8df5  ','
	defb 073h		;8df6  's'
	defb 06fh		;8df7  'o'
	defb 075h		;8df8  'u'
	defb 06eh		;8df9  'n'
	defb 064h		;8dfa  'd'
	defb 073h		;8dfb  's'
	defb 020h		;8dfc  ' '
	defb 026h		;8dfd  '&'
	defb 06dh		;8dfe  'm'
	defb 06fh		;8dff  'o'
	defb 072h		;8e00  'r'
	defb 065h		;8e01  'e'
	defb 04fh		;8e02  'O'
	defb 072h		;8e03  'r'
	defb 069h		;8e04  'i'
	defb 067h		;8e05  'g'
	defb 069h		;8e06  'i'
	defb 06eh		;8e07  'n'
	defb 061h		;8e08  'a'
	defb 06ch		;8e09  'l'
	defb 020h		;8e0a  ' '
	defb 067h		;8e0b  'g'
	defb 061h		;8e0c  'a'
	defb 06dh		;8e0d  'm'
	defb 065h		;8e0e  'e'
	defb 020h		;8e0f  ' '
	defb 062h		;8e10  'b'
	defb 079h		;8e11  'y'
	defb 020h		;8e12  ' '
	defb 020h		;8e13  ' '
	defb 043h		;8e14  'C'
	defb 06ch		;8e15  'l'
	defb 069h		;8e16  'i'
	defb 076h		;8e17  'v'
	defb 065h		;8e18  'e'
	defb 020h		;8e19  ' '
	defb 054h		;8e1a  'T'
	defb 06fh		;8e1b  'o'
	defb 077h		;8e1c  'w'
	defb 06eh		;8e1d  'n'
	defb 073h		;8e1e  's'
	defb 065h		;8e1f  'e'
	defb 06eh		;8e20  'n'
	defb 064h		;8e21  'd'
	defb 05ah		;8e22  'Z'
	defb 058h		;8e23  'X'
	defb 030h		;8e24  '0'
	defb 020h		;8e25  ' '
	defb 063h		;8e26  'c'
	defb 06fh		;8e27  'o'
	defb 06dh		;8e28  'm'
	defb 070h		;8e29  'p'
	defb 072h		;8e2a  'r'
	defb 065h		;8e2b  'e'
	defb 073h		;8e2c  's'
	defb 073h		;8e2d  's'
	defb 069h		;8e2e  'i'
	defb 06fh		;8e2f  'o'
	defb 06eh		;8e30  'n'
	defb 020h		;8e31  ' '
	defb 062h		;8e32  'b'
	defb 079h		;8e33  'y'
	defb 020h		;8e34  ' '
	defb 020h		;8e35  ' '
	defb 045h		;8e36  'E'
	defb 069h		;8e37  'i'
	defb 06eh		;8e38  'n'
	defb 061h		;8e39  'a'
	defb 072h		;8e3a  'r'
	defb 020h		;8e3b  ' '
	defb 053h		;8e3c  'S'
	defb 061h		;8e3d  'a'
	defb 075h		;8e3e  'u'
	defb 06bh		;8e3f  'k'
	defb 061h		;8e40  'a'
	defb 073h		;8e41  's'
	defb 054h		;8e42  'T'
	defb 068h		;8e43  'h'
	defb 061h		;8e44  'a'
	defb 06eh		;8e45  'n'
	defb 06bh		;8e46  'k'
	defb 073h		;8e47  's'
	defb 020h		;8e48  ' '
	defb 020h		;8e49  ' '
	defb 074h		;8e4a  't'
	defb 06fh		;8e4b  'o'
	defb 020h		;8e4c  ' '
	defb 020h		;8e4d  ' '
	defb 048h		;8e4e  'H'
	defb 06fh		;8e4f  'o'
	defb 06fh		;8e50  'o'
	defb 064h		;8e51  'd'
	defb 020h		;8e52  ' '
	defb 020h		;8e53  ' '
	defb 066h		;8e54  'f'
	defb 06fh		;8e55  'o'
	defb 072h		;8e56  'r'
	defb 020h		;8e57  ' '
	defb 020h		;8e58  ' '
	defb 074h		;8e59  't'
	defb 065h		;8e5a  'e'
	defb 073h		;8e5b  's'
	defb 074h		;8e5c  't'
	defb 069h		;8e5d  'i'
	defb 06eh		;8e5e  'n'
	defb 067h		;8e5f  'g'
	defb 02eh		;8e60  '.'
	defb 020h		;8e61  ' '
	defb 010h		;8e62
	defb 006h		;8e63
	defb 011h		;8e64
	defb 000h		;8e65
	defb 08ch		;8e66
	defb 08ch		;8e67
	defb 08ch		;8e68
l8e69h:
	defb 08ch		;8e69
	defb 08ch		;8e6a
	defb 08ch		;8e6b
	defb 08ch		;8e6c
	defb 08ch		;8e6d
	defb 08ch		;8e6e
	defb 08ch		;8e6f
	defb 08ch		;8e70
	defb 08ch		;8e71
	defb 08ch		;8e72
	defb 088h		;8e73
l8e74h:
; "                  "
	defb 020h		;8e74  ' '
	defb 020h		;8e75  ' '
	defb 020h		;8e76  ' '
	defb 020h		;8e77  ' '
	defb 020h		;8e78  ' '
	defb 020h		;8e79  ' '
	defb 020h		;8e7a  ' '
	defb 020h		;8e7b  ' '
	defb 020h		;8e7c  ' '
	defb 020h		;8e7d  ' '
	defb 020h		;8e7e  ' '
	defb 020h		;8e7f  ' '
	defb 020h		;8e80  ' '
	defb 020h		;8e81  ' '
	defb 020h		;8e82  ' '
	defb 020h		;8e83  ' '
	defb 020h		;8e84  ' '
	defb 020h		;8e85  ' '
	defb 08ah		;8e86
	defb 08ch		;8e87
	defb 08ch		;8e88
	defb 088h		;8e89
	defb 08ah		;8e8a
	defb 081h		;8e8b
	defb 087h		;8e8c
	defb 08eh		;8e8d
	defb 08eh		;8e8e
	defb 08ah		;8e8f
	defb 08ch		;8e90
	defb 08ch		;8e91
	defb 088h		;8e92
	defb 08ah		;8e93
l8e94h:
; " <- Please visit  "
	defb 020h		;8e94  ' '
l8e95h:
	defb 03ch		;8e95  '<'
	defb 02dh		;8e96  '-'
	defb 020h		;8e97  ' '
	defb 050h		;8e98  'P'
	defb 06ch		;8e99  'l'
	defb 065h		;8e9a  'e'
	defb 061h		;8e9b  'a'
	defb 073h		;8e9c  's'
	defb 065h		;8e9d  'e'
	defb 020h		;8e9e  ' '
	defb 076h		;8e9f  'v'
	defb 069h		;8ea0  'i'
	defb 073h		;8ea1  's'
	defb 069h		;8ea2  'i'
	defb 074h		;8ea3  't'
	defb 020h		;8ea4  ' '
	defb 020h		;8ea5  ' '
	defb 08ah		;8ea6
	defb 08ah		;8ea7
	defb 020h		;8ea8  ' '
	defb 08ah		;8ea9
	defb 08eh		;8eaa
	defb 08ch		;8eab
	defb 084h		;8eac
	defb 085h		;8ead
	defb 089h		;8eae
	defb 08ah		;8eaf
	defb 08ah		;8eb0
	defb 020h		;8eb1  ' '
	defb 08ah		;8eb2
	defb 08ah		;8eb3
; "  Clive's website "
	defb 020h		;8eb4  ' '
	defb 020h		;8eb5  ' '
	defb 043h		;8eb6  'C'
	defb 06ch		;8eb7  'l'
	defb 069h		;8eb8  'i'
	defb 076h		;8eb9  'v'
	defb 065h		;8eba  'e'
	defb 027h		;8ebb  '''
	defb 073h		;8ebc  's'
	defb 020h		;8ebd  ' '
	defb 077h		;8ebe  'w'
	defb 065h		;8ebf  'e'
	defb 062h		;8ec0  'b'
	defb 073h		;8ec1  's'
	defb 069h		;8ec2  'i'
	defb 074h		;8ec3  't'
	defb 065h		;8ec4  'e'
	defb 020h		;8ec5  ' '
	defb 08ah		;8ec6
	defb 08eh		;8ec7
	defb 08ch		;8ec8
	defb 08ah		;8ec9
	defb 08eh		;8eca
	defb 08fh		;8ecb
	defb 081h		;8ecc
	defb 086h		;8ecd
	defb 08ah		;8ece
	defb 08ah		;8ecf
	defb 08eh		;8ed0
	defb 08ch		;8ed1
	defb 08ah		;8ed2
	defb 08ah		;8ed3
; "                  "
	defb 020h		;8ed4  ' '
	defb 020h		;8ed5  ' '
	defb 020h		;8ed6  ' '
	defb 020h		;8ed7  ' '
	defb 020h		;8ed8  ' '
	defb 020h		;8ed9  ' '
l8edah:
	defb 020h		;8eda  ' '
	defb 020h		;8edb  ' '
	defb 020h		;8edc  ' '
	defb 020h		;8edd  ' '
	defb 020h		;8ede  ' '
	defb 020h		;8edf  ' '
	defb 020h		;8ee0  ' '
	defb 020h		;8ee1  ' '
	defb 020h		;8ee2  ' '
	defb 020h		;8ee3  ' '
	defb 020h		;8ee4  ' '
	defb 020h		;8ee5  ' '
	defb 08eh		;8ee6
	defb 08ch		;8ee7
	defb 08ch		;8ee8
	defb 08ch		;8ee9
	defb 08eh		;8eea
	defb 086h		;8eeb
	defb 08eh		;8eec
	defb 086h		;8eed
	defb 082h		;8eee
	defb 08eh		;8eef
	defb 08ch		;8ef0
	defb 08ch		;8ef1
	defb 08ch		;8ef2
	defb 08ah		;8ef3
l8ef4h:
; "                  "
	defb 020h		;8ef4  ' '
	defb 020h		;8ef5  ' '
	defb 020h		;8ef6  ' '
	defb 020h		;8ef7  ' '
	defb 020h		;8ef8  ' '
	defb 020h		;8ef9  ' '
	defb 020h		;8efa  ' '
	defb 020h		;8efb  ' '
	defb 020h		;8efc  ' '
	defb 020h		;8efd  ' '
	defb 020h		;8efe  ' '
	defb 020h		;8eff  ' '
	defb 020h		;8f00  ' '
	defb 020h		;8f01  ' '
	defb 020h		;8f02  ' '
	defb 020h		;8f03  ' '
	defb 020h		;8f04  ' '
	defb 020h		;8f05  ' '
	defb 08ah		;8f06
	defb 08bh		;8f07
	defb 020h		;8f08  ' '
	defb 08ch		;8f09
	defb 08ch		;8f0a
	defb 08dh		;8f0b
	defb 08dh		;8f0c
	defb 082h		;8f0d
	defb 086h		;8f0e
	defb 085h		;8f0f
	defb 082h		;8f10
	defb 082h		;8f11
	defb 084h		;8f12
	defb 08ah		;8f13
; "    "
	defb 020h		;8f14  ' '
	defb 020h		;8f15  ' '
	defb 020h		;8f16  ' '
	defb 020h		;8f17  ' '
	defb 011h		;8f18
	defb 001h		;8f19
; " In-game: "
	defb 020h		;8f1a  ' '
	defb 049h		;8f1b  'I'
	defb 06eh		;8f1c  'n'
	defb 02dh		;8f1d  '-'
	defb 067h		;8f1e  'g'
	defb 061h		;8f1f  'a'
	defb 06dh		;8f20  'm'
	defb 065h		;8f21  'e'
	defb 03ah		;8f22  ':'
	defb 020h		;8f23  ' '
	defb 011h		;8f24
	defb 000h		;8f25
; "    "
	defb 020h		;8f26  ' '
	defb 020h		;8f27  ' '
	defb 020h		;8f28  ' '
	defb 020h		;8f29  ' '
	defb 08bh		;8f2a
	defb 083h		;8f2b
	defb 086h		;8f2c
	defb 086h		;8f2d
	defb 08ch		;8f2e
	defb 08fh		;8f2f
	defb 088h		;8f30
	defb 089h		;8f31
	defb 08ch		;8f32
	defb 082h		;8f33
l8f34h:
	defb 084h		;8f34
	defb 08ah		;8f35
	defb 08eh		;8f36
	defb 08ah		;8f37
; "   CS+P : pause   "
	defb 020h		;8f38  ' '
	defb 020h		;8f39  ' '
	defb 020h		;8f3a  ' '
	defb 043h		;8f3b  'C'
	defb 053h		;8f3c  'S'
	defb 02bh		;8f3d  '+'
	defb 050h		;8f3e  'P'
	defb 020h		;8f3f  ' '
	defb 03ah		;8f40  ':'
	defb 020h		;8f41  ' '
	defb 070h		;8f42  'p'
	defb 061h		;8f43  'a'
	defb 075h		;8f44  'u'
	defb 073h		;8f45  's'
	defb 065h		;8f46  'e'
	defb 020h		;8f47  ' '
	defb 020h		;8f48  ' '
	defb 020h		;8f49  ' '
	defb 08ah		;8f4a
	defb 083h		;8f4b
	defb 088h		;8f4c
	defb 08ch		;8f4d
	defb 08fh		;8f4e
	defb 084h		;8f4f
	defb 08eh		;8f50
	defb 08bh		;8f51
	defb 020h		;8f52  ' '
	defb 08eh		;8f53
	defb 089h		;8f54
	defb 081h		;8f55
	defb 086h		;8f56
	defb 08ah		;8f57
; "   CS+S : speed   "
	defb 020h		;8f58  ' '
	defb 020h		;8f59  ' '
	defb 020h		;8f5a  ' '
	defb 043h		;8f5b  'C'
	defb 053h		;8f5c  'S'
	defb 02bh		;8f5d  '+'
	defb 053h		;8f5e  'S'
	defb 020h		;8f5f  ' '
	defb 03ah		;8f60  ':'
	defb 020h		;8f61  ' '
	defb 073h		;8f62  's'
	defb 070h		;8f63  'p'
	defb 065h		;8f64  'e'
	defb 065h		;8f65  'e'
	defb 064h		;8f66  'd'
	defb 020h		;8f67  ' '
	defb 020h		;8f68  ' '
	defb 020h		;8f69  ' '
	defb 08ah		;8f6a
	defb 08dh		;8f6b
	defb 081h		;8f6c
	defb 086h		;8f6d
	defb 087h		;8f6e
	defb 084h		;8f6f
	defb 084h		;8f70
	defb 08ch		;8f71
	defb 081h		;8f72
	defb 085h		;8f73
	defb 020h		;8f74  ' '
	defb 081h		;8f75
	defb 084h		;8f76
	defb 08ah		;8f77
; "                  "
	defb 020h		;8f78  ' '
	defb 020h		;8f79  ' '
	defb 020h		;8f7a  ' '
	defb 020h		;8f7b  ' '
	defb 020h		;8f7c  ' '
	defb 020h		;8f7d  ' '
	defb 020h		;8f7e  ' '
	defb 020h		;8f7f  ' '
	defb 020h		;8f80  ' '
	defb 020h		;8f81  ' '
	defb 020h		;8f82  ' '
	defb 020h		;8f83  ' '
	defb 020h		;8f84  ' '
	defb 020h		;8f85  ' '
	defb 020h		;8f86  ' '
	defb 020h		;8f87  ' '
	defb 020h		;8f88  ' '
	defb 020h		;8f89  ' '
	defb 08eh		;8f8a
	defb 08eh		;8f8b
	defb 08dh		;8f8c
	defb 08eh		;8f8d
	defb 089h		;8f8e
l8f8fh:
	defb 08eh		;8f8f
	defb 083h		;8f90
	defb 086h		;8f91
	defb 020h		;8f92  ' '
	defb 08ch		;8f93
	defb 088h		;8f94
	defb 088h		;8f95
	defb 08eh		;8f96
	defb 08ah		;8f97
; "                  "
	defb 020h		;8f98  ' '
	defb 020h		;8f99  ' '
	defb 020h		;8f9a  ' '
	defb 020h		;8f9b  ' '
	defb 020h		;8f9c  ' '
	defb 020h		;8f9d  ' '
	defb 020h		;8f9e  ' '
	defb 020h		;8f9f  ' '
	defb 020h		;8fa0  ' '
	defb 020h		;8fa1  ' '
	defb 020h		;8fa2  ' '
	defb 020h		;8fa3  ' '
	defb 020h		;8fa4  ' '
	defb 020h		;8fa5  ' '
	defb 020h		;8fa6  ' '
	defb 020h		;8fa7  ' '
	defb 020h		;8fa8  ' '
	defb 020h		;8fa9  ' '
	defb 08ah		;8faa
	defb 08ch		;8fab
	defb 08ch		;8fac
	defb 088h		;8fad
	defb 08ah		;8fae
	defb 08bh		;8faf
	defb 089h		;8fb0
	defb 08bh		;8fb1
	defb 082h		;8fb2
	defb 08eh		;8fb3
	defb 08ah		;8fb4
	defb 087h		;8fb5
	defb 082h		;8fb6
	defb 08ah		;8fb7
; "                  "
	defb 020h		;8fb8  ' '
	defb 020h		;8fb9  ' '
	defb 020h		;8fba  ' '
	defb 020h		;8fbb  ' '
	defb 020h		;8fbc  ' '
	defb 020h		;8fbd  ' '
	defb 020h		;8fbe  ' '
	defb 020h		;8fbf  ' '
	defb 020h		;8fc0  ' '
	defb 020h		;8fc1  ' '
	defb 020h		;8fc2  ' '
	defb 020h		;8fc3  ' '
	defb 020h		;8fc4  ' '
	defb 020h		;8fc5  ' '
	defb 020h		;8fc6  ' '
	defb 020h		;8fc7  ' '
	defb 020h		;8fc8  ' '
	defb 020h		;8fc9  ' '
	defb 08ah		;8fca
	defb 08ah		;8fcb
	defb 020h		;8fcc  ' '
	defb 08ah		;8fcd
	defb 08ah		;8fce
	defb 086h		;8fcf
	defb 08eh		;8fd0
	defb 088h		;8fd1
	defb 08ch		;8fd2
	defb 020h		;8fd3  ' '
	defb 084h		;8fd4
	defb 085h		;8fd5
	defb 020h		;8fd6  ' '
	defb 08ah		;8fd7
; " 2024 @thealfest  "
	defb 020h		;8fd8  ' '
	defb 032h		;8fd9  '2'
	defb 030h		;8fda  '0'
	defb 032h		;8fdb  '2'
	defb 034h		;8fdc  '4'
	defb 020h		;8fdd  ' '
	defb 040h		;8fde  '@'
	defb 074h		;8fdf  't'
	defb 068h		;8fe0  'h'
	defb 065h		;8fe1  'e'
	defb 061h		;8fe2  'a'
	defb 06ch		;8fe3  'l'
	defb 066h		;8fe4  'f'
	defb 065h		;8fe5  'e'
	defb 073h		;8fe6  's'
	defb 074h		;8fe7  't'
	defb 020h		;8fe8  ' '
	defb 020h		;8fe9  ' '
	defb 08ah		;8fea
	defb 08eh		;8feb
	defb 08ch		;8fec
	defb 08ah		;8fed
	defb 08fh		;8fee
	defb 08dh		;8fef
	defb 08eh		;8ff0
	defb 08ah		;8ff1
	defb 08eh		;8ff2
	defb 08bh		;8ff3
	defb 084h		;8ff4
	defb 081h		;8ff5
	defb 020h		;8ff6  ' '
	defb 08ah		;8ff7
; " Made in Ukraine "
	defb 020h		;8ff8  ' '
	defb 04dh		;8ff9  'M'
	defb 061h		;8ffa  'a'
	defb 064h		;8ffb  'd'
	defb 065h		;8ffc  'e'
	defb 020h		;8ffd  ' '
	defb 069h		;8ffe  'i'
	defb 06eh		;8fff  'n'
	defb 020h		;9000  ' '
	defb 055h		;9001  'U'
	defb 06bh		;9002  'k'
	defb 072h		;9003  'r'
	defb 061h		;9004  'a'
	defb 069h		;9005  'i'
	defb 06eh		;9006  'n'
	defb 065h		;9007  'e'
	defb 020h		;9008  ' '
	defb 083h		;9009
	defb 08eh		;900a
	defb 08ch		;900b
