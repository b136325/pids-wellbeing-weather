library(dplyr)
library(ggplot2)
####################################################
#                                                  #
# EXPORTED FUNCTIONS (A-Z                          #
#                                                  #
####################################################
#' question_1a_002_data_charts
#' @export
question_1a_002_data_charts <- function() {
  data_frame <- question_1a_001_data()
  heathrow <- data_frame %>% filter(
    weather_station_name == "heathrow"
  )
  ggplot(
    heathrow,
    aes(
      x = as.factor(observation_month),
      y = temp_max_degrees_c,
    )
  ) + geom_boxplot()
}
