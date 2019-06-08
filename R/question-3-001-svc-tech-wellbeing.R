library(dplyr)
library(readr)
library(tidyr)
####################################################
#                                                  #
# EXPORTED FUNCTION                                #
#                                                  #
####################################################
#' question_3_001_svc_tech_wellbeing
#' @export
question_3_001_svc_tech_wellbeing <- function(
  source_file_path = DATA_RAW_WELLBEING_HAPPINESS_PATH,
  destination_file_path = DATA_WELLBEING_HAPPINESS_PATH,
  force = TRUE
) {
  if (!file.exists(source_file_path)) {
    stop("Happiness data-raw file does not exists")
  }
  data_frame <- load_happiness(
    source_file_path
  )
  data_frame <- rename_happiness_columns(
    data_frame
  )
  data_frame <- data_frame %>%
    filter(
      region != "England"
    ) %>%
    mutate(
      region = tolower(region)
    ) %>%
    mutate(
      region = str_replace_all(region, " ", "_")
    )
  create_destination_file(
    destination_file_path,
    force
  )
  saveRDS(
    data_frame,
    file = destination_file_path
  )
}
####################################################
#                                                  #
# NON EXPORTED FUNCTIONS (A-Z)                     #
#                                                  #
####################################################
create_destination_file <- function(
  destination_file_path,
  force
) {
  if (force && file.exists(destination_file_path)) {
    file.remove(destination_file_path)
  }
  file.create(destination_file_path)
}

load_happiness <- function(happiness_csv_path) {
  read_csv(
    happiness_csv_path,
    col_types = list(
      col_factor(),
      col_double(),
      col_double(),
      col_double()
    )
  )
}
rename_happiness_columns <- function(data_frame) {
  data_frame %>%
    select(
      region = region_rename,
      happiness = happiness_rename,
      lower_confidence_interval,
      upper_confidence_interval
    )
}
