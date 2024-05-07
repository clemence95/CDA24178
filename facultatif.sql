-- Exercice d'application n°1
-- Pour obtenir la liste des titres des représentations, nous utilisons la requête suivante :
SELECT titre FROM REPRESENTATION;
-- Pour obtenir la liste des titres des représentations ayant lieu à l'opéra Bastille, nous utilisons la requête suivante :
SELECT titre FROM REPRESENTATION WHERE lieu = 'Opéra Bastille';
-- Exercice d'application n°2
-- Pour obtenir le nombre total d'étudiants :
SELECT COUNT(*) AS Nombre_Total_Etudiants FROM ETUDIANT;
-- Pour trouver la note la plus haute et la note la plus basse parmi l'ensemble des notes :
SELECT MAX(Note) AS Note_Maximale, MIN(Note) AS Note_Minimale FROM EVALUER;
-- Pour calculer la moyenne de chaque étudiant dans chacune des matières :
SELECT ETUDIANT.id, ETUDIANT.Nom, ETUDIANT.Prenom, MATIERE.Libellé, AVG(EVALUER.Note) AS Moyenne
FROM ETUDIANT
INNER JOIN EVALUER ON ETUDIANT.id = EVALUER.id_Etudiant
INNER JOIN MATIERE ON EVALUER.id_Matiere = MATIERE.id
GROUP BY ETUDIANT.id, ETUDIANT.Nom, ETUDIANT.Prenom, MATIERE.Libellé;
-- Pour calculer les moyennes par matière :
SELECT MATIERE.Libellé, AVG(EVALUER.Note) AS Moyenne
FROM MATIERE
INNER JOIN EVALUER ON MATIERE.id = EVALUER.id_Matiere
GROUP BY MATIERE.Libellé;
-- Pour trouver la moyenne générale de chaque étudiant :
SELECT ETUDIANT.id, ETUDIANT.Nom, ETUDIANT.Prenom, AVG(EVALUER.Note) AS Moyenne_Générale
FROM ETUDIANT
INNER JOIN EVALUER ON ETUDIANT.id = EVALUER.id_Etudiant
GROUP BY ETUDIANT.id, ETUDIANT.Nom, ETUDIANT.Prenom;

