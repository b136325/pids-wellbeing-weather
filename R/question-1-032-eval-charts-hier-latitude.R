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
#' question_1_032_eval_charts_hierarchical_latitude
#' @export
question_1_032_eval_charts_hierarchical_latitude <- function(
  df = question_1_025_analysis_attach_pruned_cluster_values()
) {
  generate_latitude_charts(
    df,
    c(
      "hours_sun",
      "rain_mm",
      "temp_max_degrees_c",
      "temp_min_degrees_c"
    ),
    "cluster",
    generate_chart = generate_latitude_chart_with_cluster
  )
}
####################################################
#                                                  #
# NON EXPORTED FUNCTIONS (A-Z)                     #
#                                                  #
####################################################
generate_latitude_chart_with_cluster <- function(
  df,
  x_variable_name,
  cluster_variable_name,
  y_variable_name = "latitude"
) {
  x_axis_title <- capitalize(
    str_replace_all(
      x_variable_name,
      "_",
      " "
    )
  )
  y_axis_title <- capitalize(y_variable_name)
  ggplot(
    df,
    aes(
      x = !!sym(x_variable_name),
      y = !!sym(y_variable_name),
      colour = cluster
    )
  ) +
  geom_point() +
  ylim(50, 60) +
  labs(
    x = x_axis_title,
    y = y_axis_title
  )
}
