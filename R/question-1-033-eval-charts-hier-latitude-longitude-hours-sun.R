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
question_1_033_eval_charts_hier_latitude_longitude_hours_sun <- function() {
  plot_ly(
    question_1_025_analysis_attach_pruned_cluster_values(),
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
