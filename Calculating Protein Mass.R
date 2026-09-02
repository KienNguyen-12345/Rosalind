# Calculating Protein Mass (Rosalind PRTM)
# Author: Kien Nguyen
# Calculates the total monoisotopic mass of a protein sequence
# Uses a lookup table with standard amino acid masses


#Establish function:
calculate_protein_weight <- function(seqs){
#Define protein mass table:
mass_table <- c(
A = 71.03711, C  = 103.00919, D  =  115.02694,
E  =  129.04259, F  =  147.06841, G  =  57.02146,
H  =  137.05891, I  =  113.08406, K  =  128.09496,
L  =  113.08406, M  =  131.04049, N  =  114.04293,
P  =  97.05276, Q  =  128.05858, R  =  156.10111,
S  =  87.03203, T  =  101.04768, V =   99.06841,
W =   186.07931, Y =   163.06333)

  #Split string then combine the vectors
amino_acids <- strsplit(seqs, "")[[1]]
  #Use lookup functon to independently look up the mass of each amino acid then sum the value
total_weight <- sum(mass_table[amino_acids])

  #Return as the number 
return(total_weight)
}

sequences <- readLines("rosalind_prtm.txt")
  
calculate_protein_weight(sequences)

