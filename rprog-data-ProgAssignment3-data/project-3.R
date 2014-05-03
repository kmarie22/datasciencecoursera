outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(outcome)
outcome[,11] <- as.numeric(outcome[,11])
hist(outcome[,11])

best <- function(state,outcometest){
  outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  outcomeCols <- c(2,7,11,17,23)
  outcomeShort <- outcome[,outcomeCols]
  if (outcometest != "heart attack" || outcometest != "heart failure" || outcometest != "pneumonia")){
    print(paste0("Error in best(", state, ", ", outcometest,") : invalid outcome")
  }else{if (state != outcomeCols[,2]){
    print(paste0("Error in best(", state, ", ", outcometest,") : invalid state"))
    } 
  }
}