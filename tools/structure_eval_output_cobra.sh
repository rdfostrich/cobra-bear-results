#!/bin/bash

input=$1
output=$2

gcsplit $input '/---PATTERN START:.*/' {*} -f query- > /dev/null

for file in query-*; do
    if [ $(cat $file | wc -l) -gt 1 ]; then
        echo $file
        pattern=$(head -n 1 $file | sed 's/---PATTERN START: //' | sed 's/ /_/g' | sed 's/\.$//' | sed 's/\//\\/g')
        sed -i "" '1,1d' $file

        echo "patch,offset,limit,count-ms,lookup-mus,results" > "$output/versionmat-$pattern.csv"
        sed '/--- ---VERSION MATERIALIZED/,/--- ---DELTA MATERIALIZED/!d' $file | sed '1,1d; $d' | tail -n +2 | sort --field-separator=';' -n -k 1,1 >> "$output/versionmat-$pattern.csv"
        echo "patch_start,patch_end,offset,limit,count-ms,lookup-mus,results" > "$output/deltamat-$pattern.csv"
        sed '/--- ---DELTA MATERIALIZED/,/--- ---VERSION/!d' $file | sed '1,1d; $d' | grep "^0" >> "$output/deltamat-$pattern.csv"
        tail -n +2 $file | sed '/--- ---VERSION/,$!d' | sed '1,1d' > "$output/version-$pattern.csv"
    fi
    rm $file
done
