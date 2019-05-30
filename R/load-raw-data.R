devtools::use_package("curl")

met.office.address.root <- "http://www.metoffice.gov.uk/pub/data/weather/uk/climate/stationdata/"
met.office.address.suffix <- "data.txt"
local.address <- "./data-raw/tmp.txt"
weather.stations <- list("lerwick", "nairn")

#' Load raw data.
load_data_raw <- function() {
  for(weather.station in weather.stations){
    met.office.weather.station.address <- paste(
      met.office.address.root,
      weather.station,
      met.office.address.suffix,
      sep=""
    )
    
    print(met.office.weather.station.address)
    curl_download(met.office.weather.station.address, local.address)
  }
}