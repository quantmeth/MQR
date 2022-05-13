# (PART) Les rudiments de **R** {-}

# Commencer avec **R**
<!-- # Introduction {#rudiments-intro .unnumbered} -->

**R** [@R-base] est un logiciel de programmation statistique libre-accès et un environnement pour la computation statistique et l'affichage graphique. Il s'agit d'un projet GNU qui est similaire au langage et à l'environnement S, développés aux Laboratoires Bell (anciennement AT\&T, aujourd'hui Lucent Technologies) par John Chambers. Créé par **R**oss Ihaka et **R**obert Gentleman, **R** fournit une grande variété de techniques statistiques (modélisation linéaire et non linéaire, analyses statistiques classiques, analyse de séries chronologiques, classification) et graphiques, et est hautement extensible. 

**R** est un logiciel basé sur la syntaxe plutôt qu'une approche pointer-et-cliquer (*point-and-click*) comme les logiciels traditionnels. Il peut être plus effrayant ou apparaître trop complexe pour un nouvel utilisateur, mais une fois apprivoisée, cette bête démontre un bien meilleur potentiel que ce soit en automatisation, en personnalisation, en production de figure de haute qualité, etc. **R** a l'avantage de mettre en plein contrôle ses utilisateurs. Bref, c'est une créature qu'il vaut la peine de maîtriser.

Les logiciels traditionnelles suspendent trop souvent la réflexion critique. Ils sont dociles. L'usager clique sur les bonnes options et obtient les résultats désirés (espérons-le!). En échange d'une expérience "simple et intuitive", ils compromettent l'épanouissement de l'utilisateur et rendent l'analyse statistique comme une boîte noire, un programme dont le fonctionnement ne peut être connu. Sont évacuées toutes connaissances des analyses, seules les entrées et les sorties sont pertinentes.

En se limitant à ces logiciels, les utilisateurs sont également à la merci des compagnies qui les distribuent. Par exemple, elles maintiennent des prix exorbitants pour des licences annuelles, malgré le faible soutien technique, la désuétude ou le manque de mise à jour, la présence de bogues informatiques. Ces problèmes sont monnaie courante bien que la licence ne soit pas de la petite monnaie.

Contrairement aux logiciels traditionnels, **R** permet de réaliser les analyses, mais aussi de les programmer soi-même, de générer des données propres à un modèle, de rester à jour sur les nouvelles tendances et les découvertes en méthodologie de la recherche, de partager aisément les connaissances et la reproduction d'analyses sophistiquées, et tout cela, gratuitement. Évidemment, cela n'est possible que par l'immense communauté derrière le logiciel.

## Pourquoi **R**?

**R** est complètement gratuit. Il est le logiciel le plus utilisé parmi les scientifiques de sciences de données, statisticiens, etc. Il est l'exemple ultime d'une plateforme communautaire qui fait mieux que les compétiteurs commerciaux. De plus en plus de personnes migrent vers **R**, mais peu de ses utilisateurs quittent le logiciel vers un autre. Et plus de personnes se joignent à la communauté, plus il y a de documentation, d'aide, de soutien, que ce soit sous forme de livres, de vidéos, d'article, d'ateliers, de formations. L'expérience **R** devient de plus en plus accessible aux nouveaux immigrants. Comme le code source est ouvert, ses utilisateurs collaborent à la création de modules augmentant ses capacités qui permettent de résoudre des problèmes de plus en plus sophistiqués (et pas juste en statistiques!). Ces modules sont également gratuits et il y en a littéralement des milliers.

L'avantage de maîtriser **R**, plus spécifiquement de l'utilisation de syntaxe, pour l'expérimentateur est de rendre l'analyse statistique facilement *transmissible* entre expérimentateur (facilite grandement la collaboration), *reproductible* (vérification et collaboration), *répétable* (pour de nouvelles données ou expériences), et *ajustable* (pour de nouveaux scénarios). Quelqu'un d'autre peut jeter un oeil à l'analyse réalisée et voir exactement ce qui s'est produit, tant dans la gestion du jeu de données que l'analyse et la génération de graphiques. L'analyse peut être reproduite par les pairs, voire répéter si des données supplémentaires ont été recueillies ou si une nouvelle expérience a été réalisée.

Même si **R** est un langage de programmation et que cela peut en intimider plus d'un, il est relativement intuitif à apprendre et assez simple d'utilisation dans la mesure où les ressources appropriées pour apprendre sont accessibles à l'utilisateur. L'apprentissage de la programmation, même si ce n'est pas en **R,** permet de mieux comprendre le fonctionnement des ordinateurs en plus de reconsidérer le dogmatisme de tout-puissant "algorithmes". Il permettra aussi à l'utilisateur lorsqu'il saura suffisamment maîtriser la bête à créer lui-même la syntaxe qu'il lui permettra de résoudre les problèmes sur lesquels il s'intéresse.

Enfin, **R** possède un incroyable moteur pour la visualisation de données et de capacités graphiques. Aucun autre logiciel ne lui arrive à la cheville.

## Installer **R**
**R** est compatible pour Windows, Mac et Linux. Pour télécharger le logiciel, il faut se rendre sur le site <http://www.r-project.org> et sélectionner les hyperliens "download R" ou "CRAN mirror". Il faut ensuite choisir un *mirror* de son pays d'origine. Par la suite, la page permet de choisir la version appropriée à son système d'exploitation. Il faut alors suivre les indications.

Il est principalement utilisé en anglais bien qu'on peut le définir en français. La plupart de l'aide sera également en anglais surtout celle pour les analyses avancées. Toutefois, il y a beaucoup de ressources accessibles en ligne en français en ce qui a attrait à l'initiation à **R**.

### **R**Studio
Bien que **R** puisse être utilisé seul, son aspect rudimentaire pourra en inquiéter plus d'un (surtout un.e étudiant.e en sciences humaines et sociales). Le logiciel **R**Studio permet une utilisation plus fluide et intuitive pour les usagers ayant peu ou pas d'expériences en programmation. **R**Studio est un environnement de développement intégré (IDE pour *integrated development environment*) pour R. Il comprend une console, un éditeur de mise en évidence de la syntaxe qui prend en charge l'exécution directe du code, ainsi que des outils de traçage, d'historique, de débogage et de gestion de l'espace de travail. Le logiciel est gratuit et libre-accès pour une utilisation personnelle. Il comporte aussi une version commerciale qui nécessite un certain déboursement de fonds.

Pour télécharger le logiciel, il faut se rendre sur le site <http:rstudio.com> et naviguez jusqu'au téléchargement du logiciel, ou aller spécifiquement sur <https://www.rstudio.com/products/rstudio/download/#download>, où il sera possible de télécharger la version gratuite de **R**Studio. **R**Studio est uniquement disponible en anglais.


#### Les avantages de **R**Studio

L'avantage de **R**Studio, comparativement à l'utilisation unique de **R**, est d'offrir une gestion de la console, du script, de l'environnement des variables et des documents externes en une seule interface (et beaucoup d'autres avantages!). En plus de la console (ce que **R** fournit), **R**Studio permet l'édition de syntaxe qui pourra être commandée ligne par ligne en utilisant **CTRL + Enter** (Windows) ou **CMD + Enter** (MacOS), ce qui pourra s'avérer fort utile lors de la programmation de fonction ou d'analyses de données. **R**Studio affiche également les variables en mémoire dans le menu *Global Environment*, ce qui permet de suivre l'état de la programmation. Enfin, **R**Studio affiche dans un quatrième menu les fichiers dans le directoire des fichiers **R** ce qui permet de voir notamment les jeux de données, mais aussi d'autres fonctions ou scripts. C'est également à cet endroit où l'aide (*help*) sera fournie et les figures (*plot*) affichées.

Tout le contenu du présent ouvrage pourra être réalisé avec **R** ou avec **R**Studio, toutefois l'usage de ce dernier sera plus agréable aux lecteurs et lectrices.

Oh! Une autre avantage de **R**studio est qu'il peut être utiliser comme un éditeur de texte. D'ailleurs, cet ouvrage est complètement rédigé avec **R**Studio (avec le package `Rmarkdown`).

### Autres options

Il existe plusieurs interfaces utilisateurs graphiques (GUI  pour *Graphical User Interface*) pour **R** comme *R Commander* (certainement l'option la plus connue en sciences humaines et sociales) ou *JASP*, mais aussi plusieurs autres. Ces deux options sont gratuites et libre-accès. Il existe aussi d'autres options payantes. Ces logiciels visent l'utilisation de **R** par une approche pointer-et-cliquer (*point-and-click*) au travers les analyses plutôt que de recourir à la syntaxe. Ces options plus intuitives pour l'utilisateur sans expérience en programmation auront parfois des effets limitatifs pour des analyses plus avancées et ont comme effet indésirable de promouvoir la boîte noire statistique.

## Démarrer **R** ou **R**Studio

À l'ouverture de **R**, le logiciel présente la console, une interface très rudimentaire (et assez déstabilisante pour un logiciel pourtant si promu). Une fois le logiciel ouvert, l'application offre une invitation discrète à écrire des commandes. Le symbole `>` au bas de la console est une invite (*prompt*) indiquant où taper les commandes. C'est à cette ligne de commande que les expressions seront immédiatement évaluées.

<div class="figure" style="text-align: center">
<img src="image//ConsoleR.PNG" alt="Ouverture (effrayante!) de la console R" width="75%" />
<p class="caption">(\#fig:ConsoleR)Ouverture (effrayante!) de la console R</p>
</div>

Dans la Figure \@ref(fig:ConsoleR), **R** est défini en français. Cela n'a pour effet que de modifier le menu déroulant ("Fichier, Edition, etc.") au sommet du logiciel et les différentes options de ce menu. Le fonctionnement reste le même (les fonctions ne sont pas traduites, par exemple).

La console **R** n'étant pas un éditeur de texte, il faudra enregistrer la syntaxe utilisée lors d'une séance pour la conserver. Le logiciel offre une option d'écriture de script intégré, mais n'est pas lié directement à la console. Il faudra donc se résoudre à abuser du copier-coller ou à sourcer le script (tâche plus ardue pour les nouveaux utilisateurs). Plusieurs éditeurs de texte sont utiles ou même construits pour directement travailler avec **R**, le plus connu étant certainement **R**Studio. L'environnement intégré sera beaucoup plus fonctionnel.

La figure \@ref(fig:ConsoleRStudio), montre l'interface de **R**Studio, déjà un peu moins intimidante que celle de **R**. À l'ouverture de **R**Studio, quatre types de fenêtres sont disponibles : la console (cadran inférieur gauche), les scripts (cadran supérieur gauche), l'environnement (cadran supérieur droit) et l'affichage (cadran inférieur droit). L'emplacement de ces cadrans peut être modifié selon les désirs de l'utilisateur.

<div class="figure" style="text-align: center">
<img src="image//ConsoleRStudio.PNG" alt="Ouverture (moins effrayante) de **R**Studio" width="75%" />
<p class="caption">(\#fig:ConsoleRStudio)Ouverture (moins effrayante) de **R**Studio</p>
</div>

La console **R**Studio est identique à la console usuelle retrouvée avec **R**. Elle sert les mêmes fonctions. Le script est un éditeur de texte dans lequel de la syntaxe sera rédigée, sauvegardée, manipulée, et tester. S'il n'est pas ouvert ou s'il faut ouvrir un script supplémentaire, il faut procéder par le menu déroulant.

> File

> New File

> R Script

ou bien **CTRL + Shift + N**. Il peut y avoir plusieurs scripts ouverts simultanément. L'environnement global permet de connaître les variables et fonctions maison en mémoire vive. L'onglet *History* montre les dernières lignes de code commandées (non affichées dans la figure - il suffit de cliquer sur l'onglet à côté de *Environment*). Enfin, le cadran  inférieur droit montre le fichier de travail **R** qui contiendra ordinairement les fichiers de travail actifs (scripts, jeu de données, fonctions maison, etc.) C'est très utile pour travailler par projet. Si aucun directoire n'est demandé explicitement par **R** (par exemple, si un jeu de donnée doit être téléchargé), le logiciel cherchera par défaut dans le fichier actif pour télécharger les fichiers demandés. Il est une bonne pratique que de s'assurer d'être dans le bon fichier, car cela pourra causer quelques soucis à l'occasion.


# Programmer avec **R**

Dans les prochaines sections, les différents éléments de programmation permettant la création et la manipulation de données seront présentés.

## Les scripts
Ce qu'il importe le plus avec **R**, mais où  **R**Studio resplendit, est de conserver la syntaxe d'une session à l'autre, ce que le logiciel ne fait pas très bien. Il faudra sauvegarder dans un script les expressions et le code utilisés. Ces fichiers ont souvent comme extension ".R" et permettront de conserver, voire partager la syntaxe. Il sera possible d'y ajouter des commentaires pour de futures utilisations. Tout éditeur de texte peut permettre la sauvegarde de syntaxe, certains seront mieux que d'autres pour l'utilisation avec **R**.

## Les variables
Pour manipuler les données, il faut recourir à des variables. Afin de leur attribuer une valeur, il faut assigner cette valeur avec `<-` (**ALT + -**) ou `=`, par exemple,


```r
a <- 2
a
#> [1] 2
```

où `a` est maintenant égale à `2`. La première ligne assigne la valeur à `a`. La deuxième ligne, indique à la console **R** d'imprimer le résultat pour le voir. Par la suite, `a` pourra être utilisée dans des fonctions, des calculs ou analyses plus complexes. De surcroît, `a` pourra devenir une fonction, une chaîne de caractère (*string*) ou un jeu de données.

Conventionnellement, les puristes de **R** recommanderont l'usage de `<-` plutôt que `=` pour l'assignation. Il y a quelques nuances computationnelles entre les deux, mais qui échapperont irrémédiablement aux néophytes et même aux usagers intermédiaires. 

Pour nommer des variables, seuls les caractères alphanumériques peuvent être utilisés ainsi que le tiret bas `_` et le `.`. Les variables ne peuvent commencer par un nombre.

<!-- TODO -->
<!-- L'utilisation de `=` sera utilisée dans cet ouvrage, par simplicité, mais aussi, car il semble plus intuitif pour le nouvel utilisateur ou la nouvelle utilisatrice. Il économise 1 clique de clavier. -->

Réassigner une valeur à une variable déjà existante écrase la valeur précédente.


```r
a <- 2
a <- 3
a
#> [1] 3
```

La sortie produit `3` et non plus `2`.

Cette remarque est importante, car elle signifie que l'on peut écraser des fonctions en nommant des variables. Il faut ainsi éviter de nommer des variables avec des fonctions utilisées par **R**, on évitera notamment l'utilisation des noms suivants.


```r
c; q; t; C; D; I; T; F; pi; mean; var; sd; length; diff; rep;
```

Certains mots seront tout simplement interdits d'utilisation.


```r
TRUE; FALSE; break; for; in; if; else; while; function; Inf; NA; NaN; NULL;

```

## Les opérateurs arithmétiques

La première utilisation qu'un nouvel usager fait de **R** est généralement d'y recourir comme calculatrice. On pourra utiliser les opérateurs arithmétiques de base comme l'addition `+`, la soustraction `-`, la multiplication `*`, la division `/` , et l'exposant `^`.

```r
2 + 2
#> [1] 4
1 / 3
#> [1] 0.33
2 * 3 + 2 ^ 2
#> [1] 10
```
Évidemment, ces opérateurs fonctionnent sur des variables numériques.

```r
a <- 1
b <- 10
a / b
#> [1] 0.1
```
Ici, les deux premières lignes assignent des valeurs à `a` et `b`, puis imprime la division. L'absence de marqueur `<-` ou `=` indique à **R** d'imprimer la réponse dans la console. Si le résultat `a/b` devait être assigné à une variable, alors aucun résultat ne serait affiché, bien que la variable contienne la réponse.

```r
resultat <- a / b
```
Il n'y a aucune réponse d'affichée. Maintenant, si `resultat` est demandé, R affiche le résultat.

```r
resultat
#> [1] 0.1
```
D'autres fonctions sont aussi très utiles. Par exemple, la racine carrée `sqrt()` (qui n'est rien d'autre que `^(1/2)`) et le logarithme naturel `log()`. Il suffit d'insérer une variable ou une valeur à l'intérieur d'une de ces fonctions pour en obtenir le résultat.

```r
sqrt(4)
#> [1] 2
4^(1/2)
#> [1] 2
log(4)
#> [1] 1.4
```

## Les commentaires

Les scripts **R** peuvent contenir des commentaires. Ceux-ci sont désignés par le désormais célèbre `#`. Une ligne de script commençant par ce symbole sera ignorée par la console. Ces commentaires permettent aussi bien de préciser différentes étapes d'un script, que d'expliquer la nomenclature des variables ou encore d'expliquer une fonction, ses entrées, ses sorties. Les commentaires sont extrêmement utiles, car les annotations peuvent souvent sauver énormément de temps et d'effort lors d'utilisations ultérieures.


```r
# La variable resultat est le quotient des variables a et b
resultat <- a / b
resultat
#> [1] 0.1
```
Dans cet exemple, la première ligne est ignorée. Autrement, la console **R** produirait une erreur, car cette ligne est pour le logiciel pur charabia!

## Définir une chaîne de caractère
La plupart du temps, les variables utilisées seront numériques, c'est-à-dire qu'elles contiendront des nombres. Parfois en analyses de données, il pourra s'agir de chaîne de caractères (*string*), autrement dit, de mots. Les chaînes de caractères sont définis par le double apostrophe `"..."`, où on remplace les trois points par les mots désirés.

```r
titre <- "Bonjour le monde!"
titre
#> [1] "Bonjour le monde!"
```

## Concaténer

Une fonction fort utile permettra de joindre des données dans une seule variable. Précédemment, l'assignation d'une valeur a des variables se limitait qu'à une chaîne de caractères ou une valeur numérique. Pour mettre plusieurs éléments (deux ou plus) dans une seule variable, la fonction concaténée `c()` (ou combiner, créer) suffira à la tâche. Il faudra délimiter chaque élément par une virgule `,`.


```r
valeurs <- c(-5, 5)
valeurs
#> [1] -5  5
```

Elle fonctionne également avec les chaînes de caractères.


```r
texte <- c("Allo", "le monde")
texte
#> [1] "Allo"     "le monde"
```

Et les deux.


```r
phrase <- c(1,"Chat", 2,"Souris")
phrase
#> [1] "1"      "Chat"   "2"      "Souris"
```

Il faudra faire attention à ce qui est passé comme argument à la fonction `c()`, car elle ne crée que des vecteurs (une ligne en quelque sorte) avec les entrées fournies, peu importe leur structure de départ. Par exemple, un jeu de données passant par `c()` devient une seule ligne de valeurs. Les fonctions `cbind()` et `rbind()` permettront de joindre des colonnes et des lignes respectivement.

## Référer à des sous-éléments

Avec des variables contenant plusieurs valeurs, il peut être utile de référer à une seule valeur ou un ensemble de valeurs de la variable. Les crochets `[]` à la suite du nom d'une variable permettront d'en extraire les valeurs désirées sans tout sortir l'ensemble.


```r
phrase <- c(1,"Chat", 2,"Souris")
# Extraire le premier élément de la variable phrase
phrase[1]
#> [1] "1"
# Extraire les éléments 1, 2 et 3
phrase[1:3]
#> [1] "1"    "Chat" "2"
# Extraire les éléments 2 et 4
phrase[c(2,4)]
#> [1] "Chat"   "Souris"
# Ne pas extraire l'élément 1
phrase[-1]
#> [1] "Chat"   "2"      "Souris"
# Ne pas extraire les éléments 1 et 3
phrase[-c(1,3)]
#> [1] "Chat"   "Souris"
```

Dans le premier exemple, seul un élément est demandé. Dans le deuxième exemple, la commande `1:3` produit la série de $1,2,3$ et en extrait ces nombres. Dans le dernier exemple, la fonction `c()` est astucieusement utilisée pour extraire les éléments $2$ et $4$. Le quatrième exemple montre comment retirer un élément en utilisant des valeurs négatives et le cinquième exemple montre comment retirer des éléments.

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
#> [1] 341
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
#> [1] 10
total <- addition3(4, 6)
total
#> [1] 10
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

## Définir des clauses conditionnelles

Pour réaliser des opérations sous certaines conditions ou opérer des décisions automatiques, il est possible d'utiliser des arguments conditionnels avec des opérateurs logiques. Par exemple, sélectionner des unités ayant certaines caractéristiques, comme les participants ayant 18 ans et moins, les personnes ayant un trouble du spectre de l'autiste, ou encore par sexe. Il est aussi possible d'utiliser les opérateurs pour définir à quelle condition telle ou telle autre fonction doit être utilisée. Il faudra alors utiliser les arguments logiques.

<table class=" lightable-classic table" style='font-family: "Arial Narrow", "Source Sans Pro", sans-serif; width: auto !important; margin-left: auto; margin-right: auto; margin-left: auto; margin-right: auto;'>
<caption>(\#tab:unnamed-chunk-22)Symboles logiques et leur signification</caption>
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
#> [1] FALSE FALSE FALSE  TRUE  TRUE  TRUE
```
Cela peut être utilisé pour référer à des sous-éléments comme abordés précédemment.


```r
valeurs <- 1:6
# Toutes les valeurs plus grandes que 3.
valeurs[valeurs > 3]
#> [1] 4 5 6
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
#> [1] "la valeur est négative"
```

Il est possible d'élaborer cette logique avec la fonction `else` qui permet de spécifier une suite à la fonction si l'argument est faux (`FALSE`).


```r
x <- 2
if(x < 0){
  print("la valeur est négative")
}else{
  print("la valeur est positive")
}
#> [1] "la valeur est positive"
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
#> [1] "la valeur est égale à 0"
```
L'arbre de décision peut devenir aussi compliqué que l'utilisateur le désire : chacune des branches peut contenir autant de ramifications que nécessaire.

Il peut arriver pour certaines fonctions de devoir spécifier si certains paramètres sont vrais (`TRUE`) ou faux (`FALSE`) ou de définir des variables ayant ces valeurs. Lorsque c'est le cas, il est toujours recommandé d'écrire les valeurs logiques tout au long comme `TRUE` et `FALSE`, même si **R** reconnaît `T` et `F`, car ces dernières peuvent être réassignées, contrairement aux premières.



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


## En cas de pépins

Il arrive parfois que le code utilisé ne fonctionne pas, que des erreurs se produisent ou que des fonctions fort utiles demeurent inconnues. Même après plusieurs années d'utilisation, les utilisateurs font encore quotidiennement des erreurs (au moins une!). Un excellent outil est d'utiliser un moteur de recherche dans un fureteur de prédilection, de poser une question à l'aide de quelques mots clés bien choisis, préférablement en anglais, et en y inscrivant "with R" ou "in R" ou "R". La plupart du temps, les programmeurs de packages auront une solution sur leur site ou leurs instructions de packages. Il y a aussi des plateformes publiques et en ligne, comme [StackOverflow](https://stackoverflow.com/) qui collectent questions et réponses sur le codage. D'autres utilisateurs peuvent avoir posé la même question et des auteurs de programmes R et d'autres usagers y auront répondu aux bénéfices de tous. Dans le cas d'une solution introuvable, ces mêmes plateformes permettent de poser de nouvelles questions.  Il faudra toutefois attendre qu'un usager plus expérimenté prenne le temps d'y répondre.

# Fonctions statistiques essentielles

Dans cette section, des fonctions utilisées couramment seront présentées. L'accent est mis sur la définition de la fonction (qu'est-ce qu'elle calcule?), le développement d'une fonction maison (rédigée par l'usager pour la mettre en pratique) et l'identification de la fonction déjà implantée en **R**.

## La longueur
La longueur d'une variable correspond au nombre d'éléments qu'elle contient. La fonction `length()` permettra d'obtenir ce résultat. Il sera particulièrement utile lorsqu'il faudra calculer, par exemple, la taille d'échantillon (le nombre d'unités d'observation d'une variable).

La somme d'une chaîne de caractère est toujours de $1$, peu importe le nombre de caractères. La fonction `nchar()` produira le nombre de caractères.

Une variable qui existe, mais qui ne contient pas de valeur aura une longueur égale $0$. Ce type de variable est utile lorsqu'il faut créer une variable qui aura une taille variable.


```r
x <- c(1,2,3)
length(x)
#> [1] 3

y <- "Bonjour le monde!"
length(y)
#> [1] 1

nchar(y)
#> [1] 17
```

## La somme

Il sera très fréquent de devoir calculer des sommes de variables pour en obtenir le total. En tant qu'humain, le calcul d'une série de nombre correspond à prendre chaque nombre et de les additionner un à un. La fonction suivante reproduit assez bien ce qu'un humain ferait (avec ses quelques caprices de programmation tel que devoir déclarer l'existence de la variable de `total` et spécifier le nombre d'éléments à calculer).


```r
somme <- function(x){
  n <- length(x)
  total <- 0
  for(i in 1:n){
    # Prendre le ie élément et l'additionner
    # au total des (i-1)e éléments précédents
    total <- total + x[i]
  }
  return(total)
}
x <- c(1,2,3,4,5,-6)
somme(x)
#> [1] 9
sum(x)
#> [1] 9
```

À noter que l'utilisation de la boucle est à des fins illustratives uniquement. En termes de rendement computationnel, elle est bien peu efficace. Il faudra privilégier la fonction `sum()` pour calculer le total de son entrée.

Il faut prendre garde : **R** calcule le total de tous les éléments de l'entrée sans égard aux lignes et aux colonnes. Si deux variables étaient entrées par inadvertance, alors R calculerait la somme de ces deux variables plutôt que de retourner deux totaux. À cette fin, les fonctions `rowSums()` et `colSums()` seront utiles lorsqu'il faudra calculer des sommes sur des lignes (*row*) ou des colonnes (*col*).

## La moyenne

La moyenne est une mesure de tendance centrale qui représente le centre d'équilibre d'une distribution (un centre de gravité en quelque sorte). Si le poids d'un des côtés d'une distribution de probabilité était altéré (plus lourde ou plus légère), alors la moyenne se déplacerait en conséquence.

La moyenne d'un échantillon correspond à la somme de toutes les unités d'une variable divisée par le nombre de données de cette variable ou, mathématiquement, $$\bar{x}=\frac{\Sigma_{i=1}^n x}{n} $$ où $x$ est la variable, $n$ est le nombre d'unité et $\Sigma_i^n$ représente la somme de toutes les unités de $x$. **R** possède déjà une fonction permettant de calculer la moyenne sans effort, `mean()` où l'argument est la variable. Il est également possible de développer une fonction maison pour calculer la moyenne comme


```r
x_bar <- sum(x)/length(x)
```
où `sum(x)` calculer la somme de toutes les unités de `x`, `/` permet la division et `length(x)` calculer le nombre d'unité dans la moyenne.
Par exemple, à partir d'une variable `x`, les fonctions suivantes donnent le même résultat. Par contre la fonction `mean()` est beaucoup plus robuste que cette dernière équation.

```r
# Création de la variable
x <- c(0, 1, 2, 3, 4, 5)
# La moyenne
mean(x)
#> [1] 2.5
# La moyenne
sum(x)/length(x)
#> [1] 2.5
```

Comme pour `sum()`, les fonctions `rowMeans()` et `colMeans()` seront utiles lorsqu'il faudra calculer des moyennes sur des lignes (*row*) ou des colonnes (*col*).

## La médiane
La médiane d'un échantillon correspond à la valeur où $50\%$ des données se situe au-dessous et au-dessus de cette valeur. C'est la valeur au centre des autres (lorsqu'elles sont ordonnées). Quand le nombre de données est impair, le $\frac{(n+1)}{2}$^e^ élément est la médiane. Quand le nombre est pair, la moyenne des deux valeurs au centre correspond à la médiane. Cette statistique est intéressante comme mesure de tendance centrale, car elle est plus robuste aux valeurs aberrantes (moins sensibles) que la moyenne .

Évidemment, **R** offre déjà une fonction `median()` pour réaliser le calcul. Il est toutefois possible de programmer une fonction maison. Il faudra utiliser la fonction `sort()` pour ordonner les données (croissant par défaut).


```r
mediane <- function(x) {
  n <- length(x)
  s <- sort(x)
  ifelse(n%%2 == 1, s[(n + 1) / 2], mean(s[n / 2 + 0:1]))
}
# Tester ensuite:
x <- c(42, 23, 53, 77, 93, 20, 37, 24, 60, 62)
median(x)
#> [1] 48
mediane(x)
#> [1] 48
```

L'expression `n%%2`, lue $n \bmod 2$, joue astucieusement le rôle de vérifier si `n` est impaire. La formule générale $x \bmod y$ représente une opération binaire associant à deux entiers naturels le reste de la division du premier par le second. Par exemple, $60 \bmod 7$, noter `60%%7` dans **R**, donne $4$ soit le reste de $7*8 + 4 = 60$. Le logiciel le confirme.

```r
60%%7
#> [1] 4
```
Il s'agit d'une technique de programmation très  pratique. Dans le cas de `n%%2`, la formule donne $1$ dans le cas d'un nombre impair ou $0$ dans le cas d'un nombre pair, puis teste ce résultat pour déterminer s'il réalise `s[(n+1)/2]` lorsque `n%%2==1`(`TRUE`) , ce qui correspond à choisir l'élément au centre d'un vecteur de taille impair, ou bien `mean(s[n/2+0:1]` lorsque `n%%2==0`(`FALSE`) , ce qui correspond à choisir les deux éléments au centre d'un vecteur pair et d'en faire la moyenne. Il s'agit de l'une des nombreuses façons selon lesquelles il est possible de programmer la médiane.

## La variance

La variance d'un échantillon est une mesure de dispersion. Elle représente la somme des écarts (distances) par rapport à la moyenne au carré divisée par la taille d'échantillon moins $1$.  Mathématiquement, il s'agit de l'équation \@ref(eq:var).

$$
s^2 = \frac{1}{n-1}\sum_{i=1}^n(x_i-\bar{x})^2
(\#eq:var)
$$
Il est assez aisé d'élaborer une fonction pour réaliser se calculer avec les fonctions déjà abordées.

```r
variance <- function(x){
  n <- length(x)
  xbar <- mean(x)
  variance <- sum((x - xbar) ^ 2)/(n - 1)
  return(variance)
}
```
La variance  peut aussi être calculée plus efficacement avec la fonction **R** `var()`.

```r
x <- c(26, 6, 40, 36, 14, 3, 21, 48, 43, 2)
variance(x)
#> [1] 300
var(x)
#> [1] 300
```

## L'écart type

L'écart type d'un échantillon représente la racine carrée de la variance. Elle a une interprétation plus intuitive en tant que mesure de la moyenne des écarts par rapport à la moyenne. Si le calcul avait été entrepris avec les distances par rapport à la moyenne (au lieu des écarts au carré), alors la somme serait toujours de 0, un résultat tout à fait bancal. En prenant la racine carrée des écarts au carré, ce qui constitue une mesure de distance euclidienne, l'écart type devient une mesure de l'étalement de la dispersion autour du centre d'équilibre.

$$
s =\sqrt{s^2}= \sqrt{\frac{1}{n-1}\sum_{i=1}^n(x_i-\bar{x})^2}
$$
Avec **R**, la fonction de base est `sd()`. Il est possible de récupérer la fonction maison précédemment rédigée.

```r
ecart.type <- function(x){
  et <- sqrt(variance(x))
  return(et)
}
ecart.type(x)
#> [1] 17
sd(x)
#> [1] 17
```


## Les graines
Par souci de reproductibilité, il est possible de déclarer une valeur de départ aux variables pseudoaléatoires, ce que l'on nomme une graine ou *seed* en anglais. Cela permet de toujours d'obtenir les mêmes valeurs à plusieurs reprises, ce qui est très utile lors d'élaboration de simulations complexes ou lorsque des étudiants essaient de répliquer résultat tiré d'un ouvrage pédagogique.

```r
set.seed("nombre")
```
Il suffit de spécifier cette commande (en remplaçant `nombre` par un nombre) en début de syntaxe pour définir la séquence de nombre. Cette fonction sera utilisée à plusieurs reprises dans le but de reproduire les mêmes sorties.

## Les distributions

Il existe plusieurs distributions déjà programmées avec **R**. Voici les principales utilisées dans cet ouvrage.

<table class=" lightable-classic table" style='font-family: "Arial Narrow", "Source Sans Pro", sans-serif; width: auto !important; margin-left: auto; margin-right: auto; margin-left: auto; margin-right: auto;'>
<caption>(\#tab:unnamed-chunk-42)Noms des distributions, fonctions et leurs arguments</caption>
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

Les libellés ci-dessus ne commanderont pas de fonction. Il faut joindre en préfixe à ces distributions l'une des quatre lettres suivantes : `d`, `p`,`q`, ou `r`. La plus simple est certainement `r` (*random*) qui génère `n` valeurs aléatoires de la distribution demandée selon les paramètres spécifiés. Les fonctions `q` (quantile) prend un argument de 0 à 1 (100%), soit un percentile et retourne la valeur de la distribution. La fonction `p` (probabilité) retourne la probabilité cumulative (du minimum jusqu'à la valeur) d'une valeur de cette distribution. Enfin, la lettre `d` (densité) permet, notamment, d'obtenir les valeurs de densité de la distribution.

Voici un exemple avec la distribution normale.

```r
set.seed(9876)
# Génère 5 nombres aléatoires en fonction des paramètres
rnorm(n = 5, mean = 10, sd = .5)
#> [1] 10.5  9.4  9.9 10.0 10.0
# Retourne les valeurs associés à ces probabilités
qnorm(c(.025,.975))
#> [1] -2  2
# Retourne la probabilité d'obtenir un score de 1.645 et moins
pnorm(1.645)
#> [1] 0.95
# La valeur de la densité de la distribution
dnorm(0)
#> [1] 0.4
```

Ces quatre lettres peuvent être associées à toutes les distributions énumérées et bien d'autres. Elles respectent toutes ce cadre.

## Création d'une matrice

Une dernière fonction, la fonction `matrix()` sera utile pour créer des matrices. La fonction utilise trois arguments, une matrice de nombre à entrer dans la matrice, un nombre de colonnes et un nombre de lignes. La fonction utilise le recyclage, ce qui pourra être utile à certaines occasions.


```r
# Une matrice de 0
matrix(0, ncol = 3, nrow = 3)
#>      [,1] [,2] [,3]
#> [1,]    0    0    0
#> [2,]    0    0    0
#> [3,]    0    0    0
# Une matrice contenant les nombres 1:3 pour une matrice 3x3
matrix(1:3, ncol = 3, nrow = 3)
#>      [,1] [,2] [,3]
#> [1,]    1    1    1
#> [2,]    2    2    2
#> [3,]    3    3    3
# Si la séquence préféré serait de gauche à droite plutôt
# de bas en haut
matrix(1:3, ncol = 3, nrow = 3, byrow = TRUE)
#>      [,1] [,2] [,3]
#> [1,]    1    2    3
#> [2,]    1    2    3
#> [3,]    1    2    3
# Une matrice avec un nombre d'entrées égale au nombre de cellule
matrix(1:16, ncol = 4, nrow = 4)
#>      [,1] [,2] [,3] [,4]
#> [1,]    1    5    9   13
#> [2,]    2    6   10   14
#> [3,]    3    7   11   15
#> [4,]    4    8   12   16
```

Les matrices sont une formes de jeu données (numérique seulement). Plus tard, les `data.frame` ou jeu de données seront présentés.

# Exercices {#exercice-rudiments .unnumbered}
1. Rédiger une fonction calculant la moyenne d'une variable.
2. Rédiger une fonction pour générer une séquence de Fibonacci (chaque nombre est la somme des deux précédents) jusqu'à une certaine valeur, soit $1,1,2,3,5,8,...$.
3. Rédiger une fonction calculant un score-$z$ pour une variable.
4. Rédiger une fonction calculant l'hypoténuse d'un triangle rectangle.
5. Rédiger une fonction qui pivote une liste de $k$  éléments par $n$. Par exemple, une liste de six ($k=6$ comme $[1,2,3,4,5,6]$) pivoté de deux ($n=2$) devient ($[3,4,5,6,1,2]$).
