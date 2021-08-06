#' Matrix Transpose
#' @param m a matrix or data.frame, typically.
#' @param byrow a boolean. Ordering by colums `default=FALSE`. `TRUE` order by rows
#' @description Given a matrix or data.frame `m`, `gwTraspose` returns the transpose of `m`.
#' @return A matrix, with dim and dimnames constructed appropriately from those of `m`, 
#' and other attributes except names copied across.
#' @examples
#' # matrix
#' a <- matrix(1:28, 4, 7)
#' gwTraspose(a, byrow=TRUE)
#' 
#' @import Rcpp
#' @useDynLib biogeoTools
#' @export

gwTraspose <- function(m, byrow = FALSE){
  return(gw_tt(m, byrow))
}
