library(dplyr)
####################################################
#                                                  #
# EXPORTED FUNCTION                                #
#                                                  #
####################################################
#' question_2a_001_data
#' @export
question_2a_001_data <- function(
  group_by_variable_name = "weather_station_name",
  scale = TRUE
) {
  data_frame <- question_1b_001_data(
    group_by_variable_name,
    scale
  )
  append_latitude_category(data_frame)
}
####################################################
#                                                  #
# NON EXPORTED FUNCTIONS (A-Z)                     #
#                                                  #
####################################################
append_latitude_category <- function(data_frame) {
  data_frame_updated <- data_frame %>%
    mutate(
      latitude_category = derive_latitude_category(
          latitude  
      )
    )
  if (has_latitude_category_errors(data_frame_updated)) {
    stop("Latitude category errors")
  }
  data_frame_updated
}

derive_latitude_category <- function(latitudes) {
  latitude_categories <- list()
  for (latitude in latitudes) {
    if (latitude >= LATITUDE_CATEGORY_BOTTOM_LOWER_BOUNDARY
        && latitude < LATITUDE_CATEGORY_BOTTOM_UPPER_BOUNDARY) {
      latitude_categories <- append(
        latitude_categories,
        "bottom"
      )
    } else if (latitude >= LATITUDE_CATEGORY_MIDDLE_LOWER_BOUNDARY
        && latitude < LATITUDE_CATEGORY_MIDDLE_UPPER_BOUNDARY) {
      latitude_categories <- append(
        latitude_categories,
        "middle"
      )      
    } else if (latitude >= LATITUDE_CATEGORY_TOP_LOWER_BOUNDARY
        && latitude < LATITUDE_CATEGORY_TOP_UPPER_BOUNDARY) {
      latitude_categories <- append(
        latitude_categories,
        "top"
      )     
    } else {
      latitude_categories <- append(
        latitude_categories,
        "error"
      )     
    }
  }
  latitude_categories
}

has_latitude_category_errors <- function(data_frame) {
  ("error" %in% data_frame$latitude_category)
}
