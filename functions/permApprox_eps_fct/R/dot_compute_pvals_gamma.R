#' @title Compute p-values via Gamma approximation
#'
#' @importFrom fitdistrplus fitdist
#' @importFrom stats pgamma
#' @import goftest
#'
#' @keywords internal

.compute_pvals_gamma <- function(p_empirical, perm_stats, obs_stats, n_test,
                                 fit_thresh, alternative, control) {
  
  pvals <- p_empirical
  
  # Assign control arguments
  include_obs <- control$include_obs
  gof_test    <- control$gof_test
  gof_alpha   <- control$gof_alpha
  
  # Include observed test statistic
  if (include_obs) perm_stats <- rbind(obs_stats, perm_stats)
  
  # Number of permutations
  n_perm <- nrow(perm_stats)
  
  # Initialize vectors for parameter output
  shape <- rate <- gof_p_value <- rep(NA_real_, n_test)
  gof_rejected <- rep(FALSE, n_test)
  
  # Transform test statistics for tail modeling
  transformed <- lapply(seq_len(n_test), function(i) {
    .transform_stats(
      perm_stats   = perm_stats[, i],
      obs_stats    = obs_stats[i],
      alternative  = alternative
    )
  })
  
  # Extract transformed obs_stats and perm_stats into vectors/matrices
  trans_obs  <- sapply(transformed, function(x) x$obs_stats)
  trans_perm <- lapply(transformed, function(x) x$perm_stats)
  
  # Indices of p-values below threshold (only these are fitted)
  idx_fit <- which(pvals < fit_thresh & trans_obs > 0)
  
  # Tests for which a Gamma fit is performed
  fitted <- rep(FALSE, n_test)
  fitted[idx_fit] <- TRUE
  
  # Method that is finally used
  method_used <- rep("empirical", n_test)
  method_used[idx_fit] <- "gamma"							 
  
  # List to store the test statistics used for the fit
  perm_stats_fitted <- vector("list", length = n_test)
  
  for (i in idx_fit) {
    
    obs  <- trans_obs[i]
    perm <- trans_perm[[i]]
    
    # Store used permutation stats (regardless of success)
    perm_stats_fitted[[i]] <- perm
    
    # Basic sanity checks for Gamma MLE
    if (length(perm) < 2L || !all(is.finite(perm)) || any(perm <= 0)) {
      # Fallback to empirical
      shape[i] <- NA_real_
      rate[i]  <- NA_real_
      pvals[i] <- p_empirical[i]
      method_used[i] <- "empirical"
      next
    }
    
    # Try the Gamma fit; on any error, fallback to empirical
    gamma_fit <- tryCatch(
      suppressWarnings(
        fitdistrplus::fitdist(data = perm, distr = "gamma", method = "mle")
      ),
      error = function(e) NULL
    )
    
    if (is.null(gamma_fit)) {
      # No convergence / fit failed
      shape[i] <- NA_real_
      rate[i]  <- NA_real_
      pvals[i] <- p_empirical[i]
      method_used[i] <- "empirical"
      next
    }
    
    # Extract estimates and validate
    est_shape <- as.numeric(gamma_fit$estimate["shape"])
    est_rate  <- as.numeric(gamma_fit$estimate["rate"])
    
    
    
    
    if (!is.finite(est_shape) || !is.finite(est_rate) || est_shape <= 0 || est_rate <= 0) {
      shape[i] <- NA_real_
      rate[i]  <- NA_real_
      pvals[i] <- p_empirical[i]
      method_used[i] <- "empirical"
      next
    }
    
    # Compute Gamma-based p-value (with guard)
    gamma_p <- tryCatch(
      (length(perm) / n_perm) *
        stats::pgamma(q = obs, shape = est_shape, rate = est_rate, lower.tail = FALSE),
      error = function(e) NA_real_,
      warning = function(w) NA_real_
    )
    
    if (!is.finite(gamma_p) || is.na(gamma_p)) {
      shape[i] <- NA_real_
      rate[i]  <- NA_real_
      pvals[i] <- p_empirical[i]
      method_used[i] <- "empirical"
      next
    }
    
    # Success path
    shape[i] <- est_shape
    rate[i]  <- est_rate
    pvals[i] <- gamma_p
    
    # Optional: Goodness-of-fit test
    if (identical(gof_test, "cvm")) {
      cvmtest <- tryCatch(
        goftest::cvm.test(x = perm, null = "gamma", shape = est_shape, rate = est_rate),
        error = function(e) NULL
      )
      
      if (!is.null(cvmtest)) {
        gof_p_value[i] <- cvmtest$p.value
        if (is.finite(cvmtest$p.value) && cvmtest$p.value <= gof_alpha) {
          gof_rejected[i] <- TRUE
        }
      }
    }
  }
  
  # Replace by empirical if GOF rejected
  if (identical(gof_test, "cvm")) {
    pvals[gof_rejected]      <- p_empirical[gof_rejected]
    method_used[gof_rejected] <- "empirical"
  }
  
  list(
    p_values          = pvals,
    fitted            = fitted,
    shape             = shape,
    rate              = rate,
    gof_p_value       = gof_p_value,
    gof_rejected      = gof_rejected,
    method_used       = method_used,
    perm_stats_fitted = perm_stats_fitted
  )
}
