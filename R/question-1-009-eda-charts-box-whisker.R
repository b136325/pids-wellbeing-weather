library(dplyr)
library(ggplot2)
####################################################
#                                                  #
# EXPORTED FUNCTIONS (A-Z                          #
#                                                  #
####################################################
#' question_1_009_eda_charts_box_whisker_hours_sun
#' @export
question_1_009_eda_charts_box_whisker_hours_sun <- function() {
  generate_box_whisker_chart_by_weather_station_name(
    load_technically_correct_data_frame(),
    "hours_sun"
  )
}

#' question_1_009_eda_charts_box_whisker_rain
#' @export
question_1_009_eda_charts_box_whisker_rain <- function() {
  generate_box_whisker_chart_by_weather_station_name(
    load_technically_correct_data_frame(),
    "rain_mm"
  )
}

#' question_1_009_eda_charts_box_whisker_max_temp
#' @export
question_1_009_eda_charts_box_whisker_max_temp <- function() {
  generate_box_whisker_chart_by_weather_station_name(
    load_technically_correct_data_frame(),
    "temp_max_degrees_c"
  )
}

#' question_1_009_eda_charts_box_whisker_min_temp
#' @export
question_1_009_eda_charts_box_whisker_min_temp <- function() {
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
  ) +
  geom_boxplot() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
}
