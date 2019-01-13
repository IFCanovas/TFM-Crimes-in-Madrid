######################################################################################
######################################################################################
##############################   TFM-Crimes-in-Madrid   ##############################
##                                                                                  ##
##   Isabel Flores Cánovas                                                          ##
##   Master Data Science ED. VIII                                                   ##
##   KSchool                                                                        ##
##   Madrid                                                                         ##
##                                                                                  ##
## This is an auxiliar file to get the relation between the name of the files of    ##
## of the Crimes, and their Data.                                                   ##
## I save the relation in a Auxiliar.csv. I will use it to merge it with my Data    ##
## This document is just to show how i made the association between the name of the ##
## brief and the dates. If you compile it, it has high risk that the right          ##
## association get BROKEN and the dates don´t match with the right file.            ##                                                                               ##
##                                                                                  ##
######################################################################################
######################################################################################


# The Data have been donwloaded from here:
# https://datos.madrid.es/portal/site/egob/menuitem.c05c1f754a33a9fbe4b2e4b284f1a5a0/?vgnextoid=bffff1d2a9fdb410VgnVCM2000000c205a0aRCRD&vgnextchannel=374512b9ace9f310VgnVCM100000171f5a0aRCRD&vgnextfmt=default


#########################
# Installing libraries  #
#########################

#require(purrr)  # for map(), reduce()
require(data.table) # for fread()

install.packages("readr")
library("readxl")

#install.packages("dplyr")
#library("dplyr")

library(stringr)
library(tidyr)





###############################################
#Identify the path where the informs are      #
###############################################

data_path <- file.path("Delitos")
files<- dir(data_path)

###################################
#Making a manual association      #
###################################



fecha <- 1:59
fecha[1] <- '2015-04-01'
fecha[2] <- '2015-01-01'
fecha[3] <- '2015-02-01'
fecha[4] <- '2015-03-01'
fecha[5] <- '2016-08-01'
fecha[6] <- '2015-05-01'
fecha[7] <- '2015-12-01'
fecha[8] <- '2016-12-01'
fecha[9] <- '2016-04-01'
fecha[10] <- '2015-08-01'
fecha[11] <- '2016-01-01'
fecha[12] <- '2016-02-01'
fecha[13] <- '2015-07-01'
fecha[14] <- '2015-06-01'
fecha[15] <- '2016-03-01'
fecha[16] <- '2015-11-01'
fecha[17] <- '2015-10-01'
fecha[18] <- '2015-09-01'
fecha[19] <- '2017-01-01'
fecha[20] <- '2017-02-01'
fecha[21] <- '2016-11-01'
fecha[22] <- '2017-07-01'
fecha[23] <- '2017-06-01'
fecha[24] <- '2017-11-01'
fecha[25] <- '2014-04-01'
fecha[26] <- '2017-04-01'
fecha[27] <- '2018-04-01'
fecha[28] <- '2014-08-01'
fecha[29] <- '2017-08-01'
fecha[30] <- '2018-08-01'
fecha[31] <- '2014-12-01'
fecha[32] <- '2017-12-01'
fecha[33] <- '2014-01-01'
fecha[34] <- '2018-01-01'
fecha[35] <- '2014-02-01'
fecha[36] <- '2018-02-01'
fecha[37] <- '2014-07-01'
fecha[38] <- '2018-07-01'
fecha[39] <- '2014-06-01'
fecha[40] <- '2018-06-01'
fecha[41] <- '2014-03-01'
fecha[42] <- '2017-03-01'
fecha[43] <- '2018-03-01'
fecha[44] <- '2014-05-01'
fecha[45] <- '2017-05-01'
fecha[46] <- '2018-05-01'
fecha[47] <- '2018-11-01'
fecha[48] <- '2014-11-01'
fecha[49] <- '2014-10-01'
fecha[50] <- '2017-10-01'
fecha[51] <- '2018-10-01'
fecha[52] <- '2014-09-01'
fecha[53] <- '2017-09-01'
fecha[54] <- '2018-09-01'
fecha[55] <- '2016-07-01'
fecha[56] <- '2016-06-01'
fecha[57] <- '2016-05-01'
fecha[58] <- '2016-10-01'
fecha[59] <- '2016-09-01'

FicheroFecha <- data.frame(Fichero = files, fecha = fecha)

# Export the result
write.csv(FicheroFecha, file = "Auxiliar.csv", row.names = FALSE, fileEncoding = "UTF-8")
