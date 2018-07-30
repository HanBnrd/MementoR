# Comparaison de la moyenne d'un échantillon à une valeur théorique

**Quand l'utiliser ?**

Comparaison de la moyenne de Y à une valeur théorique avec :
- Y variable quantitative  


## Étape 1 : lecture du jeu de données
*Importer le jeu de données*

Utiliser le jeu de données :
```c
attach(data)
```
```c
Y = quantitative
m0 = theorique
```


## Étape 2 : description des données
Visualisation des données (boxplot) :
```c
boxplot(Y)
```

Calcul de la moyenne :
```c
mean(Y)
```


## Étape 3 : vérification des conditions d'application
Taille de l'échantillon :
```c
length(Y)
```

### Cas 1 : taille de l'échantillon supérieure ou égale à 30
**Conditions OK**

### Cas 2 : taille de l'échantillon inférieure à 30
##### Condition : normalité de la distribution
Hypothèses de normalité :  
**H0 :** *les données suivent une loi normale*  
**H1 :** *les données ne suivent pas une loi normale*  

Vérification de la normalité de la distribution de Y :
```c
shapiro.test(Y)
```
Conclusions au seuil 5% :  
p-value < 0,05 → rejet de *H0* → les données ne suivent pas une loi normale  
p-value > 0,05 → non rejet de *H0* → les données suivent une loi normale → **condition OK**


### Choix du test
Si les conditions sont vérifiées → test paramétrique  
Si les conditions ne sont pas vérifiées → test non paramétrique


## Étape 4 : réalisation du test
### Tests paramétriques
**Test bilatéral : moyenne différente de la valeur théorique**  
Hypothèses :  
**H0 :** *la moyenne de Y est égale à m0*  
**H1 :** *la moyenne de Y est différente de m0*  

Test de Student :
```c
t.test(Y,mu=m0)
```
Conclusion au seuil 5% :  
p-value < 0,05 → rejet de *H0* → la moyenne de Y est significativement différente de m0  
p-value > 0,05 → non rejet de *H0* → la moyenne de Y est significativement égale à m0  

**Test unilatéral : moyenne supérieure à la valeur théorique**  
Hypothèses :  
**H0 :** *la moyenne de Y est égale à m0*  
**H1 :** *la moyenne de Y est supérieure à m0*  

Test de Student :
```c
t.test(Y,mu=m0,alternative="greater")
```
Conclusion au seuil 5% :  
p-value < 0,05 → rejet de *H0* → la moyenne de Y est significativement supérieure à m0  
p-value > 0,05 → non rejet de *H0* → la moyenne de Y est significativement égale à m0  

**Test unilatéral : moyenne inférieure à la valeur théorique**  
Hypothèses :  
**H0 :** *la moyenne de Y est égale à m0*  
**H1 :** *la moyenne de Y est inférieure à m0*  

Test de Student :
```c
t.test(Y,mu=m0,alternative="less")
```
Conclusion au seuil 5% :  
p-value < 0,05 → rejet de *H0* → la moyenne de Y est significativement inférieure à m0  
p-value > 0,05 → non rejet de *H0* → la moyenne de Y est significativement égale à m0  


---  
[MementoR](https://github.com/HanBnrd/MementoR)

&copy; *2018* [*Johann Benerradi*](https://github.com/HanBnrd)
