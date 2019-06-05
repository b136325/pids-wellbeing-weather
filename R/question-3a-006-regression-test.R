library(dplyr)
####################################################
#                                                  #
# EXPORTED FUNCTION                                #
#                                                  #
####################################################
#' question_3a_006_regression_test
#' @export
question_3a_006_regression_test <- function() {
  model <- question_3a_004_regression_model()
  data_frame_test <- question_3a_001_data_weather()
  data_frame_test$predicted_happiness <- predict(
    model,
    data_frame_test %>%
      select(
        hours_sun,
        rain_mm,
        temp_max_degrees_c,
        temp_min_degrees_c
      )
  )
  data_frame_test
}
