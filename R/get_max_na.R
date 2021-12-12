#' @title Get columns with the maximum number of NA
#'
#' @description This function helps get the columns with the maximum number of NA within a data set
#' @param data select a data set containing columns to get maximum number of NA
#'
#' @return min_list columns with the maximum number of NA
#' @examples
#'
#' df <- data.frame(a = c(1,2,3), b = c(NA,0,1), c = c(NA, NA, 0))
#' df
#'
#' get_max_na(df)
#'
#' @export
get_max_na <- function(data) {
  missing_list <- colSums(as.data.frame(is.na(data)))
  max_list <- missing_list[missing_list == max(missing_list)]
  return(max_list)
}
