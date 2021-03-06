#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: Statut
#------------------------------------------------------------

CREATE TABLE Statut(
        Id_etat int (11) Auto_increment  NOT NULL ,
        Etat    Varchar (25) ,
        PRIMARY KEY (Id_etat )
)ENGINE=InnoDB;

INSERT INTO Statut(`Etat`) VALUES 
('en attente'), ('valide');
#------------------------------------------------------------
# Table: Entreprise
#------------------------------------------------------------

CREATE TABLE Entreprise(
        Id_entreprise int (11) Auto_increment  NOT NULL ,
        Numero_SIRET  Varchar (25) ,
        ID_client     Int NOT NULL ,
        PRIMARY KEY (Id_entreprise ,ID_client )
)ENGINE=InnoDB;

INSERT INTO Entreprise(`ID_client`,`Numero_SIRET`) VALUES 
('1','12368904575123'),
('2','98321789101112');

#------------------------------------------------------------
# Table: Particulier
#------------------------------------------------------------

CREATE TABLE Particulier(
        Id_particulier int (11) Auto_increment  NOT NULL ,
        mail_part      Varchar (25) ,
        ID_client      Int NOT NULL ,
        PRIMARY KEY (Id_particulier ,ID_client )
)ENGINE=InnoDB;

INSERT INTO Particulier(`ID_client`,`mail_part`) VALUES 
('3','remy.vancamp@viacesi.fr'),
('4','maxence.arnol@viacesi.fr'),
('5','thibault.poly@viacesi.fr'),
('6','charles.leleux@viacesi.fr');

#------------------------------------------------------------
# Table: Client
#------------------------------------------------------------

CREATE TABLE Client(
        ID_client int (11) Auto_increment  NOT NULL ,
        nom       Varchar (25) ,
        PRIMARY KEY (ID_client )
)ENGINE=InnoDB;

INSERT INTO Client(`ID_client`,`nom`) VALUES 
('1','PoudlarIndustry'),
('2','TeamRocketIndustry'),
('3','vancamp'),
('4','arnol'),
('5','poly'),
('6','leleux');

#------------------------------------------------------------
# Table: Commande 
#------------------------------------------------------------

CREATE TABLE Commande(
        ID_commande     int (11) Auto_increment  NOT NULL ,
        Numero_commande Varchar (25) ,
        date_commande   Date ,
        prix_commande   DECIMAL (15,3)  ,
        Id_etat         Int ,
        PRIMARY KEY (ID_commande )
)ENGINE=InnoDB;


INSERT INTO Commande(`Numero_commande`,`Date_commande`,`prix_commande`,`Id_etat`) VALUES 
('1','2017/03/31', '2400', '1'),
('2','2017/04/02', '1700', '2');
#------------------------------------------------------------
# Table: Proposition
#------------------------------------------------------------

CREATE TABLE Proposition(
        ID_proposition int (11) Auto_increment  NOT NULL ,
        statut         Bool ,
        PRIMARY KEY (ID_proposition )
)ENGINE=InnoDB;

INSERT INTO Proposition(`statut`) VALUES ('0'), ('1');
#------------------------------------------------------------
# Table: Fournisseur
#------------------------------------------------------------

CREATE TABLE Fournisseur(
        Id_fournisseur   int (11) Auto_increment  NOT NULL ,
        Nom_fournisseur  Varchar (25) ,
        Mail_fournisseur Varchar (25) ,
        PRIMARY KEY (Id_fournisseur )
)ENGINE=InnoDB;

INSERT INTO Fournisseur(`Nom_fournisseur`,`Mail_fournisseur`) VALUES 
('Magicbazarre','Magicbazarre@magic.com'),
('Entrepotfeerique','Entrepotfeerique@Magic.fr'),
('Demonstock','Demonstock@demon.com');

#------------------------------------------------------------
# Table: Stock
#------------------------------------------------------------

CREATE TABLE Stock(
        Id_stock     int (11) Auto_increment  NOT NULL ,
        Date_Arrivee Date ,
        quantite     Int ,
        Date_sortie  Date ,
        Id_produit   Int ,
        PRIMARY KEY (Id_stock )
)ENGINE=InnoDB;

INSERT INTO Stock(`Date_Arrivee`,`quantite`,`Date_sortie`,`Id_produit`,`Id_stock`) VALUES
('2017-03-31','4','2017-04-05','15','1'),
('2017-03-28','3','2017-04-05','5','2'),
('2017-03-25','27','2017-04-10','21','3'),
('2017-04-01','10','2017-04-14','20','4'),
('2017-04-01','7','2017-04-19','15','5'),
('2017-04-01','34','2017-04-23','14','6'),
('2017-04-01','15','2017-04-27','13','7'),
('2017-04-02','6','2017-04-30','27','8'),
('2017-04-02','4','2017-04-30','32','9'),
('2017-04-02','6','2017-04-30','28','10'),
('2017-04-02','6','2017-04-30','22','11');
#------------------------------------------------------------
# Table: Inventeur
#------------------------------------------------------------

CREATE TABLE Inventeur(
        Id_inventeur     int (11) Auto_increment  NOT NULL ,
        Nom_inventeur    Varchar (25) ,
        Prenom_Inventeur Varchar (25) ,
        PRIMARY KEY (Id_inventeur )
)ENGINE=InnoDB;

INSERT INTO Inventeur(`Nom_inventeur`,`Prenom_inventeur`) VALUES
('John','Wick'),
('Malfoy','Dwayne'),
('Voldemort','Nose'),
('Dark','Vador'),
('Karaba','Boubou');

#------------------------------------------------------------
# Table: Diluant
#------------------------------------------------------------

CREATE TABLE Diluant(
        Id_diluant   int (11) Auto_increment  NOT NULL ,
        Type_diluant Varchar (25) ,
        PRIMARY KEY (Id_diluant )
)ENGINE=InnoDB;

INSERT INTO Diluant(`Type_diluant`) VALUES 
('Eau'),
('Lave'),
('Vin'),
('Eau benite'),
('Sang');

#------------------------------------------------------------
# Table: Potion
#------------------------------------------------------------

CREATE TABLE Potion(
        Id_potion          int (11) Auto_increment  NOT NULL ,
        Temperature_potion Int ,
        Id_produit         Int NOT NULL ,
        Id_diluant         Int ,
        PRIMARY KEY (Id_potion ,Id_produit )
)ENGINE=InnoDB;

INSERT INTO Potion(`Id_potion`,`ID_diluant`,`Temperature_potion`,`Id_produit`) VALUES 
('1','5','35','16'),
('2','4','31','17'),
('3','4','32','18'),
('4','2','33','19'),
('5','3','34','20');

#------------------------------------------------------------
# Table: Recipient
#------------------------------------------------------------

CREATE TABLE Recipient(
        Id_recipient int (11) Auto_increment  NOT NULL ,
        Id_produit   Int NOT NULL ,
        PRIMARY KEY (Id_recipient ,Id_produit )
)ENGINE=InnoDB;

INSERT INTO Recipient(`Id_produit`) VALUES
('29'),
('30'),
('31'),
('32'),
('33');

#------------------------------------------------------------
# Table: Ingredient
#------------------------------------------------------------

CREATE TABLE Ingredient(
        Id_ingredient     int (11) Auto_increment  NOT NULL ,
        degree_ingredient Int ,
        seuil_fraicheur   Int ,
        Id_produit        Int NOT NULL ,
        PRIMARY KEY (Id_ingredient ,Id_produit )
)ENGINE=InnoDB;

INSERT INTO Ingredient(`degree_ingredient`, `seuil_fraicheur`,`Id_produit`) VALUES 
('30','10','1'),
('10','5','2'),
('0','0','3'),
('40','20','4'),
('20','10','5'),
('10','5','6'),
('3','0','7'),
('6','1','8'),
('17','10','9'),
('15','11','10'),
('12','10','11'),
('32','15','12'),
('17','10','13'),
('5','0','14'),
('100','150','15');

#------------------------------------------------------------
# Table: Onguent
#------------------------------------------------------------

CREATE TABLE Onguent(
        Id_onguent int (11) Auto_increment  NOT NULL ,
        Id_produit Int NOT NULL ,
        PRIMARY KEY (Id_onguent ,Id_produit )
)ENGINE=InnoDB;

INSERT INTO Onguent(`Id_produit`) VALUES
('21'),
('22'),
('23'),
('24'),
('25'),
('26'),
('27'),
('28');

#------------------------------------------------------------
# Table: Produit
#------------------------------------------------------------

CREATE TABLE Produit(
        Id_produit   int (11) Auto_increment  NOT NULL ,
        Nom          Varchar (25) ,
        Prix_produit DECIMAL (15,3)  ,
        PRIMARY KEY (Id_produit )
)ENGINE=InnoDB;

INSERT INTO Produit(`Nom`,`Prix_produit`) VALUES 
('OeilAraignee','75'),
('PatteFourmi','20'),
('PoussiereEtoile','350'),
('BaveCrapaud','120'),
('VeninSerpent','130'),
('EcailleDragon','430'),
('PoilGrizzly','210'),
('GriffeGargouille','180'),
('FeuilleMandragore','60'),
('CrinLicorne','500'),
('OngleGriffon','600'),
('DentColeoptere','30'),
('PatteSauterelle','25'),
('QueueMammouth','300'),
('AilePhoenix','1000'),
('elexirRage','940'),
('lotionAmour','980'),
('potionResurection','490'),
('potionAntidote','230'),
('potionMemoire','425'),
('cremeInvisibilite','850'),
('cremeVolante','1060'),
('cremeDeMort','925'), 
('cremeRebondissante','525'),
('cremeMinusculus','200'),
('cremeGeantus','510'),
('cremeImmmortalite','2380'),
('cremeforce','940'),
('fiole','5'),
('tube','7'),
('pot','10'),
('chaudron','20'),
('flacon','8');

#------------------------------------------------------------
# Table: Achete
#------------------------------------------------------------

CREATE TABLE Achete(
        ID_client   Int NOT NULL ,
        ID_commande Int NOT NULL ,
        PRIMARY KEY (ID_client ,ID_commande )
)ENGINE=InnoDB;

INSERT INTO Achete(`ID_client`,`ID_commande`) VALUES
('1','1'),
('2','2');

#------------------------------------------------------------
# Table: soumet
#------------------------------------------------------------

CREATE TABLE soumet(
        ID_proposition Int NOT NULL ,
        ID_client      Int NOT NULL ,
        PRIMARY KEY (ID_proposition ,ID_client )
)ENGINE=InnoDB;

INSERT INTO soumet(`ID_proposition`,`ID_client`) VALUES
('2','1'),
('1','2');

#------------------------------------------------------------
# Table: Fournit
#------------------------------------------------------------

CREATE TABLE Fournit(
        quantite       Int ,
        Id_fournisseur Int NOT NULL ,
        Id_produit     Int NOT NULL ,
        PRIMARY KEY (Id_fournisseur ,Id_produit )
)ENGINE=InnoDB;

INSERT INTO Fournit(`Id_fournisseur`,`Id_produit`,`quantite`) VALUES
('1','15','4'),
('3','5','3'),
('1','21','27'),
('2','20','10'),
('2','15','7'),
('1','14','34'),
('2','13','15'),
('3','7','7');

#------------------------------------------------------------
# Table: cree_potion
#------------------------------------------------------------

CREATE TABLE cree_potion(
        Id_inventeur Int NOT NULL ,
        Id_potion    Int NOT NULL ,
        Id_produit   Int NOT NULL ,
        PRIMARY KEY (Id_inventeur ,Id_potion ,Id_produit )
)ENGINE=InnoDB;

INSERT INTO cree_potion(`Id_inventeur`,`Id_potion`,`Id_produit`) VALUES

('1','4','19'),
('3','5','20'),
('3','1','16'),
('4','2','17'),
('5','3','18');

#------------------------------------------------------------
# Table: cree_onguent
#------------------------------------------------------------

CREATE TABLE cree_onguent(
        Id_inventeur Int NOT NULL ,
        Id_onguent   Int NOT NULL ,
        Id_produit   Int NOT NULL ,
        PRIMARY KEY (Id_inventeur ,Id_onguent ,Id_produit )
)ENGINE=InnoDB;

INSERT INTO cree_onguent(`Id_inventeur`,`Id_onguent`,`Id_produit`) VALUES

('1','5','25'),
('1','6','26'),
('2','4','24'),
('3','3','23'),
('3','8','28'),
('4','7','27'),
('5','1','21'),
('5','2','22');
#------------------------------------------------------------
# Table: utilise 
#------------------------------------------------------------

CREATE TABLE utilise(
        ID_commande Int NOT NULL ,
        Id_stock    Int NOT NULL ,
        PRIMARY KEY (ID_commande ,Id_stock )
)ENGINE=InnoDB;

INSERT INTO utilise(`ID_commande`,`Id_stock`) VALUES
('1','8'),
('1','9'),
('2','10'),
('2','11');

#------------------------------------------------------------
# Table: se compose 
#------------------------------------------------------------

CREATE TABLE se_compose(
        ID_proposition Int NOT NULL ,
        Id_ingredient  Int NOT NULL ,
        Id_produit     Int NOT NULL ,
        PRIMARY KEY (ID_proposition ,Id_ingredient ,Id_produit )
)ENGINE=InnoDB;

INSERT INTO livre(`ID_proposition`,`Id_ingredient`) VALUES
('1','12','12'),
('1','1','1'),
('1','5','5');
#------------------------------------------------------------
# Table: livre
#------------------------------------------------------------

CREATE TABLE livre(
        Id_fournisseur Int NOT NULL ,
        Id_stock       Int NOT NULL ,
        PRIMARY KEY (Id_fournisseur ,Id_stock )
)ENGINE=InnoDB;

INSERT INTO livre(`Id_fournisseur`,`Id_stock`) VALUES
('1','1'),
('3','2'),
('1','3'),
('2','4'),
('2','5'),
('1','6'),
('2','7'),
('2','8'),
('3','9'),
('2','10'),
('2','11');

#------------------------------------------------------------
# Table: contient
#------------------------------------------------------------

CREATE TABLE contient(
        Quantite_ingredient Int ,
        Id_potion           Int NOT NULL ,
        Id_produit          Int NOT NULL ,
        Id_ingredient       Int NOT NULL ,
        Id_produit_Produit  Int NOT NULL ,
        PRIMARY KEY (Id_potion ,Id_produit ,Id_ingredient ,Id_produit_Produit )
)ENGINE=InnoDB;

INSERT INTO contient(`Quantite_ingredient`,`Id_potion`,`Id_produit`,`Id_ingredient`,`Id_produit_Produit`) VALUES
('1','1','16','11','11'),
('1','1','16','7','7'),
('1','1','16','5','5'),
('1','2','17','4','4'),
('1','2','17','10','10'),
('1','3','18','9','9'),
('1','3','18','6','6'),
('1','4','19','3','3'),
('1','4','19','2','23'),
('1','4','19','12','12'),
('1','4','19','9','9'),
('1','5','20','1','1'),
('1','5','20','4','4');
#------------------------------------------------------------
# Table: possede 
#------------------------------------------------------------

CREATE TABLE possede(
        Quantite_ingredient Int ,
        Id_ingredient       Int NOT NULL ,
        Id_produit          Int NOT NULL ,
        Id_onguent          Int NOT NULL ,
        Id_produit_Produit  Int NOT NULL ,
        PRIMARY KEY (Id_ingredient ,Id_produit ,Id_onguent ,Id_produit_Produit )
)ENGINE=InnoDB;

INSERT INTO possede(`Quantite_ingredient`,`Id_onguent`,`Id_produit_Produit`,`Id_ingredient`,`Id_produit`) VALUES
('1','1','21','10','10'),
('1','1','21','4','4'),
('1','2','22','6','6'),
('1','2','22','12','12'),
('1','2','22','11','11'),
('1','3','23','5','5'),
('1','3','23','3','3'),
('1','3','23','1','1'),
('1','3','23','8','8'),
('1','4','24','10','10'),
('1','5','25','2','2'),
('1','4','24','13','13'),
('1','5','25','9','9'),
('1','5','25','3','3'),
('1','6','26','14','14'),
('1','6','26','7','7'),
('1','7','27','10','10'),
('1','7','27','4','4'),
('1','8','28','11','11'),
('1','8','28','7','7'),
('1','5','25','5','5');

ALTER TABLE Entreprise ADD CONSTRAINT FK_Entreprise_ID_client FOREIGN KEY (ID_client) REFERENCES Client(ID_client);
ALTER TABLE Particulier ADD CONSTRAINT FK_Particulier_ID_client FOREIGN KEY (ID_client) REFERENCES Client(ID_client);
ALTER TABLE Commande ADD CONSTRAINT FK_Commande_Id_etat FOREIGN KEY (Id_etat) REFERENCES Statut(Id_etat);
ALTER TABLE Stock ADD CONSTRAINT FK_Stock_Id_produit FOREIGN KEY (Id_produit) REFERENCES Produit(Id_produit);
ALTER TABLE Potion ADD CONSTRAINT FK_Potion_Id_produit FOREIGN KEY (Id_produit) REFERENCES Produit(Id_produit);
ALTER TABLE Potion ADD CONSTRAINT FK_Potion_Id_diluant FOREIGN KEY (Id_diluant) REFERENCES Diluant(Id_diluant);
ALTER TABLE Recipient ADD CONSTRAINT FK_Recipient_Id_produit FOREIGN KEY (Id_produit) REFERENCES Produit(Id_produit);
ALTER TABLE Ingredient ADD CONSTRAINT FK_Ingredient_Id_produit FOREIGN KEY (Id_produit) REFERENCES Produit(Id_produit);
ALTER TABLE Onguent ADD CONSTRAINT FK_Onguent_Id_produit FOREIGN KEY (Id_produit) REFERENCES Produit(Id_produit);
ALTER TABLE Achete ADD CONSTRAINT FK_Achete_ID_client FOREIGN KEY (ID_client) REFERENCES Client(ID_client);
ALTER TABLE Achete ADD CONSTRAINT FK_Achete_ID_commande FOREIGN KEY (ID_commande) REFERENCES Commande(ID_commande);
ALTER TABLE soumet ADD CONSTRAINT FK_soumet_ID_proposition FOREIGN KEY (ID_proposition) REFERENCES Proposition(ID_proposition);
ALTER TABLE soumet ADD CONSTRAINT FK_soumet_ID_client FOREIGN KEY (ID_client) REFERENCES Client(ID_client);
ALTER TABLE Fournit ADD CONSTRAINT FK_Fournit_Id_fournisseur FOREIGN KEY (Id_fournisseur) REFERENCES Fournisseur(Id_fournisseur);
ALTER TABLE Fournit ADD CONSTRAINT FK_Fournit_Id_produit FOREIGN KEY (Id_produit) REFERENCES Produit(Id_produit);
ALTER TABLE cree_potion ADD CONSTRAINT FK_cree_potion_Id_inventeur FOREIGN KEY (Id_inventeur) REFERENCES Inventeur(Id_inventeur);
ALTER TABLE cree_potion ADD CONSTRAINT FK_cree_potion_Id_potion FOREIGN KEY (Id_potion) REFERENCES Potion(Id_potion);
ALTER TABLE cree_potion ADD CONSTRAINT FK_cree_potion_Id_produit FOREIGN KEY (Id_produit) REFERENCES Produit(Id_produit);
ALTER TABLE cree_onguent ADD CONSTRAINT FK_cree_onguent_Id_inventeur FOREIGN KEY (Id_inventeur) REFERENCES Inventeur(Id_inventeur);
ALTER TABLE cree_onguent ADD CONSTRAINT FK_cree_onguent_Id_onguent FOREIGN KEY (Id_onguent) REFERENCES Onguent(Id_onguent);
ALTER TABLE cree_onguent ADD CONSTRAINT FK_cree_onguent_Id_produit FOREIGN KEY (Id_produit) REFERENCES Produit(Id_produit);
ALTER TABLE utilise ADD CONSTRAINT FK_utilise_ID_commande FOREIGN KEY (ID_commande) REFERENCES Commande(ID_commande);
ALTER TABLE utilise ADD CONSTRAINT FK_utilise_Id_stock FOREIGN KEY (Id_stock) REFERENCES Stock(Id_stock);
ALTER TABLE se_compose ADD CONSTRAINT FK_se_compose_ID_proposition FOREIGN KEY (ID_proposition) REFERENCES Proposition(ID_proposition);
ALTER TABLE se_compose ADD CONSTRAINT FK_se_compose_Id_ingredient FOREIGN KEY (Id_ingredient) REFERENCES Ingredient(Id_ingredient);
ALTER TABLE se_compose ADD CONSTRAINT FK_se_compose_Id_produit FOREIGN KEY (Id_produit) REFERENCES Produit(Id_produit);
ALTER TABLE livre ADD CONSTRAINT FK_livre_Id_fournisseur FOREIGN KEY (Id_fournisseur) REFERENCES Fournisseur(Id_fournisseur);
ALTER TABLE livre ADD CONSTRAINT FK_livre_Id_stock FOREIGN KEY (Id_stock) REFERENCES Stock(Id_stock);
ALTER TABLE contient ADD CONSTRAINT FK_contient_Id_potion FOREIGN KEY (Id_potion) REFERENCES Potion(Id_potion);
ALTER TABLE contient ADD CONSTRAINT FK_contient_Id_produit FOREIGN KEY (Id_produit) REFERENCES Produit(Id_produit);
ALTER TABLE contient ADD CONSTRAINT FK_contient_Id_ingredient FOREIGN KEY (Id_ingredient) REFERENCES Ingredient(Id_ingredient);
ALTER TABLE contient ADD CONSTRAINT FK_contient_Id_produit_Produit FOREIGN KEY (Id_produit_Produit) REFERENCES Produit(Id_produit);
ALTER TABLE possede ADD CONSTRAINT FK_possede_Id_ingredient FOREIGN KEY (Id_ingredient) REFERENCES Ingredient(Id_ingredient);
ALTER TABLE possede ADD CONSTRAINT FK_possede_Id_produit FOREIGN KEY (Id_produit) REFERENCES Produit(Id_produit);
ALTER TABLE possede ADD CONSTRAINT FK_possede_Id_onguent FOREIGN KEY (Id_onguent) REFERENCES Onguent(Id_onguent);
ALTER TABLE possede ADD CONSTRAINT FK_possede_Id_produit_Produit FOREIGN KEY (Id_produit_Produit) REFERENCES Produit(Id_produit);
