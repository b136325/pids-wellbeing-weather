library(dplyr)
# Begin Exclude Linting
library(GGally)
# End Exclude Linting
####################################################
#                                                  #
# EXPORTED FUNCTIONS                               #
#                                                  #
####################################################
#' question_2_004_eda_charts_latitude_category_pairwise
#' TODO - Fix error
#' @export
question_2_004_eda_charts_latitude_category_pairwise <- function(
  df = question_2_001_bu_append_latitude_categories()
) {
  df_charts <- derive_chart_data_frame(df)
  plot(df_charts)
}
####################################################
#                                                  #
# NON EXPORTED FUNCTIONS (A-Z)                     #
#                                                  #
####################################################
derive_chart_data_frame <- function(df) {
  df %>%
    select(
      hours_sun,
      latitude,
      longitude,
      rain_mm,
      temp_max_degrees_c,
      temp_min_degrees_c
    )
}
