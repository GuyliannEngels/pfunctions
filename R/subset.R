#' Keep strings matching a pattern.
#'
#' strb_subset() is grep() with argument to stringr::str_subset().
#' strb_detect() is grepl() with argument to stringr::str_detect().
#' The {stringr} package depends on more than 50 packages while strb_* uses only R base.
#' For analyses that do not require a large amount of memory,
#' the strb_* functions seem to combine the advantages of basic R with the simple syntax of stringr.
#'
#'
#' @param string a character vector
#' @param pattern Pattern to look for
#' @param negate If TRUE, return non-matching elements
#'
#' @return A character vector.
#' @seealso [stringr::str_subset], [stringr::str_detect], [grep()] and [grepl()]
#' @export
#'
#' @examples
#'
#' fruit <- c("apple", "banana", "pear", "pineapple")
#' strb_subset(fruit, "^a")
#'
#' #fruit <- rep(c("apple", "banana", "pear", "pineapple"), 100000)
#' #bench::mark(
#' #  stringr::str_subset(fruit, "^a"),
#' #  strb_subset(fruit, "^a"),
#' #  grep("^a", fruit, value = TRUE),
#' #  stringi::stri_subset(fruit, regex = "^a"))
#'
strb_subset <- function(string, pattern, negate = FALSE) {
    grep(pattern = pattern, x = string, value = TRUE, invert = negate)
}

#' @rdname strb_subset
#' @export
strb_detect <- function(string, pattern, negate = FALSE) {
  if(negate == TRUE) {
    !grepl(pattern = pattern, x = string)
  }else{
    grepl(pattern = pattern, x = string)
  }
}
