 #!/bin/tcsh
echo Processing RelValMinBias_AOD.size ...
echo Absolute numbers are Bytes/Event>RelVal_compare_AODsizes.txt
echo AOD size in : >>RelVal_compare_AODsizes.txt
echo -------------- >>RelVal_compare_AODsizes.txt
echo -- RelValMinBias -- >>RelVal_compare_AODsizes.txt
../sumMatched_lastFileds.sh RelValMinBias_AOD.size AOD >> RelVal_compare_AODsizes.txt
echo -------------- >>RelVal_compare_AODsizes.txt
echo Processing RelValTTbar_AOD.size ...
echo -- RelValTTbar -- >>RelVal_compare_AODsizes.txt
../sumMatched_lastFileds.sh RelValTTbar_AOD.size AOD >> RelVal_compare_AODsizes.txt
echo -------------- >>RelVal_compare_AODsizes.txt
echo Processing RelValTTbar_PU50ns_AOD.size ...
echo -- RelValTTbar_PU50ns -- >>RelVal_compare_AODsizes.txt
../sumMatched_lastFileds.sh RelValTTbar_PU50ns_AOD.size AOD >> RelVal_compare_AODsizes.txt
echo -------------- >>RelVal_compare_AODsizes.txt
echo Processing RelValTTbar_PU25ns_AOD.size ...
echo -- RelValTTbar_PU25ns -- >>RelVal_compare_AODsizes.txt
../sumMatched_lastFileds.sh RelValTTbar_PU25ns_AOD.size AOD >> RelVal_compare_AODsizes.txt 
echo -------------- >>RelVal_compare_AODsizes.txt
echo Processing RelValZMM_AOD.size ...
echo -- RelValZMM -- >>RelVal_compare_AODsizes.txt
../sumMatched_lastFileds.sh RelValZMM_AOD.size AOD >> RelVal_compare_AODsizes.txt
echo -------------- >>RelVal_compare_AODsizes.txt
echo Processing RelValZMM_PU50ns_AOD.size ...
echo -- RelValZMM_PU50ns -- >>RelVal_compare_AODsizes.txt
../sumMatched_lastFileds.sh RelValZMM_PU50ns_AOD.size AOD >> RelVal_compare_AODsizes.txt
echo -------------- >>RelVal_compare_AODsizes.txt
echo Processing RelValZMM_PU25ns_AOD.size ...
echo -- RelValZMM_PU25ns -- >>RelVal_compare_AODsizes.txt
../sumMatched_lastFileds.sh RelValZMM_PU25ns_AOD.size AOD >> RelVal_compare_AODsizes.txt
echo -------------- >>RelVal_compare_AODsizes.txt
echo done
