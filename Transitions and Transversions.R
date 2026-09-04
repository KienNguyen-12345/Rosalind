# Transitions and Transversions (Rosalind TRAN)
# Author: Kien Nguyen
# Calculates the ratio of transitions to transversions between two DNA sequences
# Transitions: A↔G or C↔T (purine-purine or pyrimidine-pyrimidine)
# Transversions: all other substitutions (purine-pyrimidine)

library(Biostrings)

# Read the two sequences from FASTA file
sequences <- readDNAStringSet("rosalind_tran.txt")
s1 <- as.character(sequences[[1]])
s2 <- as.character(sequences[[2]])

# Split into character vectors
s1_char <- strsplit(s1, "")[[1]]
s2_char <- strsplit(s2, "")[[1]]

# Initialize counters
transitions <- 0
transversions <- 0

# Iterate through each position
for (i in seq_along(s1_char)) {
  b1 <- s1_char[i]
  b2 <- s2_char[i]
  
  # Only evaluate mismatches
  if (b1 != b2) {
    pair <- paste0(b1, b2)
    
    # Transitions: A <-> G or C <-> T
    if (pair %in% c("AG", "GA", "CT", "TC")) {
      transitions <- transitions + 1
    } else {
      transversions <- transversions + 1
    }
  }
}

# Calculate and print the ratio
ratio <- transitions / transversions
cat(round(ratio, 11), "\n")
