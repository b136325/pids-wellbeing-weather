library(readr)
####################################################
#                                                  #
# EXPORTED FUNCTION                                #
#                                                  #
####################################################
#' stage_013
#' @export
stage_013 <- function(
  source_dir = DIR_TECHNICALLY_CORRECT_WEATHER_DATAFRAME,
  destination_dir = DIR_TECHNICALLY_CORRECT_WEATHER_COMPLETE,
  force = TRUE
) {
  source_file_paths <- files_per_directory(
    source_dir
  )
  for (source_file_path in source_file_paths) {
    destination_data_frame <- readRDS(source_file_path)
    destination_file_path <- derive_destination_file_path(
      destination_dir,
      FILE_EXTENSION_RDS,
      source_dir,
      FILE_EXTENSION_RDS,
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
  }
}
####################################################
#                                                  #
# NON EXPORTED FUNCTIONS (A-Z)                     #
#                                                  #
####################################################