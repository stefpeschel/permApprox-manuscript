#' Standardize observed and permutation test statistics
#'
#' Transforms observed and permutation test statistics to a standardized
#' (z-like) scale by centering and scaling with respect to the permutation
#' distribution for each test.
#'
#' Standardization removes scale differences between test statistics
#' (e.g., t-statistics vs. Wilcoxon statistics) and ensures that the
#' \code{\link{eps_log_auto}} function can be applied universally.
#'
#' @param obs_stats Numeric vector of observed test statistics, length \eqn{m}
#'   (number of tests).
#' @param perm_stats Numeric matrix or data frame of permutation test statistics
#'   with dimensions \eqn{B \times m}, where \eqn{B} is the number of permutations
#'   and \eqn{m} is the number of tests. Each column corresponds to one test.
#' @param center Logical. If \code{TRUE} (default), subtract the permutation mean
#'   from each observed and permutation statistic.
#' @param scale Logical. If \code{TRUE} (default), divide each observed and
#'   permutation statistic by the permutation standard deviation.
#' @param na.rm Logical. If \code{TRUE} (default), remove \code{NA} values when
#'   computing means and standard deviations.
#'
#' @return A list with components:
#' \describe{
#'   \item{\code{obs}}{Numeric vector of standardized observed statistics.}
#'   \item{\code{perm}}{Numeric matrix of standardized permutation statistics.}
#'   \item{\code{center_vals}}{Numeric vector of means used for centering.}
#'   \item{\code{scale_vals}}{Numeric vector of standard deviations used for scaling.}
#' }
#'
#' @details
#' This transformation preserves the relative ordering of statistics within
#' each test, so p-values computed from standardized statistics are identical
#' to those computed from the original statistics (up to numerical precision).
#'
#' Standardization is especially important when using the constrained GPD
#' approximation, as it ensures the \eqn{\varepsilon} rule behaves consistently
#' across different test statistics and sample sizes.
#'
#' @examples
#' # Simulate example data
#' set.seed(1)
#' obs <- c(2.1, 5.3)  # observed test statistics for 2 tests
#' perm <- matrix(rnorm(2000), nrow = 100, ncol = 2)  # 100 permutations
#'
#' std_res <- standardize_test_stats(obs, perm)
#' std_res$obs
#'
#' @export
standardize_test_stats <- function(obs_stats, perm_stats,
                                   center = TRUE, scale = TRUE, na.rm = TRUE) {
  stopifnot(is.numeric(obs_stats), is.matrix(perm_stats) || is.data.frame(perm_stats))
  
  perm_stats <- as.matrix(perm_stats)
  m <- length(obs_stats)
  
  if (ncol(perm_stats) != m) {
    stop("Number of columns in perm_stats must match length of obs_stats.")
  }
  
  center_vals <- if (center) {
    colMeans(perm_stats, na.rm = na.rm)
  } else {
    rep(0, m)
  }
  
  scale_vals <- if (scale) {
    apply(perm_stats, 2, sd, na.rm = na.rm)
  } else {
    rep(1, m)
  }
  
  # Avoid division by zero
  scale_vals[scale_vals == 0] <- 1
  
  obs_std <- (obs_stats - center_vals) / scale_vals
  perm_std <- sweep(perm_stats, 2, center_vals, FUN = "-")
  perm_std <- sweep(perm_std, 2, scale_vals, FUN = "/")
  
  list(
    obs = obs_std,
    perm = perm_std,
    center_vals = center_vals,
    scale_vals = scale_vals
  )
}
