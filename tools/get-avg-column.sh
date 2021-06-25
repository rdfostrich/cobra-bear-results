#!/bin/bash
# Invoke like "./tools/get-avg-column.sh beara/query/cobra/_median_vm.csv 5"
input=$1
col=$2

awk -F"," "{x+=\$$col}END{print x/NR}" $1
