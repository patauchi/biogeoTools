
#' Trapezoidal integration for Partial ROC curve
#' @param coodXY fractional area predicted presence
#' @param pointXY sensibility at threshold (fract_area value).
#' @param tau sadasda
#' @description trapozoid_roc applies the trapezoidal integration for Partial ROC curve.
#' @return Returns the area under the Partial ROC curve.
#' @import Rcpp RcppArmadillo
#' @useDynLib biogeoTools
#' @export

gwDistance <- function(coodXY,pointXY, tau){
  return(gw_Distance(dp=coodXY,loc=pointXY, tau))
}
