#' Title Perfom Conjoint Analysis
#'
#' @param y
#' @param x
#' @param z
#' @param y.type
#'
#' @return
#' @export
#'
#' @examples
conjoint_analysis<-function(y,x,z,y.type="score")
{
  y<-m2v(y)
  m<-length(x)
  n<-nrow(x)
  S<-nrow(y)/n
  xnms<-names(x)
  ynms<-names(y)
  xtmp<-paste("factor(x$",xnms,sep="",paste(")"))
  xfrm<-paste(xtmp,collapse="+")
  yfrm<-paste("y$",ynms,sep="","~")
  frml<-as.formula(paste(yfrm,xfrm))
  Lj<-vector("numeric",m)
  for(j in 1:m) {Lj[j]<-nlevels(factor(x[[xnms[j]]]))}
  x<-as.data.frame(matexpand(m,n,S,x))
  camodel<-lm(frml)
  print(summary.lm(camodel))
  u<-as.matrix(camodel$coeff)
  intercept<-u[1]
  ul<-utilities(u,Lj)
  utlsplot(ul,Lj,z,m,xnms)
  utls<-c(intercept,ul)
  levnms<-c("intercept",as.matrix(z))
  lu<-cbind(levnms,utls)
  Utls<-as.data.frame(lu)
  print("Part worths (utilities) of levels (model parameters for whole sample):")
  print(Utls)
  imp<-round(caImportance(y,x),2)
  print(paste("Sum of average importance: ", sum(imp)), quote=FALSE)
  print("Chart of average factors importance")
  dev.new(width=5,height=5,pointsize=9)
  barplot(imp,ylim=c(0,100),ylab="Average importance",xlab="Factors",names.arg=names(x))
}
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
#' Title
#'
#' @param m
#' @param n
#' @param S
#' @param x
#'
#' @return
#' @export
#'
#' @examples
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
