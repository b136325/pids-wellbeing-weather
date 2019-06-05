library(dplyr)
library(randomForest)
####################################################
#                                                  #
# EXPORTED FUNCTION                                #
#                                                  #
####################################################
#' question_1c_001_feature_selection
#' @export
question_1c_001_feature_selection <- function(
) {
  results <- list()
  data_frame <- question_1b_001_data() %>%
    scale_data_frame_features(
      c("latitude", "longitude")
    )
  results$latitude <- importance(
    randomForest(
      latitude~.,
      data = random_forest_feature_selection(
        data_frame,
        "latitude"
      )
    )
  )
  results$longitude <- importance(
    randomForest(
      longitude~.,
      data = random_forest_feature_selection(
        data_frame,
        "longitude"
      )
    )
  )
  results
}
####################################################
#                                                  #
# NON EXPORTED FUNCTIONS (A-Z)                     #
#                                                  #
####################################################
random_forest_feature_selection <- function(
  data_frame,
  response_variable_name
) {
  data_frame %>%
    select(
      !!sym(response_variable_name),
      hours_sun,
      rain_mm,
      temp_max_degrees_c,
      temp_min_degrees_c
    )
}

scale_data_frame_features <- function(
  data_frame,
  feature_names
) {
  data_frame %>%
    mutate_at(
      feature_names,
      scale
    )
}
