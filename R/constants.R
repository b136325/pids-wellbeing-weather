####################################################
#                                                  #
# 1. DIRECTORY CONSTANTS                           #
#                                                  #
####################################################

####################################################
#                                                  #
# 2. FILE EXTENSION CONSTANTS                      #
#                                                  #
####################################################

####################################################
#                                                  #
# 4. ONS CONSTANTS                                 #
#                                                  #
####################################################

####################################################
#                                                  #
# 5. WEATHER CONSTANTS                             #
#                                                  #
####################################################
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

####################################################
#                                                  #
# 6. WELLBEING CONSTANTS                           #
#                                                  #
####################################################
WELLBEING_DEST_FILE_NAME <- "2019-spring"
WELLBEING_SOURCE_FILE_NAME <- "spring2019"
####################################################
#                                                  #
# 7. MISC                                          #
#                                                  #
####################################################

####################################################
#                                                  #
# 8. LATITUDES                                     #
#                                                  #
####################################################

####################################################
#                                                  #
# 8. LATITUDES                                     #
#                                                  #
####################################################





####################################################
#                                                  #
# 12. WELLBING HAPPINESS PATHS                     #
#                                                  #
####################################################
WELLBEING_HAPPINESS_FILE_NAME <- "happiness"
DATA_RAW_WELLBEING_HAPPINESS_PATH <- paste0(
  DIR_RAW_DATA_WELLBEING,
  WELLBEING_HAPPINESS_FILE_NAME,
  FILE_EXTENSION_CSV
)
DATA_WELLBEING_HAPPINESS_PATH <- paste(
  DIR_DATA_WELLBEING,
  WELLBEING_HAPPINESS_FILE_NAME,
  FILE_EXTENSION_RDS
)

