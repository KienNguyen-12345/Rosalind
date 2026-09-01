# Computing GC Content (Rosalind GC) - Biostrings Optimized
# Author: Kien Nguyen
# Uses Biostrings::letterFrequency in one vectorized operation
#Load package:
library(Biostrings)
#Input data:
sequences <- readDNAStringSet("rosalind_gc.txt")
#Since the rosalind_gc.txt file contains more than 1 sequences,letterFrequency command will return as a matrix
# That's why we will use rowSums to count all the incidences of "G" and "C" nucleotides appear.
gc_count <- rowSums(letterFrequency(sequences, letters = c("G","C")))
#Get the FASTA title of each sequence and put them into "ids" variable
ids <- names(sequences)
#Caculate the gc percent
gc_percent <- gc_count/width(sequences)*100

#Find max:
max_idx <- which.max(gc_percent)
max_id <- ids[max_idx]
max_gc <- gc_percent[max_idx]
cat(sprintf("%s\n%.6f\n", max_id, max_gc))
