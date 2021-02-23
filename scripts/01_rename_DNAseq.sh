cd /data/class/ecoevo283/public/RAWDATA/DNAseq
find $(pwd -P) -name "*.fq.gz" | cut -f 8 -d "/" > /data/class/ecoevo283/swyant/AdvancedInformaticsProject/DNAseq/rawdata/DNAseq_sample_names.txt

LIST=/data/class/ecoevo283/swyant/AdvancedInformaticsProject/DNAseq/rawdata/DNAseq_sample_names.txt

paste ${LIST} | while read SAMPLE;
do ln -s /data/class/ecoevo283/public/RAWDATA/DNAseq/${SAMPLE} /data/class/ecoevo283/swyant/AdvancedInformaticsProject/DNAseq/rawdata/${SAMPLE}
done

