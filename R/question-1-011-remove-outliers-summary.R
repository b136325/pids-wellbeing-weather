library(dplyr)
library(scales)
####################################################
#                                                  #
# EXPORTED FUNCTION                                #
#                                                  #
####################################################
#' question_1_011_remove_outliers_summary
#' @export
question_1_011_remove_outliers_summary <- function(
  group_by_variable_name = "weather_station_name"
) {
  results <- list()
  data_frame <- question_1_010_remove_outliers(
    group_by_variable_name,
    scale = FALSE
  )
  results$non_scaled <- build_summary(
    data_frame
  )
  data_frame <- question_1_010_remove_outliers(
    group_by_variable_name,
    scale = TRUE
  )
  results$scaled <- build_summary(
    data_frame
  )
  results
}
