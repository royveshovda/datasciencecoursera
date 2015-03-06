corr <- function(directory, threshold = 0) {
    datafiles <- list.files("specdata", pattern="*.csv", full.names=TRUE)
    
    result <- numeric(0)
    
    for(file in datafiles){
        data <- read.csv(file)
        data <- data[complete.cases(data),]
        if(nrow(data) > threshold){
            c <- cor(data$sulfate, data$nitrate)
            # c <- round(c, digits=4)
            result <- c(result, c)
        }
    }
    result
}