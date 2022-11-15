#!/bin/bash
# This script is meant to be used on the UPPMAX Cluster Rackham. It validates the integrity of a downloaded .sra file.

module load bioinfo-tools sratools

vdb-validate /path/to/<SRAaccesson>.sra
