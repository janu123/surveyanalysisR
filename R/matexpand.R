matexpand <- function(m, n, S, x)
{
  N <- n*S
  X <- matrix(0, N, m)
  k <- 1
  for(s in 1:S)
  {
    for(i in 1:n)
    {
      for(j in 1:m) {X[k,j] <- x[i,j]}
      k <- k+1
    }
  }
  colnames(X) <- names(x)
  return(X)
}
