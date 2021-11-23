# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'

#' @title Get list of missing values of the data set
#'
#' @description This function helps examine the number of missing values within factors within a data set
#' @param data select a data set needed to inspect
#'
#' @return missing_list a list of number of missing values of each column
#' @examples
#'
#' df <- data.frame(a = c(1,2,3), b = c(NA,0,1), c = c(NA, NA, 0))
#' df
#'
#' get_na(df)
#'
#' @export
get_na <- function(data) {
  missing_list <- colSums(as.data.frame(is.na(data)))
  return(missing_list)
}
