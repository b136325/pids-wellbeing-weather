library(xtable)
####################################################
#                                                  #
# EXPORTED FUNCTIONS (A-Z                          #
#                                                  #
####################################################
#' question_3_006_eda_weather_station_regions
#' @export
question_3_006_eda_weather_station_regions <- function() {
  data.frame(
    regions = unlist(WEATHER_STATION_REGIONS, use.names = F),
    weather_stations = names(WEATHER_STATION_REGIONS)
  )
}

#' question_3_006_eda_weather_station_regions_latex
#' @export
question_3_006_eda_weather_station_regions_latex <- function(
  df = question_3_006_eda_weather_station_regions()
) {
  xtable(df)
}
