NB. Demonstrate the construction of the 3-qubit quantum fourier transform circuit with elementary gates

   step1 =: (HD 1) tp (ID 1) tp (ID 1) NB. Hadamard gate on the first qubit
   
   k001 =: (K 0 0 1) NB. Initialize 3-qubit system to |0>|0>|1>
  
   step1 mp k001
       0
0.707107
       0
       0
       0
0.707107
       0
       0
       
   R2 =: PHASE 1r2p1 NB. Create rotation gates
   R4 =: PHASE 1r4p1
   
   step2 =: ((R2 tp ONE) + ((ID 1) tp ZERO)) tp (ID 1) Controlled-pi/2 gate on first qubit, controlled by second
   step2 mp step1 mp k001
       0
0.707107
       0
       0
       0
0.707107
       0
       0
       
   step3 =: (ID 1) tp (HD 1) tp (ID 1) NB. Hadamard gate on second qubit
   step3 mp step2 mp step1 mp k001
  0
0.5
  0
0.5
  0
0.5
  0
0.5

   step4 =: (R4 tp (ID 1) tp ONE) + ((ID 1) tp (ID 1) tp ZERO) NB. Controlled-pi/4 gate on first qubit, controlled by third
   step4 mp step3 mp step2 mp step1 mp k001
                0
              0.5
                0
              0.5
                0
0.353553j0.353553
                0
0.353553j0.353553

   step5 =: (ID 1) tp ((R2 tp ONE) + ((ID 1) tp ZERO)) NB. Controlled-pi/2 gate on second qubit, controlled by third
   step5 mp step4 mp step3 mp step2 mp step1 mp k001
                 0
               0.5
                 0
   3.06162e_17j0.5
                 0
 0.353553j0.353553
                 0
_0.353553j0.353553

   step6 =: (ID 1) tp (ID 1) tp (HD 1) NB. Hadamard gate on third qubit
   q001 =: step6 mp step5 mp step4 mp step3 mp step2 mp step1 mp k001
   q001
              0.353553
             _0.353553
  2.16489e_17j0.353553
_2.16489e_17j_0.353553
             0.25j0.25
           _0.25j_0.25
            _0.25j0.25
            0.25j_0.25
            
   NB. Now we need to swap the first and third qubit
   SWAP13 =: ((K 1) mp (B 0)) tp (ID 1) tp ((K 0) mp (B 1)) NB. Project |0> component of first qubit onto |1>, |1> component of third onto |0>
   SWAP13 =: SWAP13 + ((K 0) mp (B 1)) tp (ID 1) tp ((K 1) mp (B 0)) NB. |1> of first onto |0>, |0> of third onto |1>
   SWAP13 =: SWAP13 + (ZERO tp (ID 1) tp ZERO) NB. |00> will remain the same
   SWAP13 =: SWAP13 + (ONE tp (ID 1) tp ONE) NB. |11> will remain the same
   SWAP13
1 0 0 0 0 0 0 0
0 0 0 0 1 0 0 0
0 0 1 0 0 0 0 0
0 0 0 0 0 0 1 0
0 1 0 0 0 0 0 0
0 0 0 0 0 1 0 0
0 0 0 1 0 0 0 0
0 0 0 0 0 0 0 1

   SWAP13 mp q001
              0.353553
             0.25j0.25
  2.16489e_17j0.353553
            _0.25j0.25
             _0.353553
           _0.25j_0.25
_2.16489e_17j_0.353553
            0.25j_0.25
            
   (QFT 8) mp k001 NB. Check that this is correct
   0.353553
  0.25j0.25
 0j0.353553
 _0.25j0.25
  _0.353553
_0.25j_0.25
0j_0.353553
 0.25j_0.25
 
 NB. The swap is easier to see in detail view
   detailState SWAP13 mp q001
┌─┬─────┬──────────────────────┐
│0│0 0 0│              0.353553│
│1│0 0 1│             0.25j0.25│
│2│0 1 0│  2.16489e_17j0.353553│
│3│0 1 1│            _0.25j0.25│
│4│1 0 0│             _0.353553│
│5│1 0 1│           _0.25j_0.25│
│6│1 1 0│_2.16489e_17j_0.353553│
│7│1 1 1│            0.25j_0.25│
└─┴─────┴──────────────────────┘
   detailState q001
┌─┬─────┬──────────────────────┐
│0│0 0 0│              0.353553│
│1│0 0 1│             _0.353553│
│2│0 1 0│  2.16489e_17j0.353553│
│3│0 1 1│_2.16489e_17j_0.353553│
│4│1 0 0│             0.25j0.25│
│5│1 0 1│           _0.25j_0.25│
│6│1 1 0│            _0.25j0.25│
│7│1 1 1│            0.25j_0.25│
└─┴─────┴──────────────────────┘
