#download datasets (jails: http://www.icpsr.umich.edu/icpsrweb/ICPSR/studies/4359, prisons: http://www.icpsr.umich.edu/icpsrweb/NACJD/studies/4572)
#I am not allowed to re-distribute this original dataset
#use "ASCII + SAS setup" links
#unzip and concatenate datasets to same two folders (jails: "ICPSR_04359", prisons: "ICPSR_04572")

#set dir to dir with both data folders
setwd("/Users/mackfinkel/Documents/incarcerationData/")

#import census data:
# Samples selected:
#   2002 ACS
# Note: 
#   Density of the full data file:  0.38%
# Density of your extract: 0.38%
# 
# 2004 ACS
# Note: 
#   Density of the full data file:  0.42%
# Density of your extract: 0.42%

census <- read.csv('usa_00001.csv')

#convert data to R, save in repsective folders
library(SAScii)
#SAScii package allows R to follow .sas input directions for .txt ASCII files, so long as the user specifies line in the .sas file at which "INPUT" starts manually
#define input lines
input04359_DS0001 <- 3681
input04359_DS0002 <- 50
input04572_DS0001 <- 3904
input04572_DS0002 <- 3898
input04572_DS0003 <- 424
input04572_DS0004 <- 424

#define lrcel, also manually from .sas files
lrcel04359_DS0001 <- 4679
lrcel04359_DS0002 <- 14326
lrcel04572_DS0001 <- 8845
lrcel04572_DS0002 <- 8845
lrcel04572_DS0003 <- 2580
lrcel04572_DS0004 <- 2580

#load data. takes a long time.
data04359_DS0001 <- read.SAScii("ICPSR_04359/DS0001/04359-0001-Data.txt", "ICPSR_04359/DS0001/04359-0001-Setup.sas", input04359_DS0001, lrecl = lrcel04359_DS0001)
data04359_DS0002 <- read.SAScii("ICPSR_04359/DS0002/04359-0002-Data.txt", "ICPSR_04359/DS0002/04359-0002-Setup.sas", input04359_DS0002, lrecl = lrcel04359_DS0002)
data04572_DS0001 <- read.SAScii("ICPSR_04572/DS0001/04572-0001-Data.txt", "ICPSR_04572/DS0001/04572-0001-Setup.sas", input04572_DS0001, lrecl = lrcel04572_DS0001)
data04572_DS0002 <- read.SAScii("ICPSR_04572/DS0002/04572-0002-Data.txt", "ICPSR_04572/DS0002/04572-0002-Setup.sas", input04572_DS0002, lrecl = lrcel04572_DS0002)
data04572_DS0003 <- read.SAScii("ICPSR_04572/DS0003/04572-0003-Data.txt", "ICPSR_04572/DS0003/04572-0003-Setup.sas", input04572_DS0003, lrecl = lrcel04572_DS0003) 
data04572_DS0004 <- read.SAScii("ICPSR_04572/DS0004/04572-0004-Data.txt", "ICPSR_04572/DS0004/04572-0004-Setup.sas", input04572_DS0004, lrecl = lrcel04572_DS0004)

#sava in "data" folder
dir.create("data")
setwd("data/")
save(data04359_DS0001,file="data04359_DS0001.Rda")
save(data04359_DS0002,file="data04359_DS0002.Rda")
save(data04572_DS0001,file="data04572_DS0001.Rda")
save(data04572_DS0002,file="data04572_DS0002.Rda")
save(data04572_DS0003,file="data04572_DS0003.Rda")
save(data04572_DS0004,file="data04572_DS0004.Rda")
save(census, file="census.Rda")
