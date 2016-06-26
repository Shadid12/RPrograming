#### PART 1 ####
pollutantmean <- function (directory , pollutant , id =1:332 ){
  
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
test2 <- pollutantmean("data", "sulfate", 1:10) # up to this point we are good 
test2
q <- pollutantmean("data", "nitrate")
print (q)
################### PART 2 ####################


complete <- function (directory, id = 1:332){
  vect_id <- NULL
  vect_nobs <- NULL
  for(i in id){
    ## first if to fetch under 10
    if(i < 10 ){
      dir <- paste(directory, i, sep = "/00")
      file <- paste(dir,".csv", sep = "")
      my_data <- read.csv(file)
      a <- clean_data(my_data,"sulfate")
      a_a <- clean_data(my_data,"nitrate")
      n <- length(a)
      m <- length(a_a)
      if(n < m){
        nobs <- n
      }else{
        nobs <- m
      }
      vect_id <- append(vect_id,i)
      vect_nobs <- append(vect_nobs, nobs)
      
    }
    
    else if(i > 9 && i < 100){
      dir <- paste(directory, i, sep = "/0")
      file <- paste(dir,".csv", sep = "")
      my_data <- read.csv(file)
      b <- clean_data(my_data,"sulfate")
      b_a <- clean_data(my_data,"nitrate")
      n <- length(b)
      m <- length(b_a)
      if(n < m){
        nobs <- n
      }else{
        nobs <- m
      }
      
      vect_id <- append(vect_id,i)
      vect_nobs <- append(vect_nobs, nobs)
    }
    else{
      dir <- paste(directory, i, sep = "/")
      file <- paste(dir,".csv", sep = "")
      my_data <- read.csv(file)
      c <- clean_data(my_data,"sulfate")
      c_a <- clean_data(my_data,"nitrate")
      n <- length(c)
      m <- length(c_a)
      if(n > m){
        nobs <- m
      }else{
        nobs <- n
      }
      vect_id <- append(vect_id,i)
      vect_nobs <- append(vect_nobs, nobs)
      
    }
  }
  #now add them to a dataframe 
  df <- data.frame(vect_id, vect_nobs)
  return(df)
}
## test cases 
df <- complete("data", c(2, 4, 8, 10, 12))
test_2 <- complete("data", 30:25)
test_2
cc <- complete("data", 54)
print(cc)














