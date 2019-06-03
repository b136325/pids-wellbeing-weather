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
####################################################
#                                                  #
# 8. LATITUDES                                     #
#                                                  #
####################################################
LATITUDES <- list()
LATITUDES[["lerwick"]] <- 60.139
LATITUDES[["wickairport"]] <- 58.454
LATITUDES[["stornoway"]] <- 58.214
LATITUDES[[WEATHER_STATION_NAIRN]] <- 57.593
LATITUDES[["braemar"]] <- 57.006
LATITUDES[["tiree"]] <- 56.500
LATITUDES[["dunstaffnage"]] <- 56.451
LATITUDES[["leuchars"]] <- 56.377
LATITUDES[["paisley"]] <- 55.846
LATITUDES[["eskdalemuir"]] <- 55.311
LATITUDES[["ballypatrick"]] <- 55.181
LATITUDES[["durham"]] <- 54.768
LATITUDES[["newtonrigg"]] <- 54.670
LATITUDES[[WEATHER_STATION_WHITBY]] <- 54.481
LATITUDES[["armagh"]] <- 54.352
LATITUDES[["bradford"]] <- 53.813
LATITUDES[["sheffield"]] <- 53.381
LATITUDES[[WEATHER_STATION_RINGWAY]] <- 53.356
LATITUDES[["waddington"]] <- 53.175
LATITUDES[["suttonbonington"]] <- 52.833
LATITUDES[["shawbury"]] <- 52.794
LATITUDES[[WEATHER_STATION_LOWESTOFT]] <- 52.483
LATITUDES[[WEATHER_STATION_CWMYSTWYTH]] <- 52.358
LATITUDES[["cambridge"]] <- 52.245
LATITUDES[["aberporth"]] <- 52.139
LATITUDES[["rossonwye"]] <- 51.911
LATITUDES[["oxford"]] <- 51.761
LATITUDES[["cardiff"]] <- 51.488
LATITUDES[["heathrow"]] <- 51.479
LATITUDES[["manston"]] <- 51.346
LATITUDES[["yeovilton"]] <- 51.006
LATITUDES[["chivenor"]] <- 51.089
LATITUDES[[WEATHER_STATION_SOUTHAMPTON]] <- 50.898
LATITUDES[["eastbourne"]] <- 50.762
LATITUDES[["hurn"]] <- 50.779
LATITUDES[["camborne"]] <- 50.218
####################################################
#                                                  #
# 8. LATITUDES                                     #
#                                                  #
####################################################
LONGITUDES <- list()
LONGITUDES[["lerwick"]] <- -1.183
LONGITUDES[["wickairport"]] <- -3.088
LONGITUDES[["stornoway"]] <- -6.318
LONGITUDES[[WEATHER_STATION_NAIRN]] <- -3.821
LONGITUDES[["braemar"]] <- -3.396
LONGITUDES[["tiree"]] <- -6.880
LONGITUDES[["dunstaffnage"]] <- -5.439
LONGITUDES[["leuchars"]] <- -2.861
LONGITUDES[["paisley"]] <- -4.430
LONGITUDES[["eskdalemuir"]] <- -3.206
LONGITUDES[["ballypatrick"]] <- -6.153
LONGITUDES[["durham"]] <- -1.585
LONGITUDES[["newtonrigg"]] <- -2.786
LONGITUDES[[WEATHER_STATION_WHITBY]] <- -0.624
LONGITUDES[["armagh"]] <- -6.649
LONGITUDES[["bradford"]] <- -1.772
LONGITUDES[["sheffield"]] <- -1.490
LONGITUDES[[WEATHER_STATION_RINGWAY]] <- -2.279
LONGITUDES[["waddington"]] <- -0.522
LONGITUDES[["suttonbonington"]] <- -1.250
LONGITUDES[["shawbury"]] <- -2.663
LONGITUDES[[WEATHER_STATION_LOWESTOFT]] <- 1.727
LONGITUDES[[WEATHER_STATION_CWMYSTWYTH]] <- -3.802
LONGITUDES[["cambridge"]] <- 0.102
LONGITUDES[["aberporth"]] <- -4.570
LONGITUDES[["rossonwye"]] <- -2.584
LONGITUDES[["oxford"]] <- -1.262
LONGITUDES[["cardiff"]] <- -3.187
LONGITUDES[["heathrow"]] <- -0.449
LONGITUDES[["manston"]] <- 1.337
LONGITUDES[["yeovilton"]] <- -2.641
LONGITUDES[["chivenor"]] <- -4.147
LONGITUDES[[WEATHER_STATION_SOUTHAMPTON]] <- -1.408
LONGITUDES[["eastbourne"]] <- 0.285
LONGITUDES[["hurn"]] <- -1.835
LONGITUDES[["camborne"]] <- -5.327
####################################################
#                                                  #
# 9. K-MEANS                                       #
#                                                  #
####################################################
MAX_NUM_K <- 10
MAX_NUM_ITERATIONS <- 100
SEED_DEFAULT <- 20
####################################################
#                                                  #
# 10. LATITUDE CATGEORY BOUNDARIES                 #
#                                                  #
####################################################
LATITUDE_CATEGORY_BOTTOM_LOWER_BOUNDARY <- 49.9
LATITUDE_CATEGORY_BOTTOM_UPPER_BOUNDARY <- 53.567
LATITUDE_CATEGORY_MIDDLE_LOWER_BOUNDARY <- 53.567
LATITUDE_CATEGORY_MIDDLE_UPPER_BOUNDARY <- 57.234
LATITUDE_CATEGORY_TOP_LOWER_BOUNDARY <- 57.234
LATITUDE_CATEGORY_TOP_UPPER_BOUNDARY <- 60.9
####################################################
#                                                  #
# 11. HEX COLOURS                                  #
#                                                  #
####################################################
HEX_COLOUR_RED <- "#DC143C"
HEX_COLOUR_ORANGE <- "#FF8C00"
HEX_COLOUR_GREEN <- "#008000"
HEX_COLOURS_TRIPLE <- c(
  HEX_COLOUR_RED,
  HEX_COLOUR_ORANGE,
  HEX_COLOUR_GREEN
)
