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
    barplot(lb,ylim=c(-a,b),ylab="utility",xlab=xnms[j],names.arg=ln)
  }
  return(0)
}
