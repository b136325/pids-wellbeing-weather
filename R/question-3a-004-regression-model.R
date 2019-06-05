library(dplyr)
####################################################
#                                                  #
# EXPORTED FUNCTION                                #
#                                                  #
####################################################
#' question_3a_004_regression_model
#' @export
question_3a_004_regression_model <- function() {
  data_frame_training <- question_3a_002_data_join()
  lm(
    happiness ~ hours_sun + rain_mm + temp_max_degrees_c + temp_min_degrees_c,
    data_frame_training
  )
}
