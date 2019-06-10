library(dplyr)
library(magrittr)
library(rlang)
library(scales)
####################################################
#                                                  #
# EXPORTED FUNCTION                                #
#                                                  #
####################################################
#' question_1_008_svc_cons_grouped_data
#'
#'A function that returns 'consistently correct' data grouped by weather station.
#'
#' @param df An OPTIONAL data frame.
#'           Deafults to load_technically_correct_data_frame().
#'
#' @param group_by_variable_name Defines the group by variable. String.
#'
#'        Defaults to "weather_station_name"
#'
#' @param scale Whether or not the data should be scaled. Boolean.
#'              Defaults to TRUE.
#' @usage
#' question_1_008_svc_cons_grouped_data()
#' question_1_008_svc_cons_grouped_data(scale = FALSE)
#' question_1_008_svc_cons_grouped_data(group_by_variable_name = "some_variable")
#' @export
question_1_008_svc_cons_grouped_data <- function(
  df = load_technically_correct_data_frame(),
  group_by_variable_name = "weather_station_name",
  scale = TRUE
) {
  df_grouped <- group_by_variable(
    df,
    group_by_variable_name
  )
  if (scale) {
    df_grouped <- rescale_data_frame(df_grouped)
  }
  df_grouped
}
####################################################
#                                                  #
# NON EXPORTED FUNCTIONS (A-Z)                     #
#                                                  #
####################################################
group_by_variable <- function(
  df,
  group_by_variable_name
) {
  df$weather_station_name <- as.factor(
    df$weather_station_name
  )
  df <- df %>%
    group_by(weather_station_name) %>%
    summarise(
      hours_sun = mean(hours_sun),
      latitude = min(latitude),
      longitude = min(longitude),
      rain_mm = mean(rain_mm),
      temp_max_degrees_c = mean(temp_max_degrees_c),
      temp_min_degrees_c = mean(temp_min_degrees_c)
    )
  print(
    head(df)
  )
  df
}

rescale_data_frame <- function(df) {
  cbind(
    df %>% select(
      temp_max_degrees_c,
      temp_min_degrees_c,
      rain_mm,
      hours_sun,
    ) %>% mutate_each(rescale),
    df %>% select(
      weather_station_name,
      latitude,
      longitude
    )
  )
}
