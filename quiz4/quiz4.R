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
stimes2<-as.numeric(format(sampleTimes, %Y))

head(test2)
tail(test2)
