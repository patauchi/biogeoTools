#' Heterovalues mrpi
#' @param coodXY a numeric vector.
#' @param pointXY integer indicating the number of decimal places (round) or significant digits (signif) to be used. Negative values are allowed (see ‘Details’)
#' @param Y sadasd as
#' @param tau adadsa
#' @description trapozoid_roc applies the trapezoidal integration for Partial ROC curve.
#' @return `round` rounds the values in its first argument to the specified number of decimal places (default 0). See ‘Details’ about “round to even” when rounding off a 10.
#' @useDynLib biogeoTools
#' @export


gwheterroRmpi <- function(coodXY, pointXY, Y, tau){
  return(gw_hetero_rmpi(coodXY, pointXY, Y, tau))
}
