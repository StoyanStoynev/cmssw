 #!/bin/tcsh
echo Absolute numbers are Bytes/Event>RelVal_compare_MINIAODsizes.txt
echo PAT size in : >>RelVal_compare_MINIAODsizes.txt
echo -------------- >>RelVal_compare_MINIAODsizes.txt
echo -- RelValMinBias -- >>RelVal_compare_MINIAODsizes.txt
echo Processing RelValTTbar_PU50ns_MINIAOD.size ...
echo -- RelValTTbar_PU50ns -- >>RelVal_compare_MINIAODsizes.txt
../sumMatched_lastFileds.sh RelValTTbar_PU50ns_MINIAOD.size PAT >> RelVal_compare_MINIAODsizes.txt
echo -------------- >>RelVal_compare_MINIAODsizes.txt
echo Processing RelValTTbar_PU25ns_MINIAOD.size ...
echo -- RelValTTbar_PU25ns -- >>RelVal_compare_MINIAODsizes.txt
../sumMatched_lastFileds.sh RelValTTbar_PU25ns_MINIAOD.size PAT >> RelVal_compare_MINIAODsizes.txt 
echo -------------- >>RelVal_compare_MINIAODsizes.txt
echo Processing RelValZMM_PU50ns_MINIAOD.size ...
echo -- RelValZMM_PU50ns -- >>RelVal_compare_MINIAODsizes.txt
../sumMatched_lastFileds.sh RelValZMM_PU50ns_MINIAOD.size PAT >> RelVal_compare_MINIAODsizes.txt
echo -------------- >>RelVal_compare_MINIAODsizes.txt
echo Processing RelValZMM_PU25ns_MINIAOD.size ...
echo -- RelValZMM_PU25ns -- >>RelVal_compare_MINIAODsizes.txt
../sumMatched_lastFileds.sh RelValZMM_PU25ns_MINIAOD.size PAT >> RelVal_compare_MINIAODsizes.txt
echo -------------- >>RelVal_compare_MINIAODsizes.txt
echo done
