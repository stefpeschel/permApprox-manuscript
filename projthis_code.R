
# -------------------------------------------------------------------------
# Helper for rendering Rmd files
# -------------------------------------------------------------------------

# Define the global project path (automatically resolves to project root)
proj_path <- rprojroot::find_root(rprojroot::has_file("README.md"))

# Helper function
render_file <- function(folder, subfolder = NULL, file, output_format = "all") {
  # Build the path (handles with or without subfolder)
  file_path <- if (is.null(subfolder)) {
    paste0(file.path(proj_path, folder, file), ".Rmd")
  } else {
    paste0(file.path(proj_path, folder, subfolder, file), ".Rmd")
  }
  
  if (!file.exists(file_path)) stop("File not found: ", file_path)
  
  message("\n--- Rendering: ", file_path, " ---\n")
  rmarkdown::render(file_path, output_format = output_format)
}

# ------------------------------------------------------------------------------
# Knit Rmd files
# ------------------------------------------------------------------------------

# --- Applications -------------------------------------------------------------
## Applications
render_file("applications", NULL, "01_sc_diff_distr")
render_file("applications", NULL, "02_micro_diff_abund")

# --- Explorations -------------------------------------------------------------
## GPD fit
render_file("explorations", "gpd_fit", "01_tol_calibration")
render_file("explorations", "gpd_fit", "02_runtime")

## t-test
render_file("explorations", "perm_ttest", "01_exact_vs_ttest")
render_file("explorations", "perm_ttest", "02_eps_trials")
render_file("explorations", "perm_ttest", "03_find_eps_rule")
render_file("explorations", "perm_ttest", "04_single_tests")
render_file("explorations", "perm_ttest", "05_exceedances")

## Wilcoxon / Mann–Whitney U test
render_file("explorations", "perm_wilcox", "01_test_eps_rule")
render_file("explorations", "perm_wilcox", "02_single_tests")
render_file("explorations", "perm_wilcox", "03_exceedances")
render_file("explorations", "perm_wilcox", "04_p_approx_methods")

# --- Simulations --------------------------------------------------------------
## GPD fit
render_file("simulations", "gpd_fit", "01_data_gen")
render_file("simulations", "gpd_fit", "02_unconstrained")
render_file("simulations", "gpd_fit", "03_asymptotic")
render_file("simulations", "gpd_fit", "04_misspecification")
render_file("simulations", "gpd_fit", "05_eval_point")

## t-test
render_file("simulations", "perm_ttest", "01_data_gen")
render_file("simulations", "perm_ttest", "02_constr_vs_unconstr")
render_file("simulations", "perm_ttest", "03_nexceed")
render_file("simulations", "perm_ttest", "04_thresh_methods")
render_file("simulations", "perm_ttest", "05_p_approx_methods")

## Wilcoxon
render_file("simulations", "perm_wilcox", "01_data_gen")
render_file("simulations", "perm_wilcox", "02_p_approx_methods")

