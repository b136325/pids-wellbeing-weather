library(factoextra)
####################################################
#                                                  #
# EXPORTED FUNCTION                                #
#                                                  #
####################################################
#' question_1_019_prep_charts_vat
#' @export
question_1_019_prep_charts_vat <- function(
  df = question_1_011_eda_remove_outliers(scale = FALSE)
) {
  df_selected <- select_weather_features(df)
  fviz_dist(
    dist(df_selected),
    show_labels = FALSE
  )
}
