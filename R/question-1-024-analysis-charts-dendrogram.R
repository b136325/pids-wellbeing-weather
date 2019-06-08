library(factoextra)
####################################################
#                                                  #
# EXPORTED FUNCTION                                #
#                                                  #
####################################################
#' qquestion_1_024_analysis_charts_dendrogram
#' @export
question_1_024_analysis_charts_dendrogram <- function(
  hc = question_1_023_analysis_hierarchical()$hc,
  k_value = 3
) {
  fviz_dend(
    hc,
    k = k_value,
    rect = TRUE
  )
}
