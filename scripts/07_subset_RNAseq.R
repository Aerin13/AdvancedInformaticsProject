# For subsetting the RNAseq samples

mytab = read.table("/data/class/ecoevo283/public/RAWDATA/RNAseq/RNAseq384_SampleCoding.txt",header=TRUE)
# drop some columns
mytab2 = mytab[,9:12]
# select a subset of samples
mytab3 = mytab2[c(1:10,93:102),]
# rearrange and drop another column
mytab4 = mytab3[,c(4,1,2)]
if (file.exists("/data/class/ecoevo283/swyant/AdvancedInformaticsProject/RNAseq/rawdata/shortRNAseq.names.txt")) {file.remove("/data/class/ecoevo283/swyant/AdvancedInformaticsProject/RNAseq/rawdata/shortRNAseq.names.txt")}
for(i in 1:nrow(mytab4)){
	cat("/data/class/ecoevo283/swyant/AdvancedInformaticsProject/RNAseq/mapped/",mytab4$FullSampleName[i],".bam\n",file="/data/class/ecoevo283/swyant/AdvancedInformaticsProject/RNAseq/rawdata/shortRNAseq.names.txt",append=TRUE,sep='')
	}
write.table(mytab4,"/data/class/ecoevo283/swyant/AdvancedInformaticsProject/RNAseq/rawdata/shortRNAseq.txt")



