

# Manipuler

Avec **R**, il ne faut jamais manipuler directement le fichier contenant les données. **Cette pratique est déconseillée**. Il vaut mieux préserver le fichier original intact, ce qui évite de nombreuses complications liées à la compatibilité entre les versions, la reproductibilité des analyses et la maintenance des fichiers. Toutes les manipulations doivent être conservées dans un fichier script. Cela favorise le suivi des modifications apportées en comparant tout simplement les traces dans les syntaxes, mais aussi le partage entre collègues. 

En pratique, l'expérimentateur aura le jeu de données officiel (final) avec lequel travailler. Il doit l'[importer] à chaque début de séance. Par la suite, il ne lui reste qu'à mettre en place le nettoyage et la préparation du jeu de données ou bien, si cela est déjà fait, de rouler les scripts des séances précédentes, ce qui se fait facilement en quelques cliques. 

Il existe plusieurs méthodes pour gérer des données; il ne faut pas s'étonner de voir d'autres ouvrages aborder la gestion de données d'une autre façon. Au final, la meilleure méthode est celle qui m'est l'utilisateur à son aise.

Dans la première section, les manipulations rudimentaires d'un jeu de données sont expliquées. Dans la seconde section, la philosophie `tidyverse` est présentée, car elle permet une manipulation assez intuitive des jeux de données^[Le présent ouvrage tente de montrer une approche intuitive et simple, mais il ne faut pas en faire un dogme. La manipulation *traditionnelle* ou d'autres philosophies existent également].

## Manipulation de données

Les tableaux ont généralement deux dimensions (lignes par colonnes). Différents éléments ou groupes d'éléments peuvent être extraits des jeux de données. Plusieurs méthodes peuvent être utilisées en fonction des besoins. Le jeu de données `cars` (disponible avec **R**) sera utilisé à des fins illustratives.


``` r
head(cars)
>   speed dist
> 1     4    2
> 2     4   10
> 3     7    4
> 4     7   22
> 5     8   16
> 6     9   10
```

Le jeu de données contient 50 unités d'observation (lignes) et deux variables (colonnes), soit la vitesse (*speed*) et la distance (*dist*).

### Référer à une variable dans un jeu de données

Il est possible de référer à une variable soit en utilisant l'emplacement de la variable par rapport aux autres en utilisant les crochets ou en utilisant le signe `$` puis le nom de la variable après le libellé de le jeu de données. L'opération est fort simple avec le symbole `$`.


``` r
# Avec $
head(cars$dist)
> [1]  2 10  4 22 16 10
```

Précédemment utilisés pour extraire des valeurs dans une variable unidimensionnelle (voir [Référer à des sous-éléments]), les `[]` peuvent extraire des données sur un tableau en deux dimensions (ligne par colonne). Entre crochets, il faut spécifier la ou les lignes désirées, puis la ou les colonnes désirées. Laissez une des dimensions en blanc (vide) indique au logiciel de rapporter toutes les valeurs. Par exemple, pour obtenir le même résultat que la syntaxe précédente, soit obtenir `dist` de la deuxième colonne, il faut référer entre crochets à la colonne $2$. Comme toutes les lignes sont désirées, la dimension des lignes reste vide.


``` r
# Entre crochets
head(cars[,2])
> [1]  2 10  4 22 16 10
```

Il est possible de faire la même chose avec les lignes.


``` r
# Entre crochets
cars[4,]
>   speed dist
> 4     7   22
```
Ici, toutes les variables de la 4^e^ unité sont rapportée. Remarquer bien l'absence d'argument après la virgule. La fonction `head()` n'est pas nécessaire ici, car il y a peu d'informations à extraire.

Si certaines valeurs spécifiques étaient désirées, comme la valeur de la 4^e^ unité pour la 2^e^ variable.


``` r
# Entre crochets
cars[4, 2]
> [1] 22
```

Enfin, à l'intérieur d'un jeu de données, les variables peuvent être commandées avec le signe de `$` placé après le nom de la variable suivi du nom de la variable ou encore en identifiant les noms de variables entre crochets.


``` r
# Utilisation du signe $
head(cars$speed)
> [1] 4 4 7 7 8 9

# Nommer entre crochets
head(cars["speed"])
>   speed
> 1     4
> 2     4
> 3     7
> 4     7
> 5     8
> 6     9
```


### Référer à un sous-ensemble d'unité

Pour référer à des unités ayant certaines caractéristiques, la fonction `subset()` peut s'avérer utile. Les arguments sont un jeu de données, le deuxième est un opérateur logique (voir [Les clauses conditionnelles]) en lien avec une variable du jeu de données.


``` r
# Extraire les données pour toutes les unités ayant une vitesse égale à 24
subset(cars, speed == 24)
>    speed dist
> 46    24   70
> 47    24   92
> 48    24   93
> 49    24  120
```

Cette fonction est utile s'il faut extraire les données d'un certain sexe ou les participants plus jeune ou plus vieux qu'un certain âge, par exemple.

### Nommer des variables dans un jeu de données

Il est possible d'attribuer ou de modifier des noms à des colonnes ou des lignes d'un tableau de données. Les fonctions `colnames()` et `rownames()` sont alors utilisées. Contrairement aux autres fonctions, celles-ci se retrouvent à gauche de l'équation.


``` r
colnames(cars) <-  c("vitesse", "distance")
head(cars)
>   vitesse distance
> 1       4        2
> 2       4       10
> 3       7        4
> 4       7       22
> 5       8       16
> 6       9       10
```
Il importe de fournir autant de noms qu'il y a de colonnes (ou lignes), et ce, en chaîne de caractères.

### Données manquantes

Les devis de recherche et les jeux de données empiriques sont rarement parfaits et peuvent souvent contenir des données manquantes. **R** reconnaît les données manquantes lorsqu'elles sont identifiées comme `NA` (*not available*). Plusieurs méthodes permettent de gérer les données manquantes. La méthode la plus simple est d'éliminer les unités ayant une donnée manquante, soit la suppression par liste (*listwise suppression*). Les fonctions natives de **R** recourrent à l'argument `na.rm = TRUE`. Si cela est impossible, la fonction `na.omit()` permet de créer des jeux de données sans les valeurs manquantes. Certaines fonctions, comme `mean()` ont des arguments pour gérer les données manquantes.


``` r
# Un vecteur
valeurs <-  c(10, 12, 14, NA, 18)

# La présence de NA empêche la moyenne d'être calculée
mean(valeurs)
> [1] NA

# L'argument "na.rm = TRUE" gère les NA
mean(valeurs, na.rm = TRUE)
> [1] 13.5

# na.omit omet les valeurs NA dans la nouvelle variable.
valeurs.nettoyees <-  na.omit(valeurs)
mean(valeurs.nettoyees)
> [1] 13.5
```

## Le tidyverse

Le nom *tidyverse* [@tidy] est une contraction de *tidy* (bien rangé) et de *universe*. Le *tidyverse* est fondé sur le concept de *tidy data*, développé par Hadley [@Wickham14]. Il repose sur une philosophie d'organisation des données facilitant la gestion, la préparation et le nettoyage préalable aux analyses quantitatives.

Plusieurs packages respectent cette philosophie et font partie intégrante du *tidyverse*, comme `ggplot2` (présentation graphique), `dplyr` (manipulation de données), `readr` (importation de données), `tibble` (nouvelle catégorie de *data frame*), mais bien d'autres également. Ces packages sont tous chargés simultanément avec le package `tidyverse`.

Pour utiliser le package `tidyverse`, il faut d'abord l'installer puis l'appeler.


``` r
# Installer le package
install.packages("tidyverse")

# Rendre le package accessible
library(tidyverse)
```

### Les fonctions utiles

Un des avantages et originalité d'utiliser le `tidyverse` est d'obtenir l'opérateur `%>%` (appelée *pipe* en anglais que l'on peut traduire par *tuyau*) qui provient originellement du package `magrittr` [@magri] et est importé par `dplyr`. L'opérateur favorise la lisibilité et la productivité, car il est plus facile de suivre le flux de plusieurs fonctions à travers ces *tuyaux* que de revenir en arrière lorsque plusieurs fonctions sont imbriquées. En fait, il favorise la lecture par verbes, soit par action (fonction), dans une séquence temporelle intuitive. Si les arguments sont placés en une seule ligne, non seulement la ligne est-elle longue et complexe, voire illisible, mais, en plus, les éléments les plus à gauche (les premiers à la lecture) sont les derniers opérés. Si chacune des fonctions était en ligne, alors il faudrait écraser ou créer des variables temporaires inutiles tout simplement pour arriver à réaliser les fonctions. La philosophie `tidyverse`, par l'usage de `%>%`, évite tous ses problèmes.

L'opérateur `%>%` s'ajoute à la fin d'une ligne syntaxe. Son fonctionnement se traduit par l'argument de la ligne à gauche est introduit dans la fonction de droite, et ce, du haut vers le bas. Il peut être commandé plus rapidement avec le raccourci **Ctrl + Shift + M** sur Windows ou  **Cmd + Shift + M** sur Mac. En plus de l'opérateur `%>%` , `dplyr` offre de nouvelles fonctions pour gérer un jeu de données. Quelques-unes des plus importantes sont décrites ici. Par la suite, une mise en situation permet de mieux comprendre leur fonctionnement.

#### Sélectionner des variables

Pour sélectionner des données d'un très grand jeu de données, la fonction `select()` permet de choisir les variables à conserver. Pour utiliser la fonction, il suffit d'indiquer les variables par leur nom de colonne dans la fonction. Aucun besoin de guillemets anglophones. 


#### Sélectionner des participants

Pour filtrer les participants selon les caractéristiques désirées, la fonction `filter()` permet de sélectionner les unités satisfaisant les conditions spécifiées. Pour utiliser la fonction, il faut indiquer le ou les arguments conditionnels à respecter et sur quelle variable.

Voici quelques exemples en rafales à partir du [Jeux de données provenant de **R** et de packages][jeu de données] `cars`.


``` r
data("cars",cars)
```


Pour filtrer en fonction d'une valeur plus petite `<` (inclusivement avec `<=`) ou plus grande `>` (inclusivement avec `>=`) ou égale `==`.


``` r
# Plus petit que
cars %>% 
  filter(speed < 9)
>   speed dist
> 1     4    2
> 2     4   10
> 3     7    4
> 4     7   22
> 5     8   16

# Plus petit ou égale à 
cars %>% 
  filter(speed <= 9)
>   speed dist
> 1     4    2
> 2     4   10
> 3     7    4
> 4     7   22
> 5     8   16
> 6     9   10

# Égale à
cars %>% 
  filter(speed == 9)
>   speed dist
> 1     9   10
```

Pour les groupes avec une dénomination en chaîne de caractères, on peut faire `== "groupe"` pour choisir un `groupe`. *Les nombres dans les exemples suivant sont entre guillemets anglophones pour rappeler que les noms de groupes sont plus souvent des chaînes de caractères que des nombres.*


``` r
cars %>% 
  filter(speed == "10")
>   speed dist
> 1    10   18
> 2    10   26
> 3    10   34
```

Ou `!= "groupe"` pour exclure un groupe.


``` r
cars %>% 
  filter(speed != "10")
```


```
>   speed dist
> 1     4    2
> 2     4   10
> 3     7    4
> 4     7   22
> 5     8   16
> 6     9   10
```

Ou `%in%  c("groupe1","groupe2")` pour choisir les groupes 1 et 2 (on mettre tous les groupes désirés dans le c)


``` r
# Inclure seulement ces groupes
cars %>% 
  filter(speed %in% c("4","10"))
>   speed dist
> 1     4    2
> 2     4   10
> 3    10   18
> 4    10   26
> 5    10   34
```
Ou enfin, `!( %in% c("groupe1))`.


``` r
# Exclure tous ces groupes
cars %>% 
  filter(!(speed %in% c("4","7","10","11","12","13","14","15","16","17","18","19","20")))
>   speed dist
> 1     8   16
> 2     9   10
> 3    22   66
> 4    23   54
> 5    24   70
> 6    24   92
> 7    24   93
> 8    24  120
> 9    25   85
```

Voir la section [Les clauses conditionnelles] pour plus de détails. Il est possible de faire plusieurs agencements de clauses conditionnelles.



#### Transformer et créer des variables

Pour créer ou transformer des variables, la fonction `mutate()` permettra de créer de nouvelles variables à partir des valeurs déjà dans le jeu de données. Il suffit d'indiquer dans la fonction, le calcul qui doit être opérer. Si la nouvelle variable porte le même nom, alors la colonne du jeu de données sera remplacée.


Dans ce contexte, la fonction `na_if()` peut être utile pour retirer une ou des valeurs aberrantes tout en gardant le participant (la ligne) pour les autres variables.


``` r
cars %>% 
  filter(speed <= 10) %>%         # Utiliser pour raccourcir la sortie
  mutate(speed = na_if(speed, 9))
>   speed dist
> 1     4    2
> 2     4   10
> 3     7    4
> 4     7   22
> 5     8   16
> 6    NA   10
> 7    10   18
> 8    10   26
> 9    10   34
```
Dans cette syntaxe, la valeur 9 (deuxième argument) est remplacée par `NA` dans la variable speed (premier argument) en appliquant `speed = na_if(speed, 9)`.

Si les opérations mathématiques comme la soustraction, division, multiplication, addition, vont de soi avec `mutate()`, il est possible d'utiliser la fonction pour communément *recoder* une variable en utilisant `case_when()`. La fonction prend un argument une série de conditions (à gauche du `~`) et retourne le nouvelle valeur (à droite du `~`). Par exemple, `dist < 5 ~ "Pas loin"`  retourne toutes les valeurs plus petites que 5 (`< 5`) comme `"Pas loin"`. Chaque condition se termine d'une virgule sauf la dernière. Pour identifier toutes autres les conditions non identifiées, dans cet exemple, `dist >= 17` qui n'est pas identifiée, il est possible d'utiliser `TRUE`, qui se traduit par *retourne* **tout les autres valeurs** *comme `trop loin`*. 



``` r
cars %>% 
  filter(speed < 10) %>% 
  mutate(categorie = case_when(dist < 5 ~ "Pas loin",
                               dist < 17 ~ "Assez loin",
                               TRUE ~ "Trop loin"))
>   speed dist  categorie
> 1     4    2   Pas loin
> 2     4   10 Assez loin
> 3     7    4   Pas loin
> 4     7   22  Trop loin
> 5     8   16 Assez loin
> 6     9   10 Assez loin
```

#### Sommariser les informations pertinentes

Pour obtenir des informations sur le jeu de données ainsi créées, la fonction `summarise()` permettra notamment d'obtenir des statistiques d'intérêt. En ajoutant, dans la fonction, les fonctions désirées, comme `mean()` ou `sd()`, avec les variables sur lesquelles elles devraient être opérées ou encore `n()` pour connaître la taille des groupes.

S'il y a des groupes ou des catégories, le sommaire peut être divisé avec la fonction `group_by()` où la variable nominale est spécifiée.

#### Autres fonctions

Il existe plusieurs autres fonctions possibles. Notamment, `slice()` permet de choisir les unités désirées en passant comme argument la base de données et le ou les numéros de ligne; `sample_slice()` qui est très similaire, retourne des lignes aléatoires; `rename()`, similaire à `select()`, permet de renommer les variables; `arrange` reclasse par ordre croissant en fonction d'une variable placée en argument. Et il y en a plusieurs autres.

### Mise en situation

Pour mettre en pratique la philosophie `tidyverse`, voici un exemple tiré du jeu de données `starwars` (disponible du `tidyverse`). Ce jeu de données possède de nombreuses caractéristiques (diversité de variables, de mesures, données manquantes) qui en font un jeu de données similaires à ce qu'un expérimentateur pourrait obtenir.

Sans plus de préliminaire, la fonction `head()` donne un aperçu du jeu de données 


``` r
starwars[,1:6]
> # A tibble: 87 × 6
>    name         height  mass hair_color skin_color eye_color
>    <chr>         <int> <dbl> <chr>      <chr>      <chr>    
>  1 Luke Skywal…    172    77 blond      fair       blue     
>  2 C-3PO           167    75 <NA>       gold       yellow   
>  3 R2-D2            96    32 <NA>       white, bl… red      
>  4 Darth Vader     202   136 none       white      yellow   
>  5 Leia Organa     150    49 brown      light      brown    
>  6 Owen Lars       178   120 brown, gr… light      blue     
>  7 Beru Whites…    165    75 brown      light      blue     
>  8 R5-D4            97    32 <NA>       white, red red      
>  9 Biggs Darkl…    183    84 black      light      brown    
> 10 Obi-Wan Ken…    182    77 auburn, w… fair       blue-gray
> # ℹ 77 more rows
```

Pour obtenir de l'information sur ce jeu de données.


``` r
?starwars
```

Voici la description du jeu de données (traduction libre),

> Les données d'origine, issues de SWAPI, l'API de Star Wars, https://swapi.dev/, ont été révisées pour tenir compte des recherches supplémentaires sur la détermination du genre et du sexe des personnages.

Peu utile comme descripteur, une inspection des données est plus informative. Pour afficher le jeu de données dans un nouvel onglet.


``` r
View(starwars)
```

Le fichier contient, le nom de 87 personnages mesurés sur 14 variables, soit 

* le nom;

* la taille (cm);

* le poids (kg);

* la couleur des cheveux, de la peau et des yeux (trois variables);

* l'année de naissance;

* le sexe biologique (mâle, femelle, hermaphrodite ou aucun);

* le genre;

* la planète natale; 

* l'espèce; 

* une liste de films où le personnage apparaît;

* une liste des véhicules que le personnage a piloté;

* une liste des vaisseaux que le personnage a piloté.

À partir de ce jeu de données, l'objectif de cette mise en situation est de comparer les hommes et les femmes humaines par rapport à leur indice de masse corporelle (IMC) ou *body mass index* (BMI). Le calcul de l'IMC consiste à diviser le poids par la taille au carré (kg/m^2^).

Les étapes à considérer sont les suivantes : sélectionner les variables pertinentes, filtrer en retirant les unités d'espèces non humaines, tenir compte des données manquantes, corriger la taille des unités qui devrait être en mètre et non en centimètre (divisé par 100) et créer l'indice de masse corporelle.


``` r
jd <-  starwars %>% 
  select(sex, mass, height, species) %>% 
  filter(species == "Human") %>% 
  na.omit() %>% 
  mutate(height = height  / 100) %>% 
  mutate(IMC = mass / height^2)  
jd
> # A tibble: 20 × 5
>    sex     mass height species   IMC
>    <chr>  <dbl>  <dbl> <chr>   <dbl>
>  1 male    77     1.72 Human    26.0
>  2 male   136     2.02 Human    33.3
>  3 female  49     1.5  Human    21.8
>  4 male   120     1.78 Human    37.9
>  5 female  75     1.65 Human    27.5
>  6 male    84     1.83 Human    25.1
>  7 male    77     1.82 Human    23.2
>  8 male    84     1.88 Human    23.8
>  9 male    80     1.8  Human    24.7
> 10 male    77     1.7  Human    26.6
> 11 male    75     1.7  Human    26.0
> 12 male    78.2   1.83 Human    23.4
> 13 male    79     1.77 Human    25.2
> 14 male    79     1.75 Human    25.8
> 15 male    89     1.93 Human    23.9
> 16 female  45     1.85 Human    13.1
> 17 male    84     1.88 Human    23.8
> 18 male    80     1.93 Human    21.5
> 19 male    79     1.83 Human    23.6
> 20 male    79     1.88 Human    22.4
```

Les étapes de la syntaxe se lisent comme suit :

* La première ligne `starwars %>% ` indique l'objet sur lequel il faut passer les fonctions subséquentes et la sortie est assignée à `jd`;

* puis, `select(sex, mass, height, species) %>%` indique les variables à conserver pour les fonctions subséquentes;

* puis, `filter(species == "Human")` filtre les unités qui sont humains et passe aux fonctions subséquentes;

* puis, `na.omit() %>%` retire les valeurs manquantes des unités dans le jeu de données et passe aux fonctions subséquentes;

* puis, `mutate(height = height  / 100) %>%`, transforme la variable `height` et passe à la dernière fonction;

* enfin, `mutate(IMC = mass / height^2)` crée la variable d'IMC.

Si une méthode plus traditionnelle avait été utilisée, la syntaxe pourrait ressembler à ceci.


``` r
jd <- starwars[, c("sex", "mass", "height", "species")]  # select()
jd <- jd[jd[, "species"] == "Human",]                    # filter()
jd <- na.omit(jd)                                        # na.omit()
jd[,"height"] <- jd[,"height"] / 100                     # mutate()
jd[,"IMC"] <- jd[,"mass"] / jd[,"height"]^2              # mutate()
jd
> # A tibble: 20 × 5
>    sex     mass height species   IMC
>    <chr>  <dbl>  <dbl> <chr>   <dbl>
>  1 male    77     1.72 Human    26.0
>  2 male   136     2.02 Human    33.3
>  3 female  49     1.5  Human    21.8
>  4 male   120     1.78 Human    37.9
>  5 female  75     1.65 Human    27.5
>  6 male    84     1.83 Human    25.1
>  7 male    77     1.82 Human    23.2
>  8 male    84     1.88 Human    23.8
>  9 male    80     1.8  Human    24.7
> 10 male    77     1.7  Human    26.6
> 11 male    75     1.7  Human    26.0
> 12 male    78.2   1.83 Human    23.4
> 13 male    79     1.77 Human    25.2
> 14 male    79     1.75 Human    25.8
> 15 male    89     1.93 Human    23.9
> 16 female  45     1.85 Human    13.1
> 17 male    84     1.88 Human    23.8
> 18 male    80     1.93 Human    21.5
> 19 male    79     1.83 Human    23.6
> 20 male    79     1.88 Human    22.4
```

Le jeu de données est créé en autant de ligne de syntaxe. Par contre, la lecture n'est pas aussi intuitive que l'opérateur `%>%` et les fonctions `select()`, `filter()`, `mutate()`. Il ne faut pas trop penser à quoi ressemblerait ces manipulations en une seule ligne de syntaxe.



## Décrire et analyser en tidyverse

Une fois le jeu de données prêt, il est possible d'obtenir les informations sommaires. Ici, la moyenne, l'écart type, la valeur minimale, maximale et la taille de chaque sont demandés en fonction du sexe. À cette étape, l'avantage d'embrasser la philosophie `tidyverse` apparaît, en quelques lignes rudimentaires, les cinq statistiques demandées (`mean()`,`sd()`,`min()`,`max()`,`n()`) sont affichées, et ce, par groupes (`group_by()`) l'aide de la fonction `summarise()`.


``` r
jd %>% 
  group_by(sex) %>% 
  summarise(mean(IMC), sd(IMC), min(IMC), max(IMC), n()) 
> # A tibble: 2 × 6
>   sex    `mean(IMC)` `sd(IMC)` `min(IMC)` `max(IMC)` `n()`
>   <chr>        <dbl>     <dbl>      <dbl>      <dbl> <int>
> 1 female        20.8      7.25       13.1       27.5     3
> 2 male          25.7      4.07       21.5       37.9    17
```

Le jeu de données issu de ces opérations peut être utilisé normalement pour réaliser des analyses statistiques. Cela sera abordé dans les prochains chapitres. Il existe toutefois des packages comme `rstatix` avec lequel il est possible de faire des test-$t$ avec `test_t()`, des corrélations avec `cor_test()` et des analyses de variance `anova_test()` tout en demeurant dans le `tidyverse`^[Voir la documentation complète du package pour une vue d'ensemble de ce qu'il est possible d'accomplir avec `rstatix`.].


``` r
library(rstatix)

# Test-t sur l'IMC en fonction du sexe
jd %>% 
  t_test(IMC ~ sex)
> # A tibble: 1 × 8
>   .y.   group1 group2    n1    n2 statistic    df     p
> * <chr> <chr>  <chr>  <int> <int>     <dbl> <dbl> <dbl>
> 1 IMC   female male       3    17     -1.12  2.23 0.368

# Analyse de corrélations
jd %>% 
  select(IMC, mass, height) %>% 
  cor_test() 
> # A tibble: 9 × 8
>   var1   var2     cor statistic         p conf.low conf.high
>   <chr>  <chr>  <dbl>     <dbl>     <dbl>    <dbl>     <dbl>
> 1 IMC    IMC   1        2.85e+8 2.43e-142    1         1    
> 2 IMC    mass  0.84     6.53e+0 3.85e-  6    0.630     0.934
> 3 IMC    heig… 0.0046   1.93e-2 9.85e-  1   -0.439     0.446
> 4 mass   IMC   0.84     6.53e+0 3.85e-  6    0.630     0.934
> 5 mass   mass  1        2.85e+8 2.43e-142    1         1    
> 6 mass   heig… 0.54     2.70e+0 1.48e-  2    0.123     0.791
> 7 height IMC   0.0046   1.93e-2 9.85e-  1   -0.439     0.446
> 8 height mass  0.54     2.70e+0 1.48e-  2    0.123     0.791
> 9 height heig… 1      Inf       0            1         1    
> # ℹ 1 more variable: method <chr>

# Anayse de variances (ANOVA)
jd %>% 
  anova_test(IMC ~ sex) 
> ANOVA Table (type II tests)
> 
>   Effect DFn DFd    F     p p<.05   ges
> 1    sex   1  18 2.89 0.106       0.138
```

Pour le test-$t$ avec `t_test()` et `anova_test()`, il faut demander la variable dépendante à gauche et la variable de groupement à gauche. Les deux variables sont séparées par le `~` (tilde, voir [L'analyse de régression avec **R**] pour plus de renseignements). Pour la corrélation avec `cor_test()`, il faut s'assurer de sélectionner uniquement les variables ayant une échelle continue.

Cela dit, l'utilisateur préférera probablement utiliser d'autres méthodes lorsque des analyses statistiques seront nécessaires.
