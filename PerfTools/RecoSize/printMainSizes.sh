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
n_reco=`./countMatched_lastFields.sh $1 RECO`
n_all=`./countMatched_lastFields.sh $1 .`
n_sim=`./countMatched_lastFields.sh $1 _SIM`
n_hlt=`./countMatched_lastFields.sh $1 _HLT`
export f_reco=`echo "scale=4;$reco/$all" | bc`
export f_sim=`echo "scale=4;$sim/$all" | bc`
export f_hlt=`echo "scale=4;$hlt/$all" | bc`
echo 
printf "Total size : %.1f \t Fraction : 1.0 \t N lines(branches) : %d \n" $all $n_all
printf "SIM size : %.1f \t  Fraction : %.4f \t N lines(branches) : %d \n" $sim $f_sim $n_sim
printf "HLT size : %.1f \t  Fraction : %.4f \t N lines(branches) : %d \n" $hlt $f_hlt $n_hlt
echo 
printf "======   RECO size: %.1f \t Fraction : %.4f \t N lines(branches) : %d   ====== \n" $reco $f_reco $n_reco
echo
