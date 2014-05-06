rankall <- function(outcometest, num="best"){
  outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  outcomeCols <- c(2,7,11,17,23)
  outcomeShort <- outcome[,outcomeCols]
  outcomes <- c("heart attack", "heart failure", "pneumonia")
  names(outcomeShort) <- c("Name", "State", outcomes)
  if (! outcometest %in% outcomes) stop("Invalid outcome")
  statelist <- unique(outcomeShort$State)
  statelist <- statelist[order(statelist)]
  stateranklist <- data.frame("hospital" = character(), "state"= character(), stringsAsFactors=FALSE)
  for(state in statelist){
  statedata <- outcomeShort[outcomeShort$State == state,]
  names(statedata) <- names(outcomeShort)
  if (outcometest == "heart attack") stateOutcome = c(1,3)
  if (outcometest == "heart failure") stateOutcome = c(1,4)
  if (outcometest == "pneumonia") stateOutcome = c(1,5)
  stateOutcomeData <- statedata[stateOutcome]
  stateOutcomeData[,2] <- as.numeric(stateOutcomeData[,2])
  stateOutcomeData <- stateOutcomeData[order(stateOutcomeData[2], stateOutcomeData$Name),]
  if (num == "best") stateranklist <- rbind(stateranklist, data.frame("state" = state, "hospital" = stateOutcomeData$Name[1]))
  #the worst does not work right....
  if (num == "worst"){
    val <- tail(stateOutcomeData[!is.na(stateOutcomeData)], 1)
    stateranklist <- rbind(stateranklist, data.frame("state" = state, "hospital" = stateOutcomeData$Name[which(stateOutcomeData[,2] == val)]))
  }
  else stateranklist <- rbind(stateranklist, data.frame("state" = state, "hospital" = stateOutcomeData$Name[num]))
  }
  stateranklist
}