# Counting DNA Nucleotides (Rosalind DNA)
# Author: Kien Nguyen
# Reads rosalind_dna.txt and prints A C G T counts
#Load package:
library(stringr)

#read data:
data <- readLines("rosalind_dna.txt")

#count each of A, C, G, and T nucleotides:
count_2 <- str_count(data,pattern = c("A","C","G","T"))
cat(count_2)
