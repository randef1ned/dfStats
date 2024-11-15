#if defined(WIN32) || defined(_WIN32) || defined(WIN64) || defined(_WIN64)
#define WINDOWS 1
#else
#define WINDOWS 0
#endif

// include standard C++ headers
#include <cstdint>
#include <numeric>
#include <algorithm>
#include <omp.h>
#include <execution>
#include <vector>

#if WINDOWS
// Rtools provided wrong version of TBB
#include "../../src/tbb/include/tbb/tbb.h"
#endif
// headers in this file are loaded in RcppExports.cpp
#include <Rcpp.h>

// we only include RcppEigen.h which pulls Rcpp.h in for us
// #include <RcppEigen.h>
// #include <progress.hpp>
// #include <progress_bar.hpp>

// via the depends attribute we tell Rcpp to create hooks for
// RcppEigen so that the build process will know what to do
//
// [[Rcpp::plugins(openmp)]]
// [[Rcpp::depends(RcppProgress)]]

// other headers are loaded when C++ functions in src/ are being compiled.
// using namespace RcppSparse;
using namespace Rcpp;
using namespace std;

