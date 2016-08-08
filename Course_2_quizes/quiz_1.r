dir.create("data")
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile = "./data/06hid.csv", method = "curl")
dateDownloaded <- date()


# install necessary libraries 
library(dplyr)
packageVersion("dplyr")
# # #  # # ########### 

h <- read.csv("./data/06hid.csv")
df <- tbl_df(h)
sum <- filter(df, VAL >= 24)
