# Counting Point Mutations (Rosalind HAMM) - Vectorized Version
# Author: Kien Nguyen
# Uses vectorized comparison to calculate Hamming distance efficiently

result <- function(s1, s2) {
  s1_vec <- unlist(strsplit(s1, ""))
  s2_vec <- unlist(strsplit(s2, ""))
  missmatch <- (s1_vec != s2_vec)
  cat(sum(missmatch))
}

s1 <- readLines("rosalind_hamm.txt")[1]
s2 <- readLines("rosalind_hamm.txt")[2]
result(s1, s2)
