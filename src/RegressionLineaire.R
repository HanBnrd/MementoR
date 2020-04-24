# Régression linéaire et corrélation


## Étape 1 - lecture du jeu de données :
### > Importer le jeu de données
attach(data)
Y = expliquee
X = explicative


## Étape 2 - description des données :
plot(Y~X)


## Étape 3 - vérification des conditions d'application :
### Condition - normalité des distributions :
shapiro.test(X)
shapiro.test(Y)


## Étape 4 - test de corrélation :
cor.test(X,Y)


## Étape 5 - modélisation :
droite = lm(Y~X)
summary(droite)
Y = [Estimate_X]*X + [Estimate_intercept]
### Coefficient directeur (summary)
### Coefficient de détermination (summary)


## Étape 6 - validation du modèle :
### Étude des résidus :
sresidus = rstudent(droite)
shapiro.test(sresidus)
plot(X,sresidus)
abline(h=c(-2,0,2))
### Valeurs influentes :
influence.measures(droite)
