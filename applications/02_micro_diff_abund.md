Differential abundance analysis with `dacomp` - EBF vs non-EBF
================
Compiled at 2026-02-04 15:31:33 UTC

This notebook demonstrates how to perform **differential abundance
analysis** of microbiome count data using the **`dacomp`** package.

We use genus-level profiles from the **PASTURE** cohort (2-month
samples). After basic prevalence filtering and defining two comparison
groups (here, breastfeeding categories), we visualize the data
(heatmaps, densities, histograms, ECDFs) and then apply **dacomp**:

1.  **Select a stable reference set of non-DA taxa**,  
2.  **Test all remaining taxa for differential abundance** using a
    Wilcoxon-based two-sample test with permutation p-values and DS-FDR
    correction.

The example uses the **raw count data** for inference (as required by
dacomp), while relative abundances are used only for visualization.

In this notebook, we compare two breast feeding groups: ‘EBF’ (exclusive
breast feeding until age 2 months) vs. ‘non-EBF’.

## Global options and packages

## Load data & set parameters

    ## phyloseq-class experiment-level object
    ## otu_table()   OTU Table:         [ 367 taxa and 740 samples ]
    ## sample_data() Sample Data:       [ 740 samples by 517 sample variables ]
    ## tax_table()   Taxonomy Table:    [ 367 taxa by 7 taxonomic ranks ]

## Data preprocessing

### Taxa prevalence (including zero counts)

![](figures/02_micro_diff_abund/app_dacomp_expl_prevalence_hist-1.png)<!-- -->

### Prevalence threshold

![](figures/02_micro_diff_abund/app_dacomp_expl_prevalence_hist_filter-1.png)<!-- -->

### Taxa filtering

We keep only taxa with a non-zero count in at least 1% of the samples.

    ## phyloseq-class experiment-level object
    ## otu_table()   OTU Table:         [ 118 taxa and 740 samples ]
    ## sample_data() Sample Data:       [ 740 samples by 517 sample variables ]
    ## tax_table()   Taxonomy Table:    [ 118 taxa by 7 taxonomic ranks ]

### Define comparison groups

    ## breast_excl_cat1:

    ## 
    ##   0   1 >=2 
    ## 212   3 485

    ## 
    ## New variable:

    ## 
    ##     EBF non-EBF 
    ##     485     212

![](figures/02_micro_diff_abund/app_dacomp_expl_group_sizes-1.png)<!-- -->

    ## Samples in group 1: 212

    ## Samples in group 2: 485

### Relative abundance transformation

## Data exploration

### Library sizes

![](figures/02_micro_diff_abund/app_dacomp_expl_library_sizes-1.png)<!-- -->

### Prevalence vs mean relative abundance

![](figures/02_micro_diff_abund/app_dacomp_expl_prev_mean_scatter-1.png)<!-- -->

### Alpha diversity

    ##    sample Observed   Shannon InvSimpson GiniSimpson   group
    ## 1 s025647       38 1.7827696   4.011017   0.7506867 non-EBF
    ## 2 s023779       28 0.6113565   1.274869   0.2156056 non-EBF
    ## 3 s026625       26 0.3563376   1.126464   0.1122662 non-EBF
    ## 4 s022898       21 0.5109628   1.308248   0.2356186     EBF
    ## 5 s022897       25 0.4977167   1.210089   0.1736147     EBF
    ## 6 s028386       22 1.2379658   2.541923   0.6065971     EBF

#### Richness (Observed genera)

![](figures/02_micro_diff_abund/app_dacomp_expl_alpha_richness-1.png)<!-- -->

#### Shannon diversity

![](figures/02_micro_diff_abund/app_dacomp_expl_alpha_shannon-1.png)<!-- -->

#### Gini–Simpson index

![](figures/02_micro_diff_abund/app_dacomp_expl_alpha_gini_simpson-1.png)<!-- -->

#### Alpha diversity combined

![](figures/02_micro_diff_abund/app_dacomp_expl_alpha_diversity-1.png)<!-- -->

### Heatmap

![](figures/02_micro_diff_abund/app_dacomp_heatmap_top20_unclust-1.png)<!-- -->

![](figures/02_micro_diff_abund/app_dacomp_heatmap_top20_clust-1.png)<!-- -->

### Mean composition - Phylum level

![](figures/02_micro_diff_abund/app_dacomp_expl_mean_composition_phylum-1.png)<!-- -->

Firmucutes are increased in non-EBF, which is in line with other
studies.

### Mean composition - Genus level

![](figures/02_micro_diff_abund/app_dacomp_expl_mean_composition_genus-1.png)<!-- -->

## dacomp - Differential abundance analysis

### Build count matrix and phenotype vector

    ## [1] 697 118

    ## y_groups
    ## non-EBF     EBF 
    ##     212     485

### Select reference taxa

    ## DACOMP reference selection object 
    ## Thereshold for selecting reference taxa: 0
    ## For dacomp.select_references(), threshold given in units of medianSD score 
    ## Nr. Selected references: 93
    ## Minimal number of counts observed in reference taxa (across subjects): 68
    ## 

    ## [1] 93

    ## Reference taxa:

    ##  [1] "Blastococcus"                        "Stenotrophomonas"                    "Porphyromonas"                      
    ##  [4] "Family_XIII_AD3011_group"            "Anaeroglobus"                        "Lachnoanaerobaculum"                
    ##  [7] "Christensenellaceae_R-7_group"       "Fenollaria"                          "Megamonas"                          
    ## [10] "Pseudomonas"                         "Lachnospiraceae_ND3007_group"        "8_Comamonadaceae(F)"                
    ## [13] "Brevundimonas"                       "Lachnospira"                         "Halomonas"                          
    ## [16] "[Eubacterium]_coprostanoligenegroup" "Monoglobus"                          "Lawsonella"                         
    ## [19] "Peptostreptococcus"                  "Solobacterium"                       "Sarcina"                            
    ## [22] "Clostridia_UCG-014"                  "9_Pasteurellaceae(F)"                "Ruminococcus"                       
    ## [25] "Coprococcus"                         "Turicibacter"                        "Clostridium_sensu_strict18"         
    ## [28] "21_Bifidobacteriaceae(F)"            "Morganella"                          "Lachnospiraceae_NK4A136_group"      
    ## [31] "Actinotignum"                        "Paeniclostridium"                    "Phascolarctobacterium"              
    ## [34] "Dermabacter"                         "Coprobacillus"                       "Acinetobacter"                      
    ## [37] "Slackia"                             "Cutibacterium"                       "Coprobacter"                        
    ## [40] "Faecalicoccus"                       "Fusobacterium"                       "Delftia"                            
    ## [43] "Butyricicoccus"                      "Leuconostoc"                         "[Eubacterium]_eligengroup"          
    ## [46] "Scardovia"                           "[Ruminococcus]_gauvreauii_group"     "Dolosigranulum"                     
    ## [49] "Olsenella"                           "Megasphaera"                         "Faecalitalea"                       
    ## [52] "Epulopiscium"                        "Gordonibacter"                       "Granulicatella"                     
    ## [55] "Sutterella"                          "Libanicoccus"                        "Negativicoccus"                     
    ## [58] "Finegoldia"                          "[Eubacterium]_hallii_group"          "Anaerococcus"                       
    ## [61] "Incertae_Sedis"                      "Proteus"                             "Prevotella"                         
    ## [64] "Bilophila"                           "Atopobium"                           "uncultured18"                       
    ## [67] "Hungatella"                          "UBA1819"                             "Dialister"                          
    ## [70] "Alistipes"                           "Eubacterium"                         "Roseburia"                          
    ## [73] "CAG-352"                             "Peptoniphilus"                       "Holdemanella"                       
    ## [76] "Sellimonas"                          "Flavonifractor"                      "Subdoligranulum"                    
    ## [79] "Terrisporobacter"                    "Dorea"                               "Corynebacterium"                    
    ## [82] "22_Lachnospiraceae(F)"               "Erysipelotrichaceae_UCG-003"         "Blautia"                            
    ## [85] "Tyzzerella"                          "Clostridioides"                      "Senegalimassilia"                   
    ## [88] "[Ruminococcus]_torquegroup"          "Akkermansia"                         "Anaerostipes"                       
    ## [91] "Varibaculum"                         "Agathobacter"                        "Bifidobacterium"

![](figures/02_micro_diff_abund/app_dacomp_dacomp_select_refs-1.png)<!-- -->

Of the 118 taxa, 93 are selected as reference.

![](figures/02_micro_diff_abund/app_dacomp_dacmp_prev_var_plot-1.png)<!-- -->

![](figures/02_micro_diff_abund/app_dacomp_dacomp_prev_var_with_refs-1.png)<!-- -->

![](figures/02_micro_diff_abund/app_dacomp_dacomp_prev_vs_score-1.png)<!-- -->

### Run dacomp test (runtime comparison)

    ## List of 5
    ##  $ 1000 :List of 8
    ##   ..- attr(*, "class")= chr "dacomp.result.object"
    ##  $ 10000:List of 8
    ##   ..- attr(*, "class")= chr "dacomp.result.object"
    ##  $ 1e+05:List of 8
    ##   ..- attr(*, "class")= chr "dacomp.result.object"
    ##  $ 1e+06:List of 8
    ##   ..- attr(*, "class")= chr "dacomp.result.object"
    ##  $ 1e+07:List of 8
    ##   ..- attr(*, "class")= chr "dacomp.result.object"

    ## # A tibble: 5 × 3
    ##    nr_perm  elapsed  seed
    ##      <dbl>    <dbl> <dbl>
    ## 1     1000     1.84    42
    ## 2    10000    16.6     42
    ## 3   100000   151.      42
    ## 4  1000000  1650.      42
    ## 5 10000000 16984.      42

### Extrapolate runtime

    ## 
    ## Call:
    ## lm(formula = elapsed ~ nr_perm, data = runtime_tbl)
    ## 
    ## Residuals:
    ##       1       2       3       4       5 
    ##  16.534  15.963  -2.844 -32.959   3.307 
    ## 
    ## Coefficients:
    ##               Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept) -1.640e+01  1.201e+01  -1.366    0.265    
    ## nr_perm      1.700e-03  2.671e-06 636.356 8.56e-09 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 23.33 on 3 degrees of freedom
    ## Multiple R-squared:      1,  Adjusted R-squared:      1 
    ## F-statistic: 4.049e+05 on 1 and 3 DF,  p-value: 8.558e-09

    ## # A tibble: 5 × 5
    ##     n_perm source   elapsed_sec elapsed_min elapsed_h
    ##      <dbl> <chr>          <dbl>       <dbl>     <dbl>
    ## 1     1000 observed        1.84       0.031     0.001
    ## 2    10000 observed       16.6        0.276     0.005
    ## 3   100000 observed      151.         2.51      0.042
    ## 4  1000000 observed     1650.        27.5       0.458
    ## 5 10000000 observed    16984.       283.        4.72

![](figures/02_micro_diff_abund/app_dacomp_runtime-1.png)<!-- -->

## permApprox

We recompute the dacomp p-values with permApprox for 1e03 and 1e04
permutations.

For 1e04 (10000) permutations, we consider two cases: exceed0 = 250 and
exceed0 = 0.25.

## Compute log2 fold-changes

## Build one combined tibble

    ## # A tibble: 10 × 6
    ##    panel_method   n_perm constraint    exceed0 setting                        n
    ##    <chr>           <dbl> <chr>           <dbl> <chr>                      <int>
    ##  1 dacomp           1000 <NA>            NA    <NA>                         118
    ##  2 dacomp          10000 <NA>            NA    <NA>                         118
    ##  3 dacomp         100000 <NA>            NA    <NA>                         118
    ##  4 dacomp        1000000 <NA>            NA    <NA>                         118
    ##  5 dacomp       10000000 <NA>            NA    <NA>                         118
    ##  6 permApprox       1000 slls           250    SLLS, exceed0=250            118
    ##  7 permApprox       1000 unconstrained  250    unconstrained, exceed0=250   118
    ##  8 permApprox      10000 slls             0.25 SLLS, exceed0=0.25           118
    ##  9 permApprox      10000 slls           250    SLLS, exceed0=250            118
    ## 10 permApprox      10000 unconstrained  250    unconstrained, exceed0=250   118

## Significant taxa

### Adjusted

<table class="table table-striped table-hover" style="color: black; width: auto !important; margin-left: auto; margin-right: auto;">

<caption>

Adjusted p-values across methods and permutation settings
</caption>

<thead>

<tr>

<th style="text-align:left;">

taxon
</th>

<th style="text-align:left;">

dacomp (1e+03)
</th>

<th style="text-align:left;">

dacomp (1e+04)
</th>

<th style="text-align:left;">

dacomp (1e+05)
</th>

<th style="text-align:left;">

dacomp (1e+06)
</th>

<th style="text-align:left;">

dacomp (1e+07)
</th>

<th style="text-align:left;">

permApprox (1e+03, unconstrained, exceed0=250)
</th>

<th style="text-align:left;">

permApprox (1e+03, SLLS, exceed0=250)
</th>

<th style="text-align:left;">

permApprox (1e+04, unconstrained, exceed0=250)
</th>

<th style="text-align:left;">

permApprox (1e+04, SLLS, exceed0=250)
</th>

<th style="text-align:left;">

permApprox (1e+04, SLLS, exceed0=0.25)
</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;">

Intestinibacter
</td>

<td style="text-align:left;">

5.30e-03
</td>

<td style="text-align:left;">

8.43e-04
</td>

<td style="text-align:left;">

8.50e-05
</td>

<td style="text-align:left;">

9.60e-06
</td>

<td style="text-align:left;">

1.47e-06
</td>

<td style="text-align:left;">

1.05e-16
</td>

<td style="text-align:left;">

2.10e-16
</td>

<td style="text-align:left;">

2.28e-06
</td>

<td style="text-align:left;">

2.28e-06
</td>

<td style="text-align:left;">

5.25e-07
</td>

</tr>

<tr>

<td style="text-align:left;">

Enterococcus
</td>

<td style="text-align:left;">

5.30e-03
</td>

<td style="text-align:left;">

8.43e-04
</td>

<td style="text-align:left;">

8.50e-05
</td>

<td style="text-align:left;">

9.60e-06
</td>

<td style="text-align:left;">

1.47e-06
</td>

<td style="text-align:left;">

1.51e-11
</td>

<td style="text-align:left;">

2.27e-11
</td>

<td style="text-align:left;">

5.14e-16
</td>

<td style="text-align:left;">

5.14e-16
</td>

<td style="text-align:left;">

2.53e-07
</td>

</tr>

<tr>

<td style="text-align:left;">

Bifidobacterium
</td>

<td style="text-align:left;">

5.30e-03
</td>

<td style="text-align:left;">

8.43e-04
</td>

<td style="text-align:left;">

8.50e-05
</td>

<td style="text-align:left;">

9.60e-06
</td>

<td style="text-align:left;">

1.47e-06
</td>

<td style="text-align:left;">

5.83e-10
</td>

<td style="text-align:left;">

7.77e-10
</td>

<td style="text-align:left;">

9.03e-10
</td>

<td style="text-align:left;">

9.03e-10
</td>

<td style="text-align:left;">

1.49e-06
</td>

</tr>

<tr>

<td style="text-align:left;">

Terrisporobacter
</td>

<td style="text-align:left;">

5.30e-03
</td>

<td style="text-align:left;">

8.43e-04
</td>

<td style="text-align:left;">

8.50e-05
</td>

<td style="text-align:left;">

7.26e-04
</td>

<td style="text-align:left;">

7.32e-05
</td>

<td style="text-align:left;">

0.00e+00
</td>

<td style="text-align:left;">

6.74e-08
</td>

<td style="text-align:left;">

1.35e-03
</td>

<td style="text-align:left;">

1.35e-03
</td>

<td style="text-align:left;">

1.35e-03
</td>

</tr>

<tr>

<td style="text-align:left;">

\[Ruminococcus\]\_gnavugroup
</td>

<td style="text-align:left;">

5.30e-03
</td>

<td style="text-align:left;">

8.43e-04
</td>

<td style="text-align:left;">

8.50e-05
</td>

<td style="text-align:left;">

9.60e-06
</td>

<td style="text-align:left;">

4.62e-06
</td>

<td style="text-align:left;">

2.27e-06
</td>

<td style="text-align:left;">

2.27e-06
</td>

<td style="text-align:left;">

4.74e-05
</td>

<td style="text-align:left;">

4.74e-05
</td>

<td style="text-align:left;">

6.77e-05
</td>

</tr>

<tr>

<td style="text-align:left;">

\[Ruminococcus\]\_torquegroup
</td>

<td style="text-align:left;">

5.30e-03
</td>

<td style="text-align:left;">

1.43e-01
</td>

<td style="text-align:left;">

1.99e-02
</td>

<td style="text-align:left;">

2.64e-02
</td>

<td style="text-align:left;">

1.36e-03
</td>

<td style="text-align:left;">

5.97e-05
</td>

<td style="text-align:left;">

5.97e-05
</td>

<td style="text-align:left;">

1.95e-01
</td>

<td style="text-align:left;">

1.95e-01
</td>

<td style="text-align:left;">

1.89e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Bacteroides
</td>

<td style="text-align:left;">

5.30e-03
</td>

<td style="text-align:left;">

1.31e-03
</td>

<td style="text-align:left;">

4.93e-03
</td>

<td style="text-align:left;">

8.44e-04
</td>

<td style="text-align:left;">

3.69e-05
</td>

<td style="text-align:left;">

4.48e-04
</td>

<td style="text-align:left;">

4.48e-04
</td>

<td style="text-align:left;">

1.67e-03
</td>

<td style="text-align:left;">

1.67e-03
</td>

<td style="text-align:left;">

1.35e-03
</td>

</tr>

<tr>

<td style="text-align:left;">

Lactococcus
</td>

<td style="text-align:left;">

5.30e-03
</td>

<td style="text-align:left;">

8.43e-04
</td>

<td style="text-align:left;">

2.37e-04
</td>

<td style="text-align:left;">

3.32e-05
</td>

<td style="text-align:left;">

9.58e-05
</td>

<td style="text-align:left;">

5.46e-04
</td>

<td style="text-align:left;">

5.46e-04
</td>

<td style="text-align:left;">

0.00e+00
</td>

<td style="text-align:left;">

5.26e-19
</td>

<td style="text-align:left;">

1.35e-03
</td>

</tr>

<tr>

<td style="text-align:left;">

Clostridium_sensu_strict1
</td>

<td style="text-align:left;">

5.30e-03
</td>

<td style="text-align:left;">

7.48e-03
</td>

<td style="text-align:left;">

2.83e-02
</td>

<td style="text-align:left;">

1.08e-02
</td>

<td style="text-align:left;">

1.01e-02
</td>

<td style="text-align:left;">

5.91e-04
</td>

<td style="text-align:left;">

5.91e-04
</td>

<td style="text-align:left;">

1.36e-02
</td>

<td style="text-align:left;">

1.36e-02
</td>

<td style="text-align:left;">

1.68e-02
</td>

</tr>

<tr>

<td style="text-align:left;">

Blautia
</td>

<td style="text-align:left;">

5.30e-03
</td>

<td style="text-align:left;">

1.87e-03
</td>

<td style="text-align:left;">

3.06e-03
</td>

<td style="text-align:left;">

1.55e-03
</td>

<td style="text-align:left;">

1.43e-02
</td>

<td style="text-align:left;">

6.36e-04
</td>

<td style="text-align:left;">

6.36e-04
</td>

<td style="text-align:left;">

1.35e-03
</td>

<td style="text-align:left;">

1.35e-03
</td>

<td style="text-align:left;">

4.81e-03
</td>

</tr>

<tr>

<td style="text-align:left;">

Streptococcus
</td>

<td style="text-align:left;">

5.30e-03
</td>

<td style="text-align:left;">

1.31e-03
</td>

<td style="text-align:left;">

1.46e-04
</td>

<td style="text-align:left;">

1.93e-03
</td>

<td style="text-align:left;">

1.23e-03
</td>

<td style="text-align:left;">

2.01e-03
</td>

<td style="text-align:left;">

2.01e-03
</td>

<td style="text-align:left;">

1.67e-03
</td>

<td style="text-align:left;">

1.67e-03
</td>

<td style="text-align:left;">

1.46e-03
</td>

</tr>

<tr>

<td style="text-align:left;">

Collinsella
</td>

<td style="text-align:left;">

5.30e-03
</td>

<td style="text-align:left;">

7.74e-02
</td>

<td style="text-align:left;">

2.19e-02
</td>

<td style="text-align:left;">

1.82e-03
</td>

<td style="text-align:left;">

6.18e-02
</td>

<td style="text-align:left;">

2.94e-03
</td>

<td style="text-align:left;">

2.94e-03
</td>

<td style="text-align:left;">

1.12e-01
</td>

<td style="text-align:left;">

1.12e-01
</td>

<td style="text-align:left;">

1.12e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

\[Clostridium\]\_innocuum_group
</td>

<td style="text-align:left;">

5.30e-03
</td>

<td style="text-align:left;">

8.43e-04
</td>

<td style="text-align:left;">

8.50e-05
</td>

<td style="text-align:left;">

9.60e-06
</td>

<td style="text-align:left;">

7.56e-06
</td>

<td style="text-align:left;">

8.77e-03
</td>

<td style="text-align:left;">

8.77e-03
</td>

<td style="text-align:left;">

1.35e-03
</td>

<td style="text-align:left;">

1.35e-03
</td>

<td style="text-align:left;">

1.35e-03
</td>

</tr>

<tr>

<td style="text-align:left;">

Tyzzerella
</td>

<td style="text-align:left;">

1.97e-02
</td>

<td style="text-align:left;">

1.43e-01
</td>

<td style="text-align:left;">

1.72e-02
</td>

<td style="text-align:left;">

8.85e-03
</td>

<td style="text-align:left;">

1.55e-02
</td>

<td style="text-align:left;">

1.54e-02
</td>

<td style="text-align:left;">

1.54e-02
</td>

<td style="text-align:left;">

1.95e-01
</td>

<td style="text-align:left;">

1.95e-01
</td>

<td style="text-align:left;">

1.89e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Clostridioides
</td>

<td style="text-align:left;">

4.57e-02
</td>

<td style="text-align:left;">

1.06e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

8.85e-03
</td>

<td style="text-align:left;">

1.12e-01
</td>

<td style="text-align:left;">

3.98e-02
</td>

<td style="text-align:left;">

3.98e-02
</td>

<td style="text-align:left;">

1.38e-01
</td>

<td style="text-align:left;">

1.38e-01
</td>

<td style="text-align:left;">

1.38e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Epulopiscium
</td>

<td style="text-align:left;">

8.41e-02
</td>

<td style="text-align:left;">

1.34e-01
</td>

<td style="text-align:left;">

3.76e-02
</td>

<td style="text-align:left;">

1.05e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

4.43e-02
</td>

<td style="text-align:left;">

4.43e-02
</td>

<td style="text-align:left;">

1.78e-01
</td>

<td style="text-align:left;">

1.78e-01
</td>

<td style="text-align:left;">

1.78e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Granulicatella
</td>

<td style="text-align:left;">

3.96e-02
</td>

<td style="text-align:left;">

4.80e-02
</td>

<td style="text-align:left;">

1.97e-04
</td>

<td style="text-align:left;">

3.16e-04
</td>

<td style="text-align:left;">

7.29e-03
</td>

<td style="text-align:left;">

5.03e-02
</td>

<td style="text-align:left;">

5.03e-02
</td>

<td style="text-align:left;">

7.05e-02
</td>

<td style="text-align:left;">

7.05e-02
</td>

<td style="text-align:left;">

6.95e-02
</td>

</tr>

<tr>

<td style="text-align:left;">

Paeniclostridium
</td>

<td style="text-align:left;">

4.25e-02
</td>

<td style="text-align:left;">

1.01e-01
</td>

<td style="text-align:left;">

2.45e-01
</td>

<td style="text-align:left;">

2.81e-02
</td>

<td style="text-align:left;">

1.85e-01
</td>

<td style="text-align:left;">

5.34e-02
</td>

<td style="text-align:left;">

5.34e-02
</td>

<td style="text-align:left;">

1.38e-01
</td>

<td style="text-align:left;">

1.38e-01
</td>

<td style="text-align:left;">

1.38e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Parabacteroides
</td>

<td style="text-align:left;">

5.17e-02
</td>

<td style="text-align:left;">

1.06e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.43e-01
</td>

<td style="text-align:left;">

8.03e-02
</td>

<td style="text-align:left;">

6.95e-02
</td>

<td style="text-align:left;">

6.95e-02
</td>

<td style="text-align:left;">

1.38e-01
</td>

<td style="text-align:left;">

1.38e-01
</td>

<td style="text-align:left;">

1.38e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Fusobacterium
</td>

<td style="text-align:left;">

6.87e-02
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

9.09e-02
</td>

<td style="text-align:left;">

9.09e-02
</td>

<td style="text-align:left;">

8.04e-01
</td>

<td style="text-align:left;">

8.04e-01
</td>

<td style="text-align:left;">

8.04e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Lactobacillus
</td>

<td style="text-align:left;">

8.41e-02
</td>

<td style="text-align:left;">

1.43e-01
</td>

<td style="text-align:left;">

4.59e-03
</td>

<td style="text-align:left;">

1.78e-01
</td>

<td style="text-align:left;">

1.70e-01
</td>

<td style="text-align:left;">

1.07e-01
</td>

<td style="text-align:left;">

1.07e-01
</td>

<td style="text-align:left;">

1.96e-01
</td>

<td style="text-align:left;">

1.96e-01
</td>

<td style="text-align:left;">

1.89e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Leuconostoc
</td>

<td style="text-align:left;">

8.41e-02
</td>

<td style="text-align:left;">

2.24e-01
</td>

<td style="text-align:left;">

2.45e-01
</td>

<td style="text-align:left;">

1.97e-01
</td>

<td style="text-align:left;">

3.12e-02
</td>

<td style="text-align:left;">

1.07e-01
</td>

<td style="text-align:left;">

1.07e-01
</td>

<td style="text-align:left;">

2.80e-01
</td>

<td style="text-align:left;">

2.80e-01
</td>

<td style="text-align:left;">

2.80e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Faecalitalea
</td>

<td style="text-align:left;">

8.41e-02
</td>

<td style="text-align:left;">

1.06e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

8.66e-02
</td>

<td style="text-align:left;">

9.07e-02
</td>

<td style="text-align:left;">

1.07e-01
</td>

<td style="text-align:left;">

1.07e-01
</td>

<td style="text-align:left;">

1.38e-01
</td>

<td style="text-align:left;">

1.38e-01
</td>

<td style="text-align:left;">

1.38e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Coprobacillus
</td>

<td style="text-align:left;">

8.41e-02
</td>

<td style="text-align:left;">

3.78e-02
</td>

<td style="text-align:left;">

3.24e-02
</td>

<td style="text-align:left;">

2.81e-02
</td>

<td style="text-align:left;">

3.12e-02
</td>

<td style="text-align:left;">

1.07e-01
</td>

<td style="text-align:left;">

1.07e-01
</td>

<td style="text-align:left;">

5.69e-02
</td>

<td style="text-align:left;">

5.69e-02
</td>

<td style="text-align:left;">

5.69e-02
</td>

</tr>

<tr>

<td style="text-align:left;">

Erysipelatoclostridium
</td>

<td style="text-align:left;">

8.65e-02
</td>

<td style="text-align:left;">

4.13e-02
</td>

<td style="text-align:left;">

6.35e-02
</td>

<td style="text-align:left;">

1.05e-01
</td>

<td style="text-align:left;">

1.16e-01
</td>

<td style="text-align:left;">

1.07e-01
</td>

<td style="text-align:left;">

1.07e-01
</td>

<td style="text-align:left;">

6.05e-02
</td>

<td style="text-align:left;">

6.05e-02
</td>

<td style="text-align:left;">

5.94e-02
</td>

</tr>

<tr>

<td style="text-align:left;">

Haemophilus
</td>

<td style="text-align:left;">

8.41e-02
</td>

<td style="text-align:left;">

2.99e-02
</td>

<td style="text-align:left;">

1.22e-01
</td>

<td style="text-align:left;">

3.72e-03
</td>

<td style="text-align:left;">

1.43e-02
</td>

<td style="text-align:left;">

1.07e-01
</td>

<td style="text-align:left;">

1.07e-01
</td>

<td style="text-align:left;">

4.36e-02
</td>

<td style="text-align:left;">

4.36e-02
</td>

<td style="text-align:left;">

4.54e-02
</td>

</tr>

<tr>

<td style="text-align:left;">

Peptoniphilus
</td>

<td style="text-align:left;">

1.60e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.48e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.24e-01
</td>

<td style="text-align:left;">

1.07e-01
</td>

<td style="text-align:left;">

1.07e-01
</td>

<td style="text-align:left;">

3.56e-01
</td>

<td style="text-align:left;">

3.56e-01
</td>

<td style="text-align:left;">

3.56e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Sellimonas
</td>

<td style="text-align:left;">

6.87e-02
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

5.06e-02
</td>

<td style="text-align:left;">

2.22e-01
</td>

<td style="text-align:left;">

1.43e-02
</td>

<td style="text-align:left;">

1.07e-01
</td>

<td style="text-align:left;">

1.07e-01
</td>

<td style="text-align:left;">

3.32e-01
</td>

<td style="text-align:left;">

3.32e-01
</td>

<td style="text-align:left;">

3.32e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

uncultured18
</td>

<td style="text-align:left;">

7.53e-02
</td>

<td style="text-align:left;">

2.29e-02
</td>

<td style="text-align:left;">

4.16e-02
</td>

<td style="text-align:left;">

1.35e-01
</td>

<td style="text-align:left;">

1.43e-02
</td>

<td style="text-align:left;">

1.07e-01
</td>

<td style="text-align:left;">

1.07e-01
</td>

<td style="text-align:left;">

3.49e-02
</td>

<td style="text-align:left;">

3.49e-02
</td>

<td style="text-align:left;">

3.49e-02
</td>

</tr>

<tr>

<td style="text-align:left;">

Anaerococcus
</td>

<td style="text-align:left;">

8.41e-02
</td>

<td style="text-align:left;">

1.10e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.05e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.09e-01
</td>

<td style="text-align:left;">

1.09e-01
</td>

<td style="text-align:left;">

1.43e-01
</td>

<td style="text-align:left;">

1.43e-01
</td>

<td style="text-align:left;">

1.43e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Phascolarctobacterium
</td>

<td style="text-align:left;">

1.05e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

8.29e-02
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.32e-01
</td>

<td style="text-align:left;">

1.32e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

</tr>

<tr>

<td style="text-align:left;">

Veillonella
</td>

<td style="text-align:left;">

1.02e-01
</td>

<td style="text-align:left;">

4.80e-02
</td>

<td style="text-align:left;">

1.51e-01
</td>

<td style="text-align:left;">

1.33e-02
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.32e-01
</td>

<td style="text-align:left;">

1.32e-01
</td>

<td style="text-align:left;">

7.18e-02
</td>

<td style="text-align:left;">

7.18e-02
</td>

<td style="text-align:left;">

6.95e-02
</td>

</tr>

<tr>

<td style="text-align:left;">

Faecalicoccus
</td>

<td style="text-align:left;">

1.30e-01
</td>

<td style="text-align:left;">

2.20e-01
</td>

<td style="text-align:left;">

9.01e-02
</td>

<td style="text-align:left;">

8.52e-02
</td>

<td style="text-align:left;">

9.07e-02
</td>

<td style="text-align:left;">

1.62e-01
</td>

<td style="text-align:left;">

1.62e-01
</td>

<td style="text-align:left;">

2.80e-01
</td>

<td style="text-align:left;">

2.80e-01
</td>

<td style="text-align:left;">

2.80e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Staphylococcus
</td>

<td style="text-align:left;">

1.67e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.70e-01
</td>

<td style="text-align:left;">

1.92e-01
</td>

<td style="text-align:left;">

1.92e-01
</td>

<td style="text-align:left;">

5.28e-01
</td>

<td style="text-align:left;">

5.28e-01
</td>

<td style="text-align:left;">

5.28e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Delftia
</td>

<td style="text-align:left;">

1.62e-01
</td>

<td style="text-align:left;">

4.30e-02
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.15e-01
</td>

<td style="text-align:left;">

1.99e-01
</td>

<td style="text-align:left;">

1.99e-01
</td>

<td style="text-align:left;">

6.23e-02
</td>

<td style="text-align:left;">

6.23e-02
</td>

<td style="text-align:left;">

6.23e-02
</td>

</tr>

<tr>

<td style="text-align:left;">

Bilophila
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

2.91e-01
</td>

<td style="text-align:left;">

2.91e-01
</td>

<td style="text-align:left;">

3.48e-01
</td>

<td style="text-align:left;">

3.48e-01
</td>

<td style="text-align:left;">

3.48e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Anaerostipes
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

3.29e-01
</td>

<td style="text-align:left;">

3.29e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

</tr>

<tr>

<td style="text-align:left;">

Scardovia
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

3.29e-01
</td>

<td style="text-align:left;">

3.29e-01
</td>

<td style="text-align:left;">

4.25e-01
</td>

<td style="text-align:left;">

4.25e-01
</td>

<td style="text-align:left;">

4.25e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Enterobacteriaceae(F)
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

4.25e-01
</td>

<td style="text-align:left;">

4.25e-01
</td>

<td style="text-align:left;">

8.38e-01
</td>

<td style="text-align:left;">

8.38e-01
</td>

<td style="text-align:left;">

8.38e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Rothia
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

6.04e-02
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

4.54e-01
</td>

<td style="text-align:left;">

4.54e-01
</td>

<td style="text-align:left;">

4.74e-01
</td>

<td style="text-align:left;">

4.74e-01
</td>

<td style="text-align:left;">

4.74e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Actinomyces
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.89e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.93e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

4.56e-01
</td>

<td style="text-align:left;">

4.56e-01
</td>

<td style="text-align:left;">

2.63e-01
</td>

<td style="text-align:left;">

2.63e-01
</td>

<td style="text-align:left;">

2.59e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Atopobium
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

4.61e-01
</td>

<td style="text-align:left;">

4.61e-01
</td>

<td style="text-align:left;">

3.41e-01
</td>

<td style="text-align:left;">

3.41e-01
</td>

<td style="text-align:left;">

3.41e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Incertae_Sedis
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

5.00e-01
</td>

<td style="text-align:left;">

5.00e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

</tr>

<tr>

<td style="text-align:left;">

Olsenella
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

5.15e-01
</td>

<td style="text-align:left;">

5.15e-01
</td>

<td style="text-align:left;">

4.74e-01
</td>

<td style="text-align:left;">

4.74e-01
</td>

<td style="text-align:left;">

4.74e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Clostridium_sensu_strict18
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.97e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

5.25e-01
</td>

<td style="text-align:left;">

5.25e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

</tr>

<tr>

<td style="text-align:left;">

Dorea
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.52e-01
</td>

<td style="text-align:left;">

1.05e-01
</td>

<td style="text-align:left;">

1.02e-01
</td>

<td style="text-align:left;">

5.53e-01
</td>

<td style="text-align:left;">

5.53e-01
</td>

<td style="text-align:left;">

3.32e-01
</td>

<td style="text-align:left;">

3.32e-01
</td>

<td style="text-align:left;">

3.32e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Hungatella
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.05e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

5.99e-01
</td>

<td style="text-align:left;">

5.99e-01
</td>

<td style="text-align:left;">

7.10e-01
</td>

<td style="text-align:left;">

7.10e-01
</td>

<td style="text-align:left;">

7.10e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Proteus
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

5.99e-01
</td>

<td style="text-align:left;">

5.99e-01
</td>

<td style="text-align:left;">

9.41e-01
</td>

<td style="text-align:left;">

9.41e-01
</td>

<td style="text-align:left;">

9.41e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Megasphaera
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

6.15e-01
</td>

<td style="text-align:left;">

6.15e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

</tr>

<tr>

<td style="text-align:left;">

Coprococcus
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

2.25e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

6.35e-01
</td>

<td style="text-align:left;">

6.35e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

</tr>

<tr>

<td style="text-align:left;">

Family_XIII_AD3011_group
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

6.43e-01
</td>

<td style="text-align:left;">

6.43e-01
</td>

<td style="text-align:left;">

5.64e-01
</td>

<td style="text-align:left;">

5.64e-01
</td>

<td style="text-align:left;">

5.64e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Peptostreptococcus
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

6.43e-01
</td>

<td style="text-align:left;">

6.43e-01
</td>

<td style="text-align:left;">

3.92e-01
</td>

<td style="text-align:left;">

3.92e-01
</td>

<td style="text-align:left;">

3.92e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Blastococcus
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.94e-01
</td>

<td style="text-align:left;">

1.88e-01
</td>

<td style="text-align:left;">

6.43e-01
</td>

<td style="text-align:left;">

6.43e-01
</td>

<td style="text-align:left;">

5.64e-01
</td>

<td style="text-align:left;">

5.64e-01
</td>

<td style="text-align:left;">

5.64e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Flavonifractor
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

7.74e-02
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.65e-01
</td>

<td style="text-align:left;">

6.43e-01
</td>

<td style="text-align:left;">

6.43e-01
</td>

<td style="text-align:left;">

1.12e-01
</td>

<td style="text-align:left;">

1.12e-01
</td>

<td style="text-align:left;">

1.12e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

22_Lachnospiraceae(F)
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.44e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

2.55e-02
</td>

<td style="text-align:left;">

1.43e-01
</td>

<td style="text-align:left;">

6.43e-01
</td>

<td style="text-align:left;">

6.43e-01
</td>

<td style="text-align:left;">

1.99e-01
</td>

<td style="text-align:left;">

1.99e-01
</td>

<td style="text-align:left;">

1.99e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Erysipelotrichaceae_UCG-003
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

7.14e-01
</td>

<td style="text-align:left;">

7.14e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

</tr>

<tr>

<td style="text-align:left;">

Subdoligranulum
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

7.14e-01
</td>

<td style="text-align:left;">

7.14e-01
</td>

<td style="text-align:left;">

8.05e-01
</td>

<td style="text-align:left;">

8.05e-01
</td>

<td style="text-align:left;">

8.05e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Roseburia
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

7.14e-01
</td>

<td style="text-align:left;">

7.14e-01
</td>

<td style="text-align:left;">

3.56e-01
</td>

<td style="text-align:left;">

3.56e-01
</td>

<td style="text-align:left;">

3.56e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Escherichia-Shigella
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

7.14e-01
</td>

<td style="text-align:left;">

7.14e-01
</td>

<td style="text-align:left;">

9.41e-01
</td>

<td style="text-align:left;">

9.41e-01
</td>

<td style="text-align:left;">

9.41e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Fusicatenibacter
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

7.14e-01
</td>

<td style="text-align:left;">

7.14e-01
</td>

<td style="text-align:left;">

8.22e-01
</td>

<td style="text-align:left;">

8.22e-01
</td>

<td style="text-align:left;">

8.22e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Akkermansia
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

7.41e-01
</td>

<td style="text-align:left;">

7.41e-01
</td>

<td style="text-align:left;">

3.05e-01
</td>

<td style="text-align:left;">

3.05e-01
</td>

<td style="text-align:left;">

3.05e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Gordonibacter
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.33e-01
</td>

<td style="text-align:left;">

3.24e-02
</td>

<td style="text-align:left;">

1.08e-02
</td>

<td style="text-align:left;">

9.07e-02
</td>

<td style="text-align:left;">

7.41e-01
</td>

<td style="text-align:left;">

7.41e-01
</td>

<td style="text-align:left;">

1.78e-01
</td>

<td style="text-align:left;">

1.78e-01
</td>

<td style="text-align:left;">

1.78e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

UBA1819
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

7.41e-01
</td>

<td style="text-align:left;">

7.41e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

</tr>

<tr>

<td style="text-align:left;">

Libanicoccus
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

7.78e-01
</td>

<td style="text-align:left;">

7.78e-01
</td>

<td style="text-align:left;">

5.32e-01
</td>

<td style="text-align:left;">

5.32e-01
</td>

<td style="text-align:left;">

5.32e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Dialister
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

8.18e-01
</td>

<td style="text-align:left;">

8.18e-01
</td>

<td style="text-align:left;">

3.05e-01
</td>

<td style="text-align:left;">

3.05e-01
</td>

<td style="text-align:left;">

3.05e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Dolosigranulum
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

8.18e-01
</td>

<td style="text-align:left;">

8.18e-01
</td>

<td style="text-align:left;">

5.64e-01
</td>

<td style="text-align:left;">

5.64e-01
</td>

<td style="text-align:left;">

5.64e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Holdemanella
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.94e-02
</td>

<td style="text-align:left;">

1.74e-01
</td>

<td style="text-align:left;">

1.29e-02
</td>

<td style="text-align:left;">

1.51e-01
</td>

<td style="text-align:left;">

8.18e-01
</td>

<td style="text-align:left;">

8.18e-01
</td>

<td style="text-align:left;">

3.06e-02
</td>

<td style="text-align:left;">

3.06e-02
</td>

<td style="text-align:left;">

3.06e-02
</td>

</tr>

<tr>

<td style="text-align:left;">

Eubacterium
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

4.80e-02
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.27e-01
</td>

<td style="text-align:left;">

9.07e-02
</td>

<td style="text-align:left;">

8.18e-01
</td>

<td style="text-align:left;">

8.18e-01
</td>

<td style="text-align:left;">

7.02e-02
</td>

<td style="text-align:left;">

7.02e-02
</td>

<td style="text-align:left;">

6.95e-02
</td>

</tr>

<tr>

<td style="text-align:left;">

Pseudomonas
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

8.18e-01
</td>

<td style="text-align:left;">

8.18e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

</tr>

<tr>

<td style="text-align:left;">

8_Comamonadaceae(F)
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

8.18e-01
</td>

<td style="text-align:left;">

8.18e-01
</td>

<td style="text-align:left;">

8.38e-01
</td>

<td style="text-align:left;">

8.38e-01
</td>

<td style="text-align:left;">

8.38e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Corynebacterium
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

8.18e-01
</td>

<td style="text-align:left;">

8.18e-01
</td>

<td style="text-align:left;">

4.74e-01
</td>

<td style="text-align:left;">

4.74e-01
</td>

<td style="text-align:left;">

4.74e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Varibaculum
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

8.18e-01
</td>

<td style="text-align:left;">

8.18e-01
</td>

<td style="text-align:left;">

4.74e-01
</td>

<td style="text-align:left;">

4.74e-01
</td>

<td style="text-align:left;">

4.74e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Coprobacter
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

8.18e-01
</td>

<td style="text-align:left;">

8.18e-01
</td>

<td style="text-align:left;">

8.38e-01
</td>

<td style="text-align:left;">

8.38e-01
</td>

<td style="text-align:left;">

8.38e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Slackia
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

9.26e-02
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

8.18e-01
</td>

<td style="text-align:left;">

8.18e-01
</td>

<td style="text-align:left;">

5.64e-01
</td>

<td style="text-align:left;">

5.64e-01
</td>

<td style="text-align:left;">

5.64e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Butyricicoccus
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

8.18e-01
</td>

<td style="text-align:left;">

8.18e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

</tr>

<tr>

<td style="text-align:left;">

Faecalibacterium
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

8.18e-01
</td>

<td style="text-align:left;">

8.18e-01
</td>

<td style="text-align:left;">

4.69e-01
</td>

<td style="text-align:left;">

4.69e-01
</td>

<td style="text-align:left;">

4.69e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

\[Eubacterium\]\_eligengroup
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

8.18e-01
</td>

<td style="text-align:left;">

8.18e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

</tr>

<tr>

<td style="text-align:left;">

21_Bifidobacteriaceae(F)
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

8.18e-01
</td>

<td style="text-align:left;">

8.18e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

</tr>

<tr>

<td style="text-align:left;">

Agathobacter
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

8.18e-01
</td>

<td style="text-align:left;">

8.18e-01
</td>

<td style="text-align:left;">

8.38e-01
</td>

<td style="text-align:left;">

8.38e-01
</td>

<td style="text-align:left;">

8.38e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Morganella
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

8.18e-01
</td>

<td style="text-align:left;">

8.18e-01
</td>

<td style="text-align:left;">

8.38e-01
</td>

<td style="text-align:left;">

8.38e-01
</td>

<td style="text-align:left;">

8.38e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Prevotella
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

8.41e-01
</td>

<td style="text-align:left;">

8.41e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

</tr>

<tr>

<td style="text-align:left;">

Lachnoclostridium
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

8.62e-01
</td>

<td style="text-align:left;">

8.62e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

</tr>

<tr>

<td style="text-align:left;">

CAG-352
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

8.77e-01
</td>

<td style="text-align:left;">

8.77e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

</tr>

<tr>

<td style="text-align:left;">

Negativicoccus
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.21e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

5.32e-01
</td>

<td style="text-align:left;">

5.32e-01
</td>

<td style="text-align:left;">

5.32e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Anaeroglobus
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

</tr>

<tr>

<td style="text-align:left;">

Gemella
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

5.28e-01
</td>

<td style="text-align:left;">

5.28e-01
</td>

<td style="text-align:left;">

5.28e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Turicibacter
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

</tr>

<tr>

<td style="text-align:left;">

Romboutsia
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

5.32e-01
</td>

<td style="text-align:left;">

5.32e-01
</td>

<td style="text-align:left;">

5.32e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Halomonas
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

8.38e-01
</td>

<td style="text-align:left;">

8.38e-01
</td>

<td style="text-align:left;">

8.38e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Sutterella
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

8.38e-01
</td>

<td style="text-align:left;">

8.38e-01
</td>

<td style="text-align:left;">

8.38e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Acinetobacter
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

</tr>

<tr>

<td style="text-align:left;">

Brevundimonas
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

</tr>

<tr>

<td style="text-align:left;">

Lawsonella
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

</tr>

<tr>

<td style="text-align:left;">

Cutibacterium
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

</tr>

<tr>

<td style="text-align:left;">

Alistipes
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

8.38e-01
</td>

<td style="text-align:left;">

8.38e-01
</td>

<td style="text-align:left;">

8.38e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Senegalimassilia
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

</tr>

<tr>

<td style="text-align:left;">

Eggerthella
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

2.48e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.70e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

9.22e-01
</td>

<td style="text-align:left;">

9.22e-01
</td>

<td style="text-align:left;">

9.22e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Finegoldia
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

8.36e-01
</td>

<td style="text-align:left;">

8.36e-01
</td>

<td style="text-align:left;">

8.36e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Sarcina
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

</tr>

<tr>

<td style="text-align:left;">

Ruminococcus
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

</tr>

<tr>

<td style="text-align:left;">

\[Eubacterium\]\_coprostanoligenegroup
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

</tr>

<tr>

<td style="text-align:left;">

Clostridia_UCG-014
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.74e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

</tr>

<tr>

<td style="text-align:left;">

\[Eubacterium\]\_hallii_group
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

9.41e-01
</td>

<td style="text-align:left;">

9.41e-01
</td>

<td style="text-align:left;">

9.41e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Lachnospira
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

</tr>

<tr>

<td style="text-align:left;">

\[Ruminococcus\]\_gauvreauii_group
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

8.38e-01
</td>

<td style="text-align:left;">

8.38e-01
</td>

<td style="text-align:left;">

8.38e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Lachnoanaerobaculum
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

</tr>

<tr>

<td style="text-align:left;">

Lachnospiraceae_NK4A136_group
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

9.45e-01
</td>

<td style="text-align:left;">

9.45e-01
</td>

<td style="text-align:left;">

9.45e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Megamonas
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

</tr>

<tr>

<td style="text-align:left;">

Solobacterium
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

</tr>

<tr>

<td style="text-align:left;">

Christensenellaceae_R-7_group
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

</tr>

<tr>

<td style="text-align:left;">

Stenotrophomonas
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

</tr>

<tr>

<td style="text-align:left;">

9_Pasteurellaceae(F)
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

</tr>

<tr>

<td style="text-align:left;">

Dermabacter
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

</tr>

<tr>

<td style="text-align:left;">

Actinotignum
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

8.38e-01
</td>

<td style="text-align:left;">

8.38e-01
</td>

<td style="text-align:left;">

8.38e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Porphyromonas
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

</tr>

<tr>

<td style="text-align:left;">

Fenollaria
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

</tr>

<tr>

<td style="text-align:left;">

Monoglobus
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

</tr>

<tr>

<td style="text-align:left;">

Lachnospiraceae_ND3007_group
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

</tr>

</tbody>

</table>

<table class="table" style="color: black; width: auto !important; margin-left: auto; margin-right: auto;">

<thead>

<tr>

<th style="text-align:left;">

taxon
</th>

<th style="text-align:right;">

n_sig
</th>

<th style="text-align:left;">

sig_any
</th>

<th style="text-align:left;">

sig_all
</th>

<th style="text-align:left;">

dacomp (1e+03)
</th>

<th style="text-align:left;">

dacomp (1e+04)
</th>

<th style="text-align:left;">

dacomp (1e+05)
</th>

<th style="text-align:left;">

dacomp (1e+06)
</th>

<th style="text-align:left;">

dacomp (1e+07)
</th>

<th style="text-align:left;">

permApprox (1e+03, unconstrained, exceed0=250)
</th>

<th style="text-align:left;">

permApprox (1e+03, SLLS, exceed0=250)
</th>

<th style="text-align:left;">

permApprox (1e+04, unconstrained, exceed0=250)
</th>

<th style="text-align:left;">

permApprox (1e+04, SLLS, exceed0=250)
</th>

<th style="text-align:left;">

permApprox (1e+04, SLLS, exceed0=0.25)
</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;">

Bacteroides
</td>

<td style="text-align:right;">

10
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

</tr>

<tr>

<td style="text-align:left;">

Bifidobacterium
</td>

<td style="text-align:right;">

10
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

</tr>

<tr>

<td style="text-align:left;">

Enterococcus
</td>

<td style="text-align:right;">

10
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

</tr>

<tr>

<td style="text-align:left;">

Intestinibacter
</td>

<td style="text-align:right;">

10
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

</tr>

<tr>

<td style="text-align:left;">

Lactococcus
</td>

<td style="text-align:right;">

10
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

</tr>

<tr>

<td style="text-align:left;">

Streptococcus
</td>

<td style="text-align:right;">

10
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

</tr>

<tr>

<td style="text-align:left;">

Terrisporobacter
</td>

<td style="text-align:right;">

10
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

</tr>

<tr>

<td style="text-align:left;">

\[Clostridium\]\_innocuum_group
</td>

<td style="text-align:right;">

10
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

</tr>

<tr>

<td style="text-align:left;">

\[Ruminococcus\]\_gnavugroup
</td>

<td style="text-align:right;">

10
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

</tr>

<tr>

<td style="text-align:left;">

Blautia
</td>

<td style="text-align:right;">

9
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

</tr>

<tr>

<td style="text-align:left;">

Clostridium_sensu_strict1
</td>

<td style="text-align:right;">

4
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

</tr>

<tr>

<td style="text-align:left;">

Collinsella
</td>

<td style="text-align:right;">

4
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

</tr>

<tr>

<td style="text-align:left;">

\[Ruminococcus\]\_torquegroup
</td>

<td style="text-align:right;">

4
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

</tr>

<tr>

<td style="text-align:left;">

Granulicatella
</td>

<td style="text-align:right;">

3
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

</tr>

<tr>

<td style="text-align:left;">

Clostridioides
</td>

<td style="text-align:right;">

1
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

</tr>

<tr>

<td style="text-align:left;">

Haemophilus
</td>

<td style="text-align:right;">

1
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

</tr>

<tr>

<td style="text-align:left;">

Lactobacillus
</td>

<td style="text-align:right;">

1
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

</tr>

<tr>

<td style="text-align:left;">

Tyzzerella
</td>

<td style="text-align:right;">

1
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

</tr>

<tr>

<td style="text-align:left;">

21_Bifidobacteriaceae(F)
</td>

<td style="text-align:right;">

0
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

</tr>

<tr>

<td style="text-align:left;">

22_Lachnospiraceae(F)
</td>

<td style="text-align:right;">

0
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

</tr>

<tr>

<td style="text-align:left;">

8_Comamonadaceae(F)
</td>

<td style="text-align:right;">

0
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

</tr>

<tr>

<td style="text-align:left;">

9_Pasteurellaceae(F)
</td>

<td style="text-align:right;">

0
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

</tr>

<tr>

<td style="text-align:left;">

Acinetobacter
</td>

<td style="text-align:right;">

0
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

</tr>

<tr>

<td style="text-align:left;">

Actinomyces
</td>

<td style="text-align:right;">

0
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

</tr>

<tr>

<td style="text-align:left;">

Actinotignum
</td>

<td style="text-align:right;">

0
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

</tr>

<tr>

<td style="text-align:left;">

Agathobacter
</td>

<td style="text-align:right;">

0
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

</tr>

<tr>

<td style="text-align:left;">

Akkermansia
</td>

<td style="text-align:right;">

0
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

</tr>

<tr>

<td style="text-align:left;">

Alistipes
</td>

<td style="text-align:right;">

0
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

</tr>

<tr>

<td style="text-align:left;">

Anaerococcus
</td>

<td style="text-align:right;">

0
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

</tr>

<tr>

<td style="text-align:left;">

Anaeroglobus
</td>

<td style="text-align:right;">

0
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

</tr>

</tbody>

</table>

### Unadjusted

<table class="table table-striped table-hover" style="color: black; width: auto !important; margin-left: auto; margin-right: auto;">

<caption>

Unadjusted p-values across methods and permutation settings
</caption>

<thead>

<tr>

<th style="text-align:left;">

taxon
</th>

<th style="text-align:left;">

dacomp (1e+03)
</th>

<th style="text-align:left;">

dacomp (1e+04)
</th>

<th style="text-align:left;">

dacomp (1e+05)
</th>

<th style="text-align:left;">

dacomp (1e+06)
</th>

<th style="text-align:left;">

dacomp (1e+07)
</th>

<th style="text-align:left;">

permApprox (1e+03, unconstrained, exceed0=250)
</th>

<th style="text-align:left;">

permApprox (1e+03, SLLS, exceed0=250)
</th>

<th style="text-align:left;">

permApprox (1e+04, unconstrained, exceed0=250)
</th>

<th style="text-align:left;">

permApprox (1e+04, SLLS, exceed0=250)
</th>

<th style="text-align:left;">

permApprox (1e+04, SLLS, exceed0=0.25)
</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;">

Intestinibacter
</td>

<td style="text-align:left;">

9.99e-04
</td>

<td style="text-align:left;">

1.00e-04
</td>

<td style="text-align:left;">

1.00e-05
</td>

<td style="text-align:left;">

1.00e-06
</td>

<td style="text-align:left;">

1.00e-07
</td>

<td style="text-align:left;">

1.97e-18
</td>

<td style="text-align:left;">

1.97e-18
</td>

<td style="text-align:left;">

8.45e-08
</td>

<td style="text-align:left;">

8.45e-08
</td>

<td style="text-align:left;">

9.71e-09
</td>

</tr>

<tr>

<td style="text-align:left;">

Enterococcus
</td>

<td style="text-align:left;">

9.99e-04
</td>

<td style="text-align:left;">

1.00e-04
</td>

<td style="text-align:left;">

1.00e-05
</td>

<td style="text-align:left;">

1.00e-06
</td>

<td style="text-align:left;">

1.00e-07
</td>

<td style="text-align:left;">

4.25e-13
</td>

<td style="text-align:left;">

4.25e-13
</td>

<td style="text-align:left;">

9.53e-18
</td>

<td style="text-align:left;">

9.53e-18
</td>

<td style="text-align:left;">

2.34e-09
</td>

</tr>

<tr>

<td style="text-align:left;">

Bifidobacterium
</td>

<td style="text-align:left;">

9.99e-04
</td>

<td style="text-align:left;">

1.00e-04
</td>

<td style="text-align:left;">

1.00e-05
</td>

<td style="text-align:left;">

1.00e-06
</td>

<td style="text-align:left;">

1.00e-07
</td>

<td style="text-align:left;">

2.18e-11
</td>

<td style="text-align:left;">

2.18e-11
</td>

<td style="text-align:left;">

2.51e-11
</td>

<td style="text-align:left;">

2.51e-11
</td>

<td style="text-align:left;">

4.15e-08
</td>

</tr>

<tr>

<td style="text-align:left;">

Terrisporobacter
</td>

<td style="text-align:left;">

9.99e-04
</td>

<td style="text-align:left;">

1.00e-04
</td>

<td style="text-align:left;">

1.00e-05
</td>

<td style="text-align:left;">

1.04e-04
</td>

<td style="text-align:left;">

1.02e-05
</td>

<td style="text-align:left;">

0.00e+00
</td>

<td style="text-align:left;">

2.52e-09
</td>

<td style="text-align:left;">

1.00e-04
</td>

<td style="text-align:left;">

1.00e-04
</td>

<td style="text-align:left;">

1.00e-04
</td>

</tr>

<tr>

<td style="text-align:left;">

\[Ruminococcus\]\_gnavugroup
</td>

<td style="text-align:left;">

9.99e-04
</td>

<td style="text-align:left;">

1.00e-04
</td>

<td style="text-align:left;">

1.00e-05
</td>

<td style="text-align:left;">

1.00e-06
</td>

<td style="text-align:left;">

4.00e-07
</td>

<td style="text-align:left;">

1.06e-07
</td>

<td style="text-align:left;">

1.06e-07
</td>

<td style="text-align:left;">

2.19e-06
</td>

<td style="text-align:left;">

2.19e-06
</td>

<td style="text-align:left;">

2.51e-06
</td>

</tr>

<tr>

<td style="text-align:left;">

\[Ruminococcus\]\_torquegroup
</td>

<td style="text-align:left;">

9.99e-04
</td>

<td style="text-align:left;">

5.52e-02
</td>

<td style="text-align:left;">

4.18e-03
</td>

<td style="text-align:left;">

7.78e-03
</td>

<td style="text-align:left;">

2.31e-04
</td>

<td style="text-align:left;">

3.35e-06
</td>

<td style="text-align:left;">

3.35e-06
</td>

<td style="text-align:left;">

5.52e-02
</td>

<td style="text-align:left;">

5.52e-02
</td>

<td style="text-align:left;">

5.52e-02
</td>

</tr>

<tr>

<td style="text-align:left;">

Bacteroides
</td>

<td style="text-align:left;">

9.99e-04
</td>

<td style="text-align:left;">

2.00e-04
</td>

<td style="text-align:left;">

9.30e-04
</td>

<td style="text-align:left;">

1.37e-04
</td>

<td style="text-align:left;">

4.50e-06
</td>

<td style="text-align:left;">

2.93e-05
</td>

<td style="text-align:left;">

2.93e-05
</td>

<td style="text-align:left;">

1.39e-04
</td>

<td style="text-align:left;">

1.39e-04
</td>

<td style="text-align:left;">

9.72e-05
</td>

</tr>

<tr>

<td style="text-align:left;">

Lactococcus
</td>

<td style="text-align:left;">

9.99e-04
</td>

<td style="text-align:left;">

1.00e-04
</td>

<td style="text-align:left;">

4.00e-05
</td>

<td style="text-align:left;">

4.00e-06
</td>

<td style="text-align:left;">

1.55e-05
</td>

<td style="text-align:left;">

4.08e-05
</td>

<td style="text-align:left;">

4.08e-05
</td>

<td style="text-align:left;">

0.00e+00
</td>

<td style="text-align:left;">

4.87e-21
</td>

<td style="text-align:left;">

1.00e-04
</td>

</tr>

<tr>

<td style="text-align:left;">

Clostridium_sensu_strict1
</td>

<td style="text-align:left;">

9.99e-04
</td>

<td style="text-align:left;">

1.30e-03
</td>

<td style="text-align:left;">

6.90e-03
</td>

<td style="text-align:left;">

2.54e-03
</td>

<td style="text-align:left;">

1.97e-03
</td>

<td style="text-align:left;">

4.97e-05
</td>

<td style="text-align:left;">

4.97e-05
</td>

<td style="text-align:left;">

1.39e-03
</td>

<td style="text-align:left;">

1.39e-03
</td>

<td style="text-align:left;">

1.71e-03
</td>

</tr>

<tr>

<td style="text-align:left;">

Blautia
</td>

<td style="text-align:left;">

9.99e-04
</td>

<td style="text-align:left;">

3.00e-04
</td>

<td style="text-align:left;">

5.20e-04
</td>

<td style="text-align:left;">

2.60e-04
</td>

<td style="text-align:left;">

2.84e-03
</td>

<td style="text-align:left;">

5.94e-05
</td>

<td style="text-align:left;">

5.94e-05
</td>

<td style="text-align:left;">

8.28e-05
</td>

<td style="text-align:left;">

8.28e-05
</td>

<td style="text-align:left;">

4.45e-04
</td>

</tr>

<tr>

<td style="text-align:left;">

Streptococcus
</td>

<td style="text-align:left;">

9.99e-04
</td>

<td style="text-align:left;">

2.00e-04
</td>

<td style="text-align:left;">

2.00e-05
</td>

<td style="text-align:left;">

3.99e-04
</td>

<td style="text-align:left;">

2.02e-04
</td>

<td style="text-align:left;">

2.07e-04
</td>

<td style="text-align:left;">

2.07e-04
</td>

<td style="text-align:left;">

1.54e-04
</td>

<td style="text-align:left;">

1.54e-04
</td>

<td style="text-align:left;">

1.22e-04
</td>

</tr>

<tr>

<td style="text-align:left;">

Collinsella
</td>

<td style="text-align:left;">

9.99e-04
</td>

<td style="text-align:left;">

2.32e-02
</td>

<td style="text-align:left;">

4.95e-03
</td>

<td style="text-align:left;">

3.39e-04
</td>

<td style="text-align:left;">

1.70e-02
</td>

<td style="text-align:left;">

3.30e-04
</td>

<td style="text-align:left;">

3.30e-04
</td>

<td style="text-align:left;">

2.27e-02
</td>

<td style="text-align:left;">

2.27e-02
</td>

<td style="text-align:left;">

2.28e-02
</td>

</tr>

<tr>

<td style="text-align:left;">

\[Clostridium\]\_innocuum_group
</td>

<td style="text-align:left;">

9.99e-04
</td>

<td style="text-align:left;">

1.00e-04
</td>

<td style="text-align:left;">

1.00e-05
</td>

<td style="text-align:left;">

1.00e-06
</td>

<td style="text-align:left;">

8.00e-07
</td>

<td style="text-align:left;">

1.07e-03
</td>

<td style="text-align:left;">

1.07e-03
</td>

<td style="text-align:left;">

9.33e-05
</td>

<td style="text-align:left;">

9.33e-05
</td>

<td style="text-align:left;">

1.00e-04
</td>

</tr>

<tr>

<td style="text-align:left;">

Tyzzerella
</td>

<td style="text-align:left;">

4.00e-03
</td>

<td style="text-align:left;">

5.60e-02
</td>

<td style="text-align:left;">

3.29e-03
</td>

<td style="text-align:left;">

2.11e-03
</td>

<td style="text-align:left;">

3.72e-03
</td>

<td style="text-align:left;">

2.02e-03
</td>

<td style="text-align:left;">

2.02e-03
</td>

<td style="text-align:left;">

5.60e-02
</td>

<td style="text-align:left;">

5.60e-02
</td>

<td style="text-align:left;">

5.60e-02
</td>

</tr>

<tr>

<td style="text-align:left;">

Clostridioides
</td>

<td style="text-align:left;">

9.99e-03
</td>

<td style="text-align:left;">

3.23e-02
</td>

<td style="text-align:left;">

1.67e-01
</td>

<td style="text-align:left;">

1.98e-03
</td>

<td style="text-align:left;">

3.90e-02
</td>

<td style="text-align:left;">

5.59e-03
</td>

<td style="text-align:left;">

5.59e-03
</td>

<td style="text-align:left;">

3.23e-02
</td>

<td style="text-align:left;">

3.23e-02
</td>

<td style="text-align:left;">

3.23e-02
</td>

</tr>

<tr>

<td style="text-align:left;">

Epulopiscium
</td>

<td style="text-align:left;">

2.60e-02
</td>

<td style="text-align:left;">

4.78e-02
</td>

<td style="text-align:left;">

9.46e-03
</td>

<td style="text-align:left;">

3.97e-02
</td>

<td style="text-align:left;">

2.62e-01
</td>

<td style="text-align:left;">

6.62e-03
</td>

<td style="text-align:left;">

6.62e-03
</td>

<td style="text-align:left;">

4.78e-02
</td>

<td style="text-align:left;">

4.78e-02
</td>

<td style="text-align:left;">

4.78e-02
</td>

</tr>

<tr>

<td style="text-align:left;">

Granulicatella
</td>

<td style="text-align:left;">

7.99e-03
</td>

<td style="text-align:left;">

1.24e-02
</td>

<td style="text-align:left;">

3.00e-05
</td>

<td style="text-align:left;">

4.10e-05
</td>

<td style="text-align:left;">

1.28e-03
</td>

<td style="text-align:left;">

7.99e-03
</td>

<td style="text-align:left;">

7.99e-03
</td>

<td style="text-align:left;">

1.24e-02
</td>

<td style="text-align:left;">

1.24e-02
</td>

<td style="text-align:left;">

1.24e-02
</td>

</tr>

<tr>

<td style="text-align:left;">

Paeniclostridium
</td>

<td style="text-align:left;">

8.99e-03
</td>

<td style="text-align:left;">

2.95e-02
</td>

<td style="text-align:left;">

9.38e-02
</td>

<td style="text-align:left;">

8.38e-03
</td>

<td style="text-align:left;">

9.21e-02
</td>

<td style="text-align:left;">

8.99e-03
</td>

<td style="text-align:left;">

8.99e-03
</td>

<td style="text-align:left;">

2.95e-02
</td>

<td style="text-align:left;">

2.95e-02
</td>

<td style="text-align:left;">

2.95e-02
</td>

</tr>

<tr>

<td style="text-align:left;">

Parabacteroides
</td>

<td style="text-align:left;">

1.20e-02
</td>

<td style="text-align:left;">

3.32e-02
</td>

<td style="text-align:left;">

1.95e-01
</td>

<td style="text-align:left;">

6.29e-02
</td>

<td style="text-align:left;">

2.29e-02
</td>

<td style="text-align:left;">

1.23e-02
</td>

<td style="text-align:left;">

1.23e-02
</td>

<td style="text-align:left;">

3.32e-02
</td>

<td style="text-align:left;">

3.32e-02
</td>

<td style="text-align:left;">

3.32e-02
</td>

</tr>

<tr>

<td style="text-align:left;">

Fusobacterium
</td>

<td style="text-align:left;">

1.70e-02
</td>

<td style="text-align:left;">

4.62e-01
</td>

<td style="text-align:left;">

3.08e-01
</td>

<td style="text-align:left;">

3.37e-01
</td>

<td style="text-align:left;">

2.21e-01
</td>

<td style="text-align:left;">

1.70e-02
</td>

<td style="text-align:left;">

1.70e-02
</td>

<td style="text-align:left;">

4.62e-01
</td>

<td style="text-align:left;">

4.62e-01
</td>

<td style="text-align:left;">

4.62e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Sellimonas
</td>

<td style="text-align:left;">

1.80e-02
</td>

<td style="text-align:left;">

1.20e-01
</td>

<td style="text-align:left;">

1.46e-02
</td>

<td style="text-align:left;">

9.89e-02
</td>

<td style="text-align:left;">

2.63e-03
</td>

<td style="text-align:left;">

2.25e-02
</td>

<td style="text-align:left;">

2.25e-02
</td>

<td style="text-align:left;">

1.20e-01
</td>

<td style="text-align:left;">

1.20e-01
</td>

<td style="text-align:left;">

1.20e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Erysipelatoclostridium
</td>

<td style="text-align:left;">

3.10e-02
</td>

<td style="text-align:left;">

9.10e-03
</td>

<td style="text-align:left;">

2.00e-02
</td>

<td style="text-align:left;">

3.66e-02
</td>

<td style="text-align:left;">

4.35e-02
</td>

<td style="text-align:left;">

2.49e-02
</td>

<td style="text-align:left;">

2.49e-02
</td>

<td style="text-align:left;">

8.96e-03
</td>

<td style="text-align:left;">

8.96e-03
</td>

<td style="text-align:left;">

8.79e-03
</td>

</tr>

<tr>

<td style="text-align:left;">

Leuconostoc
</td>

<td style="text-align:left;">

2.70e-02
</td>

<td style="text-align:left;">

9.35e-02
</td>

<td style="text-align:left;">

9.31e-02
</td>

<td style="text-align:left;">

9.21e-02
</td>

<td style="text-align:left;">

8.33e-03
</td>

<td style="text-align:left;">

2.70e-02
</td>

<td style="text-align:left;">

2.70e-02
</td>

<td style="text-align:left;">

9.35e-02
</td>

<td style="text-align:left;">

9.35e-02
</td>

<td style="text-align:left;">

9.35e-02
</td>

</tr>

<tr>

<td style="text-align:left;">

Peptoniphilus
</td>

<td style="text-align:left;">

6.29e-02
</td>

<td style="text-align:left;">

1.45e-01
</td>

<td style="text-align:left;">

5.08e-02
</td>

<td style="text-align:left;">

1.28e-01
</td>

<td style="text-align:left;">

4.96e-02
</td>

<td style="text-align:left;">

2.73e-02
</td>

<td style="text-align:left;">

2.73e-02
</td>

<td style="text-align:left;">

1.45e-01
</td>

<td style="text-align:left;">

1.45e-01
</td>

<td style="text-align:left;">

1.45e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Haemophilus
</td>

<td style="text-align:left;">

2.90e-02
</td>

<td style="text-align:left;">

6.20e-03
</td>

<td style="text-align:left;">

4.03e-02
</td>

<td style="text-align:left;">

7.70e-04
</td>

<td style="text-align:left;">

3.17e-03
</td>

<td style="text-align:left;">

2.80e-02
</td>

<td style="text-align:left;">

2.80e-02
</td>

<td style="text-align:left;">

5.65e-03
</td>

<td style="text-align:left;">

5.65e-03
</td>

<td style="text-align:left;">

5.88e-03
</td>

</tr>

<tr>

<td style="text-align:left;">

Lactobacillus
</td>

<td style="text-align:left;">

2.80e-02
</td>

<td style="text-align:left;">

5.81e-02
</td>

<td style="text-align:left;">

8.10e-04
</td>

<td style="text-align:left;">

7.79e-02
</td>

<td style="text-align:left;">

8.35e-02
</td>

<td style="text-align:left;">

2.85e-02
</td>

<td style="text-align:left;">

2.85e-02
</td>

<td style="text-align:left;">

5.81e-02
</td>

<td style="text-align:left;">

5.81e-02
</td>

<td style="text-align:left;">

5.50e-02
</td>

</tr>

<tr>

<td style="text-align:left;">

uncultured18
</td>

<td style="text-align:left;">

2.10e-02
</td>

<td style="text-align:left;">

4.20e-03
</td>

<td style="text-align:left;">

1.11e-02
</td>

<td style="text-align:left;">

5.69e-02
</td>

<td style="text-align:left;">

3.22e-03
</td>

<td style="text-align:left;">

2.86e-02
</td>

<td style="text-align:left;">

2.86e-02
</td>

<td style="text-align:left;">

4.20e-03
</td>

<td style="text-align:left;">

4.20e-03
</td>

<td style="text-align:left;">

4.20e-03
</td>

</tr>

<tr>

<td style="text-align:left;">

Faecalitalea
</td>

<td style="text-align:left;">

2.90e-02
</td>

<td style="text-align:left;">

3.14e-02
</td>

<td style="text-align:left;">

2.09e-01
</td>

<td style="text-align:left;">

2.79e-02
</td>

<td style="text-align:left;">

2.78e-02
</td>

<td style="text-align:left;">

2.90e-02
</td>

<td style="text-align:left;">

2.90e-02
</td>

<td style="text-align:left;">

3.14e-02
</td>

<td style="text-align:left;">

3.14e-02
</td>

<td style="text-align:left;">

3.14e-02
</td>

</tr>

<tr>

<td style="text-align:left;">

Coprobacillus
</td>

<td style="text-align:left;">

2.90e-02
</td>

<td style="text-align:left;">

7.90e-03
</td>

<td style="text-align:left;">

8.10e-03
</td>

<td style="text-align:left;">

8.42e-03
</td>

<td style="text-align:left;">

8.38e-03
</td>

<td style="text-align:left;">

2.90e-02
</td>

<td style="text-align:left;">

2.90e-02
</td>

<td style="text-align:left;">

7.90e-03
</td>

<td style="text-align:left;">

7.90e-03
</td>

<td style="text-align:left;">

7.90e-03
</td>

</tr>

<tr>

<td style="text-align:left;">

Anaerococcus
</td>

<td style="text-align:left;">

2.60e-02
</td>

<td style="text-align:left;">

3.57e-02
</td>

<td style="text-align:left;">

7.19e-01
</td>

<td style="text-align:left;">

3.59e-02
</td>

<td style="text-align:left;">

8.12e-01
</td>

<td style="text-align:left;">

3.04e-02
</td>

<td style="text-align:left;">

3.04e-02
</td>

<td style="text-align:left;">

3.57e-02
</td>

<td style="text-align:left;">

3.57e-02
</td>

<td style="text-align:left;">

3.57e-02
</td>

</tr>

<tr>

<td style="text-align:left;">

Phascolarctobacterium
</td>

<td style="text-align:left;">

3.90e-02
</td>

<td style="text-align:left;">

7.87e-01
</td>

<td style="text-align:left;">

7.88e-01
</td>

<td style="text-align:left;">

2.63e-02
</td>

<td style="text-align:left;">

7.88e-01
</td>

<td style="text-align:left;">

3.90e-02
</td>

<td style="text-align:left;">

3.90e-02
</td>

<td style="text-align:left;">

7.87e-01
</td>

<td style="text-align:left;">

7.87e-01
</td>

<td style="text-align:left;">

7.87e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Veillonella
</td>

<td style="text-align:left;">

3.70e-02
</td>

<td style="text-align:left;">

1.27e-02
</td>

<td style="text-align:left;">

5.38e-02
</td>

<td style="text-align:left;">

3.73e-03
</td>

<td style="text-align:left;">

2.78e-01
</td>

<td style="text-align:left;">

3.94e-02
</td>

<td style="text-align:left;">

3.94e-02
</td>

<td style="text-align:left;">

1.33e-02
</td>

<td style="text-align:left;">

1.33e-02
</td>

<td style="text-align:left;">

1.29e-02
</td>

</tr>

<tr>

<td style="text-align:left;">

Faecalicoccus
</td>

<td style="text-align:left;">

5.00e-02
</td>

<td style="text-align:left;">

9.20e-02
</td>

<td style="text-align:left;">

2.80e-02
</td>

<td style="text-align:left;">

2.77e-02
</td>

<td style="text-align:left;">

2.79e-02
</td>

<td style="text-align:left;">

5.00e-02
</td>

<td style="text-align:left;">

5.00e-02
</td>

<td style="text-align:left;">

9.20e-02
</td>

<td style="text-align:left;">

9.20e-02
</td>

<td style="text-align:left;">

9.20e-02
</td>

</tr>

<tr>

<td style="text-align:left;">

Staphylococcus
</td>

<td style="text-align:left;">

6.89e-02
</td>

<td style="text-align:left;">

2.59e-01
</td>

<td style="text-align:left;">

1.45e-01
</td>

<td style="text-align:left;">

4.33e-01
</td>

<td style="text-align:left;">

8.32e-02
</td>

<td style="text-align:left;">

6.11e-02
</td>

<td style="text-align:left;">

6.11e-02
</td>

<td style="text-align:left;">

2.59e-01
</td>

<td style="text-align:left;">

2.59e-01
</td>

<td style="text-align:left;">

2.59e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Delftia
</td>

<td style="text-align:left;">

6.49e-02
</td>

<td style="text-align:left;">

9.80e-03
</td>

<td style="text-align:left;">

1.65e-01
</td>

<td style="text-align:left;">

2.76e-01
</td>

<td style="text-align:left;">

4.13e-02
</td>

<td style="text-align:left;">

6.49e-02
</td>

<td style="text-align:left;">

6.49e-02
</td>

<td style="text-align:left;">

9.80e-03
</td>

<td style="text-align:left;">

9.80e-03
</td>

<td style="text-align:left;">

9.80e-03
</td>

</tr>

<tr>

<td style="text-align:left;">

Bilophila
</td>

<td style="text-align:left;">

9.99e-02
</td>

<td style="text-align:left;">

1.35e-01
</td>

<td style="text-align:left;">

6.18e-01
</td>

<td style="text-align:left;">

4.04e-01
</td>

<td style="text-align:left;">

2.40e-01
</td>

<td style="text-align:left;">

9.79e-02
</td>

<td style="text-align:left;">

9.79e-02
</td>

<td style="text-align:left;">

1.35e-01
</td>

<td style="text-align:left;">

1.35e-01
</td>

<td style="text-align:left;">

1.35e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Anaerostipes
</td>

<td style="text-align:left;">

1.14e-01
</td>

<td style="text-align:left;">

8.01e-01
</td>

<td style="text-align:left;">

4.89e-01
</td>

<td style="text-align:left;">

8.36e-01
</td>

<td style="text-align:left;">

1.17e-01
</td>

<td style="text-align:left;">

1.14e-01
</td>

<td style="text-align:left;">

1.14e-01
</td>

<td style="text-align:left;">

8.01e-01
</td>

<td style="text-align:left;">

8.01e-01
</td>

<td style="text-align:left;">

8.01e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Scardovia
</td>

<td style="text-align:left;">

1.17e-01
</td>

<td style="text-align:left;">

1.81e-01
</td>

<td style="text-align:left;">

1.96e-01
</td>

<td style="text-align:left;">

3.20e-01
</td>

<td style="text-align:left;">

1.85e-01
</td>

<td style="text-align:left;">

1.17e-01
</td>

<td style="text-align:left;">

1.17e-01
</td>

<td style="text-align:left;">

1.81e-01
</td>

<td style="text-align:left;">

1.81e-01
</td>

<td style="text-align:left;">

1.81e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Enterobacteriaceae(F)
</td>

<td style="text-align:left;">

1.55e-01
</td>

<td style="text-align:left;">

5.27e-01
</td>

<td style="text-align:left;">

1.53e-01
</td>

<td style="text-align:left;">

2.05e-01
</td>

<td style="text-align:left;">

3.52e-01
</td>

<td style="text-align:left;">

1.55e-01
</td>

<td style="text-align:left;">

1.55e-01
</td>

<td style="text-align:left;">

5.27e-01
</td>

<td style="text-align:left;">

5.27e-01
</td>

<td style="text-align:left;">

5.27e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Rothia
</td>

<td style="text-align:left;">

1.70e-01
</td>

<td style="text-align:left;">

2.13e-01
</td>

<td style="text-align:left;">

1.85e-02
</td>

<td style="text-align:left;">

4.49e-01
</td>

<td style="text-align:left;">

4.37e-01
</td>

<td style="text-align:left;">

1.70e-01
</td>

<td style="text-align:left;">

1.70e-01
</td>

<td style="text-align:left;">

2.13e-01
</td>

<td style="text-align:left;">

2.13e-01
</td>

<td style="text-align:left;">

2.13e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Actinomyces
</td>

<td style="text-align:left;">

1.75e-01
</td>

<td style="text-align:left;">

8.27e-02
</td>

<td style="text-align:left;">

3.46e-01
</td>

<td style="text-align:left;">

8.88e-02
</td>

<td style="text-align:left;">

1.91e-01
</td>

<td style="text-align:left;">

1.75e-01
</td>

<td style="text-align:left;">

1.75e-01
</td>

<td style="text-align:left;">

8.27e-02
</td>

<td style="text-align:left;">

8.27e-02
</td>

<td style="text-align:left;">

8.15e-02
</td>

</tr>

<tr>

<td style="text-align:left;">

Atopobium
</td>

<td style="text-align:left;">

1.81e-01
</td>

<td style="text-align:left;">

1.29e-01
</td>

<td style="text-align:left;">

7.42e-01
</td>

<td style="text-align:left;">

5.87e-01
</td>

<td style="text-align:left;">

2.23e-01
</td>

<td style="text-align:left;">

1.81e-01
</td>

<td style="text-align:left;">

1.81e-01
</td>

<td style="text-align:left;">

1.29e-01
</td>

<td style="text-align:left;">

1.29e-01
</td>

<td style="text-align:left;">

1.29e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Incertae_Sedis
</td>

<td style="text-align:left;">

2.01e-01
</td>

<td style="text-align:left;">

8.60e-01
</td>

<td style="text-align:left;">

3.74e-01
</td>

<td style="text-align:left;">

7.71e-01
</td>

<td style="text-align:left;">

2.73e-01
</td>

<td style="text-align:left;">

2.01e-01
</td>

<td style="text-align:left;">

2.01e-01
</td>

<td style="text-align:left;">

8.60e-01
</td>

<td style="text-align:left;">

8.60e-01
</td>

<td style="text-align:left;">

8.60e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Olsenella
</td>

<td style="text-align:left;">

2.12e-01
</td>

<td style="text-align:left;">

2.21e-01
</td>

<td style="text-align:left;">

2.91e-01
</td>

<td style="text-align:left;">

4.98e-01
</td>

<td style="text-align:left;">

3.17e-01
</td>

<td style="text-align:left;">

2.12e-01
</td>

<td style="text-align:left;">

2.12e-01
</td>

<td style="text-align:left;">

2.21e-01
</td>

<td style="text-align:left;">

2.21e-01
</td>

<td style="text-align:left;">

2.21e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Clostridium_sensu_strict18
</td>

<td style="text-align:left;">

2.21e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

9.20e-02
</td>

<td style="text-align:left;">

5.89e-01
</td>

<td style="text-align:left;">

2.21e-01
</td>

<td style="text-align:left;">

2.21e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

</tr>

<tr>

<td style="text-align:left;">

Dorea
</td>

<td style="text-align:left;">

2.38e-01
</td>

<td style="text-align:left;">

1.23e-01
</td>

<td style="text-align:left;">

5.65e-02
</td>

<td style="text-align:left;">

3.84e-02
</td>

<td style="text-align:left;">

3.27e-02
</td>

<td style="text-align:left;">

2.38e-01
</td>

<td style="text-align:left;">

2.38e-01
</td>

<td style="text-align:left;">

1.23e-01
</td>

<td style="text-align:left;">

1.23e-01
</td>

<td style="text-align:left;">

1.23e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Proteus
</td>

<td style="text-align:left;">

2.66e-01
</td>

<td style="text-align:left;">

6.89e-01
</td>

<td style="text-align:left;">

9.36e-01
</td>

<td style="text-align:left;">

9.78e-01
</td>

<td style="text-align:left;">

6.72e-01
</td>

<td style="text-align:left;">

2.66e-01
</td>

<td style="text-align:left;">

2.66e-01
</td>

<td style="text-align:left;">

6.89e-01
</td>

<td style="text-align:left;">

6.89e-01
</td>

<td style="text-align:left;">

6.89e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Hungatella
</td>

<td style="text-align:left;">

2.69e-01
</td>

<td style="text-align:left;">

4.01e-01
</td>

<td style="text-align:left;">

2.23e-01
</td>

<td style="text-align:left;">

4.01e-02
</td>

<td style="text-align:left;">

3.59e-01
</td>

<td style="text-align:left;">

2.69e-01
</td>

<td style="text-align:left;">

2.69e-01
</td>

<td style="text-align:left;">

4.01e-01
</td>

<td style="text-align:left;">

4.01e-01
</td>

<td style="text-align:left;">

4.01e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Megasphaera
</td>

<td style="text-align:left;">

2.82e-01
</td>

<td style="text-align:left;">

7.77e-01
</td>

<td style="text-align:left;">

5.46e-01
</td>

<td style="text-align:left;">

1.82e-01
</td>

<td style="text-align:left;">

7.05e-01
</td>

<td style="text-align:left;">

2.82e-01
</td>

<td style="text-align:left;">

2.82e-01
</td>

<td style="text-align:left;">

7.77e-01
</td>

<td style="text-align:left;">

7.77e-01
</td>

<td style="text-align:left;">

7.77e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Coprococcus
</td>

<td style="text-align:left;">

2.97e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

9.14e-02
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

2.97e-01
</td>

<td style="text-align:left;">

2.97e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

</tr>

<tr>

<td style="text-align:left;">

Flavonifractor
</td>

<td style="text-align:left;">

3.19e-01
</td>

<td style="text-align:left;">

2.26e-02
</td>

<td style="text-align:left;">

8.83e-01
</td>

<td style="text-align:left;">

2.30e-01
</td>

<td style="text-align:left;">

7.25e-02
</td>

<td style="text-align:left;">

3.19e-01
</td>

<td style="text-align:left;">

3.19e-01
</td>

<td style="text-align:left;">

2.26e-02
</td>

<td style="text-align:left;">

2.26e-02
</td>

<td style="text-align:left;">

2.26e-02
</td>

</tr>

<tr>

<td style="text-align:left;">

22_Lachnospiraceae(F)
</td>

<td style="text-align:left;">

3.19e-01
</td>

<td style="text-align:left;">

6.07e-02
</td>

<td style="text-align:left;">

1.57e-01
</td>

<td style="text-align:left;">

7.43e-03
</td>

<td style="text-align:left;">

6.17e-02
</td>

<td style="text-align:left;">

3.19e-01
</td>

<td style="text-align:left;">

3.19e-01
</td>

<td style="text-align:left;">

6.07e-02
</td>

<td style="text-align:left;">

6.07e-02
</td>

<td style="text-align:left;">

6.07e-02
</td>

</tr>

<tr>

<td style="text-align:left;">

Peptostreptococcus
</td>

<td style="text-align:left;">

3.22e-01
</td>

<td style="text-align:left;">

1.63e-01
</td>

<td style="text-align:left;">

3.05e-01
</td>

<td style="text-align:left;">

3.05e-01
</td>

<td style="text-align:left;">

7.88e-01
</td>

<td style="text-align:left;">

3.22e-01
</td>

<td style="text-align:left;">

3.22e-01
</td>

<td style="text-align:left;">

1.63e-01
</td>

<td style="text-align:left;">

1.63e-01
</td>

<td style="text-align:left;">

1.63e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Blastococcus
</td>

<td style="text-align:left;">

3.25e-01
</td>

<td style="text-align:left;">

3.12e-01
</td>

<td style="text-align:left;">

3.05e-01
</td>

<td style="text-align:left;">

9.17e-02
</td>

<td style="text-align:left;">

9.22e-02
</td>

<td style="text-align:left;">

3.25e-01
</td>

<td style="text-align:left;">

3.25e-01
</td>

<td style="text-align:left;">

3.12e-01
</td>

<td style="text-align:left;">

3.12e-01
</td>

<td style="text-align:left;">

3.12e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Family_XIII_AD3011_group
</td>

<td style="text-align:left;">

3.31e-01
</td>

<td style="text-align:left;">

3.13e-01
</td>

<td style="text-align:left;">

3.03e-01
</td>

<td style="text-align:left;">

3.05e-01
</td>

<td style="text-align:left;">

3.04e-01
</td>

<td style="text-align:left;">

3.31e-01
</td>

<td style="text-align:left;">

3.31e-01
</td>

<td style="text-align:left;">

3.13e-01
</td>

<td style="text-align:left;">

3.13e-01
</td>

<td style="text-align:left;">

3.13e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Roseburia
</td>

<td style="text-align:left;">

3.91e-01
</td>

<td style="text-align:left;">

1.43e-01
</td>

<td style="text-align:left;">

1.82e-01
</td>

<td style="text-align:left;">

1.71e-01
</td>

<td style="text-align:left;">

1.84e-01
</td>

<td style="text-align:left;">

3.91e-01
</td>

<td style="text-align:left;">

3.91e-01
</td>

<td style="text-align:left;">

1.43e-01
</td>

<td style="text-align:left;">

1.43e-01
</td>

<td style="text-align:left;">

1.43e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Escherichia-Shigella
</td>

<td style="text-align:left;">

3.98e-01
</td>

<td style="text-align:left;">

6.80e-01
</td>

<td style="text-align:left;">

8.51e-01
</td>

<td style="text-align:left;">

4.47e-01
</td>

<td style="text-align:left;">

5.97e-01
</td>

<td style="text-align:left;">

3.98e-01
</td>

<td style="text-align:left;">

3.98e-01
</td>

<td style="text-align:left;">

6.80e-01
</td>

<td style="text-align:left;">

6.80e-01
</td>

<td style="text-align:left;">

6.80e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Subdoligranulum
</td>

<td style="text-align:left;">

3.99e-01
</td>

<td style="text-align:left;">

4.70e-01
</td>

<td style="text-align:left;">

2.03e-01
</td>

<td style="text-align:left;">

1.83e-01
</td>

<td style="text-align:left;">

5.18e-01
</td>

<td style="text-align:left;">

3.99e-01
</td>

<td style="text-align:left;">

3.99e-01
</td>

<td style="text-align:left;">

4.70e-01
</td>

<td style="text-align:left;">

4.70e-01
</td>

<td style="text-align:left;">

4.70e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Erysipelotrichaceae_UCG-003
</td>

<td style="text-align:left;">

4.01e-01
</td>

<td style="text-align:left;">

8.45e-01
</td>

<td style="text-align:left;">

7.75e-01
</td>

<td style="text-align:left;">

9.23e-01
</td>

<td style="text-align:left;">

1.84e-01
</td>

<td style="text-align:left;">

4.01e-01
</td>

<td style="text-align:left;">

4.01e-01
</td>

<td style="text-align:left;">

8.45e-01
</td>

<td style="text-align:left;">

8.45e-01
</td>

<td style="text-align:left;">

8.45e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Fusicatenibacter
</td>

<td style="text-align:left;">

4.01e-01
</td>

<td style="text-align:left;">

4.87e-01
</td>

<td style="text-align:left;">

9.11e-01
</td>

<td style="text-align:left;">

8.85e-01
</td>

<td style="text-align:left;">

3.36e-01
</td>

<td style="text-align:left;">

4.01e-01
</td>

<td style="text-align:left;">

4.01e-01
</td>

<td style="text-align:left;">

4.87e-01
</td>

<td style="text-align:left;">

4.87e-01
</td>

<td style="text-align:left;">

4.87e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

UBA1819
</td>

<td style="text-align:left;">

4.27e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

7.03e-01
</td>

<td style="text-align:left;">

2.54e-01
</td>

<td style="text-align:left;">

2.08e-01
</td>

<td style="text-align:left;">

4.27e-01
</td>

<td style="text-align:left;">

4.27e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

</tr>

<tr>

<td style="text-align:left;">

Akkermansia
</td>

<td style="text-align:left;">

4.33e-01
</td>

<td style="text-align:left;">

1.05e-01
</td>

<td style="text-align:left;">

5.93e-01
</td>

<td style="text-align:left;">

9.99e-01
</td>

<td style="text-align:left;">

4.47e-01
</td>

<td style="text-align:left;">

4.33e-01
</td>

<td style="text-align:left;">

4.33e-01
</td>

<td style="text-align:left;">

1.05e-01
</td>

<td style="text-align:left;">

1.05e-01
</td>

<td style="text-align:left;">

1.05e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Gordonibacter
</td>

<td style="text-align:left;">

4.37e-01
</td>

<td style="text-align:left;">

4.63e-02
</td>

<td style="text-align:left;">

8.17e-03
</td>

<td style="text-align:left;">

2.60e-03
</td>

<td style="text-align:left;">

2.79e-02
</td>

<td style="text-align:left;">

4.37e-01
</td>

<td style="text-align:left;">

4.37e-01
</td>

<td style="text-align:left;">

4.63e-02
</td>

<td style="text-align:left;">

4.63e-02
</td>

<td style="text-align:left;">

4.63e-02
</td>

</tr>

<tr>

<td style="text-align:left;">

Libanicoccus
</td>

<td style="text-align:left;">

4.66e-01
</td>

<td style="text-align:left;">

2.72e-01
</td>

<td style="text-align:left;">

3.25e-01
</td>

<td style="text-align:left;">

4.75e-01
</td>

<td style="text-align:left;">

7.73e-01
</td>

<td style="text-align:left;">

4.66e-01
</td>

<td style="text-align:left;">

4.66e-01
</td>

<td style="text-align:left;">

2.72e-01
</td>

<td style="text-align:left;">

2.72e-01
</td>

<td style="text-align:left;">

2.72e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Holdemanella
</td>

<td style="text-align:left;">

5.30e-01
</td>

<td style="text-align:left;">

3.40e-03
</td>

<td style="text-align:left;">

6.76e-02
</td>

<td style="text-align:left;">

3.34e-03
</td>

<td style="text-align:left;">

6.55e-02
</td>

<td style="text-align:left;">

5.30e-01
</td>

<td style="text-align:left;">

5.30e-01
</td>

<td style="text-align:left;">

3.40e-03
</td>

<td style="text-align:left;">

3.40e-03
</td>

<td style="text-align:left;">

3.40e-03
</td>

</tr>

<tr>

<td style="text-align:left;">

Faecalibacterium
</td>

<td style="text-align:left;">

5.43e-01
</td>

<td style="text-align:left;">

2.04e-01
</td>

<td style="text-align:left;">

8.42e-01
</td>

<td style="text-align:left;">

4.98e-01
</td>

<td style="text-align:left;">

2.06e-01
</td>

<td style="text-align:left;">

5.43e-01
</td>

<td style="text-align:left;">

5.43e-01
</td>

<td style="text-align:left;">

2.04e-01
</td>

<td style="text-align:left;">

2.04e-01
</td>

<td style="text-align:left;">

2.04e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

8_Comamonadaceae(F)
</td>

<td style="text-align:left;">

5.49e-01
</td>

<td style="text-align:left;">

5.76e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

3.19e-01
</td>

<td style="text-align:left;">

5.76e-01
</td>

<td style="text-align:left;">

5.49e-01
</td>

<td style="text-align:left;">

5.49e-01
</td>

<td style="text-align:left;">

5.76e-01
</td>

<td style="text-align:left;">

5.76e-01
</td>

<td style="text-align:left;">

5.76e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Slackia
</td>

<td style="text-align:left;">

5.61e-01
</td>

<td style="text-align:left;">

3.03e-01
</td>

<td style="text-align:left;">

2.87e-02
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

5.76e-01
</td>

<td style="text-align:left;">

5.61e-01
</td>

<td style="text-align:left;">

5.61e-01
</td>

<td style="text-align:left;">

3.03e-01
</td>

<td style="text-align:left;">

3.03e-01
</td>

<td style="text-align:left;">

3.03e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

21_Bifidobacteriaceae(F)
</td>

<td style="text-align:left;">

5.61e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

5.80e-01
</td>

<td style="text-align:left;">

2.21e-01
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

5.61e-01
</td>

<td style="text-align:left;">

5.61e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

</tr>

<tr>

<td style="text-align:left;">

Varibaculum
</td>

<td style="text-align:left;">

5.63e-01
</td>

<td style="text-align:left;">

2.20e-01
</td>

<td style="text-align:left;">

7.39e-01
</td>

<td style="text-align:left;">

9.25e-01
</td>

<td style="text-align:left;">

9.12e-01
</td>

<td style="text-align:left;">

5.63e-01
</td>

<td style="text-align:left;">

5.63e-01
</td>

<td style="text-align:left;">

2.20e-01
</td>

<td style="text-align:left;">

2.20e-01
</td>

<td style="text-align:left;">

2.20e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Eubacterium
</td>

<td style="text-align:left;">

5.66e-01
</td>

<td style="text-align:left;">

1.17e-02
</td>

<td style="text-align:left;">

1.08e-01
</td>

<td style="text-align:left;">

5.18e-02
</td>

<td style="text-align:left;">

2.79e-02
</td>

<td style="text-align:left;">

5.66e-01
</td>

<td style="text-align:left;">

5.66e-01
</td>

<td style="text-align:left;">

1.17e-02
</td>

<td style="text-align:left;">

1.17e-02
</td>

<td style="text-align:left;">

1.17e-02
</td>

</tr>

<tr>

<td style="text-align:left;">

\[Eubacterium\]\_eligengroup
</td>

<td style="text-align:left;">

5.72e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

5.88e-01
</td>

<td style="text-align:left;">

3.19e-01
</td>

<td style="text-align:left;">

3.20e-01
</td>

<td style="text-align:left;">

5.72e-01
</td>

<td style="text-align:left;">

5.72e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

</tr>

<tr>

<td style="text-align:left;">

Agathobacter
</td>

<td style="text-align:left;">

5.75e-01
</td>

<td style="text-align:left;">

5.40e-01
</td>

<td style="text-align:left;">

6.47e-01
</td>

<td style="text-align:left;">

3.16e-01
</td>

<td style="text-align:left;">

8.37e-01
</td>

<td style="text-align:left;">

5.75e-01
</td>

<td style="text-align:left;">

5.75e-01
</td>

<td style="text-align:left;">

5.40e-01
</td>

<td style="text-align:left;">

5.40e-01
</td>

<td style="text-align:left;">

5.40e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Pseudomonas
</td>

<td style="text-align:left;">

5.78e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

5.78e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

5.78e-01
</td>

<td style="text-align:left;">

5.78e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

</tr>

<tr>

<td style="text-align:left;">

Morganella
</td>

<td style="text-align:left;">

5.87e-01
</td>

<td style="text-align:left;">

5.75e-01
</td>

<td style="text-align:left;">

5.74e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

7.95e-01
</td>

<td style="text-align:left;">

5.87e-01
</td>

<td style="text-align:left;">

5.87e-01
</td>

<td style="text-align:left;">

5.75e-01
</td>

<td style="text-align:left;">

5.75e-01
</td>

<td style="text-align:left;">

5.75e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Coprobacter
</td>

<td style="text-align:left;">

5.90e-01
</td>

<td style="text-align:left;">

5.75e-01
</td>

<td style="text-align:left;">

7.95e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

7.95e-01
</td>

<td style="text-align:left;">

5.90e-01
</td>

<td style="text-align:left;">

5.90e-01
</td>

<td style="text-align:left;">

5.75e-01
</td>

<td style="text-align:left;">

5.75e-01
</td>

<td style="text-align:left;">

5.75e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Butyricicoccus
</td>

<td style="text-align:left;">

5.92e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

5.57e-01
</td>

<td style="text-align:left;">

5.58e-01
</td>

<td style="text-align:left;">

5.76e-01
</td>

<td style="text-align:left;">

5.92e-01
</td>

<td style="text-align:left;">

5.92e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

</tr>

<tr>

<td style="text-align:left;">

Dolosigranulum
</td>

<td style="text-align:left;">

6.06e-01
</td>

<td style="text-align:left;">

3.14e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

6.87e-01
</td>

<td style="text-align:left;">

6.06e-01
</td>

<td style="text-align:left;">

6.06e-01
</td>

<td style="text-align:left;">

3.14e-01
</td>

<td style="text-align:left;">

3.14e-01
</td>

<td style="text-align:left;">

3.14e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Corynebacterium
</td>

<td style="text-align:left;">

6.08e-01
</td>

<td style="text-align:left;">

2.24e-01
</td>

<td style="text-align:left;">

5.62e-01
</td>

<td style="text-align:left;">

4.75e-01
</td>

<td style="text-align:left;">

3.17e-01
</td>

<td style="text-align:left;">

6.08e-01
</td>

<td style="text-align:left;">

6.08e-01
</td>

<td style="text-align:left;">

2.24e-01
</td>

<td style="text-align:left;">

2.24e-01
</td>

<td style="text-align:left;">

2.24e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Dialister
</td>

<td style="text-align:left;">

6.11e-01
</td>

<td style="text-align:left;">

1.07e-01
</td>

<td style="text-align:left;">

3.74e-01
</td>

<td style="text-align:left;">

2.21e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

6.11e-01
</td>

<td style="text-align:left;">

6.11e-01
</td>

<td style="text-align:left;">

1.07e-01
</td>

<td style="text-align:left;">

1.07e-01
</td>

<td style="text-align:left;">

1.07e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Prevotella
</td>

<td style="text-align:left;">

6.36e-01
</td>

<td style="text-align:left;">

9.70e-01
</td>

<td style="text-align:left;">

5.46e-01
</td>

<td style="text-align:left;">

3.16e-01
</td>

<td style="text-align:left;">

9.09e-01
</td>

<td style="text-align:left;">

6.36e-01
</td>

<td style="text-align:left;">

6.36e-01
</td>

<td style="text-align:left;">

9.70e-01
</td>

<td style="text-align:left;">

9.70e-01
</td>

<td style="text-align:left;">

9.70e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Lachnoclostridium
</td>

<td style="text-align:left;">

6.60e-01
</td>

<td style="text-align:left;">

7.51e-01
</td>

<td style="text-align:left;">

1.79e-01
</td>

<td style="text-align:left;">

7.83e-01
</td>

<td style="text-align:left;">

4.09e-01
</td>

<td style="text-align:left;">

6.60e-01
</td>

<td style="text-align:left;">

6.60e-01
</td>

<td style="text-align:left;">

7.51e-01
</td>

<td style="text-align:left;">

7.51e-01
</td>

<td style="text-align:left;">

7.51e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

CAG-352
</td>

<td style="text-align:left;">

6.80e-01
</td>

<td style="text-align:left;">

8.54e-01
</td>

<td style="text-align:left;">

8.92e-01
</td>

<td style="text-align:left;">

1.79e-01
</td>

<td style="text-align:left;">

6.12e-01
</td>

<td style="text-align:left;">

6.80e-01
</td>

<td style="text-align:left;">

6.80e-01
</td>

<td style="text-align:left;">

8.54e-01
</td>

<td style="text-align:left;">

8.54e-01
</td>

<td style="text-align:left;">

8.54e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Clostridia_UCG-014
</td>

<td style="text-align:left;">

7.86e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

6.67e-02
</td>

<td style="text-align:left;">

2.21e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

7.86e-01
</td>

<td style="text-align:left;">

7.86e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

</tr>

<tr>

<td style="text-align:left;">

Gemella
</td>

<td style="text-align:left;">

8.15e-01
</td>

<td style="text-align:left;">

2.57e-01
</td>

<td style="text-align:left;">

9.27e-01
</td>

<td style="text-align:left;">

3.62e-01
</td>

<td style="text-align:left;">

4.46e-01
</td>

<td style="text-align:left;">

8.15e-01
</td>

<td style="text-align:left;">

8.15e-01
</td>

<td style="text-align:left;">

2.57e-01
</td>

<td style="text-align:left;">

2.57e-01
</td>

<td style="text-align:left;">

2.57e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Senegalimassilia
</td>

<td style="text-align:left;">

8.36e-01
</td>

<td style="text-align:left;">

8.35e-01
</td>

<td style="text-align:left;">

6.55e-01
</td>

<td style="text-align:left;">

3.17e-01
</td>

<td style="text-align:left;">

5.37e-01
</td>

<td style="text-align:left;">

8.36e-01
</td>

<td style="text-align:left;">

8.36e-01
</td>

<td style="text-align:left;">

8.35e-01
</td>

<td style="text-align:left;">

8.35e-01
</td>

<td style="text-align:left;">

8.35e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

\[Eubacterium\]\_hallii_group
</td>

<td style="text-align:left;">

8.36e-01
</td>

<td style="text-align:left;">

6.79e-01
</td>

<td style="text-align:left;">

8.12e-01
</td>

<td style="text-align:left;">

7.05e-01
</td>

<td style="text-align:left;">

6.87e-01
</td>

<td style="text-align:left;">

8.36e-01
</td>

<td style="text-align:left;">

8.36e-01
</td>

<td style="text-align:left;">

6.79e-01
</td>

<td style="text-align:left;">

6.79e-01
</td>

<td style="text-align:left;">

6.79e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Acinetobacter
</td>

<td style="text-align:left;">

8.62e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

3.79e-01
</td>

<td style="text-align:left;">

8.12e-01
</td>

<td style="text-align:left;">

6.73e-01
</td>

<td style="text-align:left;">

8.62e-01
</td>

<td style="text-align:left;">

8.62e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

</tr>

<tr>

<td style="text-align:left;">

Eggerthella
</td>

<td style="text-align:left;">

8.99e-01
</td>

<td style="text-align:left;">

6.49e-01
</td>

<td style="text-align:left;">

9.80e-02
</td>

<td style="text-align:left;">

1.04e-01
</td>

<td style="text-align:left;">

7.96e-02
</td>

<td style="text-align:left;">

8.99e-01
</td>

<td style="text-align:left;">

8.99e-01
</td>

<td style="text-align:left;">

6.49e-01
</td>

<td style="text-align:left;">

6.49e-01
</td>

<td style="text-align:left;">

6.49e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Finegoldia
</td>

<td style="text-align:left;">

9.14e-01
</td>

<td style="text-align:left;">

5.03e-01
</td>

<td style="text-align:left;">

7.83e-01
</td>

<td style="text-align:left;">

1.88e-01
</td>

<td style="text-align:left;">

4.15e-01
</td>

<td style="text-align:left;">

9.14e-01
</td>

<td style="text-align:left;">

9.14e-01
</td>

<td style="text-align:left;">

5.03e-01
</td>

<td style="text-align:left;">

5.03e-01
</td>

<td style="text-align:left;">

5.03e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

\[Ruminococcus\]\_gauvreauii_group
</td>

<td style="text-align:left;">

9.84e-01
</td>

<td style="text-align:left;">

5.27e-01
</td>

<td style="text-align:left;">

8.42e-01
</td>

<td style="text-align:left;">

9.39e-01
</td>

<td style="text-align:left;">

5.44e-01
</td>

<td style="text-align:left;">

9.84e-01
</td>

<td style="text-align:left;">

9.84e-01
</td>

<td style="text-align:left;">

5.27e-01
</td>

<td style="text-align:left;">

5.27e-01
</td>

<td style="text-align:left;">

5.27e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Romboutsia
</td>

<td style="text-align:left;">

9.97e-01
</td>

<td style="text-align:left;">

2.66e-01
</td>

<td style="text-align:left;">

1.27e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

4.77e-01
</td>

<td style="text-align:left;">

9.97e-01
</td>

<td style="text-align:left;">

9.97e-01
</td>

<td style="text-align:left;">

2.66e-01
</td>

<td style="text-align:left;">

2.66e-01
</td>

<td style="text-align:left;">

2.66e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Negativicoccus
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

2.76e-01
</td>

<td style="text-align:left;">

8.14e-01
</td>

<td style="text-align:left;">

6.13e-01
</td>

<td style="text-align:left;">

4.73e-02
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

2.76e-01
</td>

<td style="text-align:left;">

2.76e-01
</td>

<td style="text-align:left;">

2.76e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Anaeroglobus
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

3.03e-01
</td>

<td style="text-align:left;">

3.04e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

</tr>

<tr>

<td style="text-align:left;">

Turicibacter
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

5.60e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

</tr>

<tr>

<td style="text-align:left;">

Halomonas
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

5.58e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

5.77e-01
</td>

<td style="text-align:left;">

5.57e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

5.58e-01
</td>

<td style="text-align:left;">

5.58e-01
</td>

<td style="text-align:left;">

5.58e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Sutterella
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

5.54e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

8.12e-01
</td>

<td style="text-align:left;">

3.04e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

5.54e-01
</td>

<td style="text-align:left;">

5.54e-01
</td>

<td style="text-align:left;">

5.54e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Brevundimonas
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

5.76e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

</tr>

<tr>

<td style="text-align:left;">

Lawsonella
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

</tr>

<tr>

<td style="text-align:left;">

Cutibacterium
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.94e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

</tr>

<tr>

<td style="text-align:left;">

Alistipes
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

5.82e-01
</td>

<td style="text-align:left;">

2.73e-01
</td>

<td style="text-align:left;">

3.98e-01
</td>

<td style="text-align:left;">

6.75e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

5.82e-01
</td>

<td style="text-align:left;">

5.82e-01
</td>

<td style="text-align:left;">

5.82e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Sarcina
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

5.78e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

</tr>

<tr>

<td style="text-align:left;">

Ruminococcus
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

5.75e-01
</td>

<td style="text-align:left;">

5.76e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

</tr>

<tr>

<td style="text-align:left;">

\[Eubacterium\]\_coprostanoligenegroup
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

</tr>

<tr>

<td style="text-align:left;">

Lachnospira
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

</tr>

<tr>

<td style="text-align:left;">

Lachnoanaerobaculum
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

5.75e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

</tr>

<tr>

<td style="text-align:left;">

Lachnospiraceae_NK4A136_group
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

7.00e-01
</td>

<td style="text-align:left;">

7.87e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

7.88e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

7.00e-01
</td>

<td style="text-align:left;">

7.00e-01
</td>

<td style="text-align:left;">

7.00e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Megamonas
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

3.04e-01
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

</tr>

<tr>

<td style="text-align:left;">

Solobacterium
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

</tr>

<tr>

<td style="text-align:left;">

Christensenellaceae_R-7_group
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

5.77e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

</tr>

<tr>

<td style="text-align:left;">

Stenotrophomonas
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

3.04e-01
</td>

<td style="text-align:left;">

3.04e-01
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

</tr>

<tr>

<td style="text-align:left;">

9_Pasteurellaceae(F)
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

</tr>

<tr>

<td style="text-align:left;">

Dermabacter
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

</tr>

<tr>

<td style="text-align:left;">

Actinotignum
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

5.72e-01
</td>

<td style="text-align:left;">

5.74e-01
</td>

<td style="text-align:left;">

5.76e-01
</td>

<td style="text-align:left;">

5.76e-01
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

5.72e-01
</td>

<td style="text-align:left;">

5.72e-01
</td>

<td style="text-align:left;">

5.72e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Porphyromonas
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

3.04e-01
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

</tr>

<tr>

<td style="text-align:left;">

Fenollaria
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

</tr>

<tr>

<td style="text-align:left;">

Monoglobus
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

</tr>

<tr>

<td style="text-align:left;">

Lachnospiraceae_ND3007_group
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

<td style="text-align:left;">

NA
</td>

</tr>

</tbody>

</table>

<table class="table" style="color: black; width: auto !important; margin-left: auto; margin-right: auto;">

<thead>

<tr>

<th style="text-align:left;">

taxon
</th>

<th style="text-align:right;">

n_sig
</th>

<th style="text-align:left;">

sig_any
</th>

<th style="text-align:left;">

sig_all
</th>

<th style="text-align:left;">

dacomp (1e+03)
</th>

<th style="text-align:left;">

dacomp (1e+04)
</th>

<th style="text-align:left;">

dacomp (1e+05)
</th>

<th style="text-align:left;">

dacomp (1e+06)
</th>

<th style="text-align:left;">

dacomp (1e+07)
</th>

<th style="text-align:left;">

permApprox (1e+03, unconstrained, exceed0=250)
</th>

<th style="text-align:left;">

permApprox (1e+03, SLLS, exceed0=250)
</th>

<th style="text-align:left;">

permApprox (1e+04, unconstrained, exceed0=250)
</th>

<th style="text-align:left;">

permApprox (1e+04, SLLS, exceed0=250)
</th>

<th style="text-align:left;">

permApprox (1e+04, SLLS, exceed0=0.25)
</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;">

Bacteroides
</td>

<td style="text-align:right;">

10
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

</tr>

<tr>

<td style="text-align:left;">

Bifidobacterium
</td>

<td style="text-align:right;">

10
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

</tr>

<tr>

<td style="text-align:left;">

Blautia
</td>

<td style="text-align:right;">

10
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

</tr>

<tr>

<td style="text-align:left;">

Clostridium_sensu_strict1
</td>

<td style="text-align:right;">

10
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

</tr>

<tr>

<td style="text-align:left;">

Enterococcus
</td>

<td style="text-align:right;">

10
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

</tr>

<tr>

<td style="text-align:left;">

Intestinibacter
</td>

<td style="text-align:right;">

10
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

</tr>

<tr>

<td style="text-align:left;">

Lactococcus
</td>

<td style="text-align:right;">

10
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

</tr>

<tr>

<td style="text-align:left;">

Streptococcus
</td>

<td style="text-align:right;">

10
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

</tr>

<tr>

<td style="text-align:left;">

Terrisporobacter
</td>

<td style="text-align:right;">

10
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

</tr>

<tr>

<td style="text-align:left;">

\[Clostridium\]\_innocuum_group
</td>

<td style="text-align:right;">

10
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

</tr>

<tr>

<td style="text-align:left;">

\[Ruminococcus\]\_gnavugroup
</td>

<td style="text-align:right;">

10
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

</tr>

<tr>

<td style="text-align:left;">

Coprobacillus
</td>

<td style="text-align:right;">

7
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

</tr>

<tr>

<td style="text-align:left;">

Granulicatella
</td>

<td style="text-align:right;">

6
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

</tr>

<tr>

<td style="text-align:left;">

Haemophilus
</td>

<td style="text-align:right;">

6
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

</tr>

<tr>

<td style="text-align:left;">

Tyzzerella
</td>

<td style="text-align:right;">

6
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

</tr>

<tr>

<td style="text-align:left;">

\[Ruminococcus\]\_torquegroup
</td>

<td style="text-align:right;">

6
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

</tr>

<tr>

<td style="text-align:left;">

Collinsella
</td>

<td style="text-align:right;">

5
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

</tr>

<tr>

<td style="text-align:left;">

Holdemanella
</td>

<td style="text-align:right;">

5
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

</tr>

<tr>

<td style="text-align:left;">

uncultured18
</td>

<td style="text-align:right;">

5
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

</tr>

<tr>

<td style="text-align:left;">

Clostridioides
</td>

<td style="text-align:right;">

4
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

</tr>

<tr>

<td style="text-align:left;">

Delftia
</td>

<td style="text-align:right;">

4
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

</tr>

<tr>

<td style="text-align:left;">

Erysipelatoclostridium
</td>

<td style="text-align:right;">

4
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

</tr>

<tr>

<td style="text-align:left;">

Paeniclostridium
</td>

<td style="text-align:right;">

4
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

</tr>

<tr>

<td style="text-align:left;">

Epulopiscium
</td>

<td style="text-align:right;">

3
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

</tr>

<tr>

<td style="text-align:left;">

Gordonibacter
</td>

<td style="text-align:right;">

2
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

</tr>

<tr>

<td style="text-align:left;">

22_Lachnospiraceae(F)
</td>

<td style="text-align:right;">

1
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

</tr>

<tr>

<td style="text-align:left;">

Lactobacillus
</td>

<td style="text-align:right;">

1
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

</tr>

<tr>

<td style="text-align:left;">

Leuconostoc
</td>

<td style="text-align:right;">

1
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

</tr>

<tr>

<td style="text-align:left;">

Sellimonas
</td>

<td style="text-align:right;">

1
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

</tr>

<tr>

<td style="text-align:left;">

Veillonella
</td>

<td style="text-align:right;">

1
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

TRUE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

<td style="text-align:left;">

FALSE
</td>

</tr>

</tbody>

</table>

## Taxa with zero p-values

<table class="table" style="color: black; width: auto !important; margin-left: auto; margin-right: auto;">

<thead>

<tr>

<th style="text-align:left;">

taxon
</th>

<th style="text-align:left;">

dacomp (1e+03)
</th>

<th style="text-align:left;">

dacomp (1e+04)
</th>

<th style="text-align:left;">

dacomp (1e+05)
</th>

<th style="text-align:left;">

dacomp (1e+06)
</th>

<th style="text-align:left;">

dacomp (1e+07)
</th>

<th style="text-align:left;">

permApprox (1e+03, unconstrained, exceed0=250)
</th>

<th style="text-align:left;">

permApprox (1e+03, SLLS, exceed0=250)
</th>

<th style="text-align:left;">

permApprox (1e+04, unconstrained, exceed0=250)
</th>

<th style="text-align:left;">

permApprox (1e+04, SLLS, exceed0=250)
</th>

<th style="text-align:left;">

permApprox (1e+04, SLLS, exceed0=0.25)
</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;">

Terrisporobacter
</td>

<td style="text-align:left;">

5.30e-03
</td>

<td style="text-align:left;">

8.43e-04
</td>

<td style="text-align:left;">

8.50e-05
</td>

<td style="text-align:left;">

7.26e-04
</td>

<td style="text-align:left;">

7.32e-05
</td>

<td style="text-align:left;">

0.00e+00
</td>

<td style="text-align:left;">

6.74e-08
</td>

<td style="text-align:left;">

1.35e-03
</td>

<td style="text-align:left;">

1.35e-03
</td>

<td style="text-align:left;">

1.35e-03
</td>

</tr>

<tr>

<td style="text-align:left;">

Lactococcus
</td>

<td style="text-align:left;">

5.30e-03
</td>

<td style="text-align:left;">

8.43e-04
</td>

<td style="text-align:left;">

2.37e-04
</td>

<td style="text-align:left;">

3.32e-05
</td>

<td style="text-align:left;">

9.58e-05
</td>

<td style="text-align:left;">

5.46e-04
</td>

<td style="text-align:left;">

5.46e-04
</td>

<td style="text-align:left;">

0.00e+00
</td>

<td style="text-align:left;">

5.26e-19
</td>

<td style="text-align:left;">

1.35e-03
</td>

</tr>

</tbody>

</table>

## Plots

### Volcano plots

#### Plot function

#### Raw p-values - All significant taxa

##### permApprox unconstrained

![](figures/02_micro_diff_abund/app_dacomp_volcano_raw_all_sig_1e3_unconstr-1.png)<!-- -->

![](figures/02_micro_diff_abund/app_dacomp_volcano_raw_selected_1e3_unconstr-1.png)<!-- -->

##### permApprox with 1000 permutations

![](figures/02_micro_diff_abund/app_dacomp_volcano_raw_all_sig_1e3-1.png)<!-- -->

![](figures/02_micro_diff_abund/app_dacomp_volcano_raw_selected_1e3-1.png)<!-- -->

##### permApprox with 10,000 permutations and k0=250

![](figures/02_micro_diff_abund/app_dacomp_volcano_raw_all_sig_1e4_250-1.png)<!-- -->

![](figures/02_micro_diff_abund/app_dacomp_volcano_raw_selected_1e4_250-1.png)<!-- -->

##### permApprox with 10,000 permutations and k0=0.25B

![](figures/02_micro_diff_abund/app_dacomp_volcano_raw_all_sig_1e4_0.25-1.png)<!-- -->

![](figures/02_micro_diff_abund/app_dacomp_volcano_raw_selected_1e4_0.25-1.png)<!-- -->

#### Adjusted p-values - All significant taxa

##### permApprox unconstrained

![](figures/02_micro_diff_abund/app_dacomp_volcano_adj_all_sig_1e3_unconstr-1.png)<!-- -->

![](figures/02_micro_diff_abund/app_dacomp_volcano_adj_selected_1e3_unconstr-1.png)<!-- -->

##### permApprox with 1000 permutations

![](figures/02_micro_diff_abund/app_dacomp_volcano_adj_all_sig_1e3-1.png)<!-- -->

![](figures/02_micro_diff_abund/app_dacomp_volcano_adj_selected_1e3-1.png)<!-- -->

##### permApprox with 10,000 permutations and k0=250

![](figures/02_micro_diff_abund/app_dacomp_volcano_adj_all_sig_1e4_250-1.png)<!-- -->

![](figures/02_micro_diff_abund/app_dacomp_volcano_adj_selected_1e4_250-1.png)<!-- -->

##### permApprox with 10,000 permutations and k0=0.25B

![](figures/02_micro_diff_abund/app_dacomp_volcano_adj_all_sig_1e4_0.25-1.png)<!-- -->

![](figures/02_micro_diff_abund/app_dacomp_volcano_adj_selected_1e4_0.25-1.png)<!-- -->

#### Four panel plots (raw p-values)

##### permApprox with 1000 permutations

![](figures/02_micro_diff_abund/app_dacomp_volcano_raw_four_panel_1e3-1.png)<!-- -->

##### permApprox with 10,000 permutations and k0=250

![](figures/02_micro_diff_abund/app_dacomp_volcano_raw_four_panel_1e4_250-1.png)<!-- -->

##### permApprox with 10,000 permutations and k0=0.25B

![](figures/02_micro_diff_abund/app_dacomp_volcano_raw_four_panel_1e4_025B-1.png)<!-- -->

### Boxplots and Histograms

We plot boxplots for the dacomp-rarefied counts and histograms of the
permutation distributions.

#### 1000 permApprox permutations

##### Significant in ALL settings

![](figures/02_micro_diff_abund/app_dacomp_boxplots_1e3_sig_all-1.png)<!-- -->

![](figures/02_micro_diff_abund/app_dacomp_perm_histograms_1e3_sig_all-1.png)<!-- -->

##### Significant in permApprox only

![](figures/02_micro_diff_abund/app_dacomp_boxplots_1e3_sig_permApprox-1.png)<!-- -->

![](figures/02_micro_diff_abund/app_dacomp_perm_histograms_1e3_sig_permApprox-1.png)<!-- -->

##### Significant in dacomp panels, but not permApprox

![](figures/02_micro_diff_abund/app_dacomp_boxplots_1e3_sig_dacomp-1.png)<!-- -->

![](figures/02_micro_diff_abund/app_dacomp_perm_histograms_1e3_sig_dacomp-1.png)<!-- -->

##### Taxa from four-panel plot for 1e03 permutations

![](figures/02_micro_diff_abund/app_dacomp_boxplots_1e3_four_panel_dacomp-1.png)<!-- -->

![](figures/02_micro_diff_abund/app_dacomp_perm_histograms_1e3_four_panel_dacomp-1.png)<!-- -->

#### 10000 permApprox permutations

##### Significant in ALL settings

![](figures/02_micro_diff_abund/app_dacomp_boxplots_1e4_sig_all-1.png)<!-- -->

![](figures/02_micro_diff_abund/app_dacomp_perm_histograms_1e4_sig_all-1.png)<!-- -->

##### Significant in permApprox only

![](figures/02_micro_diff_abund/app_dacomp_boxplots_1e4_sig_permApprox-1.png)<!-- -->

![](figures/02_micro_diff_abund/app_dacomp_perm_histograms_1e4_sig_permApprox-1.png)<!-- -->

##### Significant in dacomp panels, but not permApprox

![](figures/02_micro_diff_abund/app_dacomp_boxplots_1e4_sig_dacomp-1.png)<!-- -->

![](figures/02_micro_diff_abund/app_dacomp_perm_histograms_1e4_sig_dacomp-1.png)<!-- -->

## Tables

### Unadjusted p-values table

<table class="table" style="color: black; width: auto !important; margin-left: auto; margin-right: auto;">

<caption>

Top 20 genera sorted by permApprox (1e+03, SLLS, exceed0=250)
(unadjusted p-values).
</caption>

<thead>

<tr>

<th style="text-align:left;">

taxon
</th>

<th style="text-align:left;">

log2_fc
</th>

<th style="text-align:left;">

dacomp (1e+03)
</th>

<th style="text-align:left;">

dacomp (1e+06)
</th>

<th style="text-align:left;">

dacomp (1e+07)
</th>

<th style="text-align:left;">

permApprox (1e+03, unconstrained, exceed0=250)
</th>

<th style="text-align:left;">

permApprox (1e+03, SLLS, exceed0=250)
</th>

<th style="text-align:left;">

permApprox (1e+04, unconstrained, exceed0=250)
</th>

<th style="text-align:left;">

permApprox (1e+04, SLLS, exceed0=250)
</th>

<th style="text-align:left;">

permApprox (1e+04, SLLS, exceed0=0.25)
</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;">

Intestinibacter
</td>

<td style="text-align:left;">

-2.63
</td>

<td style="text-align:left;">

9.99e-04
</td>

<td style="text-align:left;">

1.00e-06
</td>

<td style="text-align:left;">

1.00e-07
</td>

<td style="text-align:left;">

1.97e-18
</td>

<td style="text-align:left;">

1.97e-18
</td>

<td style="text-align:left;">

8.45e-08
</td>

<td style="text-align:left;">

8.45e-08
</td>

<td style="text-align:left;">

9.71e-09
</td>

</tr>

<tr>

<td style="text-align:left;">

Enterococcus
</td>

<td style="text-align:left;">

-1.47
</td>

<td style="text-align:left;">

9.99e-04
</td>

<td style="text-align:left;">

1.00e-06
</td>

<td style="text-align:left;">

1.00e-07
</td>

<td style="text-align:left;">

4.25e-13
</td>

<td style="text-align:left;">

4.25e-13
</td>

<td style="text-align:left;">

9.53e-18
</td>

<td style="text-align:left;">

9.53e-18
</td>

<td style="text-align:left;">

2.34e-09
</td>

</tr>

<tr>

<td style="text-align:left;">

Bifidobacterium
</td>

<td style="text-align:left;">

0.23
</td>

<td style="text-align:left;">

9.99e-04
</td>

<td style="text-align:left;">

1.00e-06
</td>

<td style="text-align:left;">

1.00e-07
</td>

<td style="text-align:left;">

2.18e-11
</td>

<td style="text-align:left;">

2.18e-11
</td>

<td style="text-align:left;">

2.51e-11
</td>

<td style="text-align:left;">

2.51e-11
</td>

<td style="text-align:left;">

4.15e-08
</td>

</tr>

<tr>

<td style="text-align:left;">

Terrisporobacter
</td>

<td style="text-align:left;">

-3.19
</td>

<td style="text-align:left;">

9.99e-04
</td>

<td style="text-align:left;">

1.04e-04
</td>

<td style="text-align:left;">

1.02e-05
</td>

<td style="text-align:left;">

0.00e+00
</td>

<td style="text-align:left;">

2.52e-09
</td>

<td style="text-align:left;">

1.00e-04
</td>

<td style="text-align:left;">

1.00e-04
</td>

<td style="text-align:left;">

1.00e-04
</td>

</tr>

<tr>

<td style="text-align:left;">

\[Ruminococcus\]\_gnavugroup
</td>

<td style="text-align:left;">

-1.53
</td>

<td style="text-align:left;">

9.99e-04
</td>

<td style="text-align:left;">

1.00e-06
</td>

<td style="text-align:left;">

4.00e-07
</td>

<td style="text-align:left;">

1.06e-07
</td>

<td style="text-align:left;">

1.06e-07
</td>

<td style="text-align:left;">

2.19e-06
</td>

<td style="text-align:left;">

2.19e-06
</td>

<td style="text-align:left;">

2.51e-06
</td>

</tr>

<tr>

<td style="text-align:left;">

\[Ruminococcus\]\_torquegroup
</td>

<td style="text-align:left;">

-4.47
</td>

<td style="text-align:left;">

9.99e-04
</td>

<td style="text-align:left;">

7.78e-03
</td>

<td style="text-align:left;">

2.31e-04
</td>

<td style="text-align:left;">

3.35e-06
</td>

<td style="text-align:left;">

3.35e-06
</td>

<td style="text-align:left;">

5.52e-02
</td>

<td style="text-align:left;">

5.52e-02
</td>

<td style="text-align:left;">

5.52e-02
</td>

</tr>

<tr>

<td style="text-align:left;">

Bacteroides
</td>

<td style="text-align:left;">

1.28
</td>

<td style="text-align:left;">

9.99e-04
</td>

<td style="text-align:left;">

1.37e-04
</td>

<td style="text-align:left;">

4.50e-06
</td>

<td style="text-align:left;">

2.93e-05
</td>

<td style="text-align:left;">

2.93e-05
</td>

<td style="text-align:left;">

1.39e-04
</td>

<td style="text-align:left;">

1.39e-04
</td>

<td style="text-align:left;">

9.72e-05
</td>

</tr>

<tr>

<td style="text-align:left;">

Lactococcus
</td>

<td style="text-align:left;">

-6.94
</td>

<td style="text-align:left;">

9.99e-04
</td>

<td style="text-align:left;">

4.00e-06
</td>

<td style="text-align:left;">

1.55e-05
</td>

<td style="text-align:left;">

4.08e-05
</td>

<td style="text-align:left;">

4.08e-05
</td>

<td style="text-align:left;">

0.00e+00
</td>

<td style="text-align:left;">

4.87e-21
</td>

<td style="text-align:left;">

1.00e-04
</td>

</tr>

<tr>

<td style="text-align:left;">

Clostridium_sensu_strict1
</td>

<td style="text-align:left;">

-0.43
</td>

<td style="text-align:left;">

9.99e-04
</td>

<td style="text-align:left;">

2.54e-03
</td>

<td style="text-align:left;">

1.97e-03
</td>

<td style="text-align:left;">

4.97e-05
</td>

<td style="text-align:left;">

4.97e-05
</td>

<td style="text-align:left;">

1.39e-03
</td>

<td style="text-align:left;">

1.39e-03
</td>

<td style="text-align:left;">

1.71e-03
</td>

</tr>

<tr>

<td style="text-align:left;">

Blautia
</td>

<td style="text-align:left;">

-1.59
</td>

<td style="text-align:left;">

9.99e-04
</td>

<td style="text-align:left;">

2.60e-04
</td>

<td style="text-align:left;">

2.84e-03
</td>

<td style="text-align:left;">

5.94e-05
</td>

<td style="text-align:left;">

5.94e-05
</td>

<td style="text-align:left;">

8.28e-05
</td>

<td style="text-align:left;">

8.28e-05
</td>

<td style="text-align:left;">

4.45e-04
</td>

</tr>

<tr>

<td style="text-align:left;">

Streptococcus
</td>

<td style="text-align:left;">

-1.07
</td>

<td style="text-align:left;">

9.99e-04
</td>

<td style="text-align:left;">

3.99e-04
</td>

<td style="text-align:left;">

2.02e-04
</td>

<td style="text-align:left;">

2.07e-04
</td>

<td style="text-align:left;">

2.07e-04
</td>

<td style="text-align:left;">

1.54e-04
</td>

<td style="text-align:left;">

1.54e-04
</td>

<td style="text-align:left;">

1.22e-04
</td>

</tr>

<tr>

<td style="text-align:left;">

Collinsella
</td>

<td style="text-align:left;">

-1.19
</td>

<td style="text-align:left;">

9.99e-04
</td>

<td style="text-align:left;">

3.39e-04
</td>

<td style="text-align:left;">

1.70e-02
</td>

<td style="text-align:left;">

3.30e-04
</td>

<td style="text-align:left;">

3.30e-04
</td>

<td style="text-align:left;">

2.27e-02
</td>

<td style="text-align:left;">

2.27e-02
</td>

<td style="text-align:left;">

2.28e-02
</td>

</tr>

<tr>

<td style="text-align:left;">

\[Clostridium\]\_innocuum_group
</td>

<td style="text-align:left;">

-3.32
</td>

<td style="text-align:left;">

9.99e-04
</td>

<td style="text-align:left;">

1.00e-06
</td>

<td style="text-align:left;">

8.00e-07
</td>

<td style="text-align:left;">

1.07e-03
</td>

<td style="text-align:left;">

1.07e-03
</td>

<td style="text-align:left;">

9.33e-05
</td>

<td style="text-align:left;">

9.33e-05
</td>

<td style="text-align:left;">

1.00e-04
</td>

</tr>

<tr>

<td style="text-align:left;">

Tyzzerella
</td>

<td style="text-align:left;">

-4.01
</td>

<td style="text-align:left;">

4.00e-03
</td>

<td style="text-align:left;">

2.11e-03
</td>

<td style="text-align:left;">

3.72e-03
</td>

<td style="text-align:left;">

2.02e-03
</td>

<td style="text-align:left;">

2.02e-03
</td>

<td style="text-align:left;">

5.60e-02
</td>

<td style="text-align:left;">

5.60e-02
</td>

<td style="text-align:left;">

5.60e-02
</td>

</tr>

<tr>

<td style="text-align:left;">

Clostridioides
</td>

<td style="text-align:left;">

-1.65
</td>

<td style="text-align:left;">

9.99e-03
</td>

<td style="text-align:left;">

1.98e-03
</td>

<td style="text-align:left;">

3.90e-02
</td>

<td style="text-align:left;">

5.59e-03
</td>

<td style="text-align:left;">

5.59e-03
</td>

<td style="text-align:left;">

3.23e-02
</td>

<td style="text-align:left;">

3.23e-02
</td>

<td style="text-align:left;">

3.23e-02
</td>

</tr>

<tr>

<td style="text-align:left;">

Epulopiscium
</td>

<td style="text-align:left;">

-5.56
</td>

<td style="text-align:left;">

2.60e-02
</td>

<td style="text-align:left;">

3.97e-02
</td>

<td style="text-align:left;">

2.62e-01
</td>

<td style="text-align:left;">

6.62e-03
</td>

<td style="text-align:left;">

6.62e-03
</td>

<td style="text-align:left;">

4.78e-02
</td>

<td style="text-align:left;">

4.78e-02
</td>

<td style="text-align:left;">

4.78e-02
</td>

</tr>

<tr>

<td style="text-align:left;">

Granulicatella
</td>

<td style="text-align:left;">

-3.79
</td>

<td style="text-align:left;">

7.99e-03
</td>

<td style="text-align:left;">

4.10e-05
</td>

<td style="text-align:left;">

1.28e-03
</td>

<td style="text-align:left;">

7.99e-03
</td>

<td style="text-align:left;">

7.99e-03
</td>

<td style="text-align:left;">

1.24e-02
</td>

<td style="text-align:left;">

1.24e-02
</td>

<td style="text-align:left;">

1.24e-02
</td>

</tr>

<tr>

<td style="text-align:left;">

Paeniclostridium
</td>

<td style="text-align:left;">

-3.83
</td>

<td style="text-align:left;">

8.99e-03
</td>

<td style="text-align:left;">

8.38e-03
</td>

<td style="text-align:left;">

9.21e-02
</td>

<td style="text-align:left;">

8.99e-03
</td>

<td style="text-align:left;">

8.99e-03
</td>

<td style="text-align:left;">

2.95e-02
</td>

<td style="text-align:left;">

2.95e-02
</td>

<td style="text-align:left;">

2.95e-02
</td>

</tr>

<tr>

<td style="text-align:left;">

Parabacteroides
</td>

<td style="text-align:left;">

0.76
</td>

<td style="text-align:left;">

1.20e-02
</td>

<td style="text-align:left;">

6.29e-02
</td>

<td style="text-align:left;">

2.29e-02
</td>

<td style="text-align:left;">

1.23e-02
</td>

<td style="text-align:left;">

1.23e-02
</td>

<td style="text-align:left;">

3.32e-02
</td>

<td style="text-align:left;">

3.32e-02
</td>

<td style="text-align:left;">

3.32e-02
</td>

</tr>

<tr>

<td style="text-align:left;">

Fusobacterium
</td>

<td style="text-align:left;">

-1.70
</td>

<td style="text-align:left;">

1.70e-02
</td>

<td style="text-align:left;">

3.37e-01
</td>

<td style="text-align:left;">

2.21e-01
</td>

<td style="text-align:left;">

1.70e-02
</td>

<td style="text-align:left;">

1.70e-02
</td>

<td style="text-align:left;">

4.62e-01
</td>

<td style="text-align:left;">

4.62e-01
</td>

<td style="text-align:left;">

4.62e-01
</td>

</tr>

</tbody>

</table>

    ## \begin{table}[!h]
    ## \centering
    ## \caption{\label{tab:tab:top_effects_raw}Top 20 genera sorted by permApprox (1e+03, SLLS, exceed0=250) (unadjusted p-values).}
    ## \centering
    ## \fontsize{8}{10}\selectfont
    ## \begin{tabular}[t]{lrllllllll}
    ## \toprule
    ## Genus & log2 FC & dacomp (1e+03) & dacomp (1e+06) & dacomp (1e+07) & permApprox (1e+03, unconstrained, exceed0=250) & permApprox (1e+03, SLLS, exceed0=250) & permApprox (1e+04, unconstrained, exceed0=250) & permApprox (1e+04, SLLS, exceed0=250) & permApprox (1e+04, SLLS, exceed0=0.25)\\
    ## \midrule
    ## \cellcolor{gray!10}{Intestinibacter} & \cellcolor{gray!10}{-2.63} & \cellcolor{gray!10}{9.99e-04} & \cellcolor{gray!10}{1.00e-06} & \cellcolor{gray!10}{1.00e-07} & \cellcolor{gray!10}{1.97e-18} & \cellcolor{gray!10}{1.97e-18} & \cellcolor{gray!10}{8.45e-08} & \cellcolor{gray!10}{8.45e-08} & \cellcolor{gray!10}{9.71e-09}\\
    ## Enterococcus & -1.47 & 9.99e-04 & 1.00e-06 & 1.00e-07 & 4.25e-13 & 4.25e-13 & 9.53e-18 & 9.53e-18 & 2.34e-09\\
    ## \cellcolor{gray!10}{Bifidobacterium} & \cellcolor{gray!10}{0.23} & \cellcolor{gray!10}{9.99e-04} & \cellcolor{gray!10}{1.00e-06} & \cellcolor{gray!10}{1.00e-07} & \cellcolor{gray!10}{2.18e-11} & \cellcolor{gray!10}{2.18e-11} & \cellcolor{gray!10}{2.51e-11} & \cellcolor{gray!10}{2.51e-11} & \cellcolor{gray!10}{4.15e-08}\\
    ## Terrisporobacter & -3.19 & 9.99e-04 & 1.04e-04 & 1.02e-05 & 0.00e+00 & 2.52e-09 & 1.00e-04 & 1.00e-04 & 1.00e-04\\
    ## \cellcolor{gray!10}{{}[Ruminococcus]\_gnavugroup} & \cellcolor{gray!10}{-1.53} & \cellcolor{gray!10}{9.99e-04} & \cellcolor{gray!10}{1.00e-06} & \cellcolor{gray!10}{4.00e-07} & \cellcolor{gray!10}{1.06e-07} & \cellcolor{gray!10}{1.06e-07} & \cellcolor{gray!10}{2.19e-06} & \cellcolor{gray!10}{2.19e-06} & \cellcolor{gray!10}{2.51e-06}\\
    ## \addlinespace
    ## {}[Ruminococcus]\_torquegroup & -4.47 & 9.99e-04 & 7.78e-03 & 2.31e-04 & 3.35e-06 & 3.35e-06 & 5.52e-02 & 5.52e-02 & 5.52e-02\\
    ## \cellcolor{gray!10}{Bacteroides} & \cellcolor{gray!10}{1.28} & \cellcolor{gray!10}{9.99e-04} & \cellcolor{gray!10}{1.37e-04} & \cellcolor{gray!10}{4.50e-06} & \cellcolor{gray!10}{2.93e-05} & \cellcolor{gray!10}{2.93e-05} & \cellcolor{gray!10}{1.39e-04} & \cellcolor{gray!10}{1.39e-04} & \cellcolor{gray!10}{9.72e-05}\\
    ## Lactococcus & -6.94 & 9.99e-04 & 4.00e-06 & 1.55e-05 & 4.08e-05 & 4.08e-05 & 0.00e+00 & 4.87e-21 & 1.00e-04\\
    ## \cellcolor{gray!10}{Clostridium\_sensu\_strict1} & \cellcolor{gray!10}{-0.43} & \cellcolor{gray!10}{9.99e-04} & \cellcolor{gray!10}{2.54e-03} & \cellcolor{gray!10}{1.97e-03} & \cellcolor{gray!10}{4.97e-05} & \cellcolor{gray!10}{4.97e-05} & \cellcolor{gray!10}{1.39e-03} & \cellcolor{gray!10}{1.39e-03} & \cellcolor{gray!10}{1.71e-03}\\
    ## Blautia & -1.59 & 9.99e-04 & 2.60e-04 & 2.84e-03 & 5.94e-05 & 5.94e-05 & 8.28e-05 & 8.28e-05 & 4.45e-04\\
    ## \addlinespace
    ## \cellcolor{gray!10}{Streptococcus} & \cellcolor{gray!10}{-1.07} & \cellcolor{gray!10}{9.99e-04} & \cellcolor{gray!10}{3.99e-04} & \cellcolor{gray!10}{2.02e-04} & \cellcolor{gray!10}{2.07e-04} & \cellcolor{gray!10}{2.07e-04} & \cellcolor{gray!10}{1.54e-04} & \cellcolor{gray!10}{1.54e-04} & \cellcolor{gray!10}{1.22e-04}\\
    ## Collinsella & -1.19 & 9.99e-04 & 3.39e-04 & 1.70e-02 & 3.30e-04 & 3.30e-04 & 2.27e-02 & 2.27e-02 & 2.28e-02\\
    ## \cellcolor{gray!10}{{}[Clostridium]\_innocuum\_group} & \cellcolor{gray!10}{-3.32} & \cellcolor{gray!10}{9.99e-04} & \cellcolor{gray!10}{1.00e-06} & \cellcolor{gray!10}{8.00e-07} & \cellcolor{gray!10}{1.07e-03} & \cellcolor{gray!10}{1.07e-03} & \cellcolor{gray!10}{9.33e-05} & \cellcolor{gray!10}{9.33e-05} & \cellcolor{gray!10}{1.00e-04}\\
    ## Tyzzerella & -4.01 & 4.00e-03 & 2.11e-03 & 3.72e-03 & 2.02e-03 & 2.02e-03 & 5.60e-02 & 5.60e-02 & 5.60e-02\\
    ## \cellcolor{gray!10}{Clostridioides} & \cellcolor{gray!10}{-1.65} & \cellcolor{gray!10}{9.99e-03} & \cellcolor{gray!10}{1.98e-03} & \cellcolor{gray!10}{3.90e-02} & \cellcolor{gray!10}{5.59e-03} & \cellcolor{gray!10}{5.59e-03} & \cellcolor{gray!10}{3.23e-02} & \cellcolor{gray!10}{3.23e-02} & \cellcolor{gray!10}{3.23e-02}\\
    ## \addlinespace
    ## Epulopiscium & -5.56 & 2.60e-02 & 3.97e-02 & 2.62e-01 & 6.62e-03 & 6.62e-03 & 4.78e-02 & 4.78e-02 & 4.78e-02\\
    ## \cellcolor{gray!10}{Granulicatella} & \cellcolor{gray!10}{-3.79} & \cellcolor{gray!10}{7.99e-03} & \cellcolor{gray!10}{4.10e-05} & \cellcolor{gray!10}{1.28e-03} & \cellcolor{gray!10}{7.99e-03} & \cellcolor{gray!10}{7.99e-03} & \cellcolor{gray!10}{1.24e-02} & \cellcolor{gray!10}{1.24e-02} & \cellcolor{gray!10}{1.24e-02}\\
    ## Paeniclostridium & -3.83 & 8.99e-03 & 8.38e-03 & 9.21e-02 & 8.99e-03 & 8.99e-03 & 2.95e-02 & 2.95e-02 & 2.95e-02\\
    ## \cellcolor{gray!10}{Parabacteroides} & \cellcolor{gray!10}{0.76} & \cellcolor{gray!10}{1.20e-02} & \cellcolor{gray!10}{6.29e-02} & \cellcolor{gray!10}{2.29e-02} & \cellcolor{gray!10}{1.23e-02} & \cellcolor{gray!10}{1.23e-02} & \cellcolor{gray!10}{3.32e-02} & \cellcolor{gray!10}{3.32e-02} & \cellcolor{gray!10}{3.32e-02}\\
    ## Fusobacterium & -1.70 & 1.70e-02 & 3.37e-01 & 2.21e-01 & 1.70e-02 & 1.70e-02 & 4.62e-01 & 4.62e-01 & 4.62e-01\\
    ## \bottomrule
    ## \end{tabular}
    ## \end{table}

### Adjusted p-values table

<table class="table" style="color: black; width: auto !important; margin-left: auto; margin-right: auto;">

<caption>

Top 20 genera sorted by permApprox (1e+03, SLLS, exceed0=250)
(BH-adjusted p-values).
</caption>

<thead>

<tr>

<th style="text-align:left;">

taxon
</th>

<th style="text-align:left;">

log2_fc
</th>

<th style="text-align:left;">

dacomp (1e+03)
</th>

<th style="text-align:left;">

dacomp (1e+06)
</th>

<th style="text-align:left;">

dacomp (1e+07)
</th>

<th style="text-align:left;">

permApprox (1e+03, unconstrained, exceed0=250)
</th>

<th style="text-align:left;">

permApprox (1e+03, SLLS, exceed0=250)
</th>

<th style="text-align:left;">

permApprox (1e+04, unconstrained, exceed0=250)
</th>

<th style="text-align:left;">

permApprox (1e+04, SLLS, exceed0=250)
</th>

<th style="text-align:left;">

permApprox (1e+04, SLLS, exceed0=0.25)
</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;">

Intestinibacter
</td>

<td style="text-align:left;">

-2.63
</td>

<td style="text-align:left;">

5.30e-03
</td>

<td style="text-align:left;">

9.60e-06
</td>

<td style="text-align:left;">

1.47e-06
</td>

<td style="text-align:left;">

1.05e-16
</td>

<td style="text-align:left;">

2.10e-16
</td>

<td style="text-align:left;">

2.28e-06
</td>

<td style="text-align:left;">

2.28e-06
</td>

<td style="text-align:left;">

5.25e-07
</td>

</tr>

<tr>

<td style="text-align:left;">

Enterococcus
</td>

<td style="text-align:left;">

-1.47
</td>

<td style="text-align:left;">

5.30e-03
</td>

<td style="text-align:left;">

9.60e-06
</td>

<td style="text-align:left;">

1.47e-06
</td>

<td style="text-align:left;">

1.51e-11
</td>

<td style="text-align:left;">

2.27e-11
</td>

<td style="text-align:left;">

5.14e-16
</td>

<td style="text-align:left;">

5.14e-16
</td>

<td style="text-align:left;">

2.53e-07
</td>

</tr>

<tr>

<td style="text-align:left;">

Bifidobacterium
</td>

<td style="text-align:left;">

0.23
</td>

<td style="text-align:left;">

5.30e-03
</td>

<td style="text-align:left;">

9.60e-06
</td>

<td style="text-align:left;">

1.47e-06
</td>

<td style="text-align:left;">

5.83e-10
</td>

<td style="text-align:left;">

7.77e-10
</td>

<td style="text-align:left;">

9.03e-10
</td>

<td style="text-align:left;">

9.03e-10
</td>

<td style="text-align:left;">

1.49e-06
</td>

</tr>

<tr>

<td style="text-align:left;">

Terrisporobacter
</td>

<td style="text-align:left;">

-3.19
</td>

<td style="text-align:left;">

5.30e-03
</td>

<td style="text-align:left;">

7.26e-04
</td>

<td style="text-align:left;">

7.32e-05
</td>

<td style="text-align:left;">

0.00e+00
</td>

<td style="text-align:left;">

6.74e-08
</td>

<td style="text-align:left;">

1.35e-03
</td>

<td style="text-align:left;">

1.35e-03
</td>

<td style="text-align:left;">

1.35e-03
</td>

</tr>

<tr>

<td style="text-align:left;">

\[Ruminococcus\]\_gnavugroup
</td>

<td style="text-align:left;">

-1.53
</td>

<td style="text-align:left;">

5.30e-03
</td>

<td style="text-align:left;">

9.60e-06
</td>

<td style="text-align:left;">

4.62e-06
</td>

<td style="text-align:left;">

2.27e-06
</td>

<td style="text-align:left;">

2.27e-06
</td>

<td style="text-align:left;">

4.74e-05
</td>

<td style="text-align:left;">

4.74e-05
</td>

<td style="text-align:left;">

6.77e-05
</td>

</tr>

<tr>

<td style="text-align:left;">

\[Ruminococcus\]\_torquegroup
</td>

<td style="text-align:left;">

-4.47
</td>

<td style="text-align:left;">

5.30e-03
</td>

<td style="text-align:left;">

2.64e-02
</td>

<td style="text-align:left;">

1.36e-03
</td>

<td style="text-align:left;">

5.97e-05
</td>

<td style="text-align:left;">

5.97e-05
</td>

<td style="text-align:left;">

1.95e-01
</td>

<td style="text-align:left;">

1.95e-01
</td>

<td style="text-align:left;">

1.89e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Bacteroides
</td>

<td style="text-align:left;">

1.28
</td>

<td style="text-align:left;">

5.30e-03
</td>

<td style="text-align:left;">

8.44e-04
</td>

<td style="text-align:left;">

3.69e-05
</td>

<td style="text-align:left;">

4.48e-04
</td>

<td style="text-align:left;">

4.48e-04
</td>

<td style="text-align:left;">

1.67e-03
</td>

<td style="text-align:left;">

1.67e-03
</td>

<td style="text-align:left;">

1.35e-03
</td>

</tr>

<tr>

<td style="text-align:left;">

Lactococcus
</td>

<td style="text-align:left;">

-6.94
</td>

<td style="text-align:left;">

5.30e-03
</td>

<td style="text-align:left;">

3.32e-05
</td>

<td style="text-align:left;">

9.58e-05
</td>

<td style="text-align:left;">

5.46e-04
</td>

<td style="text-align:left;">

5.46e-04
</td>

<td style="text-align:left;">

0.00e+00
</td>

<td style="text-align:left;">

5.26e-19
</td>

<td style="text-align:left;">

1.35e-03
</td>

</tr>

<tr>

<td style="text-align:left;">

Clostridium_sensu_strict1
</td>

<td style="text-align:left;">

-0.43
</td>

<td style="text-align:left;">

5.30e-03
</td>

<td style="text-align:left;">

1.08e-02
</td>

<td style="text-align:left;">

1.01e-02
</td>

<td style="text-align:left;">

5.91e-04
</td>

<td style="text-align:left;">

5.91e-04
</td>

<td style="text-align:left;">

1.36e-02
</td>

<td style="text-align:left;">

1.36e-02
</td>

<td style="text-align:left;">

1.68e-02
</td>

</tr>

<tr>

<td style="text-align:left;">

Blautia
</td>

<td style="text-align:left;">

-1.59
</td>

<td style="text-align:left;">

5.30e-03
</td>

<td style="text-align:left;">

1.55e-03
</td>

<td style="text-align:left;">

1.43e-02
</td>

<td style="text-align:left;">

6.36e-04
</td>

<td style="text-align:left;">

6.36e-04
</td>

<td style="text-align:left;">

1.35e-03
</td>

<td style="text-align:left;">

1.35e-03
</td>

<td style="text-align:left;">

4.81e-03
</td>

</tr>

<tr>

<td style="text-align:left;">

Streptococcus
</td>

<td style="text-align:left;">

-1.07
</td>

<td style="text-align:left;">

5.30e-03
</td>

<td style="text-align:left;">

1.93e-03
</td>

<td style="text-align:left;">

1.23e-03
</td>

<td style="text-align:left;">

2.01e-03
</td>

<td style="text-align:left;">

2.01e-03
</td>

<td style="text-align:left;">

1.67e-03
</td>

<td style="text-align:left;">

1.67e-03
</td>

<td style="text-align:left;">

1.46e-03
</td>

</tr>

<tr>

<td style="text-align:left;">

Collinsella
</td>

<td style="text-align:left;">

-1.19
</td>

<td style="text-align:left;">

5.30e-03
</td>

<td style="text-align:left;">

1.82e-03
</td>

<td style="text-align:left;">

6.18e-02
</td>

<td style="text-align:left;">

2.94e-03
</td>

<td style="text-align:left;">

2.94e-03
</td>

<td style="text-align:left;">

1.12e-01
</td>

<td style="text-align:left;">

1.12e-01
</td>

<td style="text-align:left;">

1.12e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

\[Clostridium\]\_innocuum_group
</td>

<td style="text-align:left;">

-3.32
</td>

<td style="text-align:left;">

5.30e-03
</td>

<td style="text-align:left;">

9.60e-06
</td>

<td style="text-align:left;">

7.56e-06
</td>

<td style="text-align:left;">

8.77e-03
</td>

<td style="text-align:left;">

8.77e-03
</td>

<td style="text-align:left;">

1.35e-03
</td>

<td style="text-align:left;">

1.35e-03
</td>

<td style="text-align:left;">

1.35e-03
</td>

</tr>

<tr>

<td style="text-align:left;">

Tyzzerella
</td>

<td style="text-align:left;">

-4.01
</td>

<td style="text-align:left;">

1.97e-02
</td>

<td style="text-align:left;">

8.85e-03
</td>

<td style="text-align:left;">

1.55e-02
</td>

<td style="text-align:left;">

1.54e-02
</td>

<td style="text-align:left;">

1.54e-02
</td>

<td style="text-align:left;">

1.95e-01
</td>

<td style="text-align:left;">

1.95e-01
</td>

<td style="text-align:left;">

1.89e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Clostridioides
</td>

<td style="text-align:left;">

-1.65
</td>

<td style="text-align:left;">

4.57e-02
</td>

<td style="text-align:left;">

8.85e-03
</td>

<td style="text-align:left;">

1.12e-01
</td>

<td style="text-align:left;">

3.98e-02
</td>

<td style="text-align:left;">

3.98e-02
</td>

<td style="text-align:left;">

1.38e-01
</td>

<td style="text-align:left;">

1.38e-01
</td>

<td style="text-align:left;">

1.38e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Epulopiscium
</td>

<td style="text-align:left;">

-5.56
</td>

<td style="text-align:left;">

8.41e-02
</td>

<td style="text-align:left;">

1.05e-01
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

4.43e-02
</td>

<td style="text-align:left;">

4.43e-02
</td>

<td style="text-align:left;">

1.78e-01
</td>

<td style="text-align:left;">

1.78e-01
</td>

<td style="text-align:left;">

1.78e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Granulicatella
</td>

<td style="text-align:left;">

-3.79
</td>

<td style="text-align:left;">

3.96e-02
</td>

<td style="text-align:left;">

3.16e-04
</td>

<td style="text-align:left;">

7.29e-03
</td>

<td style="text-align:left;">

5.03e-02
</td>

<td style="text-align:left;">

5.03e-02
</td>

<td style="text-align:left;">

7.05e-02
</td>

<td style="text-align:left;">

7.05e-02
</td>

<td style="text-align:left;">

6.95e-02
</td>

</tr>

<tr>

<td style="text-align:left;">

Paeniclostridium
</td>

<td style="text-align:left;">

-3.83
</td>

<td style="text-align:left;">

4.25e-02
</td>

<td style="text-align:left;">

2.81e-02
</td>

<td style="text-align:left;">

1.85e-01
</td>

<td style="text-align:left;">

5.34e-02
</td>

<td style="text-align:left;">

5.34e-02
</td>

<td style="text-align:left;">

1.38e-01
</td>

<td style="text-align:left;">

1.38e-01
</td>

<td style="text-align:left;">

1.38e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Parabacteroides
</td>

<td style="text-align:left;">

0.76
</td>

<td style="text-align:left;">

5.17e-02
</td>

<td style="text-align:left;">

1.43e-01
</td>

<td style="text-align:left;">

8.03e-02
</td>

<td style="text-align:left;">

6.95e-02
</td>

<td style="text-align:left;">

6.95e-02
</td>

<td style="text-align:left;">

1.38e-01
</td>

<td style="text-align:left;">

1.38e-01
</td>

<td style="text-align:left;">

1.38e-01
</td>

</tr>

<tr>

<td style="text-align:left;">

Fusobacterium
</td>

<td style="text-align:left;">

-1.70
</td>

<td style="text-align:left;">

6.87e-02
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

1.00e+00
</td>

<td style="text-align:left;">

9.09e-02
</td>

<td style="text-align:left;">

9.09e-02
</td>

<td style="text-align:left;">

8.04e-01
</td>

<td style="text-align:left;">

8.04e-01
</td>

<td style="text-align:left;">

8.04e-01
</td>

</tr>

</tbody>

</table>

    ## \begin{table}[!h]
    ## \centering
    ## \caption{\label{tab:tab:top_effects_adj}Top 20 genera sorted by permApprox (1e+03, SLLS, exceed0=250) (BH-adjusted p-values).}
    ## \centering
    ## \fontsize{8}{10}\selectfont
    ## \begin{tabular}[t]{lrllllllll}
    ## \toprule
    ## Genus & log2 FC & dacomp (1e+03) & dacomp (1e+06) & dacomp (1e+07) & permApprox (1e+03, unconstrained, exceed0=250) & permApprox (1e+03, SLLS, exceed0=250) & permApprox (1e+04, unconstrained, exceed0=250) & permApprox (1e+04, SLLS, exceed0=250) & permApprox (1e+04, SLLS, exceed0=0.25)\\
    ## \midrule
    ## \cellcolor{gray!10}{Intestinibacter} & \cellcolor{gray!10}{-2.63} & \cellcolor{gray!10}{5.30e-03} & \cellcolor{gray!10}{9.60e-06} & \cellcolor{gray!10}{1.47e-06} & \cellcolor{gray!10}{1.05e-16} & \cellcolor{gray!10}{2.10e-16} & \cellcolor{gray!10}{2.28e-06} & \cellcolor{gray!10}{2.28e-06} & \cellcolor{gray!10}{5.25e-07}\\
    ## Enterococcus & -1.47 & 5.30e-03 & 9.60e-06 & 1.47e-06 & 1.51e-11 & 2.27e-11 & 5.14e-16 & 5.14e-16 & 2.53e-07\\
    ## \cellcolor{gray!10}{Bifidobacterium} & \cellcolor{gray!10}{0.23} & \cellcolor{gray!10}{5.30e-03} & \cellcolor{gray!10}{9.60e-06} & \cellcolor{gray!10}{1.47e-06} & \cellcolor{gray!10}{5.83e-10} & \cellcolor{gray!10}{7.77e-10} & \cellcolor{gray!10}{9.03e-10} & \cellcolor{gray!10}{9.03e-10} & \cellcolor{gray!10}{1.49e-06}\\
    ## Terrisporobacter & -3.19 & 5.30e-03 & 7.26e-04 & 7.32e-05 & 0.00e+00 & 6.74e-08 & 1.35e-03 & 1.35e-03 & 1.35e-03\\
    ## \cellcolor{gray!10}{{}[Ruminococcus]\_gnavugroup} & \cellcolor{gray!10}{-1.53} & \cellcolor{gray!10}{5.30e-03} & \cellcolor{gray!10}{9.60e-06} & \cellcolor{gray!10}{4.62e-06} & \cellcolor{gray!10}{2.27e-06} & \cellcolor{gray!10}{2.27e-06} & \cellcolor{gray!10}{4.74e-05} & \cellcolor{gray!10}{4.74e-05} & \cellcolor{gray!10}{6.77e-05}\\
    ## \addlinespace
    ## {}[Ruminococcus]\_torquegroup & -4.47 & 5.30e-03 & 2.64e-02 & 1.36e-03 & 5.97e-05 & 5.97e-05 & 1.95e-01 & 1.95e-01 & 1.89e-01\\
    ## \cellcolor{gray!10}{Bacteroides} & \cellcolor{gray!10}{1.28} & \cellcolor{gray!10}{5.30e-03} & \cellcolor{gray!10}{8.44e-04} & \cellcolor{gray!10}{3.69e-05} & \cellcolor{gray!10}{4.48e-04} & \cellcolor{gray!10}{4.48e-04} & \cellcolor{gray!10}{1.67e-03} & \cellcolor{gray!10}{1.67e-03} & \cellcolor{gray!10}{1.35e-03}\\
    ## Lactococcus & -6.94 & 5.30e-03 & 3.32e-05 & 9.58e-05 & 5.46e-04 & 5.46e-04 & 0.00e+00 & 5.26e-19 & 1.35e-03\\
    ## \cellcolor{gray!10}{Clostridium\_sensu\_strict1} & \cellcolor{gray!10}{-0.43} & \cellcolor{gray!10}{5.30e-03} & \cellcolor{gray!10}{1.08e-02} & \cellcolor{gray!10}{1.01e-02} & \cellcolor{gray!10}{5.91e-04} & \cellcolor{gray!10}{5.91e-04} & \cellcolor{gray!10}{1.36e-02} & \cellcolor{gray!10}{1.36e-02} & \cellcolor{gray!10}{1.68e-02}\\
    ## Blautia & -1.59 & 5.30e-03 & 1.55e-03 & 1.43e-02 & 6.36e-04 & 6.36e-04 & 1.35e-03 & 1.35e-03 & 4.81e-03\\
    ## \addlinespace
    ## \cellcolor{gray!10}{Streptococcus} & \cellcolor{gray!10}{-1.07} & \cellcolor{gray!10}{5.30e-03} & \cellcolor{gray!10}{1.93e-03} & \cellcolor{gray!10}{1.23e-03} & \cellcolor{gray!10}{2.01e-03} & \cellcolor{gray!10}{2.01e-03} & \cellcolor{gray!10}{1.67e-03} & \cellcolor{gray!10}{1.67e-03} & \cellcolor{gray!10}{1.46e-03}\\
    ## Collinsella & -1.19 & 5.30e-03 & 1.82e-03 & 6.18e-02 & 2.94e-03 & 2.94e-03 & 1.12e-01 & 1.12e-01 & 1.12e-01\\
    ## \cellcolor{gray!10}{{}[Clostridium]\_innocuum\_group} & \cellcolor{gray!10}{-3.32} & \cellcolor{gray!10}{5.30e-03} & \cellcolor{gray!10}{9.60e-06} & \cellcolor{gray!10}{7.56e-06} & \cellcolor{gray!10}{8.77e-03} & \cellcolor{gray!10}{8.77e-03} & \cellcolor{gray!10}{1.35e-03} & \cellcolor{gray!10}{1.35e-03} & \cellcolor{gray!10}{1.35e-03}\\
    ## Tyzzerella & -4.01 & 1.97e-02 & 8.85e-03 & 1.55e-02 & 1.54e-02 & 1.54e-02 & 1.95e-01 & 1.95e-01 & 1.89e-01\\
    ## \cellcolor{gray!10}{Clostridioides} & \cellcolor{gray!10}{-1.65} & \cellcolor{gray!10}{4.57e-02} & \cellcolor{gray!10}{8.85e-03} & \cellcolor{gray!10}{1.12e-01} & \cellcolor{gray!10}{3.98e-02} & \cellcolor{gray!10}{3.98e-02} & \cellcolor{gray!10}{1.38e-01} & \cellcolor{gray!10}{1.38e-01} & \cellcolor{gray!10}{1.38e-01}\\
    ## \addlinespace
    ## Epulopiscium & -5.56 & 8.41e-02 & 1.05e-01 & 1.00e+00 & 4.43e-02 & 4.43e-02 & 1.78e-01 & 1.78e-01 & 1.78e-01\\
    ## \cellcolor{gray!10}{Granulicatella} & \cellcolor{gray!10}{-3.79} & \cellcolor{gray!10}{3.96e-02} & \cellcolor{gray!10}{3.16e-04} & \cellcolor{gray!10}{7.29e-03} & \cellcolor{gray!10}{5.03e-02} & \cellcolor{gray!10}{5.03e-02} & \cellcolor{gray!10}{7.05e-02} & \cellcolor{gray!10}{7.05e-02} & \cellcolor{gray!10}{6.95e-02}\\
    ## Paeniclostridium & -3.83 & 4.25e-02 & 2.81e-02 & 1.85e-01 & 5.34e-02 & 5.34e-02 & 1.38e-01 & 1.38e-01 & 1.38e-01\\
    ## \cellcolor{gray!10}{Parabacteroides} & \cellcolor{gray!10}{0.76} & \cellcolor{gray!10}{5.17e-02} & \cellcolor{gray!10}{1.43e-01} & \cellcolor{gray!10}{8.03e-02} & \cellcolor{gray!10}{6.95e-02} & \cellcolor{gray!10}{6.95e-02} & \cellcolor{gray!10}{1.38e-01} & \cellcolor{gray!10}{1.38e-01} & \cellcolor{gray!10}{1.38e-01}\\
    ## Fusobacterium & -1.70 & 6.87e-02 & 1.00e+00 & 1.00e+00 & 9.09e-02 & 9.09e-02 & 8.04e-01 & 8.04e-01 & 8.04e-01\\
    ## \bottomrule
    ## \end{tabular}
    ## \end{table}
