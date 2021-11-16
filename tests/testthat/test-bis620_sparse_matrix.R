########################################################
# Data Preparation
########################################################
x1 <- bis620_sparse_matrix(
  i = c(1, 2, 5, 6),
  j = c(2, 2, 6, 1),
  x = c(4.3, 5.6, 7, 10)
)

set.seed(1)

x2 <- matrix(rnorm(36), ncol = 6)

set.seed(1)

x3 <- Matrix::Matrix(rnorm(36), ncol = 6)

x4 <- Matrix::sparseMatrix(
  i = c(1, 1, 3, 6),
  j = c(2, 3, 5, 1),
  x = c(4.3, 5.6, 7, 10),
  dims = c(6, 6)
)

########################################################
# Run test cases
########################################################
test_1 <- bis620_sparse_matrix(
  i = c(1, 2, 5, 6),
  j = c(2, 2, 6, 1),
  x = c(8.6, 11.2, 14.0, 20.0)
)

test_that("x1 + x1 works", {
  expect_equal(sparse2dense(x1 + x1), sparse2dense(test_1))
})

########################################################
test_2 <- t(sparse2dense(x1)) %*% sparse2dense(x1)

test_that("t(x1) %*% x1 works", {
  expect_equal(sparse2dense(t(x1) %*% x1), test_2)
})

########################################################
test_3 <- dense2sparse(sparse2dense(x1) %*% sparse2dense(x1))

test_that("x1 %*% x1 works", {
  expect_equal(sparse2dense(x1 %*% x1), sparse2dense(test_3))
})

########################################################
test_4 <- sparse2dense(x1) + t(x2)

test_that("x1 + t(x2) works", {
  expect_equal(x1 + t(x2), test_4)
})


########################################################
test_5 <- sparse2dense(x1) %*% x2

test_that("x1 %*% x2 works", {
  expect_equal(x1 %*% x2, test_5)
})


########################################################
test_6 <- x3 + sparse2dense(x1)

test_that("x3 + x1 works", {
  expect_equal(x3 + x1, test_6)
})

########################################################
test_7 <- x3 %*% x3

test_that("x3 %*% x3 works", {
  expect_equal(x3 %*% x3, test_7)
})

########################################################
test_8 <- sparse2dense(x1) + x4

test_that("x1 + x4 works", {
  expect_equal(x1 + x4, test_8)
})

########################################################
test_9 <- sparse2dense(x1) %*% x4

test_that("x1 %*% x4 works", {
  expect_equal(x1 %*% x4, test_9)
})




