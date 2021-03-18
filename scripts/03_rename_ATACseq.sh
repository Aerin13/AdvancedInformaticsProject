cd /data/class/ecoevo283/public/RAWDATA/ATACseq
find $(pwd -P) -name "*.fq.gz" | cut -f 8 -d "/" > /data/class/ecoevo283/swyant/AdvancedInformaticsProject/ATACseq/rawdata/ATACseq_sample_names.txt
find $(pwd -P) -name "*.fq.gz" | cut -f 8 -d "/" | cut -f 5,6 -d "_" > /data/class/ecoevo283/swyant/AdvancedInformaticsProject/ATACseq/rawdata/ATACseq_new_sample_names.txt

LIST=/data/class/ecoevo283/swyant/AdvancedInformaticsProject/ATACseq/rawdata/ATACseq_sample_names.txt
NEWLIST=/data/class/ecoevo283/swyant/AdvancedInformaticsProject/ATACseq/rawdata/ATACseq_new_sample_names.txt

paste ${LIST} ${NEWLIST} | while read SAMPLE NEWSAMPLE;
do ln -s /data/class/ecoevo283/public/RAWDATA/ATACseq/${SAMPLE} /data/class/ecoevo283/swyant/AdvancedInformaticsProject/ATACseq/rawdata/${NEWSAMPLE}
done

