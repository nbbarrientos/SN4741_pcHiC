#!/bin/bash -l

main_dir="<path to Chicago directory>"
out_dir="<path to output directory>"

module load bedtools/2.30
module load r/4.0.2
module load python

sbatch -A <allocation> \
        -p defq \
        -N 1 \
        -n 24 \
        --mem-per-cpu=100GB \
        -t 72:00:00 \
        -J "Running Chicago pipeline" \
        --mail-type=END \
        --mail-user=<email> \
        --wrap="Rscript ${main_dir}/run_chicago.R -m ${main_dir} -i designDir -r SN4741_pcHiC_combined_1_2_bam2chicago_output -c SN4741_pcHiC_combined_1_2.chinput -n SN4741_pcHiC_combined_1_2"
