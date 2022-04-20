if (getRversion() >= "2.15.1") { utils::globalVariables(c("median"))}

#' Mann-Kendall Test Corrected
#' @param x Time series data vector.
#' @description Time series data is often influenced by serial-correlation. 
#' When data is not random and influenced by auto-correlation, 
#' Modified Mann-Kendall tests are to be used in trend detection. 
#' Yue and Wang (2004) have proposed variance correction approach to address the issue of serial correlation in Trend analysis. 
#' Trend is removed from the series and effective sample size is calulated using significant serial correlation coefficients.
#' 
#' @return Returns the geographical weights distance among environmental layers or variables.
#' @references Mann, H. B. (1945). Nonparametric Tests Against Trend. Econometrica, 13(3), 245–259. http://doi.org/10.1017/CBO9781107415324.00
#' @references Kendall, M. (1975). Multivariate analysis. Charles Griffin. Londres. 0-85264-234-2.
#' @references Sen, P. K. (1968). Estimates of the Regression Coefficient Based on Kendall’s Tau. Journal of the American Statistical Association, 63(324), 1379. http://doi.org/10.2307/2285891
#' @references Yue, S., & Wang, C. Y. (2004). The Mann-Kendall test modified by effective sample size to detect trend in serially correlated hydrological series. Water Resources Management, 18(3), 201–218. http://doi.org/10.1023/B:WARM.0000043140.61082.60
#' 
#' @importFrom stats acf pnorm median
#' 
#' @export

MannKendallc<- function (x) 
{
  # Parameters
  options(scipen = 999)
  x = x
  z = NULL
  z0 = NULL
  pval = NULL
  pval0 = NULL
  S = 0
  Tau = NULL
  essf = NULL
  
  # Check 
  if (is.vector(x) == FALSE) {
    stop("Input data must be a vector")
  }
  
  if (any(is.finite(x) == FALSE)) {
    x <- x[-c(which(is.finite(x) == FALSE))]
    warning("The input vector contains non-finite numbers. An attempt was made to remove them")
  }
  
  n <- length(x)
  if (n < 3) {
    stop("Input vector must contain at least three values")
  }
  V <- rep(NA, n * (n - 1)/2)
  k = 0
  for (i in 1:(n - 1)) {
    for (j in (i + 1):n) {
      k = k + 1
      V[k] = (x[j] - x[i])/(j - i)
    }
  }
  slp <- median(V, na.rm = TRUE)
  t = 1:length(x)
  xn = (x[1:n]) - ((slp) * (t))
  for (i in 1:(n - 1)) {
    for (j in (i + 1):n) {
      S = S + sign(x[j] - x[i])
    }
  }
  ro <- acf(xn, lag.max = (n - 1), plot = FALSE)$acf[-1]
  rof <- rep(NA, length(ro))
  for (i in 1:(length(ro))) {
    rof[i] <- ro[i]
  }
  ess = 0
  for (k in 1:(n - 1)) {
    ess = ess + (1 - (k/n)) * rof[k]
  }
  essf = 1 + 2 * (ess)
  var.S = n * (n - 1) * (2 * n + 5) * (1/18)
  if (length(unique(x)) < n) {
    aux <- unique(x)
    for (i in 1:length(aux)) {
      tie <- length(which(x == aux[i]))
      if (tie > 1) {
        var.S = var.S - tie * (tie - 1) * (2 * tie + 
                                             5) * (1/18)
      }
    }
  }
  VS = var.S * essf
  if (S == 0) {
    z = 0
    z0 = 0
  }
  else if (S > 0) {
    z = (S - 1)/sqrt(VS)
    z0 = (S - 1)/sqrt(var.S)
  }
  else {
    z = (S + 1)/sqrt(VS)
    z0 = (S + 1)/sqrt(var.S)
  }
  pval = 2 * pnorm(-abs(z))
  pval0 = 2 * pnorm(-abs(z0))
  Tau = S/(0.5 * n * (n - 1))
  return(c(`Corrected Zc` = z, `new P-value` = pval, `N/N*` = essf, 
           `Original Z` = z0, `old P.value` = pval0, Tau = Tau, 
           `Sen's slope` = slp, old.variance = var.S, new.variance = VS))
}