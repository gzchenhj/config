#!/bin/bash
read -t 15 -p "please input:" a b c

if [ -n "$c" ]
 then
	echo "error:please input tow number"
	exit 1
fi

if [ -z "$a" ] || [ -z "$b" ]
 then
	echo "please input tow number"
	exit 1
fi

expr $a + $b >/dev/null 2>&1
if [ $? -ne 0 ]
then
	echo "please input tow int"
	exit 1
else
	echo "a+b=$(($a+$b))"	
	echo "a-b=$(($a-$b))"	
	echo "a*b=$(($a*$b))"	
	echo "a**b=$(($a**$b))"	
	echo "a/b=$(($a/$b))"	
	echo "a%b=$(($a%$b))"	
fi





































































