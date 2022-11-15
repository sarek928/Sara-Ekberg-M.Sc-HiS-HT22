#!/bin/sh
#SBATCH -A ngi2016001
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 1-00:00:00
#SBATCH -J multiqc
#SBATCH -e /proj/ngi2016001/nobackup/private/workspace_sarek/exjobb/MultiQC/multiqc_%j.log
#SBATCH -o /proj/ngi2016001/nobackup/private/workspace_sarek/exjobb/MultiQC/multiqc_%j.log

module load bioinfo-tools
module load MultiQC/1.12

multiqc --title "BWA run" --export --interactive -o '/proj/ngi2016001/nobackup/private/workspace_sarek/exjobb/MultiQC/' /proj/ngi2016001/nobackup/private/workspace_sarek/exjobb/validation_results/bwa*
