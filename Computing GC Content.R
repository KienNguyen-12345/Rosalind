library(Biostrings)

sequence <- readDNAStringSet("rosalind_gc (1).txt")
value <- function(sequence) {
   #Calculate GC content:
  #Count GC content:
  gc_cont <- rowSums(letterFrequency(sequence, letters = c("G", "C")))
                     
  #Get the whole sequence length:
  total_length <- width(sequence)
  #Get the percentage:
  gc_percent <-  (gc_cont/total_length)*100
  # Get the FASTA ID headers
  ids <- names(sequence)

  #Find max:
  max_idx <- which.max(gc_percent)
  max_id  <- ids[max_idx]
  max_gc  <- gc_percent[max_idx]
  cat(sprintf("%s\n%.6f\n", max_id, max_gc))
  
}

value(sequence)






