####################################################
#                                                  #
# EXPORTED FUNCTIONS (A-Z                          #
#                                                  #
####################################################
#' question_1_037_automated
#' @export
question_1_037_automated <- function() {
  question_1_001_svc_raw_data()
  question_1_002_svc_tech_weather_txt()
  question_1_003_svc_tech_weather_dsv()
  question_1_004_svc_tech_weather_df()
  question_1_005_svc_tech_weather_complete()
  question_1_006_svc_tech_weather_single_df()
  question_1_008_svc_cons_grouped_data()
  question_1_011_eda_remove_outliers()
  k_value <- question_1_020_prep_k_choice()
  question_1_025_analysis_attach_pruned_cluster_values(
    k_value = k_value
  )
}
