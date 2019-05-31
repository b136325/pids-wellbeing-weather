library(readr)

#' load_technically_correct_dataframe
#' @export
load_technically_correct_dataframe <- function(
  destination_dir = DIR_TECHNICALLY_CORRECT_WEATHER_DATAFRAME,
  source_dir = DIR_TECHNICALLY_CORRECT_WEATHER_DSV
) {
  source_file_paths <- list.files(
    full.names = TRUE,
    path = source_dir
  )
  for (source_file_path in source_file_paths) {
    destination_data_frame <- read_delim(
      source_file_path,
      delim = " ",
      col_names = c(
        "observation_year", "observation_month", "temp_max_degrees_c", "temp_min_degrees_c", "af_days", "rain_mm", "hours_sun", "provisional"   
      ),
      col_types = cols(
        `observation_year` = col_character(),
        `observation_month` = col_character(),
        `temp_max_degrees_c` = col_character(),
        `temp_min_degrees_c` = col_character(),
        `af_days` = col_character(),
        `rain_mm` = col_character(),
        `hours_sun` = col_character(),
        provisional = col_character()
      )
    )
    destination_data_frame <- destination_data_frame[-c(1, 2), ]
    destination_file_path <- str_replace_all(
      source_file_path,
      source_dir,
      destination_dir
    )
    destination_file_path <- str_replace_all(
      destination_file_path,
      ".dsv",
      ".Rda"
    )
    save(
      destination_data_frame,
      file = destination_file_path
    )
  }
}
