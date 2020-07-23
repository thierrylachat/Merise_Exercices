#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: properties_types
#------------------------------------------------------------

CREATE TABLE properties_types(
        id   Int  Auto_increment  NOT NULL ,
        description Varchar (50) NOT NULL
	,CONSTRAINT properties_types_PK PRIMARY KEY (id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: clients
#------------------------------------------------------------

CREATE TABLE clients(
        id                  Int  Auto_increment  NOT NULL ,
        firstname           Varchar (50) NOT NULL ,
        lastname            Varchar (50) NOT NULL ,
        birthday            Date NOT NULL ,
        mail                Varchar (50) NOT NULL ,
        budget              DECIMAL (15,3)  NOT NULL ,
        id_properties_types Int NOT NULL
	,CONSTRAINT clients_PK PRIMARY KEY (id)

	,CONSTRAINT clients_properties_types_FK FOREIGN KEY (id_properties_types) REFERENCES properties_types(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: properties
#------------------------------------------------------------

CREATE TABLE properties(
        id                  Int  Auto_increment  NOT NULL ,
        name                Varchar (50) NOT NULL ,
        type                Varchar (50) NOT NULL ,
        postcode            Varchar (50) NOT NULL ,
        price               DECIMAL (15,3)  NOT NULL ,
        id_properties_types Int NOT NULL
	,CONSTRAINT properties_PK PRIMARY KEY (id)

	,CONSTRAINT properties_properties_types_FK FOREIGN KEY (id_properties_types) REFERENCES properties_types(id)
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

	,CONSTRAINT appointments_properties_FK FOREIGN KEY (id_properties) REFERENCES properties(id)
	,CONSTRAINT appointments_clients0_FK FOREIGN KEY (id_clients) REFERENCES clients(id)
)ENGINE=InnoDB;


ALTER TABLE `appointments` 
ADD CONSTRAINT uc_appointment UNIQUE(timeSlot, id_properties);


SELECT app.`timeSlot`, cli.`firstname`, cli.`lastname`, pt.type FROM `appointments` AS app 
JOIN `clients` AS cli ON cli.id = app.`id_clients`
JOIN `properties` AS p ON app.`id_properties` = p.`id`
JOIN `properties_types` AS pt ON pt.id = p.`id_properties_types`;