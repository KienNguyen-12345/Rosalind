# Complementing a Strand of DNA (Rosalind REVC) - Base R Version
# Author: Kien Nguyen
# No external dependencies - manual reverse complement
# Step 1: Complement (A<->T, C<->G)
# Step 2: Reverse the string
#Input data:
seq <- readLines("rosalind_revc.txt")

#Dynamic character replacement: A -> T, C -> G, T -> A, G -> C
comp_seq <- chartr("ACTG", "TGAC", seq)
#Reverse the sequence of comp_seq to make it reverse from the seq sequence
reverse_string <- paste(rev(unlist(strsplit(comp_seq, split = ""))), collapse = "")
#explain:
# strsplit(comp_seq,split = "") means split the string into a list using no space as pattern
# unlist(strsplit()) is used to make the list just created to individual vectors
# rev() reverse the sequence of vectors created
# Paste() Concatenate vectors after converting to character
cat(reverse_string)
