library(dplyr)
library(ggplot2)
library(plotly)
####################################################
#                                                  #
# EXPORTED FUNCTIONS (A-Z                          #
#                                                  #
####################################################
#' question_1_035_eval_charts_hier_latitude_longitude_max_temp
#' @export
question_1_035_eval_charts_hier_latitude_longitude_max_temp <- function(
  df = question_1_025_analysis_attach_pruned_cluster_values(),
  x_axis_title = "Max temperature (degrees c)",
  y_axis_title = "Longitude",
  z_axis_title = "Latitude"
) {
  plot_ly(
    df,
    x = ~temp_max_degrees_c,
    y = ~longitude,
    z = ~latitude,
    marker = list(
      color = ~temp_max_degrees_c,
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
