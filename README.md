
<!-- README.md is generated from README.Rmd. Please edit that file -->

# chkchk

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
<!-- badges: end -->

The goal of {chkchk} is to determine if load-time elision is a suitable
way to improve the runtime performance of packages that use assertions
to check validity of their arguments.

## Installation

You can install the released version of chkchk from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("chkchk")
```

## Example

{chkchk} behaves differently depending on whether the package is loaded
from an installation or using `pkgload::load_all()`.

### Installed

``` r
library(chkchk)

# Both arguments must be `TRUE`...
chkchk(FALSE, FALSE)
#> Error: `first` must be TRUE.

# ...but this isn't enforced when the package is installed.
chkchk(TRUE, FALSE)
chkchk(TRUE, TRUE)

# Source code for the internal function that has checks for the second argument
# which are elided on load time:
chkchk:::internal
#> function (second) 
#> {
#> }
#> <environment: namespace:chkchk>
```

### Loaded

``` r
pkgload::load_all()
#> Loading chkchk

# When loaded, the check on the second argument is enforced too.
chkchk(TRUE, FALSE)
#> Error: `second` must be TRUE.
chkchk(TRUE, TRUE)

# True source code for the internal function:
chkchk:::internal
#> function (second) 
#> {
#>     chk_true(second)
#> }
#> <environment: namespace:chkchk>
```
