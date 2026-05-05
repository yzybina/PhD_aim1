Renaming headers in bam file:

# Step 1: Generate the rename mapping (GRCh38#0#chr1 -> chr1)
samtools view -H vg_output/HG002.aligned.sorted.bam | grep "^@SQ" | \
    sed 's/.*SN:\([^\t]*\).*/\1/' | \
    awk '{new=$1; gsub(/^.*#[0-9]*#/, "", new); print $1"\t"new}' \
    > vg_output/contig_rename.txt

# Verify the mapping looks right
head -5 vg_output/contig_rename.txt

# Step 2: Rename contigs in the BAM
samtools reheader \
    --no-PG \
    -c 'perl -pe "s/(?<=\tSN:)(GRCh38#0#)//g"' \
    vg_output/HG002.aligned.sorted.bam \
    > vg_output/HG002.aligned.sorted.renamed.bam

# Step 3: Index the renamed BAM
samtools index vg_output/HG002.aligned.sorted.renamed.bam



#check number of records:
#Sentieon
bcftools stats /private/groups/patenlab/yulia/sentieon_benchmarking/Sentieon_output/HG002_pangenome.vcf.gz | grep "number of records"
[W::bcf_hdr_check_sanity] LPL should be declared as Number=LG
[W::bcf_hdr_check_sanity] LAD should be declared as Number=LR
#   number of records   .. number of data rows in the VCF
SN      0       number of records:      6,631,557

#VG
bcftools stats /private/groups/patenlab/yulia/sentieon_benchmarking/vg_output/HG002.output.vcf.gz | grep "number of records"
#   number of records   .. number of data rows in the VCF
SN      0       number of records:      7,655,763

#truth set
bcftools stats /private/groups/patenlab/yulia/sentieon_benchmarking/truthsets/HG002_GRCh38_v5.0q_smvar.vcf.gz | grep "number of records"
#   number of records   .. number of data rows in the VCF
SN      0       number of records:      5,945,525