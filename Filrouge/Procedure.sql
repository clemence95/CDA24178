USE VillageGreen;
-- Sélection des commandes non soldées (en cours de livraison) :
DELIMITER //

CREATE PROCEDURE SelectCommandesEnCoursDeLivraison()
BEGIN
    SELECT * FROM Commande WHERE Statut = 'En cours de livraison';
END//

DELIMITER ;

CALL SelectCommandesEnCoursDeLivraison();

DELIMITER //

CREATE PROCEDURE SelectCommandesEnCours()
BEGIN
    SELECT * FROM Commande WHERE Statut = 'En cours';
END//

DELIMITER ;

CALL SelectCommandesEnCours();