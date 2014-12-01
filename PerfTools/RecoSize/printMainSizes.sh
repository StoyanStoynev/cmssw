#!/bin/bash
if [ "$1" == "-h" ] || [ "$1" == "--h" ] || [ "$1" == "-help" ]; then
  echo "Usage: printMainSizes.sh file.size"
  exit 0
fi
echo 
echo ------- FILE $1 -------
echo 
echo Absolute numbers are Bytes/Event 
echo 
reco=`./sumMatched_lastFileds.sh $1 RECO`
all=`./sumMatched_lastFileds.sh $1 .`
sim=`./sumMatched_lastFileds.sh $1 _SIM`
hlt=`./sumMatched_lastFileds.sh $1 _HLT`
export f_reco=`echo "scale=4;$reco/$all" | bc`
export f_sim=`echo "scale=4;$sim/$all" | bc`
export f_hlt=`echo "scale=4;$hlt/$all" | bc`

echo 
printf "Total size : %.1f \t Fraction : 1.0 \n" $all 
printf "SIM size : %.1f \t  Fraction : %.4f \n" $sim $f_sim
printf "HLT size : %.1f \t  Fraction : %.4f \n" $hlt $f_hlt
echo 
printf "======   RECO size: %.1f \t Fraction : %.4f   ====== \n" $reco $f_reco
echo
