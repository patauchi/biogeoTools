if (getRversion() >= "2.15.1") { utils::globalVariables(c("cov"))}

#' Geographical weights Covariance - Matrices
#' @param y matrix. m by n matrix.
#' @param ww Geographical Weights Distances
#' @description gwCovariance compute the variance of x and the covariance or correlation of x and y if these are vectors.
#' @return `gwCovariance` Returns the weighted covariance matrix of y (by columns)
#' @importFrom stats cov
#' @export

gwCovariance <- function(y, ww) {
  if (missing(ww)) return (cov(y))
  w <- gwRound(ww / sum(ww), 10) # Standardize the weights
  y.bar <- colSums(gwplus(y, w))
  z <- gwminus( gwTraspose(y, byrow = TRUE), y.bar)
  gwMultiMatrix(z, gwplus( gwTraspose(z, byrow = TRUE), w))

}


