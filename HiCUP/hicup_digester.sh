#!/bin/bash -l

fasta_dir="<path to mm10_fasta_files>"

sbatch -A <allocation> \
        -p defq \
        -N 1 \
        -n 24 \
        --mem-per-cpu=100GB \
        -t 10:00:00 \
        -J "Creating digested reference genome" \
        --mail-type=END \
        --mail-user=<email> \
        --wrap="hicup_digester --genome mm10 --re1 A^AGCTT,HindIII ${fasta_dir}/*.fa.gz"
