library(readr)
library(tidyr)
####################################################
#                                                  #
# EXPORTED FUNCTION                                #
#                                                  #
####################################################
#' question_1_006_tech_corr_weather_single_df
#' 
#' Convert the weather files into a delimited file format with a standard number of columns.
#' 
#' @param source_dir An OPTIONAL string describing the source dir.
#'                   Defaults to DIR_TECHNICALLY_CORRECT_WEATHER_COMPLETE defined within constants.dirs.R.
#'
#' @param destination_dir An OPTIONAL string describing the destination dir.
#'                        Defaults to DIR_TECHNICALLY_CORRECT_ALL defined within constants.dirs.R.
#'  
#' @param force An optional flag idicating whether or not the destination flags should be overwritten.
#' 
#' @return A list describing the success or failure of each file.                           
#' @usage pids.wellbeing.weather::question_1_006_tech_corr_weather_single_df()
#' @export
question_1_006_tech_corr_weather_single_df <- function(
  source_dir = DIR_TECHNICALLY_CORRECT_WEATHER_COMPLETE,
  destination_dir = DIR_TECHNICALLY_CORRECT_ALL,
  force = TRUE
) {
  source_file_paths <- files_per_directory(source_dir)
  data_frame_with_nas <- join_data_frames(source_file_paths)
  save_data_frame_with_nas(
    data_frame_with_nas,
    destination_dir,
    force
  )
  save_data_frame_without_nas(
    data_frame_with_nas,
    destination_dir,
    force
  )
}
####################################################
#                                                  #
# NOT EXPORTED FUNCTIONS                           #
#                                                  #
####################################################
save_data_frame_with_nas <- function(
  data_frame_with_nas,
  destination_dir,
  force
) {
  destination_file_path <- paste0(
    destination_dir,
    "/",
    WEATHER_ALL_DATA_FRAMES
  )
  save_rds_force(
    data_frame_with_nas,
    destination_file_path,
    force
  )
}

save_data_frame_without_nas <- function(
  data_frame_with_nas,
  destination_dir,
  force
) {
  data_frame_without_nas <- data_frame_with_nas %>% drop_na(
    c(
      `temp_max_degrees_c`,
      `temp_min_degrees_c`,
      `average_temp_degrees_c`,
      `rain_mm`,
      `hours_sun`,
      `weather_station_name`
    )
  )
  data_frame_without_nas$weather_station_name <- as.factor(
    data_frame_without_nas$weather_station_name
  )
  destination_file_path <- paste0(
    destination_dir,
    "/",
    WEATHER_ALL_DATA_FRAMES_NO_NAS
  )
  save_rds_force(
    data_frame_without_nas,
    destination_file_path,
    force
  )
}
