# Consensus and Profile (Rosalind CONS)
# Author: Kien Nguyen
# Calculates the consensus string and profile matrix from a multiple sequence alignment
#Load package
library(Biostrings)

#Identify the bases
bases <- c("A","C","G","T")

# Step 1: Read the FASTA file as a DNA multiple alignment
sequences <- DNAMultipleAlignment(readDNAStringSet("rosalind_cons.txt"))

#Establish function:
result <- function(sequences){
  
  profile <-consensusMatrix(sequences, bases,
                            as.prob = FALSE) [1:4,]
  concensus <- paste0(bases[apply(profile, 2, which.max)],
                      collapse = "")
  cat(concensus, file = "result.txt")
}

sink("result.txt")
cat(consensus, "\n")
cat("A:", paste(profile["A", ], collapse = " "), "\n")
cat("C:", paste(profile["C", ], collapse = " "), "\n")
cat("G:", paste(profile["G", ], collapse = " "), "\n")
cat("T:", paste(profile["T", ], collapse = " "), "\n")
sink()
