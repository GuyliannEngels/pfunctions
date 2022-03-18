#' Check if the YAML is complete
#'
#' The YAML metadata begins the R markdown document.
#' This information are use by Pandoc, rmarkdown, and knitr.
#' It includes several instructions in the form key-value.
#' The information provided can influence the code, content, and the rendering process.
#'
#' @param path The path of rmd file
#' @param n The default number of lines read from the R markdown document
#' @param keys The keys to be assessed
#' @param values Values considered invalid
#'
#' @importFrom yaml yaml.load
#' @return a logical vector
#' @export
#'
#' @examples
#'
#' #is_complete_yaml(path= "rmd_file")
#'
is_complete_yaml <- function(path, n = 50, keys = c("title", "author", "date"), values = c("___", "", " ", "---", "...", "sv")) {

  rmd_content <- readLines(path, n = n)
  yaml_limit <- grep("^---", rmd_content)[1:2]

  if(length(yaml_limit) != 2)
    stop("The yaml is not standart structure.")

  n_line <- (yaml_limit[1]+1):(yaml_limit[2]-1)
  yaml_parse <- yaml::yaml.load(rmd_content[n_line])

  res <- vector(mode = "logical", length = length(keys))
  names(res) <- keys

  for(i in 1:length(keys)) {
     if(!is.null(yaml_parse[[keys[i]]])) {
       res[[keys[i]]] <- !yaml_parse[[keys[i]]] %in% values
    }
  }

  res
}



