# Inferring mRNA from Protein (Rosalind MRNA)
# Author: Kien Nguyen
# Calculates the number of possible RNA sequences that could encode a given protein
# Uses codon degeneracy (number of codons per amino acid) and multiplies by 3 (stop codons)
# Returns the result modulo 1,000,000

# Codon degeneracy: number of codons that encode each amino acid
# (Based on the standard genetic code)
codon_table <- c(
  "A" = 4, "R" = 6, "N" = 2, "D" = 2, "C" = 2,
  "E" = 2, "Q" = 2, "G" = 4, "H" = 2, "I" = 3,
  "L" = 6, "K" = 2, "M" = 1, "F" = 2, "P" = 4,
  "S" = 6, "T" = 4, "W" = 1, "Y" = 2, "V" = 4
)

solved_problem <- function(protein_seq) {
  # Split protein sequence into individual amino acids
  amino_acids <- strsplit(protein_seq, "")[[1]]
  
  # Start with 3 (for the 3 possible stop codons: UAA, UAG, UGA)
  result <- 3
  
  # Multiply by the number of codons for each amino acid
  for (aa in amino_acids) {
    result <- result * codon_table[aa]
    result <- result %% 1000000  # Keep numbers manageable
  }
  
  return(result)
}

# Read input from file
protein_seq <- readLines("rosalind_mrna.txt")
result <- solved_problem(protein_seq)
cat(result, "\n")
