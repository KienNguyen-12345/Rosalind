solved_rabbit <- function(n,k){
  #knowing that the  Fibonacci sequence is shown as: F = Fn-1 + K* Fn-2:
  #set value:
  rabbits <- as.numeric(n)
  #Base line:
  rabbits[1] <- 1
  rabbits[2] <- 1
  #For anything other than baseline
  for(i in 3:n){
    rabbits[i] <- rabbits[i-1] + k*rabbits[i-2] 
  }
  #For n-th value of rabbit:
  return (rabbits[n])
}

n <- 29
k <- 4

solved_rabbit(n,k)
