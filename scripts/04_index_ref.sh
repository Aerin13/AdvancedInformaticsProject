module load bwa/0.7.8
module load samtools/1.10
module load gatk/4.1.9.0
module load picard-tools/1.87
module load java/1.8.0
module load hisat2/2.2.1

cd /data/class/ecoevo283/swyant/AdvancedInformaticsProject/ref
ref="/data/class/ecoevo283/swyant/AdvancedInformaticsProject/ref/dmel-all-chromosome-r6.13.fasta"
bwa index $ref
samtools faidx $ref
java -d64 -Xmx128g -jar /data/apps/picard-tools/1.87/CreateSequenceDictionary.jar R=$ref O=ref/dmel-all-chromosome-r6.13.dict
hisat2-build $ref $ref


