# ETL-project


# Introduction

The purpose of this project is to implement the ETL methodology while merging different db in order to get a more accurate view of the scenario.

Our chosen scenario is conformed by three main aspects: COVID cases, Crime Rates and Total Population. This project may be used in a future as a first step in order to find out the correlation level between COVID Rate, Population Rate and Crime Rate in Mexico as these features are known to be related at certain level.


# Extract 

We extract the data from inegi.org and datos.cdmx.gob:

-Mexico City's COVID data are available in the next link: https://datos.cdmx.gob.mx/dataset/base-covid-sinave

-Population data of 2020 of municipalities are available in the next link: https://www.inegi.org.mx/programas/ccpv/2020/#Datos_abiertos

-Security data are available in the next link:https://drive.google.com/file/d/1uD9NdAsV3tlXhqvv6WEpV5nR8gqDjsN7/view


# Transform

As we have already said, we have three main Databases. Please find below the transformations we applied to each one:

Crime DataBase: this database was transformed to show the Total Number of Robberies classified by the modality of robbery (ex: 
"Robo de cables, tubos y otros objetos destinados a servicios pÃºblicos Con violencia") per Neighborhood and Neighborhood's code (ex: 9002) per year. 

Covid DataBase: this database final version shows up the year (just 2020) with the category of how the disease turned out (ex: "defunción", "caso grave") and also categorized by the Neighborhood code (ex: 9002)

Population: the final version of this database shows up the 2020's Total Population categorized per Neighborhood's code (ex: 9002).

So, the primary key we used to merge these three databases, as it can be appreciated, is the Neighborhood's code which is constant all along the databases.

Final csv: crime, covid, population


# Load

We use sqalchemy toolkit and postgresql to connect and load the three final databases.

The script coded to create the tables where the data was pushed are the next ones:

<<

DROP TABLE IF EXISTS covid;
DROP TABLE IF EXISTS populatiom;
DROP TABLE IF EXISTS crime;
CREATE TABLE crime(
	year INT NOT NULL,
	cmun INT NOT NULL PRIMARY KEY,
	mun VARCHAR (30),
    total_robs INT NOT NULL
);
CREATE TABLE population(
	cmun INT NOT NULL PRIMARY KEY,
	FOREIGN KEY (cmun) REFERENCES crime(cmun),
	toptop INT NOT NULL,
	year INT NOT NULL,
);
CREATE TABLE covid(
	year INT NOT NULL,
	cventine INT NOT NULL,
	cvemuni INT NOT NULL,
    tipacien VARCHAR (30),
    ecoluci VARCHAR (30),
    id INT NOT NULL,
    cmun INT NOT NULL PRIMARY KEY,
    FOREIGN KEY (cmun) REFERENCES population(cmun)
); 

>>

# Conclusions

Summing up, as we have already said, this new complete database may be used in a future to look for different correlations beteween these three features with different specifiers such as the neighborhood vs population vs crime rate, for example or just the crime rate increasal according to the covid cases. 

We feel sure to ensure this project actually accomplished with our main purpose.

# Group 1
Rafael Davila
Fredy Reyes
Rodrigo Cid
Carlos Alvarez





