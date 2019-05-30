library(weathr)

test_that("a valid weather station path is returned", {
  dir <- "data-raw/"
  extension <- ".txt"
  weather_station_name <- "nairn"
  path <- paste0(
    dir,
    weather_station_name,
    extension
  )
  expect_equal(
    weathr::build_weather_station_path(
      weather_station_name
    ),
    path
  )
})
