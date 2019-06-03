library(dplyr)
library(ggplot2)
library(gridExtra)
####################################################
#                                                  #
# EXPORTED FUNCTIONS (A-Z                          #
#                                                  #
####################################################
#' question_1b_005_charts_cluster_k2_latitude
#' @export
question_1b_005_charts_cluster_k2_latitude <- function() {
  cluster_results <- question_1b_003_kmeans()
  generate_latitude_charts_with_cluster_colour(
    cluster_results$data_frame,
    c(
      "hours_sun",
      "rain_mm",
      "temp_max_degrees_c",
      "temp_min_degrees_c"
    ),
    "cluster_2"
  )
}
