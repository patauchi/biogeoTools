#define EIGEN_WARNINGS_DISABLED

#include <RcppArmadillo.h>
#include <RcppEigen.h>
// [[Rcpp::depends(RcppArmadillo, RcppEigen)]]

// [[Rcpp::export]]
SEXP gw_multiMM(const Eigen::Map<Eigen::MatrixXd> A, Eigen::Map<Eigen::MatrixXd> B){

  Eigen::MatrixXd C = A * B;

  return Rcpp::wrap(C);
}



