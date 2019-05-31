library(stringr)

destination_dir_default <- "data/weather/cleaning-stage-01-pre-technically-correct"
source_dir_default <- "data-raw/weather"

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

#' copy_raw_data_weather
#' @export
copy_raw_data_weather <- function(
  destination_dir = destination_dir_default,
  srource_dir = source_dir_default
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
    stop("There are not the same number of 'source' and 'destination' file paths.")
  }
  file.copy(
    source_file_paths,
    destination_file_paths,
    overwrite = TRUE
  )
  destination_file_paths
}

#' load_pre_technically_correct_data
#' @export
load_pre_technically_correct_data<- function(
  destination_dir = destination_dir_default,
  source_dir = source_dir_default
) {
  dest_file_paths <- copy_raw_data_weather(
    destination_dir,
    source_dir
  )
  for (dest_file_path in dest_file_paths) {
    append_eof(dest_file_path)
  }
}
