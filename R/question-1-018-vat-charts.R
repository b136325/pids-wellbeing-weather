library(factoextra)
####################################################
#                                                  #
# EXPORTED FUNCTION                                #
#                                                  #
####################################################
#' question_1_018_vat_charts
#' @export
question_1_018_vat_charts <- function(
  df = question_1_010_remove_outliers()
) {
  df_selected <- select_weather_features(df)
  fviz_dist(
    dist(df_selected),
    show_labels = FALSE
  )
}
