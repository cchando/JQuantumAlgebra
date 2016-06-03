NB. Demonstrate Kitaev's quantum phase estimation algorithm with 3-qubit system
NB. Algorithm will estimate x for an operater U acting on an eigenstate with eigenvalue e^(2pi*i*x)

   U =: PHASE 1r2p1 NB. We use a pi/2 rotation gate in this example 
   U2 =: U^2 NB. Generate the U^2j gates 
   U4 =: U^4
   
   input =: (HD 3) mp (K 0 0 0) NB. Initialize system in superposition
   target =: K 1 NB. Target qubit is in eigenstate of U, |1>, with eigenvalue e^2pi*i*(1/4)...1/4 is hidden value to estimate 
   system =: input tp target
   
   c1 =: (ONE tp (ID 2) tp U4) + (ZERO tp (ID 3)) NB. U^4 gate controlled by first qubit
   c2 =: (ID 1) tp ((ONE tp (ID 1) tp U2) + (ZERO tp (ID 2))) NB. U^2 gate controlled by second qubit
   c3 =: (ID 2) tp ((ONE tp U) + (ZERO tp (ID 1))) NB. U gate controlled by third
   
   usystem =: c3 mp c2 mp c1 mp system NB. Apply gates
   detailState usystem
┌──┬───────┬──────────────────────┐
│ 0│0 0 0 0│                     0│
│ 1│0 0 0 1│              0.353553│
│ 2│0 0 1 0│                     0│
│ 3│0 0 1 1│  2.16489e_17j0.353553│
│ 4│0 1 0 0│                     0│
│ 5│0 1 0 1│ _0.353553j4.32978e_17│
│ 6│0 1 1 0│                     0│
│ 7│0 1 1 1│_6.49467e_17j_0.353553│
│ 8│1 0 0 0│                     0│
│ 9│1 0 0 1│ 0.353553j_8.65956e_17│
│10│1 0 1 0│                     0│
│11│1 0 1 1│  1.08245e_16j0.353553│
│12│1 1 0 0│                     0│
│13│1 1 0 1│ _0.353553j1.29893e_16│
│14│1 1 1 0│                     0│
│15│1 1 1 1│_1.51542e_16j_0.353553│
└──┴───────┴──────────────────────┘
   iqft =: (+ |: QFT 8) tp (ID 1) NB. Matrix will apply QFT to 3 input qubits, + |: is the Hermitian adjoint operator
   iusystem =: iqft mp usystem
   detailState iusystem
┌──┬───────┬─────────────────────────┐
│ 0│0 0 0 0│                        0│
│ 1│0 0 0 1│ _5.35783e_17j5.55112e_17│
│ 2│0 0 1 0│                        0│
│ 3│0 0 1 1│_1.52656e_16j_5.55112e_17│
│ 4│0 1 0 0│                        0│
│ 5│0 1 0 1│           1j_2.14313e_16│
│ 6│0 1 1 0│                        0│
│ 7│0 1 1 1│ _1.11022e_16j4.16334e_16│
│ 8│1 0 0 0│                        0│
│ 9│1 0 0 1│ _1.96222e_16j2.77556e_16│
│10│1 0 1 0│                        0│
│11│1 0 1 1│ _2.35922e_16j1.38778e_16│
│12│1 1 0 0│                        0│
│13│1 1 0 1│ _3.33067e_16j3.06162e_17│
│14│1 1 1 0│                        0│
│15│1 1 1 1│_4.16334e_16j_1.38778e_16│
└──┴───────┴─────────────────────────┘

NB. We have 100% probability of measuring 2 in the input register
NB. Do 2/2^n where n is the number of qubits in the input = 2/8 = 1/4...we've estimated the correct value
