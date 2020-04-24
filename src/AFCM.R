# Analyse Factorielle des Correspondances Multiples


## Étape 1 - lecture du jeu de données :
### > Importer le jeu de données
data(qualitatives)
attach(qualitatives)


## Étape 2 - description des données :
table(quali1)
table(quali2)
table(quali3)


## Étape 3 - vérification des conditions d'application :
### Condition 1 - homogénéité des classes
### Condition 2 - homogénéité des effectifs


## Étape 4 - analyse du jeu de données :
### > Charger la librairie ade4
### Tableau de Burt :
burt = acm.burt(qualitatives,qualitatives)
burt
### Calcul de l'AFCM :
afcm = dudi.coa(burt)
### > Sélectionner le nombre d'axes qui permet de représenter environ 70 % du jeu de données
### Choix du nombre d'axes :
intertia.dudi(afcm)
afcm = dudi.coa(burt)
### Coordonnées dans le nouveau référentiel :
afcm$co
### Graphiques :
s.arrow(afcm$co,xax=1,yax=2)


## Étape 5 - étude des contributions :
inertia.dudi(afcm,col=T,row=T)$col.abs
