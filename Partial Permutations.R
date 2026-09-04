# Partial Permutations (Rosalind PPER)
# Author: Kien Nguyen
# Calculates P(n,k) = n! / (n-k)! modulo 1,000,000
# P(n,k) represents the number of ways to arrange k items from a set of n items

# Read input: n = total items, k = items to arrange
input <- scan("rosalind_pper.txt")
n <- input[1]
k <- input[2]

# Start with 1 (the multiplicative identity)
result <- 1

# Calculate P(n,k) = n * (n-1) * (n-2) * ... * (n-k+1)
numbers <- n:(n - k + 1)

# Multiply and apply modulo at each step to prevent overflow
for (number in numbers) {
  result <- result * number
  result <- result %% 1000000
}

# Output the result
cat(result, file = "result.txt")
