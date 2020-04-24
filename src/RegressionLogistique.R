# Régression logistique


## Étape 1 - lecture du jeu de données :
### > Importer le jeu de données
attach(data)
Y = binaire
X1 = explicative1
X2 = explicative2


## Étape 2 - description des données :
### > Calcul des proportions de Y=1 et Y=0 dans les différentes modalités des Xi


## Étape 3 - vérification des conditions d'application :
### Condition - pas de lien entre les variables explicatives :
corr.test(X1,X2)
chisq.test(X1,X2)


## Étape 4 - modélisation :
logistique = glm(Y~X1+X2,family="binomial")
summary(logistique)
### > A1 = Estimate_X1
### > A2 = Estimate_X2
### > B = Estimate_intercept
P[Y=1|X] = exp(A1*X1+A2*X2+B)/(1+exp(A1*X1+B))
### Test de Wald (summary)
### Test du rapport de vraisemblance :
anova(logistique,test="Chisq")


## Étape 5 - validation du modèle :
### Adéquation du modèle :
hoslem.test(Y,fitted(logistique))
### Étude des résidus :
sresidus = rstudent(logistique)
shapiro.test(sresidus)
plot(X,sresidus)
abline(h=c(-2,0,2))
### Valeurs influentes :
influence.measures(logistique)


## Étape 6 - performance du modèle :
predictions = predict(logistique)
courbe = roc(Y,predictions)
plot(courbe)
courbe$auc
