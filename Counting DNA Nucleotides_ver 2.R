# Counting DNA Nucleotides (Rosalind DNA)
# Author: Kien Nguyen
# Reads rosalind_dna.txt and prints A C G T counts

#Input data
data <- readLines("rosalind_dna.txt")

# Split string into individual characters and extract the resulting character vector
bases <- strsplit(data, "")[[1]]

#factor() converts bases into categorical factor (A,C,G,T), inputting levels to ensure that the command will focus on 4 cateogries and only reports them.
#table() make the factors into a table compiling all the found levels
counts <- table(factor(bases, levels = c("A", "C", "G", "T")))

cat(as.integer(counts))
