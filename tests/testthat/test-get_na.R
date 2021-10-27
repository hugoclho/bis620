data("ae")

test_result <- colSums(as.data.frame(is.na(ae)))

test_that("The get_na() function works", {
  expect_equal(get_na(ae), test_result)
})

# test_that("The hello function works with other parameters", {
#   expect_equal(hello(FALSE, TRUE), "Hello!")
# })
