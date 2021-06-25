#!/bin/bash
# Invoke like "./tools/get-avg-column.sh beara/query/cobra/_median_vm.csv 5"
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
type="_average_"

echo "|               | VM      | DM      | VQ     |"
echo "|---------------|:--------|:--------|:-------|"
echo "| **BEAR-A** | | |"
echo "| OSTRICH | " $($SCRIPT_DIR/get-avg-column.sh beara/query/ostrich/${type}vm.csv 7) " | " $($SCRIPT_DIR/get-avg-column.sh beara/query/ostrich/${type}dm.csv 8) " | " $($SCRIPT_DIR/get-avg-column.sh beara/query/ostrich/${type}vq.csv 6) " |"
echo "| COBRA | " $($SCRIPT_DIR/get-avg-column.sh beara/query/cobra/${type}vm.csv 5) " | " $($SCRIPT_DIR/get-avg-column.sh beara/query/cobra/${type}dm.csv 6) " | " $($SCRIPT_DIR/get-avg-column.sh beara/query/cobra/${type}vq.csv 4) " |"
echo "| HDT-IC | " $($SCRIPT_DIR/get-avg-column.sh beara/query/hdt-ic/${type}vm.csv 2) " | " $($SCRIPT_DIR/get-avg-column.sh beara/query/hdt-ic/${type}dm.csv 3) " | " $($SCRIPT_DIR/get-avg-column.sh beara/query/hdt-ic/${type}vq.csv 1) " |"
echo "| HDT-CB | " $($SCRIPT_DIR/get-avg-column.sh beara/query/hdt-cb/${type}vm.csv 2) " | " $($SCRIPT_DIR/get-avg-column.sh beara/query/hdt-cb/${type}dm.csv 3) " | " $($SCRIPT_DIR/get-avg-column.sh beara/query/hdt-cb/${type}vq.csv 1) " |"
