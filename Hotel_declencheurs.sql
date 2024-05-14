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

CREATE TRIGGER insert_reservation2 -- CREATE TRIGGER insert_reservation2 : C'est la déclaration pour créer un nouveau déclencheur nommé insert_reservation2.
BEFORE INSERT ON reservation -- BEFORE INSERT ON reservation : Indique que le déclencheur doit être déclenché avant l'insertion d'une nouvelle ligne dans la table reservation.
FOR EACH ROW -- FOR EACH ROW : Spécifie que le déclencheur s'exécute pour chaque ligne qui est sur le point d'être insérée dans la table.
BEGIN -- BEGIN : Marque le début du bloc de code exécuté par le déclencheur.
    DECLARE num_reservations INT; -- DECLARE num_reservations INT; : Déclare une variable num_reservations de type entier qui sera utilisée pour stocker le nombre de réservations du client concerné.

    
    -- Obtenir le nombre de réservations actuelles pour le client concerné
    SELECT COUNT(*) INTO num_reservations
    FROM reservation -- Cette requête SQL compte le nombre de réservations
    -- pour le client de la nouvelle réservation (NEW.res_cli_id) et stocke le résultat dans la variable num_reservations.
    WHERE res_cli_id = NEW.res_cli_id;
    
    -- Vérifier si le client a déjà 3 réservations
    IF num_reservations >= 3 THEN -- Vérifie si le nombre de réservations du client est supérieur ou égal à 3.
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Impossible d\'ajouter une réservation, le client a déjà atteint le nombre maximal de réservations.';
    END IF;   -- Si le client a déjà 3 réservations ou plus, cette instruction génère une erreur avec le message spécifié, ce qui annule l'insertion de la nouvelle réservation.
END; -- : Marque la fin du bloc de code du déclencheur.
//

DELIMITER ; 

CREATE TRIGGER insert_chambre BEFORE INSERT ON chambre -- Crée un nouveau déclencheur qui sera declenché avant chaque insertion dans la table chambre
FOR EACH ROW -- Cela s'applique à chaque ligne qui insérée
BEGIN -- début du bloc de code exécuté par le déclencheur.
    DECLARE total_capacity INT; -- Cette variable sera utilisée pour stocker le total des capacités des chambres pour un hôtel donné. Type entier
    
    -- Calculer le total des capacités des chambres pour l'hôtel concerné
    SELECT SUM(cha_capacite) INTO total_capacity
    FROM chambre
    WHERE cha_hot_id = NEW.cha_hot_id;
    
    -- Vérifier si le total des capacités dépasse 50
    IF (total_capacity IS NULL OR total_capacity + NEW.cha_capacite > 50) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La capacité totale de l\'hôtel dépasse 50.';
    END IF;
END;

INSERT INTO chambre (cha_hot_id, cha_numero, cha_capacite, cha_type) VALUES 
(1, 101, 3, 1); -- Cette insertion tente d'ajouter une chambre avec une capacité de 3 pour l'hôtel avec l'ID 1.





