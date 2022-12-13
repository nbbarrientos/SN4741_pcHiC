#!/bin/bash -l

files="<name of files separated by spaces>"
out_dir="<directory to save output>"
fastq_dir="<directory to fastq_files>"

module load fastqc/0.11.9

for i in ${files};
do
        sbatch -A <allocation> \
                -p defq \
                -N 1 \
                -n 24 \
                --mem-per-cpu=30GB \
                -t 10:00:00 \
                -J "running fastQC on fastq files" \
                --mail-type=END \
                --mail-user=<email> \
                --wrap="fastqc -o ${out_dir} -f fastq ${fastq_dir}/${i}.fastq.gz"
done
