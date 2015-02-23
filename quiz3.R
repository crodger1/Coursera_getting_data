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
gdp<-read.csv("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv",skip=5,nrows=190,header=FALSE,stringsAsFactors=FALSE)
head(gdp)
tail(gdp)
gdp2<-cbind(Source="gdp",gdp)


library(plyr)

ed<-read.csv("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv",stringsAsFactors=FALSE)
head(ed[,1:4])
tail(ed[,1:4])

combine<-merge(ed,gdp2,by.x="CountryCode",by.y="V1")
head(combine[,c("CountryCode","Short.Name","V4")])

nrow(combine)  ## number of rows in the combined data

combine2<-combine[order(-combine$V2),]

combine2[13,c("V2","Short.Name","V4")]

library(dplyr)
mean_data <- combine2 %>%
  group_by(Income.Group) %>%
  summarize(mean=mean(V2))

mean_data

install.packages("Hmisc")
library(Hmisc)
combine2$rankgroups = cut2(combine2$V2,g=5)
combine2$rankgroups

# summary(combine2)

xtabs( ~ rankgroups + Income.Group, combine2)
