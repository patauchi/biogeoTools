#' EigenValues
#' @param M a matrix 
#' @description trapozoid_roc applies the trapezoidal integration for Partial ROC curve.
#' @return `Eigen` rounds the eigen values
#' @useDynLib biogeoTools 
#' @export

gwEigen <- function(M){
  return(gw_Eigen(M))
}
