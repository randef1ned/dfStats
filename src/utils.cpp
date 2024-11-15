#include "../inst/include/dfStats.h"

// [[Rcpp::export]]
vector<bool> check_numeric(DataFrame &x) {
    size_t num_cols = x.size();
    vector<int> data_types(num_cols);
    
    // Get all SEXP objects using TYPEOF instead of Rf_isNumeric for thread-safety
    #pragma omp parallel for schedule(static)
    for (size_t i = 0; i < num_cols; ++i) {
        int type = TYPEOF(x[i]);
        data_types[i] = (type == REALSXP || type == INTSXP || type == LGLSXP)? 1 : 0;
    }
    
    vector<bool> result(num_cols, false);
    transform(
    #if !WINDOWS
        execution::par,  // To compatitible with Windows
    #endif
        data_types.begin(), data_types.end(), result.begin(),
              [](int value) { return value != 0; });
    return result;
}
