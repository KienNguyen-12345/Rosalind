# Consensus and Profile (Rosalind CONS)
# Author: Kien Nguyen
# Computes a profile matrix and consensus sequence from a multiple sequence alignment
# Uses Biostrings::consensusMatrix for efficient profile construction

library(Biostrings)

# Read sequences (assumes file is in FASTA format)
seqs <- readDNAStringSet("rosalind_cons.txt")


# Compute profile: counts of A, C, G, T at each position
profile <- consensusMatrix(seqs, baseOnly = TRUE)[c("A","C","G","T"), , drop = FALSE]
profile
# Determine consensus: at each column, pick the base with highest count
consensus <- paste0(rownames(profile)[apply(profile, 2, which.max)], collapse = "")

# Print results as required by Rosalind
sink("result.txt")
cat(consensus, "\n")
cat("A:", paste(profile["A", ], collapse = " "), "\n")
cat("C:", paste(profile["C", ], collapse = " "), "\n")
cat("G:", paste(profile["G", ], collapse = " "), "\n")
cat("T:", paste(profile["T", ], collapse = " "), "\n")

sink()

