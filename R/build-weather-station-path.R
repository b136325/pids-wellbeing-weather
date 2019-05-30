#' build_weather_station_path
#'
#' @export
build_weather_station_path <- function(
  weather_station_name
) {
  dir <- "data-raw/"
  extension <- ".txt"
  paste0(
    dir,
    weather_station_name,
    extension
  )
}
