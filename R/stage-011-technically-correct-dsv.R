library(stringr)

#' load_technically_correct_dsv
#' @export
load_technically_correct_dsv <- function(
  destination_dir = DIR_TECHNICALLY_CORRECT_WEATHER_DSV,
  source_dir = DIR_TECHNICALLY_CORRECT_WEATHER_TXT
) {
  source_file_paths <- list.files(
    full.names = TRUE,
    path = source_dir
  )
  for (source_file_path in source_file_paths) {
    source_file_contents <- readChar(
      source_file_path,
      file.info(source_file_path)$size
    )
    destination_file_contents <- sub(
      "^.+Campbell Stokes recorder.", 
      "",
      source_file_contents
    )
    if (str_detect(destination_file_contents, "Campbell Stokes recorder")) {
      print("ERROR 1")
    }
    destination_file_contents <- str_replace(
      destination_file_contents,
      "^\r\n  ", 
      ""
    )
    if (str_detect(destination_file_contents, "^\r\n  ")) {
      print("ERROR 2")
    }
    
    destination_file_contents <- str_replace_all(
      destination_file_contents,
      "---", 
      "NA"
    )
    
    if (str_detect(destination_file_contents, "---")) {
      print("ERROR 3")
    }
    
    destination_file_contents <- str_replace_all(
      destination_file_contents,
      "\r", 
      " NA\r"
    )
    
    destination_file_contents <- str_replace_all(
      destination_file_contents,
      "hours\r", 
      " hours NA\r"
    )
    
    destination_file_contents <- str_replace_all(
      destination_file_contents,
      "degC    degC", 
      "NA NA degC    degC"
    )
    
    destination_file_contents <- str_replace_all(
      destination_file_contents,
      "# NA", 
      " NA"
    )
    
    destination_file_contents <- str_replace_all(
      destination_file_contents,
      "Provisional NA", 
      "Provisional"
    )
    
    destination_file_contents <- str_replace_all(
      destination_file_contents,
      "Site closed NA", 
      "Site closed NA NA NA NA NA NA"
    )
    
    destination_file_path <- str_replace_all(
      source_file_path,
      source_dir,
      destination_dir
    )
    destination_file_path <- str_replace(
      destination_file_path,
      ".txt",
      ".dsv"
    )
    if (file.exists(destination_file_path)) {
      file.remove(destination_file_path)
    }
    file.create(destination_file_path)
    write(
      destination_file_contents, 
      file = destination_file_path
    )
  }
}
