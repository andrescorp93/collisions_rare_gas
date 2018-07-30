#!/bin/bash

rm -f energies.out
rm -f states.out
for ((a=1; a<21; a++))
do	
	grep "R=" "arhe$a".out >> energies.out
	grep -A 57 "Eigenvalues of the spin-orbit matrix" "arhe$a".out >> energies.out
	grep "Cluster corrected energies            -2." "arhe$a".out | grep "Davidson, relaxed " >> energies.out
	grep -A 10000 "NUCLEAR CHARGE:                   20" "arhe$a".out | grep -A 1060 "(columnwise and corresponding to the eigenvalues in ascending order)" >> states.out
done

exit 0
