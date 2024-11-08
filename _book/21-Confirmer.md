# (PART) Équations structurelles {-}

# Confirmer

Dans ce livre, de multiples analyses ont été présentés jusqu'à présent. 

La modélisation par équations structurelles permet de combiner toutes les analyses qui ont été vues jusqu'à maintenant que ce soit, la modération, la médiation, la régression, les analyses factorielles.

Ce chapitre insiste sur l'aspect confirmatoire des analyses statistiques.



```r
library(lavaan)
> This is lavaan 0.6-18
> lavaan is FREE software! Please report any bugs.
```

## Spécifier un modèle

La première étape d'un modèle avec `lavaan` est d'écrire un modèle. Comme il s'agit de multiple formules, il ne sera pas d'utiliser le traditionnel `~`. Un modèle d'équation structurelle de `lavaan` se compose d'une seule [chaîne de caractères] commençant et finissant par des guillemets anglophone comme `model <- "les équations"` et qui contient toutes les équations. Il est important que chaque équation ait sa propre ligne. Voici une liste d'opérateur les plus commun.

* `~` signifie *prédit par*, comme `y ~ x + m`

* `~~` se traduit par *est lié à*, comme une covariance `x ~~ y` 

`=~` est *se mesure de*, comme `F1 =~ i1 + i2 + i3` 

`*` *nomme* ou *fixe* un paramètre, par exemple, `y ~ a*x` permet d'utiliser le coefficient de régression lié à `x`, `y ~ .5*x` fixe le coefficient à .5 ou si `a` (le libellé) est utilisé à plusieurs endroits, cela contraint la valeur à être identiquer pour les deux équations.

`:=` *définit* un paramètre, par exemple, s'il faut la somme ou le produit de différents coefficients.

Une fois le modèle assigné dans une variable, les fonctions `sem()` et `cfa()` pourront être utilisées pour tester le modèle aux données. Les deux sont virtuellement identiques.


## Les fonctions

### Les indices d'ajustement

Une fois l'analyse l'analyse, l'utilisateur peut regarder les indices d'ajustement. Il est recommandé de rapporter le $\chi^2$ avec sa valeur-$p$ et ses degrés de liberté ainsi que l'indice comparatif d'ajustement (CFI), l'indice de Tucker-Lewis (TLI), l'erreur quadratique moyenne d'approximation (RMSEA) et le résidu quadratique moyen standardiséé (SRMR).

Dans le contexte des modèles d'équations structurelles, le $\chi^2$ est un indice classique de la qualité de l'ajustement du modèle aux données observées. Il compare la matrice de covariance observée des données à la matrice de covariance prédite par le modèle. Le but est de déterminer si les différences entre ces deux matrices peuvent être attribuées à des variations aléatoires. Une valeur-$p$ supérieure à 0.05 (non significative) suggère que le modèle s'ajuste bien aux données. Le $\chi^2$  est très sensible à la taille de l'échantillon. Pour des échantillons très grands, de petites différences peuvent produire une valeur significative, suggérant à tort un mauvais ajustement. Pareillement, pour les modèles avec de nombreux paramètres, il peut souvent indiquer un mauvais ajustement en raison de l'accumulation d'erreurs.

Le CFI est un indice utilisé dans la modélisation par équations structurelles (SEM) pour évaluer la qualité de l'ajustement d'un modèle par rapport à un modèle de référence. Il compare le modèle testé à un modèle nul (ou indépendant) où il n'existe aucune relation entre les variables observées. Le CFI varie entre 0 et 1, avec des valeurs plus proches de 1 indiquant un meilleur ajustement. En général, un CFI supérieur à 0.90 est considéré comme indiquant un bon ajustement du modèle, tandis qu'un CFI supérieur à 0.95 est souvent interprété comme excellent.

Comme le CFI, le TLI compare le modèle testé à un modèle nul où il n'y a pas de relations entre les variables observées. Cependant, contrairement au CFI, le TLI pénalise la complexité du modèle; il ajuste la statistique d'ajustement en fonction du nombre de paramètres estimés, ce qui signifie qu'il prend en compte le degré de liberté. Cela peut rendre le TLI plus strict, surtout pour des modèles très complexes.

Le TLI varie également entre 0 et 1, avec des valeurs plus proches de 1 indiquant un meilleur ajustement. En général, un TLI supérieur à 0.90 est considéré comme indiquant un bon ajustement, tandis qu'un TLI supérieur à 0.95 est souvent interprété comme excellent.

Le RMSEA est un indice utilisé dans la modélisation par équations structurelles (SEM) pour évaluer la qualité de l'ajustement d'un modèle aux données observées. Cet indice mesure l'écart entre le modèle hypothétique et la réalité observée. Des valeurs plus faibles de RMSEA indiquent un meilleur ajustement. En général, un RMSEA inférieur à 0,05 est considéré comme un bon ajustement, tandis qu'un RMSEA entre 0,05 et 0,08 est jugé acceptable.

Le SRMR est un indice utilisé dans la modélisation par équations structurelles (SEM) pour évaluer la qualité de l'ajustement d'un modèle aux données observées. Cet indice mesure la différence moyenne entre les corrélations observées et les corrélations prédites par le modèle. Des valeurs plus faibles de SRMR indiquent un meilleur ajustement. En général, un SRMR inférieur à 0,08 est considéré comme un bon ajustement.

Pour obtenir spécifiquement ces indices, il faut utilier la syntaxe suivante avec la sortie de `lavaan`. 


```r
fitmeasures(object, fit.measures = c("chisq", "df", "pvalue",
           "cfi", "tli", "RMSEA", "SRMR"))
```

En tout, `lavaan` produit 46 indices statistiques différents. Ceux recommandés ici sont les mêmes que ceux rapportés par le logiciel Mplus. Il peut être intéressant de voir les autres options si cela est nécessaire pour l'utilisateur dans son domaine. Cela se fait simplement en laissant vide l'argument `fit.measures` qui par défaut est `fit.measures = "all"`.

### Les indices de modifcation

Il est rare que le modèle testé atteint les critères généraux d'ajustement. Ainsi, il est possible d'améliorer le modèle en le peaufinant. La fonction `modindices()` suggère différentes équations.


```r
modindices(object, sort = TRUE)
```

L'argument `sort = TRUE` permet d'avoir les arguments en ordre d'importances. La fonction produit des résultats athéoriques qui ne font parfois aucun sens. Elle ne donne que des suggestions sur le plan statistique, jamais conceptuel ou théorique. C'est à l'utilisateur d'être judicieux dans ses choix. Par exemple, il est recommandé de d'abord envisager des covariances `~~`, car celles-ci sont les moins contraignantes sur le plan théoriques. Les opérations `=~`, et `~` peuvent être envisagées par la suite si elles sont justifiables théoriquement. 

### Les résultats standarisés

La fonction `standardizedSolution` du package `lavaan` est utilisée pour extraire les solutions standardisées des modèles d'équations structurelles (SEM). Ces solutions fournissent des coefficients standardisés qui facilitent l'interprétation des relations entre les variables dans le modèle, en éliminant les effets des unités de mesure.


```r
standardizedSolution(object)
```


## Analyse factorielle confirmatoire

Voici un exemple d'analyse factorielle exploratoire. La syntaxe suivante recrée le modèle présenté au chapitre [Explorer]. La matrice de corrélation se trouve dans le package `Rnest` pour aller plus rapidement.


```r
# Création de la matrice de recette de fabrication
R <- Rnest::ex.mqr
#R <- 
set.seed(32)
# Création du jeu de données
jd.cfa <- MASS::mvrnorm(n = 500, 
                    mu = rep(0, ncol(R)), 
                    Sigma = R)
```

La première étape est de définir le modèle. Dans la syntaxe, deux facteurs sont créés à partir des items qui devraient les composer. Ici, le lien `F1 =~ i6` est intentionnellement omit. L'ajout de `F1 ~~ 0*F2` qui fixe la covariance entre `F1` et `F2` à 0, ce qui facilitera la convergence de l'analyse dans ce cas spécifique.


```r
model.cfa1 <- "
F1 =~ i1 + i2 + i3
F2 =~ i4 + i5 + i6
F1 ~~ 0*F2
"
```

Une fois le modèle transcrit, il faut le rouler avec la fonction `cfa()` en incluant les données et le modèle


```r
res.cfa1 <- cfa(model.cfa1, data = jd.cfa)
#res.sem1 <- sem(model.cfa1, data = jd.cfa)
```

À la place de `F1 ~~ 0*F2`, l'orthogonalité des facteurs aurait pu être demandé avec `orthogonal = TRUE`. Autrement, les facteurs sont obliques (libres d'être corrélés) par défaut.


```r
res.cfa1 <- cfa(model.cfa1, sample.cov = cor(jd.cfa), sample.nobs = 60)
```

Pour juger du modèle, les indices d'ajustement sont extraits.


```r
fitmeasures(res.cfa1, c("chisq", "df", "pvalue",
                            "cfi", "tli", "RMSEA", "SRMR"))
>  chisq     df pvalue    cfi    tli  rmsea   srmr 
> 76.571  9.000  0.000  0.909  0.848  0.123  0.117
```
Les indices pourraient être légèrement amélioré ici. Notamment, le `tli` est trop faible (en bas de .90), le `rmsea` et le `srmr` sont trop élevés (au dessus de .08) et le `chisq` est significatif à $p<.001$. La modification d'indice est demandé pour voir comment améliorer le modèle.


```r
modindices(res.cfa1, sort = TRUE)
>    lhs op rhs     mi    epc sepc.lv sepc.all sepc.nox
> 18  F1 =~  i6 62.727  0.405   0.352    0.353    0.353
> 7   F1 ~~  F2 27.312  0.136   0.339    0.339    0.339
> 26  i1 ~~  i6 11.008  0.087   0.087    0.260    0.260
> 19  F2 =~  i1  8.583  0.243   0.112    0.117    0.117
> 30  i2 ~~  i6  5.293  0.064   0.064    0.127    0.127
> 24  i1 ~~  i4  2.594 -0.043  -0.043   -0.120   -0.120
> 29  i2 ~~  i5  2.470 -0.045  -0.045   -0.086   -0.086
> 25  i1 ~~  i5  2.464  0.042   0.042    0.122    0.122
> 16  F1 =~  i4  1.948 -0.072  -0.063   -0.063   -0.063
> 32  i3 ~~  i5  1.080 -0.034  -0.034   -0.056   -0.056
> 20  F2 =~  i2  0.762  0.077   0.035    0.038    0.038
> 31  i3 ~~  i4  0.318  0.018   0.018    0.029    0.029
> 33  i3 ~~  i6  0.258  0.016   0.016    0.027    0.027
> 17  F1 =~  i5  0.196 -0.023  -0.020   -0.020   -0.020
> 28  i2 ~~  i4  0.147  0.011   0.011    0.020    0.020
> 21  F2 =~  i3  0.002 -0.005  -0.002   -0.002   -0.002
```

Les résultats montrent en ordre décroissant, des modifications à apporter au modèle qui pourraient l'améliorer. Les colonnes `lhs`, `op` et `rhs` représente l'ajout à fait et `mi` l'indice de modification. Plus ce dernier est élevé, plus il devrait améliorer le modèle une fois ajouter. En général, il faut privilégié les opérateurs comme `~~` soit une covariance entre deux variables, car elles sont moins contraignantes théoriquement. Les opérations `=~`, et `~` peuvent être envisagées si elles sont théoriquement soutenues. 

Tel qu'attendu, les indices de modifications suggèrent ici d'ajouter le lien `F1 =~ i6` dans le modèle. Normalement, cela serait à éviter à cause des implications théoriques, mais comme la structure de la population est connue, il s'agit bel et bien de la bonne solution.

Il faut par la suite réaliser de nouveau l'analyse pour tester le nouveau modèle.



```r
model.cfa2 <- "
F1 =~ i1 + i2 + i3 + i6
F2 =~ i4 + i5 + i6"

res.cfa2 <- cfa(model.cfa2, data = jd.cfa)
```

Les indices d'ajustement sont inspectés de nouveaux.


```r
fitmeasures(res.cfa2, c("chisq", "df", "pvalue",
                            "cfi", "tli", "RMSEA", "SRMR"))
>  chisq     df pvalue    cfi    tli  rmsea   srmr 
>  6.305  7.000  0.505  1.000  1.002  0.000  0.014
```
Ils sont tous excellents et respectent les recommandations.

Grâce au package [`lavaanExtra`][https://github.com/rempsyc/lavaanExtra] il est possible de produire rapidement une figure des résultats finaux. Il faut absolument avoir installer les packages `rsvg` et `DiagrammeRsvg` pour obtenir la figure.


```r
# TODO
# Ne fonctionne pas pour le livre
lavaanExtra::cfa_fit_plot(model.cfa2, data = jd.cfa)
```

Enfin, les paramètres pourront être extraits si l'utilisateur désire les observés.


```r
# Estimés non standardisés
parameterestimates(res.cfa2)
```


```r
# Estimés standardisisé
standardizedSolution(res.cfa2)
>    lhs op rhs est.std    se     z pvalue ci.lower ci.upper
> 1   F1 =~  i1   0.903 0.022 41.06  0.000    0.860    0.946
> 2   F1 =~  i2   0.754 0.026 29.03  0.000    0.703    0.805
> 3   F1 =~  i3   0.690 0.029 24.20  0.000    0.634    0.746
> 4   F1 =~  i6   0.318 0.048  6.66  0.000    0.225    0.412
> 5   F2 =~  i4   0.474 0.058  8.13  0.000    0.360    0.588
> 6   F2 =~  i5   0.552 0.063  8.80  0.000    0.429    0.675
> 7   F2 =~  i6   0.528 0.062  8.51  0.000    0.407    0.650
> 8   i1 ~~  i1   0.184 0.040  4.63  0.000    0.106    0.262
> 9   i2 ~~  i2   0.432 0.039 11.02  0.000    0.355    0.508
> 10  i3 ~~  i3   0.524 0.039 13.29  0.000    0.446    0.601
> 11  i6 ~~  i6   0.578 0.066  8.79  0.000    0.449    0.707
> 12  i4 ~~  i4   0.776 0.055 14.06  0.000    0.668    0.884
> 13  i5 ~~  i5   0.695 0.069 10.03  0.000    0.559    0.831
> 14  F1 ~~  F1   1.000 0.000    NA     NA    1.000    1.000
> 15  F2 ~~  F2   1.000 0.000    NA     NA    1.000    1.000
> 16  F1 ~~  F2   0.122 0.074  1.66  0.097   -0.022    0.266
```

## Analyse acheminatoire




```r
jd.med <- pathanalysis::medEX

model.med1 <- "
m1 ~ x
m2 ~ x + m1
y  ~ m2 + m1 + x" 
```


Dans le cas de la médiation, il est possible de calculer l'effet indirect en nommant les paramètres et définissant l'effet indirect.


```r
model.med2 <- "
m1 ~ a*x
m2 ~ x + b*m1
y  ~ c*m2 + m1 + d*x
indirect := a * b * c
total := indirect + d"
```



```r
model.med3 <- "
m1 ~ a1*x
m2 ~ a2*x + b2*m1
y  ~ c2*m2 + c1*m1 + d*x
total_indirect := a1 * b2 * c2
ind_x_m1_y  := a1 * c1
ind_x_m2_y  := a2 * c2
ind_x_m1_m2 := a1 * b2
ind_m1_m2_y := b2 * c2
total := total_indirect + d"
```



```r
res.lav.med3 <- sem(model.med3, data = jd.med)
```

Voir le output.

```r
parameterestimates(res.lav.med3)
>               lhs op              rhs          label    est
> 1              m1  ~                x             a1  0.494
> 2              m2  ~                x             a2  0.178
> 3              m2  ~               m1             b2  0.452
> 4               y  ~               m2             c2  0.664
> 5               y  ~               m1             c1 -0.016
> 6               y  ~                x              d  0.246
> 7              m1 ~~               m1                 0.767
> 8              m2 ~~               m2                 0.645
> 9               y ~~                y                 0.355
> 10              x ~~                x                 1.005
> 11 total_indirect :=         a1*b2*c2 total_indirect  0.148
> 12     ind_x_m1_y :=            a1*c1     ind_x_m1_y -0.008
> 13     ind_x_m2_y :=            a2*c2     ind_x_m2_y  0.118
> 14    ind_x_m1_m2 :=            a1*b2    ind_x_m1_m2  0.223
> 15    ind_m1_m2_y :=            b2*c2    ind_m1_m2_y  0.300
> 16          total := total_indirect+d          total  0.394
>       se      z pvalue ci.lower ci.upper
> 1  0.042 11.738  0.000    0.411    0.576
> 2  0.044  4.014  0.000    0.091    0.265
> 3  0.044 10.254  0.000    0.366    0.539
> 4  0.036 18.596  0.000    0.594    0.733
> 5  0.036 -0.431  0.667   -0.087    0.056
> 6  0.033  7.359  0.000    0.181    0.312
> 7  0.052 14.697  0.000    0.665    0.870
> 8  0.044 14.697  0.000    0.559    0.731
> 9  0.024 14.697  0.000    0.308    0.402
> 10 0.000     NA     NA    1.005    1.005
> 11 0.021  7.132  0.000    0.107    0.189
> 12 0.018 -0.431  0.667   -0.043    0.028
> 13 0.030  3.924  0.000    0.059    0.177
> 14 0.029  7.723  0.000    0.167    0.280
> 15 0.033  8.980  0.000    0.235    0.366
> 16 0.038 10.358  0.000    0.320    0.469
```


Ici, le modèle est saturé, mais il est tout de même possible d'obtenir les 


```r
fitmeasures(res.lav.med3, c("chisq", "df", "pvalue",
                            "cfi", "tli", "RMSEA", "SRMR"))
>  chisq     df pvalue    cfi    tli  rmsea   srmr 
>      0      0     NA      1      1      0      0
```


La Figure\ \@ref(fig:lesem) montre le modèle final.


```r
lavaanExtra::nice_lavaanPlot(res.lav.med3)
```

<div class="figure" style="text-align: center">

```{=html}
<div class="grViz html-widget html-fill-item-overflow-hidden html-fill-item" id="htmlwidget-c72387fd6c1102706219" style="width:75%;height:75%;"></div>
<script type="application/json" data-for="htmlwidget-c72387fd6c1102706219">{"x":{"diagram":" digraph plot { \n graph [ rankdir = LR ] \n node [ shape = box, fontname = Helvetica ] \n node [shape = box] \n x; m1; m2; y \n node [shape = oval] \n  \n \n edge [ color = black ] \n x->m1 [label = \"0.49***\"] x->m2 [label = \"0.18***\"] m1->m2 [label = \"0.46***\"] m2->y [label = \"0.67***\"] m1->y [label = \"\"] x->y [label = \"0.25***\"]  \n}","config":{"engine":"dot","options":null}},"evals":[],"jsHooks":[]}</script>
```

<p class="caption">(\#fig:lesem)Représentation graphiques du modèle acheminatoire </p>
</div>



