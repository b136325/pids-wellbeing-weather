library(dplyr)
library(ggplot2)
library(magrittr)
library(plotly)
####################################################
#                                                  #
# EXPORTED FUNCTIONS (A-Z                          #
#                                                  #
####################################################
#' question_1_034_eval_charts_hier_latitude_longitude_rain_mm
#' @export
question_1_034_eval_charts_hier_latitude_longitude_rain_mm <- function(
  df = question_1_025_analysis_attach_pruned_cluster_values(),
  x_axis_title = "Rain (mm)",
  y_axis_title = "Longitude",
  z_axis_title = "Latitude"
) {
  plot_ly(
    df,
    x = ~rain_mm,
    y = ~longitude,
    z = ~latitude,
    marker = list(
      color = ~rain_mm,
      colorscale = c("#0033CC", "#CCD9ff")
    )
  ) %>%
    add_markers() %>%
    layout(
      scene = list(
        xaxis = list(title = x_axis_title),
        yaxis = list(title = y_axis_title),
        zaxis = list(title = z_axis_title)
      )
    )
}
