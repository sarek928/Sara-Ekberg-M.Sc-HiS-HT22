#!/bin/bash
# This script is meant to be used on the UPPMAX Cluster Rackham. It takes a SRA accession number as argument $1
# and downloads a .sra file from NCBI's Sequence Read Archive (SRA) database.

module load bioinfo-tools sratools
prefetch --max-size 22000000 -O . $1
