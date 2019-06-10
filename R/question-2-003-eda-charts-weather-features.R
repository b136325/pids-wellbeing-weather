library(dplyr)
library(ggplot2)
# Begin Exclude Linting
library(gridExtra)
# End Exclude Linting
library(magrittr)
####################################################
#                                                  #
# EXPORTED FUNCTIONS (A-Z                          #
#                                                  #
####################################################
#' question_2_003_eda_charts_weather_features
#' @export
question_2_003_eda_charts_weather_features <- function(
  df = data_frame <- question_2_001_bu_append_latitude_categories()
) {
  generate_latitude_category_correlation_charts(
    df,
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
