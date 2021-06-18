#!/bin/bash

echo "version,added,durationms,rate,accsize,durationmin,accsizegb" > polished-insertions.csv
cat insertion.csv | tr -d "\r" | sed -n "/[0-9]*,[0-9]*,[0-9]*,[0-9]*,[0-9]*$/p" | sed "s/^[^,]* \([0-9][0-9]*\),/\1,/" | awk -F, '{print $a","$3/1000/60","$5/1024/1024/1024}' | sort --field-separator=';' -n -k 1,1 >> polished-insertions.csv
