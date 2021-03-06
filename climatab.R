climatab<-function(x,y){
  colnames(x)<-c('year',substr(month.name,1,3))
  if (y<=0) {stop('y must be greater than 0 and lower than 13')}
  if (y>=13) {stop('y must be greater than 0 and lower than 13')}
  if (y==12) {
    y<-y+1
    addrow<-rbind(c(0,0),as.data.frame(x[13]))
    addrow<-as.data.frame(addrow[-nrow(addrow),])
    new.x<-cbind(addrow,x)
    colnames(new.x)=c(paste('pr',colnames(new.x)[length(colnames(new.x))], sep=""),'year',colnames(new.x)[3:length(colnames(new.x))])
    new.x<-new.x[-1,c(2,1,3:14)]
    return(new.x)
  } 
  if (y>0 & y<12) {
    y<-y+1
    new.x<-cbind(rbind(c(0,0),x[,c(y:13)])[c(1:(nrow(rbind(c(0,0),x[,c(y:13)]))-1)),],x)
    colnames(new.x)=c(paste('pr',colnames(new.x)[1:(13-y+1)], sep=""),colnames(new.x)[(13-y+2):length(colnames(new.x))])
    fin.x<-round((new.x[,c(which(colnames(new.x)=='year'),which(colnames(new.x)!='year'))])[c(-1),],1)
    rownames(fin.x)=NULL
    return(fin.x)
  }
}