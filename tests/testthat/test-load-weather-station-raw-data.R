library(weathr)

test_that("a valid failure response is returned", {
  dest <- "data-raw/nairn.txt"
  url <- paste0(
    "http://www.metoffice.gov.uk/",
    "pub/data/weather/uk/climate/",
    "stationdata/nairndata.txt"
  )
  expect_equal(
    weathr::load_weather_station_raw_data(
      dest,
      url
    ),
    FALSE
  )
})
