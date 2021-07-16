// Generated by using Rcpp::compileAttributes() -> do not edit by hand
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <RcppArmadillo.h>
#include <RcppEigen.h>
#include <Rcpp.h>

using namespace Rcpp;

#ifdef RCPP_USE_GLOBAL_ROSTREAM
Rcpp::Rostream<true>&  Rcpp::Rcout = Rcpp::Rcpp_cout_get();
Rcpp::Rostream<false>& Rcpp::Rcerr = Rcpp::Rcpp_cerr_get();
#endif

// gw_Distance
arma::vec gw_Distance(arma::mat dp, arma::vec loc, int tau);
RcppExport SEXP _biogeoTools_gw_Distance(SEXP dpSEXP, SEXP locSEXP, SEXP tauSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< arma::mat >::type dp(dpSEXP);
    Rcpp::traits::input_parameter< arma::vec >::type loc(locSEXP);
    Rcpp::traits::input_parameter< int >::type tau(tauSEXP);
    rcpp_result_gen = Rcpp::wrap(gw_Distance(dp, loc, tau));
    return rcpp_result_gen;
END_RCPP
}
// gw_multiMM
SEXP gw_multiMM(const Eigen::Map<Eigen::MatrixXd> A, Eigen::Map<Eigen::MatrixXd> B);
RcppExport SEXP _biogeoTools_gw_multiMM(SEXP ASEXP, SEXP BSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const Eigen::Map<Eigen::MatrixXd> >::type A(ASEXP);
    Rcpp::traits::input_parameter< Eigen::Map<Eigen::MatrixXd> >::type B(BSEXP);
    rcpp_result_gen = Rcpp::wrap(gw_multiMM(A, B));
    return rcpp_result_gen;
END_RCPP
}
// gw_round
NumericVector gw_round(const NumericVector& A, int digits);
RcppExport SEXP _biogeoTools_gw_round(SEXP ASEXP, SEXP digitsSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const NumericVector& >::type A(ASEXP);
    Rcpp::traits::input_parameter< int >::type digits(digitsSEXP);
    rcpp_result_gen = Rcpp::wrap(gw_round(A, digits));
    return rcpp_result_gen;
END_RCPP
}
// gw_tt
NumericVector gw_tt(NumericMatrix m, const bool byrow);
RcppExport SEXP _biogeoTools_gw_tt(SEXP mSEXP, SEXP byrowSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< NumericMatrix >::type m(mSEXP);
    Rcpp::traits::input_parameter< const bool >::type byrow(byrowSEXP);
    rcpp_result_gen = Rcpp::wrap(gw_tt(m, byrow));
    return rcpp_result_gen;
END_RCPP
}

static const R_CallMethodDef CallEntries[] = {
    {"_biogeoTools_gw_Distance", (DL_FUNC) &_biogeoTools_gw_Distance, 3},
    {"_biogeoTools_gw_multiMM", (DL_FUNC) &_biogeoTools_gw_multiMM, 2},
    {"_biogeoTools_gw_round", (DL_FUNC) &_biogeoTools_gw_round, 2},
    {"_biogeoTools_gw_tt", (DL_FUNC) &_biogeoTools_gw_tt, 2},
    {NULL, NULL, 0}
};

RcppExport void R_init_biogeoTools(DllInfo *dll) {
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}