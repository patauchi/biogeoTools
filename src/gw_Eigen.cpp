#include <RcppArmadillo.h>
// [[Rcpp::depends(RcppArmadillo)]]

using namespace Rcpp;
using namespace arma;

// [[Rcpp::export]]
arma::vec gw_Eigen(arma::mat M) {
  arma::vec values=arma::eig_sym(M);
  return values;
}