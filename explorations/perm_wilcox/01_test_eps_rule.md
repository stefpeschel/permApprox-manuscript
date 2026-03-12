Wilcoxon (Mann–Whitney U) on exponential data - Test the SLLS epsilon
rule
================
Compiled at 2026-03-09 09:48:20 UTC

In this script we evaluate our **standardized lifted log-saturation
(SLLS)** ε-rule with the **Wilcoxon rank-sum / Mann–Whitney test**,
using the **(U) statistic** throughout.

For equal group sizes (n), (U) counts pairwise “wins” of group 1 over
group 2 and takes values in (\[0, n^2\]) with (E_0\[U\]=n^2/2). It is
related to the Wilcoxon rank-sum (W) by a constant shift:

$$
U = W - \frac{n(n+1)}{2}.
$$

We fit a GPD to the **right tail** of the permutation distribution of
(U) and compare unconstrained vs. constrained (SLLS) fits.

Unlike the two-sample $t$-test setting, the Wilcoxon (U) statistic is
**nonparametric** and has a different distributional behavior under the
null, which provides a useful test case for evaluating the robustness of
our approach.

## Data Simulation

We simulate two groups from **exponential distributions**:

- Group 1: mean (=1) (rate (=1))
- Group 2: mean (=1+) (rate (=1/(1+)))
- Sample sizes per group: 50, 100, 250, 500, 750, 1000
- Number of tests: 1000
- Effect sizes: 0 0.5 1 1.5 2
- Tests per effect size: d=0: 200, d=0.5: 200, d=1: 200, d=1.5: 200,
  d=2: 200

We apply the **Wilcoxon rank-sum test** (Mann–Whitney $U$ test) to
compare the two exponential samples.

- Statistic: **Mann–Whitney (U)** (converted from rank-sum (W))
- P-values: classical Wilcoxon (`exact = FALSE, correct = FALSE`) for
  reference; permutation/GPD for tail modeling

## Simulate data

## Histograms

![](figures/01_test_eps_rule/expl_wilcox_eps_rule_histograms-1.png)<!-- -->

## Plot function

## Function to run permApprox

This function will be used for all p-values approximations with
constrained GPD fit.

``` r
run_permApprox <- function(rule_name, eps_fct, constraint = "support_at_obs",
                           cores = 8) {
  
  path_out <- path_target()
  
  # ---- pre-check: which outputs already exist?
  out_files <- paste0(path_out, "/permapprox_constr_", rule_name,
                      "_n", n_per_group_vec, "_B", B, ".rds")
  missing_idx <- which(!file.exists(out_files))
  missing_n   <- n_per_group_vec[missing_idx]
  
  # ---- run only for missing n's
  if (length(missing_n) > 0) {
    handlers("txtprogressbar")
    plan(multisession, workers = cores)
    
    with_progress({
      p <- progressor(along = n_per_group_vec)
      
      future_map(
        n_per_group_vec,
        function(n_per_group) {
          # file name for this n
          fname_constr <- paste0(path_out, "/permapprox_constr_", rule_name, "_n",
                                 n_per_group, "_B", B, ".rds")
          
          # skip if already computed
          if (file.exists(fname_constr)) {
            p(message = sprintf("n=%s: skip (exists)", n_per_group))
            return(invisible(NULL))
          }
          
          # Load simulated data for this n
          obs_stats  <- readRDS(paste0(path_out, "/obs_U_stats_n",  n_per_group, 
                                       "_B", B, ".rds"))
          perm_stats <- readRDS(paste0(path_out, "/perm_U_stats_n", n_per_group, 
                                       "_B", B, ".rds"))
          
          # GPD control
          gpd_ctrl_constr <- make_gpd_ctrl(
            fit_method   = "LME",
            tol = 1e-7,
            include_obs  = FALSE,
            constraint   = constraint,
            thresh_method= "ftr",
            exceed0      = 250,
            exceed_min   = 10,
            thresh_step  = 10,
            gof_test     = "ad",
            gof_alpha    = 0.05,
            cores        = 1,
            verbose      = TRUE
          )
          
          # compute and save
          papprox_constr <- compute_p_values(
            obs_stats     = obs_stats,
            perm_stats    = perm_stats,
            eps_fct       = eps_fct,
            sampsize      = n_per_group,
            alternative   = "two_sided",
            null_center   = "mean",   # mean of U-perms is n^2/2
            method        = "gpd",
            gpd_ctrl      = gpd_ctrl_constr,
            adjust_method = "BH"
          )
          
          saveRDS(papprox_constr, file = fname_constr)
          p(message = sprintf("n=%s: done", n_per_group))
          invisible(NULL)
        },
        .options = furrr_options(seed = TRUE)  # reproducible RNG per worker
      )
    })
    
    plan(sequential)
  } # else: nothing to compute; fall through to loading
  

  # Combine results for all n_per_group values
  results_all <- purrr::map_dfr(n_per_group_vec, function(n_per_group) {
    obs_stats    <- readRDS(path_target(paste0("obs_U_stats_n",  n_per_group, 
                                               "_B", B, ".rds")))
    pval_wilcox  <- readRDS(path_target(paste0("pval_wilcox_n",  n_per_group, 
                                               "_B", B, ".rds")))
    papprox_constr <- readRDS(path_target(paste0("permapprox_constr_", rule_name, 
                                                 "_n", n_per_group, "_B", B, ".rds")))

    tibble(
      idx         = seq_along(obs_stats),
      n_per_group = n_per_group,
      effect_size = delta_vec,
      obs_stats   = obs_stats,         # on U-scale
      p_wilcox    = pval_wilcox,
      gpd_fit     = papprox_constr$gpd_fit$fitted,
      p_constr    = papprox_constr$p_unadjusted,
      epsilon     = papprox_constr$gpd_fit$epsilon
    )
  })

  results_all
}
```

## Unconstrained GPD fit

For comparison, we again start with the unconstrained fit.

![](figures/01_test_eps_rule/expl_wilcox_eps_rule_pvals_unconstr-1.png)<!-- -->![](figures/01_test_eps_rule/expl_wilcox_eps_rule_pvals_unconstr-2.png)<!-- -->![](figures/01_test_eps_rule/expl_wilcox_eps_rule_pvals_unconstr-3.png)<!-- -->![](figures/01_test_eps_rule/expl_wilcox_eps_rule_pvals_unconstr-4.png)<!-- -->![](figures/01_test_eps_rule/expl_wilcox_eps_rule_pvals_unconstr-5.png)<!-- -->![](figures/01_test_eps_rule/expl_wilcox_eps_rule_pvals_unconstr-6.png)<!-- -->

## Non-standardized Lifted Log-Saturation (LLS) rule

![](figures/01_test_eps_rule/expl_wilcox_eps_rule_rule_LLS-1.png)<!-- -->

![](figures/01_test_eps_rule/expl_wilcox_eps_rule_pvals_constr_LLS-1.png)<!-- -->![](figures/01_test_eps_rule/expl_wilcox_eps_rule_pvals_constr_LLS-2.png)<!-- -->![](figures/01_test_eps_rule/expl_wilcox_eps_rule_pvals_constr_LLS-3.png)<!-- -->![](figures/01_test_eps_rule/expl_wilcox_eps_rule_pvals_constr_LLS-4.png)<!-- -->![](figures/01_test_eps_rule/expl_wilcox_eps_rule_pvals_constr_LLS-5.png)<!-- -->![](figures/01_test_eps_rule/expl_wilcox_eps_rule_pvals_constr_LLS-6.png)<!-- -->

As expected, the LLS rule does not work for the Wilcoxon test statistics
as their range is extremely large.

## Standardized Lifted Log-Saturation (SLLS) rule

![](figures/01_test_eps_rule/expl_wilcox_eps_rule_rule_SLLS-1.png)<!-- -->

![](figures/01_test_eps_rule/expl_wilcox_eps_rule_pvals_constr_SLLS-1.png)<!-- -->![](figures/01_test_eps_rule/expl_wilcox_eps_rule_pvals_constr_SLLS-2.png)<!-- -->![](figures/01_test_eps_rule/expl_wilcox_eps_rule_pvals_constr_SLLS-3.png)<!-- -->![](figures/01_test_eps_rule/expl_wilcox_eps_rule_pvals_constr_SLLS-4.png)<!-- -->![](figures/01_test_eps_rule/expl_wilcox_eps_rule_pvals_constr_SLLS-5.png)<!-- -->![](figures/01_test_eps_rule/expl_wilcox_eps_rule_pvals_constr_SLLS-6.png)<!-- -->

## Constrained vs. unconstrained fit

    ## n = 50 | zeros (wilcox, unconst, const): 0 , 184 , 0

![](figures/01_test_eps_rule/expl_wilcox_eps_rule_pvals_unconstrained_vs_constrained-1.png)<!-- -->

    ## n = 100 | zeros (wilcox, unconst, const): 0 , 413 , 0

![](figures/01_test_eps_rule/expl_wilcox_eps_rule_pvals_unconstrained_vs_constrained-2.png)<!-- -->

    ## n = 250 | zeros (wilcox, unconst, const): 0 , 629 , 0

![](figures/01_test_eps_rule/expl_wilcox_eps_rule_pvals_unconstrained_vs_constrained-3.png)<!-- -->

    ## n = 500 | zeros (wilcox, unconst, const): 0 , 735 , 0

![](figures/01_test_eps_rule/expl_wilcox_eps_rule_pvals_unconstrained_vs_constrained-4.png)<!-- -->

    ## n = 750 | zeros (wilcox, unconst, const): 0 , 768 , 0

![](figures/01_test_eps_rule/expl_wilcox_eps_rule_pvals_unconstrained_vs_constrained-5.png)<!-- -->

    ## n = 1000 | zeros (wilcox, unconst, const): 0 , 774 , 0

![](figures/01_test_eps_rule/expl_wilcox_eps_rule_pvals_unconstrained_vs_constrained-6.png)<!-- -->

## Combined plot

![](figures/01_test_eps_rule/expl_wilcox_eps_rule_eps_rules_combined-1.png)<!-- -->

## Files written

These files have been written to the target directory,
`data/01_test_eps_rule`:

    ## # A tibble: 42 × 4
    ##    path                                  type         size modification_time  
    ##    <fs::path>                            <fct> <fs::bytes> <dttm>             
    ##  1 obs_U_stats_n1000_B1000.rds           file        3.25K 2025-10-01 21:38:43
    ##  2 obs_U_stats_n100_B1000.rds            file        2.42K 2025-10-01 21:37:30
    ##  3 obs_U_stats_n250_B1000.rds            file        2.76K 2025-10-01 21:37:47
    ##  4 obs_U_stats_n500_B1000.rds            file        3.05K 2025-10-01 21:38:04
    ##  5 obs_U_stats_n50_B1000.rds             file        2.18K 2025-10-01 21:37:13
    ##  6 obs_U_stats_n750_B1000.rds            file        3.14K 2025-10-01 21:38:23
    ##  7 permapprox_constr_LLS_n1000_B1000.rds file      378.69K 2025-11-03 15:47:51
    ##  8 permapprox_constr_LLS_n100_B1000.rds  file      308.66K 2025-11-03 15:47:49
    ##  9 permapprox_constr_LLS_n250_B1000.rds  file      335.95K 2025-11-03 15:47:50
    ## 10 permapprox_constr_LLS_n500_B1000.rds  file      345.16K 2025-11-03 15:47:51
    ## # ℹ 32 more rows
