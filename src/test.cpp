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



// [[Rcpp::export]]
arma::mat gw_hetero_rmpi(arma::mat coodXY, arma::vec pointXY, arma::mat Y, double tau) {
  int N = coodXY.n_rows, j;
  vec w(N, fill::zeros);
  double uout = pointXY(0), vout = pointXY(1);
  for (j = 0; j < N; j++) {
    
    w(j) = sp_dists_pp(coodXY(j, 0), uout, coodXY(j, 1), vout, tau);
    
  }

  
  mat Y2 = trans(Y);
  
  unsigned int ncol = Y.n_cols;
  unsigned int nrow = Y.n_rows;
  int counter = 0;
  for (unsigned int j=0; j<ncol; j++) {
    for (unsigned int i=0; i<nrow; i++)  {
      Y[counter++] *= w[i];
    }
  }

  int nCols = Y.n_cols;
  vec ybar(nCols, fill::zeros);
  for(int i = 0; i < nCols; i++){
    ybar(i) = sum(Y.col(i));
  }

  
  unsigned int ncolb = Y2.n_cols;
  unsigned int nrowb = Y2.n_rows;
  int counterb = 0;
  for (unsigned int j=0; j<ncolb; j++) {
    for (unsigned int i=0; i<nrowb; i++)  {
      Y2[counterb++] -= ybar[i];
    }
  }


  
  
  mat X3 = trans(Y2);
  
 
    
    unsigned int ncol3 = X3.n_cols;
  unsigned int nrow3 = X3.n_rows;
  int counter3 = 0;
  for (unsigned int j=0; j<ncol3; j++) {
    for (unsigned int i=0; i<nrow3; i++)  {
      X3[counter3++] *= w[i];
    }
  }

  
  return Y2 * X3;
  

  
}








