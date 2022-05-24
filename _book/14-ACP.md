# L'analyse en composantes principales



L'analyse en composantes principales (ACP) est une technique de réorganisation de la variance d'un jeu de données. Son *objectif* est ainsi de résumer l'information commune des variables dans les premières dimensions et l'information individuelle dans les dernières. Le statisticien profite alors de cette analyse pour tenir compte des données le mieux possible avec le moins de composantes (ou dimensions, axes ou facteurs latents). Une composante est grossièrement de la variance partagée entre des variables. Conceptuellement, il s'agit de la recette de fabrication des scores de la population, ou d'où origine ces variables (avec quoi elles sont construites). Cela sera détaillé plus en profondeur dans une prochaine section.

Voici un exemple assez commum où l'ACP sera utile. Lorsqu'un test psychométrique est créé, le psychométricien s'intéresse à connaître quels items (variables) sont liés sur quelle dimension et à quel degré. Les items communs devraient alors être lié sur un certain facteur et pas ou peu sur les autres, ce qui fera que le facteur à un fort potentiel explicatif (ou pas!). L'ACP a une optique d'utilisation beaucoup plus grande que l'analyse factorielle exploratoire. L'expérimentateur pourrait s'intéresser à seulement réorganiser la variance sans aucune visée *factorielle*. Il pourrait vouloir identifier l'ensemble des meilleurs prédicteurs ou encore résumer l'information de façon à générer des figures qui seraient autrement trop complexes. Enfin, l'ACP peut aussi être conceptualisé comme une forme de compression comme en informatique. Puisque l'information se trouve dans les premières composantes, les moins informatives peuvent être discartées afin de résumer un maximum d'informations sur les données avec le minimum de facteurs.

L'ACP maximise l'information commune aux variables dans les premières composantes jusqu'à l'information individuelle dans les dernières, ce qu'un statisticien qualifierait de variance résiduelle. Elle le fait peu importe la structure factorielle sous-jacente. Conséquemment, l'ACP ne dit sous aucune condition le nombre de composantes *signifiantes* (importantes) dans le jeu de données. S'il y a $k$ variables, elle résume la variance en $k$ dimensions. Cependant, le statisticien opportuniste sait que l'information pertinente se trouve dans les premiers axes et peut l'utiliser pour résumer les données. Il a ainsi recourt à des *règles d'arrêt* (*stopping rules*) pour inférer le nombre de dimensions à retenir. De plus, l'ACP ne restreint pas les loadings à certaines valeurs (notamment 0, soit l'absence de lien entre un facteur et un variable), ce qui est fait dans les **analyses factorielles confirmatoires**.  Ces deux caractéristiques, soit l'absence du nombre de facteurs et de restrictions sur les poids factoriels (loadings, qui seront détaillés plus tard), font de l'ACP une **analyses factorielles exploratoires**. Autrement dit, le statisticien n'impose pas un certain modèle sur les données, il laisse les données parler.


## Une analogie cuisinaire

Cette analogie revient à André Achim qui n'a de cesse parler d'analyse factorielle en termes de *recette* de fabrication^[Achim [-@Achim17;-@Achim20] écrit constamment en termes de *recette de fabrication* plutôt qu'en *structure factorielle*.]. Il n'a jamais poussé l'audace jusqu'à parler de cuisine, mais le temps est venu. 

Cet exemple est basé sur les recettes de fabrication de biscuits (voir Figure \@ref(fig:biscuit))^[Tirée de https://pxhere.com/fr/photo/1619659, License CC0]. Réaliser une analyse factorielle avec des biscuits permettra d'identifier le biscuit prototypique, le plus biscuits des biscuits : le biscuit fondamental, celui sur lequel tous les biscuits sont basés.  

<div class="figure" style="text-align: center">
<img src="14-ACP_files/figure-html/biscuit-1.png" alt="Biscuits significativement chocolatés" width="60%" height="60%" />
<p class="caption">(\#fig:biscuit)Biscuits significativement chocolatés</p>
</div>


Pour ce faire, l'expérimentateur recrute des biscuits qui représentent les unités (participants)^[Évidemment, les unités sont tirées aléatoirement dans la population des biscuits et avec remplacement!]. Comme tout bon scientifique, il prend maintenant des mesures sur ces biscuits : taux de sucre, taux de gluten, quantité de fruit, de chocolat, de cacao, taux de protéines de sel, bref un peut tout ce que l'étiquette nutritive offre comme information. Ces mesures sont les variables. Ces variables sont toutes intercorrélées en quelques sortes: un biscuit ayant une concentration plus forte en chocolat et en fruits séchés peut se permettre d'être moins de sucré artificiellement; un autre plus riche en protéine et pauvre en gluten sera peut-être plus gras pour le rendre plus intéressant en bouche; les biscuits de type sec seront peut-être plus salé à cause des gras moins présents.

Une fois ces mesures prises, l'analyse en composantes principales réorganise la variance afin de mettre les composantes les plus importantes comme premières. En étudiant la structure factorielle, il sera possible de définir qualitativement les axes obtenus. Par exemple, le premier axe pourrait être lié aux variables de sucres (chocolat, fruit, sucre, cassonade, sucre de canne, etc) et tout ce qui peut apporter directement ou indirectement au glucose, signalant du même coup, l'importance du sucre dans les recettes de biscuits. Le deuxième axe pourrait être basé sur les gras (crème, huile, beurre, lait), signalant l'importance qu'un bon biscuit est non seulement sucré (dimension 1), mais gras (dimension 2). Les dimensions se détaillent ainsi de suite jusqu'à ce qu'il ne reste que du bruit, des idiosyncrasies parmi les recettes de biscuit (comme des graines de tournesol!). L'expérimentateur trouve alors dans ces informations, les axes qui font ce qu'est être un biscuit. 

<!-- Les lecteurs seront intéressés de savoir que des études similaires ont réellement eu lieu pour étudier les saveurs du whisky, etc... Dans ces études, ce n'est pas tant la recette que l'appréciation gustative des connaisseurs. Par la suite, on pourrait en tirer des pastilles de goût en voyant comment les saveurs s'agencent ensemble^[Ce n'est pas ce qui a été fait à la Société des Alcools du Québec, mais ce serait une façon scientifique d'entreprendre la démarche]. -->

## Quelques définitions

### Les valeurs propres

Les valeurs propres (*eigenvalues*) représentent l'aspect crucial de l'ACP, soit l'importance de chaque composante à représenter les variables. Plus un facteur agit en force sur variables en force, mais aussi sur le nombre de variables, plus la valeur propre sera élevée; plus la dimension sera extraite dans les premières.

La somme des valeurs propres égale la somme des variances, ce qui équivaut en matrice de corrélation à $p$ le nombre de variables. Comme il s'agit du potentiel maximale de ce qui peut être expliquée et que les valeurs sont une part de ce total, il est possible d'en tirer des pourcentage. Par exemple une valeur propre de 5 sur un total de $p=10$ variables signifie que l'axe correspondant explique $5/10  \times 100 = 50$% de la variance dans les données. 

En d'autres termes, la valeur propre est une bonne métrique de l'importance d'une dimension.

### Les loadings

Les loadings (traduits par chargements - il n'y a pas vraiment de bon termes en français) sont les contributions des facteurs aux variables. En termes de recette de fabrication, il s'agit du *poids* de chaque *ingrédients* (facteurs) à la *recette* de la population. Lorsque les variables sont standardisées, (la variance est de $1$), un loading représente la corrélation entre un facteur et une variable.

### Les communalités

Les communalités correspondent au carré des loadings standardisés. Il s'agit du pourcentage (ou la proportion d'ingrédient, si l'analogie est maintenu avec l'idée de recette de fabrication) d'informations données par le facteur à une variable.


## Création de données

Pour construire une un jeu de données ayant une structure factorielle, il faut d'abord concevoir cette structure. Il s'agit des recettes de fabrications des variables : beaucoup de facteur 1 pour la variable 3, un peu du facteur 1 sur la variable 2, etc. Chaque composante, dont il y a un nombre de $k$, s'exprime sur toutes les $p$ variables. Il s'agit en quelques sorte de la quantité de facteur qu'il faut attribuer à telle et telle variable. Ainsi, une matrice $k \times p$ agira comme recette de fabrication pour les variables. Par exemple, s'il y a $2$ facteurs et $6$ variables, les dimensions de la matrice de fabrication est $2 \times 6$. Cette matrice de fabrication, appelée $\Phi$ (phi, équivalent à "F") contient les loadings, la quantité de facteur qu'il faut donner aux variables. Les lettres grecques sont préférées ici, car il s'agit de paramètres de la population.

Il est plus simple de considérer pour l'instant une structure standardisée, c'est-à-dire que les variables produites auront des variances de 1 (les moyennes sont écartés, car elles ne sont pas nécessaire, mais pour être plus explicite elles sont nulles). Lors de la spécification de la structure factorielle, il faudra s'assurer que la somme des carrés des loadings de chaque variable ne dépasse pas $1$, soit la variance désirée des variables. Ne pas respecter cette limite ne créera pas forcément une erreur ou un problème. Seulement, le scénario ne sera plus standardisé.

La Figure \@ref(fig:FactStruct) illustre un exemple de modèle. Les rectangles sont des variables manifestes (observées) à partir des quelles les variables encerclées représentent des facteurs sous-jacents, soit des variables latentes (retrouvées à partir des variables manifestes.


<div class="figure" style="text-align: center">
<img src="image//factstruct.png" alt="Structure Factorielle" width="50%" height="50%" />
<p class="caption">(\#fig:FactStruct)Structure Factorielle</p>
</div>

La syntaxe ci-dessous reconstruit le modèle de la Figure \@ref(fig:FactStruct). La variable `phi` pour $\Phi$ contient les loadings des deux composantes pour créer les six variables.


```r
#Création de la matrice de recette de fabrication
phi = matrix(c(.9, .8, .7,  0,  0, .4,
               0,  0,  0, .6, .5, .4), 6, 2)

# Identification des variables et facteurs
colnames(phi) = c("F1", "F2")
rownames(phi) = paste0(rep("i",6), 1:6)
phi
#>     F1  F2
#> i1 0.9 0.0
#> i2 0.8 0.0
#> i3 0.7 0.0
#> i4 0.0 0.6
#> i5 0.0 0.5
#> i6 0.4 0.4
```

Pour obtenir les communalités de la population, il suffit de mettre $\Phi$ au carré.


```r
phi^2
#>      F1   F2
#> i1 0.81 0.00
#> i2 0.64 0.00
#> i3 0.49 0.00
#> i4 0.00 0.36
#> i5 0.00 0.25
#> i6 0.16 0.16
```


Voici quelques description de $\Phi$ sans toute les nommer. Pour les recettes, le variable 1 est construite à 81% du facteur 1 et 0% du second facteur, c'est-à-dire que la variable 1 est construite uniquement du facteur 1. Le facteur 2 donne 25% à la cinquième variable. Enfin, la sixième variable est construite à partir de de 16% du premier facteur et 16% du deuxième facteur pour être construite à 32 % des deux facteurs, il reste ainsi 68% à expliquer qui proviendra de la variance d'erreur de la variable.

\begin{equation}
C = \sum_{i=1}^k \Phi_i^2
(\#eq:com)
\end{equation}

En équivalent de syntaxe **R**, l'équation \@ref(eq:com) s'écrit comme suit.


```r
C = rowSums(phi^2)
C
#>   i1   i2   i3   i4   i5   i6 
#> 0.81 0.64 0.49 0.36 0.25 0.32
```

Il s'agit de la variance totale de la variable $i$ expliquée par les facteurs, soit $C_i$. Il manque maintenant l'erreur, c'est-à-dire, l'information contenu dans les variables qui n'est pas expliquées par un facteur. Cette erreur doit être indépendante des facteurs, mais aussi des variables entre elles, sinon il s'agirait d'un autre facteur. Pour en connaître le volume, $C$ est  soustrait de $1$ (la variance désirée des variables) pour obtenir un vecteur de variance résiduelle $\epsilon$, soit mathématiquement

\begin{equation}
\sigma^2_{\epsilon} = 1-C
(\#eq:vres)
\end{equation}

ou en code **R**.


```r
# Variances résiduelles des variables (non expliquées par les facteurs)
e = 1-C
e
#>   i1   i2   i3   i4   i5   i6 
#> 0.19 0.36 0.51 0.64 0.75 0.68
```

Et pour transformer en loading, il faut revenir à l'ordre de grandeur original, en coefficient de corrélation plutôt qu'en coefficient de détermination (en écart type plutôt qu'en variance).


```r
e = sqrt(e)
e
#>    i1    i2    i3    i4    i5    i6 
#> 0.436 0.600 0.714 0.800 0.866 0.825
```

Maintenant il faut joindre, les résidus à la structure factorielle en s'assurant qu'ils demeurent indépendant. Si `e` est ajouté directement à phi, cela créerait un troisième facteur *d'erreur* imprévus. Chaque loading d'erreur doit se retrouver sur une dimension indépendante. La stratégie est ainsi de transformer le vecteur `e` en matrice diagonale avec la fonction `diag()`.


```r
# Joint erroné
cbind(phi,e)
#>     F1  F2     e
#> i1 0.9 0.0 0.436
#> i2 0.8 0.0 0.600
#> i3 0.7 0.0 0.714
#> i4 0.0 0.6 0.800
#> i5 0.0 0.5 0.866
#> i6 0.4 0.4 0.825

# Joint correct
cbind(phi, diag(e))
#>     F1  F2                                
#> i1 0.9 0.0 0.436 0.0 0.000 0.0 0.000 0.000
#> i2 0.8 0.0 0.000 0.6 0.000 0.0 0.000 0.000
#> i3 0.7 0.0 0.000 0.0 0.714 0.0 0.000 0.000
#> i4 0.0 0.6 0.000 0.0 0.000 0.8 0.000 0.000
#> i5 0.0 0.5 0.000 0.0 0.000 0.0 0.866 0.000
#> i6 0.4 0.4 0.000 0.0 0.000 0.0 0.000 0.825

# La structure factorielle 
Struct.Fact = cbind(phi, diag(e))
```

Dans le premier cas, `e` est ajouté comme troisième dimension, ainsi les variables sont corrélés par ce troisième facteur. Dans le second cas, six dimensions sont créés et aucune n'est liée aux autres. L'information partagée demeure dans les facteurs, l'information résiduelle dans les dimensions d'erreur. La structure factorielle `Struc.Fact` est maintenant $p \times (k + p)$.

À partir de `Struct.Fact`, il est possible d'obtenir la matrice de corrélation de la population $\text{P}$ ($\rho majuscule$) par l'équation \@ref(eq:fact2cor)

\begin{equation}
\text{P} = \Phi \Phi^{\prime}
(\#eq:fact2cor)
\end{equation}

ou en code **R**.


```r
R = Struct.Fact %*% t(Struct.Fact)
R
#>      i1   i2   i3   i4  i5   i6
#> i1 1.00 0.72 0.63 0.00 0.0 0.36
#> i2 0.72 1.00 0.56 0.00 0.0 0.32
#> i3 0.63 0.56 1.00 0.00 0.0 0.28
#> i4 0.00 0.00 0.00 1.00 0.3 0.24
#> i5 0.00 0.00 0.00 0.30 1.0 0.20
#> i6 0.36 0.32 0.28 0.24 0.2 1.00
```

Avec `R` calculée, il est évidemment possible, comme il a été fait précédemment de recourir à la fonction `MASS::mvrnorm()` avec comme argument `Sigma = R` pour la matrice de corrélation afin de créer `n` participants. Cela serait toutefois contreproductif, puisque la fonction `mvrnorm()` utilise l'ACP pour extraire une structure factorielle pour générer les données. La suite de cette section décriera une autre façon de créer de données, soit celle utilisée sous `MASS::mvrnorm()`. 

Une fois la structure factorielle obtenue, il faut générer les scores des participants. Plusieurs méthodes sont possibles, mais la façon la plus *normale* sera de prendre un distribution gaussienne. Cette matrice contiendra des scores tirés de cette distribution et sera de taille $(k + p)  \times n$, soit le nombre de facteur plus le nombre de variables (pour les résidu) en ligne par $n$ le nombre d'unités en colonnes. Cette matrice représente les scores propres à chaque unité pour chacun des scores et seront multipliés avec la recette factorielle. Autrement dit, chaque poids de la recette (loadings) sera multiplié à une distribution normale qui représente le score du participant pour ce poids. Certains seront plus influencés par un poids et en auront plus, d'autres en auront moins. Et ainsi de suite pour chaque poids. 
Comme cela a été vue dans le chapitre sur la loi de la somme de variance, le loading joue le rôle une constante d'échelle qui modifie l'écart type de la distribution. La taille de l'écart type des résidus est par la suite ajustée pour assurer une variance égale à 1, ce qui est fait à l'équation \@ref(eq:vres). Il est également possible de concevoir selon ce cadre, que chaque facteur est en fait une variable indépendante prédisant la variable ou l'item (variable dépendante).

\begin{equation}
y_i = \delta_{1,i} x_1+ \delta_{2,i} x_2 + ... + \delta_{k,i} x_k + \epsilon_{i}
(\#eq:factlm)
\end{equation}

Dans l'équation \@ref(eq:factlm), l'indice $i$ représente l'une des $p$ variables, $\delta_{j,i}$ correspond au loading de la variable $i$ du facteur $j$ (allant de $1,2,...,k$) et $\epsilon_i$ est l'erreur associé à la variable $i$. La variable dépendante $y_i$ correspond la variable résultante, ce résultat est observable. Les scores $x_j$ sont *latents*, ils ne peuvent être observés par l'expérimentateur, seulement inférés par le statisticien. Les $k$ facteurs agissent dans l'équation \@ref(eq:factlm) comme des variables indépendantes prédisant le score à la variable dépendante $y_i$. C'est d'ailleurs pourquoi dans un diagramme de modélisation par équations structurelle les flèches pointent des facteurs vers les variables. Par souci du détail, il faudrait, pour une représentation parfaite, mentionner les participants (donc un troisième indice), mais cela est évité ici pour simplifier la  présentation.  

Trêve de digression, il ne restait plus qu'à faire le produit matricielle de `Struct.Fact` ($\left[ \Phi, \text{diag}(\epsilon) \right]$) et des scores individuelles (`score.ind`).


```r
n = 10; k = 2; p = 6
score.ind = matrix(rnorm(n * p * k), nrow = (k + p), ncol = n)
score = Struct.Fact %*% score.ind 
```

La variable `score` contient tous les scores des $n$ participants sur les $p$ variables. Pour obtenir la base de données dans le sens usuel, il suffit de faire une transpose à `score` avec la fonction `t()`. 


```r
jd = t(score)
head(jd)
#>          i1     i2     i3     i4     i5     i6
#> [1,]  0.345  1.295  0.904 -0.896 -2.213 -1.331
#> [2,]  1.206  0.461  1.621 -0.715 -0.571  0.320
#> [3,] -0.722 -1.062 -1.418 -1.867  0.855 -2.295
#> [4,] -2.641 -2.269 -1.415 -1.210 -0.876 -0.746
#> [5,] -1.326 -1.284 -1.240  0.687  1.843 -0.868
#> [6,]  0.693  0.759  0.963  1.250 -0.148  1.154
```

Voilà une base de données prêtes à être utiliser pour une analyse factorielle. En pratique, pour donner un peu plus de réalisme, il est possible d'ajouter une moyenne (additionner), de modifier l'écart type (multiplier) de chacune des variables, d'arrondir les scores, et plus en fonction des besoins.

## Syntaxe

Il existe plusieurs fonctions dans **R**, mais aussi dans des packages, pour réaliser l'ACP. L'analyse en soi n'a rien de sorcier (en autant que les statisticiens ne font pas de magie), c'est surtout l'emballage (graphiques et sorties) qui changera de l'une à l'autre des méthodes. Elles précalculent et extraient les statistiques désirées, rien que l'utilisateur ne peut faire lui-même.

L'analyse de décomposition en valeurs singulières (*singular value decomposition*, SVD) est généralement recommandée, car elle est computationnellement plus robuste que l'ACP. Un puriste choisierait probablemetn la fonction `eigen()` à la place, mais les résultats seraient virtuellement identiques. Ces deux fonctions prennent comme argument une matrice de covariance ou de corrélation. 


```r
# L'ACP se commande avec svd() avec comme 
# argument une matrice de corrélation des données
res = svd(cor(jd))
```

La fonction `svd()` permettra de faire l'analyse. Elle produit trois matrices. La première `$d` contient les valeurs propres que l'on peut extraire avec `res$d` Les deux autres sont les projections et seront utiles pour calculer les loadings et les communalités Pour les loadings, il faut calculer le produit de de la projection $U$ par la racine carré des valeurs propres comme à l'équation \@ref(eq:load),

\begin{equation}
F = U d^{1/2}
(\#eq:load)
\end{equation}

où `F` remplace `phi`, car il s'agit d'une estimation sur un échantillon et non plus des paramètres de la population. Les communalités se calculent comme à l'équation \@ref(eq:com), soit le carré des loading.


```r
# ACP
res = svd(cor(jd))
# Extraction des données
eigenvalues = res$d
loadings = res$u %*% diag(res$d ^ 0.5)
communalites = loadings^2
```

Il est possible d'utiliser la syntaxe précédente et d'en faire une fonction.


```r
mon.acp = function(jd){
  R = cor(jd)
  res = svd(R)
  eigenvalues = res$d
  loadings = res$u %*% diag(res$d ^ 0.5)
  communalites = loadings^2
  statistique = list(valeurs.propres = eigenvalues,
                     loadings = loadings,
                     communalites = communalites)
}
```

À des fins de comparaisons, la création de données est réitérés, mais avec 5000 participants avec la même structure factorielle à deux facteurs et 6 variables.


```r
# Pour reproductibilité
set.seed(9876)
# Créer des scores individuels
# pour 5000 participants, deux facteurs et 6
n = 5000; k = 2; p = 6
score.ind = matrix(rnorm(n * p * k), nrow = (k + p), ncol = n)
# Multiplier à la structure factorielle
# Struct.Fact est créé auparavant
score = Struct.Fact %*% score.ind 
# Orienter sujet en ligne et variable en colonne
jd5000 = t(score)
# ACP
res = mon.acp(jd5000)
```

Voici une comparaison des loadings par rapport à $\Phi$, les deux sont très près. Seules les deux première composantes sont extraites, car la solution est connue par le lecteur.


```r
# Pour comparaison
phi ; res$loadings[,1:2]
#>     F1  F2
#> i1 0.9 0.0
#> i2 0.8 0.0
#> i3 0.7 0.0
#> i4 0.0 0.6
#> i5 0.0 0.5
#> i6 0.4 0.4
#>        [,1]   [,2]
#> [1,] -0.887  0.152
#> [2,] -0.848  0.165
#> [3,] -0.793  0.158
#> [4,] -0.110 -0.783
#> [5,] -0.102 -0.751
#> [6,] -0.571 -0.415
```
Cela dit, deux caractéristiques sont différentes. La première est que la plupart des valeurs sont négatives. L'ACP estime dans des dimensions à la polarité arbitraire, ainsi les valeurs négatives et positives sont arbitraires, l'important étant que si la polarité est inversée, comme par `-res$loadings`, elle doit l'être pour toutes les valeurs.


```r
-res$loadings[,1:2]
#>       [,1]   [,2]
#> [1,] 0.887 -0.152
#> [2,] 0.848 -0.165
#> [3,] 0.793 -0.158
#> [4,] 0.110  0.783
#> [5,] 0.102  0.751
#> [6,] 0.571  0.415
```

La seconde différences est que les valeurs ne sont pas exactement les mêmes malgré les 5000 participants. Cela est aussi vraie pour les loadings nuls (fixé à 0 au départ); ils ne sont plus nuls, mais légèrement supérieurs. Cela s'explique par le fait que l'ACP est une technique d'analyse opportuniste qui capitalise sur la variance partagée. Il y a des résidus accidentellement corrélés aux facteurs, et ces corrélations sont pris en compte dans les facteurs. Une explication supplémentaire est aussi de se rappeler que le jeu de données est créés sur $k + p = 2+6=8$ dimensions alors que le jeu de données, lui, n'en a que $p = 6$. Il y inévitablement deux dimensions à écraser dans les six autres.

## Rotation varimax

Les axes des loadings pour $m$ facteurs sont basés sur la réorganisation des $p$ variables. Cela induit la présence de déviations pour tenir compte des erreurs laissées dans les dernières variables. Une dernière étape pour réorganiser la variance de façon optimale est d'user d'une rotation des axes. Essentiellement, la fonction tentera de maximiser la loadings les plus élevés (en termes absolu) et de réduire celles les plus près de 0 en ne tenant compte que des $m$ axes à retenir sans tenir compte des $p-m$ autres axes. 

Pour réaliser une rotation, la fonction **R** de base `varimax()` accomplira la tâche. Il s'agit d'une rotation orthogonale, rotation selon laquelle les facteurs demeurent indépendants, donc non corrélés. Comme argument, il faut spécifier les loadings pour le nombre de dimensions désirées. 

La syntaxe ci-dessous détermine le nombre d'axes à retenir, $m=2$, sélection ces axes qui se trouvent dans la variable `res` sous la colonne `loadings`, ainsi `res$loadings[,1:m]` extrait les loadings des 1 à $m$ dimensions.


```r
# Prendre les loadings du nombre de dimensions désirées 
m <-  2    # Nombre de dimensions désirées
res.rot <- varimax(res$loadings[,1:m])
res.rot
#> $loadings
#> 
#> Loadings:
#>      [,1]   [,2]  
#> [1,] -0.900       
#> [2,] -0.864       
#> [3,] -0.808       
#> [4,]        -0.790
#> [5,]        -0.757
#> [6,] -0.484 -0.513
#> 
#>                 [,1]  [,2]
#> SS loadings    2.447 1.461
#> Proportion Var 0.408 0.244
#> Cumulative Var 0.408 0.651
#> 
#> $rotmat
#>        [,1]  [,2]
#> [1,]  0.983 0.185
#> [2,] -0.185 0.983
```

La sortie de `varimax()` est enregistrée dans `res.rot`. Elle offre deux informations importantes. La première est les nouveaux loadings après la rotation, sous `res.rot$loadings`. Tout de suite, il appert que ces loadings sont plus près que les originaux, mais pas tant différent (ce qui est normal considérant la taille d'échantillon élevée et le peu de variable). Également, les loadings *marginaux* (près de 0) ne sont pas affichés. Ceux ci peuvent être extraits en les spécifiant avec les crochets dans `res.rot$loadings[]`.

```r
# Extraire le premier loading du deuxième facteur
res.rot$loadings[2, 1]
#> [1] -0.864
```

La deuxième est la matrice de rotation dans `res.rot$rotmat` qui correspond au pivot selon lequel les loadings ont été remaniés. Les statistiques `SS loadings`, `Proportion Var` et `Cumulative Var` sont calculés à partir des loadings et ne peuvent être extraits. Ils sont présentés à titre informatif seulement.

Il existe déjà dans **R** de base également une fonction permettant de faire une rotation oblique, dont les facteurs peuvent être corrélés, nommée `promax()`.


```r
promax(res$loadings[,1:2])
#> $loadings
#> 
#> Loadings:
#>      [,1]   [,2]  
#> [1,] -0.907       
#> [2,] -0.873       
#> [3,] -0.817       
#> [4,]  0.113 -0.802
#> [5,]  0.112 -0.769
#> [6,] -0.439 -0.484
#> 
#>                 [,1]  [,2]
#> SS loadings    2.470 1.480
#> Proportion Var 0.412 0.247
#> Cumulative Var 0.412 0.658
#> 
#> $rotmat
#>        [,1]  [,2]
#> [1,]  0.974 0.116
#> [2,] -0.281 1.008
```

La sortie offre les mêmes informations que `varimax()` auparavant. Les résultats sont toutefois différents puisque la rotation est oblique (les facteurs peuvent être corrélés) alors qu'elle était orthogonale sous `varimax()`. À noter, la matrice de rotation n'est pas une matrice de corrélation entre facteurs.

Dans cet exemple, les facteurs sont orthogonaux tel que défini par l'utilisateur au départ. La fonction `promax()` n'est donc pas nécessaire ici, aucune corrélation entre facteur n'étant spécifiée. 

## Dimensions corrélées

Pour créer un jeu de données ayant une structure factorielle avec dimensions corrélées, une des méthodes les plus simples est de passer par la matrice de corrélation. Pour suivre cette approche, il faut spécifier une structure factorielle $\Phi$ (comme c'était le cas jusqu'ici), en plus d'une matrice de corrélation pour les facteurs, $\mathbf{R}_\Phi$. En suivant l'équation \@ref(eq:corfact), cela produit la matrice corrélation (sans erreur) du jeu de données, noté $\mathbf{R}^*$, l'étoile mentionnant que ce n'est pas une matrice de corrélation encore.

\begin{equation}
\mathbf{R}^* = \Phi \mathbf{R}_\Phi \Phi^\prime
(\#eq:corfact)
\end{equation}

Pour ajouter l'erreur, il reste à fixer la diagonale de la matrice $\mathbf{R}$ à 1, comme l'équation \@ref(eq:diag1).

\begin{equation}
\mathbf{R} = \text{diag}(\mathbf{R}^*) \leftarrow 1
(\#eq:diag1)
\end{equation}

Cette matrice de corrélation peut maintenant être utilisée avec `MASS::mvrnorm()` pour obtenir des données. Voici la syntaxe **R** pour cet usage.


```r
# Création de la matrice de corrélation entre facteurs
Rphi <-  matrix(c(1, .3, .3, 1), 2, 2)
colnames(Rphi) <- c("F1","F2")
rownames(Rphi) <- c("F1","F2")
# Afficher phi et Rphi
phi ; Rphi
#>     F1  F2
#> i1 0.9 0.0
#> i2 0.8 0.0
#> i3 0.7 0.0
#> i4 0.0 0.6
#> i5 0.0 0.5
#> i6 0.4 0.4
#>     F1  F2
#> F1 1.0 0.3
#> F2 0.3 1.0

# Création de la matrice de corrélation des items à partir
# des facteurs et leur corrélation
R <-  phi %*% Rphi %*% t(phi)

# Afficher R (sans erreur)
R
#>       i1    i2    i3    i4    i5    i6
#> i1 0.810 0.720 0.630 0.162 0.135 0.468
#> i2 0.720 0.640 0.560 0.144 0.120 0.416
#> i3 0.630 0.560 0.490 0.126 0.105 0.364
#> i4 0.162 0.144 0.126 0.360 0.300 0.312
#> i5 0.135 0.120 0.105 0.300 0.250 0.260
#> i6 0.468 0.416 0.364 0.312 0.260 0.416

# Inclure l'erreur en fixant la diagonale à 1
diag(R) <- 1
R
#>       i1    i2    i3    i4    i5    i6
#> i1 1.000 0.720 0.630 0.162 0.135 0.468
#> i2 0.720 1.000 0.560 0.144 0.120 0.416
#> i3 0.630 0.560 1.000 0.126 0.105 0.364
#> i4 0.162 0.144 0.126 1.000 0.300 0.312
#> i5 0.135 0.120 0.105 0.300 1.000 0.260
#> i6 0.468 0.416 0.364 0.312 0.260 1.000

# Générer les données
jd5000.2 <- MASS::mvrnorm(n = n, mu = rep(0, p), Sigma = R)
```

Par la suite, les étapes de l'ACP sont réalisables comme auparavant.

## Calculs

*À terminer*

<!-- ```{r} -->
<!-- mon.svd <- function(S){ -->
<!-- Dim <- dim(S) -->
<!-- U <-  diag(Dim[1]) -->
<!-- V <-  diag(Dim[2]) -->
<!-- tol <- (max(abs(S)))*1e-1 -->
<!-- Arem <- Inf -->

<!-- while (Arem > tol) { -->
<!--   z <- qr(S) -->
<!--   Q <- qr.Q(z) -->
<!--   R <- qr.R(z) -->
<!--   U <- U %*% Q -->
<!--   z <- qr(t(R)) -->
<!--   Q <- qr.Q(z) -->
<!--   R <- qr.R(z)  -->
<!--   V <- V %*% Q -->
<!--   A <- t(R) -->
<!--   A[upper.tri(A)] <- 0 -->
<!--   Arem <- norm(A, type = "I") -->
<!-- } -->
<!-- U <- U[,1:m] -->
<!-- S <- upper.tri(A[1:m,]) -->
<!-- } -->
<!-- ``` -->


<!-- Une technique un peu plus robuste et générale est la décomposition en valeur singulière (*singular valeur decomposition*). -->

<!-- Pour le lecteur de cet ouvrage, il n'y a que peu de différence à faire entre les deux. Les différences sont ... -->

## Réduction des dimensions

Comme mentionné d'entrer de jeu, l'ACP n'est pas une technique de réduction des dimensions, s'il y a $p$ variables, l'ACP produit $p$ dimensions, mais comme elle maximise l'information dans les premières composantes, elle peut être utilisée comme telle. La question devient, comment de dimensions faut-il retenir pour rendre adéquatement compte des données. Dès lors, l'ACP devient une technique de réduction des dimension, mais comme elle ne répond pas explicitement à cette question, le statisticien usera de techniques complémentaires, des règles d'arrêts (*stopping rules*) pour déterminer le nombre de dimensions.

Ces règles d'arrêt sont en général un *bricolage* du statisticien pour répondre à la question. Bricolage n'est pas à prendre péjorativement, mais seulement comme rappel à la réalité que ces techniques sont souvent créées sans justificatifs théoriques, comme une dérivation analytique, et il n'est pas possible de leur faire aveuglément confiance (il ne faudrait jamais faire cela en science de toute façon). Elles sont une pertinence pratique, mais les conditions dans lesquelles elles flanchent n'est pas connue. Il existe probablement des centaines de techniques ayant leur avantage et inconvénients ou bien des scénarios dans lesquels elles sont plus efficaces que les autres. Il en apparaît des nouvelles chaque années depuis 1950. Comme ces techniques sont des bricolages et qu'elles sont taillées différemment, elles ne résulteront pas toutes à la même conclusion. Faire l'étalage de ces règles d'arrêt serait bien inutile. Ainsi, les deux techniques les plus utilisées seront présentées, l'analyse parallèle (*parallel analysis*) et la corrélation partielle moyenne minimale (*minimum average partial correlation*). Une troisième méthode ayant montré un excellent rendement sera présentée, soit le test séquentiel de la prochaine valeur propre (*Next eigenvalue sequence test*).

## Illustration

La compression d'images est un exemple ou la réduction de dimension permet de résumer l'information afin d'en réduire la taille pour ne conserver que le signifiant. Ainsi, les mêmes techniques permettant d'identifier les facteurs psychologiques peuvent être utilisées pour les images, mais l'identification des thèmes de films et bien d'autres.

La Figure \@ref(fig:Pigeon) montre un exemple de compression d'une image de pigeon^[Tirée de https://pixnio.com/fr/faune-animaux/des-oiseaux-fr/pigeons-photos/oiseau-pigeon-tumbler-pigeon-mouche-animal-animal, License CC0]. Elle montre à différents niveaux factoriels de compression la même image. À trois dimensions, le pigeon est difficilement perceptible. Progressivement, le pigeon est plus facilement reconnaissable, mais surtout, à un certain seuil (deuxième et troisième lignes de la Figure \@ref(fig:Pigeon), par exemple), l'image gagne en clarté. Trente dimensions conviennent, les plus difficiles désireront peut-être retenir 125 dimensions. L'image à ce niveau est très bien. Nonobstant ces nombres, ce sera toujours mieux, en termes de compression, que les 526 dimensions possibles. Ainsi, à 23.764 % des dimensions, l'image est claire et le  pigeon reconnaissable. Cette logique s'applique également pour les facteurs psychologiques.

<div class="figure" style="text-align: center">
<img src="image//pigeon.pdf" alt="Pigeon compressé à divers niveaux de dimension $k$" height="150%" />
<p class="caption">(\#fig:Pigeon)Pigeon compressé à divers niveaux de dimension $k$</p>
</div>

## Importance d'une dimension

Une technique pour connaître l'importance d'une dimension est d'afficher les valeurs propres. Les valeurs propres les plus élevées impliquent les plus importantes (les premières) alors que de petites valeurs signalent les moins importantes (du bruit, soit les dernières). Il est toutefois plus ardu de déterminer le seuil entre important et non important.

Une façon d'illustrer les valeurs propres graphiquement est d'utilisre un graphique nommé *scree plot* ou *grahpique des éboulis*. La Figure \@ref(fig:scree) peut être produite avec la syntaxe ci-dessous. Il s'agit de mettre en axe des $x$ la séquence (`idex`) des valeurs propres (leur ordre) par rapport à la valeur propre en axe des $y$. Ce graphique se produit simplement avec `plot()`. L'option `type = "b"` est simplement un type de graphique utilisé, dans ce cas-ci, la combinaison de points et de lignes.


```r
plot(res$valeurs.propres,
     type = "b")
```

<div class="figure">
<img src="14-ACP_files/figure-html/scree-1.png" alt="Les valeurs propres en fonctions de la position de l'axe" width="672" />
<p class="caption">(\#fig:scree)Les valeurs propres en fonctions de la position de l'axe</p>
</div>

## L'analyse parallèle

Avant d'introduire l'analyse parallèle (PA), il est intéressant de présenter le test duquel il est inspiré, soit le *test de Kaiser* [@Kaiser]. C'est le test utilisé par défaut dans certains logiciel traditionnel, malgré qu'il soit discrédité depuis plusieurs années [@Turner98;@Achim20;@Beauducel01]. Ce test se fonde sur l'idée selon laquelle, si les variables ne sont pas corrélées entre elles, donc s'il n'y a pas de facteurs, les valeurs propres seront égales à 1. La logique du test est d'affirmer que, si une valeur propre est supérieure à 1, alors de l'information commune est nécessairement partagée entre deux ou plusieurs variables. Selon le test de Kaiser, le nombre de composantes à retenir correspond au nombre de valeurs propres supérieures à 1. 

Asymptotiquement parlant, si $n \to \infty$, le test est vraie. Par contre, l'ACP capitalise sur l'erreur et en inclut accidentellement dans les premières dimensions. Conséquemment, les premiers axes seront surestimés, alors que les derniers seront sous-estimées.   

La solution proposée par @Horn65 est alors de tenir compte de cette erreur d'échantillonnage accidentelle. Pour ce faire, il propose de rééchantillonner les valeurs propres d'un jeu de données sans aucun facteur (aucune corrélation entre les variables) et ayant les mêmes caractéristiques que le jeu de données cible (même nombre de variables et de participant). Le jeu de données cible correspond au jeu de données de l'expérimentateur. Même s'il n'y a pas de corrélation sur le plan de la population, il y aura accidentellement des corrélations dans un échantillon. Le rééchantillonnage est réitéré sur des milliers de jeu de données artificiel. À chaque fois, les valeurs propres sont enregistrées. Des moyennes en sont retirés à la toute fin. Il s'agit du critère auquel l'hypothèse nulle est rejetée. De la première à la dernière, chaque valeur propre cible est comparée à la valeur propre moyenne correspondante, si la cible est plus élevée, il s'agit d'une dimension à retenir. Dès que la cible est inférieur, le test est arrêté. Le nombre de valeurs propres supérieures aux valeurs propres artificielles correspond au nombre de dimensions à retenir. 

Dans la syntaxe ci-dessous, les mêmes caractéristiques que le jeu de données précédent sont utilisés, soit $p = 6$ et $n = 5000$. À la fin, il sera possible de comparer s'il y a effectivement deux facteurs selon l'AP. 


```r
set.seed(1019)
p = 6        # Nombre de variables
n = 5000     # Nombre de participants 
reps = 1000  # Nombre d'itérations
valeurs.propres = matrix(0,           # Création d'une variable
                         nrow = p,    # vide pour enregistrer
                         ncol = reps) # les valeurs propres
# Création de la boucle                                        
for(i in 1:reps) {
  score = rnorm(n = n * p)             # Création de n * p valeurs 
                                       # aléatoires non corrélées
  D = matrix(score,                    # Formater en matrice le jeu
             nrow = n, ncol = p)       # de données 
  ACP = svd(cor(D))                    # Réaliser l'ACP 
  valeurs.propres[,i] = ACP$d          # Enregistrer les valeurs propres
}

# Une fois les valeurs propres obtenues,
# les moyennes et quantiles sont calculables
rowMeans(valeurs.propres)        # Une moyenne par ligne (valeur propres)
#> [1] 1.047 1.025 1.008 0.992 0.975 0.954

# Ou si le 95e percentile était préféré
apply(X = valeurs.propres, 
      FUN = quantile,
      MARGIN = 1,
      probs = .95)
#> [1] 1.065 1.038 1.019 1.001 0.986 0.969
```
Pour connaître le nombre de dimension, il suffit de tester les valeurs propres empiriques et les comparer aux valeurs propres simulées (moyenne ou 95^e^ percentile).  Le nombre de valeur propre empirique supérieur aux valeurs propres simulés correspond au nombre de composantes à retenir.


```r
# Les valeurs propres empiriques
res$valeurs.propres
#> [1] 2.483 1.425 0.715 0.648 0.468 0.260

# La moyenne des valeurs propres simulées
rowMeans(valeurs.propres)
#> [1] 1.047 1.025 1.008 0.992 0.975 0.954

# Nombre de valeurs propres empiriques supérieures aux simulées
sum(res$valeurs.propres > rowMeans(valeurs.propres))
#> [1] 2
```
Ainsi, 2 facteurs sont à retenir. Une façon d'illustrer les résultats de l'analyse parallèle est d'utiliser le graphique de éboulis en y représentant les valeurs propres empiriques comparativement aux simulées. Le nombre de valeurs propres empiriques supérieures aux simulées est le nombre de dimensions à retenir. Ce graphique est produit à la Figure \@ref(fig:scree2). Voici la syntaxe pour produire ce graphique avec `ggplot2`. La première étape est de mettre en commun les résultats obtenus dans un jeu de données. La variable `Index` indique l'index de la valeur propres, `valeurs.propres` contient les valeurs propres et `Type` indique s'il s'agit de valeurs propres empiriques ou simulées de l'analyse parallèle. Pour le reste, il s'agit de recourir à `ggplot()`.


```r
data.frame(Index = rep(1:p, p),
           valeurs.propres = c(res$valeurs.propres, rowMeans(valeurs.propres)),
           Type = rep(c("Empirique","Simulées"), each = p)
) %>% 
  ggplot(mapping = aes(x = Index, y = valeurs.propres, color = Type)) +
  geom_line() + 
  geom_point() +
  theme(legend.position = c(0.8, 0.8))
```

<div class="figure">
<img src="14-ACP_files/figure-html/scree2-1.png" alt="Comparaison des valeurs propres empiriques et simulées" width="672" />
<p class="caption">(\#fig:scree2)Comparaison des valeurs propres empiriques et simulées</p>
</div>

## MAP

*À terminer*


```r
MAP = function(data, ...){
  
  ns = dim(data)[1]
  nv = dim(data)[2]
  
  if(ns==nv){
    R = data
  }else{
    R = cor(data)
  }
  
  res = eigen(R)
  loadings = res$vectors %*% sqrt(diag(res$values))
  
  fm = cbind(seq(1, nv),seq(1, nv))
  fm[1,2] = (sum(R ^ 2) - nv) / (nv * (nv - 1))
  
  for (m in 1:(nv - 1)){
    A = loadings[,1:m]
    partcov = R - (A %*% t(A))
    d = diag ((1 / sqrt(diag(partcov))))
    pr = d %*% partcov %*% d
    fm[m+1,2]  = (sum(pr^2) - nv) / (nv * (nv - 1))
  }
  
  minfm = fm[1,2]
  nfact = 0
  for (s in 1:nv){
    fm[s,1]  = s - 1
    if(fm[s,2] < minfm){
      minfm = fm[s,2]
      nfact= s-1}
  }   
  return(OUT=list(name = "MAP", nfact = nfact))
}
```


Pour tester


```r
MAP(data=jd5000)
#> $name
#> [1] "MAP"
#> 
#> $nfact
#> [1] 1
```


## NEST

Le *Next Eigenvalue Sequential Test* développé  par Achim [-@Achim17;-@Achim20] est le dernier cri en termes d'estimations du nombre de composante à retenir.

<!-- Il est à mi-chemin entre MAP et AP  -->

*À terminer*


```r
NEST <- function(data, N=NULL, reps = 1000, 
                 alpha = .05, convergence = 1e-5, maxit = 500, ...){
  
  ns = dim(data)[1]
  nv = dim(data)[2]
  if(ns==nv){
    if(is.null(N)) stop("Error: 'N' is required") 
    ns = N
  }else{
    data = cor(data)
  } 
  E = eigen(data, symmetric=TRUE)$values
  
  for (nfact in 0:(nv-2)){
    rnk = rep(1, nfact + 1)
    if (nfact==0){
      model = diag(nv)
    }else{
      R = data
      pre = diag(data)
      for (jj in 1:maxit){
        res = eigen(R, symmetric=TRUE)
        if (nfact==1){
          ld = res$vectors[,1] * sqrt(res$values[1])
          co = ld*ld
        }else{
          ff = nfact
          while (res$value[ff] <= 0) {ff = ff - 1}
          ld = res$vectors[,1:ff] %*% diag(sqrt(res$values[1:ff]))
          co = rowSums(ld*ld)
        }
        
        if (max(co)>1){
          R = R + diag(pre - diag(R))
          break
        }
        
        diff = max(abs(pre - co))
        if (diff < convergence) break
        R = R + diag(co-pre)
        pre = co
      }
      
      if (jj >= maxit){
        nt<-paste("Warning! Convergence not achieved")
      }
      
      
      model = t(cbind(ld, diag(sqrt(1-co))))
    }
    nd = nfact + nv
    for (j in 1:reps){
      res = eigen(cor(matrix(rnorm(ns * nd), ns, nd) %*% model), 
                  symmetric=TRUE)$values[1:(nfact + 1)]
      rnk = rnk + (res >= E[1:(nfact + 1)])
    }
    if (rnk[nfact+1] > alpha*(reps+1)) break
  }
  
  return(OUT = list(name = "NEST", nfact = nfact)	)
}

```

Pour tester

```r
NEST(cor(jd5000), N = nrow(jd5000))
#> $name
#> [1] "NEST"
#> 
#> $nfact
#> [1] 2
```


## Packages

La fonction `svd()` a été abordée, mais d'autres fonctions peuvent aussi réaliser l'analyse en composantes principales, soit `prcomp()` et `eigen()`. Les sorties et arguments seront légèrement différents, mais correspondent aux mêmes analyses.


