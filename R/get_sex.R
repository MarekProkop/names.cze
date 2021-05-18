#' Guess Sex from a personal name
#'
#' @param x A character vector of personal names.
#' @param threshold Minimum probability to guess sex. If real probability is lower, the function returns NA.
#'
#' @return Either "male", or "female", or NA.
#' @export
#'
#' @examples
get_sex <- function(x, threshold = 0.5) {
  df <- nameIndex
  x <- tolower(x)
  dplyr::left_join(data.frame(name = x), df, by = c("name" = "name")) %>%
    dplyr::mutate(
      male_prop = (male_forename + male_surname) / (male_forename + female_forename + male_surname + female_surname),
      sex = dplyr::if_else(
        male_prop >= threshold,
        "male",
        dplyr::if_else(
          1 - male_prop >= threshold,
          "female",
          NA_character_
        )
      )
    ) %>%
    dplyr::pull(sex)
}
