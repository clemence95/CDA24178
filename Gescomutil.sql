-- Créer l'utilisateur util1 avec tous les privilèges
CREATE USER 'util1'@'localhost' IDENTIFIED BY 'mot_de_passe';
GRANT ALL PRIVILEGES ON Gescom.* TO 'util1'@'localhost';

-- Créer l'utilisateur util2 avec le privilège de sélection seulement
CREATE USER 'util2'@'localhost' IDENTIFIED BY 'mot_de_passe';
GRANT SELECT ON Gescom.* TO 'util2'@'localhost';

-- Créer l'utilisateur util3 sans aucun privilège, sauf pour la table Customers
CREATE USER 'util3'@'localhost' IDENTIFIED BY 'mot_de_passe';
GRANT SELECT ON Gescom.Customers TO 'util3'@'localhost';