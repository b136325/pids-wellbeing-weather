library(mclust)
####################################################
#                                                  #
# EXPORTED FUNCTION                                #
#                                                  #
####################################################
#' question_1c_003_charts_density_bic
#' @export
question_1c_003_charts_density_bic <- function(
) {
  plot(
    question_1c_001_density_estimation(), 
    what = "BIC"
  )
}
