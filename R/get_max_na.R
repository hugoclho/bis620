#' @title Get max column
#'
#' @description This function helps create correlation heat map factors within a data set
#' @param data select a data set containing columns to get correlation heat map
#'
#' @return heat_map correlation heat map
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
