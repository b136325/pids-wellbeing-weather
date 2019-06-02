library(dplyr)
library(ggplot2)
library(gridExtra)
####################################################
#                                                  #
# EXPORTED FUNCTIONS (A-Z                          #
#                                                  #
####################################################
#' question_1a_006_charts_cluster_k2_latitude
#' @export
question_1a_006_charts_cluster_k2_latitude <- function() {
  cluster_results <- question_1a_004_kmeans()
  generate_latitude_charts_with_cluster_colour(
    cluster_results$data_frame,
    c(
      "hours_sun",
      "rain_mm",
      "temp_max_degrees_c",
      "temp_min_degrees_c"
    ),
    "cluster_2"
  )
}
####################################################
#                                                  #
# NON EXPORTED FUNCTIONS (A-Z)                     #
#                                                  #
####################################################
generate_latitude_chart_with_cluster_colour <- function(
  data_frame,
  x_variable_name,
  cluster_variable_name
) {
  data_frame %>%
    ggplot(
      aes(
        x = !!sym(x_variable_name),
        y = latitude,
        color = !!sym(cluster_variable_name)
      )
    ) + geom_point() + ylim(50, 60)
}

generate_latitude_charts_with_cluster_colour <- function(
  data_frame,
  x_variable_names,
  cluster_variable_name
) {
  charts <- list()
  i <- 1
  for (x_variable_name in x_variable_names) {
    charts[[i]] <- generate_latitude_chart_with_cluster_colour(
      data_frame,
      x_variable_name,
      cluster_variable_name
    )
    i <- i + 1
  }
  grid.arrange(
    charts[[1]],
    charts[[2]],
    charts[[3]],
    charts[[4]]
  )
}
