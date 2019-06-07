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
#' @param group_by_variable_name An OPTIONAL string describing the group_by variable. Defaults to "weather_station_name".
#'
#' @param scale An OPTIONAL boolean indicating whether or not the data should be scaled.
#' 
#' @return A list describing the Hopkins cluster tendency                         
#' @usage pids.wellbeing.weather::question_1_017_cluster_tendency()
#' @export
question_1_017_cluster_tendency <- function(
  group_by_variable_name = "weather_station_name",
  scale = FALSE,
  show_chart = FALSE
) {
  results <- list()
  data_frame <- question_1_010_remove_outliers(
    group_by_variable_name,
    scale
  ) %>%
    select(
      hours_sun,
      rain_mm,
      temp_max_degrees_c,
      temp_min_degrees_c
    )
  get_clust_tendency(
    data_frame, 
    n = nrow(data_frame) -1,
    graph = show_chart,
  )$hopkins_stat
}

