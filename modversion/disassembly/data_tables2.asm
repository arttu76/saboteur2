; ======================================================================
; data_tables2.asm
; ======================================================================
;
; Rendering Tables, Character Set & Tile Data
;
; Address range: $964C-$A04B (2560 bytes)
; Source binary: mod_decompressed.bin (loaded at $620C)
;
; Attribute/color mapping tables, ASCII character set bitmaps,
; tile definition tables, and score digit rendering data.
; Origin: code_roomrender, data_spritebitmap, code_mechanics,
;         code_score, data_hud (mostly preserved)
;
; ======================================================================

new_code_end:

tab2_start:
	defb 0f9h		;964c
	defb 0f8h		;964d
	defb 09ch		;964e
	defb 08ch		;964f
	defb 088h		;9650
	defb 0a1h		;9651
	defb 0a3h		;9652
	defb 07fh		;9653
	defb 0ffh		;9654
	defb 029h		;9655  ')'
	defb 07fh		;9656
	defb 0a4h		;9657
	defb 03fh		;9658  '?'
	defb 0adh		;9659
	defb 01fh		;965a
	defb 086h		;965b
	defb 044h		;965c  'D'
	defb 00eh		;965d
	defb 001h		;965e
	defb 00fh		;965f
	defb 04bh		;9660  'K'
	defb 01fh		;9661
	defb 0ffh		;9662
	defb 000h		;9663
	defb 0aeh		;9664
	defb 0ffh		;9665
	defb 0fdh		;9666
	defb 0feh		;9667
	defb 0fdh		;9668
	defb 0e8h		;9669
	defb 0d5h		;966a
	defb 0f8h		;966b
	defb 0f4h		;966c
	defb 0fah		;966d
	defb 0fdh		;966e
	defb 0feh		;966f
; "}~?;"
	defb 07dh		;9670  '}'
	defb 07eh		;9671  '~'
	defb 03fh		;9672  '?'
	defb 03bh		;9673  ';'
	defb 0bfh		;9674
	defb 03fh		;9675  '?'
	defb 0a7h		;9676
	defb 0e8h		;9677
	defb 0feh		;9678
	defb 096h		;9679
	defb 038h		;967a  '8'
	defb 0fah		;967b
	defb 0f1h		;967c
	defb 0e0h		;967d
	defb 0f5h		;967e
	defb 0d1h		;967f
	defb 00fh		;9680
	defb 0aah		;9681
	defb 0d5h		;9682
	defb 0e8h		;9683
	defb 0f5h		;9684
	defb 0f8h		;9685
	defb 0fch		;9686
	defb 0feh		;9687
	defb 0dch		;9688
	defb 0b9h		;9689
	defb 0e7h		;968a
	defb 0d9h		;968b
	defb 079h		;968c  'y'
	defb 00fh		;968d
	defb 00fh		;968e
	defb 087h		;968f
; "k`ae4"
	defb 06bh		;9690  'k'
	defb 060h		;9691  '`' (Spectrum: GBP)
	defb 061h		;9692  'a'
	defb 065h		;9693  'e'
	defb 034h		;9694  '4'
	defb 08fh		;9695
	defb 031h		;9696  '1'
	defb 011h		;9697
	defb 061h		;9698  'a'
	defb 090h		;9699
	defb 0feh		;969a
	defb 008h		;969b
	defb 04ah		;969c  'J'
	defb 098h		;969d
	defb 0a4h		;969e
	defb 074h		;969f  't'
	defb 078h		;96a0  'x'
	defb 0f4h		;96a1
	defb 0ebh		;96a2
l96a3h:
	defb 0feh		;96a3
	defb 0cfh		;96a4
	defb 003h		;96a5
	defb 000h		;96a6
	defb 02ah		;96a7  '*'
	defb 080h		;96a8
	defb 0c0h		;96a9
	defb 0e0h		;96aa
	defb 0a4h		;96ab
	defb 0ffh		;96ac
	defb 06fh		;96ad  'o'
	defb 078h		;96ae  'x'
	defb 0b4h		;96af
	defb 02dh		;96b0  '-'
	defb 0e0h		;96b1
	defb 0e5h		;96b2
	defb 0b2h		;96b3
	defb 0eah		;96b4
	defb 05fh		;96b5  '_'
	defb 0abh		;96b6
	defb 005h		;96b7
	defb 0a3h		;96b8
	defb 051h		;96b9  'Q'
	defb 0aah		;96ba
	defb 055h		;96bb  'U'
	defb 0fdh		;96bc
	defb 02ah		;96bd  '*'
	defb 085h		;96be
	defb 0aah		;96bf
	defb 0d8h		;96c0
	defb 095h		;96c1
	defb 0e0h		;96c2
	defb 0fah		;96c3
	defb 075h		;96c4  'u'
	defb 0dch		;96c5
	defb 09fh		;96c6
	defb 057h		;96c7  'W'
	defb 02bh		;96c8  '+'
	defb 057h		;96c9  'W'
	defb 0e9h		;96ca
	defb 089h		;96cb
	defb 0e4h		;96cc
	defb 0d8h		;96cd
	defb 0d5h		;96ce
	defb 0abh		;96cf
	defb 0dfh		;96d0
	defb 025h		;96d1  '%'
	defb 0abh		;96d2
	defb 0fah		;96d3
	defb 0f5h		;96d4
	defb 0f1h		;96d5
	defb 0abh		;96d6
	defb 0fdh		;96d7
	defb 075h		;96d8  'u'
	defb 0fdh		;96d9
	defb 06ah		;96da  'j'
	defb 030h		;96db  '0'
	defb 0dfh		;96dc
	defb 092h		;96dd
	defb 0f4h		;96de
	defb 0e8h		;96df
	defb 0f1h		;96e0
	defb 0e2h		;96e1
	defb 0f1h		;96e2
	defb 0fah		;96e3
	defb 09dh		;96e4
	defb 03ah		;96e5  ':'
	defb 07dh		;96e6  '}'
	defb 01eh		;96e7
	defb 085h		;96e8
	defb 078h		;96e9  'x'
	defb 008h		;96ea
	defb 032h		;96eb  '2'
	defb 003h		;96ec
	defb 004h		;96ed
	defb 084h		;96ee
	defb 071h		;96ef  'q'
	defb 098h		;96f0
	defb 0cbh		;96f1
	defb 096h		;96f2
	defb 039h		;96f3  '9'
	defb 03bh		;96f4  ';'
	defb 0feh		;96f5
	defb 023h		;96f6  '#'
	defb 0feh		;96f7
	defb 0f8h		;96f8
	defb 0c2h		;96f9
	defb 0b4h		;96fa
	defb 06ah		;96fb  'j'
	defb 080h		;96fc
	defb 0c0h		;96fd
	defb 0e0h		;96fe
	defb 0f9h		;96ff
	defb 08eh		;9700
	defb 0abh		;9701
	defb 055h		;9702  'U'
	defb 0fdh		;9703
	defb 0d9h		;9704
	defb 0aeh		;9705
	defb 084h		;9706
	defb 0a0h		;9707
	defb 05dh		;9708  ']'
	defb 090h		;9709
	defb 0adh		;970a
	defb 0afh		;970b
	defb 057h		;970c  'W'
	defb 0aeh		;970d
	defb 05dh		;970e  ']'
	defb 0feh		;970f
	defb 0f5h		;9710
	defb 0e8h		;9711
	defb 0d1h		;9712
	defb 0e2h		;9713
	defb 0d5h		;9714
	defb 0a2h		;9715
	defb 045h		;9716  'E'
	defb 045h		;9717  'E'
	defb 092h		;9718
	defb 050h		;9719  'P'
	defb 01bh		;971a
	defb 05fh		;971b  '_'
	defb 0fbh		;971c
	defb 055h		;971d  'U'
	defb 0a2h		;971e
	defb 001h		;971f
	defb 061h		;9720  'a'
	defb 030h		;9721  '0'
	defb 0aeh		;9722
	defb 07dh		;9723  '}'
	defb 08dh		;9724
	defb 021h		;9725  '!'
	defb 05fh		;9726  '_'
	defb 0bfh		;9727
	defb 0bdh		;9728
	defb 02bh		;9729  '+'
	defb 0f1h		;972a
	defb 0d5h		;972b
	defb 098h		;972c
	defb 06ah		;972d  'j'
	defb 001h		;972e
	defb 07dh		;972f  '}'
	defb 007h		;9730
	defb 007h		;9731
	defb 00fh		;9732
	defb 0feh		;9733
	defb 0a9h		;9734
	defb 087h		;9735
	defb 081h		;9736
	defb 007h		;9737
	defb 077h		;9738  'w'
	defb 0ffh		;9739
	defb 06bh		;973a  'k'
	defb 07fh		;973b
	defb 0a1h		;973c
	defb 0f7h		;973d
	defb 07fh		;973e
	defb 07ch		;973f  '|'
	defb 0c6h		;9740
	defb 063h		;9741  'c'
	defb 0bfh		;9742
	defb 05fh		;9743  '_'
	defb 063h		;9744  'c'
	defb 089h		;9745
	defb 0ebh		;9746
	defb 075h		;9747  'u'
	defb 024h		;9748  '$'
	defb 01dh		;9749
	defb 08fh		;974a
	defb 0aah		;974b
	defb 015h		;974c
	defb 0aah		;974d
	defb 005h		;974e
	defb 022h		;974f  '"'
	defb 051h		;9750  'Q'
	defb 0fch		;9751
	defb 04eh		;9752  'N'
	defb 0e1h		;9753
	defb 06ah		;9754  'j'
	defb 0c1h		;9755
	defb 0e8h		;9756
	defb 074h		;9757  't'
	defb 075h		;9758  'u'
	defb 017h		;9759
	defb 058h		;975a  'X'
	defb 0f9h		;975b
	defb 0d8h		;975c
	defb 0dfh		;975d
	defb 0afh		;975e
	defb 02dh		;975f  '-'
	defb 0b5h		;9760
	defb 0f5h		;9761
	defb 0fah		;9762
	defb 0b7h		;9763
	defb 0e4h		;9764
	defb 084h		;9765
	defb 051h		;9766  'Q'
	defb 0b7h		;9767
	defb 01ch		;9768
	defb 0eah		;9769
	defb 065h		;976a  'e'
	defb 0f4h		;976b
	defb 087h		;976c
	defb 001h		;976d
	defb 000h		;976e
	defb 0cfh		;976f
	defb 045h		;9770  'E'
	defb 0c0h		;9771
	defb 0ffh		;9772
	defb 0feh		;9773
	defb 00dh		;9774
	defb 027h		;9775  '''
	defb 0bdh		;9776
	defb 0afh		;9777
	defb 0f7h		;9778
	defb 0fah		;9779
	defb 060h		;977a  '`' (Spectrum: GBP)
	defb 08ch		;977b
	defb 021h		;977c  '!'
	defb 08eh		;977d
	defb 0abh		;977e
	defb 057h		;977f  'W'
	defb 0aeh		;9780
	defb 05ch		;9781  '\'
	defb 0b8h		;9782
	defb 0fdh		;9783
	defb 00ah		;9784
	defb 07dh		;9785  '}'
	defb 02eh		;9786  '.'
	defb 057h		;9787  'W'
	defb 00ah		;9788
	defb 0aeh		;9789
	defb 0aah		;978a
	defb 0abh		;978b
	defb 0c0h		;978c
	defb 022h		;978d  '"'
	defb 0bfh		;978e
	defb 0ffh		;978f
	defb 089h		;9790
	defb 0f5h		;9791
	defb 0e8h		;9792
	defb 032h		;9793  '2'
	defb 001h		;9794
	defb 0e4h		;9795
	defb 020h		;9796  ' '
	defb 0feh		;9797
	defb 0a5h		;9798
	defb 010h		;9799
	defb 028h		;979a  '('
	defb 03fh		;979b  '?'
	defb 0a1h		;979c
	defb 009h		;979d
	defb 0a2h		;979e
	defb 008h		;979f
	defb 026h		;97a0  '&'
	defb 00bh		;97a1
	defb 007h		;97a2
	defb 09ah		;97a3
	defb 005h		;97a4
	defb 003h		;97a5
	defb 019h		;97a6
	defb 0e3h		;97a7
	defb 007h		;97a8
	defb 004h		;97a9
	defb 007h		;97aa
	defb 0f2h		;97ab
	defb 08ah		;97ac
	defb 0ffh		;97ad
	defb 087h		;97ae
	defb 0c7h		;97af
	defb 0abh		;97b0
	defb 0e7h		;97b1
	defb 0f7h		;97b2
	defb 027h		;97b3  '''
	defb 06ch		;97b4  'l'
	defb 075h		;97b5  'u'
	defb 0b4h		;97b6
	defb 078h		;97b7  'x'
	defb 0b7h		;97b8
	defb 084h		;97b9
	defb 0dfh		;97ba
	defb 0bfh		;97bb
	defb 026h		;97bc  '&'
	defb 0deh		;97bd
	defb 0b6h		;97be
; "z3Yq"
	defb 07ah		;97bf  'z'
	defb 033h		;97c0  '3'
	defb 059h		;97c1  'Y'
	defb 071h		;97c2  'q'
	defb 080h		;97c3
	defb 08ah		;97c4
	defb 05fh		;97c5  '_'
	defb 0bah		;97c6
	defb 077h		;97c7  'w'
	defb 0fah		;97c8
	defb 05dh		;97c9  ']'
	defb 00eh		;97ca
	defb 099h		;97cb
	defb 093h		;97cc
	defb 0d8h		;97cd
	defb 0cch		;97ce
	defb 0e1h		;97cf
	defb 000h		;97d0
	defb 0b4h		;97d1
	defb 05dh		;97d2  ']'
	defb 0c9h		;97d3
	defb 00ch		;97d4
	defb 0e5h		;97d5
	defb 0d5h		;97d6
	defb 0ffh		;97d7
	defb 002h		;97d8
	defb 0feh		;97d9
	defb 024h		;97da  '$'
	defb 061h		;97db  'a'
	defb 0fbh		;97dc
	defb 0c7h		;97dd
	defb 0e9h		;97de
	defb 0bah		;97df
	defb 0a7h		;97e0
	defb 0c1h		;97e1
	defb 081h		;97e2
	defb 0a2h		;97e3
	defb 092h		;97e4
	defb 0d2h		;97e5
	defb 0c3h		;97e6
	defb 087h		;97e7
	defb 0ffh		;97e8
	defb 029h		;97e9  ')'
	defb 0fdh		;97ea
	defb 0c8h		;97eb
	defb 05eh		;97ec  '^'
	defb 089h		;97ed
	defb 007h		;97ee
	defb 0f8h		;97ef
	defb 006h		;97f0
	defb 020h		;97f1  ' '
	defb 0c7h		;97f2
	defb 0f8h		;97f3
	defb 0fah		;97f4
	defb 0feh		;97f5
	defb 0fch		;97f6
	defb 0f8h		;97f7
	defb 0f9h		;97f8
	defb 0e8h		;97f9
	defb 0deh		;97fa
	defb 042h		;97fb  'B'
	defb 097h		;97fc
	defb 08fh		;97fd
	defb 0a7h		;97fe
	defb 0e1h		;97ff
	defb 0f9h		;9800
	defb 0d2h		;9801
	defb 0fch		;9802
	defb 05bh		;9803  '['
	defb 0efh		;9804
	defb 0dfh		;9805
	defb 0eeh		;9806
	defb 0f7h		;9807
	defb 0bbh		;9808
	defb 05fh		;9809  '_'
	defb 0beh		;980a
	defb 00fh		;980b
	defb 0d4h		;980c
	defb 057h		;980d  'W'
	defb 064h		;980e  'd'
	defb 067h		;980f  'g'
	defb 0aah		;9810
	defb 077h		;9811  'w'
	defb 0bbh		;9812
	defb 02dh		;9813  '-'
	defb 018h		;9814
	defb 0a8h		;9815
	defb 058h		;9816  'X'
	defb 054h		;9817  'T'
	defb 01bh		;9818
	defb 051h		;9819  'Q'
	defb 00ah		;981a
	defb 0c9h		;981b
	defb 08ah		;981c
	defb 028h		;981d  '('
	defb 045h		;981e  'E'
	defb 00ah		;981f
	defb 0afh		;9820
	defb 08fh		;9821
	defb 0ffh		;9822
	defb 000h		;9823
	defb 0feh		;9824
	defb 014h		;9825
	defb 0a3h		;9826
	defb 080h		;9827
	defb 0b9h		;9828
	defb 0f6h		;9829
	defb 0feh		;982a
	defb 028h		;982b  '('
	defb 040h		;982c  '@'
	defb 018h		;982d
	defb 0b5h		;982e
	defb 0c0h		;982f
	defb 0f0h		;9830
	defb 080h		;9831
	defb 058h		;9832  'X'
	defb 08dh		;9833
	defb 0d0h		;9834
	defb 0feh		;9835
	defb 0e0h		;9836
	defb 072h		;9837  'r'
	defb 0e8h		;9838
	defb 07ch		;9839  '|'
	defb 03ch		;983a  '<'
	defb 098h		;983b
	defb 090h		;983c
	defb 0feh		;983d
	defb 028h		;983e  '('
	defb 0f8h		;983f
	defb 03ch		;9840  '<'
	defb 0fch		;9841
	defb 0c8h		;9842
	defb 096h		;9843
	defb 088h		;9844
	defb 008h		;9845
	defb 0aah		;9846
	defb 004h		;9847
	defb 084h		;9848
	defb 0a2h		;9849
	defb 0c4h		;984a
	defb 0e4h		;984b
	defb 0f4h		;984c
	defb 0a8h		;984d
	defb 0fch		;984e
	defb 072h		;984f  'r'
	defb 0bch		;9850
	defb 01fh		;9851
	defb 0efh		;9852
	defb 0d7h		;9853
	defb 0efh		;9854
	defb 0c1h		;9855
	defb 0c2h		;9856
	defb 07dh		;9857  '}'
	defb 0ddh		;9858
	defb 05bh		;9859  '['
	defb 0feh		;985a
	defb 07fh		;985b
	defb 0e8h		;985c
	defb 0f4h		;985d
	defb 0e0h		;985e
	defb 0c1h		;985f
	defb 08ah		;9860
	defb 0a3h		;9861
	defb 0fdh		;9862
	defb 02ah		;9863  '*'
	defb 046h		;9864  'F'
	defb 0b0h		;9865
	defb 00dh		;9866
	defb 0a9h		;9867
	defb 044h		;9868  'D'
	defb 0d5h		;9869
	defb 08fh		;986a
	defb 057h		;986b  'W'
	defb 0afh		;986c
	defb 0fdh		;986d
	defb 03fh		;986e  '?'
	defb 0e7h		;986f
	defb 0fdh		;9870
	defb 0feh		;9871
	defb 0a0h		;9872
	defb 000h		;9873
	defb 015h		;9874
	defb 023h		;9875  '#'
	defb 081h		;9876
	defb 0f8h		;9877
	defb 059h		;9878  'Y'
	defb 099h		;9879
	defb 08dh		;987a
	defb 0f9h		;987b
	defb 057h		;987c  'W'
	defb 0ebh		;987d
	defb 05ah		;987e  'Z'
	defb 074h		;987f  't'
	defb 024h		;9880  '$'
	defb 000h		;9881
	defb 001h		;9882
	defb 073h		;9883  's'
	defb 029h		;9884  ')'
	defb 046h		;9885  'F'
	defb 0cdh		;9886
	defb 037h		;9887  '7'
	defb 041h		;9888  'A'
	defb 08ah		;9889
	defb 07dh		;988a  '}'
	defb 0e5h		;988b
	defb 0f1h		;988c
	defb 0feh		;988d
	defb 0a0h		;988e
	defb 000h		;988f
	defb 015h		;9890
	defb 064h		;9891  'd'
	defb 0d6h		;9892
	defb 003h		;9893
	defb 020h		;9894  ' '
	defb 000h		;9895
	defb 0cch		;9896
	defb 06eh		;9897  'n'
	defb 0feh		;9898
	defb 0f9h		;9899
	defb 08bh		;989a
	defb 0fdh		;989b
	defb 0aeh		;989c
	defb 037h		;989d  '7'
	defb 018h		;989e
	defb 0a6h		;989f
	defb 0f9h		;98a0
	defb 057h		;98a1  'W'
	defb 07ch		;98a2  '|'
	defb 0f7h		;98a3
	defb 0fbh		;98a4
	defb 05fh		;98a5  '_'
	defb 0d9h		;98a6
	defb 034h		;98a7  '4'
	defb 082h		;98a8
	defb 0e9h		;98a9
	defb 0ffh		;98aa
	defb 00eh		;98ab
	defb 012h		;98ac
	defb 083h		;98ad
	defb 008h		;98ae
	defb 094h		;98af
	defb 0c0h		;98b0
	defb 05bh		;98b1  '['
	defb 010h		;98b2
	defb 0bdh		;98b3
	defb 0f6h		;98b4
	defb 0c0h		;98b5
	defb 016h		;98b6
	defb 095h		;98b7
	defb 008h		;98b8
	defb 01dh		;98b9
	defb 0adh		;98ba
	defb 0c5h		;98bb
	defb 028h		;98bc  '('
	defb 0c4h		;98bd
	defb 08ch		;98be
	defb 0f7h		;98bf
	defb 005h		;98c0
	defb 084h		;98c1
	defb 007h		;98c2
	defb 0fah		;98c3
	defb 0c9h		;98c4
	defb 0c0h		;98c5
	defb 010h		;98c6
; "|~_A"
	defb 07ch		;98c7  '|'
	defb 07eh		;98c8  '~'
	defb 05fh		;98c9  '_'
	defb 041h		;98ca  'A'
	defb 0d4h		;98cb
	defb 0c0h		;98cc
	defb 0a1h		;98cd
	defb 008h		;98ce
	defb 040h		;98cf  '@'
	defb 0dbh		;98d0
	defb 0c6h		;98d1
	defb 0d0h		;98d2
	defb 000h		;98d3
	defb 0feh		;98d4
	defb 0c3h		;98d5
	defb 0ffh		;98d6
	defb 080h		;98d7
	defb 07dh		;98d8  '}'
	defb 0beh		;98d9
	defb 04fh		;98da  'O'
	defb 0c2h		;98db
	defb 013h		;98dc
	defb 0ffh		;98dd
	defb 0feh		;98de
	defb 0bfh		;98df
	defb 0c0h		;98e0
	defb 043h		;98e1  'C'
	defb 0fdh		;98e2
	defb 0beh		;98e3
	defb 0c0h		;98e4
	defb 01fh		;98e5
	defb 0ffh		;98e6
	defb 0d4h		;98e7
	defb 07eh		;98e8  '~'
	defb 0d2h		;98e9
	defb 0fah		;98ea
	defb 057h		;98eb  'W'
	defb 084h		;98ec
	defb 080h		;98ed
	defb 00dh		;98ee
	defb 055h		;98ef  'U'
	defb 056h		;98f0  'V'
sub_98f1h:
	defb 0fdh		;98f1
; "!:\>"
	defb 021h		;98f2  '!'
	defb 03ah		;98f3  ':'
	defb 05ch		;98f4  '\'
	defb 03eh		;98f5  '>'
	defb 001h		;98f6
	defb 0d3h		;98f7
	defb 0feh		;98f8
	defb 021h		;98f9  '!'
	defb 021h		;98fa  '!'
	defb 096h		;98fb
	defb 011h		;98fc
	defb 074h		;98fd  't'
	defb 085h		;98fe
	defb 0d5h		;98ff
	defb 0cdh		;9900
	defb 0d0h		;9901
	defb 094h		;9902
	defb 0d1h		;9903
	defb 02eh		;9904  '.'
	defb 015h		;9905
	defb 026h		;9906  '&'
	defb 040h		;9907  '@'
	defb 04ch		;9908  'L'
	defb 006h		;9909
	defb 004h		;990a
	defb 01ah		;990b
	defb 077h		;990c  'w'
	defb 024h		;990d  '$'
	defb 013h		;990e
	defb 01ah		;990f
	defb 077h		;9910  'w'
	defb 024h		;9911  '$'
	defb 013h		;9912
	defb 010h		;9913
	defb 0f6h		;9914
	defb 07dh		;9915  '}'
	defb 0c6h		;9916
	defb 020h		;9917  ' '
	defb 06fh		;9918  'o'
	defb 038h		;9919  '8'
	defb 001h		;991a
	defb 061h		;991b  'a'
	defb 04ch		;991c  'L'
	defb 07ch		;991d  '|'
	defb 0feh		;991e
	defb 058h		;991f  'X'
	defb 020h		;9920  ' '
	defb 0e7h		;9921
	defb 02ch		;9922  ','
	defb 0cbh		;9923
	defb 06dh		;9924  'm'
	defb 028h		;9925  '('
	defb 0dfh		;9926
	defb 068h		;9927  'h'
	defb 0cdh		;9928
	defb 025h		;9929  '%'
	defb 0dch		;992a
	defb 0c3h		;992b
	defb 000h		;992c
	defb 0dch		;992d
l992eh:
	defb 0a3h		;992e
	defb 0a4h		;992f
	defb 0a4h		;9930
	defb 0a4h		;9931
	defb 0a4h		;9932
	defb 0a4h		;9933
	defb 0a4h		;9934
	defb 0a4h		;9935
	defb 0a4h		;9936
	defb 0a5h		;9937
l9938h:
	defb 0ffh		;9938
	defb 0ffh		;9939
	defb 0ffh		;993a
	defb 0ffh		;993b
	defb 0ffh		;993c
	defb 0ffh		;993d
	defb 0ffh		;993e
	defb 0ffh		;993f
	defb 0ffh		;9940
	defb 0ffh		;9941
	defb 0ffh		;9942
	defb 0ffh		;9943
	defb 0ffh		;9944
	defb 0ffh		;9945
	defb 093h		;9946
	defb 094h		;9947
	defb 0ffh		;9948
	defb 0ffh		;9949
	defb 0ffh		;994a
	defb 0ffh		;994b
	defb 095h		;994c
	defb 096h		;994d
	defb 097h		;994e
	defb 098h		;994f
	defb 0ffh		;9950
	defb 0ffh		;9951
	defb 099h		;9952
	defb 09ah		;9953
	defb 09bh		;9954
	defb 0ffh		;9955
	defb 0ffh		;9956
	defb 0ffh		;9957
	defb 09ch		;9958
	defb 09dh		;9959
	defb 09eh		;995a
	defb 0ffh		;995b
	defb 0ffh		;995c
	defb 09fh		;995d
	defb 0a0h		;995e
	defb 0a1h		;995f
	defb 0a2h		;9960
l9961h:
	defb 0ffh		;9961
	defb 077h		;9962  'w'
	defb 078h		;9963  'x'
	defb 0ffh		;9964
	defb 0ffh		;9965
	defb 0ffh		;9966
	defb 079h		;9967  'y'
	defb 07ah		;9968  'z'
	defb 07bh		;9969  '{'
	defb 0ffh		;996a
	defb 0ffh		;996b
	defb 0ffh		;996c
	defb 07ch		;996d  '|'
	defb 07dh		;996e  '}'
	defb 07eh		;996f  '~'
	defb 07fh		;9970
	defb 0ffh		;9971
	defb 0ffh		;9972
	defb 0ffh		;9973
	defb 080h		;9974
	defb 081h		;9975
	defb 082h		;9976
	defb 0ffh		;9977
	defb 0ffh		;9978
	defb 0ffh		;9979
	defb 083h		;997a
	defb 084h		;997b
	defb 085h		;997c
	defb 0ffh		;997d
	defb 0ffh		;997e
	defb 0ffh		;997f
	defb 0ffh		;9980
	defb 086h		;9981
	defb 0ffh		;9982
	defb 0ffh		;9983
	defb 0ffh		;9984
	defb 0ffh		;9985
	defb 0ffh		;9986
	defb 087h		;9987
	defb 0ffh		;9988
	defb 0ffh		;9989
	defb 0ffh		;998a
; " !"#$%&'"
	defb 020h		;998b  ' '
	defb 021h		;998c  '!'
	defb 022h		;998d  '"'
	defb 023h		;998e  '#'
	defb 024h		;998f  '$'
	defb 025h		;9990  '%'
	defb 026h		;9991  '&'
	defb 027h		;9992  '''
	defb 0b0h		;9993
	defb 0b1h		;9994
	defb 028h		;9995  '('
	defb 029h		;9996  ')'
	defb 02ah		;9997  '*'
	defb 0ffh		;9998
	defb 02bh		;9999  '+'
	defb 02ch		;999a  ','
	defb 02dh		;999b  '-'
	defb 0ffh		;999c
	defb 0ffh		;999d
	defb 0ffh		;999e
	defb 02eh		;999f  '.'
l99a0h:
	defb 0ffh		;99a0
	defb 0ffh		;99a1
; "/012S"
	defb 02fh		;99a2  '/'
	defb 030h		;99a3  '0'
	defb 031h		;99a4  '1'
	defb 032h		;99a5  '2'
	defb 053h		;99a6  'S'
	defb 0ffh		;99a7
	defb 0ffh		;99a8
; "TUVWXYZ"
	defb 054h		;99a9  'T'
	defb 055h		;99aa  'U'
	defb 056h		;99ab  'V'
	defb 057h		;99ac  'W'
	defb 058h		;99ad  'X'
	defb 059h		;99ae  'Y'
	defb 05ah		;99af  'Z'
	defb 0ffh		;99b0
	defb 0ffh		;99b1
	defb 0ffh		;99b2
; "[\]^_"
	defb 05bh		;99b3  '['
	defb 05ch		;99b4  '\'
	defb 05dh		;99b5  ']'
	defb 05eh		;99b6  '^'
	defb 05fh		;99b7  '_'
	defb 0ffh		;99b8
	defb 0ffh		;99b9
	defb 060h		;99ba  '`' (Spectrum: GBP)
	defb 088h		;99bb
	defb 089h		;99bc
	defb 08ah		;99bd
	defb 0a6h		;99be
	defb 0ffh		;99bf
	defb 0a7h		;99c0
	defb 0a8h		;99c1
	defb 0a9h		;99c2
	defb 0aah		;99c3
	defb 0abh		;99c4
	defb 0ach		;99c5
	defb 0adh		;99c6
	defb 0ffh		;99c7
	defb 0ffh		;99c8
	defb 0ffh		;99c9
	defb 0ffh		;99ca
	defb 0aeh		;99cb
	defb 0afh		;99cc
	defb 0ffh		;99cd
l99ceh:
	defb 0ffh		;99ce
	defb 0ffh		;99cf
	defb 0b2h		;99d0
	defb 0b3h		;99d1
	defb 0b4h		;99d2
	defb 0b5h		;99d3
	defb 0ffh		;99d4
	defb 0ffh		;99d5
	defb 0ffh		;99d6
	defb 0ffh		;99d7
	defb 0b6h		;99d8
	defb 0b7h		;99d9
	defb 0b8h		;99da
	defb 0b9h		;99db
	defb 0ffh		;99dc
	defb 0ffh		;99dd
	defb 0ffh		;99de
	defb 0ffh		;99df
	defb 0ffh		;99e0
	defb 0bah		;99e1
	defb 0bbh		;99e2
	defb 0bch		;99e3
	defb 0ffh		;99e4
	defb 0ffh		;99e5
	defb 000h		;99e6
	defb 001h		;99e7
	defb 0ffh		;99e8
	defb 0ffh		;99e9
	defb 0ffh		;99ea
	defb 0ffh		;99eb
	defb 002h		;99ec
	defb 003h		;99ed
	defb 0ffh		;99ee
	defb 0ffh		;99ef
	defb 0ffh		;99f0
	defb 0ffh		;99f1
	defb 004h		;99f2
	defb 005h		;99f3
	defb 0ffh		;99f4
	defb 0ffh		;99f5
	defb 0ffh		;99f6
	defb 0ffh		;99f7
	defb 006h		;99f8
	defb 007h		;99f9
	defb 008h		;99fa
	defb 0ffh		;99fb
	defb 0ffh		;99fc
	defb 0ffh		;99fd
	defb 009h		;99fe
	defb 00ah		;99ff
	defb 00bh		;9a00
	defb 0ffh		;9a01
	defb 0ffh		;9a02
	defb 0ffh		;9a03
	defb 00ch		;9a04
	defb 00dh		;9a05
	defb 00eh		;9a06
	defb 0ffh		;9a07
	defb 0ffh		;9a08
	defb 0ffh		;9a09
	defb 00fh		;9a0a
	defb 0ffh		;9a0b
	defb 010h		;9a0c
	defb 0ffh		;9a0d
	defb 0ffh		;9a0e
	defb 000h		;9a0f
	defb 001h		;9a10
	defb 0ffh		;9a11
	defb 0ffh		;9a12
	defb 0ffh		;9a13
	defb 0ffh		;9a14
	defb 011h		;9a15
	defb 012h		;9a16
	defb 0ffh		;9a17
	defb 0ffh		;9a18
	defb 0ffh		;9a19
	defb 0ffh		;9a1a
	defb 013h		;9a1b
	defb 014h		;9a1c
	defb 0ffh		;9a1d
	defb 0ffh		;9a1e
	defb 0ffh		;9a1f
	defb 0ffh		;9a20
	defb 015h		;9a21
	defb 016h		;9a22
	defb 0ffh		;9a23
	defb 0ffh		;9a24
	defb 0ffh		;9a25
	defb 0ffh		;9a26
	defb 017h		;9a27
	defb 018h		;9a28
	defb 0ffh		;9a29
	defb 0ffh		;9a2a
	defb 0ffh		;9a2b
	defb 0ffh		;9a2c
	defb 0ffh		;9a2d
	defb 019h		;9a2e
	defb 0ffh		;9a2f
	defb 0ffh		;9a30
	defb 0ffh		;9a31
	defb 0ffh		;9a32
	defb 0ffh		;9a33
	defb 01ah		;9a34
	defb 0ffh		;9a35
	defb 0ffh		;9a36
	defb 0ffh		;9a37
	defb 000h		;9a38
	defb 001h		;9a39
	defb 0ffh		;9a3a
	defb 0ffh		;9a3b
	defb 0ffh		;9a3c
	defb 0ffh		;9a3d
	defb 01bh		;9a3e
	defb 01ch		;9a3f
	defb 0ffh		;9a40
	defb 0ffh		;9a41
	defb 0ffh		;9a42
	defb 0ffh		;9a43
	defb 01dh		;9a44
	defb 01eh		;9a45
	defb 01fh		;9a46
	defb 0ffh		;9a47
	defb 0ffh		;9a48
	defb 0ffh		;9a49
	defb 034h		;9a4a  '4'
	defb 035h		;9a4b  '5'
	defb 036h		;9a4c  '6'
	defb 0ffh		;9a4d
	defb 0ffh		;9a4e
	defb 0ffh		;9a4f
	defb 037h		;9a50  '7'
	defb 038h		;9a51  '8'
	defb 039h		;9a52  '9'
	defb 0ffh		;9a53
	defb 0ffh		;9a54
	defb 0ffh		;9a55
	defb 03ah		;9a56  ':'
	defb 03bh		;9a57  ';'
	defb 03ch		;9a58  '<'
	defb 0ffh		;9a59
	defb 0ffh		;9a5a
	defb 0ffh		;9a5b
	defb 03dh		;9a5c  '='
	defb 0ffh		;9a5d
	defb 03eh		;9a5e  '>'
l9a5fh:
	defb 0ffh		;9a5f
	defb 0ffh		;9a60
	defb 03fh		;9a61  '?'
	defb 040h		;9a62  '@'
	defb 0ffh		;9a63
	defb 0ffh		;9a64
	defb 0ffh		;9a65
	defb 041h		;9a66  'A'
	defb 042h		;9a67  'B'
	defb 043h		;9a68  'C'
	defb 0ffh		;9a69
	defb 0ffh		;9a6a
	defb 0ffh		;9a6b
	defb 044h		;9a6c  'D'
	defb 045h		;9a6d  'E'
	defb 046h		;9a6e  'F'
	defb 0ffh		;9a6f
	defb 0ffh		;9a70
	defb 0ffh		;9a71
	defb 047h		;9a72  'G'
	defb 048h		;9a73  'H'
	defb 049h		;9a74  'I'
	defb 0ffh		;9a75
	defb 0ffh		;9a76
	defb 0ffh		;9a77
	defb 04ah		;9a78  'J'
	defb 04bh		;9a79  'K'
	defb 04ch		;9a7a  'L'
	defb 0ffh		;9a7b
	defb 0ffh		;9a7c
	defb 0ffh		;9a7d
	defb 04dh		;9a7e  'M'
	defb 04eh		;9a7f  'N'
	defb 04fh		;9a80  'O'
	defb 0ffh		;9a81
	defb 0ffh		;9a82
	defb 0ffh		;9a83
	defb 050h		;9a84  'P'
	defb 051h		;9a85  'Q'
	defb 052h		;9a86  'R'
	defb 0ffh		;9a87
	defb 0ffh		;9a88
l9a89h:
	defb 062h		;9a89  'b'
	defb 061h		;9a8a  'a'
	defb 0ffh		;9a8b
	defb 0ffh		;9a8c
	defb 0ffh		;9a8d
	defb 0ffh		;9a8e
	defb 067h		;9a8f  'g'
	defb 066h		;9a90  'f'
	defb 065h		;9a91  'e'
	defb 0ffh		;9a92
; "dcmlkjih"
	defb 064h		;9a93  'd'
	defb 063h		;9a94  'c'
	defb 06dh		;9a95  'm'
	defb 06ch		;9a96  'l'
	defb 06bh		;9a97  'k'
	defb 06ah		;9a98  'j'
	defb 069h		;9a99  'i'
	defb 068h		;9a9a  'h'
	defb 0ffh		;9a9b
	defb 070h		;9a9c  'p'
	defb 06fh		;9a9d  'o'
	defb 06eh		;9a9e  'n'
	defb 0ffh		;9a9f
	defb 0ffh		;9aa0
	defb 0ffh		;9aa1
	defb 072h		;9aa2  'r'
	defb 071h		;9aa3  'q'
	defb 0ffh		;9aa4
	defb 0ffh		;9aa5
	defb 0ffh		;9aa6
	defb 0ffh		;9aa7
	defb 074h		;9aa8  't'
	defb 073h		;9aa9  's'
	defb 0ffh		;9aaa
	defb 0ffh		;9aab
	defb 0ffh		;9aac
	defb 0ffh		;9aad
	defb 076h		;9aae  'v'
	defb 075h		;9aaf  'u'
l9ab0h:
	defb 0ffh		;9ab0
	defb 0ffh		;9ab1
	defb 0ffh		;9ab2
	defb 0ffh		;9ab3
	defb 0ffh		;9ab4
	defb 0ffh		;9ab5
	defb 0ffh		;9ab6
	defb 0ceh		;9ab7
	defb 0ffh		;9ab8
	defb 0ffh		;9ab9
	defb 0ffh		;9aba
	defb 0ffh		;9abb
	defb 0ffh		;9abc
	defb 0cfh		;9abd
	defb 0d0h		;9abe
	defb 0d1h		;9abf
	defb 0ffh		;9ac0
	defb 0ffh		;9ac1
	defb 0ffh		;9ac2
	defb 0d6h		;9ac3
	defb 0d7h		;9ac4
	defb 0d8h		;9ac5
	defb 0d9h		;9ac6
	defb 0ffh		;9ac7
	defb 0ffh		;9ac8
	defb 0ffh		;9ac9
	defb 0ffh		;9aca
	defb 0ffh		;9acb
	defb 0ffh		;9acc
l9acdh:
	defb 0ffh		;9acd
	defb 0ffh		;9ace
	defb 0ffh		;9acf
	defb 0ffh		;9ad0
	defb 0ffh		;9ad1
	defb 0ffh		;9ad2
	defb 0ffh		;9ad3
	defb 0ffh		;9ad4
	defb 0ffh		;9ad5
	defb 0ffh		;9ad6
	defb 0ffh		;9ad7
	defb 0ffh		;9ad8
	defb 0ffh		;9ad9
	defb 0bdh		;9ada
	defb 0ffh		;9adb
	defb 0ffh		;9adc
	defb 0ffh		;9add
	defb 0beh		;9ade
	defb 0bfh		;9adf
	defb 0c0h		;9ae0
	defb 0c1h		;9ae1
	defb 0c2h		;9ae2
	defb 0c3h		;9ae3
l9ae4h:
	defb 0ffh		;9ae4
	defb 0ffh		;9ae5
	defb 0ffh		;9ae6
	defb 0ffh		;9ae7
	defb 0ffh		;9ae8
	defb 0ffh		;9ae9
	defb 0c6h		;9aea
	defb 0ffh		;9aeb
	defb 0ffh		;9aec
	defb 0ffh		;9aed
	defb 0ffh		;9aee
	defb 0ffh		;9aef
	defb 0c7h		;9af0
	defb 0c8h		;9af1
	defb 0c9h		;9af2
	defb 0cah		;9af3
	defb 0cbh		;9af4
	defb 0cch		;9af5
	defb 0ffh		;9af6
	defb 0cdh		;9af7
l9af8h:
	defb 0ffh		;9af8
	defb 0ffh		;9af9
	defb 0ffh		;9afa
	defb 0ffh		;9afb
	defb 0ffh		;9afc
	defb 0ffh		;9afd
	defb 0ffh		;9afe
l9affh:
	defb 0ffh		;9aff
	defb 0ffh		;9b00
	defb 0ffh		;9b01
	defb 0ffh		;9b02
	defb 0ffh		;9b03
	defb 0ffh		;9b04
	defb 0ffh		;9b05
	defb 0ffh		;9b06
	defb 0ffh		;9b07
	defb 0ffh		;9b08
	defb 0ffh		;9b09
	defb 0ffh		;9b0a
	defb 0ffh		;9b0b
	defb 0ffh		;9b0c
	defb 0ffh		;9b0d
	defb 0ffh		;9b0e
	defb 0ffh		;9b0f
	defb 0ffh		;9b10
	defb 0ffh		;9b11
	defb 0ffh		;9b12
	defb 0ffh		;9b13
	defb 0ffh		;9b14
	defb 0ffh		;9b15
	defb 0ffh		;9b16
	defb 08bh		;9b17
	defb 08ch		;9b18
	defb 0ffh		;9b19
	defb 0ffh		;9b1a
	defb 0ffh		;9b1b
	defb 08dh		;9b1c
	defb 08eh		;9b1d
	defb 08fh		;9b1e
	defb 090h		;9b1f
	defb 091h		;9b20
	defb 092h		;9b21
l9b22h:
	defb 0ffh		;9b22
	defb 0ffh		;9b23
	defb 0ffh		;9b24
	defb 0ffh		;9b25
	defb 0ffh		;9b26
	defb 0ffh		;9b27
	defb 0ffh		;9b28
	defb 0ffh		;9b29
	defb 0a0h		;9b2a
	defb 0a1h		;9b2b
	defb 0ffh		;9b2c
	defb 0ffh		;9b2d
	defb 0ffh		;9b2e
	defb 0ffh		;9b2f
	defb 0a2h		;9b30
	defb 0a3h		;9b31
	defb 0a4h		;9b32
	defb 0ffh		;9b33
	defb 0ffh		;9b34
	defb 0ffh		;9b35
	defb 0a5h		;9b36
	defb 0a6h		;9b37
	defb 0a7h		;9b38
	defb 0ffh		;9b39
	defb 0ffh		;9b3a
	defb 0ffh		;9b3b
	defb 0ffh		;9b3c
	defb 0a8h		;9b3d
	defb 0a9h		;9b3e
l9b3fh:
	defb 0ffh		;9b3f
	defb 0ffh		;9b40
	defb 0ffh		;9b41
	defb 0ffh		;9b42
	defb 0ffh		;9b43
	defb 0ffh		;9b44
	defb 0ffh		;9b45
	defb 0ffh		;9b46
	defb 0ffh		;9b47
	defb 0ffh		;9b48
	defb 0ffh		;9b49
	defb 0ffh		;9b4a
	defb 0ffh		;9b4b
	defb 0ffh		;9b4c
	defb 0ffh		;9b4d
	defb 0ffh		;9b4e
	defb 0ffh		;9b4f
	defb 0ffh		;9b50
	defb 0ffh		;9b51
	defb 0ffh		;9b52
	defb 0ffh		;9b53
	defb 011h		;9b54
	defb 012h		;9b55
	defb 0ffh		;9b56
	defb 013h		;9b57
	defb 014h		;9b58
	defb 015h		;9b59
	defb 016h		;9b5a
	defb 017h		;9b5b
	defb 0ffh		;9b5c
	defb 0ffh		;9b5d
; "CDEF"
	defb 043h		;9b5e  'C'
	defb 044h		;9b5f  'D'
	defb 045h		;9b60  'E'
	defb 046h		;9b61  'F'
	defb 0ffh		;9b62
	defb 047h		;9b63  'G'
	defb 048h		;9b64  'H'
	defb 049h		;9b65  'I'
	defb 0ffh		;9b66
	defb 04ah		;9b67  'J'
	defb 0ffh		;9b68
	defb 0ffh		;9b69
	defb 0ffh		;9b6a
	defb 0ffh		;9b6b
	defb 0ffh		;9b6c
	defb 0ffh		;9b6d
	defb 0ffh		;9b6e
	defb 0ffh		;9b6f
	defb 0ffh		;9b70
	defb 0aah		;9b71
	defb 0abh		;9b72
	defb 0ffh		;9b73
	defb 0ffh		;9b74
	defb 0ffh		;9b75
	defb 0ach		;9b76
	defb 0adh		;9b77
	defb 0aeh		;9b78
	defb 0ffh		;9b79
	defb 0ffh		;9b7a
	defb 0ffh		;9b7b
	defb 0afh		;9b7c
	defb 0b0h		;9b7d
	defb 0b1h		;9b7e
l9b7fh:
	defb 0ffh		;9b7f
	defb 0ffh		;9b80
	defb 0ffh		;9b81
	defb 0ffh		;9b82
	defb 0ffh		;9b83
	defb 0ffh		;9b84
	defb 0ffh		;9b85
	defb 0ffh		;9b86
	defb 0ffh		;9b87
	defb 0ffh		;9b88
	defb 0ffh		;9b89
	defb 0ffh		;9b8a
	defb 0ffh		;9b8b
	defb 0ffh		;9b8c
	defb 0ffh		;9b8d
	defb 0ffh		;9b8e
	defb 0ffh		;9b8f
	defb 0ffh		;9b90
	defb 0ffh		;9b91
	defb 0ffh		;9b92
	defb 0ffh		;9b93
	defb 011h		;9b94
	defb 012h		;9b95
	defb 0ffh		;9b96
	defb 0ffh		;9b97
	defb 0ffh		;9b98
	defb 002h		;9b99
	defb 016h		;9b9a
	defb 017h		;9b9b
	defb 0ffh		;9b9c
	defb 0ffh		;9b9d
; "KLEF"
	defb 04bh		;9b9e  'K'
	defb 04ch		;9b9f  'L'
	defb 045h		;9ba0  'E'
	defb 046h		;9ba1  'F'
	defb 0ffh		;9ba2
	defb 0ffh		;9ba3
	defb 04dh		;9ba4  'M'
	defb 04eh		;9ba5  'N'
	defb 0ffh		;9ba6
	defb 04ah		;9ba7  'J'
	defb 0ffh		;9ba8
	defb 0ffh		;9ba9
	defb 0ffh		;9baa
	defb 0ffh		;9bab
	defb 0ffh		;9bac
	defb 0ffh		;9bad
	defb 0ffh		;9bae
	defb 0ffh		;9baf
	defb 0b2h		;9bb0
	defb 0b3h		;9bb1
	defb 0b4h		;9bb2
	defb 0ffh		;9bb3
	defb 0ffh		;9bb4
	defb 0ffh		;9bb5
	defb 0b5h		;9bb6
	defb 0b6h		;9bb7
	defb 0b7h		;9bb8
	defb 0ffh		;9bb9
	defb 0ffh		;9bba
	defb 0ffh		;9bbb
	defb 0b8h		;9bbc
	defb 0b9h		;9bbd
	defb 0bah		;9bbe
	defb 0ffh		;9bbf
	defb 0ffh		;9bc0
	defb 0ffh		;9bc1
	defb 0ffh		;9bc2
	defb 0bbh		;9bc3
	defb 0bch		;9bc4
	defb 0ffh		;9bc5
	defb 0ffh		;9bc6
	defb 0ffh		;9bc7
	defb 0ffh		;9bc8
	defb 0ffh		;9bc9
l9bcah:
	defb 0ffh		;9bca
	defb 0ffh		;9bcb
	defb 0ffh		;9bcc
	defb 0ffh		;9bcd
	defb 0ffh		;9bce
	defb 0ffh		;9bcf
	defb 0ffh		;9bd0
	defb 0ffh		;9bd1
	defb 000h		;9bd2
	defb 001h		;9bd3
	defb 0ffh		;9bd4
	defb 0ffh		;9bd5
	defb 0ffh		;9bd6
	defb 0ffh		;9bd7
	defb 002h		;9bd8
	defb 003h		;9bd9
	defb 004h		;9bda
	defb 0ffh		;9bdb
	defb 0ffh		;9bdc
	defb 0ffh		;9bdd
	defb 005h		;9bde
	defb 006h		;9bdf
	defb 007h		;9be0
	defb 0ffh		;9be1
	defb 0ffh		;9be2
	defb 0ffh		;9be3
	defb 008h		;9be4
	defb 009h		;9be5
	defb 0ffh		;9be6
	defb 0ffh		;9be7
	defb 0ffh		;9be8
	defb 0ffh		;9be9
	defb 00ah		;9bea
	defb 00bh		;9beb
	defb 00ch		;9bec
	defb 0ffh		;9bed
	defb 0ffh		;9bee
	defb 00dh		;9bef
	defb 00eh		;9bf0
	defb 00fh		;9bf1
	defb 010h		;9bf2
l9bf3h:
	defb 0ffh		;9bf3
	defb 0ffh		;9bf4
	defb 0ffh		;9bf5
	defb 063h		;9bf6  'c'
	defb 0ffh		;9bf7
	defb 0ffh		;9bf8
	defb 0ffh		;9bf9
	defb 064h		;9bfa  'd'
	defb 065h		;9bfb  'e'
	defb 066h		;9bfc  'f'
	defb 0ffh		;9bfd
	defb 0ffh		;9bfe
	defb 0ffh		;9bff
	defb 067h		;9c00  'g'
	defb 068h		;9c01  'h'
	defb 069h		;9c02  'i'
	defb 0ffh		;9c03
	defb 0ffh		;9c04
	defb 0ffh		;9c05
	defb 0ffh		;9c06
	defb 06ah		;9c07  'j'
	defb 06bh		;9c08  'k'
	defb 0ffh		;9c09
	defb 0ffh		;9c0a
	defb 0ffh		;9c0b
	defb 0ffh		;9c0c
	defb 06ch		;9c0d  'l'
	defb 06dh		;9c0e  'm'
	defb 06eh		;9c0f  'n'
	defb 0ffh		;9c10
	defb 0ffh		;9c11
	defb 0ffh		;9c12
	defb 06fh		;9c13  'o'
	defb 070h		;9c14  'p'
	defb 0ffh		;9c15
	defb 0ffh		;9c16
	defb 0ffh		;9c17
	defb 0ffh		;9c18
	defb 071h		;9c19  'q'
l9c1ah:
	defb 0ffh		;9c1a
	defb 0ffh		;9c1b
	defb 0ffh		;9c1c
	defb 0ffh		;9c1d
	defb 0ffh		;9c1e
	defb 0ffh		;9c1f
	defb 0ffh		;9c20
	defb 0ffh		;9c21
	defb 0ffh		;9c22
	defb 011h		;9c23
	defb 012h		;9c24
	defb 0ffh		;9c25
	defb 013h		;9c26
	defb 014h		;9c27
	defb 015h		;9c28
	defb 016h		;9c29
	defb 017h		;9c2a
	defb 0ffh		;9c2b
	defb 0ffh		;9c2c
	defb 0ffh		;9c2d
	defb 018h		;9c2e
	defb 019h		;9c2f
	defb 01ah		;9c30
	defb 0ffh		;9c31
	defb 0ffh		;9c32
	defb 0ffh		;9c33
	defb 008h		;9c34
	defb 009h		;9c35
	defb 0ffh		;9c36
	defb 0ffh		;9c37
	defb 0ffh		;9c38
	defb 0ffh		;9c39
	defb 00ah		;9c3a
	defb 00bh		;9c3b
	defb 00ch		;9c3c
	defb 0ffh		;9c3d
	defb 0ffh		;9c3e
	defb 00dh		;9c3f
	defb 00eh		;9c40
	defb 00fh		;9c41
	defb 010h		;9c42
l9c43h:
	defb 0ffh		;9c43
	defb 08bh		;9c44
	defb 08ch		;9c45
	defb 08dh		;9c46
	defb 08eh		;9c47
	defb 0ffh		;9c48
	defb 0ffh		;9c49
	defb 08fh		;9c4a
	defb 090h		;9c4b
	defb 091h		;9c4c
	defb 092h		;9c4d
	defb 0ffh		;9c4e
	defb 0ffh		;9c4f
	defb 0ffh		;9c50
	defb 093h		;9c51
	defb 094h		;9c52
	defb 095h		;9c53
	defb 0ffh		;9c54
	defb 0ffh		;9c55
	defb 0ffh		;9c56
	defb 096h		;9c57
	defb 097h		;9c58
	defb 0ffh		;9c59
	defb 0ffh		;9c5a
	defb 0ffh		;9c5b
	defb 098h		;9c5c
	defb 099h		;9c5d
	defb 09ah		;9c5e
	defb 0ffh		;9c5f
	defb 0ffh		;9c60
	defb 0ffh		;9c61
	defb 09bh		;9c62
	defb 09ch		;9c63
	defb 09dh		;9c64
	defb 0ffh		;9c65
	defb 0ffh		;9c66
	defb 0ffh		;9c67
	defb 0ffh		;9c68
	defb 09eh		;9c69
	defb 09fh		;9c6a
l9c6bh:
	defb 0ffh		;9c6b
	defb 0ffh		;9c6c
	defb 0ffh		;9c6d
	defb 0ffh		;9c6e
	defb 0ffh		;9c6f
	defb 0ffh		;9c70
	defb 0ffh		;9c71
	defb 0ffh		;9c72
	defb 01bh		;9c73
	defb 0ffh		;9c74
	defb 0ffh		;9c75
	defb 0ffh		;9c76
	defb 0ffh		;9c77
	defb 01ch		;9c78
	defb 01dh		;9c79
l9c7ah:
	defb 01eh		;9c7a
	defb 0ffh		;9c7b
	defb 0ffh		;9c7c
	defb 0ffh		;9c7d
	defb 01fh		;9c7e
	defb 020h		;9c7f  ' '
	defb 021h		;9c80  '!'
	defb 0ffh		;9c81
	defb 0ffh		;9c82
	defb 0ffh		;9c83
l9c84h:
	defb 0ffh		;9c84
	defb 0ffh		;9c85
	defb 0ffh		;9c86
	defb 0ffh		;9c87
	defb 0ffh		;9c88
	defb 0ffh		;9c89
	defb 0ffh		;9c8a
	defb 0ffh		;9c8b
	defb 0ffh		;9c8c
	defb 0ffh		;9c8d
	defb 0ffh		;9c8e
	defb 0ffh		;9c8f
	defb 0ffh		;9c90
	defb 0ffh		;9c91
	defb 0ffh		;9c92
	defb 0ffh		;9c93
l9c94h:
	defb 0ffh		;9c94
	defb 022h		;9c95  '"'
	defb 023h		;9c96  '#'
	defb 0ffh		;9c97
	defb 0ffh		;9c98
	defb 0ffh		;9c99
	defb 0ffh		;9c9a
	defb 024h		;9c9b  '$'
	defb 025h		;9c9c  '%'
	defb 0ffh		;9c9d
	defb 0ffh		;9c9e
	defb 0ffh		;9c9f
	defb 0ffh		;9ca0
	defb 026h		;9ca1  '&'
	defb 027h		;9ca2  '''
	defb 0ffh		;9ca3
	defb 028h		;9ca4  '('
	defb 029h		;9ca5  ')'
	defb 02ah		;9ca6  '*'
	defb 0ffh		;9ca7
	defb 0ffh		;9ca8
	defb 0ffh		;9ca9
	defb 02bh		;9caa  '+'
	defb 02ch		;9cab  ','
	defb 02dh		;9cac  '-'
	defb 0ffh		;9cad
	defb 0ffh		;9cae
	defb 0ffh		;9caf
	defb 0ffh		;9cb0
	defb 02eh		;9cb1  '.'
	defb 02fh		;9cb2  '/'
	defb 0ffh		;9cb3
	defb 030h		;9cb4  '0'
	defb 031h		;9cb5  '1'
	defb 032h		;9cb6  '2'
	defb 0ffh		;9cb7
	defb 0ffh		;9cb8
	defb 0ffh		;9cb9
	defb 033h		;9cba  '3'
	defb 034h		;9cbb  '4'
	defb 035h		;9cbc  '5'
	defb 0ffh		;9cbd
	defb 0ffh		;9cbe
	defb 0ffh		;9cbf
	defb 0ffh		;9cc0
; "6789:;"
	defb 036h		;9cc1  '6'
	defb 037h		;9cc2  '7'
	defb 038h		;9cc3  '8'
	defb 039h		;9cc4  '9'
	defb 03ah		;9cc5  ':'
	defb 03bh		;9cc6  ';'
	defb 0ffh		;9cc7
	defb 0ffh		;9cc8
	defb 0ffh		;9cc9
; "<=>?"
	defb 03ch		;9cca  '<'
	defb 03dh		;9ccb  '='
	defb 03eh		;9ccc  '>'
	defb 03fh		;9ccd  '?'
	defb 0ffh		;9cce
	defb 0ffh		;9ccf
	defb 040h		;9cd0  '@'
	defb 0ffh		;9cd1
	defb 041h		;9cd2  'A'
	defb 042h		;9cd3  'B'
l9cd4h:
	defb 0ffh		;9cd4
	defb 072h		;9cd5  'r'
	defb 0ffh		;9cd6
	defb 073h		;9cd7  's'
	defb 074h		;9cd8  't'
	defb 0ffh		;9cd9
; "uvwxy"
	defb 075h		;9cda  'u'
	defb 076h		;9cdb  'v'
	defb 077h		;9cdc  'w'
	defb 078h		;9cdd  'x'
	defb 079h		;9cde  'y'
	defb 0ffh		;9cdf
; "z{|}~"
	defb 07ah		;9ce0  'z'
	defb 07bh		;9ce1  '{'
	defb 07ch		;9ce2  '|'
	defb 07dh		;9ce3  '}'
	defb 07eh		;9ce4  '~'
	defb 0ffh		;9ce5
	defb 0ffh		;9ce6
	defb 0ffh		;9ce7
	defb 07fh		;9ce8
	defb 080h		;9ce9
	defb 081h		;9cea
	defb 0ffh		;9ceb
	defb 0ffh		;9cec
	defb 0ffh		;9ced
	defb 0ffh		;9cee
	defb 082h		;9cef
	defb 083h		;9cf0
	defb 0ffh		;9cf1
	defb 0ffh		;9cf2
	defb 0ffh		;9cf3
	defb 0ffh		;9cf4
	defb 084h		;9cf5
l9cf6h:
	defb 0ffh		;9cf6
	defb 0ffh		;9cf7
	defb 0ffh		;9cf8
	defb 0ffh		;9cf9
	defb 0ffh		;9cfa
	defb 0ffh		;9cfb
	defb 0ffh		;9cfc
	defb 0ffh		;9cfd
	defb 055h		;9cfe  'U'
	defb 011h		;9cff
	defb 0ffh		;9d00
	defb 0ffh		;9d01
	defb 0ffh		;9d02
	defb 0ffh		;9d03
	defb 056h		;9d04  'V'
	defb 057h		;9d05  'W'
	defb 0ffh		;9d06
	defb 0ffh		;9d07
	defb 0ffh		;9d08
	defb 0ffh		;9d09
	defb 058h		;9d0a  'X'
	defb 059h		;9d0b  'Y'
	defb 0ffh		;9d0c
	defb 0ffh		;9d0d
	defb 0ffh		;9d0e
	defb 0ffh		;9d0f
	defb 05ah		;9d10  'Z'
	defb 05bh		;9d11  '['
	defb 0ffh		;9d12
	defb 0ffh		;9d13
	defb 0ffh		;9d14
	defb 0ffh		;9d15
	defb 05ch		;9d16  '\'
	defb 05dh		;9d17  ']'
	defb 0ffh		;9d18
	defb 0ffh		;9d19
	defb 0ffh		;9d1a
	defb 0ffh		;9d1b
	defb 0ffh		;9d1c
	defb 05eh		;9d1d  '^'
l9d1eh:
	defb 0ffh		;9d1e
	defb 0ffh		;9d1f
	defb 0ffh		;9d20
	defb 0ffh		;9d21
	defb 0ffh		;9d22
	defb 0ffh		;9d23
	defb 0ffh		;9d24
	defb 05fh		;9d25  '_'
	defb 055h		;9d26  'U'
	defb 011h		;9d27
	defb 0ffh		;9d28
	defb 0ffh		;9d29
	defb 0ffh		;9d2a
	defb 060h		;9d2b  '`' (Spectrum: GBP)
	defb 056h		;9d2c  'V'
	defb 057h		;9d2d  'W'
	defb 0ffh		;9d2e
	defb 0ffh		;9d2f
	defb 0ffh		;9d30
	defb 0ffh		;9d31
	defb 061h		;9d32  'a'
	defb 059h		;9d33  'Y'
	defb 0ffh		;9d34
	defb 0ffh		;9d35
	defb 0ffh		;9d36
	defb 0ffh		;9d37
	defb 062h		;9d38  'b'
	defb 05bh		;9d39  '['
	defb 0ffh		;9d3a
	defb 0ffh		;9d3b
	defb 0ffh		;9d3c
	defb 0ffh		;9d3d
	defb 05ch		;9d3e  '\'
	defb 05dh		;9d3f  ']'
	defb 0ffh		;9d40
	defb 0ffh		;9d41
	defb 0ffh		;9d42
	defb 0ffh		;9d43
	defb 0ffh		;9d44
	defb 05eh		;9d45  '^'
l9d46h:
	defb 0ffh		;9d46
	defb 0ffh		;9d47
	defb 01bh		;9d48
	defb 01ch		;9d49
	defb 0ffh		;9d4a
	defb 0ffh		;9d4b
	defb 0ffh		;9d4c
	defb 0ffh		;9d4d
	defb 0ffh		;9d4e
	defb 0ffh		;9d4f
	defb 0ffh		;9d50
	defb 0ffh		;9d51
	defb 01dh		;9d52
	defb 01eh		;9d53
; "+,-."
	defb 02bh		;9d54  '+'
	defb 02ch		;9d55  ','
	defb 02dh		;9d56  '-'
	defb 02eh		;9d57  '.'
	defb 01fh		;9d58
	defb 0ffh		;9d59
	defb 0ffh		;9d5a
	defb 0ffh		;9d5b
; " hijpqmno"
	defb 020h		;9d5c  ' '
	defb 068h		;9d5d  'h'
	defb 069h		;9d5e  'i'
	defb 06ah		;9d5f  'j'
	defb 070h		;9d60  'p'
	defb 071h		;9d61  'q'
	defb 06dh		;9d62  'm'
	defb 06eh		;9d63  'n'
	defb 06fh		;9d64  'o'
	defb 0ffh		;9d65
	defb 0ffh		;9d66
; "!"#sruvw$"
	defb 021h		;9d67  '!'
	defb 022h		;9d68  '"'
	defb 023h		;9d69  '#'
	defb 073h		;9d6a  's'
	defb 072h		;9d6b  'r'
	defb 075h		;9d6c  'u'
	defb 076h		;9d6d  'v'
	defb 077h		;9d6e  'w'
	defb 024h		;9d6f  '$'
	defb 0ffh		;9d70
	defb 0ffh		;9d71
; "%&'BCD()*"
	defb 025h		;9d72  '%'
	defb 026h		;9d73  '&'
	defb 027h		;9d74  '''
	defb 042h		;9d75  'B'
	defb 043h		;9d76  'C'
	defb 044h		;9d77  'D'
	defb 028h		;9d78  '('
	defb 029h		;9d79  ')'
	defb 02ah		;9d7a  '*'
l9d7bh:
	defb 0ffh		;9d7b
	defb 0ffh		;9d7c
	defb 01bh		;9d7d
	defb 01ch		;9d7e
	defb 0ffh		;9d7f
	defb 0ffh		;9d80
	defb 0ffh		;9d81
	defb 0ffh		;9d82
	defb 0ffh		;9d83
	defb 0ffh		;9d84
	defb 0ffh		;9d85
	defb 0ffh		;9d86
	defb 01dh		;9d87
	defb 01eh		;9d88
	defb 0ffh		;9d89
	defb 0ffh		;9d8a
	defb 0ffh		;9d8b
	defb 0ffh		;9d8c
	defb 01fh		;9d8d
	defb 0ffh		;9d8e
	defb 0ffh		;9d8f
	defb 0ffh		;9d90
; " hijklmno"
	defb 020h		;9d91  ' '
	defb 068h		;9d92  'h'
	defb 069h		;9d93  'i'
	defb 06ah		;9d94  'j'
	defb 06bh		;9d95  'k'
	defb 06ch		;9d96  'l'
	defb 06dh		;9d97  'm'
	defb 06eh		;9d98  'n'
	defb 06fh		;9d99  'o'
	defb 0ffh		;9d9a
	defb 0ffh		;9d9b
; "!"#stuvw$"
	defb 021h		;9d9c  '!'
	defb 022h		;9d9d  '"'
	defb 023h		;9d9e  '#'
	defb 073h		;9d9f  's'
	defb 074h		;9da0  't'
	defb 075h		;9da1  'u'
	defb 076h		;9da2  'v'
	defb 077h		;9da3  'w'
	defb 024h		;9da4  '$'
	defb 0ffh		;9da5
	defb 0ffh		;9da6
; "%&'BCD()*"
	defb 025h		;9da7  '%'
	defb 026h		;9da8  '&'
	defb 027h		;9da9  '''
	defb 042h		;9daa  'B'
	defb 043h		;9dab  'C'
	defb 044h		;9dac  'D'
	defb 028h		;9dad  '('
	defb 029h		;9dae  ')'
	defb 02ah		;9daf  '*'
l9db0h:
	defb 0ffh		;9db0
	defb 0ffh		;9db1
	defb 0ffh		;9db2
	defb 0ffh		;9db3
; "EFGHIJ"
	defb 045h		;9db4  'E'
	defb 046h		;9db5  'F'
	defb 047h		;9db6  'G'
	defb 048h		;9db7  'H'
	defb 049h		;9db8  'I'
	defb 04ah		;9db9  'J'
	defb 0ffh		;9dba
; "KLMNOPQRS"
	defb 04bh		;9dbb  'K'
	defb 04ch		;9dbc  'L'
	defb 04dh		;9dbd  'M'
	defb 04eh		;9dbe  'N'
	defb 04fh		;9dbf  'O'
	defb 050h		;9dc0  'P'
	defb 051h		;9dc1  'Q'
	defb 052h		;9dc2  'R'
	defb 053h		;9dc3  'S'
	defb 0ffh		;9dc4
	defb 0ffh		;9dc5
; "TUVWXYZ[\]"
	defb 054h		;9dc6  'T'
	defb 055h		;9dc7  'U'
	defb 056h		;9dc8  'V'
	defb 057h		;9dc9  'W'
	defb 058h		;9dca  'X'
	defb 059h		;9dcb  'Y'
	defb 05ah		;9dcc  'Z'
	defb 05bh		;9dcd  '['
	defb 05ch		;9dce  '\'
	defb 05dh		;9dcf  ']'
	defb 0ffh		;9dd0
	defb 0ffh		;9dd1
	defb 0ffh		;9dd2
	defb 0ffh		;9dd3
	defb 05eh		;9dd4  '^'
	defb 05fh		;9dd5  '_'
	defb 0ffh		;9dd6
	defb 060h		;9dd7  '`' (Spectrum: GBP)
	defb 061h		;9dd8  'a'
	defb 0ffh		;9dd9
	defb 0ffh		;9dda
	defb 0ffh		;9ddb
	defb 0ffh		;9ddc
	defb 0ffh		;9ddd
	defb 0ffh		;9dde
	defb 0ffh		;9ddf
	defb 0ffh		;9de0
	defb 0bdh		;9de1
	defb 0beh		;9de2
	defb 0bfh		;9de3
	defb 0ffh		;9de4
	defb 0ffh		;9de5
	defb 0ffh		;9de6
	defb 0c0h		;9de7
	defb 0c1h		;9de8
	defb 0c2h		;9de9
	defb 0ffh		;9dea
	defb 0ffh		;9deb
	defb 0ffh		;9dec
	defb 0c3h		;9ded
	defb 0c4h		;9dee
	defb 0c5h		;9def
	defb 0ffh		;9df0
l9df1h:
	defb 0ffh		;9df1
	defb 0ffh		;9df2
	defb 0ffh		;9df3
	defb 0ffh		;9df4
	defb 0ffh		;9df5
	defb 0ffh		;9df6
	defb 0ffh		;9df7
	defb 0ffh		;9df8
	defb 0ffh		;9df9
	defb 0ffh		;9dfa
	defb 0ffh		;9dfb
	defb 0ffh		;9dfc
	defb 0ffh		;9dfd
	defb 0ffh		;9dfe
	defb 0ffh		;9dff
	defb 0ffh		;9e00
	defb 0ffh		;9e01
	defb 0ffh		;9e02
	defb 04fh		;9e03  'O'
	defb 050h		;9e04  'P'
	defb 051h		;9e05  'Q'
	defb 012h		;9e06
	defb 052h		;9e07  'R'
l9e08h:
	defb 053h		;9e08  'S'
	defb 002h		;9e09
	defb 016h		;9e0a
	defb 04ah		;9e0b  'J'
	defb 014h		;9e0c
	defb 002h		;9e0d
	defb 017h		;9e0e
l9e0fh:
	defb 0ffh		;9e0f
	defb 0ffh		;9e10
	defb 0ffh		;9e11
	defb 0ffh		;9e12
	defb 0ffh		;9e13
	defb 0ffh		;9e14
	defb 0ffh		;9e15
	defb 0ffh		;9e16
	defb 0ffh		;9e17
	defb 0ffh		;9e18
	defb 0ffh		;9e19
	defb 0ffh		;9e1a
	defb 0ffh		;9e1b
	defb 0ffh		;9e1c
	defb 0ffh		;9e1d
	defb 0ffh		;9e1e
	defb 0ffh		;9e1f
	defb 0ffh		;9e20
	defb 0ffh		;9e21
	defb 0ffh		;9e22
	defb 0ffh		;9e23
	defb 0ffh		;9e24
	defb 0ffh		;9e25
	defb 0ffh		;9e26
	defb 0ffh		;9e27
	defb 0ffh		;9e28
	defb 0ffh		;9e29
	defb 0ffh		;9e2a
	defb 0ffh		;9e2b
	defb 0ffh		;9e2c
	defb 0ffh		;9e2d
	defb 0ffh		;9e2e
	defb 086h		;9e2f
	defb 0ffh		;9e30
	defb 0ffh		;9e31
	defb 0ffh		;9e32
	defb 0ffh		;9e33
	defb 087h		;9e34
	defb 088h		;9e35
	defb 089h		;9e36
	defb 08ah		;9e37
	defb 0ffh		;9e38
l9e39h:
	defb 0d4h		;9e39
l9e3ah:
	defb 0d2h		;9e3a
l9e3bh:
	defb 0d2h		;9e3b
	defb 0d3h		;9e3c
	defb 0d3h		;9e3d
	defb 0d5h		;9e3e
l9e3fh:
	defb 000h		;9e3f
	defb 0f4h		;9e40
	defb 000h		;9e41
	defb 0f6h		;9e42
	defb 0f8h		;9e43
	defb 0f5h		;9e44
	defb 0fbh		;9e45
	defb 0fbh		;9e46
	defb 0fbh		;9e47
	defb 0fbh		;9e48
	defb 0fbh		;9e49
	defb 0fbh		;9e4a
l9e4bh:
	defb 081h		;9e4b
	defb 082h		;9e4c
	defb 082h		;9e4d
	defb 082h		;9e4e
	defb 082h		;9e4f
	defb 082h		;9e50
	defb 082h		;9e51
	defb 082h		;9e52
	defb 083h		;9e53
	defb 084h		;9e54
	defb 001h		;9e55
	defb 001h		;9e56
	defb 001h		;9e57
	defb 001h		;9e58
	defb 001h		;9e59
	defb 001h		;9e5a
	defb 001h		;9e5b
	defb 085h		;9e5c
	defb 084h		;9e5d
	defb 001h		;9e5e
	defb 001h		;9e5f
	defb 001h		;9e60
	defb 001h		;9e61
	defb 001h		;9e62
	defb 001h		;9e63
	defb 001h		;9e64
	defb 085h		;9e65
	defb 084h		;9e66
	defb 001h		;9e67
	defb 001h		;9e68
	defb 001h		;9e69
	defb 001h		;9e6a
	defb 001h		;9e6b
	defb 001h		;9e6c
	defb 001h		;9e6d
	defb 085h		;9e6e
	defb 084h		;9e6f
	defb 001h		;9e70
	defb 001h		;9e71
	defb 001h		;9e72
	defb 001h		;9e73
	defb 001h		;9e74
	defb 001h		;9e75
	defb 001h		;9e76
	defb 085h		;9e77
	defb 086h		;9e78
	defb 087h		;9e79
	defb 087h		;9e7a
	defb 087h		;9e7b
	defb 087h		;9e7c
	defb 087h		;9e7d
	defb 087h		;9e7e
	defb 087h		;9e7f
	defb 088h		;9e80
l9e81h:
	defb 089h		;9e81
	defb 08ah		;9e82
	defb 08ah		;9e83
	defb 08ah		;9e84
	defb 08ah		;9e85
	defb 08bh		;9e86
	defb 08ch		;9e87
	defb 0a1h		;9e88
	defb 0a2h		;9e89
	defb 0a1h		;9e8a
	defb 0a3h		;9e8b
	defb 08dh		;9e8c
	defb 08ch		;9e8d
	defb 0a3h		;9e8e
	defb 0a1h		;9e8f
	defb 0a2h		;9e90
	defb 0a2h		;9e91
	defb 08dh		;9e92
	defb 08ch		;9e93
	defb 0a1h		;9e94
	defb 0a2h		;9e95
	defb 0a1h		;9e96
	defb 0a2h		;9e97
	defb 08dh		;9e98
	defb 08eh		;9e99
	defb 08fh		;9e9a
	defb 08fh		;9e9b
	defb 08fh		;9e9c
	defb 08fh		;9e9d
	defb 090h		;9e9e
	defb 000h		;9e9f
	defb 091h		;9ea0
	defb 092h		;9ea1
	defb 093h		;9ea2
	defb 094h		;9ea3
	defb 000h		;9ea4
l9ea5h:
	defb 0a1h		;9ea5
	defb 0a1h		;9ea6
	defb 0a1h		;9ea7
	defb 0a1h		;9ea8
	defb 0a1h		;9ea9
	defb 0a1h		;9eaa
	defb 0a1h		;9eab
	defb 0a1h		;9eac
	defb 0a1h		;9ead
	defb 0a1h		;9eae
	defb 0a1h		;9eaf
	defb 0a1h		;9eb0
	defb 0a2h		;9eb1
	defb 0a2h		;9eb2
	defb 0a2h		;9eb3
	defb 0a2h		;9eb4
	defb 0a2h		;9eb5
	defb 0a2h		;9eb6
	defb 0a2h		;9eb7
	defb 0a2h		;9eb8
	defb 0a2h		;9eb9
	defb 0a2h		;9eba
	defb 0a2h		;9ebb
	defb 0a2h		;9ebc
	defb 0a3h		;9ebd
	defb 0a3h		;9ebe
	defb 0a3h		;9ebf
	defb 0a3h		;9ec0
	defb 0a3h		;9ec1
	defb 0a3h		;9ec2
	defb 0a3h		;9ec3
	defb 0a3h		;9ec4
	defb 0a3h		;9ec5
	defb 0a3h		;9ec6
	defb 0a3h		;9ec7
	defb 0a3h		;9ec8
	defb 0a1h		;9ec9
	defb 0a2h		;9eca
	defb 0a3h		;9ecb
	defb 0a3h		;9ecc
	defb 0a2h		;9ecd
	defb 0a3h		;9ece
	defb 0a1h		;9ecf
	defb 0a3h		;9ed0
	defb 0a1h		;9ed1
	defb 0a2h		;9ed2
	defb 0a1h		;9ed3
	defb 0a3h		;9ed4
l9ed5h:
	defb 095h		;9ed5
	defb 096h		;9ed6
	defb 097h		;9ed7
	defb 098h		;9ed8
	defb 099h		;9ed9
	defb 09ah		;9eda
	defb 09bh		;9edb
	defb 09ch		;9edc
	defb 09dh		;9edd
	defb 09eh		;9ede
	defb 09fh		;9edf
	defb 0a0h		;9ee0
l9ee1h:
	defb 0f8h		;9ee1
	defb 0f8h		;9ee2
	defb 0f8h		;9ee3
	defb 0d1h		;9ee4
	defb 0d1h		;9ee5
	defb 000h		;9ee6
l9ee7h:
	defb 0f8h		;9ee7
	defb 0f8h		;9ee8
	defb 0d0h		;9ee9
	defb 0f8h		;9eea
	defb 000h		;9eeb
	defb 0d0h		;9eec
l9eedh:
	defb 000h		;9eed
	defb 000h		;9eee
	defb 0ceh		;9eef
	defb 000h		;9ef0
	defb 0ceh		;9ef1
	defb 0cfh		;9ef2
	defb 0ceh		;9ef3
	defb 0cfh		;9ef4
	defb 0cfh		;9ef5
l9ef6h:
	defb 0cdh		;9ef6
	defb 000h		;9ef7
	defb 000h		;9ef8
	defb 0cfh		;9ef9
	defb 0cdh		;9efa
	defb 000h		;9efb
	defb 0cfh		;9efc
	defb 0cfh		;9efd
	defb 0cdh		;9efe
l9effh:
	defb 000h		;9eff
	defb 0f6h		;9f00
	defb 0f6h		;9f01
	defb 0f8h		;9f02
	defb 0f8h		;9f03
	defb 0f8h		;9f04
	defb 0f8h		;9f05
	defb 0f8h		;9f06
	defb 0f8h		;9f07
	defb 0f8h		;9f08
	defb 0d1h		;9f09
	defb 000h		;9f0a
l9f0bh:
	defb 0f5h		;9f0b
	defb 000h		;9f0c
	defb 0f8h		;9f0d
	defb 0f5h		;9f0e
	defb 0f8h		;9f0f
	defb 0f8h		;9f10
	defb 0f8h		;9f11
	defb 0f8h		;9f12
	defb 0f8h		;9f13
	defb 0f8h		;9f14
	defb 000h		;9f15
	defb 0d0h		;9f16
l9f17h:
	defb 001h		;9f17
	defb 01fh		;9f18
	defb 020h		;9f19  ' '
	defb 01eh		;9f1a
	defb 01eh		;9f1b
	defb 021h		;9f1c  '!'
	defb 01eh		;9f1d
	defb 01eh		;9f1e
	defb 01eh		;9f1f
	defb 01eh		;9f20
	defb 001h		;9f21
; ""#$$'()"
	defb 022h		;9f22  '"'
	defb 023h		;9f23  '#'
	defb 024h		;9f24  '$'
	defb 024h		;9f25  '$'
l9f26h:
	defb 027h		;9f26  '''
	defb 028h		;9f27  '('
	defb 029h		;9f28  ')'
	defb 01eh		;9f29
; "*+VWXWYZ\[\]Z\[\]Z^_`]Z\[\]Z\[\]Z\[\]abbbc.///01234516785"...
	defb 02ah		;9f2a  '*'
	defb 02bh		;9f2b  '+'
l9f2ch:
	defb 056h		;9f2c  'V'
	defb 057h		;9f2d  'W'
	defb 058h		;9f2e  'X'
	defb 057h		;9f2f  'W'
	defb 059h		;9f30  'Y'
	defb 05ah		;9f31  'Z'
	defb 05ch		;9f32  '\'
	defb 05bh		;9f33  '['
	defb 05ch		;9f34  '\'
	defb 05dh		;9f35  ']'
	defb 05ah		;9f36  'Z'
l9f37h:
	defb 05ch		;9f37  '\'
	defb 05bh		;9f38  '['
	defb 05ch		;9f39  '\'
	defb 05dh		;9f3a  ']'
	defb 05ah		;9f3b  'Z'
	defb 05eh		;9f3c  '^'
	defb 05fh		;9f3d  '_'
	defb 060h		;9f3e  '`' (Spectrum: GBP)
	defb 05dh		;9f3f  ']'
	defb 05ah		;9f40  'Z'
	defb 05ch		;9f41  '\'
	defb 05bh		;9f42  '['
	defb 05ch		;9f43  '\'
	defb 05dh		;9f44  ']'
	defb 05ah		;9f45  'Z'
	defb 05ch		;9f46  '\'
	defb 05bh		;9f47  '['
	defb 05ch		;9f48  '\'
	defb 05dh		;9f49  ']'
	defb 05ah		;9f4a  'Z'
	defb 05ch		;9f4b  '\'
	defb 05bh		;9f4c  '['
	defb 05ch		;9f4d  '\'
	defb 05dh		;9f4e  ']'
	defb 061h		;9f4f  'a'
	defb 062h		;9f50  'b'
	defb 062h		;9f51  'b'
	defb 062h		;9f52  'b'
	defb 063h		;9f53  'c'
l9f54h:
	defb 02eh		;9f54  '.'
	defb 02fh		;9f55  '/'
	defb 02fh		;9f56  '/'
	defb 02fh		;9f57  '/'
	defb 030h		;9f58  '0'
	defb 031h		;9f59  '1'
	defb 032h		;9f5a  '2'
	defb 033h		;9f5b  '3'
	defb 034h		;9f5c  '4'
	defb 035h		;9f5d  '5'
	defb 031h		;9f5e  '1'
	defb 036h		;9f5f  '6'
	defb 037h		;9f60  '7'
	defb 038h		;9f61  '8'
	defb 035h		;9f62  '5'
	defb 031h		;9f63  '1'
	defb 039h		;9f64  '9'
	defb 039h		;9f65  '9'
	defb 039h		;9f66  '9'
	defb 035h		;9f67  '5'
	defb 031h		;9f68  '1'
	defb 039h		;9f69  '9'
	defb 039h		;9f6a  '9'
	defb 03ah		;9f6b  ':'
	defb 035h		;9f6c  '5'
	defb 031h		;9f6d  '1'
	defb 039h		;9f6e  '9'
	defb 039h		;9f6f  '9'
	defb 039h		;9f70  '9'
	defb 035h		;9f71  '5'
	defb 031h		;9f72  '1'
	defb 039h		;9f73  '9'
	defb 039h		;9f74  '9'
	defb 039h		;9f75  '9'
	defb 035h		;9f76  '5'
	defb 031h		;9f77  '1'
	defb 039h		;9f78  '9'
	defb 039h		;9f79  '9'
	defb 039h		;9f7a  '9'
	defb 035h		;9f7b  '5'
l9f7ch:
	defb 03bh		;9f7c  ';'
	defb 040h		;9f7d  '@'
	defb 044h		;9f7e  'D'
	defb 042h		;9f7f  'B'
	defb 040h		;9f80  '@'
	defb 041h		;9f81  'A'
	defb 03fh		;9f82  '?'
	defb 03bh		;9f83  ';'
	defb 03ch		;9f84  '<'
	defb 03dh		;9f85  '='
	defb 03dh		;9f86  '='
	defb 03dh		;9f87  '='
	defb 03eh		;9f88  '>'
	defb 03fh		;9f89  '?'
	defb 03bh		;9f8a  ';'
	defb 043h		;9f8b  'C'
	defb 041h		;9f8c  'A'
	defb 045h		;9f8d  'E'
	defb 042h		;9f8e  'B'
	defb 044h		;9f8f  'D'
	defb 03fh		;9f90  '?'
	defb 03bh		;9f91  ';'
	defb 03ch		;9f92  '<'
	defb 03dh		;9f93  '='
	defb 03dh		;9f94  '='
	defb 03dh		;9f95  '='
	defb 03eh		;9f96  '>'
	defb 03fh		;9f97  '?'
	defb 03bh		;9f98  ';'
	defb 043h		;9f99  'C'
	defb 042h		;9f9a  'B'
	defb 040h		;9f9b  '@'
	defb 045h		;9f9c  'E'
	defb 042h		;9f9d  'B'
	defb 03fh		;9f9e  '?'
	defb 03bh		;9f9f  ';'
	defb 03ch		;9fa0  '<'
	defb 03dh		;9fa1  '='
	defb 03dh		;9fa2  '='
	defb 03dh		;9fa3  '='
	defb 03eh		;9fa4  '>'
	defb 03fh		;9fa5  '?'
	defb 03bh		;9fa6  ';'
	defb 045h		;9fa7  'E'
	defb 040h		;9fa8  '@'
	defb 044h		;9fa9  'D'
	defb 043h		;9faa  'C'
	defb 041h		;9fab  'A'
	defb 03fh		;9fac  '?'
	defb 03bh		;9fad  ';'
	defb 03ch		;9fae  '<'
	defb 03dh		;9faf  '='
	defb 03dh		;9fb0  '='
	defb 03dh		;9fb1  '='
	defb 03eh		;9fb2  '>'
	defb 03fh		;9fb3  '?'
	defb 03bh		;9fb4  ';'
	defb 000h		;9fb5
	defb 000h		;9fb6
	defb 000h		;9fb7
	defb 000h		;9fb8
	defb 000h		;9fb9
; "?LLLLLMMMMMNNNNNFGHIJKefghij"
	defb 03fh		;9fba  '?'
l9fbbh:
	defb 04ch		;9fbb  'L'
	defb 04ch		;9fbc  'L'
	defb 04ch		;9fbd  'L'
	defb 04ch		;9fbe  'L'
	defb 04ch		;9fbf  'L'
	defb 04dh		;9fc0  'M'
	defb 04dh		;9fc1  'M'
	defb 04dh		;9fc2  'M'
	defb 04dh		;9fc3  'M'
	defb 04dh		;9fc4  'M'
	defb 04eh		;9fc5  'N'
	defb 04eh		;9fc6  'N'
	defb 04eh		;9fc7  'N'
	defb 04eh		;9fc8  'N'
	defb 04eh		;9fc9  'N'
l9fcah:
	defb 046h		;9fca  'F'
	defb 047h		;9fcb  'G'
	defb 048h		;9fcc  'H'
	defb 049h		;9fcd  'I'
	defb 04ah		;9fce  'J'
	defb 04bh		;9fcf  'K'
l9fd0h:
	defb 065h		;9fd0  'e'
	defb 066h		;9fd1  'f'
	defb 067h		;9fd2  'g'
	defb 068h		;9fd3  'h'
	defb 069h		;9fd4  'i'
	defb 06ah		;9fd5  'j'
l9fd6h:
	defb 0adh		;9fd6
	defb 0aeh		;9fd7
	defb 0afh		;9fd8
	defb 0b0h		;9fd9
	defb 0b1h		;9fda
	defb 0b2h		;9fdb
	defb 0b3h		;9fdc
	defb 0b4h		;9fdd
	defb 0b5h		;9fde
	defb 0b6h		;9fdf
	defb 0b7h		;9fe0
	defb 0b8h		;9fe1
	defb 0b9h		;9fe2
	defb 0bah		;9fe3
	defb 0bbh		;9fe4
l9fe5h:
	defb 014h		;9fe5
	defb 015h		;9fe6
	defb 016h		;9fe7
	defb 017h		;9fe8
	defb 017h		;9fe9
	defb 017h		;9fea
	defb 017h		;9feb
	defb 017h		;9fec
	defb 017h		;9fed
	defb 017h		;9fee
	defb 017h		;9fef
	defb 017h		;9ff0
	defb 017h		;9ff1
	defb 017h		;9ff2
	defb 017h		;9ff3
l9ff4h:
; --- 8 zero bytes ---
	defb 000h		;9ff4
l9ff5h:
	defb 000h		;9ff5
	defb 000h		;9ff6
	defb 000h		;9ff7
l9ff8h:
	defb 000h		;9ff8
	defb 000h		;9ff9
l9ffah:
	defb 000h		;9ffa
l9ffbh:
	defb 000h		;9ffb
	defb 06bh		;9ffc  'k'
	defb 06ch		;9ffd  'l'
l9ffeh:
	defb 000h		;9ffe
	defb 000h		;9fff
; "mnoopqrstuvwrsxyvwz"
	defb 06dh		;a000  'm'
	defb 06eh		;a001  'n'
	defb 06fh		;a002  'o'
	defb 06fh		;a003  'o'
	defb 070h		;a004  'p'
	defb 071h		;a005  'q'
	defb 072h		;a006  'r'
	defb 073h		;a007  's'
	defb 074h		;a008  't'
	defb 075h		;a009  'u'
	defb 076h		;a00a  'v'
	defb 077h		;a00b  'w'
	defb 072h		;a00c  'r'
	defb 073h		;a00d  's'
	defb 078h		;a00e  'x'
	defb 079h		;a00f  'y'
	defb 076h		;a010  'v'
	defb 077h		;a011  'w'
	defb 07ah		;a012  'z'
	defb 000h		;a013
	defb 07bh		;a014  '{'
	defb 07ch		;a015  '|'
	defb 000h		;a016
	defb 07dh		;a017  '}'
la018h:
	defb 001h		;a018
	defb 002h		;a019
	defb 003h		;a01a
	defb 003h		;a01b
	defb 004h		;a01c
	defb 005h		;a01d
; "<<<="
	defb 03ch		;a01e  '<'
	defb 03ch		;a01f  '<'
	defb 03ch		;a020  '<'
	defb 03dh		;a021  '='
	defb 005h		;a022
; "<<<A>?@A"
	defb 03ch		;a023  '<'
	defb 03ch		;a024  '<'
	defb 03ch		;a025  '<'
	defb 041h		;a026  'A'
	defb 03eh		;a027  '>'
	defb 03fh		;a028  '?'
	defb 040h		;a029  '@'
	defb 041h		;a02a  'A'
	defb 0ffh		;a02b
la02ch:
; "bcdefgxyz{|}~"
	defb 062h		;a02c  'b'
	defb 063h		;a02d  'c'
	defb 064h		;a02e  'd'
	defb 065h		;a02f  'e'
	defb 066h		;a030  'f'
	defb 067h		;a031  'g'
la032h:
	defb 078h		;a032  'x'
	defb 079h		;a033  'y'
	defb 07ah		;a034  'z'
	defb 07bh		;a035  '{'
	defb 07ch		;a036  '|'
	defb 07dh		;a037  '}'
	defb 07eh		;a038  '~'
	defb 07fh		;a039
	defb 080h		;a03a
la03bh:
; "34444445677777786"
	defb 033h		;a03b  '3'
	defb 034h		;a03c  '4'
	defb 034h		;a03d  '4'
	defb 034h		;a03e  '4'
	defb 034h		;a03f  '4'
	defb 034h		;a040  '4'
	defb 034h		;a041  '4'
	defb 035h		;a042  '5'
	defb 036h		;a043  '6'
	defb 037h		;a044  '7'
	defb 037h		;a045  '7'
	defb 037h		;a046  '7'
	defb 037h		;a047  '7'
	defb 037h		;a048  '7'
	defb 037h		;a049  '7'
	defb 038h		;a04a  '8'
	defb 036h		;a04b  '6'
