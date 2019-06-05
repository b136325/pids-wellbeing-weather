library(clValid)
library(dplyr)
####################################################
#                                                  #
# EXPORTED FUNCTION                                #
#                                                  #
####################################################
#' question_1e_001_cluster_validation
#' @export
question_1e_001_cluster_validation <- function(
  cluster_methods = c(
    "hierarchical",
    "kmeans",
    "pam"
  ),
  cluster_validation_type = "internal",
  num_clusters = 2:10
) {
  data_frame <- question_1b_001_data()
  data_frame_cv <- select_cluster_validation_columns(
    data_frame
  )
  rownames(data_frame_cv) <- data_frame$weather_station_name
  intern <- clValid(
    as.data.frame(data_frame_cv),
    nClust = num_clusters,
    clMethods = cluster_methods,
    validation = cluster_validation_type
  )
  clValid::summary(intern)
}
####################################################
#                                                  #
# NON EXPORTED FUNCTIONS (A-Z)                     #
#                                                  #
####################################################
select_cluster_validation_columns <- function(
  data_frame
) {
  data_frame %>%
    select(
      hours_sun,
      rain_mm,
      temp_max_degrees_c,
      temp_min_degrees_c
    )
}
