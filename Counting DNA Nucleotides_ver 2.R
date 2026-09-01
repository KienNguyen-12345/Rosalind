# Counting DNA Nucleotides (Rosalind DNA)
# Author: Kien Nguyen
# Reads rosalind_dna.txt and prints A C G T counts

data <- readLines("rosalind_dna.txt")

bases <- strsplit(data, "")[[1]]

counts <- table(factor(bases, levels = c("A", "C", "G", "T")))

cat(as.integer(counts))
