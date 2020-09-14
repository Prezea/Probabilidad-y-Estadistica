
#TEMA: CONOCIENDO MI BASE DE DATOS
#http://planea.sep.gob.mx/ba/base_de_datos_2017/

install.packages("Readxl") #importa los datos .xls
install.packages("gdata") #realizaremos la limpieza

library(Readxl)
library(gdata) 

#Importación de datos

#PROCEDIMIENTOS: Import Dataset/From excel/seleccionar la ruta ddel archivo/ importar

#Cambiaremos el nombre del archivo para que sea más fácil usarlo.
BD<-X30_escuelas_peb2017
View(BD)

#Explorando el archivo
#Dimensión de la BD (observaciones y variables)
dim(BD)

#atributos
atributes(BD)

#clase
class(BD)

#paquetería gdata
BD<-rename.vars(BD, from="...3", to="Escuela")
BD<-rename.vars(BD, from="...4", to="Clave_Escolar")
BD<-rename.vars(BD, from="...5", to="Turno")

#Ejercicio 1
#Renombrar las variables
#nota agregar claves de codificación. (libreta morada)
#1.- [..6]:[..15]
#2.- [..18]:[..22]
#3.- [..35]:[..38]

#Al final Visualiza la BD y observa cómo quedó


BD<-rename.vars(BD, from="...6", to="Municipio")
BD<-rename.vars(BD, from="...7", to="Localidad")
BD<-rename.vars(BD, from="...3", to="Escuela")
BD<-rename.vars(BD, from="...3", to="Escuela")
BD<-rename.vars(BD, from="...7", to="Municipio")
BD<-rename.vars(BD, from="...8", to="Tipo_Escuela")
BD<-rename.vars(BD, from="...9", to="Grado")
BD<-rename.vars(BD, from="...10", to="Grado_Marginación")
BD<-rename.vars(BD, from="...11", to="Alumnos_programados")
BD<-rename.vars(BD, from="...12", to="AEv_LyC")
BD<-rename.vars(BD, from="...13", to="AEv_M")
BD<-rename.vars(BD, from="...14", to="PorcEv_LyC")
BD<-rename.vars(BD, from="...15", to="PorcEv_M")

BD<-rename.vars(BD, from="...19", to="NL1_LyC")
BD<-rename.vars(BD, from="...20", to="NL2_LyC")
BD<-rename.vars(BD, from="...21", to="NL3_LyC")
BD<-rename.vars(BD, from="...22", to="NL4_LyC")

BD<-rename.vars(BD, from="...35", to="NL1_M")
BD<-rename.vars(BD, from="...36", to="NL2_M")
BD<-rename.vars(BD, from="...37", to="NL3_M")
BD<-rename.vars(BD, from="...38", to="NL4_M")

View(BD)

#Borrar Columnas
BD<-remove.vars(BD,c("...1","...2"))
View(BD)

#Revisamos los nombres de las columnas
names(BD)


#Eliminamos las filas adicionales (no nos sirven)
BD=BD[-1,]
BD=BD[-2,]
BD=BD[-3,]
BD=BD[-4,]

View(BD)
#Poner etiquetas a las variables para saber su significado
#1.- Confirmamos que la variable no tenga etiqueta
attr(BD,"variable.labels")["NL1_LyC"]

#2.- Agregar una etiqueta (copiar el comando anterior y agregar la etiqueta)
attr(BD,"variable.labels")["NL1_LyC"]<-"Nivel de logro I Lenguaje y Comunicación"

#3.- Revisar que la etiqueta se haya incluido
attr(BD,"variable.labels")["NL1_LyC"]


#Codificar la variable Turno: Matutino=1, Vespertino=2
#1.- Que nos muestre la etiqueta de valor de la variable Turno
attr(BD$Turno,"value.labels")

#2.- Asignarle un atributo a la variable Turno
attr(BD$Turno,"value.labels")<-c(Matutino=1,Vespertino=2)

#3.- Verificamos que la variable Turno esté correctamente codificada
attr(BD$Turno,"value.labels")


#Para finalizar
#Guardamos nuestra nueva base de datos
#1.- Localizar la carpeta en dónde vas a guardar el archivo
#2.- sobre la carpeta realiza: click derecho/propiedades/
    #copia la ruta de ubicación control+C/regresa a RStudio
#Nota: Para windows cambia de sentido las diagonales \ -> /
      #Para Mac déjalos así.
#3.- A la dirección agregamos una diagonal en donde se indica la 
     #carpeta en donde se va a guardar el archivo.

setwd("C:/Users/Yendi/Documents/BENV 2020/Probabilidad y Estadística/Clases/Unidad  1/R/Unidad 1")

#importamos la base de datos en un documento .csv
write.table(BD, file="BD_Planea_2017.csv", sep=";", row.names = FALSE)


#TE RETO A QUE:
        #Hagas lo mismo que hicimos en la clase pero ahora con una base de datos
        #de otro Estado de la República  XD

#-------------- EL FIN --------------