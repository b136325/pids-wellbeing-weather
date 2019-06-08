####################################################
#                                                  #
# EXPORTED FUNCTIONS (A-Z                          #
#                                                  #
####################################################
#' question_3_010_eval_charts_predicted_happiness
#' @export
question_3_010_eval_charts_predicted_happiness <- function(
  df = question_3_008_analysis_regression_test()
) {
  df <- arrange(df, desc(`slatitude`))
  df %>%
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
          df$predicted_happiness
        )
      ),
      as.double(
        max(
          df$predicted_happiness
        )
      )
    )
}
