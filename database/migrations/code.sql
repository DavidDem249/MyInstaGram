CREATE TABLE Individu(
    no_ind LONG,
    nom VARCHAR(30),                                                                                                     -> prnom VARCHAR(100),
    adresse VARCHAR(255),
    code_postal VARCHAR(255),
    ville VARCHAR(90)
)ENGINE=INNODB;

CREATE TABLE Ville(
    no_ville INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nom_ville VARCHAR(100)
)ENGINE=INNODB;


CREATE TABLE Vol(
    no_vol INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    date_depart DATE,
    date_arrivee DATE
)ENGINE=INNODB;

CREATE TABLE Reservation(
    no_reserv LONG NOT NULL,
    date_reserv DATE,
    id_vol INT,
    FOREIGN KEY(id_vol) REFERENCES Vol(no_vol)
)ENGINE=INNODB;


 CREATE TABLE Client(
    code_client INT NOT NULL PRIMARY KEY  UNIQUE,
    id_reserv INT,
    id_ind INT,
    FOREIGN KEY(id_reserv) REFERENCES Reservation(id_reser),
    FOREIGN KEY(id_ind) REFERENCES Individu(no_ind)
)ENGINE=INNODB;


CREATE TABLE Aeroport(
    no_aero INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nom_aero VARCHAR(255),
    id_ville INT,
    FOREIGN KEY(id_ville) REFERENCES Ville(no_ville)
)ENGINE=INNODB;

CREATE TABLE Aeroport(
    no_aero INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nom_aero VARCHAR(255),
    id_ville INT,
    FOREIGN KEY(id_ville) REFERENCES Ville(no_ville)
)ENGINE=INNODB;


CREATE TABLE VolGeneriq(
    num_vol_gen INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    jour VARCHAR(50),
    heure_depat TIME,
    heure_arrive TIME,
    id_vol INT,
    id_aeoro INT,
    FOREIGN KEY(id_vol) REFERENCES Vol(no_vol),
    FOREIGN KEY(id_aeoro) REFERENCES Aeroport(no_aero)
)ENGINE=INNODB;


CREATE TABLE Escape(
    heure_depart TIME,
    heure_arrive TIME,
    id_vol_gen INT,
    id_aero INT,
    FOREIGN KEY(id_vol_gen) REFERENCES VolGeneriq(num_vol_gen),
    FOREIGN KEY(id_aero) REFERENCES Aeroport(no_aero)
)ENGINE=INNODB;


 CREATE TABLE Compagnie(
    id_comp INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    code_cie VARCHAR(100),
    nom_cie VARCHAR(255),
    id_vol_gen INT,
    FOREIGN KEY (id_vol_gen) REFERENCES VolGeneriq(num_vol_gen)
)ENGINE=INNODB;

 CREATE TABLE Passager(
    code_passager INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nb_point INT,
    id_ind INT,
    FOREIGN KEY(id_ind) REFERENCES Individu(no_ind)
)ENGINE=INNODB;

-------------------MODIFICATION DE QUELQUES TABLES--------------------------------

ALTER TABLE Reservation CHANGE date date_reserv DATE;
ALTER TABLE Reservation ADD id_reser INT NOT NULL PRIMARY KEY AUTO_INCREMENT FIRST;
ALTER TABLE Individu MODIFY no_ind INT NOT NULL PRIMARY KEY AUTO_INCREMENT;
ALTER TABLE Client ADD id_ind INT;