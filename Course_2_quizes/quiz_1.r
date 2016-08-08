dir.create("data")
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile = "./data/06hid.csv", method = "curl")
dateDownloaded <- date()


# install necessary libraries 
library(dplyr)
packageVersion("dplyr")
library(XML)
library(data.table)
# # #  # # ########### 

h <- read.csv("./data/06hid.csv")
df <- tbl_df(h)
sum <- filter(df, VAL >= 24)

# Question 3 
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileUrl, destfile = "./data/gas.xlsx", method = "curl")
dateDownloaded <- date()
library(xlsx)

rowIndex = 18 : 23
colIndex = 7 : 15
dat <- read.xlsx("./data/gas.xlsx", sheetIndex = 1, rowIndex = rowIndex, 
                 colIndex = colIndex, header = TRUE)
sum(dat$Zip * dat$Ext, na.rm=T)



# Question 4
# Read the XML data on Baltimore restaurants from here:
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml
# 
# How many restaurants have zipcode 21231?

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"

download.file(fileUrl, destfile = "./data/restaurants.xml", method = "curl")

data <- xmlTreeParse("http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml", useInternal = TRUE)
rootNode <- xmlRoot(data)
sum(xpathSApply(rootNode, "//zipcode", xmlValue) == "21231")





# The American Community Survey distributes downloadable data about United States communities. 
# Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here:
#   
#   https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv
# 
# using the fread() command load the data into an R object



fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileUrl, destfile = "./data/06pid.csv", method = "curl")
dateDownloaded <- date()

DT <- fread("./data/06pid.csv")

race <- 1000
# This method use the features of data.table.
horse1 <- replicate(race, unname(system.time(DT[, mean(pwgtp15), by = SEX]))[1])

horse2 <- replicate(race, unname(system.time(tapply(DT$pwgtp15, DT$SEX, mean)))[1])


horse3 <- replicate(race, unname(system.time(sapply(split(DT$pwgtp15, DT$SEX), mean)))[1])


mean(horse1)
mean(horse2)
mean(horse3)


plot(horse1)
plot(horse2)
plot(horse3)


# The cumulative average changes:
horse1_av <- cumsum(horse1) / seq_along(horse1)
horse2_av <- cumsum(horse2) / seq_along(horse2)
horse3_av <- cumsum(horse3) / seq_along(horse3)

# Plot lines (horse1 use red line; horse2 use blue line; horse3 use black line):
# Making sure the y axis is at the right height
topY <- max(horse1_av, horse2_av, horse3_av)
lowY <- min(horse1_av, horse2_av, horse3_av)
plot(horse1_av, type = "l", col = "#FF000099", ylim = c(lowY, topY), 
     xlab = "distance", ylab = "average time")
lines(horse2_av, col = "#0000FF99")
lines(horse3_av, col = "#00000099")
























