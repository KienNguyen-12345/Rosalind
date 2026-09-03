# Perfect Matchings and RNA Secondary Structures (Rosalind PMCH)
# Author: Kien Nguyen
# Calculates the number of perfect matchings between complementary bases in an RNA sequence
# For a perfect matching, n_A = n_U and n_C = n_G
# Total matchings = n_A! × n_C!

library(Biostrings)
library(gmp)

# Read the RNA sequence from FASTA file
rna_data <- readRNAStringSet("rosalind_pmch.txt")
seq <- as.character(rna_data[[1]])
seq_char <- strsplit(seq, "")[[1]]

# Count the number of A and C bases
count_A <- sum(seq_char == "A")
count_C <- sum(seq_char == "C")

# Calculate number of perfect matchings
# n_A! ways to pair A's with U's, n_C! ways to pair C's with G's
result <- factorialZ(count_A) * factorialZ(count_C)

# Print result as exact integer string
cat(as.character(result), "\n")
