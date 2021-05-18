test_that("inspect_name() retrieves the correct name", {
  e = tidyr::tibble(name = "josef", male_forename = 249922, female_forename = 2, male_surname = 105, female_surname = 0)
  expect_equal(inspect_name("Josef"), e)
  expect_equal(inspect_name("xxxxx"), NA)
})
