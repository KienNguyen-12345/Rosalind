# Finding a Spliced Motif (Rosalind SSEQ)
# Author: Kien Nguyen
# Finds the positions in sequence s that form the subsequence t
# Uses a greedy two-pointer approach: O(n) time complexity

# Read input: first line is sequence s, second line is motif t
lines <- readLines("rosalind_sseq.txt")
s <- lines[1]
t <- lines[2]

# Convert strings to character vectors
s_chars <- strsplit(s, "")[[1]]
t_chars <- strsplit(t, "")[[1]]

# Two-pointer approach
indices <- integer(0)  # Store matched positions
j <- 1                 # Pointer for t (the motif)

for (i in seq_along(s_chars)) {
  # If we've matched all characters in t, stop early
  if (j > length(t_chars)) break
  
  # If current character in s matches the next needed character in t
  if (s_chars[i] == t_chars[j]) {
    indices <- c(indices, i)  # Record position (1-based)
    j <- j + 1                # Move to next character in t
  }
}

# Check if we found the complete subsequence
if (j > length(t_chars)) {
  cat(paste(indices, collapse = " "), "\n")
} else {
  cat("No valid subsequence found\n")
}
