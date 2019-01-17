# TFM-Crimes-in-Madrid
A Data Science Project about Crimes in Madrid and its districts.

(JAN19-Summary Crimes in Madrid.docx)
-------------------------------------------------------------------------

In the city of Madrid, Spain, Local Police has been picking all kind of crimes in the city and writing in an excel file every Month from 2014 until now.
Then, data are suministrated by Madrid Town Hall Police. from this link: 
https://datos.madrid.es/portal/site/egob/menuitem.c05c1f754a33a9fbe4b2e4b284f1a5a0/?vgnextoid=bffff1d2a9fdb410VgnVCM2000000c205a0aRCRD&vgnextchannel=374512b9ace9f310VgnVCM100000171f5a0aRCRD&vgnextfmt=default


Anyway, I have downloaded the data to work with and I have stored it in '/Delitos'.
To clean the Data I have used R. The file to work with is 1_0_GettingTheCrimes.R, whose get the data from the path '/Delitos'.
I add the code District (it is in the same order as they are in every file)
This code allows me to add other information, as graphics data in Tableau.
I have downloaded the poligonal Districts in shp format, from here:
https://datos.madrid.es/portal/site/egob/menuitem.c05c1f754a33a9fbe4b2e4b284f1a5a0/?vgnextoid=46b55cde99be2410VgnVCM1000000b205a0aRCRD&vgnextchannel=374512b9ace9f310VgnVCM100000171f5a0aRCRD
The complet file is downloaded in /Graficos.

This R file is support by 1_1_Auxiliar.R.
The reason for using Auxiliar is to get inside the file the dates of every brief.
Every brief has the data of the crimes in a detail file, and the month-Year is in the name of the file. So, I made a Auxiliar.csv to associate the dates and the names as a dictionary.
It is high recommended not to run again Auxiliar.R, because the relation between the files' names and the dates could be broken (at least, don´t rewrite Auxiliar.csv) 

Once I have my Data in R, I export it to a csv file.

I work with it in python, to get some visualizations in order to obtain the association between the kind of Crimes and the Districts.
I can show that there is an association between two kinds of them (the drugs ones), and also between some Madrid Districts.
The file is named 2_CrimeAnalysis.ipynb

After that first analysis, I open the data I have worked with in python, in tableau. I also join the shapes from the Districts. This exercise allows me to see if there is a neigbourg relation between Districs. I made the exercise, and I uploaded to tableau public:

drugs crimes
https://public.tableau.com/profile/isabel1894#!/vizhome/GraphicsAnalysis/DrugsAssociationCrimes?publish=yes

other crimes: 
https://public.tableau.com/profile/isabel1894#!/vizhome/GraphicsAnalysis/OtherCrimes?publish=yes

Anyway, I have uploaded the file (and the graphic data) to git hub (GraphicsAnalysis.twb) where I get some importants ideas...

Finally, there is a web, where you can find a summary about the proyect and its conclusions: https://ifcanovas.github.io/

Thank you for reading this. :-)
