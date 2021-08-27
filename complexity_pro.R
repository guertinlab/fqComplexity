#!/usr/bin/env Rscript

Args=commandArgs(TRUE)
argsLen <- length(Args)

complexity.log = Args[1]
print(complexity.log)
prefix.name = strsplit(complexity.log, ".log")[[1]][1]
complexity = read.table(complexity.log, header=FALSE)

#this is for QC for PCR duplicates
reads = c(0, complexity[,1][rep(c(TRUE, FALSE), length(complexity[,1])/2)]) 
unique = c(0, complexity[,1][rep(c(FALSE, TRUE), length(complexity[,1])/2)]) 
df = as.data.frame(cbind(reads, unique))
asymptotic.model = NLSstAsymptotic(sortedXyData(reads, unique))

asm.depth = nls(df$unique ~ b2*(1-exp(-exp(ln.rate.constant) * df$reads)), 
                    start = list(b2 = asymptotic.model[2], ln.rate.constant = asymptotic.model[3]))

b2 = coef(asm.depth)[1]
ln.rate.constant = coef(asm.depth)[2]
reciprocal.rate.constant = exp(-ln.rate.constant)
b1.rounded = signif(reciprocal.rate.constant, 2)
b2.rounded = signif(b2, 2)

read.depth.values = seq(0, 100000000, by = 1000000)
unique.at.10mil = b2*(1-exp(-exp(ln.rate.constant ) * 10000000))

if (argsLen == 1) {
    pdf(paste(prefix.name,'_complexity.pdf', sep=''), width=6, height=6, useDingbats=FALSE)
    par(pty="s")
    plot(unique~reads, df, ylim = c(0,100000000), xlim = c(0,100000000),
         pch = 16, cex = 0.5, ylab = 'Unique', xlab = 'Read Depth', yaxs="i", xaxs="i")
    
    lines(read.depth.values, b2*(1-exp(-exp(ln.rate.constant) * read.depth.values)), col='red')
    abline(0, 1, col='blue', lty = 2)

    text(1000000, 95000000, bquote('unique at 10 million read depth = '~.(unique.at.10mil)),  pos = 4)
    dev.off()
} else {
    pdf(paste(prefix.name,'_complexity.pdf', sep=''), width=6, height=6, useDingbats=FALSE)
    par(pty="s")
    plot(unique~reads, df, ylim = c(0,100000000), xlim = c(0,100000000),
         pch = 16, cex = 0.5, ylab = 'Concordant Aligned', xlab = 'Raw Read Depth', yaxs="i", xaxs="i")
    
    lines(read.depth.values, b2*(1-exp(-exp(ln.rate.constant) * read.depth.values)), col='red')
    abline(0, 1, col='blue', lty = 2)
    text(1000000, 97000000, bquote('Estimate the necessary read_depth for desired number of'), pos = 4, cex = 0.8)
    text(1000000, 93000000, bquote('concordantly aligned reads using the following'), pos = 4, cex = 0.8)
    text(1000000, 89000000, bquote('equation and parameters:'), pos = 4, cex = 0.8)
    text(1000000, 84000000, bquote('read_depth = b1 * ln( b2 / (b2 - Concordant_Aligned) )'), pos = 4, cex = 0.6)
    text(1000000, 80000000, bquote('b1 = '~.(b1.rounded)), pos = 4, cex = 0.6)
    text(1000000, 76000000, bquote('b2 = '~.(b2.rounded)), pos = 4, cex = 0.6)
    dev.off()
}

