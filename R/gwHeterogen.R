#' Geographical Weights Principal Component Analysis
#' @param layers Rast terra-object,
#' @param baseRaster Raster-object. Base Raster object to write output
#' @param comp_each Comp_by_range. 
#' @param n_cores Number of cores
#' @param taus Factor Tau for distance matrix
#' @param parallel boolean. `TRUE` run with parallel. Run only parallel. FALSE, doesn't works
#' @param save boolean. `TRUE` save raster file in local computer
#' @param outdir character. Folder name
#' @param outname Full name of rasterfile
#' @param rmpi default FALSE. Use RMPI for cluster computer (High Performance Computer)
#' @description This function perform a environmental heterogeneity on spatial space.
#' @return Returns the geographical weights distance among environmental layers or variables.
#' @importFrom dplyr  %>%
#' @importFrom future %<-%
#' @importFrom raster values
#' @useDynLib biogeoTools
#' 
#' @export


gwHeterogen  <- function(layers,baseRaster, comp_each = 1000, n_cores = 15, taus = 0.01, 
                         parallel=TRUE, save=TRUE, outdir='Output_hetero',
                         outname='heterog', rmpi=FALSE){
  
  dfraster <- as.data.frame(layers, xy = TRUE)
  DTIN <- sapply(1:dim(dfraster[, 3:21])[2], function(x)
    (dfraster[, 3:21][, x] - min(dfraster[, 3:21][, x]))/(max(dfraster[, 3:21][, x]) - min(dfraster[, 3:21][, x])))
  DTIN <- cbind(dfraster, DTIN)
  rio::export(DTIN, 'nuevo2.csv')
  rm(DTIN, dfraster, layers)
  
  # Import
  pp <- rio::import('nuevo2.csv',select=c('x','y'))
  env <- rio::import('nuevo2.csv',select=c(paste0(1:19)))
  
  # Setting
  #comp_each <- 1000
  #n_cores <- 15
  #taus = 0.01
  
  if(parallel){
    
    if(rmpi){
      cl = doMPI::startMPIcluster()
      #cl
      doMPI::registerDoMPI(cl)
      doMPI::clusterSize(cl)
    } else{
      future::plan(future::multiprocess, workers =n_cores)
    }
    
    mop_env <- new.env()
    steps <- seq(1, dim(env)[1], comp_each)
    kkk <- c(steps,  dim(env)[1] + 1)
    long_k <- length(kkk)
    pasos <- 1:(length(kkk) - 1)
    pasosChar <- paste0(pasos)
    
    for (paso in pasosChar) {
      x <- as.numeric(paso)
      mop_env[[paso]] %<-% { 
        seq_gwpca <- kkk[x]:(kkk[x + 1] - 1)
        seq_gwpca %>%  furrr::future_map_dbl(function(q){
          wwtest <- gwDistance(as.matrix(pp),as.matrix(pp[q,]), tau = taus)
          m1test <- gwRelav(as.vector(wwtest))
          wtest <- gwRound(as.vector(m1test),10)
          gh <- gwplus(as.matrix(env), as.vector(wtest))
          y.bar <- colSums(gh)
          ca_test <- gwTraspose(as.matrix(env), byrow = TRUE) 
          z_tst <- gwminus(ca_test, y.bar)
          
          co_test <- gwTraspose(z_tst, byrow = TRUE)
          
          no_test <- gwplus(co_test, wtest)
          
          cvs_test <- gwMultiMatrix(z_tst, no_test)
          
          edc <- eigen(cvs_test, symmetric = TRUE)
          ev <- edc$values
          
          if (any(neg <- ev < 0)) {ev[neg] <- 0}
          sdev <- sqrt(ev)
          return(mean(sdev))
          
        }, .options = furrr::furrr_options(globals = TRUE))
      }
      avance <- (x / long_k) * 100
      cat("Computation progress: ", avance,"%" ,"\n")
    }
    
    mop_list <- as.list(mop_env)
    mop_names <- sort(as.numeric(as.character(names(mop_list))))
    mop_names <- as.character(mop_names)
    mop_vals <- unlist(mop_list[mop_names])
    
    Heterlis <- raster::raster(baseRaster)
    Heterlis[!is.na(raster::values(Heterlis))] <- as.numeric(mop_vals)
    
    
    
    if(rmpi){
      doMPI::closeCluster(cl)
      Rmpi::mpi.quit()
    }else{
      future::plan(future::sequential)
    }
    
  }
  
  if(save){
    if(!dir.exists(outdir)) dir.create(outdir)
    raster::writeRaster(Heterlis, paste0(outdir,'/',outname,'.tif'), overwrite=TRUE)
  }
  
  return(Heterlis)
  
}
