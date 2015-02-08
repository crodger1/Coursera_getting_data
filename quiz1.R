# fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
filename<-"C:/Users/Chris/OneDrive/Coursera_getting_data/getdata_data_ss06hid.csv"
acs<-read.csv(filename,header=TRUE)
head(acs)
sum(acs$VAL==1000000)
vals<-acs$VAL
head(acs$VAL)
head(vals)
vals2<-vals[!is.na(vals)]
head(vals2)
sum(acs$VAL==24)
sum(vals2==24)
##FES is family type AND employment status -- a combo variable

setwd("C:/Users/Chris/OneDrive/Coursera_getting_data")

dat<-read.xlsx("getdata_data_DATA.gov_NGAP.xlsx",rowIndex=18:23,colIndex=5:15)
