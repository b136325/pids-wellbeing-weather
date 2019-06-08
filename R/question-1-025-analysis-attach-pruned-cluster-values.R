####################################################
#                                                  #
# EXPORTED FUNCTION                                #
#                                                  #
####################################################
#' question_1_025_analysis_attach_pruned_cluster_values
#' @export
question_1_025_analysis_attach_pruned_cluster_values <- function(
  df = question_1_011_eda_remove_outliers(scale = TRUE),
  k_value = 3,
  method_cluster = "average",
  method_dist = "euclidean"
) {
  hc <- question_1_023_analysis_hierarchical(
    df = df,
    method_cluster = method_cluster,
    method_dist = method_dist
  )$hc
  df$cluster <- as.factor(
    cutree(
      hc, 
      k = k_value
    )
  )
  df
}
