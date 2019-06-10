library(dplyr)
library(ggplot2)
library(magrittr)
library(plotly)
####################################################
#                                                  #
# EXPORTED FUNCTIONS (A-Z                          #
#                                                  #
####################################################
#' question_1_036_eval_charts_hier_latitude_longitude_min_temp
#' @export
question_1_036_eval_charts_hier_latitude_longitude_min_temp <- function(
  df = question_1_025_analysis_attach_pruned_cluster_values(),
  x_axis_title = "Min temperature (degrees c)",
  y_axis_title = "Longitude",
  z_axis_title = "Latitude"
) {
  plot_ly(
    df,
    x = ~temp_min_degrees_c,
    y = ~longitude,
    z = ~latitude,
    marker = list(
      color = ~temp_min_degrees_c,
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
