Accuracy and error-rate study - Unconstrained vs. constrained (fact,
SLLS)
================
Compiled at 2026-02-02 19:25:32 UTC

``` r
here::i_am(paste0(params$name, ".Rmd"), uuid = "7146734b-7152-4fe6-a555-ed990432b2bd")
```

``` r
# create or *empty* the target directory, used to write this file's data: 
#projthis::proj_create_dir_target(params$name, clean = TRUE)

# function to get path to target directory: path_target("sample.csv")
path_target <- projthis::proj_path_target(params$name)

# function to get path to previous data: path_source("00-import", "sample.csv")
path_source <- projthis::proj_path_source(params$name)
```

## Load permApprox functions

## Epsilon rule

``` r
# Build T_cap from choice: "perm" or "tmax"
# - cap_base = "tmax": uses observed maximum across tests
# - cap_base = "perm": uses high quantile of |perm_stats| inflated by g(n)
.build_Tcap <- function(cap_base, t_obs, perm_stats, n, 
                        q_ref = 0.99, alpha = 0.5) {
  if (identical(cap_base, "tmax")) {
    # Observed cap (same for all tests)
    T_cap <- rep(max(abs(t_obs), na.rm = TRUE), length(t_obs))

  } else if (identical(cap_base, "perm")) {
    # Permutation cap: high quantile of |perm|, inflated by g(n)
    if (is.null(dim(perm_stats))) perm_stats <- matrix(perm_stats, ncol = 1)
    Tabs <- abs(perm_stats)
    Tq <- apply(Tabs, 2, stats::quantile, probs = q_ref, na.rm = TRUE, names = FALSE)
    
    # Inflation g(n) = max(1, alpha * sqrt(n))
    infl <- pmax(1, alpha * sqrt(n))
    T_cap <- Tq * infl

    # Broadcast if needed
    if (length(T_cap) == 1L) T_cap <- rep(T_cap, length(t_obs))
    if (length(T_cap) != length(t_obs)) T_cap <- rep(T_cap[1L], length(t_obs))

  } else {
    stop("cap_base must be 'perm' or 'tmax'.")
  }

  # Guardrails: enforce positive finite caps
  bad <- !is.finite(T_cap) | T_cap <= 0
  if (any(bad)) {
    fallback <- max(T_cap[!bad], 1)
    T_cap[bad] <- fallback
  }
  T_cap
}

# Standardized Lifted Log-Saturation (SLLS) using unified Z-cap
# - Standardize to Z using permutation mean/sd per test
# - Build the cap on the Z-scale via .build_Tcap (cap_base = "perm" or "tmax")
# - Apply simplified LLS on Z
# - Map epsilon back to T-scale via sigma_j
eps_slls <- function(obs_stats,
                     perm_stats,
                     sampsize,
                     cap_base      = "tmax",  # Z-cap choice
                     alpha         = 0.5, # g(n) = max(1, alpha*sqrt(n))
                     q_ref         = 0.99, # quantile of |Z_perm|
                     rho_lift      = 3,
                     k_factor      = 1000,
                     target_factor = 0.25,
                     floor_epsZ    = 1e-6,
                     ...) {
  cap_base <- match.arg(cap_base, choices = c("perm", "tmax"))
  n <- sampsize
  stopifnot(n > 0)
  
  # Shape inputs --------------------------------------------------------------
  # Allow vector perm_stats for single test
  if (is.null(dim(perm_stats))) perm_stats <- matrix(perm_stats, ncol = 1)
  Tobs <- as.numeric(obs_stats)
  
  # Z-standardization per test -----------------------------------------------
  mu  <- colMeans(perm_stats, na.rm = TRUE)
  sig <- apply(perm_stats, 2, sd, na.rm = TRUE)
  
  # Guard against non-finite or zero SDs: replace with a small positive fallback
  valid_sig <- sig[is.finite(sig) & sig > 0]
  sig_fallback <- if (length(valid_sig)) max(min(valid_sig), 1e-12) else 1e-12
  sig_ok <- sig
  sig_ok[!is.finite(sig_ok) | sig_ok <= 0] <- sig_fallback

  Zobs  <- abs((Tobs - mu) / sig_ok)
  Zperm <- sweep(sweep(perm_stats, 2, mu, "-"), 2, sig_ok, "/")  # same shape as perm_stats

  # Build Z-cap (unified) -----------------------------------------------------
  # Uses: "tmax" => max(Zobs); "perm" => Q_q(|Zperm|) * g(n) with g(n)=max(1, alpha*sqrt(n))
  T_cap_Z <- .build_Tcap(cap_base = cap_base,
                         t_obs    = Zobs,
                         perm_stats = Zperm,
                         n        = n,
                         q_ref    = q_ref,
                         alpha    = alpha)

  # LLS core on Z -------------------------------------------------------------
  k        <- k_factor      * (500 / n)
  E_target <- target_factor * (500 / n)

  if (!any(is.finite(T_cap_Z)) || all(T_cap_Z <= 0)) {
    # Conservative constant if the cap failed
    epsZ <- rep(max(E_target + rho_lift, floor_epsZ), length(Zobs))
  } else {
    s   <- pmin(Zobs / T_cap_Z, 1)        # scale-free index in [0,1]
    psi <- (1 - s)^4 * (1 + 4*s)          # Wendland C^2 lift
    epsZ_core <- E_target * log1p(k * s) / log1p(k) + rho_lift * psi
    epsZ <- pmax(epsZ_core, floor_epsZ)
  }

  # Map back to T-scale -------------------------------------------------------
  epsT <- epsZ * sig_ok
  epsT
}
```

## Helpers: listing files, parsing settings, estimator runner

## ACCURACY

### Compute p-values and save

### Collect & reshape

### P-values by n (boxplots only)

![](figures/02_constr_vs_unconstr/accuracy_by_n_boxplot-1.png)<!-- -->

### P-values by n

Approximated p-values with sample size on the x axis. The boxplots
represent non-zero p-values only.

![](figures/02_constr_vs_unconstr/accuracy_pval_by_n_boxplot-1.png)<!-- -->

### Ratios by n

Ratios ($p_{method}$ / $p_{ttest}$) for non-zero p-values, with sample
size on the x axis.

![](figures/02_constr_vs_unconstr/accuracy_ratio_by_n_boxplot-1.png)<!-- -->

### P-values by d

Approximated p-values with effect size on the x axis. The boxplots
represent non-zero p-values only.

![](figures/02_constr_vs_unconstr/accuracy_pval_by_d_boxplot-1.png)<!-- -->

### Ratios by d

Ratios ($p_{method}$ / $p_{ttest}$) for non-zero p-values, with effect
size on the x axis.

![](figures/02_constr_vs_unconstr/accuracy_ratio_by_d_boxplot-1.png)<!-- -->

### P-values by B

Approximated p-values with number of permutations on the x axis. The
boxplots represent non-zero p-values only.

![](figures/02_constr_vs_unconstr/accuracy_pval_by_B_boxplot-1.png)<!-- -->

### Ratios by B

Ratios ($p_{method}$ / $p_{ttest}$) for non-zero p-values, with number
of permutations on the x axis.

![](figures/02_constr_vs_unconstr/accuracy_ratio_by_B_boxplot-1.png)<!-- -->

### Table: Zeros and times where method p-value \< t-test p-value

|    n | method      | zeros | zeros (%) | \< t-test | \< t-test (%) | total |
|-----:|:------------|------:|:----------|----------:|:--------------|------:|
|   25 | GPD(U)      |   127 | 12.7%     |       660 | 66.0%         |  1000 |
|   25 | GPD(C,SLLS) |     0 | 0.0%      |       139 | 13.9%         |  1000 |
|   50 | GPD(U)      |   528 | 52.8%     |       840 | 84.0%         |  1000 |
|   50 | GPD(C,SLLS) |     0 | 0.0%      |       148 | 14.8%         |  1000 |
|   75 | GPD(U)      |   765 | 76.5%     |       925 | 92.5%         |  1000 |
|   75 | GPD(C,SLLS) |     0 | 0.0%      |       369 | 36.9%         |  1000 |
|  100 | GPD(U)      |   893 | 89.3%     |       954 | 95.4%         |  1000 |
|  100 | GPD(C,SLLS) |     0 | 0.0%      |       539 | 53.9%         |  1000 |
|  250 | GPD(U)      |   977 | 97.7%     |       978 | 97.8%         |  1000 |
|  250 | GPD(C,SLLS) |     0 | 0.0%      |       876 | 87.6%         |  1000 |
|  500 | GPD(U)      |   989 | 98.9%     |       989 | 98.9%         |  1000 |
|  500 | GPD(C,SLLS) |     0 | 0.0%      |       793 | 79.3%         |  1000 |
|  750 | GPD(U)      |   993 | 99.3%     |       993 | 99.3%         |  1000 |
|  750 | GPD(C,SLLS) |     0 | 0.0%      |       522 | 52.2%         |  1000 |
| 1000 | GPD(U)      |   990 | 99.0%     |       990 | 99.0%         |  1000 |
| 1000 | GPD(C,SLLS) |     0 | 0.0%      |       288 | 28.8%         |  1000 |

### Table: Accuracy metrics

<table class=" lightable-classic" style="color: black; font-family: &quot;Arial Narrow&quot;, &quot;Source Sans Pro&quot;, sans-serif; width: auto !important; margin-left: auto; margin-right: auto;">

<caption>

Accuracy vs. t-test by n (d=1, B=1000).
</caption>

<thead>

<tr>

<th style="text-align:right;">

n
</th>

<th style="text-align:left;">

method
</th>

<th style="text-align:right;">

N
</th>

<th style="text-align:left;">

bias
</th>

<th style="text-align:left;">

sd
</th>

<th style="text-align:left;">

rmse
</th>

<th style="text-align:left;">

cor_spear
</th>

<th style="text-align:right;">

N_pos
</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:right;">

25
</td>

<td style="text-align:left;">

GPD(U)
</td>

<td style="text-align:right;">

1000
</td>

<td style="text-align:left;">

-1.08e-05
</td>

<td style="text-align:left;">

3.14e-03
</td>

<td style="text-align:left;">

3.14e-03
</td>

<td style="text-align:left;">

0.941
</td>

<td style="text-align:right;">

873
</td>

</tr>

<tr>

<td style="text-align:right;">

25
</td>

<td style="text-align:left;">

GPD(C,SLLS)
</td>

<td style="text-align:right;">

1000
</td>

<td style="text-align:left;">

5.07e-04
</td>

<td style="text-align:left;">

3.09e-03
</td>

<td style="text-align:left;">

3.13e-03
</td>

<td style="text-align:left;">

0.991
</td>

<td style="text-align:right;">

1000
</td>

</tr>

<tr>

<td style="text-align:right;">

50
</td>

<td style="text-align:left;">

GPD(U)
</td>

<td style="text-align:right;">

1000
</td>

<td style="text-align:left;">

-7.82e-06
</td>

<td style="text-align:left;">

5.71e-04
</td>

<td style="text-align:left;">

5.71e-04
</td>

<td style="text-align:left;">

0.636
</td>

<td style="text-align:right;">

472
</td>

</tr>

<tr>

<td style="text-align:right;">

50
</td>

<td style="text-align:left;">

GPD(C,SLLS)
</td>

<td style="text-align:right;">

1000
</td>

<td style="text-align:left;">

8.36e-05
</td>

<td style="text-align:left;">

5.22e-04
</td>

<td style="text-align:left;">

5.28e-04
</td>

<td style="text-align:left;">

0.964
</td>

<td style="text-align:right;">

1000
</td>

</tr>

<tr>

<td style="text-align:right;">

75
</td>

<td style="text-align:left;">

GPD(U)
</td>

<td style="text-align:right;">

1000
</td>

<td style="text-align:left;">

-3.54e-06
</td>

<td style="text-align:left;">

7.86e-05
</td>

<td style="text-align:left;">

7.87e-05
</td>

<td style="text-align:left;">

0.361
</td>

<td style="text-align:right;">

235
</td>

</tr>

<tr>

<td style="text-align:right;">

75
</td>

<td style="text-align:left;">

GPD(C,SLLS)
</td>

<td style="text-align:right;">

1000
</td>

<td style="text-align:left;">

6.47e-06
</td>

<td style="text-align:left;">

9.68e-05
</td>

<td style="text-align:left;">

9.69e-05
</td>

<td style="text-align:left;">

0.952
</td>

<td style="text-align:right;">

1000
</td>

</tr>

<tr>

<td style="text-align:right;">

100
</td>

<td style="text-align:left;">

GPD(U)
</td>

<td style="text-align:right;">

1000
</td>

<td style="text-align:left;">

-3.20e-07
</td>

<td style="text-align:left;">

5.59e-06
</td>

<td style="text-align:left;">

5.60e-06
</td>

<td style="text-align:left;">

0.200
</td>

<td style="text-align:right;">

107
</td>

</tr>

<tr>

<td style="text-align:right;">

100
</td>

<td style="text-align:left;">

GPD(C,SLLS)
</td>

<td style="text-align:right;">

1000
</td>

<td style="text-align:left;">

-1.21e-07
</td>

<td style="text-align:left;">

2.77e-06
</td>

<td style="text-align:left;">

2.77e-06
</td>

<td style="text-align:left;">

0.944
</td>

<td style="text-align:right;">

1000
</td>

</tr>

<tr>

<td style="text-align:right;">

250
</td>

<td style="text-align:left;">

GPD(U)
</td>

<td style="text-align:right;">

1000
</td>

<td style="text-align:left;">

2.54e-10
</td>

<td style="text-align:left;">

7.97e-09
</td>

<td style="text-align:left;">

7.97e-09
</td>

<td style="text-align:left;">

0.083
</td>

<td style="text-align:right;">

23
</td>

</tr>

<tr>

<td style="text-align:right;">

250
</td>

<td style="text-align:left;">

GPD(C,SLLS)
</td>

<td style="text-align:right;">

1000
</td>

<td style="text-align:left;">

2.54e-10
</td>

<td style="text-align:left;">

7.97e-09
</td>

<td style="text-align:left;">

7.97e-09
</td>

<td style="text-align:left;">

0.890
</td>

<td style="text-align:right;">

1000
</td>

</tr>

<tr>

<td style="text-align:right;">

500
</td>

<td style="text-align:left;">

GPD(U)
</td>

<td style="text-align:right;">

1000
</td>

<td style="text-align:left;">

1.12e-13
</td>

<td style="text-align:left;">

2.91e-12
</td>

<td style="text-align:left;">

2.91e-12
</td>

<td style="text-align:left;">

-0.002
</td>

<td style="text-align:right;">

11
</td>

</tr>

<tr>

<td style="text-align:right;">

500
</td>

<td style="text-align:left;">

GPD(C,SLLS)
</td>

<td style="text-align:right;">

1000
</td>

<td style="text-align:left;">

1.12e-13
</td>

<td style="text-align:left;">

2.91e-12
</td>

<td style="text-align:left;">

2.91e-12
</td>

<td style="text-align:left;">

0.802
</td>

<td style="text-align:right;">

1000
</td>

</tr>

<tr>

<td style="text-align:right;">

750
</td>

<td style="text-align:left;">

GPD(U)
</td>

<td style="text-align:right;">

1000
</td>

<td style="text-align:left;">

6.91e-17
</td>

<td style="text-align:left;">

2.02e-15
</td>

<td style="text-align:left;">

2.02e-15
</td>

<td style="text-align:left;">

0.021
</td>

<td style="text-align:right;">

7
</td>

</tr>

<tr>

<td style="text-align:right;">

750
</td>

<td style="text-align:left;">

GPD(C,SLLS)
</td>

<td style="text-align:right;">

1000
</td>

<td style="text-align:left;">

6.91e-17
</td>

<td style="text-align:left;">

2.02e-15
</td>

<td style="text-align:left;">

2.02e-15
</td>

<td style="text-align:left;">

0.729
</td>

<td style="text-align:right;">

1000
</td>

</tr>

<tr>

<td style="text-align:right;">

1000
</td>

<td style="text-align:left;">

GPD(U)
</td>

<td style="text-align:right;">

1000
</td>

<td style="text-align:left;">

4.87e-15
</td>

<td style="text-align:left;">

1.54e-13
</td>

<td style="text-align:left;">

1.54e-13
</td>

<td style="text-align:left;">

0.003
</td>

<td style="text-align:right;">

10
</td>

</tr>

<tr>

<td style="text-align:right;">

1000
</td>

<td style="text-align:left;">

GPD(C,SLLS)
</td>

<td style="text-align:right;">

1000
</td>

<td style="text-align:left;">

4.87e-15
</td>

<td style="text-align:left;">

1.54e-13
</td>

<td style="text-align:left;">

1.54e-13
</td>

<td style="text-align:left;">

0.718
</td>

<td style="text-align:right;">

1000
</td>

</tr>

</tbody>

</table>

<table class=" lightable-classic" style="color: black; font-family: &quot;Arial Narrow&quot;, &quot;Source Sans Pro&quot;, sans-serif; width: auto !important; margin-left: auto; margin-right: auto;">

<caption>

Accuracy vs. t-test across all settings.
</caption>

<thead>

<tr>

<th style="text-align:right;">

n
</th>

<th style="text-align:right;">

d
</th>

<th style="text-align:right;">

n_perm
</th>

<th style="text-align:left;">

method
</th>

<th style="text-align:right;">

N
</th>

<th style="text-align:left;">

bias
</th>

<th style="text-align:left;">

sd
</th>

<th style="text-align:left;">

rmse
</th>

<th style="text-align:left;">

cor_spear
</th>

<th style="text-align:right;">

N_pos
</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:right;">

25
</td>

<td style="text-align:right;">

1.0
</td>

<td style="text-align:right;">

1000
</td>

<td style="text-align:left;">

GPD(U)
</td>

<td style="text-align:right;">

1000
</td>

<td style="text-align:left;">

-1.08e-05
</td>

<td style="text-align:left;">

3.14e-03
</td>

<td style="text-align:left;">

3.14e-03
</td>

<td style="text-align:left;">

0.941
</td>

<td style="text-align:right;">

873
</td>

</tr>

<tr>

<td style="text-align:right;">

25
</td>

<td style="text-align:right;">

1.0
</td>

<td style="text-align:right;">

1000
</td>

<td style="text-align:left;">

GPD(C,SLLS)
</td>

<td style="text-align:right;">

1000
</td>

<td style="text-align:left;">

5.07e-04
</td>

<td style="text-align:left;">

3.09e-03
</td>

<td style="text-align:left;">

3.13e-03
</td>

<td style="text-align:left;">

0.991
</td>

<td style="text-align:right;">

1000
</td>

</tr>

<tr>

<td style="text-align:right;">

50
</td>

<td style="text-align:right;">

1.0
</td>

<td style="text-align:right;">

1000
</td>

<td style="text-align:left;">

GPD(U)
</td>

<td style="text-align:right;">

1000
</td>

<td style="text-align:left;">

-7.82e-06
</td>

<td style="text-align:left;">

5.71e-04
</td>

<td style="text-align:left;">

5.71e-04
</td>

<td style="text-align:left;">

0.636
</td>

<td style="text-align:right;">

472
</td>

</tr>

<tr>

<td style="text-align:right;">

50
</td>

<td style="text-align:right;">

1.0
</td>

<td style="text-align:right;">

1000
</td>

<td style="text-align:left;">

GPD(C,SLLS)
</td>

<td style="text-align:right;">

1000
</td>

<td style="text-align:left;">

8.36e-05
</td>

<td style="text-align:left;">

5.22e-04
</td>

<td style="text-align:left;">

5.28e-04
</td>

<td style="text-align:left;">

0.964
</td>

<td style="text-align:right;">

1000
</td>

</tr>

<tr>

<td style="text-align:right;">

75
</td>

<td style="text-align:right;">

1.0
</td>

<td style="text-align:right;">

1000
</td>

<td style="text-align:left;">

GPD(U)
</td>

<td style="text-align:right;">

1000
</td>

<td style="text-align:left;">

-3.54e-06
</td>

<td style="text-align:left;">

7.86e-05
</td>

<td style="text-align:left;">

7.87e-05
</td>

<td style="text-align:left;">

0.361
</td>

<td style="text-align:right;">

235
</td>

</tr>

<tr>

<td style="text-align:right;">

75
</td>

<td style="text-align:right;">

1.0
</td>

<td style="text-align:right;">

1000
</td>

<td style="text-align:left;">

GPD(C,SLLS)
</td>

<td style="text-align:right;">

1000
</td>

<td style="text-align:left;">

6.47e-06
</td>

<td style="text-align:left;">

9.68e-05
</td>

<td style="text-align:left;">

9.69e-05
</td>

<td style="text-align:left;">

0.952
</td>

<td style="text-align:right;">

1000
</td>

</tr>

<tr>

<td style="text-align:right;">

100
</td>

<td style="text-align:right;">

0.5
</td>

<td style="text-align:right;">

1000
</td>

<td style="text-align:left;">

GPD(U)
</td>

<td style="text-align:right;">

1000
</td>

<td style="text-align:left;">

1.76e-04
</td>

<td style="text-align:left;">

2.94e-03
</td>

<td style="text-align:left;">

2.95e-03
</td>

<td style="text-align:left;">

0.935
</td>

<td style="text-align:right;">

800
</td>

</tr>

<tr>

<td style="text-align:right;">

100
</td>

<td style="text-align:right;">

0.5
</td>

<td style="text-align:right;">

1000
</td>

<td style="text-align:left;">

GPD(C,SLLS)
</td>

<td style="text-align:right;">

1000
</td>

<td style="text-align:left;">

2.68e-04
</td>

<td style="text-align:left;">

2.89e-03
</td>

<td style="text-align:left;">

2.91e-03
</td>

<td style="text-align:left;">

0.984
</td>

<td style="text-align:right;">

1000
</td>

</tr>

<tr>

<td style="text-align:right;">

100
</td>

<td style="text-align:right;">

1.0
</td>

<td style="text-align:right;">

500
</td>

<td style="text-align:left;">

GPD(U)
</td>

<td style="text-align:right;">

1000
</td>

<td style="text-align:left;">

2.18e-07
</td>

<td style="text-align:left;">

8.85e-06
</td>

<td style="text-align:left;">

8.85e-06
</td>

<td style="text-align:left;">

0.151
</td>

<td style="text-align:right;">

165
</td>

</tr>

<tr>

<td style="text-align:right;">

100
</td>

<td style="text-align:right;">

1.0
</td>

<td style="text-align:right;">

500
</td>

<td style="text-align:left;">

GPD(C,SLLS)
</td>

<td style="text-align:right;">

1000
</td>

<td style="text-align:left;">

4.55e-07
</td>

<td style="text-align:left;">

6.07e-06
</td>

<td style="text-align:left;">

6.09e-06
</td>

<td style="text-align:left;">

0.825
</td>

<td style="text-align:right;">

1000
</td>

</tr>

<tr>

<td style="text-align:right;">

100
</td>

<td style="text-align:right;">

1.0
</td>

<td style="text-align:right;">

1000
</td>

<td style="text-align:left;">

GPD(U)
</td>

<td style="text-align:right;">

1000
</td>

<td style="text-align:left;">

-3.20e-07
</td>

<td style="text-align:left;">

5.59e-06
</td>

<td style="text-align:left;">

5.60e-06
</td>

<td style="text-align:left;">

0.200
</td>

<td style="text-align:right;">

107
</td>

</tr>

<tr>

<td style="text-align:right;">

100
</td>

<td style="text-align:right;">

1.0
</td>

<td style="text-align:right;">

1000
</td>

<td style="text-align:left;">

GPD(C,SLLS)
</td>

<td style="text-align:right;">

1000
</td>

<td style="text-align:left;">

-1.21e-07
</td>

<td style="text-align:left;">

2.77e-06
</td>

<td style="text-align:left;">

2.77e-06
</td>

<td style="text-align:left;">

0.944
</td>

<td style="text-align:right;">

1000
</td>

</tr>

<tr>

<td style="text-align:right;">

100
</td>

<td style="text-align:right;">

1.0
</td>

<td style="text-align:right;">

5000
</td>

<td style="text-align:left;">

GPD(U)
</td>

<td style="text-align:right;">

1000
</td>

<td style="text-align:left;">

-3.44e-07
</td>

<td style="text-align:left;">

4.30e-06
</td>

<td style="text-align:left;">

4.31e-06
</td>

<td style="text-align:left;">

0.197
</td>

<td style="text-align:right;">

26
</td>

</tr>

<tr>

<td style="text-align:right;">

100
</td>

<td style="text-align:right;">

1.0
</td>

<td style="text-align:right;">

5000
</td>

<td style="text-align:left;">

GPD(C,SLLS)
</td>

<td style="text-align:right;">

1000
</td>

<td style="text-align:left;">

-1.99e-07
</td>

<td style="text-align:left;">

3.34e-06
</td>

<td style="text-align:left;">

3.35e-06
</td>

<td style="text-align:left;">

0.992
</td>

<td style="text-align:right;">

1000
</td>

</tr>

<tr>

<td style="text-align:right;">

100
</td>

<td style="text-align:right;">

1.0
</td>

<td style="text-align:right;">

10000
</td>

<td style="text-align:left;">

GPD(U)
</td>

<td style="text-align:right;">

1000
</td>

<td style="text-align:left;">

-3.05e-07
</td>

<td style="text-align:left;">

3.25e-06
</td>

<td style="text-align:left;">

3.27e-06
</td>

<td style="text-align:left;">

0.229
</td>

<td style="text-align:right;">

19
</td>

</tr>

<tr>

<td style="text-align:right;">

100
</td>

<td style="text-align:right;">

1.0
</td>

<td style="text-align:right;">

10000
</td>

<td style="text-align:left;">

GPD(C,SLLS)
</td>

<td style="text-align:right;">

1000
</td>

<td style="text-align:left;">

-1.84e-07
</td>

<td style="text-align:left;">

2.76e-06
</td>

<td style="text-align:left;">

2.77e-06
</td>

<td style="text-align:left;">

0.995
</td>

<td style="text-align:right;">

1000
</td>

</tr>

<tr>

<td style="text-align:right;">

100
</td>

<td style="text-align:right;">

1.5
</td>

<td style="text-align:right;">

1000
</td>

<td style="text-align:left;">

GPD(U)
</td>

<td style="text-align:right;">

1000
</td>

<td style="text-align:left;">

8.41e-11
</td>

<td style="text-align:left;">

1.45e-09
</td>

<td style="text-align:left;">

1.45e-09
</td>

<td style="text-align:left;">

0.074
</td>

<td style="text-align:right;">

37
</td>

</tr>

<tr>

<td style="text-align:right;">

100
</td>

<td style="text-align:right;">

1.5
</td>

<td style="text-align:right;">

1000
</td>

<td style="text-align:left;">

GPD(C,SLLS)
</td>

<td style="text-align:right;">

1000
</td>

<td style="text-align:left;">

8.41e-11
</td>

<td style="text-align:left;">

1.45e-09
</td>

<td style="text-align:left;">

1.45e-09
</td>

<td style="text-align:left;">

0.905
</td>

<td style="text-align:right;">

1000
</td>

</tr>

<tr>

<td style="text-align:right;">

100
</td>

<td style="text-align:right;">

2.0
</td>

<td style="text-align:right;">

1000
</td>

<td style="text-align:left;">

GPD(U)
</td>

<td style="text-align:right;">

1000
</td>

<td style="text-align:left;">

3.61e-09
</td>

<td style="text-align:left;">

1.14e-07
</td>

<td style="text-align:left;">

1.14e-07
</td>

<td style="text-align:left;">

0.018
</td>

<td style="text-align:right;">

16
</td>

</tr>

<tr>

<td style="text-align:right;">

100
</td>

<td style="text-align:right;">

2.0
</td>

<td style="text-align:right;">

1000
</td>

<td style="text-align:left;">

GPD(C,SLLS)
</td>

<td style="text-align:right;">

1000
</td>

<td style="text-align:left;">

3.61e-09
</td>

<td style="text-align:left;">

1.14e-07
</td>

<td style="text-align:left;">

1.14e-07
</td>

<td style="text-align:left;">

0.885
</td>

<td style="text-align:right;">

1000
</td>

</tr>

<tr>

<td style="text-align:right;">

250
</td>

<td style="text-align:right;">

1.0
</td>

<td style="text-align:right;">

1000
</td>

<td style="text-align:left;">

GPD(U)
</td>

<td style="text-align:right;">

1000
</td>

<td style="text-align:left;">

2.54e-10
</td>

<td style="text-align:left;">

7.97e-09
</td>

<td style="text-align:left;">

7.97e-09
</td>

<td style="text-align:left;">

0.083
</td>

<td style="text-align:right;">

23
</td>

</tr>

<tr>

<td style="text-align:right;">

250
</td>

<td style="text-align:right;">

1.0
</td>

<td style="text-align:right;">

1000
</td>

<td style="text-align:left;">

GPD(C,SLLS)
</td>

<td style="text-align:right;">

1000
</td>

<td style="text-align:left;">

2.54e-10
</td>

<td style="text-align:left;">

7.97e-09
</td>

<td style="text-align:left;">

7.97e-09
</td>

<td style="text-align:left;">

0.890
</td>

<td style="text-align:right;">

1000
</td>

</tr>

<tr>

<td style="text-align:right;">

500
</td>

<td style="text-align:right;">

1.0
</td>

<td style="text-align:right;">

1000
</td>

<td style="text-align:left;">

GPD(U)
</td>

<td style="text-align:right;">

1000
</td>

<td style="text-align:left;">

1.12e-13
</td>

<td style="text-align:left;">

2.91e-12
</td>

<td style="text-align:left;">

2.91e-12
</td>

<td style="text-align:left;">

-0.002
</td>

<td style="text-align:right;">

11
</td>

</tr>

<tr>

<td style="text-align:right;">

500
</td>

<td style="text-align:right;">

1.0
</td>

<td style="text-align:right;">

1000
</td>

<td style="text-align:left;">

GPD(C,SLLS)
</td>

<td style="text-align:right;">

1000
</td>

<td style="text-align:left;">

1.12e-13
</td>

<td style="text-align:left;">

2.91e-12
</td>

<td style="text-align:left;">

2.91e-12
</td>

<td style="text-align:left;">

0.802
</td>

<td style="text-align:right;">

1000
</td>

</tr>

<tr>

<td style="text-align:right;">

750
</td>

<td style="text-align:right;">

1.0
</td>

<td style="text-align:right;">

1000
</td>

<td style="text-align:left;">

GPD(U)
</td>

<td style="text-align:right;">

1000
</td>

<td style="text-align:left;">

6.91e-17
</td>

<td style="text-align:left;">

2.02e-15
</td>

<td style="text-align:left;">

2.02e-15
</td>

<td style="text-align:left;">

0.021
</td>

<td style="text-align:right;">

7
</td>

</tr>

<tr>

<td style="text-align:right;">

750
</td>

<td style="text-align:right;">

1.0
</td>

<td style="text-align:right;">

1000
</td>

<td style="text-align:left;">

GPD(C,SLLS)
</td>

<td style="text-align:right;">

1000
</td>

<td style="text-align:left;">

6.91e-17
</td>

<td style="text-align:left;">

2.02e-15
</td>

<td style="text-align:left;">

2.02e-15
</td>

<td style="text-align:left;">

0.729
</td>

<td style="text-align:right;">

1000
</td>

</tr>

<tr>

<td style="text-align:right;">

1000
</td>

<td style="text-align:right;">

1.0
</td>

<td style="text-align:right;">

1000
</td>

<td style="text-align:left;">

GPD(U)
</td>

<td style="text-align:right;">

1000
</td>

<td style="text-align:left;">

4.87e-15
</td>

<td style="text-align:left;">

1.54e-13
</td>

<td style="text-align:left;">

1.54e-13
</td>

<td style="text-align:left;">

0.003
</td>

<td style="text-align:right;">

10
</td>

</tr>

<tr>

<td style="text-align:right;">

1000
</td>

<td style="text-align:right;">

1.0
</td>

<td style="text-align:right;">

1000
</td>

<td style="text-align:left;">

GPD(C,SLLS)
</td>

<td style="text-align:right;">

1000
</td>

<td style="text-align:left;">

4.87e-15
</td>

<td style="text-align:left;">

1.54e-13
</td>

<td style="text-align:left;">

1.54e-13
</td>

<td style="text-align:left;">

0.718
</td>

<td style="text-align:right;">

1000
</td>

</tr>

</tbody>

</table>

### Correlation plot (t-test vs. methods)

![](figures/02_constr_vs_unconstr/corr_scatter_n100_d1_B1000-1.png)<!-- -->

## ERROR RATES

### Compute p-values and save

### Collect & reshape

### Compute unadjusted & adjusted metrics

### Flexible plotting helper

### By non-null fraction (pi1)

![](figures/02_constr_vs_unconstr/unnamed-chunk-9-1.png)<!-- -->![](figures/02_constr_vs_unconstr/unnamed-chunk-9-2.png)<!-- -->![](figures/02_constr_vs_unconstr/unnamed-chunk-9-3.png)<!-- -->![](figures/02_constr_vs_unconstr/unnamed-chunk-9-4.png)<!-- -->![](figures/02_constr_vs_unconstr/unnamed-chunk-9-5.png)<!-- -->
\### By sample size (n)

![](figures/02_constr_vs_unconstr/unnamed-chunk-10-1.png)<!-- -->![](figures/02_constr_vs_unconstr/unnamed-chunk-10-2.png)<!-- -->![](figures/02_constr_vs_unconstr/unnamed-chunk-10-3.png)<!-- -->![](figures/02_constr_vs_unconstr/unnamed-chunk-10-4.png)<!-- -->![](figures/02_constr_vs_unconstr/unnamed-chunk-10-5.png)<!-- -->

### By effect size (d)

![](figures/02_constr_vs_unconstr/unnamed-chunk-11-1.png)<!-- -->![](figures/02_constr_vs_unconstr/unnamed-chunk-11-2.png)<!-- -->![](figures/02_constr_vs_unconstr/unnamed-chunk-11-3.png)<!-- -->![](figures/02_constr_vs_unconstr/unnamed-chunk-11-4.png)<!-- -->![](figures/02_constr_vs_unconstr/unnamed-chunk-11-5.png)<!-- -->

### By number of permutations

![](figures/02_constr_vs_unconstr/unnamed-chunk-12-1.png)<!-- -->![](figures/02_constr_vs_unconstr/unnamed-chunk-12-2.png)<!-- -->![](figures/02_constr_vs_unconstr/unnamed-chunk-12-3.png)<!-- -->![](figures/02_constr_vs_unconstr/unnamed-chunk-12-4.png)<!-- -->![](figures/02_constr_vs_unconstr/unnamed-chunk-12-5.png)<!-- -->

## Files written

These files have been written to the target directory,
`data/02_constr_vs_unconstr`:

    ## # A tibble: 2 × 4
    ##   path        type             size modification_time  
    ##   <fs::path>  <fct>     <fs::bytes> <dttm>             
    ## 1 acc_results directory           0 2025-12-18 14:08:34
    ## 2 err_results directory           0 2025-12-18 14:08:35
