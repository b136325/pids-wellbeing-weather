library(utils)

#' @describeIn met_office_url_suffix
met_office_url_suffix <- "data.txt"

#' @describeIn met_office_url_root
met_office_url_root <- paste0(
  "http://www.metoffice.gov.uk/",
  "pub/data/weather/uk/climate/",
  "stationdata/"
)

#' @describeIn ons_url_suffix
ons_url_suffix <- ".xls"

#' @describeIn ons_url_root
ons_url_root <- paste0(
  "https://www.ons.gov.uk/",
  "file?uri=/peoplepopulationandcommunity/",
  "wellbeing/datasets/", 
  "measuringnationalwellbeingdomainsandmeasures/",
  "may2019/domainsandmeasures"
)

#' @describeIn weather_dir
weather_dir <- "data-raw/weather/"

#' @describeIn weather_path_extension
weather_path_extension <- ".txt"

#' @describeIn wellbeing_dir
wellbeing_dir <- "data-raw/wellbeing/"

#' @describeIn wellbeing_extension
wellbeing_extension <- ".xls"

#' @describeIn wellbeing_dest_file_name
wellbeing_dest_file_name <- "2019-spring"

#' @describeIn wellbeing_source_file_name
wellbeing_source_file_name <- "spring2019"

#' @describeIn build_path_weather
build_path_weather <- function(weather_station_name) {
    paste0(
        weather_dir,
        weather_station_name,
        weather_path_extension
    )
}

#' @describeIn build_path_wellbeing
build_path_wellbeing <- function(wellbeing_dest_file_name) {
    paste0(
        wellbeing_dir,
        wellbeing_dest_file_name,
        wellbeing_extension
    )
}

#' @describeIn build_url_weather
build_url_weather <- function(weather_station_name) {
  paste0(
    met_office_url_root,
    weather_station_name,
    met_office_url_suffix
  )
}

#' @describeIn build_url_wellbeing
build_url_wellbeing <- function(wellbeing_source_file_name) {
  paste0(
    ons_url_root,
    wellbeing_source_file_name,
    ons_url_suffix
  )
}

#' @describeIn load_file
load_file <- function(dest, url) {
    tryCatch({
        if (file.exists(dest)) {
            file.remove(dest)
        }
        if (!file.exists(dest)) {
            file.create(dest)
        }
        utils::download.file(url = url, destfile = dest, quiet = TRUE)
        TRUE
    }, warning = function(cond) {
        FALSE
    }, error = function(cond) {
        FALSE
    })
}

#' load_raw_data_weather
#' @export
load_raw_data_weather <- function(
    weather_station_names_list = weather_station_names
) {
    for (weather_station_name in weather_station_names_list) {
        dest <- build_path_weather(
            weather_station_name
        )
        url <- build_url_weather(
            weather_station_name
        )
        if (!load_file(dest, url)) {
            print(paste0("FAIL ", weather_station_name))
        } else {
            print(paste0("SUCCESS ", weather_station_name))
        }
    }
}

#' load_raw_data_wellbeing
#' @export
load_raw_data_wellbeing <- function(
  wellbeing_destination_name = wellbeing_dest_file_name, 
  wellbeing_source_name = wellbeing_source_file_name
) {
    dest <- build_path_wellbeing(
        wellbeing_destination_name
    )
    url <- build_url_wellbeing(
        wellbeing_source_name
    )
    if (!load_file(dest, url)) {
        print(paste0("FAIL ", wellbeing_source_name))
    } else {
        print(paste0("SUCCESS ", wellbeing_source_name))
    }
}

#' load_raw_data
#' @export
load_raw_data <- function(
    weather_station_names_list = weather_station_names,
    wellbeing_destination_name = wellbeing_dest_file_name, 
    wellbeing_source_name = wellbeing_source_file_name
) {
    load_raw_data_weather(
        weather_station_names_list
    )
    load_raw_data_wellbeing(
        wellbeing_destination_name,
        wellbeing_source_name
    )
}
