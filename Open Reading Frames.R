library(Biostrings)
#Read data:
dna <- readDNAStringSet("rosalind_orf (2).txt")[[1]]

#Establish functions:
solved_problem <- function(dna){
  # Find all ORFs in a given DNA sequence, for one reading frame
  find_orf <- function(dna, frame){
    starts <- frame + 1
    orf_starts <- numeric(0)
    # Phase 1: collect all ATGs in this frame
    #----------------------------------------
    #i is the value of the position of the starting codon
    for(i in seq(from = starts, to =length(dna)-2, by = 3 )){
      codon <- subseq(dna, start = i, end = i + 2)
      #_____________________________________
      #if meet ATG and yet inside ORF
      if(as.character(codon) == "ATG" ){
        orf_starts <- c(orf_starts, i)  
      }
      #_____________________________________
    }
    #----------------------------------------
    #Phase 2: collect the sequence after find ATG:
    #Create the list of protein, start with empty value:
    proteins <- character(0)
      #Extract sequence starting from "ATG"
    #_____________________________________
        for(start in orf_starts){
          #j is the value of the position of the STOP codon
          for (j in seq(from = start, to = length(dna) - 2, by = 3)){
            codon <- subseq(dna, start = j, end = j + 2)
            codon_char <- as.character(codon)
            # Stop finding – extract and translate
            if (codon_char %in% c("TAA", "TAG", "TGA")) {
              orf <- subseq(dna, start = start, end = j + 2)
          #Translate ORF
          protein <- translate(orf)
          #Remove the "*" sign indicating stop codon in the sequence
          protein <- sub(pattern = "\\*$", replacement = "", as.character(protein))
          #Save protein into the list "proteins"
          proteins <- c(proteins, protein)
          #Break
          break # <- move to the next "ATG"
            }
          }
     #_____________________________________
      }
    #----------------------------------------
    #Return the list of proteins after finishing loop
    return(proteins)
  }

    #Phase 3: Find the ORF of the DNA (reverse complementary strand), translate then compile
    #Find reverse complement
    rc <- reverseComplement(dna)
    #Compile all ORFs of the dna sequence:
    all_protein <- c(as.character(find_orf(dna,0)),
                     as.character(find_orf(dna,1)),
                     as.character(find_orf(dna,2)), 
                     as.character(find_orf(rc,0)),
                     as.character(find_orf(rc,1)), 
                     as.character(find_orf(rc,2))
                     )
    #Remove duplicates:
    all_protein <- unique(all_protein)
    #Print result into a file named "result"
    cat(all_protein, sep = "\n", file = "result")
}

solved_problem(dna)