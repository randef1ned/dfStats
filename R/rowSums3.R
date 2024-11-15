#' Calculate row (column) sums for R `data.frame` object
#' 
#' @description
#' Calculates the sum of each row (column) in a `data.frame` object, with
#'   options for handling NA values, preserving row names, and appending
#'   results to the original `data.frame`.
#' 
#' Only numeric columns are considered for calculations.
#' 
#' @param x A `data.frame` with at least one row and one column.
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
#' @param append Logical. Should the sums be appended as a new column
#'   \code{row_sums} instead of returning them as a vector? Default is FALSE.
#' 
#' @return
#' If `append = FALSE` (default), returns a numeric vector of row (column)
#'   sums. If `useNames = TRUE` and the input has non-default row (column)
#'   names, the returned vector will preserve these names.
#' 
#' If `append = TRUE`, returns the original `data.frame` with an additional
#'   `row_sums` column.
#' 
#' @author Yinchun Su
#' 
#' @importFrom tidyr drop_na
#' 
#' @examples
#' # example code
#' df <- data.frame(
#'   a = 1:5,
#'   b = 6:10,
#'   c = 11:15
#' )
#' 
#' # Basic usage
#' rowSums3(df)
#' colSums3(df)
#' 
#' # Append sums as new column
#' rowSums3(df, append = TRUE)
#' 
#' # Preserve row names
#' rownames(df) <- paste0("row", seq_len(nrow(df)))
#' colnames(df) <- LETTERS[seq_len(ncol(df))]
#' rowSums3(df, useNames = TRUE)
#' colSums3(df, useNames = TRUE)
#' 
#' @seealso \code{\link{colSums3}} for column-wise summation
#' 
#' @useDynLib dfStats
#' 
#' @export
rowSums3 <- function(x, na.rm = FALSE, useNames = FALSE,
                     silence_warnings = FALSE, no_check = FALSE,
                     append = FALSE) {
  if (!no_check) {
    x <- retain_numerics(x, silence_warnings = silence_warnings)
    assert_data_frame(x, min.rows = 1, min.cols = 1)
  }
  # drop nas
  if (na.rm) {
    x <- drop_na(x)
  }
  
  # Sum all
  if (append) {
    x$row_sums <- sum_rows(x)
    return(x)
  } else {
    sums <- sum_rows(x)
    if (useNames) {
      row_names <- rownames(x)
      if (sum(row_names != as.character(seq_along(row_names)))) {
        names(sums) <- row_names
      }
    }
    return(sums)
  }
}
