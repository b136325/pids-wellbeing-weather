library(dplyr)
library(ggplot2)
# Begin Exclude Linting
library(gridExtra)
library(Hmisc)
# End Exclude Linting
####################################################
#                                                  #
# EXPORTED FUNCTIONS (A-Z                          #
#                                                  #
####################################################
#' question_1_013_eda_charts_latitude
#' 
#' Generate scatterplot charts comparing weather variables with latitude.
#' @examples
#' question_1_013_eda_charts_latitude()
#' @export
question_1_013_eda_charts_latitude <- function() {
  df <- question_1_011_eda_remove_outliers(scale = FALSE)
  generate_latitude_charts(
    df = df,
    x_variable_names = c(
      "hours_sun",
      "rain_mm",
      "temp_max_degrees_c",
      "temp_min_degrees_c"
    ),
    "weather_station_name"
  )
}
####################################################
#                                                  #
# NON EXPORTED FUNCTIONS (A-Z)                     #
#                                                  #
####################################################
generate_latitude_chart_without_grouping <- function(
  df,
  x_variable_name,
  y_variable_name = "latitude"
) {
  x_axis_title <- capitalize(
    str_replace_all(
      x_variable_name,
      "_",
      " "
    )
  )
  y_axis_title <- capitalize(y_variable_name)
  ggplot(
    df,
    aes(
      x = !!sym(x_variable_name),
      y = !!sym(y_variable_name)
    )
  ) +
  geom_point() +
  ylim(50, 60) +
  labs(
    x = x_axis_title,
    y = y_axis_title
  )
}

generate_latitude_charts <- function(
  df,
  x_variable_names,
  colour_variable_name = "weather_station_name",
  generate_chart = generate_latitude_chart_without_grouping
) {
  charts <- list()
  i <- 1
  for (x_variable_name in x_variable_names) {
    charts[[i]] <- generate_chart(
      df = df,
      x_variable_name = x_variable_name
    )
    i <- i + 1
  }
  grid.arrange(
    charts[[1]],
    charts[[2]],
    charts[[3]],
    charts[[4]]
  )
}
