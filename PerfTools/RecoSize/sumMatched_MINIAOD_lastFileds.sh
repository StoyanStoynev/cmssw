#!/bin/bash
grep _PAT $1|grep -v File |grep $2  |awk 'NF { print ( $(NF) ) }' | awk '$1 ~ /[0-9]/' | paste -sd+ | bc
