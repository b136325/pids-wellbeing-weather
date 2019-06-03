library(dplyr)
####################################################
#                                                  #
# EXPORTED FUNCTION                                #
#                                                  #
####################################################
#' question_1b_001_data
#' @export
question_1b_001_data <- function() {
  data_frame <- fix_outliers_rain_hours(
    question_1a_001_data()
  )
  print(
    colnames(
      data_frame
    )
  )
  print(
    head(
      data_frame
    )
  )
  stop()
}

# lowerq = quantile(data)[2]
# upperq = quantile(data)[4]
# iqr = upperq - lowerq
fix_outliers_rain_hours <- function(data_frame) {
  data_frame %>%
    filter(
      !(abs(hours_sun - median(hours_sun)) > value)
    ) %>%
    summarise_each(funs(mean), value)
}
