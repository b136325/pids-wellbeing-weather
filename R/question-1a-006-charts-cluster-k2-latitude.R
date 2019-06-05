library(dplyr)
library(ggplot2)
# Begin Exclude Linting
library(gridExtra)
# End Exclude Linting
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
  cluster_variable_name,
  y_variable_name,
  y_lim_lower_boundary,
  y_lim_upper_boundary
) {
  data_frame %>%
    ggplot(
      aes(
        x = !!sym(x_variable_name),
        y = !!sym(y_variable_name),
        color = !!sym(cluster_variable_name)
      )
    ) + 
    geom_point() + 
    ylim(
      y_lim_lower_boundary, 
      y_lim_upper_boundary
    )
}

generate_latitude_charts_with_cluster_colour <- function(
  data_frame,
  x_variable_names,
  cluster_variable_name,
  y_variable_name = "latitude",
  y_lim_lower_boundary = 50,
  y_lim_upper_boundary = 60
) {
  charts <- list()
  i <- 1
  for (x_variable_name in x_variable_names) {
    charts[[i]] <- generate_latitude_chart_with_cluster_colour(
      data_frame,
      x_variable_name,
      cluster_variable_name,
      y_variable_name,
      y_lim_lower_boundary,
      y_lim_upper_boundary
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
