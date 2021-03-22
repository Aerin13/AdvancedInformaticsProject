# Advanced Informatics Project
Eco Evo 283 Final Project  
Skylar Wyant  

## Week 6: Symlink creation
- 01_rename_DNAseq.sh  
    Makes symlinks to all the raw DNAseq files. Starts by making a sample list, then uses that list to make the links.
- 02_RNAsymlink.py (code by Dr. Long, I got stuck on this for the longest time)  
    Makes symlinks to all the raw RNAseq files. Also renames them according to the sample table.
- 03_rename_ATACseq.sh  
    Makes symlinks to all the ATACseq fastq files. Starts by making a sample list, then uses that list to make the links. Also chops off part of the sample name (that I hope I don't need later).

Stretch goal:
- [ ] Analyze some samples of each type using fastqc

## Week 7: Read Mapping
- 04_index_ref.sh  
    Indexes the reference genome for multiple different programs. I ran this interactively, as it was fast.  
    Based off class code from Dr. Long.  
- Make the list of DNAseq file prefixes  
    ```shell
    cd /data/class/ecoevo283/swyant/AdvancedInformaticsProject/DNAseq/rawdata
    ls *1.fq.gz | sed 's/_1.fq.gz//' > prefixes.txt
    ```
- 05_DNA_mapping.sh  
    Maps the DNAseq samples. Submitted to the job scheduler. Modified code from Dr. Long.
- Make the list of ATACseq file prefixes
    ```shell
    cd /data/class/ecoevo283/swyant/AdvancedInformaticsProject/ATACseq/rawdata
    ls *R1.fq.gz | sed 's/_R1.fq.gz//' > prefixes.txt
    ```
- 06_ATAC_mapping.sh   
    Maps the ATACseq samples. Submitted to the job scheduler. Modified version of the DNAseq script.
- 07_subset_RNAseq.R  
    Makes a list of 20 RNAseq samples for further analysis. I'm not going to do all the samples because it's ... a lot.
- 08_RNA_mapping.sh
    Maps the RNAseq samples. Submitted to the job scheduler. Modified version of the DNAseq script.  
    Uses the 20 sample list from the previous step.

## Week 8: SNP Calling




