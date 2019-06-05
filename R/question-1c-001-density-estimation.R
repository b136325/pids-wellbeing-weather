library(dplyr)
library(mclust)
####################################################
#                                                  #
# EXPORTED FUNCTION                                #
#                                                  #
####################################################
#' question_1c_001_density_estimation
#' @export
question_1c_001_density_estimation <- function(
) {
  data_frame <-  question_1b_001_data()
  densityMclust(
    data_frame %>%
      select(
        hours_sun,
        rain_mm,
        temp_max_degrees_c,
        temp_min_degrees_c
      ),
    data_frame$weather_station_name
  )
}
