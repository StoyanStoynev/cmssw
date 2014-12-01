 #!/bin/tcsh
echo Processing RelValMinBias_RECO.size ...
echo Absolute numbers are Bytes/Event>RelVal_compare_RECOsizes.txt
echo RECO size in : >>RelVal_compare_RECOsizes.txt
echo -------------- >>RelVal_compare_RECOsizes.txt
echo -- RelValMinBias -- >>RelVal_compare_RECOsizes.txt
../sumMatched_lastFileds.sh RelValMinBias_RECO.size RECO >> RelVal_compare_RECOsizes.txt
echo -------------- >>RelVal_compare_RECOsizes.txt
echo Processing RelValTTbar_RECO.size ...
echo -- RelValTTbar -- >>RelVal_compare_RECOsizes.txt
../sumMatched_lastFileds.sh RelValTTbar_RECO.size RECO >> RelVal_compare_RECOsizes.txt
echo -------------- >>RelVal_compare_RECOsizes.txt
echo Processing RelValTTbar_PU50ns_RECO.size ...
echo -- RelValTTbar_PU50ns -- >>RelVal_compare_RECOsizes.txt
../sumMatched_lastFileds.sh RelValTTbar_PU50ns_RECO.size RECO >> RelVal_compare_RECOsizes.txt
echo -------------- >>RelVal_compare_RECOsizes.txt
echo Processing RelValTTbar_PU25ns_RECO.size ...
echo -- RelValTTbar_PU25ns -- >>RelVal_compare_RECOsizes.txt
../sumMatched_lastFileds.sh RelValTTbar_PU25ns_RECO.size RECO >> RelVal_compare_RECOsizes.txt 
echo -------------- >>RelVal_compare_RECOsizes.txt
echo Processing RelValZMM_RECO.size ...
echo -- RelValZMM -- >>RelVal_compare_RECOsizes.txt
../sumMatched_lastFileds.sh RelValZMM_RECO.size RECO >> RelVal_compare_RECOsizes.txt
echo -------------- >>RelVal_compare_RECOsizes.txt
echo Processing RelValZMM_PU50ns_RECO.size ...
echo -- RelValZMM_PU50ns -- >>RelVal_compare_RECOsizes.txt
../sumMatched_lastFileds.sh RelValZMM_PU50ns_RECO.size RECO >> RelVal_compare_RECOsizes.txt
echo -------------- >>RelVal_compare_RECOsizes.txt
echo Processing RelValZMM_PU25ns_RECO.size ...
echo -- RelValZMM_PU25ns -- >>RelVal_compare_RECOsizes.txt
../sumMatched_lastFileds.sh RelValZMM_PU25ns_RECO.size RECO >> RelVal_compare_RECOsizes.txt
echo -------------- >>RelVal_compare_RECOsizes.txt
echo done
