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
#' question_2a_004_charts_correlation
#' @export
question_2a_004_charts_correlation <- function(
  group_by_variable_name = "weather_station_name",
  scale = TRUE,
  latitude_category_as_factor = TRUE
) {
  data_frame <- question_2a_001_data(
    group_by_variable_name,
    scale,
    latitude_category_as_factor
  )
  generate_latitude_category_correlation_charts(
    data_frame,
    c(
      "hours_sun",
      "rain_mm",
      "temp_max_degrees_c",
      "temp_min_degrees_c"
    ),
    "latitude_category"
  )
}
####################################################
#                                                  #
# NON EXPORTED FUNCTIONS (A-Z)                     #
#                                                  #
####################################################
generate_latitude_category_correlation_chart <- function(
  data_frame,
  x_variable_name,
  colour_variable_name = "latitude_category",
  y_variable_name = "latitude"

) {
  data_frame %>%
    ggplot(
      aes(
        x = !!sym(x_variable_name),
        y = !!sym(y_variable_name),
        color = !!sym(colour_variable_name)
      )
    ) + geom_point() + ylim(50, 60)
}

generate_latitude_category_correlation_charts <- function(
  data_frame,
  x_variable_names,
  cluster_variable_name
) {
  charts <- list()
  i <- 1
  for (x_variable_name in x_variable_names) {
    charts[[i]] <- generate_latitude_category_correlation_chart(
      data_frame = data_frame,
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
