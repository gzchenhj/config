#!/bin/bash
sum=0
i=0
while read line
do
	i=$(echo $line|awk '{print $10}')
	if expr $i + 0 &>/dev/null
	  then
	   ((sum=sum+i))
        fi
done <access_2010_12-8.log
echo $sum
