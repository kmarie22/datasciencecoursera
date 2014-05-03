rankhospital <- function(state,outcometest, num="best"){
  outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  outcomeCols <- c(2,7,11,17,23)
  outcomeShort <- outcome[,outcomeCols]
  outcomes <- c("heart attack", "heart failure", "pneumonia")
  names(outcomeShort) <- c("Name", "State", outcomes)
  if(! state %in% outcomeShort$State) stop("invalid state")
  if (! outcometest %in% outcomes) stop("Invalid outcome")
  statedata <- outcomeShort[outcomeShort$State == state,]
  names(statedata) <- names(outcomeShort)
  if (outcometest == "heart attack") stateOutcome = c(1,3)
  if (outcometest == "heart failure") stateOutcome = c(1,4)
  if (outcometest == "pneumonia") stateOutcome = c(1,5)
  stateOutcomeData <- statedata[stateOutcome]
  stateOutcomeData[,2] <- as.numeric(stateOutcomeData[,2])
  stateOutcomeData <- stateOutcomeData[order(stateOutcomeData[2], stateOutcomeData$Name),]
  if (num == "best") stop(stateOutcomeData$Name[1]) 
  if (num == "worst"){
    val <- tail(stateOutcomeData[!is.na(stateOutcomeData)], 1)
    stop(stateOutcomeData$Name[which(stateOutcomeData[,2] == val)])
  }
  else stateOutcomeData$Name[num]  
}