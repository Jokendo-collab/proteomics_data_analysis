setwd("C:/Users/oknjav001/Desktop/Mathole_Data")
dir()
mathole_data <- read.table("R_data_trial.txt",header = T, sep = "\t")
head(mathole_data)
colnames(mathole_data)
mean(mathole_data$Age/71*100)
#===================================================================
# Objective number 1: 1.	Overall mortality rate
#===================================================================

motality_month_six <- mathole_data[,c("Sex","GOS_at_6_months","GOS_at_9_months")] #selecting specific columns in a dataframe
library(dplyr)
library(tidyr)
library(tidyverse)
with(motality_month_six, table(GOS_at_6_months,Sex)) #Grouping patients according to GCS value of 1
with(motality_month_six, table(GOS_at_9_months,Sex)) #Grouping patients according to GCS value of 1 
df<-data.frame(GCS_6=as.character(as.factor(c(1,4,5,1,4,5))), Gender=c("F","F","F", "M","M","M"), value=c(7,4,16,8,3,28))
require(ggplot2) #Load the ggplot library
p<-ggplot(data=df, aes(x=GCS_6, y=value, fill=Gender))
p<-p+geom_bar(stat="identity", position=position_dodge())+theme_bw()
p<-p+xlab("GCS_6_Month")+ylab("Number of Patients")
p
df2<-data.frame(GCS_9=as.character(as.factor(c(1,4,5,1,4,5))), Gender=c("F","F","F", "M","M","M"), value=c(7,2,19,8,3,28))
p<-ggplot(data=df2, aes(x=GCS_9, y=value, fill=Gender))
p<-p+geom_bar(stat="identity", position=position_dodge())+theme_bw()
p<-p+xlab("GCS_9_Month")+ylab("Number of Patients")
p
#===========================End======================================

#==================OBJECTIVE NUMBER 3===============================
#1 Analysis od column containing HPC
table(mathole_data$HCP_NOT) #determining how many patients have HCP or Not
motality_month_six <- mathole_data[,c("GOS_at_6_months","HCP_NOT")]
motality_month_six
with(motality_month_six, table(GOS_at_6_months,HCP_NOT)) # How many patients had HCP_ grouping by GCS
df2<-data.frame(GCS_6=as.character(as.factor(c(1,4,5,1,4,5))), HCP=c("Yes","Yes","Yes", "No","No","No"), value=c(14,4,20,1,3,24))

p<-ggplot(data=df2, aes(x=GCS_6, y=value, fill=HCP))
p<-p+geom_bar(stat="identity", position=position_dodge())+theme_bw()
p<-p+xlab("GOS")+ylab("Number of Patients in each category")
p
#==================================================================
#Analysis of GOS at 3,6 months ,9 months and 1 year (column  AD,AE,AF,AG)

mf <- mathole_data[,c("GOS_at_3_months","GOS_at_6_months","GOS_at_9_months","GOS_at_1_year")] #Selecting specific columns
mf
#Filtering and grouping the data
library(dplyr)
GOS_1 <- filter(mf, mf$GOS_at_3_months== "1",mf$GOS_at_6_months == "1", mf$GOS_at_9_months=="1", mf$GOS_at_1_year=="1")

GOS_2 <- filter(mf, mf$GOS_at_3_months== "4",mf$GOS_at_6_months == "4", mf$GOS_at_9_months=="4", mf$GOS_at_1_year=="4")

GOS_3 <- filter(mf, mf$GOS_at_3_months== "5",mf$GOS_at_6_months == "5", mf$GOS_at_9_months=="5", mf$GOS_at_1_year=="5")

table(GOS_3)

cor(motality_month_six,GOS_1)
install.packages("ggcorrplot")
library(ggcorrplot)
ccc <- round(cor(GOS_1))
ccc



