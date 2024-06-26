DROP DATABASE IF EXISTS hotel;

CREATE DATABASE hotel;
USE hotel;

CREATE TABLE station (
    sta_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    sta_nom VARCHAR(50) NOT NULL,
    sta_altitude INT
);

CREATE TABLE hotel (
    hot_id          INT AUTO_INCREMENT NOT NULL,
    hot_sta_id      INT NOT NULL,
    hot_nom         VARCHAR(50) NOT NULL,
    hot_categorie   INT NOT NULL,
    hot_adresse     VARCHAR(50) NOT NULL,
    hot_ville       VARCHAR(50) NOT NULL, 
    FOREIGN KEY (hot_sta_id) REFERENCES station(sta_id),
    PRIMARY KEY (hot_id)
);

CREATE TABLE chambre (
    cha_id INT NOT NULL AUTO_INCREMENT ,
    cha_hot_id INT NOT NULL,
    cha_numero INT NOT NULL,
    cha_capacite INT NOT NULL,
    cha_type INT NOT NULL,
    FOREIGN KEY (cha_hot_id) REFERENCES hotel(hot_id),
    PRIMARY KEY (cha_id)
);

CREATE TABLE client (
    cli_id INT NOT NULL AUTO_INCREMENT ,
    cli_nom VARCHAR(50),
    cli_prenom VARCHAR(50),
    cli_adresse VARCHAR(50),
    cli_ville VARCHAR(50),
    PRIMARY KEY (cli_id)
);

CREATE TABLE reservation (
    res_id INT NOT NULL AUTO_INCREMENT,
    res_cha_id INT NOT NULL ,
    res_cli_id INT NOT NULL ,
    res_date DATETIME NOT NULL,
    res_date_debut DATETIME NOT NULL,
    res_date_fin DATETIME NOT NULL,
    res_prix DECIMAL(6,2) NOT NULL,
    res_arrhes DECIMAL(6,2),
    FOREIGN KEY (res_cha_id) REFERENCES chambre(cha_id),
    FOREIGN KEY (res_cli_id) REFERENCES client(cli_id),
    PRIMARY KEY (res_id)
);

INSERT INTO station (sta_id, sta_nom, sta_altitude) VALUES 
(1, 'La Montagne', 2500),
(2, 'Le Sud', 200),
(3, 'La Plage', 10);

INSERT INTO hotel (hot_id, hot_sta_id, hot_nom, hot_categorie, hot_adresse, hot_ville) VALUES 
(1, 1, 'Le Magnifique', 3, 'rue du bas', 'Pralo'),
(2, 1, 'Hotel du haut', 1, 'rue du haut', 'Pralo'),
(3, 2, 'Le Narval', 3, 'place de la liberation', 'Vonten'),
(4, 2, 'Les Pissenlis', 4, 'place du 14 juillet', 'Bretou'),
(5, 2, 'RR Hotel', 5, 'place du bas', 'Bretou'),
(6, 2, 'La Brique', 2, 'place du haut', 'Bretou'),
(7, 3, 'Le Beau Rivage', 3, 'place du centre', 'Toras');

INSERT INTO chambre (cha_numero, cha_hot_id, cha_capacite, cha_type) VALUES 
(001, 1, 2, 1),
(002, 1, 3, 1),
(003, 1, 2, 1),
(101, 1, 1, 1),
(102, 1, 2, 1),
(103, 1, 3, 1),
(201, 1, 2, 1),
(202, 1, 7, 1),
(203, 1, 1, 1),
(001, 2, 2, 1),
(002, 2, 2, 1),
(003, 2, 1, 1),
(101, 2, 2, 1),
(102, 2, 1, 1),
(103, 2, 3, 1),
(201, 2, 2, 1),
(202, 2, 4, 1),
(203, 2, 4, 1),
(001, 3, 3, 1),
(002, 3, 1, 1),
(003, 3, 2, 1),
(101, 3, 2, 1),
(102, 3, 2, 1),
(103, 3, 2, 1),
(201, 3, 2, 1),
(202, 3, 4, 1),
(203, 3, 4, 1),
(001, 4, 4, 1),
(002, 4, 2, 1),
(003, 4, 4, 1),
(101, 4, 1, 1),
(102, 4, 2, 1),
(103, 4, 2, 1),
(201, 4, 2, 1),
(202, 4, 2, 1),
(203, 4, 3, 1),
(001, 5, 3, 1),
(002, 5, 2, 1),
(003, 5, 2, 1),
(101, 5, 1, 1),
(102, 5, 4, 1),
(103, 5, 1, 1),
(201, 5, 2, 1),
(202, 5, 4, 1),
(203, 5, 4, 1),
(001, 6, 1, 1),
(002, 6, 1, 1),
(003, 6, 1, 1),
(101, 6, 1, 1),
(102, 6, 1, 1),
(103, 6, 1, 1),
(201, 6, 1, 1),
(202, 6, 1, 1),
(203, 6, 1, 1),
(001, 7, 1, 1),
(002, 7, 5, 1),
(003, 7, 5, 1),
(101, 7, 5, 1),
(102, 7, 5, 1),
(103, 7, 5, 1),
(201, 7, 5, 1),
(202, 7, 5, 1),
(203, 7, 5, 1);

INSERT INTO client (cli_nom, cli_prenom, cli_adresse, cli_ville) VALUES 
('Doe', 'John', '', 'LA'),
('Homme', 'Josh', '', 'Palm Desert'),
('Paul', 'Weller', '', 'Londre'),
('White', 'Jack', '', 'Detroit'),
('Claypool', 'Les', '', 'San Francisco'),
('Squire', 'Chris', '', 'Londre'),
('Wood', 'Ronnie', '', 'Londre');

INSERT INTO reservation (res_cha_id, res_cli_id, res_date, res_date_debut, res_date_fin, res_prix, res_arrhes) VALUES 
(1, 1, '2017-01-10', '2017-07-01', '2017-07-15', 2400, 800),
(2, 2, '2017-01-10', '2017-07-01', '2017-07-15', 3400, 100),
(1, 3, '2017-01-10', '2017-07-01', '2017-07-15', 400, 50),
(2, 4, '2017-01-10', '2017-07-01', '2017-07-15', 7200, 1800),
(3, 5, '2017-01-10', '2017-07-01', '2017-07-15', 1400, 450),
(4, 6, '2017-01-10', '2017-07-01', '2017-07-15', 2400, 780),
(4, 6, '2017-01-10', '2017-07-01', '2017-07-15', 500, 80),
(4, 1, '2017-01-10', '2017-07-01', '2017-07-15', 40, 0);


