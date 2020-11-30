
#ALFA DE CRONBACH

#paquete a utilizar
install.packages("userfriendlyscience")
library(userfriendlyscience)

#Exploración de la matriz datos
dim(BD_Likert)
names(BD_Likert)
str(BD_Likert)
typeof(BD_Likert)

#En busca de valores perdidos
anyNA(BD_Likert)

#localiza la posición de los valores perdidos
which(is.na(BD_Likert))

#elimina las filas que contengan datos perdidos
# y se guarda en una nueva matriz de datos que es la
#que se utilizará para trabajar.

BD_Likert2<-na.omit(BD_Likert)


#Construcción de los constructos

attach(BD_Likert2)

constructo1<-data.frame(A1,A2,A3,A4,A5,A6,A7,A8)
constructo2<-data.frame(B1,B2,B3,B4)
constructo3<-data.frame(C1,C2,C3,C4,C5,C6)


#Calculamos el alfa de Cronbach para cada
#uno de los constructos

scaleReliability(constructo1)
scaleReliability(constructo2)
scaleReliability(constructo3)


#--------------EJERCICIO-------
#1.- Completa la construccion de los constructos
#D,E,F,G Y H.

#2.- Calcula el coeficiente alfa de cronbach para
#los constructos D, E, F, G Y H.

#3.- Súbelos a tu repositorio en Github con el nombre
#de Alfa de cronbach.

#4.- Sube en classroom una tabla (pdf) en donde concentres
#los resultados que obtuviste del coeficiente, interprétalos Y TOMA UNA DESICIÓN CON RESPECTO AL CONSTRUCTO.

                 