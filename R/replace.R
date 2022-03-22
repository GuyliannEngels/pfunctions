#' Keep strings matching a pattern.
#'
#' \code{strb_replace()} is \code{sub()} with argument to \code{stringr::str_replace()}.
#' \code{strb_replace_all()} is \code{gsub()} with argument to \code{stringr::str_replace_all()}.
#' The {stringr} package depends on more than 50 packages while strb_* uses only R base.
#' For analyses that do not require a large amount of memory,
#' the strb_* functions seem to combine the advantages of basic R with the simple syntax of stringr.
#'
#' @param string a character vector
#' @param pattern Pattern to look for
#' @param replacement A character vector of replacements.
#'
#' @return A character vector.
#' @seealso [stringr::str_replace()], [stringr::str_replace_all()] [sub()] and [gsub()]
#' @export
#'
#' @examples
#' fruit <- c("apple", "banana", "pear", "pineapple")
#' strb_replace(fruit, "^a", "_")
#' strb_replace_all(fruit, "^a", "_")
#'
strb_replace <- function(string, pattern, replacement) {
  sub(pattern = pattern, replacement = replacement, x = string)
}

#' @rdname strb_replace
#' @export
strb_replace_all <- function(string, pattern, replacement) {
  gsub(pattern = pattern, replacement = replacement, x = string)
}

