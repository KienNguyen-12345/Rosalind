# Rosalind Bioinformatics Solutions in R

[![Language](https://img.shields.io/badge/Language-R_%3E%3D_4.0-blue.svg)](https://www.r-project.org/)
[![Bioconductor](https://img.shields.io/badge/Bioconductor-Biostrings-green.svg)](https://bioconductor.org/packages/release/bioc/html/Biostrings.html)
[![Platform](https://img.shields.io/badge/Platform-Rosalind-purple.svg)](https://rosalind.info/)

A curated collection of clean, idiomatic, and efficient **R** solutions to algorithmic bioinformatics challenges from [Rosalind](https://rosalind.info/). This repository covers foundational sequence manipulation, dynamic programming, probabilistic genetics, combinatorics, and motif discovery using base R and high-performance Bioconductor packages.

---

## 📌 Project Overview

This repository demonstrates practical implementations of computational biology algorithms, emphasizing:
- **Idiomatic R & Vectorization:** Writing efficient R code with minimized overhead and vectorized transformations.
- **Bioconductor Integration:** Leveraging standard high-throughput sequence analysis packages like `Biostrings`.
- **Exact Numeric Computing:** Handling arbitrary-precision combinatorial calculations using `gmp`.
- **String Algorithms & Pattern Matching:** Utilizing PCRE regular expressions (lookaheads, zero-width assertions) and two-pointer greedy scans for spliced motifs.

---

## 📂 Repository Structure

```text
.
├── scripts/
│   ├── DNA_transcription.R               # Transcribing DNA into RNA (RNA)
│   ├── RNA_translation.R                 # Translating RNA into Protein (PROT)
│   ├── RNA_splicing.R                    # RNA Splicing & Exon Translation (SPLC)
│   ├── protein_motif_search.R            # Finding Protein Motif via UniProt API (MPRT)
│   ├── consensus_profile.R               # Consensus and Profile Matrix (CONS)
│   ├── spliced_motif.R                   # Finding Spliced Subsequence Motif (SSEQ)
│   ├── recurrence_rabbits.R              # Rabbits and Recurrence Relations (FIB)
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
| **`RNA`** | Transcribing DNA into RNA | Nucleic Acid Substitution | `chartr()` |
| **`PROT`** | Translating RNA into Protein | Genetic Code Translation | `Biostrings::translate` |
| **`SPLC`** | RNA Splicing | Exon Extraction & Splicing | `Biostrings`, `gsub(fixed=TRUE)` |
| **`MPRT`** | Finding a Protein Motif | REST API & Lookahead Regex | `httr`, `gregexpr(perl=TRUE)` |
| **`CONS`** | Consensus and Profile | Alignment Matrix & Position Scoring | `Biostrings::consensusMatrix` |
| **`SSEQ`** | Finding a Spliced Motif | Subsequence Greedy Scan ($O(n)$) | Two-pointer Traversal |
| **`FIB`** | Rabbits & Recurrence Relations | Dynamic Programming / Recurrence | Vector Pre-allocation ($O(n)$) |
| **`LIA`** | Independent Alleles | Binomial Cumulative Density Function | `stats::pbinom` |
| **`PMCH`** | Perfect Matchings & RNA Structures | Big Integer Combinatorics ($n!$) | `gmp::factorialZ` |

---

## 🚀 Key Highlights & Implementations

### 1. Zero-Width Lookahead for Overlapping Motifs (`MPRT`)
To identify N-glycosylation motifs (`N{P}[ST]{P}`) without consuming overlapping positions, Perl-Compatible Regular Expressions (PCRE) with positive lookahead are utilized:
```R
# Matches 'N' immediately followed by [^P][ST][^P] without consuming trailing residues
matches <- gregexpr("N(?=[^P][ST][^P])", seq, perl = TRUE)[[1]]
```

### 2. High-Performance Exon Splicing (`SPLC`)
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

### 3. Exact Large Integer Factorials (`PMCH`)
Standard double precision overflows at $171!$. Exact RNA matching counts are computed with arbitrary precision:
```R
library(gmp)
# result = |A|! * |C|!
result <- factorialZ(count_A) * factorialZ(count_C)
```

---

## ⚙️ Prerequisites & Setup

### Requirements
- **R** >= 4.0.0
- **CRAN Packages:** `httr`, `gmp`, `stringr`
- **Bioconductor Packages:** `Biostrings`

### Installation
Run the following in your R console:

```R
# Install CRAN packages
install.packages(c("httr", "gmp", "stringr"))

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

