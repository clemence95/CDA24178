USE hotel;
DELIMITER |
CREATE TRIGGER insert_station AFTER INSERT ON station
    FOR EACH ROW 
    BEGIN
    DECLARE altitude INT;
    SET altitude = NEW.sta_altitude;
        IF altitude<1000 
            THEN SIGNAL SQLSTATE '40000' SET MESSAGE_TEXT = 'Un problème est survenu. Règle de gestion altitude !';
        END IF;
    END;
| 
DELIMITER ;

insert into station (sta_nom, sta_altitude) values ('station du bas', 666);

-- Supprimer la possibilité de modification des réservations
DELIMITER //
CREATE TRIGGER modif_reservation
BEFORE UPDATE ON reservation
FOR EACH ROW
BEGIN
    -- Annuler la mise à jour en générant une erreur
    SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Modification des réservations interdite';
END//
DELIMITER ;
-- Tentative de mise à jour d'une réservation existante
UPDATE reservation
SET res_date_fin = '2024-05-21'
WHERE res_id = 1;

USE hotel;

DELIMITER //

CREATE TRIGGER insert_reservation BEFORE INSERT ON reservation
FOR EACH ROW
BEGIN
    DECLARE num_reservations INT;
    DECLARE max_reservations INT;
    
    -- Obtention du nombre de réservations actuelles pour l'hôtel concerné
    SELECT COUNT(*) INTO num_reservations FROM reservation WHERE res_cha_id = NEW.res_cha_id;
    
    -- Obtention du nombre maximal de réservations autorisées (dans ce cas, 10)
    SELECT 10 INTO max_reservations;
    
    -- Vérification si le nombre de réservations actuelles dépasse le maximum autorisé
    IF num_reservations >= max_reservations THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Impossible d''ajouter une réservation, l''hôtel a déjà atteint le nombre maximal de réservations.';
    END IF;
END//

DELIMITER ;

INSERT INTO reservation (res_cha_id, res_cli_id, res_date, res_date_debut, res_date_fin, res_prix, res_arrhes) 
VALUES (2, 1, '2024-05-15', '2024-06-01', '2024-06-15', 2000, 500);

DELIMITER //

CREATE TRIGGER insert_reservation2
BEFORE INSERT ON reservation
FOR EACH ROW
BEGIN
    DECLARE num_reservations INT;
    
    -- Obtenir le nombre de réservations actuelles pour le client concerné
    SELECT COUNT(*) INTO num_reservations
    FROM reservation
    WHERE res_cli_id = NEW.res_cli_id;
    
    -- Vérifier si le client a déjà 3 réservations
    IF num_reservations >= 3 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Impossible d\'ajouter une réservation, le client a déjà atteint le nombre maximal de réservations.';
    END IF;
END;
//

DELIMITER ;
