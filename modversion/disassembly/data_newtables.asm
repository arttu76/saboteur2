; ======================================================================
; data_newtables.asm
; ======================================================================
;
; New Lookup Tables & Runtime Buffer
;
; Address range: $F80C-$FB0F (772 bytes)
; Source binary: mod_decompressed.bin (loaded at $620C)
;
; Lookup tables for new features (speed levels, beeper frequencies)
; followed by a 532-byte runtime buffer for timer/sound state.
;
; ======================================================================

gfx_end:

newtab_start:
	defb 008h		;f80c
	defb 0bfh		;f80d
	defb 00ch		;f80e
	defb 0bfh		;f80f
	defb 031h		;f810  '1'
	defb 0bfh		;f811
	defb 049h		;f812  'I'
	defb 0bfh		;f813
	defb 0a4h		;f814
	defb 0bfh		;f815
	defb 091h		;f816
	defb 0bfh		;f817
	defb 096h		;f818
	defb 0bfh		;f819
	defb 09fh		;f81a
	defb 0bfh		;f81b
	defb 029h		;f81c  ')'
	defb 0bfh		;f81d
	defb 0e0h		;f81e
	defb 0beh		;f81f
	defb 004h		;f820
	defb 0bch		;f821
	defb 003h		;f822
	defb 0bdh		;f823
	defb 089h		;f824
	defb 0bdh		;f825
	defb 063h		;f826  'c'
	defb 0bdh		;f827
	defb 0f6h		;f828
	defb 0bch		;f829
	defb 0feh		;f82a
	defb 0bch		;f82b
	defb 0c3h		;f82c
	defb 0bch		;f82d
	defb 0cbh		;f82e
	defb 0bch		;f82f
	defb 0d3h		;f830
	defb 0bch		;f831
	defb 0deh		;f832
	defb 0bch		;f833
	defb 0cah		;f834
	defb 0beh		;f835
	defb 0d1h		;f836
	defb 0beh		;f837
	defb 0eeh		;f838
	defb 0bch		;f839
	defb 02dh		;f83a  '-'
	defb 0bdh		;f83b
	defb 02dh		;f83c  '-'
	defb 0bfh		;f83d
	defb 023h		;f83e  '#'
	defb 0bdh		;f83f
	defb 0e6h		;f840
	defb 0bch		;f841
	defb 025h		;f842  '%'
	defb 0bfh		;f843
	defb 0bbh		;f844
	defb 0beh		;f845
	defb 0bfh		;f846
	defb 0beh		;f847
	defb 0c3h		;f848
	defb 0beh		;f849
	defb 034h		;f84a  '4'
	defb 0beh		;f84b
	defb 040h		;f84c  '@'
	defb 0beh		;f84d
	defb 0e7h		;f84e
	defb 0bdh		;f84f
	defb 05ch		;f850  '\'
	defb 0bch		;f851
	defb 07dh		;f852  '}'
	defb 0bch		;f853
	defb 050h		;f854  'P'
	defb 0bch		;f855
	defb 03ch		;f856  '<'
	defb 0bch		;f857
	defb 037h		;f858  '7'
	defb 0bch		;f859
	defb 032h		;f85a  '2'
	defb 0bch		;f85b
	defb 087h		;f85c
	defb 0bch		;f85d
	defb 01fh		;f85e
	defb 0bch		;f85f
	defb 0f7h		;f860
	defb 0bbh		;f861
	defb 0f2h		;f862
	defb 0bbh		;f863
	defb 0e7h		;f864
	defb 0bbh		;f865
	defb 0d3h		;f866
	defb 0bbh		;f867
	defb 0a1h		;f868
	defb 0beh		;f869
	defb 009h		;f86a
	defb 0bch		;f86b
	defb 00eh		;f86c
	defb 0bch		;f86d
	defb 013h		;f86e
	defb 0bch		;f86f
	defb 024h		;f870  '$'
	defb 0beh		;f871
	defb 01fh		;f872
	defb 0beh		;f873
	defb 0bbh		;f874
	defb 0bdh		;f875
	defb 0a6h		;f876
	defb 0beh		;f877
	defb 0ffh		;f878
	defb 0bbh		;f879
	defb 058h		;f87a  'X'
	defb 0bbh		;f87b
	defb 01ah		;f87c
	defb 0bch		;f87d
	defb 082h		;f87e
	defb 0bch		;f87f
	defb 015h		;f880
	defb 0beh		;f881
	defb 072h		;f882  'r'
	defb 0bch		;f883
	defb 068h		;f884  'h'
	defb 0bch		;f885
	defb 06dh		;f886  'm'
	defb 0bch		;f887
	defb 09bh		;f888
	defb 0bfh		;f889
	defb 004h		;f88a
	defb 0bfh		;f88b
	defb 04bh		;f88c  'K'
	defb 0beh		;f88d
	defb 06ch		;f88e  'l'
	defb 0beh		;f88f
	defb 05dh		;f890  ']'
	defb 0beh		;f891
	defb 087h		;f892
	defb 0beh		;f893
	defb 073h		;f894  's'
	defb 0beh		;f895
	defb 092h		;f896
	defb 0beh		;f897
	defb 097h		;f898
	defb 0beh		;f899
	defb 010h		;f89a
	defb 0beh		;f89b
	defb 029h		;f89c  ')'
	defb 0beh		;f89d
	defb 00bh		;f89e
	defb 0beh		;f89f
	defb 006h		;f8a0
	defb 0beh		;f8a1
	defb 001h		;f8a2
	defb 0beh		;f8a3
	defb 0fch		;f8a4
	defb 0bdh		;f8a5
	defb 0f7h		;f8a6
	defb 0bdh		;f8a7
	defb 0ceh		;f8a8
	defb 0bbh		;f8a9
	defb 053h		;f8aa  'S'
	defb 0bbh		;f8ab
	defb 0c9h		;f8ac
	defb 0bbh		;f8ad
	defb 084h		;f8ae
	defb 0bdh		;f8af
	defb 0c4h		;f8b0
	defb 0bbh		;f8b1
	defb 0bfh		;f8b2
	defb 0bbh		;f8b3
	defb 07fh		;f8b4
	defb 0bdh		;f8b5
	defb 0bah		;f8b6
	defb 0bbh		;f8b7
	defb 0b5h		;f8b8
	defb 0bbh		;f8b9
	defb 09ch		;f8ba
	defb 0beh		;f8bb
	defb 0b0h		;f8bc
	defb 0bbh		;f8bd
	defb 04eh		;f8be  'N'
	defb 0bbh		;f8bf
	defb 0abh		;f8c0
	defb 0bbh		;f8c1
	defb 0f2h		;f8c2
	defb 0bdh		;f8c3
	defb 092h		;f8c4
lf8c5h:
	defb 0bbh		;f8c5
	defb 097h		;f8c6
	defb 0bbh		;f8c7
	defb 08dh		;f8c8
	defb 0bbh		;f8c9
	defb 088h		;f8ca
	defb 0bbh		;f8cb
	defb 077h		;f8cc  'w'
	defb 0bbh		;f8cd
	defb 02dh		;f8ce  '-'
	defb 0bch		;f8cf
	defb 038h		;f8d0  '8'
	defb 0bdh		;f8d1
	defb 09fh		;f8d2
	defb 0bdh		;f8d3
	defb 0aah		;f8d4
	defb 0bdh		;f8d5
	defb 046h		;f8d6  'F'
	defb 0bch		;f8d7
	defb 0a6h		;f8d8
	defb 0bch		;f8d9
	defb 09eh		;f8da
	defb 0bch		;f8db
lf8dch:
	defb 000h		;f8dc
	defb 000h		;f8dd
lf8deh:
	defb 000h		;f8de
	defb 000h		;f8df
lf8e0h:
	defb 000h		;f8e0
lf8e1h:
	defb 000h		;f8e1
	defb 022h		;f8e2  '"'
	defb 09bh		;f8e3
	defb 068h		;f8e4  'h'
	defb 09bh		;f8e5
	defb 0a8h		;f8e6
	defb 09bh		;f8e7
	defb 0d9h		;f8e8
	defb 09dh		;f8e9
lf8eah:
; --- 17 zero bytes ---
	defb 000h		;f8ea
	defb 000h		;f8eb
lf8ech:
	defb 000h		;f8ec
lf8edh:
	defb 000h		;f8ed
	defb 000h		;f8ee
	defb 000h		;f8ef
lf8f0h:
	defb 000h		;f8f0
	defb 000h		;f8f1
lf8f2h:
	defb 000h		;f8f2
lf8f3h:
	defb 000h		;f8f3
lf8f4h:
	defb 000h		;f8f4
	defb 000h		;f8f5
lf8f6h:
	defb 000h		;f8f6
lf8f7h:
	defb 000h		;f8f7
lf8f8h:
	defb 000h		;f8f8
lf8f9h:
	defb 000h		;f8f9
lf8fah:
	defb 000h		;f8fa
lf8fbh:
	defb 001h		;f8fb
lf8fch:
; --- 390 zero bytes ---
	defb 000h		;f8fc
lf8fdh:
	defb 000h		;f8fd
lf8feh:
	defb 000h		;f8fe
	defb 000h		;f8ff
lf900h:
	defb 000h		;f900
lf901h:
	defb 000h		;f901
	defb 000h		;f902
	defb 000h		;f903
	defb 000h		;f904
	defb 000h		;f905
	defb 000h		;f906
	defb 000h		;f907
	defb 000h		;f908
	defb 000h		;f909
	defb 000h		;f90a
	defb 000h		;f90b
	defb 000h		;f90c
	defb 000h		;f90d
	defb 000h		;f90e
	defb 000h		;f90f
	defb 000h		;f910
	defb 000h		;f911
	defb 000h		;f912
	defb 000h		;f913
	defb 000h		;f914
	defb 000h		;f915
	defb 000h		;f916
	defb 000h		;f917
	defb 000h		;f918
	defb 000h		;f919
	defb 000h		;f91a
	defb 000h		;f91b
	defb 000h		;f91c
	defb 000h		;f91d
	defb 000h		;f91e
	defb 000h		;f91f
	defb 000h		;f920
	defb 000h		;f921
	defb 000h		;f922
	defb 000h		;f923
	defb 000h		;f924
	defb 000h		;f925
	defb 000h		;f926
	defb 000h		;f927
	defb 000h		;f928
	defb 000h		;f929
	defb 000h		;f92a
	defb 000h		;f92b
	defb 000h		;f92c
	defb 000h		;f92d
	defb 000h		;f92e
	defb 000h		;f92f
	defb 000h		;f930
	defb 000h		;f931
	defb 000h		;f932
	defb 000h		;f933
	defb 000h		;f934
	defb 000h		;f935
	defb 000h		;f936
	defb 000h		;f937
	defb 000h		;f938
	defb 000h		;f939
	defb 000h		;f93a
	defb 000h		;f93b
	defb 000h		;f93c
	defb 000h		;f93d
	defb 000h		;f93e
	defb 000h		;f93f
lf940h:
	defb 000h		;f940
	defb 000h		;f941
	defb 000h		;f942
	defb 000h		;f943
	defb 000h		;f944
	defb 000h		;f945
	defb 000h		;f946
	defb 000h		;f947
	defb 000h		;f948
	defb 000h		;f949
	defb 000h		;f94a
	defb 000h		;f94b
	defb 000h		;f94c
	defb 000h		;f94d
	defb 000h		;f94e
	defb 000h		;f94f
	defb 000h		;f950
	defb 000h		;f951
	defb 000h		;f952
	defb 000h		;f953
	defb 000h		;f954
	defb 000h		;f955
	defb 000h		;f956
	defb 000h		;f957
	defb 000h		;f958
	defb 000h		;f959
	defb 000h		;f95a
	defb 000h		;f95b
	defb 000h		;f95c
	defb 000h		;f95d
	defb 000h		;f95e
	defb 000h		;f95f
	defb 000h		;f960
	defb 000h		;f961
	defb 000h		;f962
	defb 000h		;f963
	defb 000h		;f964
	defb 000h		;f965
	defb 000h		;f966
	defb 000h		;f967
	defb 000h		;f968
	defb 000h		;f969
	defb 000h		;f96a
	defb 000h		;f96b
	defb 000h		;f96c
	defb 000h		;f96d
	defb 000h		;f96e
	defb 000h		;f96f
	defb 000h		;f970
	defb 000h		;f971
	defb 000h		;f972
	defb 000h		;f973
	defb 000h		;f974
	defb 000h		;f975
	defb 000h		;f976
	defb 000h		;f977
	defb 000h		;f978
	defb 000h		;f979
	defb 000h		;f97a
	defb 000h		;f97b
	defb 000h		;f97c
	defb 000h		;f97d
	defb 000h		;f97e
	defb 000h		;f97f
	defb 000h		;f980
	defb 000h		;f981
	defb 000h		;f982
	defb 000h		;f983
	defb 000h		;f984
	defb 000h		;f985
	defb 000h		;f986
	defb 000h		;f987
	defb 000h		;f988
	defb 000h		;f989
	defb 000h		;f98a
	defb 000h		;f98b
	defb 000h		;f98c
	defb 000h		;f98d
	defb 000h		;f98e
	defb 000h		;f98f
	defb 000h		;f990
	defb 000h		;f991
	defb 000h		;f992
	defb 000h		;f993
	defb 000h		;f994
	defb 000h		;f995
	defb 000h		;f996
	defb 000h		;f997
	defb 000h		;f998
	defb 000h		;f999
	defb 000h		;f99a
	defb 000h		;f99b
	defb 000h		;f99c
	defb 000h		;f99d
	defb 000h		;f99e
	defb 000h		;f99f
	defb 000h		;f9a0
	defb 000h		;f9a1
	defb 000h		;f9a2
	defb 000h		;f9a3
	defb 000h		;f9a4
	defb 000h		;f9a5
	defb 000h		;f9a6
	defb 000h		;f9a7
	defb 000h		;f9a8
	defb 000h		;f9a9
	defb 000h		;f9aa
	defb 000h		;f9ab
	defb 000h		;f9ac
	defb 000h		;f9ad
	defb 000h		;f9ae
	defb 000h		;f9af
	defb 000h		;f9b0
	defb 000h		;f9b1
	defb 000h		;f9b2
	defb 000h		;f9b3
	defb 000h		;f9b4
	defb 000h		;f9b5
	defb 000h		;f9b6
	defb 000h		;f9b7
	defb 000h		;f9b8
	defb 000h		;f9b9
	defb 000h		;f9ba
	defb 000h		;f9bb
	defb 000h		;f9bc
	defb 000h		;f9bd
	defb 000h		;f9be
	defb 000h		;f9bf
	defb 000h		;f9c0
	defb 000h		;f9c1
	defb 000h		;f9c2
	defb 000h		;f9c3
	defb 000h		;f9c4
	defb 000h		;f9c5
	defb 000h		;f9c6
	defb 000h		;f9c7
	defb 000h		;f9c8
	defb 000h		;f9c9
	defb 000h		;f9ca
	defb 000h		;f9cb
	defb 000h		;f9cc
	defb 000h		;f9cd
	defb 000h		;f9ce
	defb 000h		;f9cf
	defb 000h		;f9d0
	defb 000h		;f9d1
	defb 000h		;f9d2
	defb 000h		;f9d3
	defb 000h		;f9d4
	defb 000h		;f9d5
	defb 000h		;f9d6
	defb 000h		;f9d7
	defb 000h		;f9d8
	defb 000h		;f9d9
	defb 000h		;f9da
	defb 000h		;f9db
	defb 000h		;f9dc
	defb 000h		;f9dd
	defb 000h		;f9de
	defb 000h		;f9df
	defb 000h		;f9e0
	defb 000h		;f9e1
	defb 000h		;f9e2
	defb 000h		;f9e3
	defb 000h		;f9e4
	defb 000h		;f9e5
	defb 000h		;f9e6
	defb 000h		;f9e7
	defb 000h		;f9e8
	defb 000h		;f9e9
	defb 000h		;f9ea
	defb 000h		;f9eb
	defb 000h		;f9ec
	defb 000h		;f9ed
	defb 000h		;f9ee
	defb 000h		;f9ef
	defb 000h		;f9f0
	defb 000h		;f9f1
	defb 000h		;f9f2
	defb 000h		;f9f3
	defb 000h		;f9f4
	defb 000h		;f9f5
	defb 000h		;f9f6
	defb 000h		;f9f7
	defb 000h		;f9f8
	defb 000h		;f9f9
	defb 000h		;f9fa
	defb 000h		;f9fb
	defb 000h		;f9fc
	defb 000h		;f9fd
	defb 000h		;f9fe
	defb 000h		;f9ff
	defb 000h		;fa00
	defb 000h		;fa01
	defb 000h		;fa02
	defb 000h		;fa03
	defb 000h		;fa04
	defb 000h		;fa05
	defb 000h		;fa06
	defb 000h		;fa07
	defb 000h		;fa08
lfa09h:
	defb 000h		;fa09
	defb 000h		;fa0a
	defb 000h		;fa0b
	defb 000h		;fa0c
	defb 000h		;fa0d
	defb 000h		;fa0e
	defb 000h		;fa0f
	defb 000h		;fa10
	defb 000h		;fa11
	defb 000h		;fa12
	defb 000h		;fa13
	defb 000h		;fa14
	defb 000h		;fa15
	defb 000h		;fa16
	defb 000h		;fa17
	defb 000h		;fa18
	defb 000h		;fa19
	defb 000h		;fa1a
	defb 000h		;fa1b
	defb 000h		;fa1c
	defb 000h		;fa1d
	defb 000h		;fa1e
	defb 000h		;fa1f
	defb 000h		;fa20
	defb 000h		;fa21
	defb 000h		;fa22
	defb 000h		;fa23
	defb 000h		;fa24
	defb 000h		;fa25
	defb 000h		;fa26
	defb 000h		;fa27
	defb 000h		;fa28
	defb 000h		;fa29
	defb 000h		;fa2a
	defb 000h		;fa2b
	defb 000h		;fa2c
	defb 000h		;fa2d
	defb 000h		;fa2e
	defb 000h		;fa2f
	defb 000h		;fa30
	defb 000h		;fa31
	defb 000h		;fa32
	defb 000h		;fa33
	defb 000h		;fa34
	defb 000h		;fa35
	defb 000h		;fa36
	defb 000h		;fa37
	defb 000h		;fa38
	defb 000h		;fa39
	defb 000h		;fa3a
	defb 000h		;fa3b
	defb 000h		;fa3c
	defb 000h		;fa3d
	defb 000h		;fa3e
	defb 000h		;fa3f
	defb 000h		;fa40
	defb 000h		;fa41
	defb 000h		;fa42
	defb 000h		;fa43
	defb 000h		;fa44
	defb 000h		;fa45
	defb 000h		;fa46
	defb 000h		;fa47
	defb 000h		;fa48
	defb 000h		;fa49
	defb 000h		;fa4a
	defb 000h		;fa4b
	defb 000h		;fa4c
	defb 000h		;fa4d
	defb 000h		;fa4e
	defb 000h		;fa4f
	defb 000h		;fa50
	defb 000h		;fa51
	defb 000h		;fa52
	defb 000h		;fa53
	defb 000h		;fa54
	defb 000h		;fa55
	defb 000h		;fa56
	defb 000h		;fa57
	defb 000h		;fa58
	defb 000h		;fa59
	defb 000h		;fa5a
	defb 000h		;fa5b
	defb 000h		;fa5c
	defb 000h		;fa5d
	defb 000h		;fa5e
	defb 000h		;fa5f
	defb 000h		;fa60
	defb 000h		;fa61
	defb 000h		;fa62
	defb 000h		;fa63
	defb 000h		;fa64
	defb 000h		;fa65
	defb 000h		;fa66
	defb 000h		;fa67
	defb 000h		;fa68
	defb 000h		;fa69
	defb 000h		;fa6a
	defb 000h		;fa6b
	defb 000h		;fa6c
	defb 000h		;fa6d
	defb 000h		;fa6e
	defb 000h		;fa6f
	defb 000h		;fa70
	defb 000h		;fa71
	defb 000h		;fa72
	defb 000h		;fa73
	defb 000h		;fa74
	defb 000h		;fa75
	defb 000h		;fa76
	defb 000h		;fa77
	defb 000h		;fa78
	defb 000h		;fa79
	defb 000h		;fa7a
	defb 000h		;fa7b
	defb 000h		;fa7c
	defb 000h		;fa7d
	defb 000h		;fa7e
	defb 000h		;fa7f
	defb 000h		;fa80
	defb 000h		;fa81
sub_fa82h:
; --- 126 zero bytes ---
	defb 000h		;fa82
	defb 000h		;fa83
	defb 000h		;fa84
	defb 000h		;fa85
	defb 000h		;fa86
	defb 000h		;fa87
	defb 000h		;fa88
	defb 000h		;fa89
	defb 000h		;fa8a
	defb 000h		;fa8b
	defb 000h		;fa8c
	defb 000h		;fa8d
	defb 000h		;fa8e
	defb 000h		;fa8f
	defb 000h		;fa90
	defb 000h		;fa91
	defb 000h		;fa92
	defb 000h		;fa93
	defb 000h		;fa94
	defb 000h		;fa95
	defb 000h		;fa96
	defb 000h		;fa97
	defb 000h		;fa98
	defb 000h		;fa99
	defb 000h		;fa9a
	defb 000h		;fa9b
	defb 000h		;fa9c
	defb 000h		;fa9d
	defb 000h		;fa9e
	defb 000h		;fa9f
	defb 000h		;faa0
	defb 000h		;faa1
	defb 000h		;faa2
	defb 000h		;faa3
	defb 000h		;faa4
	defb 000h		;faa5
	defb 000h		;faa6
	defb 000h		;faa7
	defb 000h		;faa8
	defb 000h		;faa9
	defb 000h		;faaa
	defb 000h		;faab
	defb 000h		;faac
	defb 000h		;faad
	defb 000h		;faae
	defb 000h		;faaf
	defb 000h		;fab0
	defb 000h		;fab1
	defb 000h		;fab2
	defb 000h		;fab3
	defb 000h		;fab4
	defb 000h		;fab5
	defb 000h		;fab6
	defb 000h		;fab7
	defb 000h		;fab8
	defb 000h		;fab9
	defb 000h		;faba
	defb 000h		;fabb
	defb 000h		;fabc
	defb 000h		;fabd
	defb 000h		;fabe
	defb 000h		;fabf
	defb 000h		;fac0
	defb 000h		;fac1
	defb 000h		;fac2
	defb 000h		;fac3
	defb 000h		;fac4
	defb 000h		;fac5
	defb 000h		;fac6
	defb 000h		;fac7
	defb 000h		;fac8
	defb 000h		;fac9
	defb 000h		;faca
	defb 000h		;facb
	defb 000h		;facc
	defb 000h		;facd
	defb 000h		;face
	defb 000h		;facf
	defb 000h		;fad0
	defb 000h		;fad1
	defb 000h		;fad2
	defb 000h		;fad3
	defb 000h		;fad4
	defb 000h		;fad5
	defb 000h		;fad6
	defb 000h		;fad7
	defb 000h		;fad8
	defb 000h		;fad9
	defb 000h		;fada
	defb 000h		;fadb
	defb 000h		;fadc
	defb 000h		;fadd
	defb 000h		;fade
	defb 000h		;fadf
	defb 000h		;fae0
	defb 000h		;fae1
	defb 000h		;fae2
	defb 000h		;fae3
	defb 000h		;fae4
	defb 000h		;fae5
	defb 000h		;fae6
	defb 000h		;fae7
	defb 000h		;fae8
	defb 000h		;fae9
	defb 000h		;faea
	defb 000h		;faeb
	defb 000h		;faec
	defb 000h		;faed
	defb 000h		;faee
	defb 000h		;faef
	defb 000h		;faf0
	defb 000h		;faf1
	defb 000h		;faf2
	defb 000h		;faf3
	defb 000h		;faf4
	defb 000h		;faf5
	defb 000h		;faf6
	defb 000h		;faf7
	defb 000h		;faf8
	defb 000h		;faf9
	defb 000h		;fafa
	defb 000h		;fafb
	defb 000h		;fafc
	defb 000h		;fafd
	defb 000h		;fafe
	defb 000h		;faff
	defb 040h		;fb00  '@'
	defb 048h		;fb01  'H'
	defb 050h		;fb02  'P'
lfb03h:
	defb 000h		;fb03
lfb04h:
	defb 000h		;fb04
lfb05h:
	defb 000h		;fb05
lfb06h:
	defb 005h		;fb06
lfb07h:
	defb 000h		;fb07
	defb 000h		;fb08
lfb09h:
	defb 003h		;fb09
lfb0ah:
	defb 039h		;fb0a  '9'
	defb 039h		;fb0b  '9'
	defb 039h		;fb0c  '9'
lfb0dh:
	defb 001h		;fb0d
lfb0eh:
	defb 000h		;fb0e
lfb0fh:
	defb 000h		;fb0f
