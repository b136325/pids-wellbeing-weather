#' load_weather_stations_raw_data
#'
#' @export
load_weather_stations_raw_data <- function() {
  weather_station_names <- list("nairn", "tiree")

  for (weather_station_name in weather_station_names) {
    dest <- build_weather_station_path(weather_station_name)
    url <- build_weather_station_url(weather_station_name)
    
    if (!load_weather_station_raw_data(dest, url)) {
      print(paste0(weather_station_name, " - invalid"))
    }
  }
  TRUE
}