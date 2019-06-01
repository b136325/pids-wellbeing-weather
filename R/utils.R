library(stringr)
####################################################
#                                                  #
# NON EXPORTED FUNCTIONS (A-Z)                     #
#                                                  #
####################################################
copy_files <- function(
  source_dir,
  destination_dir,
  force = TRUE
) {
  source_file_paths <- files_per_directory(
    source_dir
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
    overwrite = force
  )
  destination_file_paths
}

derive_destination_file_path <- function(
  destination_dir,
  destination_extension,
  source_dir,
  source_extension,
  source_file_path
) {
  destination_file_path <- str_replace_all(
    source_file_path,
    source_dir,
    destination_dir
  )
  str_replace(
    destination_file_path,
    source_extension,
    destination_extension
  )
}

derive_latitude <- function(
  weather_station_name
) {
  LATITUDES[weather_station_name]
}

derive_longitude <- function(
  weather_station_name
) {
  LONGITUDES[weather_station_name]
}

download_file <- function(dest, url) {
  tryCatch({
    if (file.exists(dest)) {
      file.remove(dest)
    }
    if (!file.exists(dest)) {
      file.create(dest)
    }
    utils::download.file(
      url = url,
      destfile = dest,
      quiet = TRUE
    )
    TRUE
  },
  warning = function(cond) {
    FALSE
  },
  error = function(cond) {
    FALSE
  }
  )
}

extract_weather_station_name <- function(
  dir,
  file_path,
  file_extension
) {
  weather_station_name <- str_replace_all(
    file_path,
    dir,
    ""
  )
  weather_station_name <- str_replace_all(
    weather_station_name,
    file_extension,
    ""
  )
  str_replace_all(
    weather_station_name,
    "/",
    ""
  )
}

files_per_directory <- function(dir) {
  list.files(
    full.names = TRUE,
    path = dir
  )
}

generate_question_1a_data_frame_path <- function() {
  paste0(
    DIR_TECHNICALLY_CORRECT_ALL,
    "/",
    WEATHER_ALL_DATA_FRAMES_NO_NAS
  )
}

join_data_frames <- function(source_file_paths) {
  data_frame_destination <- WEATHER_EMPTY_DATA_FRAME
  for (source_file_path in source_file_paths) {
    data_frame <- readRDS(source_file_path)
    data_frame_destination <- rbind(
      data_frame_destination,
      data_frame
    )
  }
  data_frame_destination
}

load_question_1a_data_frame <- function(
  data_frame_path = generate_question_1a_data_frame_path()
) {
  readRDS(data_frame_path)
}

retrieve_txt_file_contents <- function(txt_file_path) {
  readChar(
    txt_file_path,
    file.info(txt_file_path)$size
  )
}

save_file <- function(contents, path, force = TRUE) {
  if (force & file.exists(path)) {
    file.remove(path)
  }
  file.create(path)
  write(
    contents,
    file = path
  )
}

save_rds_force <- function(data_frame, path, force = TRUE) {
  if (force & file.exists(path)) {
    file.remove(path)
  }
  file.create(path)
  saveRDS(
    data_frame,
    file = path
  )
}
