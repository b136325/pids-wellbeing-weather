library(utils)
####################################################
#                                                  #
# EXPORTED FUNCTION                                #
#                                                  #
####################################################
#' stage_000
#' @export
stage_000 <- function(
  weather_station_names_list = WEATHER_STATION_NAMES,
  wellbeing_destination_name = WELLBEING_DEST_FILE_NAME,
  wellbeing_source_name = WELLBEING_SOURCE_FILE_NAME
) {
  load_raw_data_weather(
    weather_station_names_list
  )
  load_raw_data_wellbeing(
    wellbeing_destination_name,
    wellbeing_source_name
  )
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
  for (weather_station_name in weather_station_names_list) {
    dest <- build_path_weather(
      weather_station_name
    )
    url <- build_url_weather(
      weather_station_name
    )
    if (!download_file(dest, url)) {
      print(
        paste0(
          FAIL_MESSAGE_LABEL,
          weather_station_name
        )
      )
    } else {
      print(
        paste0(
          SUCCESS_MESSAGE_LABEL,
          weather_station_name
        )
      )
    }
  }
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
    print(
      paste0(
        FAIL_MESSAGE_LABEL,
        wellbeing_source_name
      )
    )
  } else {
    print(
      paste0(
        SUCCESS_MESSAGE_LABEL,
        wellbeing_source_name
      )
    )
  }
}
