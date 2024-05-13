USE cp;

ALTER TABLE client ENGINE=InnoDB;

-- exemple de déclencheur qui se déclenche après chaque insertion dans la table commande 
-- et calcule le total de la commande en mettant à jour la colonne total de la table commande :

CREATE TRIGGER calculer_total_commande AFTER INSERT ON commande
FOR EACH ROW
BEGIN
    DECLARE total_commande DOUBLE;
    DECLARE id_commande_inserted INT;

    -- Récupérer l'ID de la commande insérée
    SET id_commande_inserted = NEW.id;

    -- Calculer le total de la commande
    SELECT SUM(prix * quantite) INTO total_commande
    FROM lignedecommande
    WHERE id_commande = id_commande_inserted;

    -- Mettre à jour la colonne total de la commande
    UPDATE commande SET total = total_commande WHERE id = id_commande_inserted;
END;

-- Pour vérifier si le déclencheur fonctionne correctement, vous pouvez effectuer
--  une insertion dans la table commande et vérifier si la colonne total est mise à jour automatiquement.

-- Suppression du déclencheur existant
DROP TRIGGER IF EXISTS update_total_on_commande;

-- Création de la procédure stockée pour insérer une nouvelle commande
DELIMITER //
CREATE PROCEDURE InsertNewCommande(
    IN p_id_client INT,
    IN p_date_commande DATETIME,
    IN p_remise INT
)
BEGIN
    -- Insérer une nouvelle commande
    INSERT INTO commande (id_client, date_commande, remise, total)
    VALUES (p_id_client, p_date_commande, p_remise, 0); -- La colonne total est initialisée à 0

    -- Récupérer l'ID de la dernière commande insérée
    DECLARE last_commande_id INT;
    SET last_commande_id = LAST_INSERT_ID();

    -- Mettre à jour la colonne total de la commande insérée
    UPDATE commande
    SET total = (SELECT SUM(quantite * prix) FROM lignedecommande WHERE id_commande = last_commande_id)
    WHERE id = last_commande_id;
END//
DELIMITER ;

-- Appel de la procédure stockée pour insérer une nouvelle commande
CALL InsertNewCommande(1, '2024-05-13', 10);

