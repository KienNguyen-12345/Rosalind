# Complementing a Strand of DNA (Rosalind REVC) - Biostrings Version
# Author: Kien Nguyen
# Uses Biostrings::reverseComplement for production efficiency
#Load package
library(Biostrings)

#Input data
seq <- readLines("rosalind_revc.txt")

#Create a pipeline sequence in which the data from sequence goes through DNAString() to reverseComplement to come back to individual string then print
seq %>%
  DNAString() %>%
  reverseComplement() %>%
  as.character() %>%
  cat("\n")
