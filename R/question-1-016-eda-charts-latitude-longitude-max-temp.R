library(dplyr)
library(ggplot2)
library(magrittr)
library(plotly)
####################################################
#                                                  #
# EXPORTED FUNCTIONS (A-Z                          #
#                                                  #
####################################################
#' question_1_016_eda_charts_latitude_longitude_max_temp
#'
#' Generate scatterplot charts comparing rain mm with both latitude and longitude.
#' @usage
#' question_1_016_eda_charts_latitude_longitude_max_temp()
#' @export
question_1_016_eda_charts_latitude_longitude_max_temp <- function() {
  plot_ly(
    question_1_011_eda_remove_outliers(scale = FALSE),
    x = ~temp_max_degrees_c,
    y = ~longitude,
    z = ~latitude,
    marker = list(
      color = ~temp_max_degrees_c,
      colorscale = c("#0033CC", "#CCD9ff"),
      showscale = TRUE
    )
  ) %>%
    add_markers() %>%
    layout(
      scene = list(
        xaxis = list(title = "Max temp (degrees c)"),
        yaxis = list(title = "Longitude"),
        zaxis = list(title = "Latitude")
      )
    )
}
