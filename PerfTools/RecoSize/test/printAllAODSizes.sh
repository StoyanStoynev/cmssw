 #!/bin/tcsh
echo Processing RelValMinBias_AOD.size ...
../printRECOSizes.sh recoBranchesSelection.txt RelValMinBias_AOD.size > RelValMinBias_AOD_AODsizes.txt
echo Processing RelValTTbar_AOD.size ...
../printRECOSizes.sh recoBranchesSelection.txt RelValTTbar_AOD.size > RelValTTbar_AOD_AODsizes.txt
echo Processing RelValTTbar_PU25ns_AOD.size ...
../printRECOSizes.sh recoBranchesSelection.txt RelValTTbar_PU25ns_AOD.size > RelValTTbar_PU25ns_AOD_AODsizes.txt
echo Processing RelValTTbar_PU50ns_AOD.size ...
../printRECOSizes.sh recoBranchesSelection.txt RelValTTbar_PU50ns_AOD.size > RelValTTbar_PU50ns_AOD_AODsizes.txt
echo Processing RelValZMM_AOD.size ...
../printRECOSizes.sh recoBranchesSelection.txt RelValZMM_AOD.size > RelValZMM_AOD_AODsizes.txt
echo Processing RelValZMM_PU25ns_AOD.size ...
../printRECOSizes.sh recoBranchesSelection.txt RelValZMM_PU25ns_AOD.size > RelValZMM_PU25ns_AOD_AODsizes.txt
echo Processing RelValZMM_PU50ns_AOD.size ...
../printRECOSizes.sh recoBranchesSelection.txt RelValZMM_PU50ns_AOD.size > RelValZMM_PU50ns_AOD_AODsizes.txt
echo done
