# DESeq2 Analysis Template
library(DESeq2)

# Load count matrix and metadata
countData <- read.csv("count_matrix.csv", row.names=1)
colData <- read.csv("sample_metadata.csv", row.names=1)

dds <- DESeqDataSetFromMatrix(countData = countData,
                              colData = colData,
                              design = ~ condition)

dds <- DESeq(dds)
res <- results(dds)
resOrdered <- res[order(res$pvalue),]

write.csv(as.data.frame(resOrdered), file="DEGs_filtered.csv")
