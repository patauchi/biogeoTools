#' Geographical Weights Principal Component Analysis
#' @param layers RasterStack object or Rast object.
#' @param factor Numeric. Factor by moving  windows
#' @param parallel boolean. `TRUE` run with parallel.
#' @param save boolean. `TRUE` save raster file in local computer
#' @param outdir character. Folder name
#' @param cores Numeric. cores or threats
#' @description This function computes and returns the distance matrix computed by using the specified distance measure to compute the distances between the rows of a data matrix.
#' @return Returns the geographical weights distance among environmental layers or variables.
#' @importFrom stats cov
#' @importFrom data.table data.table
#' @importFrom parallel stopCluster
#' @import foreach raster terra doSNOW
#' @useDynLib biogeoTools
#' @export


gwHeterogeneity <- function(layers, factor, parallel=TRUE, cores=4, save=FALSE, outdir='.') {

  # if(class(layers) != 'RasterStack' | class(layers) != 'SpatRaster'){
  #   stop('Must be a rasterStack or rast object')
  # }
 
   # asas2 <-  as.data.frame(terra::rast(list.files(folder_vars, pattern = ".tif$", full.names = T)), xy=TRUE)
    asas2 <-  as.data.frame(layers, xy=TRUE)
    DTIN <- sapply(1:dim(asas2[,3:21])[2], function(x) (asas2[,3:21][, x] - min(asas2[,3:21][, x])) / 
                     (max(asas2[,3:21][, x]) - min(asas2[,3:21][, x])))
    
    Hetero_base <- layers[[1]] 
    heteroCellID <- terra::cellFromXY(layers, as.matrix(asas2[,1:2]))
    resIn <- terra::res(Hetero_base)[1]

  if(parallel==TRUE){
    cl <- parallel::makeCluster(cores, 'SOCK')
    doSNOW::registerDoSNOW(cl)
    foreach::getDoParWorkers()
    
    z <- foreach(i=1:nrow(asas2), .packages = "Rcpp") %dopar% { 
      #  for(i in 1:nrow(asas2)) {
      # i <- 171
      #  print(i)
      p <- asas2[i, 1:2]
      head(ww <- biogeoTools::gwDistance(coodXY = as.matrix(asas2[,1:2]), pointXY = as.matrix(p), tau = resIn * factor))
      w <- as.vector(ww)
      covmat <- biogeoTools::gwCovariance(y=DTIN, w=w)
      edc <- eigen(covmat, symmetric = TRUE)
      ev <- edc$values
      if (any(neg <- ev < 0)) {ev[neg] <- 0}
      sdev <- sqrt(ev)
      mean(sdev)
    }
    stopCluster(cl)
    future::plan(future::sequential)
  } else{
      z <- list()
      for(i in 1:nrow(asas2)) {
        
        p <- asas2[i, 1:2]
        head(ww <- biogeoTools::gwDistance(coodXY = as.matrix(asas2[,1:2]), pointXY = as.matrix(p), tau = resIn * factor))
        w <- as.vector(ww)
        covmat <- biogeoTools::gwCovariance(y=DTIN, w=w)
        edc <- eigen(covmat, symmetric = TRUE)
        ev <- edc$values
        if (any(neg <- ev < 0)) {ev[neg] <- 0}
        sdev <- sqrt(ev)
        z[[i]] <-  mean(sdev)
    }

  }

  zValues <- unlist(z)  
  
  Hetero_base[heteroCellID] <- zValues
  

  if(save){
    terra::writeRaster(Hetero_base, 
                       paste0(outdir, '/Heterogeneity_',(resIn * factor),'_res.tif'))
    
  } else{
   plot(Hetero_base) 
  }
  
  return(Hetero_base)
 
}
