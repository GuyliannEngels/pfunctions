#' Extract patterns from a string.
#'
#' strb_extract() is the combination of \code{regexpr()} and \code{regmatches()} with argument to \code{stringr::str_subset()}.
#' This function is slower and requires more memory than the {stringr} functions.
#' The {stringr} package depends on more than 50 packages while strb_* uses only R base.
#' For analyses that do not require a large amount of memory,
#' the strb_* functions seem to combine the advantages of basic R with the simple syntax of stringr.
#'
#' @param string a character vector
#' @param pattern Pattern to look for
#'
#' @return A character vector.
#' @seealso [stringr::str_extract], [regexpr()] and [regmatches()]
#' @export
#'
#' @examples
#'
#' shopping_list <- c("apples x4", "bag of flour", "bag of sugar", "milk x2")
#' strb_extract(string  = shopping_list, pattern = "\\d")
#' strb_extract(shopping_list, pattern = "[a-z]+")
#' strb_extract(shopping_list, "[a-z]{1,4}")
#' strb_extract(shopping_list, "\\b[a-z]{1,4}\\b")
#'
#' # shopping_list <- rep(
#'     c("apples x4", "bag of flour", "bag of sugar", "milk x2"),
#'     100000)
#'
#' #bench::mark(
#'   #strb_extract(shopping_list, "\\b[a-z]{1,4}\\b"),
#'   #stringr::str_extract(shopping_list, "\\b[a-z]{1,4}\\b"))
#'

strb_extract <- function(string, pattern) {
  res <- regexpr(pattern = pattern, text = string)
  res[res>0] <- regmatches(x = string, m = res)
  res[res<0] <- NA
  attributes(res) <- NULL
  res
}



