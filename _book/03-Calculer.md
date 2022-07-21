# Calculer

Dans cette section, les fonctions essentielles couramment utilisées sont présentées en rafale. L'accent est mis sur la définition de la fonction (qu'est-ce qu'elle fait?) et son utilité (à quoi sert-elle?). Pour les fonctions essentielles de nature statistiques (moyennes, médianes, etc.), cette section développe une fonction maison (rédigée par l'utilisateur pour la mettre en pratique) et identifie la fonction déjà implantée en **R**.

## La longueur

La longueur d'une variable correspond au nombre d'éléments qu'elle contient. La fonction `length()` permettra d'obtenir ce résultat. Ce sera particulièrement utile lorsqu'il faudra calculer, par exemple, le nombre de boucle à réaliser à partir des éléments d'un vecteur ou la taille d'échantillon (le nombre d'unités d'observation d'une variable). 

La somme d'une chaîne de caractères est toujours de $1$, peu importe le nombre de caractères. La fonction `nchar()` produira le nombre de caractères.

Une variable qui existe, mais qui ne contient pas de valeur aura une longueur égale à $0$. Ce type de variable est utile lorsqu'il faut créer une variable dont la taille sera altérée.


```r
x <- c(1, 2, 3)
length(x)
> [1] 3

y <- "Bonjour tout le monde!"
length(y)
> [1] 1

nchar(y)
> [1] 22
```

Pour les matrices et les jeux de données, `ncol()` (nombre de colonnes) et `nrow()` (nombre de lignes) sont plus efficaces et intuitives.

## La répétion

La fonction `rep()` est utile pour répéter volontairement des valeurs. Il y trois possibilités de répétitions: l'argument `times` définit le nombre de fois que le vecteur est répété; l'argument `each` définit le nombre de fois que chaque élément est répété; l'argument `length.out` précise le nombre d'éléments de la sortie. Plusieurs combinaisons de ces arguments sont possibles.


```r
vec <- c(2, 4, "chat")

# Répéter `vec` trois fois
rep(vec, times = 3)
> [1] "2"    "4"    "chat" "2"    "4"    "chat" "2"    "4"   
> [9] "chat"

# Répéter chaque élément de `vec` trois fois
rep(vec, each = 3)
> [1] "2"    "2"    "2"    "4"    "4"    "4"    "chat" "chat"
> [9] "chat"

# Répéter chaque élément de `vec` d'une longueur de 8
rep(vec, length.out = 8)
> [1] "2"    "4"    "chat" "2"    "4"    "chat" "2"    "4"

#  Répéter chaque élément 3 fois à 2 reprises
rep(vec, times = 2, each = 3)
>  [1] "2"    "2"    "2"    "4"    "4"    "4"    "chat" "chat"
>  [9] "chat" "2"    "2"    "2"    "4"    "4"    "4"    "chat"
> [17] "chat" "chat"
```

## La séquence

Une première fonction pour créer des séquences de nombres est l'utilisation de `:` avec un nombre avant et après la ponctuation. 


```r
# 1:3 équivaut à c(1, 2, 3)
1:3
> [1] 1 2 3
```

Pour plus de malléabilité, la fonction `seq()` génère une séquence régulière de valeurs. Les arguments sont `seq(from = , to = , by = )` traduisibles par `de` , `à`, `par`. Les arguments par défaut seront très utiles pour simplifier l'écriture; La fonction commence ou termine la séquence par 1 et fera des bonds de 1 entre les valeurs. Un autre argument est la longueur de la sortie `length.out` qui spécifie le nombre d'éléments que devra comporter le vecteur de sortie.


```r
# Une séquence de 1 (défaut, from = 1) à 10
seq(10)
>  [1]  1  2  3  4  5  6  7  8  9 10

# Une séquence de 1 (défaut, from = 1) à -10
seq(-10)
>  [1]   1   0  -1  -2  -3  -4  -5  -6  -7  -8  -9 -10

# Une séquence de -10 (défaut, from = 1) à 1
seq(from = -10, to = 1)
>  [1] -10  -9  -8  -7  -6  -5  -4  -3  -2  -1   0   1

# Une séquence de nombres paires (from = 2, to = 10, by = 2)
seq(2, 10, 2)
> [1]  2  4  6  8 10

# Une séquence de nombres paires 
seq(from = 2, by = 2, length.out = 5)
> [1]  2  4  6  8 10
```

## La somme

Il est possible de calculer des sommes de variables pour en obtenir le total. En tant qu'humain, le calcul d'une série de nombre correspond à prendre chaque nombre et de les additionner un à un. La fonction suivante reproduit assez bien ce qu'un humain ferait (avec ses quelques caprices de programmation tel que devoir déclarer l'existence de la variable de `total` et spécifier le nombre d'éléments à calculer).


```r
somme <- function(x){
  # La taille du vecteur `x`
  n <- length(x)
  
  # Définir une variable nulle
  total <- 0
  
  # Boucle pour additionner chaque élément
  for(i in 1:n){
    
    # Prendre le ie élément et l'additionner
    # au total des (i-1)e éléments précédents
    total <- total + x[i]
  }
  # Retourner le total après la boucle
  return(total)
}

# Pour tester
x <- c(1,2,3,4,5,-6)
somme(x)
> [1] 9
sum(x)
> [1] 9
```

À noter que l'utilisation de la boucle est à des fins illustratives seulement. En termes de rendement computationnel, elle est bien peu efficace. Il faudra privilégier la fonction `sum()` pour calculer le total de son entrée.

Il faut prendre garde : **R** calcule le total de tous les éléments de l'entrée sans égard aux lignes et aux colonnes. Autrement dit, il vectorise les entrées. Si deux variables étaient entrées par inadvertance, alors R calculerait la somme de ces deux variables plutôt que de retourner deux totaux. À cette fin, les fonctions `rowSums()` et `colSums()` seront utiles lorsqu'il faudra calculer des sommes sur des lignes (*row*) ou des colonnes (*col*).

## La moyenne

La moyenne est une mesure de tendance centrale qui représente le centre d'équilibre d'une distribution (un centre de gravité en quelque sorte). Si le poids d'un des côtés d'une distribution de probabilité était altéré (plus lourde ou plus légère), alors la moyenne se déplacerait relativement vers cette masse.

La moyenne d'un échantillon correspond à la somme de toutes les unités d'une variable divisée par le nombre de données de cette variable ou, mathématiquement, $$\bar{x}=\frac{\Sigma_{i=1}^n x}{n}$$ où $x$ est la variable, $n$ est le nombre d'unité et $\Sigma_i^n$ représente la somme de toutes les unités de $x$. **R** possède déjà une fonction permettant de calculer la moyenne sans effort, `mean()` où l'argument est la variable. Il est possible de développer une fonction maison pour calculer la moyenne comme


```r
x_bar <- sum(x)/length(x)
```

où `sum(x)` calculer la somme de toutes les unités de `x`, `/` permet la division et `length(x)` calcule le nombre d'unités du vecteur `x`. Par exemple, à partir d'une variable `x`, les fonctions suivantes donnent le même résultat. Par contre la fonction `mean()` est beaucoup plus robuste que cette dernière équation.


```r
# Un vecteur
x <- c(0, 1, 2, 3, 4, 5)

# Comparaison
mean(x)
> [1] 2.5
sum(x)/length(x)
> [1] 2.5
```

Comme pour `sum()`, les fonctions `rowMeans()` et `colMeans()` seront utiles lorsqu'il faudra calculer des moyennes sur des lignes (*row*) ou des colonnes (*col*).^[Contrairement à `sum()`, `mean()` est une fonction générique, terme technique qui définit une fonction généralisée pour différents fonctions, une fonction mère en quelque sorte (une idiosyncrasie de **R**). En conséquences, `sum(2, 4)`, qui n'est pas générique, retourne 4 (comme prévu), mais `mean(2, 4)` retourne 2 (au lieu de 3). La fonction reconnaît 2 comme premier argument vecteur et n'utilise pas 3, car il ne reconnaît pas qu'il fait parti du vecteur. Pour éviter ces soucis, il faut s'assurer de bien soumettre un vecteur à `mean()`. Ce livre n'entre pas dans les détails de ce que sont ces fonctions, à ce sujet voir @HW19.]

## La médiane

La médiane d'un échantillon correspond à la valeur où $50\%$ des données se situe au-dessous et au-dessus de cette valeur. C'est la valeur au centre des autres (lorsqu'elles sont ordonnées). Quand le nombre de données est impair, le $\frac{(n+1)}{2}$^e^ élément est la médiane. Quand le nombre est pair, la moyenne des deux valeurs au centre correspond à la médiane. Cette statistique est intéressante comme mesure de tendance centrale, car elle est plus robuste aux valeurs aberrantes (moins sensibles) que la moyenne.

Évidemment, **R** offre déjà une fonction `median()` pour réaliser le calcul. Il est toutefois possible de programmer une fonction maison. Il faut utiliser la fonction `sort()` pour ordonner les données (croissant par défaut).


```r
mediane <- function(x) {
  # Longueur du vecteur
  n <- length(x)
  
  # Ordonner le vecteur
  s <- sort(x)
  # Vérifier si la longueur est paire ou impaire et
  # alors calculer la valeur médiane correspondante
  ifelse(n%%2 == 1, s[(n + 1) / 2], mean(s[n / 2 + 0:1]))
}

# Un vecteur
x <- c(42, 23, 53, 77, 93, 20, 37, 24, 60, 62)

# Comparaison
median(x)
> [1] 47.5
mediane(x)
> [1] 47.5
```

L'expression `n%%2`, lue $n \bmod 2$, joue astucieusement le rôle de vérifier si `n` est impaire. La formule générale $x \bmod y$ représente une opération binaire associant à deux entiers naturels le reste de la division du premier par le second. Par exemple, $60 \bmod 7$, noter `60%%7` dans **R**, donne $4$ soit le reste de $7*8 + 4 = 60$. Le logiciel le confirme.


```r
60%%7
> [1] 4
```

Il s'agit d'une technique de programmation très pratique. Dans le cas de `n%%2`, la formule donne $1$ dans le cas d'un nombre impair ou $0$ dans le cas d'un nombre pair, puis teste ce résultat pour déterminer s'il réalise `s[(n+1)/2]` lorsque `n%%2==1`(`TRUE`) , ce qui correspond à choisir l'élément au centre d'un vecteur de taille impair, ou bien `mean(s[n/2+0:1]` lorsque `n%%2==0`(`FALSE`) , ce qui correspond à choisir les deux éléments au centre d'un vecteur pair et d'en faire la moyenne. Il s'agit de l'une des nombreuses façons selon lesquelles il est possible de programmer la médiane.

## La variance

La variance d'un échantillon est une mesure de dispersion. Elle représente la somme des écarts (distances) par rapport à la moyenne au carré divisée par la taille d'échantillon moins $1$.  Mathématiquement, il s'agit de l'équation \@ref(eq:var).

$$
s^2 = \frac{1}{n-1}\sum_{i=1}^n(x_i-\bar{x})^2
(\#eq:var)
$$
Il est assez aisé d'élaborer une fonction pour réaliser se calculer avec les fonctions déjà abordées.


```r
variance <- function(x){
  # Longueur du vecteur
  n <- length(x)
  
  # Moyenne du vecteur
  xbar <- mean(x)
  
  # La variance
  variance <- sum((x - xbar) ^ 2)/(n - 1)
  return(variance)
}
```

La variance peut aussi être calculée plus efficacement avec la fonction **R** `var()`.

```r
# Un vecteur
x <- c(26, 6, 40, 36, 14, 3, 21, 48, 43, 2)

# Comparaison
variance(x)
> [1] 300
var(x)
> [1] 300
```

## L'écart type

L'écart type d'un échantillon représente la racine carrée de la variance. Elle a une interprétation plus intuitive en tant que mesure de la moyenne des écarts par rapport à la moyenne. Si le calcul avait été entrepris avec les distances par rapport à la moyenne (au lieu des écarts au carré), alors la somme serait toujours de 0, un résultat tout à fait bancal. En prenant la racine carrée des écarts au carré, ce qui constitue une mesure de distance euclidienne, l'écart type devient une mesure de l'étalement de la dispersion autour du centre d'équilibre.

$$
s =\sqrt{s^2}= \sqrt{\frac{1}{n-1}\sum_{i=1}^n(x_i-\bar{x})^2}
$$
Avec **R**, la fonction de base est `sd()`. Il est possible de récupérer la fonction maison précédemment rédigée.

```r
ecart.type <- function(x){
  # La racine carrée de la variance
  et <- sqrt(variance(x))
  return(et)
}

# Comparaison
ecart.type(x)
> [1] 17.3
sd(x)
> [1] 17.3
```


## Les graines

Par souci de reproductibilité, il est possible de déclarer une valeur de départ aux variables pseudoaléatoires, ce que l'on nomme une graine ou *seed* en anglais. Cela permet de toujours d'obtenir les mêmes valeurs à plusieurs reprises, ce qui est très utile lors d'élaboration de simulations complexes ou lorsque des étudiants essaient de répliquer résultat tiré d'un ouvrage pédagogique.

```r
set.seed("nombre")
```
Il suffit de spécifier cette commande (en remplaçant `nombre` par un nombre) en début de syntaxe pour définir la séquence de nombre. Cette fonction sera utilisée à plusieurs reprises dans le but de reproduire les mêmes sorties.

Cette fonction est présentée, car elle reviendra régulièrement dans ce livre pour qu'il soit possible de reproduire et obtenir exactement les mêmes résultats.

## Les distributions

Il existe plusieurs distributions statistiques déjà programmées avec **R**. Voici les principales utilisées dans cet ouvrage.

<table class=" lightable-classic table" style='font-family: "Arial Narrow", "Source Sans Pro", sans-serif; width: auto !important; margin-left: auto; margin-right: auto; margin-left: auto; margin-right: auto;'>
<caption>(\#tab:unnamed-chunk-14)Noms des distributions, fonctions et leurs arguments</caption>
 <thead>
  <tr>
   <th style="text-align:center;"> Distribution </th>
   <th style="text-align:center;"> R </th>
   <th style="text-align:center;"> Arguments </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:center;"> binomiale </td>
   <td style="text-align:center;"> binom </td>
   <td style="text-align:center;"> size, prob </td>
  </tr>
  <tr>
   <td style="text-align:center;"> Khi-carré </td>
   <td style="text-align:center;"> chisq </td>
   <td style="text-align:center;"> df, ncp </td>
  </tr>
  <tr>
   <td style="text-align:center;"> Fisher </td>
   <td style="text-align:center;"> f </td>
   <td style="text-align:center;"> df1, df2, ncp </td>
  </tr>
  <tr>
   <td style="text-align:center;"> normale </td>
   <td style="text-align:center;"> norm </td>
   <td style="text-align:center;"> mean, sd </td>
  </tr>
  <tr>
   <td style="text-align:center;"> student </td>
   <td style="text-align:center;"> t </td>
   <td style="text-align:center;"> df, ncp </td>
  </tr>
  <tr>
   <td style="text-align:center;"> uniform </td>
   <td style="text-align:center;"> unif </td>
   <td style="text-align:center;"> min, max </td>
  </tr>
</tbody>
</table>

Les libellés ci-dessus ne commanderont pas de fonction. Il faut joindre en préfixe à ces distributions l'une des quatre lettres suivantes : `d`, `p`,`q`, ou `r`. La plus simple est certainement `r` (*random*) qui génère `n` valeurs aléatoires de la distribution demandée selon les paramètres spécifiés. Les fonctions `q` (quantile) prennent un argument de 0 à 1 (100%), soit un percentile et retourne la valeur de la distribution. La fonction `p` (probabilité) retourne la probabilité cumulative (du minimum jusqu'à la valeur) d'une valeur de cette distribution. Enfin, la lettre `d` (densité) permet, notamment, d'obtenir les valeurs de densité de la distribution.

Voici un exemple avec la distribution normale.

```r
set.seed(9876)

# Génère 5 valeurs aléatoires en fonction des paramètres
rnorm(n = 5, mean = 10, sd = .5)
> [1] 10.51  9.42  9.90  9.95 10.01

# Retourne les valeurs associés à ces probabilités
qnorm(p = c(.025,.975))
> [1] -1.96  1.96

# Retourne la probabilité d'obtenir un score de 1.645 et moins
pnorm(q = c(.5, 1.645, 1.96))
> [1] 0.691 0.950 0.975

# La valeur de la densité de la distribution
dnorm(x = c(0, 1))
> [1] 0.399 0.242
```

Ces quatre lettres peuvent être associées à toutes les distributions énumérées et bien d'autres. Elles respectent toutes ce cadre.

Afin d'illustrer ce que font ces variables, la Figure \@ref(fig:distex) montre `dnorm()`, `pnorm()` et `qnorm()`. La fonction `rnorm()` n'est pas illustrée. Cette dernière retourne des valeurs de l'axe des $x$ en respectant les probabilités d'une courbe normale. La fonction `dnorm()` prend en argument une valeur de l'axe des $x$ et retourne la valeur de la courbe normale (la densité) correspondante, soit la courbe illustrée. En d'autres termes, elle retourne la hauteur de la courbe (ligne pointillée). Les fonctions `pnorm()` et `qnorm()` sont interreliées. La fonction `pnorm()` prend une valeur de l'axe des $x$ et retourne sa probabilité (de $-\infty$ à $x$), soit la zone grise de la Figure \@ref(fig:distex). La fonction `qnorm()`, quant à elle, prend une probabilité et retourne la valeur sur l'axe des $x$ correspondant.

<div class="figure">
<img src="03-Calculer_files/figure-html/distex-1.png" alt="Illustration des fonctions liées à la distribution normale" width="90%" height="90%" />
<p class="caption">(\#fig:distex)Illustration des fonctions liées à la distribution normale</p>
</div>

Ces fonctions entreront en jeu dans le chapitre [Inférer].

# Exercices {#exercice-rudiments .unnumbered}

1. Quel est le résultat de `mean <- c(1, 2, 3)`? Pourquoi?

2. Quelle est la différence entre `# Caractère` et `"Caractère"`?

3. Créer un vecteur contenant les valeurs $4, 10, 32$. Calculer la moyenne et l'écart type de ce vecteur.

4. Créer un vecteur contenant les valeurs de $4$ à $11$. Sélectionner la deuxième valeur de ce vecteur, puis additionner 100 à cette valeur et remplacer la dans le vecteur.

5. Générer 10 valeurs aléatoires distribuées normalement avec une moyenne de 50 et un écart type de 4. Calculer la moyenne, la médiane et la variance.

6. Créer un jeu de données contenant quatre sujets avec, pour chacun, leur nom de famille, leur âge et un score d'appréciation tiré d'une distribution uniforme allant de 0 à 100.

7. Rédiger une fonction calculant l'hypoténuse d'un triangle rectangle. Rappel: le théorème de Pythagore est $c^2=a^2+b^2$.

8. Rédiger une fonction calculant un score-$z$ pour une variable. Rappel: un score-$z$, correspond à $z=\frac{x-\mu}{\sigma}$.

9. Rédiger une fonction calculant la médiane d'une variable (ne recopiez pas celle de ce livre).

10. Rédiger une fonction qui pivote une liste de $k$ éléments par $n$. Par exemple, une liste de six ($k=6$ comme $[1,2,3,4,5,6]$) pivoté de deux ($n=2$) devient ($[3,4,5,6,1,2]$).

11. Rédiger une fonction pour générer une séquence de Fibonacci (chaque nombre est la somme des deux précédents) jusqu'à une certaine valeur, soit $1, 1, 2, 3, 5, 8,...$.
