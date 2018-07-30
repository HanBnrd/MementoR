# Régression logistique

**Quand l'utiliser ?**

Étude de la probabilité de Y en fonction des Xi :
- Y variable qualitative binaire (expliquée) : Y=0 ou Y=1  
- Xi variables qualitatives ou quantitatives (explicative)  

Régression logistique simple : un seule variable X  
Régression logistique multiple : plusieurs variables Xi  


## Étape 1 : lecture du jeu de données
*Importer le jeu de données*

Utiliser le jeu de données :
```c
attach(data)
```
```c
Y = binaire
X1 = explicative1
X2 = explicative2
```


## Étape 2 : description des données
Calcul des proportions de Y=1 et Y=0 dans les différentes modalités des Xi  


## Étape 3 : vérification des conditions d'application
##### Condition : pas de lien entre les variables explicatives
**Premier cas : variables quantitatives**  
Hypothèses :  
**H0 :** *pas de corrélation linéaire entre X1 et X2*  
**H1 :** *corrélation linéaire entre X1 et X2*  

Test de corrélation :
```c
corr.test(X1,X2)
```
Conclusion au seuil 5% :  
p-value < 0,05 → rejet de *H0* → corrélation linéaire entre X1 et X2 → **possibilité de se passer d'une des variables explicative**  
p-value > 0,05 → non rejet de *H0* → pas de corrélation linéaire entre X1 et X2 → **condition OK**  

**Deuxième cas : variables qualitatives**  
Hypothèses :  
**H0 :** *pas d'influence de X1 sur X2*  
**H1 :** *influence de X1 sur X2*  

Test du chi2 d'indépendance :
```c
chisq.test(X1,X2)
```
Conclusion au seuil 5% :  
p-value < 0,05 → rejet de *H0* → influence de X1 sur X2 → **possibilité de se passer d'une des variables explicative**  
p-value > 0,05 → non rejet de *H0* → pas d'influence de X1 sur X2 → **condition OK**  


## Étape 4 : modélisation
Calcul du modèle logistique :
```c
logistique = glm(Y~X1+X2,family="binomial")
```
Affichage des résultats :
```c
summary(logistique)
```

**Équation du modèle :**
```c
P[Y=1|X] = exp(A1*X1+A2*X2+B)/(1+exp(A1*X1+B))
```
Avec :
```c
A1 = Estimate_X1
A2 = Estimate_X2
B = Estimate_intercept
```

#### Test de Wald (summary)
Hypothèses :  
**H0 :** *pas d'influence de Xi sur Y*  
**H1 :** *influence de Xi sur Y*  

Conclusion au seuil 5% :  
p-value < 0,05 → rejet de *H0* → influence de Xi sur Y  
p-value > 0,05 → non rejet de *H0* → pas d'influence de Xi sur Y  

Inconvénient : *ce test a tendance à favoriser H0*

#### Test du rapport de vraisemblance
Hypothèses :  
**H0 :** *pas d'influence de Xi sur Y*  
**H1 :** *influence de Xi sur Y*  

```c
anova(logistique,test="Chisq")
```

Conclusion au seuil 5% :  
p-value < 0,05 → rejet de *H0* → influence de Xi sur Y  
p-value > 0,05 → non rejet de *H0* → pas d'influence de Xi sur Y  


## Étape 5 : validation du modèle
### Adéquation du modèle
Hypothèses :  
**H0 :** *le modèle est correct*  
**H1 :** *le modèle n'est pas correct*  

Test de Hosmer & Lemeshow :
```c
hoslem.test(Y,fitted(logistique))
```

Conclusion au seuil 5% :  
p-value < 0,05 → rejet de *H0* → le modèle n'est pas correct  
p-value > 0,05 → non rejet de *H0* → le modèle est cohérent avec les données  

### Étude des résidus
Résidus studentisés :
```c
sresidus = rstudent(logistique)
```
**Normailté des résidus**
```c
shapiro.test(sresidus)
```
Conclusion au seuil 5% :  
p-value > 0,05 → non rejet de *H0* → les résidus suivent une loi normale → **condition OK**  

**Linéarité**
```c
plot(X,sresidus)
abline(h=c(-2,0,2))
```
95 % des résidus entre -2 et 2 → **condition OK**  

### Valeurs influentes
```c
influence.measures(logistique)
```
Évaluation de l'amélioration du modèle en enlevant chaque valeur une par une : les valeurs influentes comportent des étoiles  


## Étape 6 : performance du modèle
Calcul des prédictions par le modèle :
```c
predictions = predict(logistique)
```

Tracer la courbe ROC :
```c
courbe = roc(Y,predictions)
plot(courbe)
```

Calcul de l'AUC :
```c
courbe$auc
```
AUC             | Performance
----------------|---------------------------------  
AUC = 0,5       | pas de discrimination Y=0 et Y=1  
0,7 < AUC < 0,8 | discrimination acceptable  
0,8 < AUC < 0,9 | discrimination excellente  
0,9 < AUC < 1   | discrimination presque parfaite  

L'AUC permet la comparaison entre modèles prédictifs  

Pour comparer des modèles et sélectionner le meilleur on peut également chercher celui avec les AIC et BIC les plus petits  


---  
[MementoR](https://github.com/HanBnrd/MementoR)

&copy; *2018* [*Johann Benerradi*](https://github.com/HanBnrd)
