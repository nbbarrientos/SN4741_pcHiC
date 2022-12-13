#!/bin/bash -l

bam_dir="<path to bam files>"
chicago="<path to chicagoTools>"
design_dir="<path to designDir>"

module load bedtools/2.30

sbatch -A <allocation> \
        -p defq \
        -N 1 \
        -n 24 \
        --mem-per-cpu=100GB \
        -t 72:00:00 \
        -J "Running bam2chicago_V02.sh" \
        --mail-type=END \
        --mail-user=<email> \
        --wrap="${chicago}/bam2chicago_V02.sh -b ${bam_dir}/SN4741_pcHiC_combined_1_2.hicup.bam -t ${design_dir}/Digest_mm10_HindIII.baitmap -r ${design_dir}/Digest_mm10_HindIII.rmap -o SN4741_pcHiC_combined_1_2 -n"
