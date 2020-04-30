source('utils.R')

rankhospital <- function(state, outcome, rank) {
  state_data_for_outcome <- getOutcomeMortalityInState(state, outcome);
  result <- sortByOutcome(state_data_for_outcome);
  if (rank == 'best') {
    rank <- 1;
  } else if (rank == 'worst') {
    rank <- nrow(result);
  }
  if (rank > nrow(result)) {
    return(NA);
  } else {
    return(result[rank, 1]);
  }
}
