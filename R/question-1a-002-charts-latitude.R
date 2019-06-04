library(dplyr)
library(ggplot2)
# Begin Exclude Linting
library(gridExtra)
# End Exclude Linting
####################################################
#                                                  #
# EXPORTED FUNCTIONS (A-Z                          #
#                                                  #
####################################################
#' question_1_002_charts_latitude
#' @export
question_1a_002_charts_latitude <- function() {
  generate_latitude_charts(
    question_1a_001_data(),
    c(
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
generate_latitude_chart <- function(
  data_frame,
  x_variable_name,
  cluster_variable_name
) {
  data_frame %>%
    ggplot(
      aes(
        x = !!sym(x_variable_name),
        y = latitude
      )
    ) + geom_point() + ylim(50, 60)
}

generate_latitude_charts <- function(
  data_frame,
  x_variable_names,
  cluster_variable_name
) {
  charts <- list()
  i <- 1
  for (x_variable_name in x_variable_names) {
    charts[[i]] <- generate_latitude_chart(
      data_frame,
      x_variable_name,
      cluster_variable_name
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
