library(dplyr)
####################################################
#                                                  #
# EXPORTED FUNCTION                                #
#                                                  #
####################################################
#' question_2a_004_split
#' @export
question_2a_004_split <- function(
  group_by_variable_name = "weather_station_name",
  scale = TRUE,
  num_test_rows = 5
) {
  data_frame <- question_2a_001_data(
    group_by_variable_name,
    scale
  )
  data <- list()
  data$training <- derive_training_data_frame(
    data_frame,
    num_test_rows
  )
  data$test <- derive_test_data_frame(
    data_frame,
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
  data_frame,
  num_test_rows
) {
  data_frame %>%
    top_n(
      nrow(data_frame) - num_test_rows,
      weather_station_name
    )
}

derive_test_data_frame <- function(
  data_frame,
  num_test_rows
) {
  data_frame %>%
    top_n(
      -num_test_rows,
      weather_station_name
    )
}
