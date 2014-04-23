acs <- read.csv("getdata_data_ss06hid")
agricultureLogical <- (acs$ACR >=3 & acs$AGS >=6)
which(agricultureLogical)

pic <- readJPEG("getdata_jeff.jpg",native=TRUE)
quantile(pic, probs=c(.3,.8))

gdp <- read.csv("getdata_data_GDP.csv", skip = 3)
eddata <- read.csv("getdata_data_EDSTATS_Country.csv")
names(gdp)
names(eddata)
merged <- merge(gdp, eddata, by.x= "X", by.y="CountryCode", all = TRUE)
head(merged)
x <- which(merged$X != "" & merged$Long.Name !="<NA>")
length(x)
sorted <- order(merged$Ranking, decreasing = TRUE)
tmp <- merged[sorted,]
tmp[1:15,]

head(merged)
OECD <- merged[merged$Income.Group =="High income: OECD",]
mean(OECD$Ranking, na.rm = TRUE)
nonOECD <- merged[merged$Income.Group =="High income: nonOECD",]
mean(nonOECD$Ranking, na.rm = TRUE)

library(Hmisc)
quantileGDP <- cut2(merged$Ranking, g=5)
table(quantileGDP, merged$Income.Group)
