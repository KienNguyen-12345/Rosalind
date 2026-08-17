library(Biostrings)
bases <- c("A","C","G","T")

xx <- DNAMultipleAlignment(readDNAStringSet("rosalind_cons.txt"))

result <- function(xx){
profile <-consensusMatrix(xx, bases,
                          as.prob = FALSE) [1:4,]
concensus <- paste0(bases[apply(profile, 2, which.max)],
                    collapse = "")
cat(concensus)
}
result(xx)
result
concensus
profile
