#include <RcppArmadillo.h>

// [[Rcpp::depends(RcppArmadillo)]]

// [[Rcpp::export]]
arma::vec gw_Eigen(arma::mat M) {
  return arma::eig_sym(M);
}