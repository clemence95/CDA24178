-- Exercice d'application n°1
-- Pour obtenir la liste des titres des représentations, nous utilisons la requête suivante :
SELECT titre FROM REPRESENTATION;
-- Pour obtenir la liste des titres des représentations ayant lieu à l'opéra Bastille, nous utilisons la requête suivante :
SELECT titre FROM REPRESENTATION WHERE lieu = 'Opéra Bastille';
-- Exercice d'application n°2
-- Pour obtenir le nombre total d'étudiants :
SELECT COUNT(*) AS Nombre_Total_Etudiants FROM ETUDIANT;
