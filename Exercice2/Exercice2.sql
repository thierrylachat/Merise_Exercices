#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: styles
#------------------------------------------------------------

CREATE TABLE styles(
        `style_id`    Int  Auto_increment  NOT NULL ,
        `style_style` Varchar (12) NOT NULL
	,CONSTRAINT PK_styles_style_id PRIMARY KEY (`style_id`)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: customers
#------------------------------------------------------------

CREATE TABLE customers(
        `cust_id`        Int  Auto_increment  NOT NULL ,
        `cust_firstname` Varchar (50) NOT NULL ,
        `cust_lastname`  Varchar (50) NOT NULL ,
        `cust_birthday`  Date NOT NULL ,
        `cust_phone`     Varchar (20) NOT NULL ,
        `cust_mail`      Varchar (50) NOT NULL ,
        `style_id`       Int NOT NULL
	,CONSTRAINT PK_customers_cust_id PRIMARY KEY (`cust_id`)

	,CONSTRAINT FK_customers_style_id FOREIGN KEY (`style_id`) REFERENCES styles(`style_id`)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: authors
#------------------------------------------------------------

CREATE TABLE authors(
        `auth_id`        Int  Auto_increment  NOT NULL ,
        `auth_lastname`  Varchar (50) NOT NULL ,
        `auth_firstname` Varchar (50) NOT NULL
	,CONSTRAINT PK_authors_auth_id PRIMARY KEY (`auth_id`)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: books
#------------------------------------------------------------

CREATE TABLE books(
        `boo_id`          Int  Auto_increment  NOT NULL ,
        `boo_title`       Varchar (50) NOT NULL ,
        `boo_publishDate` Date NOT NULL ,
        `style_id`        Int NOT NULL ,
        `auth_id`         Int NOT NULL
	,CONSTRAINT PK_books_boo_id PRIMARY KEY (`boo_id`)

	,CONSTRAINT FK_books_style_id FOREIGN KEY (`style_id`) REFERENCES styles(`style_id`)
	,CONSTRAINT FK_books_auth_id FOREIGN KEY (`auth_id`) REFERENCES authors(`auth_id`)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: register
#------------------------------------------------------------

CREATE TABLE register(
        `boo_id`         Int NOT NULL ,
        `cust_id`        Int NOT NULL ,
        `reg_startdate`  Date NOT NULL ,
        `reg_returndate` Date NOT NULL
	,CONSTRAINT PK_register_boo_id_cust_id PRIMARY KEY (`boo_id`,`cust_id`)

	,CONSTRAINT FK_register_boo_id FOREIGN KEY (`boo_id`) REFERENCES books(`boo_id`)
	,CONSTRAINT FK_register_cust_id FOREIGN KEY (`cust_id`) REFERENCES customers(`cust_id`)
)ENGINE=InnoDB;


/* Création d'enregistrement pour les auteurs */
INSERT INTO `authors` (`auth_lastname`,`auth_firstname`) VALUES ("Cotton","Claire"),("Walton","Gay"),("Burch","Kasper"),("Frederick","Sharon"),("Montgomery","Brent"),("Fletcher","Winifred"),("Buck","Joseph"),("Mccall","Hayden"),("Kennedy","Justine"),("Estrada","Cairo");
INSERT INTO `authors` (`auth_firstname`,`auth_firstname`) VALUES ("Justice","Branden"),("Cortez","Jordan"),("Kemp","Dale"),("Mckenzie","Teegan"),("Ramsey","Leah"),("Mosley","Cedric"),("Ashley","Rosalyn"),("Pratt","Herrod"),("Marshall","Dante"),("Oneal","Lani");

/* Création de livres */
INSERT INTO `books` (`boo_title`,`boo_publishDate`,`auth_id`,`style_id`) VALUES ("ultrices. Vivamus rhoncus. Donec est.","2005-10-26",10,4),("purus, accumsan","2011-02-20",13,1),("pede sagittis augue, eu tempor","2003-01-22",6,3),("congue, elit sed","2006-07-10",13,1),("a, magna. Lorem ipsum","2000-09-08",11,1),("dis parturient montes,","2002-07-14",10,2),("a, auctor","2002-09-02",15,1),("amet massa. Quisque porttitor eros","2006-12-14",13,4),("facilisis, magna tellus faucibus","2007-10-24",9,1),("in, hendrerit consectetuer, cursus","2012-11-09",9,3);
INSERT INTO `books` (`boo_title`,`boo_publishDate`,`auth_id`,`style_id`) VALUES ("gravida.","2007-04-16",7,1),("tincidunt","2015-12-27",16,2),("semper rutrum. Fusce dolor quam,","2010-02-28",13,1),("magna nec","2019-01-03",6,1),("orci lacus vestibulum","2021-02-09",15,2),("Quisque","2008-01-22",10,3),("urna suscipit nonummy. Fusce fermentum","2012-07-26",12,2),("nunc.","2021-04-21",13,3),("purus ac tellus. Suspendisse sed","2012-09-03",6,2),("Nullam enim. Sed nulla ante,","2009-04-18",1,4);
INSERT INTO `books` (`boo_title`,`boo_publishDate`,`auth_id`,`style_id`) VALUES ("Donec","2009-03-02",3,1),("lorem lorem, luctus ut,","2004-08-23",20,2),("ullamcorper viverra. Maecenas","2019-05-09",20,3),("ultricies sem magna nec","2007-07-07",16,2),("Nam consequat dolor vitae dolor.","2012-07-03",15,3),("fermentum arcu.","2001-09-19",17,4),("Morbi","2003-04-27",8,4),("Vivamus non lorem vitae","2008-11-05",15,2),("urna. Vivamus","2006-05-02",2,1),("neque non quam. Pellentesque","2009-03-07",11,2);
INSERT INTO `books` (`boo_title`,`boo_publishDate`,`auth_id`,`style_id`) VALUES ("dui, semper et, lacinia","2006-06-02",2,3),("risus a ultricies adipiscing, enim","2004-02-06",2,2),("Vestibulum ante ipsum","2008-01-18",14,3),("mattis semper, dui lectus rutrum","2020-08-16",5,2),("in aliquet lobortis,","2008-07-19",7,3),("est arcu ac orci.","2015-06-15",12,3),("tortor. Integer aliquam adipiscing","2015-07-06",18,1),("fringilla. Donec","2006-01-08",2,1),("venenatis","2014-06-28",2,4),("dignissim","2013-04-10",3,3);

/* Création de clients */
INSERT INTO `customers` (`cust_lastname`,`cust_firstname`,`cust_birthday`,`cust_phone`,`cust_mail`,`style_id`) VALUES ("Quinn","Felix","2012-10-30","01 96 40 08 83","eu@ipsumSuspendissenon.co.uk",3),("Shepherd","Laura","2004-02-04","03 32 56 04 05","nisi@euismod.ca",2),("Jacobson","Eden","2012-03-20","04 75 78 63 15","magna.Nam@enimEtiamgravida.org",4),("Tran","Yen","1976-08-16","01 80 79 78 57","lorem.luctus@iaculis.ca",2),("Russo","Nicholas","1982-10-20","07 09 01 57 87","a@quamafelis.net",2),("Pollard","Ishmael","1996-04-21","03 16 69 12 41","Etiam.vestibulum.massa@necanteblandit.ca",3),("Martinez","Hammett","1988-05-31","09 46 66 85 59","neque.tellus.imperdiet@tellusSuspendisse.co.uk",1),("Kelley","Fatima","1999-11-13","07 47 76 37 02","Donec@metus.edu",1),("Moreno","Meghan","1967-08-03","04 01 77 03 75","turpis@convallisante.co.uk",1),("Henderson","Ray","1960-06-27","09 95 93 32 98","ipsum@atnisi.co.uk",3);
INSERT INTO `customers` (`cust_lastname`,`cust_firstname`,`cust_birthday`,`cust_phone`,`cust_mail`,`style_id`) VALUES ("Guzman","Barrett","1966-09-03","02 55 88 99 78","Duis@temporerat.com",3),("Perkins","MacKenzie","1987-09-27","09 26 17 66 33","ullamcorper.viverra@ipsumnunc.ca",2),("Gutierrez","Nola","1953-12-06","07 08 03 73 62","adipiscing.elit.Etiam@ametluctus.edu",3),("Hendrix","Beck","1977-08-12","01 69 59 90 91","erat.neque@ac.net",4),("Keller","Nicole","1993-05-30","09 11 57 99 04","fringilla@portaelita.ca",3),("Bright","Sierra","1996-11-19","06 65 87 35 97","arcu@nonloremvitae.co.uk",4),("Payne","Anastasia","1956-01-31","06 81 74 47 70","egestas@metuseuerat.net",4),("Rice","Rhoda","1998-05-09","03 73 36 07 45","Maecenas.libero@Aliquamtinciduntnunc.edu",4),("Rios","Alea","1950-08-16","09 48 79 16 84","Sed.molestie@tellus.ca",1),("Brown","Merritt","1969-12-20","02 77 74 03 65","odio.Aliquam.vulputate@mattis.org",2);
INSERT INTO `customers` (`cust_lastname`,`cust_firstname`,`cust_birthday`,`cust_phone`,`cust_mail`,`style_id`) VALUES ("Goodwin","Britanney","1971-03-07","01 04 48 23 14","euismod.et@nondui.org",3),("Cummings","Kirk","1991-06-29","05 07 57 62 80","ipsum.dolor.sit@nec.edu",3),("Griffith","Honorato","1978-11-25","08 70 70 06 34","litora.torquent@id.edu",3),("Kramer","Holmes","1993-07-10","05 90 84 94 42","erat.neque.non@lacusAliquamrutrum.co.uk",1),("Snyder","Megan","2001-09-24","07 81 02 98 47","tempor@nunc.ca",2),("Mckee","Zachery","1951-02-24","08 80 17 18 14","nec.ligula@tellusjustosit.org",4),("Finley","Ashely","1953-03-16","01 95 68 36 80","Vivamus.euismod@variuseteuismod.com",3),("Snow","Mohammad","2005-06-01","01 54 85 71 64","Etiam.laoreet.libero@idanteNunc.com",1),("Dodson","Gage","1988-09-05","09 55 56 75 31","interdum.Sed@nullaCras.net",1),("Cotton","Keiko","1971-07-25","09 46 99 96 50","arcu.Vivamus.sit@ullamcorpervelitin.net",4);

/* Affichage des lignes du registre (titre, nom et prénom du client, date d'emprunt et de retour du livre).
Tables : books, customers, register.*/

SELECT b.`boo_title`, c.`cust_firstname`, c.`cust_lastname`, r.`reg_startdate`, r.`reg_returndate` FROM `register` r
JOIN `customers` c USING (`cust_id`)
JOIN `books` b USING (`boo_id`);

/* Affichage de la liste de tous les livres (titre, genre, nom et prénom de l'auteur, disponibilité). 
Cardinalité 1,1, 1,n => INNER JOIN 
Cardinalité 0,n => LEFT JOIN sauf si table de relations => INNER JOIN. */

SELECT  b.`boo_title`, s.`style_style`, a.`auth_lastname`, a.`auth_firstname`, r.`reg_startdate` FROM `books` b
JOIN `styles` s ON s.`style_id` = b.`style_id`
JOIN `authors` a ON a.`auth_id` = b.`auth_id`
LEFT JOIN `register` r ON r. `boo_id` = b.`boo_id`;

/* Affichage du nombre total de livres par genre (nom du genre, total de livres correspondants). */

SELECT `style_style` AS `Genre`, COUNT(`boo_id`) AS `Nombre de livres` FROM `styles` s
JOIN `books` b USING(`style_id`)
GROUP BY `style_id`;