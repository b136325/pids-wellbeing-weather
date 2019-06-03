####################################################
#                                                  #
# EXPORTED FUNCTION                                #
#                                                  #
####################################################
#' question_1b_003_kmeans
#' @export
question_1b_003_kmeans <- function(
  k_max = MAX_NUM_K,
  num_iterations = MAX_NUM_ITERATIONS,
  seed = SEED_DEFAULT
) {
  perform_k_means_repeat(
    question_1b_001_data(),
    k_max,
    num_iterations,
    seed,
    filter = filter_for_kmeans_all
  )
}