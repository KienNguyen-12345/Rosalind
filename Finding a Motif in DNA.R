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
