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
       AVG(e.salaire) AS moyenne_salaire,
       SUM(e.salaire) AS somme_salaire
FROM employe e
JOIN dept d ON e.nodep = d.nodept
GROUP BY d.noregion;
