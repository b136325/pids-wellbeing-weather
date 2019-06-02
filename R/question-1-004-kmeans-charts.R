library(dplyr)
library(ggplot2)
library(gridExtra)
####################################################
#                                                  #
# EXPORTED FUNCTIONS (A-Z                          #
#                                                  #
####################################################
#' question_1_004_kmeans_charts
#' @export
question_1_004_kmeans_charts <- function() {
  data_frame <- question_1_003_kmeans()$data_frame
  generate_latitude_charts(
    data_frame,
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
        y = latitude,
        color = !!sym(cluster_variable_name)
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
