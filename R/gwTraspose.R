#' Trapezoidal integration for Partial ROC curve
#' @param m fractional area predicted presence
#' @param byrow boolean asdad
#' @description trapozoid_roc applies the trapezoidal integration for Partial ROC curve.
#' @return Returns the area under the Partial ROC curve.
#' @useDynLib biogeoTools
#' @export

gwTraspose <- function(m, byrow = FALSE){
  return(gw_tt(m, byrow))
}
