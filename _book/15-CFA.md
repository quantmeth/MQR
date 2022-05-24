

# CFA

## Création de données

Sur le fond, la création de données de l'analyse factorielle est identique à celle sur l'ACP. Il serait même plus juste d'affirmer que la méthode de création de données présentée pour l'ACP est réellement la méthode de création de données de l'analyse factorielle. 



```r
# Paramètres
n <- 50000 # Nombre d'unités
k <-  3    # Nombre de facteurs
p <- 12    # Nombre de variables

# Création de la structure factorielle
phi = matrix(0, ncol = k, nrow = p) 
phi[c(1:4, 17:20, 33:36)] <- rep(c(.8, .7, .6), each = p / k)
rownames(phi) = paste0(rep("i", p), 1:p)
# Montrer la structure
phi
#>     [,1] [,2] [,3]
#> i1   0.8  0.0  0.0
#> i2   0.8  0.0  0.0
#> i3   0.8  0.0  0.0
#> i4   0.8  0.0  0.0
#> i5   0.0  0.7  0.0
#> i6   0.0  0.7  0.0
#> i7   0.0  0.7  0.0
#> i8   0.0  0.7  0.0
#> i9   0.0  0.0  0.6
#> i10  0.0  0.0  0.6
#> i11  0.0  0.0  0.6
#> i12  0.0  0.0  0.6

# Corrélation entre facteurs
Rphi =  matrix(c( 1, .2, .2,
                  .2,  1, .2,
                  .2, .2,  1), nrow = 3, ncol = 3)
# Mettre en commun les facteurs et leurs corrélations
R <- phi %*% Rphi %*% t(phi)
# Ajouter l'erreur
diag(R) <- 1

# Montrer la matrice de corrélation
# (Résultats arrondis pour l'affichage seulement)
round(R, 2)
#>       i1   i2   i3   i4   i5   i6   i7   i8   i9  i10  i11
#> i1  1.00 0.64 0.64 0.64 0.11 0.11 0.11 0.11 0.10 0.10 0.10
#> i2  0.64 1.00 0.64 0.64 0.11 0.11 0.11 0.11 0.10 0.10 0.10
#> i3  0.64 0.64 1.00 0.64 0.11 0.11 0.11 0.11 0.10 0.10 0.10
#> i4  0.64 0.64 0.64 1.00 0.11 0.11 0.11 0.11 0.10 0.10 0.10
#> i5  0.11 0.11 0.11 0.11 1.00 0.49 0.49 0.49 0.08 0.08 0.08
#> i6  0.11 0.11 0.11 0.11 0.49 1.00 0.49 0.49 0.08 0.08 0.08
#> i7  0.11 0.11 0.11 0.11 0.49 0.49 1.00 0.49 0.08 0.08 0.08
#> i8  0.11 0.11 0.11 0.11 0.49 0.49 0.49 1.00 0.08 0.08 0.08
#> i9  0.10 0.10 0.10 0.10 0.08 0.08 0.08 0.08 1.00 0.36 0.36
#> i10 0.10 0.10 0.10 0.10 0.08 0.08 0.08 0.08 0.36 1.00 0.36
#> i11 0.10 0.10 0.10 0.10 0.08 0.08 0.08 0.08 0.36 0.36 1.00
#> i12 0.10 0.10 0.10 0.10 0.08 0.08 0.08 0.08 0.36 0.36 0.36
#>      i12
#> i1  0.10
#> i2  0.10
#> i3  0.10
#> i4  0.10
#> i5  0.08
#> i6  0.08
#> i7  0.08
#> i8  0.08
#> i9  0.36
#> i10 0.36
#> i11 0.36
#> i12 1.00

# Générer les données
jd <- MASS::mvrnorm(n = n , mu = rep(0, p), Sigma = R)
```


## Calcul
*À terminer*

## Analyse factorielle exploratoire

Pour réaliser une analyse factorielle exploratoire, la fonction de base **R** `factanal()` prend un jeu de donnée et le nombre de facteur à tester.


```r
res1 <-  factanal(jd, factors = 1)
res1
#> 
#> Call:
#> factanal(x = jd, factors = 1)
#> 
#> Uniquenesses:
#>    i1    i2    i3    i4    i5    i6    i7    i8    i9   i10 
#> 0.366 0.365 0.358 0.368 0.966 0.969 0.966 0.968 0.980 0.978 
#>   i11   i12 
#> 0.978 0.978 
#> 
#> Loadings:
#>     Factor1
#> i1  0.796  
#> i2  0.797  
#> i3  0.801  
#> i4  0.795  
#> i5  0.186  
#> i6  0.175  
#> i7  0.184  
#> i8  0.179  
#> i9  0.142  
#> i10 0.147  
#> i11 0.148  
#> i12 0.147  
#> 
#>                Factor1
#> SS loadings       2.76
#> Proportion Var    0.23
#> 
#> Test of the hypothesis that 1 factor is sufficient.
#> The chi square statistic is 81224 on 54 degrees of freedom.
#> The p-value is 0
```

Comme la valeur-$p$ est significative à un facteur, il est possible de tester pour 2 facteurs.


```r
res2 <-  factanal(jd, factors = 2)
res2
#> 
#> Call:
#> factanal(x = jd, factors = 2)
#> 
#> Uniquenesses:
#>    i1    i2    i3    i4    i5    i6    i7    i8    i9   i10 
#> 0.360 0.361 0.353 0.363 0.520 0.508 0.511 0.522 0.965 0.965 
#>   i11   i12 
#> 0.965 0.964 
#> 
#> Loadings:
#>     Factor1 Factor2
#> i1  0.793   0.102  
#> i2  0.792   0.107  
#> i3  0.797   0.106  
#> i4  0.791   0.106  
#> i5          0.691  
#> i6          0.700  
#> i7          0.698  
#> i8          0.690  
#> i9  0.110   0.152  
#> i10 0.115   0.146  
#> i11 0.117   0.145  
#> i12 0.115   0.150  
#> 
#>                Factor1 Factor2
#> SS loadings      2.580   2.063
#> Proportion Var   0.215   0.172
#> Cumulative Var   0.215   0.387
#> 
#> Test of the hypothesis that 2 factors are sufficient.
#> The chi square statistic is 27009 on 43 degrees of freedom.
#> The p-value is 0
```



```r
res3 <-  factanal(jd, factors = 3)
res3
#> 
#> Call:
#> factanal(x = jd, factors = 3)
#> 
#> Uniquenesses:
#>    i1    i2    i3    i4    i5    i6    i7    i8    i9   i10 
#> 0.359 0.360 0.352 0.363 0.518 0.504 0.506 0.519 0.640 0.645 
#>   i11   i12 
#> 0.634 0.651 
#> 
#> Loadings:
#>     Factor1 Factor2 Factor3
#> i1  0.794                  
#> i2  0.792                  
#> i3  0.797                  
#> i4  0.791                  
#> i5          0.687          
#> i6          0.698          
#> i7          0.697          
#> i8          0.687          
#> i9                  0.594  
#> i10                 0.591  
#> i11                 0.600  
#> i12                 0.585  
#> 
#>                Factor1 Factor2 Factor3
#> SS loadings      2.551   1.954   1.445
#> Proportion Var   0.213   0.163   0.120
#> Cumulative Var   0.213   0.375   0.496
#> 
#> Test of the hypothesis that 3 factors are sufficient.
#> The chi square statistic is 31.1 on 33 degrees of freedom.
#> The p-value is 0.56
```
Comme le test n'est plus significatif, le modèle à trois facteurs semblent le bon.


```r
promax(res3$loadings)
#> $loadings
#> 
#> Loadings:
#>     Factor1 Factor2 Factor3
#> i1   0.802                 
#> i2   0.799                 
#> i3   0.804                 
#> i4   0.798                 
#> i5           0.692         
#> i6           0.706         
#> i7           0.703         
#> i8           0.693         
#> i9                   0.600 
#> i10                  0.596 
#> i11                  0.606 
#> i12                  0.590 
#> 
#>                Factor1 Factor2 Factor3
#> SS loadings      2.566   1.953   1.431
#> Proportion Var   0.214   0.163   0.119
#> Cumulative Var   0.214   0.377   0.496
#> 
#> $rotmat
#>         [,1]    [,2]    [,3]
#> [1,]  1.0264 -0.0900 -0.0890
#> [2,] -0.0906  1.0268 -0.0907
#> [3,] -0.0899 -0.0912  1.0267
```

## Analyse factorielle exploratoire avancée

Pour obtenir plus de résultats et suivre les recommandation actuelles, le package `psych` [@psych] est très bien ajusté pour réaliser l'analyse factorielle exploratoire.

La fonction est `fa()` fonctionne comme `factanal`, mais avec beaucoup plus d'arguments. La document détaille très bien toutes les possibilités.


```r
library(psych)
res.fa <- psych::fa(jd, nfactors = 3, rotate = "promax")
#> Le chargement a nécessité le package : GPArotation
res.fa
#> Factor Analysis using method =  minres
#> Call: psych::fa(r = jd, nfactors = 3, rotate = "promax")
#> Standardized loadings (pattern matrix) based upon correlation matrix
#>       MR1   MR2   MR3   h2   u2 com
#> i1   0.80  0.00 -0.01 0.64 0.36   1
#> i2   0.80  0.00  0.00 0.64 0.36   1
#> i3   0.80  0.00  0.00 0.65 0.35   1
#> i4   0.80  0.00  0.00 0.64 0.36   1
#> i5   0.01  0.69  0.01 0.48 0.52   1
#> i6  -0.01  0.71  0.00 0.50 0.50   1
#> i7   0.00  0.70 -0.01 0.49 0.51   1
#> i8   0.00  0.69  0.00 0.48 0.52   1
#> i9  -0.01  0.00  0.60 0.36 0.64   1
#> i10  0.00  0.00  0.60 0.36 0.64   1
#> i11  0.00 -0.01  0.61 0.37 0.63   1
#> i12  0.00  0.00  0.59 0.35 0.65   1
#> 
#>                        MR1  MR2  MR3
#> SS loadings           2.57 1.95 1.43
#> Proportion Var        0.21 0.16 0.12
#> Cumulative Var        0.21 0.38 0.50
#> Proportion Explained  0.43 0.33 0.24
#> Cumulative Proportion 0.43 0.76 1.00
#> 
#>  With factor correlations of 
#>     MR1 MR2 MR3
#> MR1 1.0 0.2 0.2
#> MR2 0.2 1.0 0.2
#> MR3 0.2 0.2 1.0
#> 
#> Mean item complexity =  1
#> Test of the hypothesis that 3 factors are sufficient.
#> 
#> The degrees of freedom for the null model are  66  and the objective function was  3.78 with Chi Square of  188930
#> The degrees of freedom for the model are 33  and the objective function was  0 
#> 
#> The root mean square of the residuals (RMSR) is  0 
#> The df corrected root mean square of the residuals is  0 
#> 
#> The harmonic number of observations is  50000 with the empirical chi square  14.7  with prob <  1 
#> The total number of observations was  50000  with Likelihood Chi Square =  31.1  with prob <  0.56 
#> 
#> Tucker Lewis Index of factoring reliability =  1
#> RMSEA index =  0  and the 90 % confidence intervals are  0 0.003
#> BIC =  -326
#> Fit based upon off diagonal values = 1
#> Measures of factor score adequacy             
#>                                                    MR1  MR2
#> Correlation of (regression) scores with factors   0.94 0.89
#> Multiple R square of scores with factors          0.88 0.79
#> Minimum correlation of possible factor scores     0.76 0.59
#>                                                    MR3
#> Correlation of (regression) scores with factors   0.83
#> Multiple R square of scores with factors          0.70
#> Minimum correlation of possible factor scores     0.39
```


## Analyses factorielles confirmatoire

Pour réaliser l'analyse factorielle confirmatoire avec `lavaan` [@lavaan]


```r
# Inclure le package
library(lavaan)

# Spécifier le modèle
model1 <- 'Factor 1 =~ i1 + i2 + i3 + i4
           Factor 2 =~ i5 + i6 + i7 + i8
           Factor 3 =~ i9 + i10 + i11 + i12'

# Rouler l'analyse
fit1 <- cfa(model1, data = jd)

# Obtenir le sommaire des estimations du modèle
summary(fit1, fit.measures = TRUE, standardized = TRUE, rsquare = TRUE)
#> lavaan 0.6-11 ended normally after 30 iterations
#> 
#>   Estimator                                         ML
#>   Optimization method                           NLMINB
#>   Number of model parameters                        27
#>                                                       
#>   Number of observations                         50000
#>                                                       
#> Model Test User Model:
#>                                                       
#>   Test statistic                                56.406
#>   Degrees of freedom                                51
#>   P-value (Chi-square)                           0.280
#> 
#> Model Test Baseline Model:
#> 
#>   Test statistic                            188952.018
#>   Degrees of freedom                                66
#>   P-value                                        0.000
#> 
#> User Model versus Baseline Model:
#> 
#>   Comparative Fit Index (CFI)                    1.000
#>   Tucker-Lewis Index (TLI)                       1.000
#> 
#> Loglikelihood and Information Criteria:
#> 
#>   Loglikelihood user model (H0)            -757178.165
#>   Loglikelihood unrestricted model (H1)    -757149.961
#>                                                       
#>   Akaike (AIC)                             1514410.329
#>   Bayesian (BIC)                           1514648.463
#>   Sample-size adjusted Bayesian (BIC)      1514562.657
#> 
#> Root Mean Square Error of Approximation:
#> 
#>   RMSEA                                          0.001
#>   90 Percent confidence interval - lower         0.000
#>   90 Percent confidence interval - upper         0.003
#>   P-value RMSEA <= 0.05                          1.000
#> 
#> Standardized Root Mean Square Residual:
#> 
#>   SRMR                                           0.003
#> 
#> Parameter Estimates:
#> 
#>   Standard errors                             Standard
#>   Information                                 Expected
#>   Information saturated (h1) model          Structured
#> 
#> Latent Variables:
#>                    Estimate  Std.Err  z-value  P(>|z|)
#>   Factor1 =~                                          
#>     i1                1.000                           
#>     i2                0.997    0.005  186.928    0.000
#>     i3                1.004    0.005  188.146    0.000
#>     i4                0.991    0.005  186.488    0.000
#>   Factor2 =~                                          
#>     i5                1.000                           
#>     i6                1.013    0.008  125.806    0.000
#>     i7                1.014    0.008  125.780    0.000
#>     i8                1.001    0.008  124.687    0.000
#>   Factor3 =~                                          
#>     i9                1.000                           
#>     i10               0.988    0.011   86.655    0.000
#>     i11               1.008    0.012   87.170    0.000
#>     i12               0.986    0.011   86.384    0.000
#>    Std.lv  Std.all
#>                   
#>     0.804    0.800
#>     0.802    0.800
#>     0.808    0.805
#>     0.797    0.798
#>                   
#>     0.694    0.695
#>     0.703    0.703
#>     0.704    0.703
#>     0.695    0.694
#>                   
#>     0.600    0.600
#>     0.593    0.596
#>     0.605    0.604
#>     0.591    0.592
#> 
#> Covariances:
#>                    Estimate  Std.Err  z-value  P(>|z|)
#>   Factor1 ~~                                          
#>     Factor2           0.111    0.003   35.706    0.000
#>     Factor3           0.095    0.003   32.811    0.000
#>   Factor2 ~~                                          
#>     Factor3           0.083    0.003   31.413    0.000
#>    Std.lv  Std.all
#>                   
#>     0.199    0.199
#>     0.197    0.197
#>                   
#>     0.199    0.199
#> 
#> Variances:
#>                    Estimate  Std.Err  z-value  P(>|z|)
#>    .i1                0.363    0.003  117.295    0.000
#>    .i2                0.362    0.003  117.378    0.000
#>    .i3                0.355    0.003  115.959    0.000
#>    .i4                0.361    0.003  117.871    0.000
#>    .i5                0.515    0.004  118.312    0.000
#>    .i6                0.506    0.004  116.433    0.000
#>    .i7                0.508    0.004  116.488    0.000
#>    .i8                0.521    0.004  118.647    0.000
#>    .i9                0.641    0.005  117.669    0.000
#>    .i10               0.638    0.005  118.427    0.000
#>    .i11               0.636    0.005  116.642    0.000
#>    .i12               0.648    0.005  119.291    0.000
#>     Factor1           0.647    0.006  102.504    0.000
#>     Factor2           0.482    0.006   78.678    0.000
#>     Factor3           0.360    0.006   59.257    0.000
#>    Std.lv  Std.all
#>     0.363    0.359
#>     0.362    0.360
#>     0.355    0.352
#>     0.361    0.363
#>     0.515    0.517
#>     0.506    0.506
#>     0.508    0.506
#>     0.521    0.519
#>     0.641    0.640
#>     0.638    0.645
#>     0.636    0.635
#>     0.648    0.650
#>     1.000    1.000
#>     1.000    1.000
#>     1.000    1.000
#> 
#> R-Square:
#>                    Estimate
#>     i1                0.641
#>     i2                0.640
#>     i3                0.648
#>     i4                0.637
#>     i5                0.483
#>     i6                0.494
#>     i7                0.494
#>     i8                0.481
#>     i9                0.360
#>     i10               0.355
#>     i11               0.365
#>     i12               0.350
```

Ce modèle ne respectant les critères usuelles en modélisation par équations structurelles, il peut être grandement améliorer.



```r
modindices(fit1, sort = TRUE, maximum.number = 5)
#>        lhs op rhs   mi    epc sepc.lv sepc.all sepc.nox
#> 85      i4 ~~  i5 7.73  0.007   0.007    0.016    0.016
#> 32 Factor1 =~  i6 6.33 -0.013  -0.010   -0.010   -0.010
#> 91      i4 ~~ i11 4.86  0.006   0.006    0.012    0.012
#> 51 Factor3 =~  i5 4.44  0.016   0.010    0.010    0.010
#> 75      i2 ~~ i12 4.43  0.006   0.006    0.012    0.012
```

Le modèle standardisé


```r
standardizedsolution(fit1)
#>        lhs op     rhs est.std    se     z pvalue ci.lower
#> 1  Factor1 =~      i1   0.800 0.002 389.1      0    0.796
#> 2  Factor1 =~      i2   0.800 0.002 388.6      0    0.796
#> 3  Factor1 =~      i3   0.805 0.002 396.2      0    0.801
#> 4  Factor1 =~      i4   0.798 0.002 386.0      0    0.794
#> 5  Factor2 =~      i5   0.695 0.003 223.3      0    0.689
#> 6  Factor2 =~      i6   0.703 0.003 228.4      0    0.697
#> 7  Factor2 =~      i7   0.703 0.003 228.3      0    0.697
#> 8  Factor2 =~      i8   0.694 0.003 222.4      0    0.688
#> 9  Factor3 =~      i9   0.600 0.004 143.8      0    0.591
#> 10 Factor3 =~     i10   0.596 0.004 142.6      0    0.588
#> 11 Factor3 =~     i11   0.604 0.004 145.3      0    0.596
#> 12 Factor3 =~     i12   0.592 0.004 141.3      0    0.584
#> 13      i1 ~~      i1   0.359 0.003 109.2      0    0.353
#> 14      i2 ~~      i2   0.360 0.003 109.2      0    0.353
#> 15      i3 ~~      i3   0.352 0.003 107.7      0    0.346
#> 16      i4 ~~      i4   0.363 0.003 109.8      0    0.356
#> 17      i5 ~~      i5   0.517 0.004 119.4      0    0.508
#> 18      i6 ~~      i6   0.506 0.004 116.8      0    0.497
#> 19      i7 ~~      i7   0.506 0.004 116.9      0    0.497
#> 20      i8 ~~      i8   0.519 0.004 119.9      0    0.510
#> 21      i9 ~~      i9   0.640 0.005 128.1      0    0.631
#> 22     i10 ~~     i10   0.645 0.005 129.4      0    0.635
#> 23     i11 ~~     i11   0.635 0.005 126.3      0    0.625
#> 24     i12 ~~     i12   0.650 0.005 131.0      0    0.640
#> 25 Factor1 ~~ Factor1   1.000 0.000    NA     NA    1.000
#> 26 Factor2 ~~ Factor2   1.000 0.000    NA     NA    1.000
#> 27 Factor3 ~~ Factor3   1.000 0.000    NA     NA    1.000
#> 28 Factor1 ~~ Factor2   0.199 0.005  38.3      0    0.188
#> 29 Factor1 ~~ Factor3   0.197 0.006  35.3      0    0.186
#> 30 Factor2 ~~ Factor3   0.199 0.006  33.9      0    0.188
#>    ci.upper
#> 1     0.804
#> 2     0.804
#> 3     0.809
#> 4     0.802
#> 5     0.701
#> 6     0.709
#> 7     0.709
#> 8     0.700
#> 9     0.608
#> 10    0.604
#> 11    0.612
#> 12    0.600
#> 13    0.366
#> 14    0.366
#> 15    0.359
#> 16    0.369
#> 17    0.525
#> 18    0.514
#> 19    0.514
#> 20    0.527
#> 21    0.650
#> 22    0.654
#> 23    0.645
#> 24    0.659
#> 25    1.000
#> 26    1.000
#> 27    1.000
#> 28    0.209
#> 29    0.208
#> 30    0.211
```

## Packages



