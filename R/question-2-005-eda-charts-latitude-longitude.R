library(dplyr)
library(ggplot2)
library(plotly)
####################################################
#                                                  #
# EXPORTED FUNCTIONS (A-Z                          #
#                                                  #
####################################################
#' question_2_005_eda_charts_latitude_longitude_hours_sun
#' @export
question_2_005_eda_charts_latitude_longitude_hours_sun <- function(
  df = question_2_001_bu_append_latitude_categories()
) {
  plot_ly(
    df,
    x = ~hours_sun,
    y = ~longitude,
    z = ~latitude,
    color = ~latitude_category,
    colors = HEX_COLOURS_TRIPLE
  ) %>%
    add_markers() %>%
    layout(
      scene = list(
        xaxis = list(title = "Hours sunshine"),
        yaxis = list(title = "Longitude"),
        zaxis = list(title = "Latitude")
      )
    )
}

#' question_2_005_eda_charts_latitude_longitude_rain_mm
#' @export
question_2a_005_eda_charts_latitude_longitude_rain_mm <- function(
  df = question_2_001_bu_append_latitude_categories()
) {
  plot_ly(
    df,
    x = ~rain_mm,
    y = ~longitude,
    z = ~latitude,
    color = ~latitude_category,
    colors = HEX_COLOURS_TRIPLE
  ) %>%
    add_markers() %>%
    layout(
      scene = list(
        xaxis = list(title = "Rain (mm)"),
        yaxis = list(title = "Longitude"),
        zaxis = list(title = "Latitude")
      )
    )
}

#' question_2_005_eda_charts_latitude_longitude_temp_max
#' @export
question_2_005_eda_charts_latitude_longitude_temp_max <- function(
  df = question_2_001_bu_append_latitude_categories()
) {
  plot_ly(
    df,
    x = ~temp_max_degrees_c,
    y = ~longitude,
    z = ~latitude,
    color = ~latitude_category,
    colors = HEX_COLOURS_TRIPLE
  ) %>%
    add_markers() %>%
    layout(
      scene = list(
        xaxis = list(title = "Temp max (degrees c)"),
        yaxis = list(title = "Longitude"),
        zaxis = list(title = "Latitude")
      )
    )
}

#' question_2_005_eda_charts_latitude_longitude_temp_min
#' @export
question_2_005_eda_charts_latitude_longitude_temp_min <- function(
  df = question_2_001_bu_append_latitude_categories()
) {
  plot_ly(
    df,
    x = ~temp_min_degrees_c,
    y = ~longitude,
    z = ~latitude,
    color = ~latitude_category,
    colors = HEX_COLOURS_TRIPLE
  ) %>%
    add_markers() %>%
    layout(
      scene = list(
        xaxis = list(title = "Temp min (degrees c)"),
        yaxis = list(title = "Longitude"),
        zaxis = list(title = "Latitude")
      )
    )
}
