library(dplyr)
library(ggplot2)
library(plotly)
####################################################
#                                                  #
# EXPORTED FUNCTIONS (A-Z                          #
#                                                  #
####################################################
#' question_1_034_eval_charts_hier_latitude_longitude_rain_mm
#' @export
question_1_034_eval_charts_hier_latitude_longitude_rain_mm <- function() {
  plot_ly(
    question_1_025_analysis_attach_pruned_cluster_values(),
    x = ~rain_mm,
    y = ~longitude,
    z = ~latitude,
    marker = list(
      color = ~rain_mm,
      colorscale = c("#0033CC", "#CCD9ff"),
      showscale = TRUE
    )
  ) %>%
    add_markers() %>%
    layout(
      scene = list(
        xaxis = list(title = "Rain (mm)"),
        yaxis = list(title = "Longitude"),
        zaxis = list(title = "Latitude")
      )
    )
}
