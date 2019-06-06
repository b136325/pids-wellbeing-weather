library(dplyr)
library(scales)
####################################################
#                                                  #
# EXPORTED FUNCTION                                #
#                                                  #
####################################################
#' question_1_008_grouped_data_summary
#' @param group_by_variable_name Defines the group by variable. String. Defaults to "weather_station_name"
#' @examples
#' question_1_008_grouped_data_summary()
#' question_1_008_grouped_data_summary(scale = FALSE)
#' qquestion_1_008_grouped_data_summary(group_by_variable_name = "some_variable")
#' @export
question_1_008_grouped_data_summary <- function(
  group_by_variable_name = "weather_station_name"
) {
  results <- list()
  data_frame <- question_1_007_grouped_data(
    group_by_variable_name,
    scale = FALSE
  )
  results$non_scaled <- build_summary(
    data_frame
  )
  data_frame <- question_1_007_grouped_data(
    group_by_variable_name,
    scale = TRUE
  )
  results$scaled <- build_summary(
    data_frame
  )
  results
}
####################################################
#                                                  #
# ENON XPORTED FUNCTIONS (A-Z)                     #
#                                                  #
####################################################
build_summary <- function(data_frame) {
  hours_sun <- double()
  hours_sun <- append(
    hours_sun,
    mean(data_frame$hours_sun)
  )
  hours_sun <- append(
    hours_sun,
    min(data_frame$hours_sun)
  )
  hours_sun <- append(
    hours_sun,
    max(data_frame$hours_sun)
  )
  hours_sun <- append(
    hours_sun,
    sd(data_frame$hours_sun)
  )
  rain_mm <- double()
  rain_mm <- append(
    rain_mm,
    mean(data_frame$rain_mm)
  )
  rain_mm <- append(
    rain_mm,
    min(data_frame$rain_mm)
  )
  rain_mm <- append(
    rain_mm,
    max(data_frame$rain_mm)
  )
  rain_mm <- append(
    rain_mm,
    sd(data_frame$rain_mm)
  )
  temp_max <- double()
  temp_max <- append(
    temp_max,
    mean(data_frame$temp_max_degrees_c)
  )
  temp_max <- append(
    temp_max,
    min(data_frame$temp_max_degrees_c)
  )
  temp_max <- append(
    temp_max,
    max(data_frame$temp_max_degrees_c)
  )
  temp_max <- append(
    temp_max,
    sd(data_frame$temp_max_degrees_c)
  )
  temp_min <- double()
  temp_min <- append(
    temp_min,
    mean(data_frame$temp_min_degrees_c)
  )
  temp_min <- append(
    temp_min,
    min(data_frame$temp_min_degrees_c)
  )
  temp_min <- append(
    temp_min,
    max(data_frame$temp_min_degrees_c)
  )
  temp_min <- append(
    temp_min,
    sd(data_frame$temp_min_degrees_c)
  )
  results <- data.frame(
    hours_sun = hours_sun,
    rain_mm = rain_mm,
    temp_max = temp_max,
    temp_min = temp_min
  )
  results
}
