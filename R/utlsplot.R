#' Title
#'
#' @param ul
#' @param Lj
#' @param z
#' @param m
#' @param xnms
#'
#' @return
#' @export
#'
#' @examples
utlsplot<-function(ul,Lj,z,m,xnms)
{
  zz<-as.matrix(z)
  i<-1
  for(j in 1:m)
  {
    l<-Lj[j]
    lb<-vector("numeric",l)
    ln<-vector("character",l)
    for (k in 1:l)
    {
      lb[k]<-ul[i]
      ln[k]<-zz[i]
      i<-i+1
    }
    a<-abs(min(lb))+abs(min(lb))
    b<-abs(max(lb))+abs(max(lb))
    dev.new(width=5,height=5,pointsize=9)
    barplot(lb,ylim=c(-a,b),ylab="utility",xlab=xnms[j],names.arg=ln,cex.axis=0.8, cex.names=0.8)
  }
  return(0)
}
