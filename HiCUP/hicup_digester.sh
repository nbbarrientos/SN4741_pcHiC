#!/bin/bash -l

fasta_dir="/home/nbarrie1/data-amccall2/work-zfs/NBB/SN4741-pcHiC/mm10_fasta_files"

sbatch -A amccall2 \
        -p defq \
        -N 1 \
        -n 24 \
        --mem-per-cpu=100GB \
        -t 10:00:00 \
        -J "Creating digested reference genome" \
        --mail-type=END \
        --mail-user=nbarrie1@jhu.edu \
        --wrap="hicup_digester --genome mm10 --re1 A^AGCTT,HindIII ${fasta_dir}/*.fa.gz"
