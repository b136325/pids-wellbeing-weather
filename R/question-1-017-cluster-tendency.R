library(factoextra)
library(dplyr)
####################################################
#                                                  #
# EXPORTED FUNCTION                                #
#                                                  #
####################################################
#' question_1_017_cluster_tendency
#' 
#' Calculate the Hopkins cluster tendency.
#' 
#' @param df An OPTIONAL data frame containing weather feature data,
#'
#' @param show_chart An OPTIONAL boolean flag, incdicating whether or not a chart should be generated.
#' 
#' @return A list describing the Hopkins cluster tendency                         
#' @usage pids.wellbeing.weather::question_1_017_cluster_tendency()
#' @export
question_1_017_cluster_tendency <- function(
  df = question_1_010_remove_outliers(scale = FALSE),
  show_chart = FALSE
) {
  df_selected <- select_weather_features(df)
  get_clust_tendency(
    df_selected,
    n = nrow(df) - 1,
    graph = show_chart,
  )$hopkins_stat
}
####################################################
#                                                  #
# NON EXPORTED FUNCTION                            #
#                                                  #
####################################################
select_weather_features <- function(
  df,
  weather_features_as_row_names = FALSE
) {
  df_selected <- df %>% 
    select(
      hours_sun,
      rain_mm,
      temp_max_degrees_c,
      temp_min_degrees_c
    )
  if (weather_features_as_row_names) {
    rownames(df_selected) <- as.character(
      df$weather_station_names
    )
  }
  df_selected
}
