# Advanced Informatics Project
Eco Evo 283 Final Project  
Skylar Wyant  

## Week 6: Symlink creation
- `01_rename_DNAseq.sh`  
    Makes symlinks to all the raw DNAseq files. Starts by making a sample list, then uses that list to make the links.
- `02_RNAsymlink.py` (code by Dr. Long, I got stuck on this for the longest time)  
    Makes symlinks to all the raw RNAseq files. Also renames them according to the sample table.
- `03_rename_ATACseq.sh`  
    Makes symlinks to all the ATACseq fastq files. Starts by making a sample list, then uses that list to make the links. Also chops off part of the sample name (that I hope I don't need later).

## Week 7: Read mapping
- `04_index_ref.sh`  
    Indexes the reference genome for multiple different programs. I ran this interactively, as it was fast.  
    Based off class code from Dr. Long.  
- Make the list of DNAseq file prefixes  
    ```shell
    cd /data/class/ecoevo283/swyant/AdvancedInformaticsProject/DNAseq/rawdata
    ls *1.fq.gz | sed 's/_1.fq.gz//' > prefixes.txt
    ```
- `05_DNA_mapping.sh`  
    Maps the DNAseq samples. Submitted to the job scheduler. Modified code from Dr. Long.
- Make the list of ATACseq file prefixes
    ```shell
    cd /data/class/ecoevo283/swyant/AdvancedInformaticsProject/ATACseq/rawdata
    ls *R1.fq.gz | sed 's/_R1.fq.gz//' > prefixes.txt
    ```
- `06_ATAC_mapping.sh`   
    Maps the ATACseq samples. Submitted to the job scheduler. Modified version of the DNAseq script.
- `07_subset_RNAseq.R`  
    Makes a list of 20 RNAseq samples for further analysis. I'm not going to do all the samples because it's ... a lot.
- `08_RNA_mapping.sh`  
    Maps the RNAseq samples. Submitted to the job scheduler. Modified version of the DNAseq script.  
    Uses the 20 sample list from the previous step.

## Week 8: SNP Calling
- Make the DNAseq prefixes file. Did this manually since it's only 4 samples.  
    ```shell
    ADL06
    ADL09
    ADL10
    ADL14
    ```
- `09_merge_and_call.sh`  
    Combine the replicates for each fly line together, then snp call with HaplotypeCaller. DNAseq
- `10_combine_gvcfs.sh`  
    Combines all the lines into one gvcf.
- `11_genotype_gvcfs.sh`  
    SNP calls the combined gvcf file into a final vcf file for the DNAseq data. This is the end of the DNAseq pipeline, although you should probably do additional filtering (which is easy to do with bcftools and scikit-allel).
- Now for the RNAseq. Install a bunch of R packages.  
    ```R
    if (!requireNamespace("BiocManager", quietly = TRUE)) install.packages("BiocManager").libPaths()
    BiocManager::install("DESeq2",lib=.libPaths()[1])
    BiocManager::install("GenomicFeatures",lib=.libPaths()[1])
    BiocManager::install("Rsamtools",lib=.libPaths()[1])
    BiocManager::install("GenomicAlignments",lib=.libPaths()[1])
    ```
- Made a sample list of all the sorted BAM files for the RNAseq using [this script](https://github.com/MorrellLAB/sequence_handling/blob/master/HelperScripts/sample_list_generator.sh)
- `12_feature_counts.sh`  
    Counts RNAseq read mappings to genes. Requires all those R packages.

## Week 9: RNAseq and ATACseq analysis

This is where I ran out of steam. Sorry.