# La régression multiniveau

Fondamentalement, ce qui distingue une régression traditionnelle d'une régression multiniveau est le fait que les paramètres sont fixes pour la première et aléatoires pour la seconde. Auparavant, un paramètre comme $\beta_1$ recevait une valeur, comme `beta1 <- 2` et voilà tout. Mathématiquement, il s'agit de l'espérance du paramètre, $\EX \beta_1=  2$.  Le paramètre est fixe. La variabilité des données provient exclusivement des variables. Pour le multiniveau, les paramètres sont eux aussi aléatoires comme les variables. Il faut ainsi les échantillonner d'une distribution. L'ensemble des paramètres suivent une distribution normale multivariée (ou univariée, s'il n'y a qu'un paramètre) identifiée par $\mathcal{N}(\mu,\mathbf{\Sigma})$. Chaque paramètre a son espérance, soit la valeur attendue, $\mu$. Il s'agit du grossièrement du paramètre *fixe* de la population comme auparavant, mis également les paramètres ont leur propre matrice de covariance, $\mathbf{\Sigma}$. L'équation \@ref(eq:parameters) montre la distribution multivariée pour deux paramètres, l'intercepte $\beta_0$ et la pente $\beta_1$.

\begin{equation}
\begin{bmatrix} 
\beta_0 \\ 
\beta_1 
\end{bmatrix} 
\sim \mathcal{N} \left ( 
\begin{bmatrix} 
\EX \beta_0 \\ 
\EX \beta_1 
\end{bmatrix}, 
\begin{bmatrix} 
\sigma^2_{\beta_0} & \rho \sqrt{\sigma^2_{\beta_0} \sigma^2_{\beta_1^{}}} \\ 
\rho \sqrt{\sigma^2_{\beta_0} \sigma^2_{\beta_1^{}}}& \sigma^2_{\beta_1} 
\end{bmatrix} 
\right)
(\#eq:parameters)
\end{equation}

Les espérances 
$$\begin{bmatrix} \EX \beta_0 \\ \EX \beta_1 \end{bmatrix}$$
représentent les valeurs attendues et la matrice de covariance 
$$\mathbf{\Sigma}^\beta = \begin{bmatrix} \sigma^2_{\beta_0} & \rho \sqrt{\sigma^2_{\beta_0} \sigma^2_{\beta_1^{}}} \\ \rho \sqrt{\sigma^2_{\beta_0} \sigma^2_{\beta_1^{}}}& \sigma^2_{\beta_1} \end{bmatrix}$$ 
représente leur variabilité, où l'exposant ${}^\beta$ désigne la matrice de covariance des paramètres (il n'a pas d'opération mathématique particulière).

# Création de données

Pour procéder à la création de données, la même technique est utilisée que pour la régression traditionnelle, à l'exception où les paramètres ($\beta$) sont eux aussi distribués aléatoirement entre les groupes.

Pour connaître la variance résiduelle de $y$ considérant que les paramètres sont fixés à l'avance par le modeleur, le calcul correspond à la somme des effets fixes et des effets alétoire. Les effets fixes correspondent au traditionnel 
$$
\mathbf{B^\prime \Sigma B}
$$
les effets aléatoires sont quant à eux égalent à la somme des variances des paramètres multiniveaux, soit $$\sum_1^{k}\mathbf{\Sigma}^\beta_{i,i}$$ où $k$ est le nombre de paramètres, $k=2$ pour cet exemple. Cette dernière équation se résume simplement en syntaxe **R** par `sum(diag(Sbeta))`. En additionnant les deux, la variance expliquée du modèle complet est obtenue. En soustrayant cette somme de la variance de $y$, $\sigma^2_y$, la variance résiduelle est obtenue, $$\sigma^2_y - (\sum_{i=1}^{k}\mathbf{\Sigma}^\beta_{i,i} + \mathbf{B^\prime \Sigma B})$$.
Pour un modèle standardisé, $\sigma^2_y=1$.


```r
# Mettre des nombres plus élevés pour la précision
ns = 1000        # Nombre de groupes
nt = 1000        # Nombre de données par groupes
n = ns * nt      # Nombre total de données
# Paramètres
beta0 = .2   # Intercepte
beta1 = .4   # Pente
beta = c(beta0, beta1)
# Matrice de corrélation des paramètres
Sbeta = matrix(c(.4, .2,  
                 .2, .3), ncol = 2, nrow = 2)

# Génération des paramètres pour les groupes (ns)
parameters <- MASS::mvrnorm(n = ns, mu = beta, Sigma = Sbeta)
colnames(parameters) <- c("beta0", "beta1")

# Variable contenant les appartenances aux groupes
groups = (rep(1:ns, each = nt)) 

# Variable indépendante
x <- rnorm(n)

# Variable dépendante (prédite - sans erreur)
y.pred <- parameters[groups, "beta0"] + parameters[groups, "beta1"] * x
var(y.pred)
#> [1] 0.811
# Il manque de la variance à y.pred pour égaler 1
# Pour obtenir une variance de 1
# Il faut additionner les variances des paramètre `sum(diag(Sbeta))`
# et calculer l'effet des VI normalement `beta %*% S %*% beta`
# Avec une seule pente et comme var(x) = 1, alors beta1^2
# beta1 %*% 1 %*% beta1 = beta^2
var_ey <- 1-(sum(diag(Sbeta)) + beta1^2)

e <- rnorm(n = n, sd = sqrt(var_ey))
y <- parameters[groups, "beta0"] + parameters[groups, "beta1"] * x + e
var(y)
#> [1] 0.952
```

Assez près. 


```r
# Mettre en commun les variables dans un jeu de données
jd <- data.frame(y = y,
                 x = x,
                 g = as.factor(groups))
```


# L'analyse multiniveau

## Packages nécessaires
Voici les packages nécessaires.


```r
# Multiniveau
library(lme4)         # pour lmer
library(arm)          # pour les S.E.
library(lmerTest)     # pour les valeurs-p
library(performance)  # pour ICC
```

## Les hypothèses à tester

Pour réaliser les analyses, il est possible de tester les trois hypothèses, à savoir :
* Tester un modèle sans multiniveau (*pooled*);
* Tester un modèle avec intercepte aléatoire;
* Tester un modèle avec pente aléatoire.

## Estimations des modèles 

Voici les modèles sous-jacents aux trois hypothèses.


```r
# Complètement pool
pooled = lm(y ~ x, data = jd)
summary(pooled)
#> 
#> Call:
#> lm(formula = y ~ x, data = jd)
#> 
#> Residuals:
#>    Min     1Q Median     3Q    Max 
#> -7.598 -0.547  0.001  0.549  7.218 
#> 
#> Coefficients:
#>             Estimate Std. Error t value Pr(>|t|)    
#> (Intercept) 0.202925   0.000900     226   <2e-16 ***
#> x           0.377153   0.000899     420   <2e-16 ***
#> ---
#> Signif. codes:  
#> 0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
#> 
#> Residual standard error: 0.9 on 999998 degrees of freedom
#> Multiple R-squared:  0.15,	Adjusted R-squared:  0.15 
#> F-statistic: 1.76e+05 on 1 and 1e+06 DF,  p-value: <2e-16

# Modèle avec intercepte
res_int = lmer(y ~ x + (1 | g), data = jd)
res_int
#> Linear mixed model fit by REML ['lmerModLmerTest']
#> Formula: y ~ x + (1 | g)
#>    Data: jd
#> REML criterion at convergence: 2008316
#> Random effects:
#>  Groups   Name        Std.Dev.
#>  g        (Intercept) 0.614   
#>  Residual             0.658   
#> Number of obs: 1000000, groups:  g, 1000
#> Fixed Effects:
#> (Intercept)            x  
#>       0.203        0.378

# Modèle avec pente et intercepte

res_pente = lmer(y ~ x + (1 + x | g), data = jd)
res_pente
#> Linear mixed model fit by REML ['lmerModLmerTest']
#> Formula: y ~ x + (1 + x | g)
#>    Data: jd
#> REML criterion at convergence: 887132
#> Random effects:
#>  Groups   Name        Std.Dev. Corr
#>  g        (Intercept) 0.614        
#>           x           0.541    0.61
#>  Residual             0.374        
#> Number of obs: 1000000, groups:  g, 1000
#> Fixed Effects:
#> (Intercept)            x  
#>       0.203        0.377
```

## Comparaison des modèles

Voilà les trois modèles à tester. Pour les comparer, la fonction `anova()` produira les comparaisons. Faire attention à l'ordre d'entrer des modèles.


```r
# Attention, l'ordre des modèles importe pour pooled
anova(res_pente, res_int, pooled)
#> refitting model(s) with ML (instead of REML)
#> Data: jd
#> Models:
#> pooled: y ~ x
#> res_int: y ~ x + (1 | g)
#> res_pente: y ~ x + (1 + x | g)
#>           npar     AIC     BIC   logLik deviance   Chisq Df
#> pooled       3 2626643 2626678 -1313318  2626637           
#> res_int      4 2008305 2008352 -1004149  2008297  618340  1
#> res_pente    6  887131  887202  -443560   887119 1121178  2
#>           Pr(>Chisq)    
#> pooled                  
#> res_int       <2e-16 ***
#> res_pente     <2e-16 ***
#> ---
#> Signif. codes:  
#> 0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

Toutes les informations pertinentes s'y retrouvent. Clairement le modèle avec pentes aléatoires est meilleur considérant qu'il a un avantage significatif sur les deux autres.

## Extraire les résultats

Pour approfondir les résultats, le sommaire peut être généré et plusieurs informations peuvent être extraites en supplément.


```r
# Les paramètres fixés sont bien retrouvés
summary(res_pente)
#> Linear mixed model fit by REML. t-tests use
#>   Satterthwaite's method [lmerModLmerTest]
#> Formula: y ~ x + (1 + x | g)
#>    Data: jd
#> 
#> REML criterion at convergence: 887132
#> 
#> Scaled residuals: 
#>    Min     1Q Median     3Q    Max 
#> -4.783 -0.673  0.000  0.674  4.690 
#> 
#> Random effects:
#>  Groups   Name        Variance Std.Dev. Corr
#>  g        (Intercept) 0.377    0.614        
#>           x           0.293    0.541    0.61
#>  Residual             0.140    0.374        
#> Number of obs: 1000000, groups:  g, 1000
#> 
#> Fixed effects:
#>             Estimate Std. Error       df t value Pr(>|t|)
#> (Intercept)   0.2032     0.0194 999.0008    10.5   <2e-16
#> x             0.3773     0.0171 999.0011    22.0   <2e-16
#>                
#> (Intercept) ***
#> x           ***
#> ---
#> Signif. codes:  
#> 0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
#> 
#> Correlation of Fixed Effects:
#>   (Intr)
#> x 0.613

# Le coefficient de corrélation intraclasse (ICC)
performance::icc(res_pente)
#> # Intraclass Correlation Coefficient
#> 
#>      Adjusted ICC: 0.827
#>   Conditional ICC: 0.703
```

Le coefficient de corrélation intraclasse représente correspond à $$ \sum_{i=1}^{k}\mathbf{\Sigma}^\beta_{i,i} / \sigma^2_y$$ ou en code **R**.


```r
# La variance de y est égale 1, car standardisée
sum(diag(Sbeta)) / 1
#> [1] 0.7
# Très près de l'ICC conditonnelle
```

Pour obtenir les paramètres et leur erreur standard.


```r
# Extrait les ns interceptes et pentes
coef(res_pente)

# Extrait les erreur standard (S.E.)
arm::se.coef(res_pente)
```



