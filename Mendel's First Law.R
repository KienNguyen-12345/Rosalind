# Mendel's First Law (Rosalind IPRB)
# Author: Kien Nguyen
# Calculates the probability that two randomly selected organisms
# will produce an offspring with a dominant phenotype.

# k = number of homozygous dominant individuals (AA)
# m = number of heterozygous individuals (Aa)
# n = number of homozygous recessive individuals (aa)

mendel_prob <- function(k, m, n) {
  
  # Step 1: Calculate the total population size.
  # This is the denominator for all probability calculations.
  total <- k + m + n
  
  # Step 2: Calculate the total number of ordered pairs of parents.
  # Since we select two distinct organisms without replacement,
  # the first choice has 'total' options, the second has 'total - 1'.
  # Using ordered pairs (Parent 1, Parent 2) simplifies the math
  # because we don't have to separately handle permutations (e.g., Aa x aa vs aa x Aa).
  total_pair <- total * (total - 1)
  
  # Step 3: Calculate the probability of producing a recessive phenotype (aa).
  # We use the complement rule: P(dominant) = 1 - P(recessive).
  # Recessive offspring (aa) can ONLY come from these three mating combinations:
  
  # --- Case A: Both parents are recessive (aa x aa) ---
  # Number of ordered pairs: n choices for parent 1, (n-1) for parent 2 = n*(n-1)
  # Offspring probability: 1.0 (100% aa)
  
  # --- Case B: Both parents are heterozygous (Aa x Aa) ---
  # Number of ordered pairs: m choices for parent 1, (m-1) for parent 2 = m*(m-1)
  # Offspring probability: 0.25 (1/4 chance of aa)
  
  # --- Case C: One heterozygous, one recessive (Aa x aa OR aa x Aa) ---
  # Number of ordered pairs: m choices for hetero, n choices for recessive, 
  # AND n choices for recessive, m choices for hetero.
  # Combined ordered pairs: m * n + n * m = 2 * m * n.
  # Offspring probability for EACH ordered pair: 0.5 (1/2 chance of aa).
  # Therefore, the total contribution to the numerator is (2 * m * n) * 0.5 = m * n.
  
  # Summing all three cases gives the total numerator for P(recessive):
  recessive_numerator <- (n * (n - 1)) +       # aa x aa
                         (0.25 * m * (m - 1)) + # Aa x Aa
                         (m * n)               # Aa x aa AND aa x Aa (combined)
  
  # Step 4: Calculate the probability of a recessive phenotype.
  prob_recessive <- recessive_numerator / total_pair
  
  # Step 5: Calculate the probability of a dominant phenotype.
  # Since offspring must be either dominant (AA or Aa) or recessive (aa):
  prob_dominant <- 1 - prob_recessive
  
  # Step 6: Output the result.
  cat(prob_dominant)
}

# Step 7: Run the function with the sample dataset.
data <- readLines("rosalind_iprb.txt")
data <- strsplit(data, " ")[[1]]
k <- as.numeric(data[1])
m <- as.numeric(data[2])
n <- as.numeric(data[3])
mendel_prob(k,m,n)

