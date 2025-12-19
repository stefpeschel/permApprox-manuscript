Differential distribution analysis of single-cell gene expression using
`waddR` and `permApprox`
================
Compiled at 2025-12-19 10:58:13 UTC

``` r
here::i_am(paste0(params$name, ".Rmd"), uuid = "3f0a7f60-7a25-4421-89f9-e2d5fe4071a7")
```

## Description

Single-cell RNA sequencing (scRNA-seq) data often exhibit complex
distributional differences between experimental conditions. Standard
differential expression methods can miss these patterns, especially when
they involve changes in the shape or spread of the distribution, not
just the mean.

The `waddR` package provides a semi-parametric test based on the
2-Wasserstein distance, designed to detect such differences. However,
its permutation-based p-values can be inaccurate when the number of
permutations is limited, leading to zero p-values.

In this application study, we analyze a subset of the Vento-Tormo et
al. (2018) dataset to demonstrate how `permApprox` can be used to
accurately approximate small permutation p-values from the `waddR`
method, particularly addressing zero p-values and improving inference
robustness.

In `waddR`, the one-stage (OS) approach compares the complete
distributions between groups in a single step, using the squared
Wasserstein distance on all observed values, including zeros. In
contrast, the two-stage (TS) approach separates sparsity from magnitude
differences: in the first stage it tests for differences in the
proportion of zero values between groups, and in the second stage it
computes the Wasserstein distance only on the non-zero values. The
evidence from both stages is then combined into one permutation-based
p-value.

We concentrate on the two-stage (TS) approach here.

## Own waddR implementation

We needed to adapt the waddR package to export the permutation test
statistics.

## Data and Preprocessing

We analyze decidua and blood samples from a normalized replicate of the
Vento-Tormo dataset. The gene expression data are available as two
`SingleCellExperiment` objects.

We select the 1000 most prevalent genes for our analysis.

    ## Dimensions of blood counts:  19001 569

    ## 
    ## Dimensions of decidua counts:  19001 3249

To eliminate potential effects of different sample sizes, we subsample
from the data set with the larger number of samples (decidua) so that
both data sets have the same number of cells.

    ## [1] 1000  569

    ## [1] 1000  569

    ##            used  (Mb) gc trigger  (Mb)  max used  (Mb)
    ## Ncells  8312881 444.0   13458290 718.8  13239818 707.1
    ## Vcells 18777091 143.3  117892617 899.5 127426454 972.2

## Exploratory Analysis

We visualize selected genes to explore differences in expression
distributions between conditions.

### Heatmap

![](figures/01_sc_diff_distr/app_ddistr_sc_heatmap-1.png)<!-- -->

### Density plots

![](figures/01_sc_diff_distr/app_ddistr_sc_density_top6-1.png)<!-- -->

### Histograms

![](figures/01_sc_diff_distr/app_ddistr_sc_hist_top6-1.png)<!-- -->

### Quantile plot

    ## Warning: Using `size` aesthetic for lines was deprecated in ggplot2 3.4.0.
    ## ℹ Please use `linewidth` instead.
    ## This warning is displayed once every 8 hours.
    ## Call `lifecycle::last_lifecycle_warnings()` to see where this warning was generated.

![](figures/01_sc_diff_distr/app_ddistr_sc_quantf_top6-1.png)<!-- -->

## Differential Testing (two-stage approach)

### waddR - 1000 permutations

We apply the two-stage (`TS`) approach in `waddR`, which separately
tests for differences in non-zero expression values and in the
proportion of zero values.

    ## # A tibble: 10 × 23
    ##      idx gene   d.wass `d.wass^2` `d.comp^2` d.comp  location     size   shape   rho       pval p.ad.gpd N.exc gpd.shape perc.loc perc.size
    ##    <int> <chr>   <dbl>      <dbl>      <dbl>  <dbl>     <dbl>    <dbl>   <dbl> <dbl>      <dbl>    <dbl> <dbl>     <dbl>    <dbl>     <dbl>
    ##  1     1 B2M    0.524     0.274      0.274   0.524  0.268     0.000147 0.00655 0.966   0           0.332   250 -0.0403      97.6       0.05
    ##  2     2 TMSB4X 0.295     0.0872     0.0871  0.295  0.0842    0.000591 0.00232 0.991   0           0.508   250 -0.0251      96.7       0.68
    ##  3     3 MALAT1 0.713     0.509      0.509   0.713  0.323     0.132    0.0537  0.897   0           0.535   250 -0.114       63.4      26.0 
    ##  4     4 HLA-A  0.0808    0.00652    0.00655 0.0809 0.00382   0.000633 0.00209 0.992   0.00501     0.805   250  0.0320      58.4       9.67
    ##  5     5 ACTB   0.345     0.119      0.119   0.345  0.104     0.00938  0.00554 0.993   0           0.486   250  0.000437    87.5       7.87
    ##  6     6 RPS19  0.673     0.453      0.453   0.673  0.446     0.00233  0.00463 0.990 NaN           0.199   250 -0.0323      98.5       0.51
    ##  7     7 RPL10  0.142     0.0200     0.0200  0.142  0.0180    0.000733 0.00130 0.997   0.000889    0.947   250 -0.00776     89.8       3.66
    ##  8     8 RPL41  0.0560    0.00314    0.00322 0.0567 0.0000190 0.000497 0.00270 0.993   0.494      NA        NA NA            0.59     15.4 
    ##  9     9 RPS27  0.140     0.0197     0.0198  0.141  0.00457   0.0128   0.00240 0.995   0.00403     0.237   250  0.0248      23.0      64.8 
    ## 10    10 HLA-B  0.706     0.498      0.498   0.706  0.492     0.00289  0.00333 0.989   0           0.427   250 -0.0472      98.8       0.58
    ## # ℹ 7 more variables: perc.shape <dbl>, decomp.error <dbl>, p.zero <dbl>, p.combined <dbl>, p.adj.nonzero <dbl>, p.adj.zero <dbl>,
    ## #   p.adj.combined <dbl>

    ## Number of zero p-values with waddR:  328

    ## 
    ## Number of non-NA p-values:  987

    ## 
    ## Proportion of zero p-values with waddR:  0.3323202

    ## 
    ## Number of significant tests (unadjusted):  959

    ## 
    ## Proportion of significant tests (unadjusted):  0.9716312

    ## 
    ## Number of significant tests (adjusted):  959

    ## 
    ## Proportion of significant tests (adjusted):  0.9716312

### waddR - 10000 permutations

We repeat the waddR run with 10000 permutations to compare the accuracy
with the 1000 permuations later.

    ## Number of zero p-values with waddR:  392

    ## 
    ## Number of non-NA p-values:  984

    ## 
    ## Proportion of zero p-values with waddR:  0.398374

    ## 
    ## Number of significant tests (unadjusted):  956

    ## 
    ## Proportion of significant tests (unadjusted):  0.9715447

    ## 
    ## Number of significant tests (adjusted):  956

    ## 
    ## Proportion of significant tests (adjusted):  0.9715447

### waddR - 50000 permutations

We repeat the waddR run with 50000 permutations to compare the accuracy
with the 1000 permuations later.

    ## Number of zero p-values with waddR:  399

    ## 
    ## Number of non-NA p-values:  982

    ## 
    ## Proportion of zero p-values with waddR:  0.4063136

    ## 
    ## Number of significant tests (unadjusted):  955

    ## 
    ## Proportion of significant tests (unadjusted):  0.9725051

    ## 
    ## Number of significant tests (adjusted):  955

    ## 
    ## Proportion of significant tests (adjusted):  0.9725051

### waddR - 100000 permutations

We repeat the waddR run with 100000 permutations to compare the accuracy
with the 1000 permuations later.

    ## Number of zero p-values with waddR:  440

    ## 
    ## Number of non-NA p-values:  985

    ## 
    ## Proportion of zero p-values with waddR:  0.4467005

    ## 
    ## Number of significant tests (unadjusted):  958

    ## 
    ## Proportion of significant tests (unadjusted):  0.9725888

    ## 
    ## Number of significant tests (adjusted):  958

    ## 
    ## Proportion of significant tests (adjusted):  0.9725888

### Empirical p-values

### permApprox - unconstrained

### permApprox - constrained

We use the `permApprox` package to approximate p-values from permutation
distributions of `waddR` test statistics.

## Combine results

## Plots

### P-values (waddR vs. permApprox)

#### B = 1000

    ## Warning: Duplicated `override.aes` is ignored.

    ## Warning: Removed 21 rows containing missing values or values outside the scale range (`geom_point()`).

![](figures/01_sc_diff_distr/app_ddistr_sc_pvals_vs_dw2_wad_pau_pac_1k-1.png)<!-- -->

    ## Warning: Duplicated `override.aes` is ignored.

    ## Warning: Removed 21 rows containing missing values or values outside the scale range (`geom_point()`).

![](figures/01_sc_diff_distr/app_ddistr_sc_pvals_vs_dw2_wad_pau_pac_1k_ann-1.png)<!-- -->

<table class="table" style="color: black; width: auto !important; ">

<caption>

Counts for B = 1k
</caption>

<thead>

<tr>

<th style="text-align:left;">

method
</th>

<th style="text-align:right;">

n_tests
</th>

<th style="text-align:right;">

n_zero
</th>

<th style="text-align:right;">

α = 0.05
</th>

<th style="text-align:right;">

α = 0.01
</th>

<th style="text-align:right;">

α = 0.001
</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;">

waddR (B = 1k)
</td>

<td style="text-align:right;">

987
</td>

<td style="text-align:right;">

328
</td>

<td style="text-align:right;">

959
</td>

<td style="text-align:right;">

940
</td>

<td style="text-align:right;">

915
</td>

</tr>

<tr>

<td style="text-align:left;">

waddR + permApprox(U) (B = 1k)
</td>

<td style="text-align:right;">

996
</td>

<td style="text-align:right;">

197
</td>

<td style="text-align:right;">

967
</td>

<td style="text-align:right;">

949
</td>

<td style="text-align:right;">

923
</td>

</tr>

<tr>

<td style="text-align:left;">

waddR + permApprox(C) (B = 1k)
</td>

<td style="text-align:right;">

996
</td>

<td style="text-align:right;">

0
</td>

<td style="text-align:right;">

967
</td>

<td style="text-align:right;">

949
</td>

<td style="text-align:right;">

922
</td>

</tr>

</tbody>

</table>

#### B = 10000

    ## Warning: Duplicated `override.aes` is ignored.

    ## Warning: Removed 24 rows containing missing values or values outside the scale range (`geom_point()`).

    ## Warning: Removed 1 row containing missing values or values outside the scale range (`geom_point()`).

![](figures/01_sc_diff_distr/app_ddistr_sc_pvals_vs_dw2_wad_pau_pac_10k-1.png)<!-- -->

<table class="table" style="color: black; width: auto !important; ">

<caption>

Counts for B = 10k
</caption>

<thead>

<tr>

<th style="text-align:left;">

method
</th>

<th style="text-align:right;">

n_tests
</th>

<th style="text-align:right;">

n_zero
</th>

<th style="text-align:right;">

α = 0.05
</th>

<th style="text-align:right;">

α = 0.01
</th>

<th style="text-align:right;">

α = 0.001
</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;">

waddR (B = 10k)
</td>

<td style="text-align:right;">

984
</td>

<td style="text-align:right;">

392
</td>

<td style="text-align:right;">

956
</td>

<td style="text-align:right;">

937
</td>

<td style="text-align:right;">

914
</td>

</tr>

<tr>

<td style="text-align:left;">

waddR + permApprox(U) (B = 10k)
</td>

<td style="text-align:right;">

996
</td>

<td style="text-align:right;">

10
</td>

<td style="text-align:right;">

969
</td>

<td style="text-align:right;">

949
</td>

<td style="text-align:right;">

923
</td>

</tr>

<tr>

<td style="text-align:left;">

waddR + permApprox(C) (B = 10k)
</td>

<td style="text-align:right;">

996
</td>

<td style="text-align:right;">

0
</td>

<td style="text-align:right;">

969
</td>

<td style="text-align:right;">

949
</td>

<td style="text-align:right;">

923
</td>

</tr>

</tbody>

</table>

### P-values with annotations

    ## Warning: Removed 13 rows containing missing values or values outside the scale range (`geom_point()`).

    ## Warning: Removed 4 rows containing missing values or values outside the scale range (`geom_point()`).
    ## Removed 4 rows containing missing values or values outside the scale range (`geom_point()`).

![](figures/01_sc_diff_distr/app_ddistr_sc_pvals_vs_dw2_ts_wad_pac_1k-1.png)<!-- -->

### P-values vs. ranked tests

#### 1,000 vs. 10,000 permutations

    ## Warning: Removed 84 rows containing missing values or values outside the scale range (`geom_point()`).

    ## Warning: Removed 57 rows containing missing values or values outside the scale range (`geom_point()`).

![](figures/01_sc_diff_distr/app_ddistr_sc_pvals_vs_idx_emp_wad1k_wad10k_all-1.png)<!-- -->

Since the Empirical p-values with B = 100k are constant from approx
index 130 on, we plot only up to this test in the following.

    ## Warning: Removed 72 rows containing missing values or values outside the scale range (`geom_point()`).

    ## Warning: Removed 48 rows containing missing values or values outside the scale range (`geom_point()`).

![](figures/01_sc_diff_distr/app_ddistr_sc_pvals_vs_idx_emp_wad1k_wad10k-1.png)<!-- -->

    ## Warning: Removed 10 rows containing missing values or values outside the scale range (`geom_point()`).

    ## Warning: Removed 11 rows containing missing values or values outside the scale range (`geom_point()`).

![](figures/01_sc_diff_distr/app_ddistr_sc_pvals_vs_idx_emp_pau1k_pau10k_all-1.png)<!-- -->

    ## Warning: Removed 10 rows containing missing values or values outside the scale range (`geom_point()`).

    ## Warning: Removed 11 rows containing missing values or values outside the scale range (`geom_point()`).

![](figures/01_sc_diff_distr/app_ddistr_sc_pvals_vs_idx_emp_pau1k_pau10k-1.png)<!-- -->

    ## Warning: Removed 14 rows containing missing values or values outside the scale range (`geom_point()`).

    ## Warning: Removed 20 rows containing missing values or values outside the scale range (`geom_point()`).

![](figures/01_sc_diff_distr/app_ddistr_sc_pvals_vs_idx_emp_pac1k_pac10k_all-1.png)<!-- -->

    ## Warning: Removed 10 rows containing missing values or values outside the scale range (`geom_point()`).

    ## Warning: Removed 11 rows containing missing values or values outside the scale range (`geom_point()`).

![](figures/01_sc_diff_distr/app_ddistr_sc_pvals_vs_idx_emp_pac1k_pac10k-1.png)<!-- -->

#### waddR vs. permApprox (B = 1,000)

    ## Warning: Removed 48 rows containing missing values or values outside the scale range (`geom_point()`).

    ## Warning: Removed 11 rows containing missing values or values outside the scale range (`geom_point()`).
    ## Removed 11 rows containing missing values or values outside the scale range (`geom_point()`).

![](figures/01_sc_diff_distr/app_ddistr_sc_pvals_vs_idx_wad_pau_pac_1k-1.png)<!-- -->

#### waddR vs. permApprox (B = 10,000)

    ## Warning: Removed 72 rows containing missing values or values outside the scale range (`geom_point()`).

    ## Warning: Removed 10 rows containing missing values or values outside the scale range (`geom_point()`).
    ## Removed 10 rows containing missing values or values outside the scale range (`geom_point()`).

![](figures/01_sc_diff_distr/app_ddistr_sc_pvals_vs_idx_wad_pau_pac_10k-1.png)<!-- -->

### Ratio of p-values (vs. empirical with B = 100k)

#### 1,000 vs. 10,000 permutations

    ## Warning: Removed 72 rows containing missing values or values outside the scale range (`geom_point()`).

    ## Warning: Removed 48 rows containing missing values or values outside the scale range (`geom_point()`).

![](figures/01_sc_diff_distr/app_ddistr_sc_ratios_vs_idx_emp_wad1k_wad10k-1.png)<!-- -->

    ## Warning: Removed 10 rows containing missing values or values outside the scale range (`geom_point()`).

    ## Warning: Removed 11 rows containing missing values or values outside the scale range (`geom_point()`).

![](figures/01_sc_diff_distr/app_ddistr_sc_ratios_vs_idx_emp_pau1k_pau10k-1.png)<!-- -->

    ## Warning: Removed 10 rows containing missing values or values outside the scale range (`geom_point()`).

    ## Warning: Removed 11 rows containing missing values or values outside the scale range (`geom_point()`).

![](figures/01_sc_diff_distr/app_ddistr_sc_ratios_vs_idx_emp_pac1k_pac10k-1.png)<!-- -->

#### waddR vs. permApprox (B = 1,000)

    ## Warning: Removed 48 rows containing missing values or values outside the scale range (`geom_point()`).

    ## Warning: Removed 11 rows containing missing values or values outside the scale range (`geom_point()`).
    ## Removed 11 rows containing missing values or values outside the scale range (`geom_point()`).

![](figures/01_sc_diff_distr/app_ddistr_sc_ratios_vs_idx_wad_pau_pac_1k-1.png)<!-- -->

#### waddR vs. permApprox (B = 10,000)

    ## Warning: Removed 72 rows containing missing values or values outside the scale range (`geom_point()`).

    ## Warning: Removed 10 rows containing missing values or values outside the scale range (`geom_point()`).
    ## Removed 10 rows containing missing values or values outside the scale range (`geom_point()`).

![](figures/01_sc_diff_distr/app_ddistr_sc_ratios_vs_idx_wad_pau_pac_10k-1.png)<!-- -->

## P-values vs. ordered test statistics

![](figures/01_sc_diff_distr/app_ddistr_sc_pvals_vs_odw2_wad_pau_pac_10k-1.png)<!-- -->

![](figures/01_sc_diff_distr/app_ddistr_sc_unnamed-chunk-42-1.png)<!-- -->

## Visualization of genes

### Genes with waddR p = 0

| idx | gene | d.wass | d.wass^2 | d.comp^2 | d.comp | location | size | shape.waddR | rho | p.waddR | p.ad.gpd | N.exc | gpd.shape | perc.loc | perc.size | perc.shape | decomp.error | p.zero | p.combined | p.adj.nonzero | p.adj.zero | p.adj.combined | p.pApp.unconstr | shape.pApp.unconstr | p.pApp.constr | shape.pApp.constr |
|---:|:---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| 10 | HLA-B | 0.7059154 | 0.4983166 | 0.4984233 | 0.7059910 | 0.4922076 | 0.0028883 | 0.0033274 | 0.9890469 | 0 | 0.4272298 | 250 | -0.0471959 | 98.75 | 0.58 | 0.67 | 0.0002142 | 0.4488946 | 0 | 0 | 0.5235351 | 0 | 0 | -0.0179395 | 0 | -0.0033413 |
| 667 | TXNIP | 1.4583349 | 2.1267408 | 2.1265256 | 1.4582611 | 2.0930685 | 0.0118570 | 0.0216000 | 0.9612357 | 0 | 0.6694438 | 250 | -0.0312136 | 98.43 | 0.56 | 1.02 | 0.0001012 | 0.0000000 | 0 | 0 | 0.0000000 | 0 | 0 | -0.0285427 | 0 | -0.0041115 |
| 1 | B2M | 0.5236419 | 0.2742008 | 0.2744338 | 0.5238643 | 0.2677384 | 0.0001470 | 0.0065484 | 0.9657035 | 0 | 0.3321214 | 250 | -0.0403112 | 97.56 | 0.05 | 2.39 | 0.0008497 | NA | 0 | 0 | NA | 0 | 0 | -0.0723810 | 0 | -0.0042987 |
| 127 | GSTP1 | 0.7819993 | 0.6115229 | 0.6115654 | 0.7820264 | 0.5491258 | 0.0378275 | 0.0246120 | 0.9575007 | 0 | 0.9678317 | 250 | -0.0068447 | 89.79 | 6.19 | 4.02 | 0.0000694 | 0.0000000 | 0 | 0 | 0.0000000 | 0 | 0 | -0.0061192 | 0 | -0.0053421 |
| 148 | FOS | 1.2425410 | 1.5439082 | 1.5441966 | 1.2426571 | 1.2078147 | 0.2935138 | 0.0428681 | 0.9522921 | 0 | 0.1646854 | 250 | -0.0937740 | 78.22 | 19.01 | 2.78 | 0.0001867 | 0.0000000 | 0 | 0 | 0.0000000 | 0 | 0 | -0.0924760 | 0 | -0.0056029 |
| 85 | CCL4 | 1.1393340 | 1.2980819 | 1.2981195 | 1.1393505 | 1.1734127 | 0.0964646 | 0.0282422 | 0.9818417 | 0 | 0.3945084 | 140 | -0.1700500 | 90.39 | 7.43 | 2.18 | 0.0000289 | 0.0000031 | 0 | 0 | 0.0000112 | 0 | 0 | -0.1693666 | 0 | -0.0062480 |

#### Expression densities

![](figures/01_sc_diff_distr/app_ddistr_sc_zero_pvals_density_ts-1.png)<!-- -->

#### Histograms

![](figures/01_sc_diff_distr/app_ddistr_sc_zero_pvals_hist_ts-1.png)<!-- -->

#### Quantile plots

    ## Warning in scale_y_log10(): log-10 transformation introduced infinite values.

![](figures/01_sc_diff_distr/app_ddistr_sc_zero_pvals_quant_ts-1.png)<!-- -->

#### Permutation histograms (B = 1000)

![](figures/01_sc_diff_distr/app_ddistr_sc_zero_pvals_perm_dist_ts-1.png)<!-- -->

### Further significant genes (TS, B = 1000)

Now the “top non-zero” genes, ordered by constrained permApprox
p-values.

#### Expression densities

![](figures/01_sc_diff_distr/app_ddistr_sc_sig_pvals_density_ts-1.png)<!-- -->

#### Histograms

![](figures/01_sc_diff_distr/app_ddistr_sc_sig_pvals_hist_ts-1.png)<!-- -->

#### Quantile plots

    ## Warning in scale_y_log10(): log-10 transformation introduced infinite values.

![](figures/01_sc_diff_distr/app_ddistr_sc_sig_pvals_quant_ts-1.png)<!-- -->

#### Permutation histograms (TS, significant genes)

![](figures/01_sc_diff_distr/app_ddistr_sc_sig_pvals_perm_dist_ts-1.png)<!-- -->

### Top significant genes

![](figures/01_sc_diff_distr/app_ddistr_sc_zero_top4_hist_ecdf_ts-1.png)<!-- -->

## LaTeX tables for TS (B = 1000)

### Top genes (raw p-values)

### Top genes (BH-adjusted p-values)

## Summary

This application study demonstrates the benefit of applying `permApprox`
to improve the robustness of p-value estimation in permutation-based
differential tests. Especially for extreme test statistics, `permApprox`
avoids zero p-values and thus enables more accurate and reproducible
results.

## References

- Vento-Tormo,R. et al. (2018) Reconstructing the human ﬁrst trimester
  fetal– maternal interface using single cell transcriptomics. Nature,
  563, 347–353.

## Files written

These files have been written to the target directory,
`data/01_sc_diff_distr`:

    ## # A tibble: 17 × 4
    ##    path                                            type         size modification_time  
    ##    <fs::path>                                      <fct> <fs::bytes> <dttm>             
    ##  1 permapprox_results_ts_constr_10k.rds            file       17.67M 2025-12-02 21:04:47
    ##  2 permapprox_results_ts_constr_1k.rds             file        1.81M 2025-12-02 20:17:56
    ##  3 permapprox_results_ts_emp_100k.rds              file        4.17K 2025-12-01 08:56:41
    ##  4 permapprox_results_ts_emp_10k.rds               file        3.38K 2025-12-01 08:56:41
    ##  5 permapprox_results_ts_emp_1k.rds                file        2.56K 2025-12-01 08:56:41
    ##  6 permapprox_results_ts_emp_50k.rds               file        3.96K 2025-12-01 08:56:41
    ##  7 permapprox_results_ts_unconstr_10k.rds          file       17.72M 2025-12-02 21:01:47
    ##  8 permapprox_results_ts_unconstr_1k.rds           file        1.81M 2025-12-02 20:16:11
    ##  9 permApprox_waddr_TS_top_effects_BH_sc_table.tex file        3.73K 2025-12-19 11:00:29
    ## 10 permApprox_waddr_TS_top_effects_sc_table.tex    file        3.68K 2025-12-19 11:00:29
    ## 11 waddr_results_os.rds                            file        7.32M 2025-07-22 13:20:56
    ## 12 waddr_results_os_same_n.rds                     file        7.32M 2025-07-22 14:29:32
    ## 13 waddr_results_ts.rds                            file        7.32M 2025-07-22 10:12:12
    ## 14 waddr_results_ts_1000.rds                       file        7.32M 2025-09-01 09:36:28
    ## 15 waddr_results_ts_10000.rds                      file       71.96M 2025-09-01 10:07:57
    ## 16 waddr_results_ts_100000.rds                     file      718.32M 2025-09-02 13:48:57
    ## 17 waddr_results_ts_50000.rds                      file      359.23M 2025-09-02 09:45:27
