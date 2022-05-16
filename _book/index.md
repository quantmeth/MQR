--- 
title: "Méthodes Quantitatives avec R"
author: "P.-O. Caron"
date: "2022-05-16"
site: bookdown::bookdown_site
documentclass: book
bibliography: [ma.bib]
url: mqr.teluq.ca
# cover-image: path to the social sharing image like images/cover.jpg
description: |
  This is a minimal example of using the bookdown package to write a book.
  The HTML output format for this example is bookdown::bs4_book,
  set in the _output.yml file.
biblio-style: apa
link-citations: true
csl: apa.csl
---

# Bienvenue! {-}

Bienvenue dans la version préliminaire et en ligne du livre *Méthodes Quantitatives avec ****R*** de [P.-O. Caron](https://www.teluq.ca/siteweb/univ/pcaron.html). Le livre porte sur la programmation statistique en **R** et vise démystifier les mécanismes ésotériques derrières les logiciels statistiques afin de les rendre accessibles au plus grand nombre de personnes. Son objectif est de faire le pont entre la statistique et la programmation afin que les expérimentateurs comprennent et autonomisent leur pratique. L'approche permet à la fois une meilleur compréhension des statistiques à l'aide du logiciel, mais aussi un objectif pour débuter la programmation.

Il vise un public autant intéressé à s'initier à **R** qu'à en connaître davatange sur la statistique, mais surtout un lecteur qui souhaite maîtriser les deux.

Si vous avez des commentaires ou des suggestions, n'hésitez pas à me les partager. C'est ouvrage est en construction. Il n'est pas parfait et peut contenir (contient!) des erreurs. Vous pouvez m'écrire à l'adresse suivante : pier-olivier[at]teluq.ca pour toutes suggestions d'amélioration. 

## Remerciements {-}

Les étudiants et étudiantes de la classe PSY7105 d'automne 2021.

# Préface {-}

> Il faut être naîf pour croire que le code fonctionne tel que prévu.

La méthode scientifique impose aux expérimentateurs de tirer des conclusions avec scrutinie sur leur objet d'étude. Toutefois, ils font confiance à d'autres pour des tâches qui dépassent leur champs de compétence, et ce, avec raisons, car ces autres expertises peuvent être fort compliquées et nécessitées d'autres formations académiques complémentaires pour les acquérir. En sciences humaines et sociales, les statistiques font parties de ces expertises exterrieures qui se doivent d'être apprises. En comprendre les fondements et l'implantation logiciel est nécessaire pour ne pas fléchir son esprit critique, ne serait-ce qu'un instant. Trop souvent, les expérimentateurs ont une introduction aux statistiques et font confiance pour les calculs sophistiqués à des logiciels commerciaux. Bien souvent, le tout se déroule sans tracas. Une expérience plus substantielleavec ces logiciels montrera qu'ils ont eux-aussi leurs défauts, leurs bogues et leurs erreurs de calcul. Sans connaître le résultat attendu, comment distinguer le vrai du faux des sorties statistiques?

Par exemple, que vaut l'expression $-9^{(.5)}$? Reconnaître qu'il s'agit de $\sqrt(-9)$ indique immédiatement que le résultat n'est pas réel (c'est un nombre complexe). Si ce calcul est demandé à **R**,


```r
-9^(.5)
#> [1] -3
```
celui-ci  retourne la réponse $-3$ à cause de la priorité des opérations, $-(9)^{.5}$. Était-ce la réponse désirée? 

Des idiosyncrasies computationnelles se retrouvent dans tous les logiciels. En avoir conscience est important pour le programmeur et reste trivial pour les expérimentateurs...
 
@Bennett10 montrent que les saumons de l'Atlantiques décédés ont des cognitions sociales. Ils placent sous imagerie par résonance magnétique fonctionnelle (IRMf) le saumon pendant une tâche de reconnaissance des émotions chez les humains. La Figure \@ref(fig:saumon) montre le résultat de leur analyse. Soit ils sont tombés sur une découverte étonnante en termes de cognition ichtyologique post-mortem, soit quelque chose cloche en ce qui concerne l'approche statistique utilisée.

<div class="figure" style="text-align: center">
<img src="image//saumon.PNG" alt="Cognitions sociales d'un saumon atlantique décédés. Tirés de Bennett et al. 2010, p.4" width="75%" />
<p class="caption">(\#fig:saumon)Cognitions sociales d'un saumon atlantique décédés. Tirés de Bennett et al. 2010, p.4</p>
</div>

Les points rouges de la Figure \@ref(fig:saumon) indiquent les congitions sociales du saumon. Plus sérieusement, ces chercheurs critiquent l'absence de contrôle de l'erreur de type I (faux positif) lors de comparaison multiple. Ce problème est d'autant plus important avec des humains sous IRMf, car ces situations comportent beaucoup de bruit statistiques, contrairement au saumon décédé (qui n'en produit pas du tout). Ils montrent bien qu'en absence de ce contrôle, l'analyse peut fournir des résultats farfelus. Il revient à l'expérimentateur de bien utiliser les analyses statistiques et de savoir ce que le logiciel fait et ne fait pas.

L'étude de @Bennett10 n'est qu'un canular. Les auteurs ont remporté le prix Ig Nobel en 2012, un prix scientifique pour de vrais chercheurs ayant réalisé une vraie étude *faisant d'abord rire, puis réfléchir*. 

En pratique, ce type de problème devrait être marginal...

@Eklund16 tentent de valider les méthodes statistiques derrière l'IRMf à l'aide de données réelles. Ils utilisent des données d'IRMf provenant de 499 personnes saines et en état de repos pour effectuer 3 millions d'analyses de groupes de tâches. En utilisant ces données nulles avec différents plans expérimentaux, ils estiment l'incidence des résultats significatifs (en théorie fixé à 5% de faux positifs pour un seuil de signification de 5 %). Toutefois, ils constatent que les progiciels les plus courants pour l'analyse de l'IRMf entraînent des taux de faux positifs allant jusqu'à 70 %. Ces résultats remettent en question la validité d'un certain nombre d'études utilisant l'IRMf et ont des conséquences importantes sur l'interprétation des résultats de neuro-imagerie.

Cette étude a fait un tollé dans la littérature scientifique. Bien que certains aspects de l'étude soient attaquables, il n'en demeure pas moins qu'elle exacerbe le danger de faire confiance aveuglément aux analyses statistiques.

L'objectif de ce court texte n'est pas de discrédité les analyses statistiques ou les chercheurs qui les emploient. Les statistiques sont très utiles et fournissent de l’information qu'il serait impossible d'obtenir autrement. Il s'agit principalemetn d'une mise en garde justifiant en partie l'approche pédagogique de ce livre.

Il est dit en partie, car le seconde, en filigrane de livre, repose sur la double approche d'apprentissage statistique et programmation. En programmant des modèles statistiques, le lecteur a une plus grande emprise sur ceux-ci. Il peut mieux les utiliser, les étudier et les modifier. Il peut s'en servir pour connaître et apprendre davantage. Certaines boîtes noires resteront irrémédiablement des boîtes noires pour le lecteur, mais plus il les démystifiera, mieux il comprendra ce qui se cache derrière les programmes statistiques.

La première section de ce livre justifie et explique le logiciel **R** et montre comment l'installer ainsi que quelques rudiments statistiques qui seront fort utiles pour le reste de la lecteur. La seconde section couvre ce qui sera probablement le plus important pour l'utilisateur : l'importation, la gestion et la visualisation des données. 

TODO


