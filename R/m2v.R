#' Title
#'
#' @param y
#' @param w
#'
#' @return
#' @export
#'
#' @examples
m2v<-function(y,w=TRUE)
{
  y<-as.matrix(y)
  if(w) {S<-nrow(y); n<-ncol(y)} else {S<-ncol(y); n<-nrow(y)}
  tmp<-vector("numeric",S*n)
  k<-0
  for(i in 1:S)
  {
    for(j in 1:n)
    {
      k=k+1
      if(w) tmp[k]<-y[i,j] else tmp[k]<-y[j,i]
    }
  }
  ytmp<-as.data.frame(tmp)


}
