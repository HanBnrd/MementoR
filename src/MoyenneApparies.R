# Comparaison des moyennes de deux échantillons appariés


## Étape 1 - lecture du jeu de données :
### > Importer le jeu de données
attach(data)
Y1 = quantitative1
Y2 = quantitative2


## Étape 2 - description des données :
boxplot(Y1,Y2)
mean(Y1)
mean(Y2)


## Étape 3 - vérification des conditions d'application :
length(Y1)
length(Y2)
### Cas 1 - taille des échantillons supérieure ou égale à 30
### Cas 2 - taille des échantillons inférieure à 30 :
### Condition - normalité de la distribution des différences :
D = Y1 - Y2
shapiro.test(D)
### > Choix du test


## Étape 4 - réalisation du test :
### Tests paramétriques :
t.test(Y1,Y2,paired=T)
t.test(Y1,Y2,paired=T,alternative="greater")
t.test(Y1,Y2,paired=T,alternative="less")
