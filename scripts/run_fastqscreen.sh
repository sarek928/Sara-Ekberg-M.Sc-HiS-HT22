#!/bin/sh
# This script is created to be run on UPPMAX cluters.
# It will run the software fastqscreen and requires FASTQ files as input
# and a configuration file that contains bisulfie converted reference genomes and path to Bismark.
# The first section contains slurm parameters needed to run on UPPMAX.

#SBATCH -A <uppmax project>
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 10-00:00:00
#SBATCH -J fastqscreen
#SBATCH -e /path/to/output/directory/fastqscreen/fastqscreen_%j.log
#SBATCH -o /path/to/output/directory/fastqscreen/fastqscreen_%j.log

ANALYSISDIR="/path/to/project/directory/"
module load java/OracleJDK_11.0.9
module load bioinfo-tools
module load fastq_screen/0.15.2
module load bismark/0.23.1 

find $ANALYSISDIR/fastqfiles/ -wholename *.fastq.gz -exec fastq_screen --bisulfite --conf $ANALYSISDIR/fastq_screen_bisulfite.conf --outdir $ANALYSISDIR/fastqscreen {} \;
