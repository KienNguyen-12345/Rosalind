library(Biostrings)
sequences <- readDNAStringSet("rosalind_gc.txt")
gc_count <- rowSums(letterFrequency(sequences, letters = c("G","C")))
ids <- names(sequences)
gc_percent <- gc_count/width(sequences)*100

#Find max:
max_idx <- which.max(gc_percent)
max_id <- ids[max_idx]
max_gc <- gc_percent[max_idx]
cat(sprintf("%s\n%.6f\n", max_id, max_gc))
