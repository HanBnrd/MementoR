# Comparaison des moyennes de deux échantillons appariés

**Quand l'utiliser ?**

Comparaison de la moyenne de Y1 à la moyenne de Y2 :
- Y1 variable quantitative (Y dans cas 1)  
- Y2 variable quantitative (Y dans cas 2)  
- Y1 et Y2 appariés


## Étape 1 : lecture du jeu de données
*Importer le jeu de données*

Utiliser le jeu de données :
```c
attach(data)
```
```c
Y1 = quantitative1
Y2 = quantitative2
```


## Étape 2 : description des données
Visualisation des données (boxplot) :
```c
boxplot(Y1,Y2)
```

Calcul des moyennes :
```c
mean(Y1)
mean(Y2)
```


## Étape 3 : vérification des conditions d'application
Taille des échantillons :  
```c
length(Y1)
```
ou
```c
length(Y2)
```

### Cas 1 : taille des échantillons supérieure ou égale à 30
**Conditions OK**

### Cas 2 : taille des échantillons inférieure à 30
##### Condition : normalité de la distribution des différences
Hypothèses de normalité :  
**H0 :** *les différences suivent une loi normale*  
**H1 :** *les différences ne suivent pas une loi normale*  

Vérification de la normalité de la distribution des différences entre Y1 et Y2 :
```c
D = Y1 - Y2
shapiro.test(D)
```
Conclusions au seuil 5% :  
p-value < 0,05 → rejet de *H0* → les différences ne suivent pas une loi normale  
p-value > 0,05 → non rejet de *H0* → les différences suivent une loi normale → **condition OK**


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
```c
t.test(Y1,Y2,paired=T)
```
Conclusion au seuil 5% :  
p-value < 0,05 → rejet de *H0* → la moyenne de Y1 est significativement différente de celle de Y2  
p-value > 0,05 → non rejet de *H0* → la moyenne de Y1 est significativement égale à celle de Y2  

**Test unilatéral : moyenne de Y1 supérieure à la moyenne de Y2**  
Hypothèses :  
**H0 :** *la moyenne de Y1 est égale à la moyenne de Y2*  
**H1 :** *la moyenne de Y1 est supérieure à la moyenne de Y2*  

Test de Student :
```c
t.test(Y1,Y2,paired=T,alternative="greater")
```
Conclusion au seuil 5% :  
p-value < 0,05 → rejet de *H0* → la moyenne de Y1 est significativement supérieure à celle de Y2  
p-value > 0,05 → non rejet de *H0* → la moyenne de Y1 est significativement égale à celle de Y2  

**Test unilatéral : moyenne de Y1 inférieure à la moyenne de Y2**  
Hypothèses :  
**H0 :** *la moyenne de Y1 est égale à la moyenne de Y2*  
**H1 :** *la moyenne de Y1 est inférieure à la moyenne de Y2*  

Test de Student :
```c
t.test(Y1,Y2,paired=T,alternative="less")
```
Conclusion au seuil 5% :  
p-value < 0,05 → rejet de *H0* → la moyenne de Y1 est significativement inférieure à celle de Y2  
p-value > 0,05 → non rejet de *H0* → la moyenne de Y1 est significativement égale à celle de Y2  


#  
[MementoR](https://github.com/HanBnrd/MementoR)

&copy; *2018* [*Johann Benerradi*](https://github.com/HanBnrd)
