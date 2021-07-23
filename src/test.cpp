#include <RcppArmadillo.h>
// [[Rcpp::depends(RcppArmadillo)]]
// [[Rcpp::plugins(cpp11)]]


using namespace Rcpp;
using namespace arma;
using namespace stats;

double sp_dists_pp(double lon1, double lon2, double lat1, double lat2, double tau) {
  double as1 = ((lon2 - lon1 ) * (lon2 - lon1 )) + ((lat2 - lat1 ) * (lat2 - lat1 ));
  double as2 = std::exp(-as1 / (2 * (tau * tau)));
  return as2;
}

arma::vec gw_Distance(arma::mat coodXY, arma::vec pointXY, double tau) {
  int N = coodXY.n_rows, j;
  vec dists(N, fill::zeros);
  double uout = pointXY(0), vout = pointXY(1);
  for (j = 0; j < N; j++) {
    
    dists(j) = sp_dists_pp(coodXY(j, 0), uout, coodXY(j, 1), vout, tau);
    
  }
  return dists;
}

NumericVector gw_round(const NumericVector& A, int digits = 0) {
  NumericVector B = clone(A);
  std::size_t K = A.size();
  for (std::size_t k = 0; k < K; k++) {
    B[k] = ::Rf_fround(A[k], digits);
  }
  return B;
}




// [[Rcpp::export]]
NumericVector gw_hetero(arma::mat coodXY, arma::vec pointXY, double tau){
  
  Rcpp::NumericVector ww = gw_Distance(coodXY, pointXY, tau);
  
    
  

  }



