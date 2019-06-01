library(readr)
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
  source_file_paths <- files_per_directory(
    source_dir
  )
  data_frame_anchor <- data.frame(
    `observation_year` = as.integer(integer()),
    `observation_month` = as.integer(integer()),
    `temp_max_degrees_c` = as.double(double()),
    `temp_min_degrees_c` = as.double(double()),
    `af_days` = as.integer(integer()),
    `rain_mm` = as.double(double()),
    `hours_sun` = as.double(double()),
    `provisional` = as.character(character()),
    `weather_station_name` = as.character(character())
  )
  for (source_file_path in source_file_paths) {
    data_frame <- readRDS(source_file_path)
    data_frame_anchor <- rbind(
      data_frame_anchor,
      data_frame
    )
  }
  data_frame_simplified <- data.frame(
    `weather_station_name` = data_frame_anchor$weather_station_name,
    `observation_year` = data_frame_anchor$observation_year,
    `observation_month` = data_frame_anchor$observation_month,
    `temp_max_degrees_c` = data_frame_anchor$temp_max_degrees_c,
    `temp_min_degrees_c` = data_frame_anchor$temp_min_degrees_c,
    `average_temp_degrees_c` = data_frame_anchor$average_temp_degrees_c
  )    
  data_frame_simplified <- na.omit( data_frame_simplified)
  destination_file_path <- paste0(
    destination_dir,
    "/",
    WEATHER_ALL_DATA_FRAMES
  )
  if (force & file.exists(destination_file_path)) {
    file.remove(destination_file_path)
  }
  file.create(destination_file_path)
  saveRDS(
    data_frame_simplified,
    file = destination_file_path
  )
}
