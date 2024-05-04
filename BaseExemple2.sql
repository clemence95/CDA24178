-- Sélectionner la base de données exemple pour y effectuer les opérations suivantes
use exemple;
-- Recherche le prénom des employés et le numéro de la région de leur département
SELECT e.prenom, d.noregion
FROM employe e
JOIN dept d ON e.nodep = d.nodept;
-- Rechercher le numéro du département, le nom du département, le nom des employés classés par numéro de département
-- (renommer les tables utilisées)
SELECT d.nodept AS numero_departement, d.nom AS nom_departement, e.nom AS nom_employe
FROM employe e
JOIN dept d ON e.nodep = d.nodept
ORDER BY d.nodept;
-- Recherche le nom des employés du département Distribution.
SELECT e.nom AS nom_employe
FROM employe e
JOIN dept d ON e.nodep = d.nodept
WHERE d.nom = 'distribution';
-- Recherche le nom et le salaire des employés qui gagnent plus que leur patron, et le nom et le salaire de leur patron
SELECT e.nom AS nom_employe, e.salaire AS salaire_employe, 
       s.nom AS nom_patron, s.salaire AS salaire_patron
FROM employe e
JOIN employe s ON e.nosup = s.noemp
WHERE e.salaire > s.salaire;
-- Recherche le nom et le titre des employés qui ont le même titre que Amartakaldire.
SELECT nom, titre
FROM employe
WHERE titre = (SELECT titre FROM employe WHERE nom = 'Amartakaldire');
-- Recherche le nom, le salaire et le numéro de département des employés qui gagnent plus qu'un seul employé du département 31,
-- classés par numéro de département et salaire
SELECT e.nom, e.salaire, e.nodep
FROM employe e
JOIN (
    SELECT nodep, COUNT(*) AS nb_employes
    FROM employe
    WHERE nodep = '31'
    GROUP BY nodep
) AS departement_31 ON e.nodep = departement_31.nodep
WHERE e.salaire > (
    SELECT MIN(salaire)
    FROM employe
    WHERE nodep = '31'
    GROUP BY nodep
)
ORDER BY e.nodep, e.salaire;
-- Recherche le nom, le salaire et le numéro de département des employés qui gagnent plus que tous les employés du département 31, 
-- classés par numéro de département et salaire
SELECT e.nom, e.salaire, e.nodep
FROM employe e
WHERE e.salaire > (
    SELECT MAX(salaire)
    FROM employe
    WHERE nodep = '31'
)
ORDER BY e.nodep, e.salaire;
-- Recherche le nom et le titre des employés du service 31 qui ont un titre que l'on trouve dans le département 32.
SELECT e.nom, e.titre
FROM employe e
JOIN (
    SELECT DISTINCT titre
    FROM employe
    WHERE nodep = '32'
) AS titres_dep32 ON e.titre = titres_dep32.titre
WHERE e.nodep = '31';
-- Recherche le nom et le titre des employés du service 31 qui ont un titre l'on ne trouve pas dans le département 32
SELECT nom, titre
FROM employe
WHERE nodep = '31'
AND titre NOT IN (
    SELECT DISTINCT titre
    FROM employe
    WHERE nodep = '32'
);
-- Recherche le nom, le titre et le salaire des employés qui ont le même titre et le même salaire que Fairant
SELECT nom, titre, salaire
FROM employe
WHERE titre = (SELECT titre FROM employe WHERE nom = 'Fairent')
AND salaire = (SELECT salaire FROM employe WHERE nom = 'Fairent');
-- Recherche le numéro de département, le nom du département, le nom des employés, en affichant aussi les départements dans lesquels
-- il n'y a personne, classés par numéro de département
SELECT d.nodept AS numero_departement, d.nom AS nom_departement, e.nom AS nom_employe
FROM dept d
LEFT JOIN employe e ON d.nodept = e.nodep
UNION
SELECT d.nodept AS numero_departement, d.nom AS nom_departement, NULL AS nom_employe
FROM dept d
RIGHT JOIN employe e ON d.nodept = e.nodep
WHERE e.nodep IS NULL
ORDER BY numero_departement;
-- Calcule le nombre d'employés de chaque titre
SELECT titre, COUNT(*) AS nombre_employes
FROM employe
GROUP BY titre;
--  Calcule la moyenne des salaires et leur somme, par région
SELECT d.noregion,
       AVG(e.salaire) AS moyenne_salaire, -- La fonction AVG(e.salaire) calcule la moyenne des salaires pour chaque région
       SUM(e.salaire) AS somme_salaire -- La fonction SUM(e.salaire) calcule la somme des salaires pour chaque région
FROM employe e
JOIN dept d ON e.nodep = d.nodept
GROUP BY d.noregion;  --  les données sont regroupées par "noregion" en utilisant la clause GROUP BY.
--  Affiche les numéros des départements ayant au moins 3 employés
SELECT nodep  -- Nous sélectionnons la colonne "nodep" de la table "employe".
FROM employe 
GROUP BY nodep -- Nous regroupons les données par "nodep" en utilisant la clause GROUP BY
HAVING COUNT(*) >= 3;  --La clause HAVING est utilisée pour filtrer les résultats. 
-- Ici, nous utilisons COUNT(*) >= 3  pour ne sélectionner que les départements ayant au moins trois employés.
--  Affiche les lettres qui sont l'initiale d'au moins trois employés.
SELECT SUBSTRING(nom, 1, 1) AS initiale_nom -- Nous utilisons la fonction SUBSTRING(nom, 1, 1) pour extraire la première lettre de chaque nom dans la colonne "nom".
FROM employe
GROUP BY SUBSTRING(nom, 1, 1) -- Ensuite, nous regroupons les données par cette initiale de nom en utilisant la clause GROUP BY.
HAVING COUNT(*) >= 3; --La clause HAVING est utilisée pour filtrer les résultats. Ici,
-- nous utilisons COUNT(*) >= 3 pour ne sélectionner que les initiales qui sont l'initiale d'au moins trois employés
-- Rechercher le salaire maximum et le salaire minimum parmi tous les salariés et l'écart entre les deux
SELECT 
    MAX(salaire) AS salaire_max,
    MIN(salaire) AS salaire_min,
    MAX(salaire) - MIN(salaire) AS ecart_salaire
FROM employe;
--  Recherche le nombre de titres différents
SELECT COUNT(DISTINCT titre) AS nombre_titres_different
FROM employe;
-- Pour chaque titre, compter le nombre d'employés possédant ce titre
SELECT titre, COUNT(*) AS nombre_employes
FROM employe
GROUP BY titre;
-- Pour chaque nom de département, afficher le nom du département et le nombre d'employés
SELECT d.nom AS nom_departement, COUNT(e.noemp) AS nombre_employes
FROM employe e
JOIN dept d ON e.nodep = d.nodept
GROUP BY d.nom;
-- Recherche les titres et la moyenne des salaires par titre dont la moyenne est supérieure à la moyenne des salaires des Représentants
SELECT titre, AVG(salaire) AS moyenne_salaires
FROM employe
GROUP BY titre
HAVING AVG(salaire) > (SELECT AVG(salaire) FROM employe WHERE titre = 'représentant');
