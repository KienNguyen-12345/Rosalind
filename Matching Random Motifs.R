# Matching Random Motifs (Rosalind RSTR)
# Author: Kien Nguyen
# Calculates the probability that at least one random string (generated with a given GC-content)
# matches a specific target sequence

# Read input: first line = N and GC_prob, second line = target sequence
data <- readLines("rosalind_rstr.txt")
params <- strsplit(data[1], " ")[[1]]
N <- as.numeric(params[1])           # Number of random strings
gc_prob <- as.numeric(params[2])     # GC-content probability
target <- data[2]                    # Target sequence

# Count G/C and A/T bases in the target sequence
bases <- strsplit(target, "")[[1]]
gc_count <- sum(bases %in% c("G", "C"))
at_count <- length(bases) - gc_count

# Step 1: Probability that a single random string matches the target
# P(match) = (GC/2)^GC_count × ((1-GC)/2)^AT_count
p_match <- ((gc_prob) / 2)^gc_count * ((1 - gc_prob) / 2)^at_count

# Step 2: Probability that none of the N strings match
p_none_match <- (1 - p_match)^N

# Step 3: Probability that at least one string matches
p_at_least_one <- 1 - p_none_match

# Output result rounded to 3 decimal places
cat(round(p_at_least_one, 3), file = "result.txt")
