#!/bin/bash -l

module load htslib

awk 'BEGIN{OFS="\t"} {gsub(",", "\t", $0); print $1,$2,$3,$4":"$5"-"$6","$7"\n"$4,$5,$6,$1":"$2"-"$3","$7}' SN4741_pcHiC_combined_1_2_washU_text.txt | sort -k1,1 -k2,2n > SN4741_pcHiC_combined_1_2_washU_sorted

sbatch -A <allocation> \
        -p defq \
        -N 1 \
        -n 24 \
        --mem-per-cpu=10GB \
        -t 2:00:00 \
        -J "Running Chicago pipeline" \
        --mail-type=END \
        --mail-user=<email> \
	--wrap="bgzip SN4741_pcHiC_combined_1_2_washU_sorted && tabix -p bed SN4741_pcHiC_combined_1_2_washU_sorted.gz"
