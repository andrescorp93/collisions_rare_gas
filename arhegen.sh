#!/bin/bash

rm -f arhe*.molpro
rm -f arhe*.pbs
for ((a=1; a<21; a++))
do	
	cat startarhe >> "arhe$a".molpro
	cat coordarhe | head -n$a | tail -n1 >> "arhe$a".molpro
	cat endarhe >> "arhe$a".molpro
	cat arhepbs >> "arhe$a".pbs
	echo "molpro -64 -n 8 $HOME/arhe$a.molpro" >> "arhe$a".pbs
	qsub "arhe$a".pbs
done

exit 0
