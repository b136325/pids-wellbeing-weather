library(cluster)
library(dplyr)
####################################################
#                                                  #
# EXPORTED FUNCTION                                #
#                                                  #
####################################################
#' question_1_026_analysis_kmeans
#' @export
question_1_026_analysis_kmeans <- function(
  df = question_1_011_eda_remove_outliers(scale = TRUE),
  k_max = MAX_NUM_K,
  num_iterations = MAX_NUM_ITERATIONS,
  seed = SEED_DEFAULT
) {
  perform_kmeans_repeat(
    df,
    k_max,
    num_iterations,
    seed
  )
}
####################################################
#                                                  #
# NON EXPORTED FUNCTIONS (A-Z)                     #
#                                                  #
####################################################
perform_kmeans <- function(
  df,
  k_value,
  num_iterations,
  num_starting_centers,
  seed
) {
  set.seed(seed)
  df_selected <- select_weather_features(df)
  kmeans(
    x = df_selected,
    centers = k_value,
    iter.max = num_iterations,
    nstart = num_starting_centers
  )
}

perform_kmeans_repeat <- function(
  df,
  k_max,
  num_iterations,
  seed
) {
  cluster_results <- list()
  sum_squares <- list()
  for (i in 1:k_max) {
    cluster_result <- perform_kmeans(
      df = df,
      k_value = i,
      num_iterations = num_iterations,
      num_starting_centers = i,
      seed = seed
    )
    cluster_results[[i]] <- cluster_result
    sum_squares[[i]] <- cluster_result$tot.withinss
    column_name <- paste0("cluster_", i)
    df[[column_name]] <- as.factor(
      cluster_result$cluster
    )
  }
  results <- list()
  results$df <- df
  results$cluster_results <- cluster_results
  results$sum_squares <- as.double(sum_squares)
  results
}
