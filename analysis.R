#set dir to dir with both data folders
setwd("/Users/mackfinkel/Documents/incarcerationData/data/")
for (i in 1:length(files <- list.files())){
  load(files[i])
}

#number of incarcerated parents each year

# TODO estimate presence of family support by who child is with


#initiate jails data frame with sex variable

#sex V4
# 1 Male
# 2 Female

# prisons
#V0004 sex

jails <- data.frame(sex = data04359_DS0001$V4)
prisonFederal <- data.frame(sex = data04572_DS0001$V0004)
prisonState <- data.frame(sex = data04572_DS0002$V0004)

#jails
# V2483 ANY DRUG
# 1 Any dependence
# 2 Abuse only
# 3 None

#prisons
# DRUG_HIERARCHY - DRUG HIERARCHY
# 1 Drug dependence
# 2 Drug abuse
# 3 No drug dependence or abuse
# 9999998 DK/Refused/Missing

jails$drug <- data04359_DS0001$V2483
prisonFederal$drug <- data04572_DS0003$DRUG_HIERARCHY
prisonState$drug <- data04572_DS0004$DRUG_HIERARCHY

jails$drug[jails$drug > 3] <- NA
jails$drug[jails$drug == 1] <- "Dependence"
jails$drug[jails$drug == 2] <- "Abuse"
jails$drug[jails$drug == 3] <- "Neither"

prisonFederal$drug[prisonFederal$drug > 3] <- NA
prisonFederal$drug[prisonFederal$drug == 1] <- "Dependence"
prisonFederal$drug[prisonFederal$drug == 2] <- "Abuse"
prisonFederal$drug[prisonFederal$drug == 3] <- "Neither"

prisonState$drug[prisonState$drug > 3] <- NA
prisonState$drug[prisonState$drug == 1] <- "Dependence"
prisonState$drug[prisonState$drug == 2] <- "Abuse"
prisonState$drug[prisonState$drug == 3] <- "Neither"

#jails
# V860 S5Q1 - DEFINING OFFENSE (OFFENSE CODE)
# 1 - Violent offense?
# 2 - Property offense? Did you take, damage or handle someone's property, defraud them of something of theirs, embezzle something of value, burglarize a building, or obtain money or other financial gain by deceit?
# 3 - Violation of laws which could or did give you some financial gain, but not a violent or drug offense?
# 4 - Drug offense?
# 5 Public order offense?

#prisons
# V0736 S5Q1: OFFENSE GENERALLY CONSIDERED
# 1 Violent offense?
# 2 Property offense? Did you take, damage or handle someone's property, defraud them of something of theirs, embezzle something of value, burglarize a building, or obtain money or other financial gain by deceit?
# 3 Violation of laws which could or did give you some financial gain, but not a violent or drug offense?
# 4 Drug offense?
# 5 Public order offense?

jails$offense <- data04359_DS0001$V860
prisonFederal$offense <- data04572_DS0001$V0736
prisonState$offense <- data04572_DS0002$V0736

jails$offense[jails$offense > 5] <- NA
jails$offense[jails$offense == 1] <- "Violent"
jails$offense[jails$offense == 2] <- "Property"
jails$offense[jails$offense == 3] <- "Financial"
jails$offense[jails$offense == 4] <- "Drug"
jails$offense[jails$offense == 5] <- "Public order"

prisonState$offense[prisonState$offense > 5] <- NA
prisonState$offense[prisonState$offense == 1] <- "Violent"
prisonState$offense[prisonState$offense == 2] <- "Property"
prisonState$offense[prisonState$offense == 3] <- "Financial"
prisonState$offense[prisonState$offense == 4] <- "Drug"
prisonState$offense[prisonState$offense == 5] <- "Public order"

prisonFederal$offense[prisonFederal$offense > 5] <- NA
prisonFederal$offense[prisonFederal$offense == 1] <- "Violent"
prisonFederal$offense[prisonFederal$offense == 2] <- "Property"
prisonFederal$offense[prisonFederal$offense == 3] <- "Financial"
prisonFederal$offense[prisonFederal$offense == 4] <- "Drug"
prisonFederal$offense[prisonFederal$offense == 5] <- "Public order"

#jails
#V1472       S7Q8D - MINOR CHILDREN WHEN ADMITTED 507
# 1 yes
# 2 no 

#prisons
# V1823 S7Q8D: ANY CHILDREN UNDER AGE 18 WHEN YOU WERE ADMITTED TO PRISON

jails$minorAny <- data04359_DS0001$V1472
prisonFederal$minorAny <- data04572_DS0001$V1823
prisonState$minorAny <- data04572_DS0002$V1823

jails$minorAny[jails$minorAny > 2] <- NA
jails$minorAny[jails$minorAny == 1] <- TRUE
jails$minorAny[jails$minorAny == 2] <- FALSE

prisonState$minorAny[prisonState$minorAny > 2] <- NA
prisonState$minorAny[prisonState$minorAny == 1] <- TRUE
prisonState$minorAny[prisonState$minorAny == 2] <- FALSE

prisonFederal$minorAny[prisonFederal$minorAny > 2] <- NA
prisonFederal$minorAny[prisonFederal$minorAny == 1] <- TRUE
prisonFederal$minorAny[prisonFederal$minorAny == 2] <- FALSE

#jails
# V1473       S7Q8E - NUMBER OF MINOR CHILDREN 507
# number

#prisons
# V1824 S7Q8E: HOW MANY OF YOUR CHILDREN ARE UNDER AGE 18?

jails$minorNum <- data04359_DS0001$V1473
prisonFederal$minorNum <- data04572_DS0001$V1824
prisonState$minorNum <- data04572_DS0002$V1824

#jails
# V1474 S7Q9A - ANY MINOR CHILD IN RESIDENCE AT TIME OF 508 ADMISSION
# 1 yes
# 2 no 

#prisons
# V1825 S7Q9A: ANY OF THESE CHILDREN LIVING WITH YOU WHEN INCARCERATED

jails$minorWith <- data04359_DS0001$V1474
prisonFederal$minorWith <- data04572_DS0001$V1825
prisonState$minorWith <- data04572_DS0002$V1825

jails$minorAny[jails$minorAny > 2] <- NA
jails$minorAny[jails$minorAny == 1] <- TRUE
jails$minorAny[jails$minorAny == 2] <- FALSE

prisonState$minorAny[prisonState$minorAny > 2] <- NA
prisonState$minorAny[prisonState$minorAny == 1] <- TRUE
prisonState$minorAny[prisonState$minorAny == 2] <- FALSE

prisonFederal$minorAny[prisonFederal$minorAny > 2] <- NA
prisonFederal$minorAny[prisonFederal$minorAny == 1] <- TRUE
prisonFederal$minorAny[prisonFederal$minorAny == 2] <- FALSE

#CARE VARIABLES - PRISONS ONLY
# V1826 S7Q9A1: WERE YOU THE PRIMARY SOURCE OF FINANCIAL SUPPORT FOR THEM
# V1827 S7Q9A2: DID YOU PROVIDE MOST OF THE DAILY CARE FOR THEM 605
# V1828 S7Q9A3: ARE THESE CHILDREN CURRENTLY LIVING TOGETHER?

prisonFederal$minorFinancial <- data04572_DS0001$V1826
prisonState$minorFinancial <- data04572_DS0002$V1826
prisonFederal$minorCare <- data04572_DS0001$V1827
prisonState$minorCare <- data04572_DS0002$V1827
prisonFederal$minorTogether <- data04572_DS0001$V1828
prisonState$minorTogether <- data04572_DS0002$V1828

#TODO - JAIL INFER BASED ON WHERE LIBING, assumes they are living together

# jail
# V1475       S7Q9B_1 - INMATE'S CHILDREN LIVING WITH 508
#mother father

#prison
# V1829 S7Q9B_1: CHILD(REN) LIVING WITH NOW - CHILD'S MOTHER/FATHER (INCLUDING STEP-PARENTS) 605

jails$minorLiveParent <- data04359_DS0001$V1475
prisonFederal$minorLiveParent <- data04572_DS0001$V1829
prisonState$minorLiveParent <- data04572_DS0002$V1829

jails$minorLiveParent[jails$minorLiveParent > 2] <- NA
jails$minorLiveParent[jails$minorLiveParent == 1] <- TRUE
jails$minorLiveParent[jails$minorLiveParent == 2] <- FALSE

jails$minorLiveParent[is.na(jails$minorLiveParent) & jails$minorAny] <- TRUE

jails$minorFinancial <- jails$minorLiveParent

prisonState$minorAny[prisonState$minorAny > 2] <- NA
prisonState$minorAny[prisonState$minorAny == 1] <- TRUE
prisonState$minorAny[prisonState$minorAny == 2] <- FALSE

prisonFederal$minorAny[prisonFederal$minorAny > 2] <- NA
prisonFederal$minorAny[prisonFederal$minorAny == 1] <- TRUE
prisonFederal$minorAny[prisonFederal$minorAny == 2] <- FALSE

# jail
# V1476       S7Q9B_2 - INMATE'S CHILDREN LIVING WITH 508
#family

#prison
# V1830 S7Q9B_2: CHILD(REN) LIVING WITH NOW - CHILD'S GRANDMOTHER 605
# V1831 S7Q9B_3: CHILD(REN) LIVING WITH NOW - CHILD'S GRANDFATHER 606

jails$minorLiveGrandparent <- data04359_DS0001$V1476
prisonFederal$minorLiveGrandparent1 <- data04572_DS0001$V1830
prisonState$minorLiveGrandparent1 <- data04572_DS0002$V1830
prisonFederal$minorLiveGrandparent2 <- data04572_DS0001$V1831
prisonState$minorLiveGrandparent2 <- data04572_DS0002$V1831

#TODO combine

# jails$minorAny[jails$minorAny > 2] <- NA
# jails$minorAny[jails$minorAny == 1] <- TRUE
# jails$minorAny[jails$minorAny == 2] <- FALSE
# 
# prisonState$minorAny[prisonState$minorAny > 2] <- NA
# prisonState$minorAny[prisonState$minorAny == 1] <- TRUE
# prisonState$minorAny[prisonState$minorAny == 2] <- FALSE
# 
# prisonFederal$minorAny[prisonFederal$minorAny > 2] <- NA
# prisonFederal$minorAny[prisonFederal$minorAny == 1] <- TRUE
# prisonFederal$minorAny[prisonFederal$minorAny == 2] <- FALSE

# jail
# V1477       S7Q9B_3 - INMATE'S CHILDREN LIVING WITH 508
#family

#prison
# V1832 S7Q9B_4: CHILD(REN) LIVING WITH NOW - OTHER RELATIVES 606

jails$minorLiveRelative <- data04359_DS0001$V1477
prisonFederal$minorLiveRelative <- data04572_DS0001$V1832
prisonState$minorLiveRelative <- data04572_DS0002$V1832

# jails$minorAny[jails$minorAny > 2] <- NA
# jails$minorAny[jails$minorAny == 1] <- TRUE
# jails$minorAny[jails$minorAny == 2] <- FALSE
# 
# prisonState$minorAny[prisonState$minorAny > 2] <- NA
# prisonState$minorAny[prisonState$minorAny == 1] <- TRUE
# prisonState$minorAny[prisonState$minorAny == 2] <- FALSE
# 
# prisonFederal$minorAny[prisonFederal$minorAny > 2] <- NA
# prisonFederal$minorAny[prisonFederal$minorAny == 1] <- TRUE
# prisonFederal$minorAny[prisonFederal$minorAny == 2] <- FALSE

# jail
# V1478       S7Q9B_4 - INMATE'S CHILDREN LIVING WITH 508
# partner

# prison
# V1833 S7Q9B_5: CHILD(REN) LIVING WITH NOW - INMATE'S BOYFRIEND/GIRLFRIEND 606

jails$minorLivePartner <- data04359_DS0001$V1478
prisonFederal$minorLivePartner <- data04572_DS0001$V1833
prisonState$minorLivePartner <- data04572_DS0002$V1833

# jails$minorAny[jails$minorAny > 2] <- NA
# jails$minorAny[jails$minorAny == 1] <- TRUE
# jails$minorAny[jails$minorAny == 2] <- FALSE
# 
# prisonState$minorAny[prisonState$minorAny > 2] <- NA
# prisonState$minorAny[prisonState$minorAny == 1] <- TRUE
# prisonState$minorAny[prisonState$minorAny == 2] <- FALSE
# 
# prisonFederal$minorAny[prisonFederal$minorAny > 2] <- NA
# prisonFederal$minorAny[prisonFederal$minorAny == 1] <- TRUE
# prisonFederal$minorAny[prisonFederal$minorAny == 2] <- FALSE

# jail
# V1479       S7Q9B_5 - INMATE'S CHILDREN LIVING WITH 509
# friend of inmate

#prison
# V1834 S7Q9B_6: CHILD(REN) LIVING WITH NOW - INMATE'S FRIENDS 606

jails$minorLiveInmateFriend <- data04359_DS0001$V1479
prisonFederal$minorLiveInmateFriend <- data04572_DS0001$V1834
prisonState$minorLiveInmateFriend <- data04572_DS0002$V1834

# jails$minorAny[jails$minorAny > 2] <- NA
# jails$minorAny[jails$minorAny == 1] <- TRUE
# jails$minorAny[jails$minorAny == 2] <- FALSE
# 
# prisonState$minorAny[prisonState$minorAny > 2] <- NA
# prisonState$minorAny[prisonState$minorAny == 1] <- TRUE
# prisonState$minorAny[prisonState$minorAny == 2] <- FALSE
# 
# prisonFederal$minorAny[prisonFederal$minorAny > 2] <- NA
# prisonFederal$minorAny[prisonFederal$minorAny == 1] <- TRUE
# prisonFederal$minorAny[prisonFederal$minorAny == 2] <- FALSE

# jail
# V1480       S7Q9B_6 - INMATE'S CHILDREN LIVING WITH 509
# friend of inmates children

#prison
# V1835 S7Q9B_7: CHILD(REN) LIVING WITH NOW - FRIENDS OF THE INMATE'S CHILD(REN) 606

jails$minorLiveTheirFriend <- data04359_DS0001$V1480
prisonFederal$minorLiveTheirFriend <- data04572_DS0001$V1835
prisonState$minorLiveTheirFriend <- data04572_DS0002$V1835

# jails$minorAny[jails$minorAny > 2] <- NA
# jails$minorAny[jails$minorAny == 1] <- TRUE
# jails$minorAny[jails$minorAny == 2] <- FALSE
# 
# prisonState$minorAny[prisonState$minorAny > 2] <- NA
# prisonState$minorAny[prisonState$minorAny == 1] <- TRUE
# prisonState$minorAny[prisonState$minorAny == 2] <- FALSE
# 
# prisonFederal$minorAny[prisonFederal$minorAny > 2] <- NA
# prisonFederal$minorAny[prisonFederal$minorAny == 1] <- TRUE
# prisonFederal$minorAny[prisonFederal$minorAny == 2] <- FALSE

# jail
# V1481       S7Q9B_7 - INMATE'S CHILDREN LIVING WITH 509
# foster

#prison
# V1836 S7Q9B_8: CHILD(REN) LIVING WITH NOW - FOSTER HOME 607

jails$minorLiveFoster <- data04359_DS0001$V1481
prisonFederal$minorLiveFoster <- data04572_DS0001$V1836
prisonState$minorLiveFoster <- data04572_DS0002$V1836

# jails$minorAny[jails$minorAny > 2] <- NA
# jails$minorAny[jails$minorAny == 1] <- TRUE
# jails$minorAny[jails$minorAny == 2] <- FALSE
# 
# prisonState$minorAny[prisonState$minorAny > 2] <- NA
# prisonState$minorAny[prisonState$minorAny == 1] <- TRUE
# prisonState$minorAny[prisonState$minorAny == 2] <- FALSE
# 
# prisonFederal$minorAny[prisonFederal$minorAny > 2] <- NA
# prisonFederal$minorAny[prisonFederal$minorAny == 1] <- TRUE
# prisonFederal$minorAny[prisonFederal$minorAny == 2] <- FALSE

# jail
# V1482       S7Q9B_8 - INMATE'S CHILDREN LIVING WITH 509
# agency or institution

#prison
# V1837 S7Q9B_9: CHILD(REN) LIVING WITH NOW - AGENCY OR INSTITUTION 607

jails$minorLiveAgency <- data04359_DS0001$V1482
prisonFederal$minorLiveAgency <- data04572_DS0001$V1837
prisonState$minorLiveAgency <- data04572_DS0002$V1837

# jails$minorAny[jails$minorAny > 2] <- NA
# jails$minorAny[jails$minorAny == 1] <- TRUE
# jails$minorAny[jails$minorAny == 2] <- FALSE
# 
# prisonState$minorAny[prisonState$minorAny > 2] <- NA
# prisonState$minorAny[prisonState$minorAny == 1] <- TRUE
# prisonState$minorAny[prisonState$minorAny == 2] <- FALSE
# 
# prisonFederal$minorAny[prisonFederal$minorAny > 2] <- NA
# prisonFederal$minorAny[prisonFederal$minorAny == 1] <- TRUE
# prisonFederal$minorAny[prisonFederal$minorAny == 2] <- FALSE

# jail
# V1483       S7Q9B_9 - INMATE'S CHILDREN LIVING WITH 510
# alone

#prison
# V1838 S7Q9B_10: CHILD(REN) LIVING WITH NOW - ALONE 607

jails$minorLiveAlone <- data04359_DS0001$V1483
prisonFederal$minorLiveAlone <- data04572_DS0001$V1838
prisonState$minorLiveAlone <- data04572_DS0002$V1838

# jails$minorAny[jails$minorAny > 2] <- NA
# jails$minorAny[jails$minorAny == 1] <- TRUE
# jails$minorAny[jails$minorAny == 2] <- FALSE
# 
# prisonState$minorAny[prisonState$minorAny > 2] <- NA
# prisonState$minorAny[prisonState$minorAny == 1] <- TRUE
# prisonState$minorAny[prisonState$minorAny == 2] <- FALSE
# 
# prisonFederal$minorAny[prisonFederal$minorAny > 2] <- NA
# prisonFederal$minorAny[prisonFederal$minorAny == 1] <- TRUE
# prisonFederal$minorAny[prisonFederal$minorAny == 2] <- FALSE

# jail
# V1484       S7Q9B_10 - INMATE'S CHILDREN LIVING WITH 510
# other

#prison
# V1839 S7Q9B_11: CHILD(REN) LIVING WITH NOW - SOMEONE ELSE 607

jails$minorLiveOther1 <- data04359_DS0001$V1484
prisonFederal$minorLiveOther <- data04572_DS0001$V1839
prisonState$minorLiveOther <- data04572_DS0002$V1839

jails$minorAny[jails$minorAny > 2] <- NA
# jails$minorAny[jails$minorAny == 1] <- TRUE
# jails$minorAny[jails$minorAny == 2] <- FALSE
# 
# prisonState$minorAny[prisonState$minorAny > 2] <- NA
# prisonState$minorAny[prisonState$minorAny == 1] <- TRUE
# prisonState$minorAny[prisonState$minorAny == 2] <- FALSE
# 
# prisonFederal$minorAny[prisonFederal$minorAny > 2] <- NA
# prisonFederal$minorAny[prisonFederal$minorAny == 1] <- TRUE
# prisonFederal$minorAny[prisonFederal$minorAny == 2] <- FALSE

# jail
# V1485       S7Q9B_KEY - (KEY) INMATE'S CHILDREN LIVING WITH 510
# don't know

#prison NONE

jails$minorLiveOther2 <- data04359_DS0001$V1485

#TODO combine

# jails$minorAny[jails$minorAny > 2] <- NA
# jails$minorAny[jails$minorAny == 1] <- TRUE
# jails$minorAny[jails$minorAny == 2] <- FALSE
# 
# prisonState$minorAny[prisonState$minorAny > 2] <- NA
# prisonState$minorAny[prisonState$minorAny == 1] <- TRUE
# prisonState$minorAny[prisonState$minorAny == 2] <- FALSE
# 
# prisonFederal$minorAny[prisonFederal$minorAny > 2] <- NA
# prisonFederal$minorAny[prisonFederal$minorAny == 1] <- TRUE
# prisonFederal$minorAny[prisonFederal$minorAny == 2] <- FALSE

#jail
# V1487 S7Q10A - FREQUENCY OF TELEPHONE COMMUNICATION WITH 510 CHILDREN
# 1 Daily or almost daily
# 2 At least once a week
# 3 At least once a month
# 4 Less than once a month
# 5 Never

#prison
# V1843 S7Q10A: SINCE ADMISSION HOW OFTEN HAVE YOU MADE OR RECEIVED CALLS FROM CHILD(REN) 608

jails$minorComPhone <- data04359_DS0001$V1487
prisonFederal$minorComPhone <- data04572_DS0001$V1843
prisonState$minorComPhone <- data04572_DS0002$V1843

# TODO

#jail
# V1488 S7Q10B - FREQUENCY OF MAIL COMMUNICATION WITH 511 CHILDREN
# 1 Daily or almost daily
# 2 At least once a week
# 3 At least once a month
# 4 Less than once a month
# 5 Never

#prison
# V1844 S7Q10B: SENT OR RECEIVED MAIL FROM CHILD(REN)609

jails$minorComMail <- data04359_DS0001$V1488
prisonFederal$minorComMail <- data04572_DS0001$V1844
prisonState$minorComMail <- data04572_DS0002$V1844

#TODO

#jail
# V1489       S7Q10C - FREQUENCY OF VISITS WITH CHILDREN
# 1 Daily or almost daily
# 2 At least once a week
# 3 At least once a month
# 4 Less than once a month
# 5 Never

#prison
# V1845 S7Q10C: VISITED BY CHILD(REN)

jails$minorComVisit <- data04359_DS0001$V1489
prisonFederal$minorComVisit <- data04572_DS0001$V1845
prisonState$minorComVisit <- data04572_DS0002$V1845

# TODO

#jail
# V1501 S7Q11C - AMOUNT OF INCOME IN MONTH PRIOR TO 515 ADMISSION
# 00 No income
# 01 1 - 99
# 02 100 - 199
# 03 200 - 299
# 04 300 - 399
# 05 400 - 499
# 06 500 - 599
# 07 600 - 799
# 08 800 - 999
# 09 1,000 - 1,199
# 10 1,200 - 1,499
# 11 1,500 - 1,999
# 12 2,000 - 2,499
# 13 2,500 - 4,999
# 14 5,000 or more

#prison
# V1857 S7Q11C: MONTH BEFORE ARREST MONTHLY INCOME

jails$income <- data04359_DS0001$V1501
prisonFederal$income <- data04572_DS0001$V1857
prisonState$income <- data04572_DS0002$V1857

jails$incomeLower <- NA
prisonFederal$incomeLower <- NA
prisonState$incomeLower <- NA

# 97 Don't know
# 98 Refused
# 99 (M) Blank

jails$income[jails$income > 12] <- NA
prisonFederal$income[prisonFederal$income > 12] <- NA
prisonState$income[prisonState$income > 12] <- NA

# 00 No income

jails$incomeLower[jails$income == 0] <- 0
prisonFederal$incomeLower[prisonFederal$income == 0] <- 0
prisonState$incomeLower[prisonState$income == 0] <- 0

jails$income[jails$income == 0] <- "None"
prisonFederal$income[prisonFederal$income == 0] <- "None"
prisonState$income[prisonState$income == 0] <- "None"

# 01 $1 - 199

jails$incomeLower[jails$income == 1] <- 1
prisonFederal$incomeLower[prisonFederal$income == 1] <- 1
prisonState$incomeLower[prisonState$income == 1] <- 1

jails$income[jails$income == "1"] <- "1 - 199"
prisonFederal$income[prisonFederal$income == "1"] <- "1 - 199"
prisonState$income[prisonState$income == "1"] <- "1 - 199"

# 02 200 - 399

jails$incomeLower[jails$income == "2"] <- 200
prisonFederal$incomeLower[prisonFederal$income == "2"] <- 200
prisonState$incomeLower[prisonState$income == "2"] <- 200

jails$income[jails$income == "2"] <- "200 - 399"
prisonFederal$income[prisonFederal$income == "2"] <- "200 - 399"
prisonState$income[prisonState$income == "2"] <- "200 - 399"

# 03 400 - 599

jails$incomeLower[jails$income == "3"] <- 400
prisonFederal$incomeLower[prisonFederal$income == "3"] <- 400
prisonState$incomeLower[prisonState$income == "3"] <- 400

jails$income[jails$income == "3"] <- "400 - 599"
prisonFederal$income[prisonFederal$income == "3"] <- "400 - 599"
prisonState$income[prisonState$income == "3"] <- "400 - 599"

# 04 600 - 799

jails$incomeLower[jails$income == "4"] <- 600
prisonFederal$incomeLower[prisonFederal$income == "4"] <- 600
prisonState$incomeLower[prisonState$income == "4"] <- 600

jails$income[jails$income == "4"] <- "600 - 799"
prisonFederal$income[prisonFederal$income == "4"] <- "600 - 799"
prisonState$income[prisonState$income == "4"] <- "600 - 799"

# 05 800 - 999

jails$incomeLower[jails$income == "5"] <- 800
prisonFederal$incomeLower[prisonFederal$income == "5"] <- 800
prisonState$incomeLower[prisonState$income == "5"] <- 800

jails$income[jails$income == "5"] <- "800 - 999"
prisonFederal$income[prisonFederal$income == "5"] <- "800 - 999"
prisonState$income[prisonState$income == "5"] <- "800 - 999"

# 06 1000 - 1199

jails$incomeLower[jails$income == "6"] <- 1000
prisonFederal$incomeLower[prisonFederal$income == "6"] <- 1000
prisonState$incomeLower[prisonState$income == "6"] <- 1000

jails$income[jails$income == "6"] <- "1000 - 1199"
prisonFederal$income[prisonFederal$income == "6"] <- "1000 - 1199"
prisonState$income[prisonState$income == "6"] <- "1000 - 1199"

# 07 1200 - 1499

jails$incomeLower[jails$income == "7"] <- 1200
prisonFederal$incomeLower[prisonFederal$income == "7"] <- 1200
prisonState$incomeLower[prisonState$income == "7"] <- 1200

jails$income[jails$income == "7"] <- "1200 - 1499"
prisonFederal$income[prisonFederal$income == "7"] <- "1200 - 1499"
prisonState$income[prisonState$income == "7"] <- "1200 - 1499"


# 08 1500 - 1999

jails$incomeLower[jails$income == "8"] <- 1500
prisonFederal$incomeLower[prisonFederal$income == "8"] <- 1500
prisonState$incomeLower[prisonState$income == "8"] <- 1500

jails$income[jails$income == "8"] <- "1500 - 1999"
prisonFederal$income[prisonFederal$income == "8"] <- "1500 - 1999"
prisonState$income[prisonState$income == "8"] <- "1500 - 1999"

# 09 2000 - 2499

jails$incomeLower[jails$income == "9"] <- 2000
prisonFederal$incomeLower[prisonFederal$income == "9"] <- 2000
prisonState$incomeLower[prisonState$income == "9"] <- 2000

jails$income[jails$income == "9"] <- "2000 - 2499"
prisonFederal$income[prisonFederal$income == "9"] <- "2000 - 2499"
prisonState$income[prisonState$income == "9"] <- "2000 - 2499"

# 10 2500 - 4999

jails$incomeLower[jails$income == "10"] <- 2500
prisonFederal$incomeLower[prisonFederal$income == "10"] <- 2500
prisonState$incomeLower[prisonState$income == "10"] <- 2500

jails$income[jails$income == "10"] <- "2500 - 4999"
prisonFederal$income[prisonFederal$income == "10"] <- "2500 - 4999"
prisonState$income[prisonState$income == "10"] <- "2500 - 4999"

# 11 5000 - 7499

jails$incomeLower[jails$income == "11"] <- 5000
prisonFederal$incomeLower[prisonFederal$income == "11"] <- 5000
prisonState$incomeLower[prisonState$income == "11"] <- 5000

jails$income[jails$income == "11"] <- "5000 - 7499"
prisonFederal$income[prisonFederal$income == "11"] <- "5000 - 7499"
prisonState$income[prisonState$income == "11"] <- "5000 - 7499"


# 12 7500+

jails$incomeLower[jails$income == "12"] <- 7500
prisonFederal$incomeLower[prisonFederal$income == "12"] <- 7500
prisonState$incomeLower[prisonState$income == "12"] <- 7500

jails$income[jails$income == "12"] <- "7500+"
prisonFederal$income[prisonFederal$income == "12"] <- "7500+"
prisonState$income[prisonState$income == "12"] <- "7500+"

# TODO

#jail
# V2054 S9Q17A - HAVE A DISABILITY
# 1 yes
# 2 no

#prsion
# V2433 S9Q16: CONSIDER YOURSELF TO HAVE A DISABILITY

jails$diability <- data04359_DS0001$V2054
prisonFederal$diability <- data04572_DS0001$V2433
prisonState$diability <- data04572_DS0002$V2433

jails$diability[jails$diability > 2] <- NA
jails$diability[jails$diability == 1] <- TRUE
jails$diability[jails$diability == 2] <- FALSE

prisonState$diability[prisonState$diability > 2] <- NA
prisonState$diability[prisonState$diability == 1] <- TRUE
prisonState$diability[prisonState$diability == 2] <- FALSE

prisonFederal$diability[prisonFederal$diability > 2] <- NA
prisonFederal$diability[prisonFederal$diability == 1] <- TRUE
prisonFederal$diability[prisonFederal$diability == 2] <- FALSE

#jail
# V1906       S9Q3C - PREGNANT WHEN ADMITTED

#prison
# V2284 S9Q3C: WHEN ADMITTED, PREGNANT 730

jails$pregnant <- data04359_DS0001$V1906
prisonFederal$pregnant <- data04572_DS0001$V2284
prisonState$pregnant <- data04572_DS0002$V2284

jails$pregnant[jails$pregnant > 2] <- NA
jails$pregnant[jails$pregnant == 1] <- TRUE
jails$pregnant[jails$pregnant == 2] <- FALSE

prisonState$pregnant[prisonState$pregnant > 2] <- NA
prisonState$pregnant[prisonState$pregnant == 1] <- TRUE
prisonState$pregnant[prisonState$pregnant == 2] <- FALSE

prisonFederal$pregnant[prisonFederal$pregnant > 2] <- NA
prisonFederal$pregnant[prisonFederal$pregnant == 1] <- TRUE
prisonFederal$pregnant[prisonFederal$pregnant == 2] <- FALSE

# jail
# V2046 - EVER CONSIDERED SUICIDE
# 1 yes
# 2 no 

# prisons
# V2425 S9Q14B: EVER CONSIDERED SUICIDE

jails$mentalSuicideConsider <- data04359_DS0001$V2046
prisonFederal$mentalSuicideConsider <- data04572_DS0001$V2425
prisonState$mentalSuicideConsider <- data04572_DS0002$V2425

jails$mentalSuicideConsider[jails$mentalSuicideConsider > 2] <- NA
jails$mentalSuicideConsider[jails$mentalSuicideConsider == 1] <- TRUE
jails$mentalSuicideConsider[jails$mentalSuicideConsider == 2] <- FALSE

prisonState$mentalSuicideConsider[prisonState$mentalSuicideConsider > 2] <- NA
prisonState$mentalSuicideConsider[prisonState$mentalSuicideConsider == 1] <- TRUE
prisonState$mentalSuicideConsider[prisonState$mentalSuicideConsider == 2] <- FALSE

prisonFederal$mentalSuicideConsider[prisonFederal$mentalSuicideConsider > 2] <- NA
prisonFederal$mentalSuicideConsider[prisonFederal$mentalSuicideConsider == 1] <- TRUE
prisonFederal$mentalSuicideConsider[prisonFederal$mentalSuicideConsider == 2] <- FALSE

# jails
# V2044 - S9Q15A - EVER ATTEMPTED SUICIDE
# 1 yes
# 2 no 

# prisons
# V2423 S9Q14A: EVER ATTEMPTED SUICIDE

jails$mentalSuicideAttempted <- data04359_DS0001$V2044
prisonFederal$mentalSuicideAttempted <- data04572_DS0001$V2423
prisonState$mentalSuicideAttempted <- data04572_DS0002$V2423

jails$mentalSuicideAttempted[jails$mentalSuicideAttempted > 2] <- NA
jails$mentalSuicideAttempted[jails$mentalSuicideAttempted == 1] <- TRUE
jails$mentalSuicideAttempted[jails$mentalSuicideAttempted == 2] <- FALSE

prisonState$mentalSuicideAttempted[prisonState$mentalSuicideAttempted > 2] <- NA
prisonState$mentalSuicideAttempted[prisonState$mentalSuicideAttempted == 1] <- TRUE
prisonState$mentalSuicideAttempted[prisonState$mentalSuicideAttempted == 2] <- FALSE

prisonFederal$mentalSuicideAttempted[prisonFederal$mentalSuicideAttempted > 2] <- NA
prisonFederal$mentalSuicideAttempted[prisonFederal$mentalSuicideAttempted == 1] <- TRUE
prisonFederal$mentalSuicideAttempted[prisonFederal$mentalSuicideAttempted == 2] <- FALSE

#jails
# V2045 NUMBER OF SUICIDE ATTEMPTS

#prisons
# V2424 S9Q14A1: # OF TIMES ATTEMPTED SUICIDE

jails$mentalSuicideAttemptSum <- data04359_DS0001$V2045
prisonFederal$mentalSuicideAttemptSum <- data04572_DS0001$V2424
prisonState$mentalSuicideAttemptSum <- data04572_DS0002$V2424

jails$mentalSuicideAttemptSum[jails$mentalSuicideAttemptSum == 99] <- NA

prisonState$mentalSuicideAttemptSum[prisonState$mentalSuicideAttemptSum == 99] <- NA

prisonFederal$mentalSuicideAttemptSum[prisonFederal$mentalSuicideAttemptSum = 99] <- NA

#jails
# V2047 - MENTAL HEALTH ISSUE INHIBITS FULL PARTICIPATION IN WORK/SCHOOL
# 1 yes
# 2 no 

#prisons
# V2426 S9Q15A: MENTAL HEALTH CONDITION PREVENTS FULL PARTICIPATION IN WORK, SCHOOL, OR OTHER ACTIVITIES?

jails$mentalImpaired <- data04359_DS0001$V2047
prisonFederal$mentalImpaired <- data04572_DS0001$V2426
prisonState$mentalImpaired <- data04572_DS0002$V2426

jails$mentalImpaired[jails$mentalImpaired > 2] <- NA
jails$mentalImpaired[jails$mentalImpaired == 1] <- TRUE
jails$mentalImpaired[jails$mentalImpaired == 2] <- FALSE

prisonState$mentalImpaired[prisonState$mentalImpaired > 2] <- NA
prisonState$mentalImpaired[prisonState$mentalImpaired == 1] <- TRUE
prisonState$mentalImpaired[prisonState$mentalImpaired == 2] <- FALSE

prisonFederal$mentalImpaired[prisonFederal$mentalImpaired > 2] <- NA
prisonFederal$mentalImpaired[prisonFederal$mentalImpaired == 1] <- TRUE
prisonFederal$mentalImpaired[prisonFederal$mentalImpaired == 2] <- FALSE

#jails
# V2022       S9Q10A_1 - HAD A DEPRESSIVE DISORDER 661
# 1 yes
# 2 no 

#prisons
# V2401 S9Q9A_1: EVER DIAGNOSED - A DEPRESSIVE DISORDER

jails$mentalDepressive <- data04359_DS0001$V2022
prisonFederal$mentalDepressive <- data04572_DS0001$V2401
prisonState$mentalDepressive <- data04572_DS0002$V2401

jails$mentalDepressive[jails$mentalDepressive > 2] <- NA
jails$mentalDepressive[jails$mentalDepressive == 1] <- TRUE
jails$mentalDepressive[jails$mentalDepressive == 2] <- FALSE

prisonState$mentalDepressive[prisonState$mentalDepressive > 2] <- NA
prisonState$mentalDepressive[prisonState$mentalDepressive == 1] <- TRUE
prisonState$mentalDepressive[prisonState$mentalDepressive == 2] <- FALSE

prisonFederal$mentalDepressive[prisonFederal$mentalDepressive > 2] <- NA
prisonFederal$mentalDepressive[prisonFederal$mentalDepressive == 1] <- TRUE
prisonFederal$mentalDepressive[prisonFederal$mentalDepressive == 2] <- FALSE

#jails
# V2023       S9Q10A_2 - HAD BI-POLAR DISORDER 661
# 1 yes
# 2 no 

#prisons
# V2402 S9Q9A_2: EVER DIAGNOSED - MANIC-DEPRESSION, BIPOLAR DISORDER, OR MANIA

jails$mentalBipolar <- data04359_DS0001$V2023
prisonFederal$mentalBipolar <- data04572_DS0001$V2402
prisonState$mentalBipolar <- data04572_DS0002$V2402

jails$mentalBipolar[jails$mentalBipolar > 2] <- NA
jails$mentalBipolar[jails$mentalBipolar == 1] <- TRUE
jails$mentalBipolar[jails$mentalBipolar == 2] <- FALSE

prisonState$mentalBipolar[prisonState$mentalBipolar > 2] <- NA
prisonState$mentalBipolar[prisonState$mentalBipolar == 1] <- TRUE
prisonState$mentalBipolar[prisonState$mentalBipolar == 2] <- FALSE

prisonFederal$mentalBipolar[prisonFederal$mentalBipolar > 2] <- NA
prisonFederal$mentalBipolar[prisonFederal$mentalBipolar == 1] <- TRUE
prisonFederal$mentalBipolar[prisonFederal$mentalBipolar == 2] <- FALSE

#jails
# V2024       S9Q10A_3 - HAD PSYCHOTIC DISORDER 662
# 1 yes
# 2 no 

#prisons
# V2403 S9Q9A_3: EVER DIAGNOSED - SCHIZOPHRENIA OR ANOTHER PSYCHOTIC DISORDER

jails$mentalPsychotic <- data04359_DS0001$V2024
prisonFederal$mentalPsychotic <- data04572_DS0001$V2403
prisonState$mentalPsychotic <- data04572_DS0002$V2403

jails$mentalPsychotic[jails$mentalPsychotic > 2] <- NA
jails$mentalPsychotic[jails$mentalPsychotic == 1] <- TRUE
jails$mentalPsychotic[jails$mentalPsychotic == 2] <- FALSE

prisonState$mentalPsychotic[prisonState$mentalPsychotic > 2] <- NA
prisonState$mentalPsychotic[prisonState$mentalPsychotic == 1] <- TRUE
prisonState$mentalPsychotic[prisonState$mentalPsychotic == 2] <- FALSE

prisonFederal$mentalPsychotic[prisonFederal$mentalPsychotic > 2] <- NA
prisonFederal$mentalPsychotic[prisonFederal$mentalPsychotic == 1] <- TRUE
prisonFederal$mentalPsychotic[prisonFederal$mentalPsychotic == 2] <- FALSE

#jails
# V2025       S9Q10A_4 - HAD POST-TRAUMATIC STRESS DISORDER 662
# 1 yes
# 2 no 

#prisons
# V2404 S9Q9A_4: EVER DIAGNOSED - POST-TRAUMATIC STRESS DISORDER

jails$mentalPTSD <- data04359_DS0001$V2025
prisonFederal$mentalPTSD <- data04572_DS0001$V2404
prisonState$mentalPTSD <- data04572_DS0002$V2404

jails$mentalPTSD[jails$mentalPTSD > 2] <- NA
jails$mentalPTSD[jails$mentalPTSD == 1] <- TRUE
jails$mentalPTSD[jails$mentalPTSD == 2] <- FALSE

prisonState$mentalPTSD[prisonState$mentalPTSD > 2] <- NA
prisonState$mentalPTSD[prisonState$mentalPTSD == 1] <- TRUE
prisonState$mentalPTSD[prisonState$mentalPTSD == 2] <- FALSE

prisonFederal$mentalPTSD[prisonFederal$mentalPTSD > 2] <- NA
prisonFederal$mentalPTSD[prisonFederal$mentalPTSD == 1] <- TRUE
prisonFederal$mentalPTSD[prisonFederal$mentalPTSD == 2] <- FALSE

#jails
# V2026       S9Q10A_5 - HAD OTHER ANXIETY DISORDER 662
# 1 yes
# 2 no 

#prisons
# V2405 S9Q9A_5: EVER DIAGNOSED - ANOTHER ANXIETY DISORDER, SUCH AS A PANIC DISORDER

jails$mentalAnxiety <- data04359_DS0001$V2026
prisonFederal$mentalAnxiety <- data04572_DS0001$V2405
prisonState$mentalAnxiety <- data04572_DS0002$V2405

jails$mentalAnxiety[jails$mentalAnxiety > 2] <- NA
jails$mentalAnxiety[jails$mentalAnxiety == 1] <- TRUE
jails$mentalAnxiety[jails$mentalAnxiety == 2] <- FALSE

prisonState$mentalAnxiety[prisonState$mentalAnxiety > 2] <- NA
prisonState$mentalAnxiety[prisonState$mentalAnxiety == 1] <- TRUE
prisonState$mentalAnxiety[prisonState$mentalAnxiety == 2] <- FALSE

prisonFederal$mentalAnxiety[prisonFederal$mentalAnxiety > 2] <- NA
prisonFederal$mentalAnxiety[prisonFederal$mentalAnxiety == 1] <- TRUE
prisonFederal$mentalAnxiety[prisonFederal$mentalAnxiety == 2] <- FALSE

#jails
# V2027       S9Q10A_6 - HAD PERSONALITY DISORDER 663
# 1 yes
# 2 no 

#prisons
# V2406 S9Q9A_6: EVER DIAGNOSED - A PERSONALITY DISORDER

jails$mentalPersonality <- data04359_DS0001$V2027
prisonFederal$mentalPersonality <- data04572_DS0001$V2406
prisonState$mentalPersonality <- data04572_DS0002$V2406

jails$mentalPersonality[jails$mentalPersonality > 2] <- NA
jails$mentalPersonality[jails$mentalPersonality == 1] <- TRUE
jails$mentalPersonality[jails$mentalPersonality == 2] <- FALSE

prisonState$mentalPersonality[prisonState$mentalPersonality > 2] <- NA
prisonState$mentalPersonality[prisonState$mentalPersonality == 1] <- TRUE
prisonState$mentalPersonality[prisonState$mentalPersonality == 2] <- FALSE

prisonFederal$mentalPersonality[prisonFederal$mentalPersonality > 2] <- NA
prisonFederal$mentalPersonality[prisonFederal$mentalPersonality == 1] <- TRUE
prisonFederal$mentalPersonality[prisonFederal$mentalPersonality == 2] <- FALSE

#jails
# V2028       S9Q10A_7 - HAD OTHER MENTAL CONDITION 663
# 1 yes
# 2 no 

#prisons
# V2407 S9Q9A_7: EVER DIAGNOSED - ANY OTHER MENTAL OR EMOTIONAL CONDITION

jails$mentalOther <- data04359_DS0001$V2028
prisonFederal$mentalOther <- data04572_DS0001$V2407
prisonState$mentalOther <- data04572_DS0002$V2407

jails$mentalOther[jails$mentalOther > 2] <- NA
jails$mentalOther[jails$mentalOther == 1] <- TRUE
jails$mentalOther[jails$mentalOther == 2] <- FALSE

prisonState$mentalOther[prisonState$mentalOther > 2] <- NA
prisonState$mentalOther[prisonState$mentalOther == 1] <- TRUE
prisonState$mentalOther[prisonState$mentalOther == 2] <- FALSE

prisonFederal$mentalOther[prisonFederal$mentalOther > 2] <- NA
prisonFederal$mentalOther[prisonFederal$mentalOther == 1] <- TRUE
prisonFederal$mentalOther[prisonFederal$mentalOther == 2] <- FALSE

#jails
# V2029       S9Q10C - WHEN MOST RECENTLY DIAGNOSED 663
# 1 Less than 6 months ago
# 2 6 months to 1 year ago
# 3 1 to 2 years ago
# 4 More than 2 years ago

#prisons
# V2408 S9Q9B: WHEN MOST RECENTLY DIAGNOSED WITH THIS (THESE) CONDITIONS

jails$mentalDiagnoseTime <- data04359_DS0001$V2029
prisonFederal$mentalDiagnoseTime <- data04572_DS0001$V2408
prisonState$mentalDiagnoseTime <- data04572_DS0002$V2408

#jails
# V2032       S9Q11B_2 - TAKING SUCH MED AT TIME OF ARREST 664
# 1 yes
# 2 no 

#prisons
# V2411 S9Q10B_2: AT ARREST, TAKING MEDICATION FOR MENTAL CONDITION

jails$mentalMedAdmit <- data04359_DS0001$V2032
prisonFederal$mentalMedAdmit <- data04572_DS0001$V2411
prisonState$mentalMedAdmit <- data04572_DS0002$V2411

jails$mentalMedAdmit[jails$mentalMedAdmit > 2] <- NA
jails$mentalMedAdmit[jails$mentalMedAdmit == 1] <- TRUE
jails$mentalMedAdmit[jails$mentalMedAdmit == 2] <- FALSE

prisonState$mentalMedAdmit[prisonState$mentalMedAdmit > 2] <- NA
prisonState$mentalMedAdmit[prisonState$mentalMedAdmit == 1] <- TRUE
prisonState$mentalMedAdmit[prisonState$mentalMedAdmit == 2] <- FALSE

prisonFederal$mentalMedAdmit[prisonFederal$mentalMedAdmit > 2] <- NA
prisonFederal$mentalMedAdmit[prisonFederal$mentalMedAdmit == 1] <- TRUE
prisonFederal$mentalMedAdmit[prisonFederal$mentalMedAdmit == 2] <- FALSE

#jails
# V2033       S9Q11C - TAKEN SUCH MED SINCE ADMISSION 664
# 1 yes
# 2 no

#prisons
# V2412 S9Q10C: TAKEN MEDICATION FOR A MENTAL CONDITION SINCE ADMISSION

jails$mentalMedSinceArrest <- data04359_DS0001$V2033
prisonFederal$mentalMedSinceArrest <- data04572_DS0001$V2412
prisonState$mentalMedSinceArrest <- data04572_DS0002$V2412

jails$mentalMedSinceArrest[jails$mentalMedSinceArrest > 2] <- NA
jails$mentalMedSinceArrest[jails$mentalMedSinceArrest == 1] <- TRUE
jails$mentalMedSinceArrest[jails$mentalMedSinceArrest == 2] <- FALSE

prisonState$mentalMedSinceArrest[prisonState$mentalMedSinceArrest > 2] <- NA
prisonState$mentalMedSinceArrest[prisonState$mentalMedSinceArrest == 1] <- TRUE
prisonState$mentalMedSinceArrest[prisonState$mentalMedSinceArrest == 2] <- FALSE

prisonFederal$mentalMedSinceArrest[prisonFederal$mentalMedSinceArrest > 2] <- NA
prisonFederal$mentalMedSinceArrest[prisonFederal$mentalMedSinceArrest == 1] <- TRUE
prisonFederal$mentalMedSinceArrest[prisonFederal$mentalMedSinceArrest == 2] <- FALSE

#jails
# V2040 S9Q13C - RECEIVED SUCH COUNSELING FOR MENTAL HEALTH PROBLEMS SINCE ADMISSION

#prisons
# V2419 S9Q12C: RECEIVED COUNSELING SINCE ADMISSION

jails$mentalCounselSince <- data04359_DS0001$V2040
prisonFederal$mentalCounselSince <- data04572_DS0001$V2419
prisonState$mentalCounselSince <- data04572_DS0002$V2419

jails$mentalCounselSince[jails$mentalCounselSince > 2] <- NA
jails$mentalCounselSince[jails$mentalCounselSince == 1] <- TRUE
jails$mentalCounselSince[jails$mentalCounselSince == 2] <- FALSE

prisonState$mentalCounselSince[prisonState$mentalCounselSince > 2] <- NA
prisonState$mentalCounselSince[prisonState$mentalCounselSince == 1] <- TRUE
prisonState$mentalCounselSince[prisonState$mentalCounselSince == 2] <- FALSE

prisonFederal$mentalCounselSince[prisonFederal$mentalCounselSince > 2] <- NA
prisonFederal$mentalCounselSince[prisonFederal$mentalCounselSince == 1] <- TRUE
prisonFederal$mentalCounselSince[prisonFederal$mentalCounselSince == 2] <- FALSE

#jails
# V2043 S9Q14C - RECEIVED OTHER MENTAL HEALTH TREATMENT SINCE ADMISSION

#prisons
# V2422 S9Q13C: RECEIVED MENTAL HEALTH TREATMENT SINCE ADMISSION

jails$mentalTreatSince <- data04359_DS0001$V2043
prisonFederal$mentalTreatSince <- data04572_DS0001$V2422
prisonState$mentalTreatSince <- data04572_DS0002$V2422

jails$mentalTreatSince[jails$mentalTreatSince > 2] <- NA
jails$mentalTreatSince[jails$mentalTreatSince == 1] <- TRUE
jails$mentalTreatSince[jails$mentalTreatSince == 2] <- FALSE

prisonState$mentalTreatSince[prisonState$mentalTreatSince > 2] <- NA
prisonState$mentalTreatSince[prisonState$mentalTreatSince == 1] <- TRUE
prisonState$mentalTreatSince[prisonState$mentalTreatSince == 2] <- FALSE

prisonFederal$mentalTreatSince[prisonFederal$mentalTreatSince > 2] <- NA
prisonFederal$mentalTreatSince[prisonFederal$mentalTreatSince == 1] <- TRUE
prisonFederal$mentalTreatSince[prisonFederal$mentalTreatSince == 2] <- FALSE

#jails
#NON MENTAL HEALTH MEDS
# V1896       S9Q1B - TAKING PRESCRIPTION MED AT ADMISSION 627
# 1 yes
# 2 no 

#prisons
# V2272 S9Q1B: AT ADMISSION, TAKING PRESCRIBED MEDICATION 726

jails$healthMedsAdmit <- data04359_DS0001$V1896
prisonFederal$healthMedsAdmit <- data04572_DS0001$V2272
prisonState$healthMedsAdmit <- data04572_DS0002$V2272

jails$healthMedsAdmit[jails$healthMedsAdmit > 2] <- NA
jails$healthMedsAdmit[jails$healthMedsAdmit == 1] <- TRUE
jails$healthMedsAdmit[jails$healthMedsAdmit == 2] <- FALSE

prisonState$healthMedsAdmit[prisonState$healthMedsAdmit > 2] <- NA
prisonState$healthMedsAdmit[prisonState$healthMedsAdmit == 1] <- TRUE
prisonState$healthMedsAdmit[prisonState$healthMedsAdmit == 2] <- FALSE

prisonFederal$healthMedsAdmit[prisonFederal$healthMedsAdmit > 2] <- NA
prisonFederal$healthMedsAdmit[prisonFederal$healthMedsAdmit == 1] <- TRUE
prisonFederal$healthMedsAdmit[prisonFederal$healthMedsAdmit == 2] <- FALSE

#jails
# V1897 S9Q1C - CONTINUED TO TAKE PRESCRIPTION MED AFTER 628
# 1 yes
# 2 no 

#prisons
# V2273 S9Q1C: AFTER ADMISSION, CONTINUED TAKING MEDICATION?

jails$healthMedsSinceAdmit <- data04359_DS0001$V1897
prisonFederal$healthMedsSinceAdmit <- data04572_DS0001$V2273
prisonState$healthMedsSinceAdmit <- data04572_DS0002$V2273

jails$healthMedsSinceAdmit[jails$healthMedsSinceAdmit > 2] <- NA
jails$healthMedsSinceAdmit[jails$healthMedsSinceAdmit == 1] <- TRUE
jails$healthMedsSinceAdmit[jails$healthMedsSinceAdmit == 2] <- FALSE

prisonState$healthMedsSinceAdmit[prisonState$healthMedsSinceAdmit > 2] <- NA
prisonState$healthMedsSinceAdmit[prisonState$healthMedsSinceAdmit == 1] <- TRUE
prisonState$healthMedsSinceAdmit[prisonState$healthMedsSinceAdmit == 2] <- FALSE

prisonFederal$healthMedsSinceAdmit[prisonFederal$healthMedsSinceAdmit > 2] <- NA
prisonFederal$healthMedsSinceAdmit[prisonFederal$healthMedsSinceAdmit == 1] <- TRUE
prisonFederal$healthMedsSinceAdmit[prisonFederal$healthMedsSinceAdmit == 2] <- FALSE

# jails
# V1927       S9Q5C - INJURED IN ACCIDENT SINCE ADMISSION
# V1936       S9Q5C2 - SEEN BY MEDICAL PERSONNEL FOR INJURIES accident

#prison
# V2305 S9Q5B: SINCE ADMISSION, INJURED IN AN ACCIDENT
# V2314 S9Q5B2: EXAMINED BY MEDICAL PERSONNEL

jails$healthInjuredAccident <- data04359_DS0001$V1927
prisonFederal$healthInjuredAccident <- data04572_DS0001$V2305
prisonState$healthInjuredAccident <- data04572_DS0002$V2305

jails$healthInjuredAccident[jails$healthInjuredAccident > 2] <- NA
jails$healthInjuredAccident[jails$healthInjuredAccident == 1] <- TRUE
jails$healthInjuredAccident[jails$healthInjuredAccident == 2] <- FALSE

prisonState$healthInjuredAccident[prisonState$healthInjuredAccident > 2] <- NA
prisonState$healthInjuredAccident[prisonState$healthInjuredAccident == 1] <- TRUE
prisonState$healthInjuredAccident[prisonState$healthInjuredAccident == 2] <- FALSE

prisonFederal$healthInjuredAccident[prisonFederal$healthInjuredAccident > 2] <- NA
prisonFederal$healthInjuredAccident[prisonFederal$healthInjuredAccident == 1] <- TRUE
prisonFederal$healthInjuredAccident[prisonFederal$healthInjuredAccident == 2] <- FALSE

jails$healthInjuredAccidentExamined <- data04359_DS0001$V1936
prisonFederal$healthInjuredAccidentExamined <- data04572_DS0001$V2314
prisonState$healthInjuredAccidentExamined <- data04572_DS0002$V2314

jails$healthInjuredAccidentExamined[jails$healthInjuredAccidentExamined > 2] <- NA
jails$healthInjuredAccidentExamined[jails$healthInjuredAccidentExamined == 1] <- TRUE
jails$healthInjuredAccidentExamined[jails$healthInjuredAccidentExamined == 2] <- FALSE

prisonState$healthInjuredAccidentExamined[prisonState$healthInjuredAccidentExamined > 2] <- NA
prisonState$healthInjuredAccidentExamined[prisonState$healthInjuredAccidentExamined == 1] <- TRUE
prisonState$healthInjuredAccidentExamined[prisonState$healthInjuredAccidentExamined == 2] <- FALSE

prisonFederal$healthInjuredAccidentExamined[prisonFederal$healthInjuredAccidentExamined > 2] <- NA
prisonFederal$healthInjuredAccidentExamined[prisonFederal$healthInjuredAccidentExamined == 1] <- TRUE
prisonFederal$healthInjuredAccidentExamined[prisonFederal$healthInjuredAccidentExamined == 2] <- FALSE

#jails
# V1914       S9Q5A - INJURIES RECEIVED IN A FIGHT
# V1926       S9Q5B2- SEEN BY MEDICAL PERSONNEL FOR INJURIES

#prisons
# V2292 S9Q5A: SINCE ADMISSION, INTENTIONALLY INJURED
# V2304 S9Q5A2: EXAMINED BY MEDICAL PERSONNEL

jails$healthInjuredIntentional <- data04359_DS0001$V1914
prisonFederal$healthInjuredIntentional <- data04572_DS0001$V2292
prisonState$healthInjuredIntentional <- data04572_DS0002$V2292

jails$healthInjuredIntentional[jails$healthInjuredIntentional > 2] <- NA
jails$healthInjuredIntentional[jails$healthInjuredIntentional == 1] <- TRUE
jails$healthInjuredIntentional[jails$healthInjuredIntentional == 2] <- FALSE

prisonState$healthInjuredIntentional[prisonState$healthInjuredIntentional > 2] <- NA
prisonState$healthInjuredIntentional[prisonState$healthInjuredIntentional == 1] <- TRUE
prisonState$healthInjuredIntentional[prisonState$healthInjuredIntentional == 2] <- FALSE

prisonFederal$healthInjuredIntentional[prisonFederal$healthInjuredIntentional > 2] <- NA
prisonFederal$healthInjuredIntentional[prisonFederal$healthInjuredIntentional == 1] <- TRUE
prisonFederal$healthInjuredIntentional[prisonFederal$healthInjuredIntentional == 2] <- FALSE

jails$healthInjuredIntentionalExamined <- data04359_DS0001$V1926
prisonFederal$healthInjuredIntentionalExamined <- data04572_DS0001$V2304
prisonState$healthInjuredIntentionalExamined <- data04572_DS0002$V2304

jails$healthInjuredIntentionalExamined[jails$healthInjuredIntentionalExamined > 2] <- NA
jails$healthInjuredIntentionalExamined[jails$healthInjuredIntentionalExamined == 1] <- TRUE
jails$healthInjuredIntentionalExamined[jails$healthInjuredIntentionalExamined == 2] <- FALSE

prisonState$healthInjuredIntentionalExamined[prisonState$healthInjuredIntentionalExamined > 2] <- NA
prisonState$healthInjuredIntentionalExamined[prisonState$healthInjuredIntentionalExamined == 1] <- TRUE
prisonState$healthInjuredIntentionalExamined[prisonState$healthInjuredIntentionalExamined == 2] <- FALSE

prisonFederal$healthInjuredIntentionalExamined[prisonFederal$healthInjuredIntentionalExamined > 2] <- NA
prisonFederal$healthInjuredIntentionalExamined[prisonFederal$healthInjuredIntentionalExamined == 1] <- TRUE
prisonFederal$healthInjuredIntentionalExamined[prisonFederal$healthInjuredIntentionalExamined == 2] <- FALSE

#jails
# V1937       S9Q5D - HAD COLD/FLU SINCE ADMISSION 638
# V1938       S9Q5DD - SEEN MEDICAL PERSONNEL FOR ILLNESS 638
# 1 yes
# 2 no 

#prisons
# V2315 S9Q5C: ILLNESS SINCE ADMISSION
# V2316 S9Q5CC: EXAMINED BY MEDICAL PERSONNEL

jails$healthIll <- data04359_DS0001$V1937
prisonFederal$healthIll <- data04572_DS0001$V2315
prisonState$healthIll <- data04572_DS0002$V2315

jails$healthIll[jails$healthIll > 2] <- NA
jails$healthIll[jails$healthIll == 1] <- TRUE
jails$healthIll[jails$healthIll == 2] <- FALSE

prisonState$healthIll[prisonState$healthIll > 2] <- NA
prisonState$healthIll[prisonState$healthIll == 1] <- TRUE
prisonState$healthIll[prisonState$healthIll == 2] <- FALSE

prisonFederal$healthIll[prisonFederal$healthIll > 2] <- NA
prisonFederal$healthIll[prisonFederal$healthIll == 1] <- TRUE
prisonFederal$healthIll[prisonFederal$healthIll == 2] <- FALSE

jails$healthIllExamined <- data04359_DS0001$V1938
prisonFederal$healthIllExamined <- data04572_DS0001$V2316
prisonState$healthIllExamined <- data04572_DS0002$V2316

jails$healthIllExamined[jails$healthIllExamined > 2] <- NA
jails$healthIllExamined[jails$healthIllExamined == 1] <- TRUE
jails$healthIllExamined[jails$healthIllExamined == 2] <- FALSE

prisonState$healthIllExamined[prisonState$healthIllExamined > 2] <- NA
prisonState$healthIllExamined[prisonState$healthIllExamined == 1] <- TRUE
prisonState$healthIllExamined[prisonState$healthIllExamined == 2] <- FALSE

prisonFederal$healthIllExamined[prisonFederal$healthIllExamined > 2] <- NA
prisonFederal$healthIllExamined[prisonFederal$healthIllExamined == 1] <- TRUE
prisonFederal$healthIllExamined[prisonFederal$healthIllExamined == 2] <- FALSE

#jails
# V1939       S9Q5E- DENTAL PROBLEMS SINCE ADMISSION 639
# V1940       S9Q5EE - SEEN DENTIST/OTHER FOR PROBLEM 639
# 1 yes
# 2 no 

#prisons
# V2317 S9Q5D: DENTAL PROBLEMS SINCE ADMISSION
# V2318 S9Q5DD: EXAMINED BY DENTIST SINCE ADMISSION

jails$healthDental <- data04359_DS0001$V1939
prisonFederal$healthDental <- data04572_DS0001$V2317
prisonState$healthDental <- data04572_DS0002$V2317

jails$healthDental[jails$healthDental > 2] <- NA
jails$healthDental[jails$healthDental == 1] <- TRUE
jails$healthDental[jails$healthDental == 2] <- FALSE

prisonState$healthDental[prisonState$healthDental > 2] <- NA
prisonState$healthDental[prisonState$healthDental == 1] <- TRUE
prisonState$healthDental[prisonState$healthDental == 2] <- FALSE

prisonFederal$healthDental[prisonFederal$healthDental > 2] <- NA
prisonFederal$healthDental[prisonFederal$healthDental == 1] <- TRUE
prisonFederal$healthDental[prisonFederal$healthDental == 2] <- FALSE

jails$healthDentalExamined <- data04359_DS0001$V1940
prisonFederal$healthDentalExamined <- data04572_DS0001$V2318
prisonState$healthDentalExamined <- data04572_DS0002$V2318

jails$healthDentalExamined[jails$healthDentalExamined > 2] <- NA
jails$healthDentalExamined[jails$healthDentalExamined == 1] <- TRUE
jails$healthDentalExamined[jails$healthDentalExamined == 2] <- FALSE

prisonState$healthDentalExamined[prisonState$healthDentalExamined > 2] <- NA
prisonState$healthDentalExamined[prisonState$healthDentalExamined == 1] <- TRUE
prisonState$healthDentalExamined[prisonState$healthDentalExamined == 2] <- FALSE

prisonFederal$healthDentalExamined[prisonFederal$healthDentalExamined > 2] <- NA
prisonFederal$healthDentalExamined[prisonFederal$healthDentalExamined == 1] <- TRUE
prisonFederal$healthDentalExamined[prisonFederal$healthDentalExamined == 2] <- FALSE

#jails
# V1941       S9Q6B - EVER HAD CANCER 639
# V1954       S9Q6B2 - STILL HAVE CANCER 642
# V1955 S9Q6B3 - SEEN MEDICAL PERSONNEL FOR CANCER SINCE Admission
# 1 yes
# 2 no 

#prisons
# V2319 S9Q6A: EVER HAD CANCER
# V2333 S9Q6A2: STILL HAVE CANCER
# V2334 S9Q6A3: SEEN HEALTH CARE PERSONNEL SINCE ADMISSION

jails$healthCancerEver <- data04359_DS0001$V1941
prisonFederal$healthCancerEver <- data04572_DS0001$V2319
prisonState$healthCancerEver <- data04572_DS0002$V2319

jails$healthCancerEver[jails$healthCancerEver > 2] <- NA
jails$healthCancerEver[jails$healthCancerEver == 1] <- TRUE
jails$healthCancerEver[jails$healthCancerEver == 2] <- FALSE

prisonState$healthCancerEver[prisonState$healthCancerEver > 2] <- NA
prisonState$healthCancerEver[prisonState$healthCancerEver == 1] <- TRUE
prisonState$healthCancerEver[prisonState$healthCancerEver == 2] <- FALSE

prisonFederal$healthCancerEver[prisonFederal$healthCancerEver > 2] <- NA
prisonFederal$healthCancerEver[prisonFederal$healthCancerEver == 1] <- TRUE
prisonFederal$healthCancerEver[prisonFederal$healthCancerEver == 2] <- FALSE

jails$healthCancerStill <- data04359_DS0001$V1954
prisonFederal$healthCancerStill <- data04572_DS0001$V2333
prisonState$healthCancerStill <- data04572_DS0002$V2333

jails$healthCancerStill[jails$healthCancerStill > 2] <- NA
jails$healthCancerStill[jails$healthCancerStill == 1] <- TRUE
jails$healthCancerStill[jails$healthCancerStill == 2] <- FALSE

prisonState$healthCancerStill[prisonState$healthCancerStill > 2] <- NA
prisonState$healthCancerStill[prisonState$healthCancerStill == 1] <- TRUE
prisonState$healthCancerStill[prisonState$healthCancerStill == 2] <- FALSE

prisonFederal$healthCancerStill[prisonFederal$healthCancerStill > 2] <- NA
prisonFederal$healthCancerStill[prisonFederal$healthCancerStill == 1] <- TRUE
prisonFederal$healthCancerStill[prisonFederal$healthCancerStill == 2] <- FALSE

jails$healthCancerExamined <- data04359_DS0001$V1955
prisonFederal$healthCancerExamined <- data04572_DS0001$V2334
prisonState$healthCancerExamined <- data04572_DS0002$V2334

jails$healthCancerExamined[jails$healthCancerExamined > 2] <- NA
jails$healthCancerExamined[jails$healthCancerExamined == 1] <- TRUE
jails$healthCancerExamined[jails$healthCancerExamined == 2] <- FALSE

prisonState$healthCancerExamined[prisonState$healthCancerExamined > 2] <- NA
prisonState$healthCancerExamined[prisonState$healthCancerExamined == 1] <- TRUE
prisonState$healthCancerExamined[prisonState$healthCancerExamined == 2] <- FALSE

prisonFederal$healthCancerExamined[prisonFederal$healthCancerExamined > 2] <- NA
prisonFederal$healthCancerExamined[prisonFederal$healthCancerExamined == 1] <- TRUE
prisonFederal$healthCancerExamined[prisonFederal$healthCancerExamined == 2] <- FALSE

#jails
# V1956       S9Q6E - EVER SUFFERED PARALYSIS 643
# V1957       S9Q6E1 - STILL SUFFER ANY PARALYSIS 643
# V1958 S9Q6E2 - SEEN MEDICAL PERSONNEL FOR PARALYSIS SINCE ADMISSION

#prisons
# V2335 S9Q6B: EVER EXPERIENCED PARALYSIS
# V2336 S9Q6B1: STILL EXPERIENCING ANY PARALYSIS
# V2337 S9Q6B2: SEEN HEALTH CARE PERSONNEL SINCE ADMISSION

jails$healthParalysisEver <- data04359_DS0001$V1956
prisonFederal$healthParalysisEver <- data04572_DS0001$V2335
prisonState$healthParalysisEver <- data04572_DS0002$V2335

jails$healthParalysisEver[jails$healthParalysisEver > 2] <- NA
jails$healthParalysisEver[jails$healthParalysisEver == 1] <- TRUE
jails$healthParalysisEver[jails$healthParalysisEver == 2] <- FALSE

prisonState$healthParalysisEver[prisonState$healthParalysisEver > 2] <- NA
prisonState$healthParalysisEver[prisonState$healthParalysisEver == 1] <- TRUE
prisonState$healthParalysisEver[prisonState$healthParalysisEver == 2] <- FALSE

prisonFederal$healthParalysisEver[prisonFederal$healthParalysisEver > 2] <- NA
prisonFederal$healthParalysisEver[prisonFederal$healthParalysisEver == 1] <- TRUE
prisonFederal$healthParalysisEver[prisonFederal$healthParalysisEver == 2] <- FALSE

jails$healthParalysisStill <- data04359_DS0001$V1957
prisonFederal$healthParalysisStill <- data04572_DS0001$V2336
prisonState$healthParalysisStill <- data04572_DS0002$V2336

jails$healthParalysisStill[jails$healthParalysisStill > 2] <- NA
jails$healthParalysisStill[jails$healthParalysisStill == 1] <- TRUE
jails$healthParalysisStill[jails$healthParalysisStill == 2] <- FALSE

prisonState$healthParalysisStill[prisonState$healthParalysisStill > 2] <- NA
prisonState$healthParalysisStill[prisonState$healthParalysisStill == 1] <- TRUE
prisonState$healthParalysisStill[prisonState$healthParalysisStill == 2] <- FALSE

prisonFederal$healthParalysisStill[prisonFederal$healthParalysisStill > 2] <- NA
prisonFederal$healthParalysisStill[prisonFederal$healthParalysisStill == 1] <- TRUE
prisonFederal$healthParalysisStill[prisonFederal$healthParalysisStill == 2] <- FALSE

jails$healthParalysisExamined <- data04359_DS0001$V1958
prisonFederal$healthParalysisExamined <- data04572_DS0001$V2337
prisonState$healthParalysisExamined <- data04572_DS0002$V2337

jails$healthParalysisExamined[jails$healthParalysisExamined > 2] <- NA
jails$healthParalysisExamined[jails$healthParalysisExamined == 1] <- TRUE
jails$healthParalysisExamined[jails$healthParalysisExamined == 2] <- FALSE

prisonState$healthParalysisExamined[prisonState$healthParalysisExamined > 2] <- NA
prisonState$healthParalysisExamined[prisonState$healthParalysisExamined == 1] <- TRUE
prisonState$healthParalysisExamined[prisonState$healthParalysisExamined == 2] <- FALSE

prisonFederal$healthParalysisExamined[prisonFederal$healthParalysisExamined > 2] <- NA
prisonFederal$healthParalysisExamined[prisonFederal$healthParalysisExamined == 1] <- TRUE
prisonFederal$healthParalysisExamined[prisonFederal$healthParalysisExamined == 2] <- FALSE

#jails
# V1959       S9Q6F - EVER HAD HIGH BLOOD PRESSURE 644
# V1960       S9Q6F1 - STILL HAVE HIGH BLOOD PRESSURE 644
# V1961 S9Q6F2 - SEEN MEDICAL PERSONNEL FOR HIGH BLOOD PRESSURE
# 1 yes
# 2 no 

#prisons
# V2338 S9Q6C: EVER HAD HYPERTENSION
# V2339 S9Q6C1: STILL HAVE HIGH BLOOD PRESSURE
# V2340 S9Q6C2: SEEN HEALTH CARE PERSONNEL FOR THIS SINCE

jails$healthHypertensionEver <- data04359_DS0001$V1959
prisonFederal$healthHypertensionEver <- data04572_DS0001$V2338
prisonState$healthHypertensionEver <- data04572_DS0002$V2338

jails$healthHypertensionEver[jails$healthHypertensionEver > 2] <- NA
jails$healthHypertensionEver[jails$healthHypertensionEver == 1] <- TRUE
jails$healthHypertensionEver[jails$healthHypertensionEver == 2] <- FALSE

prisonState$healthHypertensionEver[prisonState$healthHypertensionEver > 2] <- NA
prisonState$healthHypertensionEver[prisonState$healthHypertensionEver == 1] <- TRUE
prisonState$healthHypertensionEver[prisonState$healthHypertensionEver == 2] <- FALSE

prisonFederal$healthHypertensionEver[prisonFederal$healthHypertensionEver > 2] <- NA
prisonFederal$healthHypertensionEver[prisonFederal$healthHypertensionEver == 1] <- TRUE
prisonFederal$healthHypertensionEver[prisonFederal$healthHypertensionEver == 2] <- FALSE

jails$healthHypertensionStill <- data04359_DS0001$V1960
prisonFederal$healthHypertensionStill <- data04572_DS0001$V2339
prisonState$healthHypertensionStill <- data04572_DS0002$V2339

jails$healthHypertensionStill[jails$healthHypertensionStill > 2] <- NA
jails$healthHypertensionStill[jails$healthHypertensionStill == 1] <- TRUE
jails$healthHypertensionStill[jails$healthHypertensionStill == 2] <- FALSE

prisonState$healthHypertensionStill[prisonState$healthHypertensionStill > 2] <- NA
prisonState$healthHypertensionStill[prisonState$healthHypertensionStill == 1] <- TRUE
prisonState$healthHypertensionStill[prisonState$healthHypertensionStill == 2] <- FALSE

prisonFederal$healthHypertensionStill[prisonFederal$healthHypertensionStill > 2] <- NA
prisonFederal$healthHypertensionStill[prisonFederal$healthHypertensionStill == 1] <- TRUE
prisonFederal$healthHypertensionStill[prisonFederal$healthHypertensionStill == 2] <- FALSE

jails$healthHypertensionExamined <- data04359_DS0001$V1961
prisonFederal$healthHypertensionExamined <- data04572_DS0001$V2340
prisonState$healthHypertensionExamined <- data04572_DS0002$V2340

jails$healthHypertensionExamined[jails$healthHypertensionExamined > 2] <- NA
jails$healthHypertensionExamined[jails$healthHypertensionExamined == 1] <- TRUE
jails$healthHypertensionExamined[jails$healthHypertensionExamined == 2] <- FALSE

prisonState$healthHypertensionExamined[prisonState$healthHypertensionExamined > 2] <- NA
prisonState$healthHypertensionExamined[prisonState$healthHypertensionExamined == 1] <- TRUE
prisonState$healthHypertensionExamined[prisonState$healthHypertensionExamined == 2] <- FALSE

prisonFederal$healthHypertensionExamined[prisonFederal$healthHypertensionExamined > 2] <- NA
prisonFederal$healthHypertensionExamined[prisonFederal$healthHypertensionExamined == 1] <- TRUE
prisonFederal$healthHypertensionExamined[prisonFederal$healthHypertensionExamined == 2] <- FALSE

#jails
# V1962       S9Q6F3 - EVER HAD STROKE/BRAIN INJURY 644 
# V1963 S9Q6F31 - STILL SUFFER FROM STROKE/BRAIN INJURY 645 PROBLEMS
# V1964 S9Q6F32 - SEEN MEDICAL PERSONNEL FOR STROKE/BRAIN
# 1 yes
# 2 no 

# prisons
# V2341 S9Q6D: EVER HAD A STROKE OR BRAIN INJURY
# V2342 S9Q6D1: STILL HAVE PROBLEMS BECAUSE OF STROKE OR BRAIN INJURY?
# V2343 S9Q6D2: SEEN HEALTH CARE PERSONNEL FOR THIS SINCE YOUR ADMISSION?

jails$healthBrainInjuryEver <- data04359_DS0001$V1962
prisonFederal$healthBrainInjuryEver <- data04572_DS0001$V2341
prisonState$healthBrainInjuryEver <- data04572_DS0002$V2341

jails$healthBrainInjuryEver[jails$healthBrainInjuryEver > 2] <- NA
jails$healthBrainInjuryEver[jails$healthBrainInjuryEver == 1] <- TRUE
jails$healthBrainInjuryEver[jails$healthBrainInjuryEver == 2] <- FALSE

prisonState$healthBrainInjuryEver[prisonState$healthBrainInjuryEver > 2] <- NA
prisonState$healthBrainInjuryEver[prisonState$healthBrainInjuryEver == 1] <- TRUE
prisonState$healthBrainInjuryEver[prisonState$healthBrainInjuryEver == 2] <- FALSE

prisonFederal$healthBrainInjuryEver[prisonFederal$healthBrainInjuryEver > 2] <- NA
prisonFederal$healthBrainInjuryEver[prisonFederal$healthBrainInjuryEver == 1] <- TRUE
prisonFederal$healthBrainInjuryEver[prisonFederal$healthBrainInjuryEver == 2] <- FALSE

jails$healthBrainInjuryStill <- data04359_DS0001$V1963
prisonFederal$healthBrainInjuryStill <- data04572_DS0001$V2342
prisonState$healthBrainInjuryStill <- data04572_DS0002$V2342

jails$healthBrainInjuryStill[jails$healthBrainInjuryStill > 2] <- NA
jails$healthBrainInjuryStill[jails$healthBrainInjuryStill == 1] <- TRUE
jails$healthBrainInjuryStill[jails$healthBrainInjuryStill == 2] <- FALSE

prisonState$healthBrainInjuryStill[prisonState$healthBrainInjuryStill > 2] <- NA
prisonState$healthBrainInjuryStill[prisonState$healthBrainInjuryStill == 1] <- TRUE
prisonState$healthBrainInjuryStill[prisonState$healthBrainInjuryStill == 2] <- FALSE

prisonFederal$healthBrainInjuryStill[prisonFederal$healthBrainInjuryStill > 2] <- NA
prisonFederal$healthBrainInjuryStill[prisonFederal$healthBrainInjuryStill == 1] <- TRUE
prisonFederal$healthBrainInjuryStill[prisonFederal$healthBrainInjuryStill == 2] <- FALSE

jails$healthBrainInjuryExamined <- data04359_DS0001$V1964
prisonFederal$healthBrainInjuryExamined <- data04572_DS0001$V2343
prisonState$healthBrainInjuryExamined <- data04572_DS0002$V2343

jails$healthBrainInjuryExamined[jails$healthBrainInjuryExamined > 2] <- NA
jails$healthBrainInjuryExamined[jails$healthBrainInjuryExamined == 1] <- TRUE
jails$healthBrainInjuryExamined[jails$healthBrainInjuryExamined == 2] <- FALSE

prisonState$healthBrainInjuryExamined[prisonState$healthBrainInjuryExamined > 2] <- NA
prisonState$healthBrainInjuryExamined[prisonState$healthBrainInjuryExamined == 1] <- TRUE
prisonState$healthBrainInjuryExamined[prisonState$healthBrainInjuryExamined == 2] <- FALSE

prisonFederal$healthBrainInjuryExamined[prisonFederal$healthBrainInjuryExamined > 2] <- NA
prisonFederal$healthBrainInjuryExamined[prisonFederal$healthBrainInjuryExamined == 1] <- TRUE
prisonFederal$healthBrainInjuryExamined[prisonFederal$healthBrainInjuryExamined == 2] <- FALSE

#jails
# V1965       S9Q6F4 - EVER HAD DIABETES 645
# V1966       S9Q6F41 - STILL HAVE DIABETES 646
# V1967 S9Q6F42 - SEEN MEDICAL PERSONNEL FOR DIABETES 

#prisons
# V2344 S9Q6E: EVER HAD DIABETES
# V2345 S9Q6E1: STILL HAVE A PROBLEM WITH DIABETES OR HIGH BLOOD SUGAR?
# V2346 S9Q6E2: SEEN HEALTH CARE PERSONNEL FOR THIS SINCE YOUR ADMISSION?

jails$healthDiabetesEver <- data04359_DS0001$V1965
prisonFederal$healthDiabetesEver <- data04572_DS0001$V2344
prisonState$healthDiabetesEver <- data04572_DS0002$V2344

jails$healthDiabetesEver[jails$healthDiabetesEver > 2] <- NA
jails$healthDiabetesEver[jails$healthDiabetesEver == 1] <- TRUE
jails$healthDiabetesEver[jails$healthDiabetesEver == 2] <- FALSE

prisonState$healthDiabetesEver[prisonState$healthDiabetesEver > 2] <- NA
prisonState$healthDiabetesEver[prisonState$healthDiabetesEver == 1] <- TRUE
prisonState$healthDiabetesEver[prisonState$healthDiabetesEver == 2] <- FALSE

prisonFederal$healthDiabetesEver[prisonFederal$healthDiabetesEver > 2] <- NA
prisonFederal$healthDiabetesEver[prisonFederal$healthDiabetesEver == 1] <- TRUE
prisonFederal$healthDiabetesEver[prisonFederal$healthDiabetesEver == 2] <- FALSE

jails$healthDiabetesStill <- data04359_DS0001$V1966
prisonFederal$healthDiabetesStill <- data04572_DS0001$V2345
prisonState$healthDiabetesStill <- data04572_DS0002$V2345

jails$healthDiabetesStill[jails$healthDiabetesStill > 2] <- NA
jails$healthDiabetesStill[jails$healthDiabetesStill == 1] <- TRUE
jails$healthDiabetesStill[jails$healthDiabetesStill == 2] <- FALSE

prisonState$healthDiabetesStill[prisonState$healthDiabetesStill > 2] <- NA
prisonState$healthDiabetesStill[prisonState$healthDiabetesStill == 1] <- TRUE
prisonState$healthDiabetesStill[prisonState$healthDiabetesStill == 2] <- FALSE

prisonFederal$healthDiabetesStill[prisonFederal$healthDiabetesStill > 2] <- NA
prisonFederal$healthDiabetesStill[prisonFederal$healthDiabetesStill == 1] <- TRUE
prisonFederal$healthDiabetesStill[prisonFederal$healthDiabetesStill == 2] <- FALSE

jails$healthDiabetesExamined <- data04359_DS0001$V1967
prisonFederal$healthDiabetesExamined <- data04572_DS0001$V2346
prisonState$healthDiabetesExamined <- data04572_DS0002$V2346

jails$healthDiabetesExamined[jails$healthDiabetesExamined > 2] <- NA
jails$healthDiabetesExamined[jails$healthDiabetesExamined == 1] <- TRUE
jails$healthDiabetesExamined[jails$healthDiabetesExamined == 2] <- FALSE

prisonState$healthDiabetesExamined[prisonState$healthDiabetesExamined > 2] <- NA
prisonState$healthDiabetesExamined[prisonState$healthDiabetesExamined == 1] <- TRUE
prisonState$healthDiabetesExamined[prisonState$healthDiabetesExamined == 2] <- FALSE

prisonFederal$healthDiabetesExamined[prisonFederal$healthDiabetesExamined > 2] <- NA
prisonFederal$healthDiabetesExamined[prisonFederal$healthDiabetesExamined == 1] <- TRUE
prisonFederal$healthDiabetesExamined[prisonFederal$healthDiabetesExamined == 2] <- FALSE

#jails
# V1968       S9Q6G - EVER HAD HEART PROBLEMS 646
# V1979       S9Q6G2 - STILL HAVE HEART PROBLEMS 649
# V1980 S9Q6G3 - SEEN MEDICAL PERSONNEL FOR THIS PROBLEM (heart)
# 1 yes
# 2 no 

#prisons
# V2347 S9Q6F: EVER HAD HEART PROBLEMS
# V2358 S9Q6F2: STILL HAVE HEART PROBLEMS
# V2359 S9Q6F3: SEEN HEALTH CARE PERSONNEL FOR THIS SINCE admission

jails$healthHeartEver <- data04359_DS0001$V1968
prisonFederal$healthHeartEver <- data04572_DS0001$V2347
prisonState$healthHeartEver <- data04572_DS0002$V2347

jails$healthHeartEver[jails$healthHeartEver > 2] <- NA
jails$healthHeartEver[jails$healthHeartEver == 1] <- TRUE
jails$healthHeartEver[jails$healthHeartEver == 2] <- FALSE

prisonState$healthHeartEver[prisonState$healthHeartEver > 2] <- NA
prisonState$healthHeartEver[prisonState$healthHeartEver == 1] <- TRUE
prisonState$healthHeartEver[prisonState$healthHeartEver == 2] <- FALSE

prisonFederal$healthHeartEver[prisonFederal$healthHeartEver > 2] <- NA
prisonFederal$healthHeartEver[prisonFederal$healthHeartEver == 1] <- TRUE
prisonFederal$healthHeartEver[prisonFederal$healthHeartEver == 2] <- FALSE

jails$healthHeartStill <- data04359_DS0001$V1979
prisonFederal$healthHeartStill <- data04572_DS0001$V2358
prisonState$healthHeartStill <- data04572_DS0002$V2358

jails$healthHeartStill[jails$healthHeartStill > 2] <- NA
jails$healthHeartStill[jails$healthHeartStill == 1] <- TRUE
jails$healthHeartStill[jails$healthHeartStill == 2] <- FALSE

prisonState$healthHeartStill[prisonState$healthHeartStill > 2] <- NA
prisonState$healthHeartStill[prisonState$healthHeartStill == 1] <- TRUE
prisonState$healthHeartStill[prisonState$healthHeartStill == 2] <- FALSE

prisonFederal$healthHeartStill[prisonFederal$healthHeartStill > 2] <- NA
prisonFederal$healthHeartStill[prisonFederal$healthHeartStill == 1] <- TRUE
prisonFederal$healthHeartStill[prisonFederal$healthHeartStill == 2] <- FALSE

jails$healthHeartExamined <- data04359_DS0001$V1980
prisonFederal$healthHeartExamined <- data04572_DS0001$V2359
prisonState$healthHeartExamined <- data04572_DS0002$V2359

jails$healthHeartExamined[jails$healthHeartExamined > 2] <- NA
jails$healthHeartExamined[jails$healthHeartExamined == 1] <- TRUE
jails$healthHeartExamined[jails$healthHeartExamined == 2] <- FALSE

prisonState$healthHeartExamined[prisonState$healthHeartExamined > 2] <- NA
prisonState$healthHeartExamined[prisonState$healthHeartExamined == 1] <- TRUE
prisonState$healthHeartExamined[prisonState$healthHeartExamined == 2] <- FALSE

prisonFederal$healthHeartExamined[prisonFederal$healthHeartExamined > 2] <- NA
prisonFederal$healthHeartExamined[prisonFederal$healthHeartExamined == 1] <- TRUE
prisonFederal$healthHeartExamined[prisonFederal$healthHeartExamined == 2] <- FALSE

#jails
# V1981       S9Q6I - EVER HAD KIDNEY PROBLEMS 649
# V1982       S9Q6I1- STILL HVE KIDNEY PROBLEMS 650
# V1983 S9Q6I2 - SEEN MEDICAL PERSONNEL SINCE ADMISSION
# 1 yes
# 2 no 

#prisons
# V2360 S9Q6G: EVER HAD KIDNEY PROBLEMS
# V2361 S9Q6G1: STILL HAVE KIDNEY PROBLEMS
# V2362 S9Q6G2: SEEN HEALTH CARE PERSONNEL FOR THIS SINCE YOUR ADMISSION?

jails$healthKidneyEver <- data04359_DS0001$V1981
prisonFederal$healthKidneyEver <- data04572_DS0001$V2360
prisonState$healthKidneyEver <- data04572_DS0002$V2360

jails$healthKidneyEver[jails$healthKidneyEver > 2] <- NA
jails$healthKidneyEver[jails$healthKidneyEver == 1] <- TRUE
jails$healthKidneyEver[jails$healthKidneyEver == 2] <- FALSE

prisonState$healthKidneyEver[prisonState$healthKidneyEver > 2] <- NA
prisonState$healthKidneyEver[prisonState$healthKidneyEver == 1] <- TRUE
prisonState$healthKidneyEver[prisonState$healthKidneyEver == 2] <- FALSE

prisonFederal$healthKidneyEver[prisonFederal$healthKidneyEver > 2] <- NA
prisonFederal$healthKidneyEver[prisonFederal$healthKidneyEver == 1] <- TRUE
prisonFederal$healthKidneyEver[prisonFederal$healthKidneyEver == 2] <- FALSE

jails$healthKidneyStill <- data04359_DS0001$V1982
prisonFederal$healthKidneyStill <- data04572_DS0001$V2361
prisonState$healthKidneyStill <- data04572_DS0002$V2361

jails$healthKidneyStill[jails$healthKidneyStill > 2] <- NA
jails$healthKidneyStill[jails$healthKidneyStill == 1] <- TRUE
jails$healthKidneyStill[jails$healthKidneyStill == 2] <- FALSE

prisonState$healthKidneyStill[prisonState$healthKidneyStill > 2] <- NA
prisonState$healthKidneyStill[prisonState$healthKidneyStill == 1] <- TRUE
prisonState$healthKidneyStill[prisonState$healthKidneyStill == 2] <- FALSE

prisonFederal$healthKidneyStill[prisonFederal$healthKidneyStill > 2] <- NA
prisonFederal$healthKidneyStill[prisonFederal$healthKidneyStill == 1] <- TRUE
prisonFederal$healthKidneyStill[prisonFederal$healthKidneyStill == 2] <- FALSE

jails$healthKidneyExamined <- data04359_DS0001$V1983
prisonFederal$healthKidneyExamined <- data04572_DS0001$V2362
prisonState$healthKidneyExamined <- data04572_DS0002$V2362

jails$healthKidneyExamined[jails$healthKidneyExamined > 2] <- NA
jails$healthKidneyExamined[jails$healthKidneyExamined == 1] <- TRUE
jails$healthKidneyExamined[jails$healthKidneyExamined == 2] <- FALSE

prisonState$healthKidneyExamined[prisonState$healthKidneyExamined > 2] <- NA
prisonState$healthKidneyExamined[prisonState$healthKidneyExamined == 1] <- TRUE
prisonState$healthKidneyExamined[prisonState$healthKidneyExamined == 2] <- FALSE

prisonFederal$healthKidneyExamined[prisonFederal$healthKidneyExamined > 2] <- NA
prisonFederal$healthKidneyExamined[prisonFederal$healthKidneyExamined == 1] <- TRUE
prisonFederal$healthKidneyExamined[prisonFederal$healthKidneyExamined == 2] <- FALSE

#jails
# V1984       S9Q6J - EVER HAD ARTHRITIS/RHEUMATISM 650
# V1985       S9Q6J1 - STILL HAVE ARTHRITIS/RHEUMATISM 650
# V1986   S9Q6J2 - SEEN MEDICAL PERSONNE
# 1 yes
# 2 no 

#prisons
# V2363 S9Q6H: EVER HAD ARTHRITIS OR RHEUMATISM
# V2364 S9Q6H1: STILL HAVE ARTHRITIS OR RHEUMATISM
# V2365 S9Q6H2: SEEN HEALTH CARE PERSONNEL FOR THIS SINCE YOUR ADMISSION?

jails$healthArthritisRheumatismEver <- data04359_DS0001$V1984
prisonFederal$healthArthritisRheumatismEver <- data04572_DS0001$V2363
prisonState$healthArthritisRheumatismEver <- data04572_DS0002$V2363

jails$healthArthritisRheumatismEver[jails$healthArthritisRheumatismEver > 2] <- NA
jails$healthArthritisRheumatismEver[jails$healthArthritisRheumatismEver == 1] <- TRUE
jails$healthArthritisRheumatismEver[jails$healthArthritisRheumatismEver == 2] <- FALSE

prisonState$healthArthritisRheumatismEver[prisonState$healthArthritisRheumatismEver > 2] <- NA
prisonState$healthArthritisRheumatismEver[prisonState$healthArthritisRheumatismEver == 1] <- TRUE
prisonState$healthArthritisRheumatismEver[prisonState$healthArthritisRheumatismEver == 2] <- FALSE

prisonFederal$healthArthritisRheumatismEver[prisonFederal$healthArthritisRheumatismEver > 2] <- NA
prisonFederal$healthArthritisRheumatismEver[prisonFederal$healthArthritisRheumatismEver == 1] <- TRUE
prisonFederal$healthArthritisRheumatismEver[prisonFederal$healthArthritisRheumatismEver == 2] <- FALSE

jails$healthArthritisRheumatismStill <- data04359_DS0001$V1985
prisonFederal$healthArthritisRheumatismStill <- data04572_DS0001$V2364
prisonState$healthArthritisRheumatismStill <- data04572_DS0002$V2364

jails$healthArthritisRheumatismStill[jails$healthArthritisRheumatismStill > 2] <- NA
jails$healthArthritisRheumatismStill[jails$healthArthritisRheumatismStill == 1] <- TRUE
jails$healthArthritisRheumatismStill[jails$healthArthritisRheumatismStill == 2] <- FALSE

prisonState$healthArthritisRheumatismStill[prisonState$healthArthritisRheumatismStill > 2] <- NA
prisonState$healthArthritisRheumatismStill[prisonState$healthArthritisRheumatismStill == 1] <- TRUE
prisonState$healthArthritisRheumatismStill[prisonState$healthArthritisRheumatismStill == 2] <- FALSE

prisonFederal$healthArthritisRheumatismStill[prisonFederal$healthArthritisRheumatismStill > 2] <- NA
prisonFederal$healthArthritisRheumatismStill[prisonFederal$healthArthritisRheumatismStill == 1] <- TRUE
prisonFederal$healthArthritisRheumatismStill[prisonFederal$healthArthritisRheumatismStill == 2] <- FALSE

jails$healthArthritisRheumatismExamined <- data04359_DS0001$V1986
prisonFederal$healthArthritisRheumatismExamined <- data04572_DS0001$V2365
prisonState$healthArthritisRheumatismExamined <- data04572_DS0002$V2365

jails$healthArthritisRheumatismExamined[jails$healthArthritisRheumatismExamined > 2] <- NA
jails$healthArthritisRheumatismExamined[jails$healthArthritisRheumatismExamined == 1] <- TRUE
jails$healthArthritisRheumatismExamined[jails$healthArthritisRheumatismExamined == 2] <- FALSE

prisonState$healthArthritisRheumatismExamined[prisonState$healthArthritisRheumatismExamined > 2] <- NA
prisonState$healthArthritisRheumatismExamined[prisonState$healthArthritisRheumatismExamined == 1] <- TRUE
prisonState$healthArthritisRheumatismExamined[prisonState$healthArthritisRheumatismExamined == 2] <- FALSE

prisonFederal$healthArthritisRheumatismExamined[prisonFederal$healthArthritisRheumatismExamined > 2] <- NA
prisonFederal$healthArthritisRheumatismExamined[prisonFederal$healthArthritisRheumatismExamined == 1] <- TRUE
prisonFederal$healthArthritisRheumatismExamined[prisonFederal$healthArthritisRheumatismExamined == 2] <- FALSE

#jails
# V1987       S9Q6K- EVER HAD ASTHMA 651
# V1988       S9Q6K1 - STILL HAVE ASTHMA 651
# V1989 S9Q6K2- SEEN MEDICAL PERSONNEL FOR ASTHMA
# 1 yes
# 2 no 

#prisons
# V2366 S9Q6I: EVER HAD ASTHMA
# V2367 S9Q6I1: STILL HAVE ASTHMA
# V2368 S9Q6I2: SEEN HEALTH CARE PERSONNEL FOR THIS SINCE YOUR ADMISSION?

jails$healthAsthmaEver <- data04359_DS0001$V1987
prisonFederal$healthAsthmaEver <- data04572_DS0001$V2366
prisonState$healthAsthmaEver <- data04572_DS0002$V2366

jails$healthAsthmaEver[jails$healthAsthmaEver > 2] <- NA
jails$healthAsthmaEver[jails$healthAsthmaEver == 1] <- TRUE
jails$healthAsthmaEver[jails$healthAsthmaEver == 2] <- FALSE

prisonState$healthAsthmaEver[prisonState$healthAsthmaEver > 2] <- NA
prisonState$healthAsthmaEver[prisonState$healthAsthmaEver == 1] <- TRUE
prisonState$healthAsthmaEver[prisonState$healthAsthmaEver == 2] <- FALSE

prisonFederal$healthAsthmaEver[prisonFederal$healthAsthmaEver > 2] <- NA
prisonFederal$healthAsthmaEver[prisonFederal$healthAsthmaEver == 1] <- TRUE
prisonFederal$healthAsthmaEver[prisonFederal$healthAsthmaEver == 2] <- FALSE

jails$healthAsthmaStill <- data04359_DS0001$V1988
prisonFederal$healthAsthmaStill <- data04572_DS0001$V2367
prisonState$healthAsthmaStill <- data04572_DS0002$V2367

jails$healthAsthmaStill[jails$healthAsthmaStill > 2] <- NA
jails$healthAsthmaStill[jails$healthAsthmaStill == 1] <- TRUE
jails$healthAsthmaStill[jails$healthAsthmaStill == 2] <- FALSE

prisonState$healthAsthmaStill[prisonState$healthAsthmaStill > 2] <- NA
prisonState$healthAsthmaStill[prisonState$healthAsthmaStill == 1] <- TRUE
prisonState$healthAsthmaStill[prisonState$healthAsthmaStill == 2] <- FALSE

prisonFederal$healthAsthmaStill[prisonFederal$healthAsthmaStill > 2] <- NA
prisonFederal$healthAsthmaStill[prisonFederal$healthAsthmaStill == 1] <- TRUE
prisonFederal$healthAsthmaStill[prisonFederal$healthAsthmaStill == 2] <- FALSE

jails$healthAsthmaExamined <- data04359_DS0001$V1989
prisonFederal$healthAsthmaExamined <- data04572_DS0001$V2368
prisonState$healthAsthmaExamined <- data04572_DS0002$V2368

jails$healthAsthmaExamined[jails$healthAsthmaExamined > 2] <- NA
jails$healthAsthmaExamined[jails$healthAsthmaExamined == 1] <- TRUE
jails$healthAsthmaExamined[jails$healthAsthmaExamined == 2] <- FALSE

prisonState$healthAsthmaExamined[prisonState$healthAsthmaExamined > 2] <- NA
prisonState$healthAsthmaExamined[prisonState$healthAsthmaExamined == 1] <- TRUE
prisonState$healthAsthmaExamined[prisonState$healthAsthmaExamined == 2] <- FALSE

prisonFederal$healthAsthmaExamined[prisonFederal$healthAsthmaExamined > 2] <- NA
prisonFederal$healthAsthmaExamined[prisonFederal$healthAsthmaExamined == 1] <- TRUE
prisonFederal$healthAsthmaExamined[prisonFederal$healthAsthmaExamined == 2] <- FALSE

#jails
# V1990       S9Q6L - EVER HAD CIRRHOSIS OF LIVER 652
# V1991       S9Q6L1- STILL HAVE CIRRHOSIS OF LIVER 652
# V1992 S9Q6L2- SEEN MEDICAL PERSONNEL FOR CIRRHOSIS
# 1 yes
# 2 no 

#prisons
# V2369 S9Q6J: EVER BEEN TOLD HAVE CIRRHOSIS
# V2370 S9Q6J1: STILL HAVE PROBLEMS WITH CIRRHOSIS
# V2371 S9Q6J2: SEEN HEALTH CARE PERSONNEL FOR THIS SINCE YOUR ADMISSION

jails$healthCirrhosisEver <- data04359_DS0001$V1990
prisonFederal$healthCirrhosisEver <- data04572_DS0001$V2369
prisonState$healthCirrhosisEver <- data04572_DS0002$V2369

jails$healthCirrhosisEver[jails$healthCirrhosisEver > 2] <- NA
jails$healthCirrhosisEver[jails$healthCirrhosisEver == 1] <- TRUE
jails$healthCirrhosisEver[jails$healthCirrhosisEver == 2] <- FALSE

prisonState$healthCirrhosisEver[prisonState$healthCirrhosisEver > 2] <- NA
prisonState$healthCirrhosisEver[prisonState$healthCirrhosisEver == 1] <- TRUE
prisonState$healthCirrhosisEver[prisonState$healthCirrhosisEver == 2] <- FALSE

prisonFederal$healthCirrhosisEver[prisonFederal$healthCirrhosisEver > 2] <- NA
prisonFederal$healthCirrhosisEver[prisonFederal$healthCirrhosisEver == 1] <- TRUE
prisonFederal$healthCirrhosisEver[prisonFederal$healthCirrhosisEver == 2] <- FALSE

jails$healthCirrhosisStill <- data04359_DS0001$V1991
prisonFederal$healthCirrhosisStill <- data04572_DS0001$V2370
prisonState$healthCirrhosisStill <- data04572_DS0002$V2370

jails$healthCirrhosisStill[jails$healthCirrhosisStill > 2] <- NA
jails$healthCirrhosisStill[jails$healthCirrhosisStill == 1] <- TRUE
jails$healthCirrhosisStill[jails$healthCirrhosisStill == 2] <- FALSE

prisonState$healthCirrhosisStill[prisonState$healthCirrhosisStill > 2] <- NA
prisonState$healthCirrhosisStill[prisonState$healthCirrhosisStill == 1] <- TRUE
prisonState$healthCirrhosisStill[prisonState$healthCirrhosisStill == 2] <- FALSE

prisonFederal$healthCirrhosisStill[prisonFederal$healthCirrhosisStill > 2] <- NA
prisonFederal$healthCirrhosisStill[prisonFederal$healthCirrhosisStill == 1] <- TRUE
prisonFederal$healthCirrhosisStill[prisonFederal$healthCirrhosisStill == 2] <- FALSE

jails$healthCirrhosisExamined <- data04359_DS0001$V1992
prisonFederal$healthCirrhosisExamined <- data04572_DS0001$V2371
prisonState$healthCirrhosisExamined <- data04572_DS0002$V2371

jails$healthCirrhosisExamined[jails$healthCirrhosisExamined > 2] <- NA
jails$healthCirrhosisExamined[jails$healthCirrhosisExamined == 1] <- TRUE
jails$healthCirrhosisExamined[jails$healthCirrhosisExamined == 2] <- FALSE

prisonState$healthCirrhosisExamined[prisonState$healthCirrhosisExamined > 2] <- NA
prisonState$healthCirrhosisExamined[prisonState$healthCirrhosisExamined == 1] <- TRUE
prisonState$healthCirrhosisExamined[prisonState$healthCirrhosisExamined == 2] <- FALSE

prisonFederal$healthCirrhosisExamined[prisonFederal$healthCirrhosisExamined > 2] <- NA
prisonFederal$healthCirrhosisExamined[prisonFederal$healthCirrhosisExamined == 1] <- TRUE
prisonFederal$healthCirrhosisExamined[prisonFederal$healthCirrhosisExamined == 2] <- FALSE

#jails
# V1993       S9Q6M - EVER HAD HEPATITIS 653
# V1994       S9Q6M1 - STILL HAVE HEPATITIS 653
# V1995 S9Q6M2 - SEEN MEDICAL PERSONNEL FOR HEPATITI
# 1 yes
# 2 no 

#prisons
# V2372 S9Q6K: EVER BEEN TOLD HAVE HEPATITIS
# V2373 S9Q6K1: STILL HAVE PROBLEMS WITH HEPATITIS?
# V2374 S9Q6K2: SEEN HEALTH CARE PERSONNEL FOR THIS SINCE YOUR ADMISSION

jails$healthHepatitisEver <- data04359_DS0001$V1993
prisonFederal$healthHepatitisEver <- data04572_DS0001$V2372
prisonState$healthHepatitisEver <- data04572_DS0002$V2372

jails$healthHepatitisEver[jails$healthHepatitisEver > 2] <- NA
jails$healthHepatitisEver[jails$healthHepatitisEver == 1] <- TRUE
jails$healthHepatitisEver[jails$healthHepatitisEver == 2] <- FALSE

prisonState$healthHepatitisEver[prisonState$healthHepatitisEver > 2] <- NA
prisonState$healthHepatitisEver[prisonState$healthHepatitisEver == 1] <- TRUE
prisonState$healthHepatitisEver[prisonState$healthHepatitisEver == 2] <- FALSE

prisonFederal$healthHepatitisEver[prisonFederal$healthHepatitisEver > 2] <- NA
prisonFederal$healthHepatitisEver[prisonFederal$healthHepatitisEver == 1] <- TRUE
prisonFederal$healthHepatitisEver[prisonFederal$healthHepatitisEver == 2] <- FALSE

jails$healthHepatitisStill <- data04359_DS0001$V1994
prisonFederal$healthHepatitisStill <- data04572_DS0001$V2373
prisonState$healthHepatitisStill <- data04572_DS0002$V2373

jails$healthHepatitisStill[jails$healthHepatitisStill > 2] <- NA
jails$healthHepatitisStill[jails$healthHepatitisStill == 1] <- TRUE
jails$healthHepatitisStill[jails$healthHepatitisStill == 2] <- FALSE

prisonState$healthHepatitisStill[prisonState$healthHepatitisStill > 2] <- NA
prisonState$healthHepatitisStill[prisonState$healthHepatitisStill == 1] <- TRUE
prisonState$healthHepatitisStill[prisonState$healthHepatitisStill == 2] <- FALSE

prisonFederal$healthHepatitisStill[prisonFederal$healthHepatitisStill > 2] <- NA
prisonFederal$healthHepatitisStill[prisonFederal$healthHepatitisStill == 1] <- TRUE
prisonFederal$healthHepatitisStill[prisonFederal$healthHepatitisStill == 2] <- FALSE

jails$healthHepatitisExamined <- data04359_DS0001$V1995
prisonFederal$healthHepatitisExamined <- data04572_DS0001$V2374
prisonState$healthHepatitisExamined <- data04572_DS0002$V2374

jails$healthHepatitisExamined[jails$healthHepatitisExamined > 2] <- NA
jails$healthHepatitisExamined[jails$healthHepatitisExamined == 1] <- TRUE
jails$healthHepatitisExamined[jails$healthHepatitisExamined == 2] <- FALSE

prisonState$healthHepatitisExamined[prisonState$healthHepatitisExamined > 2] <- NA
prisonState$healthHepatitisExamined[prisonState$healthHepatitisExamined == 1] <- TRUE
prisonState$healthHepatitisExamined[prisonState$healthHepatitisExamined == 2] <- FALSE

prisonFederal$healthHepatitisExamined[prisonFederal$healthHepatitisExamined > 2] <- NA
prisonFederal$healthHepatitisExamined[prisonFederal$healthHepatitisExamined == 1] <- TRUE
prisonFederal$healthHepatitisExamined[prisonFederal$healthHepatitisExamined == 2] <- FALSE

#jails
# V1996       S9Q6N - EVER HAD STD 654
# V1997       S9Q6N1 - STILL HAVE STD 654
# V1998 S9Q6N2 - SEEN MEDICAL PERSONNEL FOR STD 
# 1 yes
# 2 no 

#prisons
# V2375 S9Q6L: EVER BEEN TOLD THAT HAVE STD
# V2376 S9Q6L1: STILL HAVE PROBLEMS WITH AN STD?
# V2377 S9Q6L2: SEEN HEALTH CARE PERSONNEL FOR THIS SINCE YOUR ADMISSION

jails$healthSTDEver <- data04359_DS0001$V1996
prisonFederal$healthSTDEver <- data04572_DS0001$V2375
prisonState$healthSTDEver <- data04572_DS0002$V2375

jails$healthSTDEver[jails$healthSTDEver > 2] <- NA
jails$healthSTDEver[jails$healthSTDEver == 1] <- TRUE
jails$healthSTDEver[jails$healthSTDEver == 2] <- FALSE

prisonState$healthSTDEver[prisonState$healthSTDEver > 2] <- NA
prisonState$healthSTDEver[prisonState$healthSTDEver == 1] <- TRUE
prisonState$healthSTDEver[prisonState$healthSTDEver == 2] <- FALSE

prisonFederal$healthSTDEver[prisonFederal$healthSTDEver > 2] <- NA
prisonFederal$healthSTDEver[prisonFederal$healthSTDEver == 1] <- TRUE
prisonFederal$healthSTDEver[prisonFederal$healthSTDEver == 2] <- FALSE

jails$healthSTDStill <- data04359_DS0001$V1997
prisonFederal$healthSTDStill <- data04572_DS0001$V2376
prisonState$healthSTDStill <- data04572_DS0002$V2376

jails$healthSTDStill[jails$healthSTDStill > 2] <- NA
jails$healthSTDStill[jails$healthSTDStill == 1] <- TRUE
jails$healthSTDStill[jails$healthSTDStill == 2] <- FALSE

prisonState$healthSTDStill[prisonState$healthSTDStill > 2] <- NA
prisonState$healthSTDStill[prisonState$healthSTDStill == 1] <- TRUE
prisonState$healthSTDStill[prisonState$healthSTDStill == 2] <- FALSE

prisonFederal$healthSTDStill[prisonFederal$healthSTDStill > 2] <- NA
prisonFederal$healthSTDStill[prisonFederal$healthSTDStill == 1] <- TRUE
prisonFederal$healthSTDStill[prisonFederal$healthSTDStill == 2] <- FALSE

jails$healthSTDSExamined <- data04359_DS0001$V1998
prisonFederal$healthSTDSExamined <- data04572_DS0001$V2377
prisonState$healthSTDSExamined <- data04572_DS0002$V2377

jails$healthSTDSExamined[jails$healthSTDSExamined > 2] <- NA
jails$healthSTDSExamined[jails$healthSTDSExamined == 1] <- TRUE
jails$healthSTDSExamined[jails$healthSTDSExamined == 2] <- FALSE

prisonState$healthSTDSExamined[prisonState$healthSTDSExamined > 2] <- NA
prisonState$healthSTDSExamined[prisonState$healthSTDSExamined == 1] <- TRUE
prisonState$healthSTDSExamined[prisonState$healthSTDSExamined == 2] <- FALSE

prisonFederal$healthSTDSExamined[prisonFederal$healthSTDSExamined > 2] <- NA
prisonFederal$healthSTDSExamined[prisonFederal$healthSTDSExamined == 1] <- TRUE
prisonFederal$healthSTDSExamined[prisonFederal$healthSTDSExamined == 2] <- FALSE

#jails
# V1999     S9Q8A - HAD SURGERY SINCE AMMISISON

#prisons
# V2378 S9Q7A: SINCE ADMISSION, HAD SURGERY

jails$healthSurgery <- data04359_DS0001$V1999
prisonFederal$healthSurgery <- data04572_DS0001$V2378
prisonState$healthSurgery <- data04572_DS0002$V2378

jails$healthSurgery[jails$healthSurgery > 2] <- NA
jails$healthSurgery[jails$healthSurgery == 1] <- TRUE
jails$healthSurgery[jails$healthSurgery == 2] <- FALSE

prisonState$healthSurgery[prisonState$healthSurgery > 2] <- NA
prisonState$healthSurgery[prisonState$healthSurgery == 1] <- TRUE
prisonState$healthSurgery[prisonState$healthSurgery == 2] <- FALSE

prisonFederal$healthSurgery[prisonFederal$healthSurgery > 2] <- NA
prisonFederal$healthSurgery[prisonFederal$healthSurgery == 1] <- TRUE
prisonFederal$healthSurgery[prisonFederal$healthSurgery == 2] <- FALSE

#jails
# V2312
# 1 7 days or less
# 2 8 to 14 days
# 3 15 to 30 days
# 4 31 to 60 days
# 5 61 to 180 days
# 6 181 to 364 days
# 7 1 to 2 years
# 8 3 to 4 years
# 9 5 years or more

#prisons
# CH_SERVEDMTH TIME SERVED TO DATE OF INTERVIEW IN MONTHS

jails$timeServed <- data04359_DS0001$V2312

# 1 7 days or less
jails$timeServed[jails$timeServed == 1] <- "0 - 7"
# 2 8 to 14 days
jails$timeServed[jails$timeServed == 2] <- "8 - 14"
# 3 15 to 30 days
jails$timeServed[jails$timeServed == 3] <- "15 - 30"
# 4 31 to 60 days
jails$timeServed[jails$timeServed == 4] <- "31 - 60"
# 5 61 to 180 days
jails$timeServed[jails$timeServed == 5] <- "61 - 180"
# 6 181 to 364 days
jails$timeServed[jails$timeServed == 6] <- "181 - 364"
# 7 1 to 2 years
jails$timeServed[jails$timeServed == 7] <- "365 - 1,095"
# 8 3 to 4 years
jails$timeServed[jails$timeServed == 8] <- "1,096 - 1,825"
# 9 5 yearrs or more
jails$timeServed[jails$timeServed == 9] <- "1,826+"

prisonFederal$timeServed <- data04572_DS0003$CH_SERVEDMTH
prisonState$timeServed <- data04572_DS0004$CH_SERVEDMTH

prisonState$timeServed[prisonState$timeServed == 9999999] <- NA
prisonFederal$timeServed[prisonFederal$timeServed == 9999999] <- NA

jails$minorNum[jails$minorNum == 999] <- NA
prisonFederal$minorNum[prisonFederal$minorNum == 999] <- NA
prisonState$minorNum[prisonState$minorNum == 999] <- NA

jails$minorWith[jails$minorWith == 9] <- NA
prisonFederal$minorWith[prisonFederal$minorWith == 9] <- NA
prisonState$minorWith[prisonState$minorWith == 9] <- NA

jails$anyMentalHealth <- jails$drug == "Dependence" | jails$mentalSuicideAttempted | jails$mentalImpaired | jails$mentalDepressive | jails$mentalBipolar | jails$mentalPsychotic | jails$mentalPTSD | jails$mentalAnxiety | jails$mentalPersonality | jails$mentalOther
jails$anyRegHealthEver <- apply(jails[,grepl("Ever", colnames(jails))], 1, any, na.rm = TRUE)
jails$anyRegHealthStill <- apply(jails[,grepl("Still", colnames(jails))], 1, any, na.rm = TRUE)
jails$anyRegMentalHealth <- jails$anyRegHealthStill | jails$anyMentalHealth

prisonFederal$anyMentalHealth <- prisonFederal$drug == "Dependence" | prisonFederal$mentalSuicideAttempted | prisonFederal$mentalImpaired | prisonFederal$mentalDepressive | prisonFederal$mentalBipolar | prisonFederal$mentalPsychotic | prisonFederal$mentalPTSD | prisonFederal$mentalAnxiety | prisonFederal$mentalPersonality | prisonFederal$mentalOther
prisonFederal$anyRegHealthEver <- apply(prisonFederal[,grepl("Ever", colnames(prisonFederal))], 1, any, na.rm = TRUE)
prisonFederal$anyRegHealthStill <- apply(prisonFederal[,grepl("Still", colnames(prisonFederal))], 1, any, na.rm = TRUE)
prisonFederal$anyRegMentalHealth <- prisonFederal$anyRegHealthStill | prisonFederal$anyMentalHealth

prisonState$anyMentalHealth <- prisonState$drug == "Dependence" | prisonState$mentalSuicideAttempted | prisonState$mentalImpaired | prisonState$mentalDepressive | prisonState$mentalBipolar | prisonState$mentalPsychotic | prisonState$mentalPTSD | prisonState$mentalAnxiety | prisonState$mentalPersonality | prisonState$mentalOther
prisonState$anyRegHealthEver <- apply(prisonState[,grepl("Ever", colnames(prisonState))], 1, any, na.rm = TRUE)
prisonState$anyRegHealthStill <- apply(prisonState[,grepl("Still", colnames(prisonState))], 1, any, na.rm = TRUE)
prisonState$anyRegMentalHealth <- prisonState$anyRegHealthStill | prisonState$anyMentalHealth

prisonState$count <- 1
jails$count <- 1
prisonFederal$count <- 1

jails$mentalAnyTreat <- jails$mentalCounselSince | jails$mentalTreatSince
prisonState$mentalAnyTreat <- prisonState$mentalCounselSince | prisonState$mentalTreatSince
prisonFederal$mentalAnyTreat <- prisonFederal$mentalCounselSince | prisonFederal$mentalTreatSince

library(plyr)
jailsMental <- ddply(jails[jails$sex == 2 ,], .(), summarize,
                    count = sum(count),
                    source = "Jails",
                    
                    Anxiety = 100*sum(mentalAnxiety, na.rm=TRUE)/count,
                    Attempted_Suicide = 100*sum(mentalSuicideAttempted, na.rm=TRUE)/count,
                    Depression = 100*sum(mentalDepressive, na.rm=TRUE)/count,
                    Schizophrenia = 100*sum(mentalPsychotic, na.rm=TRUE)/count,
                    Personality = 100*sum(mentalPersonality, na.rm=TRUE)/count,
                    PTSD = 100*sum(mentalPTSD, na.rm=TRUE)/count,
                    Bipolar = 100*sum(mentalBipolar, na.rm=TRUE)/count,
                    Drug_Dependence = 100*sum(drug == "Dependence", na.rm = TRUE)/count,
                    Other = 100*sum(mentalOther, na.rm=TRUE)/count)

jailsMentalOther <- ddply(jails[jails$sex == 2 ,], .(), summarize,
                     count = sum(count),
                     source = "Jails",
                     Any_Issue = 100*sum(anyMentalHealth, na.rm=TRUE)/count,
                    Medication_When_Admitted = 100*sum(mentalMedAdmit, na.rm=TRUE)/count,
                    Medication_Since_Admitted = 100*sum(mentalMedSinceArrest, na.rm=TRUE)/count,
                    Feels_Impaired = 100*sum(mentalImpaired, na.rm=TRUE)/count,
                    Received_Treatment = 100*sum(mentalAnyTreat, na.rm=TRUE)/count
                    )

jailsHealth <- ddply(jails[jails$sex == 2 ,], .(), summarize,
                    count = sum(count),
                    source = "Jails",
                    Cancer = 100*sum(healthCancerStill, na.rm=TRUE)/count,
                    Hypertension = 100*sum(healthHypertensionStill, na.rm=TRUE)/count,
                    Diabetes = 100*sum(healthDiabetesStill, na.rm=TRUE)/count,
                    Kidney_Issue = 100*sum(healthKidneyStill, na.rm=TRUE)/count,
                    Asthma = 100*sum(healthAsthmaStill, na.rm=TRUE)/count,
                    Hepatitis = 100*sum(healthHepatitisStill, na.rm=TRUE)/count,
                    Paralysis = 100*sum(healthParalysisStill, na.rm=TRUE)/count,
                    Brain_Injury = 100*sum(healthBrainInjuryStill, na.rm=TRUE)/count,
                    Heart_Issue = 100*sum(healthHeartStill, na.rm=TRUE)/count,
                    Arthritis_Rheumatism = 100*sum(healthArthritisRheumatismStill, na.rm=TRUE)/count,
                    Cirrhosis = 100*sum(healthCirrhosisStill, na.rm=TRUE)/count,
                    STD = 100*sum(healthSTDStill, na.rm=TRUE)/count,
                    Dental_Issues = 100*sum(healthDental, na.rm=TRUE)/count,
                    Accidental_Injury = 100*sum(healthInjuredIntentional, na.rm=TRUE)/count,
                    Intentional_Injury = 100*sum(healthInjuredAccident, na.rm=TRUE)/count,
                    Influenza = 100*sum(healthIll, na.rm=TRUE)/count)
                    
jailsHealthExamined <- ddply(jails[jails$sex == 2 ,], .(), summarize,
                   count = sum(count),
                   source = "Jails",
                    Cancer_Examined = 100*sum(healthCancerExamined, na.rm=TRUE)/sum(healthCancerStill, na.rm=TRUE),
                    Hypertension_Examined  = 100*sum(healthHypertensionExamined, na.rm=TRUE)/sum(healthHypertensionStill, na.rm=TRUE),
                    Diabetes_Examined  = 100*sum(healthDiabetesExamined, na.rm=TRUE)/sum(healthDiabetesStill, na.rm=TRUE),
                    Kidney_Issue_Examined  = 100*sum(healthKidneyExamined, na.rm=TRUE)/sum(healthKidneyStill, na.rm=TRUE),
                    Asthma_Examined  = 100*sum(healthAsthmaExamined, na.rm=TRUE)/sum(healthAsthmaStill, na.rm=TRUE),
                    Hepatitis_Examined  = 100*sum(healthHepatitisExamined, na.rm=TRUE)/sum(healthHepatitisStill, na.rm=TRUE),
                    Paralysis_Examined  = 100*sum(healthParalysisExamined, na.rm=TRUE)/sum(healthParalysisStill, na.rm=TRUE),
                    Brain_Injury_Examined  = 100*sum(healthBrainInjuryExamined, na.rm=TRUE)/sum(healthBrainInjuryStill, na.rm=TRUE),
                    Heart_Issue_Examined  = 100*sum(healthHeartExamined, na.rm=TRUE)/sum(healthHeartStill, na.rm=TRUE),
                    Arthritis_Rheumatism_Examined  = 100*sum(healthArthritisRheumatismExamined, na.rm=TRUE)/sum(healthArthritisRheumatismStill, na.rm=TRUE),
                    Cirrhosis_Examined  = 100*sum(healthCirrhosisExamined, na.rm=TRUE)/sum(healthCirrhosisStill, na.rm=TRUE),
                    STD_Examined  = 100*sum(healthSTDSExamined, na.rm=TRUE)/sum(healthSTDStill, na.rm=TRUE),
                    Dental_Issues_Examined  = 100*sum(healthDentalExamined, na.rm=TRUE)/sum(healthDental, na.rm=TRUE),
                    Accidental_Injury_Examined  = 100*sum(healthInjuredAccidentExamined, na.rm=TRUE)/sum(healthInjuredAccident, na.rm=TRUE),
                    Intentional_Injury_Examined  = 100*sum(healthInjuredIntentionalExamined, na.rm=TRUE)/sum(healthInjuredIntentional, na.rm=TRUE),
                    Influenza_Examined  = 100*sum(healthIllExamined, na.rm=TRUE)/sum(healthIll, na.rm=TRUE)
)

prisonFederalMental <- ddply(prisonFederal[prisonFederal$sex == 2 ,], .(), summarize,
                     count = sum(count),
                     source = "Federal Prisons",
                     Anxiety = 100*sum(mentalAnxiety, na.rm=TRUE)/count,
                     Attempted_Suicide = 100*sum(mentalSuicideAttempted, na.rm=TRUE)/count,
                     Depression = 100*sum(mentalDepressive, na.rm=TRUE)/count,
                     Schizophrenia = 100*sum(mentalPsychotic, na.rm=TRUE)/count,
                     Personality = 100*sum(mentalPersonality, na.rm=TRUE)/count,
                     PTSD = 100*sum(mentalPTSD, na.rm=TRUE)/count,
                     Bipolar = 100*sum(mentalBipolar, na.rm=TRUE)/count,
                     Drug_Dependence = 100*sum(drug == "Dependence", na.rm = TRUE)/count,
                     Other = 100*sum(mentalOther, na.rm=TRUE)/count)
                    
prisonFederalMentalOther <- ddply(prisonFederal[prisonFederal$sex == 2 ,], .(), summarize,
                             count = sum(count),
                             source = "Federal Prisons",
                     Any_Issue = 100*sum(anyMentalHealth, na.rm=TRUE)/count,
                     Medication_When_Admitted = 100*sum(mentalMedAdmit, na.rm=TRUE)/count,
                     Medication_Since_Admitted = 100*sum(mentalMedSinceArrest, na.rm=TRUE)/count,
                     Feels_Impaired = 100*sum(mentalImpaired, na.rm=TRUE)/count,
                     Received_Treatment = 100*sum(mentalAnyTreat, na.rm=TRUE)/count
                     
)

prisonFederalHealth <- ddply(prisonFederal[prisonFederal$sex == 2 ,], .(), summarize,
                     count = sum(count),
                     source = "Federal Prisons",
                     Cancer = 100*sum(healthCancerStill, na.rm=TRUE)/count,
                     Hypertension = 100*sum(healthHypertensionStill, na.rm=TRUE)/count,
                     Diabetes = 100*sum(healthDiabetesStill, na.rm=TRUE)/count,
                     Kidney_Issue = 100*sum(healthKidneyStill, na.rm=TRUE)/count,
                     Asthma = 100*sum(healthAsthmaStill, na.rm=TRUE)/count,
                     Hepatitis = 100*sum(healthHepatitisStill, na.rm=TRUE)/count,
                     Paralysis = 100*sum(healthParalysisStill, na.rm=TRUE)/count,
                     Brain_Injury = 100*sum(healthBrainInjuryStill, na.rm=TRUE)/count,
                     Heart_Issue = 100*sum(healthHeartStill, na.rm=TRUE)/count,
                     Arthritis_Rheumatism = 100*sum(healthArthritisRheumatismStill, na.rm=TRUE)/count,
                     Cirrhosis = 100*sum(healthCirrhosisStill, na.rm=TRUE)/count,
                     STD = 100*sum(healthSTDStill, na.rm=TRUE)/count,
                     Dental_Issues = 100*sum(healthDental, na.rm=TRUE)/count,
                     Accidental_Injury = 100*sum(healthInjuredIntentional, na.rm=TRUE)/count,
                     Intentional_Injury = 100*sum(healthInjuredAccident, na.rm=TRUE)/count,
                     Influenza = 100*sum(healthIll, na.rm=TRUE)/count)

prisonFederalHealthExamined <- ddply(prisonFederal[prisonFederal$sex == 2 ,], .(), summarize,
                             count = sum(count),
                             source = "Federal Prisons",                     
                     Cancer_Examined = 100*sum(healthCancerExamined, na.rm=TRUE)/sum(healthCancerStill, na.rm=TRUE),
                     Hypertension_Examined  = 100*sum(healthHypertensionExamined, na.rm=TRUE)/sum(healthHypertensionStill, na.rm=TRUE),
                     Diabetes_Examined  = 100*sum(healthDiabetesExamined, na.rm=TRUE)/sum(healthDiabetesStill, na.rm=TRUE),
                     Kidney_Issue_Examined  = 100*sum(healthKidneyExamined, na.rm=TRUE)/sum(healthKidneyStill, na.rm=TRUE),
                     Asthma_Examined  = 100*sum(healthAsthmaExamined, na.rm=TRUE)/sum(healthAsthmaStill, na.rm=TRUE),
                     Hepatitis_Examined  = 100*sum(healthHepatitisExamined, na.rm=TRUE)/sum(healthHepatitisStill, na.rm=TRUE),
                     Paralysis_Examined  = 100*sum(healthParalysisExamined, na.rm=TRUE)/sum(healthParalysisStill, na.rm=TRUE),
                     Brain_Injury_Examined  = 100*sum(healthBrainInjuryExamined, na.rm=TRUE)/sum(healthBrainInjuryStill, na.rm=TRUE),
                     Heart_Issue_Examined  = 100*sum(healthHeartExamined, na.rm=TRUE)/sum(healthHeartStill, na.rm=TRUE),
                     Arthritis_Rheumatism_Examined  = 100*sum(healthArthritisRheumatismExamined, na.rm=TRUE)/sum(healthArthritisRheumatismStill, na.rm=TRUE),
                     Cirrhosis_Examined  = 100*sum(healthCirrhosisExamined, na.rm=TRUE)/sum(healthCirrhosisStill, na.rm=TRUE),
                     STD_Examined  = 100*sum(healthSTDSExamined, na.rm=TRUE)/sum(healthSTDStill, na.rm=TRUE),
                     Dental_Issues_Examined  = 100*sum(healthDentalExamined, na.rm=TRUE)/sum(healthDental, na.rm=TRUE),
                     Accidental_Injury_Examined  = 100*sum(healthInjuredAccidentExamined, na.rm=TRUE)/sum(healthInjuredAccident, na.rm=TRUE),
                     Intentional_Injury_Examined  = 100*sum(healthInjuredIntentionalExamined, na.rm=TRUE)/sum(healthInjuredIntentional, na.rm=TRUE),
                     Influenza_Examined  = 100*sum(healthIllExamined, na.rm=TRUE)/sum(healthIll, na.rm=TRUE)
)

prisonStateMental <- ddply(prisonState[prisonState$sex == 2 ,], .(), summarize,
                     count = sum(count),
                     source = "State Prisons",
                     Anxiety = 100*sum(mentalAnxiety, na.rm=TRUE)/count,
                     Attempted_Suicide = 100*sum(mentalSuicideAttempted, na.rm=TRUE)/count,
                     Depression = 100*sum(mentalDepressive, na.rm=TRUE)/count,
                     Schizophrenia = 100*sum(mentalPsychotic, na.rm=TRUE)/count,
                     Personality = 100*sum(mentalPersonality, na.rm=TRUE)/count,
                     PTSD = 100*sum(mentalPTSD, na.rm=TRUE)/count,
                     Bipolar = 100*sum(mentalBipolar, na.rm=TRUE)/count,
                     Drug_Dependence = 100*sum(drug == "Dependence", na.rm = TRUE)/count,
                     Other = 100*sum(mentalOther, na.rm=TRUE)/count)

prisonStateMentalOther <- ddply(prisonState[prisonState$sex == 2 ,], .(), summarize,
                           count = sum(count),
                           source = "State Prisons",
                     Medication_When_Admitted = 100*sum(mentalMedAdmit, na.rm=TRUE)/count,
                     Medication_Since_Admitted = 100*sum(mentalMedSinceArrest, na.rm=TRUE)/count,
                     Feels_Impaired = 100*sum(mentalImpaired, na.rm=TRUE)/count,
                     Received_Treatment = 100*sum(mentalAnyTreat, na.rm=TRUE)/count,
                     Any_Issue = 100*sum(anyMentalHealth, na.rm=TRUE)/count
)

prisonStateHealth <- ddply(prisonState[prisonState$sex == 2 ,], .(), summarize,
                     count = sum(count),
                     source = "State Prisons",
                     Cancer = 100*sum(healthCancerStill, na.rm=TRUE)/count,
                     Hypertension = 100*sum(healthHypertensionStill, na.rm=TRUE)/count,
                     Diabetes = 100*sum(healthDiabetesStill, na.rm=TRUE)/count,
                     Kidney_Issue = 100*sum(healthKidneyStill, na.rm=TRUE)/count,
                     Asthma = 100*sum(healthAsthmaStill, na.rm=TRUE)/count,
                     Hepatitis = 100*sum(healthHepatitisStill, na.rm=TRUE)/count,
                     Paralysis = 100*sum(healthParalysisStill, na.rm=TRUE)/count,
                     Brain_Injury = 100*sum(healthBrainInjuryStill, na.rm=TRUE)/count,
                     Heart_Issue = 100*sum(healthHeartStill, na.rm=TRUE)/count,
                     Arthritis_Rheumatism = 100*sum(healthArthritisRheumatismStill, na.rm=TRUE)/count,
                     Cirrhosis = 100*sum(healthCirrhosisStill, na.rm=TRUE)/count,
                     STD = 100*sum(healthSTDStill, na.rm=TRUE)/count,
                     Dental_Issues = 100*sum(healthDental, na.rm=TRUE)/count,
                     Accidental_Injury = 100*sum(healthInjuredIntentional, na.rm=TRUE)/count,
                     Intentional_Injury = 100*sum(healthInjuredAccident, na.rm=TRUE)/count,
                     Influenza = 100*sum(healthIll, na.rm=TRUE)/count)
                     
prisonStateHealthExamined <- ddply(prisonState[prisonState$sex == 2 ,], .(), summarize,
                           count = sum(count),
                           source = "State Prisons",
                     Cancer_Examined = 100*sum(healthCancerExamined, na.rm=TRUE)/sum(healthCancerStill, na.rm=TRUE),
                     Hypertension_Examined  = 100*sum(healthHypertensionExamined, na.rm=TRUE)/sum(healthHypertensionStill, na.rm=TRUE),
                     Diabetes_Examined  = 100*sum(healthDiabetesExamined, na.rm=TRUE)/sum(healthDiabetesStill, na.rm=TRUE),
                     Kidney_Issue_Examined  = 100*sum(healthKidneyExamined, na.rm=TRUE)/sum(healthKidneyStill, na.rm=TRUE),
                     Asthma_Examined  = 100*sum(healthAsthmaExamined, na.rm=TRUE)/sum(healthAsthmaStill, na.rm=TRUE),
                     Hepatitis_Examined  = 100*sum(healthHepatitisExamined, na.rm=TRUE)/sum(healthHepatitisStill, na.rm=TRUE),
                     Paralysis_Examined  = 100*sum(healthParalysisExamined, na.rm=TRUE)/sum(healthParalysisStill, na.rm=TRUE),
                     Brain_Injury_Examined  = 100*sum(healthBrainInjuryExamined, na.rm=TRUE)/sum(healthBrainInjuryStill, na.rm=TRUE),
                     Heart_Issue_Examined  = 100*sum(healthHeartExamined, na.rm=TRUE)/sum(healthHeartStill, na.rm=TRUE),
                     Arthritis_Rheumatism_Examined  = 100*sum(healthArthritisRheumatismExamined, na.rm=TRUE)/sum(healthArthritisRheumatismStill, na.rm=TRUE),
                     Cirrhosis_Examined  = 100*sum(healthCirrhosisExamined, na.rm=TRUE)/sum(healthCirrhosisStill, na.rm=TRUE),
                     STD_Examined  = 100*sum(healthSTDSExamined, na.rm=TRUE)/sum(healthSTDStill, na.rm=TRUE),
                     Dental_Issues_Examined  = 100*sum(healthDentalExamined, na.rm=TRUE)/sum(healthDental, na.rm=TRUE),
                     Accidental_Injury_Examined  = 100*sum(healthInjuredAccidentExamined, na.rm=TRUE)/sum(healthInjuredAccident, na.rm=TRUE),
                     Intentional_Injury_Examined  = 100*sum(healthInjuredIntentionalExamined, na.rm=TRUE)/sum(healthInjuredIntentional, na.rm=TRUE),
                     Influenza_Examined  = 100*sum(healthIllExamined, na.rm=TRUE)/sum(healthIll, na.rm=TRUE)
)

# 1 Less than 6 months ago
# 2 6 months to 1 year ago
# 3 1 to 2 years ago
# 4 More than 2 years ago

prisonStateMentalDiagnosis <- ddply(prisonState[prisonState$sex == 2 & prisonState$mentalDiagnoseTime < 5,], .(), summarize,
                                    count = sum(count),
                                    source = "State Prisons",
                                    Less_than_six_months = 100*sum(mentalDiagnoseTime == 1, na.rm=TRUE)/count,
                                    Six_months_to_a_year = 100*sum(mentalDiagnoseTime == 2, na.rm=TRUE)/count,
                                    One_to_two_years = 100*sum(mentalDiagnoseTime == 3, na.rm=TRUE)/count,
                                    More_than_two_years_ago = 100*sum(mentalDiagnoseTime == 4, na.rm=TRUE)/count)

prisonFederalMentalDiagnosis <- ddply(prisonFederal[prisonFederal$sex == 2 & prisonFederal$mentalDiagnoseTime < 5,], .(), summarize,
                                    count = sum(count),
                                    source = "Federal Prisons",
                                    Less_than_six_months = 100*sum(mentalDiagnoseTime == 1, na.rm=TRUE)/count,
                                    Six_months_to_a_year = 100*sum(mentalDiagnoseTime == 2, na.rm=TRUE)/count,
                                    One_to_two_years = 100*sum(mentalDiagnoseTime == 3, na.rm=TRUE)/count,
                                    More_than_two_years_ago = 100*sum(mentalDiagnoseTime == 4, na.rm=TRUE)/count)

jailsMentalDiagnosis <- ddply(jails[jails$sex == 2 & jails$mentalDiagnoseTime < 5,], .(), summarize,
                                    count = sum(count),
                                    source = "State Prisons",
                                    Less_than_six_months = 100*sum(mentalDiagnoseTime == 1, na.rm=TRUE)/count,
                                    Six_months_to_a_year = 100*sum(mentalDiagnoseTime == 2, na.rm=TRUE)/count,
                                    One_to_two_years = 100*sum(mentalDiagnoseTime == 3, na.rm=TRUE)/count,
                                    More_than_two_years_ago = 100*sum(mentalDiagnoseTime == 4, na.rm=TRUE)/count)

library(reshape2)

colnames(prisonFederalHealth) <- gsub("_", " ", colnames(prisonFederalHealth))
colnames(prisonStateHealth) <- gsub("_", " ", colnames(prisonStateHealth))
colnames(jailsHealth) <- gsub("_", " ", colnames(jailsHealth))

colnames(prisonFederalMentalDiagnosis) <- gsub("_", " ", colnames(prisonFederalMentalDiagnosis))
colnames(prisonStateMentalDiagnosis) <- gsub("_", " ", colnames(prisonStateMentalDiagnosis))
colnames(jailsMentalDiagnosis) <- gsub("_", " ", colnames(jailsMentalDiagnosis))

colnames(prisonFederalHealthExamined) <- gsub("_", " ", colnames(prisonFederalHealthExamined))
colnames(prisonStateHealthExamined) <- gsub("_", " ", colnames(prisonStateHealthExamined))
colnames(jailsHealthExamined) <- gsub("_", " ", colnames(jailsHealthExamined))

colnames(prisonFederalHealthExamined) <- gsub(" Examined", "", colnames(prisonFederalHealthExamined))
colnames(prisonStateHealthExamined) <- gsub(" Examined", "", colnames(prisonStateHealthExamined))
colnames(jailsHealthExamined) <- gsub(" Examined", "", colnames(jailsHealthExamined))

colnames(prisonFederalMental) <- gsub("_", " ", colnames(prisonFederalMental))
colnames(prisonStateMental) <- gsub("_", " ", colnames(prisonStateMental))
colnames(jailsMental) <- gsub("_", " ", colnames(jailsMental))

colnames(prisonFederalMentalOther) <- gsub("_", " ", colnames(prisonFederalMentalOther))
colnames(prisonStateMentalOther) <- gsub("_", " ", colnames(prisonStateMentalOther))
colnames(jailsMentalOther) <- gsub("_", " ", colnames(jailsMentalOther))

healthTable <- rbind(prisonFederalHealth, prisonStateHealth, jailsHealth)[,3:(length(colnames(jailsHealth)))]
health <- melt(healthTable)

healthExaminedTable <- rbind(prisonFederalHealthExamined, prisonStateHealthExamined, jailsHealthExamined)[,3:(length(colnames(jailsHealthExamined)))]
healthExamined <- melt(healthExaminedTable)

mentalTable <- rbind(prisonFederalMental, prisonStateMental, jailsMental)[,3:(length(colnames(jailsMental)))]
mental <- melt(mentalTable)

mentalOtherTable <- rbind(prisonFederalMentalOther, prisonStateMentalOther, jailsMentalOther)[,3:(length(colnames(jailsMentalOther)))]
mentalOther <- melt(mentalOtherTable)

mentalDiagnosisTable <- rbind(prisonFederalMentalDiagnosis, prisonStateMentalDiagnosis, jailsMentalDiagnosis)

healthChart <- hchart(health, "bar", hcaes(x = variable, y = value, group = source)) %>% 
  hc_title(
    text = "Physical Health Issues of Incarcerated Women") %>% 
  hc_credits(enabled = TRUE, href = "https://www.bjs.gov",
             text = "Source: 2002 SILJ, 2004 SISCF & SIFCF") %>%
  # Axis
  hc_yAxis(
    title = list(text = "Prevalence (percent)")
  ) %>% 
  hc_xAxis(
    title = list(text = "")
  ) %>% 
  hc_tooltip(shared = TRUE, valueDecimals = 1)

healthExaminedChart <- hchart(healthExamined, "bar", hcaes(x = variable, y = value, group = source)) %>% 
  hc_title(
    text = "Physical Health Issue Examination Rates") %>% 
  hc_credits(enabled = TRUE, href = "https://www.bjs.gov",
             text = "Source: 2002 SILJ, 2004 SISCF & SIFCF") %>%
  # Axis
  hc_yAxis(
    title = list(text = "Prevalence (percent)")
  ) %>% 
  hc_xAxis(
    title = list(text = "")
  ) %>% 
  hc_tooltip(shared = TRUE, valueDecimals = 1)

mentalChart <- hchart(mental, "bar", hcaes(x = variable, y = value, group = source)) %>% 
  hc_title(
    text = "Mental Health Issues of Incarcerated Women") %>% 
  hc_credits(enabled = TRUE, href = "https://www.bjs.gov",
             text = "Source: 2002 SILJ, 2004 SISCF & SIFCF") %>%
  # Axis
  hc_yAxis(
    title = list(text = "Prevalence (percent)")
  ) %>% 
  hc_xAxis(
    title = list(text = "")
  ) %>% 
  hc_tooltip(shared = TRUE, valueDecimals = 1)

mentalOtherChart <- hchart(mentalOther, "bar", hcaes(x = variable, y = value, group = source)) %>% 
  hc_title(
    text = "Mental Health Treatment Among Incarcerated Women") %>% 
  hc_credits(enabled = TRUE, href = "https://www.bjs.gov",
             text = "Source: 2002 SILJ, 2004 SISCF & SIFCF") %>%
  # Axis
  hc_yAxis(
    title = list(text = "Prevalence (percent)")
  ) %>% 
  hc_xAxis(
    title = list(text = "")
  ) %>% 
  hc_tooltip(shared = TRUE, valueDecimals = 1)

