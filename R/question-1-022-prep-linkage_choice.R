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
  linkage_types = c(
    "average",
    "centroid",
    "complete",
    "single",
    "ward.D",
    "ward.D2"
  ),
  distance_types = c(
    "euclidean",
    "manhattan"
  )
) {
  cophenetic_cors <- double()
  # Begin Exclude Linting
  distance_types_per_linkage_type <- character()
  # End Exclude Linting
  for (distance_type in distance_types) {
    for (linkage_type in linkage_types) {
      cophenetic_cor <- generate_cophenetic_correlation(
        df = df,
        method_cluster = linkage_type,
        method_dist = distance_type
      )
      # Begin Exclude Linting
      cophenetic_cors <- append(
        cophenetic_cors,
        cophenetic_cor
      )
      distance_types_per_linkage_type <- append(
        distance_types_per_linkage_type,
        distance_type
      )
      # End Exclude Linting
    }
  }
  df <- data.frame(
    # Begin Exclude Linting
    distance_types = distance_types_per_linkage_type,
    # End Exclude Linting
    linkage_types,
    cophenetic_cors,
    cophenetic_cors_3sf = round(cophenetic_cors, 3)
  )
  df[order(desc(df$cophenetic_cors)), ]
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
      average_results$hc
    )
  )
}
