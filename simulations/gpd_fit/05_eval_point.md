Simulation study: Robustness of GPD estimation under varying evaluation
points
================
Compiled at 2026-02-02 19:21:55 UTC

``` r
here::i_am(paste0(params$name, ".Rmd"), uuid = "39c54387-5000-48bc-a7db-a7ed41e6e144")
```

This simulation study examines how GPD parameter estimation behaves
under a boundary constraint that requires the estimated support to
include a predefined evaluation point above the true boundary. We assess
the impact of varying sample sizes and distances (ε) between the
evaluation point and the boundary across multiple estimation methods.

## Parameter grid

    ## Shape: -0.2 
    ## Scale:  1 
    ## True_bound:  5 
    ## Sample sizes:  25 50 75 100 250 500 750 1000 
    ## Epsilons:  -1 0 1 2 3 
    ## Repetitions:  500

The GPD parameters are estimated for all considered parameter
combinations using the following estimation methods:

- LME (Likelihood moment estimator) by Zhang (2007)
- WNLLSM (Weighted Nonlinear Least Squares Likelihood Moments
  Estimation) by Zhao et al. (2019)
- MLE-1D (one-dimensional MLE) by Castillo & Serra (2015)
- MLE-2D (Maximum Likelihood Estimation)
- NLS2 (Quantile Estimation) by Song & Song (2012)
- ZSE (Zhang Stephens Estimator; Bayesian methods) by Zhang & Stephens
  (2009)

<!-- -->

    ## # A tibble: 6 × 7
    ##       n   eps method eval_point shape scale bound
    ##   <dbl> <dbl> <fct>       <dbl> <dbl> <dbl> <dbl>
    ## 1    25    -1 LME             4  -0.2     1     5
    ## 2    25    -1 MLE1D           4  -0.2     1     5
    ## 3    25    -1 MLE2D           4  -0.2     1     5
    ## 4    25    -1 NLS2            4  -0.2     1     5
    ## 5    25    -1 WNLLSM          4  -0.2     1     5
    ## 6    25    -1 ZSE             4  -0.2     1     5

    ## Number of settings:  240

## Perform estimations

Constrained and unconstrained fitting for all settings …

## Results table

| data_shape | data_scale | data_bound | eval_point | eps | n | method | data_max | constr_active | shape | scale | bound | dgpd | repetition |
|---:|---:|---:|---:|---:|---:|:---|---:|:---|---:|---:|---:|---:|---:|
| -0.2 | 1 | 5 | 4 | -1 | 100 | LME | 2.797217 | TRUE | -0.2758818 | 1.1035273 | 4.000000 | 0.0000000 | 1 |
| -0.2 | 1 | 5 | 4 | -1 | 100 | LME | 3.287688 | FALSE | -0.1814405 | 0.8948506 | 4.931923 | 0.0006076 | 2 |
| -0.2 | 1 | 5 | 4 | -1 | 100 | LME | 3.721647 | FALSE | -0.1459588 | 1.0376655 | 7.109302 | 0.0076276 | 3 |
| -0.2 | 1 | 5 | 4 | -1 | 100 | LME | 2.986269 | FALSE | -0.2305967 | 1.0155872 | 4.404171 | 0.0003406 | 4 |
| -0.2 | 1 | 5 | 4 | -1 | 100 | LME | 3.491750 | FALSE | -0.1190841 | 0.9623550 | 8.081306 | 0.0066371 | 5 |
| -0.2 | 1 | 5 | 4 | -1 | 100 | LME | 3.629381 | FALSE | -0.1785131 | 1.0279428 | 5.758361 | 0.0041420 | 6 |
| -0.2 | 1 | 5 | 4 | -1 | 100 | LME | 3.040663 | TRUE | -0.2761638 | 1.1046554 | 4.000000 | 0.0000000 | 7 |
| -0.2 | 1 | 5 | 4 | -1 | 100 | LME | 2.939923 | TRUE | -0.2905539 | 1.1622155 | 4.000000 | 0.0000000 | 8 |
| -0.2 | 1 | 5 | 4 | -1 | 100 | LME | 3.483642 | FALSE | -0.1477785 | 0.9206471 | 6.229914 | 0.0029024 | 9 |
| -0.2 | 1 | 5 | 4 | -1 | 100 | LME | 2.756514 | FALSE | -0.2163082 | 0.9978583 | 4.613133 | 0.0006692 | 10 |
| -0.2 | 1 | 5 | 4 | -1 | 100 | LME | 2.907593 | TRUE | -0.2419989 | 0.9679957 | 4.000000 | 0.0000000 | 11 |
| -0.2 | 1 | 5 | 4 | -1 | 100 | LME | 2.909163 | TRUE | -0.2828583 | 1.1314331 | 4.000000 | 0.0000000 | 12 |
| -0.2 | 1 | 5 | 4 | -1 | 100 | LME | 3.422151 | FALSE | -0.1917722 | 1.0628110 | 5.542049 | 0.0042862 | 13 |
| -0.2 | 1 | 5 | 4 | -1 | 100 | LME | 2.966782 | FALSE | -0.2721273 | 1.1105265 | 4.080908 | 0.0000251 | 14 |
| -0.2 | 1 | 5 | 4 | -1 | 100 | LME | 3.146482 | NA | 0.0555642 | 0.7184866 | NA | NA | 15 |
| -0.2 | 1 | 5 | 4 | -1 | 100 | LME | 2.498217 | TRUE | -0.2275140 | 0.9100561 | 4.000000 | 0.0000000 | 16 |
| -0.2 | 1 | 5 | 4 | -1 | 100 | LME | 3.195013 | FALSE | -0.1874468 | 0.8986123 | 4.793958 | 0.0004585 | 17 |
| -0.2 | 1 | 5 | 4 | -1 | 100 | LME | 3.685176 | FALSE | -0.0792555 | 0.9385479 | 11.842061 | 0.0088727 | 18 |
| -0.2 | 1 | 5 | 4 | -1 | 100 | LME | 2.732176 | TRUE | -0.2274437 | 0.9097750 | 4.000000 | 0.0000000 | 19 |
| -0.2 | 1 | 5 | 4 | -1 | 100 | LME | 3.601136 | TRUE | -0.2671392 | 1.0685569 | 4.000000 | 0.0000000 | 20 |

## Heatmap (SD of dgpd)

![](figures/05_eval_point/sim_GPD_evalpoint_heat_sd_dgpd-1.png)<!-- -->

## Plots

### Colors

### Shape error

![](figures/05_eval_point/sim_GPD_evalpoint_error_shape_by_n-1.png)<!-- -->![](figures/05_eval_point/sim_GPD_evalpoint_error_shape_by_n-2.png)<!-- -->![](figures/05_eval_point/sim_GPD_evalpoint_error_shape_by_n-3.png)<!-- -->![](figures/05_eval_point/sim_GPD_evalpoint_error_shape_by_n-4.png)<!-- -->![](figures/05_eval_point/sim_GPD_evalpoint_error_shape_by_n-5.png)<!-- -->

### Scale error

![](figures/05_eval_point/sim_GPD_evalpoint_error_scale_by_n-1.png)<!-- -->![](figures/05_eval_point/sim_GPD_evalpoint_error_scale_by_n-2.png)<!-- -->![](figures/05_eval_point/sim_GPD_evalpoint_error_scale_by_n-3.png)<!-- -->![](figures/05_eval_point/sim_GPD_evalpoint_error_scale_by_n-4.png)<!-- -->![](figures/05_eval_point/sim_GPD_evalpoint_error_scale_by_n-5.png)<!-- -->

### Boundary error

![](figures/05_eval_point/sim_GPD_evalpoint_error_bound_by_n-1.png)<!-- -->![](figures/05_eval_point/sim_GPD_evalpoint_error_bound_by_n-2.png)<!-- -->![](figures/05_eval_point/sim_GPD_evalpoint_error_bound_by_n-3.png)<!-- -->![](figures/05_eval_point/sim_GPD_evalpoint_error_bound_by_n-4.png)<!-- -->![](figures/05_eval_point/sim_GPD_evalpoint_error_bound_by_n-5.png)<!-- -->

### Difference boundary to eval_point

![](figures/05_eval_point/sim_GPD_evalpoint_diff_bound_evalpoint_by_n-1.png)<!-- -->![](figures/05_eval_point/sim_GPD_evalpoint_diff_bound_evalpoint_by_n-2.png)<!-- -->![](figures/05_eval_point/sim_GPD_evalpoint_diff_bound_evalpoint_by_n-3.png)<!-- -->![](figures/05_eval_point/sim_GPD_evalpoint_diff_bound_evalpoint_by_n-4.png)<!-- -->![](figures/05_eval_point/sim_GPD_evalpoint_diff_bound_evalpoint_by_n-5.png)<!-- -->

### Difference boundary to eval_point (log scale)

![](figures/05_eval_point/sim_GPD_evalpoint_diff_bound_evalpoint_log_by_n-1.png)<!-- -->![](figures/05_eval_point/sim_GPD_evalpoint_diff_bound_evalpoint_log_by_n-2.png)<!-- -->![](figures/05_eval_point/sim_GPD_evalpoint_diff_bound_evalpoint_log_by_n-3.png)<!-- -->![](figures/05_eval_point/sim_GPD_evalpoint_diff_bound_evalpoint_log_by_n-4.png)<!-- -->![](figures/05_eval_point/sim_GPD_evalpoint_diff_bound_evalpoint_log_by_n-5.png)<!-- -->

### Difference boundary to eval_point (constraint active, log scale)

![](figures/05_eval_point/sim_GPD_evalpoint_diff_bound_evalpoint_active_by_n-1.png)<!-- -->![](figures/05_eval_point/sim_GPD_evalpoint_diff_bound_evalpoint_active_by_n-2.png)<!-- -->![](figures/05_eval_point/sim_GPD_evalpoint_diff_bound_evalpoint_active_by_n-3.png)<!-- -->![](figures/05_eval_point/sim_GPD_evalpoint_diff_bound_evalpoint_active_by_n-4.png)<!-- -->![](figures/05_eval_point/sim_GPD_evalpoint_diff_bound_evalpoint_active_by_n-5.png)<!-- -->

### GPD density at eval_point

![](figures/05_eval_point/sim_GPD_evalpoint_dgpd_log_by_n-1.png)<!-- -->![](figures/05_eval_point/sim_GPD_evalpoint_dgpd_log_by_n-2.png)<!-- -->![](figures/05_eval_point/sim_GPD_evalpoint_dgpd_log_by_n-3.png)<!-- -->![](figures/05_eval_point/sim_GPD_evalpoint_dgpd_log_by_n-4.png)<!-- -->![](figures/05_eval_point/sim_GPD_evalpoint_dgpd_log_by_n-5.png)<!-- -->

### GPD density at eval_point (constraint active)

![](figures/05_eval_point/sim_GPD_evalpoint_dgpd_active_by_n-1.png)<!-- -->![](figures/05_eval_point/sim_GPD_evalpoint_dgpd_active_by_n-2.png)<!-- -->![](figures/05_eval_point/sim_GPD_evalpoint_dgpd_active_by_n-3.png)<!-- -->![](figures/05_eval_point/sim_GPD_evalpoint_dgpd_active_by_n-4.png)<!-- -->![](figures/05_eval_point/sim_GPD_evalpoint_dgpd_active_by_n-5.png)<!-- -->

## Files written

These files have been written to the target directory,
`data/05_eval_point`:

    ## # A tibble: 416 × 4
    ##    path                                type         size modification_time  
    ##    <fs::path>                          <fct> <fs::bytes> <dttm>             
    ##  1 shape--0.2_n-1000_eps--1_LME.RDS    file        20.5K 2025-10-27 16:52:49
    ##  2 shape--0.2_n-1000_eps--1_MLE1D.RDS  file        20.5K 2025-10-27 16:52:49
    ##  3 shape--0.2_n-1000_eps--1_MLE2D.RDS  file        20.5K 2025-10-27 16:52:49
    ##  4 shape--0.2_n-1000_eps--1_NLS2.RDS   file        20.5K 2025-10-27 16:52:49
    ##  5 shape--0.2_n-1000_eps--1_WNLLSM.RDS file        20.5K 2025-10-27 16:52:49
    ##  6 shape--0.2_n-1000_eps--1_ZSE.RDS    file        20.5K 2025-10-27 16:52:49
    ##  7 shape--0.2_n-1000_eps-0.1_LME.RDS   file        18.9K 2025-10-27 16:52:49
    ##  8 shape--0.2_n-1000_eps-0.1_MLE1D.RDS file          20K 2025-10-27 09:49:09
    ##  9 shape--0.2_n-1000_eps-0.1_MLE2D.RDS file        20.3K 2025-10-27 16:52:49
    ## 10 shape--0.2_n-1000_eps-0.1_NLS2.RDS  file          20K 2025-10-27 16:52:49
    ## # ℹ 406 more rows
