

# Analyse de médiation

L'analyse de médiation est une analyse statistique de plus en plus populaire auprès des expérimentateurs, peu importe leur discipline. Cette analyse cherche à expliquer les mécanismes biologiques, psychologiques, cognitifs, etc., qui sous-tendent la relation entre une variable indépendante et une variable dépendante par l'inclusion d'une troisième variable, c'est-à-dire la variable médiatrice. L'intérêt pour cette technique est ainsi patent, puisqu'elle quantifie le degré selon lequel une variable participe à la transmission du changement d'une *cause* vers son *effet*. L'analyse de médiation peut contribuer à mieux comprendre la relation entre une variable indépendante et une variable dépendante lorsque ces variables n'ont pas de lien direct évident.

L'analyse de médiation est un sous-ensemble de l'analyse de trajectoire dans lequel le statisticien s'intéresse à la relation entre la variable indépendante $x$ sur la variable dépendante $y$ par l'intermédiaire de la variable médiatrice $m$. Elle s'inscrit dans un système d'équations. L'analyse de médiation se base sur les *liens indirects* qui existent dans ce système d'équations. Ces liens indirects sont ces relations intermédiaires qui intéressent le statisticien. 

Concevoir ce qu'est un lien indirect est parfois plus aisé en le comparant aux *liens directs*. Un lien direct, c'est la relation entre une variable indépendante et une dépendante, comme le coefficient de régression, par exemple. Le lien indirect, c'est la relation qui existe entre une variable indépendante et une dépendante à travers une ou plusieurs autres variables. 

Pour les fins de ce chapitre, l'analyse à un seul médiateur sera présentée (aussi nommé l'analyse de médiation simple).

## Analyse de médiation simple

Le diagramme de trajectoire correspondant au modèle de médiation simple^[La section est partiellement basée sur @Caron18.] (un seul médiateur) est présenté dans le panneau supérieur de la Figure \@ref(fig:simplemed). 

TODO


```r
hist(1:5)
```

<img src="12-Mediation_files/figure-html/simplemed-1.png" width="672" />


<!-- \begin{figure} -->
<!-- \begin{center} -->
<!-- \begin{tikzpicture}[very thick, >=stealth] -->
<!-- \Large -->
<!-- \tikzstyle{rect} = [rectangle, minimum width = 2cm, minimum height = 1cm, font=\LARGE] -->
<!-- \node (m) [draw, rect] at (3,3) {$m$}; -->
<!-- \node (x) [draw, rect] at (0,0) {$x$}; -->
<!-- \node (y) [draw, rect] at (6,0) {$y$}; -->
<!-- \node (cap1) at (3,-2) {a) Effet indirect}; -->
<!-- \node (x2) [draw, rect] at (0,-4) {$x$}; -->
<!-- \node (y2) [draw, rect] at (6,-4) {$y$}; -->
<!-- \node (cap1) at (3,-5.5) {b) Effet total}; -->
<!-- \draw[->] (x) to node [anchor = east] {$\beta_{21}$} (m); -->
<!-- \draw[->] (m) to node [anchor = west] {$\beta_{32}$} (y); -->
<!-- \draw[->] (x) to node [anchor = north] {$\beta_{31}$} (y); -->
<!-- \draw[->] (x2) to node [anchor = north] {$\sigma_{xy}$} (y2); -->
<!-- \end{tikzpicture} -->
<!-- \caption{Modèle de médiation simple} -->
<!-- \label{simplemed} -->
<!-- \end{center} -->
<!-- \end{figure} -->

Le cadran a) devrait être familier aux lecteurs, car il a été abordé dans le chapitre sur l'analyse de trajectoire. La Figure \ref{simplemed} peut également être représentée avec une matrice de coefficients de régression $\mathbf{B}$ dans laquelle se retrouvent les coefficients de régression qui relient les variables.

\begin{equation}
\mathbf{B} = 
\left( \begin{array}{ccc}
0 & 0 & 0 \\
\beta_{2,1} & 0 & 0 \\
\beta_{3,1} & \beta_{3,2} & 0 \\
\end{array} 
\right)
(\#eq:B)
\end{equation}

Dans ce cas-ci, $\beta_{2,1}$ signifie que la variable $x$ prédit le médiateur $m$, $\beta_{3,2}$ signifie que le médiateur prédit la variable $y$ et $\beta_{3,1}$ signifie que la variable $x$ prédit la variable $y$. En analyse de médiation, ces effets sont nommés des *effets directs*, comme l'effet direct de $x$ sur $y$, ou l'effet direct de $m$ sur $y$. Pour identifier un effet médiateur, le statisticien cherche l'*effet indirect* de $x$ sur $y$, c'est-à-dire l'effet de $x$ *passant* par $m$. L'effet indirect est $\beta_{2,1}\times\beta_{3,2}$. Ce résultat est dérivé notamment des travaux de @Wright34 sur la méthode de coefficients de trajectoires (*path coefficients*) qui un moyen flexible de relier les coefficients de régression entre les variables d'un système d'équations.

Lorsqu'il n'y a pas de $m$, la relation existante entre $x$ et $y$ est nommé l'*effet total* représenté par $\sigma_{x,y}$. Il est illustré à la Figure \ref{simplemed}b. Cela correspond au coefficient de régression entre x et y. Dans ce cas spécifique à deux variables, il s'agit également de la covariance entre $x$ et $y$. L'effet total peut être séparé en deux autres effets dont il fait la somme : l'effet direct de $x$ sur $y$ ($\beta_{31}$) et l'effet indirect. 

\begin{equation}
\sigma_{3,1} = \beta_{3,1} + \beta_{2,1} \times \beta_{3,2}
(\#eq:etot)
\end{equation}

Un avantage de l'équation \@ref(eq:etot) est qu'elle met en relation l'interdépendance des quatre composantes pour dériver un effet total, direct ou indirect. Si trois des mesures sont connues, la quatrième est dérivable avec un peu d'algèbre. Un autre avantage sur la plan statistique est également de montrer le lien intime qui existe entre la matrice de covariance et les coefficients de régression.

## Analyse de l'effet indirect

Qu'en est-il du test d'hypothèse de l'effet indirect? Il existe trois méthodes principales pour tester si l'effet indirect est significatif. Il s'agit de la méthode d'étape causale (*causal step method*), la plus populaire étant celle de Baron et Kenny [@BK], la méthode delta multivarié (*multivariate delta method*) [@Rao02] duquel le test de Sobel [@Sobel82] est un cas particulier et (c) les méthodes de bootstrap [@Efron79]. Chacune de ces méthodes sera détaillée ci-dessous.

## La méthode d'étape causale

La méthode d'étape causale aussi connue sous le nom de test de Baron-Kenny est un test séquentiel d'hypothèse afin de vérifier l'existence du lien indirect. Ce test est présenté à des fins historiques uniquement et parce que certains chercheurs l'exigent et l'utilisent encore. Par contre, dans la littérature méthodologique, il n'est plus recommandé, étant rejeté en faveur d'autres méthodes plus adéquates tant sur le plan statistique que conceptuel. La méthode provenant des années 80 lorsque les ordinateurs personnels n'étaient pas encore dans toutes les chaumières a certainement du mérite pour l'époque, mais n'est plus nécessaire aujourd'hui.

Pour réaliser le test en bonne et due forme, trois tests d'hypothèse sont réalisés en séries. 

1. Existe-t-il une relation entre $x$ et $y$ pour l'effet total? Autrement dit, avant de procéder à l'analyse du lien indirect, y a-t-il un lien entre les variables indépendantes et dépendantes.

2. Existe-t-il une relation directe entre $x$ et $m$? Y a-t-il un lien entre le variable indépendante et le médiateur?

3. Existe-t-il une relation directe entre $m$ et $y$? Y a-t-il un lien entre le médiateur et la variable dépendante.

Les tests 2 et 3 visent à vérifier si le médiateur a bel et bien un rôle  à jouer entre la variable indépendante et dépendante. Le rejet de l'une ou l'autre de ces trois hypothèses mènerait certainement à un statisticien à douter d'une relation entre les variables. Comment pourrait-il y avoir un lien indirect, si l'un de ces liens n'était pas soutenu par les données.

En guise de quatrième test, souvent les chercheurs suivant cette tendance d'analyse test si la médiation est *complète* ou *partielle*. La médiation complète signifie que l'entièreté du lien total entre $x$ et $y$ est maintenant attribuable à l'ajout de $m$. Ce résultat s'observe lorsque le lien direct entre $x$ et $y$ (lorsque $m$ est inclus pour prédire $y$) n'est pas significatif contrairement à la première étape où le lien total, lui, était significatif. Si le lien direct entre $x$ et $y$ était toujours significatif même après avoir ajouté le $m$ dans la prédiction de $y$, alors la médiation est dite partielle.

La syntaxe montre comment la méthode d'étape causale pourrait être programmée dans **R**. Il y a trois régressions, une pour chaque test d'hypothèse et quatre étapes sous forme de conditionnel (les trois hypothèses plus le type de médiation). Si une des conditions (`if`) n'est pas respectée, le test retourne l'hypothèse nulle. À chacune des étapes, la valeur-$p$ du coefficient a testé est extrait et comparé à l'erreur de type I fixé à l'avance ($\alpha$). Le test doit être significatif pour procéder l'étape suivante. À la toute fin, l'hypothèse nulle est rejetée et le type de médiation (complète ou partielle) est rapporté.


```r
BK <- function(donnees, alpha = .05){
  # alpha est l'erreur de type I
  # Créer l'hypothèse nulle.
  # Le test tentera de rejeter cette hypothèse.
  Decision = "L'effet indirect est non significatif"
  
  # Première régression
  # Est-ce que l'effet total est significatif?
  etape1 <- lm(formula = y ~ x, data = donnees)
  pC <- summary(etape1)$coefficients["x", "Pr(>|t|)"]
  
  if (pC <= alpha){
    # Si le coefficient rho_31 est significatif, alors
    # Deuxième régression
    # Est-ce que l'effet direct de x vers m est significatif?
    etape2 <- lm(formula = m ~ x, data = donnees)
    pA <- summary(etape2)$coefficients["x", "Pr(>|t|)"]
    
    if (pA <= alpha){
      # Si le coefficient beta_21 est significatif, alors
      # Troisième régression
      etape3 <- lm(formula = y ~ x + m, data = donnees)
      pB <- summary(etape3)$coefficients["m", "Pr(>|t|)"]
      
      # Enregistrer le résultats, si l'effet de médiation a lieu
      Sig <- (pB <= alpha)
      
      if (Sig){
        # S'il y médiation, est-elle partielle ou complète?
        # Est-ce que Beta_31 est significatif?
        if (summary(etape3)$coefficients["x", "Pr(>|t|)"] <= alpha){
          # Si oui,
          Decision <- 
            "L'effet indirect est significatif et la médiation est partielle"
        } else {
          # Si non,
          Decision <- 
            "L'effet indirect est significatif et la médiation est complète"
        }
      }
    }
  }
  cat(Decision) # Sortir le résultats dans la console.
}
```

Plusieurs raisons suggèrent de ne pas utiliser la méthode d'étape causale. D'abord, comme une série de tests d'hypothèse est réalisée, l'erreur de type I est différente de celui fixé. Il y a trois hypothèses nulles à rejeter, chacune ayant un seuil $\alpha$. La vraie erreur de type I est égale la probabilité de rejeter toutes ces hypothèses nulles accidentellement. Cela correspond à $\alpha^3$. Avec $\alpha=.05$, cela signifie le taux est de $\alpha^3=.05^3= 1.25\times 10^{-4}$, bien plus bas que l'erreur de type I fixé. Cela entraîne une perte de puissance, c'est-à-dire de trouver des effets indirects lorsqu'ils sont vrais.

Une seconde raison est que l'absence d'effet total entre la variable indépendante et dépendante, test si $x$ est lié à $y$ sans tenir de compte de $m$, n'est pas une hypothèse obligatoire. Les deux autres hypothèses non plus (quoi qu'elles sont un peu plus dures à justifier) d'ailleurs. Il est tout à fait possible de 

## La méthode delta multivarié 

La méthode delta multivarié souvent appelée le test de Sobel, auteur qui l'a popularisé pour l'analyse des effets indirects est une méthode ayant recours à l'erreur type approximative de l'effet indirect. 

Une première raison de ne pas recourir



```r
mdm <- function(donnees, alpha = 0.05){
  # alpha est l'erreur de type I
  
  # Réaliser les deux régressions
  etape1 <- lm(formula = m ~ x, data = donnees)
  etape2 <- lm(formula = y ~ x + m, data = donnees)
  
  # Extraire les statistiques
  # Les coefficients de régression
  beta_21 <- etape1$coefficients["x"]
  beta_32 <- etape2$coefficients["m"]
  # Leur erreur standard
  SEa <- summary(etape1)$coefficients["x", "Std. Error"]
  SEb <- summary(etape2)$coefficients["m", "Std. Error"]
  
  # Calcul du score z de l'effet indirect
  SE <- sqrt(beta_21^2 * SEb^2 + beta_32^2 * SEa^2)
  z <- beta_21 * beta_32 / SE
  
  # Décision
  if(abs(z) >= qnorm(1-alpha/2)){
    cat("L'effet indirect est significatif")  
  } else {
    cat("L'effet indirect n'est pas significatif")  
  }
}
```

## Le bootstrap

La technique la plus recommandée dans la littérature méthodologique est la méthode du bootstrap. Elle a effectivement plusieurs avantages comparativement à ses adversaires. D'abord, elle ne présuppose par une distribution de l'effet indirect, ce que sous-entend la méthode delta multivarié. 


Dans les faits, il est assez rare de voir des différences notables.

Elle a une erreur de type I appropriée contraire aux deux autres.

Le bootstrap se base sur trois étapes :

1. Sélectionner aléatoirement et avec remplacement les unités d'un jeu de données;

2. Calculer l'indice statistique désirée;

3. Réitérer ces étapes un nombre très élevé de fois.

Le test d'hypothèse n'échappe pas à cette logique.


```r
boot <- function(donnees, alpha = .05, reps = 5000){
  # alpha est l'erreur de type I
  # reps  est le nombre de répétitions
  
  # Créer l'hypothèse nulle.
  # Le test tentera de rejeter cette hypothèse.
  Decision = "L'effet indirect est non significatif"
  
  # Infomrations nécessaire au bootstrap.
  n = nrow(jd)                  # Nombre d'unités
  effet.indirect = as.numeric() # Variable vide pour enregistrer
  
  # La boucle
  for (i in 1:reps){
    # Sélectionner aléatoirement et avec remplacement les unités
    # d'un jeu de données
    index <- sample(n, replace = TRUE)
    D = jd[index,]
    
    # Calculer l'indice statistique désirée
    b21 <- summary(lm(y ~ x, data = D))$coefficients["x", "Estimate"]
    b32 <- summary(lm(y ~ x + m, data = D))$coefficients["m", "Estimate"]
    
    effet.indirect[i] = b21 * b32
  }
  
  # Créer l'intervalle de confiance avec alpha 
  CI <- quantile(effet.indirect, probs = c(alpha/2, 1-alpha/2))
  
  # Si l'intervalle ne contient pas 0, l'hypothèse nulle est rejetée.
  if(prod(CI > 0)){Decision = "L'effet indirect est significatif"}
  cat(Decision) # Sortir le résultats dans la console.
}
```

## La création de données

La création de données d'un modèle de médiation est assez rudimentaire, particulièrement après la lecture du chapitre sur les techniques de modélisation avancées. En fait, dans ce chapitre, un modèle de médiation simple (à trois variables) est utilisé. Par contre, le chapitre n'insiste pas sur les effets indirects, ce qui sera fait ici.

Pour l'exemple ici

\begin{equation}
\mathbf{B} = 
\left( \begin{array}{ccc}
0 &  0 & 0 \\
.5 &  0 & 0 \\
-.3 & .4 & 0 \\
\end{array} 
\right)
(\#eq:Bex)
\end{equation}


```r
# Paramètres du modèle
set.seed(1102)
n <- 80
B <-  matrix(c(0, 0, 0,
               .5, 0, 0,
               -.4, .6, 0), 
             ncol = 3, nrow = 3, byrow = TRUE)
V = c(1, 1, 1) # Variance des variables

# Première option : 
# Création de la matrice de covariance à partir de B et V
S <- beta2cov(B = B, V = V)   
# Vérifier que la fonction `beta2cov()` est bien dans l'environnement
# sinon la ligne précédente ne fonctionnera pas.

# Création de la base de données avec la matrice de covariance
jd <- MASS::mvrnorm(n = n, mu = c(0, 0, 0), Sigma = S)
colnames(jd) <- c("x", "m", "y")

# Deuxième option : 
# Création des données en système d'équations
x <- rnorm(n, sd = V[1])

em <- rnorm(n = n, sd = sqrt(V[2] - B[2,1]^2 * V[1]))
m <- B[2,1] * x + em

sd_ey = sqrt(V[3] - (B[3,1]^2 * V[1] + 
                       B[3,2]^2 * V[2] + 
                       2 * B[3,1] * B[3,2] * V[1]^.5 * V[2]^.5 * B[2,1]))
ey <- rnorm(n = n, 
            sd = sd_ey)
y <- B[3,1] * x + B[3,2] * m + ey

# Création de la base de données avec les trois variables
jd <- data.frame(x = x,
                 m = m,
                 y = y)
```

La base de données est ainsi créée en suivant les étapes de chapitre sur les techniques avancées de modélisation. Maintenant, il reste à déterminer l'effet indirect dans le jeu de données. Le jeu de données issu du système d'équations sera utilisé pour la suite.

Comme les fonctions maisons pour la méthode d'étape causale (`BK()`), et la méthode delta multivarié (`mdm()`) et la méthode bootstrap (`boot()`), il est possible de les utiliser pour vérifier l'effet indirect.


```r
BK(donnees = jd)
#> L'effet indirect est non significatif
mdm(donnees = jd)
#> L'effet indirect est significatif
boot(donnees = jd)
#> L'effet indirect est non significatif
```

Toutes les analyses confirment la présence d'un effet indirect.

Le défaut des fonctions maison (`BK()`,`mdm()` et `boot()`) est certainement qu'elles ne font que tester les effets indirects. Une fonction plus intéressante serait d'afficher toutes les sorties, soit les coefficients de régressions, leur erreur type, leur intervalle de confiance ou toutes autres informations jugées pertinentes.

## Analyse complète

La fonction suivante extrait tous les coefficients de régression d'un modèle récursif. L'ordre des variables est ici d'une énorme importance, puisque c'est l'ordre des variables dans le jeu de données qui déterminer l'ordre *causal* des variables: la première étant la *cause* de toutes, et la dernière l'*effet* de toutes.


```r
indirect <-  function(donnees){
  COV <-  cov(donnees)   # Matrice de covariance
  p <-  ncol(COV)        # Nombre de variable
  
  # Calculer la matrice des coefficients
  # régression. Le lecteur assidu aura reconnu 
  # la fonction `cov2beta()`
  BETA <-  matrix(0, p, p)  
  for(i in 1:(p-1)){
    R <-  solve(COV[1:i,1:i], COV[1+i,1:i])
    BETA[i+1, 1:i] <-  R
  }
  # Extraire les coefficients de régression en vecteur
  est <-  as.matrix(BETA[lower.tri(BETA)])
  
  # Libellés des effets directs
  name <-  colnames(COV)
  label <-  matrix(name[combn(p, 2)], (p * (p-1) / 2), 2, byrow = TRUE)
  rname <-  apply(FUN = paste, as.matrix(label[,1]), MARGIN = 2, "->")
  rname <-  apply(FUN = paste, rname, label[,2], MARGIN = 2, "")
  row.names(est) <-  rname
  
  # Lister tous les effets indirects possibles
  if(p != 3){
    # S'il y a plus de 3 variables, identifier les niveaux supérieurs
    # d'effets indirects (à 4 variables et plus)
    listeffects <-  mapply(combn, p, 3:p)
  } else {
    # S'il y a 3 variables, il n'y a qu'un niveau
    listeffects <-  list((matrix(1:3, 3, 1)))
  }
  
  
  # Extraire tous les effets indirects
  for(i in 1:length(listeffects)){    # Nombre de niveaux d'effet indirect
    J <-  ncol(listeffects[[i]])      # Nombre d'effet du niveau i
    for(j in 1:J){                
      ide <-  listeffects[[i]][,j]    # Identifier l'effet en cours
      B <-  BETA[ide, ide]            # Leur coefficients de régression 
      B <-  B[-1, -ncol(B)]           # Retirer les coefficients superflus
      e <-  as.matrix(prod(diag(B)))  # Calculer l'effet indirect
      rownames(e) <- paste(name[ide], # Le libellé
                           collapse = " -> ")
      est <- rbind(est, e)            # Ajouter l'effet aux autres
    }
  }
  
  # Ajout les effets totaux
  # Calculs
  totald <-  as.matrix(solve(COV[1,1], COV[p, 1]))
  totali <-  as.matrix(totald - BETA[p, 1])
  
  # Libeller
  rownames(totali) <- paste("total indirect",
                            colnames(COV)[1],
                            "->",
                            colnames(COV)[p])
  rownames(totald) <-  paste("total effect",
                             colnames(COV)[1],
                             "->",
                             colnames(COV)[p])
  
  # Mettre le tout en commun
  estimates <-  rbind(est, totali, totald)
  return(estimates)
}
```

Pour tester ce code, il vaut la peine de tester chacune des étapes de la syntaxe précédente avec une matrice de covariance.


```r
# Nombre de variables
p <- 4
# Voici la matrice de covariance utilisée
COV <- matrix(c(3, 2, 1, 4,
                2, 6, 2, 5,
                1, 2, 5, 1,
                4, 5, 1, 4), ncol = p, nrow = p)
colnames(COV) = letters[1:p]
rownames(COV) = letters[1:p]
# Normalement, celle-ci serait obtenue d'un échantillon
COV
#>   a b c d
#> a 3 2 1 4
#> b 2 6 2 5
#> c 1 2 5 1
#> d 4 5 1 4
```


1. Transformer la matrice de covariance en matrice de coefficient de régression.


```r
# Les prochaines calcules la matrice de coefficients
# régression. Le lecteur assidu aura reconnu 
# la fonction `cov2beta()`
BETA <-  matrix(0, p, p)  
for(i in 1:(p-1)){
  R <-  solve(COV[1:i,1:i], COV[1+i,1:i])
  BETA[i+1, 1:i] <-  R
}
BETA
#>       [,1]  [,2]   [,3] [,4]
#> [1,] 0.000 0.000  0.000    0
#> [2,] 0.667 0.000  0.000    0
#> [3,] 0.143 0.286  0.000    0
#> [4,] 1.033 0.567 -0.233    0
```

2. Vectoriser `BETA`. 


```r
# Extraire les coefficients de régression en vecteur
est <-  as.matrix(BETA[lower.tri(BETA)])
est
#>        [,1]
#> [1,]  0.667
#> [2,]  0.143
#> [3,]  1.033
#> [4,]  0.286
#> [5,]  0.567
#> [6,] -0.233
```

3. Libeller les effets directs.


```r
# Libellés des effets directs
name <-  colnames(COV)
label <-  matrix(name[combn(p, 2)], (p * (p-1) / 2), 2, byrow = TRUE)
rname <-  apply(FUN = paste, as.matrix(label[,1]), MARGIN = 2, "->")
rname <-  apply(FUN = paste, rname, label[,2], MARGIN = 2, "")
row.names(est) <-  rname
# Beaucoup de syntaxe pour au final bien peu, mais
# le résultat est élégant
est
#>           [,1]
#> a -> b   0.667
#> a -> c   0.143
#> a -> d   1.033
#> b -> c   0.286
#> b -> d   0.567
#> c -> d  -0.233
```

4. Lister tous les effets indirects possibles


```r
# Lister tous les effets indirects possibles
if(p != 3){
  # S'il y a plus de 3 variables, identifier les niveaux supérieurs
  # d'effets indirects (à 4 variables et plus)
  listeffects <-  mapply(combn, p, 3:p)
} else {
  # S'il y a 3 variables, il n'y a qu'un niveau
  listeffects <-  list((matrix(1:3, 3, 1)))
}
listeffects
#> [[1]]
#>      [,1] [,2] [,3] [,4]
#> [1,]    1    1    1    2
#> [2,]    2    2    3    3
#> [3,]    3    4    4    4
#> 
#> [[2]]
#>      [,1]
#> [1,]    1
#> [2,]    2
#> [3,]    3
#> [4,]    4
```

Dans cet exemple, il y a deux niveaux d'effets indirects : un niveau à trois variables dont il y a quatre combinaisons possibles et un second niveau à quatre variables dont il n'y a qu'une combinaison.

5. Extraire tous les effets indirects et les libeller adéquatement.


```r
# Extraire tous les effets indirects
for(i in 1:length(listeffects)){  # Nombre de niveaux d'effet indirect
  J <-  ncol(listeffects[[i]])      # Nombre d'effet du niveau i
  for(j in 1:J){                
    ide <-  listeffects[[i]][,j]    # Identifier l'effet en cours
    B <-  BETA[ide, ide]            # Leur coefficients de régression 
    B <-  B[-1, -ncol(B)]           # Retirer les coefficients superflus
    e <-  as.matrix(prod(diag(B)))  # Calculer l'effet indirect
    rownames(e) <- paste(name[ide], # Le libellé
                         collapse = " -> ") 
    est <- rbind(est, e)            # Ajouter l'effet aux autres
  }
}
est
#>                     [,1]
#> a -> b            0.6667
#> a -> c            0.1429
#> a -> d            1.0333
#> b -> c            0.2857
#> b -> d            0.5667
#> c -> d           -0.2333
#> a -> b -> c       0.1905
#> a -> b -> d       0.3778
#> a -> c -> d      -0.0333
#> b -> c -> d      -0.0667
#> a -> b -> c -> d -0.0444
```

6. Calculer les effets totaux de la première variable et mettre le tout en commun.


```r
# Ajout les effets totaux
# Calculs
totald <-  as.matrix(solve(COV[1,1], COV[p, 1]))
totali <-  as.matrix(totald - BETA[p, 1])

# Libeller
rownames(totali) <- paste("total indirect",
                          colnames(COV)[1],
                          "->",
                          colnames(COV)[p])
rownames(totald) <-  paste("total effect",
                           colnames(COV)[1],
                           "->",
                           colnames(COV)[p])

# Mettre le tout en commun
estimates <-  rbind(est, totali, totald)
estimates
#>                          [,1]
#> a -> b                 0.6667
#> a -> c                 0.1429
#> a -> d                 1.0333
#> b -> c                 0.2857
#> b -> d                 0.5667
#> c -> d                -0.2333
#> a -> b -> c            0.1905
#> a -> b -> d            0.3778
#> a -> c -> d           -0.0333
#> b -> c -> d           -0.0667
#> a -> b -> c -> d      -0.0444
#> total indirect a -> d  0.3000
#> total effect a -> d    1.3333
```

Magnifique! Toutefois, le statisticien s'intéresse rarement qu'aux coefficients de régression. Il aime aussi connaître l'erreur type (erreur standard), la valeur-$p$, ou peut-être même souhaite-t-il calculer un intervalle de confiance. Une solution bien simple qui ne nécessitera que peu de syntaxe, en plus de respecter les postulats sous-jacents à l'analyse de médiation est le bootstrap. Les éléments fondamentaux du bootstrap sont toujours les mêmes : prendre un jeu de données avec des unités rééchantillonnées aléatoirement avec remplacement, calculer les indices désirés, et réitérer un nombre élevé de fois.

Avantageusement la fonction maison `indirect()` calcule tous les indices statistiques pertinents. Il ne reste que le rééchantillonnage et les réplications à programmer.


```r
# Le bootstrap de `indirect()` pour le jeu de données en exemple
# Informations préliminaires
alpha <- .05         # Erreur de type I
n <-  nrow(jd)       # Nombre d'unités
reps <-  5000        # Nombre de réplications

nest = sum(choose(p, 2:p), 2) # Nombre d'estimateurs

# Vérifier que la fonction `indirect()`  est bien 
# dans l'environnement
Est <-  indirect(jd)

# Variable vide (Est) pour enregistrer les résultats
# avec comme 1ere colonne, les résultats originaux
Est <-  data.frame(Est = Est, 
                   X = matrix(0, ncol = reps)) 

# La boucle
# Elle commence à 2 à cause de la première colonne
for(i in 2:(reps+1)){
  index <- sample(n, replace = TRUE)
  D <- jd[index,]
  Est[,i] <-  indirect(D)
}

# Mettre le tout en commun
Resultats <- data.frame(
  Estimates = Est$Est,
  S.E. = apply(Est, MARGIN = 1, FUN = sd), 
  CIinf = apply(Est, MARGIN = 1, FUN = quantile, probs = alpha/2),
  CIsup = apply(Est, MARGIN = 1, FUN = quantile, probs = 1-alpha/2)
)
Resultats
#>                       Estimates   S.E.   CIinf   CIsup
#> x -> m                    0.317 0.0798  0.1551  0.4657
#> x -> y                   -0.396 0.0876 -0.5706 -0.2240
#> m -> y                    0.634 0.1289  0.3800  0.8901
#> x -> m -> y               0.201 0.0633  0.0872  0.3351
#> total indirect x -> y     0.201 0.0633  0.0872  0.3351
#> total effect x -> y      -0.195 0.0835 -0.3607 -0.0315
```

La variable `Resultats` contient tous les résultats pertinents. La colonne `Resultats$Estimates` retourne tous les coefficients de régression avec leur erreur type (erreur standard ou *standard error*) en deuxième colonne. Les dernières colonnes donnent les intervalles de confiance inférieurs et supérieurs. Comme aucune ne contient la valeur 0 au sein de son intervalle, alors elles sont toutes significatives.



TODO


```r
plot(1:5)
```

<img src="12-Mediation_files/figure-html/resmed-1.png" width="672" />


<!-- \begin{figure} -->
<!-- \begin{center} -->
<!-- \begin{tikzpicture}[very thick, >=stealth] -->
<!-- \Large -->
<!-- \tikzstyle{rect} = [rectangle, minimum width = 2cm, minimum height = 1cm, font = \LARGE] -->
<!-- \node (m) [draw, rect] at (3,3) {$m$}; -->
<!-- \node (x) [draw, rect] at (0,0) {$x$}; -->
<!-- \node (y) [draw, rect] at (6,0) {$y$}; -->
<!-- \node (cap1) at (3,-2) {a) Effet indirect}; -->
<!-- \node (x2) [draw, rect] at (0,-4) {$x$}; -->
<!-- \node (y2) [draw, rect] at (6,-4) {$y$}; -->
<!-- \node (cap1) at (3,-5.5) {b) Effet total}; -->
<!-- \draw[->] (x) to node [anchor = east] {$0.32*$} (m); -->
<!-- \draw[->] (m) to node [anchor = west] {$0.63*$} (y); -->
<!-- \draw[->] (x) to node [anchor = north] {$-0.40*$ } (y); -->
<!-- \draw[->] (x2) to node [anchor = north] {$-0.20*$} (y2); -->
<!-- \end{tikzpicture} -->
<!-- \caption{Résultats de la médiation} -->
<!-- \label{resmed} -->
<!-- \end{center} -->
<!-- \end{figure} -->

Les résultats sont illustrés dans la figure \ref{resmed}. Les coefficients sont ajoutés à leurs trajectoires respectivement. Par bonnes mesures, des étoiles de significativité, * , l'ultime symbole de découvertes scientifiques,  sont ajoutés aux trajectoires dont les intervalles de confiance n'incluent pas 0. Il ne reste qu'à rapporter l'effet indirect dans le texte ou un tableau d'un article scientifique, comme le tableau \@ref(tab:res).

<table class=" lightable-classic table" style='font-family: "Arial Narrow", "Source Sans Pro", sans-serif; width: auto !important; margin-left: auto; margin-right: auto; margin-left: auto; margin-right: auto;'>
<caption>(\#tab:res)Symboles logiques et leur signification</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:center;"> Estimates </th>
   <th style="text-align:center;"> S.E. </th>
   <th style="text-align:center;"> CIinf </th>
   <th style="text-align:center;"> CIsup </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> x -&gt; m </td>
   <td style="text-align:center;"> 0.317 </td>
   <td style="text-align:center;"> 0.080 </td>
   <td style="text-align:center;"> 0.155 </td>
   <td style="text-align:center;"> 0.466 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> x -&gt; y </td>
   <td style="text-align:center;"> -0.396 </td>
   <td style="text-align:center;"> 0.088 </td>
   <td style="text-align:center;"> -0.571 </td>
   <td style="text-align:center;"> -0.224 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> m -&gt; y </td>
   <td style="text-align:center;"> 0.634 </td>
   <td style="text-align:center;"> 0.129 </td>
   <td style="text-align:center;"> 0.380 </td>
   <td style="text-align:center;"> 0.890 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> x -&gt; m -&gt; y </td>
   <td style="text-align:center;"> 0.201 </td>
   <td style="text-align:center;"> 0.063 </td>
   <td style="text-align:center;"> 0.087 </td>
   <td style="text-align:center;"> 0.335 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> total indirect x -&gt; y </td>
   <td style="text-align:center;"> 0.201 </td>
   <td style="text-align:center;"> 0.063 </td>
   <td style="text-align:center;"> 0.087 </td>
   <td style="text-align:center;"> 0.335 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> total effect x -&gt; y </td>
   <td style="text-align:center;"> -0.195 </td>
   <td style="text-align:center;"> 0.084 </td>
   <td style="text-align:center;"> -0.361 </td>
   <td style="text-align:center;"> -0.031 </td>
  </tr>
</tbody>
</table>

Calculer les valeurs-$t$ et valeurs-$p$ est envisageable en utilisant les résultats déjà recueillis. La valeur-$t$ est le ratio entre l'estimateur et son erreur type, la valeur-$p$ est la rareté d'observer cette valeur-$t$ ou une valeur plus rare par rapport à l'hypothèse nulle avec un degré de liberté de `dl = n - p`, soit plus exactement le nombre d'unités moins le nombre de variables indépendantes.


```r
Resultats$t.value <- Resultats$Estimates / Resultats$S.E.
Resultats$p.value <- (1 - pt(abs(Resultats$t.value), df = n - p)) * 2
round(Resultats, 3) # Résultats arrondis à 3 décimales
#>                       Estimates  S.E.  CIinf  CIsup t.value
#> x -> m                    0.317 0.080  0.155  0.466    3.97
#> x -> y                   -0.396 0.088 -0.571 -0.224   -4.52
#> m -> y                    0.634 0.129  0.380  0.890    4.92
#> x -> m -> y               0.201 0.063  0.087  0.335    3.17
#> total indirect x -> y     0.201 0.063  0.087  0.335    3.17
#> total effect x -> y      -0.195 0.084 -0.361 -0.031   -2.34
#>                       p.value
#> x -> m                  0.000
#> x -> y                  0.000
#> m -> y                  0.000
#> x -> m -> y             0.002
#> total indirect x -> y   0.002
#> total effect x -> y     0.022
```

Si les coefficients de régression standardisés étaient préférés, ceux-ci sont obtenables simplement en standardisant le jeu de données, puis rouler l'analyse de médiation de nouveau. Pour standardiser rapidement, `z.donnees = apply(donnees, MARGIN = 2, FUN = scale)` applique (`apply()`) la fonction `FUN = scale` qui standardise les données (`donnees`) par colonne `MARGIN = 2`. 

## Les packages

Le présent chapitre ne fait que gratter la surface de ce qu'il est possible de faire avec l'analyse de médiation. Des articles comme @Caron18 et @Lemardeletsoumis donnent des exemples de syntaxe **R** en plus d'approfondir l'analyse. Il existe plusieurs packages **R** pour réaliser l'analyse de médiation, comme `mediation` [(Tingley et al., 2014) [@mediation] et `Rmediation` [@Rmediation], tous les deux ayant leur propre documentation. Pour des analyses plus compliquées recourant aux équations structurelles, comme `lavaan` [@lavaan], mais aussi bien d'autres pourront être utile. Toutefois, ce chapitre espère avoir convaincu le lecteur que l'analyse peut être relativement aisément *fait maison*




