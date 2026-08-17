library(Biostrings)
sequence <- readRNAStringSet("rosalind_prot (1).txt")
class(sequence)
translated_seq <- function(sequence){
  #Translate from RNA to protein sequence
  prot <- translate(sequence, no.init.codon =T)
  prot_str <- as.character(prot)
  return(prot_str)
}
result <- translated_seq(sequence)
cat(result, file = "protein_result.txt")
