n <- as.numeric(readLines("rosalind_sign (1).txt"))

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
      new_current <- c(current, -x)
      new_remaining <- remaining[remaining!=x] 
      generate_permutation(new_current, new_remaining)
  
}
}
# Start generating:

generate_permutation(current, remaining)

#Generate result:
output <- sapply(result, function(x){
  paste(x, collapse = " ")
})
#Make new file:
file <- file("Result.txt", open = "w")

#Add factorial as the first line nside the file:
writeLines(as.character(factorial(n)* 2^n), file)

#Print permutations inside the file:
for(p in result){
  writeLines(paste(p, collapse = " "), file)
}
#Close the file once done:
close(file)

