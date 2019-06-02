library(dplyr)
library(ggplot2)
####################################################
#                                                  #
# EXPORTED FUNCTIONS (A-Z                          #
#                                                  #
####################################################
#' question_1a_010_charts_box_whisker_hours_sun
#' @export
question_1a_010_charts_box_whisker_hours_sun <- function() {
  generate_box_whisker_chart_by_weather_station_name(
    load_technically_correct_data_frame(),
    "hours_sun"
  )
}

#' question_1a_010_charts_box_whisker_rain_mm
#' @export
question_1a_010_charts_box_whisker_rain_mm <- function() {
  generate_box_whisker_chart_by_weather_station_name(
    load_technically_correct_data_frame(),
    "rain_mm"
  )
}

#' question_1a_010_charts_box_whisker_temp_max
#' @export
question_1a_010_charts_box_whisker_temp_max <- function() {
  generate_box_whisker_chart_by_weather_station_name(
    load_technically_correct_data_frame(),
    "temp_max_degrees_c"
  )
}

#' question_1a_010_charts_box_whisker_temp_min
#' @export
question_1a_010_charts_box_whisker_temp_min <- function() {
  generate_box_whisker_chart_by_weather_station_name(
    load_technically_correct_data_frame(),
    "temp_min_degrees_c"
  )
}
####################################################
#                                                  #
# NON EXPORTED FUNCTIONS                           #
#                                                  #
####################################################
generate_box_whisker_chart_by_weather_station_name <- function(
  data_frame,
  y_variable_name
) {
  ggplot(
    load_technically_correct_data_frame(),
    aes(
      weather_station_name,
      !!sym(y_variable_name)
    )
  ) + geom_boxplot()
}
