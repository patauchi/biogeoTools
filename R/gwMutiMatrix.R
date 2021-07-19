#' Matrix Multiplication
#' @param A numeric or complex matrices or vectors.
#' @param B numeric or complex matrices or vectors.
#' @description Multiplies two matrices, if they are conformable. If one argument is a vector, it will be promoted to either a row or column matrix to make the two arguments conformable. If both are vectors of the same length, it will return the inner product (as a matrix).
#' @return Multiplies two matrices
#' @useDynLib biogeoTools
#' @export

gwMultiMatrix <- function(A,B){
  return(gw_multiMM(A,B))
}
