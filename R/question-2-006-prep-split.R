library(dplyr)
####################################################
#                                                  #
# EXPORTED FUNCTION                                #
#                                                  #
####################################################
#' question_2_006_prep_split
#' @export
question_2_006_prep_split <- function(
  df = question_2_001_bu_append_latitude_categories(),
  num_test_rows = 5
) {
  data <- list()
  data$training <- derive_training_data_frame(
    df,
    nrow(df) - num_test_rows
  )
  data$test <- derive_test_data_frame(
    df,
    num_test_rows
  )
  data
}
####################################################
#                                                  #
# NON EXPORTED FUNCTIONS (A-Z)                     #
#                                                  #
####################################################
derive_training_data_frame <- function(
  df,
  num_training_rows
) {
  data_frame %>%
    top_n(
      num_training_rows,
      weather_station_name
    )
}

derive_test_data_frame <- function(
  df,
  num_test_rows
) {
  df %>%
    top_n(
      -num_test_rows,
      weather_station_name
    )
}
