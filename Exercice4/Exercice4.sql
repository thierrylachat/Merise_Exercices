#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: `subjects`
#------------------------------------------------------------

CREATE TABLE `subjects`(
        `s_id`      Int  Auto_increment  NOT NULL ,
        `s_subject` Varchar (50) NOT NULL
	,CONSTRAINT PK_subjects PRIMARY KEY (`s_id`)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: `teachers`
#------------------------------------------------------------

CREATE TABLE `teachers`(
        `t_id`        Int  Auto_increment  NOT NULL ,
        `t_firstname` Varchar (50) NOT NULL ,
        `t_lastname`  Varchar (50) NOT NULL ,
        `t_mail`      Varchar (255) NOT NULL ,
        `s_id`        Int NOT NULL
	,CONSTRAINT PK_teachers PRIMARY KEY (`t_id`)

	,CONSTRAINT FK_teachers_subjects FOREIGN KEY (`s_id`) REFERENCES subjects(`s_id`)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: `grades`
#------------------------------------------------------------

CREATE TABLE `grades`(
        `g_id`  Int  Auto_increment  NOT NULL ,
        `g_name` Varchar (50) NOT NULL ,
        `t_id`   Int NOT NULL
	,CONSTRAINT PK_grades PRIMARY KEY (`g_id`)

	,CONSTRAINT FK_grades_teachers FOREIGN KEY (`t_id`) REFERENCES teachers(`t_id`)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: `pupils`
#------------------------------------------------------------

CREATE TABLE `pupils`(
        `p_id`        Int  Auto_increment  NOT NULL ,
        `p_firstname` Varchar (50) NOT NULL ,
        `p_lastname`  Varchar (50) NOT NULL ,
        `g_id`        Int NOT NULL
	,CONSTRAINT PK_pupils PRIMARY KEY (`p_id`)

	,CONSTRAINT FK_pupils_grades FOREIGN KEY (`g_id`) REFERENCES grades(`g_id`)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: `rates`
#------------------------------------------------------------

CREATE TABLE `rates`(
        `r_id`        Int  Auto_increment  NOT NULL ,
        `s_id`    Int NOT NULL ,
        `p_id`    Int NOT NULL ,
        `n_value` Float NOT NULL
	,CONSTRAINT PK_rates PRIMARY KEY (`r_id`)

	,CONSTRAINT FK_rates_subjects FOREIGN KEY (`s_id`) REFERENCES subjects(`s_id`)
	,CONSTRAINT FK_rates_pupils FOREIGN KEY (`p_id`) REFERENCES pupils(`p_id`)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: `teaches`
#------------------------------------------------------------

CREATE TABLE `teaches`(
        `p_id`    Int NOT NULL ,
        `t_id`    Int NOT NULL
	,CONSTRAINT PK_teaches PRIMARY KEY (`p_id`, `t_id`)

	,CONSTRAINT FK_teaches_teachers FOREIGN KEY (`t_id`) REFERENCES teachers(`t_id`)
	,CONSTRAINT FK_teaches_pupils FOREIGN KEY (`p_id`) REFERENCES pupils(`p_id`)
)ENGINE=InnoDB;


/* Création des enregistrements de la table subjects. */
INSERT INTO `subjects` (`s_id`, `s_subject`) VALUES
(1, 'Maths'),
(2, 'Sport'),
(3, 'Français'),
(4, 'Anglais'),
(5, 'Histoire'),
(6, 'Géographie');

/* Création des enregistrements de la table teachers. */
INSERT INTO `teachers` (`t_id`, `t_firstname`, `t_lastname`, `t_mail`, `s_id`) VALUES
(1, 'mat', 'ématique', 'mat.ématique@gmail.com', 1),
(2, 'françoise', 'france', 'fr.fr@gmail.com', 3),
(3, 'jean', 'neymar', 'jean.neymar@gmail.com', 2),
(4, 'louise', 'galle', 'louise.galle@gmail.com', 4),
(5, 'christophe', 'colomb', 'chris.colomb@gmail.com', 5),
(6, 'christophe', 'colomb', 'chris.colomb@gmail.com', 6);

/* Création des enregistrements de la table grades. */
INSERT INTO `grades` (`g_id`, `g_name`, `t_id`) VALUES
(1, 'CP', 5),
(2, 'CE1', 2),
(3, 'CE2', 1),
(4, 'CM1', 3),
(5, 'CM2', 4);

/* Création des enregistrements de la table pupils. */
INSERT INTO `pupils` (`p_id`, `p_firstname`, `p_lastname`, `g_id`) VALUES
(1, 'Alfonso', 'Stephenson', 2),
(2, 'Jemima', 'Calderon', 1),
(3, 'Nolan', 'Pate', 5),
(4, 'Kitra', 'Walters', 1),
(5, 'Kaden', 'Daugherty', 3),
(6, 'Raja', 'House', 2),
(7, 'Noelani', 'Lancaster', 2),
(8, 'Kasimir', 'Matthews', 5),
(9, 'Aimee', 'Martinez', 4),
(10, 'Sarah', 'Tillman', 4),
(11, 'Britanni', 'Cardenas', 4),
(12, 'Wesley', 'Vasquez', 5),
(13, 'Nathaniel', 'Jordan', 2),
(14, 'Edward', 'Monroe', 5),
(15, 'Lester', 'Workman', 2),
(16, 'Donovan', 'Matthews', 5),
(17, 'Branden', 'Holmes', 5),
(18, 'Alexis', 'Rodriquez', 3),
(19, 'Larissa', 'Figueroa', 2),
(20, 'Stella', 'Wilder', 2),
(21, 'Dale', 'Warner', 3),
(22, 'Cassidy', 'Beard', 5),
(23, 'Erich', 'Pena', 1),
(24, 'Chadwick', 'Phelps', 3),
(25, 'Aurelia', 'Patrick', 4),
(26, 'Harper', 'Henson', 3),
(27, 'Irene', 'Atkinson', 5),
(28, 'Joseph', 'Atkinson', 3),
(29, 'Valentine', 'Schultz', 3),
(30, 'Reece', 'Roth', 2);

/* Création des enregistrements de la table rates. */
INSERT INTO `rates` (`s_id`, `p_id`, `n_value`) VALUES
(1, 14, 9),
(1, 28, 20),
(1, 29, 3),
(2, 6, 1),
(2, 9, 3),
(2, 28, 17),
(2, 30, 19),
(3, 1, 3),
(3, 7, 9),
(3, 8, 9),
(3, 19, 20),
(4, 4, 4),
(4, 20, 3),
(4, 22, 3),
(4, 27, 19),
(5, 22, 6),
(5, 27, 0),
(6, 2, 7),
(6, 4, 15),
(6, 21, 8);

/* Création des enregistrements de la table teaches. */
INSERT INTO `teaches` (`p_id`, `t_id`) VALUES
(1, 2),
(2, 1),
(3, 5),
(4, 1),
(5, 3),
(6, 2),
(7, 6),
(8, 5),
(9, 4),
(10, 4),
(11, 4),
(12, 5),
(13, 2),
(14, 5),
(15, 2),
(16, 5),
(17, 6),
(18, 3),
(19, 2),
(20, 2),
(21, 3),
(22, 5),
(23, 1),
(24, 3),
(25, 6),
(26, 3),
(27, 5),
(28, 3),
(29, 3),
(30, 2);


/* Affichage de toutes les notes des élèves (nom et prénom de l'élève, la note et la matière). */
SELECT 
p.`p_lastname` AS "Nom de l'élève", 
p.`p_firstname` AS "Prénom de l'élève",
r.`n_value` AS "Note",
s.`s_subject` AS "Matière"
FROM `rates` r
JOIN `pupils` p USING(`p_id`)
JOIN `subjects` s USING(`s_id`);


/* Affichage de la moyenne générale de chaque élève (nom et prénom de l'élève, la classe de l'élève, le nom du professeur principal, la moyenne) */
SELECT 
p.`p_lastname` AS "Nom de l'élève", 
p.`p_firstname` AS "Prénom de l'élève",
g.`g_name` AS "Classe",
t.`t_lastname` AS "Nom du professeur principal",
AVG(r.`n_value`) AS "Moyenne générale"
FROM `rates` r
JOIN `pupils` p USING(`p_id`)
JOIN `grades` g USING(`g_id`)
JOIN `teachers` t USING(`t_id`)
GROUP BY(`p_id`);

/* Affichage de tous les élèves d'un professeur (nom et prénom du professeur, la classe du professeur, nom et prénom de l'élève). */
SELECT
t.`t_lastname` AS "Nom du professeur",
t.`t_firstname` AS "Prénom du professeur",
g.`g_name` AS "Classe",
p.`p_lastname` AS "Nom de l'élève", 
p.`p_firstname` AS "Prénom de l'élève"
FROM `teachers` t
JOIN `grades` g USING(`t_id`)
JOIN `pupils` p USING(`g_id`);
-- ORDER BY 2,1 ASC; permet d'afficher la deuxième puis la première colonne du SELECT par ordre alphabétique ici.