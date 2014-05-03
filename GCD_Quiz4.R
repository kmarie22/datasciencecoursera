wgtpfile <- read.csv("getdata_data_ss06hid_quiz4gcd.csv")
splitwgtp <- strsplit(names(wgtpfile), "wgtp")
splitwgtp[123]

library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn) 
amzndf = as.data.frame(amzn)
amzndf$DATES <- rownames(amzndf)
amzndf$DATES <- as.Date(amzndf$DATE, "%Y-%m-%d")

#get days of the week
amzndf$DATES <- format(amzndf$DATES,"%a %Y")
amzndf$DATES <- toString(amzndf$DATES)
year2012 <- amzndf[grepl("2012", amzndf$DATES),]
year2012mon <- year2012[grepl("Mon", year2012$DATES),]
