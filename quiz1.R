# fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
filename<-"C:/Users/Chris/OneDrive/Coursera_getting_data/getdata_data_ss06hid.csv"
acs<-read.csv(filename,header=TRUE)
head(acs)
vals<-acs$VAL
head(acs$VAL)
head(vals)
vals2<-vals[!is.na(vals)]
head(vals2)
sum(acs$VAL==24)
sum(vals2==24)
##FES is family type AND employment status -- a combo variable

setwd("C:/Users/Chris/OneDrive/Coursera_getting_data")
getwd()

library(xlsx)
dat<-read.xlsx("getdata_data_DATA.gov_NGAP.xlsx",sheetIndex=1,rowIndex=18:23,colIndex=5:15)
sum(dat$Zip*dat$Ext,na.rm=T)
## 36534720

library(XML)
doc<-xmlTreeParse("getdata_data_restaurants.xml",useInternal=TRUE)
rootNode<-xmlRoot(doc)
names(rootNode)
rootNode[[1]][[2]][[1]]
xmlSApply(rootNode,xmlValue)
xmlSApply(rootNode[[1]][[1]],xmlValue)
sum((xpathSApply(rootNode,"//zipcode",xmlValue)=="21231"))
## 127
