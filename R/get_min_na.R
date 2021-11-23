#' @title Get columns with the minimum number of NA
#'
#' @description This function helps get the columns with the minimum number of NA within a data set
#' @param data select a data set containing columns to get minimum number of NA
#'
#' @return min_list columns with the minimum number of NA
#' @examples
#'
#' df <- data.frame(a = c(1,2,3), b = c(NA,0,1), c = c(NA, NA, 0))
#' df
#'
#' get_min_na(df)
#'
#' @export
get_min_na <- function(data) {
  missing_list <- colSums(as.data.frame(is.na(data)))
  min_list <- missing_list[missing_list == min(missing_list)]
  return(min_list)
}
