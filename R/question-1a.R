library(dplyr)
library(ggplot2)
library(scales)
####################################################
#                                                  #
# EXPORTED FUNCTION                                #
#                                                  #
####################################################
#' question_1a
#' @export
question_1a <- function() {
  data_frame <- load_question_1a_data_frame()
  perform_k_means(
    data_frame,
    k_value = 3,
    num_iterations = 100,
    seed = 20,
    month = 1
  )
}

#' question_1a_charts_box_whisker
#' @export
question_1a_charts_box_whisker <- function() {
  data_frame <- load_question_1a_data_frame()
  data_frame_rescaled <- rescale_data_frame(data_frame)
  heathrow <- data_frame_rescaled %>% filter(
    weather_station_name == "heathrow"
  )
  ggplot(
    heathrow,
    aes(
      x = as.factor(observation_month),
      y = temp_max_degrees_c,
    )
  ) + geom_boxplot()
}

#' question_1a_charts_latitude_comparisons
#' @export
question_1a_charts_latitude_comparisons <- function() {
  data_frame <- load_question_1a_data_frame()
  data_frame_grouped <- group_by_weather_station(
    data_frame
  )
  generate_latitude_charts(
    data_frame_grouped,
    c(
      "hours_sun",
      "rain_mm",
      "temp_max_degrees_c",
      "temp_min_degrees_c"
    ),
    "weather_station_name"
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

generate_latitude_chart <- function(
  data_frame,
  x_variable_name,
  cluster_variable_name
) {
  data_frame %>%
    ggplot(
      aes(
        x = !!sym(x_variable_name),
        y = latitude,
        color = !!sym(cluster_variable_name)
      )
    ) + geom_point() + ylim(50, 60)
}

generate_latitude_charts <- function(
  data_frame,
  x_variable_names,
  cluster_variable_name
) {
  charts <- list()
  i <- 1
  for (x_variable_name in x_variable_names) {
    charts[[i]] <- generate_latitude_chart(
      data_frame,
      x_variable_name,
      cluster_variable_name
    )
    i <- i + 1
  }
  grid.arrange(
    charts[[1]],
    charts[[2]],
    charts[[3]],
    charts[[4]]
  )
}

generate_question_1a_data_frame_path <- function() {
  paste0(
    DIR_TECHNICALLY_CORRECT_ALL,
    "/",
    WEATHER_ALL_DATA_FRAMES_NO_NAS
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

load_question_1a_data_frame <- function(
  data_frame_path = generate_question_1a_data_frame_path()
) {
  readRDS(data_frame_path)
}

perform_k_means <- function(
  data_frame,
  k_value,
  num_iterations,
  seed,
  month
) {
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
    x = data_frame_kmeans_features,
    centers = k_value,
    iter.max = num_iterations,
    nstart = k_value
  )
  data_frame_by_month$cluster <- as.factor(
    clusters$cluster
  )
  generate_latitude_charts(
    data_frame_by_month,
    c(
      "hours_sun",
      "rain_mm",
      "temp_max_degrees_c",
      "temp_min_degrees_c"
    ),
    "cluster"
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
