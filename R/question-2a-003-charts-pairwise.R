library(dplyr)
# Begin Exclude Linting
library(GGally)
# End Exclude Linting
####################################################
#                                                  #
# EXPORTED FUNCTIONS                               #
#                                                  #
####################################################
#' question_2a_003_charts_pairwise
#' @export
question_2a_003_charts_pairwise <- function(
  group_by_variable_name = "weather_station_name",
  scale = TRUE,
  latitude_category_as_factor = TRUE
) {
  data_frame <- question_2a_001_data(
    group_by_variable_name,
    scale,
    latitude_category_as_factor
  )
  data_frame_chart <- derive_chart_data_frame(
    data_frame
  )
  ggpairs(
    data_frame_chart,
    mapping = aes(color = latitude_category)
  )
}
####################################################
#                                                  #
# NON EXPORTED FUNCTIONS (A-Z)                     #
#                                                  #
####################################################
derive_chart_data_frame <- function(data_frame) {
  data_frame %>%
    select(
      latitude_category,
      hours_sun,
      latitude,
      longitude,
      rain_mm,
      temp_max_degrees_c,
      temp_min_degrees_c
    )
}
