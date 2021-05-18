get_sex <- function(x, threshold = 0.5) {
  require(dplyr)
  df <- names.cze::nameIndex
  x <- tolower(x)
  substr(x, 1, 1) <- toupper(substr(x, 1, 1))
  left_join(data.frame(nominative = x), df, by = c("nominative" = "nominative")) %>%
    mutate(
      sex = if_else(
        male_prop >= threshold,
        "male",
        if_else(
          1 - male_prop >= threshold,
          "female",
          NA_character_
        )
      )
    ) %>%
    pull(sex)
}
