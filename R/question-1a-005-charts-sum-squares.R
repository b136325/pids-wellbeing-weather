library(dplyr)
library(ggplot2)
####################################################
#                                                  #
# EXPORTED FUNCTIONS                               #
#                                                  #
####################################################
#' question_1a_005_charts_sum_squares
#' @export
question_1a_005_charts_sum_squares <- function(
  k_max = MAX_NUM_K,
  num_iterations = MAX_NUM_ITERATIONS,
  seed = SEED_DEFAULT
) {
  cluster_results <- question_1a_004_kmeans(
    k_max,
    num_iterations,
    seed
  )
  generate_sum_squares_chart(
    cluster_results,
    k_max
  )
}
####################################################
#                                                  #
# NON EXPORTED FUNCTIONS                           #
#                                                  #
####################################################
generate_sum_squares_chart <- function(
  cluster_results,
  k_max
) {
  sum_squares <- cluster_results$sum_squares
  chart_data_frame <- data.frame(
    k = c(1:k_max),
    sum_squares = unlist(sum_squares)
  )
  ggplot(
    data = chart_data_frame,
    aes(
      x = k,
      y = sum_squares,
      group = 1
    )
  ) +
    geom_line(color = "blue") +
    geom_text(
      aes(
        label = k
      )
    )
}
