test_that("get_sex guesses corectly", {
  expect_equal(get_sex("Josef"), "male")
  expect_equal(get_sex("Rut", 0.9), NA_character_)
  expect_equal(get_sex(c("Josef", "Vlasta", "Alex")), c("male", "female", "male"))
  expect_equal(get_sex(c("Josef", "Vlasta", "Alex"), 0.99), c("male", "female", NA_character_))
})
