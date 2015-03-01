## for quiz 4

setwd("C:/Users/Chris/Documents/GitHub/Coursera_getting_data/quiz4/")

################
## question 1 ##
################

#furl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
#download.file(furl,destfile="./acs.csv")

acs<-read.csv("./getdata-data-ss06hid.csv")

names(acs)

nameslist<-strsplit(names(acs),"wgtp")
head(nameslist)
nameslist[[123]]


################
## question 2 ##
################
gdp<-read.csv("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv",skip=5,nrows=190,header=FALSE,stringsAsFactors=FALSE)
gdp<-cbind(Source="gdp",gdp)
head(gdp)
tail(gdp)

gdp$dollars<-as.numeric(gsub(",","",gdp$V5))
class(gdp$dollars)
head(gdp$dollars)
mean(gdp$dollars)


################
## question 3 ##
################
names(gdp)[names(gdp)=="V4"]<-"countryNames"
attr(gdp,"names")

grep("^United",gdp$countryNames)


################
## question 4 ##
################


library(plyr)

ed<-read.csv("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv",stringsAsFactors=FALSE)
head(ed[,1:4])
tail(ed[,1:4])

combine<-merge(ed,gdp2,by.x="CountryCode",by.y="V1")
head(combine[,c("CountryCode","Short.Name","V4")])

nrow(combine)  ## number of rows in the combined data


################
## question 5 ##
################
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
