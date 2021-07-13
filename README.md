# fqComplexity

The input FASTQ file should already have its adapters removed.
The `complexity_pro.R`

Prior to running fqComplexity, you need to install the following dependencies:

nseqtk https://github.com/lh3/seqtk \n
fqdedup https://github.com/guertinlab/fqdedup

Usage: \n
`fqComplexity -i input.fastq -d /directory/with/rscript` \n
-i input fastq file, with adapter/adapter ligation products removed  \n
-d directory of the complexity_pro.R script without trailing / slash
