# fqComplexity

The input FASTQ file should already have its adapters removed. The UMI should still be included in the FASTQ DNA sequence. The FASTQ file is subsampled into deciles. The intermediate file is deduplicated and the input and output numbers are logged. An asymptotic regression model is fit to the data and the total number of unique reads at 10 million read depth is printed on the resulting PDF plot. 

The flags `-x` and `-y` are optional and they each default to 1. If the raw files were preprocessed in some way, `-x` should be set to the total raw reads divided by the resultant number after preprocessing. If your pipeline has filtering steps after FASTQ duplication, then `-y` should be set to final desired output (usually aligned reads) divided by the total number of deduplicated reads. An example of `-x` would be the value 2 if half the reads are prefiltered in a step that removes adapter/adapter ligation products. An example of `-y` would be the value 0.5 if half of the reads that are deduplicated align to the genome. If `fqComplexity` is run without the `-x` and `-y` options prior to a subsequent call that invokes these options, the first log file will be reused to save speed.  

The `complexity_pro.R` script and `fqComplexity` program are within this repository.
```
wget https://raw.githubusercontent.com/guertinlab/fqComplexity/main/fqComplexity
wget https://raw.githubusercontent.com/guertinlab/fqComplexity/main/complexity_pro.R
```
Navigate to the directory containg `fqComplexity` and `complexity_pro.R`, then change permissions with:

```
chmod +x fqComplexity
chmod +x complexity_pro.R
```

Prior to running `fqComplexity`, you need to install the following dependencies and move to $PATH:

`seqtk` https://github.com/lh3/seqtk 

`fqdedup` https://github.com/guertinlab/fqdedup

`complexity_pro.R` from this repository

Usage: 

```
fqComplexity -i input.fastq 

    -i input fastq file, with adapter/adapter ligation products removed 
    -x factor for any preprocessing that occurred, such as removing adapter/adapter ligation products 
    -y a factor for any postprocessing that occurred
```
