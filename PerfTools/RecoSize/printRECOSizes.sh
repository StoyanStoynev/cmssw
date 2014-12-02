#!/bin/bash 
if [ "$1" == "-h" ] || [ "$1" == "--h" ] || [ "$1" == "-help" ]; then
  echo "Usage: printRECOSizes.sh recoBranchesSelection.txt file.size"
  exit 0
fi
echo 
echo ------- FILE $2 -------
echo 
echo Absolute numbers are Bytes/Event 
echo 
denom=`./sumMatched_RECO_lastFileds.sh $2 .`
all=`./sumMatched_lastFileds.sh $2 .`
sim=`./sumMatched_lastFileds.sh $2 _SIM`
hlt=`./sumMatched_lastFileds.sh $2 _HLT`
echo 
echo Total size : $all
echo SIM size : $sim
echo HLT size : $hlt
echo 
echo "======" RECO size: $denom "======"
echo 
echo Differential sizes:
echo
printf "    ABSOLUTE SIZE \t <<--|-->> \t FRACTIONAL SIZE (from RECO)"
echo
export final_num=0
for i in `cat $1`; 
do
 echo Branches containing $i : 
 num=`./sumMatched_RECO_lastFileds.sh $2 $i`
 if [ -z $num ]
 then
   num=0
 fi 
 export result=`echo "scale=4;$num/$denom" | bc`
 final_num=`echo "scale=4;$final_num+$num" | bc`
 printf "    %.1f \t <<--|-->> \t %.4f   \n"  $num $result 
done
echo "    -----    "
export final_result=`echo "scale=4;$final_num/$denom" | bc`
echo "     SUM:    "
printf "    %.1f \t <<--|-->> \t %.4f   \n"  $final_num $final_result
