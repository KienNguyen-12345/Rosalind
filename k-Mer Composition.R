# k-Mer Composition (Rosalind KMER)
# Author: Kien Nguyen
# Counts the frequency of every possible 4-mer in a DNA sequence
# Outputs counts in lexicographic order (AAAA, AAAC, ..., TTTT)

# Load the Biostrings package for handling DNA sequences
library(Biostrings)

# Define the four nucleotide bases
bases <- c("A", "C", "G", "T")

# Initialize an empty string for recursion and a character vector to store all 4‑mers
current <- ""
four_mer <- character()

# Initialize a numeric vector of length 256 (one count for each possible 4‑mer)
counts <- rep(0, 256)

# Read the DNA sequence from the FASTA file (expects a single sequence)
seq <- as.character(readDNAStringSet("rosalind_kmer.txt"))

# Calculate the number of overlapping 4‑mers in the sequence: L - k + 1
k_mer <- nchar(seq) - 4 + 1

# Recursive function to generate all possible 4‑mer strings (4^4 = 256 combinations)
solved_problem <- function(current) {
  # If the current string has length 4, append it to the global four_mer vector and stop
  if (nchar(current) == 4) {
    four_mer[[length(four_mer) + 1]] <<- current
    return()
  }
  # Otherwise, iterate over each base and recurse with the extended string
  for (i in bases) {
    new_current <- paste0(current, i)
    solved_problem(new_current)
  }
}

# Generate all 4‑mers and store them in 'four_mer'
solved_problem(current)

# Loop over each starting position in the sequence (1 to k_mer)
for (j in 1:k_mer) {
  # Extract the overlapping 4‑mer at position j
  overlap_seq <- substr(seq, start = j, stop = j + 3)
  # Find the index of this 4‑mer in the sorted list of all possible 4‑mers
  position <- which(four_mer == overlap_seq)
  # Increment the count for that 4‑mer
  counts[position] <- counts[position] + 1
}

# Write the counts to a file, separated by spaces:
cat(counts, sep = " ", file = "result.txt")
