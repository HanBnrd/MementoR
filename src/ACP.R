# Analyse en Composantes Principales


## Étape 1 - lecture du jeu de données :
### > Importer le jeu de données
attach(data)
rownames(data) = data$id
data = data[,-1]


## Étape 2 - description des données :
summary(data)


## Étape 3 - analyse du jeu de données :
### > Charger la librairie ade4
### Calcul de l'ACP :
acp = dudi.pca(data)
### > Sélectionner le nombre d'axes qui permet de représenter environ 70 % du jeu de données
### Choix du nombre d'axes :
inertia.dudi(acp)
acp = dudi.pca(data)
### Coordonnées dans le nouveau référentiel :
acp$co
acp$li
### Graphiques :
s.corcircle(acp$co,xax = 1,yax = 2)
s.label(acp$li,xax=1,yax=2)
s.arrow(3*acp$co,xax=1,yax=2,add.plot = TRUE)


## Étape 4 - étude des contributions :
inertia.dudi(acp,col=T,row=T)$col.abs
inertia.dudi(acp,col=T,row=T)$row.abs


## Étape 5 - étude des qualités :
inertia.dudi(acp,col=T,row=T)$col.rel
inertia.dudi(acp,col=T,row=T)$row.rel
