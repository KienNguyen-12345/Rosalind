library(stringr)

data <- readLines("rosalind_dna.txt")

count_2 <- str_count(data,pattern = c("A","C","G","T"))
cat(count_2)
