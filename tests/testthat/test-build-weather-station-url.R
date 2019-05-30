library(weathr)

test_that("a valid weather station URL is returned", {
  root <- paste0(
    "http://www.metoffice.gov.uk/pub/data/weather/uk/climate/",
    "stationdata/"
  )
  suffix <- "data.txt"
  weather_station_name <- "nairn"
  url <- paste0(
    root,
    weather_station_name,
    suffix
  )
  expect_equal(
    weathr::build_weather_station_url(
      weather_station_name
    ),
    url
  )
})
