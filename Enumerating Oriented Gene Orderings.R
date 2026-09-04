# Enumerating Oriented Gene Orderings (Rosalind SIGN)
# Author: Kien Nguyen
# Generates all signed permutations of numbers 1..n
# Each number appears exactly once, with either + or - sign
# Total count = n! × 2^n

# Read input
n <- as.numeric(readLines("rosalind_sign.txt"))

# Initialize variables
remaining <- 1:n
result <- list()
current <- c()

# Recursive function to generate signed permutations
generate_permutation <- function(current, remaining) {
  # Base case: if we've used all numbers, record the permutation
  if (length(current) == n) {
    result[[length(result) + 1]] <<- current
    return()
  }
  
  # For each remaining number, branch to both positive and negative
  for (x in remaining) {
    new_remaining <- remaining[remaining != x]
    
    # Branch 1: positive x
    generate_permutation(c(current, x), new_remaining)
    
    # Branch 2: negative x
    generate_permutation(c(current, -x), new_remaining)
  }
}

# Start generating
generate_permutation(current, remaining)

# Write output
total_count <- factorial(n) * 2^n
writeLines(
  c(
    as.character(total_count),
    sapply(result, paste, collapse = " ")
  ),
  "result.txt"
)
