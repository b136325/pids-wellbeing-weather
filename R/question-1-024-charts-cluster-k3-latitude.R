####################################################
#                                                  #
# EXPORTED FUNCTIONS (A-Z                          #
#                                                  #
####################################################
#' question_1b_006_charts_cluster_k3_latitude
#' @export
question_1b_006_charts_cluster_k3_latitude <- function() {
  cluster_results <- question_1_021_kmeans()
  generate_latitude_charts_with_cluster_colour(
    cluster_results$data_frame,
    c(
      "hours_sun",
      "rain_mm",
      "temp_max_degrees_c",
      "temp_min_degrees_c"
    ),
    "cluster_3"
  )
}
