data(ae)

missing_list <- colSums(as.data.frame(is.na(data)))
result <- missing_list[missing_list == max(missing_list)]

test_that("The get_na() function works", {
  expect_equal(get_max_na(ae), result)
})
