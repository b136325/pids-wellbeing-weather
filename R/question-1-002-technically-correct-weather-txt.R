library(stringr)
####################################################
#                                                  #
# EXPORTED FUNCTION                                #
#                                                  #
####################################################
#' question_1_002_tech_correct_weather_txt
#' 
#' Move the raw wether data into data/weather/stage-010-technically-correct-text and add a closing character.
#' 
#' @param destination_dir An OPTIONAL string describing the destination dir.
#'                                   Defaults to DIR_TECHNICALLY_CORRECT_WEATHER_TXT defined within constants.dirs.R.
#'                                   
#' @param source_dir An OPTIONAL string describing the source dir.
#'                                   Defaults to DIR_RAW_DATA_WEATHER defined within constants.dirs.R.
#'  
#' @return A list containing the names of the files that have been moved.                           
#' @usage pids.wellbeing.weather::question_1_002_technically_correct_weather_txt()
#' @export
question_1_002_tech_correct_weather_txt <- function(
  destination_dir = DIR_TECHNICALLY_CORRECT_WEATHER_TXT,
  source_dir = DIR_RAW_DATA_WEATHER
) {
  dest_file_paths <- copy_files(
    source_dir,
    destination_dir
  )
  results <- character()
  for (dest_file_path in dest_file_paths) {
    results <- append(
      results,
      append_eof(
        dest_file_path
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
append_eof <- function(destination_file_path) {
  destination_file_contents <- readChar(
    destination_file_path,
    file.info(destination_file_path)$size
  )
  result <- character()
  if (!str_detect(destination_file_contents, "\n$")) {
    result <- paste0(
      SUCCESS_MESSAGE_LABEL,
      destination_file_path
    )
    write(
      "\n",
      file = destination_file_path,
      append = TRUE
    )
  } else {
    result <- paste0(
      FAIL_MESSAGE_LABEL,
      destination_file_path
    )
  }
  result
}
