#include <RcppArmadillo.h>

// [[Rcpp::depends(RcppArmadillo)]]

// [[Rcpp::export]]
arma::cx_vec getEigenValues(arma::mat M) {
  return arma::eig_gen(M);
}