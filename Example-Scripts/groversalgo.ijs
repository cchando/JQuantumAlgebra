q3 =: K 0 0 0 NB. Prepare 3-qubit in state |0>, our search domain will be [0,7]
   q3
1
0
0
0
0
0
0
0
   sq3 =: (HD 3) mp q3 NB. Apply Hadamard transform to the system
   sq3
0.353553
0.353553
0.353553
0.353553
0.353553
0.353553
0.353553
0.353553

   NB. We must model the behavior of a black box that can identify when an index w satisfies a search criterion
   NB. We are guaranteed a subroutine that maps |w> -> -|w>, |~w> -> |~w>
   Uw =: (ID 3) - (2*((K 1 0 1) mp (B 1 0 1))) N NB. We choose w = 5 and construct I - 2*|5><5|
   Uw
1 0 0 0 0  0 0 0
0 1 0 0 0  0 0 0
0 0 1 0 0  0 0 0
0 0 0 1 0  0 0 0
0 0 0 0 1  0 0 0
0 0 0 0 0 _1 0 0
0 0 0 0 0  0 1 0
0 0 0 0 0  0 0 1

   Us =: (2*(sq3 mp (KtoB sq3))) - (ID 3) NB. Prepare Grover diffusion operator 2*|s><s| - I
   Us
_0.75  0.25  0.25  0.25  0.25  0.25  0.25  0.25
 0.25 _0.75  0.25  0.25  0.25  0.25  0.25  0.25
 0.25  0.25 _0.75  0.25  0.25  0.25  0.25  0.25
 0.25  0.25  0.25 _0.75  0.25  0.25  0.25  0.25
 0.25  0.25  0.25  0.25 _0.75  0.25  0.25  0.25
 0.25  0.25  0.25  0.25  0.25 _0.75  0.25  0.25
 0.25  0.25  0.25  0.25  0.25  0.25 _0.75  0.25
 0.25  0.25  0.25  0.25  0.25  0.25  0.25 _0.75
 
   Ug =: Uw mp Us NB. Associativity lets us write the entire Grover iterate as such
   
   iter1 =: Ug mp sq3 NB. First round of Grover iterate
   iter1
 0.353553
 0.353553
 0.353553
 0.353553
 0.353553
_0.353553
 0.353553
 0.353553
 
   iter2 =: Ug mp iter1 NB. Second round, notice amplitude of |5> increasing
   iter2
 0.176777
 0.176777
 0.176777
 0.176777
 0.176777
_0.883883
 0.176777
 0.176777
 
   iter3 =: Ug mp iter2 NB. Third round, amplitude has reached its max for this period of Grover iterations
   iter3
_0.0883883
_0.0883883
_0.0883883
_0.0883883
_0.0883883
 _0.972272
_0.0883883
_0.0883883

   measure iter3 NB. We have ~94.5% chance of measuring 5
5
   measure iter3
5
   measure iter3
5
