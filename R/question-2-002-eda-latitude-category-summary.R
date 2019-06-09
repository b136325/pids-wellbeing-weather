library(dplyr)
library(xtable)
####################################################
#                                                  #
# EXPORTED FUNCTION                                #
#                                                  #
####################################################
#' question_2_002_eda_latitude_category_summary
#' @export
question_2_002_eda_latitude_category_summary <- function(
  df = question_2_001_bu_append_latitude_categories()
) {
  results <- list()
  results$nrows <- df %>%
    group_by(latitude_category) %>%
    tally()
  results$means <- df %>%
    group_by(latitude_category) %>%
    summarise(
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

#' question_2_002_eda_latitude_category_summary_latex
#' @export
question_2_002_eda_latitude_category_summary_latex <- function(
  res_list = question_2_002_eda_latitude_category_summary()
) {
  res <- list()
  res$nrows <- xtable(
    res_list$nrows
  )
  res$means <- xtable(
    res_list$means
  )
  res$weather_station <- xtable(
    res_list$weather_stations
  )
  res
}
