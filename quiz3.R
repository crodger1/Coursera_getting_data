# quiz3.R

## question 1
# install.packages("RCurl")
library(RCurl)

furl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"

download.file(furl,destfile="./acs.csv")

acs<-read.csv("./acs.csv")
head(acs$"AGS")
dim(acs)
tabulate(acs$AGS)

agricultureLogical<-acs$AGS==6 & acs$ACR==3
head(agricultureLogical)
agricultureLogical
which(agricultureLogical)

## question 2
install.packages("jpeg")
library(jpeg)

jeff<-readJPEG("./getdata-jeff.jpg",native=TRUE)
attributes(jeff)

quantile(jeff,probs=c(.3,.8))


## question 3
gdp<-read.csv("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv",skip=5,header=FALSE)
gdp2<-gdp[1:215,]
head(gdp2)
tail(gdp2)

install.packages("plyr")
library(plyr)
gdp2<-rename(gdp2,c("V1"="CountryCode"))

ed<-read.csv("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv")
head(ed[,1:4])

combine<-merge(ed,gdp2,by.x="CountryCode",by.y="CountryCode",all=TRUE)

gdp2$CountryCode



