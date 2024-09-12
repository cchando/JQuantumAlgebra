ID =: [: =@i. 2&^     NB. ID n produces an n-qubit identity matrix; ID 3 will produce an 8x8, ID 4 16x16, etc.

tp =: [: ,./^:2 */    NB. Tensor product

mp =: +/ . *          NB. Matrix product 

xor =: 2|+      

'ZERO ONE'=: (K mp B)&.>0 1

phase =: ZERO + ONE * ^@j.

binarylist =: #:@i.@# NB. binarylist n produces a list of binary values for the interval [0,n-1]

K =: ] (,&1@] $ #. = i.) 2^#  NB. Ket, takes a space-separated binary string q1 q2 ... qn and produces state |q1>|q2>...|qn>

B =: ] (1&,@] $ #. = i.) 2^#  NB. Bra, operates similar to ket producing <q1|<q2|...<qn|

measure =: [: +/ +/\@:*:@|@, < ?@0  NB. Produces an integer value over domain of qubit system using probability amplitudes

QFT =: %@%: * */~@i. ^~ j.@2p1 ^@:* %  NB. Quantum Fourier transform, QFT n produces an nxn matrix

compBasis =: K"1 [: #:@i. 2&^  NB. Returns the computational basis states for a given number of qubits

basisDecomp =: (compBasisProjs 2^.#) mp ]  NB. Decomposes a state into computational basis states

KtoB =: ,$~1,#    NB. |x> -> <x|

BtoK =: ,$~#@,1:  NB. <x| -> |x>

compBasisProjs =: (] mp"2 KtoB"2)@(compBasis ])    NB. Returns the computational basis projectors for a given number of qubits

cUgate =: (ZERO tp ID@1) + ONE tp ]  NB. Creates a 2-qubit controlled gate where the argument is applied to the second qubit

trace =: [: +/^:2 ] * [: ID 2^.#  NB. Performs trace operation on a matrix

HD=: ([: % 2^2%~]) * _1 ^ ] mp&([: #:@i. 2&^@:]) |:  NB. HD n produces an n-qubit Hadamard matrix

permOracle =: {{permMat ((2*a),a) + (, -.) u a=.i.2^y}}  NB. adv; takes a permutation of a domain and produces a mappping

createOracle =: {{+/ compBasisProjs@y tp"2 -. +&((K"0 u i.2^y) mp B)/1 0}}  NB. adv; if f is a permutation, permOracle produces mapping

measureQubit=: {{ 
NB. x measureQubit y measures the x-th (zero-indexed) qubit of system y
zp=.+/*:|,qp=.I.-.x{"1#:i.#y)             NB. zeroProb; qubitPos
y * |: (qp"_ %: %:@-.@zp)`(-.@qp % %:@zp)@.(zp>:?0) y
}}

