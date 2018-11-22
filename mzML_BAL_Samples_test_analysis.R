setwd("C:/Users/oknjav001/Desktop/project_results")
dir() #list directory contents
bal_samples <- read.table('Alex_for_Javan_withoutrt.txt',header = T, sep = "\t") #load the dataframe
attach(bal_samples) #attaching the data to r memory
head(bal_samples) #show the first few lines in a dataframe
dim(bal_samples)
summary(bal_samples)
final_bal <- na.omit(bal_samples)
#View(final_bal)
#install.packages('ggfortify',dependencies = T)
library(ggfortify)
library(ggplot2)
logged_bal_samples <- log2(final_bal)
#View(logged_bal_samples)

filted_bal <- logged_data[complete.cases(logged_data), ]
#View(filted_bal)

#===============================================================================
############LIMMA###########################################################
#source("https://bioconductor.org/biocLite.R")
#biocLite("limma")
library(limma)
heatmap(as.matrix(final_bal))
library(gplots)
bal_matr <- as.matrix(final_bal)
heatmap.2(bal_matr)
#============================================================================================================================
bal_samples
comp_balSamples <- na.omit(bal_samples)
summary(comp_balSamples)
logBall_samples <- log2(comp_balSamples)
View(logBall_samples)
head(logBall_samples)
tail(logBall_samples)
any(is.na(logBall_samples))
colSums(is.na(logBall_samples
              ))
sum(is.na(logBall_samples))

#===============================================================================================================
## massPec Bioconductor packages url http://bioconductor.org/packages/release/BiocViews.html#___MassSpectrometry
#===============================================================================================================

source("http://www.bioconductor.org/biocLite.R")
biocLite("Prostar")
install.packages("shinycssloaders",dependencies = T)
install.packages("rclipboard",dependencies = T)
library(Prostar)
library(shinycssloaders)
library(rclipboard)
Prostar()
installed.packages()["Prostar","LibPath"]

source("http://www.bioconductor.org/biocLite.R")
biocLite("DAPAR")
source("https://bioconductor.org/biocLite.R")
biocLite("xcms")
library(xcms)












































