#!/bin/sh

# This scripts has been made to run on a UPPMAX cluster utilizing the module system.
# It starts the nf-core pipeline methylseq/v.1.6.1 installed locally in the
# analysis directory and runs it with configuration for the Accel methylation kit,
# using the aligner bwa-meth.
# The first section contains slurm parameters needed to run on UPPMAX.

#SBATCH -A <uppmax project>
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 10-00:00:00
#SBATCH -J methylSeq_bwa_accel
#SBATCH -e /path/to/project/directory/bwa/accel/logs/methylSeq_%j.log
#SBATCH -o /path/to/project/directory/bwa/accel/logs/methylSeq_%j.log


ANALYSISDIR="/path/to/project/directory/"

module load java/OracleJDK_11.0.9
module load bioinfo-tools
module load Nextflow/21.10.6

#set Nextflow env variables
export NXF_WORK=$ANALYSISDIR/bwa/accel/work
export NXF_HOME=$ANALYSISDIR/bwa/accel/work 

nextflow run $ANALYSISDIR/methylseq/nf-core-methylseq-1.6.1/workflow/main.nf -resume -profile uppmax,singularity -c $ANALYSISDIR/methylseq.config \
	--project '<uppmax project>' \
	--fasta $ANALYSISDIR/igenomes_Homo_sapiens_NCBI_GRCh38_genome.fa \
	--aligner bwameth \
	--input '/path/to/emseq/fastq/files/*{1,2}.fastq.gz' \
	--outdir $ANALYSISDIR/bwa/accel/results \
	--save_reference \
	--accel
