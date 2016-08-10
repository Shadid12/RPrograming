### My SQL ####

install.packages("RMySQL")
library("RMySQL")

uscDB <- dbConnect(MySQL(), user="genome", host="genome-mysql.cse.ucsc.edu")
result <- dbGetQuery(uscDB, "show databases;")
dbDisconnect(uscDB)

hg19 <- dbConnect(MySQL(), user="genome", db="hg19",
                  host="genome-mysql.cse.ucsc.edu")
alltables <- dbListTables(hg19)
alltables[1:5]

dbListFields(hg19, "HInv")
dbDisconnect(hg19)


