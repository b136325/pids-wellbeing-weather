WEATHER_ALL_DATA_FRAMES <- "all_data_frames.Rds"
WEATHER_ALL_DATA_FRAMES_NO_NAS <- "all_data_frames_no_nas.Rds"
WEATHER_COLUMN_NAMES <- c(
  "observation_year",
  "observation_month",
  "temp_max_degrees_c",
  "temp_min_degrees_c",
  "af_days",
  "rain_mm",
  "hours_sun",
  "provisional"
)
WEATHER_EMPTY_DATA_FRAME <- data.frame(
  `observation_year` = as.integer(integer()),
  `observation_month` = as.integer(integer()),
  `temp_max_degrees_c` = as.double(double()),
  `temp_min_degrees_c` = as.double(double()),
  `af_days` = as.integer(integer()),
  `rain_mm` = as.double(double()),
  `hours_sun` = as.double(double()),
  `provisional` = as.character(character()),
  `weather_station_name` = as.character(character()),
  `latitude` = as.double(double()),
  `longitude` = as.double(double())
)
WEATHER_LAST_LINE_SEGMENT <- "^.+Campbell Stokes recorder."
FAIL_MESSAGE_LABEL <- "FAIL "
NO_NEW_LINE_MESSAGE_LABEL <- "NO NEW LINE"
SUCCESS_MESSAGE_LABEL <- "SUCCESS "
WHITBY_BASE_INDEX <- 1
WHITBY_FIRST_LINE <- 1
WHITBY_TARGET_COUNT <- 7
