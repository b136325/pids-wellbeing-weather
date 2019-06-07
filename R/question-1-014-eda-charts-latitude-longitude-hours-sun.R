library(dplyr)
library(ggplot2)
library(plotly)
####################################################
#                                                  #
# EXPORTED FUNCTIONS (A-Z                          #
#                                                  #
####################################################
#' question_1_014_eda_charts_latitude_longitude_hours_sun
#' 
#' Generate scatterplot charts comparing hours_sun with both latitude and longitude.
#' @examples
#' question_1_014_eda_charts_latitude_longitude_hours_sun()
#' @export
question_1_014_eda_charts_latitude_longitude_hours_sun <- function() {
  plot_ly(
    question_1_011_eda_remove_outliers(
      scale = FALSE
    ),
    x = ~hours_sun,
    y = ~longitude,
    z = ~latitude,
    marker = list(
      color = ~hours_sun,
      colorscale = c("#FFE1A1", "#683531"),
      showscale = TRUE
    )
  ) %>%
  add_markers() %>%
  layout(
    scene = list(
      xaxis = list(title = "Hours sunshine"),
      yaxis = list(title = "Longitude"),
      zaxis = list(title = "Latitude")
    )
  )
}
