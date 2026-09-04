# Finding a Motif in DNA (Rosalind SUBS) - Regex Lookahead Version
# Author: Kien Nguyen
# Uses regex lookahead to find overlapping motif matches

s <- "GATATATGCATATACTT"
t <- "ATAT"

# Construct lookahead pattern: (?=ATAT)
# This matches positions where ATAT appears, without consuming characters
# Allows overlapping matches (e.g., ATATAT has matches at 1 and 3)
pattern <- paste0("(?=", t, ")")

# Find all match positions (1-based indexing)
matches <- gregexpr(pattern, s, perl = TRUE)[[1]]

# Print results
if (matches[1] != -1) {
  cat(paste(matches, collapse = " "), "\n")
} else {
  cat("No matches found\n")
}
