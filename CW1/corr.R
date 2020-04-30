

corr <- function(directory, threshold=0) {
  correlations <- vector('numeric')
  all_files <- list.files(directory, full.names=TRUE)
  for (file_name in all_files) {
    data <- read.csv(file_name)
    complete_data <- data[complete.cases(data), ]
    complete_count <- nrow(complete_data)
    if (complete_count > threshold) {
      cor_val <- cor(complete_data[, 'sulfate'], complete_data[, 'nitrate'])
      correlations <- c(correlations, cor_val)
    }
  }
  correlations
}