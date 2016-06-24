pollutantmean <- function (directory , pollutant , id ){
  
  my_data <- NULL
  res <- NULL
  for (i in id) {
    if(i < 10 ){
      dir <- paste(directory, i, sep = "/00")
      file <- paste(dir,".csv", sep = "")
      my_data <- read.csv(file)
      a <- clean_data(my_data,pollutant)
      res <- append(res,a)
      
    }else if (i > 9 && i < 100){
      dir <- paste(directory, i, sep = "/0")
      file <- paste(dir,".csv", sep = "")
      my_data <- read.csv(file)
      b <- clean_data(my_data,pollutant)
      res <- append(res,b)
      
    }
    else{
      dir <- paste(directory, i, sep = "/")
      file <- paste(dir,".csv", sep = "")
      my_data <- read.csv(file)
      c <- clean_data(my_data,pollutant)
      res <- append(res,c)
      
    }
  }
  return(mean(res))
}


# now delete the rows and coloums that we don't need
clean_data <- function(table,col){
  table <- table[,c(col)]
  # remove all the NA
  table <- table[!is.na(table)]
  # table <- mean(table)
  return (table)
}

# Test case 
test <- pollutantmean("data", "nitrate", 70:72) # up to this point we are good 
print (test)



