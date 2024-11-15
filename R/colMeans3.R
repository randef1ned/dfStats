#' @rdname rowMeans3
#' @export
colMeans3 <- function(x, na.rm = FALSE, useNames = FALSE,
                      silence_warnings = FALSE, no_check = FALSE) {
  col_sums <- colSums3(x, na.rm = na.rm,
                       useNames = useNames,
                       silence_warnings = silence_warnings,
                       no_check = no_check)
  return(col_sums / ncol(x))
}
