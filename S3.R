#En esta práctica vamos a trabajar con la matriz 
#de datos "flores" que es la traducción de la matriz "iris".
#Revisaremos los códigos para:
    #1.- Explorar una matriz de datos.
    #2.- Obtener las estadísticas descriptivas y de dispersion.
    #3.- Generar algunos gráficos.
    #4.- Prueba de Normalidad

#Abrimos la matriz de datos flores y la pondremos dentro un
#objeto de igual nombre

install.packages("datos") #Este comando descarga el paquete
library(datos)#Este comando abre el paquete

flores<-(datos::flores)

atm<-(datos::atmosfera)

str(atm)

#Vamos a explorar la matriz de datos con los siguientes comandos
?flores #Ayuda
dim(flores) #dimension
names(flores) #nombre de las variables 
str(flores)#tipo de variable
anyNA(flores)#me indica los datos perdidos
typeof(flores)#tipo de matriz de datos
View(flores)#visualizacion de la tabla (data frame)

#Convertiremos la matriz de datos a "data frame".
flores_1<-as.data.frame(flores)


#inicaremos calculando los estadisticos descriptivos
summary(flores_1)

#calcularemos la moda, primero tenemos que instalar el
#paquete modeest y abrir la libreria
install.packages("modeest")
library(modeest)

#la función que utilizaremos para identificar la moda
#es mfv()
mfv(flores_1$Largo.Sepalo)
mfv(flores_1$Ancho.Sepalo)
mfv(flores_1$Largo.Petalo)#¿que observas?
mfv(flores_1$Ancho.Petalo)
mfv(flores_1$Especies)#¿que observas?

#calculamos la varianza de cada una de las variables
#cuantitativas
var(flores_1$Largo.Sepalo)
var(flores_1$Ancho.Sepalo)
var(flores_1$Largo.Petalo)
var(flores_1$Ancho.Petalo)

#calcularemos la desviacion standar para cada una de las
#variables cuantitativas
sd(flores_1$Largo.Sepalo)
sd(flores_1$Ancho.Sepalo)
sd(flores_1$Largo.Petalo)
sd(flores_1$Ancho.Petalo)



#calculamos el error para la variable largo del sépalo

mean_1<-mean(flores_1$Largo.Sepalo)
error_1<-(flores_1$Largo.Sepalo-(mean_1))

#visualizamos el objeto error_1
error_1

#coeficiente de variacion
#vamos a instalar el paquete FinCal y abrimos la librería
install.packages("FinCal")
library(FinCal)


#calculamos el coeficiente de variación
coefficient.variation(sd=sd(flores_1$Largo.Sepalo),
                            avg=mean(flores_1$Largo.Sepalo))

#interpretacion: el largo del sépalo de las 3 especies tiene
#un coeficiente de variación del 0.14, lo multiplicamos por 100 y obtenemos
#el 14%, es decir, la variable largo del sépalo tiene un coeficente de
#variacion del 14% con respecto a la media.

#------------- Empezaremos a contruir algunos graficos---

#Instalaremos el paquete tidyverse y abriremos la libreria
install.packages("tidyverse")
install.packages("RColorBrewer")

#Abrimos las librerias
library(tidyverse)
library(RColorBrewer)


#Grafico de Barras

#Construcción de la tabla con la que vamos a trabajar
attach(flores_1)
tabla_especies<-table(flores_1$Especies)

#visualizamos la variable x que contiene la columna de Especies
tabla_especies

#Especificamos la paleta de colores que vamos a utilizar
color=c("darkseagreen","lightpink","mediumpurple1")

#Construimos el gráfico de la variable x
barplot(tabla_especies,xlab="Especies", ylab="Frecuencias", 
        main="Gráfico de barras de Especies", col=color)

#BOXPLOT
boxplot<-ggplot(flores_1,aes(factor(Especies), 
                           Largo.Sepalo, fill=Especies))+
  geom_boxplot()+
  ggtitle("Boxplot del Largo del sepalo")+
  xlab("Especies")+
  ylab("Largo.Sepalo")

#visualizamos el gráfico
boxplot

#Diagrama de dispersión 1
dispersion_1<-ggplot(flores_1, aes(x=Largo.Petalo, y=Largo.Sepalo, color=Especies))+
  geom_point()

#visualizamos el gráfico
dispersion_1

#Diagrama de dispersion 2 
attach(flores)
par(mfrow=c(1,1)) # Volver a definir una ventana normal
dispersion_2<-plot(flores$Largo.Petalo,flores$Ancho.Petalo,pch=19,
     col="purple",
     xlab="Largo del pétalo",
     ylab="Ancho del pétalo")

#diagrama de dispersion 3
dispersion_3<-ggplot(flores, aes(x=flores$Largo.Sepalo, y=flores$Ancho.Sepalo, 
                   colour=Especies))+
  geom_point(alpha=.9)+
  xlab("Largo del sépalo")+
  ylab("Ancho del sépalo")

#visualizamos el gráfico
dispersion_3

#Diagrama de dispersion múltiple
pairs(flores[,1:4],pch=19,
      col=c("blue","green","orange")[flores[,5]])


#Histograma 1, visualizando la variable largo del pétalo

ggplot(flores,aes(x=Largo.Petalo))+
  geom_histogram(binwidth = 0.1, col="black", fill="green", alpha=0.4)+
  xlab("Largo del pétalo")+
  ylab("Frecuencia")+
  ggtitle("Histograma del largo del pétalo")


#Histograma 2
par(mfrow=c(1,3))

hist(flores[1:50,3],main="Largo del pétalo (setosa)",
  xlab="",ylab="Frecuencias",col="red",breaks = "Sturges")+
  
hist(flores[51:100,3],main="Largo del pétalo (versicolor)",
     xlab="", ylab="Frecuencias", col="blue",breaks = "Sturges")
  
hist(flores[101:150,3],main="Largo del pétado (virginica)",
     xlab="",ylab="Frecuencias", col="green",breaks = "Sturges")

#Correlaciones
#Utilizamos Pearson para datos con distribución normal
#Utilizamos Wilcoxon para datos con sesgo (izq o der) 

#Prueba de Normalidad de Shapiro-Wilk

#Planteamiento de la Hipótesis Estadística

#Ho:Qué la muestra proviene de una distribución normal
#Ha: Qué la muestra NO proviene de una distribución normal

shapiro.test(Largo.Petalo)

#Interpretación:
#Se rechaza Ho si el valor de W [0 a 1] es pequeño y 
#el valor de p es menor que alfa (nivel de significacia [0.05])


#Conclusión:
#No podemos utilizar la correlación de Pearson porque
#la muestra no proviene de una distribución normal.
#Por lo tanto debemos de utilizar metodología paramétrica.


#Ejemplo:

#arg1=1000 números aleatorio
#arg2= media igual a 5
#arg3= desviación estándar igual a 0.005
prueba<-rnorm(1000,5,0.05) 
hist(prueba)

shapiro.test(prueba)
