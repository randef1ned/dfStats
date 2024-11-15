#' Retain numeric columns for specific `data.frame`
#' 
#' @param x Input `data.frame`
#' @param silence_warnings Logical. Silence warnings. Default is `FALSE`.
#' 
#' @return x
#' 
#' @importFrom checkmate assert_data_frame
#' 
#' @noRd
#' 
#' @importFrom collapse ss
retain_numerics <- function(x, silence_warnings = FALSE) {
  data_types <- check_numeric(x)
  if (sum(data_types) != length(data_types) && !silence_warnings) {
    for (column in seq_along(data_types)) {
      if (!data_types[column]) {
        warning("Column #", column, ": ", colnames(x)[column], " is deleted ",
                "due to its data type.")
      }
    }
  }
  x <- ss(x, , data_types)
  return(x)
}
