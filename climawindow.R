climawindow<-function(x,y,method){
  if (y=='Dec') {stop('y must give a period of at least two months')}
  if (y %in% colnames(x)) {
    if (method=='sum') {
      startarg<-which(colnames(x)==y)
      nextarg<-which(colnames(x)==y)+1
      resultone<-list()
      for (i in nextarg:length(colnames(x))) resultone[[i]]<-rowSums(x[,c(startarg:i)])
      resultone<-resultone[-c(1:startarg)]
      resulttwo<-list()
      for (j in nextarg:length(colnames(x))) resulttwo[[j]]<-paste(colnames(x)[startarg],colnames(x)[j],sep='_')
      resulttwo<-resulttwo[-c(1:startarg)]
      names(resultone)<-unlist(resulttwo)
      finresultone<-as.data.frame(resultone)
      finresultone$year<-x$year
      finresultone<-finresultone[,c(which(colnames(finresultone)=='year'),which(colnames(finresultone)!='year'))]
      return(finresultone)}
    else if (method=='mean') {
      startarg<-which(colnames(x)==y)
      nextarg<-which(colnames(x)==y)+1
      resultone<-list()
      for (i in nextarg:length(colnames(x))) resultone[[i]]<-rowMeans(x[,c(startarg:i)])
      resultone<-resultone[-c(1:startarg)]
      resulttwo<-list()
      for (j in nextarg:length(colnames(x))) resulttwo[[j]]<-paste(colnames(x)[startarg],colnames(x)[j],sep='_')
      resulttwo<-resulttwo[-c(1:startarg)]
      names(resultone)<-unlist(resulttwo)
      finresultone<-as.data.frame(resultone)
      finresultone$year<-x$year
      finresultone<-finresultone[,c(which(colnames(finresultone)=='year'),which(colnames(finresultone)!='year'))]
      return(finresultone)}
    else stop("y must be 'sum' or 'mean'")
  } else stop('y cannot be a month preceding the first month of x')
}