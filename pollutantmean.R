library(stringr)

pollutantmean <- function(directory, pollutant, id = 1:332) {
    data <- matrix(numeric(0), 0,0)
    
    for(i in id){
        file_part <- str_pad(toString(as.integer(i)), 3, pad = "0")
        file <- paste(file_part, ".csv", sep="")
        
        filename <- file.path(directory, file)
        
        data <- rbind(data, read.csv(filename))
    }
    
    if(pollutant == "sulfate"){
        mean(data[,2], na.rm = TRUE)
    } else if(pollutant == "nitrate")
    {
        mean(data[,3], na.rm = TRUE) 
    }
}