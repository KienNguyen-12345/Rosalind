# Computing GC Content (Rosalind GC) - Base R Manual Version
# Author: Kien Nguyen
# No Biostrings manipulation - uses strsplit and sapply
# To the underlying algorithm

library(Biostrings)
sequences <- readDNAStringSet("rosalind_gc.txt")
sequences <- as.character(sequences)
ids <- names(sequences)

gc_percent <- sapply(sequences, function(seq){
  bases <- strsplit(seq,"")[[1]]
  gc_count <- sum(bases %in% c("G","C"))
  gc_count/length(bases)*100
})
max_idx <- which.max(gc_percent)
cat(ids[max_idx], max(gc_percent))


