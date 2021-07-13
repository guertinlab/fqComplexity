# fqComplexity

The input FASTQ file should already have its adapters removed.

The `complexity_pro.R` script is within this repository

Prior to running `fqComplexity`, you need to install the following dependencies and move to $PATH:

seqtk https://github.com/lh3/seqtk 

fqdedup https://github.com/guertinlab/fqdedup

Usage: 

`fqComplexity -i input.fastq -d /directory/with/rscript`

-i input fastq file, with adapter/adapter ligation products removed 

-d directory of the complexity_pro.R script without trailing / slash
