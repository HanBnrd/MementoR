# Comparaison des moyennes de deux échantillons indépendants


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
### Cas 1 - taille de chaque échantillon supérieure ou égale à 30
### Cas 2 - taille d'au moins un des échantillons inférieure à 30 :
### Condition 1 - normalité de la distribution :
shapiro.test(Y1)
shapiro.test(Y2)
### Condition 2 - homoscédasticité ou égalité des variances :
var.test(Y1,Y2)
### > Choix du test


## Étape 4 - réalisation du test :
### Tests paramétriques :
t.test(Y1,Y2)
t.test(Y1,Y2,alternative="greater")
t.test(Y1,Y2,alternative="less")
