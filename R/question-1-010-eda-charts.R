library(dplyr)
library(ggplot2)
library(plotly)
####################################################
#                                                  #
# EXPORTED FUNCTIONS (A-Z                          #
#                                                  #
####################################################
#' question_1_010_eda_charts_hours_sun
#' 
#' Generate scatterplot charts comparing hours_sun with both latitude and longitude.
#' @examples
#' question_1_010_eda_charts_hours_sun()
#' @export
question_1_010_eda_charts_hours_sun <- function() {
  plot_ly(
    question_1a_001_data(scale = FALSE),
    x = ~hours_sun,
    y = ~longitude,
    z = ~latitude,
    marker = list(
      color = ~hours_sun,
      colorscale = c("#FFE1A1", "#683531"),
      showscale = TRUE
    )
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

#' question_1_010_eda_charts_rain
#' 
#' Generate scatterplot charts comparing rain with both latitude and longitude.
#' @examples
#' question_1_010_eda_charts_rain()
#' @export
question_1_010_eda_charts_rain <- function() {
  plot_ly(
    question_1a_001_data(scale = FALSE),
    x = ~rain_mm,
    y = ~longitude,
    z = ~latitude,
    marker = list(
      color = ~rain_mm,
      colorscale = c("#0033CC", "#CCD9ff"),
      showscale = TRUE
    )
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

#' question_1_010_eda_charts_max_temp
#' 
#' Generate scatterplot charts comparing max_temp with both latitude and longitude.
#' @examples
#' question_1_010_eda_charts_max_temp()
#' @export
question_1_010_eda_charts_max_temp <- function() {
  plot_ly(
    question_1a_001_data(scale = FALSE),
    x = ~temp_max_degrees_c,
    y = ~longitude,
    z = ~latitude,
    marker = list(
      color = ~temp_max_degrees_c,
      colorscale = c("#0033CC", "#CCD9ff"),
      showscale = TRUE
    )
  ) %>%
    add_markers() %>%
    layout(
      scene = list(
        xaxis = list(title = "Max temp (degrees c)"),
        yaxis = list(title = "Longitude"),
        zaxis = list(title = "Latitude")
      )
    )
}

#' question_1_010_eda_charts_min_temp
#' 
#' Generate scatterplot charts comparing max_temp with both latitude and longitude.
#' @examples
#' question_1_010_eda_charts_min_temp()
#' @export
question_1_010_eda_charts_min_temp <- function() {
  plot_ly(
    question_1a_001_data(scale = FALSE),
    x = ~temp_min_degrees_c,
    y = ~longitude,
    z = ~latitude,
    marker = list(
      color = ~temp_min_degrees_c,
      colorscale = c("#0033CC", "#CCD9ff"),
      showscale = TRUE
    )
  ) %>%
    add_markers() %>%
    layout(
      scene = list(
        xaxis = list(title = "Min temp (degrees c)"),
        yaxis = list(title = "Longitude"),
        zaxis = list(title = "Latitude")
      )
    )
}
