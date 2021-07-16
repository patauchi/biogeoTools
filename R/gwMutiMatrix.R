#' Trapezoidal integration for Partial ROC curve
#' @param A fractional area predicted presence
#' @param B sensibility at threshold (fract_area value).
#' @description trapozoid_roc applies the trapezoidal integration for Partial ROC curve.
#' @return Returns the area under the Partial ROC curve.
#' @useDynLib biogeoTools
#' @export

gwMultiMatrix <- function(A,B){
  return(gw_multiMM(A,B))
}
