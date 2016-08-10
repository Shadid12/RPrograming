download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv",destfile = "C:/Users/shadid/Desktop/r/data.csv" )

dat = read.csv("C:/Users/shadid/Desktop/r/data.csv", header = TRUE)
library(dplyr)
library(readxl)

library(xlsx)

mydat <- tbl_df(dat)
over_mil <- filter(mydat, VAL == 24)
# 53 

# Question 2: tidy data has one variable per coloum

## Question 3:

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx", destfile = "C:/Users/shadid/Desktop/r/gas.xlsx")
dateDownloaded <- date()
new_dat <- read.xlsx()
