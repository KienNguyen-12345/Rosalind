library(Biostrings)
sequences <- as.character(readDNAStringSet("rosalind_lcsm.txt"))
find_shared_motif <- function(sequences){
  #identify the shortest sequence (as a plain string)
  shortest <- sequences[which.min(nchar(sequences))]
  #start with full length of shortest sequence
  L <- nchar(shortest)
  for(len in L:1){
    #Identify least possible starting position
    max_start <- L - len + 1
    #All possible starting position:
    start_indices <- 1: max_start
    # Extract all possible substrings:
    substrings <- sapply(start_indices,
                         function(i)substr(shortest, i, i+len-1))
    #Check each substring:
    for(motif in substrings){
      # Test if motif appears in every sequence (using fixed = TRUE for exact match)
      if (all(sapply(sequences, 
                     function(s) grepl(motif, s, fixed = TRUE))))
        return(motif, file= "result.txt")
    }
  }
}

find_shared_motif(sequences)
