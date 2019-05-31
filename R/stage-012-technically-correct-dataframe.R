library(readr)
####################################################
#                                                  #
# EXPORTED FUNCTION                                #
#                                                  #
####################################################
#' stage_012
#' @export
stage_012 <- function(
  source_dir = DIR_TECHNICALLY_CORRECT_WEATHER_DSV,
  destination_dir = DIR_TECHNICALLY_CORRECT_WEATHER_DATAFRAME,
  col_names = WEATHER_COLUMN_NAMES
) {
  source_file_paths <- files_per_directory(
    source_dir
  )
  for (source_file_path in source_file_paths) {
    destination_data_frame <- generate_data_frame(
      source_file_path,
      col_names
    )
    destination_data_frame <- remove_existing_header_rows(
      destination_data_frame
    )
    destination_file_path <- derive_destination_file_path(
      destination_dir,
      FILE_EXTENSION_RDA,
      source_dir,
      FILE_EXTENSION_DSV,
      source_file_path
    )
    save(
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
generate_data_frame <- function(
  source_file_path,
  col_names
) {
  read_delim(
    source_file_path,
    delim = " ",
    col_names = col_names,
    col_types = cols(
      `observation_year` = col_character(),
      `observation_month` = col_character(),
      `temp_max_degrees_c` = col_character(),
      `temp_min_degrees_c` = col_character(),
      `af_days` = col_character(),
      `rain_mm` = col_character(),
      `hours_sun` = col_character(),
      `provisional` = col_character()
    )
  )
}

remove_existing_header_rows <- function(data_frame) {
  data_frame[-c(1, 2), ]
}
