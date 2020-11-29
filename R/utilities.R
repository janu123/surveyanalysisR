#' Title
#'
#' @param u
#' @param Lj
#'
#' @return
#' @export
#'
#' @examples
utilities <- function(u, Lj)
{
  m <- length(Lj)
  L <- sum(Lj)
  p <- length(u)
  b <- vector("numeric", p-1)
  ul <- vector("numeric", L)
  for(i in 1:(p-1)) {b[i] <- u[i+1]}
  i <- 0
  h <- 1
  for(j in 1:m)
  {
    tu <- 0
    l <- Lj[j]-1
    for (k in 1:l)
    {
      i <- i+1
      ul[i] <- b[h]
      tu <- tu+ul[i]
      h <- h+1
    }
    i <- i+1
    ul[i] <- -tu
  }
  return(ul)
}
