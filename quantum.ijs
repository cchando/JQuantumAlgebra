ID =: =@(i.@(2&^)) NB. ID n produces an n-qubit identity matrix, ID 3 will produce an 8x8, ID 4 16x16, etc.

tp =: ,./^:2@:(*/) NB. Tensor product

mp =: +/ . * NB. Matrix product 

xor =: 2|+ NB. XOR/addition mod 2

ZERO =: (K 0) mp (B 0)

ONE =: (K 1) mp (B 1)

PHASE =: ZERO + ONE * (^@(0j1*]))

binarylist =: #:@(i.@#) NB. binarylist n produces a list of binary values for the interval [0,n-1]

K =: ((2^#@]),1:) $ #.@]=(i.@(2^#@])) NB. Ket, takes a space-separated binary string q1 q2 ... qn and produces state |q1>|q2>...|qn>

B =: (1:,(2^#@])) $ #.@]=(i.@(2^#@])) NB. Bra, operates similar to ket producing <q1|<q2|...<qn|

measure =: +/@(+/\@(*:@|@,)<?@0:) NB. Produces an integer value over domain of qubit system using probability amplitudes

QFT =: (%@%:@:])*(^@:((2p1*0j1)*(%@:]))^(i.@:] */ i.@:])) NB. Quantum Fourier transform, QFT n produces an nxn matrix

compBasis =: K"1 #:@(i.@(2^])) NB. Returns the computational basis states for a given number of qubits

basisDecomp =: (compBasisProjs 2&^.@#@]) mp ] NB. Decomposes a state into computational basis states

KtoB =: (1:,#)$, NB. |x> -> <x|

BtoK =: ((#@,),1:)$, NB. <x| -> |x>

compBasisProjs =: (compBasis ]) mp"2 (KtoB"2@(compBasis ])) NB. Returns the computational basis projectors for a given number of qubits

cUgate =: (((K 0) mp (B 0)) tp (ID 1)) + (((K 1) mp (B 1)) tp ]) NB. Creates a 2-qubit controlled gate where the argument is applied to the second qubit

trace =: +/^:2@(]*(ID@((2&^.)@#))) NB. Performs trace operation on a matrix

HD =: ([: % 2 ^ 2 %~ ])*_1^((#:@i.@((2&^)@:]))mp(|:@#:@i.@((2&^)@:]))) NB. HD n produces an n-qubit Hadamard matrix

permMat =: +/@((K"1@(#:@])) mp"2 (KtoB"2@(compBasis@(2^.#@])))) NB. Takes a permutation of a domain and produces a mappping

permOracle =: 1 : 'permMat ((2*((i.2^y),(i.2^y))) + ((u (i.2^y)),(-.(u (i.2^y)))))' NB. If f is a permutation, permOracle produces mapping

createOracle =: 1 : '+/ (compBasisProjs y) tp"2 (((-.(K"0(u (i.(2^y))))) mp (B 1)) + ((K"0(u (i.(2^y)))) mp (B 0)))' 

measureQubit =: 4 : 0 NB. x measureQubit y measures the x-th (zero-indexed) qubit of system y, this is the only verb I refuse to write tacitly
	binlist =. binarylist y
	qubitPos =. x {"1 binlist
	qubitProb =. (I. (-. qubitPos)) { y
	zeroProb =. +/ (*: | ,qubitProb)
	measurement =. -.((?0) <: zeroProb)
	if. measurement = 0
	do. (|:((-.qubitPos) % (%:zeroProb))) * y
	else. (|:(qubitPos % (%:(1-zeroProb)))) * y
	end.  
)
