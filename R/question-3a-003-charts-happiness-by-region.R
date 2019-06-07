####################################################
#                                                  #
# EXPORTED FUNCTIONS (A-Z                          #
#                                                  #
####################################################
# 'question_3a_003_charts_happiness_by_region
#' @export
question_3a_003_charts_happiness_by_region <- function() {
  data_frame <- question_3a_002_data_join()
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
