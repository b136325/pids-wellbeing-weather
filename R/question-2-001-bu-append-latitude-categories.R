library(dplyr)
library(magrittr)
####################################################
#                                                  #
# EXPORTED FUNCTION                                #
#                                                  #
####################################################
#' question_2_001_bu_append_latitude_categories
#' @export
question_2_001_bu_append_latitude_categories <- function(
  df = question_1_011_eda_remove_outliers(scale = TRUE),
  latitude_category_as_factor = TRUE
) {
  df_updated <- append_latitude_category(df)
  if (has_latitude_category_errors(df_updated)) {
    stop("Latitude category errors")
  }
  if (latitude_category_as_factor) {
    df_updated$latitude_category <- as.factor(
      df_updated$latitude_category
    )
  }
  df_updated
}
####################################################
#                                                  #
# NON EXPORTED FUNCTIONS (A-Z)                     #
#                                                  #
####################################################
append_latitude_category <- function(
  df,
  derive_category = derive_latitude_category
) {
  df %>%
    mutate(
      latitude_category = derive_category(
          latitude
      )
    )
}

derive_latitude_category <- function(latitudes) {
  latitude_categories <- character()
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
