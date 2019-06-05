library(mclust)
####################################################
#                                                  #
# EXPORTED FUNCTION                                #
#                                                  #
####################################################
#' question_1c_004_charts_density_contour
#' @export
question_1c_004_charts_density_contour <- function(
) {
  plot(
    question_1c_001_density_estimation(), 
    what = "density",
    type = "hdr"
  )
}
