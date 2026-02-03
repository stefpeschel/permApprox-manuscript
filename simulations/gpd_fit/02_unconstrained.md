Evaluate GPD parameter estimation methods
================
Compiled at 2026-02-02 19:15:02 UTC

``` r
here::i_am(paste0(params$name, ".Rmd"), uuid = "52a6b799-d49a-4efe-9bb8-22bea6c7d463")
```

In this document, several existing methods for estimating parameters of
the Generalized Pareto Distribution (GPD) are compared and evaluated
regarding their estimation accuracy.

## Install and load packages

## Setting

### GPD parameters

All possible combinations of the following parameters are considered:

    ## Shape values:  -0.6 -0.4 -0.2 0 0.2 0.4 0.6 
    ## Scale:  1 
    ## Sample sizes:  25 50 75 100 250 500 750 1000 
    ## Repetitions:  500

### Fit methods

The GPD parameters are estimated for all considered parameter
combinations using the following estimation methods:

- MOM (Method of Moments)
- PWM (Probability weighted momement) by Hosking-Wallis
- LME (Likelihood moment estimator) by Zhang (2007)
- WNLLSM (Weighted Nonlinear Least Squares Likelihood Moments
  Estimation) by Zhao et al. (2019)
- MLE-1D (one-dimensional MLE) by Castillo & Serra (2015)
- MLE-2D (Maximum Likelihood Estimation)
- NLS2 (Quantile Estimation) by Song & Song (2012)
- ZSE (Zhang Stephens Estimator; Bayesian methods) by Zhang & Stephens
  (2009)

### Combinations

    ## # A tibble: 6 × 3
    ##   shape     n method
    ##   <dbl> <dbl> <fct> 
    ## 1  -0.6    25 MOM   
    ## 2  -0.6    25 PWM   
    ## 3  -0.6    25 LME   
    ## 4  -0.6    25 MLE1D 
    ## 5  -0.6    25 MLE2D 
    ## 6  -0.6    25 NLS2

    ## Number of settings:  448

## Perform estimations

## Combine results

    ## tibble [392,000 × 7] (S3: tbl_df/tbl/data.frame)
    ##  $ true_shape: num [1:392000] -0.6 -0.6 -0.6 -0.6 -0.6 -0.6 -0.6 -0.6 -0.6 -0.6 ...
    ##  $ n         : num [1:392000] 100 100 100 100 100 100 100 100 100 100 ...
    ##  $ method    : Factor w/ 8 levels "MOM","PWM","LME",..: 3 3 3 3 3 3 3 3 3 3 ...
    ##  $ repetition: int [1:392000] 1 1 2 2 3 3 4 4 5 5 ...
    ##  $ parameter : chr [1:392000] "shape" "scale" "shape" "scale" ...
    ##  $ true_value: num [1:392000] -0.6 1 -0.6 1 -0.6 1 -0.6 1 -0.6 1 ...
    ##  $ estimate  : num [1:392000] -0.752 1.161 -0.538 0.894 -0.611 ...

## Boxplots

### Colors

### Plot function

### Estimation errors by n

#### Shape

![](figures/02_unconstrained/sim_GPD_unconstr_error_shape_by_n-1.png)<!-- -->![](figures/02_unconstrained/sim_GPD_unconstr_error_shape_by_n-2.png)<!-- -->![](figures/02_unconstrained/sim_GPD_unconstr_error_shape_by_n-3.png)<!-- -->![](figures/02_unconstrained/sim_GPD_unconstr_error_shape_by_n-4.png)<!-- -->![](figures/02_unconstrained/sim_GPD_unconstr_error_shape_by_n-5.png)<!-- -->![](figures/02_unconstrained/sim_GPD_unconstr_error_shape_by_n-6.png)<!-- -->![](figures/02_unconstrained/sim_GPD_unconstr_error_shape_by_n-7.png)<!-- -->

#### Scale

![](figures/02_unconstrained/sim_GPD_unconstr_error_scale_by_n-1.png)<!-- -->![](figures/02_unconstrained/sim_GPD_unconstr_error_scale_by_n-2.png)<!-- -->![](figures/02_unconstrained/sim_GPD_unconstr_error_scale_by_n-3.png)<!-- -->![](figures/02_unconstrained/sim_GPD_unconstr_error_scale_by_n-4.png)<!-- -->![](figures/02_unconstrained/sim_GPD_unconstr_error_scale_by_n-5.png)<!-- -->![](figures/02_unconstrained/sim_GPD_unconstr_error_scale_by_n-6.png)<!-- -->![](figures/02_unconstrained/sim_GPD_unconstr_error_scale_by_n-7.png)<!-- -->

### Absolute estimation errors by n

#### Shape

![](figures/02_unconstrained/sim_GPD_unconstr_abs_error_shape_by_n-1.png)<!-- -->![](figures/02_unconstrained/sim_GPD_unconstr_abs_error_shape_by_n-2.png)<!-- -->![](figures/02_unconstrained/sim_GPD_unconstr_abs_error_shape_by_n-3.png)<!-- -->![](figures/02_unconstrained/sim_GPD_unconstr_abs_error_shape_by_n-4.png)<!-- -->![](figures/02_unconstrained/sim_GPD_unconstr_abs_error_shape_by_n-5.png)<!-- -->![](figures/02_unconstrained/sim_GPD_unconstr_abs_error_shape_by_n-6.png)<!-- -->![](figures/02_unconstrained/sim_GPD_unconstr_abs_error_shape_by_n-7.png)<!-- -->

#### Scale

![](figures/02_unconstrained/sim_GPD_unconstr_abs_error_scale_by_n-1.png)<!-- -->![](figures/02_unconstrained/sim_GPD_unconstr_abs_error_scale_by_n-2.png)<!-- -->![](figures/02_unconstrained/sim_GPD_unconstr_abs_error_scale_by_n-3.png)<!-- -->![](figures/02_unconstrained/sim_GPD_unconstr_abs_error_scale_by_n-4.png)<!-- -->![](figures/02_unconstrained/sim_GPD_unconstr_abs_error_scale_by_n-5.png)<!-- -->![](figures/02_unconstrained/sim_GPD_unconstr_abs_error_scale_by_n-6.png)<!-- -->![](figures/02_unconstrained/sim_GPD_unconstr_abs_error_scale_by_n-7.png)<!-- -->

## Evaluation metrics

### Line plots

#### All shape values

![](figures/02_unconstrained/sim_GPD_unconstr_evaluation_metrics-1.png)<!-- -->![](figures/02_unconstrained/sim_GPD_unconstr_evaluation_metrics-2.png)<!-- -->![](figures/02_unconstrained/sim_GPD_unconstr_evaluation_metrics-3.png)<!-- -->![](figures/02_unconstrained/sim_GPD_unconstr_evaluation_metrics-4.png)<!-- -->![](figures/02_unconstrained/sim_GPD_unconstr_evaluation_metrics-5.png)<!-- -->![](figures/02_unconstrained/sim_GPD_unconstr_evaluation_metrics-6.png)<!-- -->

#### Selection of shape values

![](figures/02_unconstrained/sim_GPD_unconstr_evaluation_metrics_sel-1.png)<!-- -->![](figures/02_unconstrained/sim_GPD_unconstr_evaluation_metrics_sel-2.png)<!-- -->![](figures/02_unconstrained/sim_GPD_unconstr_evaluation_metrics_sel-3.png)<!-- -->![](figures/02_unconstrained/sim_GPD_unconstr_evaluation_metrics_sel-4.png)<!-- -->![](figures/02_unconstrained/sim_GPD_unconstr_evaluation_metrics_sel-5.png)<!-- -->![](figures/02_unconstrained/sim_GPD_unconstr_evaluation_metrics_sel-6.png)<!-- -->

### Heatmaps

#### All shapes

![](figures/02_unconstrained/sim_GPD_unconstr_heat_shape_bias-1.png)<!-- -->
![](figures/02_unconstrained/sim_GPD_unconstr_heat_shape_sd-1.png)<!-- -->

![](figures/02_unconstrained/sim_GPD_unconstr_heat_shape_rmse-1.png)<!-- -->

![](figures/02_unconstrained/sim_GPD_unconstr_heat_scale_bias-1.png)<!-- -->
![](figures/02_unconstrained/sim_GPD_unconstr_heat_scale_sd-1.png)<!-- -->

![](figures/02_unconstrained/sim_GPD_unconstr_heat_scale_rmse-1.png)<!-- -->

### Tables

<table class="table" style="color: black; width: auto !important; margin-left: auto; margin-right: auto;">

<caption>

BIAS across methods (parameter: shape)
</caption>

<thead>

<tr>

<th style="text-align:center;">

ξ₀
</th>

<th style="text-align:center;">

n
</th>

<th style="text-align:center;">

LME
</th>

<th style="text-align:center;">

MLE1D
</th>

<th style="text-align:center;">

MLE2D
</th>

<th style="text-align:center;">

NLS2
</th>

<th style="text-align:center;">

WNLLSM
</th>

<th style="text-align:center;">

ZSE
</th>

</tr>

</thead>

<tbody>

<tr grouplength="8">

<td colspan="8" style="ξ₀ = -0.6">

<strong></strong>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.6
</td>

<td style="text-align:center;">

25
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 217, 0, 255) !important;">-0.061</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">-0.406</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 87, 0, 255) !important;">-0.268</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 246, 0, 255) !important;">0.015</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.001</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 210, 0, 255) !important;">0.073</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.6
</td>

<td style="text-align:center;">

50
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 208, 0, 255) !important;">-0.025</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 9, 0, 255) !important;">-0.115</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">-0.120</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 207, 0, 255) !important;">0.025</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.004</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 188, 0, 255) !important;">0.034</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.6
</td>

<td style="text-align:center;">

75
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 198, 0, 255) !important;">-0.020</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 23, 0, 255) !important;">-0.078</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">-0.086</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 190, 0, 255) !important;">0.023</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">-0.002</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 214, 0, 255) !important;">0.015</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.6
</td>

<td style="text-align:center;">

100
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 206, 0, 255) !important;">-0.014</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 55, 0, 255) !important;">-0.052</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">-0.066</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 201, 0, 255) !important;">0.015</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">-0.001</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 208, 0, 255) !important;">0.013</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.6
</td>

<td style="text-align:center;">

250
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 209, 0, 255) !important;">-0.006</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 30, 0, 255) !important;">-0.024</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">-0.027</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 172, 0, 255) !important;">0.009</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">-0.001</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 230, 0, 255) !important;">0.004</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.6
</td>

<td style="text-align:center;">

500
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.000</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 39, 0, 255) !important;">-0.011</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 31, 0, 255) !important;">-0.012</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.014</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 206, 0, 255) !important;">0.003</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 196, 0, 255) !important;">0.003</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.6
</td>

<td style="text-align:center;">

750
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.000</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 32, 0, 255) !important;">-0.010</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 32, 0, 255) !important;">-0.010</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.011</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 207, 0, 255) !important;">0.002</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 240, 0, 255) !important;">0.001</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.6
</td>

<td style="text-align:center;">

1000
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.001</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 85, 0, 255) !important;">-0.007</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 85, 0, 255) !important;">-0.007</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.010</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 210, 0, 255) !important;">0.003</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 252, 0, 255) !important;">0.001</span>
</td>

</tr>

<tr grouplength="8">

<td colspan="8" style="ξ₀ = -0.4">

<strong></strong>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.4
</td>

<td style="text-align:center;">

25
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 185, 0, 255) !important;">-0.068</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">-0.242</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 34, 0, 255) !important;">-0.209</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 235, 0, 255) !important;">0.021</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.003</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 194, 0, 255) !important;">0.060</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.4
</td>

<td style="text-align:center;">

50
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 230, 0, 255) !important;">-0.020</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 43, 0, 255) !important;">-0.077</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">-0.091</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 204, 0, 255) !important;">0.028</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.012</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 174, 0, 255) !important;">0.037</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.4
</td>

<td style="text-align:center;">

75
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 241, 0, 255) !important;">-0.012</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 71, 0, 255) !important;">-0.052</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">-0.069</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 199, 0, 255) !important;">0.022</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.009</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 192, 0, 255) !important;">0.024</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.4
</td>

<td style="text-align:center;">

100
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">-0.008</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 56, 0, 255) !important;">-0.041</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">-0.050</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 159, 0, 255) !important;">0.024</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 254, 0, 255) !important;">0.008</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 202, 0, 255) !important;">0.017</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.4
</td>

<td style="text-align:center;">

250
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">-0.003</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 25, 0, 255) !important;">-0.021</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">-0.023</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 36, 0, 255) !important;">0.020</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 232, 0, 255) !important;">0.005</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 238, 0, 255) !important;">0.004</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.4
</td>

<td style="text-align:center;">

500
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">-0.001</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 35, 0, 255) !important;">-0.011</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 35, 0, 255) !important;">-0.011</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.012</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 208, 0, 255) !important;">0.003</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 214, 0, 255) !important;">0.003</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.4
</td>

<td style="text-align:center;">

750
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.000</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 63, 0, 255) !important;">-0.008</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 63, 0, 255) !important;">-0.008</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.011</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 187, 0, 255) !important;">0.003</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 227, 0, 255) !important;">0.001</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.4
</td>

<td style="text-align:center;">

1000
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 207, 0, 255) !important;">-0.001</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">-0.007</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">-0.007</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 28, 0, 255) !important;">0.006</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 232, 0, 255) !important;">0.001</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">-0.000</span>
</td>

</tr>

<tr grouplength="8">

<td colspan="8" style="ξ₀ = -0.2">

<strong></strong>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.2
</td>

<td style="text-align:center;">

25
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 166, 0, 255) !important;">-0.064</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">-0.164</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 11, 0, 255) !important;">-0.158</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 242, 0, 255) !important;">0.018</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.011</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 173, 0, 255) !important;">0.060</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.2
</td>

<td style="text-align:center;">

50
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 153, 0, 255) !important;">-0.031</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 19, 0, 255) !important;">-0.068</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">-0.074</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 219, 0, 255) !important;">0.012</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.002</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 164, 0, 255) !important;">0.028</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.2
</td>

<td style="text-align:center;">

75
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 210, 0, 255) !important;">-0.015</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 21, 0, 255) !important;">-0.044</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">-0.047</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 192, 0, 255) !important;">0.018</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.008</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 162, 0, 255) !important;">0.022</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.2
</td>

<td style="text-align:center;">

100
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 146, 0, 255) !important;">-0.019</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 15, 0, 255) !important;">-0.038</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">-0.040</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.004</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 249, 0, 255) !important;">-0.004</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 196, 0, 255) !important;">0.012</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.2
</td>

<td style="text-align:center;">

250
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">-0.001</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">-0.011</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">-0.011</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 17, 0, 255) !important;">0.010</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 161, 0, 255) !important;">0.005</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 13, 0, 255) !important;">0.011</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.2
</td>

<td style="text-align:center;">

500
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 177, 0, 255) !important;">-0.002</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">-0.006</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">-0.006</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 200, 0, 255) !important;">0.001</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.000</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 27, 0, 255) !important;">0.005</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.2
</td>

<td style="text-align:center;">

750
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 170, 0, 255) !important;">-0.002</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">-0.006</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">-0.006</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 201, 0, 255) !important;">0.001</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">-0.000</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 155, 0, 255) !important;">0.002</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.2
</td>

<td style="text-align:center;">

1000
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 204, 0, 255) !important;">-0.001</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">-0.004</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">-0.004</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 218, 0, 255) !important;">0.001</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.000</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 98, 0, 255) !important;">0.002</span>
</td>

</tr>

<tr grouplength="8">

<td colspan="8" style="ξ₀ = 0">

<strong></strong>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.0
</td>

<td style="text-align:center;">

25
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 119, 0, 255) !important;">-0.089</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">-0.158</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 13, 0, 255) !important;">-0.150</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 251, 0, 255) !important;">-0.012</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">-0.010</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 225, 0, 255) !important;">0.027</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.0
</td>

<td style="text-align:center;">

50
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 102, 0, 255) !important;">-0.039</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">-0.062</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">-0.063</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 245, 0, 255) !important;">-0.007</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">-0.004</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 201, 0, 255) !important;">0.017</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.0
</td>

<td style="text-align:center;">

75
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 116, 0, 255) !important;">-0.021</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">-0.038</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">-0.038</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.002</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.002</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 147, 0, 255) !important;">0.017</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.0
</td>

<td style="text-align:center;">

100
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 116, 0, 255) !important;">-0.015</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">-0.027</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">-0.027</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.001</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 239, 0, 255) !important;">0.002</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 122, 0, 255) !important;">0.015</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.0
</td>

<td style="text-align:center;">

250
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 115, 0, 255) !important;">-0.008</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">-0.013</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">-0.013</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 220, 0, 255) !important;">-0.003</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">-0.001</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 194, 0, 255) !important;">0.004</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.0
</td>

<td style="text-align:center;">

500
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 95, 0, 255) !important;">-0.005</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">-0.008</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">-0.008</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 87, 0, 255) !important;">-0.006</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 191, 0, 255) !important;">-0.003</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.001</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.0
</td>

<td style="text-align:center;">

750
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 78, 0, 255) !important;">-0.004</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 14, 0, 255) !important;">-0.006</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 14, 0, 255) !important;">-0.006</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">-0.006</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 136, 0, 255) !important;">-0.003</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.000</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.0
</td>

<td style="text-align:center;">

1000
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 113, 0, 255) !important;">-0.004</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 60, 0, 255) !important;">-0.005</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 60, 0, 255) !important;">-0.005</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">-0.007</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 147, 0, 255) !important;">-0.003</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">-0.001</span>
</td>

</tr>

<tr grouplength="8">

<td colspan="8" style="ξ₀ = 0.2">

<strong></strong>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.2
</td>

<td style="text-align:center;">

25
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 76, 0, 255) !important;">-0.085</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">-0.120</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 4, 0, 255) !important;">-0.118</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 202, 0, 255) !important;">-0.027</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">-0.004</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 215, 0, 255) !important;">0.022</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.2
</td>

<td style="text-align:center;">

50
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 65, 0, 255) !important;">-0.050</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">-0.066</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">-0.066</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 151, 0, 255) !important;">-0.028</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 219, 0, 255) !important;">-0.011</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">-0.003</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.2
</td>

<td style="text-align:center;">

75
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 63, 0, 255) !important;">-0.035</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">-0.046</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">-0.046</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 137, 0, 255) !important;">-0.022</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 210, 0, 255) !important;">-0.009</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">-0.002</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.2
</td>

<td style="text-align:center;">

100
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 62, 0, 255) !important;">-0.023</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">-0.029</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">-0.029</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 89, 0, 255) !important;">-0.020</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 227, 0, 255) !important;">-0.007</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.004</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.2
</td>

<td style="text-align:center;">

250
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 177, 0, 255) !important;">-0.007</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 158, 0, 255) !important;">-0.008</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 158, 0, 255) !important;">-0.008</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">-0.015</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">-0.004</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 219, 0, 255) !important;">0.005</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.2
</td>

<td style="text-align:center;">

500
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 192, 0, 255) !important;">-0.004</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 186, 0, 255) !important;">-0.004</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 186, 0, 255) !important;">-0.004</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">-0.010</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 228, 0, 255) !important;">-0.003</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.002</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.2
</td>

<td style="text-align:center;">

750
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 131, 0, 255) !important;">-0.005</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 134, 0, 255) !important;">-0.005</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 134, 0, 255) !important;">-0.005</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">-0.010</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 142, 0, 255) !important;">-0.004</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">-0.000</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.2
</td>

<td style="text-align:center;">

1000
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 137, 0, 255) !important;">-0.003</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 142, 0, 255) !important;">-0.003</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 142, 0, 255) !important;">-0.003</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">-0.007</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 144, 0, 255) !important;">-0.003</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.000</span>
</td>

</tr>

<tr grouplength="8">

<td colspan="8" style="ξ₀ = 0.4">

<strong></strong>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.4
</td>

<td style="text-align:center;">

25
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 53, 0, 255) !important;">-0.124</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">-0.149</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 3, 0, 255) !important;">-0.147</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 122, 0, 255) !important;">-0.091</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 237, 0, 255) !important;">-0.038</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">-0.030</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.4
</td>

<td style="text-align:center;">

50
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 35, 0, 255) !important;">-0.050</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">-0.057</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">-0.057</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 111, 0, 255) !important;">-0.036</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 253, 0, 255) !important;">-0.010</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">-0.009</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.4
</td>

<td style="text-align:center;">

75
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 24, 0, 255) !important;">-0.028</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">-0.031</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">-0.031</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 6, 0, 255) !important;">-0.030</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 220, 0, 255) !important;">-0.005</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.001</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.4
</td>

<td style="text-align:center;">

100
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 33, 0, 255) !important;">-0.020</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">-0.023</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">-0.023</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 66, 0, 255) !important;">-0.017</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 254, 0, 255) !important;">-0.001</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.001</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.4
</td>

<td style="text-align:center;">

250
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">-0.003</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 142, 0, 255) !important;">-0.004</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 142, 0, 255) !important;">-0.004</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 250, 0, 255) !important;">0.003</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.006</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 52, 0, 255) !important;">0.005</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.4
</td>

<td style="text-align:center;">

500
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">-0.001</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 220, 0, 255) !important;">-0.001</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 220, 0, 255) !important;">-0.001</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 152, 0, 255) !important;">0.002</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 78, 0, 255) !important;">0.003</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.003</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.4
</td>

<td style="text-align:center;">

750
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">-0.000</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 240, 0, 255) !important;">-0.000</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 240, 0, 255) !important;">-0.000</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 103, 0, 255) !important;">0.002</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 84, 0, 255) !important;">0.002</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.003</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.4
</td>

<td style="text-align:center;">

1000
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 241, 0, 255) !important;">0.001</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.000</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.000</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 91, 0, 255) !important;">0.002</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 60, 0, 255) !important;">0.002</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.003</span>
</td>

</tr>

<tr grouplength="8">

<td colspan="8" style="ξ₀ = 0.6">

<strong></strong>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.6
</td>

<td style="text-align:center;">

25
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 16, 0, 255) !important;">-0.090</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">-0.096</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">-0.096</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 148, 0, 255) !important;">-0.045</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 246, 0, 255) !important;">0.011</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">-0.008</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.6
</td>

<td style="text-align:center;">

50
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">-0.047</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 2, 0, 255) !important;">-0.047</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 2, 0, 255) !important;">-0.047</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 44, 0, 255) !important;">-0.040</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">-0.005</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 206, 0, 255) !important;">-0.013</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.6
</td>

<td style="text-align:center;">

75
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 14, 0, 255) !important;">-0.032</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 24, 0, 255) !important;">-0.031</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 24, 0, 255) !important;">-0.031</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">-0.033</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">-0.007</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 236, 0, 255) !important;">-0.009</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.6
</td>

<td style="text-align:center;">

100
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 45, 0, 255) !important;">-0.019</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 60, 0, 255) !important;">-0.018</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 60, 0, 255) !important;">-0.018</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">-0.023</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 241, 0, 255) !important;">-0.003</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">-0.002</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.6
</td>

<td style="text-align:center;">

250
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">-0.010</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 22, 0, 255) !important;">-0.009</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 22, 0, 255) !important;">-0.009</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 18, 0, 255) !important;">-0.009</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">-0.003</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 244, 0, 255) !important;">-0.003</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.6
</td>

<td style="text-align:center;">

500
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 1, 0, 255) !important;">-0.007</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 22, 0, 255) !important;">-0.006</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 22, 0, 255) !important;">-0.006</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">-0.007</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 235, 0, 255) !important;">-0.004</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">-0.003</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.6
</td>

<td style="text-align:center;">

750
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">-0.002</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 19, 0, 255) !important;">-0.002</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 19, 0, 255) !important;">-0.002</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 136, 0, 255) !important;">-0.001</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 245, 0, 255) !important;">0.000</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.000</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.6
</td>

<td style="text-align:center;">

1000
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">-0.003</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 19, 0, 255) !important;">-0.003</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 19, 0, 255) !important;">-0.003</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 236, 0, 255) !important;">-0.001</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">-0.001</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 213, 0, 255) !important;">-0.002</span>
</td>

</tr>

</tbody>

</table>

<table class="table" style="color: black; width: auto !important; margin-left: auto; margin-right: auto;">

<caption>

SD across methods (parameter: shape)
</caption>

<thead>

<tr>

<th style="text-align:center;">

ξ₀
</th>

<th style="text-align:center;">

n
</th>

<th style="text-align:center;">

LME
</th>

<th style="text-align:center;">

MLE1D
</th>

<th style="text-align:center;">

MLE2D
</th>

<th style="text-align:center;">

NLS2
</th>

<th style="text-align:center;">

WNLLSM
</th>

<th style="text-align:center;">

ZSE
</th>

</tr>

</thead>

<tbody>

<tr grouplength="8">

<td colspan="8" style="ξ₀ = -0.6">

<strong></strong>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.6
</td>

<td style="text-align:center;">

25
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 237, 0, 255) !important;">0.242</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.491</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 165, 0, 255) !important;">0.317</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 131, 0, 255) !important;">0.354</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 196, 0, 255) !important;">0.285</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.224</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.6
</td>

<td style="text-align:center;">

50
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 209, 0, 255) !important;">0.155</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 89, 0, 255) !important;">0.197</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 134, 0, 255) !important;">0.182</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.228</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 141, 0, 255) !important;">0.179</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.139</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.6
</td>

<td style="text-align:center;">

75
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 209, 0, 255) !important;">0.122</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 152, 0, 255) !important;">0.135</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 151, 0, 255) !important;">0.136</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.172</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 148, 0, 255) !important;">0.136</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.111</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.6
</td>

<td style="text-align:center;">

100
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 206, 0, 255) !important;">0.100</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 225, 0, 255) !important;">0.095</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 126, 0, 255) !important;">0.117</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.144</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 157, 0, 255) !important;">0.110</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.089</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.6
</td>

<td style="text-align:center;">

250
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 197, 0, 255) !important;">0.058</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 240, 0, 255) !important;">0.053</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 183, 0, 255) !important;">0.060</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.082</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 156, 0, 255) !important;">0.063</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.051</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.6
</td>

<td style="text-align:center;">

500
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 181, 0, 255) !important;">0.040</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 244, 0, 255) !important;">0.035</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 232, 0, 255) !important;">0.036</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.056</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 142, 0, 255) !important;">0.044</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.034</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.6
</td>

<td style="text-align:center;">

750
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 181, 0, 255) !important;">0.032</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 246, 0, 255) !important;">0.027</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 246, 0, 255) !important;">0.027</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.047</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 146, 0, 255) !important;">0.035</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.026</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.6
</td>

<td style="text-align:center;">

1000
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 183, 0, 255) !important;">0.028</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 245, 0, 255) !important;">0.023</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 246, 0, 255) !important;">0.023</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.040</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 150, 0, 255) !important;">0.030</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.023</span>
</td>

</tr>

<tr grouplength="8">

<td colspan="8" style="ξ₀ = -0.4">

<strong></strong>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.4
</td>

<td style="text-align:center;">

25
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 234, 0, 255) !important;">0.251</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.415</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 151, 0, 255) !important;">0.309</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 91, 0, 255) !important;">0.351</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 165, 0, 255) !important;">0.299</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.236</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.4
</td>

<td style="text-align:center;">

50
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 218, 0, 255) !important;">0.160</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 178, 0, 255) !important;">0.173</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 135, 0, 255) !important;">0.187</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.231</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 143, 0, 255) !important;">0.185</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.148</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.4
</td>

<td style="text-align:center;">

75
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 224, 0, 255) !important;">0.124</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 226, 0, 255) !important;">0.123</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 149, 0, 255) !important;">0.146</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.190</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 159, 0, 255) !important;">0.143</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.115</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.4
</td>

<td style="text-align:center;">

100
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 222, 0, 255) !important;">0.098</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 241, 0, 255) !important;">0.093</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 165, 0, 255) !important;">0.113</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.155</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 160, 0, 255) !important;">0.114</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.089</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.4
</td>

<td style="text-align:center;">

250
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 209, 0, 255) !important;">0.059</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 251, 0, 255) !important;">0.052</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 224, 0, 255) !important;">0.057</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.093</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 155, 0, 255) !important;">0.068</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.052</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.4
</td>

<td style="text-align:center;">

500
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 202, 0, 255) !important;">0.041</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 254, 0, 255) !important;">0.034</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 254, 0, 255) !important;">0.034</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.065</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 153, 0, 255) !important;">0.046</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.034</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.4
</td>

<td style="text-align:center;">

750
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 197, 0, 255) !important;">0.033</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 254, 0, 255) !important;">0.027</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 254, 0, 255) !important;">0.027</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.055</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 152, 0, 255) !important;">0.038</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.027</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.4
</td>

<td style="text-align:center;">

1000
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 196, 0, 255) !important;">0.028</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 254, 0, 255) !important;">0.023</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 254, 0, 255) !important;">0.023</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.046</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 151, 0, 255) !important;">0.032</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.023</span>
</td>

</tr>

<tr grouplength="8">

<td colspan="8" style="ξ₀ = -0.2">

<strong></strong>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.2
</td>

<td style="text-align:center;">

25
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 242, 0, 255) !important;">0.235</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 11, 0, 255) !important;">0.343</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 113, 0, 255) !important;">0.295</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.348</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 127, 0, 255) !important;">0.289</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.229</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.2
</td>

<td style="text-align:center;">

50
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 235, 0, 255) !important;">0.150</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 207, 0, 255) !important;">0.160</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 188, 0, 255) !important;">0.165</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.225</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 150, 0, 255) !important;">0.178</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.144</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.2
</td>

<td style="text-align:center;">

75
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 239, 0, 255) !important;">0.114</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 228, 0, 255) !important;">0.117</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 207, 0, 255) !important;">0.122</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.177</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 167, 0, 255) !important;">0.133</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.110</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.2
</td>

<td style="text-align:center;">

100
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 232, 0, 255) !important;">0.098</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 237, 0, 255) !important;">0.097</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 219, 0, 255) !important;">0.101</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.150</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 164, 0, 255) !important;">0.113</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.093</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.2
</td>

<td style="text-align:center;">

250
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 220, 0, 255) !important;">0.059</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 249, 0, 255) !important;">0.054</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 249, 0, 255) !important;">0.054</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.099</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 164, 0, 255) !important;">0.069</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.053</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.2
</td>

<td style="text-align:center;">

500
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 228, 0, 255) !important;">0.040</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 250, 0, 255) !important;">0.038</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 250, 0, 255) !important;">0.038</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.070</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 178, 0, 255) !important;">0.047</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.037</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.2
</td>

<td style="text-align:center;">

750
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 217, 0, 255) !important;">0.034</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 252, 0, 255) !important;">0.030</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 252, 0, 255) !important;">0.030</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.061</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 169, 0, 255) !important;">0.040</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.030</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.2
</td>

<td style="text-align:center;">

1000
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 228, 0, 255) !important;">0.028</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 252, 0, 255) !important;">0.026</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 252, 0, 255) !important;">0.026</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.051</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 180, 0, 255) !important;">0.033</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.026</span>
</td>

</tr>

<tr grouplength="8">

<td colspan="8" style="ξ₀ = 0">

<strong></strong>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.0
</td>

<td style="text-align:center;">

25
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 242, 0, 255) !important;">0.253</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 51, 0, 255) !important;">0.336</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 128, 0, 255) !important;">0.302</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.359</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 128, 0, 255) !important;">0.302</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.247</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.0
</td>

<td style="text-align:center;">

50
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 236, 0, 255) !important;">0.156</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 221, 0, 255) !important;">0.161</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 221, 0, 255) !important;">0.161</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.236</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 159, 0, 255) !important;">0.182</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.150</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.0
</td>

<td style="text-align:center;">

75
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 235, 0, 255) !important;">0.127</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 234, 0, 255) !important;">0.127</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 234, 0, 255) !important;">0.127</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.199</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 165, 0, 255) !important;">0.149</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.121</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.0
</td>

<td style="text-align:center;">

100
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 239, 0, 255) !important;">0.109</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 240, 0, 255) !important;">0.109</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 240, 0, 255) !important;">0.109</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.176</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 176, 0, 255) !important;">0.127</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.104</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.0
</td>

<td style="text-align:center;">

250
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 239, 0, 255) !important;">0.071</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 247, 0, 255) !important;">0.069</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 247, 0, 255) !important;">0.069</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.114</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 188, 0, 255) !important;">0.080</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.068</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.0
</td>

<td style="text-align:center;">

500
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 240, 0, 255) !important;">0.046</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 250, 0, 255) !important;">0.045</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 250, 0, 255) !important;">0.045</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.078</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 195, 0, 255) !important;">0.052</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.044</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.0
</td>

<td style="text-align:center;">

750
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 237, 0, 255) !important;">0.039</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 252, 0, 255) !important;">0.037</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 252, 0, 255) !important;">0.037</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.066</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 191, 0, 255) !important;">0.044</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.037</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.0
</td>

<td style="text-align:center;">

1000
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 239, 0, 255) !important;">0.034</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 253, 0, 255) !important;">0.033</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 253, 0, 255) !important;">0.033</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.059</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 193, 0, 255) !important;">0.039</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.033</span>
</td>

</tr>

<tr grouplength="8">

<td colspan="8" style="ξ₀ = 0.2">

<strong></strong>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.2
</td>

<td style="text-align:center;">

25
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 236, 0, 255) !important;">0.264</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 136, 0, 255) !important;">0.305</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 156, 0, 255) !important;">0.297</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.362</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 141, 0, 255) !important;">0.303</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.256</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.2
</td>

<td style="text-align:center;">

50
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 246, 0, 255) !important;">0.182</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 203, 0, 255) !important;">0.196</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 203, 0, 255) !important;">0.196</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.262</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 184, 0, 255) !important;">0.202</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.179</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.2
</td>

<td style="text-align:center;">

75
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 251, 0, 255) !important;">0.148</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 223, 0, 255) !important;">0.157</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 223, 0, 255) !important;">0.157</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.224</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 198, 0, 255) !important;">0.164</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.147</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.2
</td>

<td style="text-align:center;">

100
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 246, 0, 255) !important;">0.125</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 234, 0, 255) !important;">0.129</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 234, 0, 255) !important;">0.129</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.197</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 193, 0, 255) !important;">0.141</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.123</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.2
</td>

<td style="text-align:center;">

250
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 245, 0, 255) !important;">0.077</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 248, 0, 255) !important;">0.076</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 248, 0, 255) !important;">0.076</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.129</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 198, 0, 255) !important;">0.087</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.075</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.2
</td>

<td style="text-align:center;">

500
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 245, 0, 255) !important;">0.055</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 251, 0, 255) !important;">0.054</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 251, 0, 255) !important;">0.054</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.093</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 197, 0, 255) !important;">0.062</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.053</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.2
</td>

<td style="text-align:center;">

750
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 243, 0, 255) !important;">0.046</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 253, 0, 255) !important;">0.045</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 253, 0, 255) !important;">0.045</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.078</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 192, 0, 255) !important;">0.053</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.044</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.2
</td>

<td style="text-align:center;">

1000
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 244, 0, 255) !important;">0.040</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 253, 0, 255) !important;">0.038</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 253, 0, 255) !important;">0.038</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.070</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 194, 0, 255) !important;">0.046</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.038</span>
</td>

</tr>

<tr grouplength="8">

<td colspan="8" style="ξ₀ = 0.4">

<strong></strong>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.4
</td>

<td style="text-align:center;">

25
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 232, 0, 255) !important;">0.309</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 124, 0, 255) !important;">0.357</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 140, 0, 255) !important;">0.350</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.412</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 148, 0, 255) !important;">0.346</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.299</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.4
</td>

<td style="text-align:center;">

50
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 242, 0, 255) !important;">0.210</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 213, 0, 255) !important;">0.221</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 213, 0, 255) !important;">0.221</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.304</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 185, 0, 255) !important;">0.232</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.205</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.4
</td>

<td style="text-align:center;">

75
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 241, 0, 255) !important;">0.171</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 226, 0, 255) !important;">0.175</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 226, 0, 255) !important;">0.175</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.248</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 192, 0, 255) !important;">0.186</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.166</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.4
</td>

<td style="text-align:center;">

100
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 247, 0, 255) !important;">0.143</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 232, 0, 255) !important;">0.147</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 232, 0, 255) !important;">0.147</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.214</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 207, 0, 255) !important;">0.154</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.140</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.4
</td>

<td style="text-align:center;">

250
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 254, 0, 255) !important;">0.090</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 244, 0, 255) !important;">0.091</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 244, 0, 255) !important;">0.091</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.132</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 218, 0, 255) !important;">0.096</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.090</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.4
</td>

<td style="text-align:center;">

500
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 252, 0, 255) !important;">0.061</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 251, 0, 255) !important;">0.061</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 251, 0, 255) !important;">0.061</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.096</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 206, 0, 255) !important;">0.068</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.061</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.4
</td>

<td style="text-align:center;">

750
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 253, 0, 255) !important;">0.048</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 252, 0, 255) !important;">0.048</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 252, 0, 255) !important;">0.048</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.077</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 209, 0, 255) !important;">0.053</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.048</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.4
</td>

<td style="text-align:center;">

1000
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 252, 0, 255) !important;">0.041</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 253, 0, 255) !important;">0.041</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 253, 0, 255) !important;">0.041</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.068</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 210, 0, 255) !important;">0.046</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.041</span>
</td>

</tr>

<tr grouplength="8">

<td colspan="8" style="ξ₀ = 0.6">

<strong></strong>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.6
</td>

<td style="text-align:center;">

25
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 229, 0, 255) !important;">0.339</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 168, 0, 255) !important;">0.367</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 168, 0, 255) !important;">0.367</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.444</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 164, 0, 255) !important;">0.368</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.327</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.6
</td>

<td style="text-align:center;">

50
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 229, 0, 255) !important;">0.245</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 208, 0, 255) !important;">0.253</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 208, 0, 255) !important;">0.253</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.329</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 185, 0, 255) !important;">0.261</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.235</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.6
</td>

<td style="text-align:center;">

75
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 240, 0, 255) !important;">0.199</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 226, 0, 255) !important;">0.204</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 226, 0, 255) !important;">0.204</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.279</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 195, 0, 255) !important;">0.214</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.194</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.6
</td>

<td style="text-align:center;">

100
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 245, 0, 255) !important;">0.167</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 235, 0, 255) !important;">0.171</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 235, 0, 255) !important;">0.171</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.244</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 198, 0, 255) !important;">0.182</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.164</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.6
</td>

<td style="text-align:center;">

250
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 252, 0, 255) !important;">0.102</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 247, 0, 255) !important;">0.103</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 247, 0, 255) !important;">0.103</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.157</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 212, 0, 255) !important;">0.111</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.102</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.6
</td>

<td style="text-align:center;">

500
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 254, 0, 255) !important;">0.071</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 251, 0, 255) !important;">0.072</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 251, 0, 255) !important;">0.072</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.109</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 216, 0, 255) !important;">0.077</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.071</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.6
</td>

<td style="text-align:center;">

750
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 253, 0, 255) !important;">0.060</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 251, 0, 255) !important;">0.060</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 251, 0, 255) !important;">0.060</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.086</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 225, 0, 255) !important;">0.063</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.059</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.6
</td>

<td style="text-align:center;">

1000
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 253, 0, 255) !important;">0.051</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 252, 0, 255) !important;">0.051</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 252, 0, 255) !important;">0.051</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.074</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 225, 0, 255) !important;">0.054</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.051</span>
</td>

</tr>

</tbody>

</table>

<table class="table" style="color: black; width: auto !important; margin-left: auto; margin-right: auto;">

<caption>

RMSE across methods (parameter: shape)
</caption>

<thead>

<tr>

<th style="text-align:center;">

ξ₀
</th>

<th style="text-align:center;">

n
</th>

<th style="text-align:center;">

LME
</th>

<th style="text-align:center;">

MLE1D
</th>

<th style="text-align:center;">

MLE2D
</th>

<th style="text-align:center;">

NLS2
</th>

<th style="text-align:center;">

WNLLSM
</th>

<th style="text-align:center;">

ZSE
</th>

</tr>

</thead>

<tbody>

<tr grouplength="8">

<td colspan="8" style="ξ₀ = -0.6">

<strong></strong>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.6
</td>

<td style="text-align:center;">

25
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 245, 0, 255) !important;">0.250</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.637</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 140, 0, 255) !important;">0.415</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 179, 0, 255) !important;">0.354</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 223, 0, 255) !important;">0.285</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.235</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.6
</td>

<td style="text-align:center;">

50
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 214, 0, 255) !important;">0.157</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 4, 0, 255) !important;">0.228</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 36, 0, 255) !important;">0.217</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.230</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 150, 0, 255) !important;">0.179</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.143</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.6
</td>

<td style="text-align:center;">

75
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 207, 0, 255) !important;">0.123</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 71, 0, 255) !important;">0.156</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 54, 0, 255) !important;">0.160</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.173</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 153, 0, 255) !important;">0.136</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.112</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.6
</td>

<td style="text-align:center;">

100
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 206, 0, 255) !important;">0.100</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 167, 0, 255) !important;">0.109</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 49, 0, 255) !important;">0.134</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.145</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 161, 0, 255) !important;">0.110</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.090</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.6
</td>

<td style="text-align:center;">

250
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 196, 0, 255) !important;">0.059</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 200, 0, 255) !important;">0.058</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 137, 0, 255) !important;">0.066</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.083</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 158, 0, 255) !important;">0.063</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.051</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.6
</td>

<td style="text-align:center;">

500
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 187, 0, 255) !important;">0.040</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 226, 0, 255) !important;">0.036</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 215, 0, 255) !important;">0.038</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.058</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 149, 0, 255) !important;">0.044</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.034</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.6
</td>

<td style="text-align:center;">

750
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 186, 0, 255) !important;">0.032</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 227, 0, 255) !important;">0.029</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 227, 0, 255) !important;">0.029</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.048</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 151, 0, 255) !important;">0.035</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.026</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.6
</td>

<td style="text-align:center;">

1000
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 188, 0, 255) !important;">0.028</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 232, 0, 255) !important;">0.024</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 232, 0, 255) !important;">0.024</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.041</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 156, 0, 255) !important;">0.030</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.023</span>
</td>

</tr>

<tr grouplength="8">

<td colspan="8" style="ξ₀ = -0.4">

<strong></strong>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.4
</td>

<td style="text-align:center;">

25
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 237, 0, 255) !important;">0.260</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.480</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 116, 0, 255) !important;">0.373</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 138, 0, 255) !important;">0.352</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 195, 0, 255) !important;">0.299</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.244</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.4
</td>

<td style="text-align:center;">

50
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 227, 0, 255) !important;">0.161</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 137, 0, 255) !important;">0.190</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 79, 0, 255) !important;">0.208</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.232</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 152, 0, 255) !important;">0.185</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.153</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.4
</td>

<td style="text-align:center;">

75
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 230, 0, 255) !important;">0.125</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 198, 0, 255) !important;">0.134</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 102, 0, 255) !important;">0.161</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.191</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 165, 0, 255) !important;">0.143</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.117</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.4
</td>

<td style="text-align:center;">

100
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 226, 0, 255) !important;">0.098</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 214, 0, 255) !important;">0.102</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 130, 0, 255) !important;">0.123</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.157</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 165, 0, 255) !important;">0.114</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.091</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.4
</td>

<td style="text-align:center;">

250
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 212, 0, 255) !important;">0.059</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 229, 0, 255) !important;">0.056</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 201, 0, 255) !important;">0.061</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.095</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 159, 0, 255) !important;">0.068</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.052</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.4
</td>

<td style="text-align:center;">

500
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 204, 0, 255) !important;">0.041</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 242, 0, 255) !important;">0.036</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 242, 0, 255) !important;">0.036</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.066</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 157, 0, 255) !important;">0.047</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.034</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.4
</td>

<td style="text-align:center;">

750
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 199, 0, 255) !important;">0.033</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 244, 0, 255) !important;">0.028</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 244, 0, 255) !important;">0.028</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.056</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 155, 0, 255) !important;">0.039</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.027</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.4
</td>

<td style="text-align:center;">

1000
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 197, 0, 255) !important;">0.028</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 242, 0, 255) !important;">0.024</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 242, 0, 255) !important;">0.024</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.046</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 153, 0, 255) !important;">0.032</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.023</span>
</td>

</tr>

<tr grouplength="8">

<td colspan="8" style="ξ₀ = -0.2">

<strong></strong>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.2
</td>

<td style="text-align:center;">

25
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 243, 0, 255) !important;">0.243</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.380</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 80, 0, 255) !important;">0.335</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 56, 0, 255) !important;">0.349</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 162, 0, 255) !important;">0.289</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.237</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.2
</td>

<td style="text-align:center;">

50
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 233, 0, 255) !important;">0.153</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 169, 0, 255) !important;">0.173</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 144, 0, 255) !important;">0.181</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.225</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 155, 0, 255) !important;">0.178</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.147</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.2
</td>

<td style="text-align:center;">

75
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 243, 0, 255) !important;">0.115</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 205, 0, 255) !important;">0.125</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 181, 0, 255) !important;">0.131</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.177</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 172, 0, 255) !important;">0.133</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.112</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.2
</td>

<td style="text-align:center;">

100
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 227, 0, 255) !important;">0.100</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 207, 0, 255) !important;">0.104</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 187, 0, 255) !important;">0.109</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.150</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 166, 0, 255) !important;">0.113</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.094</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.2
</td>

<td style="text-align:center;">

250
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 225, 0, 255) !important;">0.059</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 249, 0, 255) !important;">0.055</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 249, 0, 255) !important;">0.055</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.100</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 168, 0, 255) !important;">0.069</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.054</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.2
</td>

<td style="text-align:center;">

500
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 230, 0, 255) !important;">0.041</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 250, 0, 255) !important;">0.038</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 250, 0, 255) !important;">0.038</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.070</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 180, 0, 255) !important;">0.047</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.037</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.2
</td>

<td style="text-align:center;">

750
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 217, 0, 255) !important;">0.034</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 249, 0, 255) !important;">0.031</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 249, 0, 255) !important;">0.031</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.061</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 170, 0, 255) !important;">0.040</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.030</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.2
</td>

<td style="text-align:center;">

1000
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 228, 0, 255) !important;">0.028</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 251, 0, 255) !important;">0.026</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 251, 0, 255) !important;">0.026</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.051</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 181, 0, 255) !important;">0.033</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.026</span>
</td>

</tr>

<tr grouplength="8">

<td colspan="8" style="ξ₀ = 0">

<strong></strong>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.0
</td>

<td style="text-align:center;">

25
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 214, 0, 255) !important;">0.267</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.371</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 70, 0, 255) !important;">0.337</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 26, 0, 255) !important;">0.358</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 143, 0, 255) !important;">0.302</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.248</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.0
</td>

<td style="text-align:center;">

50
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 224, 0, 255) !important;">0.161</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 188, 0, 255) !important;">0.173</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 188, 0, 255) !important;">0.173</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.236</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 161, 0, 255) !important;">0.182</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.151</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.0
</td>

<td style="text-align:center;">

75
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 232, 0, 255) !important;">0.129</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 219, 0, 255) !important;">0.133</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 219, 0, 255) !important;">0.133</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.199</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 167, 0, 255) !important;">0.148</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.122</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.0
</td>

<td style="text-align:center;">

100
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 239, 0, 255) !important;">0.110</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 231, 0, 255) !important;">0.112</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 231, 0, 255) !important;">0.112</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.176</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 178, 0, 255) !important;">0.127</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.105</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.0
</td>

<td style="text-align:center;">

250
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 237, 0, 255) !important;">0.071</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 240, 0, 255) !important;">0.070</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 240, 0, 255) !important;">0.070</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.114</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 188, 0, 255) !important;">0.080</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.068</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.0
</td>

<td style="text-align:center;">

500
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 238, 0, 255) !important;">0.046</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 245, 0, 255) !important;">0.045</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 245, 0, 255) !important;">0.045</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.078</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 195, 0, 255) !important;">0.052</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.044</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.0
</td>

<td style="text-align:center;">

750
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 235, 0, 255) !important;">0.039</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 248, 0, 255) !important;">0.038</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 248, 0, 255) !important;">0.038</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.067</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 191, 0, 255) !important;">0.044</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.037</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.0
</td>

<td style="text-align:center;">

1000
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 237, 0, 255) !important;">0.034</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 249, 0, 255) !important;">0.033</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 249, 0, 255) !important;">0.033</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.059</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 193, 0, 255) !important;">0.039</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.033</span>
</td>

</tr>

<tr grouplength="8">

<td colspan="8" style="ξ₀ = 0.2">

<strong></strong>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.2
</td>

<td style="text-align:center;">

25
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 206, 0, 255) !important;">0.277</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 84, 0, 255) !important;">0.328</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 104, 0, 255) !important;">0.320</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.363</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 143, 0, 255) !important;">0.303</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.257</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.2
</td>

<td style="text-align:center;">

50
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 226, 0, 255) !important;">0.188</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 171, 0, 255) !important;">0.206</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 171, 0, 255) !important;">0.206</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.263</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 184, 0, 255) !important;">0.202</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.179</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.2
</td>

<td style="text-align:center;">

75
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 238, 0, 255) !important;">0.152</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 202, 0, 255) !important;">0.163</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 202, 0, 255) !important;">0.163</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.225</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 198, 0, 255) !important;">0.165</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.147</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.2
</td>

<td style="text-align:center;">

100
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 239, 0, 255) !important;">0.127</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 224, 0, 255) !important;">0.132</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 224, 0, 255) !important;">0.132</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.198</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 194, 0, 255) !important;">0.141</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.123</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.2
</td>

<td style="text-align:center;">

250
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 244, 0, 255) !important;">0.077</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 247, 0, 255) !important;">0.077</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 247, 0, 255) !important;">0.077</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.130</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 199, 0, 255) !important;">0.087</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.075</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.2
</td>

<td style="text-align:center;">

500
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 244, 0, 255) !important;">0.055</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 250, 0, 255) !important;">0.054</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 250, 0, 255) !important;">0.054</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.094</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 197, 0, 255) !important;">0.062</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.053</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.2
</td>

<td style="text-align:center;">

750
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 241, 0, 255) !important;">0.046</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 251, 0, 255) !important;">0.045</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 251, 0, 255) !important;">0.045</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.079</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 192, 0, 255) !important;">0.053</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.044</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.2
</td>

<td style="text-align:center;">

1000
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 243, 0, 255) !important;">0.040</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 252, 0, 255) !important;">0.039</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 252, 0, 255) !important;">0.039</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.070</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 194, 0, 255) !important;">0.046</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.038</span>
</td>

</tr>

<tr grouplength="8">

<td colspan="8" style="ξ₀ = 0.4">

<strong></strong>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.4
</td>

<td style="text-align:center;">

25
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 186, 0, 255) !important;">0.333</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 73, 0, 255) !important;">0.387</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 88, 0, 255) !important;">0.379</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.421</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 155, 0, 255) !important;">0.348</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.301</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.4
</td>

<td style="text-align:center;">

50
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 227, 0, 255) !important;">0.216</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 197, 0, 255) !important;">0.228</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 197, 0, 255) !important;">0.228</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.306</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 186, 0, 255) !important;">0.232</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.205</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.4
</td>

<td style="text-align:center;">

75
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 235, 0, 255) !important;">0.173</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 218, 0, 255) !important;">0.178</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 218, 0, 255) !important;">0.178</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.250</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 193, 0, 255) !important;">0.186</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.166</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.4
</td>

<td style="text-align:center;">

100
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 242, 0, 255) !important;">0.144</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 225, 0, 255) !important;">0.149</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 225, 0, 255) !important;">0.149</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.214</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 207, 0, 255) !important;">0.154</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.140</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.4
</td>

<td style="text-align:center;">

250
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 254, 0, 255) !important;">0.090</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 244, 0, 255) !important;">0.091</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 244, 0, 255) !important;">0.091</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.132</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 218, 0, 255) !important;">0.096</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.090</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.4
</td>

<td style="text-align:center;">

500
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 252, 0, 255) !important;">0.061</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 251, 0, 255) !important;">0.061</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 251, 0, 255) !important;">0.061</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.096</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 206, 0, 255) !important;">0.068</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.061</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.4
</td>

<td style="text-align:center;">

750
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 253, 0, 255) !important;">0.048</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 253, 0, 255) !important;">0.048</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 253, 0, 255) !important;">0.048</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.077</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 210, 0, 255) !important;">0.053</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.048</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.4
</td>

<td style="text-align:center;">

1000
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 253, 0, 255) !important;">0.041</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 254, 0, 255) !important;">0.041</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 254, 0, 255) !important;">0.041</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.068</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 210, 0, 255) !important;">0.046</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.041</span>
</td>

</tr>

<tr grouplength="8">

<td colspan="8" style="ξ₀ = 0.6">

<strong></strong>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.6
</td>

<td style="text-align:center;">

25
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 204, 0, 255) !important;">0.350</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 143, 0, 255) !important;">0.379</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 143, 0, 255) !important;">0.379</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.446</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 166, 0, 255) !important;">0.368</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.326</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.6
</td>

<td style="text-align:center;">

50
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 219, 0, 255) !important;">0.249</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 198, 0, 255) !important;">0.257</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 198, 0, 255) !important;">0.257</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.331</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 187, 0, 255) !important;">0.261</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.236</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.6
</td>

<td style="text-align:center;">

75
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 234, 0, 255) !important;">0.201</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 221, 0, 255) !important;">0.206</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 221, 0, 255) !important;">0.206</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.280</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 197, 0, 255) !important;">0.214</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.194</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.6
</td>

<td style="text-align:center;">

100
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 242, 0, 255) !important;">0.168</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 233, 0, 255) !important;">0.171</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 233, 0, 255) !important;">0.171</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.244</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 199, 0, 255) !important;">0.182</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.164</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.6
</td>

<td style="text-align:center;">

250
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 250, 0, 255) !important;">0.103</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 246, 0, 255) !important;">0.104</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 246, 0, 255) !important;">0.104</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.157</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 212, 0, 255) !important;">0.111</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.102</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.6
</td>

<td style="text-align:center;">

500
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 253, 0, 255) !important;">0.072</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 249, 0, 255) !important;">0.072</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 249, 0, 255) !important;">0.072</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.110</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 217, 0, 255) !important;">0.077</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.071</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.6
</td>

<td style="text-align:center;">

750
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 252, 0, 255) !important;">0.060</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 251, 0, 255) !important;">0.060</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 251, 0, 255) !important;">0.060</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.086</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 225, 0, 255) !important;">0.062</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.059</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.6
</td>

<td style="text-align:center;">

1000
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 252, 0, 255) !important;">0.051</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 251, 0, 255) !important;">0.051</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 251, 0, 255) !important;">0.051</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.074</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 225, 0, 255) !important;">0.054</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.051</span>
</td>

</tr>

</tbody>

</table>

<table class="table" style="color: black; width: auto !important; margin-left: auto; margin-right: auto;">

<caption>

BIAS across methods (parameter: scale)
</caption>

<thead>

<tr>

<th style="text-align:center;">

ξ₀
</th>

<th style="text-align:center;">

n
</th>

<th style="text-align:center;">

LME
</th>

<th style="text-align:center;">

MLE1D
</th>

<th style="text-align:center;">

MLE2D
</th>

<th style="text-align:center;">

NLS2
</th>

<th style="text-align:center;">

WNLLSM
</th>

<th style="text-align:center;">

ZSE
</th>

</tr>

</thead>

<tbody>

<tr grouplength="8">

<td colspan="8" style="ξ₀ = -0.6">

<strong></strong>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.6
</td>

<td style="text-align:center;">

25
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 231, 0, 255) !important;">0.058</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.494</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 117, 0, 255) !important;">0.273</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 253, 0, 255) !important;">-0.017</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.013</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 232, 0, 255) !important;">-0.055</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.6
</td>

<td style="text-align:center;">

50
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 209, 0, 255) !important;">0.025</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.121</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 13, 0, 255) !important;">0.115</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 222, 0, 255) !important;">-0.019</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.004</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 199, 0, 255) !important;">-0.029</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.6
</td>

<td style="text-align:center;">

75
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 206, 0, 255) !important;">0.021</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 10, 0, 255) !important;">0.078</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.082</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 228, 0, 255) !important;">-0.014</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.006</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 232, 0, 255) !important;">-0.013</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.6
</td>

<td style="text-align:center;">

100
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 212, 0, 255) !important;">0.014</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 47, 0, 255) !important;">0.050</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.061</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 237, 0, 255) !important;">-0.009</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.005</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 221, 0, 255) !important;">-0.012</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.6
</td>

<td style="text-align:center;">

250
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 201, 0, 255) !important;">0.008</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 23, 0, 255) !important;">0.024</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.026</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 250, 0, 255) !important;">-0.003</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 237, 0, 255) !important;">0.004</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">-0.003</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.6
</td>

<td style="text-align:center;">

500
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.001</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 7, 0, 255) !important;">0.011</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.011</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 86, 0, 255) !important;">-0.008</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 238, 0, 255) !important;">-0.001</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 187, 0, 255) !important;">-0.003</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.6
</td>

<td style="text-align:center;">

750
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.000</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.009</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.009</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 98, 0, 255) !important;">-0.006</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 237, 0, 255) !important;">-0.001</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 239, 0, 255) !important;">-0.001</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.6
</td>

<td style="text-align:center;">

1000
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">-0.001</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.007</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.007</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 27, 0, 255) !important;">-0.006</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 202, 0, 255) !important;">-0.002</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 220, 0, 255) !important;">-0.001</span>
</td>

</tr>

<tr grouplength="8">

<td colspan="8" style="ξ₀ = -0.4">

<strong></strong>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.4
</td>

<td style="text-align:center;">

25
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 213, 0, 255) !important;">0.048</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.269</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 69, 0, 255) !important;">0.197</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 219, 0, 255) !important;">-0.041</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">-0.005</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 197, 0, 255) !important;">-0.065</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.4
</td>

<td style="text-align:center;">

50
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.009</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 33, 0, 255) !important;">0.067</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.076</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 149, 0, 255) !important;">-0.037</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 229, 0, 255) !important;">-0.015</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 120, 0, 255) !important;">-0.045</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.4
</td>

<td style="text-align:center;">

75
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.005</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 66, 0, 255) !important;">0.043</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.057</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 153, 0, 255) !important;">-0.026</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 224, 0, 255) !important;">-0.011</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 130, 0, 255) !important;">-0.030</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.4
</td>

<td style="text-align:center;">

100
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.004</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 50, 0, 255) !important;">0.035</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.043</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 141, 0, 255) !important;">-0.022</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 232, 0, 255) !important;">-0.008</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 148, 0, 255) !important;">-0.021</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.4
</td>

<td style="text-align:center;">

250
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 235, 0, 255) !important;">0.004</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 20, 0, 255) !important;">0.020</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.022</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 128, 0, 255) !important;">-0.012</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">-0.002</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 227, 0, 255) !important;">-0.004</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.4
</td>

<td style="text-align:center;">

500
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.001</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.010</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.010</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 77, 0, 255) !important;">-0.007</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 235, 0, 255) !important;">-0.002</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 203, 0, 255) !important;">-0.003</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.4
</td>

<td style="text-align:center;">

750
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.000</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.008</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.008</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 64, 0, 255) !important;">-0.006</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 209, 0, 255) !important;">-0.002</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 223, 0, 255) !important;">-0.001</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.4
</td>

<td style="text-align:center;">

1000
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 188, 0, 255) !important;">0.002</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.007</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.007</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 159, 0, 255) !important;">-0.003</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 243, 0, 255) !important;">0.000</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.000</span>
</td>

</tr>

<tr grouplength="8">

<td colspan="8" style="ξ₀ = -0.2">

<strong></strong>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.2
</td>

<td style="text-align:center;">

25
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 177, 0, 255) !important;">0.067</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.200</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 33, 0, 255) !important;">0.175</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 225, 0, 255) !important;">-0.031</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.009</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 203, 0, 255) !important;">-0.048</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.2
</td>

<td style="text-align:center;">

50
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 160, 0, 255) !important;">0.035</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 16, 0, 255) !important;">0.074</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.079</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 231, 0, 255) !important;">-0.015</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.009</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 207, 0, 255) !important;">-0.022</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.2
</td>

<td style="text-align:center;">

75
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 160, 0, 255) !important;">0.019</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 14, 0, 255) !important;">0.048</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.051</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 175, 0, 255) !important;">-0.016</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.001</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 171, 0, 255) !important;">-0.017</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.2
</td>

<td style="text-align:center;">

100
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 136, 0, 255) !important;">0.022</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 13, 0, 255) !important;">0.040</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.042</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">-0.004</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 215, 0, 255) !important;">0.010</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 216, 0, 255) !important;">-0.010</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.2
</td>

<td style="text-align:center;">

250
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 213, 0, 255) !important;">0.003</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.012</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.012</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 100, 0, 255) !important;">-0.008</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">-0.002</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 70, 0, 255) !important;">-0.009</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.2
</td>

<td style="text-align:center;">

500
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 185, 0, 255) !important;">0.003</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.006</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.006</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 224, 0, 255) !important;">-0.002</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.001</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 53, 0, 255) !important;">-0.005</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.2
</td>

<td style="text-align:center;">

750
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 143, 0, 255) !important;">0.003</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.006</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.006</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">-0.001</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 197, 0, 255) !important;">0.002</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 202, 0, 255) !important;">-0.002</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.2
</td>

<td style="text-align:center;">

1000
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 200, 0, 255) !important;">0.001</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.003</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.003</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 141, 0, 255) !important;">-0.001</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.000</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 37, 0, 255) !important;">-0.003</span>
</td>

</tr>

<tr grouplength="8">

<td colspan="8" style="ξ₀ = 0">

<strong></strong>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.0
</td>

<td style="text-align:center;">

25
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 132, 0, 255) !important;">0.099</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.198</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 26, 0, 255) !important;">0.178</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">-0.007</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 216, 0, 255) !important;">0.036</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 245, 0, 255) !important;">-0.014</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.0
</td>

<td style="text-align:center;">

50
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 91, 0, 255) !important;">0.047</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.071</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.071</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">-0.003</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 198, 0, 255) !important;">0.018</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 233, 0, 255) !important;">-0.009</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.0
</td>

<td style="text-align:center;">

75
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 118, 0, 255) !important;">0.022</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.039</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.039</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 197, 0, 255) !important;">-0.011</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.004</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 163, 0, 255) !important;">-0.016</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.0
</td>

<td style="text-align:center;">

100
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 117, 0, 255) !important;">0.016</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.028</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.028</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 203, 0, 255) !important;">-0.007</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.002</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 141, 0, 255) !important;">-0.014</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.0
</td>

<td style="text-align:center;">

250
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 126, 0, 255) !important;">0.007</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.012</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.012</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 245, 0, 255) !important;">-0.002</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.001</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 162, 0, 255) !important;">-0.005</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.0
</td>

<td style="text-align:center;">

500
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 67, 0, 255) !important;">0.008</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.011</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.011</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 151, 0, 255) !important;">0.005</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 121, 0, 255) !important;">0.006</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.002</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.0
</td>

<td style="text-align:center;">

750
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 59, 0, 255) !important;">0.007</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.009</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.009</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 104, 0, 255) !important;">0.006</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 98, 0, 255) !important;">0.006</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.003</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.0
</td>

<td style="text-align:center;">

1000
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 64, 0, 255) !important;">0.006</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.007</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.007</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 78, 0, 255) !important;">0.006</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 89, 0, 255) !important;">0.006</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.003</span>
</td>

</tr>

<tr grouplength="8">

<td colspan="8" style="ξ₀ = 0.2">

<strong></strong>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.2
</td>

<td style="text-align:center;">

25
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 102, 0, 255) !important;">0.091</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.142</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 10, 0, 255) !important;">0.136</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 247, 0, 255) !important;">-0.018</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 243, 0, 255) !important;">0.020</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">-0.015</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.2
</td>

<td style="text-align:center;">

50
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 69, 0, 255) !important;">0.055</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.075</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.075</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.003</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 188, 0, 255) !important;">0.022</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 239, 0, 255) !important;">0.008</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.2
</td>

<td style="text-align:center;">

75
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 68, 0, 255) !important;">0.040</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.053</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.053</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 248, 0, 255) !important;">0.008</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 186, 0, 255) !important;">0.019</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.007</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.2
</td>

<td style="text-align:center;">

100
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 49, 0, 255) !important;">0.032</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.038</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.038</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 197, 0, 255) !important;">0.012</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 148, 0, 255) !important;">0.018</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.004</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.2
</td>

<td style="text-align:center;">

250
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 59, 0, 255) !important;">0.006</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.007</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.007</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.004</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 231, 0, 255) !important;">0.005</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 104, 0, 255) !important;">-0.006</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.2
</td>

<td style="text-align:center;">

500
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 6, 0, 255) !important;">0.005</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.005</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.005</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.005</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 32, 0, 255) !important;">0.005</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">-0.002</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.2
</td>

<td style="text-align:center;">

750
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 29, 0, 255) !important;">0.006</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 38, 0, 255) !important;">0.006</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 38, 0, 255) !important;">0.006</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.006</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 23, 0, 255) !important;">0.006</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.001</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.2
</td>

<td style="text-align:center;">

1000
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 26, 0, 255) !important;">0.005</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 38, 0, 255) !important;">0.005</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 38, 0, 255) !important;">0.005</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.006</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 12, 0, 255) !important;">0.005</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.002</span>
</td>

</tr>

<tr grouplength="8">

<td colspan="8" style="ξ₀ = 0.4">

<strong></strong>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.4
</td>

<td style="text-align:center;">

25
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 67, 0, 255) !important;">0.129</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.168</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 5, 0, 255) !important;">0.165</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.018</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 203, 0, 255) !important;">0.049</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 237, 0, 255) !important;">0.029</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.4
</td>

<td style="text-align:center;">

50
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 38, 0, 255) !important;">0.063</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.073</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.073</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.011</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 196, 0, 255) !important;">0.025</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 213, 0, 255) !important;">0.021</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.4
</td>

<td style="text-align:center;">

75
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 29, 0, 255) !important;">0.031</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.035</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.035</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 253, 0, 255) !important;">0.003</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 190, 0, 255) !important;">0.011</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.003</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.4
</td>

<td style="text-align:center;">

100
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 37, 0, 255) !important;">0.021</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.025</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.025</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 224, 0, 255) !important;">-0.003</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 221, 0, 255) !important;">0.003</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">-0.000</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.4
</td>

<td style="text-align:center;">

250
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">-0.000</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 226, 0, 255) !important;">0.001</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 226, 0, 255) !important;">0.001</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">-0.012</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 81, 0, 255) !important;">-0.008</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 77, 0, 255) !important;">-0.008</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.4
</td>

<td style="text-align:center;">

500
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.000</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 238, 0, 255) !important;">0.001</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 238, 0, 255) !important;">0.001</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">-0.006</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 134, 0, 255) !important;">-0.003</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 76, 0, 255) !important;">-0.004</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.4
</td>

<td style="text-align:center;">

750
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 25, 0, 255) !important;">0.002</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 3, 0, 255) !important;">0.002</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 3, 0, 255) !important;">0.002</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">-0.002</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.000</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 108, 0, 255) !important;">-0.001</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.4
</td>

<td style="text-align:center;">

1000
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 190, 0, 255) !important;">0.001</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 168, 0, 255) !important;">0.001</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 168, 0, 255) !important;">0.001</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">-0.002</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">-0.001</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 111, 0, 255) !important;">-0.001</span>
</td>

</tr>

<tr grouplength="8">

<td colspan="8" style="ξ₀ = 0.6">

<strong></strong>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.6
</td>

<td style="text-align:center;">

25
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 28, 0, 255) !important;">0.115</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.128</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.128</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">-0.010</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 231, 0, 255) !important;">0.021</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 219, 0, 255) !important;">0.026</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.6
</td>

<td style="text-align:center;">

50
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 5, 0, 255) !important;">0.056</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.057</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.057</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.006</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 185, 0, 255) !important;">0.020</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 182, 0, 255) !important;">0.021</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.6
</td>

<td style="text-align:center;">

75
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.034</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 3, 0, 255) !important;">0.034</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 3, 0, 255) !important;">0.034</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.006</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 180, 0, 255) !important;">0.014</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 214, 0, 255) !important;">0.011</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.6
</td>

<td style="text-align:center;">

100
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.024</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 10, 0, 255) !important;">0.023</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 10, 0, 255) !important;">0.023</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.004</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 166, 0, 255) !important;">0.011</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 236, 0, 255) !important;">0.006</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.6
</td>

<td style="text-align:center;">

250
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.011</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 15, 0, 255) !important;">0.011</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 15, 0, 255) !important;">0.011</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.002</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 163, 0, 255) !important;">0.006</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 195, 0, 255) !important;">0.005</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.6
</td>

<td style="text-align:center;">

500
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.008</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 14, 0, 255) !important;">0.008</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 14, 0, 255) !important;">0.008</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.004</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 146, 0, 255) !important;">0.006</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 194, 0, 255) !important;">0.005</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.6
</td>

<td style="text-align:center;">

750
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.004</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 9, 0, 255) !important;">0.004</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 9, 0, 255) !important;">0.004</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.001</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 136, 0, 255) !important;">0.002</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 151, 0, 255) !important;">0.002</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.6
</td>

<td style="text-align:center;">

1000
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.004</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 11, 0, 255) !important;">0.003</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 11, 0, 255) !important;">0.003</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.000</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 137, 0, 255) !important;">0.002</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 124, 0, 255) !important;">0.002</span>
</td>

</tr>

</tbody>

</table>

<table class="table" style="color: black; width: auto !important; margin-left: auto; margin-right: auto;">

<caption>

SD across methods (parameter: scale)
</caption>

<thead>

<tr>

<th style="text-align:center;">

ξ₀
</th>

<th style="text-align:center;">

n
</th>

<th style="text-align:center;">

LME
</th>

<th style="text-align:center;">

MLE1D
</th>

<th style="text-align:center;">

MLE2D
</th>

<th style="text-align:center;">

NLS2
</th>

<th style="text-align:center;">

WNLLSM
</th>

<th style="text-align:center;">

ZSE
</th>

</tr>

</thead>

<tbody>

<tr grouplength="8">

<td colspan="8" style="ξ₀ = -0.6">

<strong></strong>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.6
</td>

<td style="text-align:center;">

25
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 233, 0, 255) !important;">0.274</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.651</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 165, 0, 255) !important;">0.383</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 210, 0, 255) !important;">0.311</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 225, 0, 255) !important;">0.288</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.239</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.6
</td>

<td style="text-align:center;">

50
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 208, 0, 255) !important;">0.185</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.263</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 109, 0, 255) !important;">0.222</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 147, 0, 255) !important;">0.208</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 181, 0, 255) !important;">0.195</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.167</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.6
</td>

<td style="text-align:center;">

75
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 189, 0, 255) !important;">0.151</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.183</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 67, 0, 255) !important;">0.171</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 93, 0, 255) !important;">0.167</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 146, 0, 255) !important;">0.158</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.140</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.6
</td>

<td style="text-align:center;">

100
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 156, 0, 255) !important;">0.125</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 128, 0, 255) !important;">0.128</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 31, 0, 255) !important;">0.138</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.141</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 97, 0, 255) !important;">0.131</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.115</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.6
</td>

<td style="text-align:center;">

250
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 154, 0, 255) !important;">0.077</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 197, 0, 255) !important;">0.075</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 157, 0, 255) !important;">0.077</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.086</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 100, 0, 255) !important;">0.080</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.071</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.6
</td>

<td style="text-align:center;">

500
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 139, 0, 255) !important;">0.053</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 218, 0, 255) !important;">0.050</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 212, 0, 255) !important;">0.050</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.059</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 82, 0, 255) !important;">0.056</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.049</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.6
</td>

<td style="text-align:center;">

750
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 143, 0, 255) !important;">0.043</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 229, 0, 255) !important;">0.039</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 229, 0, 255) !important;">0.039</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.048</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 92, 0, 255) !important;">0.045</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.038</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.6
</td>

<td style="text-align:center;">

1000
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 148, 0, 255) !important;">0.037</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 230, 0, 255) !important;">0.034</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 230, 0, 255) !important;">0.034</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.042</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 99, 0, 255) !important;">0.039</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.034</span>
</td>

</tr>

<tr grouplength="8">

<td colspan="8" style="ξ₀ = -0.4">

<strong></strong>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.4
</td>

<td style="text-align:center;">

25
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 225, 0, 255) !important;">0.291</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.565</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 149, 0, 255) !important;">0.383</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 209, 0, 255) !important;">0.311</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 215, 0, 255) !important;">0.304</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.256</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.4
</td>

<td style="text-align:center;">

50
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 171, 0, 255) !important;">0.200</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.236</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 10, 0, 255) !important;">0.234</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 65, 0, 255) !important;">0.222</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 115, 0, 255) !important;">0.212</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.183</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.4
</td>

<td style="text-align:center;">

75
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 177, 0, 255) !important;">0.158</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 117, 0, 255) !important;">0.167</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 26, 0, 255) !important;">0.180</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.183</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 104, 0, 255) !important;">0.169</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.147</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.4
</td>

<td style="text-align:center;">

100
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 177, 0, 255) !important;">0.133</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 170, 0, 255) !important;">0.134</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 64, 0, 255) !important;">0.146</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.153</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 97, 0, 255) !important;">0.142</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.124</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.4
</td>

<td style="text-align:center;">

250
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 176, 0, 255) !important;">0.081</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 218, 0, 255) !important;">0.078</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 190, 0, 255) !important;">0.080</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.092</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 89, 0, 255) !important;">0.086</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.076</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.4
</td>

<td style="text-align:center;">

500
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 178, 0, 255) !important;">0.056</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 240, 0, 255) !important;">0.053</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 240, 0, 255) !important;">0.053</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.065</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 99, 0, 255) !important;">0.060</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.052</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.4
</td>

<td style="text-align:center;">

750
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 166, 0, 255) !important;">0.045</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 245, 0, 255) !important;">0.041</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 245, 0, 255) !important;">0.041</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.053</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 91, 0, 255) !important;">0.048</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.040</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.4
</td>

<td style="text-align:center;">

1000
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 159, 0, 255) !important;">0.038</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 247, 0, 255) !important;">0.035</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 247, 0, 255) !important;">0.035</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.045</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 85, 0, 255) !important;">0.041</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.035</span>
</td>

</tr>

<tr grouplength="8">

<td colspan="8" style="ξ₀ = -0.2">

<strong></strong>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.2
</td>

<td style="text-align:center;">

25
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 220, 0, 255) !important;">0.300</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.503</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 114, 0, 255) !important;">0.397</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 201, 0, 255) !important;">0.317</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 206, 0, 255) !important;">0.312</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.267</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.2
</td>

<td style="text-align:center;">

50
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 173, 0, 255) !important;">0.207</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.234</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 10, 0, 255) !important;">0.233</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 97, 0, 255) !important;">0.219</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 107, 0, 255) !important;">0.217</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.194</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.2
</td>

<td style="text-align:center;">

75
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 171, 0, 255) !important;">0.157</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 48, 0, 255) !important;">0.167</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 8, 0, 255) !important;">0.170</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.171</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 50, 0, 255) !important;">0.167</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.150</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.2
</td>

<td style="text-align:center;">

100
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 154, 0, 255) !important;">0.141</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 115, 0, 255) !important;">0.144</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 81, 0, 255) !important;">0.146</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.152</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 40, 0, 255) !important;">0.149</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.134</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.2
</td>

<td style="text-align:center;">

250
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 174, 0, 255) !important;">0.086</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 221, 0, 255) !important;">0.082</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 221, 0, 255) !important;">0.082</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.098</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 80, 0, 255) !important;">0.092</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.080</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.2
</td>

<td style="text-align:center;">

500
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 197, 0, 255) !important;">0.060</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 231, 0, 255) !important;">0.058</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 231, 0, 255) !important;">0.058</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.069</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 104, 0, 255) !important;">0.064</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.057</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.2
</td>

<td style="text-align:center;">

750
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 183, 0, 255) !important;">0.049</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 243, 0, 255) !important;">0.046</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 243, 0, 255) !important;">0.046</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.058</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 96, 0, 255) !important;">0.053</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.046</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.2
</td>

<td style="text-align:center;">

1000
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 200, 0, 255) !important;">0.042</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 245, 0, 255) !important;">0.040</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 245, 0, 255) !important;">0.040</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.050</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 110, 0, 255) !important;">0.046</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.040</span>
</td>

</tr>

<tr grouplength="8">

<td colspan="8" style="ξ₀ = 0">

<strong></strong>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.0
</td>

<td style="text-align:center;">

25
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 212, 0, 255) !important;">0.336</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.527</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 108, 0, 255) !important;">0.430</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 206, 0, 255) !important;">0.342</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 194, 0, 255) !important;">0.353</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.298</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.0
</td>

<td style="text-align:center;">

50
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 114, 0, 255) !important;">0.218</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 49, 0, 255) !important;">0.226</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 49, 0, 255) !important;">0.226</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.232</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 18, 0, 255) !important;">0.229</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.200</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.0
</td>

<td style="text-align:center;">

75
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 157, 0, 255) !important;">0.171</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 121, 0, 255) !important;">0.175</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 121, 0, 255) !important;">0.175</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.188</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 52, 0, 255) !important;">0.182</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.161</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.0
</td>

<td style="text-align:center;">

100
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 177, 0, 255) !important;">0.152</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 154, 0, 255) !important;">0.154</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 154, 0, 255) !important;">0.154</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.168</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 67, 0, 255) !important;">0.162</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.145</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.0
</td>

<td style="text-align:center;">

250
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 203, 0, 255) !important;">0.095</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 213, 0, 255) !important;">0.094</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 213, 0, 255) !important;">0.094</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.108</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 100, 0, 255) !important;">0.102</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.092</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.0
</td>

<td style="text-align:center;">

500
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 218, 0, 255) !important;">0.065</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 235, 0, 255) !important;">0.064</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 235, 0, 255) !important;">0.064</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.075</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 126, 0, 255) !important;">0.069</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.063</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.0
</td>

<td style="text-align:center;">

750
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 215, 0, 255) !important;">0.053</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 243, 0, 255) !important;">0.052</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 243, 0, 255) !important;">0.052</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.063</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 124, 0, 255) !important;">0.057</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.052</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.0
</td>

<td style="text-align:center;">

1000
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 219, 0, 255) !important;">0.047</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 245, 0, 255) !important;">0.046</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 246, 0, 255) !important;">0.046</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.055</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 129, 0, 255) !important;">0.050</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.045</span>
</td>

</tr>

<tr grouplength="8">

<td colspan="8" style="ξ₀ = 0.2">

<strong></strong>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.2
</td>

<td style="text-align:center;">

25
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 184, 0, 255) !important;">0.359</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.453</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 69, 0, 255) !important;">0.418</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 209, 0, 255) !important;">0.347</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 191, 0, 255) !important;">0.356</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.323</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.2
</td>

<td style="text-align:center;">

50
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 171, 0, 255) !important;">0.238</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.257</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.257</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 90, 0, 255) !important;">0.247</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 129, 0, 255) !important;">0.243</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.228</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.2
</td>

<td style="text-align:center;">

75
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 191, 0, 255) !important;">0.193</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 94, 0, 255) !important;">0.202</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 94, 0, 255) !important;">0.202</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.211</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 96, 0, 255) !important;">0.202</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.187</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.2
</td>

<td style="text-align:center;">

100
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 195, 0, 255) !important;">0.167</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 163, 0, 255) !important;">0.171</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 163, 0, 255) !important;">0.171</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.188</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 95, 0, 255) !important;">0.178</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.161</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.2
</td>

<td style="text-align:center;">

250
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 220, 0, 255) !important;">0.096</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 233, 0, 255) !important;">0.095</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 233, 0, 255) !important;">0.095</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.116</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 110, 0, 255) !important;">0.106</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.093</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.2
</td>

<td style="text-align:center;">

500
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 228, 0, 255) !important;">0.067</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 243, 0, 255) !important;">0.066</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 243, 0, 255) !important;">0.066</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.082</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 119, 0, 255) !important;">0.074</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.065</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.2
</td>

<td style="text-align:center;">

750
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 226, 0, 255) !important;">0.057</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 247, 0, 255) !important;">0.056</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 247, 0, 255) !important;">0.056</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.069</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 117, 0, 255) !important;">0.063</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.056</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.2
</td>

<td style="text-align:center;">

1000
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 232, 0, 255) !important;">0.049</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 249, 0, 255) !important;">0.048</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 249, 0, 255) !important;">0.048</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.060</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 125, 0, 255) !important;">0.054</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.048</span>
</td>

</tr>

<tr grouplength="8">

<td colspan="8" style="ξ₀ = 0.4">

<strong></strong>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.4
</td>

<td style="text-align:center;">

25
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 150, 0, 255) !important;">0.393</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.451</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 28, 0, 255) !important;">0.441</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 185, 0, 255) !important;">0.380</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 163, 0, 255) !important;">0.388</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.353</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.4
</td>

<td style="text-align:center;">

50
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 138, 0, 255) !important;">0.265</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.279</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.279</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 62, 0, 255) !important;">0.273</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 154, 0, 255) !important;">0.263</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.253</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.4
</td>

<td style="text-align:center;">

75
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 162, 0, 255) !important;">0.206</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 91, 0, 255) !important;">0.212</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 91, 0, 255) !important;">0.212</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.219</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 122, 0, 255) !important;">0.209</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.199</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.4
</td>

<td style="text-align:center;">

100
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 197, 0, 255) !important;">0.171</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 137, 0, 255) !important;">0.175</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 137, 0, 255) !important;">0.175</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.185</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 153, 0, 255) !important;">0.174</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.166</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.4
</td>

<td style="text-align:center;">

250
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 233, 0, 255) !important;">0.110</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 198, 0, 255) !important;">0.111</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 198, 0, 255) !important;">0.111</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.119</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 168, 0, 255) !important;">0.113</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.109</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.4
</td>

<td style="text-align:center;">

500
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 241, 0, 255) !important;">0.081</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 232, 0, 255) !important;">0.081</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 232, 0, 255) !important;">0.081</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.088</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 143, 0, 255) !important;">0.084</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.080</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.4
</td>

<td style="text-align:center;">

750
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 246, 0, 255) !important;">0.064</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 242, 0, 255) !important;">0.064</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 242, 0, 255) !important;">0.064</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.072</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 142, 0, 255) !important;">0.067</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.064</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.4
</td>

<td style="text-align:center;">

1000
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 247, 0, 255) !important;">0.055</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 247, 0, 255) !important;">0.055</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 247, 0, 255) !important;">0.055</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.062</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 143, 0, 255) !important;">0.058</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.055</span>
</td>

</tr>

<tr grouplength="8">

<td colspan="8" style="ξ₀ = 0.6">

<strong></strong>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.6
</td>

<td style="text-align:center;">

25
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 99, 0, 255) !important;">0.431</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.458</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.458</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 154, 0, 255) !important;">0.416</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 134, 0, 255) !important;">0.422</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.389</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.6
</td>

<td style="text-align:center;">

50
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 129, 0, 255) !important;">0.288</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 84, 0, 255) !important;">0.293</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 84, 0, 255) !important;">0.293</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.303</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 65, 0, 255) !important;">0.295</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.273</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.6
</td>

<td style="text-align:center;">

75
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 197, 0, 255) !important;">0.230</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 174, 0, 255) !important;">0.234</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 174, 0, 255) !important;">0.234</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.257</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 92, 0, 255) !important;">0.244</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.223</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.6
</td>

<td style="text-align:center;">

100
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 218, 0, 255) !important;">0.194</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 197, 0, 255) !important;">0.197</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 197, 0, 255) !important;">0.197</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.220</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 102, 0, 255) !important;">0.208</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.190</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.6
</td>

<td style="text-align:center;">

250
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 245, 0, 255) !important;">0.117</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 234, 0, 255) !important;">0.118</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 234, 0, 255) !important;">0.118</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.135</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 127, 0, 255) !important;">0.125</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.116</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.6
</td>

<td style="text-align:center;">

500
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 251, 0, 255) !important;">0.081</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 243, 0, 255) !important;">0.082</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 243, 0, 255) !important;">0.082</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.093</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 148, 0, 255) !important;">0.086</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.081</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.6
</td>

<td style="text-align:center;">

750
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 248, 0, 255) !important;">0.067</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 244, 0, 255) !important;">0.067</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 244, 0, 255) !important;">0.067</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.074</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 166, 0, 255) !important;">0.069</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.066</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.6
</td>

<td style="text-align:center;">

1000
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 244, 0, 255) !important;">0.058</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 245, 0, 255) !important;">0.058</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 245, 0, 255) !important;">0.058</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.064</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 182, 0, 255) !important;">0.060</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.058</span>
</td>

</tr>

</tbody>

</table>

<table class="table" style="color: black; width: auto !important; margin-left: auto; margin-right: auto;">

<caption>

RMSE across methods (parameter: scale)
</caption>

<thead>

<tr>

<th style="text-align:center;">

ξ₀
</th>

<th style="text-align:center;">

n
</th>

<th style="text-align:center;">

LME
</th>

<th style="text-align:center;">

MLE1D
</th>

<th style="text-align:center;">

MLE2D
</th>

<th style="text-align:center;">

NLS2
</th>

<th style="text-align:center;">

WNLLSM
</th>

<th style="text-align:center;">

ZSE
</th>

</tr>

</thead>

<tbody>

<tr grouplength="8">

<td colspan="8" style="ξ₀ = -0.6">

<strong></strong>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.6
</td>

<td style="text-align:center;">

25
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 239, 0, 255) !important;">0.280</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.816</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 154, 0, 255) !important;">0.470</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 225, 0, 255) !important;">0.311</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 236, 0, 255) !important;">0.288</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.245</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.6
</td>

<td style="text-align:center;">

50
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 219, 0, 255) !important;">0.186</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.289</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 84, 0, 255) !important;">0.250</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 172, 0, 255) !important;">0.208</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 201, 0, 255) !important;">0.195</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.169</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.6
</td>

<td style="text-align:center;">

75
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 203, 0, 255) !important;">0.152</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.199</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 39, 0, 255) !important;">0.189</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 136, 0, 255) !important;">0.167</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 177, 0, 255) !important;">0.158</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.140</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.6
</td>

<td style="text-align:center;">

100
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 180, 0, 255) !important;">0.126</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 95, 0, 255) !important;">0.138</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.151</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 69, 0, 255) !important;">0.141</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 142, 0, 255) !important;">0.131</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.116</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.6
</td>

<td style="text-align:center;">

250
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 148, 0, 255) !important;">0.077</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 133, 0, 255) !important;">0.078</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 83, 0, 255) !important;">0.081</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.086</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 99, 0, 255) !important;">0.080</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.071</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.6
</td>

<td style="text-align:center;">

500
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 146, 0, 255) !important;">0.053</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 194, 0, 255) !important;">0.051</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 187, 0, 255) !important;">0.052</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.060</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 91, 0, 255) !important;">0.056</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.049</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.6
</td>

<td style="text-align:center;">

750
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 147, 0, 255) !important;">0.043</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 205, 0, 255) !important;">0.040</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 204, 0, 255) !important;">0.040</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.049</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 97, 0, 255) !important;">0.045</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.038</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.6
</td>

<td style="text-align:center;">

1000
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 154, 0, 255) !important;">0.037</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 213, 0, 255) !important;">0.035</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 213, 0, 255) !important;">0.035</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.043</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 106, 0, 255) !important;">0.039</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.034</span>
</td>

</tr>

<tr grouplength="8">

<td colspan="8" style="ξ₀ = -0.4">

<strong></strong>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.4
</td>

<td style="text-align:center;">

25
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 233, 0, 255) !important;">0.295</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.625</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 136, 0, 255) !important;">0.431</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 220, 0, 255) !important;">0.313</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 226, 0, 255) !important;">0.304</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.264</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.4
</td>

<td style="text-align:center;">

50
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 201, 0, 255) !important;">0.200</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 2, 0, 255) !important;">0.245</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.245</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 91, 0, 255) !important;">0.225</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 148, 0, 255) !important;">0.212</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.188</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.4
</td>

<td style="text-align:center;">

75
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 202, 0, 255) !important;">0.158</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 108, 0, 255) !important;">0.172</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.188</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 22, 0, 255) !important;">0.185</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 131, 0, 255) !important;">0.169</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.150</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.4
</td>

<td style="text-align:center;">

100
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 191, 0, 255) !important;">0.133</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 143, 0, 255) !important;">0.138</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 23, 0, 255) !important;">0.152</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.154</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 109, 0, 255) !important;">0.142</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.126</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.4
</td>

<td style="text-align:center;">

250
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 180, 0, 255) !important;">0.081</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 182, 0, 255) !important;">0.080</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 150, 0, 255) !important;">0.082</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.092</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 97, 0, 255) !important;">0.086</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.076</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.4
</td>

<td style="text-align:center;">

500
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 181, 0, 255) !important;">0.056</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 223, 0, 255) !important;">0.054</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 223, 0, 255) !important;">0.054</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.065</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 104, 0, 255) !important;">0.060</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.052</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.4
</td>

<td style="text-align:center;">

750
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 169, 0, 255) !important;">0.045</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 230, 0, 255) !important;">0.042</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 230, 0, 255) !important;">0.042</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.053</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 95, 0, 255) !important;">0.048</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.040</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.4
</td>

<td style="text-align:center;">

1000
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 159, 0, 255) !important;">0.038</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 228, 0, 255) !important;">0.036</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 228, 0, 255) !important;">0.036</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.045</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 86, 0, 255) !important;">0.041</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.035</span>
</td>

</tr>

<tr grouplength="8">

<td colspan="8" style="ξ₀ = -0.2">

<strong></strong>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.2
</td>

<td style="text-align:center;">

25
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 221, 0, 255) !important;">0.307</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.541</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 101, 0, 255) !important;">0.434</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 210, 0, 255) !important;">0.318</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 216, 0, 255) !important;">0.312</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.271</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.2
</td>

<td style="text-align:center;">

50
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 181, 0, 255) !important;">0.209</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.245</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.245</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 132, 0, 255) !important;">0.219</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 142, 0, 255) !important;">0.217</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.195</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.2
</td>

<td style="text-align:center;">

75
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 188, 0, 255) !important;">0.158</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 37, 0, 255) !important;">0.174</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.177</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 59, 0, 255) !important;">0.171</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 105, 0, 255) !important;">0.167</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.151</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.2
</td>

<td style="text-align:center;">

100
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 134, 0, 255) !important;">0.142</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 40, 0, 255) !important;">0.149</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.152</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.152</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 37, 0, 255) !important;">0.149</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.134</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.2
</td>

<td style="text-align:center;">

250
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 180, 0, 255) !important;">0.086</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 216, 0, 255) !important;">0.083</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 216, 0, 255) !important;">0.083</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.099</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 85, 0, 255) !important;">0.092</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.080</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.2
</td>

<td style="text-align:center;">

500
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 200, 0, 255) !important;">0.060</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 228, 0, 255) !important;">0.059</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 228, 0, 255) !important;">0.059</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.069</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 106, 0, 255) !important;">0.064</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.057</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.2
</td>

<td style="text-align:center;">

750
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 182, 0, 255) !important;">0.049</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 235, 0, 255) !important;">0.047</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 235, 0, 255) !important;">0.047</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.058</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 96, 0, 255) !important;">0.053</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.046</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

-0.2
</td>

<td style="text-align:center;">

1000
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 202, 0, 255) !important;">0.042</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 244, 0, 255) !important;">0.040</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 244, 0, 255) !important;">0.040</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.050</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 111, 0, 255) !important;">0.046</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.040</span>
</td>

</tr>

<tr grouplength="8">

<td colspan="8" style="ξ₀ = 0">

<strong></strong>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.0
</td>

<td style="text-align:center;">

25
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 205, 0, 255) !important;">0.350</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.563</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 94, 0, 255) !important;">0.465</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 212, 0, 255) !important;">0.342</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 201, 0, 255) !important;">0.354</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.298</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.0
</td>

<td style="text-align:center;">

50
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 99, 0, 255) !important;">0.222</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.236</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.236</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 34, 0, 255) !important;">0.232</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 45, 0, 255) !important;">0.230</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.200</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.0
</td>

<td style="text-align:center;">

75
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 149, 0, 255) !important;">0.173</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 85, 0, 255) !important;">0.179</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 85, 0, 255) !important;">0.179</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.188</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 56, 0, 255) !important;">0.182</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.162</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.0
</td>

<td style="text-align:center;">

100
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 173, 0, 255) !important;">0.153</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 130, 0, 255) !important;">0.157</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 131, 0, 255) !important;">0.157</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.168</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 70, 0, 255) !important;">0.162</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.145</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.0
</td>

<td style="text-align:center;">

250
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 201, 0, 255) !important;">0.095</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 204, 0, 255) !important;">0.095</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 204, 0, 255) !important;">0.095</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.108</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 101, 0, 255) !important;">0.102</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.092</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.0
</td>

<td style="text-align:center;">

500
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 208, 0, 255) !important;">0.065</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 217, 0, 255) !important;">0.065</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 218, 0, 255) !important;">0.065</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.075</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 122, 0, 255) !important;">0.069</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.063</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.0
</td>

<td style="text-align:center;">

750
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 207, 0, 255) !important;">0.054</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 229, 0, 255) !important;">0.053</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 229, 0, 255) !important;">0.053</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.063</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 120, 0, 255) !important;">0.058</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.052</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.0
</td>

<td style="text-align:center;">

1000
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 212, 0, 255) !important;">0.047</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 233, 0, 255) !important;">0.046</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 233, 0, 255) !important;">0.046</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.055</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 125, 0, 255) !important;">0.050</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.045</span>
</td>

</tr>

<tr grouplength="8">

<td colspan="8" style="ξ₀ = 0.2">

<strong></strong>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.2
</td>

<td style="text-align:center;">

25
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 175, 0, 255) !important;">0.370</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.475</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 59, 0, 255) !important;">0.439</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 215, 0, 255) !important;">0.347</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 199, 0, 255) !important;">0.356</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.323</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.2
</td>

<td style="text-align:center;">

50
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 153, 0, 255) !important;">0.244</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.268</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.268</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 134, 0, 255) !important;">0.247</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 157, 0, 255) !important;">0.243</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.228</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.2
</td>

<td style="text-align:center;">

75
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 149, 0, 255) !important;">0.197</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 26, 0, 255) !important;">0.209</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 26, 0, 255) !important;">0.209</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.211</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 88, 0, 255) !important;">0.203</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.187</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.2
</td>

<td style="text-align:center;">

100
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 169, 0, 255) !important;">0.170</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 126, 0, 255) !important;">0.175</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 126, 0, 255) !important;">0.175</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.188</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 89, 0, 255) !important;">0.179</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.161</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.2
</td>

<td style="text-align:center;">

250
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 220, 0, 255) !important;">0.096</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 232, 0, 255) !important;">0.095</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 232, 0, 255) !important;">0.095</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.116</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 110, 0, 255) !important;">0.106</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.093</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.2
</td>

<td style="text-align:center;">

500
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 226, 0, 255) !important;">0.067</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 241, 0, 255) !important;">0.066</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 241, 0, 255) !important;">0.066</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.082</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 118, 0, 255) !important;">0.074</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.065</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.2
</td>

<td style="text-align:center;">

750
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 222, 0, 255) !important;">0.058</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 242, 0, 255) !important;">0.056</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 242, 0, 255) !important;">0.056</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.069</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 115, 0, 255) !important;">0.063</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.056</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.2
</td>

<td style="text-align:center;">

1000
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 227, 0, 255) !important;">0.049</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 244, 0, 255) !important;">0.049</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 244, 0, 255) !important;">0.049</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.060</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 123, 0, 255) !important;">0.054</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.048</span>
</td>

</tr>

<tr grouplength="8">

<td colspan="8" style="ξ₀ = 0.4">

<strong></strong>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.4
</td>

<td style="text-align:center;">

25
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 135, 0, 255) !important;">0.414</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.481</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 22, 0, 255) !important;">0.470</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 202, 0, 255) !important;">0.380</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 181, 0, 255) !important;">0.391</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.354</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.4
</td>

<td style="text-align:center;">

50
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 117, 0, 255) !important;">0.272</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.288</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.288</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 115, 0, 255) !important;">0.273</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 177, 0, 255) !important;">0.264</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.254</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.4
</td>

<td style="text-align:center;">

75
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 133, 0, 255) !important;">0.208</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 54, 0, 255) !important;">0.215</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 54, 0, 255) !important;">0.215</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.219</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 118, 0, 255) !important;">0.210</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.199</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.4
</td>

<td style="text-align:center;">

100
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 179, 0, 255) !important;">0.172</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 113, 0, 255) !important;">0.177</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 113, 0, 255) !important;">0.177</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.185</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 153, 0, 255) !important;">0.174</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.166</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.4
</td>

<td style="text-align:center;">

250
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 241, 0, 255) !important;">0.110</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 207, 0, 255) !important;">0.111</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 207, 0, 255) !important;">0.111</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.120</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 171, 0, 255) !important;">0.113</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.109</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.4
</td>

<td style="text-align:center;">

500
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 244, 0, 255) !important;">0.080</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 235, 0, 255) !important;">0.081</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 235, 0, 255) !important;">0.081</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.088</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 146, 0, 255) !important;">0.084</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.080</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.4
</td>

<td style="text-align:center;">

750
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 246, 0, 255) !important;">0.064</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 241, 0, 255) !important;">0.064</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 241, 0, 255) !important;">0.064</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.071</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 143, 0, 255) !important;">0.067</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.064</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.4
</td>

<td style="text-align:center;">

1000
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 247, 0, 255) !important;">0.055</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 247, 0, 255) !important;">0.055</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 247, 0, 255) !important;">0.055</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.062</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 143, 0, 255) !important;">0.058</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.055</span>
</td>

</tr>

<tr grouplength="8">

<td colspan="8" style="ξ₀ = 0.6">

<strong></strong>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.6
</td>

<td style="text-align:center;">

25
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 87, 0, 255) !important;">0.446</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.475</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.475</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 176, 0, 255) !important;">0.416</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 159, 0, 255) !important;">0.422</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.389</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.6
</td>

<td style="text-align:center;">

50
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 85, 0, 255) !important;">0.293</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 38, 0, 255) !important;">0.298</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 38, 0, 255) !important;">0.298</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.302</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 61, 0, 255) !important;">0.295</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.273</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.6
</td>

<td style="text-align:center;">

75
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 180, 0, 255) !important;">0.233</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 157, 0, 255) !important;">0.236</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 157, 0, 255) !important;">0.236</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.256</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 90, 0, 255) !important;">0.244</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.223</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.6
</td>

<td style="text-align:center;">

100
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 206, 0, 255) !important;">0.196</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 186, 0, 255) !important;">0.198</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 186, 0, 255) !important;">0.198</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.220</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 99, 0, 255) !important;">0.208</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.190</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.6
</td>

<td style="text-align:center;">

250
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 239, 0, 255) !important;">0.117</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 228, 0, 255) !important;">0.118</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 228, 0, 255) !important;">0.118</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.135</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 126, 0, 255) !important;">0.125</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.116</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.6
</td>

<td style="text-align:center;">

500
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 245, 0, 255) !important;">0.082</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 237, 0, 255) !important;">0.082</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 237, 0, 255) !important;">0.082</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.093</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 147, 0, 255) !important;">0.086</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.081</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.6
</td>

<td style="text-align:center;">

750
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 245, 0, 255) !important;">0.067</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 241, 0, 255) !important;">0.067</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 241, 0, 255) !important;">0.067</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.074</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 166, 0, 255) !important;">0.069</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.066</span>
</td>

</tr>

<tr>

<td style="text-align:center;padding-left: 2em;" indentlevel="1">

0.6
</td>

<td style="text-align:center;">

1000
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 240, 0, 255) !important;">0.058</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 241, 0, 255) !important;">0.058</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 241, 0, 255) !important;">0.058</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 0, 0, 255) !important;">0.064</span>
</td>

<td style="text-align:center;">

<span style="     border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 182, 0, 255) !important;">0.060</span>
</td>

<td style="text-align:center;">

<span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(255, 255, 0, 255) !important;">0.058</span>
</td>

</tr>

</tbody>

</table>

## Files written

These files have been written to the target directory,
`data/02_unconstrained`:

    ## # A tibble: 448 × 4
    ##    path                                type         size modification_time  
    ##    <fs::path>                          <fct> <fs::bytes> <dttm>             
    ##  1 shape--0.2_n-1000_method-LME.RDS    file        8.97K 2025-10-27 17:05:34
    ##  2 shape--0.2_n-1000_method-MLE1D.RDS  file        8.98K 2025-10-27 17:05:34
    ##  3 shape--0.2_n-1000_method-MLE2D.RDS  file        8.96K 2025-10-27 17:05:34
    ##  4 shape--0.2_n-1000_method-MOM.RDS    file        8.95K 2025-10-27 17:05:34
    ##  5 shape--0.2_n-1000_method-NLS2.RDS   file        8.99K 2025-10-27 17:05:34
    ##  6 shape--0.2_n-1000_method-PWM.RDS    file        8.87K 2025-10-27 17:05:34
    ##  7 shape--0.2_n-1000_method-WNLLSM.RDS file        8.98K 2025-10-27 17:05:34
    ##  8 shape--0.2_n-1000_method-ZSE.RDS    file        8.96K 2025-10-27 17:05:35
    ##  9 shape--0.2_n-100_method-LME.RDS     file        9.02K 2025-10-27 17:05:35
    ## 10 shape--0.2_n-100_method-MLE1D.RDS   file        9.01K 2025-10-27 17:05:35
    ## # ℹ 438 more rows
