# Independent Alleles (Rosalind LIA)
# Author: Kien Nguyen
# Calculates the probability that at least N organisms in generation k are Aa Bb (heterozygous at both loci)
# Uses the binomial distribution with p = 0.25

lia_probability <- function(k, N) {
  # Number of organisms in generation k
  # Each generation doubles: 1 → 2 → 4 → ... → 2^k
  n <- 2^k
  
  # Probability that any given organism is Aa Bb
  # From a cross of AaBb × AaBb:
  #   P(Aa) = 1/2, P(Bb) = 1/2
  #   P(Aa Bb) = 1/2 × 1/2 = 1/4 = 0.25
  p <- 0.25
  
  # P(X >= N) = 1 - P(X <= N-1)
  # pbinom calculates the cumulative probability P(X <= q)
  prob <- 1 - pbinom(N - 1, size = n, prob = p)
  
  return(prob)
}

# Solve problem:
data <- readLines("rosalind_lia.txt")
data <- strsplit(data, "")[[1]]
k <- as.numeric(data[1])
N <- as.numeric(data[3])
result <- lia_probability(k,N)
cat(round(result, 3), "\n")
