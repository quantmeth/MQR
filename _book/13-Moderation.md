


# L'analyse de modération

L'analyse de modération^[La section est partiellement basée sur @Caron20.] est une analyse statistique très populaire dans laquelle la relation entre la variable dépendante ($y$) et la variable indépendante ($x$) est altérée par une tierce variable, la variable modératrice ($w$). Aussi appelée modérateur, elle interagit de sorte à accentuer ou amenuiser la force, voire même la direction, de la relation entre $x$ et $y$. 

Bien que la modération ait son chapitre désigné, elle a déjà été rencontrée dans ce livre, notamment, dans les analyses de base (ANOVA) et la régression. L'analyse de modération dans son essence correspond à étudier un effet d'interaction dans un modèle linaire, ou autrement dit, la multiplication entre deux variables, ici $x \times w$. Ainsi, en recourant aux fonctions `lm()` ou `aov()`, la modération se commande en employant le symbole `*` comme `lm(y ~ x * w)` ou `aov(y ~ x * w)`. Toutefois, ayant ses défis qui lui sont propres en création de données et en interprétation, le chapitre suivant propose une description de l'analyse de modération.

Sur le plan quantitatif, l'analyse de modération est un modèle linéaire général réalisé en une seule étape (soit une analyse de la variance ou une régression, en fonction des variables concernées) dans laquelle une
variable dépendante, $y$, est prédite par trois variables, la variable
variable indépendante, $x$, l'effet simple se la variable modératrice, $w$, et leur produit $x \times w=xw$. En termes d'analyse de la variance,
le produit  $xw$ est une interaction. En d'autres termes, dans un le modèle linéaire général (ANOVA, régression), un modérateur se subsume à une interaction. Mathématiquement, la relation s'exprime comme l'équation \@ref(eq:moderation)

\begin{equation}
y = \beta_0 + \beta_1 x + \beta_2 w + \beta_3 (x \times w) + \epsilon_y
(\#eq:moderation)
\end{equation}

où les $beta_i$ sont les coefficients de régression reliant la variable correspondante à la variable dépendante.  

\begin{figure}
\center
\begin{tikzpicture}[very thick, scale=1.80, >=stealth']
\Large
\tikzstyle{rect} = [rectangle, minimum width = 2.25cm, minimum height = 1cm, font = \LARGE]
\node (x) [draw, rect] at (0,0) {$x$};
\node (y) [draw, rect] at (3,0) {$y$};
\node (w) [draw, rect] at (1.5,1.5) {$w$};
\draw (w) -- (1.5,0);
\draw [->] (x) to (y);
\node (x2) [draw, rect] at (5,1.5) {$x$};
\node (y2) [draw, rect] at (8,1.5) {$y$};
\node (w2) [draw, rect] at (5,.75) {$w$};
\node (xw) [draw, rect] at (5,0) {$x\times w$};
\draw [->] (x2) to (y2);
\draw [->] (w2) to (y2);
\draw [->] (xw) to (y2);
\node (cap1) at (1.5,-.75) {a) Diagramme conceptuel};
\node (cap2) at (6.5,-.75) {b) Diagramme statistique};
\end{tikzpicture}
\caption{Représentation de la modération}
\label{mod}
\end{figure}

L'analyse de modération est illustrée à la Figure \ref{mod}. Le cadran a (gauche) montre une conceptualisation de l'effet attendu du modérateur, soit l'altération de l'effet entre $x$ et $y$. Le cadran b (droite) montre, quant à lui, la représentation statistique dans laquelle le lien direct entre $x$, $w$ et $xw$ par rapport à $y$.

Une façon de mettre l'accent sur l'effet de modération est de réarranger l'équation \@ref(eq:moderation) afin d'obtenir l'équation \@ref(eq:moderation2), ce qui met en évidence le rôle clé de $w$.

\begin{equation}
y = \beta_0 + \beta_1 x + (\beta_2 + \beta_3 x) w + \epsilon_y 
(\#eq:moderation2)
\end{equation}

## Création de données

Une caractéristique fondamentale de la création d'interactions est qu'elles doivent être créées à partir de ces composantes. Autrement dit, le produit $xw$ comme variable n'est calculable que si $x$ ou $w$ sont d'abord créées. Il faut connaître deux des trois variables pour calculer la troisième. En conséquence, il n'est pas possible de créer des variables d'interaction, comme c'était le cas auparavant avec la fonction `MASS::mvrnorn()`, malgré que la matrice de covariance et les coefficients de régression soient calculables.

La variance du produit de deux variables peut devenir fort complexe. En fait, l'étude des produits de variables est si complexe, particulièrement lorsque les variables ont des moyennes non nulles qu'il n'y a eu que très dernièrement des développements mathématiques sur leur distribution formelle [@Nadarajah; @Cui], ce pourquoi les statisticiens préfèrent recourir à du bootstrap pour tester les effets médiateurs.

La variance du produit de deux variables standardisées [@Craig; @Haldane] est 
\begin{equation}
\sigma^2_{x \times w} = 1 + \rho_{xw}^2
(\#eq:varprod)
\end{equation}

Pour des variables centrées (non complètement standardisées), l'équation \@ref(eq:prodvar) devient

<!-- À terminer -->
\begin{equation}
sigma^2_{x \times w}
(\#eq:prodvar)
\end{equation}

Il faudra donc porter une attention particulière à la variance de $xw$ lorsque la variable $y$ sera générée, surtout si un scénario standardisé est envisagé.

## Un modérateur continu

Dans le cas de deux variables continues (une variable indépendante $x$ et une modératrice $w$), celles-ci peuvent être créées par système d'équations ou bien avec la matrice de covariance (des deux variables). Une fois $x$ et $w$ générées, il faut les multiplier pour obtenir $xw$. 

La variance de $xw$ suit l'équation \@ref(eq:prodvar) et les covariances avec les premières variables sont nulles dans la mesure où c'est variable dont symétrique. (Si elles ne sont pas symétriques, il pourrait y avoir des corrélations causées par l'asymétrie). La matrice de covariance (et de corrélation dans ce cas-ci) est ainsi calculable a priori.

\begin{equation}
\mathbf{S} = 
\left( \begin{array}{ccc}
1 & \rho_{xw} & 0 \\
\rho_{xw} & 1 & 0 \\
0 & 0 & 1+\rho_{xw}^2 \\
\end{array} 
\right)
(\#eq:S1)
\end{equation}

En spécifiant les coefficients de régression à l'avance avec $\mathbf{B}$, la variance résiduelle de la variable dépendante peut être calculée comme
$$
\sigma^2_{\epsilon_y} = 1 - \mathbf {B \Sigma B}
$$

afin d'assurer un scénario complètement standardisé. 


```r
n <-  500                     # Tailles d'échantillon
rhoxw  <-  .5                 # Covariance entre x et y
S <-  matrix(c(1, rhoxw, 0,   # Matrice de covariance a priori
               rhoxw, 1, 0,
               0, 0, 1 + rhoxw^2),
             ncol = 3, nrow = 3)

B <-  c(.1, 0, .3)             # Coefficients de régression

# Création des deux premières variables
X <-  MASS::mvrnorm(n = n, mu = c(0, 0), Sigma = S[1:2, 1:2])

# Ajouter en joindant aux deux autres leur produit
X <-  cbind(X, X[,1] * X[,2])

# Calculer la variance résiduelle
var_ey <-  (1 - B %*% S %*% B)

# Création de la variable dépendante
y <-  X %*% B + rnorm(n = n, sd = sqrt(var_ey))

# Mettre le tout en commun
jd1 <-  data.frame(X, y = y)
colnames(jd1) <- c("x", "w", "xw", "y")
```

Le code ci-dessus montre un scénario standardisé (toutes les moyennes sont 0; toutes les variances égalent 1). Le modèle est illustré à la figure \ref{ex1mod}.

\begin{figure}
\center
\begin{tikzpicture}[very thick, scale=2, >=stealth]
\Large
\tikzstyle{rect} = [rectangle, minimum width = 2cm, minimum height = 1cm, font = \LARGE]
\node (x) [draw, rect] at (0,3) {$x$};
\node (y) [draw, rect] at (4,3) {$y$};
\node (w) [draw, rect] at (0,1.5) {$w$};
\node (xw) [draw, rect] at (0,0) {$x\times w$};
\draw [->] (x) to node [anchor=south east] {.10} (y) ;
\draw [->] (w) to node [anchor=south east]  {.20} (y) ;
\draw [->] (xw) to node  [anchor=south east] {.30} (y) ;
\draw [<->] (x.west) to [out=180,in=180] (w.west) ;
\node (rho) at(-1.25,2.25) {$.50$};
\end{tikzpicture}
\caption{Exemple de modèle de modération}
\label{ex1mod}
\end{figure}

Pour simuler une étude réelle, la variable d'interaction n'a pas à être enregistrée dans les deux jeux de données. Elle n'était nécessaire que pour la création de la variable dépendante.


```r
# Jeu de données final 
jd1 <-  jd1[, c("x","w","y")]
```

## Un modérateur nominale

Pour créer un jeu de données avec une variable indépendante continue et une variable modératrice nominale, la procédure sera similaire à celle de l'analyse de variance en combinaison avec la technique juste décrite.


```r
set.seed(50015610)  # Pour reproductibilité
g1 <- 5000      # Tailles des trois groupes
g2 <- 5000      # Ils pourraient être différents
g3 <- 5000
n <- sum(c(g1, g2, g3)) # Nombre total d'unités (somme de tous les groupes)

# Création de variables
# Variable continue
x <-  rnorm(n)  # Variable continue
# Vecteur de groupe (facteur)
w <-  as.factor(c(rep(1, g1), rep(2, g2), rep(3, g3)))

# Vérifier que cette `dummy.coding()` se retrouve dans l'environnement
# Voir analyse de base
# Codage factice du groupement
# Le troisième groupe est le référent
W <- dummy.coding(w)[,-3]

# Mettre tous les prédicteurs ensemble 
# pour le modèle linéaire sous forme de matrice
X = cbind(x = x,
          w = W,
          xw = x * W)
```

En considérant $p_i = \frac{g_i}{n}$ comme la probabilité d'une unité d'être dans le groupe $i$, la variance d'un groupe représenté par $w_i$ est de $p_i(1-p_i)$, soit la variance d'une distribution binomiale pour une probabilité $p$. La covariance avec un autre groupe $j$ est de $-p_ip_h$, soit que la probabilité d'être dans un groupe est négativement liée à celle d'être dans un autre groupe. Enfin, la variance d'une interaction est de $p_i$, car il s'agit du pourcentage de $x$ qui se retrouve dans l'interaction $xw_i$. En conséquence, comme il s'agit de la même information (à cause du multiple de 1 de la variable $w_i$, c'est-dire appartenir au groupe $i$), cela mère une covariance accidentelle de $p_i$ entre $x$ et $w_i$.


```r
p1 <- g1/n
p2 <- g2/n
S <- matrix(c(1, 0, 0, p1, p2,
              0, p1*(1-p1), -p1*p2, 0, 0,
              0, -p1*p2, p2*(1-p2), 0, 0,
              p1, 0, 0, p1, 0,
              p2, 0, 0, 0, p2), 
            ncol = 5, nrow = 5)
S
#>       [,1]   [,2]   [,3]  [,4]  [,5]
#> [1,] 1.000  0.000  0.000 0.333 0.333
#> [2,] 0.000  0.222 -0.111 0.000 0.000
#> [3,] 0.000 -0.111  0.222 0.000 0.000
#> [4,] 0.333  0.000  0.000 0.333 0.000
#> [5,] 0.333  0.000  0.000 0.000 0.333
# Vérifications
cov(X)
#>          x        1        2         1         2
#> x  0.97900 -0.00703 -0.00136  3.18e-01  3.21e-01
#> 1 -0.00703  0.22224 -0.11112 -6.21e-03  1.21e-03
#> 2 -0.00136 -0.11112  0.22224  3.10e-03 -2.43e-03
#> 1  0.31815 -0.00621  0.00310  3.18e-01 -3.39e-05
#> 2  0.32067  0.00121 -0.00243 -3.39e-05  3.21e-01
```

Toutefois, il sera plus simple de standardiser `W` avant de créer les interactions, ce qui éliminera les covariances accidentelles.


```r
# Standardiser les codes factices
W <- apply(W, MARGIN = 2, FUN = scale)

# Mettre tous les prédicteurs ensemble 
# pour le modèle linéaire sous forme de matrice
X2 = cbind(x = x,
           w = W,
           xw = x*W)
```

Alors la covariance entre $w_i$ et $w_j$ et la covariance entre $xw_i$ et $xw_j$ deviennent
$$p_1 p_2 / \sqrt{p_1(1 - p_1) p_2 (1 - p_2)}$$
soit leur covariance originale divisée par leur écart type. Tous les autres valeurs deviennent 1 dans le cas des variances et 0 pour les covariances.


```r
rho = -(p1 * p2) / (sqrt((p1 * (1 - p1)) * (p2 * (1 - p2))))
S2 <- matrix(c(1, 0, 0, 0, 0,
               0, 1, rho, 0, 0,
               0, rho, 1, 0, 0,
               0, 0, 0,1, rho,
               0, 0, 0, rho, 1), 
             ncol = 5, nrow = 5)
S2
#>      [,1] [,2] [,3] [,4] [,5]
#> [1,]    1  0.0  0.0  0.0  0.0
#> [2,]    0  1.0 -0.5  0.0  0.0
#> [3,]    0 -0.5  1.0  0.0  0.0
#> [4,]    0  0.0  0.0  1.0 -0.5
#> [5,]    0  0.0  0.0 -0.5  1.0
# Vérifications
cov(X2)
#>          x       1        2       1        2
#> x  0.97900 -0.0149 -0.00288 -0.0174 -0.01201
#> 1 -0.01492  1.0000 -0.50000 -0.0174  0.01601
#> 2 -0.00288 -0.5000  1.00000  0.0160 -0.00887
#> 1 -0.01736 -0.0174  0.01601  0.9666 -0.46885
#> 2 -0.01201  0.0160 -0.00887 -0.4689  0.97049
```

Ajouter des corrélations entre une variable continue et les groupes sont possibles, mais déborde du cadre de ces textes et des connaissances détaillées jusqu'ici. Mais, c'est possible!

Maintenant, il reste à créer la variable dépendante. Pour ce faire, il faut spécifier cinq coefficients de régressions, car une variable continue, plus deux variables modératrices (facteur transformé en code factice), donnent deux variable d'interaction.


```r
# Les coefficients de régression
B <-  c(.25, 0, 0, .50, -.50)

# La variance résiduelle
# La deuxième matrice de covariance est utilisée
var_ey <- 1 - B %*% S2 %*% B  

# Création de la variable dépendante
y <- X2 %*% B + rnorm(n = n, sd = sqrt(var_ey))
```

Pour simuler une étude réelle, les variables d'interactions et le codage factices peuvent être écartés dans le jeu de données. Ces variables n'étaient nécessaires que pour la création de la variable dépendante.


```r
# Jeu de données final 
jd2 <-  data.frame(x = x,
                   w = w,
                   y = y)
```


## Détecter l'effet de modération

Pour détecter les effets modérateurs, l'analyse de modèle linéaire par `lm()` et `aov()` joueront parfaitement le rôle. Par contre, il faut noter une différence importante entre les deux fonctions. Le calcul de la somme des carrés est différent entre les deux : `lm()` utilise le type III et `aov()`  utilise le type I.

Le type III est l'approche par défaut de la plupart des logiciels traditionnels. Il est souvent possible de déterminer ce choix, bien que peu d'expérimentateurs s'en donnent la peine. Le type II et le type IV (le plus souvent identique au type III) existent également. Il s'agit d'un débat controversé parmi les statisticiens. 

Pour choisir le meilleur type d'estimateur, de nombreux facteurs entrent en ligne de compte, le plus important étant l'hypothèse de recherche. Il n'y a donc pas de réponse claire, il y a bien quelques recommandations.

Le type I ou III testent le terme d'interaction. Le type I teste séquentiellement le modèle $y = x + w + xw$, soit d'avos l'effet de $x$, puis l'effet de $w$ en tenant compte de $x$ (écrit $\text{SC}(w|x)$, soit la somme des carrés de $w$ considérant $x$, et enfin l'effet de $x\times w$ par $\text{SC}(xw|x,w)$. Cela teste très bien l'effet d'interaction, mais les effets simples ne sont pas traités également. 

Le type II contourne ce problème en considérant simultanément $\text{SC}(w|x)$ et $\text{SC}(x|w)$, ce qui est très bien pour tester les effets simples s'il n'y a pas de terme d'interaction. Ainsi, le type II n'est utilisé que s'il n'y pas de terme d'interaction. 

Dans le type III $x$, $w$ et $xw$ ont le même niveau de conditionnement, soit $\text{SC}(x|w,xw)$, $\text{SC}(w|x,xw)$ et $\text{SC}(xw|x,w)$, là où le débat naît étant donné les hypothèses concernées ne semblent pas très utiles comme la plupart des expérimentateurs s'intéressent au terme d'interaction, et non aux effets principaux lorsqu'un terme d'interaction est présent. Les programmeurs de **R** championnent cette perspective en définissant l'option de type de sommes de carrés par défaut pour les fonctions `lm()` et `aov()`.

Le choix entre `aov()` (type I) ou `lm()` (type III) revient à l'expérimentateur. Par contre, la plupart des ouvrages statistiques pour les sciences appliquées recommandent le type III. Les ouvrages de méthodes quantitatives utilisent implicitement le type III. En plus, lorsque le devis n'est pas balancé, le type III est préférable. En fait, si le lecteur veut comparer avec des analyses de modération de d'autres ouvrages, il devra user du type III. 

Cela dit, il demeure possible d'utiliser `aov()` avec les SC de type III, mais il faudra recourir à la fonction `Anova()` du package `car` [@car].

## Analyse d'un modérateur continu

Pour le modèle avec deux variables continues, voici la syntaxe pour rouler `lm()` qui est très similaire à ce qui se trouve dans le chapitre sur la régression. Pour inclure l'effet d'interaction (modération) dans le modèle, il faut inscrire le `*` au lieu du `+`, comme `lm(y ~ x * w, data = jd1)`. La formule `y ~ x + w + x * w` fonctionne également.


```r
# Réaliser l'analyse avec lm()
res1.lm <- lm(y ~ x * w, data = jd1)
summary(res1.lm)
#> 
#> Call:
#> lm(formula = y ~ x * w, data = jd1)
#> 
#> Residuals:
#>     Min      1Q  Median      3Q     Max 
#> -2.7740 -0.6245  0.0226  0.6300  2.8553 
#> 
#> Coefficients:
#>             Estimate Std. Error t value Pr(>|t|)    
#> (Intercept)  0.00333    0.04325    0.08    0.939    
#> x            0.10845    0.04785    2.27    0.024 *  
#> w           -0.02717    0.04525   -0.60    0.549    
#> x:w          0.30368    0.03374    9.00   <2e-16 ***
#> ---
#> Signif. codes:  
#> 0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
#> 
#> Residual standard error: 0.884 on 496 degrees of freedom
#> Multiple R-squared:  0.151,	Adjusted R-squared:  0.146 
#> F-statistic: 29.4 on 3 and 496 DF,  p-value: <2e-16

# Pour comparer avec aov
res1.aov <- aov(y ~ x * w, data = jd1, contrasts = TRUE)
#> Warning in model.matrix.default(mt, mf, contrasts): non-list
#> contrasts argument ignored
# L'intercepte est inclu
summary(res1.aov, intercept = TRUE)
#>              Df Sum Sq Mean Sq F value  Pr(>F)    
#> (Intercept)   1     13    12.8   16.35 6.1e-05 ***
#> x             1      5     5.2    6.60    0.01 *  
#> w             1      0     0.5    0.58    0.45    
#> x:w           1     63    63.4   81.03 < 2e-16 ***
#> Residuals   496    388     0.8                    
#> ---
#> Signif. codes:  
#> 0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

Comme prévu, les résultats sont différents à cause du calcul de la somme des carrés qui est différente. L'effet modérateur est identique, cela dit, ce sont les effets principaux qui sont différents.

Pour obtenir l'analyse de variance avec le type III, il faut utiliser le package `car` et sa fonction `Anova()` en y spécifiant la sortie de la fonction `aov()` et type de somme de carrés demandée.


```r
res1.anova <- car::Anova(res1.aov, type = "III")
res1.anova 
#> Anova Table (Type III tests)
#> 
#> Response: y
#>             Sum Sq  Df F value Pr(>F)    
#> (Intercept)      0   1    0.01  0.939    
#> x                4   1    5.14  0.024 *  
#> w                0   1    0.36  0.549    
#> x:w             63   1   81.03 <2e-16 ***
#> Residuals      388 496                   
#> ---
#> Signif. codes:  
#> 0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

Voilà, les effets simples sont maintenant identiques à la sortie de `lm()`.



Pour déterminer s'il y a présence de l'effet de modérateur, il faut se fier à la ligne `x:w` et la valeur-$p$ `Pr(>F)` associé qui est ici de 4.752\times 10^{-18}. Par contre, il n'est pas tout à fait clair comment interpréter ce résultat. Ce sera fait dans la section portant sur la représentation graphique de al modération.

## Analyse d'un modérateur nominal


Comme il y a un groupe de référence, **R** choisit par défaut le premier groupe. Dans ce cas, le groupe de référence était le troisième. Pour spécifier ce changement, la fonction `relevel()` déclarera le groupe de référence. Le premier argument est la variable et l'argument `ref =` indique le nouveau groupe de référence. La fonction ne fait que reclasser les valeurs afin que le premier groupe que ne voit **R** ne soit nul autre que le groupe de référence. Ce changement pourrait aussi être fait directement dans le formule de `lm()` comme `lm(y ~ x * relevel(w, ref = 3), data = jd2)`


```r
# Réaliser l'analyse avec lm()
jd2$w <-  relevel(jd2$w, ref = 3)
res2.lm <- lm(y ~ x * w, data = jd2)
summary(res2.lm)
#> 
#> Call:
#> lm(formula = y ~ x * w, data = jd2)
#> 
#> Residuals:
#>    Min     1Q Median     3Q    Max 
#> -1.690 -0.295 -0.002  0.297  1.574 
#> 
#> Coefficients:
#>              Estimate Std. Error t value Pr(>|t|)    
#> (Intercept)  0.000209   0.006202    0.03     0.97    
#> x            0.259007   0.006139   42.19   <2e-16 ***
#> w1           0.009207   0.008771    1.05     0.29    
#> w2          -0.005281   0.008770   -0.60     0.55    
#> x:w1         1.055880   0.008832  119.55   <2e-16 ***
#> x:w2        -1.069859   0.008813 -121.40   <2e-16 ***
#> ---
#> Signif. codes:  
#> 0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
#> 
#> Residual standard error: 0.438 on 14994 degrees of freedom
#> Multiple R-squared:  0.803,	Adjusted R-squared:  0.803 
#> F-statistic: 1.22e+04 on 5 and 14994 DF,  p-value: <2e-16

# Pour comparer avec aov
res2.aov <- aov(y ~ x * w, data = jd2)
# L'intercept est inclu
summary(res2.aov)
#>                Df Sum Sq Mean Sq  F value Pr(>F)    
#> x               1    930     930  4837.35 <2e-16 ***
#> w               2      2       1     5.13 0.0059 ** 
#> x:w             2  10821    5411 28144.98 <2e-16 ***
#> Residuals   14994   2882       0                    
#> ---
#> Signif. codes:  
#> 0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

# Somme de carrés de type III pour `aov()`
res2.anova <- car::Anova(res2.aov, type = "III")
res2.anova 
#> Anova Table (Type III tests)
#> 
#> Response: y
#>             Sum Sq    Df F value Pr(>F)    
#> (Intercept)      0     1     0.0   0.97    
#> x              342     1  1779.8 <2e-16 ***
#> w                1     2     1.4   0.25    
#> x:w          10821     2 28145.0 <2e-16 ***
#> Residuals     2882 14994                   
#> ---
#> Signif. codes:  
#> 0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

La fonction `car::Anova()` offre un résultat différent pour $w$ et $xw$ car les groupes sont mis en commun. Autrement dit, le vecteur de groupement est analysé comme une seule variable.



Le type III a certainement eu un rôle intéressant dans les résultats. Il montre que $w$ n'est pas significativement lié à $y$, $p < 0.247$, ce qui était programmé dans le modèle alors que `aov()` montre un lien  significatif, $p<0.006.

Pour respecter la pratique et pour imiter ce qui est fait par d'autres logiciels ce serait l'effet d'interaction `x:w` tel que rapporté par `res2.anova`, soit produite par `car::Anova()`. La valeur-$p$ de l'effet d'interaction est de $p<001$, ce qui signifie qu'il y a un effet modérateur. 

Comme le cas précédent, ce résultat est ardu à interpréter.

## Les graphiques liés à l'analyse de modération

À part quelques personnes ayant l'oeil affutée à l'interprétation de modèle linéaire contenant une interaction, il est rare pour tous les autres d’en tirer du sens immédiatement. Ainsi, des analyses graphiques sont plus que pertinentes pour en interpréter les résultats.

Deux graphiques sont particulièrement pertinents : le graphique de Johnson- Neyman et le graphique des pentes simples (*simple slopes*). Il existe quelques packages pour produire ces graphiques. Dans cet ouvrage, le package `interactions` [@interactions] sera présenté. Ce package peut traiter des interactions doubles et triples et est compatible avec plusieurs commandes de `ggplot2`.

Pour réaliser ces graphiques, il faudra d'abord installer et importer le package.


```r
library(interactions)
```

## L'analyse des pentes simples

La méthode *classique* de sonder d'approfondir un effet d'interaction consiste à calculer la pente du prédicteur à différentes valeurs du modérateur. Cette analyse se réfère à l'analyse des pentes simples. La fonction qui permet de commander cette technique est `sim_slopes()`. Il faut y mettre en argument, la sortie de `lm()` et désigner le prédicteur `pred = ` et le modérateur `modx = `. Cette analyse est faite avec l'exemple avec la variable de groupement, `jd2`. L'argument `johnson_neyman = FALSE` évite simplement un message d'erreur, car le graphique éponyme ne peut être généré lorsque le modérateur est une variable de groupement.


```r
# Les statistiques liées aux pentes simples
sim_slopes(model = res2.lm,
           pred = x,
           modx = w,
           johnson_neyman = FALSE)
#> SIMPLE SLOPES ANALYSIS 
#> 
#> Slope of x when w = 2: 
#> 
#>    Est.   S.E.    t val.      p
#> ------- ------ --------- ------
#>   -0.81   0.01   -128.25   0.00
#> 
#> Slope of x when w = 1: 
#> 
#>   Est.   S.E.   t val.      p
#> ------ ------ -------- ------
#>   1.31   0.01   207.10   0.00
#> 
#> Slope of x when w = 3: 
#> 
#>   Est.   S.E.   t val.      p
#> ------ ------ -------- ------
#>   0.26   0.01    42.19   0.00
```
Ce tableau pour les groupes de $w$ si l'effet modérateur est significatif.


```r
# Le graphique des pentes simples
interact_plot(model = res2.lm,
           pred = x,
           modx = w, 
           plot.points = TRUE)
```

<div class="figure">
<img src="13-Moderation_files/figure-html/ip1-1.png" alt="Analyse de pentes simples pour un modérateur nominal" width="672" />
<p class="caption">(\#fig:ip1)Analyse de pentes simples pour un modérateur nominal</p>
</div>

Le code ci-dessus illustre ce patron de différences avec la Figure \@ref(fig:ip1). L'axe des $x$ et des $y$ montrent la relation entre les variables en fonction des groupes qui sont représentées par des lignes différentes. L'option `plot.point = TRUE` affiche optionnellement les données dans la figure. La Figure \@ref(fig:ip1) montre une tendance positive entre $x$ et $y$ pour le groupe de référence (`3`) qui s'accentue de façon importante pour le groupe (`1`), mais qui s'inverse pour le groupe `2`.

Le graphique des pentes peut aussi être réalisé pour un modérateur continu. La Figure \@ref(fig:ip2) illustre ce graphique. Lorsque le modérateur représentait des groupes, les niveaux étaient clairement définis. Dans le cas d'un modérateur continu, des niveaux arbitraire doivent être sélectionner.


```r
interact_plot(model = res1.lm,
           pred = x,
           modx = w, 
           plot.points = TRUE)
```

<div class="figure">
<img src="13-Moderation_files/figure-html/ip2-1.png" alt="Analyses des pentes simples pour un modérateur continu" width="672" />
<p class="caption">(\#fig:ip2)Analyses des pentes simples pour un modérateur continu</p>
</div>

Par défaut, l'analyse est réalisée avec -1 écart type, la moyenne et +1 écart type comme groupement de $w$. Ces valeurs peuvent être choisies manuellement avec `modx.values =` en y spécifiant les valeurs d'intérêt. En plus, cet argument est compatible non seulement avec `interact_plot()` et `sim_slopes()`. La Figure \@ref(fig:ip3) montre l'analyse des pentes pour des valeurs de `modx.values = c(-2, -1, 0, 1, 2)`.


```r
interact_plot(model = res1.lm,
           pred = x,
           modx = w, 
           plot.points = TRUE,
           modx.values = c(-2, -1, 0, 1, 2))
```

<div class="figure">
<img src="13-Moderation_files/figure-html/ip3-1.png" alt="Analyses des pentes simples pour un modérateur continu" width="672" />
<p class="caption">(\#fig:ip3)Analyses des pentes simples pour un modérateur continu</p>
</div>

## Le graphique de Johnson-Neyman

Lorsque le modérateur est continu, la méthode la plus rigoureuse d'explorer des effets modérateurs est de calculer l'intervalle de Johnson-Neyman qui indique la plage de valeurs du modérateur selon lesquelles la pente du prédicteur est significative ou non pour un seuil $\alpha$ spécifié. Comme les deux variables doivent être continues, c'est le jeu de données `jd1` qui sera utilisé pour cet exemple.

La fonction `sim_slopes()` génère l'analyse des pentes simples, mais produit également l'intervalle de Johnson-Neyman et le graphique associé. La fonction est utilisée comme précédemment, à l'exception qu'il est possible de demander comme argument `jnplot = TRUE` pour obtenir le graphique Johnson-Neyman et qu'il n'est plus nécessaire de commander `johnson_neyman = FALSE` évite un message d'erreur.



```r
sim_slopes(model = res1.lm,
           pred = x,
           modx = w, 
           jnplot = TRUE)
#> JOHNSON-NEYMAN INTERVAL 
#> 
#> When w is OUTSIDE the interval [-0.71, -0.05], the slope
#> of x is p < .05.
#> 
#> Note: The range of observed values of w is [-3.21, 3.21]
```

<div class="figure">
<img src="13-Moderation_files/figure-html/jn1-1.png" alt="Le graphiqu Johnson-Neyman pour interpréter les effets modérateurs" width="672" />
<p class="caption">(\#fig:jn1)Le graphiqu Johnson-Neyman pour interpréter les effets modérateurs</p>
</div>

```
#> SIMPLE SLOPES ANALYSIS 
#> 
#> Slope of x when w = -1.0052 (- 1 SD): 
#> 
#>    Est.   S.E.   t val.      p
#> ------- ------ -------- ------
#>   -0.20   0.06    -3.30   0.00
#> 
#> Slope of x when w =  0.0202 (Mean): 
#> 
#>   Est.   S.E.   t val.      p
#> ------ ------ -------- ------
#>   0.11   0.05     2.40   0.02
#> 
#> Slope of x when w =  1.0456 (+ 1 SD): 
#> 
#>   Est.   S.E.   t val.      p
#> ------ ------ -------- ------
#>   0.43   0.06     7.29   0.00
```
La Figure \@ref(fig:jn1) montre le graphique Johnson-Neyman. La zone bleue indique le niveau de modérateur où l'effet de $x$ est significativement différent de la pente de $x$ lorsque l'effet du modérateur est nul. La zone rouge montre l'étendue où il n'y a pas d'effet de modération. L'étendue est également précisée dans la première phrase imprimée de la sortie. La sortie a également produit la sortie de l'analyse de pentes simples ou l'information obtenue du graphique Johnson-Neyman est répétée d'une façon différente. 

Dans cet exemple, plus l'unité à un niveau de modérateur élevé (en termes absolus), plus il accentue l'effet de la variable indépendante (zones bleues). Lae modérateur joue donc un rôle très important dans ce modèle.

