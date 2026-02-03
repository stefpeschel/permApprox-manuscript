Assess the optimal number of starting exceedances
================
Compiled at 2026-02-02 19:28:53 UTC

``` r
here::i_am(paste0(params$name, ".Rmd"), uuid = "907ec83f-a14f-4333-abdd-a7b00d861428")
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

## Method registry, file helpers, and per-method runner

### General method registry

### Engines

### Output path builders

## Compute p-values and save

## Collect & reshape

## P-value plots

### Colors

### Plot function

### P-values

![](figures/03_nexceed/sim_ttest_nexc_pvals_by_B-1.png)<!-- -->

### Ratios (approximated vs. t-test)

![](figures/03_nexceed/sim_ttest_nexc_pval_ratios_by_B-1.png)<!-- -->

## nExceed plots

![](figures/03_nexceed/sim_ttest_nexc_nexceed_by_B-1.png)<!-- -->

## Files written

These files have been written to the target directory,
`data/03_nexceed`:

    ## # A tibble: 1 × 4
    ##   path       type             size modification_time  
    ##   <fs::path> <fct>     <fs::bytes> <dttm>             
    ## 1 accuracy   directory           0 2025-12-18 14:08:36
