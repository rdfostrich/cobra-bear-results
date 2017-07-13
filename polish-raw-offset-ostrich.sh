#!/bin/bash

dir=$1
policies="versionmat deltamat version"

for policy in ${policies[@]}; do
    i=0
    queries=$(ls -d $dir/_raw/*.txt)
    for query in ${queries[@]}; do
        query=$(echo $query | sed 's/\/$//')

        file=$query/$policy-
        pol=$(echo $policy | sed "s/versionmat/vm/" | sed "s/deltamat/dm/" | sed "s/version/vq/")
        offsetdir=$(echo $query | sed 's/^.*_\([0-9]*\)\.txt$/\1/')
        mkdir -p $dir/$offsetdir
        out=$dir/$offsetdir/$pol.csv

        if [ "$policy" = "versionmat" ]; then
            echo "version,ms" > $out
            tail -n +2 $file* | gawk -F ',' '{print $1","$5/1000}' >> $out
        fi

        if [ "$policy" = "deltamat" ]; then
            echo "versionstart,versionend,ms" > $out
            tail -n +2 $file* | sed -n '/^0/p ' | gawk -F ',' '{print $1","$2","$6/1000}' >> $out
        fi

        if [ "$policy" = "version" ]; then
            echo "ms" > $out
            tail -n +2 $file* | gawk -F ',' '{print $4/1000}' >> $out
        fi

        let i++
    done
done
