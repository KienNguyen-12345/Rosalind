# Rosalind Bioinformatics Solutions in R

[![Language](https://img.shields.io/badge/Language-R_%3E%3D_4.0-blue.svg)](https://www.r-project.org/)
[![Bioconductor](https://img.shields.io/badge/Bioconductor-Biostrings-green.svg)](https://bioconductor.org/packages/release/bioc/html/Biostrings.html)
[![Platform](https://img.shields.io/badge/Platform-Rosalind-purple.svg)](https://rosalind.info/)

A curated collection of clean, idiomatic, and efficient **R** solutions to algorithmic bioinformatics challenges from [Rosalind](https://rosalind.info/). This repository covers foundational sequence manipulation, dynamic programming, probabilistic genetics, combinatorics, graph theory, mutation analysis, and motif discovery using base R and high-performance Bioconductor packages.

---

## 📌 Project Overview

This repository demonstrates practical implementations of computational biology algorithms, emphasizing:
- **Idiomatic R & Vectorization:** Writing efficient R code with minimized overhead and vectorized sequence transformations.
- **Bioconductor Integration:** Leveraging standard high-throughput sequence analysis packages like `Biostrings` for FASTA parsing, translation, consensus matrices, and reverse complementation.
- **Exact Numeric Computing:** Handling arbitrary-precision combinatorial calculations using `gmp`.
- **String Algorithms & Pattern Matching:** Utilizing PCRE regular expressions (lookaheads, zero-width assertions), substring extractions, prefix/suffix graph lookups, and two-pointer greedy scans.
- **Mutation & Evolutionary Metrics:** Calculating transition/transversion ratios ($R = 	ext{transitions} / 	ext{transversions}$) and point mutation distances.
- **Probabilistic Modeling:** Calculating Mendelian inheritance probabilities, expected dominant phenotypes, and binomial distributions.

---

## 📂 Repository Structure

```text
.
├── scripts/
│   ├── counting_dna_nucleotides.R        # Counting DNA Nucleotides (DNA)
│   ├── DNA_transcription.R               # Transcribing DNA into RNA (RNA)
│   ├── reverse_complement.R              # Complementing a Strand of DNA (REVC)
│   ├── gc_content.R                      # Computing GC Content (GC)
│   ├── hamming_distance.R                # Counting Point Mutations (HAMM)
│   ├── transitions_transversions.R       # Transitions and Transversions (TRAN)
│   ├── motif_search_dna.R                # Finding a Motif in DNA (SUBS)
│   ├── RNA_translation.R                 # Translating RNA into Protein (PROT)
│   ├── mendels_first_law.R               # Mendel's First Law (IPRB)
│   ├── recurrence_rabbits.R              # Rabbits and Recurrence Relations (FIB)
│   ├── consensus_profile.R               # Consensus and Profile Matrix (CONS)
│   ├── overlap_graphs.R                  # Overlap Graphs (GRPH)
│   ├── expected_offspring.R              # Calculating Expected Offspring (IEV)
│   ├── RNA_splicing.R                    # RNA Splicing & Exon Translation (SPLC)
│   ├── spliced_motif.R                   # Finding Spliced Subsequence Motif (SSEQ)
│   ├── protein_motif_search.R            # Finding Protein Motif via UniProt API (MPRT)
│   ├── independent_alleles.R             # Mendelian Inheritance Probability (LIA)
│   └── perfect_matchings_rna.R           # RNA Secondary Structure Combinatorics (PMCH)
├── data/                                 # Sample input files (.txt, .fasta)
├── README.md                             # Repository documentation
└── LICENSE                               # MIT License
```

---

## 🔬 Solved Problems & Algorithmic Concepts

| Problem Code | Problem Title | Algorithmic / Biological Focus | Key Libraries / Approaches |
| :--- | :--- | :--- | :--- |
| **`DNA`** | Counting DNA Nucleotides | Character Frequency Counting | `stringr::str_count` / `Biostrings::alphabetFrequency` |
| **`RNA`** | Transcribing DNA into RNA | Nucleic Acid Substitution | `chartr()` |
| **`REVC`** | Complementing a Strand of DNA | Reverse Complement Generation | `chartr()` + `rev()`, `Biostrings::reverseComplement` |
| **`GC`** | Computing GC Content | FASTA Parsing & Ratio Analysis | `Biostrings::letterFrequency` |
| **`HAMM`** | Counting Point Mutations | Vectorized Hamming Distance | Vector comparison `sum(s1 != s2)` |
| **`TRAN`** | Transitions and Transversions | Purine/Pyrimidine Mutation Classification | Pairwise character comparison & ratio computation |
| **`SUBS`** | Finding a Motif in DNA | Substring Sliding Window | Vectorized `substr()` & index matching |
| **`PROT`** | Translating RNA into Protein | Genetic Code Translation | `Biostrings::translate` |
| **`IPRB`** | Mendel's First Law | Mendelian Inheritance & Probability | Analytical complementary probability |
| **`FIB`** | Rabbits & Recurrence Relations | Dynamic Programming / Recurrence | Vector pre-allocation ($O(n)$) |
| **`CONS`** | Consensus and Profile | Alignment Matrix & Position Scoring | `Biostrings::consensusMatrix` |
| **`GRPH`** | Overlap Graphs | Prefix/Suffix Hash Lookups ($k=3$) | `base::split` hash lookups & adjacency list |
| **`IEV`** | Calculating Expected Offspring | Linearity of Expectation | Vectorized dot product `sum(couples * prob)` |
| **`SPLC`** | RNA Splicing | Exon Extraction & Splicing | `Biostrings`, `gsub(fixed=TRUE)` |
| **`SSEQ`** | Finding a Spliced Motif | Subsequence Greedy Scan ($O(n)$) | Two-pointer traversal |
| **`MPRT`** | Finding a Protein Motif | REST API & Lookahead Regex | `httr`, `gregexpr(perl=TRUE)` |
| **`LIA`** | Independent Alleles | Binomial Cumulative Density Function | `stats::pbinom` |
| **`PMCH`** | Perfect Matchings & RNA Structures | Big Integer Combinatorics ($n!$) | `gmp::factorialZ` |

---

## 🚀 Key Highlights & Implementations

### 1. Transition/Transversion Ratio (`TRAN`)
Distinguishing purine-to-purine (A <-- > G) and pyrimidine-to-pyrimidine (C <--> T) transitions from transversions across aligned DNA strings:
```R
transitions <- 0
transversions <- 0

for (i in seq_along(s1_char)) {
  if (s1_char[i] != s2_char[i]) {
    pair <- paste0(s1_char[i], s2_char[i])
    if (pair %in% c("AG", "GA", "CT", "TC")) {
      transitions <- transitions + 1
    } else {
      transversions <- transversions + 1
    }
  }
}
ratio <- transitions / transversions
```

### 2. Base R Reverse Complement (`REVC`)
Fast complementary strand construction using base R character translation and vector reversal:
```R
dna_seq <- chartr("ACTG", "TGAC", data)
reverse_string <- paste(rev(unlist(strsplit(dna_seq, NULL))), collapse = "")
```

### 3. Vectorized Hamming Distance (`HAMM`)
Calculating point mutations efficiently by splitting strings into character vectors and performing element-wise logical comparisons:
```R
s1_vec <- unlist(strsplit(s1, ""))
s2_vec <- unlist(strsplit(s2, ""))
hamming_dist <- sum(s1_vec != s2_vec)
```

### 4. Hash-Based Overlap Graph Construction (`GRPH`)
Efficient prefix-to-suffix lookup using hash lists instead of brute-force pairwise iterations:
```R
prefix <- substr(seq, 1, 3)
suffix <- substr(seq, nchar(seq) - 2, nchar(seq))
prefix_lookup <- split(seq_along(ids), prefix)

edges <- c()
for (i in seq_along(ids)) {
  matches <- prefix_lookup[[suffix[i]]]
  matches <- matches[matches != i]
  if (length(matches) > 0) {
    edges <- c(edges, paste(ids[i], ids[matches]))
  }
}
```

### 5. Zero-Width Lookahead for Overlapping Motifs (`MPRT`)
To identify N-glycosylation motifs (`N{P}[ST]{P}`) without consuming overlapping positions, Perl-Compatible Regular Expressions (PCRE) with positive lookahead are utilized:
```R
matches <- gregexpr("N(?=[^P][ST][^P])", seq, perl = TRUE)[[1]]
```

### 6. High-Performance Exon Splicing (`SPLC`)
Direct string parsing and sequential intron stripping before in-frame translation:
```R
library(Biostrings)
sequences <- readDNAStringSet("rosalind_splc.txt")
main_seq  <- as.character(sequences[[1]])
introns   <- as.character(sequences[-1])

for (intron in introns) {
  main_seq <- gsub(intron, "", main_seq, fixed = TRUE)
}
protein <- translate(DNAString(main_seq))
```

### 7. Exact Large Integer Factorials (`PMCH`)
Standard double-precision arithmetic overflows at $171!$. Exact RNA matching counts are computed with arbitrary precision:
```R
library(gmp)
# result = |A|! * |C|!
result <- factorialZ(count_A) * factorialZ(count_C)
```

---

## ⚙️ Prerequisites & Setup

### Requirements
- **R** >= 4.0.0
- **CRAN Packages:** `httr`, `gmp`, `stringr`, `tidyverse`
- **Bioconductor Packages:** `Biostrings`

### Installation
Run the following in your R console:

```R
# Install CRAN packages
install.packages(c("httr", "gmp", "stringr", "tidyverse"))

# Install Bioconductor packages
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install("Biostrings")
```

---

## 🧪 Running Solutions

Clone the repository and run any problem script directly from your terminal:

```bash
git clone https://github.com/<your-username>/rosalind-r-solutions.git
cd rosalind-r-solutions
Rscript scripts/RNA_splicing.R
```
