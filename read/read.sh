#!/bin/sh
read -t 10 -p "please input two number:" a c b
if [ -n $c ]
 then
	echo "please input tow number"
	exit 1
fi
if [   -z "$a" ] || [  -z $b ]
then
	echo "please input tow number"
	exit 1
fi
expr 1 + $a &>/dev/null
A=$?
expr 1 + $b &>/dev/null
B=$?
if [ $A -ne 0 ] || [ $B -ne 0 ]
 then
	echo "please input int number"
	exit 1
else
	echo "a-b =$(($a-$b))"
	echo "a+b =$(($a+$b))"
	echo "a*b =$(($a*$b))"
	echo "a/b =$(($a/$b))"
	echo "a**b =$(($a**$b))"
	echo "a%b =$(($a%$b))"
	exit 0
fi
