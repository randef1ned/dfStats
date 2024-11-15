% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/colSums3.R, R/rowSums3.R
\name{colSums3}
\alias{colSums3}
\alias{rowSums3}
\title{Calculate row (column) sums for R \code{data.frame} object}
\usage{
colSums3(
  x,
  na.rm = FALSE,
  useNames = FALSE,
  silence_warnings = FALSE,
  no_check = FALSE
)

rowSums3(
  x,
  na.rm = FALSE,
  useNames = FALSE,
  silence_warnings = FALSE,
  no_check = FALSE,
  append = FALSE
)
}
\arguments{
\item{x}{A \code{data.frame} with at least one row and one column.}

\item{na.rm}{Logical. Should NA values be removed before calculation?
Default is \code{FALSE}.}

\item{useNames}{Logical. Should the resulting vector preserve row (column)
names from the input \code{data.frame}? Default is \code{FALSE}.}

\item{silence_warnings}{Logical. Should warnings be suppressed when
non-numeric columns are dropped? Default is \code{FALSE}.}

\item{no_check}{Logical. Skip input validation and numeric column filtering?
Default is \code{FALSE}.}

\item{append}{Logical. Should the sums be appended as a new column
\code{row_sums} instead of returning them as a vector? Default is FALSE.}
}
\value{
If \code{append = FALSE} (default), returns a numeric vector of row (column)
sums. If \code{useNames = TRUE} and the input has non-default row (column)
names, the returned vector will preserve these names.

If \code{append = TRUE}, returns the original \code{data.frame} with an additional
\code{row_sums} column.
}
\description{
Calculates the sum of each row (column) in a \code{data.frame} object, with
options for handling NA values, preserving row names, and appending
results to the original \code{data.frame}.

Only numeric columns are considered for calculations.
}
\examples{
# example code
df <- data.frame(
  a = 1:5,
  b = 6:10,
  c = 11:15
)

# Basic usage
rowSums3(df)
colSums3(df)

# Append sums as new column
rowSums3(df, append = TRUE)

# Preserve row names
rownames(df) <- paste0("row", seq_len(nrow(df)))
colnames(df) <- LETTERS[seq_len(ncol(df))]
rowSums3(df, useNames = TRUE)
colSums3(df, useNames = TRUE)

}
\seealso{
\code{\link{colSums3}} for column-wise summation
}
\author{
Yinchun Su
}
