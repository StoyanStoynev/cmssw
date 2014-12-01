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
#reco=`./sumMatched_lastFileds.sh $2 _RECO`
echo 
echo Total size : $all
#echo reco size : $reco
echo SIM size : $sim
echo HLT size : $hlt
echo 
echo "======" RECO size: $denom "======"
echo 
echo Differential sizes:
echo
printf "    ABSOLUTE SIZE \t <<--|-->> \t FRACTIONAL SIZE (from RECO)"
echo
for i in `cat $1`; 
do
# echo Size of $i [fraction of RECO]
 echo Branches containing $i : 
 num=`./sumMatched_RECO_lastFileds.sh $2 $i`
 if [ -z $num ]
 then
   num=0
 fi 
# denom=`./sumMatched_RECO_lastFileds.sh $2 .`
 export result=`echo "scale=4;$num/$denom" | bc`
# echo $num / $denom = $result
# echo "    " $num " <<--|-->> "  $result 
 printf "    %.1f \t <<--|-->> \t %.4f   \n"  $num $result 
# echo "scale=4;$num/$denom" | bc
# setenv result `echo "scale=4;$num/$denom" | bc`
# echo $result
# echo 
done
echo "    -----    "
