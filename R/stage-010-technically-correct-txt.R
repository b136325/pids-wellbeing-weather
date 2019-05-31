library(stringr)

#' append_eof
#' @export
append_eof <- function(destination_file_path) {
  destination_file_contents <- readChar(
    destination_file_path,
    file.info(destination_file_path)$size
  )
  if (!str_detect(destination_file_contents, "\n$")) {
    print(
      paste0(
        "NO NEW LINE",
        destination_file_path
      )
    )
    write(
      "\n",
      file = destination_file_path,
      append = TRUE
    )
  }
}

#' copy_files
#' @export
copy_files <- function(
  destination_dir,
  srource_dir
) {
  source_file_paths <- list.files(
    full.names = TRUE,
    path = source_dir
  )
  destination_file_paths <- str_replace_all(
    source_file_paths,
    source_dir,
    destination_dir
  )
  if (length(source_file_paths) != length(destination_file_paths)) {
    stop(
      paste0(
        "There are not the same number",
        "of 'source' and 'destination' file paths."
      )
    )
  }
  file.copy(
    source_file_paths,
    destination_file_paths,
    overwrite = TRUE
  )
  destination_file_paths
}

#' load_technically_correct_txt
#' @export
load_technically_correct_txt <- function(
  destination_dir = DIR_TECHNICALLY_CORRECT_WEATHER_TXT,
  source_dir = DIR_RAW_DATA_WEATHER
) {
  dest_file_paths <- copy_files(
    destination_dir,
    source_dir
  )
  for (dest_file_path in dest_file_paths) {
    append_eof(dest_file_path)
  }
}
