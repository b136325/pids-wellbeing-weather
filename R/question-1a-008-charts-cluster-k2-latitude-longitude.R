library(dplyr)
library(ggplot2)
library(plotly)
####################################################
#                                                  #
# EXPORTED FUNCTIONS (A-Z                          #
#                                                  #
####################################################
#' question_1a_008_charts_cluster_k2_latitude_longitude_hours_sun
#' @export
question_1a_008_charts_cluster_k2_latitude_longitude_hours_sun <- function() {
  plot_ly(
    question_1a_004_kmeans()$data_frame,
    x = ~hours_sun,
    y = ~longitude,
    z = ~latitude,
    color = ~cluster_2,
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

#' question_1a_008_charts_cluster_k2_latitude_longitude_rain
#' @export
question_1a_008_charts_cluster_k2_latitude_longitude_rain <- function() {
  plot_ly(
    question_1a_004_kmeans()$data_frame,
    x = ~rain_mm,
    y = ~longitude,
    z = ~latitude,
    color = ~cluster_2,
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

#' question_1a_008_charts_cluster_k2_latitude_longitude_temp_max
#' @export
question_1a_008_charts_cluster_k2_latitude_longitude_temp_max <- function() {
  plot_ly(
    question_1a_004_kmeans()$data_frame,
    x = ~temp_max_degrees_c,
    y = ~longitude,
    z = ~latitude,
    color = ~cluster_2,
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

#' question_1a_008_charts_cluster_k2_latitude_longitude_temp_min
#' @export
question_1a_008_charts_cluster_k2_latitude_longitude_temp_min <- function() {
  plot_ly(
    question_1a_004_kmeans()$data_frame,
    x = ~temp_min_degrees_c,
    y = ~longitude,
    z = ~latitude,
    color = ~cluster_2,
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
