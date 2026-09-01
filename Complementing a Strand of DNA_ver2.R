# Complementing a Strand of DNA (Rosalind REVC) - Base R Version
# Author: Kien Nguyen
# No external dependencies - manual reverse complement
# Step 1: Complement (A<->T, C<->G)
# Step 2: Reverse the string

seq <- readLines("rosalind_revc.txt")

comp_seq <- chartr("ACTG", "TGAC", seq)
reverse_string <- paste(rev(unlist(strsplit(comp_seq, NULL))), collapse = "")

cat(reverse_string)
