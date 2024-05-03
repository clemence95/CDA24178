-- Sélectionner la base de données exemple pour y effectuer les opérations suivantes
use exemple;
-- Recherche le prénom des employés et le numéro de la région de leur département
SELECT e.prenom, d.noregion
FROM employe e
JOIN dept d ON e.nodep = d.nodept;

