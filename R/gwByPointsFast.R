#' Geographical Weights PCA by points
#' @param coorXY Matrix longtiude/latitude. 
#' @param pointXY matrix by points longitude/latitude 
#' @param env Environemntal layers
#' @param taus Factor Tau for distance matrix
#' @description This function perform by points
#' @return Returns the geographical weights distance among environmental layers by points
#'  
#' @export
#' 

gwByPointsFast <- function(coorXY, pointXY, env, taus){
  wwtest <- gwDistance(as.matrix(coorXY),as.matrix(pointXY), tau = taus)
  m1test <- gwRelav(as.vector(wwtest))
  wtest <- gwRound(as.vector(m1test),10)
  gh <- gwplus(as.matrix(env), as.vector(wtest))
  y.bar <- Rfast::colsums(gh)
  ca_test <- Rfast::transpose(as.matrix(env)) 
  z_tst <- gwminus(ca_test, y.bar)
  co_test <- Rfast::transpose(z_tst)
  no_test <- gwplus(co_test, wtest)
  cvs_test <- gwMultiMatrix(z_tst, no_test)
  edc <- eigen(cvs_test, symmetric = TRUE)
  ev <- edc$values
  if (any(neg <- ev < 0)) {ev[neg] <- 0}
  sdev <- sqrt(ev)
  return(mean(sdev))
}


