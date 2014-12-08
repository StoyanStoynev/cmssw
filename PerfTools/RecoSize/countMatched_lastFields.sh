#!/bin/bash
grep $2 $1|grep -v File |awk 'NF { print ( $(NF) ) }' | awk '$1 ~ /[0-9]/' | wc -l
