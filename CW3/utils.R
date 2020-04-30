getOutcomeMortalityInState <- function(state, outcome) {
  cm <- read.csv('outcome-of-care-measures.csv', colClasses='character');

  # validate state
  all_states <- unique(cm[, 'State']);
  if (!is.element(state, all_states)) {
    stop('invalid state');
  }
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

  # retain only columns with hospital name and outcome in req state
  result <- cm[cm['State'] == state, c(2, col_index)];
  result[, 2] <- as.numeric(result[, 2]);

  result;
}


sortByOutcome <- function(data) {
  # drop rows where outcome is NA
  result <- data[!is.na(data[2]), ];
  # sort by outcome column, breaking ties with hospital name
  result <- result[order(result[2], result['Hospital.Name']), ];
  result;
}
