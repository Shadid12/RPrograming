# include the library 
library(dplyr)
packageVersion("dplyr")


mydf <- read.csv(path2csv, stringsAsFactors = FALSE)
dim(mydf)
head(mydf)


#The first step of working with data in dplyr is to load the data into what 
#the package authors call a
#'data frame tbl' or 'tbl_df'. Use the following code to create a new tbl_df called cran:'

cran <- tbl_df(mydf)
rm("mydf")
cran
select(cran, ip_id, package, country)
select(cran, r_arch:country)
select(cran, country:r_arch)
cran
# Instead of specifying the columns we want to keep, 
# we can also specify the columns we want to throw
# away. To see how this works, do select(cran, -time) to omit the time column.

select(cran, -time)
select(cran, -(X:size))
filter(cran, package == "swirl")
filter(cran, r_version == "3.1.1", country == "US")
filter(cran, r_version <= "3.0.2", country == "IN")
filter(cran, country == "US" | country == "IN")
filter(cran, size > 100500, r_os == "linux-gnu" )
is.na(c(3, 5, NA, 10))
!is.na(c(3, 5, NA, 10))
filter(cran, !is.na(r_version))

# To see how arrange() works, 
#let's first take a subset of cran. select() all columns from size through
#ip_id and store the result in cran2.

cran2 <- select(cran, size:ip_id)
# to make accending
arrange(cran2, ip_id)
# make decending
arrange(cran2, desc(ip_id))
# arrange by package then by ip_id
arrange(cran2, package, ip_id)


#Arrange cran2 by the following three variables, in this order: country (ascending), r_version
#(descending), and ip_id (ascending).

arrange(cran2, country, desc(r_version), ip_id )

# grabing 3 columbs from datasets
cran3 <- select(cran, ip_id, package, size)

mutate(cran3, size_mb = size / 2^20)

mutate(cran3, size_mb = size / 2^20, size_gb = size_mb / 2^10)
mutate(cran3, correct_size = size + 1000)

summarize(cran, avg_bytes = mean(size))
