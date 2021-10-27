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

#' @title Say hello
#'
#' @description This function says hello.
#' @param world a logical indicating if we are saying hello
#' to the world. (Default TRUE)
#' @param verbose should the return be printed? (Default FALSE)
#' @return nothing
#' @examples
#' hello(FALSE)
#' @export
hello <- function(world = TRUE, verbose = FALSE) {
  if (!is.logical(world) && !is.logical(verbose)) {
    stop("Parameters must be logical.")
  }
  if (world) {
    ret <- "Hello, world!"
  } else {
    ret <- "Hello!"
  }
  if (verbose) {
    print(ret)
  }
  invisible(ret)
}
