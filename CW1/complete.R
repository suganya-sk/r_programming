
source('utils.R')

complete <- function(directory, id=1:332) {
  mdf <- data.frame(id=numeric(), nobs=numeric())
  for (each in id) {
    data <- read_data_from(id=each)
    complete_count <- nrow(data[complete.cases(data), ])
    mdf <- rbind(mdf, data.frame(id=each, nobs=complete_count))
  }
  mdf
}