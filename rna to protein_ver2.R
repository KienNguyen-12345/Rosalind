# RNA to Protein Translation (Rosalind PROT) - Manual Codon Table Version
# Author: Kien Nguyen
# No external packages - implements translation with a custom codon lookup table

codon_table <- c(
  "UUU"="F", "UUC"="F", "UUA"="L", "UUG"="L",
  "UCU"="S", "UCC"="S", "UCA"="S", "UCG"="S",
  "UAU"="Y", "UAC"="Y", "UAA"="Stop", "UAG"="Stop",
  "UGU"="C", "UGC"="C", "UGA"="Stop", "UGG"="W",
  "CUU"="L", "CUC"="L", "CUA"="L", "CUG"="L",
  "CCU"="P", "CCC"="P", "CCA"="P", "CCG"="P",
  "CAU"="H", "CAC"="H", "CAA"="Q", "CAG"="Q",
  "CGU"="R", "CGC"="R", "CGA"="R", "CGG"="R",
  "AUU"="I", "AUC"="I", "AUA"="I", "AUG"="M",
  "ACU"="T", "ACC"="T", "ACA"="T", "ACG"="T",
  "AAU"="N", "AAC"="N", "AAA"="K", "AAG"="K",
  "AGU"="S", "AGC"="S", "AGA"="R", "AGG"="R",
  "GUU"="V", "GUC"="V", "GUA"="V", "GUG"="V",
  "GCU"="A", "GCC"="A", "GCA"="A", "GCG"="A",
  "GAU"="D", "GAC"="D", "GAA"="E", "GAG"="E",
  "GGU"="G", "GGC"="G", "GGA"="G", "GGG"="G"
)

rna_translate <- function(sequence){
#define starting position:
pos_0 <- seq(from = 1, to = nchar(sequence) - 2, 3)

#define codon:a
codon <- substring(sequence, first =  pos_0, last = pos_0 +2)

#translate:

translate <- codon_table[codon]
translate
#define when to stop:
stop_index <- which(translate == "Stop")[1]

if(!is.na(stop_index)){
  translate <- translate[1:(stop_index-1)]
}
paste(translate, collapse = "")
}

sequence <- readLines("rosalind_prot.txt")
sequence <- paste(sequence_lines, collapse = "")
cat(rna_translate(sequence), file = 'protein_result_v2')
