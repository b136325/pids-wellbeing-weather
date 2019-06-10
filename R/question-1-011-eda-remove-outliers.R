library(dplyr)
library(magrittr)
####################################################
#                                                  #
# EXPORTED FUNCTION                                #
#                                                  #
####################################################
#' question_1_011_eda_remove_outliers
#'
#' A function that removed 'outliers' (greater than 1.5 * the inerquartile range)
#' from the 'hours_sun' and the 'rain_mm" features.
#'
#' @param df An OPTIONAL data frame.
#'           Defaults to the result of load_technically_correct_data_frame().
#'
#' @param group_by_variable_name An OPTIONAL string describing the group_by feature.
#'                               Defaults to "weather_station_name".
#'
#' @param scale An OPTIONAL boolean flag, indicating whther or not the results should be scaled.
#'              Defaults to TRUE.
#'
#' @return Returns a data frame with the outliers removed.
#'
#' @usage pids.wellbeing.weather::question_1_011_eda_remove_outliers()
#' @export
question_1_011_eda_remove_outliers <- function(
  df = load_technically_correct_data_frame(),
  group_by_variable_name = "weather_station_name",
  scale = TRUE
) {
  df_updated_hours_sun <-
    replace_outliers_with_mean_all_weather_stations(
      df,
      "hours_sun"
    )
  df$hours_sun <- df_updated_hours_sun$hours_sun
  df_updated_rain_mm <-
    replace_outliers_with_mean_all_weather_stations(
      df,
      "rain_mm"
    )
  df$rain_mm <- df_updated_rain_mm$rain_mm
  df <- group_by_variable(
    df,
    group_by_variable_name
  )
  if (scale) {
    df <- rescale_data_frame(df)
  }
  df
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
  df,
  feature_name
) {
  unique_weather_stations <- levels(
    as.factor(
      df$weather_station_name
    )
  )
  df_updated <- df[FALSE, ]
  for (unique_weather_station in unique_weather_stations) {
    df_updated <- bind_rows(
      replace_outliers_with_mean_by_weather_station(
        df,
        feature_name,
        unique_weather_station
      ),
      df_updated
    )
  }
  if (nrow(df) != nrow(df_updated)) {
    stop("Unequal df lengths.")
  }
  df_updated
}

replace_outliers_with_mean_by_weather_station <- function(
  df,
  feature_name,
  unique_weather_station
) {
  df %>%
    filter(
      weather_station_name == unique_weather_station
    ) %>%
    mutate_at(
      c(feature_name),
      replace_outliers_with_mean
    )
}
