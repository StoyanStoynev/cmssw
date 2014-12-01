#!/bin/bash
echo Absolute numbers are Bytes/Event 
echo
num=`./sumMatched_lastFileds.sh $1 $2`
denom=`./sumMatched_lastFileds.sh $3 $4`
echo $num / $denom =
echo "scale=4;$num/$denom" | bc 
