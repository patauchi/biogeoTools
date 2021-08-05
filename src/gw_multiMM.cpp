#define EIGEN_WARNINGS_DISABLED

#include <RcppEigen.h>

// [[Rcpp::export]]
SEXP gw_multiMM(const Eigen::Map<Eigen::MatrixXd> A, Eigen::Map<Eigen::MatrixXd> B){

  Eigen::MatrixXd C = A * B;

  return Rcpp::wrap(C);
}



