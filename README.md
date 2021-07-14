# fqComplexity

The input FASTQ file should already have its adapters removed. The UMI should still be included in the FASTQ DNA sequence. The FASTQ file is subsampled from 1 million to the read depth with a 1 million step. The intermediate file is deduplicated and the input and output numbers are logged. An asymptotic regression model is fit to the data and the equation for calculating expected complexity at any read depth is printed on the resulting PDF plot. The program is not speed optimized, or really optimized at all, but this brute force method works.

The `complexity_pro.R` script is within this repository.

Navigate to the directory containg `fqComplexity` and change modifications with:

`chmod +x fqComplexity`

Prior to running `fqComplexity`, you need to install the following dependencies and move to $PATH:

seqtk https://github.com/lh3/seqtk 

fqdedup https://github.com/guertinlab/fqdedup

Usage: 

`fqComplexity -i input.fastq -d /directory/with/rscript`

-i input fastq file, with adapter/adapter ligation products removed 

-d directory of the complexity_pro.R script without trailing / slash
