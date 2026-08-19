library(httr)

uniprot_ids <- readLines("rosalind_mprt.txt")
find_motif_positions <- function(seq) {
  # gregexpr with a lookahead: matches N at every position where
  # N is followed by [^P][ST][^P], without consuming those 3 chars,
  # so overlapping matches are still found on the next iteration.
  matches <- gregexpr("N(?=[^P][ST][^P])", seq, perl = TRUE)[[1]]
  if (matches[1] == -1) return(integer(0))  # no match found
  return(matches)  # 1-based start positions, exactly what Rosalind wants
}

for (id in uniprot_ids) {
  accession <- sub("_.*", "", id)
  url <- paste0("https://rest.uniprot.org/uniprotkb/", accession, ".fasta")
  response <- GET(url)

  fasta_text <- content(response, as = "text", encoding = "UTF-8")
  lines <- strsplit(fasta_text, "\n")[[1]]
  
  # First line is the header (starts with ">"); rest is sequence, possibly wrapped across lines
  seq <- paste(lines[-1], collapse = "")
  
  positions <- find_motif_positions(seq)
  
  if (length(positions) > 0) {
    cat(id, "\n")
    cat(paste(positions, collapse = " "), "\n")
  }
}

