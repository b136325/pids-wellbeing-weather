library(stringr)
####################################################
#                                                  #
# EXPORTED FUNCTION                                #
#                                                  #
####################################################
#' stage_011
#' @export
stage_011 <- function(
  destination_dir = DIR_TECHNICALLY_CORRECT_WEATHER_DSV,
  source_dir = DIR_TECHNICALLY_CORRECT_WEATHER_TXT
) {
  source_file_paths <- files_per_directory(
    source_dir
  )
  for (source_file_path in source_file_paths) {
    source_file_contents <- retrieve_txt_file_contents(
      source_file_path
    )
    destination_file_contents <- extract_data_below_static_header(
      source_file_contents
    )
    destination_file_contents <- transform_common_values(
      destination_file_contents
    )
    destination_file_contents <- transform_columns(
      destination_file_contents
    )
    destination_file_contents <- transform_specific_files(
      destination_file_contents,
      source_file_path
    )
    destination_file_path <- derive_destination_file_path(
      destination_dir,
      FILE_EXTENSION_DSV,
      source_dir,
      FILE_EXTENSION_TXT,
      source_file_path
    )
    save_file(
      destination_file_contents,
      destination_file_path
    )
  }
}
####################################################
#                                                  #
# NON EXPORTED FUNCTIONS (A-Z)                     #
#                                                  #
####################################################
extract_data_below_static_header <- function(source_file_contents) {
  sub(
    WEATHER_LAST_LINE_SEGMENT,
    "",
    source_file_contents
  )
}

transform_columns <- function(file_contents) {
  # The majority of the rows contains seven, rather
  # than eight columns. Consequently, replace the
  # final character within each row with an extra
  # space followed by a NA. The eighth column has
  # been used to designate "provisional".
  file_contents <- str_replace_all(
    file_contents,
    "\r",
    " NA\r"
  )
  # The 'second' row of column titles does not
  # contain eight columns. Although this row
  # will be removed from the subsequently
  # produced datafrane, in order to construct
  # the dataframe without either errors or
  # warning, the fix is required at this stage.
  file_contents <- str_replace_all(
    file_contents,
    "hours\r",
    " hours NA\r"
  )
  file_contents <- str_replace_all(
    file_contents,
    "degC    degC",
    "NA NA degC    degC"
  )
  file_contents <- str_replace_all(
    file_contents,
    "# NA",
    " NA"
  )
  str_replace_all(
    file_contents,
    "Provisional NA",
    "Provisional"
  )
}

transform_common_values <- function(file_contents) {
  # Remove initial \r\n from the start of the contents
  # (after the static header) has been removed.
  file_contents <- str_replace(
    file_contents,
    "^\r\n  ",
    ""
  )
  # Replace the missing indicator with "NA"
  str_replace_all(
    file_contents,
    "---",
    "NA"
  )
}

transform_specific_files <- function(
  file_contents,
  file_path
) {
  if (str_detect(file_path, WEATHER_STATION_CWMYSTWYTH)) {
    file_contents <- str_replace_all(
      file_contents,
      "Site closed NA",
      "Site closed NA NA NA NA NA NA"
    )
  }
  file_contents
}
