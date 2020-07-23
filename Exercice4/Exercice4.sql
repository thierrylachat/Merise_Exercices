#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: subjects
#------------------------------------------------------------

CREATE TABLE `subjects`(
        `s_id`      Int  Auto_increment  NOT NULL ,
        `s_subject` Varchar (50) NOT NULL
	,PRIMARY KEY (`s_id`)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: teachers
#------------------------------------------------------------

CREATE TABLE `teachers`(
        `t_id`        Int  Auto_increment  NOT NULL ,
        `t_firstname` Varchar (50) NOT NULL ,
        `t_lastname`  Varchar (50) NOT NULL ,
        `t_mail`      Varchar (255) NOT NULL ,
        `s_id`        Int NOT NULL
	,PRIMARY KEY (`t_id`)

	,CONSTRAINT FK_teachers_s_id FOREIGN KEY (`s_id`) REFERENCES subjects(`s_id`)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: grades
#------------------------------------------------------------

CREATE TABLE `grades`(
        `g_id`   Int  Auto_increment  NOT NULL ,
        `g_name` Varchar (50) NOT NULL ,
        `t_id`   Int NOT NULL
	,PRIMARY KEY (`g_id`)

	,CONSTRAINT FK_grades_t_id FOREIGN KEY (`t_id`) REFERENCES teachers(`t_id`)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: pupils
#------------------------------------------------------------

CREATE TABLE `pupils`(
        `p_id`        Int  Auto_increment  NOT NULL ,
        `p_firstname` Varchar (50) NOT NULL ,
        `p_lastname`  Varchar (50) NOT NULL ,
        `g_id`        Int NOT NULL
	,PRIMARY KEY (`p_id`)

	,CONSTRAINT FK_pupils_g_id FOREIGN KEY (`g_id`) REFERENCES grades(`g_id`)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: rates
#------------------------------------------------------------

CREATE TABLE rates(
        `s_id`    Int NOT NULL ,
        `p_id`    Int NOT NULL ,
        `n_value` Float NOT NULL
	,PRIMARY KEY (`s_id`,`p_id`)

	,CONSTRAINT FK_rates_s_id FOREIGN KEY (`s_id`) REFERENCES `subjects`(`s_id`)
	,CONSTRAINT FK_rates_p_id FOREIGN KEY (`p_id`) REFERENCES `pupils`(`p_id`)
)ENGINE=InnoDB;

