#' Geographical Weights Distance Matrix Computation
#' @param coodXY Matrix. Matrix of coordinates e.g. longitude/latitude, unit=long/lat
#' @param pointXY Matrix. Point pairs e.g. longitude/latitude
#' @param tau sadasda
#' @description This function computes and returns the distance matrix computed by using the specified distance measure to compute the distances between the rows of a data matrix.
#' @return Returns the geographical weights distance among environmental layers or variables.
#' @useDynLib biogeoTools
#' @export

gwDistance <- function(coodXY,pointXY, tau){
  return(gw_Distance(coodXY,pointXY, tau))
}
