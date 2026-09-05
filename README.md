# Rosalind Bioinformatics Solutions in R

[![Language](https://img.shields.io/badge/Language-R_%3E%3D_4.0-blue.svg)](https://www.r-project.org/)
[![Bioconductor](https://img.shields.io/badge/Bioconductor-Biostrings-green.svg)](https://bioconductor.org/packages/release/bioc/html/Biostrings.html)
[![Platform](https://img.shields.io/badge/Platform-Rosalind-purple.svg)](https://rosalind.info/)


A curated collection of clean, idiomatic, and efficient **R** solutions to algorithmic bioinformatics challenges from [Rosalind](https://rosalind.info/). This repository covers foundational sequence manipulation, 6-frame open reading frame (ORF) discovery, $k$-mer composition profiling, graph theory (connected components, trees, overlap graphs), signed permutations, probabilistic sequence modeling, combinatorics, lexicographic enumeration, dynamic programming, population genetics, and motif discovery using base R and high-performance Bioconductor packages.

---

## 📌 Project Overview

This repository demonstrates practical implementations of computational biology algorithms, emphasizing:
- **Idiomatic R & Vectorization:** Writing efficient R code with minimized overhead and vectorized transformations.
- **Bioconductor Integration:** Leveraging standard high-throughput sequence analysis packages like `Biostrings` for FASTA parsing, 6-frame ORF extraction, translation, consensus matrices, letter frequencies, and reverse complementation.
- **Graph Theory & Tree Topology:** Identifying connected components via Disjoint-Set / Union-Find logic to compute the minimum edges required to construct spanning trees ($C - 1$).
- **$k$-mer Profiling & Sequence Signatures:** Generating canonical lexicographic 4-mer dictionaries ($4^4 = 256$) and scanning genomic sequences to construct complete $k$-mer frequency arrays.
- **Signed Combinatorial Search:** Enumerating signed permutations ($2^n \cdot n!$) using recursive depth-first backtracking branching over both positive and negative states.
- **Probabilistic Modeling & Random Strings:** Modeling random GC-content backgrounds using log-probabilities ($\log_{10} P$), computing sequence matching probabilities across Bernoulli trials, and preventing arithmetic underflow.
- **Lexicographic Search & Tree Traversal:** Constructing fixed-length and variable-length strings in defined alphabetical orders using recursive depth-first tree traversal.
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
│   ├── completing_tree.R                 # Completing a Tree (TREE)
│   ├── expected_offspring.R              # Calculating Expected Offspring (IEV)
│   ├── random_strings_prob.R             # Introduction to Random Strings (PROB)
│   ├── random_strings_eval.R             # Matching Random Motifs / String Evaluation (EVAL)
│   ├── partial_permutations.R            # Partial Permutations (PPER)
│   ├── gene_orders_permutations.R        # Enumerating Gene Orders (PERM)
│   ├── signed_permutations.R             # Enumerating Oriented Gene Orderings (SIGN)
│   ├── kmer_composition.R                # k-mer Composition (KMER)
│   ├── lex_k_mers.R                      # Enumerating k-mers Lexicographically (LEXF)
│   ├── lex_variable_length.R             # Ordering Strings of Varying Length (LEXV)
│   ├── RNA_splicing.R                    # RNA Splicing & Exon Translation (SPLC)
│   ├── spliced_motif.R                   # Finding Spliced Subsequence Motif (SSEQ)
│   ├── protein_motif_search.R            # Finding Protein Motif via UniProt API (MPRT)
│   ├── independent_alleles.R             # Mendelian Inheritance Probability (LIA)
│   ├── mrna_inferring.R                  # Inferring mRNA from Protein (MRNA)
│   └── perfect_matchings_rna.R           # RNA Secondary Structure Combinatorics (PMCH)
├── README.md                             # Repository documentation
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
| **`TREE`** | Completing a Tree | Connected Components / Disjoint Sets | Component merging & spanning tree minimum edges ($C - 1$) |
| **`IEV`** | Calculating Expected Offspring | Linearity of Expectation | Vectorized dot product `sum(couples * prob)` |
| **`PROB`** | Introduction to Random Strings | Log-Likelihood & GC-content Backgrounds | Log-space probabilities $\log_{10} P(s \mid x)$ |
| **`EVAL`** | Matching Random Motifs | Bernoulli Trials & Independence Probability | Single-string matching $P(s) = (\frac{x}{2})^{GC} (\frac{1-x}{2})^{AT}$ |
| **`PPER`** | Partial Permutations | Modular Combinatorics ($P(n, k) \pmod{10^6}$) | Cumulative product modulo $1{,}000{,}000$ |
| **`PERM`** | Enumerating Gene Orders | Recursive Backtracking | Tree recursion & permutation pooling ($n!$) |
| **`SIGN`** | Enumerating Oriented Gene Orderings | Signed Recursive Backtracking | Dual-branch state recursion ($2^n \cdot n!$) |
| **`KMER`** | $k$-mer Composition | Genomic Frequency Profiling ($4^4$) | Sliding-window matching over 256 lexicographic 4-mers |
| **`LEXF`** | Enumerating $k$-mers Lexicographically | Exact-Depth Recursive Backtracking | Depth-bounded recursive string building |
| **`LEXV`** | Ordering Strings of Varying Length | Variable-Depth Prefix Tree Traversal | Pre-order recursive traversal up to length $n$ |
| **`SPLC`** | RNA Splicing | Exon Extraction & Splicing | `Biostrings`, `gsub(fixed=TRUE)` |
| **`SSEQ`** | Finding a Spliced Motif | Subsequence Greedy Scan (O(n)) | Two-pointer traversal |
| **`MPRT`** | Finding a Protein Motif | REST API & Lookahead Regex | `httr`, `gregexpr(perl=TRUE)` |
| **`LIA`** | Independent Alleles | Binomial Cumulative Density Function | `stats::pbinom` |
| **`MRNA`** | Inferring mRNA from Protein | Modular Arithmetic / Reverse Translation | Frequency mapping modulo $10^6$ |
| **`PMCH`** | Perfect Matchings & RNA Structures | Big Integer Combinatorics ($n!$) | `gmp::factorialZ` |

## 📝 Versioning & Implementation Transparency

For several foundational problems, this repository includes **multiple independent implementations** (e.g., `_ver1.R`, `_ver2.R`, `_ver3.R`). 

This was a practice to:
- **Test different computational paradigms** (vectorized operations vs. manual iterations).
- **Validate results through independent methods** ensure the result between using package and base R provide the same answer.


### Example: Counting DNA Nucleotides (`DNA`)

The following three scripts solve the exact same problem but use entirely different R approaches:

| Version | File | Approach | Rationale |
| :--- | :--- | :--- | :--- |
| **v1** | `Counting DNA Nucleotides.R` | Uses `stringr::str_count` with a vectorized pattern | Quick, readable, leverages the tidyverse ecosystem. Best for interactive analysis. |
| **v2** | `Counting DNA Nucleotides_ver2.R` | Uses base R `strsplit` + manual `sum()` calls | No external dependencies. |
| **v3** | `Counting DNA Nucleotides.R_ver3.R` | Uses base R `table()` + `factor(..., levels=...)` | Quick, memory efficient. |

### Example: Complementing a Strand of DNA (`REVC`)

| Version | File | Approach | Rationale |
| :--- | :--- | :--- | :--- |
| **v1 (Biostrings)** | `Complementing a Strand of DNA.R` | Uses `Biostrings::reverseComplement()` + tidyverse pipes | Industry-standard for high-throughput sequencing. Concise and efficient. |
| **v2 (Base R)** | `Complementing a Strand of DNA_ver2.R` | Uses `chartr()` + manual reversal with `rev()` and `strsplit()` | No external dependencies. Transparent step-by-step logic. Shows understanding of the underlying algorithm. |


### Example: Computing GC Content (`GC`)

| Version | File | Approach | What It Demonstrates |
| :--- | :--- | :--- | :--- |
| **ver2** | `Computing GC Content_ver2.R` | Manual GC counting with `strsplit` + `sapply` | Understanding of the underlying algorithm. No `Biostrings` manipulation required. |
| **ver3** | `Computing GC Content_ver3.R` | `Biostrings::letterFrequency` with `width()` | Efficient vectorized Bioconductor approach. Production-ready. |
| **primary** | `Computing GC Content.R` | Same as ver3, but wrapped in a function | Shows awareness of code organization and reusability. |

### Example: Counting Point Mutations (`HAMM`)

| Version | File | Approach | What It Demonstrates |
| :--- | :--- | :--- | :--- |
| **primary (vectorized)** | `Counting Mutation.R` | `unlist(strsplit())` + vectorized comparison `!=` + `sum()` | Efficient R vectorization. Clean and concise. |
| **ver2 (manual)** | `Counting Mutation_ver2.R` | Manual `for` loop with an accumulator | Understanding of the underlying algorithm. Step-by-step iteration. |

### Example: Translating RNA into Protein (`PROT`)

| Version | File | Approach | What It Demonstrates |
| :--- | :--- | :--- | :--- |
| **v1 (Biostrings)** | `Translating RNA into Protein.R` | `Biostrings::translate(..., no.init.codon = TRUE)` | Efficient, production-ready translation. Industry-standard Bioconductor package. |
| **v2 (Manual)** | `rna to protein_ver2.R` | Custom 64-codon lookup table + manual translation | Complete transparency. Shows understanding of the genetic code and codon-to-amino-acid mapping. |

### Example: Finding a Motif in DNA (`SUBS`)

The following two scripts solve the same problem (find all overlapping occurrences of a motif in a DNA sequence) but use entirely different approaches:

| Version | File | Approach | Rationale |
| :--- | :--- | :--- | :--- |
| **v1 (Sliding Window)** | `Finding a Motif in DNA_ver2.R` | Uses `substr()` with a sliding window, then `which()` to find matches | **Explicit and transparent.** Shows step-by-step logic. No regex complexity. Best for educational clarity and debugging. |
| **v2 (Regex Lookahead)** | `Finding a Motif in DNA.R` | Uses `gregexpr()` with a dynamic lookahead pattern `(?=...)` | **Concise and elegant.** Handles overlapping matches naturally. Demonstrates advanced R/regex skills. |

*(For brevity, only the most efficient or robust version of each remaining problem is included as the primary solution.)*
---

## 🚀 Key Highlights & Implementations

### 1. Connected Components & Tree Completion (`TREE`)
Determining the minimum number of edges needed to connect an unrooted forest into a single spanning tree by tracking component equivalence classes:
```R
# Merge component labels for each edge
for (i in 1:nrow(edges)) {
  a <- edges[i, 1]
  b <- edges[i, 2]
  if (groups[a] != groups[b]) {
    groups[groups == groups[b]] <- groups[a]
  }
}

# C components require C - 1 edges to form a tree
min_edges <- length(unique(groups)) - 1
```

### 2. Signed Gene Permutations (`SIGN`)
Generating all $2^n \cdot n!$ signed permutations by branching both positive and negative values during depth-first recursive exploration:
```R
generate_permutation <- function(current, remaining) {
  if (length(current) == n) {
    result[[length(result) + 1]] <<- current
    return()
  }
  for (x in remaining) {
    new_remaining <- remaining[remaining != x]
    # Branch positive
    generate_permutation(c(current, x), new_remaining)
    # Branch negative
    generate_permutation(c(current, -x), new_remaining)
  }
}
```

### 3. Complete $k$-mer Composition Matrix (`KMER`)
Generating all $4^4 = 256$ 4-mers lexicographically and computing occurrence counts across a sliding sequence window:
```R
counts <- rep(0, 256)
for (j in 1:(nchar(seq) - 3)) {
  overlap_seq <- substr(seq, start = j, stop = j + 3)
  position <- which(four_mer == overlap_seq)
  counts[position] <- counts[position] + 1
}
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
Rscript scripts/completing_tree.R
```
