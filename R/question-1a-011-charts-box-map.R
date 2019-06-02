library(dplyr)
library(ggplot2)
library(ggmap)
####################################################
#                                                  #
# EXPORTED FUNCTIONS (A-Z                          #
#                                                  #
####################################################
#' question_1a_010_charts_map
#' @export
question_1a_010_charts_map <- function(google_api_key) {
  ggmap::register_google(
    key = google_api_key
  )
  ggmap(
    get_googlemap(
      center = c(
        lon = -122.335167,
        lat = 47.608013
      ),
      zoom = 11,
      scale = 2,
      maptype = "terrain",
      color = "color"
    )
  ) +
    geom_point(
      aes(
        x = lon,
        y = lat
      )
    ) + theme(legend.position = "bottom")
}
