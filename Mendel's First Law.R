mendel_prob <- function(k,m,n){
  total <- k+m+n
  total_pair <- total*(total-1)
  prob_dominant <- 1- ((n*(n-1)+0.25*m*(m-1)+m*n)/total_pair)
  cat(prob_dominant)
}


mendel_prob(23, 18, 15)
  