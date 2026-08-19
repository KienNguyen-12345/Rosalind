library(Biostrings)

sequences <- readDNAStringSet("rosalind_splc.txt")
main_seq <- as.character(sequences[[1]])
introns <- as.character(sequences[-1])
introns

#remove introns:
for(intron in introns){
  main_seq<-gsub(intron, "", main_seq, fixed = T)
}

sliced_DNA <- DNAString(main_seq)
protein <- translate(sliced_DNA)
protein_str <- as.character(sub("\\*$","", protein))
cat(protein_str, "\n")
