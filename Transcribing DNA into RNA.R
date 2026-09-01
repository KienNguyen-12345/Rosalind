# Transcribing DNA into RNA (Rosalind RNA)
# Author: Kien Nguyen
# Reads rosalind_rna.txt, replaces T with U, and prints the RNA sequence

sequence <- readLines("rosalind_rna.txt")
transcript <- chartr("T", "U", sequence)
cat(transcript)
