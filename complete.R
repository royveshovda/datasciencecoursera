complete <- function(directory, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return a data frame of the form:
    ## id nobs
    ## 1  117
    ## 2  1041
    ## ...
    ## where 'id' is the monitor ID number and 'nobs' is the
    ## number of complete cases
    
    data <- data.frame(id=integer(0) , nobs = integer(0))
    
    for(i in id){
        file_part <- str_pad(toString(as.integer(i)), 3, pad = "0")
        file <- paste(file_part, ".csv", sep="")
        
        filename <- file.path(directory, file)
        
        d <- read.csv(filename)

        good <- complete.cases(d)
        good_rows = d[good,]
        rows = nrow(good_rows)
        data2 <- data.frame(id=i , nobs = rows)
        data <- rbind(data, data2)
    }
    
    data
}