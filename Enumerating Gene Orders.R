# Enumerating Gene Orders (Rosalind PERM)
# Author: Kien Nguyen
# Generates all permutations of numbers 1 through n using recursive backtracking
# Outputs: first line = n!, followed by each permutation on a new line

n <- as.numeric(readLines("rosalind_perm (1).txt"))
remaining <- 1:n
#Create empty variable:
result <- list()
current <- c()
#Function:
generate_permutation <- function(current, remaining){
  # If the current permutation reaches length n, record it to global result
  if (length(current) == n){
  result[[length(result) +1 ]] <<- current
  return() 
  }
  # Iterate over all available numbers to branch into new permutations
  for(x in remaining) {
    new_current <- c(current, x) # Append chosen element to current path
    new_remaining <- remaining[remaining!=x] # Remove chosen element from pool
    generate_permutation(new_current, new_remaining)
  }
}
# Start generating:
generate_permutation(current, remaining)

#Print result (Copy the entire thing is a pain, so let's export the file out):

file <- file("result.txt", open = "w")

#Add factorial as the first line inside the file:
writeLines(as.character(factorial(n)), file)

#Print the permutations inside the file:
for (p in result) {
  writeLines(paste(p, collapse = " "), file)
}
#Close the file once done:
close(file)


    
