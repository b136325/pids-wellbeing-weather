library(dplyr)
library(ggplot2)
library(scales)
####################################################
#                                                  #
# EXPORTED FUNCTION                                #
#                                                  #
####################################################
#' question_1a_analysis
#' @export
question_1a_analysis <- function() {
  data_frame <- load_question_1a_data_frame()
  perform_k_means(
    data_frame,
    k_value = 2,
    seed = 20,
    month = 1
  )
}
####################################################
#                                                  #
# NON EXPORTED FUNCTIONS (A-Z)                     #
#                                                  #
####################################################
filter_by_month <- function(data_frame, month) {
  data_frame %>%
  filter(
    observation_month == month
  )
}

filter_for_kmeans <- function(data_frame) {
  as.data.frame(
    data_frame[, 3:6]
  )
}
 
group_by_month_and_weather_station <- function(data_frame) {
  data_frame %>%
    group_by(
      weather_station_name,
      observation_month
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

perform_k_means <- function(data_frame, k_value, seed, month) {
  data_frame_rescaled <- rescale_data_frame(
    data_frame
  )
  data_frame_grouped <- group_by_month_and_weather_station(
    data_frame_rescaled
  )
  data_frame_by_month <- filter_by_month(
    data_frame_grouped,
    month
  )
  data_frame_kmeans_features <- filter_for_kmeans(
    data_frame_by_month
  )
  set.seed(seed)
  clusters <- kmeans(
    data_frame_kmeans_features,
    k_value
  )
  data_frame_by_month$cluster <- as.factor(
    clusters$cluster
  )
  print(
    data_frame_by_month
  )
}

rescale_data_frame <- function(data_frame_rescaled) {
  cbind(
    data_frame_rescaled %>% select(
      `temp_max_degrees_c`,
      `temp_min_degrees_c`,
      `rain_mm`,
      `hours_sun`,
    ) %>% mutate_each(rescale),
    data_frame_rescaled %>% select(
      `weather_station_name`,
      `observation_month`,
      `latitude`,
      `longitude`
    )
  )
}
