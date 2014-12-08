#!/bin/bash
grep _RECO $1|grep -v File |grep -i pf|grep $2  |awk 'NF { print ( $(NF) ) }' | awk '$1 ~ /[0-9]/' | wc -l
