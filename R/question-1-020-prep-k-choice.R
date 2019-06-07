library(factoextra)
library(NbClust)
####################################################
#                                                  #
# EXPORTED FUNCTION                                #
#                                                  #
####################################################
#' question_1_020_prep_k_choice
#' @export
question_1_020_prep_k_choice <- function(
  df = question_1_011_eda_remove_outliers(scale = TRUE),
  distance = "euclidean",
  k_min = 2,
  k_max = 10,
  method = "complete"
) {
  df_selected <- select_weather_features(
    df,
    weather_features_as_row_names = TRUE
  )
  results <- NbClust(
    df_selected,
    distance = distance,
    min.nc = k_min,
    max.nc = k_max,
    method = method
  )
  factoextra::fviz_nbclust(results) + theme_minimal()
}
