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
n_denom=`./countMatched_RECO_lastFields.sh $2 .`
n_all=`./countMatched_lastFields.sh $2 .`
n_sim=`./countMatched_lastFields.sh $2 _SIM`
n_hlt=`./countMatched_lastFields.sh $2 _HLT`
export f_denom=`echo "scale=4;$denom/$all" | bc`
export f_sim=`echo "scale=4;$sim/$all" | bc`
export f_hlt=`echo "scale=4;$hlt/$all" | bc`
echo 
printf "Total size : %.1f \t Fraction : 1.0 \t N lines(branches) : %d \n" $all $n_all
printf "SIM size : %.1f \t  Fraction : %.4f \t N lines(branches) : %d \n" $sim $f_sim $n_sim
printf "HLT size : %.1f \t  Fraction : %.4f \t N lines(branches) : %d \n" $hlt $f_hlt $n_hlt
echo 
printf "====== RECO size : %.1f \t  Fraction : %.4f \t N lines(branches) : %d \n" $denom $f_denom $n_denom
echo 
echo Differential sizes:
echo
printf "    ABSOLUTE SIZE \t <<--|-->> \t FRACTIONAL SIZE (from RECO)  ::  N lines (branches)"
echo
export final_num=0
export n_final_num=0
for i in `cat $1`; 
do
 echo Branches containing $i : 
 num=`./sumMatched_RECO_lastFileds.sh $2 $i`
 n_num=`./countMatched_RECO_lastFields.sh $2 $i`
 if [ -z $num ]
 then
   num=0
   n_num=0
 fi 
 export result=`echo "scale=4;$num/$denom" | bc`
 final_num=`echo "scale=4;$final_num+$num" | bc`
 n_final_num=`echo "scale=4;$n_final_num+$n_num" | bc`
 printf "    %.1f \t <<--|-->> \t %.4f  ::  %d  \n"  $num $result $n_num
done
echo "    -----    "
export final_result=`echo "scale=4;$final_num/$denom" | bc`
echo "     SUM:    "
printf "    %.1f \t <<--|-->> \t %.4f  ::  %d \n"  $final_num $final_result $n_final_num
