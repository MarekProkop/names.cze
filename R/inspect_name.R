inspect_name <- function(x) {
  result <- names.cze::nameIndex[names.cze::nameIndex$name == tolower(x), ]
  if (nrow(result) > 0) {
    return(result)
  } else {
    return(NA)
  }
}
