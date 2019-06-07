####################################################
#                                                  #
# EXPORTED FUNCTIONS (A-Z                          #
#                                                  #
####################################################
#' question_3a_007_charts_predicted_happiness_by_weather_station
#' @export
question_3a_007_charts_predicted_happiness_by_weather_station <- function() {
  data_frame <- question_3a_006_regression_test()
  # Begin Exclude Linting
  data_frame <- arrange(data_frame, desc(`slatitude`))
  # End Exclude Linting
  data_frame %>%
    # Begin Exclude Linting
    generate_latitude_charts_with_cluster_colour(
    # End Exclude Linting  
      c(
        "hours_sun",
        "rain_mm",
        "temp_max_degrees_c",
        "temp_min_degrees_c"
      ),
      "weather_station_name",
      "predicted_happiness",
      as.double(
        min(
          data_frame$predicted_happiness
        )
      ),
      as.double(
        max(
          data_frame$predicted_happiness
        )
      )
    )
}
