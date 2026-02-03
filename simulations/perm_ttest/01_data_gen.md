Generate Gaussian data for permutation-based p-value simulations
================
Compiled at 2026-02-02 19:25:30 UTC

``` r
here::i_am(paste0(params$name, ".Rmd"), uuid = "5bde0cc7-05ce-483d-944a-feac8192384e")
```

    ## [conflicted] Removing existing preference.
    ## [conflicted] Will prefer dplyr::filter over any other package.
    ## [conflicted] Removing existing preference.
    ## [conflicted] Will prefer dplyr::select over any other package.

## Parameter settings

This script generates normally distributed data used in simulation
studies evaluating p-value approximation methods.

- **Accuracy**: 1 test per replicate, 1000 replicates. Files written to:
  `sim_accuracy_data/sim_accur_tstats_n{n}_d{d}.rds`

- **Error rates**: 1000 tests per replicate, 100 replicates, with
  `n_alt` non-nulls per replicate. Files written to:
  `sim_error_data/sim_error_tstats_n{n}_d{d}.rds`

Both store, for each replicate, a matrix with columns:

- `1:n_perm` = permutation t-statistics,
- `tobs` = observed t-statistic,
- `pttest` = parametric two-sample t-test p-value (equal-variance form).

Got it! Here’s a **drop-in data-generation Rmd** that matches your
updated plan:

- Separate generator (no fitting).
- **Accuracy** (1 test/rep, 1000 reps): – vary **n** at **d=1** **and**
  vary **d** at **n=100**; – **also vary `n_perm`** (vector) for both
  subsets.
- **Error rates** (many tests/rep, fewer reps): – vary **n** at **d=1**
  (with `pi1` vector), – vary **d** at **n=100** (with `pi1` vector), –
  plus the focused grid **(n=100, d=1)** with
  **`n_perm ∈ {1000, 5000, 10000}`** and
  **`pi1 ∈ {0, 0.01, 0.05, 0.10}`**.
- Output per setting: an RDS list of length `n_rep`; each element is a
  matrix **`n_test × (n_perm+2)`** with columns `1:n_perm`, `tobs`,
  `pttest`.

# Helpers

## Accuracy

We vary n at d=1, vary d at n=100, and vary n_perm.

## Error rates

Here, we vary n at d=1; vary d at n=100; plus focused n=100,d=1 with
multiple n_perm & pi1.

## Files written

    ## # A tibble: 2 × 4
    ##   path              type             size modification_time  
    ##   <fs::path>        <fct>     <fs::bytes> <dttm>             
    ## 1 sim_accuracy_data directory           0 2025-12-18 14:01:59
    ## 2 sim_error_data    directory           0 2025-12-18 14:08:21
