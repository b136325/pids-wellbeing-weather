library(weathr)

met_office_url_root <-
  "http://www.metoffice.gov.uk/pub/data/weather/uk/climate/stationdata/"
met_office_url_suffix <- "data.txt"

test_that("", {
  weather_station_name <- 'TEST'
  weather_station_url <- paste(
    met_office_url_root,
    weather_station_name,
    met_office_url_suffix,
    set <- ''
  )
  expect_equal(
    weathr::generate_weather_station_url(weather_station_name),
    weather_station_url)
})
