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
#' question_1_012_eda_charts_latitude
#' 
#' Generate scatterplot charts comparing weather variables with latitude.
#' @examples
#' question_1_012_eda_charts_latitude()
#' @export
question_1_012_eda_charts_latitude <- function() {
  generate_latitude_charts(
    question_1_010_remove_outliers(
      scale = FALSE
    ),
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
#' generate_latitude_chart
#' 
#' Generates a single scatterplot chart from a data_frame, comparing "x_variable_name" with "latitude".
#' @param data_frame A data_frame with "x_variable_name" and "latitude" features.
#' @param x_variable_name A string defining the name of the feature to be represent on the x-axis.
#' @param cluster_variable_name A string defining the clustering feature. Not being used at present.
#' @examples
#' generate_latitude_chart(data_frame = my_data_frame, x_variable_name = "x" cluster_variable_name = "region")
generate_latitude_chart <- function(
  data_frame,
  x_variable_name,
  cluster_variable_name,
  y_variable_name = "latitude"
) {
  data_frame %>%
    ggplot(
      aes(
        x = !!sym(x_variable_name),
        y = !!sym(y_variable_name)
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
