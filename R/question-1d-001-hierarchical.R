library(dplyr)
library(mclust)
####################################################
#                                                  #
# EXPORTED FUNCTION                                #
#                                                  #
####################################################
#' question_1d_001_hierarchical
#' @export
question_1d_001_hierarchical <- function(
) {
  distances <- dist(
    as.matrix(
      question_1b_001_data() %>%
        select(
          hours_sun,
          rain_mm,
          temp_max_degrees_c,
          temp_min_degrees_c
        )
    )
  )
  hc <- hclust(distances)
  plot(hc)
}
