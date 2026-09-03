# RNA Splicing (Rosalind SPLC)
# Author: Kien Nguyen
# Removes introns from a DNA sequence, then translates the spliced sequence to protein
# Uses Biostrings::translate for translation

library(Biostrings)

# Read sequences from FASTA file
# First sequence = main DNA, remaining = introns
sequences <- readDNAStringSet("rosalind_splc.txt")
main_seq <- as.character(sequences[[1]])
introns <- as.character(sequences[-1])

# Remove all introns from the main sequence
# fixed = TRUE for exact string matching (faster than regex)
for (intron in introns) {
  main_seq <- gsub(intron, "", main_seq, fixed = TRUE)
}

# Convert spliced DNA to DNAString object and translate to protein
spliced_DNA <- DNAString(main_seq)
protein <- translate(spliced_DNA)

# Remove the trailing stop codon (*) and print
protein_str <- as.character(sub("\\*$", "", protein))
cat(protein_str, "\n")
