#' Trapezoidal integration for Partial ROC curve
#' @param A fractional area predicted presence
#' @param digits diitsos
#' @description trapozoid_roc applies the trapezoidal integration for Partial ROC curve.
#' @return Returns the area under the Partial ROC curve.
#' @useDynLib biogeoTools
#' @export

gwRound <- function(A,digits=10L){
  return(gw_round(A,digits))
}
