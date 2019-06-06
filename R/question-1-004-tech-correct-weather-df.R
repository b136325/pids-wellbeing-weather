library(readr)
####################################################
#                                                  #
# EXPORTED FUNCTION                                #
#                                                  #
####################################################
#' question_1_004_tech_correct_weather_df
#' 
#' Convert the weather files into a delimited file format with a standard number of columns.
#' 
#' @param source_dir An OPTIONAL string describing the source dir.
#'                   Defaults to DIR_TECHNICALLY_CORRECT_WEATHER_DSV defined within constants.dirs.R.
#'
#' @param destination_dir An OPTIONAL string describing the destination dir.
#'                        Defaults to DIR_TECHNICALLY_CORRECT_WEATHER_DATAFRAME defined within constants.dirs.R.
#'  
#' @param col_names An optional list of column names.Defaults to WEATHER_COLUMN_NAMES.
#' 
#' @param force An optional flag idicating whether or not the destination flags should be overwritten.
#' 
#' @return A list describing the success or failure of each file.                           
#' @usage pids.wellbeing.weather::question_1_004_tech_correct_weather_df()
#' @export
question_1_004_tech_correct_weather_df <- function(
  source_dir = DIR_TECHNICALLY_CORRECT_WEATHER_DSV,
  destination_dir = DIR_TECHNICALLY_CORRECT_WEATHER_DATAFRAME,
  col_names = WEATHER_COLUMN_NAMES,
  force = TRUE
) {
  results <- character()
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
      FILE_EXTENSION_RDS,
      source_dir,
      FILE_EXTENSION_DSV,
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
    results <- append(
      results,
      paste0(
        SUCCESS_MESSAGE_LABEL,
        destination_file_path
      )
    )
  }
  results
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
