library(Biostrings)
library(gmp)

# 1. Read the FASTA file
dna_data <- readRNAStringSet("rosalind_pmch.txt")
seq_char <- unlist(strsplit(as.character(dna_data[[1]]), ""))

# 2. Count occurrences of 'A' and 'C'
count_A <- sum(seq_char == "A")
count_C <- sum(seq_char == "C")

# 3. Compute factorials using big integers and multiply
result <- factorialZ(count_A) * factorialZ(count_C)

# 4. Print result as exact integer string
as.character(result)
