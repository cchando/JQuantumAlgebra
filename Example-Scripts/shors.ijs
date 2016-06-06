NB. Demonstrate Shor's algorithm with N=15 and a=13, still needs some work to make application of f(x) less janky
   
   f =: 15&|@(13&^) NB. f(x) = (13^x)mod15
   input =: (HD 4) mp K 0 0 0 0
   target =: K"1 #: f i.16 NB. Prepares list of states |f(x)> over input domain [0,15]
   
   basis =: basisDecomp input NB. Decomposes |input> into basis states a0|0>, a1|1>,...a(n-1)|n-1>
   system =: basis tp"2 target NB. Tensor input basis states with target register list to obtain list ax|x>|f(x)>
   system =: +/ system NB. Add the states together for a single state representation of the system 
   detailState system NB. We see only the periodic values of f(x) -- 1, 4, 7, 13 -- in the last 4 qubits

...
│191│1 0 1 1 1 1 1 1│   0│
│192│1 1 0 0 0 0 0 0│   0│
│193│1 1 0 0 0 0 0 1│0.25│
│194│1 1 0 0 0 0 1 0│   0│
│195│1 1 0 0 0 0 1 1│   0│
│196│1 1 0 0 0 1 0 0│   0│
│197│1 1 0 0 0 1 0 1│   0│
│198│1 1 0 0 0 1 1 0│   0│
│199│1 1 0 0 0 1 1 1│   0│
│200│1 1 0 0 1 0 0 0│   0│
│201│1 1 0 0 1 0 0 1│   0│
│202│1 1 0 0 1 0 1 0│   0│
│203│1 1 0 0 1 0 1 1│   0│
│204│1 1 0 0 1 1 0 0│   0│
│205│1 1 0 0 1 1 0 1│   0│
│206│1 1 0 0 1 1 1 0│   0│
│207│1 1 0 0 1 1 1 1│   0│
│208│1 1 0 1 0 0 0 0│   0│
│209│1 1 0 1 0 0 0 1│   0│
│210│1 1 0 1 0 0 1 0│   0│
│211│1 1 0 1 0 0 1 1│   0│
│212│1 1 0 1 0 1 0 0│   0│
│213│1 1 0 1 0 1 0 1│   0│
│214│1 1 0 1 0 1 1 0│   0│
│215│1 1 0 1 0 1 1 1│   0│
│216│1 1 0 1 1 0 0 0│   0│
│217│1 1 0 1 1 0 0 1│   0│
│218│1 1 0 1 1 0 1 0│   0│
│219│1 1 0 1 1 0 1 1│   0│
│220│1 1 0 1 1 1 0 0│   0│
│221│1 1 0 1 1 1 0 1│0.25│
│222│1 1 0 1 1 1 1 0│   0│
│223│1 1 0 1 1 1 1 1│   0│
│224│1 1 1 0 0 0 0 0│   0│
│225│1 1 1 0 0 0 0 1│   0│
│226│1 1 1 0 0 0 1 0│   0│
│227│1 1 1 0 0 0 1 1│   0│
│228│1 1 1 0 0 1 0 0│0.25│
│229│1 1 1 0 0 1 0 1│   0│
│230│1 1 1 0 0 1 1 0│   0│
│231│1 1 1 0 0 1 1 1│   0│
│232│1 1 1 0 1 0 0 0│   0│
│233│1 1 1 0 1 0 0 1│   0│
│234│1 1 1 0 1 0 1 0│   0│
│235│1 1 1 0 1 0 1 1│   0│
│236│1 1 1 0 1 1 0 0│   0│
│237│1 1 1 0 1 1 0 1│   0│
│238│1 1 1 0 1 1 1 0│   0│
│239│1 1 1 0 1 1 1 1│   0│
│240│1 1 1 1 0 0 0 0│   0│
│241│1 1 1 1 0 0 0 1│   0│
│242│1 1 1 1 0 0 1 0│   0│
│243│1 1 1 1 0 0 1 1│   0│
│244│1 1 1 1 0 1 0 0│   0│
│245│1 1 1 1 0 1 0 1│   0│
│246│1 1 1 1 0 1 1 0│   0│
│247│1 1 1 1 0 1 1 1│0.25│
│248│1 1 1 1 1 0 0 0│   0│
│249│1 1 1 1 1 0 0 1│   0│
│250│1 1 1 1 1 0 1 0│   0│
│251│1 1 1 1 1 0 1 1│   0│
│252│1 1 1 1 1 1 0 0│   0│
│253│1 1 1 1 1 1 0 1│   0│
│254│1 1 1 1 1 1 1 0│   0│
│255│1 1 1 1 1 1 1 1│   0│
└───┴───────────────┴────┘
   msystem =: 7 measureQubit system NB. Need 4 single-qubit measurements to measure the target register completely
   msystem =: 6 measureQubit msystem
   msystem =: 5 measureQubit msystem
   msystem =: 4 measureQubit msystem
   detailState msystem
   ...
│219│1 1 0 1 1 0 1 1│  0│
│220│1 1 0 1 1 1 0 0│  0│
│221│1 1 0 1 1 1 0 1│0.5│ NB. We've measured |13> 
│222│1 1 0 1 1 1 1 0│  0│
│223│1 1 0 1 1 1 1 1│  0│
│224│1 1 1 0 0 0 0 0│  0│
│225│1 1 1 0 0 0 0 1│  0│
│226│1 1 1 0 0 0 1 0│  0│
│227│1 1 1 0 0 0 1 1│  0│
│228│1 1 1 0 0 1 0 0│  0│
│229│1 1 1 0 0 1 0 1│  0│
│230│1 1 1 0 0 1 1 0│  0│
│231│1 1 1 0 0 1 1 1│  0│
│232│1 1 1 0 1 0 0 0│  0│
│233│1 1 1 0 1 0 0 1│  0│
│234│1 1 1 0 1 0 1 0│  0│
│235│1 1 1 0 1 0 1 1│  0│
│236│1 1 1 0 1 1 0 0│  0│
│237│1 1 1 0 1 1 0 1│  0│
│238│1 1 1 0 1 1 1 0│  0│
│239│1 1 1 0 1 1 1 1│  0│
│240│1 1 1 1 0 0 0 0│  0│
│241│1 1 1 1 0 0 0 1│  0│
│242│1 1 1 1 0 0 1 0│  0│
│243│1 1 1 1 0 0 1 1│  0│
│244│1 1 1 1 0 1 0 0│  0│
│245│1 1 1 1 0 1 0 1│  0│
│246│1 1 1 1 0 1 1 0│  0│
│247│1 1 1 1 0 1 1 1│  0│
│248│1 1 1 1 1 0 0 0│  0│
│249│1 1 1 1 1 0 0 1│  0│
│250│1 1 1 1 1 0 1 0│  0│
│251│1 1 1 1 1 0 1 1│  0│
│252│1 1 1 1 1 1 0 0│  0│
│253│1 1 1 1 1 1 0 1│  0│
│254│1 1 1 1 1 1 1 0│  0│
│255│1 1 1 1 1 1 1 1│  0│
└───┴───────────────┴───┘

   iqft =: (+ |: QFT 16) tp (ID 4) NB. Apply inverse quantum Fourier transform to input register
   imsystem =: iqft mp msystem
   I. (0.0001 < | ,imsystem) NB. The I. verb selects indices satisfying a boolean criterion
13 77 141 205
   ((I. (0.0001 < | ,imsystem)) - 13) % 16 NB. Simple bit arithmetic gives us the superposed states of the input register
0 4 8 12

   15|((13^6) - 1) NB. (a^(r/2) - 1)(a^(r/2) + 1) = 0  (mod 15), we use this equation and see 3 is a factor
3
   15|((13^4) - 1) NB. Algorithm fails on measurement of |4>, and always on |0>
0
   15|((13^2) - 1) NB. We obtain 3 as a factor here as well, (a^(r/2) + 1)mod15 must be 5...we have factored 15 completely
3
   
