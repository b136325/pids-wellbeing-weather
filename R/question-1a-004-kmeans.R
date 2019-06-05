####################################################
#                                                  #
# EXPORTED FUNCTION                                #
#                                                  #
####################################################
#' question_1a_004_kmeans
#' @export
question_1a_004_kmeans <- function(
  k_max = MAX_NUM_K,
  num_iterations = MAX_NUM_ITERATIONS,
  seed = SEED_DEFAULT
) {
  perform_k_means_repeat(
    question_1a_001_data(),
    k_max,
    num_iterations,
    seed,
    filter = filter_for_kmeans_all
  )
}

####################################################
#                                                  #
# NON EXPORTED FUNCTIONS (A-Z)                     #
#                                                  #
####################################################
filter_for_kmeans_all <- function(data_frame) {
  as.data.frame(
    data_frame[, 1:4]
  )
}

perform_k_means <- function(
  data_frame,
  k_value,
  num_iterations,
  seed,
  filter,
  nstart = 50
) {
  data_frame <- filter_for_kmeans_all(
    data_frame
  )
  set.seed(seed)
  result <- kmeans(
    x = data_frame,
    centers = k_value,
    iter.max = num_iterations,
    nstart = nstar
  )
}

perform_k_means_repeat <- function(
  data_frame,
  k_max,
  num_iterations,
  seed,
  filter
) {
  sum_squares <- list()
  for (i in 1:k_max) {
    results <- perform_k_means(
      data_frame,
      k_value = i,
      num_iterations = num_iterations,
      seed = seed,
      filter
    )
    sum_squares[[i]] <- results$tot.withinss
    column_name <- paste0("cluster_", i)
    data_frame[[column_name]] <- as.factor(
      results$cluster
    )
  }
  results <- list()
  results$data_frame <- data_frame
  results$sum_squares <- sum_squares
  results
}
