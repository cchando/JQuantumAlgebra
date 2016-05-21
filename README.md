# JQuantumAlgebra

The most terse quantum algebra library that nobody asked for.

## Creating States
- K x creates state |x>, where x is a space-separated binary string
- K 1 0 1 will generate a 3-qubit system in state |5>
- B x operates in the same fashion to produce <x|
- KtoB produces a bra from a ket, KtoB: |x> -> <x|
- BtoK produces a ket from a bra
- States are displayed as a list of amplitudes
- measure k performs a measurement on |k> and displays an integer value

## Projectors and Combining States
- x mp y is the matrix product of x and y
- x tp y is the tensor product of x and y
- Kets can be tensored to produce states with more qubits, (K 0) tp (K 0) is equivalent to K 0 0
- A projection matrix can be produced with (K x) mp (B x)
- Likewise, the inner product can be taken with (B x) mp (K x)

## Operators
- ID x produces an identity matrix for an x-qubit system
- HD x produces a Hadamard matrix for an x-qubit system
- mp is used to interact operators with states, (HD 1) mp (K 0) performs the Hadamard transform on state |0>
- Operators representing circuits can be built through the tensor product
- For example, (HD 1) tp (ID 1) acts on a 2-qubit system: Hadamard transform on the first, no operation on the second

## More to come
- See PDFs for full documentation and examples of algorithms
- Working on implementation of partial measurement that fixes state
