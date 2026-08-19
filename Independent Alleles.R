lia_probability <- function(k, N) {
  n <- 2^k          # number of organisms in generation k
  p <- 0.25         # probability a given organism is Aa Bb
  
  # P(X >= N) = 1 - P(X <= N-1)
  prob <- 1 - pbinom(N - 1, size = n, prob = p)
  
  return(prob)
}

# Sample dataset: k=2, N=1
result <- lia_probability(7, 30)
cat(round(result, 3), "\n")

