seq <- readLines("rosalind_lexv.txt")[1]

bases <- strsplit(seq, " ")[[1]]

n <- as.numeric(readLines("rosalind_lexv.txt")[2])

current <- ""

solved_problem <- function(current){
  
  if(nchar(current) != 0){
    cat(current, "\n")
  }
  
  if(nchar(current) == n){
    return()
  }
  
  for(i in bases){
    
    new_current <- paste0(current, i)
    
    solved_problem(new_current)
    
  }
  
}

sink("result.txt")

solved_problem(current)

sink()