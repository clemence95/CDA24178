-- Supprimer la base de données exemple si elle existe déjà
drop database exemple;
-- Créer une nouvelle base de données appelée exemple
create database exemple;
-- Sélectionner la base de données exemple pour y effectuer les opérations suivantes
use exemple;
-- Créer la table dept avec trois colonnes : nodept, nom, noregion
CREATE TABLE dept (
	nodept 		varchar(50) NOT NULL PRIMARY KEY,
	nom 		varchar(50) NOT NULL,
	noregion 	varchar(50) NOT NULL
);
-- Créer la table employe avec huit colonnes : noemp, nom, prenom, dateemb, nosup, titre, nodep, salaire, tauxcom
CREATE TABLE employe(
	noemp 		int NOT NULL PRIMARY KEY,
	nom 		varchar(50) NOT NULL,
	prenom 		varchar(50) NOT NULL,
	dateemb 	datetime NOT NULL,
	nosup 		varchar(50) NULL,
	titre 		varchar(50) NOT NULL,
	nodep 		varchar(50) NOT NULL REFERENCES dept(nodept),
	salaire 	decimal(18, 0) NOT NULL,
	tauxcom 	decimal(18, 0) NULL
);
-- Insérer des données dans la table dept
INSERT INTO dept (nodept, nom, noregion) VALUES
('10', 'finance', '1'),
('20', 'atelier', '2'),
('30', 'atelier', '3'),
('31', 'vente', '1'),
('32', 'vente', '2'),
('33', 'vente', '3'),
('34', 'vente', '4'),
('35', 'vente', '5'),
('41', 'distribution', '1'),
('42', 'distribution', '2'),
('43', 'distribution', '3'),
('44', 'distribution', '4'),
('45', 'distribution', '5'),
('50', 'administration', '1');
-- Insérer des données dans la table employe
INSERT INTO employe (noemp, nom, prenom, dateemb, nosup, titre, nodep, salaire, tauxcom) VALUES 
(1, 'patamob', 'adhémar', '2000-03-26 00:00:00', NULL, 'président', '50', 50000, NULL),
(2, 'zeublouse', 'agathe', '2000-04-15 00:00:00', '1', 'dir.distrib', '41', 35000, NULL),
(3, 'kuzbidon', 'alex', '2000-05-05 00:00:00', '1', 'dir.vente', '31', 34000, NULL),
(4, 'locale', 'anasthasie', '2000-05-25 00:00:00', '1', 'dir.finance', '10', 36000, NULL),
(5, 'teutmaronne', 'armand', '2000-06-14 00:00:00', '1', 'dir.administratif', '50', 36000, NULL),
(6, 'zoudanlkou', 'debbie', '2000-07-04 00:00:00', '2', 'chef entrepot', '41', 25000, NULL),
(7, 'rivenbusse', 'elsa', '2000-07-24 00:00:00', '2', 'chef entrepot', '42', 24000, NULL),
(8, 'ardelpic', 'helmut', '2000-08-13 00:00:00', '2', 'chef entrepot', '43', 23000, NULL),
(9, 'peursconla', 'humphrey', '2000-09-02 00:00:00', '2', 'chef entrepot', '44', 22000, NULL),
(10, 'vrante', 'helena', '2000-09-22 00:00:00', '2', 'chef entrepot', '45', 21000, NULL),
(11, 'melusine', 'enfaillite', '2000-10-12 00:00:00', '3', 'représentant', '31', 25000, 10),
(12, 'eurktumeme', 'odile', '2000-11-01 00:00:00', '3', 'représentant', '32', 26000, 12),
(13, 'hotdeugou', 'olaf', '2000-11-21 00:00:00', '3', 'représentant', '33', 27000, 10),
(14, 'odlavieille', 'pacome', '2000-12-11 00:00:00', '3', 'représentant', '34', 25000, 15),
(15, 'amartakaldire', 'quentin', '2000-12-21 00:00:00', '3', 'représentant', '35', 23000, 17),
(16, 'traibien', 'samira', '2000-12-31 00:00:00', '6', 'secrétaire', '41', 15000, NULL),
(17, 'fonfec', 'sophie', '2001-01-10 00:00:00', '6', 'secrétaire', '41', 14000, NULL),
(18, 'fairent', 'teddy', '2001-01-20 00:00:00', '7', 'secrétaire', '42', 13000, NULL),
(19, 'blaireur', 'terry', '2001-02-09 00:00:00', '7', 'secrétaire', '42', 13000, NULL),
(20, 'ajerre', 'tex', '2001-02-09 00:00:00', '8', 'secrétaire', '43', 13000, NULL),
(21, 'chmonfisse', 'thierry', '2001-02-19 00:00:00', '8', 'secrétaire', '43', 12000, NULL),
(22, 'phototetedemort', 'thomas', '2001-02-19 00:00:00', '9', 'secrétaire', '44', 22500, NULL),
(23, 'kaecoute', 'xavier', '2001-03-01 00:00:00', '9', 'secrétaire', '34', 11500, NULL),
(24, 'adrouille-toutltan', 'yves', '2001-03-11 00:00:00', '10', 'secrétaire', '45', 11000, NULL),
(25, 'anchier', 'yvon', '2001-03-21 00:00:00', '10', 'secrétaire', '45', 10000, NULL);
-- Affiche toutes les colonnes de la table employe
SELECT * FROM employe;
-- Affiche toutes les colonnes de la table dept
SELECT * FROM dept;
-- Affiche le nom, la date d'embauche, le numéro du supérieur, le numéro de département et le salaire de tous les employés
SELECT nom, dateemb, nosup, nodep, salaire
FROM employe;
-- Sélectionne les titres uniques de tous les employés
SELECT DISTINCT titre FROM employe;
-- Afficher les différentes valeurs des titres des employés
SELECT DISTINCT titre FROM employe;
-- Afficher le nom, le numéro d'employé et le numéro du département des employés dont le titre est « Secrétaire »
SELECT nom, noemp, nodep 
FROM employe 
WHERE titre = 'Secrétaire';
-- Afficher le nom et le numéro de département des employés dont le numéro de département est supérieur à 40
SELECT nom, nodep 
FROM employe 
WHERE CAST(nodep AS INT) > 40;
-- Afficher le nom et le prénom des employés dont le nom est alphabétiquement antérieur au prénom
SELECT nom, prenom
FROM employe
WHERE nom < prenom;
-- Afficher le nom, le salaire et le numéro du département des employés
-- dont le titre est « Représentant », le numéro de département est 35
-- et le salaire est supérieur à 20000.
SELECT nom, salaire, nodep
FROM employe
WHERE titre = 'Représentant'
AND nodep = '35'
AND salaire > 20000;
-- Afficher le nom, le titre et le salaire des employés
-- dont le titre est « Représentant » ou dont le titre est « Président ».
SELECT nom, titre, salaire
FROM employe
WHERE titre = 'Représentant'
OR titre = 'Président';
-- Afficher le nom, le titre, le numéro de département, le salaire des employés
-- du département 34, dont le titre est « Représentant » ou « Secrétaire ».
SELECT nom, titre, nodep, salaire
FROM employe
WHERE nodep = '34'
AND (titre = 'Représentant' OR titre = 'Secrétaire');
--Affiche le nom, et le salaire des employés dont le salaire est compris entre 20000 et 30000
SELECT nom, salaire
FROM employe
WHERE salaire BETWEEN 20000 AND 30000
LIMIT 100;
--Affiche le nom des employés commençant par la lettre « H »
SELECT nom
FROM employe
WHERE nom LIKE 'H%';
--Affiche le nom des employés se terminant par la lettre « n »
SELECT nom
FROM employe
WHERE nom LIKE '%n';
--Afficher le nom des employés contenant la lettre « u » en 3ème position
SELECT nom
FROM employe
WHERE nom LIKE '__u%';
-- Affiche le salaire et le nom des employés du service 41 classés par salaire croissant
SELECT nom, salaire
FROM employe
WHERE nodep = 41
ORDER BY salaire ASC;
-- Affiche le salaire et le nom des employés du service 41 classés par salaire décroissant
SELECT nom, salaire
FROM employe
WHERE nodep = 41
ORDER BY salaire DESC;
-- Affiche le titre, le salaire et le nom des employés classés par titre croissant et par salaire décroissant 
SELECT titre, nom, salaire
FROM employe
ORDER BY titre ASC, salaire DESC;
-- Affiche le taux de commission, le salaire et le nom des employés classés par taux de commission croissante
SELECT tauxcom, salaire, nom
FROM employe
ORDER BY tauxcom ASC;
-- Affiche le nom, le salaire, le taux de commission et le titre des employés dont le taux de commission n'est pas renseigné
SELECT nom, salaire, tauxcom, titre
FROM employe
WHERE tauxcom IS NULL;
-- Affiche le nom, le salaire, le taux de commission et le titre des employés dont le taux de commission est renseigné
SELECT nom, salaire, tauxcom, titre
FROM employe
WHERE tauxcom IS NOT NULL;
-- Affiche le nom, le salaire, le taux de commission, le titre des employés dont le taux de commission est inférieur à 15
SELECT nom, salaire, tauxcom, titre
FROM employe
WHERE tauxcom < 15;
-- Affiche le nom, le salaire, le taux de commission, le titre des employés dont le taux de commission est supérieur à 15
SELECT nom, salaire, tauxcom, titre
FROM employe
WHERE tauxcom > 15;
-- Afficher le nom, le salaire, le taux de commission et la commission des employés dont le taux de commission n'est pas nul.
-- (la commission est calculée en multipliant le salaire par le taux de commission)
 SELECT nom, salaire, tauxcom, salaire * (tauxcom / 100) AS commission
FROM employe
WHERE tauxcom IS NOT NULL;
