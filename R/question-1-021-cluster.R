library(cluster)
library(dplyr)
####################################################
#                                                  #
# EXPORTED FUNCTION                                #
#                                                  #
####################################################
#' question_1_021_cluster
#' @export
question_1_021_cluster <- function(
  k_max = MAX_NUM_K,
  metric = "euclidean",
  seed = SEED_DEFAULT
) {
  data_frame <-  question_1_010_remove_outliers()
  perform_cluster_repeat(
    data_frame,
    k_max,
    metric,
    seed
  )
}
####################################################
#                                                  #
# NON EXPORTED FUNCTIONS (A-Z)                     #
#                                                  #
####################################################
perform_cluster <- function(
  data_frame,
  k_value,
  metric, 
  seed
) {
  set.seed(seed)
  pam(
    x = select_weather_features(
      data_frame,
      weather_stations_as_row_names = TRUE
    ),
    k = k_value,
    metric = metric
  )
}

perform_cluster_repeat <- function(
  data_frame,
  k_max,
  metric,
  seed
) {
  cluster_results <- list()
  for (i in 1:k_max) {
    cluster_result <- perform_cluster(
      data_frame,
      i,
      metric,
      seed
    )
    cluster_results[[i]] <- cluster_result
    column_name <- paste0("cluster_", i)
    data_frame[[column_name]] <- as.factor(
      cluster_result$cluster
    )
  }
  results <- list()
  results$data_frame <- data_frame
  results$cluster_results <- cluster_results
  results
}
