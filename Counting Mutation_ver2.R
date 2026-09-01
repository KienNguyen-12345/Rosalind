# Counting Point Mutations (Rosalind HAMM) - Manual Iteration Version
# Author: Kien Nguyen
# Demonstrates step-by-step Hamming distance calculation with a for loop

sequences <- readLines("rosalind_hamm.txt")
s1 <- strsplit(sequences[[1]], "")[[1]]
s2 <- strsplit(sequences[[2]], "")[[1]]

mutations <- 0
for(i in seq_along(s1)){
  b1 <- s1[i]
  b2 <- s2[i]

if(b1 != b2){
  mutations <- mutations +1
}
}
cat(mutations)
