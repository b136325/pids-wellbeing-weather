library(utils)
####################################################
#                                                  #
# EXPORTED FUNCTION                                #
#                                                  #
####################################################
#' question_1_001_raw_data
#' 
#' Download the raw data for both the well-being and the weather datasets.
#' 
#' @param weather_station_names_list An OPTIONAL list of weather station name strings, whose data will be downloaded.
#'                                   Defaults to WEATHER_STATION_NAMES defined within constants.weather-station-names.R.
#'                                   
#' @param wellbeing_destination_name An OPTIONAL string describing the destination file name of the well-being dataset.
#'                                   Defaults to WELLBEING_DEST_FILE_NAME defined within constants.wellbeing.R.
#'                                   
#' @param wellbeing_source_name An OPTIONAL string describing the source file name of the well-being dataset.
#'                              Defaults to WELLBEING_SOURCE_FILE_NAME defined within constants.wellbeing.R.
#'  
#' @return A list containing 'wellbeing' and 'weather' elements, which, in turn, describe the success or failure of each file.                           
#' @usage pids.wellbeing.weather::question_1_001_raw_data()
#' @export
question_1_001_raw_data <- function(
  weather_station_names_list = WEATHER_STATION_NAMES,
  wellbeing_destination_name = WELLBEING_DEST_FILE_NAME,
  wellbeing_source_name = WELLBEING_SOURCE_FILE_NAME
) {
  results <- list()
  results$wellbeing <- load_raw_data_wellbeing(
    wellbeing_destination_name,
    wellbeing_source_name
  )
  results$weather <- load_raw_data_weather(
    weather_station_names_list
  )
  results
}
####################################################
#                                                  #
# NON EXPORTED FUNCTIONS (A-Z)                     #
#                                                  #
####################################################
build_path_weather <- function(weather_station_name) {
  paste0(
    DIR_RAW_DATA_WEATHER,
    weather_station_name,
    FILE_EXTENSION_TXT
  )
}

build_path_wellbeing <- function(wellbeing_file_name) {
  paste0(
    DIR_RAW_DATA_WELLBEING,
    wellbeing_file_name,
    FILE_EXTENSION_XLS
  )
}

build_url_weather <- function(weather_station_name) {
  paste0(
    MET_OFFICE_URL_ROOT,
    weather_station_name,
    MET_OFFICE_URL_SUFFIX
  )
}

build_url_wellbeing <- function(wellbeing_source_file_name) {
  paste0(
    ONS_URL_ROOT,
    wellbeing_source_file_name,
    FILE_EXTENSION_XLS
  )
}

load_raw_data_weather <- function(
    weather_station_names_list
) {
  results <- character()
  for (weather_station_name in weather_station_names_list) {
    dest <- build_path_weather(
      weather_station_name
    )
    url <- build_url_weather(
      weather_station_name
    )
    if (!download_file(dest, url)) {
      results <- append(
        results,
        paste0(
          FAIL_MESSAGE_LABEL,
          weather_station_name
        )
      )
    } else {
      results <- append(
        results,
        paste0(
          SUCCESS_MESSAGE_LABEL,
          weather_station_name
        )
      )
    }
  }
  results
}

load_raw_data_wellbeing <- function(
  wellbeing_destination_name,
  wellbeing_source_name
) {
  dest <- build_path_wellbeing(
    wellbeing_destination_name
  )
  url <- build_url_wellbeing(
    wellbeing_source_name
  )
  if (!download_file(dest, url)) {
    result <- paste0(
      FAIL_MESSAGE_LABEL,
      wellbeing_source_name
    )
  } else {
    result <- paste0(
      SUCCESS_MESSAGE_LABEL,
      wellbeing_source_name
    )
  }
  result
}
