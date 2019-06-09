library(dplyr)
####################################################
#                                                  #
# EXPORTED FUNCTION                                #
#                                                  #
####################################################
#' question_3_008_analysis_regression_test
#' @export
question_3_008_analysis_regression_test <- function(
  df_test = question_3_002_svc_cons_weather_add_boundaries(),
  model = question_3_007_analysis_regression()
) {
  df_test$predicted_happiness <- predict(
    model,
    df_test %>%
      select(
        hours_sun,
        rain_mm,
        temp_max_degrees_c,
        temp_min_degrees_c
      )
  )
  df_test
}
