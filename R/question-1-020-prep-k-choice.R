library(NbClust)
####################################################
#                                                  #
# EXPORTED FUNCTION                                #
#                                                  #
####################################################
#' question_1_020_prep_k_choice
#' @export
question_1_020_prep_k_choice <- function(
  df = question_1_011_eda_remove_outliers(
    scale = TRUE
  ),
  distance = "euclidean",
  k_max = MAX_NUM_K,
  k_min = MIN_NUM_K,
  method_clusters = c("centroid", "average", "complete", "kmeans"),
  method_dist = "euclidean",
  show_chart = TRUE,
  verbose = FALSE
) {
  df_selected <- select_weather_features(
    df,
    weather_features_as_row_names = TRUE
  )
  clusters <- list()
  k_values <- integer()
  for (method_cluster in method_clusters) {
    cluster <- derive_k(
      df_selected,
      k_max,
      k_min,
      method_cluster,
      method_dist
    )
    k_values <- append(
      k_values,
      cluster$k_value
    )
    clusters <- append(
      clusters,
      cluster
    )
  }
  if (!verbose) {
    return(
      ceiling(
        mean(k_values)
      )
    )
  } else {
    return(clusters)
  }
}
####################################################
#                                                  #
# NON EXPORTED FUNCTION                            #
#                                                  #
####################################################
derive_k <- function(
  df,
  k_max,
  k_min,
  method_cluster,
  method_dist
) {
  sink("aux");
  result <- list()
  clust <- NbClust(
    df,
    distance = method_dist,
    min.nc = k_min,
    max.nc = k_max,
    method = method_cluster
  )
  sink(NULL);
  k_value <- length(
    unique(
      clust$Best.partition
    )
  )
  result$clust <- clust
  result$k_value <- k_value
  result
}
