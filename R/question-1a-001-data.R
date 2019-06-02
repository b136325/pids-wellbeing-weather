library(dplyr)
library(scales)
####################################################
#                                                  #
# EXPORTED FUNCTION                                #
#                                                  #
####################################################
#' question_1a_001_data
#' @export
question_1a_001_data <- function(scale = TRUE) {
  data_frame <- load_technically_correct_data_frame()
  data_frame <- group_by_weather_station(
    data_frame
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
group_by_weather_station <- function(data_frame) {
  data_frame %>%
    group_by(
      weather_station_name
    ) %>%
    summarize(
      temp_max_degrees_c = mean(temp_max_degrees_c),
      temp_min_degrees_c = mean(temp_min_degrees_c),
      rain_mm = mean(rain_mm),
      hours_sun = mean(hours_sun),
      latitude = min(latitude),
      longitude = min(longitude)
    )
}

rescale_data_frame <- function(data_frame) {
  cbind(
    data_frame %>% select(
      `temp_max_degrees_c`,
      `temp_min_degrees_c`,
      `rain_mm`,
      `hours_sun`,
    ) %>% mutate_each(rescale),
    data_frame %>% select(
      `weather_station_name`,
      `latitude`,
      `longitude`
    )
  )
}
