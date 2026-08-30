# Rosalind Bioinformatics Solutions in R

[![Language](https://img.shields.io/badge/Language-R_%3E%3D_4.0-blue.svg)](https://www.r-project.org/)
[![Bioconductor](https://img.shields.io/badge/Bioconductor-Biostrings-green.svg)](https://bioconductor.org/packages/release/bioc/html/Biostrings.html)
[![Platform](https://img.shields.io/badge/Platform-Rosalind-purple.svg)](https://rosalind.info/)

A curated collection of clean, idiomatic, and efficient **R** solutions to algorithmic bioinformatics challenges from [Rosalind](https://rosalind.info/). This repository covers foundational sequence manipulation, 6-frame open reading frame (ORF) discovery, probabilistic sequence modeling, combinatorics, lexicographic enumeration, dynamic programming, population genetics, graph theory, and motif discovery using base R and high-performance Bioconductor packages.

---

## 📌 Project Overview

This repository demonstrates practical implementations of computational biology algorithms, emphasizing:
- **Idiomatic R & Vectorization:** Writing efficient R code with minimized overhead and vectorized transformations.
- **Bioconductor Integration:** Leveraging standard high-throughput sequence analysis packages like `Biostrings` for FASTA parsing, 6-frame ORF extraction, translation, consensus matrices, letter frequencies, and reverse complementation.
- **Probabilistic Modeling & Random Strings:** Modeling random GC-content backgrounds using log-probabilities ($\log_{10} P$), computing sequence matching probabilities across Bernoulli trials, and preventing arithmetic underflow.
- **Lexicographic & Combinatorial Search:** Constructing fixed-length and variable-length strings in defined alphabetical orders using recursive depth-first tree traversal.
- **Combinatorics & Modular Arithmetic:** Calculating partial permutations $P(n, k)$ and large reverse-translation spaces modulo $1{,}000{,}000$, as well as exact factorials with `gmp`.
- **Dynamic Programming & Population Dynamics:** Implementing classical and mortal recurrence relations with mortality/lifespan limits via state-tracking vectors.
- **String Algorithms & Pattern Matching:** Utilizing PCRE regular expressions (lookaheads, zero-width assertions), sliding-window substring extractions, prefix/suffix graph lookups, and two-pointer greedy scans.
- **Mutation & Evolutionary Metrics:** Calculating transition/transversion ratios ($R = \text{transitions} / \text{transversions}$) and pairwise point mutation distances.

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
│   ├── open_reading_frames.R             # Open Reading Frames (ORF) [6-Frame Scan]
│   ├── mendels_first_law.R               # Mendel's First Law (IPRB)
│   ├── recurrence_rabbits.R              # Rabbits and Recurrence Relations (FIB)
│   ├── mortal_fibonacci_rabbits.R        # Mortal Fibonacci Rabbits (FIBD)
│   ├── consensus_profile.R               # Consensus and Profile Matrix (CONS)
│   ├── overlap_graphs.R                  # Overlap Graphs (GRPH)
│   ├── expected_offspring.R              # Calculating Expected Offspring (IEV)
│   ├── random_strings_prob.R             # Introduction to Random Strings (PROB)
│   ├── random_strings_eval.R             # Matching Random Motifs / String Evaluation (EVAL)
│   ├── partial_permutations.R            # Partial Permutations (PPER)
│   ├── RNA_splicing.R                    # RNA Splicing & Exon Translation (SPLC)
│   ├── spliced_motif.R                   # Finding Spliced Subsequence Motif (SSEQ)
│   ├── protein_motif_search.R            # Finding Protein Motif via UniProt API (MPRT)
│   ├── independent_alleles.R             # Mendelian Inheritance Probability (LIA)
│   ├── mrna_inferring.R                  # Inferring mRNA from Protein (MRNA)
│   ├── gene_orders_permutations.R        # Enumerating Gene Orders (PERM)
│   ├── lex_k_mers.R                      # Enumerating k-mers Lexicographically (LEXF)
│   ├── lex_variable_length.R             # Ordering Strings of Varying Length (LEXV)
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
| **`GC`** | Computing GC Content | FASTA Parsing & Ratio Analysis | `Biostrings::letterFrequency` / Vectorized `sapply` |
| **`HAMM`** | Counting Point Mutations | Vectorized & Iterative Hamming Distance | Vector comparison `sum(s1 != s2)` / for-loop accumulator |
| **`TRAN`** | Transitions and Transversions | Purine/Pyrimidine Mutation Classification | Pairwise character comparison & ratio computation |
| **`SUBS`** | Finding a Motif in DNA | Substring Sliding Window | Vectorized `substr()` & index matching |
| **`PROT`** | Translating RNA into Protein | Genetic Code Translation & Codon Engine | `Biostrings::translate` / Vectorized custom 64-codon dictionary |
| **`ORF`** | Open Reading Frames | 6-Frame Translation & Stop Codon Parsing | `Biostrings`, reading frames (0, 1, 2 forward & reverse) |
| **`IPRB`** | Mendel's First Law | Mendelian Inheritance & Probability | Analytical complementary probability |
| **`FIB`** | Rabbits & Recurrence Relations | Dynamic Programming / Recurrence | Vector pre-allocation ($O(n)$) |
| **`FIBD`** | Mortal Fibonacci Rabbits | Dynamic Programming / Age Shifting | Vector state-tracking with `gmp::bigz` |
| **`CONS`** | Consensus and Profile | Alignment Matrix & Position Scoring | `Biostrings::consensusMatrix` |
| **`GRPH`** | Overlap Graphs | Prefix/Suffix Hash Lookups ($k=3$) | `base::split` hash lookups & adjacency list |
| **`IEV`** | Calculating Expected Offspring | Linearity of Expectation | Vectorized dot product `sum(couples * prob)` |
| **`PROB`** | Introduction to Random Strings | Log-Likelihood & GC-content Backgrounds | Log-space probabilities $\log_{10} P(s \mid x)$ |
| **`EVAL`** | Matching Random Motifs | Bernoulli Trials & Independence Probability | Single-string matching $P(s) = (\frac{x}{2})^{GC} (\frac{1-x}{2})^{AT}$ |
| **`PPER`** | Partial Permutations | Modular Combinatorics ($P(n, k) \pmod{10^6}$) | Cumulative product modulo $1{,}000{,}000$ |
| **`SPLC`** | RNA Splicing | Exon Extraction & Splicing | `Biostrings`, `gsub(fixed=TRUE)` |
| **`SSEQ`** | Finding a Spliced Motif | Subsequence Greedy Scan ($O(n)$) | Two-pointer traversal |
| **`MPRT`** | Finding a Protein Motif | REST API & Lookahead Regex | `httr`, `gregexpr(perl=TRUE)` |
| **`LIA`** | Independent Alleles | Binomial Cumulative Density Function | `stats::pbinom` |
| **`MRNA`** | Inferring mRNA from Protein | Modular Arithmetic / Reverse Translation | Frequency mapping modulo $10^6$ |
| **`PERM`** | Enumerating Gene Orders | Recursive Backtracking | Tree recursion & permutation pooling |
| **`LEXF`** | Enumerating $k$-mers Lexicographically | Exact-Depth Recursive Backtracking | Depth-bounded recursive string building |
| **`LEXV`** | Ordering Strings of Varying Length | Variable-Depth Prefix Tree Traversal | Pre-order recursive traversal up to length $n$ |
| **`PMCH`** | Perfect Matchings & RNA Structures | Big Integer Combinatorics ($n!$) | `gmp::factorialZ` |

---

## 🚀 Key Highlights & Implementations

### 1. Lexicographic Enumeration of Varying Lengths (`LEXV`)
Generating all strings up to length $n$ under a custom alphabet ordering using pre-order tree traversal:
```R
solved_problem <- function(current) {
  if (nchar(current) != 0) {
    cat(current, "
")
  }
  if (nchar(current) == n) {
    return()
  }
  for (i in bases) {
    solved_problem(paste0(current, i))
  }
}
```

### 2. Fixed-Length $k$-mer Enumeration (`LEXF`)
Generating all ordered combinations of length $n$ using exact recursion depth triggers:
```R
solved_problem <- function(current) {
  if (nchar(current) == n) {
    cat(current, "
")
    return()
  }
  for (i in bases) {
    solved_problem(paste0(current, i))
  }
}
```

### 3. Matching Probability in Random String Ensembles (`EVAL`)
Calculating single-string probability under Bernoulli distribution with given GC probability:
```R
q_1 <- ((1 - gc_prob) / 2)^at_count * (gc_prob / 2)^gc_count
```

### 4. 6-Frame Open Reading Frame Discovery (`ORF`)
Scanning all three forward and three reverse-complement reading frames, tracking start codons (`ATG`) to stop codons (`TAA`, `TAG`, `TGA`), and deduplicating unique translated protein candidates:
```R
library(Biostrings)
dna <- readDNAStringSet("rosalind_orf.txt")[[1]]
rc  <- reverseComplement(dna)

find_orf <- function(dna_seq, frame) {
  # Collect start positions and scan in-frame until stop codon
  ...
}

candidates <- unique(c(
  find_orf(dna, 0), find_orf(dna, 1), find_orf(dna, 2),
  find_orf(rc, 0),  find_orf(rc, 1),  find_orf(rc, 2)
))
```

### 5. Mortal Fibonacci Rabbits (`FIBD`)
Simulating demographic age shifts with mortality limits $m$ using `gmp::bigz` to prevent integer overflow over large generational intervals:
```R
library(gmp)
ages <- as.bigz(rep(0, times = m))
ages[1] <- as.bigz(1)

for (month in 2:n) {
  newborns <- sum(ages[2:m])
  ages <- c(newborns, ages[1:(m - 1)])
}
total_population <- sum(ages)
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
Rscript scripts/lex_variable_length.R
```
