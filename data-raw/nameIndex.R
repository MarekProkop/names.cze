# Import files and build an index ----------------------------------

library(readr)
library(tidyr)
library(dplyr)

importNameFile <- function(filePath, maleOrFemale, forenameOrSurname) {
  read_csv(
    file = filePath,
    col_names = c("number", "name")
  ) %>%
    mutate(
      sex = maleOrFemale,
      type = forenameOrSurname
    ) %>%
    relocate(number, .after = last_col())
}

nameIndex <- bind_rows(
  importNameFile("data-raw/krestni_muzi.csv", "male", "forename"),
  importNameFile("data-raw/krestni_zeny.csv", "female", "forename"),
  importNameFile("data-raw/prijmeni_muzi.csv", "male", "surname"),
  importNameFile("data-raw/prijmeni_zeny.csv", "female", "surname")
) %>%
  mutate(name = tolower(name)) %>%
  pivot_wider(names_from = c(sex, type), values_from = number, values_fill = 0)


# Export data -------------------------------------------------------------

usethis::use_data(nameIndex, overwrite = TRUE, internal = TRUE, compress = "xz")
