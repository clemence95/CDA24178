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
-- Pour calculer la moyenne générale de la promotion :
SELECT AVG(Moyenne_Générale) AS Moyenne_Générale_Promotion FROM (
    SELECT AVG(EVALUER.Note) AS Moyenne_Générale
    FROM ETUDIANT
    INNER JOIN EVALUER ON ETUDIANT.id = EVALUER.id_Etudiant
    GROUP BY ETUDIANT.id
) AS Moyennes_Etudiants;
-- Pour trouver les étudiants qui ont une moyenne générale supérieure ou égale à la moyenne générale de la promotion :
SELECT ETUDIANT.id, ETUDIANT.Nom, ETUDIANT.Prenom, AVG(EVALUER.Note) AS Moyenne_Générale
FROM ETUDIANT
INNER JOIN EVALUER ON ETUDIANT.id = EVALUER.id_Etudiant
GROUP BY ETUDIANT.id, ETUDIANT.Nom, ETUDIANT.Prenom
HAVING AVG(EVALUER.Note) >= (SELECT AVG(Moyenne_Générale) FROM (
    SELECT AVG(EVALUER.Note) AS Moyenne_Générale
    FROM ETUDIANT
    INNER JOIN EVALUER ON ETUDIANT.id = EVALUER.id_Etudiant
    GROUP BY ETUDIANT.id
) AS Moyennes_Etudiants);
-- Pour obtenir la composition de l'équipe Festina (Numéro, nom et pays des coureurs) :
SELECT COUREUR.id, COUREUR.NomCoureur, PAYS.NomPays
FROM COUREUR
JOIN PAYS ON COUREUR.id_Pays = PAYS.id
JOIN EQUIPE ON COUREUR.id_Equipe = EQUIPE.id
WHERE EQUIPE.NomEquipe = 'Festina';
-- Pour trouver le nombre total de kilomètres du Tour de France 97 :
SELECT SUM(NbKm) AS Total_Kilomètres
FROM ETAPE;
-- Pour obtenir le nombre total de kilomètres des étapes de type "Haute Montagne" :
SELECT SUM(NbKm) AS Total_Kilomètres_Haute_Montagne
FROM ETAPE
JOIN TYPE_ETAPE ON ETAPE.id_Type_Etape = TYPE_ETAPE.id
WHERE TYPE_ETAPE.LibelléType = 'Haute Montagne';
-- Pour obtenir le classement général des coureurs (nom, code équipe, code pays et temps des coureurs) :
SELECT COUREUR.NomCoureur, EQUIPE.NomEquipe, PAYS.NomPays, PARTICIPER.TempsRéalisé
FROM PARTICIPER
JOIN COUREUR ON PARTICIPER.id_Coureur = COUREUR.id
JOIN EQUIPE ON COUREUR.id_Equipe = EQUIPE.id
JOIN PAYS ON COUREUR.id_Pays = PAYS.id
ORDER BY PARTICIPER.TempsRéalisé ASC;

