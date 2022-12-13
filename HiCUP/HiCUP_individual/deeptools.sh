#!/bin/bash -l

module load samtools/1.10
module load htslib/1.10.2
module load python/3.9.0

sbatch -A <allocation> \
        -p defq \
        -N 1 \
        -n 24 \
        --mem-per-cpu=100GB \
        -t 72:00:00 \
        -J "Running deepTools with sorted and indexed BAM files" \
        --mail-type=END \
        --mail-user=<email> \
	--wrap="multiBamSummary bins --bamfiles SRR11041269_1_2.hicup.sorted.bam SRR11041270_1_2.hicup.sorted.bam SRR11041271_1_2.hicup.sorted.bam SRR11041272_1_2.hicup.sorted.bam \
					--labels SRR11041269 SRR11041270 SRR11041271 SRR11041272 \
					--outRawCounts results.bed \
					-o results.npz"
