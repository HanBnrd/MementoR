# Analyse de variance à deux facteurs


## Étape 1 - lecture du jeu de données :
### > Importer le jeu de données
attach(data)
Y = quantitative
X1 = qualitative1
X2 = qualitative2


## Étape 2 - description des données :
boxplot(Y~X1+X2)


## Étape 3 - vérification des conditions d'application :
### Condition 1 - indépendance des données
### Condition 2 - normalité des distributions :
mod1a2a = Y[X1=="Modalite1a" & X2=="Modalite2a"]
mod1a2b = Y[X1=="Modalite1a" & X2=="Modalite2b"]
mod1b2a = Y[X1=="Modalite1b" & X2=="Modalite2a"]
mod1b2b = Y[X1=="Modalite1b" & X2=="Modalite2b"]
shapiro.test(mod1a2a)
shapiro.test(mod1a2b)
shapiro.test(mod1b2a)
shapiro.test(mod1b2b)
### Condition 3 - homoscédasticité ou égalité des variances :
bartlett.test(Y,paste(X1,X2))
### > Choix du test


## Étape 4 - réalisation du test :
### Test paramétrique :
anova = aov(Y~X1+X2+X1*X2)
summary(anova)


## Étape 5 - conclusion finale :
pairwise.t.test(Y,paste(X1,X2),p.adjust.method = "bonferroni")
