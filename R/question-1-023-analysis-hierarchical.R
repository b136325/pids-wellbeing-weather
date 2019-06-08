####################################################
#                                                  #
# EXPORTED FUNCTION                                #
#                                                  #
####################################################
#' question_1_023_analysis_hierarchical
#' @export
question_1_023_analysis_hierarchical <- function(
  df = question_1_011_eda_remove_outliers(scale = TRUE),
  method_cluster = "average",
  method_dist = "euclidean"
) {
  df_selected <- select_weather_features(
    df,
    weather_features_as_row_names = TRUE
  )
  results <- list()
  results$dist <- dist(
    x = df_selected,
    method = method_dist
  )
  results$hc <- hclust(
    results$dist,
    method_cluster
  )
  results
}
