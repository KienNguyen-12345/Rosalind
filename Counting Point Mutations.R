# Counting Point Mutations (Rosalind HAMM) - Vectorized Version
# Author: Kien Nguyen
# Uses vectorized comparison to calculate Hamming distance efficiently

#Establish function:
result <- function(s1, s2) {
  #Split the data into individuals vector (synonym with strsplit()[[1]])
  s1_vec <- unlist(strsplit(s1, ""))
  s2_vec <- unlist(strsplit(s2, ""))
  #Indicate all the missmatch into 1 variable
  missmatch <- (s1_vec != s2_vec)
  #Add the of the incidence up and print out result
  cat(sum(missmatch))
}

#Input data:
s1 <- readLines("rosalind_hamm.txt")[1]
s2 <- readLines("rosalind_hamm.txt")[2]
result(s1, s2)
