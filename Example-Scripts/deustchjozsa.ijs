   q4 =: K 0 0 0 1 NB. Create a 4-qubit system, the last bit is the target so it is set to |1>
   q4
0
1
0
0
0
0
0
0
0
0
0
0
0
0
0
0
   sq4 =: (HD 4) mp q4 NB. Apply Hadamard transform to all qubits
   sq4
 0.25
_0.25
 0.25
_0.25
 0.25
_0.25
 0.25
_0.25
 0.25
_0.25
 0.25
_0.25
 0.25
_0.25
 0.25
_0.25

   NB. First we'll run the algorithm with a balanced function
   f =: (2&|) NB. This is the mod 2 function, which will output equal 0's and 1's on our domain [0,7]
   
   Ubal =: f createOracle 3 NB. createOracle generates the mapping |x>|y>->|x>|y xor f(x)>, 3 specifies the number of input qubits
   Ubal
1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0
0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0
0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0
0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0
0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0
0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0
0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1
0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0
   
   Ubalsq4 =: Ubal mp sq4 NB. Apply the oracle to the state
   Ubalsq4
 0.25
_0.25
_0.25
 0.25
 0.25
_0.25
_0.25
 0.25
 0.25
_0.25
_0.25
 0.25
 0.25
_0.25
_0.25
 0.25
   
   HUbal =: (HD 4) mp Ubalsq4 NB. Apply Hadamard transform to the new state
   HUbal
0
0
0
1
0
0
0
0
0
0
0
0
0
0
0
0
   measure HUbal NB. We can only measure 3 in this state
3
   HUbal =: ((HD 3) tp (ID 1)) mp Ubalsq4 NB. Demonstrating traditional formulation by "disregarding" the target qubit
   HUbal
           0
           0
    0.707107
   _0.707107
           0
           0
           0
           0
           0
           0
 2.77556e_17
_2.77556e_17
           0
           0
           0
           0

   measure HUbal NB. We can only measure 2 or 3 with 0.5 chance each, binary representations are 0 0 1 0 and 0 0 1 1 respectively
2
   measure HUbal
2
   measure HUbal NB. Therefore, in both outcomes we fail to observe the 3-qubit input in state |0>, this tells us f is balanced
3
   
   f =: (33&<:) NB. Greater than 33 function, easy to see this produces 0 over our 3-qubit domain
   f 3
0
   f 34
1
   
   Uconst =: f createOracle 3 NB. Here createOracle produces the identity matrix
   Uconst
1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0
0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0
0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0
0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0
0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0
0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0
0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1
   
   f =: (<:&33) NB. Less than 33 function produces 
   f 3
1
   f 34
0
   
   Uconst =: f createOracle 3 NB. Here createOracle produces the matrix (ID 3) tp pauliX
   Uconst
0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0
1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0
0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0
0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0
0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0
0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0
0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0
0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1
0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0
   
   Uconstsq4 =: Uconst mp sq4
   Uconstsq4
_0.25
 0.25
_0.25
 0.25
_0.25
 0.25
_0.25
 0.25
_0.25
 0.25
_0.25
 0.25
_0.25
 0.25
_0.25
 0.25
   
   HUconst =: (HD 4) mp Uconstsq4 
   HUconst NB. The only measurement for the 4-qubit system is |1>, therefore we must have state |0> in the 3-qubit input register
 0
_1
 0
 0
 0
 0
 0
 0
 0
 0
 0
 0
 0
 0
 0
 0
   
   HUconst =: ((HD 3) tp (ID 1)) mp Uconstsq4 NB. The case where we ignore the target qubit produces the same result
   HUconst NB. We measure either |1> or |0> for the entire system, but only |0> for the input, thus the function is constant
   _0.707107
    0.707107
           0
           0
           0
           0
           0
           0
_2.77556e_17
 2.77556e_17
           0
           0
           0
           0
           0
           0
