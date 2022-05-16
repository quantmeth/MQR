# Solutions {-}

## Partie 1 {-}

> 1. Quel est le résultat de `mean <- c(1, 2, 3)`? Pourquoi?

Le résultat est $1, 2, 3$. Le fait d'assigner une valeur à une fonction (ou variable) écrase cette dernière.


```r
mean <- c(1, 2, 3)
mean
#> [1] 1 2 3
```

> 2. Rédiger une fonction calculant l'hypoténuse d'un triangle rectangle. Rappel, le théorème de Pythagore est $c^2=a^2+b^2$.

En prenant `a` et `b` comme arguments.


```r
hypothenus <- function(a, b){
  sqrt(a^2 + b^2)
}
hypothenus(3, 4)
#> [1] 5
```

> 3. Rédiger une fonction calculant un score-$z$ pour une variable. Rappel, un score-$z$, correspond à $z=\frac{x-\mu}{\sigma}$.

Deux possibilités ici. Soit `x` est un vecteur contenant plusieurs nombres ou il est un nombre et il faut ajouter la moyenne ($\mu$) et l'écart type ($\sigma$).


```r
# Premier cas
score.z <- function(x) {
  (x-mean(x))/sd(x)
} 

# Deuxième cas
score.z <- function(x, mu, sigma) {
  (x-mu)/sigma
} 

score.z(130, mu = 100, sigma = 15)
#> [1] 2
```

Le premier cas est l'équivalent de la fonction `scale()` qui rempliera la même tâche.

> 4. Rédiger une fonction calculant la médiane d'une variable (ne recopier pas celle de ce livre).

Voici une autre fonction calculant une médiane d'un vecteur.


```r
mediane <- function(x){
  x <- sort(x)
  longueur <- length(x)
  if (longueur%%2) {
    # Si impair
    # Prendre la valeur centrale
    x[(longueur + 1)/2]
  } else {
    # Si pair
    # Faire la moyenne des deux éléments du centre
    mean(x[rep(longueur/2, 2) + 0:1])
  }
}
```
Encore une fois (il n'y a pas vraiment de façon de l'éviter), `%%2` permet de tester si pair (`FALSE`, car `0` si pair) ou impair (`TRUE`, car `1` si impair), puis de prendre la valeur à la position correspondante. Il y a plusieurs façons de tirer les éléments du vecteur.

> 5. Rédiger une fonction pour générer une séquence de Fibonacci (chaque nombre est la somme des deux précédents) jusqu'à une certaine valeur, soit $1,1,2,3,5,8,...$.

Plusieurs solutions possibles dont en voici deux.


```r
fibonnaci1 <-  function(n){
  # n est le nombre d'éléments de la série demandée.
  # Création d'un vecteur de taille n ne contenant que des 1.
  serie <- rep(1, n)
  # Le premier test logique rapporte la (n = 1) ou 
  # les deux (n = 2) premières valeurs.
  if(n <= 2){
    serie <-  serie[1:n]
    # Le deuxième réalise les calculs pour les autres options.  
  }else{
    for(i in 3:n){
      serie[i] <-  serie[i-1] + serie[i-2]  
    }
  }
  serie
}
```

En voici une autre en utilisant la récursion (une fonction qui s’appelle elle-même).


```r
fibonnaci2 <- function(n){
  if(n <= 2){
    # Si la n est plus petit que 2, alors retourne 1
    1
  } else {
    # Autrement, retourne, les deux valeurs de Fibonncaci précédentes.
    fibonnaci2(n-1) + fibonnaci2 (n-2)
  }
}
```

Les voici comparées.


```r
n <- 8
fibonnaci1(n)
#> [1]  1  1  2  3  5  8 13 21
fibonnaci2(n)
#> [1] 21
```


> 6. Rédiger une fonction qui pivote une liste de $k$ éléments par $n$. Par exemple, une liste de six ($k=6$ comme $[1,2,3,4,5,6]$) pivoté de deux ($n=2$) devient ($[3,4,5,6,1,2]$).

Plusieurs solutions possibles dont en voici une.


```r
pivot <- function(k, n){
  pivoter <- c((n+1):k, 1:n)
  pivoter
}
# Original
k <- 6
1:k
#> [1] 1 2 3 4 5 6

# Pivoté
pivot(k = k, n = 2)
#> [1] 3 4 5 6 1 2
```

## Partie 2 {-}
