######################################################################################
######################################################################################
##############################   TFM-Crimes-in-Madrid   ##############################
##                                                                                  ##
##   Isabel Flores Cánovas                                                          ##
##   Master Data Science ED. VIII                                                   ##
##   KSchool                                                                        ##
##   Madrid                                                                         ##
##                                                                                  ##
## The data are suministrated by Madrid Town Hall Police. They offer a summary per  ## 
## month since 2014. I have downloaded the data to work with. But first, they have  ##
## to be joined and cleaned, before analysing.                                      ##
## So, this exercise consist in using R to collect the downloaded information and   ##
## organize it in an unique file to work with.                                      ##                                  ##
##                                                                                  ##
##                                                                                  ##
######################################################################################
######################################################################################


# The Data have been donwloaded from here:
# https://datos.madrid.es/portal/site/egob/menuitem.c05c1f754a33a9fbe4b2e4b284f1a5a0/?vgnextoid=bffff1d2a9fdb410VgnVCM2000000c205a0aRCRD&vgnextchannel=374512b9ace9f310VgnVCM100000171f5a0aRCRD&vgnextfmt=default


######################################################################################
# Installing libraries in order to read an work with all the Madrid Crimes summaries #
######################################################################################

#require(purrr)  # for map(), reduce()
require(data.table) # for fread()

install.packages("readr")
library("readxl")

#install.packages("dplyr")
#library("dplyr")

library(stringr)
library(tidyr)


###############################################
# Identify the path where the informs are     #
###############################################

data_path <- file.path("Delitos")
files<- dir(data_path)


#####################
# Making functions  #
#####################

# Every brief have the data of the crimes in a detail file, and the month ant¡d the Year is 
# in the name of the file. So, I´m going to add this information to our studio. 
# I need to join the name of the file in every file, so I will use a function.


integra.ficheros.directorio <- function(directorio, listado.ficheros){

  #The files I'm going to use:  
  #listado.ficheros <- files
  #directorio <- data_path
 
  #I get the data and the path to get the names 
  ficheros.procesar <- data.table(NombreFichero = listado.ficheros)
  ficheros.procesar$separar <- "/"
  ficheros.procesar$dir <- directorio
  ficheros.procesar <- unite(ficheros.procesar, RutaCompleta, dir, separar, NombreFichero, remove = F, sep = "")
  ficheros.procesar$separar <- NULL
  ficheros.procesar$dir <- NULL
 
  #I check the rows we are going to use (case they were differents) 
  if (nrow(ficheros.procesar)>0){
    for (i in seq(nrow(ficheros.procesar))){
      fila <- ficheros.procesar[i]
      #print(nrow(ficheros.procesar)-i)
      #print(fila$NombreFichero)
      if (.Platform$OS.type == "windows") flush.console()
      #Try to open the file
      error.open.file <- try(data.table(read_excel(path = as.character(fila$RutaCompleta), col_names = T, skip = 2)))
      #I start the process and join all the data (excels files, XLS and XLSX)
      if (class(error.open.file) != "try-error"){
        nuevos.datos <- data.table(read_excel(path = as.character(fila$RutaCompleta), col_names = T, skip = 2))
        nuevos.datos$fichero.origen.integrado <- fila$NombreFichero
        if (i == 1){
          total.datos <- nuevos.datos
        } else {
          if (!is.data.frame(nuevos.datos)){} else{
            total.datos <- rbind(total.datos, nuevos.datos)
          }
        }
      }
      if (class(error.open.file) == "try-error"){
      }
    }
    if (nrow(total.datos)==0){resultado <- 0}else{resultado <- total.datos}
    return(resultado)
  }
}


##################################################
#Joinning all the informs in one dataframe        #
##################################################

#I use the function created before to get the data.

df <- integra.ficheros.directorio(data_path, listado.ficheros = files)

# The point is I have now the name of the original file, which has the date of the crimes.
# Every brief have the data of the crimes in a detail file, and the month-Year is 
# in the name of the file. So, I´m going to add this information to our studio. 

Auxiliar <- read.csv("Auxiliar.csv")
df <- merge(x = df, y = Auxiliar, all.x = T, by.x = 'fichero.origen.integrado', by.y = "Fichero")

# Sort the dataframe
df <- arrange(df, fecha)

# Export the result
write.csv(df, file = "Delitos.csv", row.names = FALSE, fileEncoding = "UTF-8")

####################################################################################
## Now, I have a cleaned file to analyse. I will do it with python, instead of R. ##
## Python allows me to do the analysis in a different way.                        ##
####################################################################################

