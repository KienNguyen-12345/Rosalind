# Ordering Strings of Varying Length Lexicographically (Rosalind LEXV)
# Author: Kien Nguyen
# Generates all strings of length 1 to n from a given alphabet (with repetition allowed)
# Output is sorted lexicographically based on the input alphabet order
# Unlike LEXF, this includes strings of ALL lengths from 1 to n

# Read input: first line = alphabet, second line = maximum length n
alphabet_line <- readLines("rosalind_lexv.txt")[1]
bases <- strsplit(alphabet_line, " ")[[1]]
n <- as.numeric(readLines("rosalind_lexv.txt")[2])

# Recursive function to generate all strings of length 1 to n
# Parameters:
#   current - the current string being built
#   bases   - the alphabet to use
#   n       - maximum string length
generate_strings <- function(current, bases, n) {
  # Print the current string if it's not empty
  # This includes all strings of length 1 to n
  if (nchar(current) > 0) {
    cat(current, "\n")
  }
  
  # Stop recursion if we've reached the maximum length
  if (nchar(current) == n) {
    return()
  }
  
  # Recursive case: append each base and continue
  for (i in bases) {
    new_current <- paste0(current, i)
    generate_strings(new_current, bases, n)
  }
}

# Redirect output to file
sink("result.txt")

# Start the recursive generation with empty string
generate_strings("", bases, n)

# Stop redirecting output
sink()
