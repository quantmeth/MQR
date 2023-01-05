# (PART) Jeux de données {-}

# Entrer

S'il y a bien une caractéristique de **R** qui rebute les nouveaux utilisateurs, c'est certainement la saisie de données qui est n'est pas mise au premier plan. Lorsque le logiciel s'ouvre, que ce soit **R** ou **R**Studio, l'aspect *table de données* n'existe pas. Un tout nouvel utilisateur habitué aux logiciels traditionnels reste pantois : où sont les données?

Conceptuellement, **R** [importe][Importer] des données pour les [manipuler] t [produire des graphiques][Visualiser]. Elles ne sont pas entrées dans le logiciel. Il existe toutefois quelques méthodes pour ce faire, dont en voici une courte liste. **Ces méthodes sont présentées; elles ne sont pas recommandées**.
  
## `data.entry()` (`R-base`)

De base, **R** offre la possibilité d'entrer des données dans un tableur avec la commande `jd <- data.entry()`. Si une base de données est demandée comme argument (p. ex., `data.entry(data <- jd)`), alors le jeu de données s'ouvre. Il est aussi possible d'ouvrir le fichier avec des variables déjà créées avec **R**.

Si l'utilisateur désire un tableur vierge, alors il  doit taper `data.entry(1)` dans la console pour ouvrir le tableur avec une seule valeur (`1`)^[Il pourrait s'agir d'autres chose, il faut au moins un vecteur.]. L'utilisateur peut alors modifier les noms de colonnes et entrer les données comme dans un logiciel traditionnel. La Figure\ \@ref(fig:dataentry) montre l'interface bien moins attrayante que celles des compétiteurs.

<div class="figure" style="text-align: center">
<img src="image//data_entry.PNG" alt="Ouverture du tableur R" width="75%" />
<p class="caption">(\#fig:dataentry)Ouverture du tableur R</p>
</div>

Lorsque l'entrée de données est terminée, l'utilisateur doit sauvegarder le jeu de données ou l'environnement de travail qui pourront être importés pour de futures utilisations ou entrées (voir la section [Sauvegarder un jeu de données]). En général, l'utilisateur qui entre manuellement ses données préférera certainement un autre tableur, puis [importer] ses données, mais **R** est en mesure de faire ce travail. 

## `data_edit()` (`DataEditR`)

Comme il arrive régulièrement, un problème avec **R** se résout avec un package. Il existe un package qui permet de faire l'entrée de données en tableur avec **R**. Le package `DataEditR` [@DataEditR] est une interface utilisateur graphique pour la saisi de données. Il résout l'un de plus grands défis lorsqu'un utilisateur migre des tableurs traditionnels vers **R** : une feuille de calcul interactive où il est possible de pointer et cliquer pour modifier, ajouter, supprimer des donnes vers un mode strict de syntaxe.

Pour démarrer, il faut d'abord installer le package, puis l'appeler. Pour commencer à entrer des données, la syntaxe `data_edit()` est suffisante. Pour ouvrir un jeu de données, il suffit de l'ajouter en argument `data_edit(jd)`.

Une fois l'interface ouvert, il est possible de manipuler le jeu de données avec les options affichés et avec le clic droit qui permettra notamment d'ajouter des lignes et des colonnes.


```r
# Pour installer le package
install.packages("DataEditR")

# Pour rendre la package accessible
library("DataEditR")

# La fonction
data_edit()
```

Il est recommandé de ne laisser que les données brutes, toutes les modifications et manipulations doivent rester en syntaxe **R** dans un script associé au jeu de données. Lorsque les entrées sont terminées, sauvegarder la base de données, préférablement en extension .csv. Il est aussi possible de sortir le tableur en tableau de données en assignant la fonction à une variable comme `jd <- data_edit()`.

<div class="figure" style="text-align: center">
<img src="image//editR.PNG" alt="Ouverture du tableur de DataEditR" width="75%" />
<p class="caption">(\#fig:editr)Ouverture du tableur de DataEditR</p>
</div>

En général, l'utilisateur doit [importer] ces données dans l'environnement **R**. Il faut même le faire avec `data_edit()` à chaque ouverture d'un nouvelle séance, pour poursuivre l'entrée ou réaliser des manipulations manuelles.
