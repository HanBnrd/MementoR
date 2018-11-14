# Analyse de variance à un facteur

**Quand l'utiliser ?**

Étude de l'influence de X sur Y avec :
- Y variable quantitative  
- X variable qualitative  


## Étape 1 : lecture du jeu de données
*Importer le jeu de données*

Utiliser le jeu de données :
```r
attach(data)
```
```r
Y = quantitative
X = qualitative
```


## Étape 2 : description des données
Visualisation des données (boxplots) :
```r
boxplot(Y~X)
```


## Étape 3 : vérification des conditions d'application
##### Condition 1 : indépendance des données
Le jeu de données doit avoir été fait tel que toutes les observations sont indépendantes les unes des autres

##### Condition 2 : normalité des distributions
Création des sous-groupes de Y pour les différentes modalités :
```r
mod1 = Y[X=="Modalite1"]
mod2 = Y[X=="Modalite2"]
mod3 = Y[X=="Modalite3"]
```

Hypothèses de normalité :  
**H0 :** *les données suivent une loi normale*  
**H1 :** *les données ne suivent pas une loi normale*  

Vérification de la normalité de la distribution de Y dans chaque modalité de X :
```r
shapiro.test(mod1)
shapiro.test(mod2)
shapiro.test(mod3)
```
Conclusions au seuil 5% :  
p-value < 0,05 pour chaque sous-groupe → rejet de *H0* → les données ne suivent pas une loi normale  
p-value > 0,05 pour chaque sous-groupe → non rejet de *H0* → les données suivent une loi normale → **condition OK**

##### Condition 3 : homoscédasticité ou égalité des variances
Hypothèses d'homoscédasticité :  
**H0 :** *pas de différence entre les variances des différents sous-groupes*  
**H1 :** *différence entre les variances des différents sous-groupes*  

Test de Bartlett :
```r
bartlett.test(Y~X)
```
Conclusion au seuil 5% :  
p-value < 0,05 → rejet de *H0* → au moins une différence entre les variances  
p-value > 0,05 → non rejet de *H0* → homoscédasticité → **condition OK**


### Choix du test
Si toutes les conditions sont vérifiées → test paramétrique  
Si au moins une des conditions n'est pas vérifiée → test non paramétrique


## Étape 4 : réalisation du test
### Test paramétrique
Hypothèses :  
**H0 :** *pas d'effet du facteur X sur Y*  
**H1 :** *effet du facteur X sur Y*  

Calcul de l'ANOVA :
```r
anova = aov(Y~X)
```

Affichage des résultats :
```r
summary(anova)
```
Conclusion au seuil 5% :  
p-value < 0,05 → rejet de *H0* → effet de X sur Y  
p-value > 0,05 → non rejet de *H0* → pas d'effet de X sur Y  


### Test non paramétrique
On travaille sur les rangs → moins de précision

Test de Kruskal Wallis :
```r
kruskal.test(X~Y)
```
puis ```pairwisewilcox.test```


## Étape 5 : conclusion finale
Si on ne peut pas rejeter *H0* → analyse terminée  
Si on rejette *H0* → comparaison des modalités 2 à 2  

Comparaison des modalités 2 à 2 :
```r
pairwise.t.test(Y,X,p.adjust.method = "bonferroni")
```
Remarque : *l'ajustement de la p-value est nécessaire quand on a plus de 2 modalités*

Conclusion au seuil 5% :  
p-value < 0,05 → rejet de *H0* → différence significative de Y dans les 2 modalités  
p-value > 0,05 → non rejet de *H0* → pas de différence significative de Y dans les 2 modalités  


---  
[MementoR](https://github.com/HanBnrd/MementoR)

&copy; *2018* [*Johann Benerradi*](https://github.com/HanBnrd)
