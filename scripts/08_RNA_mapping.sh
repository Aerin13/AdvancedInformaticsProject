#!/bin/bash
#SBATCH --job-name=RNAseq_mapping
#SBATCH -A ecoevo283
#SBATCH -p standard
#SBATCH --array=1-20
#SBATCH --cpus-per-task=2    

module load bwa/0.7.8
module load samtools/1.10
module load bcftools/1.10.2
module load java/1.8.0
module load picard-tools/1.87
module load hisat2/2.2.1

# Set file locations
dir=/data/class/ecoevo283/swyant/AdvancedInformaticsProject/RNAseq/mapped
INDIR=/data/class/ecoevo283/swyant/AdvancedInformaticsProject/RNAseq/rawdata
file="/data/class/ecoevo283/swyant/AdvancedInformaticsProject/RNAseq/rawdata/shortRNAseq.names.txt"
ref="/data/class/ecoevo283/swyant/AdvancedInformaticsProject/ref/dmel-all-chromosome-r6.13.fasta"

# Get the right file name
prefix=`head -n $SLURM_ARRAY_TASK_ID $file | tail -n 1`
samplename=`echo $prefix | cut -f 9 -d "/" | cut -f 1 -d "."`

# Map with hisat2
hisat2 -p 2 -x $ref -1 ${INDIR}/${samplename}_F.fq.gz -2 ${INDIR}/${samplename}_R.fq.gz -S $dir/${samplename}.sam

# Convert SAM to BAM
samtools view -bS $dir/${samplename}.sam > $dir/${samplename}.bam

# Sort the BAM
samtools sort $dir/${samplename}.bam -o $dir/${samplename}.sorted.bam

# Index the final BAM
samtools index $dir/${samplename}.sorted.bam

