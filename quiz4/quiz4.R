




## question 5

install.packages("quantmod")
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn) 
head(sampleTimes)

test<-weekdays(head(sampleTimes))
test
class(test)

class(sampleTimes)
test2 <- sampleTimes[as.numeric(format(sampleTimes, "%Y"))=="2012"]


head(test2)
tail(test2)
nobs(test2)
attributes(test2)
dim(test2)
length(test2)

mondays<-test2[weekdays(test2)=="Monday"]
head(mondays)
tail(mondays)
length(mondays)
