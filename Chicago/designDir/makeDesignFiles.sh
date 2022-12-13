#!/bin/bash -l

module load python

sbatch -A <allocation> \
        -p defq \
        -N 1 \
        -n 24 \
        --mem-per-cpu=100GB \
        -t 72:00:00 \
        -J "Making .poe, .npb, and .nbpb files" \
        --mail-type=END \
        --mail-user=<email> \
        --wrap="python chicagoTools/makeDesignFiles_py3.py -m 150 -x 40000 -r ./Digest_mm10_HindIII.rmap -f ./Digest_mm10_HindIII.baitmap -o Digest_mm10_HindIII"
