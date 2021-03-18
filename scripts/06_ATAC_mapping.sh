#!/bin/bash
#SBATCH --job-name=ATACseq_mapping
#SBATCH -A ecoevo283
#SBATCH -p standard
#SBATCH --array=1-24
#SBATCH --cpus-per-task=2    

module load bwa/0.7.8
module load samtools/1.10
module load bcftools/1.10.2
module load java/1.8.0
module load picard-tools/1.87

# Set file locations
OUTDIR=/data/class/ecoevo283/swyant/AdvancedInformaticsProject/ATACseq/mapped
INDIR=/data/class/ecoevo283/swyant/AdvancedInformaticsProject/ATACseq/rawdata
file="/data/class/ecoevo283/swyant/AdvancedInformaticsProject/ATACseq/rawdata/prefixes.txt"
ref="/data/class/ecoevo283/swyant/AdvancedInformaticsProject/ref/dmel-all-chromosome-r6.13.fasta"

# Get the right file name
prefix=`head -n $SLURM_ARRAY_TASK_ID $file | tail -n 1`
samplename=`echo $prefix | sed -e "s/ATACseq2/ATACseq2out/"`
idname=`echo $prefix | cut -d "/" -f 2 | cut -d "_" -f 1`

# BWA mapping
bwa mem -t 2 -M $ref ${INDIR}/${prefix}_R1.fq.gz ${INDIR}/${prefix}_R2.fq.gz | samtools view -bS - > ${OUTDIR}/${samplename}.bam

# Sort the BAM
samtools sort ${OUTDIR}/${samplename}.bam -o ${OUTDIR}/${samplename}.sort.bam

# Add readgroups with Picard
java -jar  /opt/apps/picard-tools/1.87/AddOrReplaceReadGroups.jar I=${OUTDIR}/${samplename}.sort.bam O=${OUTDIR}/${samplename}.RG.bam SORT_ORDER=coordinate RGPL=illumina RGPU=D109LACXX RGLB=Lib1 RGID=$idname RGSM=$idname VALIDATION_STRINGENCY=LENIENT

# Index the resulting BAM
samtools index ${OUTDIR}/${samplename}.RG.bam

