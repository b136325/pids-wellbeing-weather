library(xtable)
####################################################
#                                                  #
# EXPORTED FUNCTIONS (A-Z                          #
#                                                  #
####################################################
#' question_3_004_svc_cons_weather_wellbeing_summary
#' @export
question_3_004_svc_cons_weather_wellbeing_summary <- function(
  df = question_3_003_svc_cons_weather_wellbeing_join()
) {
  df %>%
    group_by(region) %>%
    select(
      happiness,
      hours_sun,
      latitude = latitude_mean,
      longitude = longitude_mean,
      rain_mm,
      temp_max_degrees_c,
      temp_min_degrees_c
    )
}

question_3_004_svc_cons_weather_wellbeing_summary_latex <- function(
  df = question_3_004_svc_cons_weather_wellbeing_summary()
) {
  xtable(df)
}
