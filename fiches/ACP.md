# Analyse en Composantes Principales

**Quand l'utiliser ?**

Méthode de description graphique de variables quantitatives


## Étape 1 : lecture du jeu de données
*Importer le jeu de données*

Le jeu de donné ne contient que des variables quantitatives sauf la première colonne nommée *id* qui contient les identifiants.  

Lier les *id* aux lignes :
```c
rownames(data) = data$id
data = data[,-1]
```


## Étape 2 : description des données
```c
summary(data)
```


## Étape 3 : analyse du jeu de données

*Charger la librairie ade4*  

### Calcul de l'ACP
```c
acp = dudi.pca(data)
```
*Sélectionner le nombre d'axes qui permet de représenter environ 70 % du jeu de données*  

### Choix du nombre d'axes
```c
intertia.dudi(acp)
```
On garde le nombre d'axe qui représente au moins 70 % du jeu de données.  

Nouveau calcul de l'ACP en sélectionnant le nombre exact d'axes :
```c
acp = dudi.pca(data)
```

### Coordonnées dans le nouveau référentiel
Coordonnées des colonnes :
```c
acp$co
```

Coordonnées des lignes :
```c
acp$li
```

### Graphiques
Cercles de corrélation :
```c
s.corcircle(acp$co,xax = 1,yax = 2)
s.corcircle(acp$co,xax = 2,yax = 3)
s.corcircle(acp$co,xax = 1,yax = 3)
```

Projection des individus et des variables sur un graphique commun :
```c
s.label(acp$li,xax=1,yax=2)
s.arrow(3*acp$co,xax=1,yax=2,add.plot = TRUE)
```


## Étape 4 : étude des contributions
Contribution des variables à la construction des axes :
```c
inertia.dudi(acp,col=T,row=T)$col.abs
```

Contribution des individus à la construction des axes :
```c
inertia.dudi(acp,col=T,row=T)$row.abs
```


## Étape 5 : étude des qualités
Qualité de la représentation des variables sur les axes :
```c
inertia.dudi(acp,col=T,row=T)$col.rel
```

Qualité de la représentation des individus sur les axes :
```c
inertia.dudi(acp,col=T,row=T)$row.rel
```


---  
[MementoR](https://github.com/HanBnrd/MementoR)

&copy; *2018* [*Johann Benerradi*](https://github.com/HanBnrd)
