#' Get summary on a single name
#'
#' @param x character
#'
#' @return dataframe
#' @export
#'
#' @examples
inspect_name <- function(x) {
  result <- nameIndex[nameIndex$name == tolower(x), ]
  if (nrow(result) > 0) {
    return(result)
  } else {
    return(NA)
  }
}
