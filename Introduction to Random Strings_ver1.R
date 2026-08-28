sequence <- readLines("rosalind_prob (1).txt")[1]

bases <- strsplit(sequence,"")[[1]]
gc_count <- sum(bases %in% c("G","C"))



at_number <- length(bases) -  gc_count

Array <- c(0.089, 0.166, 0.186, 0.234, 0.309, 0.346, 0.440, 0.468, 0.533, 0.577, 0.636, 0.707, 0.769, 0.813, 0.875, 0.906)
solved_problem <- function(Array){
  for(i in 1: length(Array)){
    x <- Array[i]
    result <- gc_count * log10(x / 2) +
      at_number * log10((1 - x) / 2)
    cat(round(result, 3), "", file= "result")
  }
}
solved_problem(Array)


