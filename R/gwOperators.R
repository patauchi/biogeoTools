#' Operators
#' @param X Matrix
#' @param y vector
#' @description Operators Plus
#' @return Oparations of Matrix by Vector
#' @useDynLib biogeoTools
#' @export

gwplus <- function(X,y){
  return(gw_plus(X,y))
}

#' Operators
#' @param X Matrix
#' @param y vector
#' @description Operators Plus
#' @return Oparations of Matrix by Vector
#' @useDynLib biogeoTools
#' @export


gwminus <- function(X,y){
  return(gw_minus(X,y))
}
