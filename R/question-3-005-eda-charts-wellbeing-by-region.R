####################################################
#                                                  #
# EXPORTED FUNCTIONS (A-Z                          #
#                                                  #
####################################################
#' question_3_005_eda_charts_wellbeing_by_region
#' @export
question_3_005_eda_charts_wellbeing_by_region <- function(
  df = question_3_003_svc_cons_join_weather_wellbeing()
) {
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
      "region",
      "happiness",
      as.double(
        min(
          data_frame$happiness
        )
      ),
      as.double(
        max(
          data_frame$happiness
        )
      )
    )
}
