# Finding a Motif in DNA (Rosalind SUBS)
# Author: Kien Nguyen
# Finds all occurrences of a motif (t) within a DNA sequence (s)
# Uses a sliding window approach with 1-based indexing

#Legend: 
#s: the sequence of full length
#t: the sequence of the motif in which we need to find
#Establish function:
find_motif_position <- function(s,t){
  #Establish the length of s:
  length_s <- nchar(s)
  #Establish the length of t:
  length_t <- nchar(t)
  
  #Max possible start:
  max_start <- length_s - length_t +1
  # All possible starting positions:
  start_indices <- 1:max_start
  # Extract every substring of length t
  #1. Make an empty list containing a start_indices amount of empty variable:
  substring <- character(length(start_indices)) 
  #2. substring all of the possible motif:
  for(i in seq_along(start_indices)){
    pos <- start_indices[i]
    substring[i] <- substr(s, pos, pos + length_t -1) 
  }
  #Return 1-based indices where substring matches motif:
  matching_position <- which(substring == t)
  return(matching_position)
}

seq <- readLines("rosalind_subs.txt")
s <- seq[1]
t <- seq[2]


position <- find_motif_position(s,t)
cat(position)
