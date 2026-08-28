input <- scan("rosalind_pper.txt")
n <- input[1]
k <- input[2]
result <- 1

numbers <- n:(n-k+1)

for(number in numbers){
  result <- result* number
  result <- result %% 1000000
}
cat(result, file = "result")