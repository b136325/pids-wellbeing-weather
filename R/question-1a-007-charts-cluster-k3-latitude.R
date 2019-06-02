####################################################
#                                                  #
# EXPORTED FUNCTIONS (A-Z                          #
#                                                  #
####################################################
#' question_1a_007_charts_cluster_k3_latitude
#' @export
question_1a_007_charts_cluster_k3_latitude <- function() {
  cluster_results <- question_1a_004_kmeans()
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
