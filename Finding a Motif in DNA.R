# Finding a Motif in DNA (Rosalind SUBS)
# Author: Kien Nguyen
# Finds all occurrences of a motif (t) within a DNA sequence (s)
# Uses a sliding window approach with 1-based indexing


find_motif_position <- function(s,t){
  length_s <- nchar(s)
  length_t <- nchar(t)
  # Last possible starting position:
  max_start <- length_s-length_t + 1

  # All possible starting positions:
 start_indices <- 1:max_start
 # Extract every substring of length t
 substring <- sapply(start_indices, 
                     function(i) substr(s, i, i+length_t-1))
 
 #Return 1-based indices where substring matches motif:
 matching_position <- which(substring == t)
 return(matching_position)
}

seq <- readLines("rosalind_subs.txt")
s <- seq[1]
t <- seq[2]

position <- find_motif_position(s,t)
cat(position)
