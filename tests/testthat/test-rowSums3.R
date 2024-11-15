for (i in seq_len(50)) {
  # Generate random `data.frame` with flexible sizes
  x <- sample(1:500, 1)
  y <- sample(1:500, 1)
  for (method in 1:3) {
    data1 <- matrix(case_when(method == 1 ~ rnorm(x * y),
                              method == 2 ~ runif(x * y, min = -100, max = 100),
                              method == 3 ~ sample(seq_len(x * y), x * y,
                                                   replace = TRUE)), x, y)
    data2 <- as.data.frame(data1)
    
    # Quick test; all dfs are meet the input standard.
    test_that("Test sum rows using apply", {
      expect_equal(unname(apply(data2, 1, sum)),
                   rowSums3(data2, no_check = FALSE),
                   tolerance = 0.01)
    })
    test_that("Test sum rows using matrixStats", {
      expect_equal(matrixStats::rowSums2(data1),
                   rowSums3(data2, no_check = TRUE),
                   tolerance = 0.01)
    })
  }
}

test_that("Test NA", {
  data3 <- data.frame(a = 1:10, b = -5:4, c = c(1:8, NA, 10))
  expect_equal(unname(apply(data3, 1, sum)),
               rowSums3(data3, no_check = TRUE),
               tolerance = 0.01)
  expect_equal(unname(apply(drop_na(data3), 1, sum)),
               rowSums3(data3, no_check = TRUE, na.rm = TRUE),
               tolerance = 0.01)
})

test_that("Test warning", {
  data3 <- data.frame(a = 1:10, b = LETTERS[1:10], c = c(1:8, NA, 10))
  expect_warning(rowSums3(data3))
})
