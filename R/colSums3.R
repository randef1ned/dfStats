#' @rdname rowSums3
#' @export
colSums3 <- function(x, na.rm = FALSE, useNames = FALSE,
                     silence_warnings = FALSE, no_check = FALSE) {
  if (!no_check) {
    x <- retain_numerics(x, silence_warnings = silence_warnings)
    assert_data_frame(x, min.rows = 1, min.cols = 1)
  }
  # drop nas
  if (na.rm) {
    x <- drop_na(x)
  }
  
  # Sum all
  sums <- sum_cols(x)
  if (useNames) {
    col_names <- colnames(x)
    if (sum(col_names != as.character(seq_along(col_names)))) {
      names(sums) <- col_names
    }
  }
  return(sums)
}
