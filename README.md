
<!-- README.md is generated from README.Rmd. Please edit that file -->

# bis620

<!-- badges: start -->

[![R-CMD-check](https://github.com/hugoclho/bis620/workflows/R-CMD-check/badge.svg)](https://github.com/hugoclho/bis620/actions)
<!-- badges: end -->

The goal of `bis620` is to build a package for Yale course BIS 620.

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

Using build in function `get_min_na()` / `get_max_na()` we can examine
the column with min/max number of NA in the data set:

``` r
get_min_na(ae)
#>  STUDYID   SITEID   SUBJID      AGE AGECATCD   AGECAT    SEXCD      SEX 
#>        0        0        0        0        0        0        0        0 
#>     RACE TRTFRQCD  TRTFREQ    TRTCD      TRT   ATRTCD     ATRT PRHNTRTI 
#>        0        0        0        0        0        0        0        0 
#> PRHNTRTC CARBOADD  CARBO2D B_ECOGCD   B_ECOG B_ECOGCT BECOGICD  B_ECOGI 
#>        0        0        0        0        0        0        0        0 
#>  BECGICT DIAGTYCD DIAGTYPE TUMCATCD   TUMCAT TUMCTCDI  TUMCATI  DSTATUS 
#>        0        0        0        0        0        0        0        0 
#>     PMAB EVALSAFE EVALEGFR      HPV   TRTDUR    AEANY    PHASE  PHASEND 
#>        0        0        0        0        0        0        0        0 
#>   AETERM    AELLT     AEPT    AEHLT   AEHLGT    AESOC   AECONT  AEPRIOR 
#>        0        0        0        0        0        0        0        0 
#>  AESKDCD    AESKD AESKINCD   AESKIN AEOCUICD   AEOCUI AEEYEDCD   AEEYED 
#>        0        0        0        0        0        0        0        0 
#>  AEINTMT  AESEVCD    AESEV    AEREL  AERELCM AEINFRCD   AEINFR AESTOMCD 
#>        0        0        0        0        0        0        0        0 
#>   AESTOM AECALCCD   AECALC AEMAGNCD   AEMAGN AEKALECD   AEKALE  AEARFCD 
#>        0        0        0        0        0        0        0        0 
#>    AEARF AEDEHYCD   AEDEHY AEILDSCD   AEILDS AEARTECD   AEARTE AEVETECD 
#>        0        0        0        0        0        0        0        0 
#>   AEVETE AEVSETCD   AEVSET AECARDCD   AECARD AEACTCDS  AEACT01  AEACT02 
#>        0        0        0        0        0        0        0        0 
#>  AEACT03  AEACT04  AEACT05  AEACT06  AEACT07  AEACT10  AEACT72  AEACT81 
#>        0        0        0        0        0        0        0        0 
#>  AEACT82  AEACT83  AEACT84  AEACT85  AEACT88    AESER  SAELIFE  SAEPROG 
#>        0        0        0        0        0        0        0        0 
#> MEDDRA_V 
#>        0
get_max_na(ae)
#> AECBWDOS AECBCDOS 
#>     8656     8656
```

## Sparse Matrix Class `bis620_sparse_matrix`

Create bis620_sparse_matrix object

``` r
x1 <- bis620_sparse_matrix(
  i = c(1, 2, 5, 6),
  j = c(2, 2, 6, 1),
  x = c(4.3, 5.6, 7, 10)
)
```

Print bis620_sparse_matrix object like other normal R matrices

``` r
print(x1)
#>      [,1] [,2] [,3] [,4] [,5] [,6]
#> [1,] .    4.3  .    .    .    .   
#> [2,] .    5.6  .    .    .    .   
#> [3,] .    .    .    .    .    .   
#> [4,] .    .    .    .    .    .   
#> [5,] .    .    .    .    .    7   
#> [6,] 10   .    .    .    .    .
```

Operations between bis620_sparse_matrix returns a bis620_sparse_matrix,
and `+`, `-`, `/`, `*` along with `%*%` are compatible with other types
of R matrices

``` r
x1 + x1
#> An object of class "bis620_sparse_matrix"
#> Slot "i":
#> [1] 1 2 5 6
#> 
#> Slot "j":
#> [1] 2 2 6 1
#> 
#> Slot "x":
#> [1]  8.6 11.2 14.0 20.0
print(x1 + x1)
#>      [,1] [,2] [,3] [,4] [,5] [,6]
#> [1,] .    8.6  .    .    .    .   
#> [2,] .    11.2 .    .    .    .   
#> [3,] .    .    .    .    .    .   
#> [4,] .    .    .    .    .    .   
#> [5,] .    .    .    .    .    14  
#> [6,] 20   .    .    .    .    .
```

``` r
# compatibility with other Matrix types
library(Matrix)
x2 <- matrix(rnorm(36), ncol = 6)

set.seed(1)

x3 <- Matrix::Matrix(rnorm(36), ncol = 6)

x4 <- Matrix::sparseMatrix(
  i = c(1, 1, 3, 6),
  j = c(2, 3, 5, 1),
  x = c(4.3, 5.6, 7, 10),
  dims = c(6, 6)
)
```

``` r
x1 + x1
#> An object of class "bis620_sparse_matrix"
#> Slot "i":
#> [1] 1 2 5 6
#> 
#> Slot "j":
#> [1] 2 2 6 1
#> 
#> Slot "x":
#> [1]  8.6 11.2 14.0 20.0
print(x1 + x1)
#>      [,1] [,2] [,3] [,4] [,5] [,6]
#> [1,] .    8.6  .    .    .    .   
#> [2,] .    11.2 .    .    .    .   
#> [3,] .    .    .    .    .    .   
#> [4,] .    .    .    .    .    .   
#> [5,] .    .    .    .    .    14  
#> [6,] 20   .    .    .    .    .
x1 - x4
#> 6 x 6 sparse Matrix of class "dgCMatrix"
#>                       
#> [1,] . 0.0 -5.6 .  . .
#> [2,] . 5.6  .   .  . .
#> [3,] . .    .   . -7 .
#> [4,] . .    .   .  . .
#> [5,] . .    .   .  . 7
#> [6,] 0 .    .   .  . .
t(x1) %*% x1
#> An object of class "bis620_sparse_matrix"
#> Slot "i":
#> [1] 1 2 6
#> 
#> Slot "j":
#> [1] 1 2 6
#> 
#> Slot "x":
#> [1] 100.00  49.85  49.00
print(t(x1) %*% x1)
#>      [,1] [,2]  [,3] [,4] [,5] [,6]
#> [1,] 100  .     .    .    .    .   
#> [2,] .    49.85 .    .    .    .   
#> [3,] .    .     .    .    .    .   
#> [4,] .    .     .    .    .    .   
#> [5,] .    .     .    .    .    .   
#> [6,] .    .     .    .    .    49
x1 %*% x1
#> An object of class "bis620_sparse_matrix"
#> Slot "i":
#> [1] 1 2 5 6
#> 
#> Slot "j":
#> [1] 2 2 1 2
#> 
#> Slot "x":
#> [1] 24.08 31.36 70.00 43.00
x1 + t(x2)
#>            [,1]       [,2]        [,3]       [,4]       [,5]       [,6]
#> [1,] -1.1823443  3.3434362  0.57958150 -1.5239164 -0.7058065  1.3782324
#> [2,]  1.3655385  4.5037896 -3.17274105 -1.1180654  2.2365925 -0.7707571
#> [3,]  0.4664551 -1.9530345 -0.05950372  1.5408224 -0.9029322  2.1809144
#> [4,]  0.7155201  1.4375455 -0.90478078 -0.8329671  0.5072563 -0.3944285
#> [5,] -0.9679741  0.1750834 -0.55793273  0.8829742 -0.9052878  7.2473122
#> [6,]  7.3910686  0.3603534 -0.38226995 -1.0474968  0.9767862  1.1217293
x1 %*% x2
#>            [,1]      [,2]       [,3]      [,4]       [,5]       [,6]
#> [1,]  -4.113224 -4.713705  -8.398048  6.181446  0.7528585   1.549520
#> [2,]  -5.356757 -6.138778 -10.936993  8.050255  0.9804669   2.017979
#> [3,]   0.000000  0.000000   0.000000  0.000000  0.0000000   0.000000
#> [4,]   0.000000  0.000000   0.000000  0.000000  0.0000000   0.000000
#> [5,]   9.647627 -5.395300  15.266401 -2.760999  1.7311851   7.852105
#> [6,] -11.823443 13.655385   4.664551  7.155201 -9.6797415 -26.089314
x3 + x1
#> 6 x 6 Matrix of class "dgeMatrix"
#>            [,1]       [,2]        [,3]        [,4]        [,5]        [,6]
#> [1,] -0.6264538  4.7874291 -0.62124058  0.82122120  0.61982575  1.35867955
#> [2,]  0.1836433  6.3383247 -2.21469989  0.59390132 -0.05612874 -0.10278773
#> [3,] -0.8356286  0.5757814  1.12493092  0.91897737 -0.15579551  0.38767161
#> [4,]  1.5952808 -0.3053884 -0.04493361  0.78213630 -1.47075238 -0.05380504
#> [5,]  0.3295078  1.5117812 -0.01619026  0.07456498 -0.47815006  5.62294044
#> [6,]  9.1795316  0.3898432  0.94383621 -1.98935170  0.41794156 -0.41499456
x3 %*% x3
#> 6 x 6 Matrix of class "dgeMatrix"
#>            [,1]        [,2]       [,3]       [,4]       [,5]       [,6]
#> [1,]  1.4006461  0.91275189 -0.1537479 -2.8102457 -1.2551986 -2.6036565
#> [2,]  2.8844895 -0.94684247 -4.3634309 -0.7811478 -0.4721772 -0.5969605
#> [3,]  0.7858155  0.30047560  0.8365410  0.6254409 -1.8405916 -0.7542185
#> [4,] -0.2106564 -1.95704815 -0.4273722  1.6965226  0.5433618  4.1870056
#> [5,]  1.1759679 -0.01499189 -4.8663859  3.9156916 -0.3346642  1.5119278
#> [6,] -2.8984885  1.50893232  0.3990083 -0.2741037  1.8750872 -1.0851990
x1 + x4
#> 6 x 6 sparse Matrix of class "dgCMatrix"
#>                      
#> [1,]  . 8.6 5.6 . . .
#> [2,]  . 5.6 .   . . .
#> [3,]  . .   .   . 7 .
#> [4,]  . .   .   . . .
#> [5,]  . .   .   . . 7
#> [6,] 20 .   .   . . .
x1 %*% x4
#> 6 x 6 Matrix of class "dgeMatrix"
#>      [,1] [,2] [,3] [,4] [,5] [,6]
#> [1,]    0    0    0    0    0    0
#> [2,]    0    0    0    0    0    0
#> [3,]    0    0    0    0    0    0
#> [4,]    0    0    0    0    0    0
#> [5,]   70    0    0    0    0    0
#> [6,]    0   43   56    0    0    0
```

## Final Homework Proposal

Find a real world data set. Call Python in R and finish data cleaning
and exploration under Python. Import data to R and create R6 object and
related methods.
