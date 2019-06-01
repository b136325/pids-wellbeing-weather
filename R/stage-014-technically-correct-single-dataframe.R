library(readr)
library(tidyr)
####################################################
#                                                  #
# EXPORTED FUNCTION                                #
#                                                  #
####################################################
#' stage_014
#' @export
stage_014 <- function(
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
      `hours_sun`
    )
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
