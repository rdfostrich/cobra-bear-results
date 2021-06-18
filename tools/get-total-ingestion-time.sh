#!/bin/bash
# Invoke like "./tools/get-total-ingestion-time.sh bearb-hourly/ingest/cobra.csv"
input=$1

awk -F"," '{print;x+=$3}END{print "Total time (min)" x/1000/60}' $1
