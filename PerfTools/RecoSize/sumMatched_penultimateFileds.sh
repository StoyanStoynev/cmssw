#!/bin/bash
grep $2 $1|grep -v File |awk 'NF && NF-1 { print ( $(NF-1) ) }' | awk '$1 ~ /[0-9]/' | paste -sd+ | bc
