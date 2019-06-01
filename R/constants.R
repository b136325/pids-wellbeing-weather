####################################################
#                                                  #
# 1. DIRECTORY CONSTANTS                           #
#                                                  #
####################################################
DIR_DATA_WEATHER <- "data/weather/"
DIR_RAW_DATA <- "data-raw/"
DIR_RAW_DATA_WEATHER <- paste0(
  DIR_RAW_DATA,
  "weather/"
)
DIR_RAW_DATA_WELLBEING <- paste0(
  DIR_RAW_DATA,
  "wellbeing/"
)
DIR_TECHNICALLY_CORRECT_WEATHER_TXT <- paste0(
  DIR_DATA_WEATHER,
  "stage-010-technically-correct-txt"
)
DIR_TECHNICALLY_CORRECT_WEATHER_DSV <- paste0(
  DIR_DATA_WEATHER,
  "stage-011-technically-correct-dsv"
)
DIR_TECHNICALLY_CORRECT_WEATHER_DATAFRAME <- paste0(
  DIR_DATA_WEATHER,
  "stage-012-technically-correct-dataframe"
)
DIR_TECHNICALLY_CORRECT_WEATHER_COMPLETE <- paste0(
  DIR_DATA_WEATHER,
  "stage-013-technically-correct-complete"
)
DIR_TECHNICALLY_CORRECT_ALL <- paste0(
  DIR_DATA_WEATHER,
  "stage-014-",
  "technically-correct-single-dataframe"
)
####################################################
#                                                  #
# 2. FILE EXTENSION CONSTANTS                      #
#                                                  #
####################################################
FILE_EXTENSION_DSV <- ".dsv"
FILE_EXTENSION_RDS <- ".Rds"
FILE_EXTENSION_TXT <- ".txt"
FILE_EXTENSION_XLS <- ".xls"
####################################################
#                                                  #
# 3. MET OFFICE CONSTANTS                          #
#                                                  #
####################################################
MET_OFFICE_URL_ROOT <- paste0(
  "http://www.metoffice.gov.uk/",
  "pub/data/weather/uk/climate/",
  "stationdata/"
)
MET_OFFICE_URL_SUFFIX <- "data.txt"
####################################################
#                                                  #
# 4. ONS CONSTANTS                                 #
#                                                  #
####################################################
ONS_URL_ROOT <- paste0(
  "https://www.ons.gov.uk/",
  "file?uri=/peoplepopulationandcommunity/",
  "wellbeing/datasets/",
  "measuringnationalwellbeingdomainsandmeasures/",
  "may2019/domainsandmeasures"
)
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
WEATHER_LAST_LINE_SEGMENT <- "^.+Campbell Stokes recorder."
WEATHER_STATION_CWMYSTWYTH <- "cwmystwyth"
WEATHER_STATION_LOWESTOFT <- "lowestoft"
WEATHER_STATION_NAIRN <- "nairn"
WEATHER_STATION_RINGWAY <- "ringway"
WEATHER_STATION_SOUTHAMPTON <- "southampton"
WEATHER_STATION_WHITBY <- "whitby"
WEATHER_STATION_NAMES <- list(
  "lerwick",
  "wickairport",
  "stornoway",
  WEATHER_STATION_NAIRN,
  "braemar",
  "tiree",
  "dunstaffnage",
  "leuchars",
  "paisley",
  "eskdalemuir",
  "ballypatrick",
  "durham",
  "newtonrigg",
  WEATHER_STATION_WHITBY,
  "armagh",
  "bradford",
  "sheffield",
  WEATHER_STATION_RINGWAY,
  "waddington",
  "suttonbonington",
  "shawbury",
  WEATHER_STATION_LOWESTOFT,
  WEATHER_STATION_CWMYSTWYTH,
  "cambridge",
  "aberporth",
  "rossonwye",
  "oxford",
  "cardiff",
  "heathrow",
  "manston",
  "yeovilton",
  "chivenor",
  WEATHER_STATION_SOUTHAMPTON,
  "eastbourne",
  "hurn",
  "camborne"
)
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
FAIL_MESSAGE_LABEL <- "FAIL "
NO_NEW_LINE_MESSAGE_LABEL <- "NO NEW LINE"
SUCCESS_MESSAGE_LABEL <- "SUCCESS "
WHITBY_BASE_INDEX <- 1
WHITBY_FIRST_LINE <- 1
WHITBY_TARGET_COUNT <- 7
