#!/bin/bash
# Execute like "tools/structure_all_output_cobra.sh bearb-daily/query/cobra/"

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

dir=$1
for file in $(ls $dir/_raw); do
    type=$(echo "$file" | sed "s/^\([^\.]*\)\..*$/\1/")
    mkdir $dir/$type
    $SCRIPT_DIR/structure_eval_output_cobra.sh $dir/_raw/$file $dir/$type
done
