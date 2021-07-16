
#include "config.h"
#include <RcppArmadillo.h>
#include <Rcpp.h>
#include <math.h>
#include <Rmath.h>

// [[Rcpp::plugins(cpp11)]]
// [[Rcpp::depends(RcppArmadillo)]]

using namespace Rcpp;
using namespace arma;
using namespace stats;

double sp_dists_pp(double lon1, double lon2, double lat1, double lat2, double tau) {
  double as1 = ((lon2 - lon1 ) * (lon2 - lon1 )) + ((lat2 - lat1 ) * (lat2 - lat1 ));
  double as2 = std::exp(-as1 / (2 * (tau * tau)));
  return as2;
}


// Trapezoidal integration for Partial ROC curve
// @param dp is the fractional area predicted presence
// @param vec sensibility at threshold (fract_area value).
// @param tau the area under the Partial ROC curve.
// @return ada das 

// [[Rcpp::export]]
arma::vec gw_Distance(arma::mat dp, arma::vec loc, double tau) {
  int N = dp.n_rows, j;
  vec dists(N, fill::zeros);
  double uout = loc(0), vout = loc(1);
  for (j = 0; j < N; j++) {
    
    dists(j) = sp_dists_pp(dp(j, 0), uout, dp(j, 1), vout, tau);
    
  }
  return dists;
}