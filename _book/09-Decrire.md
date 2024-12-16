# (PART) Statistiques {-}

# Décrire

En se basant sur les chapitres [Calculer] et [Manipuler], l'utilisateur possède les fondements pour obtenir les informations sommaires d'un jeu de données. Il voudra régulièrement réaliser des analyses descriptives sur ce dernier. 

## Les variables à échelles continues

Une méthode simple et efficace pour obtenir des indices statistiques pour des variables à échelle continue est de passer par le package `psych` [@psych] qui offre deux fonctions intéressantes : `describe()` et `describeBy()`. En mettant simplement en argument le jeu de données, ces fonctions retournent la plupart des statistiques descriptives désirables, comme la moyenne, la médiane, l'étendue, le minimum, le maximum, l'écart type et la taille. Comme la sortie est un jeu de données, celle-ci peut être manipulée pour retirer les statistiques qui ne sont pas désirées.

Voici un exemple avec le jeu de données `ToothGrowth` inclus avec **R**.


``` r
psych::describe(ToothGrowth)[,-c(1,5)]
>        n  mean   sd trimmed  mad min  max range  skew
> len   60 18.81 7.65   18.95 9.04 4.2 33.9  29.7 -0.14
> supp* 60  1.50 0.50    1.50 0.74 1.0  2.0   1.0  0.00
> dose  60  1.17 0.63    1.15 0.74 0.5  2.0   1.5  0.37
>       kurtosis   se
> len      -1.04 0.99
> supp*    -2.03 0.07
> dose     -1.55 0.08
```

Il est possible de conserver ou retirer les colonnes non désirées en les spécifiant (voir [Référer à des sous-éléments]).


``` r
# Enregistrer les analyses descriptives
descriptif <- psych::describe(ToothGrowth)
# Conserver mean et sd
descriptif[,c("mean","sd")]
>        mean   sd
> len   18.81 7.65
> supp*  1.50 0.50
> dose   1.17 0.63

# Ou encore
# Retirer n (1), 
# trimmed, mad, min, max, range (6:10),
# et se (13)
descriptif[,-c(1, 6:10, 13)]
>        n  mean   sd median  skew kurtosis
> len   60 18.81 7.65   19.2 -0.14    -1.04
> supp* 60  1.50 0.50    1.5  0.00    -2.03
> dose  60  1.17 0.63    1.0  0.37    -1.55
```

Il est possible de retirer les colonnes non désirées en les spécifiant (voir [Référer à des sous-éléments]).


``` r
# Retirer n (1), 
# trimmed, mad, min, max, range (6:10),
# et se (13)
descriptif[,-c(1, 6:10, 13)]
>        n  mean   sd median  skew kurtosis
> len   60 18.81 7.65   19.2 -0.14    -1.04
> supp* 60  1.50 0.50    1.5  0.00    -2.03
> dose  60  1.17 0.63    1.0  0.37    -1.55
```

La fonction `describeBy()` permet de faire ces analyses en fonction d'une variable de groupement. Par exemple, le groupement est `supp`. 


``` r
psych::describe.by(ToothGrowth, group = ToothGrowth$supp)
> Warning in psych::describe.by(ToothGrowth, group =
> ToothGrowth$supp): describe.by is deprecated.  Please use
> the describeBy function
> 
>  Descriptive statistics by group 
> group: OJ
>      vars  n  mean   sd median trimmed  mad min  max range
> len     1 30 20.66 6.61   22.7   21.04 5.49 8.2 30.9  22.7
> supp    2 30  1.00 0.00    1.0    1.00 0.00 1.0  1.0   0.0
> dose    3 30  1.17 0.63    1.0    1.15 0.74 0.5  2.0   1.5
>       skew kurtosis   se
> len  -0.52    -1.03 1.21
> supp   NaN      NaN 0.00
> dose  0.36    -1.60 0.12
> --------------------------------------------- 
> group: VC
>      vars  n  mean   sd median trimmed  mad min  max range
> len     1 30 16.96 8.27   16.5   16.58 9.27 4.2 33.9  29.7
> supp    2 30  2.00 0.00    2.0    2.00 0.00 2.0  2.0   0.0
> dose    3 30  1.17 0.63    1.0    1.15 0.74 0.5  2.0   1.5
>      skew kurtosis   se
> len  0.28    -0.93 1.51
> supp  NaN      NaN 0.00
> dose 0.36    -1.60 0.12
```

Enfin, il faut porter attention, car `describe()` et `describeBy()` transforment les variables ordinales^[Définis en facteurs.] et nominales en variables continues. Les indices statistiques rapportées pourraient n'avoir aucun intérêt. Il faudra alors retirer ces lignes (comme c'est fait avec les colonnes ci-haut).

## Les variables à échelles nominales

Pour les variables nominales et ordinales, la fonction `table()` qui permet de compter la fréquence des éléments contenus dans une variable.


``` r
table(ToothGrowth$supp)
> 
> OJ VC 
> 30 30
```

La fonction `count()` de `dplyr` produit le même résultats, mais sa sortie est toutefois plus intéressante à [Manipuler].


``` r
dplyr::count(ToothGrowth, supp)
>   supp  n
> 1   OJ 30
> 2   VC 30
```

Dans les deux cas, ajouter plus d'une variable génère une table de contingence (voir [Le $\chi^2$ pour table de contingence] pour plus d'informations), c'est-à-dire l'association entre les deux variables.


