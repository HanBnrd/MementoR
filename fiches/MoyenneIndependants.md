# Comparaison des moyennes de deux échantillons indépendants

**Quand l'utiliser ?**

Comparaison de la moyenne de Y1 à la moyenne de Y2 :
- Y1 variable quantitative (Y dans population 1)  
- Y2 variable quantitative (Y dans population 2)  


## Étape 1 : lecture du jeu de données
*Importer le jeu de données*

Utiliser le jeu de données :
```r
attach(data)
```
```r
Y1 = quantitative1
Y2 = quantitative2
```


## Étape 2 : description des données
Visualisation des données (boxplot) :
```r
boxplot(Y1,Y2)
```

Calcul des moyennes :
```r
mean(Y1)
mean(Y2)
```


## Étape 3 : vérification des conditions d'application
Taille des échantillons :
```r
length(Y1)
length(Y2)
```

### Cas 1 : taille de chaque échantillon supérieure ou égale à 30
**Conditions OK**

### Cas 2 : taille d'au moins un des échantillons inférieure à 30
##### Condition 1 : normalité de la distribution
Hypothèses de normalité :  
**H0 :** *les données suivent une loi normale*  
**H1 :** *les données ne suivent pas une loi normale*  

Vérification de la normalité de la distribution de Y1 et de Y2 :
```r
shapiro.test(Y1)
shapiro.test(Y2)
```
Conclusions au seuil 5% :  
p-value < 0,05 pour chaque population → rejet de *H0* → les données ne suivent pas une loi normale  
p-value > 0,05 pour chaque population → non rejet de *H0* → les données suivent une loi normale → **condition OK**

##### Condition 2 : homoscédasticité ou égalité des variances
Hypothèses d'homoscédasticité :  
**H0 :** *pas de différence entre les variances des populations*  
**H1 :** *différence entre les variances des populations*  

Test de Fisher Snedecor :
```r
var.test(Y1,Y2)
```
Conclusion au seuil 5% :  
p-value < 0,05 → rejet de *H0* → différence entre les variances  
p-value > 0,05 → non rejet de *H0* → homoscédasticité → **condition OK**


### Choix du test
Si les conditions sont vérifiées → test paramétrique  
Si les conditions ne sont pas vérifiées → test non paramétrique


## Étape 4 : réalisation du test
### Tests paramétriques
**Test bilatéral : moyenne de Y1 différente de la moyenne de Y2**  
Hypothèses :  
**H0 :** *la moyenne de Y1 est égale à la moyenne de Y2*  
**H1 :** *la moyenne de Y1 est différente de le moyenne de Y2*  

Test de Student :
```r
t.test(Y1,Y2)
```
Conclusion au seuil 5% :  
p-value < 0,05 → rejet de *H0* → la moyenne de Y1 est significativement différente de celle de Y2  
p-value > 0,05 → non rejet de *H0* → la moyenne de Y1 est significativement égale à celle de Y2  

**Test unilatéral : moyenne de Y1 supérieure à la moyenne de Y2**  
Hypothèses :  
**H0 :** *la moyenne de Y1 est égale à la moyenne de Y2*  
**H1 :** *la moyenne de Y1 est supérieure à la moyenne de Y2*  

Test de Student :
```r
t.test(Y1,Y2,alternative="greater")
```
Conclusion au seuil 5% :  
p-value < 0,05 → rejet de *H0* → la moyenne de Y1 est significativement supérieure à celle de Y2  
p-value > 0,05 → non rejet de *H0* → la moyenne de Y1 est significativement égale à celle de Y2  

**Test unilatéral : moyenne de Y1 inférieure à la moyenne de Y2**  
Hypothèses :  
**H0 :** *la moyenne de Y1 est égale à la moyenne de Y2*  
**H1 :** *la moyenne de Y1 est inférieure à la moyenne de Y2*  

Test de Student :
```r
t.test(Y1,Y2,alternative="less")
```
Conclusion au seuil 5% :  
p-value < 0,05 → rejet de *H0* → la moyenne de Y1 est significativement inférieure à celle de Y2  
p-value > 0,05 → non rejet de *H0* → la moyenne de Y1 est significativement égale à celle de Y2  


> &larr; [Retour](../README.md)
