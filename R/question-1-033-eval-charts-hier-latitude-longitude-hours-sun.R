library(dplyr)
library(ggplot2)
library(plotly)
####################################################
#                                                  #
# EXPORTED FUNCTIONS (A-Z                          #
#                                                  #
####################################################
#' question_1_033_eval_charts_hier_latitude_longitude_hours_sun
#' @export
question_1_033_eval_charts_hier_latitude_longitude_hours_sun <- function(
  df = question_1_025_analysis_attach_pruned_cluster_values(),
  x_axis_title = "Hours sunshine",
  y_axis_title = "Longitude",
  z_axis_title = "Latitude"
) {
  plot_ly(
    df,
    x = ~hours_sun,
    y = ~longitude,
    z = ~latitude,
    marker = list(
      color = ~cluster,
      ccolors = ~setNames(cluster, cluster)
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
