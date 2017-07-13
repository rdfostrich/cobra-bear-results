#!/bin/bash

dir=$1
category=$2
policies="mat diff ver"

for policy in ${policies[@]}; do
    i=0
    queries=$(cd $dir/_raw/ && ls *.txt)
    for query in ${queries[@]}; do
        file=$dir/_raw/$query
        pol=$(echo $policy | sed "s/ver/vq/" | sed "s/diff/dm/" | sed "s/mat/vm/")
        if [[ $file =~ .*$policy.* ]]; then
            querydir=$(echo $query | sed 's/^.*_\([0-9]*\)\.txt\.txt$/\1/')
            mkdir -p $dir/$querydir
            out=$dir/$querydir/$pol.csv
            

            if [ "$policy" = "mat" ]; then
                echo "version,ms" > $out
                tail -n +2 $file | gawk '{print $1","$3}' >> $out
            fi

            if [ "$policy" = "diff" ]; then
                echo "versionstart,versionend,ms" > $out
                tail -n +2 $file | awk 'NR>1{print l}{l=$0}' | gawk '{print "0,"$1","$3}' >> $out
            fi

            if [ "$policy" = "ver" ]; then
                echo "ms" > $out
                tail -n +2 $file | gawk -F ',' '{print $3}' >> $out
            fi

            let i++
        fi
    done
done
