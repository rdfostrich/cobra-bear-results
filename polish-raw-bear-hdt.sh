#!/bin/bash

dir=$1
category=$2
policies="mat diff ver"
#queries="o-high o-low p-high p-low po-high po-low s-high s-low so-low sp-high sp-low spo"
queries="p po"
declare -a files
#files=(o-queries-highCardinality o-queries-lowCardinality p-queries-highCardinality p-queries-lowCardinality po-queries-highCardinality po-queries-lowCardinality s-queries-highCardinality s-queries-lowCardinality so-queries-lowCardinality sp-queries-highCardinality sp-queries-lowCardinality spo-queries)
files=(p po)

for policy in ${policies[@]}; do
    i=0
    for query in ${queries[@]}; do
        file=$dir/_raw/time-hdt-$category-$policy-${files[$i]}.txt.txt
        pol=$(echo $policy | sed "s/ver/vq/" | sed "s/diff/dm/" | sed "s/mat/vm/")
        out=$dir/$query/$pol.csv

        if [ "$policy" = "mat" ]; then
            echo "version,ms" > $out
            tail -n +2 $file | gawk -F ',' '{print $1","$2}' >> $out
        fi

        if [ "$policy" = "diff" ]; then
            echo "versionstart,versionend,ms" > $out
            tail -n +2 $file | gawk -F ',' '{print "0,"$1","$2}' >> $out
        fi

        if [ "$policy" = "ver" ]; then
            echo "ms" > $out
            tail -n +2 $file | gawk -F ',' '{print $2}' >> $out
        fi

        let i++
    done
done
