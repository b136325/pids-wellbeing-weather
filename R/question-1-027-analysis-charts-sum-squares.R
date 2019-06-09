library(ggplot2)
####################################################
#                                                  #
# EXPORTED FUNCTION                                #
#                                                  #
####################################################
#' question_1_027_analysis_charts_sum_squares
#' @export
question_1_027_analysis_charts_sum_squares <- function(
  sum_squares = question_1_026_analysis_kmeans()$sum_squares,
  x_intercept = 3,
  x_intercept_line_type = 2,
  y_axis_title = "Sum of squares",
  x_axis_title = "Values of K"
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
  geom_vline(
    xintercept = x_intercept,
    linetype = x_intercept_line_type
  ) +
  geom_point() +
  labs(
    x = x_axis_title,
    y = y_axis_title
  )
}
