library(dplyr)
####################################################
#                                                  #
# EXPORTED FUNCTION                                #
#                                                  #
####################################################
#' question_2_002_eda_latitude_category_summary
#' @export
question_2_002_eda_latitude_category_summary <- function(
  df = question_2_001_append_latitude_categories()
) {
  results <- list()
  results$nrows <- df %>%
    group_by(latitude_category) %>%
    tally()
  results$means <- df %>%
    group_by(latitude_category) %>%
    summarize(
      hours_sun = mean(hours_sun),
      rain_mm = mean(rain_mm),
      temp_max_degrees_c = mean(temp_max_degrees_c),
      temp_min_degrees_c = mean(temp_min_degrees_c)
    )
  results$weather_stations <- df %>%
    group_by(latitude_category) %>%
    select(
      weather_station_name
    )
  results
}
