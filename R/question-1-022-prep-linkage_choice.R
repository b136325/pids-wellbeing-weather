library(cluster)
library(dplyr)
####################################################
#                                                  #
# EXPORTED FUNCTION                                #
#                                                  #
####################################################
#' question_1_022_linkage_choice
#' @export
question_1_022_linkage_choice <- function(
  df = question_1_011_eda_remove_outliers(scale = TRUE),
  method_clusters = c("average", "centroid", "complete", "single", "ward"),
  method_dist = "euclidean"
) {
  cophenetic_cors <- double()
  for (method_cluster in method_clusters) {
    cophenetic_cor <- generate_cophenetic_correlation(
      df,
      method_cluster,
      method_dist
    )
    cophenetic_cors <- append(
      cophenetic_cors,
      cophenetic_cor
    )
  }
  data.frame(
    method_clusters,
    cophenetic_cors
  )
}
####################################################
#                                                  #
# MON EXPORTED FUNCTION                            #
#                                                  #
####################################################
generate_cophenetic_correlation <- function(
  df,
  method_cluster,
  method_dist
) {
  average_results <- question_1_023_analysis_hierarchical(
    df = df,
    method_cluster = method_cluster,
    method_dist = method_dist
  )
  cor(
    average_results$dist,
    cophenetic(
      average_results$hclust
    )
  )
}
