#' build_weather_station_url
#'
#' @export
build_weather_station_url <- function(
  weather_station_name
) {
  root <- paste0(
    "http://www.metoffice.gov.uk/pub/data/weather/uk/climate/",
    "stationdata/"
  )
  suffix <- "data.txt"
  paste0(
    root,
    weather_station_name,
    suffix
  )
}
