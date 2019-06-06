library(stringr)
####################################################
#                                                  #
# EXPORTED FUNCTION                                #
#                                                  #
####################################################
#' question_1_003_tech_correct_weather_dsv
#' 
#' Convert the weather files into a delimited file format with a standard number of columns.
#' 
#' @param destination_dir An OPTIONAL string describing the destination dir.
#'                        Defaults to DIR_TECHNICALLY_CORRECT_WEATHER_DSV defined within constants.dirs.R.
#'                                   
#' @param source_dir An OPTIONAL string describing the source dir.
#'                   Defaults to DIR_TECHNICALLY_CORRECT_WEATHER_TXT defined within constants.dirs.R.
#'  
#' @return A list describing the success or failure of each file.                           
#' @usage pids.wellbeing.weather::question_1_003_tech_correct_weather_dsv()
#' @export
question_1_003_tech_correct_weather_dsv <- function(
  destination_dir = DIR_TECHNICALLY_CORRECT_WEATHER_DSV,
  source_dir = DIR_TECHNICALLY_CORRECT_WEATHER_TXT
) {
  results <- character()
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
    if (file.exists(destination_file_path)) {
      file.remove(destination_file_path)
    }
    file.create(destination_file_path)
    save_file(
      destination_file_contents,
      destination_file_path
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
extract_data_below_static_header <- function(source_file_contents) {
  sub(
    WEATHER_LAST_LINE_SEGMENT,
    "",
    source_file_contents
  )
}

genrate_regex_weather_line <- function(num_repeat) {
  paste0(
    "([:space:]+[:graph:]+){",
    num_repat,
    "}[:space:]+NA\r"
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
    "[:cntrl:]+",
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
    "^[:cntrl:]+[:space:]+",
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
      "Site closed",
      "Site closed NA NA NA NA NA"
    )
  }
  if (str_detect(file_path, WEATHER_STATION_LOWESTOFT)) {
    file_contents <- str_replace_all(
      file_contents,
      "Change to Monckton Ave NA",
      "change_to_monchton_ave NA"
    )
    file_contents <- str_replace_all(
      file_contents,
      " 35.8 NA",
      " 35.8 NA NA"
    )
  }
  if (str_detect(file_path, WEATHER_STATION_NAIRN)) {
    file_contents <- str_replace_all(
      file_contents,
      "\\|+",
      "")
  }
  if (str_detect(file_path, WEATHER_STATION_RINGWAY)) {
    file_contents <- str_replace_all(
      file_contents,
      "Site Closed NA",
      "Site closed NA NA NA NA NA NA"
    )
  }
  if (str_detect(file_path, WEATHER_STATION_SOUTHAMPTON)) {
    file_contents <- str_replace_all(
      file_contents,
      "Site Closed NA",
      "Site closed NA NA NA NA NA NA"
    )
  }
  if (str_detect(file_path, WEATHER_STATION_WHITBY)) {
    #file_contents <- transform_whitby(file_contents)
  }
  file_contents
}

transform_whitby <- function(file_contents) {
  lines <- strsplit(
    file_contents,
    split = "\r"
  )
  num_lines <- (length(lines[[WHITBY_BASE_INDEX]]))
  modified_lines <- list()
  for (i in WHITBY_FIRST_LINE:num_lines) {
    line <- lines[[WHITBY_BASE_INDEX]][i]
    if (str_count(line, "[:space:]+[:graph:]+") == WHITBY_TARGET_COUNT) {
      line <- str_replace_all(
        line,
        "NA$",
        "NA NA")
    }
    modified_lines[i] <- line
  }
  file_contents <- paste(
    modified_lines,
    sep = "\n"
  )
  file_contents <- str_replace_all(
    file_contents,
    "NA \\$ NA",
    "NA$ NA"
  )
  file_contents <- str_replace_all(
    file_contents,
    "sun NA NA",
    "sun NA"
  )
  str_replace_all(
    file_contents,
    "all data from Whitby NA",
    " all_data_from_Whitby"
  )
}
