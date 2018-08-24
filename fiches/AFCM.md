# Analyse Factorielle des Correspondances Multiples

**Quand l'utiliser ?**

Méthode de description graphique de variables qualitative


## Étape 1 : lecture du jeu de données
*Importer le jeu de données*

Le jeu de données ne contient que des variables qualitatives  

Utiliser le jeu de données :
```r
data(qualitatives)
attach(qualitatives)
```


## Étape 2 : description des données
Visualisation des données (tableaux) :
```r
table(quali1)
table(quali2)
table(quali3)
```


## Étape 3 : vérification des conditions d'application
##### Condition 1 : homogénéité des classes
Le nombre de classes doit être homogène entre les variables

##### Condition 2 : homogénéité des effectifs
Les effectifs doivent être homogènes entre les modalités de chaque variable


## Étape 4 : analyse du jeu de données
*Charger la librairie ade4*  

### Tableau de Burt
Construction du tableau de Burt :
```r
burt = acm.burt(qualitatives,qualitatives)
```

Affichage du tableau de Burt :
```r
burt
```

### Calcul de l'AFCM
```r
afcm = dudi.coa(burt)
```
*Sélectionner le nombre d'axes qui permet de représenter environ 70 % du jeu de données*  

### Choix du nombre d'axes
```r
intertia.dudi(afcm)
```
On garde le nombre d'axe qui représente au moins 70 % du jeu de données  

Nouveau calcul de l'AFCM en sélectionnant le nombre exact d'axes :
```r
afcm = dudi.coa(burt)
```

### Coordonnées dans le nouveau référentiel
Coordonnées des variables :
```r
afcm$co
```

### Graphiques
Projection des variables *(exemple avec 2 axes principaux)* :
```r
s.arrow(afcm$co,xax=1,yax=2)
```


## Étape 5 : étude des contributions
Contribution des variables à la construction des axes :
```r
inertia.dudi(afcm,col=T,row=T)$col.abs
```


---  
[MementoR](https://github.com/HanBnrd/MementoR)

&copy; *2018* [*Johann Benerradi*](https://github.com/HanBnrd)
