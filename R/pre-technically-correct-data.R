destination_dir <- "data/pre-technically-correct-data"
source_dir <- "data-raw/weather"

#' build_pre_technically_correct_data
#' @export
build_pre_technically_correct_data <- function(force = FALSE) {
    source_file_paths <- list.files(path = source_dir, full.names = TRUE)
    destination_file_paths <- source_file_paths
    gsub("data-raw", "data/pre-technically-correct-data", destination_file_paths)
    
    ### USE STRINGR
    print(destination_file_paths)
}

build_pre_technically_correct_data()