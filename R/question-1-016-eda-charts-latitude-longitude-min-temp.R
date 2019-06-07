library(dplyr)
library(ggplot2)
library(plotly)
####################################################
#                                                  #
# EXPORTED FUNCTIONS (A-Z                          #
#                                                  #
####################################################
#' question_1_016_eda_charts_latitude_longitude_max_temp
#' 
#' Generate scatterplot charts comparing max_temp with both latitude and longitude.
#' @examples
#' question_1_016_eda_charts_latitude_longitude_max_temp()
#' @export
question_1_016_eda_charts_latitude_longitude_min_temp <- function() {
  plot_ly(
    question_1_010_remove_outliers(scale = FALSE),
    x = ~temp_min_degrees_c,
    y = ~longitude,
    z = ~latitude,
    marker = list(
      color = ~temp_min_degrees_c,
      colorscale = c("#0033CC", "#CCD9ff"),
      showscale = TRUE
    )
  ) %>%
    add_markers() %>%
    layout(
      scene = list(
        xaxis = list(title = "Min temp (degrees c)"),
        yaxis = list(title = "Longitude"),
        zaxis = list(title = "Latitude")
      )
    )
}
