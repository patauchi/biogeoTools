#' Rounding of Numbers
#' @param A a numeric vector.
#' @param digits integer indicating the number of decimal places (round) or significant digits (signif) to be used. Negative values are allowed (see ‘Details’)
#' @description trapozoid_roc applies the trapezoidal integration for Partial ROC curve.
#' @return `round` rounds the values in its first argument to the specified number of decimal places (default 0). See ‘Details’ about “round to even” when rounding off a 10.
#' @useDynLib biogeoTools 
#' @export

gwRound <- function(A,digits=10L){
  return(gw_round(A,digits))
}
