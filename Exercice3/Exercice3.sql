#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: `specialities`
#------------------------------------------------------------

CREATE TABLE `specialities`(
        `id_specialities`          Int  Auto_increment  NOT NULL ,
        `description_specialities` Varchar (50) NOT NULL
	,CONSTRAINT PK_specialities PRIMARY KEY (`id_specialities`)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: `doctors`
#------------------------------------------------------------

CREATE TABLE `doctors`(
        `id_doctors`        Int  Auto_increment  NOT NULL ,
        `lastname_doctors`  Varchar (50) NOT NULL ,
        `firstname_doctors` Varchar (50) NOT NULL ,
        `mails_doctors`     Varchar (50) NOT NULL ,
        `id_specialities`   Int NOT NULL
	,CONSTRAINT PK_doctors PRIMARY KEY (`id_doctors`)

	,CONSTRAINT FK_doctors_id_specialities FOREIGN KEY (`id_specialities`) REFERENCES specialities(`id_specialities`)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: `patients`
#------------------------------------------------------------

CREATE TABLE `patients`(
        `id_patients`        Int  Auto_increment  NOT NULL ,
        `lastname_patients`  Varchar (50) NOT NULL ,
        `firstname_patients` Varchar (50) NOT NULL ,
        `birthday_patients`  Date NOT NULL ,
        `id_doctors`         Int NOT NULL
	,CONSTRAINT PK_patients PRIMARY KEY (`id_patients`)

	,CONSTRAINT FK_patients_id_doctors FOREIGN KEY (`id_doctors`) REFERENCES doctors(`id_doctors`)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: `appointments`
#------------------------------------------------------------

CREATE TABLE `appointments`(
        `id_appointments` Int Auto_increment  NOT NULL ,
        `id_patients` Int NOT NULL ,
        `id_doctors`  Int NOT NULL ,
        `timeSlot`    Datetime NOT NULL
	,CONSTRAINT PK_appointments PRIMARY KEY (`id_appointments`)

	,CONSTRAINT FK_appointments_id_patients FOREIGN KEY (`id_patients`) REFERENCES patients(`id_patients`)
	,CONSTRAINT FK_appointments_id_doctors FOREIGN KEY (`id_doctors`) REFERENCES doctors(`id_doctors`)
)ENGINE=InnoDB;


/* Création des enregistrements de la table doctors. */
INSERT INTO `doctors` (`firstname_doctors`,`lastname_doctors`,`mails_doctors`,`id_specialities`) 
VALUES 
("Craig","Mueller","ornare.tortor.at@commodo.org",1)
,("Buckminster","Contreras","non.enim@turpisegestas.org",2)
,("Halla","Holmes","ante.bibendum.ullamcorper@biben.edu",3)
,("Chancellor","Robertson","blandit@nullaDonec.org",3)
,("Irma","Sandoval","Proin@sed.org",1);

/* Création des enregistrements de la table patients. */
INSERT INTO `patients` (`lastname_patients`,`firstname_patients`,`birthday_patients`,`id_doctors`)
VALUES 
("Dorsey","Trevor","2010-08-02 11:17:33","6")
,("Holland","Murphy","2019-08-07 01:40:40","10")
,("Blanchard","Jonah","1974-05-28 07:01:59","6")
,("Hayes","TaShya","1944-11-09 02:19:54","10")
,("Daniel","Noble","1981-04-29 07:25:55","6")
,("Daugherty","Dalton","2009-11-06 12:49:09","10")
,("Stafford","Octavius","1977-03-23 06:22:40","6")
,("Knight","Carl","2010-01-04 21:46:42","10")
,("Conrad","Samson","2000-05-13 09:20:37","6")
,("Mcfarland","Rhonda","1958-07-14 14:07:05","10");

/* Création des enregistrements de la table appointments. */
INSERT INTO `appointments` (`timeSlot`,`id_patients`,`id_doctors`) VALUES ("2021-06-14 01:12",8,7),("2020-08-21 12:34",3,7),("2020-11-01 06:13",9,9),("2021-07-07 09:13",1,9),("2020-09-22 02:56",3,6),("2020-11-01 00:55",8,9),("2021-05-05 16:36",10,9),("2020-11-13 01:01",6,7),("2021-06-16 01:13",9,10),("2021-05-19 15:11",6,7);
INSERT INTO `appointments` (`timeSlot`,`id_patients`,`id_doctors`) VALUES ("2021-05-15 20:00",3,6),("2020-08-15 05:37",3,8),("2020-09-17 09:52",5,9),("2021-06-05 23:37",2,6),("2021-01-08 04:36",2,6),("2021-02-10 04:06",6,10),("2020-09-15 07:49",7,8),("2020-07-29 13:04",5,9),("2021-02-08 19:26",9,7),("2020-08-03 10:22",8,10);
INSERT INTO `appointments` (`timeSlot`,`id_patients`,`id_doctors`) VALUES ("2020-08-02 23:51",4,9),("2020-08-02 05:25",7,9),("2021-06-14 23:36",6,6),("2020-12-26 13:41",10,7),("2021-02-15 22:32",4,9),("2021-06-19 20:32",8,6),("2021-05-01 20:40",7,6),("2021-05-11 10:41",4,8),("2020-09-12 13:00",2,8),("2020-11-03 14:41",7,6);

/* Affichage de tous les rendez-vous du cabinet médical (date et créneau horaire du rendez-vous, nom et prénom du patient, nom et spécialité du médecin). */

SELECT 
a.`timeSlot` AS 'RDV', 
p.`lastname_patients` AS 'Nom du patient', 
p.`firstname_patients` AS 'Prénom du patient', 
d.`lastname_doctors` AS `Nom du docteur`, 
s.`description_specialities` AS 'Spécialité'
FROM `appointments` a
JOIN `patients` p ON p.`id_patients`= a.`id_patients`
JOIN `doctors` d ON d.`id_doctors` = a.`id_doctors`
JOIN `specialities` s ON s.`id_specialities` = d.`id_specialities`;

/* Affichage de tous les rendez-vous d'un médecin (nom du médecin, date et créneau horaire du rendez-vous, nom et prénom du patient). */

SELECT 
d.`lastname_doctors` AS `Nom du docteur`, 
DATE_FORMAT(timeSlot, "%e/%m/%Y %H:%i") AS 'Date et heure du RDV', 
p.`lastname_patients` AS 'Nom du patient', 
p.`firstname_patients` AS 'Prénom du patient' 
FROM `appointments` a
JOIN `doctors` d USING(`id_doctors`)
JOIN `patients` p USING(`id_patients`)
WHERE d.`id_doctors` = 10;

/* Affichage du rendez-vous d'un patient (nom et prénom du patient, spécialité du médecin, nom et prénom du médecin, date et créneau horaire du rendez-vous). */

SELECT
p.`lastname_patients` AS 'Nom du patient', 
p.`firstname_patients` AS 'Prénom du patient',
s.`description_specialities` AS 'Spécialité',
d.`lastname_doctors` AS `Nom du docteur`, 
d.`firstname_doctors` AS `Prénom du docteur`,
DATE_FORMAT(timeSlot, "%e/%m/%Y %H:%i") AS 'Date et heure du RDV' 
FROM `appointments` a
JOIN `doctors` d USING(`id_doctors`)
JOIN `patients` p USING(`id_patients`)
JOIN `specialities` s ON s.`id_specialities` = d.`id_specialities`
WHERE p.`id_patients` = 10;