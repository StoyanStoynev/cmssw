#!/bin/bash
if [ "$1" == "-h" ] || [ "$1" == "--h" ] || [ "$1" == "-help" ]; then
  echo "Usage: printMINIAODSizes.sh patBranchesSelection.txt file_MINIAOD.size"
  exit 0
fi
echo 
echo ------- FILE $2 -------
echo
echo Absolute numbers are Bytes/Event 
echo
denom=`./sumMatched_MINIAOD_lastFileds.sh $2 .`
all=`./sumMatched_lastFileds.sh $2 .`
sim=`./sumMatched_lastFileds.sh $2 _SIM`
hlt=`./sumMatched_lastFileds.sh $2 _HLT`
echo 
echo Total size : $all
#echo reco size : $reco
echo SIM size : $sim
echo HLT size : $hlt
echo 
echo "======" PAT size: $denom "======"
echo 
echo Differential sizes:
echo
printf "    ABSOLUTE SIZE \t <<--|-->> \t FRACTIONAL SIZE (from PAT)"
echo
for i in `cat $1`; 
do
 echo Branches containing $i :
 num=`./sumMatched_MINIAOD_lastFileds.sh $2 $i`
 export result=`echo "scale=4;$num/$denom" | bc`
 printf "    %.1f \t <<--|-->> \t %.4f   \n"  $num $result
done
echo "    -----    "
