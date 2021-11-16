#' @title Creating Sparse Matrix
#'
#' @description This function helps create a sparse matrix which contains only non-zero values cells
#' @param i number of rows
#' @param j number of columns
#' @param x cell value corresponding to the specified row and column
#'
#'
#' @return min_list columns with the maximum number of NA
#' @examples
#'
#'x1 <- bis620_sparse_matrix(
#'     i = c(1, 2, 5, 6),
#'     j = c(2, 2, 6, 1),
#'     x = c(4.3, 5.6, 7, 10)
#'     )
#'
#' @export bis620_sparse_matrix
bis620_sparse_matrix <- function(i, j, x) {
  # new() is creating a new object
  methods::new("bis620_sparse_matrix",
      i = as.integer(i),
      j = as.integer(j),
      x = as.numeric(x))
}


# library(palmerpenguins)

################################################################################################
# define class
################################################################################################
#' @title Class: bis620_sparse_matrix
#' @exportClass  bis620_sparse_matrix
#' @export bis620_sparse_matrix
setClass(Class = "bis620_sparse_matrix",
         slots = list(i = "integer",
                      j = "integer",
                      x = "numeric"))

################################################################################################
# helper functions
################################################################################################

#' @title is.bis620_sparse_matrix
#'
#' @description This function is.bis620_sparse_matrix
#' @param x bis620_sparse_matrix
#'
#' @export is.bis620_sparse_matrix
is.bis620_sparse_matrix <- function(x){
  class(x)[1] == "bis620_sparse_matrix"
}


#' @title sparse2dense
#'
#' @description This function changes sparse matrix into normal matrix
#' @param x bis620_sparse_matrix
#'
#' @export sparse2dense
sparse2dense <- function(x){
  df = data.frame(i = x@i, j = x@j, x = x@x)
  dim_row = max(df$i)
  dim_col = max(df$j)
  result = matrix(0, nrow = dim_row, ncol = dim_col)
  for (ii in 1:dim_row){
    for (jj in 1:dim_col){
      x_ij = df[df$i == ii & df$j == jj,]$x
      if (length(x_ij) > 0){
        result[ii,jj] = x_ij
      }
    }
  }
  result
}


#' @title dense2sparse
#'
#' @description This function changes normal matrix into sparse matrix
#' @param x dense matrix
#'
#' @export dense2sparse
dense2sparse <- function(x){
  result = as.data.frame(which(x!=0,arr.ind = T))
  result = result[order(result$row), ]
  result$x = rep(NA,nrow(result))
  for (i in 1:nrow(result)){
    result[i,]$x = x[result[i,]$row, result[i,]$col]
  }
  bis620_sparse_matrix(result$row, result$col, result$x)
}



#' @title Print bis620_sparse_matrix
#'
#' @description This function prints the layout of bis620_sparse_matrix
#' @param x  bis620_sparse_matrix
#'
#' @exportMethod print
`print.bis620_sparse_matrix` <- function(x){
  df = data.frame(i = x@i, j = x@j, x = x@x)
  dim_row = max(df$i)
  dim_col = max(df$j)
  result = matrix(".", nrow = dim_row, ncol = dim_col)
  for (ii in 1:dim_row){
    for (jj in 1:dim_col){
      x_ij = df[df$i == ii & df$j == jj,]$x
      if (length(x_ij) > 0){
        result[ii,jj] = x_ij
      }
    }
  }
  print(result, quote=FALSE)
}

setMethod('print', signature(x = 'bis620_sparse_matrix'), function(x) {
  print.bis620_sparse_matrix(x)
})

################################################################################################
# define operations
################################################################################################
## 1.plus `+`
#' @title matrix addition of bis620_sparse_matrix
#'
#' @description This function performs plus operation of bis620_sparse_matrix
#' @param x  bis620_sparse_matrix or normal matrix
#' @param y  bis620_sparse_matrix or normal matrix
#'
#' @export +
`+` <- function(x, y) {
  if (is.bis620_sparse_matrix(x)){
    if (is.bis620_sparse_matrix(y)){
      result = .Primitive("+")(sparse2dense(x) , sparse2dense(y))
      result = dense2sparse(result)
    }else{
      result = .Primitive("+")(sparse2dense(x) , y)
    }
  }else{
    if (is.bis620_sparse_matrix(y)){
      result = .Primitive("+")(x , sparse2dense(y))
    }else{
      result = .Primitive("+")(x, y)
    }
  }
  result
}


# setMethod("+", signature(e1 = 'bis620_sparse_matrix', e2 = 'bis620_sparse_matrix'), function(x) {
#   callGeneric(sparse2dense(e1) , sparse2dense(e2))
# })
#
# setMethod('+', signature(x = 'bis620_sparse_matrix', y = 'ANY'), function(x,y) {
#   callGeneric(x,y)
# })
#
# setMethod('+', signature(x = 'ANY', y = 'bis620_sparse_matrix'), function(x,y) {
#   callGeneric(x,y)
# })


################################################################################################
## 2.minus `-`
# `-.bis620_sparse_matrix` <- function(x, y) {
#   if (is.bis620_sparse_matrix(x)){
#     if (is.bis620_sparse_matrix(y)){
#       sparse2dense(x) - sparse2dense(y)
#     }else{
#       sparse2dense(x) - y
#     }
#   }else{
#     if (is.bis620_sparse_matrix(y)){
#       x - sparse2dense(y)
#     }else{
#       x - y
#     }
#   }
# }

#' @title matrix subtraction of bis620_sparse_matrix
#'
#' @description This function performs subtraction operation of bis620_sparse_matrix
#' @param x  bis620_sparse_matrix or normal matrix
#' @param y  bis620_sparse_matrix or normal matrix
#'
#' @export `-`
#' @rdname minus
`-` <- function(x, y) {
  if (is.bis620_sparse_matrix(x)){
    if (is.bis620_sparse_matrix(y)){
      result = .Primitive("-")(sparse2dense(x) , sparse2dense(y))
      result = dense2sparse(result)
    }else{
      result = .Primitive("-")(sparse2dense(x) , y)
    }
  }else{
    if (is.bis620_sparse_matrix(y)){
      result = .Primitive("-")(x , sparse2dense(y))
    }else{
      result = .Primitive("-")(x, y)
    }
  }
  result
}

################################################################################################
## 3.element wise times `*`
# `*.bis620_sparse_matrix` <- function(x, y) {
#   if (is.bis620_sparse_matrix(x)){
#     if (is.bis620_sparse_matrix(y)){
#       sparse2dense(x) * sparse2dense(y)
#     }else{
#       sparse2dense(x) * y
#     }
#   }else{
#     if (is.bis620_sparse_matrix(y)){
#       x * sparse2dense(y)
#     }else{
#       x * y
#     }
#   }
# }
#
#' @title matrix multiplication of bis620_sparse_matrix
#'
#' @description This function performs subtraction operation of bis620_sparse_matrix
#' @param x  bis620_sparse_matrix or normal matrix
#' @param y  bis620_sparse_matrix or normal matrix
#'
#' @export *
`*` <- function(x, y) {
  if (is.bis620_sparse_matrix(x)){
    if (is.bis620_sparse_matrix(y)){
      result = .Primitive("*")(sparse2dense(x) , sparse2dense(y))
      result = dense2sparse(result)
    }else{
      result = .Primitive("*")(sparse2dense(x) , y)
    }
  }else{
    if (is.bis620_sparse_matrix(y)){
      result = .Primitive("*")(x , sparse2dense(y))
    }else{
      result = .Primitive("*")(x, y)
    }
  }
  result
}

################################################################################################
## 4.element wise divide `/`
# `/.bis620_sparse_matrix` <- function(x, y) {
#   if (is.bis620_sparse_matrix(x)){
#     if (is.bis620_sparse_matrix(y)){
#       result = sparse2dense(x) / sparse2dense(y)
#     }else{
#       result = sparse2dense(x) / y
#     }
#   }else{
#     if (is.bis620_sparse_matrix(y)){
#       result = x / sparse2dense(y)
#     }else{
#       result = x / y
#     }
#   }
#   result
# }


#' @title matrix division of bis620_sparse_matrix
#'
#' @description This function performs subtraction operation of bis620_sparse_matrix
#' @param x  bis620_sparse_matrix or normal matrix
#' @param y  bis620_sparse_matrix or normal matrix
#'
#' @export /
`/` <- function(x, y) {
  if (is.bis620_sparse_matrix(x)){
    if (is.bis620_sparse_matrix(y)){
      result = .Primitive("/")(sparse2dense(x) , sparse2dense(y))
      result = dense2sparse(result)
    }else{
      result = .Primitive("/")(sparse2dense(x) , y)
    }
  }else{
    if (is.bis620_sparse_matrix(y)){
      result = .Primitive("/")(x , sparse2dense(y))
    }else{
      result = .Primitive("/")(x, y)
    }
  }
  result
}

################################################################################################
## 5.matrix multiplication `%*%`

#' @title matrix multiplication of bis620_sparse_matrix
#'
#' @description This function performs plus operation of bis620_sparse_matrix
#' @param x  bis620_sparse_matrix or normal matrix
#' @param y  bis620_sparse_matrix or normal matrix
#'
#' @exportMethod %*%

`mat_mult.bis620_sparse_matrix` <- function(x, y) {
  if (is.bis620_sparse_matrix(x)){
    if (is.bis620_sparse_matrix(y)){
      result = .Primitive("%*%")(sparse2dense(x) , sparse2dense(y))
      result = dense2sparse(result)
    }else{
      result = .Primitive("%*%")(sparse2dense(x) , y)
    }
  }else{
    if (is.bis620_sparse_matrix(y)){
      result = .Primitive("%*%")(x , sparse2dense(y))
    }else{
      result = .Primitive("%*%")(x, y)
    }
  }
  result
}

setMethod('%*%', signature(x = 'bis620_sparse_matrix', y = 'ANY'), function(x,y) {
  mat_mult.bis620_sparse_matrix(x,y)
})

setMethod('%*%', signature(x = 'ANY', y = 'bis620_sparse_matrix'), function(x,y) {
  mat_mult.bis620_sparse_matrix(x,y)
})

################################################################################################
## 6.matrix transpose `t()`
# `t.bis620_sparse_matrix` <- function(x) {
#   newi = x@j
#   newj = x@i
#   result = new("bis620_sparse_matrix",
#                   i = newi,
#                   j = newj,
#                   x = x@x)
#   result
# }
#' @title matrix transpose `t()` for bis620_sparse_matrix
#' @param x  bis620_sparse_matrix
#' @exportMethod t
setMethod('t', signature(x = 'bis620_sparse_matrix'), function(x) {
  t.bis620_sparse_matrix(x)
})

`t.bis620_sparse_matrix` <- function(x) {
  newi = x@j
  newj = x@i
  result = methods::new("bis620_sparse_matrix",
                  i = newi,
                  j = newj,
                  x = x@x)
  result
}


################################################################################################
# test cases
# x1 <- bis620_sparse_matrix(
#   i = c(1, 2, 5, 6),
#   j = c(2, 2, 6, 1),
#   x = c(4.3, 5.6, 7, 10)
# )
# x2 <- matrix(rnorm(36), ncol = 6)

# library(Matrix)
#
# set.seed(1)
#
# x3 <- Matrix(rnorm(36), ncol = 6)
#
# x4 <- sparseMatrix(
#   i = c(1, 1, 3, 6),
#   j = c(2, 3, 5, 1),
#   x = c(4.3, 5.6, 7, 10),
#   dims = c(6, 6)
# )

# x1+x1
#
# x2+x1
#
# x1+x2
#
# x1 %*% x1
#
# x1+x3
#
#
# x1 + x1
# print(x1 + x1)
# t(x1) %*% x1
# print(t(x1) %*% x1)
# x1 %*% x1
# x1 + t(x2)
# x1 %*% x2
# x3 + x1
# x3 %*% x3
# x1 + x4
# x1 %*% x4



