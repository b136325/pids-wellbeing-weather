library(clValid)
library(dplyr)
####################################################
#                                                  #
# EXPORTED FUNCTION                                #
#                                                  #
####################################################
#' question_1_021_prep_algorithm_choice
#' @export
question_1_021_prep_algorithm_choice <- function(
  df = question_1_011_eda_remove_outliers(),
  cluster_methods = c(
    "hierarchical",
    "kmeans",
    "pam"
  ),
  cluster_validation_type = "internal",
  num_clusters = 2:3
) {
  df_selected <- select_weather_features(
    df,
    weather_features_as_row_names = TRUE
  )
  intern <- clValid(
    as.data.frame(df_selected),
    nClust = num_clusters,
    clMethods = cluster_methods,
    validation = cluster_validation_type
  )
  clValid::summary(intern)
}
