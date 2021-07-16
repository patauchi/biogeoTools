#define EIGEN_PERMANENTLY_DISABLE_STUPID_WARNINGS

#include <RcppArmadillo.h>
#include <RcppEigen.h>
// [[Rcpp::depends(RcppArmadillo, RcppEigen)]]

// [[Rcpp::export]]
SEXP gw_multiMM(const Eigen::Map<Eigen::MatrixXd> A, Eigen::Map<Eigen::MatrixXd> B){
  Eigen::MatrixXd C = A * B;
  
  return Rcpp::wrap(C);
}



