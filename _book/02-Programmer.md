# Programmer

Une fois **R** (ou **R**Studio) ouvert, qu'est-il possible de réaliser? Dans les prochaines sections, les différents éléments de programmation permettant la création et la manipulation de données seront présentés.

## Les variables
Pour manipuler les données, il faut recourir à des variables. Afin de leur attribuer une valeur, il faut assigner cette valeur avec `<-` (**ALT** + **-**) ou `=`, par exemple,


```r
a <- 2
a
> [1] 2
```

où `a` est maintenant égale à `2`. La première ligne assigne la valeur à `a`. La deuxième ligne, indique à la console **R** d'imprimer le résultat pour le voir. Par la suite, `a` pourra être utilisée dans des fonctions, des calculs ou analyses plus complexes. De surcroît, `a` pourra devenir une fonction, une chaîne de caractère (*string*) ou un jeu de données.

Conventionnellement, les puristes de **R** recommanderont l'usage de `<-` plutôt que `=` pour l'assignation. Il y a quelques nuances computationnelles entre les deux, mais qui échapperont irrémédiablement aux néophytes et même aux usagers intermédiaires. Par tradition, `<-` prévaudra.

Pour nommer des variables, seuls les caractères alphanumériques peuvent être utilisés ainsi que le tiret bas `_` et le `.`. Les variables ne peuvent commencer par un nombre.

<!-- TODO -->
<!-- L'utilisation de `=` sera utilisée dans cet ouvrage, par simplicité, mais aussi, car il semble plus intuitif pour le nouvel utilisateur ou la nouvelle utilisatrice. Il économise 1 clique de clavier. -->

Réassigner une valeur à une variable déjà existante écrase la valeur précédente.


```r
a <- 2
a <- 3
a
> [1] 3
```

La sortie produit `3` et non plus `2`.

Cette remarque est importante, car elle signifie que l'on peut écraser des fonctions en nommant des variables. Il faut ainsi éviter de nommer des variables avec des fonctions utilisées par **R**, on évitera notamment l'utilisation des noms suivants.


```r
c; q; t; C; D; I; T; F; pi; mean; var; sd; length; diff; rep
```

Certains mots seront tout simplement interdits d'utilisation.


```r
TRUE; FALSE; break; for; in; if; else; while; function; Inf; NA; NaN; NULL
```

## Les opérateurs arithmétiques

La première utilisation d'un nouvel usager de **R** est généralement d'y recourir comme calculatrice. Les opérateurs arithmétiques de base comme l'addition `+`, la soustraction `-`, la multiplication `*`, la division `/` , et l'exposant `^` sont intuitivement disponibles.

```r
2 + 2
> [1] 4
1 / 3
> [1] 0.333
2 * 3 + 2 ^ 2
> [1] 10
```
Évidemment, ces opérateurs fonctionnent sur des variables numériques.

```r
a <- 1
b <- 10
a / b
> [1] 0.1
```

Les deux premières lignes assignent des valeurs à `a` et `b`, puis la troisième imprime la division. L'absence de marqueur `<-` ou `=` indique à **R** d'imprimer la réponse dans la console. Si le résultat `a / b` devait être assigné à une variable, alors aucun résultat ne serait affiché, bien que la variable contienne la réponse.


```r
resultat <- a / b
```

Il n'y a aucune réponse d'affichée. Maintenant, si `resultat` est demandé, R affiche le contenu de la variable.


```r
resultat
> [1] 0.1
```
D'autres fonctions sont aussi très utiles. Par exemple, la racine carrée `sqrt()` (qui n'est rien d'autre que `^(.5)`) et le logarithme naturel `log()`. Il suffit d'insérer une variable ou une valeur à l'intérieur d'une de ces fonctions pour en obtenir le résultat.

```r
sqrt(4)
> [1] 2
4^(1/2)
> [1] 2
log(4)
> [1] 1.39
```

## Les commentaires

Les scripts **R** peuvent contenir des commentaires. Ceux-ci sont désignés par le désormais célèbre `#`. Une ligne de script commençant par ce symbole sera ignorée par la console. Ces commentaires permettent aussi bien de préciser différentes étapes d'un script, que d'expliquer la nomenclature des variables ou encore d'expliquer une fonction, ses entrées, ses sorties. Les commentaires sont extrêmement utiles, car les annotations peuvent souvent sauver énormément de temps et d'effort lors d'utilisations ultérieures.


```r
# La variable resultat est le quotient des variables a et b
resultat <- a / b
resultat
> [1] 0.1
```
Dans cet exemple, la première ligne est ignorée. Autrement, la console **R** produirait une erreur, car cette ligne est pour le logiciel pur charabia!

## Définir une chaîne de caractère

La plupart du temps, les variables utilisées seront numériques, c'est-à-dire qu'elles contiendront des nombres. Parfois en analyses de données, il pourra s'agir de chaîne de caractères (*string*), autrement dit, des mots. Les chaînes de caractères sont définis par le double apostrophe `"..."`, où on remplace les trois points par les mots désirés.^[Les simples apostrophes `'...'` fonctionnent également, mais les doubles sont préférés. En plus, R imprime toujours en double apostrophe. C'est un souci de cohérence.]


```r
titre <- "Bonjour tout le monde!"
titre
> [1] "Bonjour tout le monde!"
```

## Concaténer

Par défaut, **R** ne peut assigner qu'une valeur à une variable. Pour grouper des éléments ensemble, c'est-à-dire, pour créer des jeux de données, des vecteurs, des matrices, des listes, il faudra utiliser des fonction de concaténation, dont voici une liste des plus utiles avec quelques exemples, de la plus stricte (vecteur) à la plus flexible (liste).

### Création d'un vecteur

Une fonction fort utile permet de joindre des valeurs dans une seule variable. Précédemment, l'assignation d'une valeur à des variables se limitait à une chaîne de caractères ou à une valeur numérique. La fonction **c**oncaténer `c()` (ou **c**ombiner, **c**réer) met plusieurs éléments (deux ou plus) dans une seule variable. Son but est de *vectoriser* les arguments. Chaque élément est délimité par une virgule `,`.


```r
valeurs <- c(-5, 5)
valeurs
> [1] -5  5
```

Elle fonctionne également avec les chaînes de caractères.


```r
texte <- c("Bonjour", "tout", "le", "monde")
texte
> [1] "Bonjour" "tout"    "le"      "monde"
```

Et les deux.


```r
phrase <- c(1, "Chat", 2, "Souris")
phrase
> [1] "1"      "Chat"   "2"      "Souris"
```

La fonction `c()` est strict sur les arguments, car elle leur accorde le même attribut. Par exemple, `phrase` ne contient que des chaînes de caractères. Les valeurs `1` et `2` ont perdu leur classe numérique (elles ne sont plus utilisables comme nombre^[Pour l'instant]). Cela se remarque par les guillemets anglophones autour des valeurs `"1"` et `"2"` imprimées.

Il faudra également faire attention aux arguments passés à la fonction `c()`, car celle-ci vectorise les arguments. Autrement dit, elle crée des vecteurs (une ligne en quelque sorte) avec les entrées fournies, peu importe leur structure de départ. Par exemple, un jeu de données passant par `c()` devient une seule ligne (un seul vecteur) de valeurs. Les fonctions `cbind()` et `rbind()` permettront de joindre des colonnes et des lignes, respectivement.

### Création d'une matrice

La fonction `matrix()` sera utile pour créer des matrices, comme des matrices de covariances, par exemple. La fonction utilise trois arguments, une matrice de nombre à entrer dans la matrice, un nombre de colonnes et un nombre de lignes. La fonction utilise le recyclage, ce qui pourra être utile à certaines occasions.


```r
# Une matrice de 0 de taille 3 x 3
matrix(0, ncol = 3, nrow = 3)
>      [,1] [,2] [,3]
> [1,]    0    0    0
> [2,]    0    0    0
> [3,]    0    0    0

# Une matrice contenant les nombres 1:3 pour une matrice 3 x 3
matrix(1:3, ncol = 3, nrow = 3)
>      [,1] [,2] [,3]
> [1,]    1    1    1
> [2,]    2    2    2
> [3,]    3    3    3

# Si la séquence préférée est de gauche à droite plutôt
# que de bas en haut
matrix(1:3, ncol = 3, nrow = 3, byrow = TRUE)
>      [,1] [,2] [,3]
> [1,]    1    2    3
> [2,]    1    2    3
> [3,]    1    2    3

# Une matrice avec un nombre d'entrées égale au nombre de cellules
matrix(1:16, ncol = 4, nrow = 4)
>      [,1] [,2] [,3] [,4]
> [1,]    1    5    9   13
> [2,]    2    6   10   14
> [3,]    3    7   11   15
> [4,]    4    8   12   16
```

Les matrices sont une formes de jeu de données dans lequel tous les éléments partagent le même attribut (tous numériques, caractères, logiques, etc.). 

### Création d'un jeu de données

Un jeu de données (`data.frame`) est un peu comme l'extension de la matrice. La différence étant que les éléments entre les colonnes peuvent partager des attributs différents. Ainsi chaque ligne représente une unité (un participant, un objet) et chaque colonne représente une dimension (informations ou variable) différente de cette objectif. La fonction `data.frame()` permet de créer de tel objet. La fonction prend comme un argument une série de vecteurs. Des noms peuvent être attribués au colonnes qui correspondent à des variables.


```r
# Quelques variables
var1 <- c("Éloi", "Laurence")
var2 <- c(6, 3)
var3 <- c(TRUE, TRUE)

# Entrer de trois vecteurs non identifiés
jd1 <- data.frame(var1, var2, var3)

# Entrer de trois vecteurs identifiés
jd2 <- data.frame(nom = var1, age = var2, enfant = var3)

# Comparer
jd1 ; jd2
>       var1 var2 var3
> 1     Éloi    6 TRUE
> 2 Laurence    3 TRUE
>        nom age enfant
> 1     Éloi   6   TRUE
> 2 Laurence   3   TRUE
```

En utilisant `nom.de.variable = vecteur` à l'intérieur de `data.frame()`, les noms des colonnes deviennent `nom.de.variable`. Cela permettra une plus grande flexibilité lorsqu'il faudra [gérer] et [manipuler] les données. 

Comme les matrices, les jeux de données ont aussi une restriction. Alors que les jeux de données libèrent la contrainte d'avoir des objets de même attributs entre les colonnes (variables), ils doivent être créés avec des vecteurs de même longueur. Autrement dit, chaque colonne doit avoir exactement le même nombre de lignes. Parfois, **R** procédera par recyclage pour combler les éléments. Il faudra donc porter une attention particulière, pour vérifier si c'est l'intention ou non.

### Création d'une liste

Une troisième option pour stocker de informations dans une seule variable est d'avoir recourt aux listes. La liste libère à la fois l'utilisateur des objets de mêmes attributs et de même longueur. Ainsi, une liste, peut contenir des vecteurs, des matrices, des jeux de données et même d'autres listes. 

Pour créer une liste, il faut utiliser la fonction `list()`. Comme `data.frame()`, des noms d'éléments peuvent être donner pour chaque liste pour faciliter la manipulation ultérieure de la liste.


```r
#Quelques variables
var1 <- c("chat","chien")
var2 <- 1:10

# Entrer de deux vecteurs non identifiés
jd1 <- list(var1, var2)

# Entrer de deux vecteurs identifiés
jd2 <- list(animal = var1, nombre = var2)

# Comparer
jd1 ; jd2
> [[1]]
> [1] "chat"  "chien"
> 
> [[2]]
>  [1]  1  2  3  4  5  6  7  8  9 10
> $animal
> [1] "chat"  "chien"
> 
> $nombre
>  [1]  1  2  3  4  5  6  7  8  9 10
```

L'utilisation de listes est une caractéristique prédominante avec **R**. Par exemple, **R** ne peut sortir qu'une variable par fonction. Si la fonction doit retourner plusieurs éléments, ceux-ci devront se retrouver dans une liste. Ce qui sera plus nébuleux pour le lecteur, c'est que l'optimisation de **R** se fait par les listes. Cela sera noté aux moments appropriés.

## Référer à des sous-éléments

Avec des variables contenant plusieurs valeurs, il peut être utile de référer à une seule valeur ou un ensemble de valeurs de la variable. Les crochets `[]` à la suite du nom d'une variable permettront d'en extraire les valeurs désirées sans tout sortir l'ensemble.


```r
# Un exemple de vecteur
phrase <- c(1, "Chat", 2, "Souris")

# Extraire le premier élément de la variable phrase
phrase[1]
> [1] "1"

# Extraire les éléments 1, 2 et 3
phrase[1:3]
> [1] "1"    "Chat" "2"

# Extraire les éléments 2 et 4
phrase[c(2,4)]
> [1] "Chat"   "Souris"

# Ne pas extraire l'élément 1
phrase[-1]
> [1] "Chat"   "2"      "Souris"

# Ne pas extraire les éléments 1 et 3
phrase[-c(1, 3)]
> [1] "Chat"   "Souris"
```

Dans le premier exemple, seul un élément est demandé. Dans le deuxième exemple, la commande `1:3` produit la série de $1,2,3$ et en extrait ces nombres. Dans le dernier exemple, la fonction `c()` est astucieusement utilisée pour extraire les éléments $2$ et $4$. Le quatrième exemple montre comment retirer un élément en utilisant des valeurs négatives et le cinquième exemple montre comment retirer des éléments.

La section [Manipulation de données] montrera davantage comment référer à des sous-éléments de jeux de données, de matrices et de listes.


## Les packages

L'utilisation de packages (souvent nommées bibliothèques, modules, paquets ou paquetage en français - ici, l'usage de *package* sera maintenu) est l'attrait principal de **R**. Pour éviter l'anglicisme, Antidote suggère *forfait*, *achat groupé* ou *progiciel* (ce dernier étant certainement le terme approprié). 

Les packages sont de regroupement de fonctions. C'est certainement l'aspect qui a le plus contribué au succès et à sa dissémination de **R**. Il s'agit de la mise en commun d'un effort collaboratif afin de créer des fonctions et de les partager librement entre les usagers. Le téléchargement de base de **R** offre déjà quelques packages rudimentaires (comme `base` qui offre des fonctions comme `sum()` ou `stat`  qui offre des fonctions comme `mean()` et `var()`), mais qui suffisent rarement lorsque des analyses plus avancées ou plus spécialisées sont nécessaires.

L'une des forces des packages est qu'ils sont fournis généralement avec un bon manuel d'utilisation. Plusieurs contributeurs leur sont associés (avec un responsable). Ils sont maintenus régulièrement. Le soutien des responsables est parfois aisé à obtenir et les auteurs de ces packages sont motivés à maintenir les packages opérationnels et aux bénéfices de tous. La faiblesse des packages est qu'il s'agit malheureusement de *généralement*. Il arrive que certains packages produisent des erreurs de calcul, soient laissé en désuétude par leurs auteurs, que le package ait migré sous une autre forme, que de meilleures options soient disponibles sans aucune notice à cet effet. Cela va sans dire, ce problème concerne les logiciels traditionnels également. Il s'agit toutefois d'un enjeu moindre, car les packages sont souvent recommandés par des collègues, des autorités dans leur domaine respectif ou des ouvrages de référence, ce qui aura comme tendance de promouvoir les meilleurs packages. Pas toujours. Il faut rester critique et ne pas de laisser tromper par une boîte noire.

Une dernière faiblesse : les packages agissent parfois en boîte noire, c'est-à-dire qu'ils court-circuitent la réflexion de l'utilisateur qui leur fait confiance. Il peut être parfois difficile de savoir ce que les fonctions produisent exactement. Au contraire des logiciels traditionnels, ces boîtes noires peuvent dans la plupart des cas être accessibles directement, elles sont liés en plus à des articles scientifiques ou de la documentation qui permet dans comprendre les tenants et aboutissants.

### Installer des packages
Pour installer un package, il faut utiliser la fonction

```r
install.packages("...")
```
où les `"..."` doivent être remplacé par le nom du package. Il est important de bien inscrire le nom du package entre guillemet anglophone. Il est aussi possible de sélectionner

> Tools;
> Install Packages...

puis de nommer le package sous l'onglet package. Avec **R** il faudra auparavant choisir un miroir (sélectionner un pays), ce qui ne sera pas nécessaire avec **R**Studio. Une fois téléchargé, il ne sera plus nécessaire de refaire cette étape à nouveau, à l'exception de potentielles et ultérieures mises à jour lorsqu'elles devront être réalisées.

### Appeler un package
Ce qui n'est pas des plus intuitif avec **R**, c'est qu'une fois le package téléchargé, il n'est pas directement utilisable. Il faut d'abord l'appeler avec la fonction `library()`.


```r
library("...")
```

Cette étape doit être faite à chaque ouverture de **R**. Cela permet de ne pas mettre en mémoire trop de package simultanément. Il sera ainsi important d'indiquer tous les packages utilisés en début de script sans quoi des erreurs comme l'absence de fonctions seront produites.

Une technique à laquelle l'utilisateur peut avoir recourt lorsqu'il souhaite n'utiliser qu'une fonction spécifique d'un package est l'utilisation des `::` débutant par le nom du package suivi par le nom de la fonction, comme ` MASS::mvrnorm()`. La fonction s'utilise de façon usuelle. En utilisant `::`, il n'est pas nécessaire d'appeler le package avec la fonction `library()`. Il faut toute fois que le package soit bel et bien installer.

## Obtenir de l'aide
En utilisant `help(nom)` ou `?nom`, où il faut remplacer `nom` par le nom d'une fonction ou d'un package, **R** offre de la documentation. Les fonctions d'aide retournent une page de documentation contenant généralement de l'information sur les entrées et les sorties des fonctions. Certaines sont mieux détaillées que d'autres, tout dépendant de leurs créateurs et des personnes qui maintiennent ces fonctions.


```r
# Obtenir de l'aide pour la fonction help()
?help
```

Il existe également la fonction `??nom` qui produit une liste de toutes fonctions **R** ayant partiellement l'inscription introduite à la place de `nom`. Aussi, `example(nom)` produit un exemple d'une fonction.


## Les fonctions

**R** offre une multitude de fonctions et permet également à l'usager de bâtir ses propres fonctions (fonctions maison). Elles permettent d'automatiser des calculs (généralement, mais peut faire beaucoup plus!). Tout au long de cet ouvrage, les fonctions seront identifiées par l'ajout de parenthèse à leur fin, comme ceci : `function()`. Ces fonctions ont généralement la forme suivante.


```r
nom <- function(argument1, argument2, ...) {
  # Calcul à réaliser
}
```

Ici, `nom` est le nom auquel la fonction sera référée par la suite, `function` est la fonction **R** qui permet de créer la fonction maison, `argument1` et `argument2` sont les arguments (les entrées) fournis à la fonction et à partir desquels les calculs seront réalisés, et les accolades `{}` définissent le début et la fin de la fonction dans le script.

Il sera bien utile de créer ses propres fonctions bien que **R** possède une pléthore de fonctions et de packages en contenant encore plus. Toutes les fonctions, qu'elles soient maisons ou déjà intégrées, respectent le même fonctionnement, ce pour quoi il est utile de s'y pencher. Les fonctions maison permettront d'automatiser certains calculs qui seront propres à résoudre les problèmes de l'usager et d'être réutilisé ultérieurement.

Voici un exemple trivial de fonction. Ici la somme de deux nombres.


```r
addition <- function(a, b) {
  a + b
}
addition(2,3)
> [1] 5
```

Par défaut, une fonction retourne la dernière ligne calculée si elle n'est pas assignée à une variable. Si le résultat d'une fonction est assigné, la fonction ne retourne pas le résultat dans la console, mais assigne bel et bien la variable.


```r
addition2 <- function(a, b) {
  # Le résultat est assigné à une variable
  somme <- a + b
}

# Ne produit pas de sortie
addition2(100, 241)

# Comme il y a assignation, total n'est pas affichée
total <- addition2(100, 241)

# En roulant total, la sortie affiche bien la sortie de addition2()
total
> [1] 341
```

Afin d'éviter ces problèmes ou s'il fallait retourner plusieurs arguments (ce qui sera souvent le cas!), il faudrait utiliser la fonction `return()` à la fin de la fonction.


```r
addition3 <- function(a, b) {
  # Le résultat est assigné à une variable
  somme <- a + b
  return(somme)
}

# Les deux fonctions produisent une sortie
addition3(4, 6)
> [1] 10
total <- addition3(4, 6)
total
> [1] 10
```

## Définir une boucle

Pour automatiser certains calculer, il peut être utile de recourir à une boucle (*loop*) qui pourra répéter plusieurs fois une même opération. Voici l'anatomie d'une boucle.


```r
for(i in vec){
  # Calcul désiré
}
```
L'élément `for` est la fonction déclarant la boucle. Les renseignements sur les itérations se retrouvent entre les parenthèses. La variable `i` prendra successivement tous les éléments dans (`in`) le vecteur à gauche (`vec`). Tout le contenu de la boucle (ce qui sera répété) se retrouve entre les accolades `{}`, c'est ce qui sera produit à chaque boucle. Dans cet exemple, la boucle se répète $k$ fois, soit de $1,2,3,...,k$, à cause de l'expression `1:k` qui correspond à générer un vecteur de $1$ à $k$. La variable `i` quant à elle change de valeur à chaque itération. Elle prendra tour à tour ces valeurs chaque itération $1,2,3,...,k$. La variable pourra judicieusement être utilisée dans la boucle afin de profiter ce comportement, notamment pour le classement des résultats. Lorsque la boucle atteint $k$, elle se termine.

Il est aussi possible de rédiger la boucle en utilisant uniquement `k`. Alors, `i` prendra toutes les valeurs contenues dans `k`. La longueur du vecteur `k` définit le nombre d'itérations.


```r
for(i in k){
  # Calcul désiré
}
```

## Les clauses conditionnelles

Pour réaliser des opérations sous certaines conditions ou opérer des décisions automatiques, il est possible d'utiliser des arguments conditionnels avec des opérateurs logiques. Par exemple, sélectionner des unités ayant certaines caractéristiques, comme les participants ayant 18 ans et moins, les personnes ayant un trouble du spectre de l'autiste, ou encore par sexe. Il est aussi possible d'utiliser les opérateurs pour définir à quelle condition telle ou telle autre fonction doit être utilisée. Il faudra alors utiliser les arguments logiques.

<table class=" lightable-classic table" style='font-family: "Arial Narrow", "Source Sans Pro", sans-serif; width: auto !important; margin-left: auto; margin-right: auto; margin-left: auto; margin-right: auto;'>
<caption>(\#tab:unnamed-chunk-28)Symboles logiques et leur signification</caption>
 <thead>
  <tr>
   <th style="text-align:center;"> Symbole </th>
   <th style="text-align:center;"> Signification </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:center;"> == </td>
   <td style="text-align:center;"> est égale à </td>
  </tr>
  <tr>
   <td style="text-align:center;"> != </td>
   <td style="text-align:center;"> n'est pas égale à </td>
  </tr>
  <tr>
   <td style="text-align:center;"> &lt; </td>
   <td style="text-align:center;"> plus petit que </td>
  </tr>
  <tr>
   <td style="text-align:center;"> &gt; </td>
   <td style="text-align:center;"> plus grand que </td>
  </tr>
  <tr>
   <td style="text-align:center;"> &lt;= </td>
   <td style="text-align:center;"> plus petit ou égale </td>
  </tr>
  <tr>
   <td style="text-align:center;"> &gt;= </td>
   <td style="text-align:center;"> plus grand ou égale </td>
  </tr>
  <tr>
   <td style="text-align:center;"> &amp;&amp; </td>
   <td style="text-align:center;"> et </td>
  </tr>
  <tr>
   <td style="text-align:center;"> || </td>
   <td style="text-align:center;"> ou </td>
  </tr>
</tbody>
</table>

**R** teste si les valeurs de la variable correspondent à l'opérateur logique en les déclarant comme vraies (`TRUE`) ou fausses (`FALSE`).


```r
valeurs <- 1:6
# Toutes les valeurs plus grandes que 3.
valeurs > 3
> [1] FALSE FALSE FALSE  TRUE  TRUE  TRUE
```

Cela peut être utilisé pour référer à des sous-éléments comme abordés précédemment.


```r
# Toutes les valeurs plus grandes que 3.
valeurs[valeurs > 3]
> [1] 4 5 6
```

Ici, toutes les valeurs vraies de l'opérateur logique sont rapportées.

Les opérateurs logiques servent également à définir des opérations conditionnelles. La fonction `if` sera alors utilisée. Il y a trois principales formes : `if` (Si ceci, alors cela), le `if  else` (Si ceci, alors cela, sinon autre chose) et les échelles `if else if else`.


```r
if(x){
  # Opération désirée
}
```

L'anatomie d'une fonction `if` comporte d'abord la fonction `if`. L'argument entre parenthèses à sa plus simple expression doit être vérifié par vrai (`TRUE`) ou faux (`FALSE`). Si l'argument est vrai, alors le calcul désiré est réalisé, autrement le logiciel ignore le calcul de la fonction entre accolades `{}`.


```r
x <- -2
if(x < 0){
  print("la valeur est négative")
}
> [1] "la valeur est négative"
```

Il est possible d'élaborer cette logique avec la fonction `else` qui permet de spécifier une suite à la fonction si l'argument est faux (`FALSE`).


```r
x <- 2
if(x < 0){
  print("la valeur est négative")
}else{
  print("la valeur est positive")
}
> [1] "la valeur est positive"
```

Enfin, il est possible d'élaborer un arbre de décision avec toute une échelle de conditionnels.


```r
x <- 0
if(x < 0){
  print("la valeur est négative")
}else if(x > 0){
  print("la valeur est positive")
}else{
  print("la valeur est égale à 0")
}
> [1] "la valeur est égale à 0"
```

L'arbre de décision peut devenir aussi compliqué que l'utilisateur le désire : chacune des branches peut contenir autant de ramifications que nécessaire.

Il peut arriver pour certaines fonctions de devoir spécifier si certains paramètres sont vrais (`TRUE`) ou faux (`FALSE`) ou de définir des variables ayant ces valeurs. Lorsque c'est le cas, il est toujours recommandé d'écrire les valeurs logiques tout au long comme `TRUE` et `FALSE`, même si **R** reconnaît `T` et `F`, car ces dernières peuvent être réassignées, contrairement aux premières.


## En cas de pépins

Il arrive parfois que le code utilisé ne fonctionne pas, que des erreurs se produisent ou que des fonctions fort utiles demeurent inconnues. Même après plusieurs années d'utilisation, les utilisateurs font encore quotidiennement des erreurs (au moins une!). Un excellent outil est d'utiliser un moteur de recherche dans un fureteur de prédilection, de poser une question à l'aide de quelques mots clés bien choisis, préférablement en anglais, et en y inscrivant "with R" ou "in R" ou "R". La plupart du temps, les programmeurs de packages auront une solution sur leur site ou leurs instructions de packages. Il y a aussi des plateformes publiques et en ligne, comme [StackOverflow](https://stackoverflow.com/) qui collectent questions et réponses sur le codage. D'autres utilisateurs peuvent avoir posé la même question et des auteurs de programmes R et d'autres usagers y auront répondu aux bénéfices de tous. Dans le cas d'une solution introuvable, ces mêmes plateformes permettent de poser de nouvelles questions.  Il faudra toutefois attendre qu'un usager plus expérimenté prenne le temps d'y répondre.
