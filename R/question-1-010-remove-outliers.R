library(dplyr)
####################################################
#                                                  #
# EXPORTED FUNCTION                                #
#                                                  #
####################################################
#' question_1_010_remove_outliers
#' @export
question_1_010_remove_outliers <- function(
  group_by_variable_name = "weather_station_name",
  scale = TRUE
) {
  data_frame <- load_technically_correct_data_frame()
  data_frame_updated_hours_sun <-
    replace_outliers_with_mean_all_weather_stations(
      data_frame,
      "hours_sun"
    )
  data_frame$hours_sun <- data_frame_updated_hours_sun$hours_sun
  data_frame_updated_rain_mm <-
    replace_outliers_with_mean_all_weather_stations(
      data_frame,
      "rain_mm"
    )
  data_frame$rain_mm <- data_frame_updated_rain_mm$rain_mm
  data_frame <- group_by_variable(
    data_frame,
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
replace_outliers_with_mean <- function(feature_values) {
  mean_value <- mean(feature_values)
  first_quartile <- as.double(
    quantile(feature_values)[2]
  )
  third_quartile <- as.double(
    quantile(feature_values)[4]
  )
  inter_quartile_range <- third_quartile - first_quartile
  outlier_range <- 1.5 * inter_quartile_range
  outlier_lower_bound <- first_quartile - outlier_range
  outlier_upper_bound <- third_quartile + outlier_range
  updated_feature_values <- double()
  for (feature_value in feature_values) {
    if (feature_value < outlier_lower_bound) {
      updated_feature_values <- append(
        updated_feature_values,
        mean_value
      )
    } else if (feature_value > outlier_upper_bound) {
      updated_feature_values <- append(
        updated_feature_values,
        mean_value
      )
    } else {
      updated_feature_values <- append(
        updated_feature_values,
        feature_value
      )
    }
  }
  updated_feature_values
}

replace_outliers_with_mean_all_weather_stations <- function(
  data_frame,
  feature_name
) {
  unique_weather_stations <- levels(
    as.factor(
      data_frame$weather_station_name
    )
  )
  data_frame_updated <- data_frame[FALSE, ]
  for (unique_weather_station in unique_weather_stations) {
    data_frame_updated <- bind_rows(
      replace_outliers_with_mean_by_weather_station(
        data_frame,
        feature_name,
        unique_weather_station
      ),
      data_frame_updated
    )
  }
  if (nrow(data_frame) != nrow(data_frame_updated)) {
    stop("Unequal data_frame lengths.")
  }
  data_frame_updated
}

replace_outliers_with_mean_by_weather_station <- function(
  data_frame,
  feature_name,
  unique_weather_station
) {
  data_frame %>%
    filter(
      weather_station_name == unique_weather_station
    ) %>%
    mutate_at(
      c(feature_name),
      replace_outliers_with_mean
    )
}
