# Overlap Graphs (Rosalind GRPH)
# Author: Kien Nguyen
# Finds all directed edges where the suffix of one sequence (3 bases)
# matches the prefix of another sequence (3 bases)
# Uses a prefix lookup table for O(n) efficiency


library(Biostrings)
#Read data:
sequences <- readDNAStringSet("rosalind_grph.txt")
ids <- names(sequences)
seq <- as.character(sequences)

#Find prefix and suffix:
prefix <- substr(seq,1,3)
suffix <- substr(seq, nchar(seq)-2, nchar(seq))

#Create a look up value for prefixes:
prefix_lookup <- split(1:length(ids), prefix)
prefix_lookup

#Assign empty value for edge:

for(i in 1:length(ids)){
  matching_prefix <- prefix_lookup[[suffix[i]]]
  matching_prefix <- matching_prefix[matching_prefix!=i]
  if(length(matching_prefix)>0){
    edges <- c(edges,paste(ids[i],ids[matching_prefix]))
  }
}
cat(edges, sep = "\n", file = "result.txt")
