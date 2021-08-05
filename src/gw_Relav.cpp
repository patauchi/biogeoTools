#include <RcppEigen.h>
//#include "biogeoTools_types.h"

using namespace Rcpp;

using  Eigen::Map;
using  Eigen::VectorXd;
typedef  Map<VectorXd>  MapVecd;

// [[Rcpp::plugins(cpp11)]]

// [[Rcpp::export]]
NumericVector gw_Relav(NumericVector xx) {
  const MapVecd x(as<MapVecd>(xx));
  return xx/x.sum();
}