#include <RcppArmadillo.h>
// [[Rcpp::depends(RcppArmadillo)]]

// [[Rcpp::export]]
arma::mat fastLm(const arma::mat& X) {
  return arma::trans(X);
}