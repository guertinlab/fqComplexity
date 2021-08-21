# fqComplexity

The input FASTQ file should already have its adapters removed. The UMI should still be included in the FASTQ DNA sequence. The FASTQ file is subsampled into deciles. The intermediate file is deduplicated and the input and output numbers are logged. An asymptotic regression model is fit to the data and the equation for calculating expected complexity at any read depth is printed on the resulting PDF plot. 

The flags `-x` and `-y` are optional and they each default to 1. If the raw files were preprocessed in some way, `-x` should be set to the total raw reads divided by the resultant number after preprocessing. If your pipeline has filtering steps after FASTQ duplication, then `-y` should be set to final desired output (usually aligned reads) divided by the total number of deduplicated reads. An example of `-x` would be the value 2 if half the reads are prefiltered in a step that removes adapter/adapter ligation products. An example of `-y` would be the value 0.5 if half of the reads that are deduplicated align to the genome. 

The `complexity_pro.R` script is within this repository.

Navigate to the directory containg `fqComplexity` and change modifications with:

`chmod +x fqComplexity`

Prior to running `fqComplexity`, you need to install the following dependencies and move to $PATH:

seqtk https://github.com/lh3/seqtk 

fqdedup https://github.com/guertinlab/fqdedup

Usage: 

```fqComplexity -i input.fastq -d /directory/with/rscript 
-i input fastq file, with adapter/adapter ligation products removed 
-d directory of the complexity_pro.R script without trailing / slash 
-x factor for any preprocessing that occurred, such as removing adapter/adapter ligation products 
-y a factor for any postprocessing that occurred```
