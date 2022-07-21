# Importer

Un jeu de données est essentiel pour réaliser des analyses statistiques et des représentations graphiques. Après l'ouverture de **R**, l'usager remarque, stupéfait, que le logiciel n'est pas un tableur (tableau de données), contrairement aux logiciels traditionnels. Cette caractéristique l'a peut-être même frappé à la première ouverture! 

Les jeux de données sont traités de la même façon que les scripts. Il est d'usage de les conserver dans un fichier externe et d'y recourir pendant la séance de travail.

Un jeu de données porte généralement les extensions ".Rdata", lorsqu'elles proviennent de **R**, ou d'extensions ".dat" et ".txt". Évidemment, **R** permet une grande flexibilité, il est ainsi possible d'exporter et d'importer dans d'autres extensions. Les extensions ".Rdata" sont des environnements **R**, elles contiennent potentiellement plusieurs variables, comme une séance de travail complète. Elles ont aussi l'avantage que, si l'utilisateur double-clique sur un fichier d'extension ".Rdata", celui-ci s'ouvre automatiquement dans l'environnement **R**.

Il faut importer le jeu de données à chaque nouvelle séance utilisation. Contrairement aux logiciels traditionnels, il n'est pas nécessaire, **ni même recommander!**, de modifier, d'altérer ou de manipuler un fichier contenant des données. Cela n'est pas nécessaire dans la mesure où **les syntaxes décrivant ces manipulations sont conservées**. Il devient alors impossible d'endommager, de corrompre, d'altérer ou d'archiver erronément le fichier de données. **Les données originales restent intactes**. Il suffit de les importer à chaque nouvelle séance, de commander la syntaxe qui lui est associée pour obtenir de nouveau la version *propre* du jeu de données.

Il est recommandé de ne jamais manipuler les fichiers de données une fois toutes les vérifications réalisées (absence d'erreur dans les données). Il n'est jamais nécessaire de modifier ces fichiers avec **R**. Également, un même jeu de données peut être associé à plusieurs syntaxes de nettoyage, de manipulation et d'analyse, mais tous les collaborateurs partagent le même jeu de données, ce qui facilite les échanges entre eux.

## Jeux de données provenant de **R** et de packages

Plusieurs packages offrent, en plus des fonctions, des jeux de données. Mieux encore! **R** offre des jeux de données inclus avec le logiciel. La fonction `data()` permet de voir la liste des jeux de données disponibles. Taper simplement le nom du jeu de données permet de l'utiliser comme s'il avait été déclaré auparavant.


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
La fonction `head()` introduite ici donne simplement un aperçu des six premières lignes du jeu de données pour ne pas afficher le jeu de données complet (ce qui prend beaucoup d'espace inutilement dans la console).

Pour consulter tous les jeux de données des packages importés, il est possible d'utiliser cette ligne de code.

```r
data(package = .packages((all.available = TRUE)))
```
Pour utiliser ces jeux, il faut rendre actif le package associé avec la fonction `library()`.

## Créer un jeu de données artificielles

Une façon rudimentaire et efficace d'obtenir des données avec **R** est de les créer à l'aide des fonctions génératrices de données pseudoaléatoires vue à la section [Les distributions] et les joindre ensemble (voir section [Créer un jeu de données]). 


```r
# Pour la reproductibilité
set.seed(142)

# Nombre d'unité
n <- 30

# Identifiant (séquence de 1 à n)
id <- 1:n

# Variables
sexe <- rbinom(n, size = 1, prob = .5)
QI <-  round(rnorm(30, mean = 100, sd = 15) - 5 * sexe)
# Être "1" soustrait 5 points au QI en moyenne
# Arrondi avec round()

# Création du jeu de données
jd <- data.frame(id = id, 
                 sexe = sexe,
                 QI = QI)

# Enregistrement
save(jd, file = "donnees.Rdata")
```

Et voilà un jeu de données simple et sauvegardé dans le dossier de travail auquel il est possible de se référer.

Ici, deux nouvelles fonctions sont employées : `round()` arrondie les valeurs à l'unité et `save()` permet de [sauvegarder un jeu de données] crée un le jeu de données.

## Sauvegarder un jeu de données

Si un jeu de données est créé directement avec **R**, par exemple, les jeux de données artificiels, il est possible de les sauvegarder avec la fonction `save()` qui enregistre une variable dans un fichier.


```r
save("variable", file = "fichier.Rdata")
```

La fonction `save()` a deux arguments principaux : un nom de variable à enregistrer et un nom de fichier d'extension `.Rdata`, les deux entre guillemets anglophones.

Il est possible à la fin d'une session de travail de sauvegarder l'environnement complet dans un fichier `save.image()`. Ainsi, toutes les variables et fonctions maison sont conservées pour une future utilisation.


```r
save.image(file = "SessionTravail.Rdata")
```

Il y a aussi la famille de fonction `write()` pour enregistrer le jeu de données en différentes extension, comme, `write.csv()`, `write.csv2()`, `write.table()`. Celles-ci fonctionne comme la fonction `save()`.

## Voir la base de données

Parfois des valeurs s'ajoutent lors de l'exportation ou l'importation des données. Des logiciels traditionnels font parfois ce mauvais tour. Une vérification de la base de données est par conséquent impérative, surtout lors de la première utilisation du jeu de données. Deux méthodes de vérification sont suggérées. D'abord, ouvrir le fichier avec un éditeur de texte de base, comme bloc-notes, pour s'assurer qu'aucun caractère indésirable ne s'est ajouté à l'insu de l'utilisateur. Ensuite, voir avec la fonction `View()` dans **R** si la base de données s'affiche correctement et que les colonnes et les lignes correspondent à ce qui est attendu.


```r
View(jd)
```

Il est possible de voir les données en utilisant la fonction `View()` et en y insérant le nom de la variable associée au jeu de données. Le logiciel affiche un tableur avec les données dont il est impossible de modifier les valeurs. Cette fonction est utile pour s'assurer que le jeu de données est en ordre, bien importé, ou le consulter.

## Importer avec **R**

Dans la plupart des situations, les analyses et les graphiques sont réalisés à partir d'un jeu de données se trouvant dans un fichier. Ce lui-ci est importé en **R** pour être manipulé. Les jeux de données peuvent se trouver dans un fichier dans l'ordinateur, mais aussi sur le web. Ils peuvent être en différents types de format.

Pour la description de l'importation, le présent ouvrage prend pour acquis que le fichier de données se retrouve dans le directoire de travail (ce qui est l'idéal en général). La création de trajectoires pour différents emplacements est présentée dans la section [Emplacement du jeu de données].

Les fonctions de base permettent d'importer la plupart des jeux de données, particulièrement s'ils ont été exportés dans un format compatible. Pour le cas où ces fichiers ne sont pas importables, des packages pallient ce besoin. Dans cet ouvrage, seule une présentation sommaire de ces options est discutée, l'utilisateur est recommandé à la documentation de ces packages pour plus d'informations.

La prochaine section décrit les fonctions pour importer les bases de données "manuellement". En plus de ces méthodes, **R**Studio possède une interface permettant l'importation des données.

## La fonction de base

La fonction de base `read.table()` permet d'importer la plupart des jeux de données. Ceux-ci ont certaines caractéristiques qu'il faudra préciser comme argument à la fonction `read.table()` pour assurer une importation adéquate. Ces caractéristiques sont `header = FALSE`, `sep = ""`, et `fill = !blank.lines.skip` (les éléments à droite sont les options par défaut).

Parfois, certains fichiers sauvegardent le nom des variables en tête de colonne (première ligne). Par défaut, **R** assume qu'il s'agit de valeurs. L'argument `header = TRUE` ajouté à `read.table()` précise à **R** lors de l'importation que ces libellés sont des noms de colonnes. 

Si un autre symbole est utilisé pour délimiter (séparer) des valeurs dans le fichier, comme `;`ou `,`, l'argument `sep = ";"` ou `sep = ","` précise le séparateur. 

Si les lignes du fichier sont de tailles inégales, **R** assume qu'il s'agit de valeur, et ces *blancs* de texte sont ajoutés comme valeurs (`""`). Pour gérer cette situation, l'argument `fill = FALSE` règle la situation.

## Fichiers d'extension .txt

Un fichier d'extension `.txt` est un fichier texte délimité par des tabulations (*tab-delimited text files*) et est importé à l'aide de la fonction `read.table()`.


```r
jd <- read.table("fichier.txt")
```

## Fichiers d'extension .dat

Un fichier d'extension `.dat` est un fichier générique de données et est importé à l'aide de la fonction `read.table()`.


```r
jd <- read.table("fichier.dat")
```

## Fichiers d'extension .csv

Un fichier d'extension .csv use généralement de séparateur comme `";"` (lorsque le système numérique de la langue d'origine utilise la virgule - comme le français par exemple) ou `","` (pour les autres langues qui n'utilise pas la virgule) et ont généralement les noms de variables en première ligne. Ainsi, la fonction `read.table()` est utilisable pourvu que le séparateur soit précisé et la présence d'en-tête également.

```r
jd <- read.table("fichier.csv", sep = ";", header = TRUE)
```

Il existe aussi la fonction `read.csv()` (nombres décimaux délimités par un point) et `read.csv2()` (nombres décimaux délimités par une virgule) pour importer des fichiers d'extension `.csv`. Il s'agit exactement de `read.table()` à l'exception des arguments par défaut, mais précisant par défaut `header = TRUE` et `fill = TRUE` et détecte s'il s'agit de `";"` ou `","`.

## Fichiers délimités

Pour les fichiers recourant à un autre caractère qu'une tabulation, qu'une `","`, ou un `";"` pour délimiter les valeurs, il faut spécifier le caractère dans `read.table()` importe le fichier.


```r
jd <- read.table("fichier.txt", sep = "$")
```

Comme pour `read.csv()` et `read.csv2()`, les fonctions `read.delim()` et `read.delim()` pourraient être utilisées.

## Fichiers d'extension .sav, .dta, .syd et .mtp

Comme le lecteur s'en doute peut-être, **R** de base ne permet pas d'importer des fichiers spécifiques d'autres logiciels. Par contre, avec les années se sont développés des packages permettant de pallier la situation. Le package `foreign` [@foreign] permet d'importer des fichiers issus de IBM SPSS (`.sav`), Stata (`.dta`) et Systat (`.syd`) et Minitab (`mtp`) avec, respectivement les fonctions `read.spss()`, `read.data()`, `read.systat()` et `read.mtp()`. La logique d'importation est la même pour ces quatre fonctions.

Pour `read.spss()`, il y a deux arguments qui sont importants à souligner. Par défaut, la fonctionne ne retourne pas un *data frame* et utilise les libellés de valeurs (*value labels*). Dans la plupart des cas, l'utilisateur désire probablement obtenir un jeu de données de type *data.frame* et les valeurs sous-jacentes aux libellés de valeurs. L'utilisateur  peut alors changer ces arguments `to.data.frame = TRUE` (par défaut, `FALSE`) et `use.value.labels = FALSE`(par défaut, `TRUE`).                                                                                                               

```r
library(foreign)

# SPSS
jd <- read.spss("fichier.sav", 
                to.data.frame = TRUE,
                use.value.labels = FALSE)

# Stata
jd <- read.dta("fichier.dta")

# Systat
jd <- read.systat("fichier.syd") 

# Minitab
jd <- read.mtp("fichier.mtp")
```

Consulter la documentation du package pour plus d'informations sur les options possibles.

## Fichiers d'extension .xls et xlsx

Il n'existe pas de fonction de base pour importer des fichiers Microsoft Excel (extensions `.xls` et `.xlsx`). Par contre, il existe plusieurs packages qui permettent de la faire, comme `readxl` [@readxl]. Le package `readlxl` permet d'utiliser la fonction `read_excel()` pour importer le fichier.


```r
# Excel
library(readxl)
jd = read_excel("fichier.xls")
```

La fonction `read_excel()` possède un argument `sheet = ` qui permet de préciser la feuille qu'il faut importer ou `range = ` (p. ex. `range = A1:B20` qui permet d'importer un rectangle de plage de données (du coin supérieur gauche `A1` au coin inférieur droit `B20`). 

Consulter la documentation du package pour plus d'informations sur les options possibles.

## Fichiers d'extension .html

Il n'existe pas de fonction de base pour importer des fichiers d'extension .html, (HTML, *HyperText Markup Language*). Le package `XML` fournit une solution possible avec la fonction `readHMTLTable()` [@XML].


```r
# HTML
library(XML)
jd <- readHMTLTable("fichier.html")
```

Consulter la documentation du package pour plus d'informations sur les options possibles.

## Fichiers d'extension .json

Il n'existe pas de fonction de base pour importer des fichiers d'extension .json, (*JavaScript Object Notation*). Comme le lecteur pourra s'y attendre, il existe un package pour rectifier la situation : le package `rjson` et sa fonction `fromJSON()` [@rjson].


```r
#JSON
library(rjson)
jd <- fromJSON("fichier.json")
```

Consulter la documentation du package pour plus d'informations sur les options possibles.

## Fichiers d'extension .sas7bdat

Il n'existe pas de fonction de base pour importer des fichiers d'extension `.sas7bdat`, (*Statistical Analysis System*).  Il existe le package `sas7bdat` pour importer des données de SAS vers **R** avec la fonction `read.sas7bdat()` [@sas].


```r
# SAS
library(sas7bdat)
jd <- read.sas7bdat("fichier.sas7dbat")
```

Consulter la documentation du package pour plus d'informations sur les options possibles.

## Emplacement du jeu de données

Idéalement, le fichier contenant le jeu de données se retrouve déjà dans le directoire de travail (ou dan le projet **R** en cours). Dans ce contexte, il suffit de référer seulement au nom du fichier.


```r
jd <- read.table("fichier.txt")
```

Si le jeu de données est sur le web, il peut être importé en précisant l'URL.


```r
jd <- read.table("https://site/ou/trouver/le/fichier.txt")
```

S'il est dans un fichier sur l'ordinateur, mais pas dans le directoire de travail, il s'agit essentiellement la même méthode.


```r
jd <- read.table("C://site//ou//trouver//le//fichier.txt")
```

Pour ces deux derniers exemples d'importations, noter bien l'utilisation du `/` (barre oblique ou *slash*) ou du plus robuste `//` plutôt que le `\` (barre oblique inverse) généralement utilisée par les ordinateurs.

Si l'utilisateur ne connaît pas exactement la trajectoire du fichier, il peut se résoudre à passer par l'explorateur de fichiers (Windows ou Apple) pour déterminer l'emplacement du fichier de jeu de données. Il faut alors utiliser la fonction `file.choose()` sans aucun argument à l'intérieur de la fonction d'importation.


```r
chemin <- file.choose()
```

L'utilisateur doit identifier manuellement (pointer et cliquer) où se trouve le fichier. Il se promène de fichier en fichier jusqu'à ce qu'il arrive au bon jeu de données, un peu comme le font les logiciels traditionnels lorsque l'utilisateur souhaite sauvegarder un fichier à un certain endroit. Une fois la trajectoire du fichier identifiée, la variable `chemin` contient cette trajectoire qui peut alors être utiliser dans les fonctions d'importation ou bien manipuler comme n'importe quelle chaîne de caractères.

## Importation avec **R**Studio

**R**Studio offre une interface simple pour télécharger directement un jeu de de données IBM SPSS, Microsoft Excel, SAS, STATA, et des extensions ".txt" et ".readr". Il y a même un outil de visualisation pour s'assurer que le tout est en ordre. Pour procéder, il faut faire *File > Import dataset > From "format de fichier* où "format de fichier" remplace Text, SPSS, Excel et les autres. Il faut suivre les instructions. En indiquant le chemin du fichier, **R** importe le fichier et fournie une syntaxe afin de reproduire l'importation pour de futurs usages.

## Exporter d'autres logiciels

### Exporter de IBM SPSS

Il est possible d'exporter des données de IBM SPSS pour une utilisation avec **R**. Il faut quelques manipulations préalables. En ayant le fichier de données IBM SPSS ouvert, il faut cliquer sur "Enregistrer sous" sous le menu déroulant "Fichier". Par défaut, IBM SPSS choisie toutes les variables, mais il est possible de sélectionner seulement les variables d'intérêt en décochant les variables qu'il n'est pas nécessaire de conserver. Ensuite, il faut sélectionner le type de fichier de sauvegarde, préférablement "Tabulé (*.dat)". IBM SPSS offre également la possibilité d'enregistrer les noms de variables (première option à cocher) et les libellés de valeur. Il suffit maintenant de nommer le fichier et de cliquer sur l'onglet "Enregister".

En s'assurant que nouveau fichier se trouve dans le directoire actif de **R**, il suffit de télécharger le fichier.


```r
jd <- read.table(file = "donnees.tab", header = TRUE)
```

L'option `header` est `FALSE` si les noms de variables n'ont pas été conservés (première ligne du fichier). La variable `jd` contient la base de données et est prête à être manipulée. 

### Exporter de Microsoft Excel

Il est possible d'exporter des données de Microsoft Excel pour une utilisation avec **R**. Il faut sélectionner l'onglet "Fichier", puis Enregistrer sous". Dans le menu déroulant, sélectionner comme type de fichier "Texte Unicode (*.txt)". Intituler le fichier, puis cliquer sur "Enregister".

Microsoft Excel sauvegarde l'entièreté de la page active. Il est donc pertinent de créer une feuille Microsoft Excel ne contenant que les informations à conserver.

Par la suite, en s'assurant que nouveau fichier se trouve dans le directoire actif de **R**, il suffit de télécharger le fichier avec `read.table()` (voir la prochaine section) et les arguments convenant au jeu de données.

## Quelques conseils de gestion

Voici quelques conseils pour la gestion le jeu de données.

* Éviter les noms trop longs ou trop courts et dépourvus de signification. Cela augmente le risque d'erreur. L'utilisation de huit caractères ou moins est une bonne recommandation (quoique ce n'est pas une règle!). Pour conserver plus de renseignements, utiliser les commentaires de la syntaxe.

* Éviter les espaces entre les mots. Cela peut être interprété erronément comme deux éléments. À la place, collez les mots et distinguer-les avec des majuscules (MaFonction), utiliser le tiret bas (ma_fonction) ou un point (ma.fonction).

* Éviter les espaces ou les vides dans les données. Cela peut être interprété comme des données (absentes) ou non.

* Éviter les symboles suivants `?, $, %, ^, &, *, (, ), -, #, ?, , , <, >, /, |, \, [, ], {` et `}` qui peuvent erronément être interprétés comme de la syntaxe autant dans les noms de variables que dans les données.

* Vérifier que les valeurs manquantes sont identifiées `NA`.

* Si les données proviennent d'un autre logiciel, vérifier la présence de  commentaires qui pourraient occasionner des lignes ou colonnes supplémentaires et ainsi corrompre le jeu de données.

* Vérifier que l'exportation et l'importation se sont bien déroulées.
