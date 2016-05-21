   q2 =: K 0 0
   q2
1
0
0
0
   sq2 =: ((HD 1) tp (ID 1)) mp q2
   sq2
0.707107
       0
0.707107
       0
   pauliX =: -.(ID 1)
   pauliX
0 1
1 0
   cNot =: cUgate pauliX
   cNot
1 0 0 0
0 1 0 0
0 0 0 1
0 0 1 0
   bell00 =: cNot mp sq2
   bell00
0.707107
       0
       0
0.707107
