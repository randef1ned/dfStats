// Generated by using Rcpp::compileAttributes() -> do not edit by hand
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include "../inst/include/dfStats.h"
#include <Rcpp.h>

using namespace Rcpp;

#ifdef RCPP_USE_GLOBAL_ROSTREAM
Rcpp::Rostream<true>&  Rcpp::Rcout = Rcpp::Rcpp_cout_get();
Rcpp::Rostream<false>& Rcpp::Rcerr = Rcpp::Rcpp_cerr_get();
#endif

// sum_cols
vector<double> sum_cols(vector<vector<double>>& input);
RcppExport SEXP _dfStats_sum_cols(SEXP inputSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< vector<vector<double>>& >::type input(inputSEXP);
    rcpp_result_gen = Rcpp::wrap(sum_cols(input));
    return rcpp_result_gen;
END_RCPP
}
// sum_rows
vector<double> sum_rows(vector<vector<double>>& input);
RcppExport SEXP _dfStats_sum_rows(SEXP inputSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< vector<vector<double>>& >::type input(inputSEXP);
    rcpp_result_gen = Rcpp::wrap(sum_rows(input));
    return rcpp_result_gen;
END_RCPP
}
// check_numeric
vector<bool> check_numeric(DataFrame& x);
RcppExport SEXP _dfStats_check_numeric(SEXP xSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< DataFrame& >::type x(xSEXP);
    rcpp_result_gen = Rcpp::wrap(check_numeric(x));
    return rcpp_result_gen;
END_RCPP
}

static const R_CallMethodDef CallEntries[] = {
    {"_dfStats_sum_cols", (DL_FUNC) &_dfStats_sum_cols, 1},
    {"_dfStats_sum_rows", (DL_FUNC) &_dfStats_sum_rows, 1},
    {"_dfStats_check_numeric", (DL_FUNC) &_dfStats_check_numeric, 1},
    {NULL, NULL, 0}
};

RcppExport void R_init_dfStats(DllInfo *dll) {
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}
