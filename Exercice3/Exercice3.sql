#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: specialties
#------------------------------------------------------------

CREATE TABLE `specialties`(
        `spe_id`   Int  Auto_increment  NOT NULL ,
        `spe_type` Varchar (50) NOT NULL
	,PRIMARY KEY (`spe_id`)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: doctors
#------------------------------------------------------------

CREATE TABLE `doctors`(
        `doc_id`        Int  Auto_increment  NOT NULL ,
        `doc_firstname` Varchar (50) NOT NULL ,
        `doc_lastname`  Varchar (50) NOT NULL ,
        `doc_mail`      Varchar (50) NOT NULL ,
        `spe_id`        Int NOT NULL
	,PRIMARY KEY (`doc_id`)

	,CONSTRAINT FK_doctors_spe_id FOREIGN KEY (`spe_id`) REFERENCES `specialties`(`spe_id`)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: `patients`
#------------------------------------------------------------

CREATE TABLE `patients`(
        `p_id`        Int  Auto_increment  NOT NULL ,
        `p_firstname` Varchar (50) NOT NULL ,
        `p_lastname`  Varchar (50) NOT NULL ,
        `p_birthdate` Date NOT NULL ,
        `p_doctor`    Varchar (50) NOT NULL
	,PRIMARY KEY (`p_id`)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: `appointments`
#------------------------------------------------------------

CREATE TABLE `appointments`(
        `app_id`   Int  Auto_increment  NOT NULL ,
        `app_date` Datetime NOT NULL ,
        `p_id`     Int NOT NULL ,
        `doc_id`   Int NOT NULL
	,PRIMARY KEY (`app_id`)

	,CONSTRAINT FK_appointments_p_id FOREIGN KEY (`p_id`) REFERENCES patients(`p_id`)
	,CONSTRAINT FK_appointments_doc_id FOREIGN KEY (`doc_id`) REFERENCES doctors(`doc_id`)
)ENGINE=InnoDB;

