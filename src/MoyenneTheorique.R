# Comparaison de la moyenne d'un échantillon à une valeur théorique


## Étape 1 - lecture du jeu de données :
### > Importer le jeu de données
attach(data)
Y = quantitative
m0 = theorique


## Étape 2 - description des données :
boxplot(Y)
mean(Y)


## Étape 3 - vérification des conditions d'application :
length(Y)
### Cas 1 - taille de l'échantillon supérieure ou égale à 30
### Cas 2 - taille de l'échantillon inférieure à 30 :
### Condition - normalité de la distribution :
shapiro.test(Y)
### > Choix du test


## Étape 4 - réalisation du test :
### Tests paramétriques :
t.test(Y,mu=m0)
t.test(Y,mu=m0,alternative="greater")
t.test(Y,mu=m0,alternative="less")
