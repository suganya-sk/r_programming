source('utils.R');

rankall <- function(outcome, rank='best') {
  # validate outcome
  all_outcomes <- c('heart attack', 'heart failure', 'pneumonia');
  if (!is.element(outcome, all_outcomes)) {
    stop('invalid outcome');
  }

  col_index <- 0;

  if (outcome == 'heart attack') {
    col_index <- 11;
  } else if (outcome == 'heart failure') {
    col_index <- 17;
  } else {
    col_index <- 23;
  }

  cm <- read.csv('outcome-of-care-measures.csv', colClasses='character');
  req_data <- cm[, c(2, col_index)];
  req_data[, 2] <- as.numeric(req_data[, 2]);

  if (rank == 'best') {
    rank <- 1;
  }

  getByRank <- function(state_data) {
    res <- sortByOutcome(state_data);
    if (rank == 'worst') {
      rank <- nrow(res);
    }
    if (rank > nrow(res)) {
      return(NA);
    } else {
      return(res[rank, 1]);
    }
  }

  tmp <- split(req_data, cm['State']);
  result <- lapply(tmp, getByRank);
  values <- lapply(names(result), function (state) {result[[state]]});
  result <- cbind(hospital=values, state=names(result));

  as.data.frame(result);
}
