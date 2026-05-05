#!/usr/bin/env bash
#SBATCH --job-name=aardvark
#SBATCH --partition=medium
#SBATCH --nodes=1
#SBATCH --mem=80gb
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16
#SBATCH --output=logs/aardvark_%j.log
#SBATCH --time=5:00:00

#sentieon
aardvark compare \
    --reference /private/groups/patenlab/yulia/sentieon_benchmarking/support_files/hg38_ucsc.fa \
    --truth-vcf /private/groups/patenlab/yulia/sentieon_benchmarking/truthsets/HG002_GRCh38_v5.0q_smvar.vcf.gz \
    --query-vcf /private/groups/patenlab/yulia/sentieon_benchmarking/Sentieon_output/HG002_pangenome.vcf.gz \
    --regions /private/groups/patenlab/yulia/sentieon_benchmarking/support_files/hg38_canonical.bed \
    --output-dir aardvark_results/sentieon \
    --stratification /private/groups/patenlab/yulia/sentieon_benchmarking/support_files/GRCh38@all/GRCh38-all-stratifications.tsv \
    --threads 16

#DV
aardvark compare \
    --reference /private/groups/patenlab/yulia/sentieon_benchmarking/support_files/hg38_ucsc.fa \
    --truth-vcf /private/groups/patenlab/yulia/sentieon_benchmarking/truthsets/HG002_GRCh38_v5.0q_smvar.vcf.gz \
    --query-vcf /private/groups/patenlab/yulia/sentieon_benchmarking/vg_output/HG002.output.vcf.gz \
    --regions /private/groups/patenlab/yulia/sentieon_benchmarking/support_files/hg38_canonical.bed \
    --output-dir aardvark_results/vg \
    --stratification /private/groups/patenlab/yulia/sentieon_benchmarking/support_files/GRCh38@all/GRCh38-all-stratifications.tsv \
    --threads 16