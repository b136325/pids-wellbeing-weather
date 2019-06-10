library(dplyr)
library(magrittr)
####################################################
#                                                  #
# EXPORTED FUNCTION                                #
#                                                  #
####################################################
#' question_3_003_svc_cons_weather_wellbeing_join
#' @export
question_3_003_svc_cons_weather_wellbeing_join <- function(
  df_happiness = load_happiness_data_frame(),
  df_weather = question_3_002_svc_cons_weather_add_boundaries()
) {
  df_weather <- group_weather_data_frame_by_region(
    df_weather
  )
  join_happiness_with_weather_by_region(
    df_happiness,
    df_weather
  )
}
####################################################
#                                                  #
# NON EXPORTED FUNCTIONS (A-Z)                     #
#                                                  #
####################################################
group_weather_data_frame_by_region <- function(
  df_weather
) {
  df_weather %>%
    group_by(region) %>%
    summarise(
      hours_sun = mean(hours_sun),
      latitude_max = max(latitude),
      latitude_mean = mean(latitude),
      latitude_min = min(latitude),
      longitude_max = max(longitude),
      longitude_mean = mean(longitude),
      longitude_min = min(longitude),
      rain_mm = mean(rain_mm),
      temp_max_degrees_c = mean(temp_max_degrees_c),
      temp_min_degrees_c = mean(temp_min_degrees_c)
    )
}

join_happiness_with_weather_by_region <- function(
  df_happiness,
  df_weather
) {
  df_happiness %>%
    inner_join(df_weather)
}

load_happiness_data_frame <- function(
  happiness_rds_path = DATA_WELLBEING_HAPPINESS_PATH
) {
  readRDS(
    file = happiness_rds_path
  )
}
