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
