####################################################
#                                                  #
# EXPORTED FUNCTIONS (A-Z                          #
#                                                  #
####################################################
question_3a_003_latitude_by_happiness_with_region <- function() {
  question_3a_002_data_join() %>%
    generate_latitude_charts_with_cluster_colour(
      c(
        "hours_sun",
        "rain_mm",
        "temp_max_degrees_c",
        "temp_min_degrees_c"
      ),
      "region",
      "latitude_mean"
    )
}
