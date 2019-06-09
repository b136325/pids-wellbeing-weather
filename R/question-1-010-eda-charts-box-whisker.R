library(dplyr)
library(ggplot2)
# Begin Exclude Linting
library(Hmisc)
# End Exclude Linting
####################################################
#                                                  #
# EXPORTED FUNCTIONS (A-Z                          #
#                                                  #
####################################################
#' question_1_010_eda_charts_box_whisker_hours_sun
#' @export
question_1_010_eda_charts_box_whisker_hours_sun <- function() {
  generate_box_whisker_chart_by_weather_station_name(
    load_technically_correct_data_frame(),
    "hours_sun",
    "Mean hours of sunshine by weather station (across all years)",
    "Weather stations",
    "Hours of sunshine"
  )
}

#' question_1_010_eda_charts_box_whisker_rain
#' @export
question_1_010_eda_charts_box_whisker_rain <- function() {
  generate_box_whisker_chart_by_weather_station_name(
    load_technically_correct_data_frame(),
    "rain_mm",
    "Mean rain (mm) by weather station (across all years)",
    "Weather stations",
    "Rain (mm)"
  )
}

#' question_1_010_eda_charts_box_whisker_max_temp
#' @export
question_1_010_eda_charts_box_whisker_max_temp <- function() {
  generate_box_whisker_chart_by_weather_station_name(
    load_technically_correct_data_frame(),
    "temp_max_degrees_c",
    "Mean max temperature (degrees c) by weather station (across all years)",
    "Weather stations",
    "Max temperature (degrees c)"
  )
}

#' question_1_010_eda_charts_box_whisker_min_temp
#' @export
question_1_010_eda_charts_box_whisker_min_temp <- function() {
  generate_box_whisker_chart_by_weather_station_name(
    load_technically_correct_data_frame(),
    "temp_min_degrees_c",
    "Mean min temperature (degrees c) by weather station (across all years)",
    "Weather stations",
    "Min temperature (degrees c)"
  )
}
####################################################
#                                                  #
# NON EXPORTED FUNCTIONS                           #
#                                                  #
####################################################
generate_box_whisker_chart_by_weather_station_name <- function(
  df,
  y_variable_name,
  title,
  x_title,
  y_title
) {
  ggplot(
    df,
    aes(
      weather_station_name,
      !!sym(y_variable_name)
    )
  ) +
  geom_boxplot() +
  labs(
    title = title,
    x = x_title,
    y = y_title
  ) +
  scale_x_discrete(
    labels = capitalize(
      as.character(
        unique(
          df$weather_station_name
        )
      )
    )
  ) +
  theme(
    axis.text.x = element_text(
      angle = 90,
      hjust = 1,
      size = 15
    )
  )
}
