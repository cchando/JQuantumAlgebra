 q2 =: K 0 0 NB. Prepare 2-qubit state |0>|0>
   q2
1
0
0
0

   sq2 =: ((HD 1) tp (ID 1)) mp q2 NB. Apply Hadamard transform to first qubit
   sq2
0.707107
       0
0.707107
       0
       
   pauliX =: -.(ID 1) NB. Create Pauli X gate by performing NOT operation on 1-qubit identity matrix
   pauliX
0 1
1 0

   cNot =: cUgate pauliX NB. cUgate creates a 2-qubit controlled gate where the argument is applied to the second qubit
   cNot
1 0 0 0
0 1 0 0
0 0 0 1
0 0 1 0

   bell00 =: cNot mp sq2 NB. Applying the controlled-NOT gate to our superposed state produces an entangled pair, Bell State 0
   bell00
0.707107
       0
       0
0.707107
