fourteen<-function(){
  library(e1071)   #include the SVM
  data<-read.table('hw5_14_train.dat')
  data<-data.frame(data)
  chunk=(nrow(data)/5)
  resultArray<-matrix(nrow=9,ncol=5)
  count<-1
  costs=c(0.001,1,1000)
  sigmas=c(0.125,0.5,2)
  for(cost in costs){
    for(sigma in sigmas){
      Ein<-0;
      Eval<-0;
      averageSV<-0;
      for(iter in 1:5){
        ###sampling###
        if(iter==1){
          train<-data[(chunk+1):(5*chunk),]
          val<-data[1:chunk,]
        }else if(iter==5){
          train<-data[1:(4*chunk),]
          val<-data[(4*chunk+1):(5*chunk),]
        }else{
          train<-data[1:((iter-1)*chunk),]
          train<-rbind(train,data[(iter*chunk+1):(5*chunk),])
          val<-data[((iter-1)*chunk+1):(iter*chunk),]
        }
    
        # Train a SVM classifier
        result<-svm(V11~.,data=train,type='C-classification',kernel='radial',cost=cost,gamma=1/(2*sigma^2))
        averageSV<-averageSV+nrow(result$SV)
        
        #calculate the Ein 
        error=0
        pred<-predict(result,newdata=train)
        for (i in 1:length(pred)){
          if(train$V11[i] != pred[i]){
            error=error+1
          }
        }
        Ein<-error/400
        
        pred<-predict(result,newdata=val)  
        error=0;
        for(i in 1:length(pred)){
          if(val$V11[i] != pred[i]){
            error=error+1
          }
        }
        Eval<-error/100
      }### for iter
      Ein<-Ein/5
      Eval<-Eval/5
      averageSV<-averageSV/5
      resultArray[count,1]<-sigma
      resultArray[count,2]<-cost
      resultArray[count,3]<-Ein
      resultArray[count,4]<-Eval
      resultArray[count,5]<-averageSV
      count<-count+1
      print('sigma')
      print(sigma)
      print('cost')
      print(cost)
      print('Ein is')
      print(Ein)
      print('Eval is')
      print(Eval)
      print('average number of support vectors')
      print(averageSV)
      print('==============================')
    }
  }
  View(resultArray)
  write.csv(resultArray,'result.csv')
}