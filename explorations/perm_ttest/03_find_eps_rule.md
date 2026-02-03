Two-sample t-test - Find a proper epsilon rule
================
Compiled at 2026-02-02 19:02:09 UTC

``` r
here::i_am(paste0(params$name, ".Rmd"), uuid = "33fc44d3-dfcd-4437-8007-bd720e59a7e7")
```

In **permApprox**, permutation $p$-values are obtained by fitting a GPD
to the tail of permutation test statistics. When the fitted shape is
negative ($\hat\xi<0$), the GPD has a finite upper support. To **avoid
zero or overly small $p$-values**, we impose the constraint that the
**evaluation point** lies inside the support by requiring

$$
t_{\text{obs}}+\varepsilon \;<\; s_{\text{GPD}},
$$

where $\varepsilon>0$ is a small, data-dependent buffer.

This document develops and evaluates candidate rules for the
**constraint parameter** $\varepsilon$. We proceed from simple linear
rules to adaptive, across-test–aware rules, and finally to a
standardized rule that works across statistics. At each step we show the
mathematical form of $\varepsilon$, discuss its intent, and examine its
behavior in simulations.

## Data Simulation

We simulate two groups from normal distributions with increasing effect
sizes (difference in means).

The parameters are set as follows:

- Sample sizes per group: 50, 100, 250, 500, 750, 1000  
- Number of tests: 1000  
- Effect sizes (difference in mean): 0 0.5 1 1.5 2  
- Standard deviation: 1  
- Tests per effect size: d=0: 200, d=0.5: 200, d=1: 200, d=1.5: 200,
  d=2: 200

The observed $t$-statistic is calculated as

$$
t_{\text{obs}} = \frac{\bar{x}_1 - \bar{x}_2}
{\sqrt{\frac{s_1^2 + s_2^2}{n}}}
$$

where  
- $\bar{x}_1$ and $\bar{x}_2$ are the sample means,  
- $s_1^2$ and $s_2^2$ are the sample variances, and  
- $n$ is the sample size in each group.

## Histograms

![](figures/03_find_eps_rule/expl_eps_rule_histograms-1.png)<!-- -->

## Plot function

## Function to run permApprox

This function will be used for all p-values approximations with
constrained GPD fit.

## Unconstrained GPD fit

For comparison, we again start with the unconstrained fit.

    ## Rows: 6,000
    ## Columns: 7
    ## $ idx         <int> 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33,…
    ## $ n_per_group <dbl> 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50…
    ## $ effect_size <fct> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,…
    ## $ obs_stats   <dbl> 0.129255525, 1.418815748, 2.541184859, 0.469398919, 1.329776159, 0.286718830, 0.389742604, 0.401101697, 0.728142692, 0.592…
    ## $ p_ttest     <dbl> 0.89742037, 0.15912533, 0.01261645, 0.63982721, 0.18667889, 0.77493292, 0.69757261, 0.68921847, 0.46826251, 0.55508943, 0.…
    ## $ gpd_fit     <lgl> FALSE, TRUE, TRUE, FALSE, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, FALSE, FALSE, FALSE, FALSE, TRUE, FALSE, F…
    ## $ p_unconstr  <dbl> 0.894105894, 0.147344092, 0.009766589, 0.636363636, 0.180129932, 0.773226773, 0.697302697, 0.680319680, 0.433566434, 0.533…

    ## Number of zeros for n = 50: 488

![](figures/03_find_eps_rule/expl_eps_rule_pvals_unconstr-1.png)<!-- -->

    ## Number of zeros for n = 100: 605

![](figures/03_find_eps_rule/expl_eps_rule_pvals_unconstr-2.png)<!-- -->

    ## Number of zeros for n = 250: 732

![](figures/03_find_eps_rule/expl_eps_rule_pvals_unconstr-3.png)<!-- -->

    ## Number of zeros for n = 500: 785

![](figures/03_find_eps_rule/expl_eps_rule_pvals_unconstr-4.png)<!-- -->

    ## Number of zeros for n = 750: 794

![](figures/03_find_eps_rule/expl_eps_rule_pvals_unconstr-5.png)<!-- -->

    ## Number of zeros for n = 1000: 796

![](figures/03_find_eps_rule/expl_eps_rule_pvals_unconstr-6.png)<!-- -->

The number of zeros clearly increases with sample size, which is
expected as the t-test p-values decrease with increasing sample size.

## $\varepsilon$ rule: Factor = 0.1

This is the simplest **linear-in-$t$** rule. We set epsilon to a fixed
fraction of the absolute observed statistic:

$$
\varepsilon = \varepsilon_{fact} * |t_{obs}| \;, \qquad \varepsilon_{fact}=0.1 \, .
$$

Larger $|t_{obs}|$ get a proportionally larger safety margin, while
small effects remain lightly adjusted. This rule ignores $n$ and the
across-test context, so it mainly serves as a baseline.

![](figures/03_find_eps_rule/expl_eps_rule_rule_factor_0.1-1.png)<!-- -->

![](figures/03_find_eps_rule/expl_eps_rule_pvals_constr_factor01-1.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_pvals_constr_factor01-2.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_pvals_constr_factor01-3.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_pvals_constr_factor01-4.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_pvals_constr_factor01-5.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_pvals_constr_factor01-6.png)<!-- -->

## $\varepsilon$ rule: Factor = 0.05

Same epsilon rule as before but with $\varepsilon_{fact}=0.05$

![](figures/03_find_eps_rule/expl_eps_rule_rule_factor_0.05-1.png)<!-- -->

![](figures/03_find_eps_rule/expl_eps_rule_pvals_constr_factor005-1.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_pvals_constr_factor005-2.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_pvals_constr_factor005-3.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_pvals_constr_factor005-4.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_pvals_constr_factor005-5.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_pvals_constr_factor005-6.png)<!-- -->

While $\varepsilon_{fact}=0.1$ was the best choice for $n=100$, the
epsilon rule $\varepsilon_{fact}=0.05$ would be the best choice for
$n=250$.

The simulations show that the optimal epsilon factor is clearly
dependent on the sample size $n$.

## $\varepsilon$ rule: Factor = 0

We also take a brief look at eps = 0.

![](figures/03_find_eps_rule/expl_eps_rule_pvals_constr_factor0-1.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_pvals_constr_factor0-2.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_pvals_constr_factor0-3.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_pvals_constr_factor0-4.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_pvals_constr_factor0-5.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_pvals_constr_factor0-6.png)<!-- -->

While $\varepsilon_{fact}=0.1$ was the best choice for $n=100$, the
epsilon rule $\varepsilon_{fact}=0.05$ would be the best choice for
$n=250$.

The simulations show that the optimal epsilon factor is clearly
dependent on the sample size $n$.

## $\varepsilon$ rule: Factor = 0.1 (constraint on max test statistic)

To see how well the approach of applying the constraint only on the
maximum observed test statistic, we will test this now with
$\varepsilon_{fact}=0.1$.

![](figures/03_find_eps_rule/expl_eps_rule_pvals_constr_factor01_max-1.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_pvals_constr_factor01_max-2.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_pvals_constr_factor01_max-3.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_pvals_constr_factor01_max-4.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_pvals_constr_factor01_max-5.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_pvals_constr_factor01_max-6.png)<!-- -->

Applying the contraint to the maximum test statistic only is far too
conservative for larger sample sizes.

## $\varepsilon$ rule: Power law in n, linear in t

As the optimal epsilon factor seems to be dependent on the the sample
size, we define the following epsilon rule:

$$
\varepsilon = |t_{obs}| \times \frac{C}{n^p}
$$

where $C$ is a scaling constant and $p$ controls the rate of decay.

Larger sample sizes lead to smaller $\varepsilon$ values, reflecting
increased precision of the permutation distribution.

$C = 1000$ and $p = 2$ turned out to be good choices in former trials.

    ## eps range for n = 1000 : 4.68062e-07 0.01726686

![](figures/03_find_eps_rule/expl_eps_rule_rule_n_power-1.png)<!-- -->

![](figures/03_find_eps_rule/expl_eps_rule_pvals_constr_n_squared-1.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_pvals_constr_n_squared-2.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_pvals_constr_n_squared-3.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_pvals_constr_n_squared-4.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_pvals_constr_n_squared-5.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_pvals_constr_n_squared-6.png)<!-- -->

An epsilon rule dependent on $n$ leads to much better p-values
approximations than the factor rule. However, while the approximated
p-values are close to the t-test p-values for large effect sizes, the
p-values are generally too small for a moderate effect size. In other
words: the trend seems to be too linear.

A logarithmic dependence on $t_{obs}$ might be more sufficient than a
rule that is linear in $t_{obs}$.

## $\varepsilon$ rule: Logarithmic growth in t

This rule makes use of a **scaled logarithmic growth**:

$$
\varepsilon = \frac{A}{n^2} \cdot \log\!\big( 1 + B \cdot t_{obs} \big)
$$

where $B$ influences the bend position and $A$ the plateau height.

This gives a smooth, concave curve that grows more quickly for small
$t_{obs}$ and flattens for larger test statistics.

For $n=100$ setting $A$ to 4000 and $B$ to 1.5 seems to be a good
choice:

``` r
eps_log_t <- function(obs_stats = NULL, sampsize = NULL, A = 4000, B = 1.5, ...) {
  obs_stats <- abs(obs_stats)
  (A / sampsize^2) * log1p(B * obs_stats)
}
```

![](figures/03_find_eps_rule/expl_eps_rule_rule_log_t-1.png)<!-- -->

![](figures/03_find_eps_rule/expl_eps_rule_pvals_constr_log_t-1.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_pvals_constr_log_t-2.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_pvals_constr_log_t-3.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_pvals_constr_log_t-4.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_pvals_constr_log_t-5.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_pvals_constr_log_t-6.png)<!-- -->

This rule performs well for n = 100 with the chosen values for $A$ and
$B$, but we need a generally applicable rule.

## Log-Saturation (LS) rule

We now define an $\varepsilon$-rule that combines **logarithmic growth**
in the observed test statistic with a **sample-size–dependent plateau**.

The aim is to keep $\varepsilon$ modest for small and moderate
statistics while ensuring it saturates at a controlled level for the
largest observed values - a property particularly important in
multiple-testing scenarios.

Let $n$ denote the **per-group** sample size in a two-sample test and

$$
T_{\max} = \max_j \left| T_{\text{obs}}^{(j)} \right|
$$

be the largest observed test statistic across all tests.

### Step 1 - Sample-size dependent curvature and plateau height

We first define the curvature parameter $k$ and the target plateau
height $E_{\text{target}}$ as

$$
k = k_{\text{factor}} \cdot \frac{500}{n},  
\qquad
E_{\text{target}} = \text{target}_{\text{factor}} \cdot \frac{500}{n}.
$$

Here:

- $k_{\text{factor}}$ controls the steepness of the initial growth,
- $\text{target}_{\text{factor}}$ sets the desired plateau height at
  $T_{\max}$,
- the factor $500/n$ ensures that $\varepsilon$ decreases for larger
  $n$, reflecting greater statistical precision.

### Step 2 - Calibration to the observed range

To ensure the curve saturates exactly at $E_{\text{target}}$ when
$t_{\text{obs}} = T_{\max}$, we define

$$
B = \frac{k}{T_{\max}},  
\qquad
A = \frac{E_{\text{target}}}{\log\!\left(1 + B \, T_{\max}\right)}.
$$

- $B$ controls **how quickly** the curve bends toward saturation.
- $A$ rescales the curve so that the maximum value matches
  $E_{\text{target}}$.

### Step 3 - Final formula with floor

For any test statistic $t_{\text{obs}}$,

$$
\varepsilon = \max\!\left[ A \cdot \log\!\big(1 + B \, |t_{\text{obs}}|\big),\ \varepsilon_{\min} \right],
$$

where $\varepsilon_{\min}$ is a small constant (e.g., $10^{-6}$)
preventing extremely small constraint values.

**Interpretation**:

- For small $t_{\text{obs}}$, $\varepsilon$ grows approximately
  linearly.
- Growth slows for moderate values and approaches a plateau for the
  largest observed statistics.
- Both the curvature and the plateau height adapt naturally to $n$ and
  the data’s observed range.

``` r
eps_log_saturation <- function(obs_stats,
                               sampsize,
                               k_factor = 1000,
                               target_factor = 0.25,
                               floor_eps = 1e-6, 
                               ...) {
  Tobs <- abs(obs_stats)
  Tmax <- max(Tobs, na.rm = TRUE)
  
  # Curvature and target plateau height
  k        <- k_factor * (500 / sampsize)
  E_target <- target_factor * (500 / sampsize)
  
  # Calibrate to Tmax
  B <- k / Tmax
  A <- E_target / log1p(B * Tmax)
  
  # Epsilon values with floor
  eps <- pmax(A * log1p(B * Tobs), floor_eps)
  eps
}
```

![](figures/03_find_eps_rule/expl_eps_rule_rule_log_saturation-1.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_rule_log_saturation-2.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_rule_log_saturation-3.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_rule_log_saturation-4.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_rule_log_saturation-5.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_rule_log_saturation-6.png)<!-- -->

![](figures/03_find_eps_rule/expl_eps_rule_pvals_constr_log_sat-1.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_pvals_constr_log_sat-2.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_pvals_constr_log_sat-3.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_pvals_constr_log_sat-4.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_pvals_constr_log_sat-5.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_pvals_constr_log_sat-6.png)<!-- -->

The approach still under-estimates the p-values for moderate effect
sizes. That means, we would have to increase the epsilon there, but keep
it for high effect sizes. We run the log rule again, but with a higher
$k_{factor}$, which influences the curvature of the epsilon function.

## Rerun LS rule with high $k_{factor}$

![](figures/03_find_eps_rule/expl_eps_rule_rule_log_t_kf_10000-1.png)<!-- -->

![](figures/03_find_eps_rule/expl_eps_rule_pvals_constr_log_sat_kf10000-1.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_pvals_constr_log_sat_kf10000-2.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_pvals_constr_log_sat_kf10000-3.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_pvals_constr_log_sat_kf10000-4.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_pvals_constr_log_sat_kf10000-5.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_pvals_constr_log_sat_kf10000-6.png)<!-- -->

Almost nothing has changed with the higher k-factor. We need a rule that
shifts epsilon more extremely for moderate test statistics. With the
next rule, the epsilon function has a bump/lift for small test
statistics.

## Lifted Log-Saturation (LLS) rule

While the basic log-saturation rule adapts well to the range of observed
statistics, it can **underestimate** $\varepsilon$ for small or moderate
test statistics, which may lead to anticonservative $p$-value
approximations in this range.

To address this, we introduce a **lift kernel** $\psi(s)$ applied to
small statistics, where

$$
s = \frac{|t_{\text{obs}}|}{T_{\max}} \in [0,1].
$$

Here, $s$ is a scale-free index that describes the relative position of
a test statistic within the reference range up to $T_{max}$, and it
governs how strongly the log-saturation curve and the lift component
contribute to $\varepsilon$.

Due to its smootheness, we use the **Wendland $C^2$** kernel:

$$
\psi_{C^2}(s) = (1 - s)^4 \, (1 + 4s),
$$

which satisfies:

- $\psi(0) = 1$ — maximum lift for the smallest test statistic,
- $\psi(1) = 0$ — no lift at the plateau,
- compact support on $[0,1]$ and $C^2$ smoothness, ensuring a seamless
  join with the plateau.

We then add the lift term to the base rule:

$$
\varepsilon \;=\; \max\!\left[
A \cdot \log\!\big(1 + B \, |t_{\text{obs}}|\big) + \rho_{\text{lift}} \cdot \psi(s),\ \varepsilon_{\min}
\right],
$$

where $\rho_{\text{lift}}$ controls the magnitude of the lift at
$s = 0$.

**Effect of the lift**:

- Increases $\varepsilon$ for small statistics → more conservative
  approximation in the range where GPD extrapolation is most sensitive.
- Leaves the plateau value for large $t_{\text{obs}}$ unchanged.
- Transition from lifted to plateau region is smooth due to the $C^2$
  continuity of $\psi$.

``` r
eps_log_saturation_lift <- function(obs_stats,
                                    sampsize,
                                    k_factor = 1000,
                                    target_factor = 0.25,
                                    rho_lift = 3,
                                    floor_eps = 1e-6, ...) {
  Tobs <- abs(obs_stats)
  Tmax <- max(Tobs, na.rm = TRUE)
  
  # Curvature and target plateau height
  k        <- k_factor * (500 / sampsize)
  E_target <- target_factor * (500 / sampsize)
  
  # Calibrate to Tmax
  B <- k / Tmax
  A <- E_target / log1p(B * Tmax)
  
  # Relative position and lift term
  s         <- pmin(Tobs / Tmax, 1)
  psi_wendland_c2 <- (1 - s)^4 * (1 + 4*s)
  lift_term <- rho_lift * psi_wendland_c2
  
  # Epsilon with lift and floor
  eps <- pmax(A * log1p(B * Tobs) + lift_term, floor_eps)
  eps
}
```

![](figures/03_find_eps_rule/expl_eps_rule_rule_log_sat_lift-1.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_rule_log_sat_lift-2.png)<!-- -->

![](figures/03_find_eps_rule/expl_eps_rule_pvals_constr_log_sat_lift-1.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_pvals_constr_log_sat_lift-2.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_pvals_constr_log_sat_lift-3.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_pvals_constr_log_sat_lift-4.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_pvals_constr_log_sat_lift-5.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_pvals_constr_log_sat_lift-6.png)<!-- -->

## Why not Wendland’s $C^0$-function?

We use **$C^2$** rather than **$C^0$** because we want the lift to blend
into the baseline curve **smoothly**, without creating visible kinks or
slope jumps at the point where it vanishes ($s = 1$).

- **$C^0$** Wendland:

  $$
  h(s) = (1-s)^2_+
  $$

  Continuous, but the slope has a jump at $s = 1$ (first derivative
  discontinuous). This means the bump will end abruptly in slope when
  meeting the plateau, which can create a *sharp corner* in your epsilon
  curve.

- **$C^2$** Wendland:

  $$
  h(s) = (1-s)^4 (1 + 4s)
  $$

  Continuous up to the second derivative — the slope *and* curvature
  vanish smoothly at $s = 1$. This means the bump “fades” into the
  plateau seamlessly, so the total curve is very smooth.

![](figures/03_find_eps_rule/expl_eps_rule_wendland_C0_C2-1.png)<!-- -->

``` r
eps_log_saturation_lift_C0 <- function(obs_stats,
                                    sampsize,
                                    k_factor = 1000,
                                    target_factor = 0.25,
                                    rho_lift = 3,
                                    floor_eps = 1e-6, ...) {
  Tobs <- abs(obs_stats)
  Tmax <- max(Tobs, na.rm = TRUE)
  
  # Curvature and target plateau height
  k        <- k_factor * (500 / sampsize)
  E_target <- target_factor * (500 / sampsize)
  
  # Calibrate to Tmax
  B <- k / Tmax
  A <- E_target / log1p(B * Tmax)
  
  # Relative position and lift term
  s         <- pmin(Tobs / Tmax, 1)
  wendland_C0 <- (1 - s)^2
  lift_term <- rho_lift * wendland_C0
  
  # Epsilon with lift and floor
  eps <- pmax(A * log1p(B * Tobs) + lift_term, floor_eps)
  eps
}
```

![](figures/03_find_eps_rule/expl_eps_rule_rule_log_sat_lift_C0-1.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_rule_log_sat_lift_C0-2.png)<!-- -->

## Simplification

The paramters $A$ and $B$ still stem from the power law rule in the
beginning of our trials, but are redundant in the new rule. We therefore
can considerably simplify the rule.

Using

$$
B = \frac{k}{T_{\max}},  
\qquad
A = \frac{E_{\text{target}}}{\log\!\left(1 + B \, T_{\max}\right)}.
$$

the lifted rule

$$
\varepsilon
= \max\!\left[
A \log\!\big(1 + B\,|t_{\text{obs}}|\big) + \rho_{\text{lift}}\psi(s),\ \varepsilon_{\min}
\right]
$$

reduces algebraically to the **lifted log-saturation in scale-free
form**

$$
\boxed{
\;\varepsilon(t_{\text{obs}})
= \max\!\left[
E_{\text{target}}\,
\frac{\log\!\big(1 + k\, s\big)}{\log(1+k)}
\;+\;\rho_{\text{lift}}\,\psi(s)
\;,\ \varepsilon_{\min}
\right],\quad
s=\frac{|t_{\text{obs}}|}{T_{\max}}\in[0,1].
}
$$

Here $k=k_{\text{factor}}\cdot \tfrac{500}{n}$ controls the curvature
and
$E_{\text{target}}=\text{target}_{\text{factor}}\cdot \tfrac{500}{n}$
sets the plateau height.

### Properties (unchanged)

- **Plateau invariance:** since $\psi(1)=0$,
  $\varepsilon(T_{\max}) = E_{\text{target}}$.
- **Scale-free:** depends on $|t_{\text{obs}}|/T_{\max}$ only; linear
  rescalings of the statistic cancel out.
- **Small-$s$ behavior:**
  $\varepsilon(t)\approx \rho_{\text{lift}} + E_{\text{target}}\dfrac{k}{\log(1+k)}\,\dfrac{|t|}{T_{\max}}$
  (more conservative near zero via $\rho_{\text{lift}}$).
- **Smoothness:** $\psi(s)=(1-s)^4(1+4s)$ is $C^2$ and vanishes at
  $s=1$.

### Edge case

If $T_{\max}=0$ (all observed statistics zero), set
$\varepsilon \equiv \max(E_{\text{target}}+\rho_{\text{lift}},\,\varepsilon_{\min})$.

### Drop-in R replacement

This version is algebraically equivalent to our previous LLS rule,
avoids the $A,B$ bookkeeping, keeps numerical stability via `log1p`, and
preserves all desired behaviors before introducing the permutation-based
cap.

We will briefly check if we see the same results as before.

![](figures/03_find_eps_rule/expl_eps_rule_rule_log_sat_lift_simple-1.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_rule_log_sat_lift_simple-2.png)<!-- -->

![](figures/03_find_eps_rule/expl_eps_rule_pvals_constr_log_sat_lift_simple-1.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_pvals_constr_log_sat_lift_simple-2.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_pvals_constr_log_sat_lift_simple-3.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_pvals_constr_log_sat_lift_simple-4.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_pvals_constr_log_sat_lift_simple-5.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_pvals_constr_log_sat_lift_simple-6.png)<!-- -->

## LLS rule with an (optional) permutation-based cap

To reduce sensitivity to outlying observed statistics and to support
**single-test** scenarios (where ($|t_{\text{obs}}| = T_{\max}$)), we
anchor the rule at a **cap** ($T_{\text{cap}}$). We allow two choices:

- **Observed cap** (many tests):
  $T_{\text{cap}} := T_{\max} = \max_j |T^{(j)}_{\text{obs}}|.$

- **Permutation-based cap** (single/few tests or for robustness):
  $T_{\text{cap}} := Q_q\big(|\mathcal T|\big)\cdot g(n),\qquad g(n)=\max\{1,\ \alpha\sqrt{n}\}$
  where ($Q_q(|\mathcal T|)$) is a high quantile (e.g., (q=0.99)) of the
  **absolute** permutation statistics and ($\alpha>0$) is a single
  tuning constant (default ($\alpha=0.5$)). The floor at (1) prevents
  deflation for small ($n$).

We then use the **scale-free index** $$
s = \frac{|t_{\text{obs}}|}{T_{\text{cap}}}\in[0,1],
$$ and apply the simplified LLS rule from above (with lift), i.e.,
replace ($T_{\max}$) by ($T_{\text{cap}}$) wherever ($s$) appears.

**Practical guidance.** Use `cap_base = "perm"` for **single/few tests**
or when you want robustness against extreme ($t_{\text{obs}}$). For
**many tests**, `cap_base = "tmax"` leverages the observed range across
features. The single knob ($\alpha$) controls how aggressively the
permutation cap is inflated with ($n$) (default ($\alpha=0.5$)).

``` r
# Build T_cap from choice: "perm" or "tmax"
# - cap_base = "tmax": uses observed maximum across tests
# - cap_base = "perm": uses high quantile of |perm_stats| inflated by g(n)
.build_Tcap <- function(cap_base, t_obs, perm_stats, n, 
                        q_ref = 0.99, alpha = 0.5) {
  if (identical(cap_base, "tmax")) {
    # Observed cap (same for all tests)
    T_cap <- rep(max(abs(t_obs), na.rm = TRUE), length(t_obs))

  } else if (identical(cap_base, "perm")) {
    # Permutation cap: high quantile of |perm|, inflated by g(n)
    if (is.null(dim(perm_stats))) perm_stats <- matrix(perm_stats, ncol = 1)
    Tabs <- abs(perm_stats)
    Tq <- apply(Tabs, 2, stats::quantile, probs = q_ref, na.rm = TRUE, names = FALSE)
    
    # Inflation g(n) = max(1, alpha * sqrt(n))
    infl <- pmax(1, alpha * sqrt(n))
    T_cap <- Tq * infl

    # Broadcast if needed
    if (length(T_cap) == 1L) T_cap <- rep(T_cap, length(t_obs))
    if (length(T_cap) != length(t_obs)) T_cap <- rep(T_cap[1L], length(t_obs))

  } else {
    stop("cap_base must be 'perm' or 'tmax'.")
  }

  # Guardrails: enforce positive finite caps
  bad <- !is.finite(T_cap) | T_cap <= 0
  if (any(bad)) {
    fallback <- max(T_cap[!bad], 1)
    T_cap[bad] <- fallback
  }
  T_cap
}

# Simplified LLS using unified T_cap
eps_log_saturation_lift_cap <- function(obs_stats,
                                        perm_stats,
                                        sampsize,
                                        cap_base = c("perm", "tmax"),
                                        k_factor = 1000,
                                        target_factor = 0.25,
                                        rho_lift = 3,
                                        floor_eps = 1e-6,
                                        q_ref = 0.99,   # quantile of |T_perm|
                                        alpha = 0.5,    # inflation constant
                                        ...) {
  cap_base <- if (is.character(cap_base)) match.arg(cap_base) else cap_base
  Tobs <- abs(obs_stats)
  n <- sampsize
  
  # Build cap T_cap according to cap_base
  T_cap <- .build_Tcap(cap_base, Tobs, perm_stats, n,
                       q_ref = q_ref, alpha = alpha)
  
  # Curvature (k) and plateau (E_target) scale with 1/n
  k <- k_factor * (500 / n)
  E_target <- target_factor * (500 / n)
  
  # Degenerate guard: if cap fails, return conservative constant
  if (!any(is.finite(T_cap)) || all(T_cap <= 0)) {
    return(rep(max(E_target + rho_lift, floor_eps), length(Tobs)))
  }
  
  # Scale-free index s and smooth Wendland C^2 lift
  s <- pmin(Tobs / T_cap, 1)                # clamp to [0,1]
  psi_wendland_c2 <- (1 - s)^4 * (1 + 4*s)  # lift vanishes at s=1
  
  # Simplified LLS core (no A,B), numerically stable via log1p
  eps_core <- E_target * log1p(k * s) / log1p(k) + rho_lift * psi_wendland_c2
  
  # Floor to avoid vanishing constraints
  pmax(eps_core, floor_eps)
}
```

![](figures/03_find_eps_rule/expl_eps_rule_rule_log_sat_lift_perm-1.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_rule_log_sat_lift_perm-2.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_rule_log_sat_lift_perm-3.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_rule_log_sat_lift_perm-4.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_rule_log_sat_lift_perm-5.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_rule_log_sat_lift_perm-6.png)<!-- -->

eps_log_sat_lift and eps_log_sat_lift_tmax lead to exactly the same
epsilon values (curves overlap). Using the quantile of permutation
statistics as cap is less conservative (smaller epsilon values) in our
scenario and might therefore lead to a better approximation of the
t-test p-values.

![](figures/03_find_eps_rule/expl_eps_rule_pvals_constr_log_sat_lift_perm-1.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_pvals_constr_log_sat_lift_perm-2.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_pvals_constr_log_sat_lift_perm-3.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_pvals_constr_log_sat_lift_perm-4.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_pvals_constr_log_sat_lift_perm-5.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_pvals_constr_log_sat_lift_perm-6.png)<!-- -->

Due to the smaller $\varepsilon$ values for mid-sized test statistics,
this rule performs better than the rule based on $t_{max}$ as the
approximations are closer to the t-test p-values. On the other hand, it
is less conservative

## Standardized Lifted Log-Saturation (SLLS) rule

If test statistics are on very different scales (e.g., different test
types in a multiple testing setup), the previous rules may assign
systematically larger or smaller $\varepsilon$ values purely due to
scale differences.

We solve this by working on a **standardized $Z$-scale**:

$$
Z_{\text{obs}}^{(j)} = \frac{|T_{\text{obs}}^{(j)} - \mu_j|}{\sigma_j},
$$

where $\mu_j$ and $\sigma_j$ are the mean and SD of the permutation
distribution for test $j$.

The *Lifted Log-Saturation Rule* is applied in $Z$-space, and the result
is converted back to the original $T$-scale:

$$
\varepsilon^{(j)} = \sigma_j \cdot \varepsilon_{Z}^{(j)}.
$$

**Why standardization matters**:

- Ensures comparability across tests with different statistic ranges.
- Keeps the lift and saturation behavior consistent, independent of the
  original scale.
- Makes the rule generally applicable in heterogeneous testing
  situations.

``` r
# Build T_cap from choice: "perm" or "tmax"
# - cap_base = "tmax": uses observed maximum across tests
# - cap_base = "perm": uses high quantile of |perm_stats| inflated by g(n)
.build_Tcap <- function(cap_base, t_obs, perm_stats, n, 
                        q_ref = 0.99, alpha = 0.5) {
  if (identical(cap_base, "tmax")) {
    # Observed cap (same for all tests)
    T_cap <- rep(max(abs(t_obs), na.rm = TRUE), length(t_obs))

  } else if (identical(cap_base, "perm")) {
    # Permutation cap: high quantile of |perm|, inflated by g(n)
    if (is.null(dim(perm_stats))) perm_stats <- matrix(perm_stats, ncol = 1)
    Tabs <- abs(perm_stats)
    Tq <- apply(Tabs, 2, stats::quantile, probs = q_ref, na.rm = TRUE, names = FALSE)
    
    # Inflation g(n) = max(1, alpha * sqrt(n))
    infl <- pmax(1, alpha * sqrt(n))
    T_cap <- Tq * infl

    # Broadcast if needed
    if (length(T_cap) == 1L) T_cap <- rep(T_cap, length(t_obs))
    if (length(T_cap) != length(t_obs)) T_cap <- rep(T_cap[1L], length(t_obs))

  } else {
    stop("cap_base must be 'perm' or 'tmax'.")
  }

  # Guardrails: enforce positive finite caps
  bad <- !is.finite(T_cap) | T_cap <= 0
  if (any(bad)) {
    fallback <- max(T_cap[!bad], 1)
    T_cap[bad] <- fallback
  }
  T_cap
}

# Standardized Lifted Log-Saturation (SLLS) using unified Z-cap
# - Standardize to Z using permutation mean/sd per test
# - Build the cap on the Z-scale via .build_Tcap (cap_base = "perm" or "tmax")
# - Apply simplified LLS on Z
# - Map epsilon back to T-scale via sigma_j
eps_log_saturation_lift_std <- function(obs_stats,
                                        perm_stats,
                                        sampsize,
                                        cap_base      = c("perm", "tmax"),  # Z-cap choice
                                        alpha         = 0.5, # g(n) = max(1, alpha*sqrt(n))
                                        q_ref         = 0.99, # quantile of |Z_perm|
                                        rho_lift      = 3,
                                        k_factor      = 1000,
                                        target_factor = 0.25,
                                        floor_epsZ    = 1e-6,
                                        ...) {
  cap_base <- if (is.character(cap_base)) match.arg(cap_base) else cap_base
  n <- sampsize
  stopifnot(n > 0)

  # Shape inputs --------------------------------------------------------------
  # Allow vector perm_stats for single test
  if (is.null(dim(perm_stats))) perm_stats <- matrix(perm_stats, ncol = 1)
  Tobs <- as.numeric(obs_stats)

  # Z-standardization per test -----------------------------------------------
  mu  <- colMeans(perm_stats, na.rm = TRUE)
  sig <- apply(perm_stats, 2, sd, na.rm = TRUE)

  # Guard against non-finite or zero SDs: replace with a small positive fallback
  valid_sig <- sig[is.finite(sig) & sig > 0]
  sig_fallback <- if (length(valid_sig)) max(min(valid_sig), 1e-12) else 1e-12
  sig_ok <- sig
  sig_ok[!is.finite(sig_ok) | sig_ok <= 0] <- sig_fallback

  Zobs  <- abs((Tobs - mu) / sig_ok)
  Zperm <- sweep(sweep(perm_stats, 2, mu, "-"), 2, sig_ok, "/")  # same shape as perm_stats

  # Build Z-cap (unified) -----------------------------------------------------
  # Uses: "tmax" => max(Zobs); "perm" => Q_q(|Zperm|) * g(n) with g(n)=max(1, alpha*sqrt(n))
  T_cap_Z <- .build_Tcap(cap_base = cap_base,
                         t_obs    = Zobs,
                         perm_stats = Zperm,
                         n        = n,
                         q_ref    = q_ref,
                         alpha    = alpha)

  # LLS core on Z -------------------------------------------------------------
  k        <- k_factor      * (500 / n)
  E_target <- target_factor * (500 / n)

  if (!any(is.finite(T_cap_Z)) || all(T_cap_Z <= 0)) {
    # Conservative constant if the cap failed
    epsZ <- rep(max(E_target + rho_lift, floor_epsZ), length(Zobs))
  } else {
    s   <- pmin(Zobs / T_cap_Z, 1)        # scale-free index in [0,1]
    psi <- (1 - s)^4 * (1 + 4*s)          # Wendland C^2 lift
    epsZ_core <- E_target * log1p(k * s) / log1p(k) + rho_lift * psi
    epsZ <- pmax(epsZ_core, floor_epsZ)
  }

  # Map back to T-scale -------------------------------------------------------
  epsT <- epsZ * sig_ok
  epsT
}
```

![](figures/03_find_eps_rule/expl_eps_rule_rule_log_sat_lift_std-1.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_rule_log_sat_lift_std-2.png)<!-- -->

Since the data in this study are already standardized (Gaussian data
with sd = 1), there is almost no difference in epsilon values between
the standardized and non-standardized version. We will see a difference
in a later study using the Wilcoxon test.

![](figures/03_find_eps_rule/expl_eps_rule_pvals_constr_log_sat_lift_std-1.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_pvals_constr_log_sat_lift_std-2.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_pvals_constr_log_sat_lift_std-3.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_pvals_constr_log_sat_lift_std-4.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_pvals_constr_log_sat_lift_std-5.png)<!-- -->![](figures/03_find_eps_rule/expl_eps_rule_pvals_constr_log_sat_lift_std-6.png)<!-- -->

## Constrained vs. unconstrained fit

    ## n = 50 | zeros (ttest, unconst, const): 0 , 488 , 0

![](figures/03_find_eps_rule/expl_eps_rule_pvals_unconstr_vs_constr-1.png)<!-- -->

    ## n = 100 | zeros (ttest, unconst, const): 0 , 605 , 0

![](figures/03_find_eps_rule/expl_eps_rule_pvals_unconstr_vs_constr-2.png)<!-- -->

    ## n = 250 | zeros (ttest, unconst, const): 0 , 732 , 0

![](figures/03_find_eps_rule/expl_eps_rule_pvals_unconstr_vs_constr-3.png)<!-- -->

    ## n = 500 | zeros (ttest, unconst, const): 0 , 785 , 0

![](figures/03_find_eps_rule/expl_eps_rule_pvals_unconstr_vs_constr-4.png)<!-- -->

    ## n = 750 | zeros (ttest, unconst, const): 0 , 794 , 0

![](figures/03_find_eps_rule/expl_eps_rule_pvals_unconstr_vs_constr-5.png)<!-- -->

    ## n = 1000 | zeros (ttest, unconst, const): 6 , 796 , 0

![](figures/03_find_eps_rule/expl_eps_rule_pvals_unconstr_vs_constr-6.png)<!-- -->

## Combined plot

![](figures/03_find_eps_rule/expl_eps_rule_eps_rules_combined-1.png)<!-- -->

## Conclusion

In this set of simulation studies we systematically evaluated different
rules for defining $\varepsilon$. Our results demonstrate that:

- The **log-saturation rule** provides a stable baseline for defining
  $\varepsilon$ that adapts smoothly to both the observed test
  statistics and the sample size.
- Introducing the **lift term** mitigates anticonservative behavior for
  small and moderate test statistics, ensuring that the approximation
  remains reliable across the full range of effect sizes.
- Replacing the dependency on the maximum observed statistic $T_{\max}$
  by a **permutation-based cap** makes the rule more robust to outliers
  and suitable for single-test settings, while still preserving the
  desired $\sqrt{n}$-like scaling.
- Standardization to the permutation $Z$-scale further improves
  comparability across different test types and scales.

## Files written

These files have been written to the target directory,
`data/03_find_eps_rule`:

    ## # A tibble: 96 × 4
    ##    path                                        type         size modification_time  
    ##    <fs::path>                                  <fct> <fs::bytes> <dttm>             
    ##  1 obs_t_stats_n1000_B1000.rds                 file        7.46K 2025-09-27 11:46:29
    ##  2 obs_t_stats_n100_B1000.rds                  file        7.54K 2025-09-27 11:43:22
    ##  3 obs_t_stats_n250_B1000.rds                  file        7.51K 2025-09-27 11:44:01
    ##  4 obs_t_stats_n500_B1000.rds                  file         7.5K 2025-09-27 11:44:45
    ##  5 obs_t_stats_n50_B1000.rds                   file        7.56K 2025-09-27 11:42:47
    ##  6 obs_t_stats_n750_B1000.rds                  file        7.46K 2025-09-27 11:45:35
    ##  7 permapprox_constr_factor005_n1000_B1000.rds file      823.85K 2025-11-02 12:27:41
    ##  8 permapprox_constr_factor005_n100_B1000.rds  file      830.01K 2025-11-02 12:27:46
    ##  9 permapprox_constr_factor005_n250_B1000.rds  file      828.16K 2025-11-02 12:27:46
    ## 10 permapprox_constr_factor005_n500_B1000.rds  file       831.7K 2025-11-02 12:27:44
    ## # ℹ 86 more rows
