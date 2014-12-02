#!/bin/bash
if [ "$1" == "-h" ] || [ "$1" == "--h" ] || [ "$1" == "-help" ]; then
  echo "Usage: printPFSizes.sh pfBranchesSelection.txt file.size"
  exit 0
fi
echo 
echo ------- FILE $2 -------
echo 
echo Absolute numbers are Bytes/Event 
echo
denom=`./sumMatched_RECO_lastFileds.sh $2 .`
denomPF=`./sumMatched_RECO_lastFileds.sh $2 PF`
echo "======" RECO size: $denom "======"
echo "======" Size of branches containing PF : $denomPF "======"
echo 
echo Differential sizes:
echo
printf "    ABSOLUTE SIZE\t<<--|-->>\tFRACTIONAL SIZE (from RECO)\t<<--|-->>\tFRACTIONAL SIZE (from PF)"
echo
export final_num=0
for i in `cat $1`; 
do
 echo Branches containing $i :
# echo Size of  $i [fraction of RECO]
 num=`./sumMatched_PF_RECO_lastFileds.sh $2 $i`
 if [ -z $num ]
 then
    num=0
 fi   
 export f_num=`echo "scale=4;$num/$denom" | bc`
 export f_numPF=`echo "scale=4;$num/$denomPF" | bc`
 final_num=`echo "scale=4;$final_num+$num" | bc`
 printf "    %.1f \t <<--|-->> \t %.4f \t <<--|-->> \t %.4f   \n"  $num $f_num $f_numPF
done
echo "    -----    "
export final_result=`echo "scale=4;$final_num/$denom" | bc`
export final_resultPF=`echo "scale=4;$final_num/$denomPF" | bc`
echo "     SUM:    "
printf "    %.1f \t <<--|-->> \t %.4f \t <<--|-->> \t %.4f  \n"  $final_num $final_result $final_resultPF
