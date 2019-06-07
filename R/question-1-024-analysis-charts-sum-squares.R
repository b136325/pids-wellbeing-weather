library(ggplot2)
####################################################
#                                                  #
# EXPORTED FUNCTION                                #
#                                                  #
####################################################
#' question_1_024_analysis_charts_sum_squares
#' @export
question_1_024_analysis_charts_sum_squares <- function(
  sum_squares = question_1_023_analysis_kmeans()$sum_squares
) {
  df <- data.frame(
    k_values = 1:length(sum_squares),
    sum_squares = sum_squares
  )
  ggplot(
    data = df,
    aes(
      x = k_values,
      y = sum_squares
    )
  ) +
  geom_line() +
  geom_point()
}
