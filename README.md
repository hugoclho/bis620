
<!-- README.md is generated from README.Rmd. Please edit that file -->

# bis620

<!-- badges: start -->

[![R-CMD-check](https://github.com/hugoclho/bis620/workflows/R-CMD-check/badge.svg)](https://github.com/hugoclho/bis620/actions)
<!-- badges: end -->

The goal of bis620 is to …

## Installation

You can install the released version of bis620 from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("bis620")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("hugoclho/bis620")
```

## Example

This is a basic example which shows you the overview of the package
`bis620`

``` r
library(bis620)
## basic example code
```

This package includes data sets `ae`, `aeendpt`, `asendpt` from study
`NCT00460265`

``` r
head(ae[,1:8])
#>    STUDYID SITEID    SUBJID AGE AGECATCD     AGECAT SEXCD    SEX
#> 1 20050251   1101 221101001  55        1 < 65 years     F Female
#> 2 20050251   1101 221101001  55        1 < 65 years     F Female
#> 3 20050251   1101 221101001  55        1 < 65 years     F Female
#> 4 20050251   1101 221101001  55        1 < 65 years     F Female
#> 5 20050251   1101 221101001  55        1 < 65 years     F Female
#> 6 20050251   1101 221101001  55        1 < 65 years     F Female
```

Using build in fuction `get_na()` we can examine the number of NA of
each column in the data set:

    #>  STUDYID   SITEID   SUBJID      AGE AGECATCD   AGECAT    SEXCD      SEX 
    #>        0        0        0        0        0        0        0        0 
    #>     RACE  TRTDOSE TRTFRQCD  TRTFREQ    TRTCD      TRT   ATRTCD     ATRT 
    #>        0     4065        0        0        0        0        0        0 
    #> PRHNTRTI PRHNTRTC CARBOADD  CARBO2D B_ECOGCD   B_ECOG B_ECOGCT BECOGICD 
    #>        0        0        0        0        0        0        0        0 
    #>  B_ECOGI  BECGICT DIAGTYCD DIAGTYPE TUMCATCD   TUMCAT TUMCTCDI  TUMCATI 
    #>        0        0        0        0        0        0        0        0 
    #>  DSTATUS     PMAB EVALSAFE EVALEGFR    HPVCD      HPV   TRTDUR FDOSPMDY 
    #>        0        0        0        0     2885        0        0     7439 
    #>    AEANY AELINENO    PHASE  PHASEND   AESTDY  AESTDYI   AEENDY  AEENDYI 
    #>        0      196        0        0      358        1     1580     1415 
    #>   AETERM    AELLT     AEPT    AEHLT   AEHLGT  AELLTCD    AESOC    AEDUR 
    #>        0        0        0        0        0        8        0     1751 
    #>   AEDURI   AECONT AENUMINF AENUMCTX  AEPRIOR  AESKDCD    AESKD AESKINCD 
    #>     1416        0        1        1        0        0        0        0 
    #>   AESKIN AEOCUICD   AEOCUI AEEYEDCD   AEEYED  AEINTMT  AESEVCD    AESEV 
    #>        0        0        0        0        0        0        0        0 
    #>    AEREL  AERELCM AEINFRCD   AEINFR AESTOMCD   AESTOM AECALCCD   AECALC 
    #>        0        0        0        0        0        0        0        0 
    #> AEMAGNCD   AEMAGN AEKALECD   AEKALE  AEARFCD    AEARF AEDEHYCD   AEDEHY 
    #>        0        0        0        0        0        0        0        0 
    #> AEILDSCD   AEILDS AEARTECD   AEARTE AEVETECD   AEVETE AEVSETCD   AEVSET 
    #>        0        0        0        0        0        0        0        0 
    #> AECARDCD   AECARD AEACTCDS  AEACT01  AEACT02  AEACT03  AEACT04  AEACT05 
    #>        0        0        0        0        0        0        0        0 
    #>  AEACT06  AEACT07  AEACT10  AEACT72  AEACT81  AEACT82  AEACT83  AEACT84 
    #>        0        0        0        0        0        0        0        0 
    #>  AEACT85  AEACT88    AESER  SAELIFE  SAEPROG   AEWDOS   AECDOS AEFIWDOS 
    #>        0        0        0        0        0     4238     4238      457 
    #> AEFICDOS AECSWDOS AECSCDOS AECBWDOS AECBCDOS MEDDRA_V 
    #>      457      435      435     8656     8656        0
