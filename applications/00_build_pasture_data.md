Build reduced data set
================
Compiled at 2026-05-20 13:47:56 UTC

In this script, we load the original PASTURE data (not published) and
build the reduced data set, which is the basis for all PASTURE-related
analyses conducted in this project.

## Load data & set parameters

    ## phyloseq-class experiment-level object
    ## otu_table()   OTU Table:         [ 367 taxa and 740 samples ]
    ## sample_data() Sample Data:       [ 740 samples by 517 sample variables ]
    ## tax_table()   Taxonomy Table:    [ 367 taxa by 7 taxonomic ranks ]

## Select variables of interest

We keep only the IDs and the variable on duration of exclusive breast
feeding. The sample IDs are not the original ones, but randomly
generated numbers.

    ##         SampleID  idx breast_excl_cat1
    ## s025647  s025647 5647                0
    ## s023779  s023779 3779                0
    ## s026625  s026625 6625                0
    ## s022898  s022898 2898              >=2
    ## s022897  s022897 2897              >=2
    ## s028386  s028386 8386              >=2

### Genus level

    ## phyloseq-class experiment-level object
    ## otu_table()   OTU Table:         [ 367 taxa and 740 samples ]
    ## sample_data() Sample Data:       [ 740 samples by 3 sample variables ]
    ## tax_table()   Taxonomy Table:    [ 367 taxa by 7 taxonomic ranks ]

## Files written

These files have been written to the target directory,
`data/00_build_pasture_data`:

    ## # A tibble: 1 × 4
    ##   path              type         size modification_time  
    ##   <fs::path>        <fct> <fs::bytes> <dttm>             
    ## 1 bact_2m_genus.rds file        88.3K 2026-05-20 13:47:58
