# Régression linéaire et corrélation

**Quand les utiliser ?**

Étude de la relation entre X et Y avec :
- Y variable quantitative (expliquée)  
- X variable quantitative (explicative)  


## Étape 1 : lecture du jeu de données
*Importer le jeu de données*

Utiliser le jeu de données :
```c
attach(data)
```
```c
Y = expliquee
X = explicative
```


## Étape 2 : description des données
Visualisation des données :
```c
plot(Y~X)
```


## Étape 3 : vérification des conditions d'application
##### Condition : normalité des distributions
Hypothèses de normalité :  
**H0 :** *les données suivent une loi normale*  
**H1 :** *les données ne suivent pas une loi normale*  

Vérification de la normalité de la distribution de X et Y :
```c
shapiro.test(X)
shapiro.test(Y)
```
Conclusions au seuil 5% :  
p-value < 0,05 pour chaque variable → rejet de *H0* → les données ne suivent pas une loi normale  
p-value > 0,05 pour chaque variable → non rejet de *H0* → les données suivent une loi normale → **Condition OK**


## Étape 4: réalisation des tests
### Test de corrélation
Hypothèses :  
**H0 :** *pas de corrélation linéaire entre X et Y*  
**H1 :** *corrélation linéaire entre X sur Y*  

Test de corrélation :
```c
anova = corr.test(X,Y)
```
Conclusion au seuil 5% :  
p-value < 0,05 → rejet de *H0* → corrélation linéaire entre X et Y  
p-value > 0,05 → non rejet de *H0* → pas de corrélation linéaire entre X et Y  


### Régression linéaire
Calcul de la droite du modèle linéaire :
```c
droite = lm(Y~X)
```
Affichage des résultats :
```c
summary(droite)
```

Équation de la droite calculée :
```c
Y = [Estimate_X]*X + [Estimate_intercept]
```

#### Coefficient directeur
Hypothèses :  
**H0 :** *le coefficient directeur de la droite est nul*  
**H1 :** *le coefficient directeur de la droite n'est pas nul*  

Conclusion au seuil 5% :  
p-value < 0,05 → rejet de *H0* → coefficient non nul → existence d'une relation linéaire entre X et Y  
p-value > 0,05 → non rejet de *H0* → coefficient nul → pas de relation linéaire entre X et Y  

#### Coefficient de détermination
Hypothèses :  
**H0 :** *le coefficient de détermination est nul*  
**H1 :** *le coefficient de détermination n'est pas nul*  

Conclusion au seuil 5% :  
p-value < 0,05 → rejet de *H0* → coefficient non nul → les valeurs de X expliquent les variations de Y  
p-value > 0,05 → non rejet de *H0* → coefficient nul → les valeurs de X n'expliquent pas les variations de Y  


## Étape 5: validation du modèle
#### Étude des résidus
Résidus studentisés :
```c
sresidus = rstudent(droite)
```
Normailté des résidus :
```c
shapiro.test(sresidus)
```
Conclusion au seuil 5% :  
p-value > 0,05 → non rejet de *H0* → les résidus suivent une loi normale → **Condition OK**  

Linéarité :
```c
plot(X,sresidus)
abline(h=c(-2,0,2))
```
95 % des résidus entre -2 et 2 → **Condition OK**  

#### Valeurs influentes
```c
influence.measures(droite)
```
Les valeurs influentes comportent des étoiles.  


[MementoR](https://github.com/HanBnrd/MementoR)

&copy; *2018* [*Johann Benerradi*](https://github.com/HanBnrd)
