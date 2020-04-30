
## read data from all monitor IDs passed and returns a single dataframe

read_data_from <- function(directory='./specdata', id=1:332) {
  master_df <- data.frame()
  for (each in id) {
    file_name <- paste(formatC(each, width = 3, flag = 0), '.csv', sep = '')
    full_path <- paste(directory, file_name, sep = '/')
    data <- read.csv(full_path)
    master_df <- rbind(master_df, data)
  }
  master_df
}

# 
# ## counts all complete cases in the dataframe
# complete_count <- function(data) {
#   nrow()
# }