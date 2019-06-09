####################################################
#                                                  #
# EXPORTED FUNCTIONS (A-Z                          #
#                                                  #
####################################################
#' question_3_005_eda_charts_wellbeing_by_region
#' @export
question_3_005_eda_charts_wellbeing_by_region <- function(
  df = question_3_003_svc_cons_weather_wellbeing_join()
) {
  generate_happiness_charts_by_region(
    df,
    x_variable_names = c(
      "hours_sun",
      "rain_mm",
      "temp_max_degrees_c",
      "temp_min_degrees_c"
    ),
    y_variable_name = "happiness",
    cluster_variable_name = "region"
  )
}

####################################################
#                                                  #
# NON EXPORTED FUNCTIONS (A-Z)                     #
#                                                  #
####################################################
generate_happiness_chart_by_region <- function(
  df,
  x_variable_name,
  y_variable_name,
  cluster_variable_name
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
      colour = !!sym(cluster_variable_name)
    )
  ) +
    geom_point() +
    labs(
      x = x_axis_title,
      y = y_axis_title
    )
}

generate_happiness_charts_by_region <- function(
  df,
  x_variable_names,
  y_variable_name,
  cluster_variable_name,
  generate_chart = generate_happiness_chart_by_region
) {
  charts <- list()
  i <- 1
  for (x_variable_name in x_variable_names) {
    charts[[i]] <- generate_chart(
      df = df,
      x_variable_name,
      y_variable_name,
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
