#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: commande
#------------------------------------------------------------

CREATE TABLE commande(
        Id_commande     int (11) Auto_increment  NOT NULL ,
        Numero_commande Varchar (25) ,
        Date_commande   Date ,
        prix_commande   DECIMAL (15,3)  ,
        Id_etat         Int ,
        PRIMARY KEY (Id_commande )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: entreprise
#------------------------------------------------------------

CREATE TABLE entreprise(
        Id_entreprise  int (11) Auto_increment  NOT NULL ,
        Nom_entreprise Varchar (25) ,
        Numero_SIRET   Varchar (25) ,
        Id_commande    Int NOT NULL ,
        PRIMARY KEY (Id_entreprise ,Id_commande )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Client
#------------------------------------------------------------

CREATE TABLE Client(
        ID_client     int (11) Auto_increment  NOT NULL ,
        Nom_client    Varchar (25) ,
        Prenom_client Varchar (25) ,
        mail_client   Varchar (25) ,
        Id_commande   Int NOT NULL ,
        PRIMARY KEY (ID_client ,Id_commande )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Statut
#------------------------------------------------------------

CREATE TABLE Statut(
        Id_etat int (11) Auto_increment  NOT NULL ,
        Etat    Varchar (25) ,
        PRIMARY KEY (Id_etat )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Potion
#------------------------------------------------------------

CREATE TABLE Potion(
        Id_Potion    int (11) Auto_increment  NOT NULL ,
        Nom_potion   Varchar (25) ,
        ID_diluant   Int ,
        Id_inventeur Int ,
        PRIMARY KEY (Id_Potion )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Onguent
#------------------------------------------------------------

CREATE TABLE Onguent(
        Id_onguent   int (11) Auto_increment  NOT NULL ,
        Nom_onguent  Varchar (25) ,
        Id_inventeur Int ,
        PRIMARY KEY (Id_onguent )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Ingredient
#------------------------------------------------------------

CREATE TABLE Ingredient(
        Id_ingredient          int (11) Auto_increment  NOT NULL ,
        Nom_ingredient         Varchar (25) ,
        prix_ingredient        DECIMAL (15,3)  ,
        temperature_ingredient Int ,
        Id_fournisseur         Int ,
        ID_fraicheur           Int ,
        PRIMARY KEY (Id_ingredient )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Fournisseur
#------------------------------------------------------------

CREATE TABLE Fournisseur(
        Id_fournisseur   int (11) Auto_increment  NOT NULL ,
        Nom_fournisseur  Varchar (25) ,
        Mail_fournisseur Varchar (25) ,
        PRIMARY KEY (Id_fournisseur )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Fraicheur
#------------------------------------------------------------

CREATE TABLE Fraicheur(
        ID_fraicheur      int (11) Auto_increment  NOT NULL ,
        Entree_fraicheur  Date ,
        Sortie_fraincheur Date ,
        seuil_fraicheur   Int ,
        degree_fraicheur  Int ,
        Id_ingredient     Int ,
        PRIMARY KEY (ID_fraicheur )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Diluant 
#------------------------------------------------------------

CREATE TABLE Diluant(
        ID_diluant  int (11) Auto_increment  NOT NULL ,
        Nom_diluant Varchar (25) ,
        PRIMARY KEY (ID_diluant )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Recipient
#------------------------------------------------------------

CREATE TABLE Recipient(
        Id_recipient   int (11) Auto_increment  NOT NULL ,
        Type_recipient Varchar (25) ,
        prix_recipient DECIMAL (15,3)  ,
        PRIMARY KEY (Id_recipient )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Inventeur
#------------------------------------------------------------

CREATE TABLE Inventeur(
        Id_inventeur     int (11) Auto_increment  NOT NULL ,
        Nom_inventeur    Varchar (25) ,
        Prenom_inventeur Varchar (25) ,
        Id_Utilisateur   Int ,
        PRIMARY KEY (Id_inventeur )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Utilisateur
#------------------------------------------------------------

CREATE TABLE Utilisateur(
        Id_Utilisateur      int (11) Auto_increment  NOT NULL ,
        Nom_Utilisateur     Varchar (25) ,
        Prenom_Utilisateur  Varchar (25) ,
        Adresse_utilisateur Varchar (25) ,
        Mail_Utilisateur    Varchar (25) ,
        Tel_utilisateur     Int ,
        Id_inventeur        Int ,
        PRIMARY KEY (Id_Utilisateur )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Composee
#------------------------------------------------------------

CREATE TABLE Composee(
        Quantite_potion Int ,
        Prix_potion     DECIMAL (15,3)  ,
        Id_Potion       Int NOT NULL ,
        Id_commande     Int NOT NULL ,
        PRIMARY KEY (Id_Potion ,Id_commande )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Compose
#------------------------------------------------------------

CREATE TABLE Compose(
        Prix_onguent     DECIMAL (15,3)  ,
        Quantite_onguent Int ,
        Id_onguent       Int NOT NULL ,
        Id_commande      Int NOT NULL ,
        PRIMARY KEY (Id_onguent ,Id_commande )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: ajoute
#------------------------------------------------------------

CREATE TABLE ajoute(
        quantite_ingredient Int ,
        Id_Potion           Int NOT NULL ,
        Id_onguent          Int NOT NULL ,
        Id_ingredient       Int NOT NULL ,
        PRIMARY KEY (Id_Potion ,Id_onguent ,Id_ingredient )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: remplie
#------------------------------------------------------------

CREATE TABLE remplie(
        Id_recipient Int NOT NULL ,
        Id_Potion    Int NOT NULL ,
        PRIMARY KEY (Id_recipient ,Id_Potion )
)ENGINE=InnoDB;

ALTER TABLE commande ADD CONSTRAINT FK_commande_Id_etat FOREIGN KEY (Id_etat) REFERENCES Statut(Id_etat);
ALTER TABLE entreprise ADD CONSTRAINT FK_entreprise_Id_commande FOREIGN KEY (Id_commande) REFERENCES commande(Id_commande);
ALTER TABLE Client ADD CONSTRAINT FK_Client_Id_commande FOREIGN KEY (Id_commande) REFERENCES commande(Id_commande);
ALTER TABLE Potion ADD CONSTRAINT FK_Potion_ID_diluant FOREIGN KEY (ID_diluant) REFERENCES Diluant(ID_diluant);
ALTER TABLE Potion ADD CONSTRAINT FK_Potion_Id_inventeur FOREIGN KEY (Id_inventeur) REFERENCES Inventeur(Id_inventeur);
ALTER TABLE Onguent ADD CONSTRAINT FK_Onguent_Id_inventeur FOREIGN KEY (Id_inventeur) REFERENCES Inventeur(Id_inventeur);
ALTER TABLE Ingredient ADD CONSTRAINT FK_Ingredient_Id_fournisseur FOREIGN KEY (Id_fournisseur) REFERENCES Fournisseur(Id_fournisseur);
ALTER TABLE Ingredient ADD CONSTRAINT FK_Ingredient_ID_fraicheur FOREIGN KEY (ID_fraicheur) REFERENCES Fraicheur(ID_fraicheur);
ALTER TABLE Fraicheur ADD CONSTRAINT FK_Fraicheur_Id_ingredient FOREIGN KEY (Id_ingredient) REFERENCES Ingredient(Id_ingredient);
ALTER TABLE Inventeur ADD CONSTRAINT FK_Inventeur_Id_Utilisateur FOREIGN KEY (Id_Utilisateur) REFERENCES Utilisateur(Id_Utilisateur);
ALTER TABLE Utilisateur ADD CONSTRAINT FK_Utilisateur_Id_inventeur FOREIGN KEY (Id_inventeur) REFERENCES Inventeur(Id_inventeur);
ALTER TABLE Composee ADD CONSTRAINT FK_Composee_Id_Potion FOREIGN KEY (Id_Potion) REFERENCES Potion(Id_Potion);
ALTER TABLE Composee ADD CONSTRAINT FK_Composee_Id_commande FOREIGN KEY (Id_commande) REFERENCES commande(Id_commande);
ALTER TABLE Compose ADD CONSTRAINT FK_Compose_Id_onguent FOREIGN KEY (Id_onguent) REFERENCES Onguent(Id_onguent);
ALTER TABLE Compose ADD CONSTRAINT FK_Compose_Id_commande FOREIGN KEY (Id_commande) REFERENCES commande(Id_commande);
ALTER TABLE ajoute ADD CONSTRAINT FK_ajoute_Id_Potion FOREIGN KEY (Id_Potion) REFERENCES Potion(Id_Potion);
ALTER TABLE ajoute ADD CONSTRAINT FK_ajoute_Id_onguent FOREIGN KEY (Id_onguent) REFERENCES Onguent(Id_onguent);
ALTER TABLE ajoute ADD CONSTRAINT FK_ajoute_Id_ingredient FOREIGN KEY (Id_ingredient) REFERENCES Ingredient(Id_ingredient);
ALTER TABLE remplie ADD CONSTRAINT FK_remplie_Id_recipient FOREIGN KEY (Id_recipient) REFERENCES Recipient(Id_recipient);
ALTER TABLE remplie ADD CONSTRAINT FK_remplie_Id_Potion FOREIGN KEY (Id_Potion) REFERENCES Potion(Id_Potion);
