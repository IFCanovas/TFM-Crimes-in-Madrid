# TFM-Crimes-in-Madrid
A Data Science Project about Crimes in Madrid and its districts.

-------------------------------------------------------------------------

In the city of Madrid, Spain, Local Police has been picking all kind of crimes in the city and writing in an excel file every Month from 2014 until now.
Then, data are suministrated by Madrid Town Hall Police. from this link: 
https://datos.madrid.es/portal/site/egob/menuitem.c05c1f754a33a9fbe4b2e4b284f1a5a0/?vgnextoid=bffff1d2a9fdb410VgnVCM2000000c205a0aRCRD&vgnextchannel=374512b9ace9f310VgnVCM100000171f5a0aRCRD&vgnextfmt=default


Anyway, I have downloaded the data to work with and I have stored it in '/Delitos'.
To clean the Data I have used R. The file to work with is 1_0_GettingTheCrimes.R, whose get the data from the path '/Delitos'.

This file is support by 1_1_Auxiliar.R.
The reason for using Auxiliar is to get inside the file the dates of every brief.
Every brief has the data of the crimes in a detail file, and the month-Year is in the name of the file. So, I made a Auxiliar.csv to associate the dates and the names as a dictionary.
It is high recommended not to run again Auxiliar.R, because the relation between the files' names and the dates could be broken (at least, don´t rewrite Auxiliar.csv) 

Once I have my Data in R, I export it to a csv file.

I work with it in python, to get some visualizations in order to obtain the association between the kind of Crimes and the Districts.
I can show that there is an association between two kinds of them, and also between some Madrid Districts.
The file is named 2CrimeAnalysis.ipynb

