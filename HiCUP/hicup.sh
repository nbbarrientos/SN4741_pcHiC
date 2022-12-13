#!/bin/bash -l

module load bowtie2/2.4.1
module load r/4.0.2
module load samtools/1.10

sbatch -A amccall2 \
        -p defq \
        -N 1 \
        -n 24 \
        --mem-per-cpu=100GB \
        -t 72:00:00 \
        -J "Running HiCUP combined" \
        --mail-type=END \
        --mail-user=nbarrie1@jhu.edu \
        --wrap="hicup --config hicup_config_combined.conf"

