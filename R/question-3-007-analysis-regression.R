library(dplyr)
####################################################
#                                                  #
# EXPORTED FUNCTION                                #
#                                                  #
####################################################
#' question_3_007_analysis_regression
#' @export
question_3_007_analysis_regression <- function(
  df_training = question_3_003_svc_cons_weather_wellbeing_join()
) {
  lm(
    happiness ~ hours_sun + rain_mm + temp_max_degrees_c + temp_min_degrees_c,
    df_training
  )
}
