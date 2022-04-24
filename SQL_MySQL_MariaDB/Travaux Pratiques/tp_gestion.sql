#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: Clients
#------------------------------------------------------------

CREATE TABLE Clients(
        num_client Int NOT NULL ,
        nom        Varchar (50) NOT NULL ,
        prenom     Varchar (50) NOT NULL ,
        adresse    Varchar (50) NOT NULL ,
        telephone  Int NOT NULL ,
        genre      Char (5) NOT NULL ,
        age        Int NOT NULL
	,CONSTRAINT CHK_age CHECK (age in(18,75)),
        CONSTRAINT CHK_genre CHECK (genre in('M','F')),
        CONSTRAINT Clients_PK PRIMARY KEY (num_client)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Commandes
#------------------------------------------------------------

CREATE TABLE Commandes(
        num_commande    Int NOT NULL ,
        intitule        Varchar (50) NOT NULL ,
        quantite        Float NOT NULL ,
        lieu_livraison  Varchar (50) NOT NULL ,
        date_commande   Date NOT NULL ,
        delai_livraison Int NOT NULL ,
        num_client      Int NOT NULL
	,
        CONSTRAINT CHK_delai_livraison CHECK (delai_livraison < 3),
        CONSTRAINT Commandes_PK PRIMARY KEY (num_commande)
	,CONSTRAINT Commandes_Clients_FK FOREIGN KEY (num_client) REFERENCES Clients(num_client)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Categories
#------------------------------------------------------------

CREATE TABLE Categories(
        num_categorie Int NOT NULL ,
        libelle       Varchar (50) NOT NULL ,
        status        Bool NOT NULL ,
	CONSTRAINT Categories_PK PRIMARY KEY (num_categorie)
)ENGINE=InnoDB;



#------------------------------------------------------------
# Table: Produits
#------------------------------------------------------------

CREATE TABLE Produits(
        num_produit     Int NOT NULL ,
	num_categorie	 Int NOT NULL ,
	num_commande Int NOT NULL ,
        libelle         Varchar (50) NOT NULL ,
        prix_unitaire   Int NOT NULL ,
        date_peremption Date NOT NULL,
	CONSTRAINT Produits_PK PRIMARY KEY (num_produit)
	,CONSTRAINT Composer_Categories_FK FOREIGN KEY (num_categorie) REFERENCES Categories(num_categorie),
	CONSTRAINT Concerner_Commandes_FK FOREIGN KEY (num_commande) REFERENCES Commandes(num_commande)
)ENGINE=InnoDB;

