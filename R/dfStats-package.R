#' dfStats
#' 
#' @title
#' dfStats: Fast and elegant column and row operations for `data.frame` objects
#' 
#' @name dfStats-package
#' 
#' @aliases dfStats
#' 
#' @description
#' This package provides optimized functions for computing descriptive summaries
#'   and aggregations on `data.frame` objects in R. Similar to the existing
#'   [`matrixStats`][matrixStats::matrixStats-package] package, but specifically
#'   designed for `data.frame` operations with focus on both elegant and 
#'   computational efficiency.
#' 
#' @details
#' The [`apply`][base::apply] function has several limitations when working
#'   with `data.frame` objects for row and column operations:
#' 
#' - Hard to remember the unintuitive syntax with the MARGIN parameter (1 for
#'   rows, 2 for columns).
#' - Poor computational performance from repeated function calls.
#' - Memory inefficiency from creating multiple hard copies.
#' - Requires manual handling of mixed column types.
#' 
#' The `dfStats` package provides a collection of functions for performing
#'   efficient row-wise and column-wise computations on `data.frame` objects
#'   with improved performance compared to base R operations. This package
#'   address these issues by providing intuitive and consistently named
#'   functions using C++ implementations for core operations to minimize hard
#'   copies.
#'
#' @author Yinchun Su
#' 
#' @references
#' Inspired by the matrixStats package:
#' 
#' Henrik Bengtsson (2017). *matrixStats: Functions that Apply to Rows and
#'   Columns of Matrices (and to Vectors)*. R package version 0.52.2.
#'   <https://github.com/HenrikBengtsson/matrixStats>.
#' 
#' @examples
#' \donttest{
#' if (!"remotes" %in% as.data.frame(installed.packages())$Package)
#'   install.packages("remotes")
#' 
#' remotes::install_github("randef1ned/dfStats", upgrade = "always",
#'                         build_manual = TRUE, build_vignettes = TRUE)
#' }
#' 
#' @seealso
#' Useful links:
#' 
#' - <https://github.com/randef1ned/dfStats>
#' - <https://dfStats.yinchun.su>
#' 
#' @useDynLib dfStats, .registration = TRUE
#' 
#' @importFrom Rcpp sourceCpp
#'
"_PACKAGE"
