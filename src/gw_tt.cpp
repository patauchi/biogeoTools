#define BOOST_DISABLE_ASSERTS

#include <Rcpp.h>
using namespace Rcpp;
// [[Rcpp::export]]
NumericVector gw_tt(NumericMatrix m, const bool byrow=false){
  if (byrow){
    Rcout << "warning: default by column\n";
    m = transpose(m);
  }
  return NumericVector(m);
}