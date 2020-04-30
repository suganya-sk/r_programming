source('utils.R')

best <- function(state, outcome) {
  state_data_for_outcome <- getOutcomeMortalityInState(state, outcome);

  result <- sortByOutcome(state_data_for_outcome);

  result[1, 1];

}
