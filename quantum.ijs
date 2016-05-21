ID =: =@(i.@(2&^))
tp =: ,./^:2@:(*/)
mp =: +/ . *
xor =: 2|+
one =: 1 1$ 1
binarylist =: #:@(i.@#)
K =: ((2^#@]),1:) $ #.@]=(i.@(2^#@]))
B =: (1:,(2^#@])) $ #.@]=(i.@(2^#@]))
hada =: (% %: 2)*((],.]),(],.-@]))
measure =: +/@(+/\@(*:@|@,)<?@0:)
QFT =: (%@%:@:])*(^@:((2p1*0j1)*(%@:]))^(i.@:] */ i.@:]))
compbasis =: compbasis =: K"1 #:@(i.@(2^]))
KtoB =: (1:,#)$,
BtoK =: ((#@,),1:)$,
compbasisprojs =: (compbasis ]) mp"2 (KtoB"2@(compbasis ]))
cUgate =: (((K 0) mp (B 0)) tp (ID 1)) + (((K 1) mp (B 1)) tp ])
trace =: +/^:2@(]*(ID@((2&^.)@#)))
HD =: ([: % 2 ^ 2 %~ ])*_1^((#:@i.@((2&^)@:]))mp(|:@#:@i.@((2&^)@:])))
measureQ =: 4 : ' +/ (*:((I. -.(x {"1 binarylist y)) { y))'
permMat =: +/@((K"1@(#:@])) mp"2 (KtoB"2@(compbasis@(2^.#@]))))
permOracle =: 1 : 'permMat ((2*((i.2^y),(i.2^y))) + ((u (i.2^y)),(-.(u (i.2^y)))))'
createOracle =: 1 : '+/ (compbasisprojs y) tp"2 (((-.(K"0(u (i.(2^y))))) mp (B 1)) + ((K"0(u (i.(2^y)))) mp (B 0)))'