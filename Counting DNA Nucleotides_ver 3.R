# Counting DNA Nucleotides (Rosalind DNA)
# Author: Kien Nguyen
# Reads rosalind_dna.txt and prints A C G T counts

data <- readLines("rosalind_dna.txt")

bases <- unlist(strsplit(data, ""))
bases
a_count <- sum(bases %in% "A")
g_count<- sum(bases %in% "G")
c_count<- sum(bases %in% "C")
t_count<- sum(bases %in% "T")

cat(a_count, c_count, g_count, t_count)
