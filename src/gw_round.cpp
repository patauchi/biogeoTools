#define BOOST_DISABLE_ASSERTS

#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
NumericVector gw_round(const NumericVector& A, int digits = 0) {
  NumericVector B = clone(A);
  std::size_t K = A.size();
  for (std::size_t k = 0; k < K; k++) {
    B[k] = ::Rf_fround(A[k], digits);
  }
  return B;
}