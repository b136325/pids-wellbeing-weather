library(dplyr)
library(ggplot2)
library(gridExtra)
library(rlang)
library(scales)
####################################################
#                                                  #
# EXPORTED FUNCTION                                #
#                                                  #
####################################################
#' question_1a_charts_box_whisker
#' @export
question_1a_charts_box_whisker <- function() {
  data_frame <- load_question_1a_data_frame()
  data_frame_rescaled <- rescale_data_frame(data_frame)
  heathrow <- data_frame_rescaled %>% filter(
    weather_station_name == "heathrow"
  )
  ggplot(
    heathrow,
    aes(
      x = as.factor(observation_month),
      y = temp_max_degrees_c,
    )
  ) + geom_boxplot()
}

#' question_1a_charts_latitude_comparisons
#' @export
question_1a_charts_latitude_comparisons <- function() {
  data_frame <- load_question_1a_data_frame()
  chart_1 <- generate_latitude_chart(
    data_frame,
    "hours_sun"
  )
  chart_2 <- generate_latitude_chart(
    data_frame,
    "rain_mm"
  )
  chart_3 <- generate_latitude_chart(
    data_frame,
    "temp_max_degrees_c"
  )
  chart_4 <- generate_latitude_chart(
    data_frame,
    "temp_min_degrees_c"
  )
  grid.arrange(
    chart_1,
    chart_2,
    chart_3,
    chart_4
  )
}
####################################################
#                                                  #
# NON EXPORTED FUNCTIONS (A-Z)                     #
#                                                  #
####################################################
generate_latitude_chart <- function(data_frame, x_variable_name) {
  data_frame %>%
    group_by(weather_station_name) %>%
    summarize(
      latitude = min(latitude),
      x_variable = mean(!!sym(x_variable_name))
    ) %>%
    ggplot(
      aes(
        x = x_variable,
        y = latitude
      )
    ) + geom_point() + ylim(50, 60)
}
