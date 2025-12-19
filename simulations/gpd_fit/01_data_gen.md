Generate GPD data for simulation studies
================
Compiled at 2025-12-19 15:04:13 UTC

This script generates random samples from the Generalized Pareto
Distribution (GPD).

## Load packages

## Data generation for unconstrained study

We draw random samples from the GPD distribution. The following
parameter settings are considered:

    ## Shape values:  -0.6 -0.4 -0.2 0 0.2 0.4 0.6 
    ## Scale:  1 
    ## Sample sizes:  25 50 75 100 250 500 750 1000 
    ## Repetitions:  500

## Data generation for boundary misspecification study

    ## 
    ## Boundaries:  6 5.5 5 4.5 4 3.5 3 2.5 2 
    ## Shape values:  -0.1666667 -0.1818182 -0.2 -0.2222222 -0.25 -0.2857143 -0.3333333 -0.4 -0.5 
    ## Scale:  1 
    ## Sample sizes:  1000 
    ## Repetitions:  500

## Data generation for asymptotic behavior study

    ## Shape:  -0.2 
    ## Scale:  1 
    ## Sample sizes:  50 100 200 500 1000 5000 10000 50000 
    ## Repetitions:  500

## Files written

These files have been written to the target directory,
`data/01_data_gen`:

    ## # A tibble: 69 × 4
    ##    path                 type         size modification_time  
    ##    <fs::path>           <fct> <fs::bytes> <dttm>             
    ##  1 bound-2.5_n-1000.RDS file        3.61M 2025-05-30 15:06:57
    ##  2 bound-2_n-1000.RDS   file         3.6M 2025-05-30 15:06:57
    ##  3 bound-3.5_n-1000.RDS file        3.62M 2025-05-30 15:06:56
    ##  4 bound-3_n-1000.RDS   file        3.61M 2025-05-30 15:06:57
    ##  5 bound-4.5_n-1000.RDS file        3.62M 2025-05-30 15:06:55
    ##  6 bound-4_n-1000.RDS   file        3.62M 2025-05-30 15:06:56
    ##  7 bound-5.5_n-1000.RDS file        3.62M 2025-05-30 15:06:55
    ##  8 bound-5_n-1000.RDS   file        3.62M 2025-05-30 15:06:55
    ##  9 bound-6_n-1000.RDS   file        3.63M 2025-05-30 15:06:54
    ## 10 shape--0.2_n-100.RDS file      372.09K 2025-06-03 07:20:07
    ## # ℹ 59 more rows
