# Analyse en Composantes Principales

**Quand l'utiliser ?**

Méthode de description graphique de variables quantitatives


## Étape 1 : lecture du jeu de données
*Importer le jeu de données*

Le jeu de données *data* ne contient que des variables quantitatives sauf la première colonne nommée *id* qui contient les identifiants  

Utiliser le jeu de données :
```r
attach(data)
```

Lier les *id* aux lignes :
```r
rownames(data) = data$id
data = data[,-1]
```


## Étape 2 : description des données
Informations sur les données :
```r
summary(data)
```


## Étape 3 : analyse du jeu de données
*Charger la librairie ade4*  

### Calcul de l'ACP
```r
acp = dudi.pca(data)
```
*Sélectionner le nombre d'axes qui permet de représenter environ 70 % du jeu de données*  

### Choix du nombre d'axes
```r
inertia.dudi(acp)
```
On garde le nombre d'axe qui représente au moins 70 % du jeu de données  

Nouveau calcul de l'ACP en sélectionnant le nombre exact d'axes :
```r
acp = dudi.pca(data)
```

### Coordonnées dans le nouveau référentiel
Coordonnées des variables :
```r
acp$co
```

Coordonnées des individus :
```r
acp$li
```

### Graphiques
Cercles de corrélation *(exemple avec 2 axes principaux)* :
```r
s.corcircle(acp$co,xax = 1,yax = 2)
```

Projection des individus et des variables sur un graphique commun :
```r
s.label(acp$li,xax=1,yax=2)
s.arrow(3*acp$co,xax=1,yax=2,add.plot = TRUE)
```


## Étape 4 : étude des contributions
Contribution des variables à la construction des axes :
```r
inertia.dudi(acp,col=T,row=T)$col.abs
```

Contribution des individus à la construction des axes :
```r
inertia.dudi(acp,col=T,row=T)$row.abs
```


## Étape 5 : étude des qualités
Qualité de la représentation des variables sur les axes :
```r
inertia.dudi(acp,col=T,row=T)$col.rel
```

Qualité de la représentation des individus sur les axes :
```r
inertia.dudi(acp,col=T,row=T)$row.rel
```


> &larr; [Retour](../README.md)
