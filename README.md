# JQuantumAlgebra
World's tersest quantum algebra library

## Creating States
- K x creates state |x>, where x is a space-separated binary string
- K 1 0 1 will generate a 3-qubit system in state |5>
- B x operates in the same fashion to produce <x|
- KtoB produces a bra from a ket, KtoB: |x> -> <x|
- BtoK produces a ket from a bra

## Projectors and Combining States
- x mp y is the matrix product of x and y
- x tp y is the tensor product of x and y
- Kets can be tensored to produce states with more qubits, (K 0) tp (K 0) is equivalent to K 0 0
- A projection matrix can be produced with (K x) mp (B x)
- Likewise, the inner product can be taken with (B x) mp (K x)


