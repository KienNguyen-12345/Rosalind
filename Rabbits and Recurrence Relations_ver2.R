solved_rabbits <- function(n,k){
  #set value:
  rabbits <- as.numeric(n)
  #set baseline:
  rabbits[[1]] <- 1
  rabbits[[2]] <- 1
  #Calculation based on the modified fibonacci sequence (from 3 and above)
  for(i in 3:n)
  rabbits[i] <- rabbits[i-1] + k*rabbits[i-2]
  #returns value:
  return(rabbits[n])
}

solved_rabbits(29,2)
