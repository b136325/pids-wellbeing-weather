library(readr)
####################################################
#                                                  #
# EXPORTED FUNCTION                                #
#                                                  #
####################################################
#' question_1_005_tech_corr_weather_complete
#' 
#' Convert the weather files into a delimited file format with a standard number of columns.
#' 
#' @param source_dir An OPTIONAL string describing the source dir.
#'                   Defaults to DIR_TECHNICALLY_CORRECT_WEATHER_DATAFRAME defined within constants.dirs.R.
#'
#' @param destination_dir An OPTIONAL string describing the destination dir.
#'                        Defaults to DIR_TECHNICALLY_CORRECT_WEATHER_COMPLETE defined within constants.dirs.R.
#'  
#' @param force An optional flag idicating whether or not the destination flags should be overwritten.
#' 
#' @return A list describing the success or failure of each file.                           
#' @usage pids.wellbeing.weather::question_1_005_tech_corr_weather_complete()
#' @export
question_1_005_tech_corr_weather_complete <- function(
  source_dir = DIR_TECHNICALLY_CORRECT_WEATHER_DATAFRAME,
  destination_dir = DIR_TECHNICALLY_CORRECT_WEATHER_COMPLETE,
  force = TRUE
) {
  source_file_paths <- files_per_directory(
    source_dir
  )
  for (source_file_path in source_file_paths) {
    data_frame <- readRDS(source_file_path)
    weather_station_name <- extract_weather_station_name(
      source_dir,
      source_file_path,
      FILE_EXTENSION_RDS
    )
    data_frame$weather_station_name <- weather_station_name
    data_frame$latitude <- as.character(
      derive_latitude(
        weather_station_name
      )
    )
    data_frame$longitude <- as.character(
      derive_longitude(
        weather_station_name
      )
    )
    data_frame <- coerce_column_types(data_frame)
    data_frame$average_temp_degrees_c <- rowMeans(
      data_frame[
        c(
          "temp_max_degrees_c",
          "temp_min_degrees_c"
        )
        ],
      na.rm = TRUE
    )
    data_frame$average_temp_degrees_c <- as.double(
      data_frame$average_temp_degrees_c
    )
    data_frame$latitude <- as.double(
      data_frame$latitude
    )
    data_frame$longitude <- as.double(
      data_frame$longitude
    )
    file_path <- derive_destination_file_path(
      destination_dir,
      FILE_EXTENSION_RDS,
      source_dir,
      FILE_EXTENSION_RDS,
      source_file_path
    )
    save_rds_force(
      data_frame,
      file_path,
      force
    )
  }
}
####################################################
#                                                  #
# NOT EXPORTED FUNCTIONS                           #
#                                                  #
####################################################
coerce_column_types <- function(data_frame) {
  data_frame$observation_year <- as.integer(
    data_frame$observation_year
  )
  data_frame$observation_month <- as.integer(
    data_frame$observation_month
  )
  data_frame$temp_max_degrees_c <- as.double(
    data_frame$temp_max_degrees_c
  )
  data_frame$temp_min_degrees_c <- as.double(
    data_frame$temp_min_degrees_c
  )
  data_frame$af_days <- as.integer(
    data_frame$af_days
  )
  data_frame$rain_mm <- as.double(
    data_frame$rain_mm
  )
  data_frame$hours_sun <- as.double(
    data_frame$hours_sun
  )
  data_frame$provisional <- as.character(
    data_frame$provisional
  )
  data_frame$weather_station_name <- as.character(
    data_frame$weather_station_name
  )
  data_frame
}
