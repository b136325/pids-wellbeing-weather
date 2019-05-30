met_office_url_root <-
  "http://www.metoffice.gov.uk/pub/data/weather/uk/climate/stationdata/"
met_office_url_suffix <- "data.txt"

#' generate_weather_station_url
#'
#' This function returns "Hello, world!".
#' @export
#' @examples
#' generate_weather_station_url()
generate_weather_station_url <- function(weather_station_name) {
  weather_station_url <- paste(
    met_office_url_root,
    weather_station_name,
    met_office_url_suffix,
    sep <- ""
  )
  weather_station_url
}