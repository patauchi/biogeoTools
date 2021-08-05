#' Relative sum
#' @param xx a vector type
#' @description Relative Sum
#' @return `gwRelav` relativ sum
#' @useDynLib biogeoTools
#' @export

gwRelav <- function(xx){
  return(gw_Relav(xx))
}
