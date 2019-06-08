library(dplyr)
library(ggplot2)
library(plotly)
####################################################
#                                                  #
# EXPORTED FUNCTIONS (A-Z                          #
#                                                  #
####################################################
#' question_1_036_eval_charts_hier_latitude_longitude_min_temp
#' @export
question_1_036_eval_charts_hier_latitude_longitude_min_temp <- function() {
  plot_ly(
    question_1_025_analysis_attach_pruned_cluster_values(),
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
