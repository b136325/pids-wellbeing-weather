library(dplyr)
####################################################
#                                                  #
# EXPORTED FUNCTION                                #
#                                                  #
####################################################
#' question_1b_001_data
#' @export
question_1b_002_comparison <- function() {
  print(
    summary(
      question_1a_001_data(scale = FALSE)
    )
  )
  print(
    summary(
      question_1b_001_data(scale = FALSE)
    )
  )
}
