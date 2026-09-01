# Complementing a Strand of DNA (Rosalind REVC) - Biostrings Version
# Author: Kien Nguyen
# Uses Biostrings::reverseComplement for production efficiency

library(Biostrings)

seq <- readLines("rosalind_revc.txt")

seq %>%
  DNAString() %>%
  reverseComplement() %>%
  as.character() %>%
  cat("\n")
