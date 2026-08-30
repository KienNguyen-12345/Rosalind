seq <- readLines("rosalind_lexf (1).txt")[1]
bases <-strsplit(seq," ")[[1]]
n <-  readLines("rosalind_lexf (1).txt")[2]

current <- ""


solved_problem <- function(current){
  
  if(nchar(current) == n){
    
    cat(current,"\n")
    
    return()
    
  }
  
  
  for (i in bases){
    new_current <- paste0(current, i)
    
    solved_problem(new_current)
    
  }
}

# Redirect output to result.txt
sink("result.txt")

# Start the recursive function
solved_problem(current)

# Stop redirecting output
sink()