library(dplyr)
library(magrittr)
####################################################
#                                                  #
# EXPORTED FUNCTION                                #
#                                                  #
####################################################
question_1_007_svc_cons_summary <- function(
  df = load_technically_correct_data_frame()
) {
  df %>%
    group_by(
      weather_station_name
    ) %>%
    tally()
}
