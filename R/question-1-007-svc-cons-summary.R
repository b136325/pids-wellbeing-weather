library(dplyr)
library(magrittr)
library(xtable)
####################################################
#                                                  #
# EXPORTED FUNCTION                                #
#                                                  #
####################################################
#' question_1_007_svc_cons_summary
#'
#' A summary function that provides the number of 'consistently correct' rows per weather station.
#'
#' @param df An OPTIONAL data frame.
#'           Defaults to the result of load_technically_correct_data_frame().
#'
#' @return A list describing the number of 'consistently correct' rows per weather station.
#' @usage pids.wellbeing.weather::question_1_007_svc_cons_summary()
#' @export
question_1_007_svc_cons_summary <- function(
  df = load_technically_correct_data_frame()
) {
  df %>%
    group_by(
      weather_station_name
    ) %>%
    tally()
}

#' question_1_007_svc_cons_summary_latex
#'
#' A summary function that provides the number of 'consistently correct' rows per weather station as a Latex table.
#'
#' @param df An OPTIONAL data frame.
#'           Defaults to the result of question_1_007_svc_cons_summary().
#'
#' @return A string describing the number of 'consistently correct' rows per weather station, as a Latex table.
#' @usage pids.wellbeing.weather::question_1_007_svc_cons_summary_latex()
#' @export
question_1_007_svc_cons_summary_latex <- function(
  df = question_1_007_svc_cons_summary()
) {
  xtable(df)
}
