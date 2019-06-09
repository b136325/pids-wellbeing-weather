library(xtable)
####################################################
#                                                  #
# EXPORTED FUNCTION                                #
#                                                  #
####################################################
#' question_3_009_eval_regression_summary
#' @export
question_3_009_eval_regression_summary <- function(
  df = question_3_007_analysis_regression()
) {
  summary(df)
}

#' question_3_009_eval_regression_summary_latex
#' @export
question_3_009_eval_regression_summary_latex <- function(
  df = question_3_009_eval_regression_summary()
) {
  xtable(df)
}
