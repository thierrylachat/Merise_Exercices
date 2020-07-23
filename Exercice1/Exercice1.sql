#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: properties_types
#------------------------------------------------------------

CREATE TABLE properties_types(
        `id`                Int  Auto_increment  NOT NULL ,
        `description`       Varchar (50) NOT NULL
	,CONSTRAINT properties_types_PK PRIMARY KEY (id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: clients
#------------------------------------------------------------

CREATE TABLE clients(
        `id`                  Int  Auto_increment  NOT NULL ,
        `firstname`           Varchar (50) NOT NULL ,
        `lastname`            Varchar (50) NOT NULL ,
        `birthday`           Date NOT NULL ,
        `mail`                Varchar (50) NOT NULL ,
        `budget`             DECIMAL (15,3)  NOT NULL ,
        `id_properties_types` Int NOT NULL
	,CONSTRAINT clients_PK PRIMARY KEY (id)

	,CONSTRAINT FK_clients_id_properties_types FOREIGN KEY (id_properties_types) REFERENCES properties_types(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: properties
#------------------------------------------------------------

CREATE TABLE properties(
        `id`                Int  Auto_increment  NOT NULL ,
        `name`              Varchar (50) NOT NULL ,
        `type`              Varchar (50) NOT NULL ,
        `postcode`          Varchar (50) NOT NULL ,
        `price`             DECIMAL (15,3)  NOT NULL ,
        `id_properties_types` Int NOT NULL
	,CONSTRAINT properties_PK PRIMARY KEY (id)

	,CONSTRAINT FK_properties_id_properties_types FOREIGN KEY (id_properties_types) REFERENCES properties_types(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: appointments
#------------------------------------------------------------

CREATE TABLE appointments(
        id            Int  Auto_increment  NOT NULL ,
        timeSlot      Datetime NOT NULL ,
        id_properties Int NOT NULL ,
        id_clients    Int NOT NULL
	,CONSTRAINT appointments_PK PRIMARY KEY (id)

	,CONSTRAINT FK_appointments_id_properties FOREIGN KEY (id_properties) REFERENCES properties(id)
	,CONSTRAINT FK_appointments_id_clients FOREIGN KEY (id_clients) REFERENCES clients(id)
)ENGINE=InnoDB;


/* Ajout d'une contrainte pour que le même bien ne puisse être visité sur le même créneau horaire.*/

ALTER TABLE `appointments` 
ADD CONSTRAINT uc_appointment UNIQUE(timeSlot, id_properties);


/* Affichage du créneau horaire, date, nom  & prénom du client ainsi que le type de propriété. */

SELECT app.`timeSlot`, cli.`firstname`, cli.`lastname`, pt.`description` 
FROM `appointments` AS app 
JOIN `clients` AS cli ON app.`id_clients` = cli.`id`
JOIN `properties` AS p ON app.`id_properties` = p.`id`
JOIN `properties_types` AS pt ON  p.`id_properties_types` = pt.`id`;