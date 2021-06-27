# Analyse de variance à un facteur


## Étape 1 - lecture du jeu de données :
### > Importer le jeu de données
attach(data)
Y = quantitative
X = qualitative


## Étape 2 - description des données :
boxplot(Y~X)


## Étape 3 - vérification des conditions d'application :
### Condition 1 - indépendance des données
### Condition 2 - normalité des distributions :
mod1 = Y[X=="Modalite1"]
mod2 = Y[X=="Modalite2"]
mod3 = Y[X=="Modalite3"]
shapiro.test(mod1)
shapiro.test(mod2)
shapiro.test(mod3)
### Condition 3 - homoscédasticité ou égalité des variances :
bartlett.test(Y~X)
### > Choix du test


## Étape 4 - réalisation du test :
### Test paramétrique :
anova = aov(Y~X)
summary(anova)
### Test non paramétrique :
kruskal.test(X~Y)
### > puis ```pairwise.wilcox.test```


## Étape 5 - conclusion finale :
pairwise.t.test(Y,X,p.adjust.method = "bonferroni")
