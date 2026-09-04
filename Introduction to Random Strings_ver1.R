# Introduction to Random Strings (Rosalind PROB)
# Author: Kien Nguyen
# Calculates the log10 probability of a DNA sequence for each given GC-content value
# Formula: log10(Pr) = GC_count × log10(GC/2) + AT_count × log10((1-GC)/2)

# Read input: first line is sequence, second line is gc_content of GC-content values
sequence <- readLines("rosalind_prob.txt")[1]

# Count G and C bases
bases <- strsplit(sequence,"")[[1]]
gc_count <- sum(bases %in% c("G","C"))

# Parse the gc_content of GC-content values
at_number <- length(bases) -  gc_count

#Get the gc_content sequence, split the string and transform to number
gc_content <- as.character(readLines("rosalind_prob.txt")[2])
gc_content <- strsplit(gc_content, " ")[[1]]
gc_content <- as.numeric(gc_content)

#Establish function
solved_problem <- function(gc_content){
  for(i in 1: length(gc_content)){
    x <- gc_content[i]
    result <- gc_count * log10(x / 2) +
      at_number * log10((1 - x) / 2)
    result <- round(result, 3)
    cat(result, "")
  }
  }
solved_problem(gc_content)


