#!/bin/bash -l
# This script is meant to be used on the UPPMAX Cluster Rackham. It uses the tool fastq-dump from 
# SRA Toolkit and converts a .sra file into a fastq file.
# The first section of the script is slurm parameters required to run the job on UPPMAX clusters.

#SBATCH -A <uppmax project> 
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 05:00:00 
#SBATCH -J fastq_dump_SRR<accession>
#SBATCH -e /path/to/output/directory/logs/SRR<accession>_%j.log
#SBATCH -o /path/to/output/directory/SRR<accession>_%j.log

module load bioinfo-tools sratools

fastq-dump --outdir /path/to/output/directory/ --gzip --skip-technical  --readids --read-filter pass --dumpbase --split-3 --clip /path/to/SRR<accession>.sra
