library(dplyr)
####################################################
#                                                  #
# EXPORTED FUNCTION                                #
#                                                  #
####################################################
#' question_3a_004_regression
#' @export
question_3a_004_regression <- function() {
  data_frame <- question_3a_002_data_join()
  data_frame
}
####################################################
#                                                  #
# NON EXPORTED FUNCTIONS (A-Z)                     #
#                                                  #
####################################################
perform_regression <- function(data_frame) {
  lm(
    happiness ~ hours_sun + rain_mm + temp_max_degrees_c + temp_min_degrees_c,
    data_frame
  )
}