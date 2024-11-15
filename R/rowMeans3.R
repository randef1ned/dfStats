#' Calculate row (column) sums for R `data.frame` object
#' 
#' @description
#' Calculates the mean of each row (column) in a `data.frame` object, with
#'   options for handling NA values, preserving row names, and appending
#'   results to the original `data.frame`.
#' 
#' Only numeric columns are considered for calculations.
#' 
#' @param x A `data.frame` with at least one row and one
#'   column.
#' 
#' @param na.rm Logical. Should NA values be removed before calculation?
#'   Default is `FALSE`.
#' 
#' @param useNames Logical. Should the resulting vector preserve row (column)
#'   names from the input `data.frame`? Default is `FALSE`.
#' 
#' @param silence_warnings Logical. Should warnings be suppressed when
#'   non-numeric columns are dropped? Default is `FALSE`.
#' 
#' @param no_check Logical. Skip input validation and numeric column filtering?
#'   Default is `FALSE`.
#' 
#' @param append Logical. Should the means be appended as a new column
#'   `row_means` instead of returning them as a vector? Default is `FALSE`.
#' 
#' @return
#' If `append = FALSE` (default), returns a numeric vector of row (column)
#'   means. If `useNames = TRUE` and the input has non-default row (column)
#'   names, the returned vector will preserve these names.
#' 
#' If `append = TRUE`, returns the original `data.frame` with an additional
#'   `row_means` column.
#' 
#' @author Yinchun Su
#' 
#' @examples
#' df <- data.frame(
#'   a = 1:5,
#'   b = 6:10,
#'   c = 11:15
#' )
#' 
#' # Basic usage
#' rowMeans3(df)
#' colMeans3(df)
#' 
#' # Append means as new column
#' rowMeans3(df, append = TRUE)
#' 
#' # Preserve row names
#' rownames(df) <- paste0("row", seq_len(nrow(df)))
#' colnames(df) <- LETTERS[seq_len(ncol(df))]
#' rowMeans3(df, useNames = TRUE)
#' colMeans3(df, useNames = TRUE)
#' 
#' @seealso \code{\link{colMeans3}} for column-wise mean
#' 
#' @export
rowMeans3 <- function(x, na.rm = FALSE, useNames = FALSE,
                      silence_warnings = FALSE, no_check = FALSE,
                      append = FALSE) {
  row_sums <- rowSums3(x,
                       na.rm = na.rm,
                       useNames = useNames,
                       silence_warnings = silence_warnings,
                       no_check = no_check,
                       append = FALSE)
  row_means <- row_sums / ncol(x)
  
  if (append) {
    x$row_means <- row_means
    return(x)
  } else {
    return(row_means)
  }
}
