#!/bin/bash -l

module load samtools/1.10

sbatch -A <allocation> \
        -p defq \
        -N 1 \
        -n 24 \
        --mem-per-cpu=100GB \
        -t 72:00:00 \
        -J "Sorting BAM files" \
        --mail-type=END \
        --mail-user=<email> \
        --wrap="samtools sort -l 9 -o SN4741_pcHiC_combined_1_2.hicup.sorted.bam -O bam SN4741_pcHiC_combined_1_2.hicup.bam"

