sequence <- readLines("rosalind_prob (2).txt")[1]

bases <- strsplit(sequence,"")[[1]]
gc_count <- sum(bases %in% c("G","C"))



at_number <- length(bases) -  gc_count

Array <- as.character(readLines("rosalind_prob (2).txt")[2])
Array <- as.numeric(strsplit(Array, " ")[[1]])
Array
solved_problem <- function(Array){
  for(i in 1: length(Array)){
    x <- Array[i]
    result <- gc_count * log10(x / 2) +
      at_number * log10((1 - x) / 2)
    result <- round(result, 3)
    cat(result, "")
  }
  }
solved_problem(Array)


