data("ae")

missing_list <- colSums(as.data.frame(is.na(ae)))
result <- missing_list[missing_list == min(missing_list)]

test_that("The get_min_na() function works", {
  expect_equal(get_min_na(ae), result)
})
