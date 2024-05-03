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
