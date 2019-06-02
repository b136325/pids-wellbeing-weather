####################################################
#                                                  #
# EXPORTED FUNCTION                                #
#                                                  #
####################################################
#' question_1b_001_kmeans
#' @export
question_1b_001_kmeans <- function(
  k_max = MAX_NUM_K,
  num_iterations = MAX_NUM_ITERATIONS,
  seed = SEED_DEFAULT
) {
  perform_k_means_repeat(
    k_max,
    num_iterations,
    seed,
    filter = filter_for_kmeans_temp_rain
  )
}

####################################################
#                                                  #
# NON EXPORTED FUNCTIONS (A-Z)                     #
#                                                  #
####################################################
filter_for_kmeans_temp_rain <- function(data_frame) {
  as.data.frame(
    data_frame %>% select(
      temp_max_degrees_c,
      temp_min_degrees_c,
      rain_mm
    )
  )
}
