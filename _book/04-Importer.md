# (PART) Jeux de données {-}

# Importer

Réaliser des analyses statistiques et des représentations graphiques nécessitent un jeu de données sur lequel travailler. Après l'ouverture de **R**, l'usager remarquera aisément que le logiciel n'est pas un tableur (tableau de données), contrairement aux logiciels traditionnels. Cette caractéristique l'a peut-être même frappé à la première ouverture! Pour utiliser données, il faudra les conserver dans un fichier externe de la même façon qu'un script, à l'exception qu'il faudra importer les données pour son utilisation.

Un jeu de données porte généralement les extensions ".Rdata", lorsqu'elles proviennent de **R**, ou d'extensions ".dat" et ".txt". Évidemment, **R** permet une grande flexibilité, il est ainsi possible d'exporter et d'importer dans d'autres extensions. Les extensions ".Rdata" sont des environnements **R**, elles contiennent potentiellement plusieurs variables, comme une séance de travail complète. Elles ont aussi l'avantage que, si l'utilisateur double-clique sur un fichier d'extension ".Rdata", celui-ci s'ouvre automatiquement dans l'environnement **R**.

Il est recommandé de ne jamais manipuler les fichiers de données une fois toutes les vérifications réalisées (absence d'erreur dans les données). Il ne sera jamais nécessaire de modifier ces fichiers avec **R**. Contrairement aux logiciels traditionnels dans lesquels les modifications sont apportées directement aux valeurs ou ajoutées aux fichiers, cela n'est pas nécessaire dans la mesure où les syntaxes décrivant ces manipulations sont conservées. Il devient impossible d'endommager, de corrompre ou d'altérer le fichier de données. Les données originales restent intactes. Il suffit de les importer puis de commander la syntaxe qui lui est associée pour obtenir de nouveau la version *propre* du jeu de données.

## Jeux de données provenant de **R** et de packages

Plusieurs packages offrent en plus des fonctions des jeux de données. Mieux encore! **R** offre des jeux de données inclus avec le logiciel. La fonction `data()` permet de voir la liste des jeux de données disponibles. Taper simplement le nom du jeu de données permet de l'utiliser, comme s'il avait été déclaré auparavant.


```r
head(cars)
>   speed dist
> 1     4    2
> 2     4   10
> 3     7    4
> 4     7   22
> 5     8   16
> 6     9   10
```
La fonction `head()` introduite ici donne simplement un aperçu des six premières lignes du jeu de données pour ne pas afficher le jeu de données complet (ce qui prendrait beaucoup d'espace inutilement.

Pour consulter tous les jeux de données des packages importés, il est possible d'utiliser cette ligne de code.

```r
data(package = .packages((all.available = TRUE)))
```
Pour utiliser ces jeux, il faut rendre actif le package associé avec la fonction `library()`.

## Création des jeux de données artificielles

TODO

Une façon rudimentaire et efficace d'obtenir des données avec **R** est de les créer à l'aide des fonctions génératrices de données pseudoaléatoires.


```r
# Pour la reproductibilité
set.seed(142)
# Nombre d'unité
n <- 30
# Identifiant
id <- 1:n

# Variables
sexe <- rbinom(n, size = 1, prob = .5)
QI <-  round(rnorm(30, mean = 100, sd = 15) - 5 * sexe)
# Être "1" soustrait  5 points au QI en moyenne
# Arrondi avec round()

# Création de le jeu de donnees
donnees <-  data.frame(id = id, sexe = sexe, QI = QI)
# Enregistrement
save(donnees, file = "donnees.Rdata")
```

Et voilà un jeu de données simple et sauvegardé dans le dossier de travail auquel il sera possible de se référer.

Ici, deux nouvelles fonctions sont employées : `round()` arrondie les valeurs à l'unité et `data.frame()` crée un le jeu de données. L'utilisation des `=` permet de directement nommer les variables.

## Exporter

### Exporter de IBM SPSS

Il est possible d'importer des données de IBM SPSS vers **R**. il faudra quelques manipulations préalables. En ayant le fichier de données IBM SPSS ouvert, il faut cliquer sur "Enregistrer sous" sous le menu déroulant "Fichier". Par défaut, IBM SPSS choisira toutes les variables, mais il est possible de sélectionner seulement les variables d'intérêt en décochant les variables qu'il n'est pas nécessaire de conserver. Ensuite, sélectionner le type de fichier de sauvegarde doit être "Tabulé (*.dat)". IBM SPSS offre également la possibilité d'enregistrer les noms de variables (première option à cocher) et les libellés de valeur. Il suffit maintenant de nommer le fichier et de cliquer sur l'onglet "Enregister".

En s'assurant que nouveau fichier se trouve dans le répertoire actif de **R**, il suffit de télécharger le fichier.

```r
read.table(file = "donnees.tab", header = TRUE)
```
L'option `header` devrait être `FALSE` si les noms de variables n'ont pas été conservés (première ligne du fichier) .

### Exporter de Microsoft Excel

Fichier sous le menu déroulant. Sélectionner comme type de fichier "Texte Unicode (*.txt)". Intituler le fichier, puis cliquer sur "Enregister".

Microsoft Excel sauvegardera l'entièreté de la page active. Il est donc pertinent de créer une feuille Microsoft Excel contenant que les informations à conserver.

Par la suite, en s'assurant que nouveau fichier se trouve dans le répertoire actif de **R**, il suffit de télécharger le fichier avec `read.table()` et les arguments convenant au jeu de données.

## Importer de **R**

Dans la plupart des situations, les analyses et les graphiques seront réalisés à partir d'un jeu de données se trouvant dans un fichier. Ce devra être importé en **R** pour être manipulé. Les jeux de données peuvent se trouver dans un fichier dans l'ordinateur, mais aussi sur le web. Ils peuvent être en différents types de format.

Pour la description de l'importation, l'ouvrage tient pour acquis que le fichier de données se retrouve dans le directoire de travail (ce qui est l'idéal en général). Un peu plus loin, la création de trajectoires pour différents emplacements sera présentée.

Les fonctions de base permettront d'importer la plupart des jeux de données, particulièrement s'ils ont été exportés dans un format compatible. Pour le cas où ces fichiers ne pourraient être exportés de cette façon, des packages pallieront ce besoin. Dans cet ouvrage, seule une présentation sommaire de ces options sera discutée, l'utilisateur est recommandé à la documentation de ces packages pour plus d'informations.

La prochaine section décrit les fonctions pour importer les bases de données "manuellement". En plus de ces méthodes, **R**Studio possède une interface permettant l'importation des données.

## La fonction de base

La fonction de base `read.table()` permettra d'importer la plupart des jeux de données. C'est d'ailleurs ce qui a été présenté sommairement dans le chapitre sur les rudiments. Parfois, ceux-ci ont certaines caractéristiques qu'il faudra préciser comme argument à la fonction `read.table()` pour assurer une importation adéquate. Ces caractéristiques sont `header = FALSE`, `sep = ""`, et `fill = !blank.lines.skip` (les éléments à droite sont les options par défaut).

Parfois, certains fichiers sauvegardent le nom des variables en tête de colonne (première ligne). Par défaut, **R** assume qu'il s'agit de valeurs. L'argument `header = TRUE` ajouté à `read.table()` précisera à **R** lors de l'important que ces libellés sont des noms de colonnes. 

Si un autre symbole est utilisé pour délimiter (séparer) des valeurs dans le fichier, comme `;`ou `,`, l'argument `sep = ";"` ou `sep = ","` précisera le séparateur. 

Si les lignes du fichier sont de tailles inégales, **R** assumera qu'il s'agit de valeur, et ces *blancs* de texte seront ajoutés comme valeurs (`""`). Pour gérer cette situation, l'argument `fill = FALSE` devrait régler la situation.

## Fichiers d'extension .txt

Un fichier d'extension `.txt` est un fichier texte délimité par des tabulations (*tab-delimited text files*) et est importé à l'aide de la fonction `read.table()`.


```r
jd = read.table("fichier.txt")
```

## Fichiers d'extension .dat

Un fichier d'extension `.dat` est un fichier générique de données et est importé à l'aide de la fonction `read.table()`.


```r
jd = read.table("fichier.dat")
```

## Fichiers d'extension .csv

Un fichier d'extension .csv use généralement de séparateur comme `";"` (lorsque le système numérique de la langue d'origine utilise la virgule - comme le français par exemple) ou `","` (pour les autres langues qui n'utilise pas la virgule) et ont généralement les noms de variables en première ligne. Ainsi, la fonction `read.table()` est utilisable pourvu que le séparateur soit précisé et la présence d'en-tête également.

```r
jd = read.table("fichier.csv", sep = ";", header = TRUE)
```

Il existe aussi la fonction `read.csv()` et `read.csv2()` pour importer des fichiers d'extension `.csv`. Il s'agit exactement de `read.table()` à l'exception des arguments par défaut, mais précisant par défaut `header = TRUE` et `fill = TRUE` et détecte s'il s'agit de `";"` ou `","`.

## Fichiers délimités

Pour les fichiers recourant à un autre caractère qu'une tabulation, qu'une `","`, ou un `";"` pour délimiter les valeurs, spécifier le caractère dans `read.table()` importera le fichier.


```r
jd = read.table("fichier.txt", sep = "$")
```

Comme pour `read.csv()` et `read.csv2()`, les fonctions `read.delim()` et `read.delim()` pourraient être utilisées.

## Fichiers d'extension .sav, .dta, .syd et .mtp

Comme le lecteur s'en doute peut-être, **R** de base ne permet pas d'importer des fichiers spécifiques d'autres logiciels. Par contre, avec les années se sont développés des packages permettant de pallier la situation. Le package `foreign` permet d'importer des fichiers issus de IBM SPSS (`.sav`), Stata (`.dta`) et Systat (`.syd`) et Minitab (`mtp`) avec, respectivement les fonctions `read.spss()`, `read.data()`, `read.systat()` et `read.mtp()`. La logique d'importation est la même pour ces quatre fonctions.

Pour `read.spss()`, deux arguments sont importants à souligner. Par défaut, la fonctionne ne retourne pas un *data frame* et utilise les libellés de valeurs (*value labels*). Dans la plupart des cas, l'utilisateur désire probablement obtenir un jeu de données de type *data.frame* et les valeurs sous-jacentes au libellés de valeurs. L'utilisateur  peut alors changer ces arguments `to.data.frame = TRUE` (par défaut `FALSE`) et `use.value.labels = FALSE`(par défaut `TRUE`).                                                                                                               

```r
library(foreign)

# SPSS
jd = read.spss("fichier.sav",to.data.frame = TRUE,use.value.labels = FALSE)

# Stata
jd = read.dta("fichier.dta")

# Systat
jd = read.systat("fichier.syd") 

# Minitab
jd = read.mtp("fichier.mtp")
```
  
Consulter la documentation du package pour plus d'informations sur les options possibles.

## Fichiers d'extension .xls et xlsx

Il n'existe pas de fonction de base pour importer des fichiers Microsoft Excel (extensions `.xls` et `.xlsx`). Par contre, il existe plusieurs packages qui permettront de la faire, comme `readxl`. Le package `readlxl` permet d'utiliser la fonction `read_excel()` pour importer le fichier.


```r
#Excel
library(readxl)
jd = read_excel("fichier.xls")
```

La fonction `read_excel()` possède un argument `sheet = ` qui permet de préciser la feuille qu'il faut importer ou `range = ` (p. ex. `range = A1:B20` qui permet d'importer un rectangle de plage de données (du coin supérieur gauche `A1` au coin inférieur droit `B20`). 
Consulter la documentation du package pour plus d'informations sur les options possibles.

## Fichiers d'extension .html

Il n'existe pas de fonction de base pour importer des fichiers d'extension .html, (HTML, *HyperText Markup Language*). Le package `XML` fournit une solution possible avec la fonction `readHMTLTable()`.


```r
#HTML
library(XML)
jd = readHMTLTable("fichier.html")
```

Consulter la documentation du package pour plus d'informations sur les options possibles.

## Fichiers d'extension .json

Il n'existe pas de fonction de base pour importer des fichiers d'extension .json, (*JavaScript Object Notation*). Comme le lecteur pourra s'y attendre, il existe un package pour rectifier la situation : le package `rjson` et sa fonction `fromJSON()`.


```r
#JSON
library(rjson)
jd = fromJSON("fichier.json")
```

Consulter la documentation du package pour plus d'informations sur les options possibles.

## Fichiers d'extension .sas7bdat

Il n'existe pas de fonction de base pour importer des fichiers d'extension `.sas7bdat`, (*Statistical Analysis System*).  Il existe le package `sas7bdat` pour importer des données de SAS vers **R** avec la fonction `read.sas7bdat()`.


```r
# SAS
library(sas7bdat)
jd = read.sas7bdat("fichier.sas7dbat")
```

Consulter la documentation du package pour plus d'informations sur les options possibles.

## Emplacement du jeu de données

Idéalement, le fichier contenant le jeu de données sera déjà dans le directoire de travail (ou dan le projet R en cours). Dans ce contexte, référer seulement au nom du fichier suffira.


```r
jd = read.table("fichier.txt")
```

Si le jeu de données est sur le web, il peut être importé en précisant l'URL.


```r
jd = read.table("https://site/ou/trouver/le/fichier.txt")
```

S'il est plutôt dans un fichier sur l'ordinateur, mais pas dans le directoire de travail, ce sera essentiellement la même méthode.


```r
jd = read.table("C:/site/ou/trouver/le/fichier.txt")
```

Si l'utilisateur ne connaît pas exactement la trajectoire, il peut se résoudre à passer par l'explorateur de fichiers (Windows ou Apple) pour déterminer l'emplacement du fichier de jeu de données. Il faut alors utiliser la fonction `file.choose()` sans aucun argument à l'intérieur de la fonction d'importation.


```r
jd = read.table(file.choose())
```

L'utilisateur devra alors identifier manuellement (pointer et cliquer) où se trouve le fichier. Il devra se promener de fichier en fichier jusqu'à ce qu'il arrive au bon jeu de données, un peu comme le font les logiciels traditionnels lorsque l'utilisateur souhaite sauvegarder un fichier à un certain endroit.

## Importation avec **R**Studio

**R**Studio offre une interface simple pour télécharger directement un jeu de de données IBM SPSS, Microsoft Excel, SAS, STATA, et des extensions ".txt" et ".readr". Il y a même un outil de visualisation pour s'assurer que le tout est en ordre. Pour procéder, il faut faire *File > Import dataset > From "format de fichier* où "format de fichier" remplace Text, SPSS, Excel et les autres. Il suffit de suivre les instructions. En indiquant le chemin du fichier, **R** importera le fichier et fournira une syntaxe afin de reproduire l'importation pour de futurs usages.

## Conseils d'importation

Parfois des valeurs s'ajoutent lors de l'exportation ou l'importation des données. Des logiciels traditionnels font parfois ce mauvais tour. Une vérification de la base de données est par conséquent impérative, surtout lors de la première utilisation du jeu de données. Deux méthodes de vérification sont suggérées. D'abord ouvrir le fichier avec un éditeur de texte de base, comme bloc-notes, pour s'assurer qu'aucun caractère ne s'est indésirable ajouté à l'insu de l'utilisateur. Ensuite, voir avec la fonction `View()` dans **R** si la base de données s'affiche correctement et que les variables, et lignes semblent correspondre à ce qui est attendu.


## Voir la base de données

Il est possible de voir les données en utilisant la fonction `View()` et en y insérant le nom de la variable. Le logiciel afficher un tableur avec les données, dont il sera impossible de modifier les valeurs. Cela peut être utile pour s'assurer que le jeu de données est en ordre, bien importé, ou le consulter.

## Sauvegarder un jeu de données

Si un jeu de données est directement créé avec **R**, par exemple, les jeux de données artificiels, il est possible de les sauvegarder avec la fonction `save()` qui enregistre une variable dans un fichier.


```r
save("variable", file = "fichier.Rdata")
```

Il est possible à la fin d'une session de travail de sauvegarder l'environnement dans un fichier `save.image()`. Ainsi, toutes les variables et fonctions maison sont conservées pour une future utilisation.


```r
save.image(file = "SessionTravail.Rdata")
```

## Quelques conseils de gestion

Voici quelques conseils pour la gestion le jeu de données.

* Éviter les noms trop longs ou trop courts et dépourvus de signification. Cela augmente le risque d'erreur. L'utilisation de huit caractères ou moins est une bonne recommandation (quoique ce n'est pas une règle!). Pour conserver plus de renseignements, utiliser les commentaires de la syntaxe.

* Éviter les espaces entre les mots. Cela peut être interprété erronément comme deux éléments. À la place, collez les mots et distinguer-les avec des majuscules (MaFonction), utiliser le tiret bas (ma_fonction) ou un point (ma.fonction).

* Éviter les espaces ou les vides dans les données. Cela peut être interprété comme des données (absentes) ou non.

* Éviter les symboles suivants `?, $, %, ^, &, *, (, ), -, #, ?, , , <, >, /, |, \, [, ], {` et `}` qui peuvent erronément être interprétés comme de la syntaxe autant dans les noms de variables que dans les données.

* Vérifier que les valeurs manquantes sont identifiées `NA`.

* Si les données proviennent d'un autre logiciel, vérifier la présence de  commentaires qui pourraient occasionner des lignes ou colonnes supplémentaires et ainsi corrompre le jeu de données.

* Vérifier que l'exportation et l'importation se sont bien déroulées.
