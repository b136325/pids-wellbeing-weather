####################################################
#                                                  #
# EXPORTED FUNCTION                                #
#                                                  #
####################################################
#' question_1a_003_kmeans
#' @export
question_1a_003_kmeans <- function() {
  within_sum_squares <- list()
  data_frame <- question_1a_001_data()
  for (i in 1:5) {
    results <- perform_k_means(
      data_frame,
      k_value = i,
      num_iterations = 100,
      seed = 20
    )
    within_sum_squares[[i]] <- results$withinss
    column_name <- paste0("cluster_", i)
    data_frame[[column_name]] <- as.factor(
      results$cluster
    )
  }
  results <- list()
  results$data_frame <- data_frame
  results$within_sum_squares <- within_sum_squares
  results
}

####################################################
#                                                  #
# NON EXPORTED FUNCTIONS (A-Z)                     #
#                                                  #
####################################################
filter_for_kmeans <- function(data_frame) {
  as.data.frame(
    data_frame[, 1:4]
  )
}

perform_k_means <- function(
  data_frame,
  k_value,
  num_iterations,
  seed
) {
  data_frame <- filter_for_kmeans(
    data_frame
  )
  set.seed(seed)
  kmeans(
    x = data_frame,
    centers = k_value,
    iter.max = num_iterations,
    nstart = k_value
  )
}
