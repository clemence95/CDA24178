-- Sélectionner la base de données exemple pour y effectuer les opérations suivantes
use exemple;
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
-- Affiche le nom, le salaire, le taux de commission, la commission des employés dont le taux de commission n'est pas nul, 
-- classé par taux de commission croissant
SELECT nom, salaire, tauxcom, salaire * (tauxcom / 100) AS commission
FROM employe
WHERE tauxcom IS NOT NULL
ORDER BY tauxcom ASC;
-- Affiche le nom et le prénom (concaténés) des employés. Renommer les colonnes
SELECT CONCAT(nom, ' ', prenom) AS nom_complet
FROM employe;
-- Affiche les 5 premières lettres du nom des employés
SELECT SUBSTRING(nom, 1, 5) AS cinq_premieres_lettres
FROM employe;
-- Affiche le nom et le rang de la lettre « r » dans le nom des employés
SELECT nom, INSTR(nom, 'r') AS rang_lettre_r
FROM employe;
-- Affiche le nom, le nom en majuscule et le nom en minuscule de l'employé dont le nom est Brante.
SELECT nom,
       UPPER(nom) AS nom_majuscules,
       LOWER(nom) AS nom_minuscules
FROM employe
WHERE nom = 'Vrante';
--  Affiche le nom et le nombre de caractères du nom des employés
SELECT nom, LENGTH(nom) AS nombre_caracteres
FROM employe;
