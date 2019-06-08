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
#' @export
question_2_004_eda_charts_latitude_category_pairwise <- function(
  df = data_frame <- question_2_001_bu_append_latitude_categories()
) {
  df_chart <- derive_chart_data_frame(df)
  ggpairs(
    df_chart,
    mapping = aes(color = latitude_category)
  )
}
####################################################
#                                                  #
# NON EXPORTED FUNCTIONS (A-Z)                     #
#                                                  #
####################################################
derive_chart_data_frame <- function(df) {
  df %>%
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
