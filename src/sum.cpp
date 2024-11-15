#include "../inst/include/dfStats.h"

// [[Rcpp::export]]
vector<double> sum_cols(vector<vector<double>> &input) {
    // input: {a: [1,2,3,4], b: [5,6,7,8]}
    // It performs sums independently, resulting in [10,26]

    // Do not consider input.empty()
    
    size_t num_cols = input.size();
    vector<double> sums(num_cols);

    transform(execution::par, input.begin(), input.end(), sums.begin(),
              [](const vector<double>& row_vector) {
                  return accumulate(row_vector.begin(), row_vector.end(), 0.0);
              });

    return sums;
}

// [[Rcpp::export]]
vector<double> sum_rows(vector<vector<double>> &input) {
    // input: {a: [1,2,3,4], b: [5,6,7,8]}
    // It performs a+b, resulting in [6,8,10,12]

    // Do not consider input.empty()
    
    size_t num_rows = input[0].size();
    vector<double> sums(num_rows);

    for_each(input.begin(), input.end(),
             [&sums](const vector<double>& row_vector) {
                // Do not consider row vectors may have different sizes.
                // To compatitible with Windows version of OpenMP
                 transform(execution::par, sums.begin(), sums.end(), row_vector.begin(), sums.begin(), plus<double>());
             });

    return(sums);
}
