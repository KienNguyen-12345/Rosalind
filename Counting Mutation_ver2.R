# Counting Point Mutations (Rosalind HAMM) - Manual Iteration Version
# Author: Kien Nguyen
# Demonstrates step-by-step Hamming distance calculation with a for loop
#Read and split data:
sequences <- readLines("rosalind_hamm.txt")
s1 <- strsplit(sequences[[1]], "")[[1]]
s2 <- strsplit(sequences[[2]], "")[[1]]
#Put value of "mutations" at 0
mutations <- 0

#Run the same position between the 2 sequences and check if there is any difference between them
for(i in seq_along(s1)){
  b1 <- s1[i]
  b2 <- s2[i]
#If there is difference, increase the value in "mutations" by 1:
if(b1 != b2){
  mutations <- mutations +1
}
}
cat(mutations)
