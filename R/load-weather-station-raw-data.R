library(utils)

#' load_weather_station_raw_data
#'
#' @export
load_weather_station_raw_data <- function(dest, url) {
  tryCatch({
    if (file.exists(dest)) {
      file.remove(dest)
    }
    if (!file.exists(dest)) {
      file.create(dest)
    }
    utils::download.file(url = url, destfile = dest, quiet = TRUE)
    TRUE
  },
  warning = function(cond) {
    FALSE
  },
  error = function(cond) {
    FALSE
  })
}
