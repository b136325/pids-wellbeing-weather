library(dplyr)
####################################################
#                                                  #
# EXPORTED FUNCTION                                #
#                                                  #
####################################################
#' question_1d_001_hierarchical
#' @export
question_1d_001_hierarchical <- function(
) {
  data_frame <- question_1b_001_data()
  distances <- dist(
    as.matrix(
      data_frame %>%
        select(
          hours_sun,
          rain_mm,
          temp_max_degrees_c,
          temp_min_degrees_c
        )
    )
  )
  hc <- hclust(distances)
  plot(
    hc,
    data_frame$weather_station_name
  )
}
