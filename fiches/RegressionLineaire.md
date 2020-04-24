# Régression linéaire et corrélation

> [Code source](https://github.com/HanBnrd/MementoR/blob/master/src/RegressionLineaire.R) &rarr;

**Quand les utiliser ?**

Étude de la relation entre X et Y avec :
- Y variable quantitative (expliquée)  
- X variable quantitative (explicative)  


## Étape 1 : lecture du jeu de données
*Importer le jeu de données*

Utiliser le jeu de données :
```r
attach(data)
```
```r
Y = expliquee
X = explicative
```


## Étape 2 : description des données
Visualisation des données :
```r
plot(Y~X)
```


## Étape 3 : vérification des conditions d'application
##### Condition : normalité des distributions
Hypothèses de normalité :  
**H0 :** *les données suivent une loi normale*  
**H1 :** *les données ne suivent pas une loi normale*  

Vérification de la normalité de la distribution de X et Y :
```r
shapiro.test(X)
shapiro.test(Y)
```
Conclusions au seuil 5% :  
p-value < 0,05 pour chaque variable → rejet de *H0* → les données ne suivent pas une loi normale  
p-value > 0,05 pour chaque variable → non rejet de *H0* → les données suivent une loi normale → **condition OK**


## Étape 4 : test de corrélation
Hypothèses :  
**H0 :** *pas de corrélation linéaire entre X et Y*  
**H1 :** *corrélation linéaire entre X et Y*  

Test de corrélation :
```r
cor.test(X,Y)
```
Conclusion au seuil 5% :  
p-value < 0,05 → rejet de *H0* → corrélation linéaire entre X et Y  
p-value > 0,05 → non rejet de *H0* → pas de corrélation linéaire entre X et Y  


## Étape 5 : modélisation
Calcul du modèle linéaire :
```r
droite = lm(Y~X)
```
Affichage des résultats :
```r
summary(droite)
```

**Équation du modèle :**
```r
Y = [Estimate_X]*X + [Estimate_intercept]
```

#### Coefficient directeur (summary)
Hypothèses :  
**H0 :** *le coefficient directeur de la droite est nul*  
**H1 :** *le coefficient directeur de la droite n'est pas nul*  

Conclusion au seuil 5% :  
p-value < 0,05 → rejet de *H0* → coefficient non nul → existence d'une relation linéaire entre X et Y  
p-value > 0,05 → non rejet de *H0* → coefficient nul → pas de relation linéaire entre X et Y  

#### Coefficient de détermination (summary)
Hypothèses :  
**H0 :** *le coefficient de détermination est nul*  
**H1 :** *le coefficient de détermination n'est pas nul*  

Conclusion au seuil 5% :  
p-value < 0,05 → rejet de *H0* → coefficient non nul → les valeurs de X expliquent les variations de Y  
p-value > 0,05 → non rejet de *H0* → coefficient nul → les valeurs de X n'expliquent pas les variations de Y  


## Étape 6 : validation du modèle
### Étude des résidus
Résidus studentisés :
```r
sresidus = rstudent(droite)
```
**Normailté des résidus**
```r
shapiro.test(sresidus)
```
Conclusion au seuil 5% :  
p-value > 0,05 → non rejet de *H0* → les résidus suivent une loi normale → **condition OK**  

**Linéarité**
```r
plot(X,sresidus)
abline(h=c(-2,0,2))
```
95 % des résidus entre -2 et 2 → **condition OK**  

### Valeurs influentes
```r
influence.measures(droite)
```
Évaluation de l'amélioration du modèle en enlevant chaque valeur une par une : les valeurs influentes comportent des étoiles  


> &larr; [Plan](../README.md)
