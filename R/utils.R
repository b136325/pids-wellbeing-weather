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

files_per_directory <- function(dir) {
  list.files(
    full.names = TRUE,
    path = dir
  )
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
