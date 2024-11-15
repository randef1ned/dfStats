---
editor_options: 
  markdown: 
    wrap: 80
---

# dfStats: Fast and elegant column and row operations for `data.frame` objects

## Overview

In this R package, `dfStats` provides highly optimized functions for computing
descriptive summaries and aggregations on `data.frame` objects in R. Similar to
[matrixStats](https://github.com/HenrikBengtsson/matrixStats), but specifically
designed for R `data.frame` objects with focus on both elegance and
computational efficiency.

***Please note that this project is in its early developmental stage, so the
functionality and performance may be limited compared to future versions.***

## Why `dfStats`?

Working with `data.frame` objects often involves computing various summaries
across rows or columns. While base R's `apply` function can handle these
operations, it comes with several limitations:

-   Unintuitive syntax with the MARGIN parameter (1 for rows, 2 for columns).
-   Poor computational performance from repeated function calls.
-   Memory inefficiency from creating multiple hard copies.
-   Requires manual handling of mixed column types.

The `dfStats` package provides a collection of functions for performing
efficient row-wise and column-wise computations on `data.frame` objects with
improved performance compared to base R operations. This package address these
issues by providing intuitive and consistently named functions using C++
implementations for core operations to minimize hard copies.

## Installation

``` r
# Install latest stable version from CRAN
install.packages("dfStats")

# Or install the development version from GitHub
if (!"remotes" %in% as.data.frame(installed.packages())$Package)
  install.packages("remotes")
devtools::install_github("YourUsername/dfStats")
```

## Quick start

``` r
library(dfStats)

# Create sample data
df <- data.frame(
  a = 1:5,
  b = rnorm(5),
  c = letters[1:5]
)

# Column operations
colMeans3(df)      # Fast column means

# Row operations
rowSums3(df)       # Efficient row sums
```

## Benchmarks

``` r
# Create a large data frame for benchmark
large_df <- data.frame(
  matrix(rnorm(1000000), ncol = 100)
)

# Compare with base R
microbenchmark::microbenchmark(
  apply    = apply(large_df, 1, mean),
  rowMeans = rowMeans(large_df),
  dfStats  = rowMeans3(large_df)
)
```

Benchmark on Windows (unit: milliseconds):

|     expr |     min |       lq |      mean |  median |       uq |      max | neval |
|---------:|--------:|---------:|----------:|--------:|---------:|---------:|------:|
|    apply | 62.2120 | 70.81215 | 80.056904 | 72.9547 | 79.81565 | 199.0736 |   100 |
| rowMeans |  4.1759 |  4.39515 | 11.023450 |  4.6652 |  4.90150 | 140.4091 |   100 |
|  dfStats |  1.5329 |  1.88900 |  2.157443 |  2.2555 |  2.36300 |   2.7162 |   100 |

Benchmark on Fedora Linux 41 (unit: milliseconds):

|     expr |       min |       lq |      mean |    median |        uq |      max | neval |
|---------:|----------:|---------:|----------:|----------:|----------:|---------:|------:|
|    apply | 51.582414 | 63.18536 | 78.625475 | 65.956271 | 71.267663 | 258.0433 |   100 |
| rowMeans |  4.805873 |  4.96690 |  9.031157 |  5.085617 |  6.756312 | 194.5995 |   100 |
|  dfStats | 12.767709 | 13.10204 | 13.543744 | 13.253293 | 13.481091 |  26.6272 |   100 |

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request. For major
changes, please open an issue first to discuss what you would like to change.

## License

This project is licensed under GPL v2 - see the [LICENSE](LICENSE) file for
details.

## Other information

-   Author: Yinchun Su
