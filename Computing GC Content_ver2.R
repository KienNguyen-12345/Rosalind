# Computing GC Content (Rosalind GC) - Base R Manual Version
# Author: Kien Nguyen
# No Biostrings manipulation - uses strsplit and sapply
# To the underlying algorithm
#Load package
library(Biostrings)
#input data
sequences <- readDNAStringSet("rosalind_gc.txt")
#Change the class of object from DNA to character
sequences <- as.character(sequences)
#Take the headname of each sequence and make them becomes ids
ids <- names(sequences)

#make function:
gc_percent <- sapply(sequences, function(seq){
  #split the string into individuals characters then combine them into a vector
  bases <- strsplit(seq,"")[[1]]
  #Count all of the incidence of G and C appear
  gc_count <- sum(bases %in% c("G","C"))
  #Calculate gc percent
  gc_count/length(bases)*100
})
max_idx <- which.max(gc_percent)
cat(ids[max_idx], max(gc_percent))


