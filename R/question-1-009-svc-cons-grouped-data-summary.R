library(dplyr)
library(scales)
####################################################
#                                                  #
# EXPORTED FUNCTION                                #
#                                                  #
####################################################
#' question_1_009_svc_cons_grouped_data_summary
#'
#' A function that returns list of both 'non_scaled' and 'scaled' 'consistently correct' data grouped by weather station.
#'
#' @param group_by_variable_name Defines the group by variable. String.
#'                               Defaults to "weather_station_name"
#'
#' @return A list containing both 'non_scaled' and 'scaled' 'consistently correct' data.
#'
#' @usage
#' question_1_009_svc_cons_grouped_data_summary()
#' question_1_009_svc_cons_grouped_data_summary(scale = FALSE)
#' question_1_009_svc_cons_grouped_data_summary(group_by_variable_name = "some_variable")
#' @export
question_1_009_svc_cons_grouped_data_summary <- function(
  group_by_variable_name = "weather_station_name"
) {
  results <- list()
  df <- question_1_008_svc_cons_grouped_data(
    group_by_variable_name,
    scale = FALSE
  )
  results$non_scaled <- build_summary(df)
  df <- question_1_008_svc_cons_grouped_data(
    group_by_variable_name,
    scale = TRUE
  )
  results$scaled <- build_summary(
    df
  )
  results
}
####################################################
#                                                  #
# ENON XPORTED FUNCTIONS (A-Z)                     #
#                                                  #
####################################################
build_summary <- function(data_frame, num_decimal_places = 3) {
  hours_sun <- double()
  hours_sun <- append(
    hours_sun,
    round(
      mean(data_frame$hours_sun),
      num_decimal_places
    )
  )
  hours_sun <- append(
    hours_sun,
    round(
      min(data_frame$hours_sun),
      num_decimal_places
    )
  )
  hours_sun <- append(
    hours_sun,
    round(
      max(data_frame$hours_sun),
      num_decimal_places
    )
  )
  hours_sun <- append(
    hours_sun,
    round(
      sd(data_frame$hours_sun),
      num_decimal_places
    )
  )
  rain_mm <- double()
  rain_mm <- append(
    rain_mm,
    round(
      mean(data_frame$rain_mm),
      num_decimal_places
    )
  )
  rain_mm <- append(
    rain_mm,
    round(
      min(data_frame$rain_mm),
      num_decimal_places
    )
  )
  rain_mm <- append(
    rain_mm,
    round(
      max(data_frame$rain_mm),
      num_decimal_places
    )
  )
  rain_mm <- append(
    rain_mm,
    round(
      sd(data_frame$rain_mm),
      num_decimal_places
    )
  )
  temp_max <- double()
  temp_max <- append(
    temp_max,
    round(
      mean(data_frame$temp_max_degrees_c),
      num_decimal_places
    )
  )
  temp_max <- append(
    temp_max,
    round(
      min(data_frame$temp_max_degrees_c),
      num_decimal_places
    )
  )
  temp_max <- append(
    temp_max,
    round(
      max(data_frame$temp_max_degrees_c),
      num_decimal_places
    )
  )
  temp_max <- append(
    temp_max,
    round(
      sd(data_frame$temp_max_degrees_c),
      num_decimal_places
    )
  )
  temp_min <- double()
  temp_min <- append(
    temp_min,
    round(
      mean(data_frame$temp_min_degrees_c),
      num_decimal_places
    )
  )
  temp_min <- append(
    temp_min,
    round(
      min(data_frame$temp_min_degrees_c),
      num_decimal_places
    )
  )
  temp_min <- append(
    temp_min,
    round(
      max(data_frame$temp_min_degrees_c),
      num_decimal_places
    )
  )
  temp_min <- append(
    temp_min,
    round(
      sd(data_frame$temp_min_degrees_c),
      num_decimal_places
    )
  )
  results <- data.frame(
    hours_sun = hours_sun,
    rain_mm = rain_mm,
    temp_max = temp_max,
    temp_min = temp_min
  )
  results
}
