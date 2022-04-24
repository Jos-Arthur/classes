CREATE TABLE type_client (num_type integer,description varchar(30) NOT NULL, constraint pk_type_client primary key(num_type));
CREATE TABLE clients (num_client integer, nom varchar(25),prenom varchar(45), date_naissance date, profession varchar(100),num_type integer, constraint fk_type_client_client FOREIGN KEY(num_type) REFERENCES type_client(num_type), constraint pk_client PRIMARY Key(num_client));

INSERT INTO type_client VALUES (1001,"GROSSISTE");
INSERT INTO type_client VALUES (1002,"FOURNISSEUR");
INSERT INTO type_client VALUES (1003,"DETAILLANT");
INSERT INTO clients VALUES(20,"KABORE","Adama",'2000-08-22',"Ingenieur Genie",1001);
INSERT INTO clients VALUES(21,"SANOU","Adele",'2000-08-22',"Commerçant",1001);
INSERT INTO clients VALUES(22,"TAPSOBA","Eric",'2000-08-22',"Commerçant",1002);





