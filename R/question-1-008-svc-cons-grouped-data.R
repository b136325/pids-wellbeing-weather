library(dplyr)
library(scales)
####################################################
#                                                  #
# EXPORTED FUNCTION                                #
#                                                  #
####################################################
#' question_1_008_svc_cons_grouped_data
#' @param group_by_variable_name Defines the group by variable. String. Defaults to "weather_station_name"
#' @param scale Whether or not the data should be scaled. Boolean. Defaults to TRUE.
#' @examples
#' question_1_008_svc_cons_grouped_data()
#' question_1_008_svc_cons_grouped_data(scale = FALSE)
#' question_1_008_svc_cons_grouped_data(group_by_variable_name = "some_variable")
#' @export
question_1_008_svc_cons_grouped_data <- function(
  group_by_variable_name = "weather_station_name",
  scale = TRUE
) {
  data_frame <- group_by_variable(
    load_technically_correct_data_frame(),
    group_by_variable_name
  )
  if (scale) {
    data_frame <- rescale_data_frame(data_frame)
  }
  data_frame
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
  df %>%
    group_by(
      !!sym(group_by_variable_name)
    ) %>%
    summarise(
      hours_sun = mean(hours_sun),
      latitude = min(latitude),
      longitude = min(longitude),
      rain_mm = mean(rain_mm),
      temp_max_degrees_c = mean(temp_max_degrees_c),
      temp_min_degrees_c = mean(temp_min_degrees_c)
    )
}

rescale_data_frame <- function(data_frame) {
  cbind(
    data_frame %>% select(
      temp_max_degrees_c,
      temp_min_degrees_c,
      rain_mm,
      hours_sun,
    ) %>% mutate_each(rescale),
    data_frame %>% select(
      weather_station_name,
      latitude,
      longitude
    )
  )
}
