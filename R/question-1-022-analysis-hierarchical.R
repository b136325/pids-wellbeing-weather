library(cluster)
library(dplyr)
####################################################
#                                                  #
# EXPORTED FUNCTION                                #
#                                                  #
####################################################
#' question_1_022_analysis_hierarchical
#' @export
question_1_022_analysis_hierarchical <- function(
  df = question_1_011_eda_remove_outliers(scale = TRUE),
  method_dist = "euclidean",
  method_cluster = "ward.D2"
) {
  df_selected <- select_weather_features(
    df,
    weather_features_as_row_names = TRUE
  )
  plot(
    hclust(
      dist(df_selected, method_dist),
      method_cluster
    )
  )
}
####################################################
#                                                  #
# NON EXPORTED FUNCTIONS (A-Z)                     #
#                                                  #
####################################################
