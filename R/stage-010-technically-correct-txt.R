library(stringr)

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

#' stage_010
#' @export
stage_010 <- function(
  destination_dir = DIR_TECHNICALLY_CORRECT_WEATHER_TXT,
  source_dir = DIR_RAW_DATA_WEATHER
) {
  dest_file_paths <- copy_files(
    source_dir,
    destination_dir
  )
  for (dest_file_path in dest_file_paths) {
    append_eof(dest_file_path)
  }
}
