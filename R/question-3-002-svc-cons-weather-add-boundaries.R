library(dplyr)
####################################################
#                                                  #
# EXPORTED FUNCTION                                #
#                                                  #
####################################################
#' question_3_002_svc_cons_weather_add_boundaries
#' @export
question_3_002_svc_cons_weather_add_boundaries <- function(
  df =  question_2_001_bu_append_latitude_categories(),
  num_boundaries = 10
) {
  append_happiness_latitude_category(
    df,
    build_happiness_latitude_category_boundaries(
      num_boundaries
    )
  )
}
####################################################
#                                                  #
# NON EXPORTED FUNCTIONS (A-Z)                     #
#                                                  #
####################################################
append_happiness_latitude_category <- function(
  data_frame,
  upper_boundaries
) {
  data_frame %>%
    mutate(
      happiness_latitude_category = derive_happiness_latitude_categories(
        latitude,
        upper_boundaries
      )
    ) %>%
    mutate(
      region = derive_region_by_weather_station_name(
        weather_station_name
      )
    )
}

build_happiness_latitude_category_boundaries <- function(
  num_boundaries,
  lower_boundary = LATITUDE_CATEGORY_BOTTOM_LOWER_BOUNDARY,
  upper_boundary = LATITUDE_CATEGORY_TOP_UPPER_BOUNDARY
) {
  diff <- upper_boundary - lower_boundary
  seq(
   lower_boundary,
   upper_boundary,
   diff / num_boundaries
  )
}

derive_happiness_latitude_categories <- function(
  latitudes,
  upper_boundaries
) {
  categories <- integer()
  for (latitude in latitudes) {
    i <- 0
    for (upper_boundary in upper_boundaries) {
      if (latitude <= upper_boundary) {
        categories <- append(
          categories,
          i
        )
        break
      }
      i <- i + 1
    }
  }
  categories
}

derive_region_by_weather_station_name <- function(
  weather_station_names
) {
  regions <- character()
  for (weather_station_name in weather_station_names) {
    regions <- append(
      regions,
      WEATHER_STATION_REGIONS[[weather_station_name]]
    )
  }
  regions
}
