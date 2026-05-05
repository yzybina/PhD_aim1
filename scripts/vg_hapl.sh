#!/usr/bin/env bash
#SBATCH --job-name=vg_hapl
#SBATCH --partition=medium
#SBATCH --nodes=1
#SBATCH --mem=128gb
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16
#SBATCH --output=vg_hapl_%j.log
#SBATCH --time=5:00:00

export PATH=$PATH:/private/home/yzybina/vg


vg haplotypes -v 2 -t 16 \
    -d your.dist \
    -r your.ri \
    -H graph.hapl \
    graph.gbz