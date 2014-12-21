rankhospital <- function(state, outcome,num="best") {
  
      bestworst <- c("best", "worst")
      
      ## check inputs
      library("utils", lib.loc="C:/Program Files/R/R-3.1.2/library")
      Disease <- c("heart attack", "heart failure","pneumonia")
      if((!is.numeric(num)) & ((!any(Disease==outcome)) |(!any(state.abb==state))|(!any(bestworst==num)))) {
            
            if(!any(state.abb==state))  {
                  gettextf("Error in rankhospital(%s, %s, %s)",state,outcome,num)
                  stop("invalid state",call.=TRUE)
            }
            if(!any(Disease==outcome)) {
                  gettext("Error in rankhospital(%s, %s, %s)",state,outcome,num)
                  stop("invalid outcome",call.=TRUE)
            }
            if(!any(bestworst==num)) {
                  gettext("Error in rankhospital(%s, %s, %s)",state,outcome,num)
                  stop("invalid num",call.=TRUE)
            }
      }
      total=NULL
      wd <-"C:\\Users\\ji\\R\\Code"
      
      Ratecol <- c(11,17,23)
      theDF <- data.frame(Disease, Ratecol)
      ## Fectch the correcponding column for that disease in outcome-of-care-measures.csv
      theCol <- subset(theDF,Disease==outcome)$Ratecol
      
      Outcomefile<-"outcome-of-care-measures.csv"
      Hospitalfile<-"hospital-data.csv"
      DiseaseCol=NULL
      Data <- read.csv(Outcomefile,colClasses=c("numeric","character","character","numeric"))
      col4<-names(Data)[theCol]
      
      df<-subset(Data,State==state & col4 != "Not Available",select=c("Provider.Number",col4))
      ##sortdf <- df[order(as.numeric(levels(df$col4))[df$col4],df[,1]), ]        
      ##sortdf<-df[order(df$col4),]
      
     sortdf<-df[order(df[,2]),]
     
     
     ## sortdf <- newdf[order(as.numeric(as.character(newdf[, 4]))),]
     ## nDiseaseCol <- suppressWarnings(as.numeric(levels(newdf[,4])[newdf[,4]]))
      ##newdf<-as.numeric(levels(newdf[[col4]]))[newdf[[col4]]]
    ##sortdf<-with(newdf,newdf[order(col4),])
     if(FALSE){
      if(identical(num,"best")) num<-1
      if(identical(num,"worst")) num<-nrow(newdf)
      ## num more than number of hospitals in that state
      if(num<=nrow(df)) {
      providernum <- as.numeric(sort.df[num,1])
   
      hospital <- read.csv(Hospitalfile,stringsAsFactors = FALSE)[,c(1,2)]
      names(hospital) <-sub(" ",".",names(hospital))
     
      Hos<-subset(hospital,Provider.Number==providernum,select=c("Hospital.Name"))
        print(Hos)
     
          
      }
        else {
      c<-NA
      c
        }
     }
    head(sortdf)
}