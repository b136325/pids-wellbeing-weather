library(readr)
####################################################
#                                                  #
# EXPORTED FUNCTION                                #
#                                                  #
####################################################
#' stage_013
#' @export
stage_013 <- function(
  source_dir = DIR_TECHNICALLY_CORRECT_WEATHER_DATAFRAME,
  destination_dir = DIR_TECHNICALLY_CORRECT_WEATHER_COMPLETE,
  force = TRUE
) {
  source_file_paths <- files_per_directory(
    source_dir
  )
  for (source_file_path in source_file_paths) {
    destination_data_frame <- readRDS(source_file_path)
    destination_data_frame$observation_year <- as.integer(
      destination_data_frame$observation_year
    )
    destination_data_frame$observation_month <- as.integer(
      destination_data_frame$observation_month
    )
    destination_data_frame$temp_max_degrees_c <- as.double(
      destination_data_frame$temp_max_degrees_c
    )
    destination_data_frame$temp_min_degrees_c <- as.double(
      destination_data_frame$temp_min_degrees_c
    )
    destination_data_frame$af_days <- as.integer(
      destination_data_frame$af_days
    )
    destination_data_frame$rain_mm <- as.double(
      destination_data_frame$rain_mm
    )
    destination_data_frame$hours_sun <- as.double(
      destination_data_frame$hours_sun
    )
    destination_data_frame$provisional <- as.character(
      destination_data_frame$provisional
    )
    destination_file_path <- derive_destination_file_path(
      destination_dir,
      FILE_EXTENSION_RDS,
      source_dir,
      FILE_EXTENSION_RDS,
      source_file_path
    )
    if (force & file.exists(destination_file_path)) {
      file.remove(destination_file_path)
    }
    file.create(destination_file_path)
    saveRDS(
      destination_data_frame,
      file = destination_file_path
    )
  }
}
####################################################
#                                                  #
# NON EXPORTED FUNCTIONS (A-Z)                     #
#                                                  #
####################################################