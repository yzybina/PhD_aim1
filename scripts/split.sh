#!/usr/bin/env bash
#SBATCH --job-name=split_reads
#SBATCH --partition=medium
#SBATCH --nodes=1
#SBATCH --mem=10gb
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --output=split_reads_%j.log
#SBATCH --time=5:00:00

WORKDIR="/private/groups/patenlab/yulia/sentieon_benchmarking"
PATH_TO_SEQFILE="/private/groups/patenlab/anovak/projects/hprc/lr-giraffe/reads/real/illumina/HG002/HG002.novaseq.pcr-free.40x.full.fq.gz"


zcat $PATH_TO_SEQFILE | /private/home/anovak1/bin/fastqtk deinterleave - \
  $WORKDIR/HG002_R1.fq \
  $WORKDIR/HG002_R2.fq