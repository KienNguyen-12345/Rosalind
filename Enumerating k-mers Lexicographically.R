# Enumerating k-mers Lexicographically (Rosalind LEXF)
# Author: Kien Nguyen
# Generates all strings of length n from a given alphabet (with repetition allowed)
# Output is sorted lexicographically based on the input alphabet order

# Read input: first line = alphabet, second line = string length n
alphabet_line <- readLines("rosalind_lexf.txt")[1]
bases <- strsplit(alphabet_line, " ")[[1]]
n <- as.numeric(readLines("rosalind_lexf.txt")[2])

# Recursive function to generate all strings of length n
# Parameters:
#   current - the current string being built
#   bases   - the alphabet to use
#   n       - target string length
generate_strings <- function(current, bases, n) {
  # Base case: if we've reached the target length, print the string
  if (nchar(current) == n) {
    cat(current, "\n")
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

# Start the recursive generation
generate_strings("", bases, n)

# Stop redirecting output
sink()
