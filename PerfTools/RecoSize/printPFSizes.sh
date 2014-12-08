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
denomPF=`./sumMatched_RECO_lastFileds.sh $2 "pf\|PF"`
n_denom=`./countMatched_RECO_lastFields.sh $2 .`
n_denomPF=`./countMatched_RECO_lastFields.sh $2 "pf\|PF"`
export f_denomPF=`echo "scale=4;$denomPF/$denom" | bc`
printf "====== RECO size : %.1f \t N lines(branches) : %d \n" $denom $n_denom
printf "====== Size of branches containing PF : %.1f \t  Fraction : %.4f \t N lines(branches) : %d \n" $denomPF $f_denomPF $n_denomPF
echo 
echo Differential sizes:
echo
printf "    ABSOLUTE SIZE\t<<--|-->>\tFRACTIONAL SIZE (from RECO)\t<<--|-->>\tFRACTIONAL SIZE (from PF)  ::  N lines (branches)"
echo
export final_num=0
export n_final_num=0
for i in `cat $1`; 
do
 echo Branches containing $i :
 num=`./sumMatched_PF_RECO_lastFileds.sh $2 $i`
 n_num=`./countMatched_PF_RECO_lastFields.sh $2 $i`
 if [ -z $num ]
 then
    num=0
    n_num=0
 fi   
 export f_num=`echo "scale=4;$num/$denom" | bc`
 export f_numPF=`echo "scale=4;$num/$denomPF" | bc`
 final_num=`echo "scale=4;$final_num+$num" | bc`
 n_final_num=`echo "scale=4;$n_final_num+$n_num" | bc`
 printf "    %.1f \t <<--|-->> \t %.4f \t <<--|-->> \t %.4f  ::  %d \n"  $num $f_num $f_numPF $n_num
done
echo "    -----    "
export final_result=`echo "scale=4;$final_num/$denom" | bc`
export final_resultPF=`echo "scale=4;$final_num/$denomPF" | bc`
echo "     SUM:    "
printf "    %.1f \t <<--|-->> \t %.4f \t <<--|-->> \t %.4f  ::  %d  \n"  $final_num $final_result $final_resultPF $n_final_num
