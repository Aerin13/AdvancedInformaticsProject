#!/bin/bash

#SBATCH --job-name=12_feature_counts      ## Name of the job.
#SBATCH -A ecoevo283         ## account to charge 
#SBATCH -p standard          ## partition/queue name
#SBATCH --cpus-per-task=4    ## number of cores the job needs, can the programs you run make used of multiple cores?

module load bwa/0.7.17
module load samtools/1.10
module load bcftools/1.10.2
module load python/3.8.0
module load java/1.8.0
module load gatk/4.1.9.0
module load picard-tools/1.87
module load bamtools/2.5.1        # bamtools merge is useful
module load freebayes/1.3.2       # fasta_generate_regions.py is useful
module load vcftools/0.1.16
module load subread/2.0.1



gtf="/data/class/ecoevo283/swyant/AdvancedInformaticsProject/ref/dmel-all-r6.13.gtf"
myfile=`cat /data/class/ecoevo283/swyant/AdvancedInformaticsProject/RNAseq/mapped/sorted_bams.txt | tr "\n" " "`
featureCounts -p -T 4 -t exon -g gene_id -Q 30 -F GTF -a $gtf -o /data/class/ecoevo283/swyant/AdvancedInformaticsProject/RNAseq/feature_counts/fly_counts_2.txt $myfile



